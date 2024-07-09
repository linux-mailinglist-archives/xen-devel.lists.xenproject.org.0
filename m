Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0926892B154
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 09:39:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755942.1164485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR5RE-0001Kg-SO; Tue, 09 Jul 2024 07:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755942.1164485; Tue, 09 Jul 2024 07:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR5RE-0001I0-P3; Tue, 09 Jul 2024 07:39:00 +0000
Received: by outflank-mailman (input) for mailman id 755942;
 Tue, 09 Jul 2024 07:38:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RyCN=OJ=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sR5RD-0001Gi-Lh
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 07:38:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d4338d3-3dc6-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 09:38:58 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 556D74EE0742;
 Tue,  9 Jul 2024 09:38:57 +0200 (CEST)
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
X-Inumbo-ID: 4d4338d3-3dc6-11ef-bbfb-fd08da9f4363
MIME-Version: 1.0
Date: Tue, 09 Jul 2024 09:38:57 +0200
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: nicola.vetrini@bugseng.com, consulting@bugseng.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 05/17] xen/x86: address violations of MISRA C:2012
 Directive 4.10
Reply-To: alessandro.zucchelli@bugseng.com
Mail-Reply-To: alessandro.zucchelli@bugseng.com
In-Reply-To: <09bc4d2e-b4fb-428b-b0e3-266952ebd3c5@suse.com>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <d67d06849732fea11391afd61ff9891ed11795e5.1719829101.git.alessandro.zucchelli@bugseng.com>
 <09bc4d2e-b4fb-428b-b0e3-266952ebd3c5@suse.com>
Message-ID: <20ad12e8beec50aaa58305ee5f376e21@bugseng.com>
X-Sender: alessandro.zucchelli@bugseng.com
Organization: BUGSENG Srl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-07-01 16:21, Jan Beulich wrote:
> On 01.07.2024 15:36, Alessandro Zucchelli wrote:
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -260,17 +260,18 @@ $(objtree)/arch/x86/include/asm/asm-macros.h: 
>> $(obj)/asm-macros.i $(src)/Makefil
>>  	$(call filechk,asm-macros.h)
>> 
>>  define filechk_asm-macros.h
>> +	guard=$$(echo ASM_${SRCARCH}_ASM_MACROS_H | tr a-z A-Z);  \
> 
> Nit: Hard tab slipped in.
> 
>> +    echo '#ifndef $$guard'; \
>> +    echo '#define $$guard'; \
>>      echo '#if 0'; \
>>      echo '.if 0'; \
>>      echo '#endif'; \
>> -    echo '#ifndef __ASM_MACROS_H__'; \
>> -    echo '#define __ASM_MACROS_H__'; \
>>      echo 'asm ( ".include \"$@\"" );'; \
>> -    echo '#endif /* __ASM_MACROS_H__ */'; \
>>      echo '#if 0'; \
>>      echo '.endif'; \
>>      cat $<; \
>> -    echo '#endif'
>> +    echo '#endif'; \
>> +    echo '#endif /* $$guard */'
>>  endef
>> 
>>  $(obj)/efi.lds: AFLAGS-y += -DEFI
>> --- a/xen/arch/x86/cpu/cpu.h
>> +++ b/xen/arch/x86/cpu/cpu.h
>> @@ -1,3 +1,6 @@
>> +#ifndef X86_CPU_CPU_H
>> +#define X86_CPU_CPU_H
> 
> This, ...
> 
>> --- a/xen/arch/x86/x86_64/mmconfig.h
>> +++ b/xen/arch/x86/x86_64/mmconfig.h
>> @@ -5,6 +5,9 @@
>>   * Author: Allen Kay <allen.m.kay@intel.com> - adapted from linux
>>   */
>> 
>> +#ifndef X86_64_MMCONFIG_H
>> +#define X86_64_MMCONFIG_H
> 
> ... this, and ...
> 
>> --- a/xen/arch/x86/x86_emulate/private.h
>> +++ b/xen/arch/x86/x86_emulate/private.h
>> @@ -6,6 +6,9 @@
>>   * Copyright (c) 2005-2007 XenSource Inc.
>>   */
>> 
>> +#ifndef X86_X86_EMULATE_PRIVATE_H
>> +#define X86_X86_EMULATE_PRIVATE_H
> 
> ... this guard can't possibly all follow the same proposed naming 
> scheme
> (wherever the final version of that is being recorded; I don't recall 
> it
> having gone in, and I didn't spot anything earlier in the series); at
> least one must be wrong.

For x86/x86_64/mmconfig.h has been made an exception as stated in the 
commit
message:
Note that in x86_64/mmconfig.h we slightly deviate from the naming
convention in place: instead of having the inclusion guard as
X86_X86_64_MMCONFIG_H we shortened the directory prefix as X86_64 for
the sake of readability.

If you do not agree with this exception and you prefer to keep the 
additional
X86_ prefix let me know so as I prepare the patch series V5 I may 
reintroduce it.

Best regards,
-- 
Alessandro Zucchelli, B.Sc.

Software Engineer, BUGSENG (https://bugseng.com)

