Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oByVDcTd4Gm9mwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 15:01:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ABE40E712
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 15:01:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283428.1565662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDMLW-0007Ku-KI; Thu, 16 Apr 2026 13:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283428.1565662; Thu, 16 Apr 2026 13:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDMLW-0007JS-HP; Thu, 16 Apr 2026 13:01:26 +0000
Received: by outflank-mailman (input) for mailman id 1283428;
 Thu, 16 Apr 2026 13:01:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDMLU-0007JM-MP
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 13:01:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDMLU-00GVtf-33
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 15:01:24 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0dda3-2eae-0a2a0a5409dd-0a2a4503e926-6
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 15:01:23 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0dda3-672d-0a2a45030019-d155802dc16e-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 15:01:23 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso75329655e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 06:01:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead35bf1esm14139499f8f.16.2026.04.16.06.01.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 06:01:22 -0700 (PDT)
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
        d=suse.com; s=google; t=1776344483; x=1776949283; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=65ANu0MURn8ab4e3Y3mOo2/bz288YqetAYIt4UinN/s=;
        b=cJuvlNrBMOWUIxTdUMjLjX92Dclj5mDz3HW0oSSF6L8Mng7tLjrSVc6PiEDioKfmvI
         Pqv/ec/hT9Zgikw1fZ0quR0zGZaVoN7jsVq2mncZRpE3CYvvuHlOV4+bA92rbk60Qgoj
         8oOum0C5FwbC4X7gn/f52NZFPFNgK5Ogy/zl7O7fq58uLMwe5de1LJJJBAeYTg2gtr1I
         9ieiftRVZ6v741ivSh32Xt4IWAu7z8VtUFT1hAHRRhz289qMMF+zdFCkHwi0DVp8aYnp
         EMHd/G8OlVXwV8nwnYudjrVW/wz8Q4lLvBQZDqJjwNv+sSuZJx362LFkmRcYlEqUkPHq
         wmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776344483; x=1776949283;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65ANu0MURn8ab4e3Y3mOo2/bz288YqetAYIt4UinN/s=;
        b=ma8RY1MKpycQEhAUB8Mt6h4wQdI1PzNKRsv/YGHFNQa4UYALtSubUD8BfjLaNjO32N
         chjZDo6hJXPS8NS8m8kGcTbI2zxhqvVLDlhrV74EPRVw1wtXqK9lmyld5btGlC1BLk6S
         NJ51ViVGjyC4Alnq+REkBWQcs0uUmEyqX/OyPp4mTZFFbPKmLN2nAn0jiRgHvyaPwtlN
         CGQgcPpuVjv/oqlnF/1UOQF3EcJtB1nuzxxrfBYx9IzbazZtBWgvQa4169Fd6UCG0Ion
         Z2P1gkaAWvYRVQnCDQRsvGVwc+pjgVSfOaOOGqk71wvBg9xD6/Av/C6sD9r/FbeEr0cg
         Rcbw==
X-Forwarded-Encrypted: i=1; AFNElJ/r3G5L3OOQ55drqaPwqVgqAgh+rw8sVSxFCyFnbZlAbMW0/qxLW42C6EdBhDomNWwRd7KEFU1/1uU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzM9dXTCfQfBVDYjNgOhRQ4um8158TOQ0nvNOyab8eKRy1Dk8g0
	To8oh9sfYb5rWo150OWkqORtgdlPSFAEebInGN0qArm4JdErTDOKqIcw7vQMjCtccA==
