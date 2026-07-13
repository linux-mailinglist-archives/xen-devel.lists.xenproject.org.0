Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +NQiNQ0IVWqnjAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 17:45:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1449A74D364
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 17:45:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=aQ5xxfzq;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1361752.1613859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjIpz-0002PT-Fj; Mon, 13 Jul 2026 15:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361752.1613859; Mon, 13 Jul 2026 15:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjIpz-0002Mw-Cv; Mon, 13 Jul 2026 15:44:55 +0000
Received: by outflank-mailman (input) for mailman id 1361752;
 Mon, 13 Jul 2026 15:44:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wjIpx-0002Mq-6d
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 15:44:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjIpw-00EEpJ-1C
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 17:44:52 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5507e5-bab6-0a2a0a5309dd-0a2a450cd1ac-28
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 17:44:51 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a5507f3-e897-0a2a450c0019-d155dd30ed96-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 17:44:51 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so2874335f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 08:44:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f464a9879sm292433f8f.22.2026.07.13.08.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 08:44:50 -0700 (PDT)
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
        d=suse.com; s=google; t=1783957491; x=1784562291; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUZRsRrDGefVBItN7uo9IpSWFDna2veakK9aM223qQs=;
        b=aQ5xxfzqaCAgYLsbBSx0Qqw3DrngbivGi/hWbA4Zh8CBZm2S5Hs9cjQG8wsEtb6VQA
         CmWZlGMsRp1R2k42dQb32gzDUT4WMD3WhGrg/qpmijEySDobhw+dFvsN+LEmw9nfMIZx
         Ap8s2jO+SciR7iUXDo9YVrnZ4i3AInLfE9ixkXBob+UKawz9eWh5VoaZW87rbNv/sST2
         DW3R4eAfsxEDTF+N0AioF/UTquWRi5MeqDoBBnEYSjp4RmuiWGubRQgg+YHj4XY/f0ZA
         BrAgV6/Rtweij1XnanmpO+TFOPi8r2Is4a9MYTqBw+nTvFJJqxbj7TL/NX7i+8ed56S9
         k7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783957491; x=1784562291;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUZRsRrDGefVBItN7uo9IpSWFDna2veakK9aM223qQs=;
        b=lHhJJrZYqns9OmAuhH834P7YCmvk5YEtBnELOl6juDZF5nrWJxZetWMERNmHkF9zSX
         akQj87XliIxp5fe2LctevrO5yq1eipTazqPOochS3iCYl/vQ+mbt3O+RSFZlZURRjwxZ
         qVXgz7QSBtedkim+3Tnj6sG3nR6PMVfXRj7m6zBharUk73iz+i+hcZV2DePURFW+q8dh
         VQSrGATcqZOsxJdfmVpyfP5GYM/Vro7Mrde8Y7AJCvjCD4qcK15osJXXqhLbOJOIj6KJ
         qTyCPZ1X+EpV9r4lsyRGl50SdiHGH5dtfxRnpxeAYlDg8NDqlH3oTUu25ODXgSTrgf7V
         dH/w==
X-Forwarded-Encrypted: i=1; AHgh+RpMU0ZHtWGbbtaKFgmyJd9pTpmQBv/554qN53rUvuS05Vz53s26vv7CffiKpvAcS7myRQ1PQUtlhV8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqE3/CyxSn44dWY+KI4x5H9HklF1lchz49Qobh3Sx3hSWOI/7g
	yLR3J7pEVIYp3HegJxBq6Pa8Jh0EOUKJrIJnr0lsthkVJvrzbswx5PVlert5PyvUJA==
X-Gm-Gg: AfdE7clLneqbQpQswK8cv6j21GFH4EtUAX2wSU4OjU8nH7mX1qvqtLZWgtNixl+XAn2
	CFTWJcJJQgOD1UjD+hpmzlNqMwnbI5U7lIE+zEdppchWdgtLg7OeWFEtPSgwTkVry8+PGsyzvhF
	1AoSyLUp750hHt8uXVEMR+1yTshe5Zhvu1S87szWCYm0mLtVGfpNAujw/ybY1E44BmQsh0m/FKJ
	gmZl3H5yDEwJS4NfGKMrd6z3bslM2ZtAhfwr0x/LBruruF39+G1HKxwwVaFiRs6bMpqaoSzk2fc
	38Z5A9WBWz56qexRxGFQyK23KC4MSzzj+r+vOu3gMvmxyAguLU6BlGv3G02L4N0Lydk3sGQ8B9d
	L43QER+loY8dZj2Hk8FJp/bWOh4e8SYfOkwyzWawehVn3vLJNnaxAzlAYj22J0Avh1XzrKWlBam
	jNLABEh99y6EgxhdqUgACbgECXcN+Q3U0N/NklC3e5fTkjl3PJ5SUJyHDcCQQoFXN6uebc95r51
	7C0PzCu8BN/6wc=
