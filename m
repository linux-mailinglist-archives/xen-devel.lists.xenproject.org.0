Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECF1805863
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:19:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648021.1011912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXCu-0004R5-Og; Tue, 05 Dec 2023 15:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648021.1011912; Tue, 05 Dec 2023 15:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXCu-0004O4-Ln; Tue, 05 Dec 2023 15:19:32 +0000
Received: by outflank-mailman (input) for mailman id 648021;
 Tue, 05 Dec 2023 15:19:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAXCt-0004Ny-Js
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:19:31 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afde1a73-9381-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 16:19:30 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40b538d5c4eso53881395e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 07:19:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f18-20020a05600c155200b004094d4292aesm19092238wmg.18.2023.12.05.07.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 07:19:29 -0800 (PST)
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
X-Inumbo-ID: afde1a73-9381-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701789570; x=1702394370; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=obOnFqoEHLYAQtr65jw2QfsQlhvyXM2XSnS+DM5BlBw=;
        b=YHMnP2sztdUsu0otR38VuIXkr7TxBevUng8eKP6N3Bq/XrVdgEskPEv/AXzDdrXBWG
         3xU8ccsSskSR1hDwfRc9cMERB3YnWPeD+eHqX1dJ/1G8h++5qF9VQeGJaKvKRslkCvv5
         pP/rS2sXQTrs9ANIlxicHBZ/lklt+8Ee9QKuR3WA+kb3g3Ek6cVuP7aMelv0wvV+iuiM
         GgTJUed+BLxw7vYhnjKzlV7vRKiDSsEf54zSwUdRv08jA2cEd3zhhch9pLGdN0ndIYbJ
         QnZHpOnjb/20fjoZqXavqa96PYWUXUfeSHp/q7E6YQAoZGuch+ga7OEDJMGmPkRjgwYn
         pDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701789570; x=1702394370;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=obOnFqoEHLYAQtr65jw2QfsQlhvyXM2XSnS+DM5BlBw=;
        b=XD+gDizLTrN6d9XT/j4m8SkaumzZvizbExVwVzRYZUnhamG0crzJUPAGd2fXUEd3Vp
         86Bo8nGdIpQ1yVtiwFBo2XtrSGLgcSdk8VhXpMl4XkRuRIRUTNdwfQg5iVbZxFT1OOZm
         BUZUQfn3yxhdN06Iz9RFDaOnCbwjzRBWzyun0jKY/bRV3kvnFj8qOiL8+L4+z6uWRtve
         tonOlyawJKj6cIWi2pBH5nFhoxEV0ZIRI76m1/OywtcxDTAMTqaczQDnvBhRgEnxVInE
         YpU+PmW33QHNMfGMk2qLFbQJqXSEc2Ngqofbs/Tef+k5YITFE6TVXWiUIV6L+dPTpn7l
         uXIg==
X-Gm-Message-State: AOJu0YwGxSnOpi+vj5MpzCegbf/TKeqnLNJpn+7TixwFnnR5uliCRXZx
	MjN7Ei+zVQm3L7vTlTQa5e0n
X-Google-Smtp-Source: AGHT+IF9VHFEKT3r1cYQ0yJT8IgB2BLxzT5TeuUsUgD2n2VPjUn+3GicdNiCVQeo4DS3UXWWpfnWSw==
X-Received: by 2002:a1c:7912:0:b0:40b:5e59:b7a9 with SMTP id l18-20020a1c7912000000b0040b5e59b7a9mr576680wme.134.1701789570232;
        Tue, 05 Dec 2023 07:19:30 -0800 (PST)
Message-ID: <2ebe87c9-770e-434c-b7dc-440fd123762e@suse.com>
Date: Tue, 5 Dec 2023 16:19:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] amd-vi: set IOMMU page table levels based on guest
 reported paddr width
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20231204094305.59267-1-roger.pau@citrix.com>
 <20231204094305.59267-3-roger.pau@citrix.com>
 <17de355f-623f-4310-ac55-df028235c240@suse.com> <ZW89jMz1yaD4qLN9@macbook>
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
In-Reply-To: <ZW89jMz1yaD4qLN9@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2023 16:11, Roger Pau Monné wrote:
> On Tue, Dec 05, 2023 at 03:32:20PM +0100, Jan Beulich wrote:
>> On 04.12.2023 10:43, Roger Pau Monne wrote:
>>> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
>>> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
>>> @@ -359,21 +359,17 @@ int __read_mostly amd_iommu_min_paging_mode = 1;
>>>  static int cf_check amd_iommu_domain_init(struct domain *d)
>>>  {
>>>      struct domain_iommu *hd = dom_iommu(d);
>>> +    int pglvl = amd_iommu_get_paging_mode(
>>> +                PFN_DOWN(1UL << paging_max_paddr_bits(d)));
>>
>> This is a function in the paging subsystem, i.e. generally inapplicable
>> to system domains (specifically DomIO). If this is to remain this way,
>> the function would imo need to gain a warning. Yet better would imo be
>> if the function was avoided for system domains.
> 
> I have to admit I'm confused, won't systems domains return
> paging_mode_hap(d) == false, and thus fallback to using paddr_bits
> (host paddr width?).

True, but that check lives inside the function.

> I can avoid such domains calling into paging_max_paddr_bits() but it
> seems redundant, and would just be duplicated logic for a case that
> paging_max_paddr_bits() already handles correctly AFAICT.

Hence why I suggested a comment (warning) as alternative.

> Would it be better for me to rename paging_max_paddr_bits() to
> domain_max_paddr_bits() and move it to asm/domain.h?

Maybe. I'm not sure exactly why the function was introduced where it
is and under the name it has. It sole present caller is in cpu-policy.c,
so either name/placement would look good to me.

Jan

