Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7AF6F5EFA
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 21:13:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529460.823896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puHuS-00041M-Uq; Wed, 03 May 2023 19:13:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529460.823896; Wed, 03 May 2023 19:13:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puHuS-0003zj-Rn; Wed, 03 May 2023 19:13:04 +0000
Received: by outflank-mailman (input) for mailman id 529460;
 Wed, 03 May 2023 19:13:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ArVX=AY=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1puHuR-0003zd-T9
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 19:13:04 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86470aff-e9e6-11ed-b226-6b7b168915f2;
 Wed, 03 May 2023 21:13:02 +0200 (CEST)
Received: from zn.tnic (p5de8e8ea.dip0.t-ipconnect.de [93.232.232.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B681A1EC0674;
 Wed,  3 May 2023 21:13:01 +0200 (CEST)
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
X-Inumbo-ID: 86470aff-e9e6-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1683141181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=L/8fxhHQV9gUmxp73tGqFoK9bK/rX7AQ4vVPU8ZIH0I=;
	b=KcU0BTLrM12dhsRj+QLZSG0/+RmUKUiYJfiYee8JlzdiNbgVFD/LmgeqgPH66sbzspCphX
	bqQXAAnTIVKkGkWa5UKHtB5PoYSIhviQ5VRtBo8QE52D5xzSpgI5rqz3rUcKRpD07YdiXO
	lnMXaXWkqPpgYFEw1Wfi0/RkoaQnTVI=
Date: Wed, 3 May 2023 21:12:56 +0200
From: Borislav Petkov <bp@alien8.de>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: Juergen Gross <jgross@suse.com>, mikelley@microsoft.com,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org, Jonathan Corbet <corbet@lwn.net>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-hyperv@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 00/16] x86/mtrr: fix handling with PAT but without MTRR
Message-ID: <20230503191256.GGZFKyOLi12JS/HuXD@fat_crate.local>
References: <20230502120931.20719-1-jgross@suse.com>
 <26e6947c-6c56-d8c0-1baf-1ff006258679@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <26e6947c-6c56-d8c0-1baf-1ff006258679@intel.com>

On Wed, May 03, 2023 at 11:14:25AM -0700, Sohil Mehta wrote:
> A Nit -> Documentation/process/maintainer-tip.rst suggests:
> "The condensed patch description in the subject line should start with a
> uppercase letter and ..."

Yeah, good point.

But my patch massaging script does that automatically so no need to
resend.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

