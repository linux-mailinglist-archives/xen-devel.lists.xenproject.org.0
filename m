Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BFB5F0B1D
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 13:55:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414178.658324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeEcC-0003LR-3c; Fri, 30 Sep 2022 11:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414178.658324; Fri, 30 Sep 2022 11:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeEcC-0003Ie-11; Fri, 30 Sep 2022 11:55:36 +0000
Received: by outflank-mailman (input) for mailman id 414178;
 Fri, 30 Sep 2022 11:55:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3+ME=2B=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1oeEc4-0002qN-PL
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 11:55:33 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c598e04c-40b6-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 13:55:27 +0200 (CEST)
Received: from zn.tnic (p200300ea9733e70a329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9733:e70a:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8EAC51EC04DA;
 Fri, 30 Sep 2022 13:55:21 +0200 (CEST)
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
X-Inumbo-ID: c598e04c-40b6-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1664538921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=gkGioLVwMetICdzznJX5cuKeLXApeRahk/YbtSiNyOU=;
	b=aA9q7N+ze4YFGknkpfR9jdXxBnhAVBgLCb23/0jyqrX4Kv2W199DybFAnMSyRcyvZHrvvc
	iot1HFSDMFiYy9cire3ECf+VUH+/aLETNsDlelNvoo00IpP3IlN+hVYO67aaAbRmog1xm0
	x2D1aAtd3QHeyXZIVJHvAZbQ7tXox+c=
Date: Fri, 30 Sep 2022 13:55:16 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 08/10] x86/mtrr: let cache_aps_delayed_init replace
 mtrr_aps_delayed_init
Message-ID: <YzbZJEeVHkTnWIfc@zn.tnic>
References: <YzOEYsqM0UEsiFuS@zn.tnic>
 <73d8fabd-8b93-2e65-da4b-ea509818e666@suse.com>
 <24088a15-50a1-f818-8c3e-6010925bffbf@suse.com>
 <YzQmeh50ne8dyR2P@zn.tnic>
 <f8da6988-afa3-1e85-b47d-d91fc4113803@suse.com>
 <YzQui+rOGrM6otzp@zn.tnic>
 <c67d3887-498b-6e4d-857d-1cef7835421d@suse.com>
 <YzRyaLRqWd6YSgeJ@zn.tnic>
 <6d37c273-423c-fdce-c140-e5b90d723b9e@suse.com>
 <b707e459-4e21-80f5-c676-c275528c06ae@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b707e459-4e21-80f5-c676-c275528c06ae@suse.com>

On Thu, Sep 29, 2022 at 10:26:59AM +0200, Juergen Gross wrote:
> So right now I'm inclined to be better on the safe side by not adding any
> cpu hotplug hook, but to use just the same "delayed AP init" flag as today,
> just renaming it. This would leave the delayed MTRR/PAT init in place for
> resume and kexec cases, but deferring the MTRR/PAT cleanup due to this
> potential issue seems not appropriate, as the cleanup isn't changing the
> behavior here.

Ok, what's wrong with adding a special hotplug level just for that thing
and running it very early? Practically pretty much where it was in time,
in identify_secondary_cpu()?

Having a special one is warranted, as you explain, I'd say.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

