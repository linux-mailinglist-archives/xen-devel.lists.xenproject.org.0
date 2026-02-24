Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJVHKHuTnWlKQgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 13:03:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E37186B32
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 13:03:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239968.1541394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vur7k-0005gW-FQ; Tue, 24 Feb 2026 12:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239968.1541394; Tue, 24 Feb 2026 12:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vur7k-0005f3-CG; Tue, 24 Feb 2026 12:02:44 +0000
Received: by outflank-mailman (input) for mailman id 1239968;
 Tue, 24 Feb 2026 12:02:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1YgY=A4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vur7j-0005ex-1g
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 12:02:43 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7eb4670-1178-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 13:02:40 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b90bc00578cso207332266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 04:02:40 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9084c82495sm408667166b.20.2026.02.24.04.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 04:02:39 -0800 (PST)
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
X-Inumbo-ID: b7eb4670-1178-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771934560; x=1772539360; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9qLpnjBWurlI7DiPjVUDT7lRny6FroAeredn3l5Iyyw=;
        b=WCrg4g4YwWU6VhKqqLZE3yCgYK0oeCchpa5leaZ4NwC/Mx7+GXLP+WSoqSZWk6cxTH
         YdP4d1yo294iU8Zwr+iy6gaM35l0ctbTaqeCQbPqzoCt2eAAd8c4j/+NGjGWhZ3u3Mit
         4wRSLv6+BLfSwxMrjt/d+3vbEVN8TP92r1cyeGYDIhupRkzHb69Tis0zTk/mt1/MCzjM
         nPsrA98B4HTQW5Cnbn83IdQrGGtCjPcAT+a0BXoONBOCWdIqsIQZIUIynWp9CuP4ZSgB
         +trovc8tdy7CaB+qE/0W/khrZJ6MZTxrOkuwZIg0CBzOrZ+gdkKMqDmX2g8S5EsZv3uc
         weSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771934560; x=1772539360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qLpnjBWurlI7DiPjVUDT7lRny6FroAeredn3l5Iyyw=;
        b=aR7i2VF/ZRoBgqYcDCPuPQN4ROXg94td9pE1ZIunG7h/GwR0uJF9V5zExbIbNu+gAb
         G7JFfBz1dpt5nWCs0Wr7i6IzT1CdCIUhZf9vuGoArZ53zM76EXWo+iNQkGlI+LoyUwE7
         4dAGH3xfbCwA7OHrV+3475kzXwdDAxhXZYVjEohlK+BftZt/E5MNEGLpBIcijRXckzxS
         dAtBX6Z4FOotOLEH0aDv/s18zxbekgCNqSDS77XgAfwXDJNe73jUdIHPmQlPUqkPzVzQ
         BOgvLrNTx2dpkQmEmMuNmh+FO9ZaK5dCJ5OAUJujgb0SEJzPkzBofiXU//H6NVMDwgvv
         jF8A==
X-Forwarded-Encrypted: i=1; AJvYcCXPxcsb/3SzhLEkKz+uRB23OZPluM1MOJmFyEKDIXU49l2q0f7Nu4XlvFk+gVD5xUtodJDG20CBQZQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+Ij0yFq8/F69yCtO/xr2DNG72ZhrReRSBNl179YgYYyWjQzXK
	IQWroXJThuZvDHG0yCyUbnCnKTdHZ5lTkBLCXkNeRt5tUGZzmAYCK8GPOXAo2A==
