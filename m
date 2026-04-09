Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EPFMztb12lqMwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 09:54:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AD73C7526
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 09:54:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276748.1562068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkDY-00034w-St; Thu, 09 Apr 2026 07:54:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276748.1562068; Thu, 09 Apr 2026 07:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkDY-00032d-PX; Thu, 09 Apr 2026 07:54:24 +0000
Received: by outflank-mailman (input) for mailman id 1276748;
 Thu, 09 Apr 2026 07:54:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAkDX-00032Q-A9
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 07:54:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAkDW-00AFDC-MO
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 09:54:22 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d75b28-2eae-0a2a0a5409dd-0a2a45088884-20
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 09:54:22 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d75b2e-fab6-0a2a45080019-d155802cacb0-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 09:54:22 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso4124665e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 00:54:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd0b4829sm32801845e9.3.2026.04.09.00.54.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 00:54:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1775721262; x=1776326062; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cqQRtGw6ycdUYGge6A3hIwEg7V8pLTnNdK0y3Eae7bU=;
        b=czkcEDuB/ElGjrPSdPX8EtPIruSfPoyxbB1VhEJjealBt/BcDvx91A4Z1aI/qt5E3T
         Cz+yep8Nziod7LurLxRfLSNybtaN+PhMj6mI564RAPVjEIvXt6ZBaEwaHKJs0EEA8QW3
         ZtXU+SM+iosuzNvdMct1olgU0uGfTjuYYmC0tKl3hogsf0N6tVaIEssGziGU1gijrFdx
         w632IUReFAp5jM1/EaeHm6m21Nnb1+1mrUS5ctRwqc9tKxeQBpBuDI+cHCrUmrerx2RJ
         eeA3zN2McprGWuxRQF3Yk3yOHOsJegCFmtFUGA+2Stam6qnZr8lk0PCKuSBhpoKQjDwh
         dKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775721262; x=1776326062;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqQRtGw6ycdUYGge6A3hIwEg7V8pLTnNdK0y3Eae7bU=;
        b=gfEMUg4DqDR9L47ZZOHLYinVqmPfLMAGJ4C3J7uT8sf7Iqr7yyydZp58zcnEW02PeM
         BerTq6KqwXZMPwZMazFRloN/TqaGV1I4sTDJ/w8V3XbBsOrc/7z+cp4ZkLPXbFLGNTHa
         3fYcSjL0ZYbAQluaTTeKiPN2mkTWEWrFH+crX03R28m2A6rFeF60rZJWuBMszB9NM1HY
         Nh5RkIoQ30NHgmhS6pQkyXbILb4bIk3AvYsfAk3zmJj6JM5pz4iqjESoiF4d4op+GrnF
         ChQgOUPSXIXqqNuSFXZTyE5GFKlcpCYUxWpvKeh7oC7prRNWQHsmZ2gLHqDNX4/w+TmD
         wtyA==
X-Gm-Message-State: AOJu0Yw7P9mcnqk0pKgk5obEZn7GT4Gv+zh4B4ZblT6ORyDVMdZc/Pfx
	TaSwP9Dm1eWO+04UyicionsEXlu52/eTQ3he7czeD9dO2eIJkG0Sj14HKsvh1hce8Q==
X-Gm-Gg: AeBDieun89+78j9e51ZzBMnXpq4VUYUSK5SnBBAG0TGSYaiesn+2sQ4CBvgocmDPG1t
	uEl28aTAr8kx0mSRWMXQDyaw50Ve/zIMXNkvch8aZUZ/C5wKw0RBD6H7bVBgbEsIOtNzWFyCczT
	D6c54xq7Pg5QGBuJ9QaTwsemtNIhQTTBIFYFDYHNQqyw9mdAiIMMKOrQ7wJeUSiH9NK7Rrdywzq
	JRvngyn8oUuOCGMwNwVqsde5AhaY4Ld2yK0qbb/IEwThfntWI0kOkOyEYvGgT2jV8+LLHgoIHBS
	qbZau0sYdPEPDtMs/KIN6E77QXkMzbHXxf85vlFT6sgc71ry05zFPYGb2YFf3DjnLKd88V9dETO
	h41Bn1LFg0CAJ0zwQVwbSSf90xHp9XTQxqzg7nCOyGbXPS/3rcyJermmyhgHpERi3X6IsWnsF/E
	uwci/PXli/uTl1VgaisWtklGg4U92RO8ctSGzJPm4/iahL6z+KPg96pTZuyB7nyfwwOavehVPHo
	MevclV3bzvVEck=
