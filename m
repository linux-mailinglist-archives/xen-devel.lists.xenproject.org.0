Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EO4uGRQE4Wn6oQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 17:45:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB75E4112F3
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 17:45:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283716.1565859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDOtq-0006Zq-GF; Thu, 16 Apr 2026 15:45:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283716.1565859; Thu, 16 Apr 2026 15:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDOtq-0006YN-C1; Thu, 16 Apr 2026 15:45:02 +0000
Received: by outflank-mailman (input) for mailman id 1283716;
 Thu, 16 Apr 2026 15:45:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDOtn-0006YH-VN
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 15:45:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDOtn-00AMxm-CN
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 17:44:59 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e103f6-2eae-0a2a0a5409dd-0a2a45099750-8
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 17:44:59 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e103fb-2497-0a2a45090019-d1558033a5d5-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 17:44:59 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-488b8efed61so9204695e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 08:44:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f0eb43f6sm49494375e9.25.2026.04.16.08.44.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 08:44:58 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776354298; x=1776959098; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KAZrI0N7HZcn1PAYPBVu3LanJPoAKwvXSZ99aFDOlM0=;
        b=J/bVOgBgGLilM/mpdsFKo5Lkued8GXvKJM+bg69Tz6+/C69ptAXvQYnf6OPyGcKUJb
         Qp2Jf3KOIXqbBikivpnN7ELwh/BnFmNn6vTKc64LvBN4wBWjtA/ES9Ix2Hs65L1XFUB7
         nNFKD599B2BzABEwUXIdvI2W86yW/mi6IqZQKxk/ur77b0sdSs38rimJ6poUBRO+wZB3
         19xirDbInCTIyq4w/SXofuaH8o6ucB4K0BaWIKPpPUZYkehVXYWLcc0Eu830hjXB3Ydc
         17YVk+OrJmK5aEXKIL0czexJnXcovBkjy3pN2mVOpF8gzKpxSW/HOTbTEFMIIUMSZ0XC
         Sl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776354298; x=1776959098;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAZrI0N7HZcn1PAYPBVu3LanJPoAKwvXSZ99aFDOlM0=;
        b=hSRXN9vU2zefRrptRmqIK5FsC/mrfj1b+asC/sHqR/dNZ1MfWID/717gY3c0aXUwye
         t4MZxlSvTviEMCHsI3bHpZgJLOCPkAvupYIRulI+VkKpWLOXWGpEK7Y8a+RjU5AipAgn
         +ujXwN0fUVxYtMVEcozftAFrrQ+DmAQiql31IZ+Kt9Ii9DTHn7eUCBHkOZ6iBGirlEOe
         fl/cUBrK6YhhtZz84+QXUseJQnUvCGmInyXkOqnQO5y9gAKSSp0LS/Yv9wV2Z/TMn9z0
         9pSw2NTV47kUsQvsJidYYX/Mhcr7ZvxcRWVYhMnBvcn75XQDsU9Bw+SVCC0C7G7qX7fV
         O/pw==
X-Forwarded-Encrypted: i=1; AFNElJ9enXRfZaj19Rdqjh/MXmb0u/9xEGDgnZUAYfUTGZYu//ep7ASc2UyFY2soKxGSozJjkff4A9X7wd8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqHweqN/omq6X68Dy3NpcHYhEdYThwkceFy4b+SKwGGPNnftrR
	ATokk7ro/8PLwAxL7WglWfcaPzjnGXcWs91mhhMG5UJM5G5uSiAqVhPXlhmLJfuMTQ==
X-Gm-Gg: AeBDievVhYsR8No8rFHNH0Pmku7X9l2Th9jCWxzuuC/xSlLX26zjfbAXqNBaNGt3YwQ
	tKnkbRSj5rECAFA6vVH41K/CvCtn71O1eg1ny9if6xVQumuxZ7gMos+z7RqE73LeXfprlwMucaN
	0QcNAVQm3JTJNXAs1aGu7RmZBUbwTK1PZcDqocO2E7XDFc9P9nIeSt4rN8AtQ6oC7J/A4NKw0mi
	q7Y1/nPCmH/rwlRqMuhKWvOpPT9dldWFCp39+hlXbat5pUeb+aq0SmutY0PQiqoTW0vLJRYH+kN
	LebBS7DBxkcf+jJFFhY3T6hSYor8AEQqYfHlzuBC006u0nyxHZoXNhGskQwYLmr9gwrxCCiCmLs
	SCqoRxvwEZGr53ChYAJ0uk5AcNgW15Fx9oDcAddQIwSu1n5Lz06++JGB+8dj1mxFB3tWX8FMZ7b
	vcwTSYt7Da/io32UyEeD4jqNq8hws26J9oxOXxT7ga0gLpt0W8KXromAXDya88m899CUXyNCWv1
	dNTI+g2Rzjj4GJ6JETRFZCZxA==
