Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDD382D58A
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 10:07:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667230.1038283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPIw3-0004d7-BU; Mon, 15 Jan 2024 09:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667230.1038283; Mon, 15 Jan 2024 09:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPIw3-0004bi-89; Mon, 15 Jan 2024 09:07:11 +0000
Received: by outflank-mailman (input) for mailman id 667230;
 Mon, 15 Jan 2024 09:07:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPIw1-0004bc-O0
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 09:07:09 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75551a1d-b385-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 10:07:07 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50e9e5c97e1so10536339e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 01:07:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t30-20020a02b19e000000b0046d950cf82bsm2200479jah.85.2024.01.15.01.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 01:07:06 -0800 (PST)
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
X-Inumbo-ID: 75551a1d-b385-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705309627; x=1705914427; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7lTwm/RchhPfKQClcsMYPVfiFqGv8zg/eFQBRH1aqGw=;
        b=YC6zwR0bPs4STKg4hroNG5+QgQtrXbOTmMw5vwpnv+n9QKk1NtqokSA1jMkyqU1hk1
         oD0eCDbcuywsIZDM5WbibGfEOw+nI5K0dR568J5DNAyzSd/h282F2+T/cjPkxWlNC0p4
         4897t097eipfkgcNIpWVzaaIO6ZAZdYxeJdS8+cKfi/NNktsmsr80XIl0OJ3HxgEpJ9u
         NL0k3xkKh3JAojn0osA67lR4v+m01l/gL9YO4WQovmdOOeAXbp76VGR7eHzq3iL+2CX1
         7DsPIZ9azvoIgC6ax7JbXH/BbSmqp3Cmxwov6zv61iahSGyJrJJ/FpZ6t/Fj2elz9XKy
         YdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705309627; x=1705914427;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7lTwm/RchhPfKQClcsMYPVfiFqGv8zg/eFQBRH1aqGw=;
        b=WpPu/JdkZwibJ9ce9/ZslVdlzPj3hTDa3zrrse/q4h8hnyvm8N6MK8mic20TeOodK9
         h0FZWPhT0UOVcr7vZNb+tePV1JQsQrM169Rp0oGb20OuqjL2TMOrDW8NcNJtyRuJjnA5
         TfkFW5LjEwc7IRNyj07TWyJw8ZsFdLZcE99Gzp7OrLb4p2Z5O/y5aTNSQA7ifF4KLkKd
         hN5sDQxWI4NvVabZp72YmoCu3uqbe4PFDf2aiU0pmJ91esOzAZfsPf+gHl76jRfMXZqs
         QQD6lCc7Ey034UQWePdC1jRlBgoMZg9n8Kv6F+O0TQGs2fTsUjAfuiZXptJM6q5nlPTs
         ZcBg==
X-Gm-Message-State: AOJu0Yz+0ThmhK3tB7RK0rqZYqh/izapDFnPXrLqTw44pYtq8e6HPmD4
	bWfY5fTfP5lIn/a8J8x7+zqT3o1a0yQq
X-Google-Smtp-Source: AGHT+IHSs1iH3qQYiN0gDEEbCUZYDCg0PnStPvVs0K+4Akvy9Ay5Iway5xFwdfVDoP3Muy8izb2ykQ==
X-Received: by 2002:ac2:4294:0:b0:50e:b301:f386 with SMTP id m20-20020ac24294000000b0050eb301f386mr1953929lfh.104.1705309627178;
        Mon, 15 Jan 2024 01:07:07 -0800 (PST)
Message-ID: <2e2bc9b7-f0c0-4924-89f6-8717e10266de@suse.com>
Date: Mon, 15 Jan 2024 10:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 09/15] vpci/header: program p2m with guest BAR view
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-10-stewart.hildebrand@amd.com>
 <ZaFVhaVvpDljEgdM@macbook>
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
In-Reply-To: <ZaFVhaVvpDljEgdM@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.01.2024 16:06, Roger Pau Monné wrote:
> On Tue, Jan 09, 2024 at 04:51:24PM -0500, Stewart Hildebrand wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> +        /*
>> +         * Make sure that the guest set address has the same page offset
>> +         * as the physical address on the host or otherwise things won't work as
>> +         * expected.
>> +         */
>> +        if ( PAGE_OFFSET(bar->guest_addr) != PAGE_OFFSET(bar->addr) )
>> +        {
>> +            gprintk(XENLOG_G_WARNING,
>> +                    "%pp: Can't map BAR%d because of page offset mismatch: %lx vs %lx\n",
>                                            ^u
> 
> Also when using the x modifier it's better to also use # to print the
> 0x prefix.  You can also reduce the length of the message using
> s/because of/due to/ IMO:
> 
> %pp: Can't map BAR%u due to offset mismatch: %lx vs %lx

Or even

%pp: can't map BAR%u - offset mismatch: %lx vs %lx

? Note also my use of lower-case 'c', which brings this log message in
line with all pre-existing (prior to the whole series) vPCI log messages
starting with "%pp: " (when not limiting to thus-prefixed there are a
couple of "Failed to ..." outliers).

Jan

