Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TU6TCjV6ImqBYAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:26:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8924D645F42
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:26:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=XEm9Nx1M;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1329048.1593256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVOwM-0001jO-Tz; Fri, 05 Jun 2026 07:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329048.1593256; Fri, 05 Jun 2026 07:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVOwM-0001i3-R2; Fri, 05 Jun 2026 07:26:02 +0000
Received: by outflank-mailman (input) for mailman id 1329048;
 Fri, 05 Jun 2026 07:26:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wVOwL-0001hm-Bm
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:26:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVOwK-004uJv-Om
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:26:00 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a227a01-2eae-0a2a0a5409dd-0a2a4506ab6e-6
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:26:00 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a227a08-7371-0a2a45060019-d155802cc881-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:26:00 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490a76757e5so10623975e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 00:26:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3cc140sm159201625e9.9.2026.06.05.00.25.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 00:25:59 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780644360; x=1781249160; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4rEVsM+ReYfK3RdkhMqIdEKJm4BV0zcJgPss6/u52HU=;
        b=XEm9Nx1MNYwwGYda8YpnfBlG0JnZUJv6gTcPd/y7DhqOCVsPjLP74vtFvjYjN0YKw5
         zzoA6V1ha0WrXyjRZz3IkOYyiDFHkEmcIuYJNMpToUc8hdJbxAOBcVvptCtg3m/9AoX0
         BDV45l2TcKFw3A1/21TnLUHlKdQn9PfbNXVVg+FpjF4BRJolEIE7r08f/DBhty1JgyvZ
         g+Zbm6OVtl3SZQgIctHCd/W4uwxypgiO/Aj9Iy6jByYJ6wp+C4FBfHZErclFTLNY0gUc
         bSGrwllvO37Ke335dXkfPZGoRTf//A6NiT61Soy0tta4MoNnzFwzEeAGXhiwLahdbF/8
         miYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780644360; x=1781249160;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rEVsM+ReYfK3RdkhMqIdEKJm4BV0zcJgPss6/u52HU=;
        b=fvdmOw3nK6KVHGZyXR4JFTJrm4LDf+NZTkFxnnSNrrj2bt1uaNcqjqKqHmKov//cmR
         9XBW/i4qGhGeUNs+SUEq3rwMhH7JSHEPFMimTvO9ZrioBz3XV/z4AG8gja7Y9Ez9IZoU
         yZ03+h4pxSVgbovj52wNw2gwo53cwB/snhMsIi50wPYPrfUFe/uqulvvc5nrz3WcVjXE
         Rvm4i0fBmOU0peIk4VWttq1pQO6ZK5Em+9+GXsUWbtkJsTeQwpYgQhZuJ0bQaz05ltDH
         YYlLkemIqELrWUUv/Fd1Q6BxCvssKjgJ2qfye66ZJpvbwD0/pLVf9OuJwTfFMZOvBHsy
         TuHA==
X-Forwarded-Encrypted: i=1; AFNElJ8afOWrScpSaSY7UQj3OByLplZrKHj3fdX4LSNZnjcHWWndC3qypAavj5Obq0IXAeaZWFK2lOiuM2g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrMrLO+d6nQcgaglBz93QEjPjE7eeLVf0JFAPSFR+l8F6Vn6Hq
	wUwKePj9Mxt0stSgZr7i/9G0OU4xZPIRShl/RWUhQp/4NQWBBctKw/zm9m5Kxf8ZyQ==
