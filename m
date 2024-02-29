Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B451886C8AB
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 12:59:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686964.1069629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rff4G-0005Jl-Na; Thu, 29 Feb 2024 11:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686964.1069629; Thu, 29 Feb 2024 11:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rff4G-0005GZ-KX; Thu, 29 Feb 2024 11:59:16 +0000
Received: by outflank-mailman (input) for mailman id 686964;
 Thu, 29 Feb 2024 11:59:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rff4F-0005GT-HV
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 11:59:15 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f48df371-d6f9-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 12:59:13 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a293f2280c7so166239166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 03:59:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 kw11-20020a170907770b00b00a43f170ad9asm606233ejc.152.2024.02.29.03.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 03:59:12 -0800 (PST)
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
X-Inumbo-ID: f48df371-d6f9-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709207953; x=1709812753; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pPg34hk/0SnBk16LHps3PKPgFPhMSPoHpr+UeKsvq6E=;
        b=MqISVuuskMA79+MaEj2RqtRQcIYSlPbazp6ojGvvcUz0N3lGGCQB7VJyFm+a1ROrWf
         V3KozavhGwWNOWysHx5KD9MpHmyG2MC3ofEjvopWAom1hWpvEO7Q1ShYSCMegflYc/dH
         cS/hhhbOJHajHGAoz/Ynr/F66hLPa36f5fP7bElPk2XB3W9I3L6UwgY965k/y8t/dpVs
         w9dCRh9tBvsgcd7oKcx8/LdQbB2a5OTo7bvVhvSAhh7mgHV0uWEjJLRqmR6RbatNP4CZ
         FcaOYZV1WLiGfQ9D4rcSqW0PEfMpbgfhp0/XzXbTX06XsFYF+hPsS3T0Z4CCGYLwkFYc
         NUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709207953; x=1709812753;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPg34hk/0SnBk16LHps3PKPgFPhMSPoHpr+UeKsvq6E=;
        b=Fabw0okTuz7SB53l+AGn7iBVAe0wp9ChfYE4ItLMEERCK49F+h3DZXnhmEaKMgsEXI
         2jwg9txPbsVy/ATWFZcwEtQJ4ZWKTgDUI8fu09z/LD7xOk0/SQEnlWBcl2o5VNI9lWoP
         /nyrZNb+C6Xew6W+5kRljAaRVr2vBeSyB9X2xN6R3I4VadEfhNF8O9QBAF+sCQK+NMQB
         qaoVIh4EcZ+T99u84SvUuv0PmORuRIUJNJ45RVxfmwo3uMURSYkJhS8ZiceIsjlJBHz5
         WSLPyjyzOf2wxoyHZel3zawbQ4qmUqfBrmtdPkEs3Plvlo3be7V9aYXVEmjyXmtvXjQT
         gR7w==
X-Forwarded-Encrypted: i=1; AJvYcCUcM2TkxYI6FeXtlI9H+qXSHzckV26ZBxE4gguBm9XZQMT4nHa3WoV31B0jbMb9U/rMe8EvnrWEMWr1nmX7H5k/I4B/nVyMbTBb8IEAQuw=
X-Gm-Message-State: AOJu0YxPzH9mlqTsFA5DCfhr61HsfCJvh/CsjmvA2hFGDDa1rA2EG0Pq
	9RSs1zuGjgD9uijqcQlMs+QAEmZCjsO/w8d8hKvPaxYkZ4sTg/t2lU8vTNgzt6/aIFJ6JleoKvg
	=
X-Google-Smtp-Source: AGHT+IEekvDeYV00WxtnEDYvGVwqoMwnIDmz7LLro2Tg0kBdcQCtY6RJYXmUybdih3H5m8tSdAL8HQ==
X-Received: by 2002:a17:907:174b:b0:a44:1f3:e474 with SMTP id lf11-20020a170907174b00b00a4401f3e474mr1203974ejc.23.1709207953021;
        Thu, 29 Feb 2024 03:59:13 -0800 (PST)
Message-ID: <d3d18aff-64e1-4620-b538-e026afd4af17@suse.com>
Date: Thu, 29 Feb 2024 12:59:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/23] xen/README: add compiler and binutils versions
 for RISC-V64
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <ebaa05ded3cfddb1e3f7c87cd806b866312878fb.1708962629.git.oleksii.kurochko@gmail.com>
 <73a38d85-0798-4cfa-8625-0f8c9e05b2a3@suse.com>
 <80fb8091-9a26-40a4-b2e7-371df9411861@xen.org>
 <889b132b-b92e-465b-94af-4e4133e4c297@suse.com>
 <52188e88-374c-449f-a71c-bfce9b6d07f4@xen.org>
 <751bc87b-c8a4-4905-92bf-fc50f9102d4a@suse.com>
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
In-Reply-To: <751bc87b-c8a4-4905-92bf-fc50f9102d4a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.02.2024 12:56, Jan Beulich wrote:
> On 29.02.2024 11:23, Julien Grall wrote:
>> On 29/02/2024 07:58, Jan Beulich wrote:
>>> (And
>>> no, upgrading the ancient distros on that ancient hardware is not an
>>> option for me.)
>>
>> May I ask why? Is it because newer distros don't support your HW?
> 
> Because as part of my job I also need to support ancient versions of
> Xen on ancient distros. Since I need to keep those around, it makes
> sense to me to then also test modern Xen there (every now and then, as
> said, and not really extensively).

Oh, and - because upgrading has proven to take quite a bit of time, if
also accounting for all the follow-on work that needs doing when parts
of the upgrade didn't quite go as intended. Whether newer distros
formally don't support such old hardware is just another possible
factor.

Jan

