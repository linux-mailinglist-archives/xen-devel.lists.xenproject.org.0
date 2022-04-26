Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D0050F519
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 10:41:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313539.531112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njGlA-0001Uv-Lw; Tue, 26 Apr 2022 08:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313539.531112; Tue, 26 Apr 2022 08:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njGlA-0001Si-Hd; Tue, 26 Apr 2022 08:41:24 +0000
Received: by outflank-mailman (input) for mailman id 313539;
 Tue, 26 Apr 2022 08:41:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c92l=VE=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1njGl6-0001SW-6h
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 08:41:22 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a34bf32c-c53c-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 10:41:17 +0200 (CEST)
Received: from zn.tnic (p5de8eeb4.dip0.t-ipconnect.de [93.232.238.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 947631EC04A6;
 Tue, 26 Apr 2022 10:41:12 +0200 (CEST)
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
X-Inumbo-ID: a34bf32c-c53c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1650962472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=WDgzj5odytfvHWYC79oVcVHBLZLoY6i/6Y3HutpD6F4=;
	b=RNjGzXao8IjCAZdnyz+sxuWaGQkZ/vd2mBMQcXkorVlHxF8aZwOhjFv4yzyb07IC1cWtdD
	ULYpgmsRwGJlrKq9s0lT+lGWYaOvYXAN7z6VNXS1lWrwLuV/e11t2Bk/YoGWr2WZKy1VVj
	Dqp/f/bCRwbcGI72KlCyWMGc2WUv3AY=
Date: Tue, 26 Apr 2022 10:41:09 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: Oleksandr <olekstysh@gmail.com>, Christoph Hellwig <hch@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Julien Grall <julien@xen.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH V1 3/6] xen/virtio: Add option to restrict memory access
 under Xen
Message-ID: <YmewJaxWS1KGVkTf@zn.tnic>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
 <1650646263-22047-4-git-send-email-olekstysh@gmail.com>
 <YmQsFb36UEH9BUnN@infradead.org>
 <6c5042fe-dafc-eb4f-c1fa-03b0faf252de@gmail.com>
 <abc5d23d-3d38-d198-4646-e886df2e83d4@suse.com>
 <YmZUpua3hkCPdbfx@infradead.org>
 <147f68f6-7d67-1884-bd14-5040639b3396@suse.com>
 <67c7460a-3001-35a6-8e5b-f367270b257a@gmail.com>
 <YmcR5bfaYh1z7VUq@zn.tnic>
 <7d89848a-3a1c-415d-957a-564ffdd3712d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7d89848a-3a1c-415d-957a-564ffdd3712d@suse.com>

On Tue, Apr 26, 2022 at 07:16:16AM +0200, Juergen Gross wrote:
> Christoph suggested (rather firmly) this would be the way to go.

Yeah, I saw it but I don't think it is the right way to go.

What happens the next time a guest needs to query the platform
underneath? Misuse these interfaces again?

Because people will see the Xen use and say, hey, look, I will use this
for my funky HV too.

Even worse: what happens if Xen decides to implement SEV/TDX? Then
you're in for a world of fun.

Now, if we want to *extend* the interfaces to have something as generic
as, say, platform_has() and that should be the way for generic kernel
code running in the guest to query the platform capabilities, then sure,
by all means.

> This is needed on guest side at a rather hypervisor independent place.
> 
> So a capability of some sort seems appropriate.
> 
> Another suggestion of mine was to have a callback (or flag) in
> struct x86_hyper_runtime for that purpose.

This becomes an issue if the HV is not x86 - then you need a different
method of querying it, which then underneath will call the arch-specific
interface.

I don't know how much of querying guests need to do and how they've been
doing that so far. Depending on the requirements, we probably should
think about a clean design from the get-go instead of homegrown things.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

