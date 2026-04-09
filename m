Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLT1FaKi12kUQQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 14:59:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A78193CAADC
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 14:59:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277316.1562556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAoyH-0005OM-F6; Thu, 09 Apr 2026 12:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277316.1562556; Thu, 09 Apr 2026 12:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAoyH-0005LW-Bz; Thu, 09 Apr 2026 12:58:57 +0000
Received: by outflank-mailman (input) for mailman id 1277316;
 Thu, 09 Apr 2026 12:58:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAoyF-0005LQ-Oe
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 12:58:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAoyE-001khg-KR
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:58:54 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d7a285-5cb7-0a2a0a5109dd-0a2a4503d516-16
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 14:58:54 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7a28e-02b3-0a2a45030019-d1558029c5d0-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 14:58:54 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so5482005e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 05:58:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2c5468sm66151539f8f.13.2026.04.09.05.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 05:58:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1775739534; x=1776344334; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s7UQ6fqoa1IViPHvjLpVDgn/Z+L61hz8IqLcvWYmV1M=;
        b=KcRVVA54sD/5N93OodIIbT82gpHYFcz9PTzy0GBBD5GYBn8fH6kgX8Vc4IpqNaWdaN
         OkhknpxqNqYtgQM3sdgVsDo1Fl7oh9iunZQMrQdhut//iy682KOJ9Z7Ztrh24zH9i2NX
         RSwpk+2qX1lWSwfCCYV40CZzOJBJA5lU1etoKBGHX3I5DzscEwk2KEcXMKsIzMM2nfhf
         qsIykB7H9N8FMJtoNJDv4RnZjH5OtC1hBBVoRprplZ+StNv14spHFv/wZen3EnbnkNfE
         kQ9lfVX9rHdtLUVkNAIeDHdLWMsN2rokM5DV4ed7sh/drBxcNFlEr5oczBZp6kdI1RXY
         35Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775739534; x=1776344334;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7UQ6fqoa1IViPHvjLpVDgn/Z+L61hz8IqLcvWYmV1M=;
        b=hi7NtyLXTFCC/13xhj6HMh44Lp9E2oflG4saBPQYRzMxcDALwfnwmZKVh7VLHrIeof
         u7lm91BqCrxzThqM6AMdcpy40AzAA5dZskX1auWcoNRq/yBdVrIHGoFxdMxjfAxQRRNO
         hbsRVsAFU4vZTF5kNu4zKJ4rhXfNATismkcrqm8aMudIIij74Xv5SOnJxynfCjqJY8s/
         Fu7GBVeXUsg7Y7RFztb5nosG38e1Ple65AhTUoFiHXgJq+yNOJm+Jao7qN+fm/Mlk+TC
         i73XetaJ/Rq96mA8coVkVIvtSchjnPGlfUfEDSQVGAL+Nv5D4JxZDbECZ+QOse9UMn/w
         HLJw==
X-Forwarded-Encrypted: i=1; AJvYcCWJN+Ez5/LAhZsZZP4APA/1FkUWACxzRl2h3uVbpTsYjKBqyNOZulJz6eysCFRfh/WW7eXuSUF1I0c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKjF0RsZKvStnPYS2AR7EDmtdP1jneV7ddEtkDrWwJsMyv0H4R
	nzhPCqb67M6/gC1OK23SAIcGxFDLY/f4wwwQKzUjJvW0uOpUDdel/bn0w2gMQV5VUQ==
X-Gm-Gg: AeBDieuTsoKdq8zplqScOjb3qecKfpzrlQgcqZCg1s/feWPXL4+Y8/cF/zZB9Ha0civ
	3IFqe+bkFYzOJDLZCWCfq/BeYay4WVV1Dq1p7iBlR793FDZ7UznWIrDjaAj7aD3Fg9BC/j2TnwQ
	9Bl9a6RNi0LPigDocygj6Q+Wg1GS9IzFr5nfBnMqCPSDrkIQHKWzAkTvs+whoJSiUHsJcpjo1SR
	UDj+5y4WV5FQUs6a9TJdL3z9hZ4NMt4Z9Fjp9LSxxuo7SuOOTZJW30w/h/cTxwrjlR/m04Twe+L
	VLp6cW02riboQop9cnx16oZK+92rlmV7SmrQF3z+NoFHwPdac7c/u+YL/1u9QDiS+cGelwb0WIC
	OTcijmf/oeP/P6/G5T9VVL/Jxi15w6rG8o/cetmws/6Yr+HV78d87Z9pUqczTW4QDuCU3gsFFIS
	0UuJUZ0EzHR83sIVpkXJRzIy0SAV3yVLIUyPwqTk7tb8QOa7fK0BgolFHRaShu0ByDTA0NsxZTe
	TI52uIAyL9h8S0=