X-Gm-Gg: AZuq6aL8yH5WJF8dXVkPTRzx4+jYoaqaFIPG+fOEeUmm/lAvNTSi3V1HmyGsua1FL3y
	6ItnlernbOMCD3+qs4IY7ABT+7TKku5SJSgSRgSCoH3bLdLDiFfSOrIWhJ7NH5lWTo/XmFvz6u4
	yeZhfsPxCiyYAgJhCq2mVk7ncRsfJB4zP+JQv3qooeU99O1r7ozERpDFEjcPr7QEMZ+i/VM48EI
	uF6PUPEXB3A/q9baMkH06dxad73Lg8SK0vayQOWEggj8KDDEJK+7v5P6WZTVu0IxMBL8pJvPeBq
	Cfa8fz1Ns2/jZqJThFmrJLTIfnb8TsTkwUoyWwz6b9Qfbzn6R8g92i91UCcNgdYbs8sqqo6ETsU
	7FYcPC+2NpIFmD75+wq2C+U7JZdBh2GTXjNBkFb6RS3zjWYmt4PiB+JucOQYfftdFXBz9KZ/FW5
	y1pjyIetE1WlDxLO1g77xF1CNasAae/tAO0tFXx7Dtd72QixT+g/asyjGdAKjuQ1XTBZ818/iVt
	thKNsI=
X-Received: by 2002:a17:906:eec7:b0:b87:117f:b6f0 with SMTP id a640c23a62f3a-b9081b23d01mr670549966b.30.1771934559585;
        Tue, 24 Feb 2026 04:02:39 -0800 (PST)
Message-ID: <42da5eb2-06fb-49aa-8383-cb31f83c3933@gmail.com>
Date: Tue, 24 Feb 2026 13:02:38 +0100
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
 <5e4362ed-c310-442b-a742-ca7c3d1c47dc@gmail.com>
 <c388593e-8371-4040-a179-c0bf32ae0696@suse.com>
 <42847a9e-71e1-47a0-b4fb-7d8c91370bf4@gmail.com>
 <1f2f7f37-0a2b-407f-918a-ac35cbbd5cd4@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1f2f7f37-0a2b-407f-918a-ac35cbbd5cd4@suse.com>
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
	NEURAL_HAM(-0.00)[-0.998];
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
X-Rspamd-Queue-Id: 00E37186B32
X-Rspamd-Action: no action


