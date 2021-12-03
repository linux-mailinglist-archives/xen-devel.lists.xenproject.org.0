Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 015ED467928
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 15:11:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237696.412276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt9H9-0001tm-WB; Fri, 03 Dec 2021 14:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237696.412276; Fri, 03 Dec 2021 14:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt9H9-0001rm-SW; Fri, 03 Dec 2021 14:10:59 +0000
Received: by outflank-mailman (input) for mailman id 237696;
 Fri, 03 Dec 2021 14:10:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LwEy=QU=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mt9H8-0001rf-PX
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 14:10:58 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5afb6a7-5442-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 15:10:57 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:35098)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mt9H6-000HOP-9B (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 03 Dec 2021 14:10:56 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id A72211FC8B;
 Fri,  3 Dec 2021 14:10:56 +0000 (GMT)
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
X-Inumbo-ID: d5afb6a7-5442-11ec-b1df-f38ee3fbfdf7
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <ef297668-96ba-851d-2990-179f6dcb9f37@srcf.net>
Date: Fri, 3 Dec 2021 14:10:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126163340.26714-1-andrew.cooper3@citrix.com>
 <e5da1903-20bc-4523-9d0a-6071f117c3ce@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 59.5/65] x86: Introduce helpers/checks for endbr64
 instructions
In-Reply-To: <e5da1903-20bc-4523-9d0a-6071f117c3ce@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/12/2021 13:59, Jan Beulich wrote:
> On 26.11.2021 17:33, Andrew Cooper wrote:
>> ... to prevent the optimiser creating unsafe code.  See the code comment for
>> full details.
>>
>> Also add a build time check for endbr64 embedded in imm32 operands, which
>> catches the obvious cases where the optimiser has done an unsafe thing.
> But this is hardly enough to be safe. I'd even go as far as saying we can
> do without it if we don't check more thoroughly.

I will do the full check in v2.  Marek wrote the full check in response
to a discussion about this patch.

>
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -190,6 +190,10 @@ $(TARGET)-syms: prelink.o xen.lds
>>  	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y= $(@D)/.$(@F).1.o
>>  	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
>>  	    $(@D)/.$(@F).1.o -o $@
>> +ifeq ($(CONFIG_XEN_IBT),y)
>> +	$(OBJDUMP) -d $@ | grep 0xfa1e0ff3 >/dev/null && \
>> +		{ echo "Found embedded endbr64 instructions" >&2; false; } || :
> I guess I'm confused: The "false;" suggests to me you want to make the
> build fail in such a case. The "|| :" otoh suggests you want to silence
> errors (and not just the one from grep when not finding the pattern
> aiui).

The exit code of grep needs inverting for the build to proceed
correctly.  Without || :, all builds fail when they've not got the pattern.

> Also isn't passing -q to grep standard enough (and shorter) to use in
> place of redirecting its output to /dev/null?

That caused problems on the BSDs.  c/s e632d56f0f5 went through several
iterations before settling on this pattern.

>
>> --- /dev/null
>> +++ b/xen/include/asm-x86/endbr.h
>> @@ -0,0 +1,55 @@
>> +/******************************************************************************
>> + * include/asm-x86/endbr.h
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; If not, see <http://www.gnu.org/licenses/>.
>> + *
>> + * Copyright (c) 2021 Citrix Systems Ltd.
>> + */
>> +#ifndef XEN_ASM_ENDBR_H
>> +#define XEN_ASM_ENDBR_H
>> +
>> +#include <xen/compiler.h>
>> +
>> +/*
>> + * In some cases we need to inspect/insert endbr64 instructions.
>> + *
>> + * The naive way, mem{cmp,cpy}(ptr, "\xf3\x0f\x1e\xfa", 4), optimises unsafely
>> + * by placing 0xfa1e0ff3 in an imm32 operand, which marks a legal indirect
>> + * branch target as far as the CPU is concerned.
>> + *
>> + * gen_endbr64() is written deliberately to avoid the problematic operand, and
>> + * marked __const__ as it is safe for the optimiser to hoist/merge/etc.
>> + */
>> +static inline uint32_t __attribute_const__ gen_endbr64(void)
>> +{
>> +    uint32_t res;
>> +
>> +    asm ( "mov $~0xfa1e0ff3, %[res]\n\t"
>> +          "not %[res]\n\t"
>> +          : [res] "=r" (res) );
> Strictly speaking "=&r".

Ok.

~Andrew

