Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC7898B8F4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 12:07:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807957.1219720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZmx-0005Uc-Ky; Tue, 01 Oct 2024 10:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807957.1219720; Tue, 01 Oct 2024 10:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZmx-0005Ra-HQ; Tue, 01 Oct 2024 10:07:27 +0000
Received: by outflank-mailman (input) for mailman id 807957;
 Tue, 01 Oct 2024 10:07:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svZmv-0005QH-Oj
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 10:07:25 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f43ceb76-7fdc-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 12:07:24 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so772197966b.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 03:07:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2947e49sm683550366b.135.2024.10.01.03.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 03:07:23 -0700 (PDT)
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
X-Inumbo-ID: f43ceb76-7fdc-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727777243; x=1728382043; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CEMFbpLXOkPdN8935sPXKcLmYx/DtVHcb9gVW2NXeuQ=;
        b=Sr9o39M1TFNCPUI8YP7VGRljmqq81c/Tk7PK+xAskPhsflCrmfe9cpE2d9GDKjf5bh
         YoUfkU7XpUHR8/Md9VnZjXqgQ2hJf6KI/jlYQywzwAH7YgK8EmeojCFlQKRkzTyZPJxd
         NJR1Gl5wHIs/X7SkiY+c/IZbbm5nqLuUWl7p4fgqL2CjNPrq5DRu4I1YkbbTndKW0shV
         +1gGRGqqu2dyab5KN5iEi0oJ6RiZFKlQaQEei5IPWEqVuTr67WPoLks0/HkqnG9kGvCD
         szbT/SEA7zBFickv4VKmJihOSgBymbfuN3YEsNfLVkw7Naa3YDV9dTWmeeqkA2O8xf0H
         lcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727777243; x=1728382043;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEMFbpLXOkPdN8935sPXKcLmYx/DtVHcb9gVW2NXeuQ=;
        b=Nnv/jBZWtexeFhBaItEashbGd+O6SEUhdK/mh4yOvc1uvnwskfRwvttBm6kNT3sbiw
         6YfAKekIjQwo6gbMNMcCqVnK11VEuJxCfAN/+4pppCgUushejEDFUWCZzJ90Ff6OjV7E
         Nkecn0XubM8VYXFSi8V2W/CwZXHVH2/Kn5hDMafSyMnyqfZWz6Kk6egUCNV6ggxAAo2i
         fR50xu1C8U4GSe5wQolJckv/J0V0FjOrsIIrwCwQEdhaJ0X7qGIeIbU7o/FbOhiVXrkM
         3wmjz13MUqpK403kyGkxckuc7WhxkqIlW2Xw1TABxYBaoanBKUZbiErl03W93U1JgeJV
         EUiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO4z88dudXycPYwY9nqPA6t8vAcsfaH74qMzOXOyvkFXbyb7+xSgb+PeedLJZv2W69fZtrUmSy34A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyuoun95RYv7xV6PxoUf8uBCecmFu+8gjSvj2vDyDFXkdLain1+
	wS9ryL/FH+QEgV2C8rXR57s3hK4VSly7QQYf9USvz5v0xQChBuMt0ay7bl7xMg==
X-Google-Smtp-Source: AGHT+IFVwxDjlK0o4yqAL/lbs+m9ihgjS659KCs6LdXUjJWDYOVbz0D5Ng/c8NH0aKPu3kczavdIKQ==
X-Received: by 2002:a17:906:7946:b0:a8e:a578:29d8 with SMTP id a640c23a62f3a-a93c4acab60mr1486764066b.64.1727777243466;
        Tue, 01 Oct 2024 03:07:23 -0700 (PDT)
Message-ID: <e1c8d10b-7926-4f62-8421-ad2ba55573c7@suse.com>
Date: Tue, 1 Oct 2024 12:07:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] x86/boot: Rewrite EFI/MBI2 code partly in C
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20240926092109.475271-1-frediano.ziglio@cloud.com>
 <20240926092109.475271-3-frediano.ziglio@cloud.com>
 <e17b2afc-3647-4472-9d37-1510b40ff23d@suse.com>
 <CACHz=ZhtYik3p4z2mc1PYG9M68Mwap68_DdoE7MWksW0VW+BTw@mail.gmail.com>
 <b2a8b468-5745-4f58-bb86-721ea055c1b1@suse.com>
 <CACHz=ZhhpU2S1Nt2EW-LL=r8fZSbCLMhFMWD2SWvPP094gc1rQ@mail.gmail.com>
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
In-Reply-To: <CACHz=ZhhpU2S1Nt2EW-LL=r8fZSbCLMhFMWD2SWvPP094gc1rQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.10.2024 11:48, Frediano Ziglio wrote:
> One last though. Do you think I should now rename
> xen/arch/x86/efi/parse-mbi2.c file ?

I wouldn't mind if it was named just mbi2.c, but the ultimate decision is
with the EFI maintainers.

Jan

