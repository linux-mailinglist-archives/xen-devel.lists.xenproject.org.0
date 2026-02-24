Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBfGILSAnWk/QQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 11:43:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E39481858E5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 11:42:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239775.1541186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vups3-0002QS-JZ; Tue, 24 Feb 2026 10:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239775.1541186; Tue, 24 Feb 2026 10:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vups3-0002Nk-Gs; Tue, 24 Feb 2026 10:42:27 +0000
Received: by outflank-mailman (input) for mailman id 1239775;
 Tue, 24 Feb 2026 10:42:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1YgY=A4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vups2-0002NZ-UX
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 10:42:26 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 821fdca2-116d-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 11:42:25 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso39941625e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 02:42:26 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31bc068sm315306205e9.4.2026.02.24.02.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 02:42:24 -0800 (PST)
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
X-Inumbo-ID: 821fdca2-116d-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771929745; x=1772534545; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WaFq5XH2JILj6dEwhuKq5ki6UOjiTkyCI8uYrK6FTZk=;
        b=X++mYcPha4Hxseebp9o4tpIFhNNh3MlrTja5hRtCRcT2/os5ZdwFa9nPvQmA/HeU8Z
         oaZrGtgq62ZhDT9zA58EchdWXRBTPXgcZC1xNRt1P0N4bOf0bu2+S/KM30AvgawB8CyA
         3MpVUKUqvumUF8im7fLcn7JZbkS7EAbEzOQ7BGvf4Yj6GGJ0mwT68tKfvZgD6LTK8gYD
         fm/NUdp3Rq6Q7UDnKUo4JiUq7+9kuT7l/9+oeYf/3f4/V0AvfdDig1X3dvTneUapgXU2
         Ba9lLsmAY8flQyVAY63B1XC+55waawpFWPMVpKfoAQZ2DjuqIm1Nsq7zbsLCOA673M3Z
         /Zdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929745; x=1772534545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WaFq5XH2JILj6dEwhuKq5ki6UOjiTkyCI8uYrK6FTZk=;
        b=Z1QWN1ixCmlkm3cSHv1uOqUT771BBb+wq89qWTyXxt3pMCcgyoBPGrKgThOyq/xKZ0
         DroG/OVKWYnyN4+7EM/z+s7yz88DL+LY/H7/9dMhCYL2gzPSSllYrAfoRF2e3LacSt2S
         L2UGYmfJao7kv7jcd5Z4Q1KhD26RaBHHmWmOX7zVAmCkMGJ6wK95GoV5yEzPyC5BI0av
         fznLRSGpNIXq77Y6pKxP8qsQrD9CpAOvmOmYWegnqetIXu5c7vjKJpTrbNLg3W3zt/B4
         /LZ3ZsMR4qZrfWJhOaKSEirYfnSu9+Wp5nw2+sYNIPA1FKEJ4wpEUlBDl5lqY1qN0Q/I
         AU3g==
X-Forwarded-Encrypted: i=1; AJvYcCUfIyy6VUCcXUZll/yobkI/r8i5emlz1VGUaZhE58Kp8ytBnAQRR9zgeS2Cxd0vErxj7tkkcjhukRM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzf3DYaUIhb8ebro8Wjn3ToWjEWvrbPFYDd9xQDyBr1Khj8qCYn
	LRyS5hX5tFRT0SZyNnI/8xQdY+VWJhsd0e3s8y+SgUgDuHiupoJudsd3
X-Gm-Gg: AZuq6aIW37nAW5+rRHHQAlRmRQ+7hSl9Woc33VhQSzf9Ocj0m2a2SwSQrp2qYoq3b1E
	qQoVzyE3VIJRRIAJEk65q7CTWzmA8oZQyxeL1oUgVrHv4qoieRQON6xfgo3cSoMdB1qlxJ68NQq
	vKZrqaE8rkeAl2dS4Dpl6E5tZYamL2Y5xEqN0KIaslZOHF8zFNgHPcQZ9+4L+Mr58TARlroGvMx
	p+qoWZELtIWVf5V4WtteGBsgsxgl3s9HB+9Jz2OVZG91MEGac+3HK/d6DpikEix9biT/PiyZ7CO
	Ex7f/HwuWbRRJeW8OoloW/xqsq5K1QFYex2I41DUeBoYYHWlhsJQnhg1x9WF5Fr9JIJzzB/0tT1
	k4fYSF3BGpzpzFGf2QNM/Uqm8zNq5kDhqOKphtRwVAPuv8eYWt/3Aw3z0TUw211Kl818wvkJxJW
	zlCTeF71F1v24wjBNW7qfMLo2p7mFxwlcF+CMnsaMUCoW9LYDUhxsAp6nsbFJqUk/6n3dbuXRH/
	z/k18vn1dSAQg==
