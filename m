Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N72dMcGIVGr+mwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 08:42:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D43D7479B5
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 08:42:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=ePwRlEWp;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1361395.1613635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjAMZ-0002Bf-Q5; Mon, 13 Jul 2026 06:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361395.1613635; Mon, 13 Jul 2026 06:41:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjAMZ-0002A8-Me; Mon, 13 Jul 2026 06:41:59 +0000
Received: by outflank-mailman (input) for mailman id 1361395;
 Mon, 13 Jul 2026 06:41:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wjAMY-0002A2-MT
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 06:41:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjAMX-006FPw-VL
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 08:41:57 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5488b2-e002-0a2a0a5209dd-0a2a4504cce6-20
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 08:41:57 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a5488b5-b1e5-0a2a45040019-d1558034c429-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 08:41:57 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-493bfe9f886so13744515e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2026 23:41:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2dd8376sm163026445e9.2.2026.07.12.23.41.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Jul 2026 23:41:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1783924917; x=1784529717; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GfIirhzSPKRYNVfm0DiN/E24+YSKw3b+5AGVW2jxGM=;
        b=ePwRlEWpVeE1sR1xazGeQGCI/ADjMBNpqmiwYaIfmyV7RY0uAgNfO58tC22HI1UrlV
         9X8nfyMAeHXS383q81nQN7vjLWUVPn5kjFJtILcUszThI1vlqOBxCOBD/T9pblePd7q4
         nTQvMqVUpg2Od1l5LiVmXR8Xjao1vWVNMzT8vqVBu3TqQ/FTYUlqwW4bM2zt5Sd4yL7q
         jjPx5t8FCPkrvMAt5UBC1PolyOZiNcKrjfE/KtyDKorEGUYuf/GRE0vkExDSSvZEhdBe
         vl1DRMqwVLAcMwYfVh2szlV6oDkFYIFySsWytrMTLLsVHDPIQdFcxXsAoP1t8lHiWJpQ
         tdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924917; x=1784529717;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GfIirhzSPKRYNVfm0DiN/E24+YSKw3b+5AGVW2jxGM=;
        b=LGjN98dGx9iwMDKqHfwSYca3CQ11A4Jclf5TeM66jLAa5/u1J8ItWuPGM2dWoEMT+x
         ONm/ScNlXanKywMZggOb9zm0KnL1wDThd4+3kqmpk2McBf3tHCOEtDBHjxvaY5pBT+TO
         IDT1J1CB8WYvPWYevhbAVDUK0pQrrQiLj4Y3Kt+qia6Y9lXgjM1qY2ZKUVTQ8DHscyNO
         IHNb6jwX54ZebUrtBrZE7kyNuscvk1aaw4iFjADbJjySBNyG1Iw/0tO5oIYyxtda2q/b
         WCzSOM7kwElGmjZctvpFm5BmqfsxjAjqBBxn4t3jBHtaMPU/cSjHcuTFbtkQJtYNxJ4X
         1hmg==
X-Forwarded-Encrypted: i=1; AHgh+RotvAsDnTq9qYqyJaIvWDmWPE4NWVf13x4zzifV4KwkTk7JrZU0HJ01S1fwJEp6W/UhKvaZqfpVMHg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+kuzFMDCUWuGY6gxGonYCMW1xOO0qGA2jJWDa1th3kEBBrW4k
	BS7O+aqnBKm+i4dR0TI93POxE/iO/4zBmGRvUweM/XZMod5Jcl3NgXtbiLujeCbD/A==
X-Gm-Gg: AfdE7cmjGQSNxsK5ujODyQFizk1LdaEpTXc4uh/Qh77chue9UzJdqatcHBh00mKZUeo
	tEVkcalDiYe8cTiHX/1s4fJqAG3K5ZS24fJUOPUi2r8W/6353zFjA6W4TiqzK7FaR9Ngh2L5mY6
	DSZ1w+7hts0qPnd5hLfWN3424vdbwN3Ygd8MjHtStNOuw3xWL+Tl0uJ+r/VnEMx7PW+tSo67J0j
	rxZ2hM+t1AtwmQIQUaEv2TqMPKmP5J/2byK+hN0TiQrWc520ewHRppRraDO03RB9Xpp9vv0Xjpp
	iT5WNkO6YFqDdnZ7T+zWQyPRR3RQw5Pe099rm9hGjNWZEMUthEsQ495Qc8z1kI+cm2PKowBLeGm
	QRT6HcvLEsz4mLc/3VYSshp/wXI/Mx81ms5h8BXqtnyLqs6GG47g3o5vrdpa+f2Lyv+Foa5RBwv
	OqISpAbXe2QHEwOjZYXr4noHj/XkD8U99481tCEFVMpBokollZW0umIhdY20dl7wDKAxDDgxK3d
	WS7
