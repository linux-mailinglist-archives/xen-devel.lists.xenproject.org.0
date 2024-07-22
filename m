Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6A39389F9
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 09:23:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761520.1171453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVnO5-0001NZ-KS; Mon, 22 Jul 2024 07:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761520.1171453; Mon, 22 Jul 2024 07:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVnO5-0001Lz-HP; Mon, 22 Jul 2024 07:23:13 +0000
Received: by outflank-mailman (input) for mailman id 761520;
 Mon, 22 Jul 2024 07:23:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVnO3-0001Ls-N7
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 07:23:11 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ff3b810-47fb-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 09:23:10 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ef248ab2aeso21277061fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 00:23:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c922b75sm381440166b.180.2024.07.22.00.23.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 00:23:09 -0700 (PDT)
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
X-Inumbo-ID: 3ff3b810-47fb-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721632990; x=1722237790; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YFZUySdDi7DXHjs1J1a/uwX9YShs8m5Umy+CQL7fxBQ=;
        b=OYEcn/bcsmm+cCuwniV9oywDvnyjollgi7yuSGu/g+PnY9Jm+T/kmAhM0RKptgGqrj
         wKKrlwGZP2A+B+jhDX9P9/6i4yACCLJhabllbqDoQtXxwU1Zfg7f0tgcLTOwtC63eZuV
         7S6CCS7TSEM5cpmQI9dcmlT+hj2UPtA9KhrfL0PMloBHqzKs/WqKV7xvV+7sZJM/G3El
         J7ekX7gP5LzvXkHjyAXreJk76yz1uPzPLmRz+YSF79mVg3UtZm/fU6iYudghbfpClt4f
         mlt/ah0Ju4tlyg1HdyjtE6DDa14zqGLYUHptYZ3saJORmJqGtgdBDNnp3yRG96/MhAod
         tqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721632990; x=1722237790;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFZUySdDi7DXHjs1J1a/uwX9YShs8m5Umy+CQL7fxBQ=;
        b=kd3CSgYXYZ1ojAejGCS2vBlefIYrdEmGC6rg2KUyxWM8IPgM7bx86elp1P5TYPE2f3
         ko9BT9zON0AY3SGSZOCMTvGbVEk5rZrIPV3WAJAR+4iDRcnZq9fElO2JDYTouOhwdgV0
         s7wO6Q34jaCncRfplmhZ+hwUHChze1qGLDchOJCl/EeEfGbUVD6bhk0Ley/nXOf21KvM
         hLMRFMh9TFTn6r2BTMzNO4nSi+LlYr4YT7GNjvj8K0G7Dfl1IDSurPvvBSdd8vrMhynY
         d/LoDJXo2iO3OxYFQNHYqYXmHe/1YG/TRq8nyWklgKGfEUBx08TQEtOwHfS+yPZwj6oi
         qdUw==
X-Forwarded-Encrypted: i=1; AJvYcCW0qyzzbwQZ5mXMSrqzKTdEpQcPs3wICR9n3ds1o9DS49hMQdb5gkpBTDO/IVrD/cfAh8ALaXWkKAfH9FFTCDZ2ZbmD0A5LMLA9FJN2FSw=
X-Gm-Message-State: AOJu0YyHnadntrIdYwOPfKQ7QpaMxyjPZvWXJ76OfvtRoMYL8FU6SdRQ
	tXRnCUrAyI0SX+PMTNoRtArOnCln71sXWTaM/JPyn/zfJTDPSeLl5EH7Raf4IQ==
X-Google-Smtp-Source: AGHT+IFkk/tg56+tVywQO+Ev1FuGFUMmZkuGMErwPPyyMVI7iCjFJrC7kVfSZfnphsXfnCDO3AMGqA==
X-Received: by 2002:a2e:9d94:0:b0:2ef:2c68:a776 with SMTP id 38308e7fff4ca-2ef2c68a7f8mr26287651fa.37.1721632990152;
        Mon, 22 Jul 2024 00:23:10 -0700 (PDT)
Message-ID: <be94ac73-cb8f-4bb3-a529-4c3b47a939b3@suse.com>
Date: Mon, 22 Jul 2024 09:23:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arch/domain: Clean up the idle domain remnants in
 arch_domain_create()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240718215744.3892072-1-andrew.cooper3@citrix.com>
 <20240718215744.3892072-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240718215744.3892072-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.07.2024 23:57, Andrew Cooper wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -791,23 +791,6 @@ int arch_domain_create(struct domain *d,
>  
>      spin_lock_init(&d->arch.e820_lock);
>  
> -    /* Minimal initialisation for the idle domain. */
> -    if ( unlikely(is_idle_domain(d)) )
> -    {
> -        arch_init_idle_domain(d);
> -
> -        d->arch.cpu_policy = ZERO_BLOCK_PTR; /* Catch stray misuses. */

This line looks to be lost in the process. Already in an earlier patch it
should move to arch_init_idle_domain(), shouldn't it? With that adjustment
for the entire series:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


