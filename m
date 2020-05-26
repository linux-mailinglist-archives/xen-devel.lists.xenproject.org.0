Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7F31E270C
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 18:30:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdcTH-0003Vz-AX; Tue, 26 May 2020 16:30:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vX9/=7I=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jdcTG-0003Vu-9a
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 16:30:30 +0000
X-Inumbo-ID: 3596f44a-9f6e-11ea-a676-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3596f44a-9f6e-11ea-a676-12813bfff9fa;
 Tue, 26 May 2020 16:30:28 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: C66bPiiyt6YKoDqn5r/JZkaVknDvTkdz8iCAQJLH4uHbQspyC92LK43ixaC7HZSDdvalXk9Kij
 1QdMNsQHuHF7pXkAYXUZ2pw/ts9V7Tt1sQxU5Afm6l2DzNsepCIotmfFznhD+rlo79bVI7gtF7
 cbxKBQQFF2S7Bm/4QWLc+6fQFfpvIgKv1IKkLyQwEMMZbuz1bxcCI2Dqbh6F0vMsLB6xTpB4Wz
 jE3hf3im7nQQFP3ZCpUfGx7BzTywSkFnS0+Jf4mBzBjVWztu4PnYZzchro9xMScqESKb15tNmO
 qkk=
X-SBRS: 2.7
X-MesageID: 19210299
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,437,1583211600"; d="scan'208";a="19210299"
Date: Tue, 26 May 2020 18:30:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Martin Lucina <martin@lucina.net>
Subject: Re: Xen PVH domU start-of-day VCPU state
Message-ID: <20200526163021.GE38408@Air-de-Roger>
References: <20200525160401.GA3091@nodbug.lucina.net>
 <a17fef73-382c-50b3-1e6b-5904fc3bf60f@suse.com>
 <6a22e477-c9e7-f0d7-6cb1-615137a778be@citrix.com>
 <20200526085221.GB5942@nodbug.lucina.net>
 <20200526093421.GA38408@Air-de-Roger>
 <20200526100337.GB38408@Air-de-Roger>
 <20200526101203.GE5942@nodbug.lucina.net>
 <20200526154224.GC25283@nodbug.lucina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200526154224.GC25283@nodbug.lucina.net>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, anil@recoil.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, mirageos-devel@lists.xenproject.org,
 dave@recoil.org, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 26, 2020 at 05:42:24PM +0200, Martin Lucina wrote:
> Oh! I think I've found a solution, even though I don't entirely understand the
> problem/root cause:
> 
> On Tuesday, 26.05.2020 at 12:12, Martin Lucina wrote:
> > > On Tue, May 26, 2020 at 11:34:21AM +0200, Roger Pau Monné wrote:
> > > Forgot to ask, but can you also add the output of readelf -lW
> > > <kernel>?
> > 
> >     Elf file type is EXEC (Executable file)
> >     Entry point 0x1001e0
> >     There are 7 program headers, starting at offset 64
> > 
> >     Program Headers:
> >       Type           Offset   VirtAddr           PhysAddr           FileSiz  MemSiz   Flg Align
> >       INTERP         0x001000 0x0000000000100000 0x0000000000100000 0x000018 0x000018 R   0x8
> >           [Requesting program interpreter: /nonexistent/solo5/]
> >       LOAD           0x001000 0x0000000000100000 0x0000000000100000 0x00626c 0x00626c R E 0x1000
> >       LOAD           0x008000 0x0000000000107000 0x0000000000107000 0x007120 0x00ed48 RW  0x1000
> >       NOTE           0x0080ac 0x00000000001070ac 0x00000000001070ac 0x000018 0x000018 R   0x4
> >       NOTE           0x00f120 0x00000000001070c4 0x00000000001070c4 0x000014 0x000000 R   0x4
>                                                                                ^^^^^^^^
> 
> I should have picked up on the above, but thought it wasn't relevant.
> 
> >       NOTE           0x008088 0x0000000000107088 0x0000000000107088 0x000024 0x000024 R   0x4
> >       NOTE           0x008000 0x0000000000107000 0x0000000000107000 0x000088 0x000088 R   0x4
> > 
> >      Section to Segment mapping:
> >       Segment Sections...
> >        00     .interp
> >        01     .interp .text .rodata .eh_frame
> >        02     .note.solo5.manifest .note.solo5.abi .note.solo5.not-openbsd .data .bss
> 
> And also the missing .note.solo5.xen above.
> 
> >        03     .note.solo5.not-openbsd
> >        04     .note.solo5.xen
> >        05     .note.solo5.abi
> >        06     .note.solo5.manifest
> 
> Turns out that the .note.solo5.xen section as defined in boot.S was not
> marked allocatable, and that was doing <something> that was confusing our
> linker script[1] (?).

Hm, I would have said there was no need to load notes into memory, and
hence using a MemSize of 0 would be fine.

Maybe libelf loader was somehow getting confused and not loading the
image properly?

Can you paste the output of `xl -vvv create ...` when using the broken
image?

> 
> If I make this simple change:
> 
> --- a/bindings/xen/boot.S
> +++ b/bindings/xen/boot.S
> @@ -32,7 +32,7 @@
>  #define ENTRY(x) .text; .globl x; .type x,%function; x:
>  #define END(x)   .size x, . - x
> 
> -.section .note.solo5.xen
> +.section .note.solo5.xen, "a", @note
> 
>         .align  4
>         .long   4
> 
> then I get the expected output from readelf -lW, and I can get as far as
> the C _start() with no issues!
> 
> FWIW, here's the diff of readelf -lW before/after:
> 
> --- before	2020-05-26 17:36:46.117885855 +0200
> +++ after	2020-05-26 17:38:07.090508322 +0200
> @@ -8,9 +8,9 @@
>    INTERP         0x001000 0x0000000000100000 0x0000000000100000 0x000018 0x000018 R   0x8
>        [Requesting program interpreter: /nonexistent/solo5/]
>    LOAD           0x001000 0x0000000000100000 0x0000000000100000 0x00615c 0x00615c R E 0x1000
> -  LOAD           0x008000 0x0000000000107000 0x0000000000107000 0x007120 0x00ed28 RW  0x1000
> +  LOAD           0x008000 0x0000000000107000 0x0000000000107000 0x006120 0x00dd28 RW  0x1000

This seems suspicious, there's a change of the size of the LOAD
section, but your change to the note type should not affect the LOAD
section?

Hm, maybe it does because the .note.solo5.xen was considered writable
by default?

Roger.