X-Gm-Gg: AeBDieuoLPH9dfsfR42TBmnb0BoH9cdAoiKw49juutmkHxNrM15nIT3KTxLReCNHh/e
	lX9j+JhZxo46uy5Lb8qK/cEU+DvogeId5CDrddqXz7SAmI1IoX+LzBSNFUMZZXN2g7h/hUMkMwF
	/3r/wBYks0grRoz++8bLwX+OR1LEBXIlhd+kOUj0AtPLh9VINKB7suBsDR076CoXTjuf5po2FO7
	EyvcS0pGa8Qz7buk8rnuJWphIL7mIywKZozp4+iM6SnjufEGNJoqqyiuzcZL9lohZIPTbCm5Vk2
	c41uPehrgI2EJloRM2iJahYPgHfm/0lTfRDKQcljQvTy8LIqBFIY//HWp5vjMTa7Kk4ConLJMWd
	9spQENIuoCB2ubWuWiZtKnmtSCnxfvb6l42VI17nxo5CsoyZWNndwwX+KryxTkJ/Icd/ChlJA42
	Oneb0OVEpi/C9Ifw/106RYA0T/RyR+hbgOy06dL3atLidOk64/bK0QoehHK5k6zMleW8u294kXR
	lIL0D6cq/QNTSfA0zKBHEcLAsyez9Qr/z7X
X-Received: by 2002:a05:6000:4203:b0:43d:9bb5:bd97 with SMTP id ffacd0b85a97d-43d9bb5bfa7mr18130856f8f.8.1776344483104;
        Thu, 16 Apr 2026 06:01:23 -0700 (PDT)
Message-ID: <e70e141b-fe40-41f2-9101-e65758e7f7b6@suse.com>
Date: Thu, 16 Apr 2026 15:01:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 18/27] xen/riscv: add vaplic access check
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
 <0fc9adf790d4f981e8117bd9759c7e64bb11e439.1773157782.git.oleksii.kurochko@gmail.com>
 <0519fb8a-48e3-4f36-8d6c-a966080ffb55@suse.com>
 <f0503bd6-3ea3-42da-9211-02836addc176@gmail.com>
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
In-Reply-To: <f0503bd6-3ea3-42da-9211-02836addc176@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1776344483-A0975938-154E628A/0/0
X-purgate-type: clean
X-purgate-size: 1901
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RSPAMD_URIBL_FAIL(0.00)[suse.com:query timed out];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: D4ABE40E712
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14.04.2026 13:45, Oleksii Kurochko wrote:
> On 4/2/26 3:10 PM, Jan Beulich wrote:
>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/aplic.c
>>> +++ b/xen/arch/riscv/aplic.c
>>> @@ -38,6 +38,7 @@ static struct aplic_priv aplic = {
>>>   
>>>   static struct intc_info __ro_after_init aplic_info = {
>>>       .hw_version = INTC_APLIC,
>>> +    .private = &aplic,
>>
>> Isn't this the host instance again? How can you ...
>>
>>> --- a/xen/arch/riscv/vaplic.c
>>> +++ b/xen/arch/riscv/vaplic.c
>>> @@ -127,6 +127,20 @@ int vaplic_map_device_irqs_to_domain(struct domain *d,
>>>       return 0;
>>>   }
>>>   
>>> +static int cf_check vaplic_is_access(const struct vcpu *vcpu,
>>> +                                     const unsigned long addr)
>>> +{
>>> +    const struct vaplic *vaplic = to_vaplic(vcpu->domain->arch.vintc);
>>> +    const struct aplic_priv *priv = vaplic->base.info->private;
>>> +    const paddr_t paddr_end = priv->paddr_start + priv->size;
>>> +
>>> +    /* check if it is an APLIC access */
>>> +    if ( priv->paddr_start <= addr && addr < paddr_end )
>>
>> ... use that here? Or asked differently, again: Where's the virtualization,
>> i.e. the abstraction away from host properties?
> 
> With the current use case it was easier to choose such approach then 
> provide the full abstraction.
> 
>> Furthermore, is it really sufficient to check just the starting address of
>> an access? Shouldn't the last byte accessed also fall into the range in
>> question?
> 
> I think that it is okay, my understanding is that *paddr_end technically 
> is another range.

Of course it is. But a multi-byte access crossing the paddr_end boundary
isn't purely an APLIC one. You can reject such for simplicity, but I'm
unconvinced that you can claim you will be able to correctly handle it
without proper merging.

Jan

