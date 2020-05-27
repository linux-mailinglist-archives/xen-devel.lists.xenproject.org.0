Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D681E468F
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 16:57:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdxUR-0004vp-I2; Wed, 27 May 2020 14:57:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YYzi=7J=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jdxUP-0004vk-O8
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 14:57:05 +0000
X-Inumbo-ID: 535092fe-a02a-11ea-a75b-12813bfff9fa
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 535092fe-a02a-11ea-a75b-12813bfff9fa;
 Wed, 27 May 2020 14:57:04 +0000 (UTC)
Received: from nodbug.lucina.net (78-141-76-187.dynamic.orange.sk
 [78.141.76.187])
 by smtp.lucina.net (Postfix) with ESMTPSA id 27A01122804;
 Wed, 27 May 2020 16:57:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1590591423;
 bh=gCASpuwhr1jiW6oKsT1tI6Zwmv/ACpqwRxqwguDYUJ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qiW8NyhCrP/mIBzkTgusiSWV8Ui4+vu8fNB/+7vnRonbmWNdzmFd583CzU/dgmM3L
 qrXqDJFvUKn/U6fLaN71Xhg5TtiLst5ck5UZyhNDAx/2wUhYNStdyDtV8Wq2tWPgSr
 WnAQU8xn0ae7RXXIYiPGNBMqBfQ0uYu5bmQCKeIBobVQyYMqr8PC6ue5Wsc+W3rpTe
 EKNSvK8b0auZMXKO8KnI/t6JT1IgsjN1J8RN1c4ZS97BSKLvNxNG/UONrObTIwQVVm
 UpPVoZSTsK4G+ElChvnFYhqaHto/X1FYhts0XIZOXDRwKyQJEVb298+xKhkjnq26Sm
 B5H3zmLQ9lEaA==
Received: by nodbug.lucina.net (Postfix, from userid 1000)
 id 05BB4265E722; Wed, 27 May 2020 16:57:03 +0200 (CEST)
Date: Wed, 27 May 2020 16:57:02 +0200
From: Martin Lucina <martin@lucina.net>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xen.org>
Subject: Re: Xen PVH domU start-of-day VCPU state
Message-ID: <20200527145702.GE4788@nodbug.lucina.net>
Mail-Followup-To: Martin Lucina <martin@lucina.net>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xen.org>,
 =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, anil@recoil.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 mirageos-devel@lists.xenproject.org, dave@recoil.org,
 xen-devel@lists.xenproject.org
References: <a17fef73-382c-50b3-1e6b-5904fc3bf60f@suse.com>
 <6a22e477-c9e7-f0d7-6cb1-615137a778be@citrix.com>
 <20200526085221.GB5942@nodbug.lucina.net>
 <20200526093421.GA38408@Air-de-Roger>
 <20200526100337.GB38408@Air-de-Roger>
 <20200526101203.GE5942@nodbug.lucina.net>
 <20200526154224.GC25283@nodbug.lucina.net>
 <20200526163021.GE38408@Air-de-Roger>
 <20200527080008.GC4788@nodbug.lucina.net>
 <20200527143644.GA1195@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200527143644.GA1195@Air-de-Roger>
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, anil@recoil.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, mirageos-devel@lists.xenproject.org,
 dave@recoil.org, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wednesday, 27.05.2020 at 16:41, Roger Pau Monné wrote:
> > > > If I make this simple change:
> > > > 
> > > > --- a/bindings/xen/boot.S
> > > > +++ b/bindings/xen/boot.S
> > > > @@ -32,7 +32,7 @@
> > > >  #define ENTRY(x) .text; .globl x; .type x,%function; x:
> > > >  #define END(x)   .size x, . - x
> > > > 
> > > > -.section .note.solo5.xen
> > > > +.section .note.solo5.xen, "a", @note
> > > > 
> > > >         .align  4
> > > >         .long   4
> > > > 
> > > > then I get the expected output from readelf -lW, and I can get as far as
> > > > the C _start() with no issues!
> > > > 
> > > > FWIW, here's the diff of readelf -lW before/after:
> > > > 
> > > > --- before	2020-05-26 17:36:46.117885855 +0200
> > > > +++ after	2020-05-26 17:38:07.090508322 +0200
> > > > @@ -8,9 +8,9 @@
> > > >    INTERP         0x001000 0x0000000000100000 0x0000000000100000 0x000018 0x000018 R   0x8
> > > >        [Requesting program interpreter: /nonexistent/solo5/]
> > > >    LOAD           0x001000 0x0000000000100000 0x0000000000100000 0x00615c 0x00615c R E 0x1000
> > > > -  LOAD           0x008000 0x0000000000107000 0x0000000000107000 0x007120 0x00ed28 RW  0x1000
> > > > +  LOAD           0x008000 0x0000000000107000 0x0000000000107000 0x006120 0x00dd28 RW  0x1000
> > > 
> > > This seems suspicious, there's a change of the size of the LOAD
> > > section, but your change to the note type should not affect the LOAD
> > > section?
> > 
> > Indeed.
> 
> You could try to disassemble the text sections with objdump -d (or -D
> for all sections) and see if there's a difference between both
> versions, but having solved the issue maybe you just want to move
> on.

I have moved on, making good progress:

    domainbuilder: detail: xc_dom_release: called
    Hello, world!
    Solo5: Xen hvm_start_info @0x0000000000119000
    Solo5: magic=0x336ec578 version=1
    Solo5: cmdline_paddr=0x0
    Solo5: memmap_paddr=0x119878 entries=5
    Solo5: memmap[0] = { 0x0, 0x10000400, 1 }
    Solo5: mem_size=0x10000000
                |      ___|
      __|  _ \  |  _ \ __ \
    \__ \ (   | | (   |  ) |
    ____/\___/ _|\___/____/
    Solo5: Bindings version v0.6.5-4-g57724f8-dirty
    Solo5: Memory map: 256 MB addressable:
    Solo5:   reserved @ (0x0 - 0xfffff)
    Solo5:       text @ (0x100000 - 0x104fff)
    Solo5:     rodata @ (0x105000 - 0x106fff)
    Solo5:       data @ (0x107000 - 0x118fff)
    Solo5:       heap >= 0x119000 < stack < 0x10000000
    Solo5: Clock source: KVM paravirtualized clock
    Solo5: trap: type=#GP ec=0x0 rip=0x103a96 rsp=0xfffff90 rflags=0x2
    Solo5: ABORT: cpu_x86_64.c:181: Fatal trap
    Solo5: Halted

(The #GP is due to the timekeeping code not yet ported to Xen).

Random question: With memory="256" in the xl config, why is the size of the
first XEN_HVM_MEMMAP_TYPE_RAM memmap entry not a multiple of PAGE_SIZE? I
had to align it down, since we put the stack at the top of RAM. 0x10000400
seems... odd.

Thanks all for your help so far, I'm sure I'll run into some more details
that will need clarifying. Enough for today, now going for a walk in the
woods :-)

-mato

