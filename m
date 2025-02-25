Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D2CA43CDB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 12:09:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895620.1304280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmso7-0003ac-LF; Tue, 25 Feb 2025 11:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895620.1304280; Tue, 25 Feb 2025 11:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmso7-0003XT-IU; Tue, 25 Feb 2025 11:08:59 +0000
Received: by outflank-mailman (input) for mailman id 895620;
 Tue, 25 Feb 2025 11:08:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmso6-0003XL-RO
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 11:08:58 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8b0f452-f368-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 12:08:57 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-439846bc7eeso34100755e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 03:08:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02ce615sm137465255e9.5.2025.02.25.03.08.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 03:08:57 -0800 (PST)
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
X-Inumbo-ID: e8b0f452-f368-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740481737; x=1741086537; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d1aOMJn4gabg9FMb3nnnO1pLRYGfiKQLZzxugQqiW3w=;
        b=E+OPJX6HvZnkzLp/E4rJFe/+XIYmbvTaRcChcgIDgj1q2xi3g2tX50d8IxLrWCnePz
         GC6GM/F1KoVBErCw32Htgf0nvaWIsKSLlKBfRbScUfhXg+TgD4yPSv8UcVU7q3McLvfg
         XRZ7vyureEj45L8Gi2bjYj5Tj+yZ9XrM5U+/oOoxxkM6NGFYJXWwamLY8fIzYcXAKLOC
         xEUxpdjBoWYjHZODL5jXvq5MZJLY+dklEMAhjvWfD0S3jb7wIPHYst9teVsg9uVvxRQ+
         fE4F6gg8LfVLQd4d87MiqQ1qE7lxW6MKBsr2w2n67TWbyvJuCzkH3xY0fJwaPzroMVmU
         yL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740481737; x=1741086537;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1aOMJn4gabg9FMb3nnnO1pLRYGfiKQLZzxugQqiW3w=;
        b=X4i45lvQwqkScJVAD0WiGyaT4AY2Z1+sHvsftCTLYJ1QboEJO8zKerLuNazpkH/IlJ
         nIfeMTv9lZGPHdKvT1eWR5KoXBHLnrHBP96pD86VN2l7rYjaIBEfBF8pZpaQREHSkS7Y
         hw6kyGAUXdL96uTd2VYtxQqpnBwinUC9Pb6xYvP2NB/CJz5ee1dw9siUk+FrLBNN4JT8
         p9ryduAMSsDyy4l2wimhubPcu9945w/rYUPXTPniY1bD9k4WucmrxoH6YuLjjTB7sInS
         ow5vdeCdGch5rKPFiU6n7z8D4OnOWAPDA+a5f3OUf7C+ocXuffi4cOmrvRLQfBXuK1Ob
         WpJg==
X-Forwarded-Encrypted: i=1; AJvYcCUTSaBKF89cQSzEkPsYTijU5jLytZa1IPtMzDToOEKEGTxrO0Rmhz5zR4aKxtYvLT0qcB5EuQGaitc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzpIC9CrkkclQqSi9kvSJ90Is8n6+BIKp2S4mYqjeyQ34jQd4C
	T5r9Bxab+Wl/vG5S+G6Z96kggJyf6y62721RJkQ3OlWepIY7uIMN0AZuoe6qrw==
X-Gm-Gg: ASbGncs9A3bg4hF2D8LnWwBSQrMTjTDE7Bvo8xNskFKXOhq+w7rC4USOuOkNd4bvK7c
	yjgvUuPI7muRcoZsdmsh3eqxbu8Tf9zKL8Uo5+boSSb6WjZRfoRY75avLCSO2AmbZCR4iDhnOLb
	yfqpwG+o9NRfUhjUBwMgHjwBzo4bJ2EdSI8r2agXXt9eCI44q058katUP6Qv9f40u76fNyYya0p
	FMmD0x++DpqAWjhRtzxuktSZBlIPy93qT6ZmNfh2A33ZkeiEdaBnHylPQ8+F4uViMPsRR07wVEl
	mesIljNjjJESLxAQkJMSQDCKjriWCu2MisjpoxPLlzEiXXPBReLGKiuospcM3gdzZe6gdo+4/fa
	aSs/m4yP4l+s=
X-Google-Smtp-Source: AGHT+IFxEFi4+WBud0M9obZtV02YLLnwAQ2U0v9aNHS4bB69GeB0g0UwBDfZyIjRcR+NMNDObICWJg==
X-Received: by 2002:a05:600c:3b8e:b0:439:873a:111b with SMTP id 5b1f17b1804b1-439ba9cf786mr98487555e9.12.1740481737338;
        Tue, 25 Feb 2025 03:08:57 -0800 (PST)
Message-ID: <0c60434c-3899-4b1e-92c8-b72afdb698db@suse.com>
Date: Tue, 25 Feb 2025 12:08:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/8] iommu/arm: Add iommu_dt_xlate()
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1739182214.git.mykyta_poturai@epam.com>
 <02afc1bce09dd22865c7e2bad6cad9a804fca64b.1739182214.git.mykyta_poturai@epam.com>
 <f8f72da9-797e-44e5-93c2-cadb9fd1aae4@suse.com>
 <bab5a083-3aa2-4c5f-b798-57322e1af521@epam.com>
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
In-Reply-To: <bab5a083-3aa2-4c5f-b798-57322e1af521@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.02.2025 12:05, Mykyta Poturai wrote:
> On 10.02.25 12:46, Jan Beulich wrote:
>> On 10.02.2025 11:30, Mykyta Poturai wrote:
>>> --- a/xen/include/xen/iommu.h
>>> +++ b/xen/include/xen/iommu.h
>>> @@ -238,6 +238,14 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>>>    */
>>>   int iommu_remove_dt_device(struct dt_device_node *np);
>>>   
>>> +/*
>>> + * Status code indicating that DT device cannot be added to the IOMMU
>>> + * or removed from it because the IOMMU is disabled or the device is not
>>> + * connected to it.
>>> + */
>>> +
>>> +#define DT_NO_IOMMU    1
>>
>> While an improvement, it still isn't clear whose "status code" this is.
>> The #define is effectively hanging in the air, from all I can tell. And
>> from it not being a normal error code it is pretty clear that it better
>> would have only very narrow use.
>>
>> Also can you please omit an interspersing blank line when the comment
>> is specifically tied to a definition or declaration?
> 
> What would you say about removing this status code entirely and 
> returning something like -ENODEV instead, with adding special handling 
> for this return to the callers where needed?

I'd be okay with that; Arm folks also need to be, though.

Jan

