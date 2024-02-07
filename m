Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C673284CA1F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 13:02:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677481.1054071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXgdP-0005yv-N7; Wed, 07 Feb 2024 12:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677481.1054071; Wed, 07 Feb 2024 12:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXgdP-0005w4-JL; Wed, 07 Feb 2024 12:02:35 +0000
Received: by outflank-mailman (input) for mailman id 677481;
 Wed, 07 Feb 2024 12:02:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CAtM=JQ=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1rXgdO-0005vm-30
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 12:02:34 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c54b2746-c5b0-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 13:02:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id CF0F9A02F5;
 Wed,  7 Feb 2024 13:02:30 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ca9USYTn4aKJ; Wed,  7 Feb 2024 13:02:30 +0100 (CET)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 9C35BA02D4;
 Wed,  7 Feb 2024 13:02:30 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1rXgdK-00000008lCO-162I; Wed, 07 Feb 2024 13:02:30 +0100
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
X-Inumbo-ID: c54b2746-c5b0-11ee-98f5-efadbce2ee36
Date: Wed, 7 Feb 2024 13:02:30 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH] Mini-OS: x86: zero out .bss segment at boot
Message-ID: <20240207120230.elgawtnwmftcdqr4@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
References: <20240207103138.26901-1-jgross@suse.com>
 <20240207103831.dtvlyjtbmgz7kmll@begin>
 <d51d842e-5609-4c98-9a31-8d6a0b237c31@suse.com>
 <20240207110021.hhlbkpx3vv3p7o4j@begin>
 <d0fc9a2a-e1e0-4cdf-8619-378a0c829bc6@suse.com>
 <20240207113456.2pxcrcazxseznyjq@begin>
 <f538b855-f2bb-4881-bd8a-eb8988579c85@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f538b855-f2bb-4881-bd8a-eb8988579c85@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Jürgen Groß, le mer. 07 févr. 2024 12:43:03 +0100, a ecrit:
> On 07.02.24 12:34, Samuel Thibault wrote:
> > Jürgen Groß, le mer. 07 févr. 2024 12:16:44 +0100, a ecrit:
> > > On 07.02.24 12:00, Samuel Thibault wrote:
> > > > Jürgen Groß, le mer. 07 févr. 2024 11:42:20 +0100, a ecrit:
> > > > > while implementing kexec in Mini-OS.
> > > > 
> > > > Oh, nice :D
> > > > 
> > > > > For that I need it for sure.
> > > > 
> > > > It needs to be done by kexec itself then.
> > > 
> > > That's another option, yes.
> > > 
> > > The question is whether we want to support to be kexec-ed from other
> > > systems, too.
> > 
> > But aren't other systems' kexec supports supposed to do the memset?
> > 
> > They really should.
> 
> I guess there is a reason why the Linux kernel does clear its .bss section
> in early boot. Maybe it is due to how the boot process works (the ELF file
> is encapsulated in vmlinuz),

Yes, the unpack prevents grub etc. from doing it.

> but following your reasoning they should have cleared their .bss while
> unpacking the ELF contents, not while booting the contents.

AIUI the decompressor itself doesn't actually know about ELF.
decompress_kernel() does call handle_relocations(), but it should indeed
clear bss itself and not leave it out to assembly indeed.

> I'm not sure they do the .bss clearing in kexec either,

AIUI they do, see kimage_load_normal_segment() which clears the page
before possibly loading some file piece into it.

Really, this is part of what "loading an ELF" means.

Samuel

