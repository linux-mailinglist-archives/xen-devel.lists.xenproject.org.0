Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4846812053
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 22:03:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654240.1020928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDWMg-0002JU-F6; Wed, 13 Dec 2023 21:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654240.1020928; Wed, 13 Dec 2023 21:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDWMg-0002HG-C1; Wed, 13 Dec 2023 21:01:58 +0000
Received: by outflank-mailman (input) for mailman id 654240;
 Wed, 13 Dec 2023 21:01:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ONXu=HY=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1rDWMe-0002H5-TF
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 21:01:56 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6f27f92-99fa-11ee-98e9-6d05b1d4d9a1;
 Wed, 13 Dec 2023 22:01:54 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 3BDL1Kax001757
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 13 Dec 2023 16:01:26 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 3BDL1Kk7001756;
 Wed, 13 Dec 2023 13:01:20 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: d6f27f92-99fa-11ee-98e9-6d05b1d4d9a1
Date: Wed, 13 Dec 2023 13:01:20 -0800
From: Elliott Mitchell <ehem+freebsd@m5p.com>
To: Chuck Zmudzinski <brchuckz@netscape.net>,
        Anthony Perard <anthony.perard@citrix.com>
Cc: Mario Marietto <marietto2008@gmail.com>, Julien Grall <julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        xen-devel <xen-devel@lists.xenproject.org>,
        xen-users-request@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: xc_dom_guest_type: image not capable of booting inside a HV M
 container: Invalid kernel
Message-ID: <ZXoboEVx1jzIgrvJ@mattapan.m5p.com>
References: <CA+1FSiii2etikw9LKdJ5Ebn+z-3-e5UXh3cJjBgYGJYtq3q=Ww@mail.gmail.com>
 <300b7e2b-068a-4cac-a617-ae41caa6d3b9@netscape.net>
 <CA+1FSiiuWz_91Wg3Az440nFKaLY_raoUy=3nGj4Zca8viKAT=Q@mail.gmail.com>
 <0bf311bb-435a-4c5d-a36c-8cfe95f92f98@netscape.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0bf311bb-435a-4c5d-a36c-8cfe95f92f98@netscape.net>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Mon, Dec 11, 2023 at 01:41:21PM -0500, Chuck Zmudzinski wrote:
> On 12/11/2023 12:59 PM, Mario Marietto wrote:
> > root@marietto:/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel # file /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel
> > 
> > ELF 32-bit LSB executable,ARM, EABI5 version 1 (FreeBSD), dynamically linked, interpreter /red/herring, BuildID[sha1]=5e6982c9cb67d9c94571b76419142a8c495388d0, for FreeBSD 13.2, not stripped
> > 
> > root@marietto:/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel # file /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel.bin
> > 
> > kernel.bin: data 
> 
> This needs to be :
> 
> kernel.bin: Linux kernel ARM boot executable zImage (little-endian)
> 
> > 
> > It does not boot from the kernel.bin file.
> 
> I suggest not trying to direct boot a kernel in Xen on arm unless the file command reports the kernel image is a Linux kernel ARM boot executable zImage (little endian).
> 
> Did you try applying Julien's patch (link is in my earlier message) to add zImage support to FreeBSD? Maybe after applying the patch the kernel.bin file will be in the correct zImage format.
> 
> The patch I linked in the earlier 

Appears FreeBSD-CURRENT removed the last step converting the kernel file
to kernel.bin.  The patch can be readily rebased, but without kernel.bin
that doesn't do too much.  (hmm, see if that can be tracked down...)


A bigger issue is this approach is a maintenance nightmare.  Updating
the kernel requires action from outside the VM.

As such, Anthony Perard would there be any hope for Tianocore/EDK2
gaining support for ARMv6/v7?  The delta should be pretty small.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



