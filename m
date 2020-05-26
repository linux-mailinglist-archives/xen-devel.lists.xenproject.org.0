Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5481E25CD
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 17:42:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdbir-00070U-9Z; Tue, 26 May 2020 15:42:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N6lx=7I=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jdbip-00070P-Bs
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 15:42:31 +0000
X-Inumbo-ID: 7f183838-9f67-11ea-a664-12813bfff9fa
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f183838-9f67-11ea-a664-12813bfff9fa;
 Tue, 26 May 2020 15:42:25 +0000 (UTC)
Received: from nodbug.lucina.net (78-141-76-187.dynamic.orange.sk
 [78.141.76.187])
 by smtp.lucina.net (Postfix) with ESMTPSA id C74C1122804;
 Tue, 26 May 2020 17:42:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1590507744;
 bh=6B1mwmaG5KlpcOX1ZvW8LOn+uZ4wZogEf3CjfrNwJ3M=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=i7drQIPpJjc9AbVLB4iBbP2qe0AvwzA2hleRl0LUhof8taNt21yw+TfJljfrxfhr4
 R0NzttbfyipltZIkPQCGSHiGq+zSGCsSHEcJ9rAQq4YAZIt5ZyLzJi0n0GdtCUlp+n
 AbAAx5R+BhiPqzpfe0QgX5epJx2CKatbmpnnxCqFRaLeIusGZzWCEFPUhtH/k56EVW
 LKAJvH9CzOF5tkCCDuV488q3Rjd2mNfs2GU2g9QUz7Px5QNLDBTsfyI4f8C/u5ccS9
 eHVJIE7rcrQncNRrHdwCIHxI/pZBNoOFTRaIyA0EBBykaP50ozFfvVyB0CbX3OCsc7
 cTA4JHcJF61Cg==
Received: by nodbug.lucina.net (Postfix, from userid 1000)
 id 7DC03268436E; Tue, 26 May 2020 17:42:24 +0200 (CEST)
Date: Tue, 26 May 2020 17:42:24 +0200
From: Martin Lucina <martin@lucina.net>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, anil@recoil.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 mirageos-devel@lists.xenproject.org, dave@recoil.org,
 xen-devel@lists.xenproject.org
Subject: Re: Xen PVH domU start-of-day VCPU state
Message-ID: <20200526154224.GC25283@nodbug.lucina.net>
Mail-Followup-To: Martin Lucina <martin@lucina.net>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, anil@recoil.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 mirageos-devel@lists.xenproject.org, dave@recoil.org,
 xen-devel@lists.xenproject.org
References: <20200525160401.GA3091@nodbug.lucina.net>
 <a17fef73-382c-50b3-1e6b-5904fc3bf60f@suse.com>
 <6a22e477-c9e7-f0d7-6cb1-615137a778be@citrix.com>
 <20200526085221.GB5942@nodbug.lucina.net>
 <20200526093421.GA38408@Air-de-Roger>
 <20200526100337.GB38408@Air-de-Roger>
 <20200526101203.GE5942@nodbug.lucina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200526101203.GE5942@nodbug.lucina.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Oh! I think I've found a solution, even though I don't entirely understand the
problem/root cause:

On Tuesday, 26.05.2020 at 12:12, Martin Lucina wrote:
> > On Tue, May 26, 2020 at 11:34:21AM +0200, Roger Pau Monné wrote:
> > Forgot to ask, but can you also add the output of readelf -lW
> > <kernel>?
> 
>     Elf file type is EXEC (Executable file)
>     Entry point 0x1001e0
>     There are 7 program headers, starting at offset 64
> 
>     Program Headers:
>       Type           Offset   VirtAddr           PhysAddr           FileSiz  MemSiz   Flg Align
>       INTERP         0x001000 0x0000000000100000 0x0000000000100000 0x000018 0x000018 R   0x8
>           [Requesting program interpreter: /nonexistent/solo5/]
>       LOAD           0x001000 0x0000000000100000 0x0000000000100000 0x00626c 0x00626c R E 0x1000
>       LOAD           0x008000 0x0000000000107000 0x0000000000107000 0x007120 0x00ed48 RW  0x1000
>       NOTE           0x0080ac 0x00000000001070ac 0x00000000001070ac 0x000018 0x000018 R   0x4
>       NOTE           0x00f120 0x00000000001070c4 0x00000000001070c4 0x000014 0x000000 R   0x4
                                                                               ^^^^^^^^

I should have picked up on the above, but thought it wasn't relevant.

>       NOTE           0x008088 0x0000000000107088 0x0000000000107088 0x000024 0x000024 R   0x4
>       NOTE           0x008000 0x0000000000107000 0x0000000000107000 0x000088 0x000088 R   0x4
> 
>      Section to Segment mapping:
>       Segment Sections...
>        00     .interp
>        01     .interp .text .rodata .eh_frame
>        02     .note.solo5.manifest .note.solo5.abi .note.solo5.not-openbsd .data .bss

And also the missing .note.solo5.xen above.

>        03     .note.solo5.not-openbsd
>        04     .note.solo5.xen
>        05     .note.solo5.abi
>        06     .note.solo5.manifest

Turns out that the .note.solo5.xen section as defined in boot.S was not
marked allocatable, and that was doing <something> that was confusing our
linker script[1] (?).

If I make this simple change:

--- a/bindings/xen/boot.S
+++ b/bindings/xen/boot.S
@@ -32,7 +32,7 @@
 #define ENTRY(x) .text; .globl x; .type x,%function; x:
 #define END(x)   .size x, . - x

-.section .note.solo5.xen
+.section .note.solo5.xen, "a", @note

        .align  4
        .long   4

then I get the expected output from readelf -lW, and I can get as far as
the C _start() with no issues!

FWIW, here's the diff of readelf -lW before/after:

--- before	2020-05-26 17:36:46.117885855 +0200
+++ after	2020-05-26 17:38:07.090508322 +0200
@@ -8,9 +8,9 @@
   INTERP         0x001000 0x0000000000100000 0x0000000000100000 0x000018 0x000018 R   0x8
       [Requesting program interpreter: /nonexistent/solo5/]
   LOAD           0x001000 0x0000000000100000 0x0000000000100000 0x00615c 0x00615c R E 0x1000
-  LOAD           0x008000 0x0000000000107000 0x0000000000107000 0x007120 0x00ed28 RW  0x1000
+  LOAD           0x008000 0x0000000000107000 0x0000000000107000 0x006120 0x00dd28 RW  0x1000
   NOTE           0x0080ac 0x00000000001070ac 0x00000000001070ac 0x000018 0x000018 R   0x4
-  NOTE           0x00f120 0x00000000001070c4 0x00000000001070c4 0x000014 0x000000 R   0x4
+  NOTE           0x0080c4 0x00000000001070c4 0x00000000001070c4 0x000014 0x000014 R   0x4
   NOTE           0x008088 0x0000000000107088 0x0000000000107088 0x000024 0x000024 R   0x4
   NOTE           0x008000 0x0000000000107000 0x0000000000107000 0x000088 0x000088 R   0x4

@@ -18,7 +18,7 @@
   Segment Sections...
    00     .interp
    01     .interp .text .rodata .eh_frame
-   02     .note.solo5.manifest .note.solo5.abi .note.solo5.not-openbsd .data .bss
+   02     .note.solo5.manifest .note.solo5.abi .note.solo5.not-openbsd .note.solo5.xen .data .bss
    03     .note.solo5.not-openbsd
    04     .note.solo5.xen
    05     .note.solo5.abi

-mato

[1] https://github.com/mato/solo5/blob/xen/bindings/xen/solo5_xen.lds

