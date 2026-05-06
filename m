Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDghG7lX+2n+ZQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 17:01:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F26E44DCCC7
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 17:01:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301852.1576013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKdje-0000rG-LT; Wed, 06 May 2026 15:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301852.1576013; Wed, 06 May 2026 15:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKdje-0000oI-Hp; Wed, 06 May 2026 15:00:26 +0000
Received: by outflank-mailman (input) for mailman id 1301852;
 Wed, 06 May 2026 15:00:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKdjd-0000oA-D6
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 15:00:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKdjc-00GYbg-Oz
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 17:00:24 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb5788-e002-0a2a0a5209dd-0a2a450197f0-6
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 17:00:24 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb5788-c1f2-0a2a45010019-d155dd35b926-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 17:00:24 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-44a786a9a35so3662401f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 08:00:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45052a48911sm13234951f8f.11.2026.05.06.08.00.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 08:00:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1778079624; x=1778684424; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M2mmaK+5EUY8ZWipcER9DHX7oC7K8KIAvuhUR49K5wg=;
        b=DBXMYCT5eLFYdVPMOpbT0yssfZQ4XoPhV4vFwznuPzvhFaeKQGwGw2NqZa3QhkuI9W
         hlC+oLblmgqMN1FtRGub7GZamM2ZXs3k/ZC4LMSo0PabQF73qIqwcx9UUTGA+K/h0WIw
         7EZqWdHInp1CYqmDp0Jve3wQE7N1qX+X3LRQH8i8Q95kAhfhJC3xEjWtTJTb5BJutd31
         4KZIMa040QXuCBxE+vG6QSUV2YGWsiqsYDNotlw4FHS93hck3GPWfDHLKxNFDLfmhlKA
         oIN3dQS22IiYtcAwNXmLxV0HEAYHfddqmI5UxF36/WhkZ8Rq8xLHOzHp34YO/ZTSLIEe
         Bbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778079624; x=1778684424;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2mmaK+5EUY8ZWipcER9DHX7oC7K8KIAvuhUR49K5wg=;
        b=amjUES9llpSjKcSNOB7YiU1xXI94npdXeCQA7qaOR5qBDSypWtNQlqrIw6JCidqOGf
         Yx96WW/JIQLpYwBu2QTxKQ+XGTd4ZL+s99qURHVYK+1aE5S0VVHc0wwZdmsLWtUbgAKv
         qDbGCiteimYcYR4w8Z9c6jLZXUWrh9MH8j2am0F1Pt2ALFuqmnouYZAgX6LHTQX6xtfd
         H+OztNbLC8HhoB4YMDVIq0s8ZdrFJHtmjAyxb5TBjtJwfTugb0AHFG1YKTNuvXVtfI4b
         Z5YozBDfN3LJfkujYCTcGoXI9q5V8ANv5Zj/jJxeJ2ZTgUUs69V3HLdkhP1UgVNTBmml
         riWw==
X-Forwarded-Encrypted: i=1; AFNElJ9Sq0N9r5EYJUIDAuEXCk2DUxKDGJd0hGUxjk3Y1pPW3Ncp+oAe3HpaqWhnWu4pmShawxPdUI8IYrU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGwzUGLyXeD8DP0i+k8fCQs/BxYtLg2bkbCvIXu1Fs6dQbYnag
	2ZDONPLxqfxT9lLT6LJORU0xptRP0g0dsQYGfjeUOI+p1K8oj/CSxumZURXuPpW/+w==
