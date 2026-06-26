Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j7DcNxAYPmoV/wgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 08:11:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DEE6CA914
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 08:11:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="bg/RV+iH";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345918.1604533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wczlS-0004Cs-29; Fri, 26 Jun 2026 06:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345918.1604533; Fri, 26 Jun 2026 06:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wczlR-0004A7-Ry; Fri, 26 Jun 2026 06:10:09 +0000
Received: by outflank-mailman (input) for mailman id 1345918;
 Fri, 26 Jun 2026 06:10:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wczlQ-000446-A6
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 06:10:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wczlO-008m7r-Ab
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 08:10:06 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3e17b9-2eae-0a2a0a5409dd-0a2a450b8962-10
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:10:06 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3e17bc-ac48-0a2a450b0019-d155dd31c4c2-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:10:04 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-464192ab2e1so334444f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 23:10:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268ff1be9sm53238785e9.8.2026.06.25.23.10.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 23:10:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1782454204; x=1783059004; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=euXe730d2gXr9D2oB3dY/IhcPViTqdTR3zG+OVUrVWk=;
        b=bg/RV+iHnnDREsVSidJ1kDBprVMT5GW1OCslPygCPJzt0cmO+HOMv7tTjMplYhJ8rd
         JjiLpp4WgxHwIfmb7+6nFNMVqq18VlBleMlHmL2FU99peUva8gxSPiKiYqOYP+FKEQBa
         rrfANDUnn58GhgaFbepRNExOrwAxkTfedBixYGG40raWkRbGRuvZ/yJD+XSnET3ptB1k
         YYEKLEFi+KenDfGPcJhh4vM+/wLlPUJ7IB8xTINFhvLjEGL7WEZI6JofqAoaaKYrchhe
         NMAsgdC23BX3EVJyMlHkxG7slHo772y2qj1wIY426FK/lyznT8aAOqS3UBG/zbX7RrX+
         CMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454204; x=1783059004;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euXe730d2gXr9D2oB3dY/IhcPViTqdTR3zG+OVUrVWk=;
        b=tVdshz4vs0bd02XzChoR+r077Asj+Y2iYapzFfdckC77lgesdzoQuogkmsQXBrQ2Ou
         qC0ElbKQxLrHI0+CtUhNPre5nDVt8q6g69MHqxr1qb0oxdxlDpeA6NspQ4pqQzxFW88g
         oxIjDv414199D28TgT5eyRmBUFBEq8iug4yScbTmL5x67NS7wf43LWDu12jHp3dgBrXB
         eNS6ZqU/qDAxEZjrzqW0U2/l8Bi9BL7lAvflk5v3u1jX8E/LHCHhDiCosfWPOeY7C+wt
         IT28UkaqJmVLWOjcyryv7ghKRabM6ovNFLL/Dd0aV+ur46wtSZMvPyYS7HEewryRYo8E
         i8Pw==
X-Forwarded-Encrypted: i=1; AFNElJ/yHcd8vsfJBqHETOPZK1OprdwgusbbxVloAj9qnPTy/PBbygLS4kyV/ggUClfadJ2nQAFmsxSWuLs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2D19trIeuItvka744vmU7wXM8BQdCn9fIAnVv6nMMaVQ9xtbO
	8zsn5ql1IEzmCulasBh7vFjoh1jvxxWnvTyKRAibXRx01GxEj1KQDHSBO2Te2zcc/w==
X-Gm-Gg: AfdE7cntDiexT213RngnUWmy3WpaRW36cjV0Rt1t3bxoAwjgaz5nXYk339ZjsDHbzwY
	sVBE7L5q39XONKoASmSJQZHvsuUERqAy3ibhbW+W0abE7mPJWsyHdfnosYD5I1j1aq4BGjg/9cs
	kw9MHUWnsYa7a9wRJ9st0B30NkIJzhg1bt/ZYdPfHiV/xyGOvjm3XJ67WumbEsXprS5APWD0kGU
	aZcz1eCRQxE6zQBLoPSLH56G2FGHRhp558Cx7uatEBt/m+0E7N+GZPtkiUef/11HkyX8rOzeuqO
	0b6SystAmRN0zNF5WaSO5Nr2UxfNDGDWm4xJ/fWRElI8iKJ59nc5CeSUAOv9PViLmlD1SFlfmOa
	JmcvjxrKwWHpQplaM4AfVLUfvf6bVr/qObCnYOUJcUnrf/lt80Ze2dCHSh9HY4VXErPgFPmBqPd
	aAs1m+rTE+Op93FKEb9TrTSrui65WtErEb30XmttsYlX4FMERDn7dwoky+u6VXMwm54ZyzgGsCj
	qGK
X-Received: by 2002:a05:600c:1d86:b0:490:d354:bcf4 with SMTP id 5b1f17b1804b1-49266885dc4mr71129385e9.27.1782454203626;
        Thu, 25 Jun 2026 23:10:03 -0700 (PDT)
