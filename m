Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEC3Hiwu5mliswEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 15:46:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE1442C3E1
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 15:46:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285978.1567108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEowr-0002RD-UM; Mon, 20 Apr 2026 13:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285978.1567108; Mon, 20 Apr 2026 13:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEowr-0002OA-RM; Mon, 20 Apr 2026 13:46:01 +0000
Received: by outflank-mailman (input) for mailman id 1285978;
 Mon, 20 Apr 2026 13:46:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wEowq-0002O4-2B
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 13:46:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEowp-00DaBs-FH
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:45:59 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e62e14-e002-0a2a0a5209dd-0a2a450a98be-6
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 15:45:59 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e62e17-56b3-0a2a450a0019-d1558034cdc3-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 15:45:59 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso32569025e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 06:45:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ffc5e3f4sm125633015e9.2.2026.04.20.06.45.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 06:45:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1776692759; x=1777297559; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTTnzvyU8PLfPdh75XRcNkDGJ3pyY3Z7kiTT8cTCans=;
        b=EPLuBcJPi+TArttzY/oVpRmRzSXLZ2WmoaCoBwy0La8o0m3pchIX4zhTdjvon1FBuI
         1gJZKGEFUmjljxdh5m49X/8mpqb+6AbV/8Gsc2J7bzdl/G3aAj7tDSIQbdUfr/I2OGvN
         xWdugUg4qi0fGCxq66bqWlbjxG0iqOXfjVhbwTqa2tr2Z6YAbly/oEhag8PDb4tErW07
         tLSloTxIV/nr6SjLvfbt8rSB5WpGZeszEjvMew6P5RPkB+FDRbOzrRPPN3e/JQM7JPtK
         KJOJAYr02mgs7LF1TvvSr+Gt/wqu3HSPVuUJ7MEqzwCKEfDgSzzCHsuFppyr/LHw5Rei
         iYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776692759; x=1777297559;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTTnzvyU8PLfPdh75XRcNkDGJ3pyY3Z7kiTT8cTCans=;
        b=kfwvkgd0a5OBN8DP3zs56TLQNi/RBDzwd1Ury2A/nh49i8EOeMokPGoLblb1BqkzsH
         giDWALIPB8EDfuGMeGU4scVro5JSQmgVlTaYrGucxW088wq72DB/bhN555RR6G2o70yy
         f0MVgxLAiTEV730BurZyiEkXFVWHN77aQcGOcEJhee2TslGk+SIeE3J9CiDOyJYyHWVL
         NcfsAHrOq9W9n2L7wVAEyXCNN+KI61R0C/fLdCJhjKp9QM5Aroo4kP/9Xn6aOkMuGcyM
         oqKKdGzmq5gt3FC/jqOsGo2hLYGvVdap7vvngo6YUlmhpjuZg1i3xL5UutZFxcEw2s9C
         AJVQ==
X-Forwarded-Encrypted: i=1; AFNElJ85prQxoHyuV7z62LToWM/7s3WUi2Ayf647CR6YA6JLvv6DGv6pi7xoxc1XsuTd/UXoqqrdudYnK60=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrKEGtHjVZufQgzZ9Jh4xX3gu1+MvVJ8Weik/eHxfT4REOjRRc
	4IGrGCFcnhGS2Py8Ht4R2QMzfNlLaoZRMk12KNkd2Ptm884QdXPOhdJ9Acctz6TU2Q==
X-Gm-Gg: AeBDievqKnMKYWNiWLDNgW64vIJncth9Ti2t/0/fYxOse0ZZ/PVuyJbwQVP4FZDZwvM
	QaR2+9tZ5blRyOek+9gh+TBB9KPmeN9gjRzcRTf3Ve8gXi2vgzFtn7bOSTm/OqJ+yGyA8wB3vSa
	pZg9ZC5Ek5+zr5drvoPoOsyxNB6SRTxuA0ru3bLeYFxUaxOoAzCBXOtQgCgljpqAxgxnJeDDJZ8
	4/DnY5VvHGuoTnja00Rv8h5xBizPXZgT3Xqvht7YSQHoVYRRFr6io0vq5u0g219R4F/ubEr5h50
	QChgwh3URFwQ1V4hf4PNIUy/zVXgW0tVurvqinj4FoAYJfMZhoC7LHw+ALe26Nz7Rdjf0XGKRMk
	19f3tt0eMWotagWqa7SJS+IXCSb4wRwYTWtMlBfALUUONYpzsh6d6os1hOo98YCqkDbrg8ONVBt
	UALzZM/xAo16YXrWy6JfYmyTO2YMTv4OezTtgm3YfSMGYUIlZW1+G1NLM+Ve9CPrfdiAEb6JMAo
	RKuw8To/4yGFTi4ZwyMlU/7xw==