X-Gm-Gg: Acq92OHxyW4zLXvufHCv+oNm/I97cFK98I+byPTdddIZDy+ANjuKxOMuj2XK+6+qh4T
	uqzirDmElXPEwthg8Bksap7LhPLydZVTEiuql+wyi9QXFo85bkMREoXbaGgP3Yr6p2tFvHCfqYn
	nUhTjME5jEBlo3rr9+A4GdMgp6xq9IWLOEJrJ5erWOctZpFnUrQdD6/GPMLSV/KO4KhpMzfBCAh
	rPRxN9H0Ng5sttl0tcJgbm2XvY1LGqQdtRIrZLiLkLp7UJntI4Jl2aMEBtFHaY4li4PPBlVYOgY
	YMAd61wpMv2j12iWa7i0qoFIdUruOk58Xwnau6lCrfDg6hLOTU6pE3NTyZB/BXwJeFeasRtUTUE
	qDDRpPtmx5fWAGDyTAP8GqsH/WXmD07TfPUey1vVGeoUWOu+FCa4nqWjNMSL1W5n8JnXLqiPQEe
	WviwaXyCtIVgcz2cXJ58V5LXKDzd0kZqiAboEApdXqiKRhCgOrukirIqRxkYALDOr4ttBJGP6/G
	eapIX/1A2hnqQ3iy3hu9P+1gg==
X-Received: by 2002:a05:600c:c3dc:20b0:490:c2a2:b1d4 with SMTP id 5b1f17b1804b1-490c2a2b3d1mr17539105e9.35.1780644360062;
        Fri, 05 Jun 2026 00:26:00 -0700 (PDT)
Message-ID: <9236d2d8-a553-4d2e-a924-42a454346620@suse.com>
Date: Fri, 5 Jun 2026 09:26:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/26] xen/riscv: introduce (de)initialization helpers
 for vINTC
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <fc5560cd49a2b952ce7724c23e41da3368833d9f.1778250616.git.oleksii.kurochko@gmail.com>
 <b95f7093-9ae8-4461-95d5-3c4b8a69c62d@suse.com>
 <003f5317-7669-484f-8095-4e48eedc102d@gmail.com>
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
In-Reply-To: <003f5317-7669-484f-8095-4e48eedc102d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1780644360-84F63D75-3BF59685/0/0
X-purgate-type: clean
X-purgate-size: 2290
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:from_mime,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8924D645F42

On 04.06.2026 13:33, Oleksii Kurochko wrote:
> On 6/3/26 5:00 PM, Jan Beulich wrote:
>> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/intc.c
>>> +++ b/xen/arch/riscv/intc.c
>>> @@ -11,6 +11,7 @@
>>>   
>>>   #include <asm/aia.h>
>>>   #include <asm/intc.h>
>>> +#include <asm/vaplic.h>
>>>   
>>>   static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
>>>   
>>> @@ -94,3 +95,38 @@ int __init make_intc_domU_node(struct kernel_info *kinfo)
>>>   
>>>       return -EOPNOTSUPP;
>>>   }
>>> +
>>> +int domain_vintc_init(struct domain *d)
>>> +{
>>> +    int ret = -EOPNOTSUPP;
>>> +    const enum intc_version ver = intc_hw_ops->info->hw_version;
>>
>> Again - why would what the underlying hardware has control what all domains
>> get?
> 
> If host uses AIA (APLIC/IMSIC) compatible controller then guest should 
> use virtual AIA compatible controller, shouldn't it?
> 
> I don't think that it is a case when host uses PLIC interrupt controller 
> but guests are going to use virtual APLIC.

Well, this may be a present restriction, but once you want to support migration
(and different IC models), I guess you won't get around such.

>>> +    switch ( ver )
>>> +    {
>>> +    case INTC_APLIC:
>>> +        ret = domain_vaplic_init(d);
>>> +        break;
>>> +
>>> +    default:
>>> +        printk("vintc (ver:%d) isn't implemented\n", ver);
>>
>> If we take this path for whatever reason, ...
>>
>>> +        break;
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +void domain_vintc_deinit(struct domain *d)
>>> +{
>>> +    const enum intc_version ver = intc_hw_ops->info->hw_version;
>>> +
>>> +    switch ( ver )
>>> +    {
>>> +    case INTC_APLIC:
>>> +        domain_vaplic_deinit(d);
>>> +        break;
>>> +
>>> +    default:
>>> +        printk("vintc (ver:%d) isn't implemented\n", ver);
>>
>> ... we're also going to take this path (very quickly afterwards), just to
>> get the same message twice without it being clear why it appears twice.
> 
> I missed to add printk("%s: ...", __func__, ...). I will update 
> correspondingly if we will follow this way.

That's not quite what I was after, though. I question the need for this latter
message.

Jan

