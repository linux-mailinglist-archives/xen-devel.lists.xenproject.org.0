Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6747976631
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 11:58:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797210.1207092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogaU-0002LD-Nd; Thu, 12 Sep 2024 09:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797210.1207092; Thu, 12 Sep 2024 09:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogaU-0002J7-Ka; Thu, 12 Sep 2024 09:58:06 +0000
Received: by outflank-mailman (input) for mailman id 797210;
 Thu, 12 Sep 2024 09:58:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sogaT-0002HZ-6y
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 09:58:05 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ff8cab5-70ed-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 11:58:03 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso133222166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 02:58:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a902298d682sm122730366b.59.2024.09.12.02.58.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 02:58:02 -0700 (PDT)
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
X-Inumbo-ID: 7ff8cab5-70ed-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726135082; x=1726739882; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jCKZJPlm4JHkmlw4PnF/xDN00c6n7ZYwhZ1mE1Q5GhQ=;
        b=AjeznkYoD6v9UFrLoZoz8+G6xWRL+dMum6j2zqI3Jy0NOkxySRx17NIwTfROkxblx0
         Kiew0P6WZauR3c67l8oj0IdQ0lvYmV3kFToHOoZ8fxlZWQNP60k28zQ2mSeryhwQyoHN
         SpmNKYERgSEIvY0ZA+H3DAQZxWhgxkVih5ln1bUViqc2ubN1yJGYPhMJL6elq9bXHvy/
         uDCbT87hqekAcVMEwrlYHN3Cf+zGzNG52lfIFDIPiOQBol8fHulw1akj3mIPy6Pn7nwD
         NNffI4mk4Oz+0d1I5vOQkuTsMjkYcEqbW2x16nGi0vtSRphm/S6QtE5NvOMnFLX2Vn9h
         tt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726135082; x=1726739882;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCKZJPlm4JHkmlw4PnF/xDN00c6n7ZYwhZ1mE1Q5GhQ=;
        b=wnp1RJMfzQIxOPHmZDweh1LhTmW5TsuDzsHdahqFiPlY/fuZ5WTfq5efO3K5nv/4HI
         p131/HVM2DGtHHIhO2UrsWzCHAwHCrg798bRkeCl5YcVKquQ5BLzbOfc7isAnwOVYqaH
         aVkXWIikgj6MhMmnVGhYDtabs/08KvaLmKXjPOBDaZf2MNRhdMGdRyl0Bu0is5H+meM+
         +1YmJhJh2erSGZqyp8h8LwlYWsUDFBDu6Nk07MQ9wYX8ISAqL954PuWruWY2AVRjgGOY
         7wxdK6WNrJjU8CPHKaWcMiaVx0ljNKYfzeUg2vRsgwYk13ZOzAGI8wtvnWKa0AbVJ7H3
         K9aA==
X-Forwarded-Encrypted: i=1; AJvYcCXBCb1AzCHZ/g+QjCB4QTC6Ody+72ajBtHMp8ohJueW3AZhQNYbxZM6Uqsyu+s3D68xI9wk+au8XxU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yygiv1o11nOvm2Q0esg+o3DewD8KDi62+kTJFr/bzPKZcOZd2Js
	z7rQMilbHY1ElMRwaxfkMXhFQmzRBF7Rz+jJmHBq5Lbce9FJhUxROtD7VJ59uA==
X-Google-Smtp-Source: AGHT+IH5cvo3UB9mHLDzltMUkun+jZpnYN4vuT29652JNg1d9JcMMXaL8sx6JrgYs96xGr00jSS4fQ==
X-Received: by 2002:a17:907:6d0e:b0:a8a:9243:486 with SMTP id a640c23a62f3a-a902a8c0a4emr212794166b.21.1726135082467;
        Thu, 12 Sep 2024 02:58:02 -0700 (PDT)
Message-ID: <adec9726-096c-40ab-8a8d-ae0c2ef216c5@suse.com>
Date: Thu, 12 Sep 2024 11:58:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] xen/riscv: introduce functionality to work with
 CPU info
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
 <77a00222008f8b41d2454e74d1c9247252d7ccd9.1725295716.git.oleksii.kurochko@gmail.com>
 <6c43c528-daa9-4449-a383-aade3da73160@suse.com>
 <de3f5c4fd5dd2a8533ea376a013f8e40b85dc6b7.camel@gmail.com>
 <1ef2902e-b307-497b-9c97-d1e3771b62af@suse.com>
 <d04ad9b90347a69d88b67a2ec6861995ca10cb84.camel@gmail.com>
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
In-Reply-To: <d04ad9b90347a69d88b67a2ec6861995ca10cb84.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.09.2024 11:27, oleksii.kurochko@gmail.com wrote:
> As I mentioned above, interrupts will be disabled until tp is set.

Okay, so all good then

> Even
> if they aren’t disabled, tp will be set to 0 because, at the moment the
> secondary CPU boots, CSR_SSCRATCH will be 0, which indicates that the
> interrupt is from Xen.
> 
>> - like you do - transiently setting tp to CPU0's value (and hence >
> risking corruption of its state).
> I think I’m missing something—why would the secondary CPU have the same
> value as CPU0? If we don’t set up the tp register when the secondary
> CPU boots, it will contain a default value, which is expected upon
> boot. It will retain this value until setup_tp() is called, which will
> then set tp to pcpu_info[SECONDARY_CPU_ID].

Just to clarify (shouldn't matter in practice according to what you
said above) - in

FUNC(setup_tp)
        la      tp, pcpu_info
        li      t0, PCPU_INFO_SIZE
        mul     t1, a0, t0
        add     tp, tp, t1
        ret
END(setup_tp)

you start with setting tp to the CPU0 value. You only then adjust tp (3
insns later) to the designated value. If you wanted to play safe, you'd
do it e.g. like this

FUNC(setup_tp)
        la      t0, pcpu_info
        li      t1, PCPU_INFO_SIZE
        mul     t1, a0, t1
        add     tp, t0, t1
        ret
END(setup_tp)

Jan