X-Received: by 2002:a05:600c:3b10:b0:471:700:f281 with SMTP id 5b1f17b1804b1-483a95e5b24mr189281825e9.25.1771929745076;
        Tue, 24 Feb 2026 02:42:25 -0800 (PST)
Message-ID: <5e4362ed-c310-442b-a742-ca7c3d1c47dc@gmail.com>
Date: Tue, 24 Feb 2026 11:42:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/14] xen/riscv: detect and store supported hypervisor
 CSR bits at boot
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1771590794.git.oleksii.kurochko@gmail.com>
 <4f36d83e58bfba807660ebc1fc48e71ae056805a.1771590794.git.oleksii.kurochko@gmail.com>
 <bf8d5b4f-937a-4d6f-86ba-1ab07f53eb51@suse.com>
 <e084cd6f-e76d-40c1-9e30-97e10acae012@gmail.com>
 <541a6c57-406c-49e5-8b8b-019e30bf0d89@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <541a6c57-406c-49e5-8b8b-019e30bf0d89@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E39481858E5
X-Rspamd-Action: no action


On 2/24/26 11:16 AM, Jan Beulich wrote:
> On 24.02.2026 10:44, Oleksii Kurochko wrote:
>> On 2/24/26 9:07 AM, Jan Beulich wrote:
>>> On 20.02.2026 17:18, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/domain.c
>>>> +++ b/xen/arch/riscv/domain.c
>>>> @@ -2,9 +2,39 @@
>>>>    
>>>>    #include <xen/init.h>
>>>>    #include <xen/mm.h>
>>>> +#include <xen/sections.h>
>>>>    #include <xen/sched.h>
>>>>    #include <xen/vmap.h>
>>>>    
>>>> +#include <asm/cpufeature.h>
>>>> +#include <asm/csr.h>
>>>> +
>>>> +struct csr_masks {
>>>> +    register_t hedeleg;
>>>> +    register_t henvcfg;
>>>> +    register_t hideleg;
>>>> +    register_t hstateen0;
>>>> +};
>>>> +
>>>> +static struct csr_masks __ro_after_init csr_masks;
>>>> +
>>>> +void __init init_csr_masks(void)
>>>> +{
>>>> +#define INIT_CSR_MASK(csr, field) do { \
>>>> +    register_t old; \
>>>> +    old = csr_read(CSR_##csr); \
>>> Can't this be the initializer of the variable? Can't ...
>> I agree that this is change is okay to be done but I am not sure about ...
>>
>>>> +    csr_set(CSR_##csr, ULONG_MAX); \
>>> ... csr_swap() be used here, too?
>> ... as after re-reading spec again I am not sure that we can do in this way
>> at all.
>>
>> Initially I used csr_set() instead of csr_swap() or csr_write() as csr_set() to
>> take into account a writability of the bit, so it won't touch a bit if it
>> is r/o.
> To me the spec isn't quite clear enough in this regard.
>
>> But it seems like this approach won't work with**WLRL or WPRI fields as these
>> fields aren't r/o,
> In the CSRs presently dealt with, are there any WLRL fields at all? (I don't
> think WPRI fields represent much of an issue for the purpose here.)

Agree, currently used CSRs in this function don't have WLRL feilds, but I suppose
we want to have the similar treatment (read WLRL fields and reuse what was read)
for WLRL fields as these fields expect only valid value and so all 1s for this
fields can be wrong to use.

>
>> but they only support specific value and for example:
>>
>> - Implementations are permitted but not required to raise an
>>     illegal-instruction exception if an instruction attempts to write a
>>     non-supported value to a WLRL field.
>> - For these reserved fields, software is required to preserve the existing
>>     values when writing to other fields in the same register. Overwriting them
>>     with 1s could be considered non-compliant behavior.
>>
>> So it seems like we can't just do csr_swap() with all 1s and it is needed
>> to pass a mask to INIT_CSR_MASK() which will tell which bits should be
>> ignored and don't touched.
>> For example, HENVCFG and HSTATEEN0 has WPRI fields.
>>
>> reserved_bits_mask = 0x1FFFFFFCFFFFFF00;
>> tmp = csr_read(HENVCFG);
>> tmp=(~reserved_bits_mask) |(tmp&reserved_bits_mask); csr_set(HENVCFG, tmp);
> What I find further concerning is that HSTATEEN0 also may have read-only-1
> fields. You don't currently cope with that, I think.

Because of this:
   A bit in an hstateen CSR cannot be read-only one unless the same bit is
   read-only one in the matching mstateen CSR.
?

I expect that it will be covered by csr_set() which will touch only writable
bits and ignore read-only. So doesn't matter if a bit is read only 1 or 0
it still shouldn't be in the final mask.

~ Oleksii



