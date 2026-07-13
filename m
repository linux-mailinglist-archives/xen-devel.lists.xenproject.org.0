Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z2jqF6u2VGqcpwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 11:58:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2716749867
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 11:58:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ibbrl77G;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1361576.1613765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjDPz-0007dl-4y; Mon, 13 Jul 2026 09:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361576.1613765; Mon, 13 Jul 2026 09:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjDPz-0007bQ-22; Mon, 13 Jul 2026 09:57:43 +0000
Received: by outflank-mailman (input) for mailman id 1361576;
 Mon, 13 Jul 2026 09:57:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wjDPx-0007aB-84
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 09:57:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjDPv-00DGit-7Y
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 11:57:39 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a54b68f-bab6-0a2a0a5309dd-0a2a4503e58a-16
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 11:57:39 +0200
Received: from [209.85.208.171] (helo=mail-lj1-f171.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a54b692-f2d2-0a2a45030019-d155d0abc8da-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 11:57:39 +0200
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-39ca300db70so13230001fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 02:57:39 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b01ca55723sm2715221e87.35.2026.07.13.02.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 02:57:37 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783936658; x=1784541458; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8ZFAs9qXx3g/86C5aQ3vsXA/85ozIDf5zoPqhpvTN4=;
        b=Ibbrl77Gz1Hl6iZaMYIGVX7tFGBJdEZ5kVTLq3LnHX+Y9AptqFD3+ITVY4rBvX+i/Y
         BfHlV2bET+PmVUEqcYqDATc5uNGVuER4+XATx7RhaEUO+kLUuA9UcGt1qK8xZDQW4f+X
         1Bgy+H+jZPnN12aKeCRIMs0vARWAJiXaMpMZcIbHi0eU+xnX4wvtr9rR90nUTAkY4/TF
         2Z2Z72xxPiiqP9x52Ws31GpBvFn0CpZ0k6F6trZGtl5Z9dxbf5Y1q7alz5xTAPm/ev1S
         QZOUBbCvsQeuII+Nr1zCJY7t98R3mvr7jGjzj8qpvD2IpXrdh91ZsKH3ASwHn6/tRvXD
         pDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783936658; x=1784541458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8ZFAs9qXx3g/86C5aQ3vsXA/85ozIDf5zoPqhpvTN4=;
        b=DTf+C40FWfYOpCNvmlhW/LvZyo/o3n6ol1YvK/yqsJMH0sUCm7gosgT5jTdhYiseLQ
         F7t6OA0OXRB6TaWLkm2h+iMusSPfMmtm5Lu4DfyeUySHII1+Qi/o2lUspK8SV2uGcQiC
         +7yPKBIZwF4JPSo296AFo2KJrr7Ov9a8g+4T7DLGDG3Wdp6bVChMhSYObw8Atwmgccym
         8t/6XNpG9dhpCFvDDx67MWUZkXetBpXVzCRFk5K8C27w38PjkvxQDC/uSq+65oNuVFaD
         +nDtPGWuqGaWSO275kehTKnnunBTxMknajoH183wymRRe5NUASvn4i/oGlLKYJ8WobY0
         eHww==
X-Forwarded-Encrypted: i=1; AHgh+Ro4P95Q2cE4bpGbPrtrmsgHi3Qsbm3FXpjZTT9OEjdtUkuRDDT18YYkhM0ndQ8Ene1RXkV5wZnB/6I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzq4O67YY4d3cvyHIep+5nEUSXxSlNKOSQ9vgkk835Eyb7DTxNJ
	+O79UaFBYsWMSYPyRQMo28I5o1ZfakKHMe+FdAi6WJJfLhLL9edIQxYJ
X-Gm-Gg: AfdE7cmOicQZSI2kDarqct3Gimt2WZoEzF+gRE+YvQ6WuM+PlullMJsSDw5S0JYA8Pg
	6jO3rbCHeB1CL0XgFpBmN7VOFl7YQgV5hiJHe2qTUyx8egdislWeOHGdVGWlm3rmXgb7NtEVGQx
	LXi0DkWGtZchtWGPMJs7tr/P5q3Ni6PzUgijrMSLa3fl5nf7vq3WftZtr2YWrStTU5NsVnX0dQy
	ZIT1vXP6EKf6aMME8kbeKBMdSbhaS3BzTzWhyQJWcAovCGtoKhAJ+WcvajAmPaNvw+7/Wq2xsDl
	ANUO1SGrkLMbaPL5JmJBGi3BP5MVvqmxeS2IL/0er6BisAk2iJSWWsYax9yXA7e6zaL/Ev9LaiY
	w/TYvYlF4xKBy0kWVwXat3P+ByuTH0wRn6/BGM1el6aMKKaC10OHRR3FswdMlOPynXkMzeN3gKn
	YcHJ3FX2NvOgzK0/6ySJHqlxnDJZnMCGrROcqQKNM5AwwFV1YgxQbLF6aW56x38YsmCmQvAn5wH
	zZwEg==
X-Received: by 2002:ac2:50d8:0:b0:5ae:b357:1d1a with SMTP id 2adb3069b0e04-5b02356ca07mr1111984e87.8.1783936658234;
        Mon, 13 Jul 2026 02:57:38 -0700 (PDT)
Message-ID: <2d0877f5-2fc1-4f53-b662-c377788e02ca@gmail.com>
Date: Mon, 13 Jul 2026 11:57:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/26] xen/riscv: introduce minimal virtual APLIC
 (vAPLIC) infrastructure
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
 <1f51410c080599a5c80173398d9db837b8718356.1783331040.git.oleksii.kurochko@gmail.com>
 <6a4adfa7-ec9a-4cbd-a9e2-571293cbb1ed@suse.com>
 <69d18359-3fae-4618-b46a-ad52bcf1a027@gmail.com>
 <d38333f3-0dd0-43ad-ab3d-c6366ae8c74f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d38333f3-0dd0-43ad-ab3d-c6366ae8c74f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1783936659-C1359CF4-B2FCC63B/10/73395122804
