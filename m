Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C6288D89E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 09:20:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698339.1089909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpOVx-0007NX-B5; Wed, 27 Mar 2024 08:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698339.1089909; Wed, 27 Mar 2024 08:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpOVx-0007LC-7u; Wed, 27 Mar 2024 08:20:05 +0000
Received: by outflank-mailman (input) for mailman id 698339;
 Wed, 27 Mar 2024 08:20:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpOVw-0006xf-HP
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 08:20:04 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce8a0d81-ec12-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 09:20:01 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-56c4030a6easo241815a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 01:20:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m5-20020a170906720500b00a4df01f4232sm1851904ejk.189.2024.03.27.01.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 01:20:00 -0700 (PDT)
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
X-Inumbo-ID: ce8a0d81-ec12-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711527601; x=1712132401; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dbdQ/uvnHSq8FwOCP2tDQ95vkaM+LDk1v7I85aR2ELw=;
        b=a7HNHjRgkKehB2LImz3Tt87MQQ5VLCWXMdX3GfXnPIch9fPIWQRLkbpYLw7p6adfRR
         8halG8qd1PSkMq4YdtMckz9FjEVN/0COR7g1eTnn2l/DDoM/yA1i+lpiJxLUmqgBJWPa
         A01iRvxUPDVXSnvZYm6Sb+ksAUuWYQxzmr239T9bneOwLuDeEP1YsJFJjKusdXfaXAS0
         E0LBLLKq6Eqpk3ZAG+LbhE6GNbjGPRcmE68RLV+9Ou8pFsWQ9YDJTlB8PN5FgTKxbh67
         PMol4OLzNNP8G7V1V7JgS0/BYAefXJPl+dSDAjrpD5Wh6Tg5/Ds/cVkYyCw/VLEHWxaG
         l9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711527601; x=1712132401;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dbdQ/uvnHSq8FwOCP2tDQ95vkaM+LDk1v7I85aR2ELw=;
        b=g+GwqiZ7j+ePtQ+pexPDPAChbNkA3CxILCLCIZRXlX5lTdAq8Q/sh9WDMVYEatf1w9
         JRwCPh0y7+9J4PdhcLbDzEhrEzo+cBDGFJyzfjaW01jBZweI5Vzlq7/QwcrHVHVKVWr2
         Obf+3UbpaHiHe3eEvF6DBrwhB9/DH4IqSw619f1Ei+pltTZXmZ6VdWoyfSpoubvvbeen
         leWJAPjZY+s1HFDQiPuhCesD5BNL/dUsovy3a3zQIBWAHgkft2Bdy522ZPhpWbfL9nIX
         M4IYiIGmSVIuMGlh7SeHabWAFNHwt1cH63XnlN2wn6ih3vUKEFGoC/D0CPktxTbBYomj
         rELA==
X-Forwarded-Encrypted: i=1; AJvYcCX5dM3G29fL9eLp3W2/6JAZRuRmTZxHUSwAtZcOCy57d2ImUzA1jynuGNl6nwaThX7BZFZdOs6AgchxD3dgEEPjPUYw6f/BScJ4yu7Qov0=
X-Gm-Message-State: AOJu0Yytjn1/NjVvXbynp99UQXONILBbFWb+gIm/V8ryQRL0+Gk6psES
	+H9fY+MIj8ox+EMLJsrw527Hh5AtQfyY0ziGlazwiM8/Q2rRmhQjhN/4MEzCUA==
X-Google-Smtp-Source: AGHT+IFIpHkwPppZIaj9IblhQ1CjaPrqMxmg7azN1JlKqvIo35cVX0jiKmcqj239bcv3L4fnWPaZew==
X-Received: by 2002:a17:906:a255:b0:a46:7323:6ab3 with SMTP id bi21-20020a170906a25500b00a4673236ab3mr1297907ejb.49.1711527600834;
        Wed, 27 Mar 2024 01:20:00 -0700 (PDT)
Message-ID: <45c20ffd-f0c0-4521-8221-c3384cd5f7c5@suse.com>
Date: Wed, 27 Mar 2024 09:20:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] RFC: x86/pvh: Make Xen PVH entrypoint PIC for x86-64
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
References: <20240326213847.3944-1-jason.andryuk@amd.com>
 <20240326214701.7015-1-jason.andryuk@amd.com>
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
In-Reply-To: <20240326214701.7015-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2024 22:47, Jason Andryuk wrote:
> --- a/include/xen/interface/elfnote.h
> +++ b/include/xen/interface/elfnote.h
> @@ -185,9 +185,25 @@
>   */
>  #define XEN_ELFNOTE_PHYS32_ENTRY 18
>  
> +/*
> + * Physical loading constraints for PVH kernels
> + *
> + * Used to place constraints on the guest physical loading addresses and
> + * alignment for a PVH kernel.
> + *
> + * The presence of this note indicates the kernel supports relocating itself.
> + *
> + * The note may include up to three 32bit values in the following order:
> + *  - a maximum address for the entire image to be loaded below (default
> + *      0xffffffff)
> + *  - a minimum address for the start of the image (default 0)
> + *  - a required start alignment (default 0x200000)

This looks to be stale now.

Jan