Message-ID: <98b6159a-3e68-4ac3-b60a-112e975f4f16@suse.com>
Date: Fri, 26 Jun 2026 08:10:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/23] xen/riscv: implement IRQ routing for device
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
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <0458468cc5a6db911a9acc64f4c8cf17ceebe4c6.1781693963.git.oleksii.kurochko@gmail.com>
 <3a1aca27-cc18-4b57-bb31-c50161b8c261@suse.com>
 <b4770ce2-9456-4dae-a322-c8e3f9239472@gmail.com>
 <d0b60963-6711-44ed-833d-83ac9de50aa9@suse.com>
 <04195c2e-0cb1-45a2-9844-2ce802692704@gmail.com>
 <9640e0eb-ea38-41ba-b99c-aafa6c6d7bc7@suse.com>
 <454e633b-2de6-4a04-a711-36bb8b2c8c00@gmail.com>
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
In-Reply-To: <454e633b-2de6-4a04-a711-36bb8b2c8c00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1782454204-40942220-EC526D95/0/0
X-purgate-type: clean
X-purgate-size: 8282
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
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
X-Rspamd-Queue-Id: 17DEE6CA914

On 25.06.2026 17:54, Oleksii Kurochko wrote:
> 
> 
> On 6/25/26 1:14 PM, Jan Beulich wrote:
>> On 25.06.2026 11:48, Oleksii Kurochko wrote:
>>> On 6/25/26 8:08 AM, Jan Beulich wrote:
>>>> On 24.06.2026 17:21, Oleksii Kurochko wrote:
>>>>> On 6/22/26 5:57 PM, Jan Beulich wrote:
>>>>>> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>>>>>>> --- a/xen/arch/riscv/include/asm/intc.h
>>>>>>> +++ b/xen/arch/riscv/include/asm/intc.h
>>>>>>> @@ -13,6 +13,7 @@ enum intc_version {
>>>>>>>     };
>>>>>>>     
>>>>>>>     struct cpu_user_regs;
>>>>>>> +struct domain;
>>>>>>>     struct irq_desc;
>>>>>>>     struct kernel_info;
>>>>>>>     struct vcpu;
>>>>>>> @@ -32,6 +33,9 @@ struct intc_hw_operations {
>>>>>>>         /* hw_irq_controller to enable/disable/eoi host irq */
>>>>>>>         const struct hw_interrupt_type *host_irq_type;
>>>>>>>     
>>>>>>> +    /* hw_irq_controller to enable/disable/eoi guest irq */
>>>>>>> +    const struct hw_interrupt_type *guest_irq_type;
>>>>>>
>>>>>> It's likely my limited RISC-V knowledge that I find this extremely odd:
>>>>>> Separate struct hw_interrupt_type-s for host and guest?
>>>>>
>>>>> The guest and host interrupt controllers may handle some
>>>>> hw_irq_controller operations differently, even though the operations
>>>>> themselves are conceptually the same. The hw_irq_controller interface
>>>>> provides fairly abstract interrupt controller operations, but the
>>>>> underlying implementation may differ depending on whether the controller
>>>>> is used by the host or a guest.
>>>>>
>>>>> As an example, the Arm code already follows this approach:
>>>>>
>>>>> /* XXX different for level vs edge */
>>>>> static hw_irq_controller gicv2_host_irq_type = {
>>>>>        .typename     = "gic-v2",
>>>>>        .startup      = gicv2_irq_startup,
>>>>>        .shutdown     = gicv2_irq_shutdown,
>>>>>        .enable       = gicv2_irq_enable,
>>>>>        .disable      = gicv2_irq_disable,
>>>>>        .ack          = gicv2_irq_ack,
>>>>>        .end          = gicv2_host_irq_end,
>>>>>        .set_affinity = gicv2_irq_set_affinity,
>>>>> };
>>>>>
>>>>> static hw_irq_controller gicv2_guest_irq_type = {
>>>>>        .typename     = "gic-v2",
>>>>>        .startup      = gicv2_irq_startup,
>>>>>        .shutdown     = gicv2_irq_shutdown,
>>>>>        .enable       = gicv2_irq_enable,
>>>>>        .disable      = gicv2_irq_disable,
>>>>>        .ack          = gicv2_irq_ack,
>>>>>        .end          = gicv2_guest_irq_end,
>>>>>        .set_affinity = gicv2_irq_set_affinity,
>>>>> };
>>>>>
>>>>> These implementations reuse almost all interrupt controller operations,
>>>>> differing only in the .end callback.
>>>>
>>>> Which I'm having trouble with as well. Interrupts are handled by Xen. What
>>>> guests get to see are virtualized interrupts (no matter how much HW
>>>> acceleration may be in use). Hence I'm having difficulty to see such a
>>>> split justified.
>>>
>>> I think that I don't fully understand what is wrong with splitting. If
>>> there are cases exist when I need such separation for virtual interrupt
>>> controller operations then it looks fine to introduce such separation,
>>> right?
>>>
>>> Lets take an example of PLIC.
>>>
>>> For each source the PLIC has a "gateway":
>>> 1. Claim (read CONTEXT_CLAIM): returns the pending IRQ id and closes the
>>> gateway for that source, it will not forward that source to any context
>>> again until completed.
>>> 2. Complete (write the id back to CONTEXT_CLAIM): reopens the gateway.
>>> If the device line is still asserted (level high), the PLIC immediately
>>> re-marks it pending and delivers it again.
>>>
>>> The "closed gateway" between claim and complete is effectively the
>>> hardware masking the source while it's being serviced.
>>>
>>> Then if we will handle guest interrupt in the following way:
>>> 1. Passthrough device asserts its line (level stays high).
>>> 2. Xen takes the physical IRQ, claims (gateway closes), completes
>>> (gateway reopens), injects a virtual IRQ into the guest's vPLIC.
>>> 3. The guest hasn't run yet, it hasn't touched the device's registers,
>>> so the device line is still high.
>>> 4. The PLIC sees the source still asserted with an open gateway -> marks
>>> pending -> fires another physical interrupt into Xen -> ... -> repeat.
>>>
>>> So we get a storm of physical interrupts for a device the guest hasn't
>>> even begun servicing. The device line only drops when the guest driver
>>> writes the device's own registers, which happens long after, and on the
>>> guest's schedule.
>>>
>>> So the solution is that the physical complete must wait until the guest
>>> has actually quiesced the device. The only signal Xen gets for "guest is
>>> done" is the guest writing its virtual complete to the emulated vPLIC. So:
>>> 1. guest_irq->ack: the claim already happened (the readl(CONTEXT_CLAIM)
>>> in plic_handle_interrupt); ack just records which context claimed it.
>>> The gateway stays closed - good, the source is masked while the guest works.
>>> 2. inject vIRQ → guest services the device (line drops) -> guest writes
>>> vPLIC complete.
>>> 3. guest_irq->end: now do the physical complete, reopening the gateway.
>>> Device is quiet -> no spurious re-trigger; if it's a new legitimate
>>> assertion, it fires once, correctly.
>>>
>>> Is it clear enough now?
>>
>> Well, yes and no. On x86 we have to deal with the situation you describe as
>> problematic anyway, as IRQs have priorities associated with them, and higher
>> prio ones block equal/lower prio ones until they are "completed" (in the
>> terminology you use). 
> 
> Just for my understand what is the problem here that until "completed" 
> isn't done for this high priority interrupt all other will just wait so 
> basically responsiveness of the system in general will be bad?

Yes, on guest can affect other guests or the host.

>> If you don't have anything similar in RISC-V, then
>> you may indeed get somewhat simpler code overall with such a split.
> 
> IIUC, if the word "block" above is used correctly I would say that 
> behavior on RISC-V is different, at least, for PLIC as basically, if we 
> have three IRQs and let's say `irq1` has the highest priority.
> 
> `irq2` and `irq3` may become pending in the PLIC core, but they will not 
> be visible to the CPU until `irq1` is CLAIMed, even if `irq1` is never 
> completed (i.e., if you fail to write back to the CLAIM/COMPLETE register).
> 
> When the hart reads the CLAIM/COMPLETE register, the PLIC core 
> atomically retrieves the ID of the highest-priority pending interrupt 
> (`irq1`) and clears its Interrupt Pending (IP) bit in the PLIC core.
> 
> Once the IP bit for `irq1` is cleared, the PLIC core immediately 
> re-evaluates all remaining pending interrupts. If `irq2` and `irq3` are 
> pending, `irq2` (the next-highest-priority interrupt) becomes the 
> highest-priority pending interrupt.
> 
> The PLIC core will continue to signal the hart (by asserting the `MEIP` 
> or `SEIP` bits) as long as there is any pending and enabled interrupt 
> whose priority exceeds the hart's threshold.
> 
> So the IRQ handler can run for irq2 and irq3 before irq1 is COMPLETED.
> 
> So irqs are blocked only until they are claimed.
> 
>   Yet if
>> there's nothing like that in RISC-V, you can get (almost) arbitrarily deeply
>> nested interrupts, which in turn would be a problem you need to deal with.
>> IOW I suspect the architecture has something to limit nesting depth.
> 
> The trap handler, where the IRQ handler is called, starts with 
> interrupts disabled, so nested interrupts cannot really occur at that point.

Same on x86. Yet then in do_IRQ(), around invoking the handler, we re-enable
interrupts. There have been discussions whether this is a good idea, but
fundamentally the thought behind this is to prevent higher priority IRQs to
remain blocked for overly long periods of time. I.e. again a responsiveness
concern, the more that some of the IPIs are hi-prio ones in order for them
to be serviced quickly, to prevent blocking the CPU issuing the IPI (plus
perhaps further CPUs).

Jan

