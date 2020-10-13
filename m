Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C0128CC68
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 13:21:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6154.16246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSINN-0007m8-2F; Tue, 13 Oct 2020 11:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6154.16246; Tue, 13 Oct 2020 11:21:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSINM-0007ll-V6; Tue, 13 Oct 2020 11:21:52 +0000
Received: by outflank-mailman (input) for mailman id 6154;
 Tue, 13 Oct 2020 11:21:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSINM-0007lf-4i
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 11:21:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a543055-1195-44ac-878f-41d0a4220454;
 Tue, 13 Oct 2020 11:21:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 83017AD5F;
 Tue, 13 Oct 2020 11:21:50 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSINM-0007lf-4i
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 11:21:52 +0000
X-Inumbo-ID: 4a543055-1195-44ac-878f-41d0a4220454
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4a543055-1195-44ac-878f-41d0a4220454;
	Tue, 13 Oct 2020 11:21:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602588110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o/zmrIFIfJ4lqDoscOzH0EH9jaWm465zjwJTXzvEocg=;
	b=AHq2ZasCYSQ457HHNnUG7DVrZrrvYHZHU1e3+OLYldpDUyPm5lLtyZMspTi7omSSju7U0a
	YV2gmiudOdTM5LfOYectv339yDEJrjfO0RId/Rh8L57PjgcAIRIcXITlv6a5QFGrH+4JCx
	3UKeglCyc+01iw4R28D6K1zNFmVAfJo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 83017AD5F;
	Tue, 13 Oct 2020 11:21:50 +0000 (UTC)
Subject: Re: [PATCH v2 1/6] x86: replace __ASM_{CL,ST}AC
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
 <931e6d88-803e-36d6-da40-080879ec45a2@suse.com>
 <54f12dc6-fb5d-d6b4-3d5f-7267f0e0ef00@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c8d3eb59-4bf1-c832-3ba2-e2d7a72126d1@suse.com>
Date: Tue, 13 Oct 2020 13:21:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <54f12dc6-fb5d-d6b4-3d5f-7267f0e0ef00@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.10.2020 13:04, Andrew Cooper wrote:
> On 28/09/2020 13:29, Jan Beulich wrote:
>> --- a/xen/arch/x86/arch.mk
>> +++ b/xen/arch/x86/arch.mk
>> @@ -20,6 +20,7 @@ $(call as-option-add,CFLAGS,CC,"rdrand %
>>  $(call as-option-add,CFLAGS,CC,"rdfsbase %rax",-DHAVE_AS_FSGSBASE)
>>  $(call as-option-add,CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_AS_XSAVEOPT)
>>  $(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
>> +$(call as-option-add,CFLAGS,CC,"clac",-DHAVE_AS_CLAC_STAC)
> 
> Kconfig

I know that's your view, and you know I disagree. I don't see the
thread I had started to have lead to any consensus.

>> --- /dev/null
>> +++ b/xen/include/asm-x86/asm-defns.h
>> @@ -0,0 +1,9 @@
>> +#ifndef HAVE_AS_CLAC_STAC
>> +.macro clac
>> +    .byte 0x0f, 0x01, 0xca
>> +.endm
>> +
>> +.macro stac
>> +    .byte 0x0f, 0x01, 0xcb
>> +.endm
>> +#endif
>> --- a/xen/include/asm-x86/asm_defns.h
>> +++ b/xen/include/asm-x86/asm_defns.h
> 
> We cannot have two files which differ by the vertical positioning of a dash.

Why "cannot"? One is the helper of the other, so them being named almost
identically is quite sensible imo (and no-one is supposed to include the
new one directly). In any event I'd at most see this be "we don't want to".

> How about asm-insn.h for the former, seeing as that is what it contains.

Until "x86: fold indirect_thunk_asm.h into asm-defns.h", where it starts
to be more than just plain insn replacements. And I suspect more non-insn
macros will appear over time. I'd have suggested asm-macros.h in case the
present name really can't be reached consensus on, but we have a
(generated) file of this name already.

Jan

