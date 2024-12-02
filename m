Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1D59DFD20
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 10:28:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846423.1261597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI2im-0004ml-RO; Mon, 02 Dec 2024 09:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846423.1261597; Mon, 02 Dec 2024 09:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI2im-0004l2-Of; Mon, 02 Dec 2024 09:28:00 +0000
Received: by outflank-mailman (input) for mailman id 846423;
 Mon, 02 Dec 2024 09:27:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI2il-0004kw-Ap
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 09:27:59 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6141ff2-b08f-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 10:27:55 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ffdbc0c103so53326171fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 01:27:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e64a8sm485083066b.130.2024.12.02.01.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 01:27:54 -0800 (PST)
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
X-Inumbo-ID: b6141ff2-b08f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmIiLCJoZWxvIjoibWFpbC1sajEteDIyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI2MTQxZmYyLWIwOGYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMzMTMxNjc1LjQ1MjY0NSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733131675; x=1733736475; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gBsGkaw40T4YY5XjpuiMoX/ong7PRVrTp6oRrXduUTI=;
        b=IcgWd/YrW0vqkiwUHHRRmEPj5vWwdvdjiTD48/V4DmaAeZI4AC3DXYTnhXGps0Dkv1
         E6BfjXOz+jms1Mt0bmMA9SOzUYDUKTc5LV/B+RStVagWFnfdMfgyDfbu67tTygg8sjtt
         q3X9Iw+51zHge/900syFmFDi3LjRKsyOHx4sxrbk/fv7YzZJOAwCC22eHEJT3ygtJD9c
         R9KaJuikzEJ7bsb8SDJoyOAdiLMVZDrQBeTALmBy9RwZrKKV+z4b+IVHGBPFsT4XEy+o
         xMLEHx2axaMSeWeZmcl59lhm46tOnNTOL82alOX5FAXmjuyytMSR2ZGKsu7tJBiTRGzX
         WKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733131675; x=1733736475;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBsGkaw40T4YY5XjpuiMoX/ong7PRVrTp6oRrXduUTI=;
        b=VEjRBwWIFLrH7/DYUgGxgqLnOOTYO9E07pJP9rFq0wJsQ0VIrUGow2rC+3dePphsG1
         U7IPTmzpZFwBh6wh05F/B8PGdKF+ekH/3ulwRQvunIC46oxZ9M+pueMlGzTswafwXC/+
         nEERLeXh7OzEv/DTMvBcALNtoWsvHYIXLSz5xitY6c8/f2sSJib0E+CdLe1BIk5Qa/0w
         lzvPp4D+XxpnY9Qtk/1K5mFO1GinWwPpbzMQf8nW/PRt1W5INIll4zbDSIPc3Mawdtaj
         u/HXW+lkPL8znhQJOZjXSWMvFojG0aJEnY7uXOVosQSO4sd9zL0oXGYMq5+BiStQ7tds
         4m+A==
X-Forwarded-Encrypted: i=1; AJvYcCVQICGFKSqKAwwMVOqS7wumrLoFvb/kY97OeIh2UQKTyPhTEmKS6q3a5LLzltB9SxXrPDvmwMxig44=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwhlhnxNjiZOddkmGeek9ukD2VYf4MynWEZh7DJnN6yA9VPNska
	fLxM60WA9V0xUt+X8+I6jFHrt4aodLQrwgq2qkmfigTC1ULQgLh82b6sIKk1iA==
X-Gm-Gg: ASbGncte8Owtn93ZwKE3X9njupZAuQUzMlMRRXYsiOJLjrNxyCuLCkPtpvUBJyxe9Jf
	jkBIXMctjNVuhIj+7FhcDT+oNXfzsaHhIePO8oRygjXnUncnz3H5yzjDEZrTTVcLTFIH3C4uFKz
	k6Zbb730Y3oWczv926eFATqDOF2CdYLYn/Z8V1LZVdkJyl+5tyS2Dg3lRipKliNB+C7pP1u5sNk
	sQg8UOJ10I59kQ28MfBP2Fl/kwTZc0q0+KIBfUEHfZUj59mxSg7vA+nOosfx+l1AywESdO031un
	kbplCLKP/OsdIX7+hgIiiiIkvHtr+X4jkXM=
X-Google-Smtp-Source: AGHT+IHhsy9Ofx7px4webTuziN26cw2W0bcMEx+CkXKmWzD4z+MsjScWLRMGHYcQpDpRhbi+iDqeOg==
X-Received: by 2002:a05:651c:b24:b0:2ff:c4b2:496b with SMTP id 38308e7fff4ca-2ffd5fcc1c9mr152392771fa.7.1733131674871;
        Mon, 02 Dec 2024 01:27:54 -0800 (PST)
Message-ID: <11a0bc21-4e48-4dac-858a-a1dda512b99f@suse.com>
Date: Mon, 2 Dec 2024 10:27:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] xen/x86: Add supporting code for uploading LAPIC
 contexts during domain create
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
 <20241021154600.11745-4-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241021154600.11745-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.10.2024 17:45, Alejandro Vallejo wrote:
> A later patch will upload LAPIC contexts as part of domain creation. In
> order for it not to encounter a problem where the architectural state
> does not reflect the APIC ID in the hidden state, this patch ensures
> updates to the hidden state trigger an update in the architectural
> registers so the APIC ID in both is consistent.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



