Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3098F5EBF51
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 12:11:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412472.655805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7YM-0000s6-1r; Tue, 27 Sep 2022 10:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412472.655805; Tue, 27 Sep 2022 10:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7YL-0000pi-VC; Tue, 27 Sep 2022 10:11:01 +0000
Received: by outflank-mailman (input) for mailman id 412472;
 Tue, 27 Sep 2022 10:11:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IkIR=Z6=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1od7YL-0000pc-Bv
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 10:11:01 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af5b7ad2-3e4c-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 12:11:00 +0200 (CEST)
Received: from zn.tnic (p200300ea9733e757329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9733:e757:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1D02F1EC058A;
 Tue, 27 Sep 2022 12:10:55 +0200 (CEST)
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
X-Inumbo-ID: af5b7ad2-3e4c-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1664273455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=/v55aZP64ds0qEf5pSfgJzfEvm/TVqPTvdeXcoCxATk=;
	b=qu2RiuVPERrby2mkgKedt4K0HJeWBVi/JHFjJNAc5f+jUrlxgvuAiF6WYpcagYOuPbVCMF
	yiIBLQZBX+B6DyPwmygD2M5WJVllVwddXLfF7Dz96FohO12c8NyLokHpoJ/UfW5B2+DrC+
	+4LvUK6UoVRNkuc1YZU1iTArutJgUa8=
Date: Tue, 27 Sep 2022 12:10:50 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 08/10] x86/mtrr: let cache_aps_delayed_init replace
 mtrr_aps_delayed_init
Message-ID: <YzLMKk4OK9FtjjKQ@zn.tnic>
References: <20220908084914.21703-1-jgross@suse.com>
 <20220908084914.21703-9-jgross@suse.com>
 <YzIVfj/lvzQrK15Y@zn.tnic>
 <ce8cb1d3-a7d2-7484-26eb-60d3e29fa369@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ce8cb1d3-a7d2-7484-26eb-60d3e29fa369@suse.com>

On Tue, Sep 27, 2022 at 10:57:37AM +0200, Juergen Gross wrote:
> TBH I don't see the point of having an accessor which is just setting a
> variable to "true". But if you like it better, I can keep it.

Accessors are always better, no matter how silly. :)

But, in trying to grok your next patch - you really should split those
more complex ones because they're a pain to review - I'm starting to
wonder whether we could even remove mtrr_aps_delayed_init and make the
delayed init the default.

Because, AFAICT, set_mtrr_aps_delayed_init() is called by default
by native_smp_prepare_cpus(). Which is called by hyperv and
arch/x86/xen/smp_hvm.c.

The only one that's not calling it is arch/x86/xen/smp_pv.c but that
thing doesn't support MTRRs in the first place, right?

Which means, it doesn't need delayed MTRR init anyway.

Which would then mean that this would simplify this ugly logic even more.

Or am I missing an angle?

It is possible in this nuts code.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

