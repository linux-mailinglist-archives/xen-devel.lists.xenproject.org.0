Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 321C4434008
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 22:56:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213494.371716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcw94-00088D-JC; Tue, 19 Oct 2021 20:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213494.371716; Tue, 19 Oct 2021 20:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcw94-00085e-EI; Tue, 19 Oct 2021 20:55:38 +0000
Received: by outflank-mailman (input) for mailman id 213494;
 Tue, 19 Oct 2021 20:55:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1bC=PH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mcw93-00085Y-Ag
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 20:55:37 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e849ab4e-311e-11ec-8326-12813bfff9fa;
 Tue, 19 Oct 2021 20:55:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A36B6113B;
 Tue, 19 Oct 2021 20:55:34 +0000 (UTC)
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
X-Inumbo-ID: e849ab4e-311e-11ec-8326-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634676935;
	bh=1R4/QUryqB7rGI56XkGGZIQs5wm16uxW64pnaL6Ns6U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WjVMZAI6tmRO8FzeMYyATQEBA3jsx9dAIuVQSJisJVrEufWEzM/GddMwHjipNf4h6
	 CYxWH/8rbvmmgRaxet6tjfEqWctG/Ize2PvI2F46kjatE/1Fa2ppDLTvtjvykSyfmn
	 d76i7n/rTZHfvgFn0p2A2s+bZ3MA8kVTJ0s11VnqWVXqV5pFoY57079RmLDfgtbRTd
	 W75dcVzk4/pNwxJbPKIku/Aw2czh67s/aEotBgG3TPciUeIEbUTbWEVBGe02rRW32P
	 89BszSFK3Gg0NgzTspYNH2hcgbNlU1E4R6fM13Qovw4jL8lTmmIOCu2QgdKwV5jAJe
	 tbW8u3tBUjjqA==
Date: Tue, 19 Oct 2021 13:55:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Sai Kiran Kumar Reddy Y <ysaikiran1997@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>, 
    xen-devel@lists.xenproject.org, kannan@cimware.in
Subject: Re: Xen Booting Problem on ARM Machine
In-Reply-To: <7f6a0b1b-c325-95c4-a9d2-2bc28ae79268@xen.org>
Message-ID: <alpine.DEB.2.21.2110191351170.21467@sstabellini-ThinkPad-T480s>
References: <33C29853-D896-4E4E-91D3-4D2FA89A9B91@hxcore.ol> <eb5fd47b-6bc9-2eec-7f46-9ab9a42c9f1f@xen.org> <CAEsO4uzsCnsTtTmYHAT4NN6=girCY2NHHdAHbH6GG33D7jwe_A@mail.gmail.com> <alpine.DEB.2.21.2109131437030.10523@sstabellini-ThinkPad-T480s>
 <CAEsO4uwpiDO2QoqLRTOxpsYM9YSPAsbX0P=gagdEy21pk1VsPQ@mail.gmail.com> <alpine.DEB.2.21.2109141825330.21985@sstabellini-ThinkPad-T480s> <CAEsO4uyjNs97Cx8n2owDk4kKTVCycji377pm7aXHcPWzeszUTw@mail.gmail.com> <alpine.DEB.2.21.2109301942370.3209@sstabellini-ThinkPad-T480s>
 <CAEsO4ux_AqXBeCtbwnPAdnBnVYHTur_2EfcZBTuN4QKCq4ko8Q@mail.gmail.com> <alpine.DEB.2.21.2110131711280.9408@sstabellini-ThinkPad-T480s> <CAEsO4uxo_A4pEwP6dHK8kvYtKcbSr-ewqX1v-KLsEkyHNLFyUA@mail.gmail.com> <alpine.DEB.2.21.2110141536090.9408@sstabellini-ThinkPad-T480s>
 <CAEsO4uzwNHiLEZVEy90uua9YRud=Bmj=EPhzbhyk0tsEai=UQg@mail.gmail.com> <7f6a0b1b-c325-95c4-a9d2-2bc28ae79268@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-59138649-1634676935=:21467"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-59138649-1634676935=:21467
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 19 Oct 2021, Julien Grall wrote:
> On 19/10/2021 13:04, Sai Kiran Kumar Reddy Y wrote:
> > Hi,
> > 
> > Thanks for your inputs. As you have mentioned, I tried to boot Xen directly
> > from EFI, thereby skipping GRUB. I made sure that kernel, xen.cfg and
> > ramdisk are on the first FAT partition. I still get "All 128 bootinfo
> > membanks exhausted error". The following link has my grub.cfg config. file
> > and also the snapshot of the error.
> > 
> > Link:
> > https://drive.google.com/drive/folders/1o7WT5oB7UsaZBeY5m4mWSidT5NalzvvJ?usp=sharing
> > <https://drive.google.com/drive/folders/1o7WT5oB7UsaZBeY5m4mWSidT5NalzvvJ?usp=sharing>
> > 
> > I feel that even with EFI bootloader, there's some issue with bootinfo mem
> > banks and it maynot be a bug in GRUB. Let me know your thoughts on this.
> 
> As I wrote a few weeks ago. Both issues ("mem banks exhausted" and "Cannot
> exit boot services") are meant to be non-fatal. So you should be able to
> continue booting Xen afterwards.
> 
> The fact you don't see any log seems to suggest that you didn't enable
> properly earlyprintk. Would you be able to post your xen/.config?

Just to add to what Julien wrote, the "Cannot exit boot services" error
is printed from here:

https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/efi/boot.c#L1086

as you can see, the error is printed but the function should continue onward.


To enable earlyprintk, you need to rebuild Xen. Assuming you build on
x86:

# cd xen.git/xen
# export CROSS_COMPILE=/path/to/cross-compiler # you can skip this if you build on ARM
# export XEN_TARGET_ARCH=arm64
# make menuconfig
      --> Debugging Options --> Developer Checks
      --> Debugging Options --> Early printk

Then you select driver and base address of the UART
--8323329-59138649-1634676935=:21467--

