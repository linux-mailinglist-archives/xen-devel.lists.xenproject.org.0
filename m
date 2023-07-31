Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BF376A0E5
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 21:09:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573433.898115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQYGz-0007Rs-GB; Mon, 31 Jul 2023 19:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573433.898115; Mon, 31 Jul 2023 19:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQYGz-0007PT-DL; Mon, 31 Jul 2023 19:09:41 +0000
Received: by outflank-mailman (input) for mailman id 573433;
 Mon, 31 Jul 2023 19:09:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vA1f=DR=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qQYGy-0007PN-AN
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 19:09:40 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb101030-2fd5-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 21:09:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 35019828466F;
 Mon, 31 Jul 2023 14:09:37 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id OI3OpBJRwfgm; Mon, 31 Jul 2023 14:09:36 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7FC8F82856A7;
 Mon, 31 Jul 2023 14:09:36 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JCNX9DX1iVkh; Mon, 31 Jul 2023 14:09:36 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id DC7DB828466F;
 Mon, 31 Jul 2023 14:09:35 -0500 (CDT)
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
X-Inumbo-ID: cb101030-2fd5-11ee-8613-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 7FC8F82856A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1690830576; bh=l3c4PEXYXAr77cJvx/HHykWWQQQQIberQUNciGhsd+0=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=HBWM4vE/mBEh9o1/55ZJwVpiQGjXNDyk4OlMJJdKQ+9eG+txo2z+U/OYMj45XJymq
	 7c7KETSvK10VkZHofzNcflThrU2L9eNrupHU1QB4HpY0o05Smf9XCFWymtaIvTkJ0D
	 UILw5/12c+57utTKuYV/5UybyeSE8bMnUxQTjK4c=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <a329ee02-0ae3-c8a4-5f82-5ea58d865321@raptorengineering.com>
Date: Mon, 31 Jul 2023 14:09:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/5] xen/ppc: Switch to medium PIC code model
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690579561.git.sanastasio@raptorengineering.com>
 <335ce2a18f8cce679dd8b30d11560989131b4337.1690579561.git.sanastasio@raptorengineering.com>
 <904d9448-1fd8-bcd7-2cbd-c9e5752dec66@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <904d9448-1fd8-bcd7-2cbd-c9e5752dec66@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/31/23 10:58 AM, Jan Beulich wrote:
> On 28.07.2023 23:35, Shawn Anastasio wrote:
>> --- a/xen/arch/ppc/ppc64/head.S
>> +++ b/xen/arch/ppc/ppc64/head.S
>> @@ -1,9 +1,11 @@
>>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>>  
>>  #include <asm/asm-defns.h>
>> +#include <asm/asm-offsets.h>
>>  
>>      .section .text.header, "ax", %progbits
>>  
>> +
>>  ENTRY(start)
> 
> Nit: Stray change?
> 
>> @@ -11,16 +13,19 @@ ENTRY(start)
>>      FIXUP_ENDIAN
>>  
>>      /* set up the TOC pointer */
>> -    LOAD_IMM32(%r2, .TOC.)
>> +    bcl	    20, 31, .+4
> 
> Could you use a label name instead of .+4? Aiui you really mean
> 
>> +1:  mflr    %r12
> 
> ... "1f" there?

Yes, good point. I'll point out that this form of the `bcl` instruction
is specifically defined in the ISA specification as the recommended
way to obtain the address of the next instruction, and hardware
implementations presumably optimize it. Using a label instead of +4
would of course be fine as long as the label immediately follows the
bcl, but if the label was elsewhere then the optimization that the ISA
allows for this specific instruction might not be hit. Just something
that should be kept in mind in case this code is ever refactored.

I'll change it to 1f in v2.

> 
> Jan

Thanks,
Shawn