X-Received: by 2002:a05:600c:5292:b0:485:2a85:e5ec with SMTP id 5b1f17b1804b1-488996e0ce0mr357321395e9.2.1775721261836;
        Thu, 09 Apr 2026 00:54:21 -0700 (PDT)
Message-ID: <357c0692-1ed9-4bda-ae9a-729153d7cd93@suse.com>
Date: Thu, 9 Apr 2026 09:54:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] make ioremap_attr() common
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <145299a0-b25c-4612-82c6-9401a2f88ad2@suse.com>
 <72526f3a-726a-4a1e-8d80-1a336175c1af@suse.com>
 <DF8F0F78-1DBA-41B9-8055-4CD3622F6929@arm.com>
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
In-Reply-To: <DF8F0F78-1DBA-41B9-8055-4CD3622F6929@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1775721262-76151497-62D24157/0/0
X-purgate-type: clean
X-purgate-size: 2562
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:Bertrand.Marquis@arm.com,m:volodymyr_babchuk@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,vates.tech,amd.com,wdc.com,gmail.com,arm.com,epam.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,suse.com:dkim,suse.com:email,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.993];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 47AD73C7526
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.04.2026 09:26, Luca Fancellu wrote:
> Hi Jan,
> 
>> On 8 Apr 2026, at 13:07, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> This core backing function is uniform; what varies across architectures
>> are the attributes passed and hence the wrappers around it. Yet of course
>> extra checking or special handling may be needed per arch, so introduce a
>> suitable hook.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Declarations (or inline counterparts) aren't being moved around, to avoid
>> the need to touch source files using the functions. Quite possibly they
>> want to consistently go into xen/io.h and asm/io.h.
>>
>> Of course ioremap.c could also go into lib/.
>>
>> For RISC-V the wrappers likely should become inline functions?
>>
>> PPC doesn't reference any of the functions just yet, so gets only a
>> declaration.
>>
>> For Arm, a TODO item is deliberately retained, yet seeing the use of
>> ioremap_wc() in domain building (which by itself is questionable, see next
>> patch) I wonder if that's even feasible as long as we don't have
>> memremap() or alike.
>> ---
>> v2: Use conditional operator in ioremap_attr()'s final return. Re-base and
>>    leverage that to simplify ioremap_attr() itself.
>>
>> --- a/xen/arch/arm/include/asm/io.h
>> +++ b/xen/arch/arm/include/asm/io.h
>> @@ -1,6 +1,8 @@
>> #ifndef _ASM_IO_H
>> #define _ASM_IO_H
>>
>> +#include <xen/mm-types.h>
>> +
>> #if defined(CONFIG_ARM_32)
>> # include <asm/arm32/io.h>
>> #elif defined(CONFIG_ARM_64)
>> @@ -9,6 +11,16 @@
>> # error "unknown ARM variant"
>> #endif
>>
>> +#ifdef CONFIG_MPU
>> +void __iomem *mpu_ioremap_attr(paddr_t start, size_t len, pte_attr_t flags);
>> +#define arch_ioremap_attr mpu_ioremap_attr
>> +#else
>> +/*
>> + * ioremap_attr() should only be used to remap device address ranges.
>> + * TODO: Add an arch hook to verify this assumption.
>> + */
>> +#endif
> 
> I find a bit strange to have an #else with only a comment, but to be fair I’m not sure where this
> comment can be put otherwise.

That's the issue: I don't want to lose the comment, but I also didn't
see a good place to put it. Having it here means it can be replaced by
a single patch hunk, whenever the TODO is going to be addressed.

> For the Arm and common part, I’ve also tested on Arm64 MMU, Arm32 MMU, Arm64 MPU on virtual platforms:
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com> # arm, common
> Tested-by: Luca Fancellu <luca.fancellu@arm.com> # arm, common

Thanks.

Jan

