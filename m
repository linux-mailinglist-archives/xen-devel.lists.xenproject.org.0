Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E548C756E
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 13:46:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723228.1127896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZYy-0001pw-ML; Thu, 16 May 2024 11:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723228.1127896; Thu, 16 May 2024 11:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZYy-0001nl-JY; Thu, 16 May 2024 11:46:20 +0000
Received: by outflank-mailman (input) for mailman id 723228;
 Thu, 16 May 2024 11:46:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7ZYx-0001nd-RZ
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 11:46:19 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8135b12-1379-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 13:46:17 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56e69888a36so3259576a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 04:46:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bed0af0sm10403816a12.49.2024.05.16.04.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 04:46:16 -0700 (PDT)
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
X-Inumbo-ID: e8135b12-1379-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715859977; x=1716464777; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RM3byCZX1/6byX6gI2+BOAfTlRNvy3a3bQJ5HRPzyAM=;
        b=fNrhVQkpRw7mlELruqAfWnd/WnPzT5Y9bFHt5F5Ps98Slyy/8DBUETaeZMrHULHpvO
         ap44keJP3hYgLjPvT/Qw4t28irFUDFrtvwcdRk/MA125v8Wwl6403jq2xfrVf855LZAi
         uoKz6mWxOa+is97dkx3pUin8dBoFUjyBTOR11LGWlNh2QKYQMIg1gPHaFMLswSgBNVHK
         W9j6P+3E2Z55M31b9r+csZ4zykHSzX2kHJeIRUWIENNz/b/1ZjQ+ChXYUjXPyGE/Kfp3
         c6W0NYMRx/a563acn4X5l9dhrMLgVZCNpNBpWTYxkiOz9fz3mC14c4KWC3QzYgtLRL3G
         Hbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715859977; x=1716464777;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RM3byCZX1/6byX6gI2+BOAfTlRNvy3a3bQJ5HRPzyAM=;
        b=D5nD8IYY00qsx8TPI6eznvcY9ktN2Rh1iftgejvUUMBmAD7q4hi3ofSSpgz8Nv7YsX
         EflB4VPioxLV/YWPR7dK1sevalcPuuHauNsz/tUr/Fd3T+seaon0rFXFW5+EUQo+PxZ1
         luOLGR0o/g12gXeaP60jiKD1wrMPO/nIe37jXN7FVHsqYvUczsCaQwQZWexDoeaJR2qa
         l/5AT9TAG1EpigvQ1AacJFUtOAw0y62Pt9NLvxQxOEc1/IPvXMuY2iN6bjhQljytYLgv
         sEFq6e1thJjYtkjDWjTybPfv33H0h9C9tuSJdQF9u+6bvJ/TSDthFos6X3SQ+sqpNtS0
         mGtg==
X-Gm-Message-State: AOJu0YzNaF6DXULxkGYGH+k7JQ99mcbJ1OQ1EZvd97uA5Waddg78z46B
	yI2rcqu4e8oa7se+mRrhkmcH+FgLXn0lwdXqCCvfho6Y4sqcW0BvHTv/75vzHg==
X-Google-Smtp-Source: AGHT+IHWeBxrUZjQ799dn9Ph9Re16jDB/a0CNvm72JgTdJwNfwOcdgcr9ptusBMCcaeubud65JAuIg==
X-Received: by 2002:a50:d650:0:b0:572:2f0d:f4cb with SMTP id 4fb4d7f45d1cf-5734d5c16eamr11557639a12.1.1715859977330;
        Thu, 16 May 2024 04:46:17 -0700 (PDT)
Message-ID: <6367019b-2683-4422-a4f6-df692b0f6a5e@suse.com>
Date: Thu, 16 May 2024 13:46:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 04/15] x86/p2m: move altp2m-related code to
 separate file
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <d791a552c3d9331d9b2d40c91e6568932ea6afb7.1715761386.git.Sergiy_Kibrik@epam.com>
 <alpine.DEB.2.22.394.2405151735350.2544314@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405151735350.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 02:35, Stefano Stabellini wrote:
> On Wed, 15 May 2024, Sergiy Kibrik wrote:
>> Move altp2m code from generic p2m.c file to altp2m.c, so it is kept separately
>> and can possibly be disabled in the build. We may want to disable it when
>> building for specific platform only, that doesn't support alternate p2m.
>>
>> No functional change intended.
>>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>> CC: Tamas K Lengyel <tamas@tklengyel.com>
>> CC: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Ouch, I'm sorry, Stefano, I failed to put this in while committing.

Jan

