Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PSOJl6MnWn5QQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 12:32:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A892186524
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 12:32:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239908.1541316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuqeS-0007MZ-VM; Tue, 24 Feb 2026 11:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239908.1541316; Tue, 24 Feb 2026 11:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuqeS-0007JS-SG; Tue, 24 Feb 2026 11:32:28 +0000
Received: by outflank-mailman (input) for mailman id 1239908;
 Tue, 24 Feb 2026 11:32:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuqeR-0007JM-0T
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 11:32:27 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e20069d-1174-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 12:32:25 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4837f27cf2dso46122585e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 03:32:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31b3e0dsm505537675e9.1.2026.02.24.03.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 03:32:24 -0800 (PST)
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
X-Inumbo-ID: 7e20069d-1174-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771932745; x=1772537545; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jLZOVcceKsquS566VW3znAXUsY+pw+n4Ex9lIEWo9S8=;
        b=f0Zk4uD6pYAgGOiznlWZ5X8jfOwYY5RUYQiO8/kbfjuJDV+NuAMBqEh5X5jai440iL
         loDqnSNmke9krs/dj+yf9Q7I3aVvvOMIzgeRMD45ThQCxxJ3uNT8emzDGPORVIgzHhWG
         ePTXLjM45Jd6UyULRa7GPP6e9dmYZ5MB3mJzIJdQNYLMkoUEanPbVqVfrLU3w0yQ388c
         swsOlcy8mqnHzEi2uwO4xADcMEaSTwHKmZSLnjjuFvZSc6vdSqLteG1Eqba5+7g5hLxL
         R/SUVgsc6d037a2srxH5p2FIPZhi3BiUhlrLXFuzcxnXM63l4D7CFgCWIvZClN3obhzH
         W7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771932745; x=1772537545;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLZOVcceKsquS566VW3znAXUsY+pw+n4Ex9lIEWo9S8=;
        b=auHzkz8eje2hP2ue7WABGNIKO153EwZubv4qYWEpmyy89f+yt7sAetb6P0fLGYYqbl
         qh7FHZhjxG+9DhNrSCtkmn2VRVLKwfkGfui6SF9l1g45ZfNt4JYaXv/B51VwKQdUaFet
         uK5XvaLzSuE9aEz8TKUw1HicnYyBlNKlT0KgPsd0QovdWvERFm8g147KRVYm4MKqSHk5
         28vhiPRyni/D5ykevECbiAVfEDplb4MU8cNhAJIFJPr/AHkTlnproUSfi8f0ejmwup5C
         tS9SoRrgzxdTsZ4Q3WGsifL+1XjUFD21yIyUwUokoLzYYfQP28hUiwiMKKSdZBJiG4hS
         qsqw==
X-Forwarded-Encrypted: i=1; AJvYcCUSgxgDnj7iHRopxW8GUGwFzR5CpWticp4zg0UXpjSvNWnfssN3Q9zik8vHmfDuqLpHWzocctB4qGY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyeApbAksb0GE1r9AAdEk/J5FDOM5uWWKAVoGiXFpZF/1HgSIvG
	Tr3QPtEX7uk4bovwwPIOffZeH+Txh67oCCB3CdqQ35HVP+Ay6YtUQ0Z5qyWTVc8Fmw==
X-Gm-Gg: AZuq6aIMXD89bHhCLUk9Bk2cI0gpX7iYU3TzFJO/QGapw6uneh7M++8jhAxfzJqJRIn
	eXf8Nj12lrCgm+ck2Q97AoToax8neYXH4oQHlJkMP8NHAIkC6REiTeqmNCilsMBTGHLrjb0a8B1
	FhhQOi47nHKRDV/t59QAKsgy2J493lhOeoklELOMvhaohYXOvi3nrOVLOUsGliZYeLbrXp8zkfO
	qa9fmEe5A/s3c65633vUmLV+NVUgFVNfbXstbbiz1CMYgX9qBaJ8+uLRjFawfvIrcqcH+8+Qwj0
	ADtGYolwFesT+YwauVBNyD5nyNCib/ehvdnWSk7A47HeWxOjljZ1kHK1ur3/0AzBxrA4MmwsFb/
	fwT/O65VR1EPt09hOy2vpXNKtDCjjVnG7UwJgkn+3f486NX21z9aemXT7XgQ03FNh7G5CVCgmos
	P5rueNGQxmC++RPXHINhh1R7OtknZhDPiE714sRiThGHYldevoNN5eptAU9vJLMbNUHiPu7cCU9
	mzPHOHE/vK5yDM=
X-Received: by 2002:a05:600c:3b0a:b0:47e:e2ec:9947 with SMTP id 5b1f17b1804b1-483a963df7amr199406065e9.33.1771932744875;
        Tue, 24 Feb 2026 03:32:24 -0800 (PST)
Message-ID: <1f2f7f37-0a2b-407f-918a-ac35cbbd5cd4@suse.com>
Date: Tue, 24 Feb 2026 12:32:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/14] xen/riscv: detect and store supported hypervisor
 CSR bits at boot
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <42847a9e-71e1-47a0-b4fb-7d8c91370bf4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.987];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0A892186524
X-Rspamd-Action: no action

