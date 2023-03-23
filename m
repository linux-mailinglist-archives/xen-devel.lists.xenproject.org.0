Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D97756C68AD
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 13:44:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513847.795473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfKI2-0002M9-Ku; Thu, 23 Mar 2023 12:43:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513847.795473; Thu, 23 Mar 2023 12:43:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfKI2-0002K4-IB; Thu, 23 Mar 2023 12:43:34 +0000
Received: by outflank-mailman (input) for mailman id 513847;
 Thu, 23 Mar 2023 12:43:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kUbI=7P=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1pfKI0-0002Jy-J7
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 12:43:33 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50bfbe92-c978-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 13:43:30 +0100 (CET)
Received: from zn.tnic (p5de8e687.dip0.t-ipconnect.de [93.232.230.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1D8ED1EC0666;
 Thu, 23 Mar 2023 13:43:30 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 50bfbe92-c978-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1679575410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=K9/n1rpAwWFTZEJX1IfhukaW5XPdU+nWAbh6D9porq0=;
	b=nrqNQ33NtT7l7CzSbB7aCBMDOTqEvqWLVPXSD5X14u8yn87ok8XDAIJmfZJMhFz6bAxt9q
	ERkh/4ZJF5si3nVU4Cmv3JD656voKZjP4WzeBqHK+1qfv6tsn7OxIf3vVrSmUS3Iokwe7c
	HbajBiKvPygMagiGPuQ+3U52OEcMRO8=
Date: Thu, 23 Mar 2023 13:43:24 +0100
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 05/12] x86/xen: set MTRR state when running as Xen PV
 initial domain
Message-ID: <20230323124324.GHZBxJbOW1fvHOgiQ1@fat_crate.local>
References: <20230306163425.8324-1-jgross@suse.com>
 <20230306163425.8324-6-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230306163425.8324-6-jgross@suse.com>

On Mon, Mar 06, 2023 at 05:34:18PM +0100, Juergen Gross wrote:
> +	for (reg = 0; reg < MTRR_MAX_VAR_RANGES; reg++) {
> +		op.u.read_memtype.reg = reg;
> +		if (HYPERVISOR_platform_op(&op))
> +			break;
> +
> +		/*
> +		 * Only called in dom0, which has all RAM PFNs mapped at
> +		 * RAM MFNs, and all PCI space etc. is identity mapped.
> +		 * This means we can treat MFN == PFN regarding MTTR settings.
								^^^^

"MTRR"

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

