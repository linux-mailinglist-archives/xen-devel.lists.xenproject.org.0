Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKlLJzy2zGnMVwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 08:07:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC5E3750D1
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 08:07:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269682.1558601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7oju-0002os-Cn; Wed, 01 Apr 2026 06:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269682.1558601; Wed, 01 Apr 2026 06:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7oju-0002nK-A9; Wed, 01 Apr 2026 06:07:42 +0000
Received: by outflank-mailman (input) for mailman id 1269682;
 Wed, 01 Apr 2026 06:07:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7ojs-0002nE-Mv
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 06:07:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7ojr-0043oQ-K6
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 08:07:39 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ccb628-e002-0a2a0a5209dd-0a2a450aab5c-18
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 08:07:39 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ccb62b-1772-0a2a450a0019-d155dd2fed51-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 08:07:39 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-43cff5dafc3so2475498f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 23:07:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf21e2727sm35924537f8f.2.2026.03.31.23.07.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 23:07:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1775023659; x=1775628459; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2QBd+z3yeCYygTqiijCbGjzyvP97ahVIwABBPET88v8=;
        b=dfzoI9n4f6WVilNGAOJVk0neIMVFxyPca+WBj/J38xM+nNl3r2W76uhC6rjEgM664y
         VVBjZZYsU7cLWpX9kW2PfeT0h0HJl3UuQYblLXMBGHczXeWD9/7aV8XZ5/6FGj7gS6SP
         EvBQOsL/zKxn9o/zEVnWZzVMscucNP8sfbQ/kI6G/f4kyJTk+SF2eOFJWKWXzKZ1uy+/
         SkZ9ox0tEmenaDpAuseZOTlvG6GvxGDpvnjqTu/Tavtk+/esMTeAOWHeFeTYOkITLY7v
         jRfjCS3B4MZSBRtRMrwoE/kSeqGRlkTh9MLUhYdBYQdBM5hUmuAVz/k1C0TUzOejcl8L
         TB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775023659; x=1775628459;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QBd+z3yeCYygTqiijCbGjzyvP97ahVIwABBPET88v8=;
        b=q1fIruRxGr9Ccq2wdMMntllC9hAK0SrKE1YABuorzZQQFvMscvO4VOs5yYN3v9UVcb
         6YXYsZxopvyhoSKVtIfCtHIB+8AUa50BF7a8dk0oKzDz5A22zMP7BZS4c9TuvbFAkymm
         IaE3plKTurA5+Rk8z7regT9Bb+FLsuyhZdHSjQTT505Q4h9fWo1+CzlLmYuX96nfrOq7
         DJu/hmWYK2EJ64QdUEAFmeyAyAirER/9NaeBAIBAx35tErIs9R2+UhcgZ32oG2h1iH9u
         AdJKUiMJ/6pxzw0qTcuUpMIubehMVooYfmFrgbcZ9b5ZBXvNdfyYFhjZvWx5Rq+3e+ah
         Mfxg==
X-Forwarded-Encrypted: i=1; AJvYcCUtlMtoXQd2kQjjTgVdb1V2CsXG9iUyKJ/0BWA/jxUHheHbwF+iRo1jsYnUC1eoUxfg5XBRc6mk/Cs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0xCgRNVpRyRf+5jTEqmt9T7c/ycZXbxgRBH5EUvBKc4LFvpwi
	+dvw9Xkhzqu8ipHJdlVoNuL11uTE8gEq0GP6lMbc9yRWGse50E7O2Npy+cLxfhT7vg==
X-Gm-Gg: ATEYQzz2bbOvtJFU6EzvjEg15sJqvspZcJBnopkqfOVPDV7tHM+M/1ZdbpX13LTLHLX
	GjGe8HvvoxOdzcZV7AQpAbL0B3J/C0/m48RhXTQM5CL8mLBKglWWK1hxB3MYCsWgMxOFch3H2nV
	KUlBovYFvQdWJKnk6Vst69L7O5HiJiKUb+BKqFFCggjrMUibOcHHxsL8JUb66tv2WW69aTYxkU2
	HM4dJuMB9V5D4lB8MIoI6QbOsyRNYQkVZqlILeRkOMPqDFnDSwA6HOeushLOop6djhLplmC4EU9
	TdALtffpjK0QqUAEr5BZeXQRUsQTSLyy5OXO7D7H2vIr2mx/cSTZdS9BC8XGVnBUQJ+9oFNPQAu
	UrQP4x8MVeUFixXBuM4vN2LJEkA5GTGm6XhVTo/Z2f0jbVKlO1moHVNP/9E33ms3oKKYfjUlUmC
	ycNPG/hB5K+XiC0U5NMXFG6S3bWeRdTAABoUShwU37sLZnjD+5eF6gqmMpaXUSLyXxaoafFVCEC
	5O63+WsmCXXgXk=
