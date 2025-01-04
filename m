Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC73A011F0
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 03:34:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864947.1276212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtzZ-0006B8-Ie; Sat, 04 Jan 2025 02:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864947.1276212; Sat, 04 Jan 2025 02:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtzZ-00068h-F4; Sat, 04 Jan 2025 02:34:21 +0000
Received: by outflank-mailman (input) for mailman id 864947;
 Sat, 04 Jan 2025 02:34:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTtzY-00068b-C9
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 02:34:20 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65906ec3-ca44-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 03:34:18 +0100 (CET)
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
X-Inumbo-ID: 65906ec3-ca44-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735958057; x=1736217257;
	bh=lHkOmA0yYDIjlgV+mQbw5gE30el3xGN7L6flZv0Zdd0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=l6NkwFXXrLZ8YCrTLg8QRC6fHibWtaO/ek4NAj9yQguRDD0FuSlhsKR6YORV8oZLi
	 UJYwrTyaazCV1a97GvqzqVmFSB9LEQ+ElsSxmsKjmabs1NmOkGISfwIcnyC5iLFVEc
	 uXTQIcH6EiY/TSULpzCgEowXLvmSvcK2OC+WVg//7FF3cTNJL4Nt0Y5QJFD5YqMNdd
	 WJ0cfX+Yzggy+OkPfBmmFmhBW8L3P5Ir2ttPoYnoEw2NexNpVpx3EHb+1keOF0v9Q5
	 P2AGEINqkE/ysizKLGoD/CtnEBkZbNIG9ADnDjxzDARxsGz4pBm5mpEP15sLVhFs3g
	 NhceLGtxIpHSQ==
Date: Sat, 04 Jan 2025 02:34:15 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 08/35] x86/domain: introduce domain_has_vuart()
Message-ID: <cvClvfXy_PbmJgxV0HBPZmRmUmwX2tt_D_kUN9cLEMAMZvSEvEPZ0pJb8tSvwaDzA-0PRkcW0S_kcKFKVJ5-gHvJVzX58hP3UVnZIe6ODfQ=@proton.me>
In-Reply-To: <904a209f-a917-4767-baf4-333b1cf8c084@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-8-e9aa923127eb@ford.com> <904a209f-a917-4767-baf4-333b1cf8c084@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 8f5da005741f0c22ed523d62336b8fb6c3d14fbf
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Tuesday, December 10th, 2024 at 5:26 AM, Jan Beulich <jbeulich@suse.com>=
 wrote:

>
>
> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>
> > --- a/xen/arch/x86/include/asm/domain.h
> > +++ b/xen/arch/x86/include/asm/domain.h
> > @@ -506,6 +506,9 @@ struct arch_domain
> > #define has_pirq(d) (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
> > #define has_vpci(d) (!!((d)->arch.emulation_flags & X86_EMU_VPCI))
> >
> > +/* NB: same symbol as in Arm port */
> > +#define domain_has_vuart(d) false
>
>
> This being the 3rd effectively identical patch, perhaps instead we want
> to default domain_has_vuart() to false unless an arch provides its own
> definition? Much like we do for a few other such items?

Ideally, domain_has_vuart() should depend on build flags and d->arch.emulat=
ion_flags
only. I have reworked the code, so that domain_has_vuart() is defined for a=
ll
architectures uniformly.
To do that, I plumbed d->arch.emulation_flags to all arch domain structures
and made arch-independent emulation flags declarations in v3.

>
> Jan



