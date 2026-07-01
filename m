Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OuuTBmgARWqN4woAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 13:56:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 914A66ED027
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 13:56:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Z8geJSq+;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1349875.1607512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wetY5-0003V8-Vq; Wed, 01 Jul 2026 11:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349875.1607512; Wed, 01 Jul 2026 11:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wetY5-0003SS-SW; Wed, 01 Jul 2026 11:56:13 +0000
Received: by outflank-mailman (input) for mailman id 1349875;
 Wed, 01 Jul 2026 11:56:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wetY4-0003S8-3h
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 11:56:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wetY3-008Rnf-GU
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 13:56:11 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a450051-5cb7-0a2a0a5109dd-0a2a4502beac-16
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:56:06 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a450056-5a27-0a2a45020019-d155dd2dd8aa-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:56:06 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-472055b0efaso353776f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 04:56:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-475674af239sm15057499f8f.30.2026.07.01.04.55.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 04:55:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1782906966; x=1783511766; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2ILDaRNTeZo5u0FIEIEa4IBQ8JWXbZOhNQFsEyvANNQ=;
        b=Z8geJSq+uFFrC1vzYc/xJjOK1rWggXmvVmDg0m643YeCSrx+Y66y4hkjaXpWzXZbgm
         +khJMF59aSNk37z17XgbFWz7Vr2jDAgIbC/6rS7tuijd8DuGsr9cTOJaEL5/16A6zAAo
         2a7xszjbb/E60QVVJ2kZ5u6iYU7LF3qIBRNfsLRcks1/SJ+Syednl7HafRMC1LH5LDKy
         3JMAADuGiPcWwVu2ahS/XO5B1PlMbaLeDaR9ERsjWKUFenTJJpBz8M2c3EDUPuE8E/Cp
         tnutyQbZ3qutH1ifHdTiKPpq8VtppPo9MY/Fd/nyKa13F8W82IfllMpAwq8kFVqxlyr7
         qzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782906966; x=1783511766;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ILDaRNTeZo5u0FIEIEa4IBQ8JWXbZOhNQFsEyvANNQ=;
        b=PBeC/eCzzR94+iwJ9DRXgBkdBrq+7N+3Ud4NKlfN11Jn1ewLzBT9xvGWkLP1R2l0HW
         UVeUS6o7jPzog5gN651PEB9/GADE94cDkk0EpQBjOiPDlLKl2mPp9cO0YYakl2/wzFVB
         Sv06rdaXLTxDOlUdE/simeNDaNr15SZKuORofyISO79tMhIEE7InaOfFdWfb09LcMDMD
         SCPGLdoFAVeZAGoQXIkqFOs8dgSBfPDnQYINX3bsQb8eCwk9K1tRjTjYBRt2sNrfH5eh
         pBzRQpRpED74wDoyZ7Ok+91KTkd8f/uFhyAuzCrem3A1M3du+CgSTjDDowtPh7Rcuvjn
         bxdg==
X-Forwarded-Encrypted: i=1; AHgh+Rqxg7V3bcN/RQ1gTerUJ7YG4WHCkfbSRpGclI4Go3yu1ql3SnJozCL/d8y6IJgcucuSX/IUh/Eqn2E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJff7wgI9rlKK8Lt9iGSjkClEScsFUNuP7aYWMuWItvBgw6r4j
	5fSwLt0wFWg0k8oE3Wb10akrfvEkwCT2067YJbRQSPblQZIVFdt4t+xfiHk3T/nlig==
X-Gm-Gg: AfdE7clZiDrjXDbvZMPD1RNXZQtYK70yU9cLKXomuZhl7vbfuL+xW+Vv0kRRr9TNofz
	lbkbfT4xCg7A6Ve4/mL8joBjENets8yS+uS58PIcfSuDWvwyQz5npNvUMIQiC3PaScAA7i9WIBj
	XPB/dbCSQITG0gpUjpSmQ0x2YeIRogM92h9aaJfGKEb72IA4lWfp+jIol+VTjNCkfqQ2QmvN2df
	TaNvGxDtIwyg+0mqqQcP4JOLLff42Pi4ygtTj+KAfP7E0EoNLSiog9OfEntOri/9u6Mc1IGfode
	2xGoLhscJaOQjys9MQy0nYD1aBC4dN8v7EjweO7U5VeaXL5cPzHL6S/sLA1NP0YzUCn04IeqHNR
	JkP5mE4U1MCakPfGBXN3Cj4xJ0oR+I3yeTw3W/Dft/cYFc+rR8EJbj4HJXsmG6cQV8n7UcFW9v6
	WKW9j1+/VDr0yFIHsPsj97GHlrdGBkEr/I/XF8scIk4BSeRAcH2tNioCVT/o7soqJzoattVO1C+
	VYX
