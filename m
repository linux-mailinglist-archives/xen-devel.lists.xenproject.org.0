Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E78719D65
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 15:22:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542516.846460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4iGG-0005kN-RU; Thu, 01 Jun 2023 13:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542516.846460; Thu, 01 Jun 2023 13:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4iGG-0005hs-OS; Thu, 01 Jun 2023 13:22:40 +0000
Received: by outflank-mailman (input) for mailman id 542516;
 Thu, 01 Jun 2023 13:22:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MNKN=BV=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1q4iGE-0005hk-QO
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 13:22:38 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 609f5dae-007f-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 15:22:37 +0200 (CEST)
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 413151EC0666;
 Thu,  1 Jun 2023 15:22:37 +0200 (CEST)
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
X-Inumbo-ID: 609f5dae-007f-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1685625757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=r6aKcCYiZfeNSg7AYXaV6yxEnhgV2s078AKO0nNSYc0=;
	b=mNZJ8IV9dhL1ItC3UqzPsUojX/DtL03jmAR+HdLBczetXLr3kxBzSBsX8HGc/BFPdEinZq
	cXx2PAj2Vwbz8rz6XrkqbeQB6Hu2uRi02ZerCY4oShZ3GvuUCZBJm1Nrc78Jw6eS3MwCc1
	SoV/Z3q9GRz1umr/jaSjzwigA8IAi9Q=
Date: Thu, 1 Jun 2023 15:22:33 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-hyperv@vger.kernel.org, linux-doc@vger.kernel.org,
	mikelley@microsoft.com, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org, Jonathan Corbet <corbet@lwn.net>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v6 00/16] x86/mtrr: fix handling with PAT but without MTRR
Message-ID: <20230601132233.GCZHibmemkxYxvTjSu@fat_crate.local>
References: <20230510133024.GBZFuccC1FxIZNKL+8@fat_crate.local>
 <4c47a11c-0565-678d-3467-e01c5ec16600@suse.com>
 <20230511163208.GDZF0YiOfxQhSo4RDm@fat_crate.local>
 <0cd3899b-cf3b-61c1-14ae-60b6b49d14ab@suse.com>
 <20230530152825.GAZHYWGXAp8PHgN/w0@fat_crate.local>
 <888f860d-4307-54eb-01da-11f9adf65559@suse.com>
 <20230531083508.GAZHcGvB68PUAH7f+a@fat_crate.local>
 <efe79c9e-1e31-adb9-8f93-962249bf01bb@suse.com>
 <20230531174857.GDZHeIib57h5lT5Vh1@fat_crate.local>
 <fe33476d-0ec1-16f1-5874-8a5ff1650c3f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fe33476d-0ec1-16f1-5874-8a5ff1650c3f@suse.com>

On Thu, Jun 01, 2023 at 10:19:01AM +0200, Juergen Gross wrote:
> Patch 2 wants this diff on top:

Obviously. :-)

That fixes it, thx.

Now lemme restart testing.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