X-Received: by 2002:a05:600c:899:b0:489:1a63:509c with SMTP id 5b1f17b1804b1-4891a635125mr43161795e9.0.1776692758631;
        Mon, 20 Apr 2026 06:45:58 -0700 (PDT)
Message-ID: <09a260ca-5a98-461d-9f57-d298a483d3d6@suse.com>
Date: Mon, 20 Apr 2026 15:45:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 16/27] xen/riscv: implement IRQ mapping for device
 passthrough
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
 <10654a6c38fa929b5fdf6f214badfe4f60fe78d4.1773157782.git.oleksii.kurochko@gmail.com>
 <8a8a2afd-6f53-4f45-b8c8-fb34a6fbb970@suse.com>
 <f099b925-0ea9-43a7-b760-f70f343a4d7c@gmail.com>
 <a7a4e8c9-d053-4ca7-ac9c-f43ddccf9151@suse.com>
 <00fa439d-0327-4c0c-960d-a810820a6e83@gmail.com>
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
In-Reply-To: <00fa439d-0327-4c0c-960d-a810820a6e83@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1776692759-80A7F8B7-0493567D/0/0
X-purgate-type: clean
X-purgate-size: 6380
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
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
X-Rspamd-Queue-Id: DFE1442C3E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.04.2026 13:39, Oleksii Kurochko wrote:
> On 4/16/26 2:51 PM, Jan Beulich wrote:
>> On 14.04.2026 13:29, Oleksii Kurochko wrote:
>>> On 4/2/26 2:22 PM, Jan Beulich wrote:
>>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>>> +int vaplic_map_device_irqs_to_domain(struct domain *d,
>>>>> +                                     struct dt_device_node *dev,
>>>>> +                                     bool need_mapping,
>>>>> +                                     struct rangeset *irq_ranges)
>>>>> +{
>>>>> +    unsigned int i, nirq;
>>>>> +    int res, irq;
>>>>> +    struct dt_raw_irq rirq;
>>>>> +    uint32_t *auth_irq_bmp = d->arch.vintc->private;
>>>>> +    unsigned int reg_num;
>>>>> +
>>>>> +    nirq = dt_number_of_irq(dev);
>>>>> +
>>>>> +    /* Give permission and map IRQs */
>>>>> +    for ( i = 0; i < nirq; i++ )
>>>>> +    {
>>>>> +        res = dt_device_get_raw_irq(dev, i, &rirq);
>>>>> +        if ( res )
>>>>> +        {
>>>>> +            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
>>>>> +                   i, dt_node_full_name(dev));
>>>>> +            return res;
>>>>> +        }
>>>>> +
>>>>> +        /*
>>>>> +         * Don't map IRQ that have no physical meaning
>>>>> +         * ie: IRQ whose controller is not APLIC/IMSIC/PLIC.
>>>>> +         */
>>>>> +        if ( rirq.controller != dt_interrupt_controller )
>>>>> +        {
>>>>> +            dt_dprintk("irq %u not connected to primary controller."
>>>>> +                       "Connected to %s\n", i,
>>>>> +                       dt_node_full_name(rirq.controller));
>>>>> +            continue;
>>>>> +        }
>>>>> +
>>>>> +        irq = platform_get_irq(dev, i);
>>>>> +        if ( irq < 0 )
>>>>> +        {
>>>>> +            printk("Unable to get irq %u for %s\n", i, dt_node_full_name(dev));
>>>>> +            return irq;
>>>>> +        }
>>>>> +
>>>>> +        res = irq_permit_access(d, irq);
>>>>> +        if ( res )
>>>>> +        {
>>>>> +            printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d,
>>>>> +                   irq);
>>>>
>>>> This time the other way around: %d please with plain int. (Again at least
>>>> once further down.)
>>>>
>>>>> +            return res;
>>>>> +        }
>>>>> +
>>>>> +        reg_num = irq / APLIC_NUM_REGS;
>>>>> +
>>>>> +        if ( is_irq_shared_among_domains(d, irq) )
>>>>> +        {
>>>>> +            printk("%s: Shared IRQ isn't supported\n", __func__);
>>>>> +            return -EINVAL;
>>>>> +        }
>>>>> +
>>>>> +        auth_irq_bmp[reg_num] |= BIT(irq % APLIC_NUM_REGS, U);
>>>>
>>>> ... all of this leaves me with the impression that IRQ numbering isn't really
>>>> virtualized. IRQs are merely split into groups, one group per domain (and
>>>> maybe some unused). How are you going to fit in truly virtual IRQs?
>>>
>>> What do you mean by truly virtual IRQs?
>>
>> Ones where no aspects are represented by any piece of hardware.
>>
>>> I can't totally agree that the current approach isn't use virtual IRQs,
>>> yes, they are 1:1 mapped but on the other side Xen is responsible to
>>> give an IRQ number for guest's device and Xen is responsible that guest
>>> isn't trying to reach IRQ which not belongs to it.
>>
>> In a non-virtualized environment I expect IRQs are going to be "sparse"
>> (i.e. with perhaps large blocks of items used elsewhere). If you had
>> proper translation of IRQ numbers, the same could be true for your
>> guests.
> 
> Partial FDT, which is used to tell which device be passthroughed to 
> guest, is using physical IRQ number (which I am just considering for 
> simplicity to be 1:1 mapped to virtual IRQ number). So if we have the 
> following configuration:
>    Physical (bare-metal) IRQ layout is sparse:
>      IRQ 5  → UART -> domU0
>      IRQ 23 → Ethernet -> domU1
>      IRQ 47 → PCIe -> domU0
>      IRQ 100 → Storage -> domU1
> (gaps everywhere, driven by hardware wiring)
> 
> For such configuration we will have for each domain auth_irq_bmp[] which 
> contains:
>   IRQ 5 and IRQ47 for domU0
> and
>   IRQ 23 and IRQ 100 for domU1
> 
> And here vIRQ5 = pIRQ5, vIRQ47 = pIRQ47 and so on. auth_irq_bmp just 
> transform xIRQ number to bit position which it will have in real APLIC 
> register. Just as an example, lets take vIRQ5 and vIRQ47.
> 
> As reading or writing register setie[k] reads or potentially modifies 
> the enable bits for interrupt sources k × 32 through k × 32 + 31. For an 
> implemented interrupt source i within that range, the enable bit for 
> source i corresponds with register bit (i mod 32).
> So for:
>   - vIRQ5 == pIRQ5 we have to set bit 5 in setie[0]
>   - vIRQ47 == pIRQ47 we have to set bit 15 in setie[1]
> 
> Probably it was not the best idea to declare auth_irq_bmp as it will 
> look in h/w and maybe just 'bool auth_irq_bmp[1024]' would be more clearer.
> 
> So irqs number are still stay "sparsed" in guest.

