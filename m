Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8722C9D2491
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 12:07:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840000.1255782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDM4B-0003DE-1F; Tue, 19 Nov 2024 11:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840000.1255782; Tue, 19 Nov 2024 11:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDM4A-0003Bl-Uo; Tue, 19 Nov 2024 11:06:42 +0000
Received: by outflank-mailman (input) for mailman id 840000;
 Tue, 19 Nov 2024 11:06:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UMhk=SO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tDM49-0003BA-Gj
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 11:06:41 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58bee9b3-a666-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 12:06:38 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5cfcf4df87aso2390441a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 03:06:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e086995sm635712366b.200.2024.11.19.03.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2024 03:06:37 -0800 (PST)
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
X-Inumbo-ID: 58bee9b3-a666-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzIiLCJoZWxvIjoibWFpbC1lZDEteDUzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjU4YmVlOWIzLWE2NjYtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDE0Mzk4LjU5NTg3OSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732014397; x=1732619197; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zNeVs6kmWakulWc4KT/4b3PsO7wcEun6xx6Y75i2T6c=;
        b=bwamorxjkm+Ku/XawJqhONcVvtmDmDUAbghKtXBY2aiOUFpuc+gej8zJO8KU0RcxnB
         OnYlj5HrOXzrYQ1c2Rl7xsvSSjuTeO/brkRT6gJeIeJ6JaMdOrmCBbkUXqsEm/JwOD/A
         XetpXmu7c4UJ5HTWVOejKpg1t+lES97+iAHCnKWTNETHBi8yuy+MyuzeFLkzriGhr0/a
         Y362QbgqHVADjfNCo5XoW0xnunP0XcMZqZgM+iWImTlsWSxKepO88EgjqOu6riusE1Dh
         KfnWzPWY5k9J72bqjIdj3h1s2odt221CnR4DuN7gyIIjFSOYwCQTcUYkUxKuBmqSi6sF
         qTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732014397; x=1732619197;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNeVs6kmWakulWc4KT/4b3PsO7wcEun6xx6Y75i2T6c=;
        b=ua6G40MEeLZgaprI30k0S/9qoem//KLZLak6vjXqlyAdd2dl8NzCVkkyuZmW00gWjS
         zJJG9VVMjoOFh0JAzbShu1MZsqzcIBNjbaPLRa8HWcuPeDFB2BiSd8QDpv+kLGcYjcRS
         d+3QEoHEC3HeWMigLueYxQVi60HYLktzgvDqUmTIBV23A7cntRPuDQ79qk065TjgnzXK
         5kv5Ioer2teyD9kLiqahepYsXg9BXex9nN5w6dGjtZlPrXeGQILepMLOVe6jR5Hs8Eu8
         iJsl8796JLhixwK193GH9i7ldpC9L5sjFj2FE1WocPxaNLSBpeEa/9TXvGVRKllTb1zt
         54gw==
X-Forwarded-Encrypted: i=1; AJvYcCVi6KAa1gIpSyIK2vahOwb2/Gt8SDbMugF9aOwsZS473j/sWe6D7L2PHSWIJdeNonMjOlrV36Uf/SU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKaM8pmoNsg3zU1FzdqJLqcp1rKZRj9czBLPCzxgyKy0uXM1Hx
	RUCvVeEk1snHokSOKffhBGEywH+ER5NXX2k2FF7jZtuaMTObW2T4q3QoqkgZAg==
X-Google-Smtp-Source: AGHT+IF4mwlShaT+NxAG+nuhg/8oQH2a6obGLi4CxMN1cwFCtq4U9MDElLmc0GIOxMM5dKtgeSAY0A==
X-Received: by 2002:a17:907:60c8:b0:a99:f6ee:1ee3 with SMTP id a640c23a62f3a-aa48350a5a5mr1570202466b.43.1732014397405;
        Tue, 19 Nov 2024 03:06:37 -0800 (PST)
Message-ID: <ed2bbb54-1dba-4680-9279-0648882cecd9@suse.com>
Date: Tue, 19 Nov 2024 12:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x8&/mm: fix IS_LnE_ALIGNED() to comply with Misra
 Rule 20.7
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241119103444.23296-1-roger.pau@citrix.com>
 <20241119103444.23296-2-roger.pau@citrix.com>
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
In-Reply-To: <20241119103444.23296-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.11.2024 11:34, Roger Pau Monne wrote:
> While not strictly needed to guarantee operator precedence is as expected, add
> the parentheses to comply with Misra Rule 20.7.
> 
> No functional change intended.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Fixes: 5b52e1b0436f ('x86/mm: skip super-page alignment checks for non-present entries')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



