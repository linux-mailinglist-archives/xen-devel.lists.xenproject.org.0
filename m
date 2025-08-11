Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D59BDB2003B
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 09:25:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076943.1438038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulMtb-0003mc-Dv; Mon, 11 Aug 2025 07:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076943.1438038; Mon, 11 Aug 2025 07:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulMtb-0003kz-Ay; Mon, 11 Aug 2025 07:24:39 +0000
Received: by outflank-mailman (input) for mailman id 1076943;
 Mon, 11 Aug 2025 07:24:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulMta-0003kt-1y
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 07:24:38 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 396a6ef7-7684-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 09:24:32 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-615398dc162so6382196a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 00:24:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8fe7944sm17707156a12.33.2025.08.11.00.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 00:24:31 -0700 (PDT)
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
X-Inumbo-ID: 396a6ef7-7684-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754897071; x=1755501871; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zDlCfej6ttBAkB6klhF/uEI3o5KH14EGls0y+nduFas=;
        b=erjoXBfDLrDGLiiv2zVWVTZ6ze8v90KD2K9u6pxyvhr71vFMaJZaM67gARw38V5+Ah
         cdZqdsTs5YJ/olyLuKCaIMgjVdbOPljUQpok8Qip4YmrLehPCi+r8Fi7kWOKDFo1XvXS
         XtQtF/LP1F88FE11BhgUdvh9IumiFsS+ZMcMcOQWv1x0GU8Fool+vMwDuT6q18RBZa5G
         JCyYPb84rErHvjPdSlDA0iJ2DSIsaQ6ydeD3IP+xxMuvbY43CkoknWOFbHG28BSBRnkK
         D1bl5qXzRrVxMpAA/nRpEH9ndM4mdp4GnAgn8XnBDLddR4kZeYvZywJRqF8JGE+Cv++f
         jEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754897071; x=1755501871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDlCfej6ttBAkB6klhF/uEI3o5KH14EGls0y+nduFas=;
        b=wqmh3ukRn0epOOmZctt/8V96xS4x0MDzkqev1ImvsBVbwfTz3ZXRB9GPKmklomSfEw
         m4AhSVNeStYD97BndzD5gox4csoajEpK5Lo6OXrZiwzVeh3gtmAfHeUDb2zSoJl+VBoj
         NKC3FxzNdOXL7e45WTtRkOP0zQm8nz8vb9AmOLj8xnOyyC+7wgw2IDUEatthmI4PQSr0
         scio7ENIegPgcbEX/PDYpo3YFHFTGEJibz9r3cWFPXs9OkLXB3AjVH10nKkJJtto5NMY
         /1HgW5Rkh8L+7scw7K/E8/lAxfdHLHUGrs0dudPyJmh/DHhpwRWBhgeNI6YzKzzht9KW
         8tnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdtD69e75E+Pfhs/C3TBwBk8REh8bqONtie56ynIhsXDO3tkn0MLGbucw256Elp3mjjK9u9A38kIE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuxkK2woaUucAKPx7PVuGC3SrGidKwsps/yf/Mj3m9ln6MeTrK
	O9FGRC7a8KZK+Ttetj+1Odo2wud57ztTI+L21fKNce8j4CTYZHRZx9u9kE1SIWhtEw==
X-Gm-Gg: ASbGncuUmIBIMWuDnr8qnZXlbniB8496mTTktuoE+zxTC+EbcGm+eJ/swpOjILPxDkq
	FqawyAEs3Z6kZTPGDmP1CCsoYVOBDvrZRWvdSwGm1+dXqilIdJNY1bWvZRvb4Q3rsdj6wAmAnbd
	MFB3UXMIqDhbuH9iMxVF/x7EdxvJc2B8Cszg9qWQEtayGTCN3Oy3TzE1FKHqde+8HQ9X45BtpTP
	Nw+zLcJnKNkW4kWin1PMI+N+S5DBjvPllqwcxTRVh0tmFO04nXhhbxm7Hi10p8PKp/cla0cuJhF
	z/r7/E/qHJf421pOr1Jonav/XddDr2HFb69VP9oxSJFdyec7poW/jDsLt/eox8aPhy49gSt1xHz
	uHKOm8Njc3Xx4Qy233JFWiBwvcUZkM6t5fUg5MYSv1axFzrJ4Ct5G1lH8RBwe6v9pacrhx6kpSP
	uegLTq3d0=
X-Google-Smtp-Source: AGHT+IFlA77HUI4WF7UNYhvRZp3saESxGcVEbIsjsAYLw7MSg5zI/N/QFbS9pgfzqMjFAfvKo/JUxg==
X-Received: by 2002:a17:906:4788:b0:ae9:8dc8:511c with SMTP id a640c23a62f3a-af9c641a806mr1021904666b.13.1754897071474;
        Mon, 11 Aug 2025 00:24:31 -0700 (PDT)
Message-ID: <5e4b3bb2-653e-46cf-9fc3-5bf57296f2c0@suse.com>
Date: Mon, 11 Aug 2025 09:24:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/5] vpci: Use cleanup to free capability resource
 during deassign
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250808080337.28609-1-Jiqian.Chen@amd.com>
 <20250808080337.28609-2-Jiqian.Chen@amd.com>
 <31f9800f-5d2a-4614-9850-07d6bbe232d8@suse.com>
 <BL1PR12MB584915F4FA5E4366E0338FC0E728A@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB584915F4FA5E4366E0338FC0E728A@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.08.2025 06:04, Chen, Jiqian wrote:
> On 2025/8/8 16:58, Jan Beulich wrote:
>> On 08.08.2025 10:03, Jiqian Chen wrote:
>>> @@ -321,6 +321,29 @@ void vpci_deassign_device(struct pci_dev *pdev)
>>>                      &pdev->domain->vpci_dev_assigned_map);
>>>  #endif
>>>  
>>> +    for ( i = 0; i < NUM_VPCI_INIT; i++ )
>>> +    {
>>> +        const vpci_capability_t *capability = &__start_vpci_array[i];
>>> +        const unsigned int cap = capability->id;
>>> +        unsigned int pos = 0;
>>> +
>>> +        if ( !capability->cleanup )
>>> +            continue;
>>> +
>>> +        if ( !capability->is_ext )
>>> +            pos = pci_find_cap_offset(pdev->sbdf, cap);
>>> +        else if ( is_hardware_domain(pdev->domain) )
>>> +            pos = pci_find_ext_capability(pdev->sbdf, cap);
>>> +        if ( pos )
>>> +        {
>>> +            int rc = capability->cleanup(pdev, false);
>>> +            if ( rc )
>>
>> Nit: Blank line between declaration(s) and statement(s) please. (Likely
>> easy enough to adjust while committing, if no other need for a v12
>> arises.)
> Thanks.
> BTW, do I need for-4.21 flag if I expect this series to be merged before 4.21 release?

I wouldn't say "need", but adding such a tag may now be advisable.

Jan