X-purgate-type: spam
X-purgate-size: 3742
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2716749867



On 7/13/26 8:41 AM, Jan Beulich wrote:
> On 10.07.2026 17:52, Oleksii Kurochko wrote:
>> On 7/9/26 5:39 PM, Jan Beulich wrote:
>>> On 06.07.2026 17:57, Oleksii Kurochko wrote:
>>>> At the current development stage, only domain vINTC init and deinit
>>>> operations are required, so implement those first.
>>>>
>>>> Initialize vAPLIC's domaincfg to with the interrupt-enable bit set and
>>>> MSI delivery mode selected as the current solution is exepcted to have
>>>> always IMSIC, and initialize vintc->ops.
>>>
>>> How would domaincfg be initialized on real hardware?
>>
>> Xen will initialize that in aplic_init_hw_interrupts():
>> writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &aplic.regs->domaincfg);
> 
> I.e. it is very much something the OS should do.
> 
>> I can see that maybe
>>> firmware would have to set DM suitably (and you may mean to take firmware's
>>> role here).
>>
>> I don't think that firmware will do that (and OpenSBI for example
>> doesn't do that). If firmware can do that we for sure want to control in
>> Xen what is written to ->domaincfg.
>>
>>> But isn't setting at least IE entirely the OSes responsibility?
>>
>> At least, Linux setups ->domaincfg once at the boot time:
>>
>> 	/* Setup APLIC domaincfg register */
>> 	val = readl(priv->regs + APLIC_DOMAINCFG);
>> 	val |= APLIC_DOMAINCFG_IE;
>> 	if (msi_mode)
>> 		val |= APLIC_DOMAINCFG_DM;
>> 	writel(val, priv->regs + APLIC_DOMAINCFG);
>> 	if (readl(priv->regs + APLIC_DOMAINCFG) != val)
>> 		dev_warn(priv->dev, "unable to write 0x%x in domaincfg\n", val);
>>
>> And don't touch this register anymore, even for interrupt disablement it
>> isn't used.
>>
>> So Xen can just does once:
>> writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &aplic.regs->domaincfg);
>>
>> and then just properly handle access of a guest to domaincfg.
> 
> Xen can do this for itself, sure. But shouldn't domaincfg as seen by guests
> start out 0 then?

Now I think I understand your point.

I agree that it should start from 0 (or from 0x80000000, since bits 
31:24 are read-only and fixed to 0x80). All other bits should be set or 
cleared by the guest and written to vaplic->regs.domaincfg when the 
guest accesses the vAPLIC domaincfg register.

In that case, domain_vaplic_init() should initialize ->domaincfg as:
   vaplic->regs.domaincfg = APLIC_DOMAINCFG_RO;

instead of:
   vaplic->regs.domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM |
                          APLIC_DOMAINCFG_RO;

> 
>>>> --- a/xen/arch/riscv/include/asm/aplic.h
>>>> +++ b/xen/arch/riscv/include/asm/aplic.h
>>>> @@ -15,6 +15,8 @@
>>>>    
>>>>    #include <asm/imsic.h>
>>>>    
>>>> +/* domaincfg bits 31:24 are read-only 0x80 */
>>>> +#define APLIC_DOMAINCFG_RO      (0x80U << 24)
>>>
>>> Bit 7 is also documented as read-only 0. Wouldn't the comment better reflect
>>> that as well?
>>
>> Not sure, bits 31:24 are read-only *0x80* but bit 7 is read-only *0*.
> 
> And would it hurt if the comment said so, to avoid any ambiguity?

Of course, it won't I will update the comment.

> 
>>>>    #define APLIC_DOMAINCFG_IE      BIT(8, U)
>>>>    #define APLIC_DOMAINCFG_DM      BIT(2, U)
>>>
>>> Wouldn't you better spell out BE as well?
>>
>> I can add:
>>     #define APLIC_DOMAINCFG_BE       BIT(0, U)
>>
>> But it isn't used at the moment (Linux also defines it but never
>> actually using it). Do you want still to add that now?
> 
> Imo it would be better to have a complete set of definitions. If you
> don't allow guests to set this bit, perhaps to emit a sufficiently
> informative debug log messages you may want to use the #define?

Agree, it make sense.

Thanks.

~ Oleksii