X-Received: by 2002:a05:600c:3143:b0:493:b150:c607 with SMTP id 5b1f17b1804b1-493f87e9fc7mr72424735e9.12.1783924917311;
        Sun, 12 Jul 2026 23:41:57 -0700 (PDT)
Message-ID: <d38333f3-0dd0-43ad-ab3d-c6366ae8c74f@suse.com>
Date: Mon, 13 Jul 2026 08:41:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/26] xen/riscv: introduce minimal virtual APLIC
 (vAPLIC) infrastructure
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
In-Reply-To: <69d18359-3fae-4618-b46a-ad52bcf1a027@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1783924917-6FD57FE7-DF46241F/0/0
X-purgate-type: clean
X-purgate-size: 2962
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D43D7479B5

On 10.07.2026 17:52, Oleksii Kurochko wrote:
> On 7/9/26 5:39 PM, Jan Beulich wrote:
>> On 06.07.2026 17:57, Oleksii Kurochko wrote:
>>> At the current development stage, only domain vINTC init and deinit
>>> operations are required, so implement those first.
>>>
>>> Initialize vAPLIC's domaincfg to with the interrupt-enable bit set and
>>> MSI delivery mode selected as the current solution is exepcted to have
>>> always IMSIC, and initialize vintc->ops.
>>
>> How would domaincfg be initialized on real hardware? 
> 
> Xen will initialize that in aplic_init_hw_interrupts():
> writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &aplic.regs->domaincfg);

I.e. it is very much something the OS should do.

> I can see that maybe
>> firmware would have to set DM suitably (and you may mean to take firmware's
>> role here). 
> 
> I don't think that firmware will do that (and OpenSBI for example 
> doesn't do that). If firmware can do that we for sure want to control in 
> Xen what is written to ->domaincfg.
> 
>> But isn't setting at least IE entirely the OSes responsibility?
> 
> At least, Linux setups ->domaincfg once at the boot time:
> 
> 	/* Setup APLIC domaincfg register */
> 	val = readl(priv->regs + APLIC_DOMAINCFG);
> 	val |= APLIC_DOMAINCFG_IE;
> 	if (msi_mode)
> 		val |= APLIC_DOMAINCFG_DM;
> 	writel(val, priv->regs + APLIC_DOMAINCFG);
> 	if (readl(priv->regs + APLIC_DOMAINCFG) != val)
> 		dev_warn(priv->dev, "unable to write 0x%x in domaincfg\n", val);
> 
> And don't touch this register anymore, even for interrupt disablement it 
> isn't used.
> 
> So Xen can just does once:
> writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &aplic.regs->domaincfg);
> 
> and then just properly handle access of a guest to domaincfg.

Xen can do this for itself, sure. But shouldn't domaincfg as seen by guests
start out 0 then?

>>> --- a/xen/arch/riscv/include/asm/aplic.h
>>> +++ b/xen/arch/riscv/include/asm/aplic.h
>>> @@ -15,6 +15,8 @@
>>>   
>>>   #include <asm/imsic.h>
>>>   
>>> +/* domaincfg bits 31:24 are read-only 0x80 */
>>> +#define APLIC_DOMAINCFG_RO      (0x80U << 24)
>>
>> Bit 7 is also documented as read-only 0. Wouldn't the comment better reflect
>> that as well?
> 
> Not sure, bits 31:24 are read-only *0x80* but bit 7 is read-only *0*.

And would it hurt if the comment said so, to avoid any ambiguity?

>>>   #define APLIC_DOMAINCFG_IE      BIT(8, U)
>>>   #define APLIC_DOMAINCFG_DM      BIT(2, U)
>>
>> Wouldn't you better spell out BE as well?
> 
> I can add:
>    #define APLIC_DOMAINCFG_BE       BIT(0, U)
> 
> But it isn't used at the moment (Linux also defines it but never 
> actually using it). Do you want still to add that now?

Imo it would be better to have a complete set of definitions. If you
don't allow guests to set this bit, perhaps to emit a sufficiently
informative debug log messages you may want to use the #define?

Jan

