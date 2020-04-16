Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 174261AC1E5
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 14:58:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP46O-0006k4-Oq; Thu, 16 Apr 2020 12:58:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fNsn=6A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jP46N-0006jw-Gf
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 12:58:43 +0000
X-Inumbo-ID: fb03a9ab-7fe1-11ea-8b89-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb03a9ab-7fe1-11ea-8b89-12813bfff9fa;
 Thu, 16 Apr 2020 12:58:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5208BAC5B;
 Thu, 16 Apr 2020 12:58:34 +0000 (UTC)
Subject: Re: [PATCH] mini-os: use -m elf_i386 for final linking
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
References: <20200416122731.22713-1-jgross@suse.com>
 <20200416124636.35zgnf5bhq3d3bpw@function>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <71871753-d4e5-9afc-9637-479f5ecb2776@suse.com>
Date: Thu, 16 Apr 2020 14:58:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200416124636.35zgnf5bhq3d3bpw@function>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

On 16.04.20 14:46, Samuel Thibault wrote:
> 
> Juergen Gross, le jeu. 16 avril 2020 14:27:31 +0200, a ecrit:
>> Using the standard -m elf_x86_64 for 64-bit mini-os results in the
>> first section (.text) to start only at offset 2MB in the binary file.
> 
> ? I'm not seeing this on my system:
> 
>    0 .text         0001933a  0000000000000000  0000000000000000  00001000  2**12
>                    CONTENTS, ALLOC, LOAD, READONLY, CODE

# readelf -S mini-os
There are 19 section headers, starting at offset 0x245e88:

Section Headers:
   [Nr] Name              Type             Address           Offset
        Size              EntSize          Flags  Link  Info  Align
   [ 0]                   NULL             0000000000000000  00000000
        0000000000000000  0000000000000000           0     0     0
   [ 1] .text             PROGBITS         0000000000000000  00200000
        0000000000017d07  0000000000000000  AX       0     0     4096
   [ 2] .rodata           PROGBITS         0000000000017d20  00217d20

> 
> so only 4K offset in the file, the file ends up being 135K big after
> stripping.

Lucky you. :-)

Might be specific to the linker used.

> 
>> Using -m elf_i386 avoids that problem without any visible disadvantage.
> 
> Using a 32bit emulation for a 64bit binary? This looks very odd to me?
> (and probably fragile)

That is only the final linking process, the option must not be used
earlier (I had linking errors in that case).

> I'd like to know more where this 2MB binary file offset is coming from,
> since AIUI it'd basically impact all binaries built by the toolchain of
> your system, not just mini-os, and I don't think the maintainers of your
> system want that :)

Andrew Cooper gave me the hint how to solve the problem. He has seen it
as well and told me (via IRC):

"I actually figured that out while hacking up a KVM-friendly version of
  XTF for Andy Luto. The linking -m elf_i386/elf_x86_64 option sets the
  "target emulation" which is more than just "what this is compiled for".
  I haven't yet cleaned up the patch for XTF (which also suffers the same
  problem), but linking an ELF64 using -m elf_i386 will DTRT with no
  other ill effects.
  Sadly, LD's documentation about details like this (and the linker
  script for that matter) are poor at best. Specifically, 64bit emulation
  appears to include "align primary sections to 2M so your OS can make
  better use of superpages even when mmap()ing", with no way I can spot
  to override this in the linker file."


Juergen

