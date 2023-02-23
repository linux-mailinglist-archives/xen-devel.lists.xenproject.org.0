Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C70D6A0C04
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 15:41:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500463.771857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVCmL-0002Pc-4p; Thu, 23 Feb 2023 14:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500463.771857; Thu, 23 Feb 2023 14:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVCmL-0002ND-28; Thu, 23 Feb 2023 14:41:01 +0000
Received: by outflank-mailman (input) for mailman id 500463;
 Thu, 23 Feb 2023 14:40:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPya=6T=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pVCmJ-0002N7-9K
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 14:40:59 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15dbeecc-b388-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 15:40:58 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id eg37so39070329edb.12
 for <xen-devel@lists.xenproject.org>; Thu, 23 Feb 2023 06:40:58 -0800 (PST)
Received: from [192.168.1.93] ([188.73.239.233])
 by smtp.gmail.com with ESMTPSA id
 c96-20020a509fe9000000b004acc6cbc451sm5250482edf.36.2023.02.23.06.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 06:40:57 -0800 (PST)
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
X-Inumbo-ID: 15dbeecc-b388-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qHwE7z/0gSktJtzO9ucPdaPg4gUrmR8qi5tYGxjSgFY=;
        b=VBBgesPit9SczEmDXT7JrDL9DM0vvYpcX7kBnuLSuXRX6VYqh4JSzcEq73fMYWfvzB
         TktmazsdA5+QFMr9D3vhYO7xKfHck9j3wnjAc+9B1vEJK+rY3gEdtUGLibywfsGq7Q9U
         A88q+Dif3jvGZjsvW7X+gRX5eLWbMN0Se8qvyr1yHTlQ56F2SdIQyUdQ8nEMskQX10Vb
         azhDIYP3iEfmc4PN9WqzxXW2aohNbzc0DLzaq5aMWc+XvaBmvdvsYBzoQUpAB9LufGZP
         8WriJJi0rJXHJnLdAJWzQoxEqSB6wMr17N6kva/GoIJshdDLRUvOJrwHG3mWJ1LF52bw
         JRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHwE7z/0gSktJtzO9ucPdaPg4gUrmR8qi5tYGxjSgFY=;
        b=5poeDmaUG3llzOC43GdgcrA04Yl5B31BYxIR2+dokmuEEMx0VvRU7GRsbBuyfgUOyC
         uzlc13rNgQBAhrADxO8WKlCT0UbZ83UCQT2YUBM1jkpFn1aY0yBNKVDsFTcvTidmPTuZ
         KvTrrMboB14B1sCh/N+ZI2gOF0ojU867RScwrtn5VLwbpSTKhIlEotAZAuB/r8xFt+Zz
         eDyv/4hM0JnQFAa+ZVlC0KEw/EJWXfMYLtp0HfiER8eu3taB7Ek1WmbRe8WCw+kQiIIA
         nsaZCgJyxW86KWcKK4K/o3o0wOvlGqp1+/ULnylhQf6DvviqPdEwkdEwUGpEbSdrB8DB
         ouKQ==
X-Gm-Message-State: AO0yUKWwTshKaRVVggmIDXvvTs0mgywln8d1h8DMRIcZKfdzLvmHtxIm
	KDc4WfeOInIvpvHNRV1UcoPpzOuj+nM=
X-Google-Smtp-Source: AK7set/+Ip0Cgb71r8bj8ZiQYo8nc5bWEZJeUKgWX6fQYP/yLSDPJoiyo/DcplsSHS2CveHZLXY1Kw==
X-Received: by 2002:a17:906:b03:b0:8b1:7eb7:d53d with SMTP id u3-20020a1709060b0300b008b17eb7d53dmr23434292ejg.49.1677163257754;
        Thu, 23 Feb 2023 06:40:57 -0800 (PST)
Message-ID: <90d033f2-2b5e-1450-0fb9-7352a2973e9b@gmail.com>
Date: Thu, 23 Feb 2023 16:40:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/9] x86/svm: move declarations used only by svm code
 from svm.h to private header
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
 <20230222120023.3004624-4-burzalodowa@gmail.com>
 <9f42efc9-ced2-95b4-cbbd-8b5b3a1d4ca7@citrix.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <9f42efc9-ced2-95b4-cbbd-8b5b3a1d4ca7@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/23/23 13:16, Andrew Cooper wrote:
> On 22/02/2023 12:00 pm, Xenia Ragiadakou wrote:
>> Create a new private header in arch/x86/hvm/svm called svm.h and move there
>> all definitions and declarations that are used solely by svm code.
>>
>> The function svm_invlpga() stays in arch/x86/hvm/svm/svm.h because it is used
>> by arch/x86/hvm/svm/asid.h.
> 
> I'm reasonably sure that all headers in arch/x86/hvm/svm/ other than
> svm.h can move to being private easily.
> 
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>> ---
>>
>> Changes in v2:
>>   - new patch, the creation of a private header was suggested by Andrew and Jan
>>
>> I have not added #ifndef guards as it is a private and it should not be
>> included by other headers. However, this is considered a MISRA-C violation
>> ... I 'm not sure what to do.
> 
> Always have guards.  Firstly because that is the decision taken by the
> MISRA working group.
> 
> But more importantly, because life is too short to deal with the
> shooting yourself in the foot which will occur from trying to take
> shortcuts like these.
> 
> 
>> diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
>> new file mode 100644
>> index 0000000000..b2ec293078
>> --- /dev/null
>> +++ b/xen/arch/x86/hvm/svm/svm.h
>> @@ -0,0 +1,40 @@
>> +#include <xen/types.h>
> 
> Elsewhere, we're retrofitting SPDX tags to all source files, but we're
> already putting tags in new source files.
> 
> This one needs to be /* SPDX-License-Identifier: GPL-2.0 */ I think.
> 
>> +
>> +static inline void svm_vmload_pa(paddr_t vmcb)
>> +{
>> +    asm volatile (
>> +        ".byte 0x0f,0x01,0xda" /* vmload */
>> +        : : "a" (vmcb) : "memory" );
>> +}
>> +
>> +static inline void svm_vmsave_pa(paddr_t vmcb)
>> +{
>> +    asm volatile (
>> +        ".byte 0x0f,0x01,0xdb" /* vmsave */
>> +        : : "a" (vmcb) : "memory" );
>> +}
>> +
>> +struct cpu_user_regs;
> 
> Looking at this, you could fold patch 1 into this patch and reduce the
> net churn.  It would be fine to say "delete used forward declaration" in
> the commit message, seeing as you're deleting that block of code anyway
> from svm.h
> 
> If you want to do this, then I'll skip committing patch 1.

Yes I will do it.

> 
> ~Andrew

-- 
Xenia

