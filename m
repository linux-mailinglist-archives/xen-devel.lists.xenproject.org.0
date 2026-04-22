Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEm6Aq3Q6GklQQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 15:44:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CACA446E1D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 15:44:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290597.1570157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFXs0-0006lE-6l; Wed, 22 Apr 2026 13:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290597.1570157; Wed, 22 Apr 2026 13:44:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFXs0-0006j0-3v; Wed, 22 Apr 2026 13:44:00 +0000
Received: by outflank-mailman (input) for mailman id 1290597;
 Wed, 22 Apr 2026 13:43:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFXrz-0006iu-10
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:43:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFXry-00F0FH-EA
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 15:43:58 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8d07f-e002-0a2a0a5209dd-0a2a4502e1be-34
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:43:58 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8d09e-af86-0a2a45020019-d1558035d57d-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:43:58 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-488ba840146so50403095e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 06:43:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891bb3d121sm391052345e9.14.2026.04.22.06.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 06:43:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1776865438; x=1777470238; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UfD0R2QSBo+nfzE7Rs3ruGGWE2Ag0B+vEBaytHV/A1w=;
        b=NHpO7L1AlQHBcIp7AJceNQfa1+VWNJ8Nq/ahfBRmzs35TRjpmRp65cYCqJm2SFMZmP
         WwUr/ILgKqceXIfcVlGlTFzyPAG7GD44wGF0z5D055zjTcvXC732MB9LIySxgIGJdYU/
         KfVrwyavI62ITt7kcjg3M8iT3Rg3VouCTKHR2GYb1kL+Gw7+kVriY9VrvcTJVLOGUjMX
         7BoKqC7yGVzPs7RvuPMrY770yLhPK2B7fYAy9YjvPv4F9G5fPagnyWhZjWauOdKJnBW7
         B5S++mvLPKbFD6qVcfxt7s+5g4SfUmXGyrba1rwk9Z3kHghWEDc3VVIt6z+JFI3FS1d8
         n58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776865438; x=1777470238;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfD0R2QSBo+nfzE7Rs3ruGGWE2Ag0B+vEBaytHV/A1w=;
        b=SnvToUvAUIUWpoHv12FP/v+TSz8/zz7QxhLhBdxngHNxKZzZB5Y9pJR4PTO4KV+5b/
         HQvuOyRzeFlWeSCglhvpRjRIrk7LZ/sLQuzZjgFuDBa6E5LfDrsO2zUKU0/wTLD5jRGV
         MlC6XKZ5sp4/ECr9y89kj7lGu4wiitbbxJTuYzkVgu26DPEGZGDw+tEknBpAyyujIg7n
         P7tQIeSmAI8K0Ik0b17WkOrsR2KE7H2LxiejnjQUa7nJcwERdfSZnvV31/Y4M+9X786/
         YQn3J1i7z6XM5S2y1+Zzh4z3Y/oGBt2UXTaLtxFg7G4THRv9P85EHYEWAS5C36Cag6EO
         MkNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+r5T+lkLdvUYRA4e7hSDxa0SxOjlZGgsqStO7F4T9hBOJwaCv/WgP6t0HPPvtRcbPAHI5/HTRDYNM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyn2XOVYquWQWssMTkC9BiZKUXz6hOoDwTHxBb5qh0juH6dCm4v
	Ea21uOUtr7jFNca0p/fkUCLiAccwpMlBQ2EFsP/WjUTQ3C8zUnsqir2zeklePBvob+P3QmZCJu/
	LL+Ra+g==
X-Gm-Gg: AeBDievPhs0C4NdOZ6d6tW81VcXI0264O4GX4arBKIo4sRXjVTBE4sxrFGgrUWesmq7
	aAgV1+QZVyi47V2Se8suzoX3ddHqU+23NFopZwWdGuK6HuFp7LmLNsIss5JrnNFPdRQjpEppMn1
	RHsI1pPB/IxmkLdu8m0MmVb46HNJAc2bqeFTFuQjnfcsEwEIx/D8Gox0+F17nR+2I0J+0lvcpeC
	Pls45KhO67lr3aUgtnJpCFxw/G2XvRXI89NNxYI2gYZYFrAIswAcGOsN45H91Rn6IpxKcqboaY7
	OYKKte0OwwClkXTY/VRmBhuu/XOpzmRgu8d9XUSz0KOIJlPOpPfT8G1gd84LStOyAtiTbCYArvK
	mNRdI8He7CKDUYDma6JM2nU6ac81x4yNxzkasDQ+6S2saUjTvE3Bkj8rqk76mKFV8fjtw+un8PN
	g3NukN+6TSLbSGl0Kaxbz2v3ggFF6/f9GX5alCuQfad864zbTqW0A0PYAElQBiFfvT7XVPfdM4n
	6TzQCId8YszlzVjKjWou8rXuA==
X-Received: by 2002:a05:600c:c085:b0:488:c530:48a0 with SMTP id 5b1f17b1804b1-488fb784843mr247257245e9.24.1776865437568;
        Wed, 22 Apr 2026 06:43:57 -0700 (PDT)
Message-ID: <cdc6e123-592b-40bd-9c34-05d157e8ef9a@suse.com>
Date: Wed, 22 Apr 2026 15:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] xen: introduce CONFIG_HAS_DOMAIN_TYPE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1776780944.git.oleksii.kurochko@gmail.com>
 <61c33c15d046110b5c99490f54191facf18068e1.1776780944.git.oleksii.kurochko@gmail.com>
 <f2ad01dc-0f8b-4514-b35f-24b254c9b2ee@suse.com>
 <d2070fa5-dce3-46e4-ac23-7d1956d0bc65@gmail.com>
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
In-Reply-To: <d2070fa5-dce3-46e4-ac23-7d1956d0bc65@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1776865438-82175161-BEB70187/0/0
X-purgate-type: clean
X-purgate-size: 1009
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4CACA446E1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22.04.2026 15:38, Oleksii Kurochko wrote:
> On 4/22/26 12:37 PM, Jan Beulich wrote:
>> On 22.04.2026 11:44, Oleksii Kurochko wrote:
>>> --- a/xen/include/xen/domain.h
>>> +++ b/xen/include/xen/domain.h
>>> @@ -13,6 +13,19 @@ struct guest_area {
>>>       void *map;
>>>   };
>>>   
>>> +#ifdef CONFIG_HAS_DOMAIN_TYPE
>>> +enum __packed domain_type {
>>> +    DOMAIN_32BIT,
>>> +    DOMAIN_64BIT,
>>> +};
>>> +#define is_32bit_domain(d) ((d)->type == DOMAIN_32BIT)
>>> +#define is_64bit_domain(d) ((d)->type == DOMAIN_64BIT)
>>> +#elif !defined(CONFIG_64BIT)
>>> +/* On 32-bit-only platforms all domains are 32-bit. */
>>
>> Btw, while this may be true in practice right now, it is not given. A
>> 32-bit hypervisor can in principle be capable of running 64-bit guests.
> 
> Agree that it could be.
> 
> Do you prefer to change this comment to "At the moment ... are expected 
> to be 32-bit."?

Something like this, yes, please. I wouldn't mind "expected" to be omitted.

Jan

