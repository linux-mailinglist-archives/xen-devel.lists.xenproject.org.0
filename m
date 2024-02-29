Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A11986C8E8
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 13:12:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686995.1069659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffGa-000195-P5; Thu, 29 Feb 2024 12:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686995.1069659; Thu, 29 Feb 2024 12:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffGa-00017I-MQ; Thu, 29 Feb 2024 12:12:00 +0000
Received: by outflank-mailman (input) for mailman id 686995;
 Thu, 29 Feb 2024 12:11:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rffGZ-00017C-Hh
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 12:11:59 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbebad56-d6fb-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 13:11:57 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a443d2b78caso95604766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 04:11:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s22-20020a170906501600b00a42e2bc82dbsm615537ejj.169.2024.02.29.04.11.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 04:11:56 -0800 (PST)
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
X-Inumbo-ID: bbebad56-d6fb-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709208717; x=1709813517; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z4ltvyyAJimZey8Ue4oGEaTFAdTeP4wAJEl5/2woNww=;
        b=VM26dmoBq/Fqt7gVYycUAB92OUnlESRrDMMpE4NWZqzQ0smwfRkovjf3wWbCRpDZff
         b8xkzRiEc1YfJxy0PbODQLGYCev4JAE+cp4aJdZegf5JglBnoVv8uDd/rniaNlFlKjm3
         rAdPTw6w7XwW1926P29/Y7Cg5ooNxnD8VyFRr6yA1DivFeXDX/S7LJ1G5BoT9q9R7d+R
         yKoZICvDjQlHOfAnLuKjXgJ6qvFhf8MGZOKGezpg7mboNd3pYaTXHvQ2MjxomzEWZnd/
         NwH6Knda4VTsrWUcXl9e9K1NrtGrNsUOlw98iNeONXoxUumii3Q5SY1BJgSSWnKAg/y0
         g+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709208717; x=1709813517;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z4ltvyyAJimZey8Ue4oGEaTFAdTeP4wAJEl5/2woNww=;
        b=nA+yFas0vUeHj5EC4hccK5bcmu9ZpftGU559mM3yhJ9NYznUKusGQBFtMrlN4YaPq8
         c/GaknMrY9FzEU4fS3zmVfxsZgwdaG/HMnK+XlH7WXGj0rPpYmGPwN3r1rmPSqra3O4N
         fYgGEi1V+oYe7BmGTL7gN0tbQnCb/Hfjk644x0CamNa+tFuQ4kM8H33qnQpbEXQwMNwe
         aZ4r1RAcI5B3HGESUSz98PUG/YO1C+k9+7uovgu1eNFb1uc8YPOvownSnoRE7sn3mM0t
         wW6TxyY9N5Gt9/BJBCRacpXyPJIMUwH9v7xQ3cuuYjqZ5QdIMPG3C3uTl2MheAw6b/xd
         osdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM79rkYtATVIPBxgxatyO7dRjq5lC/bmFzn8YgRGv6Y4GCqMebzUjlkqYccso7LibT3lc/3WT0mErCOhfar8l8XAZtfqNxnkwgOHuXWZE=
X-Gm-Message-State: AOJu0Yx+nnabMm3Lw2uw0nlLSDTxEXcwcVjuzwWBB9z7+qS/PDq6jA6s
	0Gy8BygdWR/sNjXagq4mxo7Z1e+nyP459+P+AXODboO0RetRZ7fR9zq1s2rgHg==
X-Google-Smtp-Source: AGHT+IFxY79TZMnXmb/qmm/11L4GNwAD0PVU9w4Rk91vfWE/xz5j4SIcLt9hg2KONAIIWFzaDvEFCA==
X-Received: by 2002:a17:906:e091:b0:a44:4fbd:a8fe with SMTP id gh17-20020a170906e09100b00a444fbda8femr847931ejb.1.1709208716924;
        Thu, 29 Feb 2024 04:11:56 -0800 (PST)
Message-ID: <780ec3ab-08e3-4fd8-a85f-0e89ea75dcc8@suse.com>
Date: Thu, 29 Feb 2024 13:11:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] README: bump minimum required clang/llvm version
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <20240229095529.17723-1-roger.pau@citrix.com>
 <20240229095529.17723-2-roger.pau@citrix.com>
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
In-Reply-To: <20240229095529.17723-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.02.2024 10:55, Roger Pau Monne wrote:
> --- a/README
> +++ b/README
> @@ -41,7 +41,7 @@ provided by your OS distributor:
>          - GCC 4.1.2_20070115 or later
>          - GNU Binutils 2.16.91.0.5 or later
>          or
> -        - Clang/LLVM 3.5 or later
> +        - Clang/LLVM 14.0.0 or later

Wow, that's a big step. I'm build-testing with Clang7 on one system and
with Clang5 on another (and the latter more frequently than the former).
If any real dependency on this new a version (about 3 years old?) was
introduced, I would then no longer be able to locally test any Clang
builds (and hence the risk would again increase that I introduce issues
that affect just Clang builds).

Jan