X-Received: by 2002:a05:6000:250a:b0:43d:4c:229f with SMTP id ffacd0b85a97d-43d150e161amr3805898f8f.44.1775023658740;
        Tue, 31 Mar 2026 23:07:38 -0700 (PDT)
Message-ID: <0f20593e-1cad-475a-9bc4-f4f1b38c5087@suse.com>
Date: Wed, 1 Apr 2026 08:07:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] xen/riscv: introduce p2m_gpa_bits
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <775374eab7b9868b7cabe6c76fa1b7ac2f8466d8.1774281309.git.oleksii.kurochko@gmail.com>
 <4a0f4313-2694-4986-810c-0f4eac191cef@suse.com>
 <c87ef4d3-abad-4e46-ae86-f078eb4a5f0e@gmail.com>
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
In-Reply-To: <c87ef4d3-abad-4e46-ae86-f078eb4a5f0e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1775023659-BEE95900-A4246FB9/0/0
X-purgate-type: clean
X-purgate-size: 2603
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
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
X-Rspamd-Queue-Id: 0EC5E3750D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31.03.2026 18:02, Oleksii Kurochko wrote:
> On 3/30/26 5:34 PM, Jan Beulich wrote:
>> On 23.03.2026 17:29, Oleksii Kurochko wrote:
>>> p2m_gpa_bits is used by common/device-tree/domain-build.c thereby when
>>> CONFIG_DOMAIN_BUILD_HELPERS=y it is necessary to have p2m_gpa_bits properly
>>> defined as it is going to be used to find unused regions.
>>>
>>> Introduce default_gstage_mode to have ability to limit p2m_gpa_bits before
>>> p2m_init() is being called as it will be too late.
>>
>> This is a somewhat strange way of describing things. Of course you want to
>> establish globals before doing any per-domain setup.
> 
> Then I will drop that sentence now and avoid similar in the future.
> 
>>> Limit p2m_gpa_bits in guest_mm_init() as it could be that default G-stage
>>> MMU mode uses less VA wide bits than IOMMU,
>>
>> How does a VA come into play here?
> 
> It is what spec uses, for example:
>   Figure 108. Sv39x4 virtual address (guest physical address).

Note the difference between what you quote and what your sentence said:
You used VA entirely unqualified. Yes, please ...

> I can just use GPA.

... use GPA whenever you mean one. Using VA for two distinct purposes
is simply confusing. Even the qualifying by the mode is only of limited
help imo, as the casual reader may not be fluent in those modes and
their acronyms.

>> And what is "less VA wide bits"?
> 
> They could be configured to different modes: IOMMU lets say Sv39 and MMU 
> - Sv48, so IOMMU could work with 39-bit GPA, but MMU - with 48-bit GPAs.

I guessed as much, but this wants wording differently. E.g. "... uses
fewer GPA bits than ...".

>>> @@ -191,8 +209,13 @@ static void __init gstage_mode_detect(void)
>>>   
>>>   void __init guest_mm_init(void)
>>>   {
>>> +    unsigned int gpa_bits;
>>> +    unsigned int paging_levels = default_gstage_mode.paging_levels;
>>
>> Deriving a global from a default, when ...
>>
>>>       gstage_mode_detect();
>>>   
>>> +    ASSERT(default_gstage_mode.paging_levels <= max_gstage_mode.paging_levels);
>>
>> ... the default isn't the maximum possible, isn't going to fly.
> 
> I didn't get you here.
> 
> If we want Xen uses Sv39 for G-stage, we want to limit guest's 56-bit 
> GPA to 39-bit GPA, but not the maximum supported by h/w mode for G-stage 
> mode.

I can only repeat what I thought I had got across already on an earlier
series of yours: What mode a guest is going to use is going to be a guest
property. The default mode therefore isn't the only mode that may be used
at runtime.

Jan

