Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pIXeFe3RO2rNdggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 14:47:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF406BE3F4
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 14:47:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=UdMcjrZO;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344896.1603913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcN0l-0007dK-QQ; Wed, 24 Jun 2026 12:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344896.1603913; Wed, 24 Jun 2026 12:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcN0l-0007aX-MW; Wed, 24 Jun 2026 12:47:23 +0000
Received: by outflank-mailman (input) for mailman id 1344896;
 Wed, 24 Jun 2026 12:47:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcN0k-0007aR-A9
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 12:47:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcN0j-0051Us-FZ
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 14:47:21 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bd1cd-bab6-0a2a0a5309dd-0a2a4506e878-34
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 14:47:21 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bd1d9-08de-0a2a45060019-d155dd2ae5e7-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 14:47:21 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-46066e640easo673338f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 05:47:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c221d9405sm7454956f8f.22.2026.06.24.05.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 05:47:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1782305241; x=1782910041; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n7Hx7LfGNdYKCuhuZ8Gd8mOVrC3DxHk5SbmvZbiO5Ls=;
        b=UdMcjrZOAx9HbjWdZAYhVNi755kMatH6zPSDxdOr7KUV9ZtM1nq0f+8Sx6bi3QleLC
         3lLvPriaUYhsT3SYJQ6thuoGGzxrNFSxmiaU0CVrMe4BHNuSpBtsnRv41c1+W/MazfPL
         lpSMuCaMjxRV+pd5qxJZFbm0OunopVehjpZELm+SaxhYglnxy4CUQt9EspESdgEk8iXL
         Ia9TCA4FtanuAfYGJRaUtYDklyE/n2qHQe3aS1f48F1RnSOz0zR7tGPOu7/QhvGW+gjD
         2wnPG43lL0EcpbATp7IleC6S9ZxWC2Gto1n5bfUklWgSTXqDAMkujK8VePgv6ef84ENd
         Wr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782305241; x=1782910041;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7Hx7LfGNdYKCuhuZ8Gd8mOVrC3DxHk5SbmvZbiO5Ls=;
        b=WCJvVYUwezsnWBAjAsu4RkA3TNCkfa9Ldl5VmwyMvQPTFc5T+OjAeOh6lNLvKyVYq9
         ZTrcIHoJOi5WdGhHUy96kF4HbvXSW3ibsIKquNfdhnYO7BtKr+ZYjnsixRtRailsz3X0
         ECdlKC0LQeVOo5/kJ7WwQsIB/P8xCONLfIyOJTZ5EBk1cTiIVBf6jmb97WIVIaf+Cifk
         bGmsVWKSsmvaZ3WSyD9fHkA0LC4W6UEE/qabM84DDUdNiVTFrBX9H3p9cejtQ+fXUYMv
         MJuWwHul8WiAZCFrpYQ2+f3KScTi64VkBsrf5RbOdDeA7usyS6zU9HOyY9A4vn3avE0A
         fGVw==
X-Forwarded-Encrypted: i=1; AHgh+RqGbKs35FSvuzIODuAYJ95IpemdC8thNP5mCg1CLqxwCHKIUZJVapdnekKkHwTtbJ3YwqdsVS3mpIo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzw21LE7ooW+LbzxjGD+ftjLdaDQgFGDgF3oVQBfeHQzEqDVDaf
	GkrQArHQ8BDSM0U6bqIZKjzV0E4S0RqYic/iv/sl7gcT6LrVTC7Ofb2MywDbWwKONw==
X-Gm-Gg: AfdE7cmq20pLRUGRIw6LT3ive6pMpoTtaFpQ6z5OLIv+WYjTSlhFwVklm9So8rtAOCY
	eCKRwI0VkhSzOTPV1Z0GoYxsLR64zmBIhd8INSY4m758RtsDA8rfZppgxzElUBQEgrOKrcCGwgW
	MnU3P/fqt8tY1B5VL3Q1Nemz53BIBN99JRJicHNHtX2FR3CKapdsuA9xzimYdDwV8iB/pm0gwdr
	r9XUBui03Fjho3PCJ3Up5L6vECZ3PXdB52zJtEJZqExXZmKgb6vWBUKG0ayVjlZPZ5NPYu8sXiI
	9JqhPtXwGXP4duuJqCt8LahtKTljhG3Ljkn2mDEkVxcjMmK5j9byN9VmrsaXCVVkELAygX3W1EZ
	Rr6KDV2TIVDtL3gS51nrXrBCG1gX3t12yokTnecC6qrsnN8GdjI3NdRqbGgzUB2xtfKomJfoccZ
	Pl5hbw63kck5cR4bzBPPGquHmS01tmB1dS+x0hlOqVkh3gq0Dd20hR0XrkRZthqfZz2jU4kSO5D
	sGU
X-Received: by 2002:a5d:64cd:0:b0:46a:bda2:9255 with SMTP id ffacd0b85a97d-46c0ab3cac5mr5114333f8f.19.1782305240890;
        Wed, 24 Jun 2026 05:47:20 -0700 (PDT)
Message-ID: <ddf8c897-1a13-4d25-98ca-331c54913af3@suse.com>
Date: Wed, 24 Jun 2026 14:47:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/23] xen/riscv: introduce init interrupt controller
 operations
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
 <da217bc51799d46666a740f38e00efc6de554ffc.1781693963.git.oleksii.kurochko@gmail.com>
 <1bb1a400-ed4f-470e-8f20-779d2c09c03d@suse.com>
 <81b60619-28f7-42e9-a6c6-be9016fe5918@gmail.com>
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
In-Reply-To: <81b60619-28f7-42e9-a6c6-be9016fe5918@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1782305241-4372868D-BF01E9E5/0/0
X-purgate-type: clean
X-purgate-size: 1801
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime];
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
X-Rspamd-Queue-Id: ABF406BE3F4

On 24.06.2026 13:34, Oleksii Kurochko wrote:
> On 6/22/26 4:30 PM, Jan Beulich wrote:
>> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>> Strictly speaking ...
>>
>>> --- a/xen/arch/riscv/aplic.c
>>> +++ b/xen/arch/riscv/aplic.c
>>> @@ -306,12 +306,16 @@ static const hw_irq_controller aplic_xen_irq_type = {
>>>   
>>>   static const struct intc_hw_operations aplic_ops = {
>>>       .info                = &aplic_info,
>>> -    .init                = aplic_init,
>>>       .host_irq_type       = &aplic_xen_irq_type,
>>>       .handle_interrupt    = aplic_handle_interrupt,
>>>       .set_irq_type        = aplic_set_irq_type,
>>>   };
>>>   
>>> +static const struct intc_hw_init_ops __initconst aplic_init_ops = {
>>
>> ... I think this needs to use __initconstrel, as ...
>>
>>> +    .ops                 = &aplic_ops,
>>> +    .init                = aplic_init,
>>> +};
>>
>> ... both initialized fields incur a relocation.
> 
> Isn’t it needed only when `aplic_init_ops.{ops,init}` is saved in a 
> variable that doesn’t belong to the `.init` section, so that a potential 
> dereference of already freed memory could occur?

No, that's no different between __init{data,const,constrel}. The issue here
is that at least in PIC mode const global variables with initializers will
go into .data.rel.ro (or alike), not .rodata. That's because this section
should be writable, yet there shouldn't be writable contributions to
.rodata.

Since __initconst{,rel} include section placement, the former of the two
(.init.rodata) should end up r/o, while the latter of the two
(.init.rodata.rel) should again be r/w. Mismatched contributions would
screw up the attributes, and assemblers in the past did (and legitimately
may) warn about such mismatches.

Jan

