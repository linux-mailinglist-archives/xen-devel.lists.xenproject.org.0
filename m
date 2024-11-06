Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB869BE9DB
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 13:38:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830911.1246023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8fI8-0008Tr-Jg; Wed, 06 Nov 2024 12:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830911.1246023; Wed, 06 Nov 2024 12:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8fI8-0008Qh-FZ; Wed, 06 Nov 2024 12:37:44 +0000
Received: by outflank-mailman (input) for mailman id 830911;
 Wed, 06 Nov 2024 12:37:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlMZ=SB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t8fI7-0008Qb-9d
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 12:37:43 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e956d94c-9c3b-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 13:37:40 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9ec86a67feso115196266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 04:37:40 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16d9ce8sm280230666b.67.2024.11.06.04.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 04:37:39 -0800 (PST)
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
X-Inumbo-ID: e956d94c-9c3b-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmYiLCJoZWxvIjoibWFpbC1lajEteDYyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU5NTZkOTRjLTljM2ItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODk2NjYwLjUzMzA5OCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730896660; x=1731501460; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OxpICr6eHOLtWckwii8D7DsEfsbp0B6wL/WJbnmEvQU=;
        b=wCUkLTTrY3Ma41uG+39ttu81Hp9pOHwFrQOQlcE71GQ7MqMSHzhQ/vmjJUvgYTED81
         CdISbfOxihOZ8hOw4SJW9ldtSmOhcjaitJk/Rs/7r4YSfASQRQZ+a/mJKtm0Lo+mZf9w
         avTMLW/3cMZUn1kInbTr21id34pKgG94IGM68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730896660; x=1731501460;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OxpICr6eHOLtWckwii8D7DsEfsbp0B6wL/WJbnmEvQU=;
        b=wwCT4bpBmCQR8XBqxFn+IMheBzppMOX/LeieupQ9P9aURLEIemhU/jtMPa8TzNL0H7
         T47YuzhNga3Kqt+2W33e2M5Tn86PeXj31HMb3/NG0JW8nGbalgnllYOvihl5ix4HZ2a8
         stBwm+6XYqnSAbtt6s02USb6By/ZkZ1ZEgfZoN7opWQnoynUbzMy3sxoB5/jffeqlt6H
         VfHPx3jNAMfevVo7WRuyRMfoUcRqusAxF5MPcaeS+JS5ALuTjRIGlw9xJsu79fNhHKUN
         Ns9op4EIYuUSsguvZRtapQ/SL4qd2J9CUzCpVTqMgHzWofFb370ZrR/+9oG2TMMJqU2Y
         QsYg==
X-Forwarded-Encrypted: i=1; AJvYcCWn9u11xfKROlPqjxqJaIuntAk6JgSUumM7SSTTUcNA0eeU9Aw/5gAvuGwX2wn8g+C9NahxtJ4GZ2g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjrtwFZC3JSZj0jvyJbVPfEWM4OQk7y64RES8eZemnFx/ENhe3
	SM4NN2cRvety0nQE2FLuLjd0Z6QSm8TXdVYQd01gWyvegAuCEeFNavpWQaHXZjA=
X-Google-Smtp-Source: AGHT+IF664F8u00NmXHTHBBF8A/AMK86BVNX1s0tgKj1zp2WUYYDvdimZzoWY/0RKrH84hbSPIIQqg==
X-Received: by 2002:a17:906:c112:b0:a99:f71a:4305 with SMTP id a640c23a62f3a-a9de5ce4681mr4335648466b.18.1730896659897;
        Wed, 06 Nov 2024 04:37:39 -0800 (PST)
Date: Wed, 6 Nov 2024 13:37:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/boot: Fix build with LLVM toolchain
Message-ID: <ZytjEoRjAPhtR7Ga@macbook>
References: <20241105145507.613981-1-frediano.ziglio@cloud.com>
 <48a22295-f3ac-496b-bdfb-ee17b0ada994@suse.com>
 <CACHz=ZhrxTSYGyWMQSE0Xi6sW2BZiLDuKkP2508CBRELD-USgQ@mail.gmail.com>
 <816ae079-378b-4bfd-93f2-83c5a281eb01@suse.com>
 <CACHz=ZhzrZO5o8EarXewC6BzrX4acSyAFsAO2hHBvm9xYRecqg@mail.gmail.com>
 <80296824-760a-48c4-9dce-4875fca0ed31@suse.com>
 <CACHz=ZgY_O7siQUQZjxGe=gfiB-C9jw1UQqwK9ffuHUUQmRgiQ@mail.gmail.com>
 <cc7802cc-8591-4356-bf7e-3daa912c751c@suse.com>
 <CACHz=ZjZVPSueWjxfWBjbjg8_UhZc7hMwM49BFT0bipqeBOsSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACHz=ZjZVPSueWjxfWBjbjg8_UhZc7hMwM49BFT0bipqeBOsSA@mail.gmail.com>

