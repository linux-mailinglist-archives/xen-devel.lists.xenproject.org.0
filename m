Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC5FA088F7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 08:35:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869256.1280718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tW9Xa-000277-G4; Fri, 10 Jan 2025 07:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869256.1280718; Fri, 10 Jan 2025 07:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tW9Xa-00025E-DD; Fri, 10 Jan 2025 07:34:46 +0000
Received: by outflank-mailman (input) for mailman id 869256;
 Fri, 10 Jan 2025 07:34:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tW9XZ-000258-FP
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 07:34:45 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c85a8ec-cf25-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 08:34:44 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so18600225e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 23:34:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2ddc5f5sm77383205e9.18.2025.01.09.23.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 23:34:43 -0800 (PST)
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
X-Inumbo-ID: 5c85a8ec-cf25-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736494484; x=1737099284; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eX3fTpgW5SdYNy8hU9KL1H5X+E/3UO52Nk2AySG6AxA=;
        b=WSaCeNw/1ArLlOlt7Zt13bqZVWZkQU7m8n6oFfobiSfHQxhSDYWRgo9yiZ33eBVj2+
         xQkE9HNbrBPs8fTgfbgNlB4oaaXoa3YQ62udtSwOuHYNwUdB8VsXMfsmtMhOOaicKDYz
         H9RIAuAvjOu5NEAWg+zNU1K6wZK/YmM8gWR2uwb40Ai5keqf1ddAepkB8vHY1O5GhhJ1
         bwk0107OBMMHZrhIPackAvV3//dMvgzNqYdgJOvH0LJgo1rIwT+MWwO4IQyRMRGDFwZG
         /uNjCxjMEe3lJoVX42Lj31M7+6pjEU6W4sa4AvUDeJJvSb61Y7KazCvDCIs2IDwKvl4k
         LcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736494484; x=1737099284;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eX3fTpgW5SdYNy8hU9KL1H5X+E/3UO52Nk2AySG6AxA=;
        b=ZqRtAj+RflWvzCSeeznKt5MeZoxVhp6TJubbc5O4vSrpBpOCmvvjz1+yIf5mdur5GM
         GoFZL4YDSpFK8xBmqdG95ny2LFVL+dFse4D+1ZiIfIOi8JqeTA1TrcH86J9hnI22Nz1+
         8x+Pgz2bWdeskojoqETfslflvFwJf3g0+JYyVE4acJblKMJBymhoFncXl2eYJPRvw7Zt
         I4lwYKbqonZRwOGzuFH1GAAYCW4KbXpjvEnWUAIXeCNPBaNVGRN7BTZOPENbH1ib2H25
         mGza91+Z+GMtUewSGrHHqXIaajpu2Ku7xyS0tt3ygYqAfaifZkCwKL7OeK01movK826E
         67+g==
X-Forwarded-Encrypted: i=1; AJvYcCWwopkvH2xLWjoDzi3AgJbAE6hPw+aAAv67Ss1WNnR2SsJnNGWcE/Lr22JBLooEjXDdhyo3uQqGauo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcPSNuADJ1xXw0lQky4n63IxJDFnuXYnZ6XyVzVrQrcA7V2Q7d
	iY9E06AuVd4I4cRHSfdjuBrznt4OnzaPGkLr+NytbINbTJv0P+xbJSSfiF4tgg==
X-Gm-Gg: ASbGnctZFU4N63rCFboNxJtT/FNl8urAdwYcE5iL5na8l0xldhhF/csy/lPsyRbcSuS
	haPJ5ENkRehoYqhAMl8h5oT6NdRyguEKBiCnAza/NW4ZnFp0S8wT42u8fa3R1d5CP1qZC4eI+mW
	n01zb5n5Q0JPtwzqESVZ4WTwJVxQl/36MMVvdt8FOFY4SQguiB4PNsTHRkCre5x12Dj3nl+tc+H
	bIHcQecHBr+ogl9mgMmBcFPsldiiBsSOtQnMgDpPFOfLaV3EZ1bBpsAZJEyOOXp4IqodtPcfAkH
	4lDyqjr7HlcvcL2ac3kfL1/a0y+1ZTW21Ep9DvV9Eg==
X-Google-Smtp-Source: AGHT+IGd9Z08J3SLwlHEUHUjToRWT7+JkayOrQwMbFvVtr1ZLDxEk6Ztyg1nkz0Iet5xwe9pS1i4tA==
X-Received: by 2002:a05:600c:5112:b0:434:a386:6cf with SMTP id 5b1f17b1804b1-436e267f77amr85059045e9.2.1736494484093;
        Thu, 09 Jan 2025 23:34:44 -0800 (PST)
Message-ID: <6a03089b-6b91-4c3e-b48b-9d9bb8aa4425@suse.com>
Date: Fri, 10 Jan 2025 08:34:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] vpci: Add resizable bar support
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, "Huang, Ray"
 <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241219052143.3161332-1-Jiqian.Chen@amd.com>
 <d904c816-da83-418a-9bff-9988660af546@suse.com>
 <BL1PR12MB5849D215025D7CD9A5DA4B22E71C2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849D215025D7CD9A5DA4B22E71C2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.01.2025 08:10, Chen, Jiqian wrote:
> On 2025/1/7 18:06, Jan Beulich wrote:
>> On 19.12.2024 06:21, Jiqian Chen wrote:
>>> +#define PCI_REBAR_CAP(n)    	(4 + 8 * (n))	/* capability register */
>>> +#define  PCI_REBAR_CAP_SHIFT		4		/* shift for supported BAR sizes */
>>> +#define PCI_REBAR_CTRL(n)   	(8 + 8 * (n))	/* control register */
>>
>> Something's odd with the padding here. Please be consistent with the use
>> of whitespace (ought to be only hard tabs here afaict).
> Sorry, I don't understand how to modify it specifically.

You surely have noticed that in two of the three quoted lines there are
blanks immediately followed by tabs in the padding. This can hardly ever
be correct. (The overall goal wants to be that "same level" definitions
are column-wise properly aligned with one another. While nested ones,
like you have it for PCI_REBAR_CAP_SHIFT, are properly identified as
being nested. You want to check with other parts of the file if in doubt.)

Jan