X-Received: by 2002:a05:600c:350e:b0:486:ffa3:594 with SMTP id 5b1f17b1804b1-488ccffa76bmr52705295e9.23.1775739533843;
        Thu, 09 Apr 2026 05:58:53 -0700 (PDT)
Message-ID: <c3e20570-6dbf-4dd9-86de-d334e0f71f3a@suse.com>
Date: Thu, 9 Apr 2026 14:58:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/27] xen/riscv: Implement construct_domain()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <3a86599284108e6f2a27488a03145f8dd1b71def.1773157782.git.oleksii.kurochko@gmail.com>
 <cd1fa52a-0ff2-4b7f-9b0b-c33b6a01b6c8@suse.com>
 <95fc62d9-cfd4-4b75-a9b0-7e90c9ba1095@gmail.com>
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
In-Reply-To: <95fc62d9-cfd4-4b75-a9b0-7e90c9ba1095@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1775739534-41311C9A-458187A4/0/0
X-purgate-type: clean
X-purgate-size: 3741
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
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
X-Rspamd-Queue-Id: A78193CAADC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.04.2026 13:26, Oleksii Kurochko wrote:
> On 3/24/26 10:37 AM, Jan Beulich wrote:
>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/domain-build.c
>>> @@ -0,0 +1,46 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +
>>> +#include <xen/fdt-domain-build.h>
>>> +#include <xen/fdt-kernel.h>
>>> +#include <xen/init.h>
>>> +#include <xen/sched.h>
>>> +
>>> +#include <asm/current.h>
>>> +#include <asm/guest_access.h>
>>> +
>>> +int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>>
>> Are you actually altering what kinfo points to?
> 
> Not directly in this function, but it could be altered, for example, by 
> kernel_image_load() where "info->entry = load_addr" is happening.

Ah, I see.

>>> +{
>>> +    struct vcpu *v = d->vcpu[0];
>>> +    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(v);
>>> +
>>> +    BUG_ON(d->vcpu[0] == NULL);
>>
>> Why not simply "!v"?
> 
> It could work. I'll apply that.
> 
>>
>> Also, while in the cover letter you state a dependency on another series,
>> this is somewhat unwieldy here. From the titles there I can't deduce which
>> of the patches would introduce vcpu_guest_cpu_user_regs(). Yet I would
>> have wanted to double check that it doesn't de-reference v already.
> 
> It was already merged. It was part of:
>   xen/riscv: implement vcpu_csr_init() "02b3a1b0e53c"

Oh, indeed. Which makes clear that the BUG_ON() comes too late.

>>> +    BUG_ON(v->is_initialised);
>>> +
>>> +    kernel_load(kinfo);
>>> +    initrd_load(kinfo, copy_to_guest_phys);
>>> +    dtb_load(kinfo, copy_to_guest_phys);
>>
>> These all return void, despite this also being used for non-Dom0. Is it
>> really fatal to a dom0less system if one out of many domains fail to be
>> built?
> 
> For a dom0less system, my opinion is that it should not be fatal, it 
> should simply ignore a domain that fails to build and continue with the 
> rest. However, with the current common dom0less code it will just 
> panic(). This is a behavior I would like to change and it is on my TODO 
> list.
> 
> Regarding the functions returning void, this is because all of them 
> currently call panic() on failure, which I expect will need to change in 
> order to ignore a domain that fails to build in dom0less mode.
> 
> For the current implementation of the common dom0less code this is fine, 
> but I agree it should be addressed in a separate patch series.
> 
>   Especially when, despite the name, there is a Dom0?
> 
> For this case, a failure there should indeed be fatal, so panic() is 
> appropriate.

I think you misunderstood. I wasn't referring to the building of Dom0
failing. Was rather emphasizing that when there is a Dom0, failure to
create a DomU likely should even less so be fatal, as Dom0 could later
rectify the situation.

>>> +    regs->sepc = kinfo->entry;
>>> +
>>> +    /* Guest boot cpuid = 0 */
>>> +    regs->a0 = 0;
>>> +    regs->a1 = kinfo->dtb_paddr;
>>> +
>>> +    for ( unsigned int i = 1; i < d->max_vcpus; i++ )
>>> +    {
>>> +        if ( vcpu_create(d, i) == NULL )
>>> +        {
>>> +            printk("Failed to allocate %pd v%d\n", d, i);
>>> +            break;
>>
>> And no error is indicated to the caller?
> 
> No, as generally it is enough to have only one vCPU0 to run domain, so 
> we have to print that something went wrong with allocation of vCPU1...n 
> but it is okay to me to continue domain construction.

Hmm, now that I look there, sched_setup_dom0_vcpus() ignores errors
and doesn't even emit a log message. Question is why neither Arm nor
RISC-V use that function, when we have it.

Jan