On 2/24/26 12:32 PM, Jan Beulich wrote:
> On 24.02.2026 12:25, Oleksii Kurochko wrote:
>> On 2/24/26 11:47 AM, Jan Beulich wrote:
>>> On 24.02.2026 11:42, Oleksii Kurochko wrote:
>>>> On 2/24/26 11:16 AM, Jan Beulich wrote:
>>>>> On 24.02.2026 10:44, Oleksii Kurochko wrote:
>>>>>> On 2/24/26 9:07 AM, Jan Beulich wrote:
>>>>>>> On 20.02.2026 17:18, Oleksii Kurochko wrote:
>>>>>>>> --- a/xen/arch/riscv/domain.c
>>>>>>>> +++ b/xen/arch/riscv/domain.c
>>>>>>>> @@ -2,9 +2,39 @@
>>>>>>>>      
>>>>>>>>      #include <xen/init.h>
>>>>>>>>      #include <xen/mm.h>
>>>>>>>> +#include <xen/sections.h>
>>>>>>>>      #include <xen/sched.h>
>>>>>>>>      #include <xen/vmap.h>
>>>>>>>>      
>>>>>>>> +#include <asm/cpufeature.h>
>>>>>>>> +#include <asm/csr.h>
>>>>>>>> +
>>>>>>>> +struct csr_masks {
>>>>>>>> +    register_t hedeleg;
>>>>>>>> +    register_t henvcfg;
>>>>>>>> +    register_t hideleg;
>>>>>>>> +    register_t hstateen0;
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +static struct csr_masks __ro_after_init csr_masks;
>>>>>>>> +
>>>>>>>> +void __init init_csr_masks(void)
>>>>>>>> +{
>>>>>>>> +#define INIT_CSR_MASK(csr, field) do { \
>>>>>>>> +    register_t old; \
>>>>>>>> +    old = csr_read(CSR_##csr); \
>>>>>>> Can't this be the initializer of the variable? Can't ...
>>>>>> I agree that this is change is okay to be done but I am not sure about ...
>>>>>>
>>>>>>>> +    csr_set(CSR_##csr, ULONG_MAX); \
>>>>>>> ... csr_swap() be used here, too?
>>>>>> ... as after re-reading spec again I am not sure that we can do in this way
>>>>>> at all.
>>>>>>
>>>>>> Initially I used csr_set() instead of csr_swap() or csr_write() as csr_set() to
>>>>>> take into account a writability of the bit, so it won't touch a bit if it
>>>>>> is r/o.
>>>>> To me the spec isn't quite clear enough in this regard.
>>>>>
>>>>>> But it seems like this approach won't work with**WLRL or WPRI fields as these
>>>>>> fields aren't r/o,
>>>>> In the CSRs presently dealt with, are there any WLRL fields at all? (I don't
>>>>> think WPRI fields represent much of an issue for the purpose here.)
>>>> Agree, currently used CSRs in this function don't have WLRL feilds, but I suppose
>>>> we want to have the similar treatment (read WLRL fields and reuse what was read)
>>>> for WLRL fields as these fields expect only valid value and so all 1s for this
>>>> fields can be wrong to use.
>>>>
>>>>>> but they only support specific value and for example:
>>>>>>
>>>>>> - Implementations are permitted but not required to raise an
>>>>>>       illegal-instruction exception if an instruction attempts to write a
>>>>>>       non-supported value to a WLRL field.
>>>>>> - For these reserved fields, software is required to preserve the existing
>>>>>>       values when writing to other fields in the same register. Overwriting them
>>>>>>       with 1s could be considered non-compliant behavior.
>>>>>>
>>>>>> So it seems like we can't just do csr_swap() with all 1s and it is needed
>>>>>> to pass a mask to INIT_CSR_MASK() which will tell which bits should be
>>>>>> ignored and don't touched.
>>>>>> For example, HENVCFG and HSTATEEN0 has WPRI fields.
>>>>>>
>>>>>> reserved_bits_mask = 0x1FFFFFFCFFFFFF00;
>>>>>> tmp = csr_read(HENVCFG);
>>>>>> tmp=(~reserved_bits_mask) |(tmp&reserved_bits_mask); csr_set(HENVCFG, tmp);
>>>>> What I find further concerning is that HSTATEEN0 also may have read-only-1
>>>>> fields. You don't currently cope with that, I think.
>>>> Because of this:
>>>>      A bit in an hstateen CSR cannot be read-only one unless the same bit is
>>>>      read-only one in the matching mstateen CSR.
>>>> ?
>>>>
>>>> I expect that it will be covered by csr_set() which will touch only writable
>>>> bits and ignore read-only. So doesn't matter if a bit is read only 1 or 0
>>>> it still shouldn't be in the final mask.
>>> But the hypervisor view of the register value seen by guests won't be correct.
>>> Recall that you moved to probing to make sure that the cached values we have
>>> in the hypervisor properly match the values seen by the guest?
>> Then we have to store what csr_read(hstateen0) returns in struct csr_masks in
>> new field hstateen0_ro_ones. And then in the next patch apply that new field
>> in vcpu_csr_init():
>>     v->arch.hstateen0 = hstateen0 & csr_masks.hstateen0 |
>>                         csr_masks.hstateen0_ro_ones;
>>
>> Are you okay with such changes?
> Properly structured, sure. That's pretty much unavoidable, isn't it?
>
> As to "structured", for example I wonder whether hstateen0_ro_ones isn't
> going to lead to redundancies once further registers appear which may have
> r/o-1 fields. Maybe there should be "ro_one" sub-struct right away?

Maybe, it makes sense. I will then update the csr_masks structure in the
following way:

struct csr_masks {
     register_t hedeleg;
     register_t henvcfg;
     register_t hideleg;
     register_t hstateen0;
     
     struct {
         hstateen0;
     } ro_one;
};

>
> And of course "structured" also touches on proper parenthesization of the
> statement above.

According to https://en.cppreference.com/w/c/language/operator_precedence.html
& has bigger priority, so I haven't put parenthesizes.

~ Oleksii