X-Received: by 2002:a05:600c:3e0a:b0:488:c6e9:1e0c with SMTP id 5b1f17b1804b1-488f47c90ddmr55471825e9.5.1776354298598;
        Thu, 16 Apr 2026 08:44:58 -0700 (PDT)
Message-ID: <9579ca3e-e98b-4d76-81bf-0f2e0df5a990@suse.com>
Date: Thu, 16 Apr 2026 17:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: allow Xen to use SSTC while hiding it from
 guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <eba232ac5a338332ddedc2cb084e0c04ee8744c2.1775835741.git.oleksii.kurochko@gmail.com>
 <9eb6c6d9-8e1c-40f6-a44b-579df213bda0@citrix.com>
 <feee06f0-584a-4b2c-b761-c3b77627c26d@suse.com>
 <3c8cba0b-8d9c-4656-b70e-f5c65017aecc@gmail.com>
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
In-Reply-To: <3c8cba0b-8d9c-4656-b70e-f5c65017aecc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1776354299-92F76A53-60F5083A/0/0
X-purgate-type: clean
X-purgate-size: 2133
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,vates.tech,amd.com,xen.org,citrix.com,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,citrix.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.996];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CB75E4112F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16.04.2026 17:37, Oleksii Kurochko wrote:
> 
> 
> On 4/16/26 9:50 AM, Jan Beulich wrote:
>> On 10.04.2026 19:41, Andrew Cooper wrote:
>>> On 10/04/2026 4:45 pm, Oleksii Kurochko wrote:
>>>> diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
>>>> index 7efa76fdbcb1..80f0e9ddae6a 100644
>>>> --- a/xen/arch/riscv/time.c
>>>> +++ b/xen/arch/riscv/time.c
>>>> @@ -91,4 +90,23 @@ void __init preinit_xen_time(void)
>>>>           panic("%s: ACPI isn't supported\n", __func__);
>>>>   
>>>>       boot_clock_cycles = get_cycles();
>>>> +
>>>> +    /* set_xen_timer must have been set by sbi_init() already */
>>>> +    ASSERT(set_xen_timer);
>>>> +
>>>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_sstc) )
>>>> +    {
>>>> +        set_xen_timer = sstc_set_xen_timer;
>>>> +
>>>> +        /*
>>>> +         * A VS-timer interrupt becomes pending whenever the value of
>>>> +         * (time + htimedelta) is greater than or equal to vstimecmp CSR.
>>>> +         * Thereby to avoid spurious VS-timer irqs set vstimecmp CSR to
>>>> +         * ULONG_MAX.
>>>> +         */
>>>> +        csr_write(CSR_VSTIMECMP, ULONG_MAX);
>>>> +#ifdef CONFIG_RISCV_32
>>>> +        csr_write(CSR_VSTIMECMPH, ULONG_MAX);
>>>> +#endif
>>>
>>> You've got this pattern twice in this patch alone, and these aren't the
>>> only CSRs which are formed of pairs to get a 64bit value in 32bit mode.
>>>
>>> Sadly, the numbering isn't consistent for the high constant, but we can
>>> let the compiler do most of the hard work for us.
>>>
>>> #ifdef CONFIG_RISCV_32
>>> # define __csr_write32h(csr, val) csr_write(csr ## H, (val) >> 32)
>>> #else
>>> # define __csr_write32h(csr, val) (void)(csr, val)
>>
>> Just to mention: Since the comma is an operator here (not a lexical element
>> separating function arguments), more parenthesization may be needed for
>> Misra's sake.
> 
> I will define it in the next way:
> 
> # define __csr_write32h(csr, val) (void)((csr), (val))

Actually, yet more parentheses are needed:

# define __csr_write32h(csr, val) ((void)((csr), (val)))

Jan

