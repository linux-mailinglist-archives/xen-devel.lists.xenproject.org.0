Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE32596B19C
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 08:31:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789795.1199442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sljXv-0007Pq-BA; Wed, 04 Sep 2024 06:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789795.1199442; Wed, 04 Sep 2024 06:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sljXv-0007OK-8P; Wed, 04 Sep 2024 06:31:15 +0000
Received: by outflank-mailman (input) for mailman id 789795;
 Wed, 04 Sep 2024 06:31:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sljXt-0007OE-L2
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 06:31:13 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 474edf1d-6a87-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 08:31:12 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a80eab3945eso591513866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 23:31:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891daf9dsm765439366b.164.2024.09.03.23.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 23:31:11 -0700 (PDT)
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
X-Inumbo-ID: 474edf1d-6a87-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725431472; x=1726036272; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QtA1RsB6QSrtLHfE41c3Ffw9/HsxBEgr+6UgdJ3W8cU=;
        b=Xpvbm9+hW483wpy5bSlTgn8vCoDcQnUunzrvR+tSmg2qlvyo5eUMiaMUGLrgCFqMra
         bvHpHcBYvcQYUNYgD+oj7eS4e63nQdo7JI2bbXAypIRHkO2wwB1qEmA4yHqiWxsIE6qu
         WbMeBQExQZg6F6GZF47/6XUEJfwjSj+yKQeJyrl8qxj9H+MuefpRQQLt+4AL2B7fs95p
         cn0N7LElKYP0o/oVxDy2jciI0UIUwOex+V1z67puowvY/s0uxcpLcE5ntwNDbqGU9rB0
         21TWt6PYvZNvHoecjDuHb0R75arUkrRyJrOh7vrgCNoAsoSdog96iCrD4jVa4Ha0BFqA
         lD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725431472; x=1726036272;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtA1RsB6QSrtLHfE41c3Ffw9/HsxBEgr+6UgdJ3W8cU=;
        b=vzkCJ4p0+BMWczKEHf/qjdRvLcE764GTNs1vk1O5E1LssBy3+4ZjHgOhHEOaPYQqza
         STcDJXpMMQEZa1+koO3M0RD515LAqLfOCpoyzEVfy81q7T6km3iiCXKRggGl436t8NQb
         uKey9uItM/JBI5+RtO+ULmpmm7W9AFBvW57uxqtfZ7uNUeuR+TKe8K87KXjjMLJzm36h
         ENwGmOPn3dNz9FNgZZiIy/s84LwqSfqywJTK4GKCqQCF/y1ze2/RfCo9iiQdTh52I+t1
         8n2K9b5IqgooV3lCdrbucGryoywgFgaMWgRMV4K6oFg5eYmtN9sHAcO1fP9ggLFctyBx
         fjvA==
X-Forwarded-Encrypted: i=1; AJvYcCVh/UbLQTzEryUFSIo0F6EOG3jsJo1Luv0DrlG+lM91vBVsKj4N135vtkyI4DmJrNyHK/8nRIQgxWA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/6ViOKXrAIuTvUPmuuIkqTcNsER64FCheNyNUzYpQOli2SPde
	Aa328A63Oh/2PFMPYmSUIPHhVbT/HiuDcvIG0ngcEprpqKgJVa4+w1BfsE4X1A==
X-Google-Smtp-Source: AGHT+IEQee8Xu1lPjl5OHCkZDp1J544xTGoW5EE5ZdbLrAFljf5vtCWQ8LebcMeuEWDww3v6YDUwRg==
X-Received: by 2002:a17:907:980c:b0:a86:8f57:7de0 with SMTP id a640c23a62f3a-a89a37aa9famr1134354866b.49.1725431471882;
        Tue, 03 Sep 2024 23:31:11 -0700 (PDT)
Message-ID: <ea1c567e-93d7-4e98-b184-81a85715c3fc@suse.com>
Date: Wed, 4 Sep 2024 08:31:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/44] x86/boot: move x86 boot module counting into a
 new boot_info struct
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>, jason.andryuk@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-2-dpsmith@apertussolutions.com>
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
In-Reply-To: <20240830214730.1621-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.08.2024 23:46, Daniel P. Smith wrote:
> @@ -276,7 +277,16 @@ static int __init cf_check parse_acpi_param(const char *s)
>  custom_param("acpi", parse_acpi_param);
>  
>  static const module_t *__initdata initial_images;
> -static unsigned int __initdata nr_initial_images;
> +static struct boot_info __initdata *boot_info;
> +
> +static void __init multiboot_to_bootinfo(multiboot_info_t *mbi)

Pointer-to-const please.

Jan