On Wed, Nov 06, 2024 at 11:58:19AM +0000, Frediano Ziglio wrote:
> On Wed, Nov 6, 2024 at 11:45 AM Jan Beulich <jbeulich@suse.com> wrote:
> >
> > On 06.11.2024 12:34, Frediano Ziglio wrote:
> > > On Wed, Nov 6, 2024 at 10:59 AM Jan Beulich <jbeulich@suse.com> wrote:
> > >>
> > >> On 06.11.2024 07:56, Frediano Ziglio wrote:
> > >>> On Tue, Nov 5, 2024 at 5:06 PM Jan Beulich <jbeulich@suse.com> wrote:
> > >>>>
> > >>>> On 05.11.2024 17:35, Frediano Ziglio wrote:
> > >>>>> On Tue, Nov 5, 2024 at 3:32 PM Jan Beulich <jbeulich@suse.com> wrote:
> > >>>>>>
> > >>>>>> On 05.11.2024 15:55, Frediano Ziglio wrote:
> > >>>>>>> This toolchain generates different object and map files.
> > >>>>>>> Account for these changes.
> > >>>>>>
> > >>>>>> At least briefly mentioning what exactly the differences are would be
> > >>>>>> quite nice, imo.
> > >>>>>>
> > >>>>>
> > >>>>> What about.
> > >>>>>
> > >>>>> Object have 3 additional sections which must be handled by the linker script.
> > >>>>
> > >>>> I expect these sections are there in both cases. The difference, I assume,
> > >>>> is that for the GNU linker they don't need mentioning in the linker script.
> > >>>> Maybe that's what you mean to say, but to me at least the sentence can also
> > >>>> be interpreted differently.
> > >>>
> > >>> Why do you expect such sections? They are used for dynamic symbols in
> > >>> shared objects, we don't use shared objects here. Normal object
> > >>> symbols are not handled by these sections. GNU compiler+linker (we
> > >>> link multiple objects together) do not generate these sections. So the
> > >>> comment looks correct to me.
> > >>
> > >> About every ELF object will have .symtab and .strtab, and many also a
> > >> separate .shstrtab. There's nothing "dynamic" about them. IOW - I'm
> > >> confused by your reply.
> > >
> > > I checked the object files and there are no such sections using GNU toolchain.
> >
> > I think I checked every *.o that's under boot/, and they all have these three
> > sections. Can you clarify which one(s) specifically you checked?
> >
> > Jan
> 
> $ gcc --version
> gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
> Copyright (C) 2021 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> 
> $ ld --version
> GNU ld (GNU Binutils for Ubuntu) 2.38
> Copyright (C) 2022 Free Software Foundation, Inc.
> This program is free software; you may redistribute it under the terms of
> the GNU General Public Licence version 3 or (at your option) a later version.
> This program has absolutely no warranty.
> 
> $ find xen/normal/ xen/pvh/ -name \*.o | xargs -ifilename sh -c
> 'objdump -x filename' | grep -e \\.
> shstrtab -e \\.strtab -e \\.symtab
> 
> (xen/normal and xen/pvh are the build directory, with different configurations)
> 
> I'm saying that's possibly why the linker scripts didn't need to
> specify these sections.

objdump -x doesn't seem to list .symtab, .strtab or .shstrtab, but
readelf -S does:

# readelf -SW xen/arch/x86/boot/reloc.o
[...]
  [11] .symtab           SYMTAB          00000000 0004b0 000190 10     12  21  4
  [12] .strtab           STRTAB          00000000 000640 000092 00      0   0  1
  [13] .shstrtab         STRTAB          00000000 000734 000078 00      0   0  1

# objdump -x xen/arch/x86/boot/reloc.o
[...]
Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .group        00000008  00000000  00000000  00000034  2**2
                  CONTENTS, READONLY, GROUP, LINK_ONCE_DISCARD
  1 .text         0000041d  00000000  00000000  00000040  2**4
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
  2 .data         00000000  00000000  00000000  0000045d  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  3 .bss          00000000  00000000  00000000  0000045d  2**0
                  ALLOC
  4 .rodata       00000024  00000000  00000000  00000460  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, DATA
  5 .text.__x86.get_pc_thunk.bx 00000004  00000000  00000000  00000484  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  6 .comment      00000028  00000000  00000000  00000488  2**0
                  CONTENTS, READONLY
  7 .note.GNU-stack 00000000  00000000  00000000  000004b0  2**0
                  CONTENTS, READONLY

It also seems to skip .rel sections.  It doesn't seem reliable to use
objdump to get ELF sections.

Regards, Roger.