X-Gm-Gg: AeBDietKlSaIvD/+wT1ZsNCmBVLt/tmDZVND+C4k0GZ+qFGVXzeynPvSI/aPQZ/8TH9
	2B5y3w1EAMzB/q5Y5moggEz/O/6CyQsCexlQnn6dMH25Nnc7A9JX0R1r6rO2CsglSrRvkhvcpB5
	wQ74TPQPlfHoP2vsSqPObEug1mPpcTrSqvif8RjfJneN170oaiP/muyVBqzt86e7GXdDRaG5lu6
	EuO5X0kI/YpEY0lb2veVXieR0acW9lwjaEPWnYL80CsSSfJG+WB5+kNP7pm4EaWjGrwLZtZAS0v
	rQySTnXgJc9te6n7MpueqOYxZygcsPhxvSq0ahWWSr8Fve30uf3T+JB2i1UTd59k43IZRJbPL+S
	Rmf6tz+GQ3RdPIcYm6d2jioDsMlRrnhhwaxrE6p5Gjsa/UeGKijT1c0KwcvYJZSIuDjtxedrDFH
	/7JOHZgbG8REojVNd6DaFrtr/v2UTedcStdSq4+o/bPT9/1fQLb2+0il/YOaA6qSJHtc+T2PLIJ
	rOo2HGFiyen8JVfXOm0W2b8+12CUUSfiq06
X-Received: by 2002:a05:6000:40c7:b0:44f:b57a:1cc3 with SMTP id ffacd0b85a97d-4515ce1c56amr6762667f8f.28.1778079623814;
        Wed, 06 May 2026 08:00:23 -0700 (PDT)
Message-ID: <70979a5b-e66f-45f9-8557-eecd7113d7b7@suse.com>
Date: Wed, 6 May 2026 17:00:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/11] xen/riscv: add Linux kernel loading support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <af89f0b696c5a1ae477dc0903a9a99b84df26f7a.1777303844.git.oleksii.kurochko@gmail.com>
 <f61ddc8f-88a6-4f61-a470-c9c82b8b9b52@suse.com>
 <082f5c79-0cf9-4eef-b80c-e5e9b594576d@gmail.com>
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
In-Reply-To: <082f5c79-0cf9-4eef-b80c-e5e9b594576d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1778079624-B6342FF4-290BCCCC/0/0
X-purgate-type: clean
X-purgate-size: 1640
X-Rspamd-Queue-Id: F26E44DCCC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RSPAMD_URIBL_FAIL(0.00)[suse.com:query timed out];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,bootlin.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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

On 06.05.2026 16:53, Oleksii Kurochko wrote:
> 
> 
> On 5/4/26 4:05 PM, Jan Beulich wrote:
>>> --- a/xen/include/xen/fdt-kernel.h
>>> +++ b/xen/include/xen/fdt-kernel.h
>>> @@ -59,8 +59,15 @@ struct kernel_info {
>>>           struct {
>>>               paddr_t kernel_addr;
>>>               paddr_t len;
>>> -#if defined(CONFIG_ARM_64) || defined(CONFIG_RISCV_64)
>>> -            paddr_t text_offset; /* 64-bit Image only */
>>> +#if defined(CONFIG_ARM_64) || defined(CONFIG_RISCV)
>>> +            /*
>>> +             * ARM: 64-bit Image only.
>>> +             * RISC-V: both 32-bit and 64-bit Images.
>>> +             */
>>> +            paddr_t text_offset;
>>> +#endif
>>> +#if defined(CONFIG_RISCV)
>>> +            uint64_t image_size; /* Effective size of Image */
>> As this (apparently) is for both RV64 and RV32 - can the latter really have
>> wider than 32-bit image sizes? If not - use size_t or unsigned long here?
> 
> It seems like we want to have uint64_t as it is explicitly mentioned in 
> image header:
> 
> https://elixir.bootlin.com/linux/v7.0.1/source/arch/riscv/include/asm/image.h#L57
> 
> and also it is used .dword here:
> 
> https://elixir.bootlin.com/linux/v7.0.1/source/arch/riscv/kernel/head.S#L55

Well. The image header having a 64-bit wide field still raises the
question how the value being wider than 32 bits would work on RV32. IOW
for Xen internal purposes I expect unsigned long or size_t would be more
appropriate. When that value is taken from the image header and copied
into the internal struct, it would need checking for absence of
truncation.

Jan