X-Received: by 2002:a05:6000:2203:b0:473:1089:154f with SMTP id ffacd0b85a97d-4775466f2a2mr2405684f8f.0.1782906965667;
        Wed, 01 Jul 2026 04:56:05 -0700 (PDT)
Message-ID: <3c672ea8-3dc9-468d-9ca4-d6ceaf6c8cb3@suse.com>
Date: Wed, 1 Jul 2026 13:55:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/25] xen/riscv: generate IMSIC DT node for guest
 domains
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
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <424c223b97e9d27aa4ef4e05e2d5c8d0c426324c.1782487661.git.oleksii.kurochko@gmail.com>
 <77d3cf2c-3ed7-45f8-8e76-72520e71306b@suse.com>
 <018771c4-043d-4b29-ac40-284ee8692334@gmail.com>
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
In-Reply-To: <018771c4-043d-4b29-ac40-284ee8692334@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1782906966-4EB177C5-C78C79F4/0/0
X-purgate-type: clean
X-purgate-size: 3212
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 914A66ED027

On 01.07.2026 13:21, Oleksii Kurochko wrote:
> On 6/29/26 5:19 PM, Jan Beulich wrote:
>> On 26.06.2026 17:46, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/imsic.c
>>> +++ b/xen/arch/riscv/imsic.c
>>> @@ -13,8 +13,12 @@
>>>   #include <xen/const.h>
>>>   #include <xen/cpumask.h>
>>>   #include <xen/device_tree.h>
>>> +#include <xen/domain.h>
>>>   #include <xen/errno.h>
>>> +#include <xen/fdt-domain-build.h>
>>> +#include <xen/fdt-kernel.h>
>>>   #include <xen/init.h>
>>> +#include <xen/libfdt/libfdt.h>
>>>   #include <xen/macros.h>
>>>   #include <xen/sched.h>
>>>   #include <xen/smp.h>
>>> @@ -34,6 +38,16 @@ static struct imsic_config imsic_cfg = {
>>>       .lock = SPIN_LOCK_UNLOCKED,
>>>   };
>>>   
>>> +/*
>>> + * Number of MSIs available to a guest. Determined by the host interrupt
>>> + * controller, so it is identical for every domain -- hence a single global
>>> + * rather than a per-domain value.
>>> + */
>>> +static unsigned int __read_mostly guest_num_msis;
>>> +
>>> +#define GUEST_IMSIC_COMPATIBLE "riscv,imsics"
>>> +#define GUEST_IMSIC_NUM_MSIS 255
>>
>> Considering its use this isn't named correctly - it's not the number of MSIs
>> guests get to use.
> 
> I will rename to GUEST_IMSIC_NUM_IDS then it will be fully aligned with 
> dts property name.
> 
> Then it makes sense to rename guest_num_msis to guest_num_ids.

That's not going to help address my remark. I specifically referred to ...

>>> +int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
>>> +                                    unsigned int *phandle)
>>> +{
>>> +    int res;
>>> +    void *fdt = kinfo->fdt;
>>> +    char vimsic_name[32];
>>> +    unsigned int vimsic_phandle;
>>> +    unsigned int num_msis = min(GUEST_IMSIC_NUM_MSIS + 0U, guest_num_msis);
>>
>> As guest_num_msis (supposedly) doesn't change anymore after it was set, why
>> would this need calculating again for each call here? Can't you apply the
>> upper bound right in imsic_parse_node()?
> 
> Agree, I will add the following to imsic_parse_node() after 
> guest_num_msis is init-ed:
> 
> guest_num_msis = min(GUEST_IMSIC_NUM_MSIS + 0U, guest_num_msis);

... the sole use of the constant (here). The number of MSIs (or IDs or
whatever else) isn't GUEST_IMSIC_NUM_MSIS; that's merely an upper bound
(which in turn is there for an unknown to me reason).

>>> --- a/xen/arch/riscv/include/asm/guest-layout.h
>>> +++ b/xen/arch/riscv/include/asm/guest-layout.h
>>> @@ -3,6 +3,12 @@
>>>   
>>>   #include <public/xen.h>
>>>   
>>> +/*
>>> + * Base address of the guest's supervisor-mode IMSIC. The value is the address
>>> + * typically used for IMSIC by QEMU.
>>> + */
>>> +#define GUEST_IMSIC_S_BASE _UL(0x28000000)
>>
>> As you mention it explicitly: Is there also a user-mode IMSIC?
> 
> I am not aware of such.
> 
> I mention it explicitly as machine mode IMSIC exists and it is a 
> separate DT node for that.

Ah, okay. Then maybe keep the comment as is. It's not quite clear to me
whether, from an abstract perspective, "machine mode" could make sense
for guests. If it can't, "supervisor-mode" would be redundant with
"guest's".

Jan

