Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EF082840E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 11:33:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664375.1034546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN9Q9-0001ge-3L; Tue, 09 Jan 2024 10:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664375.1034546; Tue, 09 Jan 2024 10:33:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN9Q9-0001eS-0c; Tue, 09 Jan 2024 10:33:21 +0000
Received: by outflank-mailman (input) for mailman id 664375;
 Tue, 09 Jan 2024 10:33:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RTBC=IT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rN9Q7-0001eK-Ju
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 10:33:19 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 810bd256-aeda-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 11:33:18 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50ea9daac4cso2848144e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 02:33:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 hr6-20020a056638700600b0046dcd4d4229sm567942jab.125.2024.01.09.02.33.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 02:33:17 -0800 (PST)
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
X-Inumbo-ID: 810bd256-aeda-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704796398; x=1705401198; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g+J4ZLm2rZK+JGtCB8kOJMKYQTOHLrdKcyDIyJLC9g4=;
        b=TDpXHl39s2+WJmZchP4PnHSpsa17o7TZ9YpYkkhZjE+ONXj5+Yd2Tzrs4ooDVQJc6E
         pjibf2WVbfo5oJJgTOw09uhYBZQXSMngDJtPV0Q7IjoKj3Tafcr4dQfKHU64v7Ofudlw
         B+8BpXF8nDv5MY1H5lFyLoBXoTvHWDtxnRilHuS6IKvoneL/2cQEVfhvXpAWZTrgM4gS
         bMqvJOZY+kaGx3ZSJbMlLm451w+EmDminHEBqB/BwPHF0MCgxk9ViiwuHgb7plqH4Aci
         57DTO6RoNU+UPe9V3ws1/vvrj1S+aewx7IW2c82QfOzNZ1+iERiTf39tGMKwD8GMI6+/
         673w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704796398; x=1705401198;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+J4ZLm2rZK+JGtCB8kOJMKYQTOHLrdKcyDIyJLC9g4=;
        b=jgencEPfBYu5U4NbRNT+9D+QCfo5axjmRkcaxI6xaD/PjfKDHtOZZe7eI4JCO8KTQ4
         +dV5qnAEd39QSNooWT/FyY1LzKyjsjj+/kV2Y2XmPJlUt/gpPjPKcsMSjMukccqrdji4
         nmy1qUsJXdl0LhNmKSZgI60myFOVfHNCsqpT96mRac2GH0gfaa32u+ll0Lsm1/YspPZQ
         7Pa1djKskdZQk6qE+if1aX7B2iq56fSREXMcuBdDkqVE++dVh2mtG4sR76YJFXxbosii
         SOw6fu4hFuNJjDKzSlCUmfJpgi4RpeMrrtpPqJNatStQklphyHRH2BQi4n2nWzpVHKZn
         q9iw==
X-Gm-Message-State: AOJu0YyQTlD92TkmF7q/+AymlejudNJ4eqOw4MmKcRVaqnJ9RjutUEIe
	EuBniGUgUfDc7RWjQSva/NDrj+2o+OGm
X-Google-Smtp-Source: AGHT+IGPfWmj8hW7ZYjIAyw4Bbhm88KR0yQhPyplUXaokVkyY5RdpCsFONQ7Ptq7msB+7liB5jJtyw==
X-Received: by 2002:ac2:51b8:0:b0:50e:710b:a7c6 with SMTP id f24-20020ac251b8000000b0050e710ba7c6mr2008692lfk.138.1704796398318;
        Tue, 09 Jan 2024 02:33:18 -0800 (PST)
Message-ID: <101c638c-03ee-471b-a6c8-9c2c10772001@suse.com>
Date: Tue, 9 Jan 2024 11:33:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/13] xen: add cache coloring allocator for domains
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-10-carlo.nonato@minervasys.tech>
 <7fbe9526-60cf-4844-8b48-58ab69ec1b29@suse.com>
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
In-Reply-To: <7fbe9526-60cf-4844-8b48-58ab69ec1b29@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.01.2024 11:28, Jan Beulich wrote:
> On 02.01.2024 10:51, Carlo Nonato wrote:
>> v5:
>> - Carlo Nonato as the new author
>> - the colored allocator balances color usage for each domain and it searches
>>   linearly only in the number of colors (FIXME removed)
> 
> While this addresses earlier concerns, meanwhile NUMA work has also
> been progressing. What's the plan of interaction of coloring with it?

Thinking of interactions - what about static memory? Is coloring incompatible
with that? If so, should the two features be excluded to both be used at the
same time?

Jan