X-Received: by 2002:a5d:5846:0:b0:475:94e1:29d5 with SMTP id ffacd0b85a97d-47f2dce942amr10525788f8f.20.1783957491298;
        Mon, 13 Jul 2026 08:44:51 -0700 (PDT)
Message-ID: <65ddc5ef-4354-40c1-b864-382d7143ed3d@suse.com>
Date: Mon, 13 Jul 2026 17:44:49 +0200
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
 <d38333f3-0dd0-43ad-ab3d-c6366ae8c74f@suse.com>
 <2d0877f5-2fc1-4f53-b662-c377788e02ca@gmail.com>
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
In-Reply-To: <2d0877f5-2fc1-4f53-b662-c377788e02ca@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1783957491-573696B2-95062C4A/0/0
X-purgate-type: clean
X-purgate-size: 2669
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
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1449A74D364

On 13.07.2026 11:57, Oleksii Kurochko wrote:
> 
> 
> On 7/13/26 8:41 AM, Jan Beulich wrote:
>> On 10.07.2026 17:52, Oleksii Kurochko wrote:
>>> On 7/9/26 5:39 PM, Jan Beulich wrote:
>>>> On 06.07.2026 17:57, Oleksii Kurochko wrote:
>>>>> At the current development stage, only domain vINTC init and deinit
>>>>> operations are required, so implement those first.
>>>>>
>>>>> Initialize vAPLIC's domaincfg to with the interrupt-enable bit set and
>>>>> MSI delivery mode selected as the current solution is exepcted to have
>>>>> always IMSIC, and initialize vintc->ops.
>>>>
>>>> How would domaincfg be initialized on real hardware?
>>>
>>> Xen will initialize that in aplic_init_hw_interrupts():
>>> writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &aplic.regs->domaincfg);
>>
>> I.e. it is very much something the OS should do.
>>
>>> I can see that maybe
>>>> firmware would have to set DM suitably (and you may mean to take firmware's
>>>> role here).
>>>
>>> I don't think that firmware will do that (and OpenSBI for example
>>> doesn't do that). If firmware can do that we for sure want to control in
>>> Xen what is written to ->domaincfg.
>>>
>>>> But isn't setting at least IE entirely the OSes responsibility?
>>>
>>> At least, Linux setups ->domaincfg once at the boot time:
>>>
>>> 	/* Setup APLIC domaincfg register */
>>> 	val = readl(priv->regs + APLIC_DOMAINCFG);
>>> 	val |= APLIC_DOMAINCFG_IE;
>>> 	if (msi_mode)
>>> 		val |= APLIC_DOMAINCFG_DM;
>>> 	writel(val, priv->regs + APLIC_DOMAINCFG);
>>> 	if (readl(priv->regs + APLIC_DOMAINCFG) != val)
>>> 		dev_warn(priv->dev, "unable to write 0x%x in domaincfg\n", val);
>>>
>>> And don't touch this register anymore, even for interrupt disablement it
>>> isn't used.
>>>
>>> So Xen can just does once:
>>> writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &aplic.regs->domaincfg);
>>>
>>> and then just properly handle access of a guest to domaincfg.
>>
>> Xen can do this for itself, sure. But shouldn't domaincfg as seen by guests
>> start out 0 then?
> 
> Now I think I understand your point.
> 
> I agree that it should start from 0 (or from 0x80000000, since bits 
> 31:24 are read-only and fixed to 0x80). All other bits should be set or 
> cleared by the guest and written to vaplic->regs.domaincfg when the 
> guest accesses the vAPLIC domaincfg register.
> 
> In that case, domain_vaplic_init() should initialize ->domaincfg as:
>    vaplic->regs.domaincfg = APLIC_DOMAINCFG_RO;
> 
> instead of:
>    vaplic->regs.domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM |
>                           APLIC_DOMAINCFG_RO;

Yes.

Jan

