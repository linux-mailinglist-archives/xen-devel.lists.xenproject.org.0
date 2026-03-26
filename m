Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCRwH/HkxGnz4gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 08:49:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD8F3309ED
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 08:49:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263375.1555324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5fSP-0004mc-Nn; Thu, 26 Mar 2026 07:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263375.1555324; Thu, 26 Mar 2026 07:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5fSP-0004jY-Kf; Thu, 26 Mar 2026 07:48:45 +0000
Received: by outflank-mailman (input) for mailman id 1263375;
 Thu, 26 Mar 2026 07:48:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w5fSO-0004jS-JX
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 07:48:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5fSL-00FF6F-UI
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 08:48:43 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c4e4d8-e002-0a2a0a5209dd-0a2a450cbec2-12
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 08:48:43 +0100
Received: from [209.85.208.47] (helo=mail-ed1-f47.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c4e4db-f93d-0a2a450c0019-d155d02fa5e6-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 08:48:43 +0100
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-66aa2204e9dso1265803a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 00:48:43 -0700 (PDT)
Received: from [192.168.50.2] ([45.12.25.73]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66ad60464c1sm667659a12.12.2026.03.26.00.48.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 00:48:41 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774511323; x=1775116123; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/IbxMKVjMXwkjFATvXrjzg7ZTfbd3+P6hiqluOVjO8=;
        b=rPi8Gs7fRFyybP7Wcaex0aMdB9a+ZRrTRSpzts2EspA8aU+hVfFGWHKO59CopOeFJm
         lQcZE+Dp5DeeWYIQDCIP9yOTNxVZauBIntUFSKNzKRZbR/UdLNThLIKIUwlVpZJU3uTJ
         YA8PqQWaQO+D8dvklI4NC14+qs9ukjh0SK+Up90EWpJpY5JQRzmemxDeh5kS73tUGDWU
         Q5p5rZw0Eym8GyAv7b0dHCAXFuT2oE92rYW+80TY/k8L0roK5eRJRGq8ZzIWIjedI1pL
         HeWtakgxJA0zkdXCWODfYtz0+YqYJOR9t2Prl/sGvLtJuT1bnDYqChS1jFbi2rUKfC0F
         Gfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774511323; x=1775116123;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/IbxMKVjMXwkjFATvXrjzg7ZTfbd3+P6hiqluOVjO8=;
        b=el1ur3z+4vijv9pYbRuZwQKHcw31hIMENIHPgvsZKPT0Pt+NZzDQdWFaRmNnwGb4yt
         rPiPZQGvs81YIQrcjyo5T/QeVcOYzTGZN1BRpvPM/m9mMNvaL3F6zyrLh6/JwTsSt6VR
         NlT0qDLKG/uDotHQOpsLBdgfesOlU9GgEDQPWdGI4sfNwa4viIwCXyihsFr3rQVOOwaV
         0Q4VM6nKQFkMgxsaxVCtEQ3pB+kGbrCqYB9UgKNgslcOWiBp3KiMkNVu76HcJBABbzAZ
         rlJIKMAE64gvEijFTXcpdeGQBelGhWV7LnoiXmBIGQIiSs4JDUPiTtaDwdTe5Kxdbk4C
         Dx3g==
X-Gm-Message-State: AOJu0YyK+8RKDph/4voz2rxcgiYzScqKxeSV3jA9RcxZFQhVqUOXxqej
	PqV8Q13YXIFDu1zhhhfiolkGCbWXx0PUUjCLcTlEhQwzcxBRvFHcJ3Tq
X-Gm-Gg: ATEYQzxVhq7h32tbOT2ledF1bgKTl4RwAzI9arGNDimvZpeDpQtDFiZl7wxS2YhWIX1
	mca3heNfebofpNfiKJ8XDExwT/Zxsl/2zar/gYh/7ApVoFN0rwgOnn3wwfJsFfcnFNQ3WsXdQOR
	ab9AsOSVBLJYLY7MgkRKkfRqX+8ZLB6widsoBEpbTQe1AQyPtH/uz/q5tN0B2sbnnzjSZ6sbTAB
	9a3BOhPhEFdXfJ52lxGjdbuFUwtnAYeV67Rpq6psYD/S0LjrdqD3rGIq/NT+CTsTGBcbSadYfDW
	QrciwnM4zARESIA6EWGuTHgEe4osIWIdCV1d4qj1qPj13MKBJ4+4/G3JJMdZYt1ZpR0EOjHVAC+
	Ricn66jMadYTaCy3h8pVJ3uDRWYDTb3ZSqHS59mPbn+leHMswlOwpP4vknwQkj24nkOb8ZUhuwr
	/NOcJcW3IGV69XOzzvKVL7A+Y8Zg==
X-Received: by 2002:a05:6402:3889:b0:662:811d:60f4 with SMTP id 4fb4d7f45d1cf-66b07f2a1a8mr397268a12.14.1774511322450;
        Thu, 26 Mar 2026 00:48:42 -0700 (PDT)
Message-ID: <bb714e67-3f88-4b09-8989-a011c2ed7c86@gmail.com>
Date: Thu, 26 Mar 2026 09:46:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/12] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
From: Mykola Kvach <xakep.amatop@gmail.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>
References: <cover.1765472890.git.mykola_kvach@epam.com>
 <fe8b4d92a8dfd7b4c40429d10233637a339ae8e6.1765472890.git.mykola_kvach@epam.com>
 <75823cb4-c14c-4a4a-b523-e131c820a4d3@xen.org>
 <CAGeoDV_beuoKuvdXpXsKv_RaNV0fsj0pHQcmQ+iPbsK4h4W6-w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAGeoDV_beuoKuvdXpXsKv_RaNV0fsj0pHQcmQ+iPbsK4h4W6-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1774511323-6F2A9734-48DA88BC/0/0
X-purgate-type: clean
X-purgate-size: 4926
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:saeed.nowshadi@xilinx.com,m:mykyta_poturai@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DAD8F3309ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 15/01/2026 12:00, Mykola Kvach wrote:
> Hi Julien,
> 
> Thanks for the review.
> 
> On Fri, Dec 26, 2025 at 2:29 PM Julien Grall <julien@xen.org> wrote:
>>
>> Hi Mykola,
>>
>> On 11/12/2025 18:43, Mykola Kvach wrote:
>>> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
>>> index b23e72a3d0..0b2f7b3862 100644
>>> --- a/xen/arch/arm/gic-v2.c
>>> +++ b/xen/arch/arm/gic-v2.c
>>> @@ -1098,6 +1098,123 @@ static int gicv2_iomem_deny_access(struct domain *d)
>>>        return iomem_deny_access(d, mfn, mfn + nr);
>>>    }
>>>
>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>> +
>>> +/* This struct represent block of 32 IRQs */
>>> +struct irq_block {
>>> +    uint32_t icfgr[2]; /* 2 registers of 16 IRQs each */
>>> +    uint32_t ipriorityr[8];
>>> +    uint32_t isenabler;
>>> +    uint32_t isactiver;
>>> +    uint32_t itargetsr[8];
>>> +};
>>> +
>>> +/* GICv2 registers to be saved/restored on system suspend/resume */
>>> +struct gicv2_context {
>>> +    /* GICC context */
>>   > +    struct cpu_ctx {> +        uint32_t ctlr;
>>> +        uint32_t pmr;
>>> +        uint32_t bpr;
>>> +    } cpu;
>>> +
>>> +    /* GICD context */
>>> +    struct dist_ctx {
>>> +        uint32_t ctlr;
>>> +        struct irq_block *irqs;
>>
>> To confirm my understanding, this will also include the PPIs, SGIs for
>> the boot CPU, am I correct? If so, I would suggest to add a comment.
> 
> Yes, correct. I’ll add a comment to make it explicit that this includes
> SGIs/PPIs for the boot CPU.
> 
>>
>>> +    } dist;
>>> +};
>>> +
>>> +static struct gicv2_context gic_ctx;
>>> +
>>> +static int gicv2_suspend(void)
>>> +{
>>> +    unsigned int i, blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
>>> +
>>> +    /* Save GICC configuration */
>>> +    gic_ctx.cpu.ctlr = readl_gicc(GICC_CTLR);
>>> +    gic_ctx.cpu.pmr = readl_gicc(GICC_PMR);
>>> +    gic_ctx.cpu.bpr = readl_gicc(GICC_BPR);
>>> +
>>> +    /* Save GICD configuration */
>>> +    gic_ctx.dist.ctlr = readl_gicd(GICD_CTLR);
>>
>> Do we want to disable the GIC distributor and CPU interface on suspend?
> 
> I think we should quiesce the CPU interface after saving state,
> but not disable the distributor globally.
> 
> I still prefer not to disable GICD globally for safety on platforms
> where the wake request is routed from the GIC to the PMU/SCP (e.g. via
> nIRQOUT/nFIQOUT). So I’d quiesce GICC, keep GICD enabled.
> 
> Are you OK with this approach?

I have revisited the documentation and could not find a
normative PSCI requirement to disable the GIC distributor.

PSCI 1.3, section 6.8 ("Preserving the execution context"),
only says that some systems may power down the GIC
distributor as part of SYSTEM_SUSPEND or a deep
CPU_SUSPEND, in which case the relevant GIC state must be
saved and restored. So PSCI acknowledges this as a possible
platform behavior, but it does not appear to mandate it.

The stronger guidance seems to come from BSA. In Arm BSA 1.2
(DEN0094E), section 3.10, semantic E allows the GIC to be
powered off after system software has saved its state.
Table 8 shows semantic E with the GIC distributor Off, and
Table 9 states that the GIC Distributor must be Off if all
PEs are in the Off state.


Best regards,
Mykola

> 
>>
>>> +
>>> +    for ( i = 0; i < blocks; i++ )
>>> +    {
>>> +        struct irq_block *irqs = gic_ctx.dist.irqs + i;
>>> +        size_t j, off = i * sizeof(irqs->isenabler);
>>> +
>>> +        irqs->isenabler = readl_gicd(GICD_ISENABLER + off);
>>> +        irqs->isactiver = readl_gicd(GICD_ISACTIVER + off);
>>> +
>>> +        off = i * sizeof(irqs->ipriorityr);
>>> +        for ( j = 0; j < ARRAY_SIZE(irqs->ipriorityr); j++ )
>>> +        {
>>> +            irqs->ipriorityr[j] = readl_gicd(GICD_IPRIORITYR + off + j * 4);
>>> +            irqs->itargetsr[j] = readl_gicd(GICD_ITARGETSR + off + j * 4);
>>> +        }
>>> +
>>> +        off = i * sizeof(irqs->icfgr);
>>> +        for ( j = 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
>>> +            irqs->icfgr[j] = readl_gicd(GICD_ICFGR + off + j * 4);
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void gicv2_resume(void)
>>> +{
>>> +    unsigned int i, blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
>>> +
>>> +    gicv2_cpu_disable();
>>   > +    /* Disable distributor */> +    writel_gicd(0, GICD_CTLR);
>>   > +> +    for ( i = 0; i < blocks; i++ )
>>> +    {
>>> +        struct irq_block *irqs = gic_ctx.dist.irqs + i;
>>> +        size_t j, off = i * sizeof(irqs->isenabler);
>>> +
>>> +        writel_gicd(0xffffffffU, GICD_ICENABLER + off);
>>
>> NIT: Can we use GENMASK? This will make easier to confirm we have the
>> correct number of bits.
> 
> Sure, I'll change it to GENMASK
> 
> Best regards,
> Mykola
> 
> 
>>
>> [...]
>>
>> Cheers,
>>
>> --
>> Julien Grall
>>


