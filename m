Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C46E1E46F4
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 17:06:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdxcw-000626-Ua; Wed, 27 May 2020 15:05:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ARaW=7J=xen.org=roger@srs-us1.protection.inumbo.net>)
 id 1jdxcw-00061z-4P
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 15:05:54 +0000
X-Inumbo-ID: 8ee513b6-a02b-11ea-9947-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ee513b6-a02b-11ea-9947-bc764e2007e4;
 Wed, 27 May 2020 15:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6c3/y3ONIrPCVAnbVGJRw/qLH1x2DrpPzwDDCf4/n1U=; b=jYroH60y9cMXFRr0Fe/uU9l0Xb
 M5d+GjmDIyQfj5wZrl/vLaj4iiiQlz6OnnmkMy0AKwVFaaT+8vm7JzKX+ARhpjSyslyF/RiU3VFoh
 Gu/Ag2sngTaM5bkxKrLn/lorePV+XXewpWIMuu5x0n9mpEsuCA7Q73xT/0Yo+i1n4RmE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jdxcr-0005vl-Qv; Wed, 27 May 2020 15:05:49 +0000
Received: from [93.176.191.173] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jdxcr-0002MU-GF; Wed, 27 May 2020 15:05:49 +0000
Date: Wed, 27 May 2020 17:05:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xen.org>
To: Martin Lucina <martin@lucina.net>,
 =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, anil@recoil.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 mirageos-devel@lists.xenproject.org, dave@recoil.org,
 xen-devel@lists.xenproject.org
Subject: Re: Xen PVH domU start-of-day VCPU state
Message-ID: <20200527150539.GB1195@Air-de-Roger>
References: <6a22e477-c9e7-f0d7-6cb1-615137a778be@citrix.com>
 <20200526085221.GB5942@nodbug.lucina.net>
 <20200526093421.GA38408@Air-de-Roger>
 <20200526100337.GB38408@Air-de-Roger>
 <20200526101203.GE5942@nodbug.lucina.net>
 <20200526154224.GC25283@nodbug.lucina.net>
 <20200526163021.GE38408@Air-de-Roger>
 <20200527080008.GC4788@nodbug.lucina.net>
 <20200527143644.GA1195@Air-de-Roger>
 <20200527145702.GE4788@nodbug.lucina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200527145702.GE4788@nodbug.lucina.net>
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

On Wed, May 27, 2020 at 04:57:02PM +0200, Martin Lucina wrote:
> On Wednesday, 27.05.2020 at 16:41, Roger Pau Monné wrote:
> > > > > If I make this simple change:
> > > > > 
> > > > > --- a/bindings/xen/boot.S
> > > > > +++ b/bindings/xen/boot.S
> > > > > @@ -32,7 +32,7 @@
> > > > >  #define ENTRY(x) .text; .globl x; .type x,%function; x:
> > > > >  #define END(x)   .size x, . - x
> > > > > 
> > > > > -.section .note.solo5.xen
> > > > > +.section .note.solo5.xen, "a", @note
> > > > > 
> > > > >         .align  4
> > > > >         .long   4
> > > > > 
> > > > > then I get the expected output from readelf -lW, and I can get as far as
> > > > > the C _start() with no issues!
> > > > > 
> > > > > FWIW, here's the diff of readelf -lW before/after:
> > > > > 
> > > > > --- before	2020-05-26 17:36:46.117885855 +0200
> > > > > +++ after	2020-05-26 17:38:07.090508322 +0200
> > > > > @@ -8,9 +8,9 @@
> > > > >    INTERP         0x001000 0x0000000000100000 0x0000000000100000 0x000018 0x000018 R   0x8
> > > > >        [Requesting program interpreter: /nonexistent/solo5/]
> > > > >    LOAD           0x001000 0x0000000000100000 0x0000000000100000 0x00615c 0x00615c R E 0x1000
> > > > > -  LOAD           0x008000 0x0000000000107000 0x0000000000107000 0x007120 0x00ed28 RW  0x1000
> > > > > +  LOAD           0x008000 0x0000000000107000 0x0000000000107000 0x006120 0x00dd28 RW  0x1000
> > > > 
> > > > This seems suspicious, there's a change of the size of the LOAD
> > > > section, but your change to the note type should not affect the LOAD
> > > > section?
> > > 
> > > Indeed.
> > 
> > You could try to disassemble the text sections with objdump -d (or -D
> > for all sections) and see if there's a difference between both
> > versions, but having solved the issue maybe you just want to move
> > on.
> 
> I have moved on, making good progress:
> 
>     domainbuilder: detail: xc_dom_release: called
>     Hello, world!
>     Solo5: Xen hvm_start_info @0x0000000000119000
>     Solo5: magic=0x336ec578 version=1
>     Solo5: cmdline_paddr=0x0
>     Solo5: memmap_paddr=0x119878 entries=5
>     Solo5: memmap[0] = { 0x0, 0x10000400, 1 }
>     Solo5: mem_size=0x10000000
>                 |      ___|
>       __|  _ \  |  _ \ __ \
>     \__ \ (   | | (   |  ) |
>     ____/\___/ _|\___/____/
>     Solo5: Bindings version v0.6.5-4-g57724f8-dirty
>     Solo5: Memory map: 256 MB addressable:
>     Solo5:   reserved @ (0x0 - 0xfffff)
>     Solo5:       text @ (0x100000 - 0x104fff)
>     Solo5:     rodata @ (0x105000 - 0x106fff)
>     Solo5:       data @ (0x107000 - 0x118fff)
>     Solo5:       heap >= 0x119000 < stack < 0x10000000
>     Solo5: Clock source: KVM paravirtualized clock
>     Solo5: trap: type=#GP ec=0x0 rip=0x103a96 rsp=0xfffff90 rflags=0x2
>     Solo5: ABORT: cpu_x86_64.c:181: Fatal trap
>     Solo5: Halted
> 
> (The #GP is due to the timekeeping code not yet ported to Xen).
> 
> Random question: With memory="256" in the xl config, why is the size of the
> first XEN_HVM_MEMMAP_TYPE_RAM memmap entry not a multiple of PAGE_SIZE? I
> had to align it down, since we put the stack at the top of RAM. 0x10000400
> seems... odd.

IIRC some memory is stolen by the domain builder to place stuff (like
the ACPI tables), and the end is not aligned to a page size boundary
because it's not mandatory.

Roger.