Well, twice (or more) as sparse in the example you give, compared to the
host.

>>>>> +        dt_dprintk("  - IRQ: %u\n", irq);
>>>>> +
>>>>> +        if ( irq_ranges )
>>>>> +        {
>>>>> +            res = rangeset_add_singleton(irq_ranges, irq);
>>>>> +            if ( res )
>>>>> +                return res;
>>>>> +        }
>>>>
>>>> What is irq_ranges?
>>>
>>> IIUC based on Arm code irq_ranges is an optional output accumulator, the
>>> caller allocates and passes it in when it needs to track which IRQs were
>>> mapped (overlay use case), or passes NULL when that tracking is not needed.
>>>
>>> I added here as map_device_irqs_to_domain() is called from the common
>>> code and so maybe one day someone will decide to pass irq_ranges to this
>>> functions. At the moment, for RISC-V it is the only one user of
>>> map_device_irqs_to_domain() and it passes NULL.
>>
>> Simply assert then that it's NULL?
> 
> Won't BUG_ON() be better here as it BUG_ON() macros is always defined 
> and doesn't matter if release or debug build are used.

Depends on the context, really.

> Or maybe you meant:
>   if ( irq_ranges )
>       assert_failed("irq_ranges arg isn't supported\n");

Definitely not. assert_failed() shouldn't be called directly, as I had
told you on at least one earlier occasion.

Jan