On 24.02.2026 12:25, Oleksii Kurochko wrote:
> 
> On 2/24/26 11:47 AM, Jan Beulich wrote:
>> On 24.02.2026 11:42, Oleksii Kurochko wrote:
>>> On 2/24/26 11:16 AM, Jan Beulich wrote:
>>>> On 24.02.2026 10:44, Oleksii Kurochko wrote:
>>>>> On 2/24/26 9:07 AM, Jan Beulich wrote:
>>>>>> On 20.02.2026 17:18, Oleksii Kurochko wrote:
>>>>>>> --- a/xen/arch/riscv/domain.c
>>>>>>> +++ b/xen/arch/riscv/domain.c
>>>>>>> @@ -2,9 +2,39 @@
>>>>>>>     
>>>>>>>     #include <xen/init.h>
>>>>>>>     #include <xen/mm.h>
>>>>>>> +#include <xen/sections.h>
>>>>>>>     #include <xen/sched.h>
>>>>>>>     #include <xen/vmap.h>
>>>>>>>     
>>>>>>> +#include <asm/cpufeature.h>
>>>>>>> +#include <asm/csr.h>
>>>>>>> +
>>>>>>> +struct csr_masks {
>>>>>>> +    register_t hedeleg;
>>>>>>> +    register_t henvcfg;
>>>>>>> +    register_t hideleg;
>>>>>>> +    register_t hstateen0;
>>>>>>> +};
>>>>>>> +
>>>>>>> +static struct csr_masks __ro_after_init csr_masks;
>>>>>>> +
>>>>>>> +void __init init_csr_masks(void)
>>>>>>> +{
>>>>>>> +#define INIT_CSR_MASK(csr, field) do { \
>>>>>>> +    register_t old; \
>>>>>>> +    old = csr_read(CSR_##csr); \
>>>>>> Can't this be the initializer of the variable? Can't ...
>>>>> I agree that this is change is okay to be done but I am not sure about ...
>>>>>
>>>>>>> +    csr_set(CSR_##csr, ULONG_MAX); \
>>>>>> ... csr_swap() be used here, too?
>>>>> ... as after re-reading spec again I am not sure that we can do in this way
>>>>> at all.
>>>>>
>>>>> Initially I used csr_set() instead of csr_swap() or csr_write() as csr_set() to
>>>>> take into account a writability of the bit, so it won't touch a bit if it
>>>>> is r/o.
>>>> To me the spec isn't quite clear enough in this regard.
>>>>
>>>>> But it seems like this approach won't work with**WLRL or WPRI fields as these
>>>>> fields aren't r/o,
>>>> In the CSRs presently dealt with, are there any WLRL fields at all? (I don't
>>>> think WPRI fields represent much of an issue for the purpose here.)
>>> Agree, currently used CSRs in this function don't have WLRL feilds, but I suppose
>>> we want to have the similar treatment (read WLRL fields and reuse what was read)
>>> for WLRL fields as these fields expect only valid value and so all 1s for this
>>> fields can be wrong to use.
>>>
>>>>> but they only support specific value and for example:
>>>>>
>>>>> - Implementations are permitted but not required to raise an
>>>>>      illegal-instruction exception if an instruction attempts to write a
>>>>>      non-supported value to a WLRL field.
>>>>> - For these reserved fields, software is required to preserve the existing
>>>>>      values when writing to other fields in the same register. Overwriting them
>>>>>      with 1s could be considered non-compliant behavior.
>>>>>
>>>>> So it seems like we can't just do csr_swap() with all 1s and it is needed
>>>>> to pass a mask to INIT_CSR_MASK() which will tell which bits should be
>>>>> ignored and don't touched.
>>>>> For example, HENVCFG and HSTATEEN0 has WPRI fields.
>>>>>
>>>>> reserved_bits_mask = 0x1FFFFFFCFFFFFF00;
>>>>> tmp = csr_read(HENVCFG);
>>>>> tmp=(~reserved_bits_mask) |(tmp&reserved_bits_mask); csr_set(HENVCFG, tmp);
>>>> What I find further concerning is that HSTATEEN0 also may have read-only-1
>>>> fields. You don't currently cope with that, I think.
>>> Because of this:
>>>     A bit in an hstateen CSR cannot be read-only one unless the same bit is
>>>     read-only one in the matching mstateen CSR.
>>> ?
>>>
>>> I expect that it will be covered by csr_set() which will touch only writable
>>> bits and ignore read-only. So doesn't matter if a bit is read only 1 or 0
>>> it still shouldn't be in the final mask.
>> But the hypervisor view of the register value seen by guests won't be correct.
>> Recall that you moved to probing to make sure that the cached values we have
>> in the hypervisor properly match the values seen by the guest?
> 
> Then we have to store what csr_read(hstateen0) returns in struct csr_masks in
> new field hstateen0_ro_ones. And then in the next patch apply that new field
> in vcpu_csr_init():
>    v->arch.hstateen0 = hstateen0 & csr_masks.hstateen0 |
>                        csr_masks.hstateen0_ro_ones;
> 
> Are you okay with such changes?

Properly structured, sure. That's pretty much unavoidable, isn't it?

As to "structured", for example I wonder whether hstateen0_ro_ones isn't
going to lead to redundancies once further registers appear which may have
r/o-1 fields. Maybe there should be "ro_one" sub-struct right away?

And of course "structured" also touches on proper parenthesization of the
statement above.

Jan

