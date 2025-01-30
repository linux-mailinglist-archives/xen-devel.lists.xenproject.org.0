Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D705A23058
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 15:31:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879627.1289849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdVZT-0005Mf-OA; Thu, 30 Jan 2025 14:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879627.1289849; Thu, 30 Jan 2025 14:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdVZT-0005Jf-Kc; Thu, 30 Jan 2025 14:31:07 +0000
Received: by outflank-mailman (input) for mailman id 879627;
 Thu, 30 Jan 2025 14:31:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdVZS-0005JX-9p
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 14:31:06 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d456424f-df16-11ef-99a4-01e77a169b0f;
 Thu, 30 Jan 2025 15:31:01 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aaedd529ba1so126144966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 06:31:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a562e7sm126380366b.167.2025.01.30.06.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 06:30:59 -0800 (PST)
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
X-Inumbo-ID: d456424f-df16-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738247461; x=1738852261; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zH4SExfP15QqnigMMMw/hrCvxM6oyFaSmBIhN4cUHVM=;
        b=bjMFQdVkycotjYjoThysr5t+dKt3Tn+hD/4MrJa6mWje7aJWS3eBW0Y9RzAzTAM06R
         7ILCeQoF4g+gpF6e+5ctp4jqM+7zQHd1epfccQt3sQWy+Tvani5PMIcLjHxT3JBxIb39
         lHe0eDkxI7jOr7a+EfYl5YDDEfLxphrCZa0njaB67auaK2YbGJshvdkggfGqflsfIL5+
         OyLB/1hWP61klyurw+/24l/wSGocZ12TG6844H3lEzqlaWjcRSvA5rYKp3m0nH3fEhBP
         ai5hv5T1KmKnCH1pC02FTN76z2JS6Z9IaFzLVKHd/F0g59k+RwfXQ/fmTe1VCG9vskKU
         Q4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738247461; x=1738852261;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zH4SExfP15QqnigMMMw/hrCvxM6oyFaSmBIhN4cUHVM=;
        b=ByrxfzYOIF2T2ZW7IUU/7cKHfwg7esUpe36pG0whg6NycFZc9kofyHGbMzmLxst+n2
         LzozntrJgx4X9/1CGZHqa+FebvQqbBw6ISY3E9ITcNFuEDLPcPTwKXIXqDwTnCgJ8Ukk
         2uahaCuIFv01gPBJpK8+9vulzJTaMrGgMfsN+0Nskc1C2U9lnvhJkOsxB3O3G4ViqVdr
         CIiRevtPMPNSQcomknrLwHjm0VvaVGq6fWQHTWA1uc1Si3cz80uBzwefJBlWWfwi37Ym
         zgI0lhPpdczQUAAxEvgge/nTkSQlGh238eOcz24IxzpRDOZcynHUKQiHMNPS8yc0QjTf
         wsow==
X-Forwarded-Encrypted: i=1; AJvYcCUDl3rFXbjaCJH5GGezT3g9SS0JgQTTMa2bCLSk60W8ejWMCch48sy2UPTKJD1XePCH7CJ3tNYABGQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKgU+3MornQYT4lujEwMHTD4bmsbPaDrVaHGDBlNN4urBHXkoO
	DGJkbqweSxX+Dl1IaRhVAvICMq0nxlrvPI64HyfiqZHzxN8Q6IsC6oT2e7+mIQ==
X-Gm-Gg: ASbGncsKCeqPYe2c2aYGeXmN0uhvfp2735F4oDty1KxOe58mieDT2xlR2j4BNifVoeZ
	fCsgoCmOnoLMIF7KJbxp55d9wdy/GKr7hs5jc87+foFiPYkGjXdd+cInWaphfykBjYpZXW3hCNL
	UvYfeAfF8J04Lu0j4YTLyzh3kVwTHAk2zdw9qz1qRTyn03qEbnxVn/vhSpLsIeAzRF1dmYl5Ubk
	KltbZWl7Kw0TAoBlkSm9gj7x93XCDsxDCU4ak2gJHUFFpk/R5avwTsj8gG/0/DC6mXarNEenx2R
	+eubn1ULwQ0AD9oevw9rpHswDLoKmTVoBtnn7W+xjIYdzncVps/f7JUL11WJMcCm2q48Qvgnqjq
	s
X-Google-Smtp-Source: AGHT+IGROh7kfe458AtiDEkMD3Nr/FRXa88sn/COUJiJ4F0TFQ00aGFXM8KW9ok7E7t/48E2yXxyxg==
X-Received: by 2002:a05:6402:a001:b0:5dc:7374:261d with SMTP id 4fb4d7f45d1cf-5dc737427bfmr3798282a12.7.1738247459830;
        Thu, 30 Jan 2025 06:30:59 -0800 (PST)
Message-ID: <df094ad3-810a-46c1-8bb0-d240a8d80744@suse.com>
Date: Thu, 30 Jan 2025 15:30:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/15] kconfig: introduce domain builder config option
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-6-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241226165740.29812-6-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.12.2024 17:57, Daniel P. Smith wrote:
> Hyperlaunch domain builder will be the consolidated boot time domain building
> logic framework. Introduces the config option to enable this domain builder to
> and turn on the ability to load the domain configuration via a flattened device
> tree.

s/and/eventually/? Else I fear I'm not getting what is being said here. There's
no turning on of anything just yet, afaics.

Jan

