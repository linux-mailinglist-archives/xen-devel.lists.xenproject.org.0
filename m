Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E8D9C86D9
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 11:07:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836187.1252062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBWjw-0008Su-2K; Thu, 14 Nov 2024 10:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836187.1252062; Thu, 14 Nov 2024 10:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBWjv-0008Qn-Va; Thu, 14 Nov 2024 10:06:15 +0000
Received: by outflank-mailman (input) for mailman id 836187;
 Thu, 14 Nov 2024 10:06:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBWju-0008Qe-9v
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 10:06:14 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1292af3c-a270-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 11:06:10 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4315f24a6bbso3892005e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 02:06:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dab72159sm14946955e9.5.2024.11.14.02.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 02:06:09 -0800 (PST)
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
X-Inumbo-ID: 1292af3c-a270-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzQiLCJoZWxvIjoibWFpbC13bTEteDMzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjEyOTJhZjNjLWEyNzAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTc4NzcwLjUzNDg3Nywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731578770; x=1732183570; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OjiG5FfzCvUoQmSwAVK3D9jVJJTn3Tm55wP16uDKKg0=;
        b=eakQQh8+EYZGlH1nv5yh/Qhgf0B+JVha05168s2kBldMnhIYv/0DlLFq8Gp2LhEFro
         UDSTrYorg6meuT0PV43Ue7q6tR83Rj3/Eg9+SvHTiZUObqCJrIK9WVUC/hZRaRcF0rSi
         vtoeyiMA0+el5/MEc/BiRhZiZocyslIhgZbBtW6GdWg1xlt6PZGH0sylrn+NCM2Y1EqD
         +40QoHiPvMbO7DCnUNzRqAN0tDbSFMVclhLNzX5S1RtD7zDibuxFpr9TZ40ty8xfSqF6
         VcAi6E5UTNUFfKZnr/A145BEe6I2qHqVFYrfOIto74TObd73EadWr1LKkga5UnQsoOaS
         vUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731578770; x=1732183570;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjiG5FfzCvUoQmSwAVK3D9jVJJTn3Tm55wP16uDKKg0=;
        b=s3fLvPoYTKuIEj7AMwnB3aiS62D2QSHERsV0M5p5b8Rr4Gu4YCcdbjMTHQSZUXLCjW
         Fseyb111C7nhJX+GIVVLR4E48ydo8n7k9fi7Hmn5o7bIaInsKbp/u/3R/yQUmK/c3G/2
         Ehh84Ogk7A0133tqjUXkujJof53YYKYmJQKfOuloV6hnyQTfCSJtUlbfUHh+KOF08orL
         x+FrLuRY3rPUc7E7vgQDcV5U32WbSSCKeuzR4LeI0IigHYc0lfXgkR0QgYYj1Os0GGGY
         uFu9es0RwgWZFStifWGpzJvOoOTCnNCi6LtR+QjDvgP1bxdmOk9aiIsG7wNe8Mf8cejH
         fPXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLVn371ZXMlT0nGzMNo6DL3dug+boxjW1eBuBHX8G4STum5kLztu1k72ROs/aWbqHqAbdAx08erMA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjeQps3V4GXawjzdPgFHtkj1w3SPAaF5nh9vBKegcRu0GXeFpa
	tNyl4HlqR+j5+K1vbPOWi0ae0ry5h2XoGQ6JXC397Oa+FiGFPIeXWfYG08DRVA==
X-Google-Smtp-Source: AGHT+IFP/ZY8/EQ5VQfvxHPCD29G228P470JJ4Rt3JFMLswrI7Q4Zmuzi9ccHf84uVhxKBNBXsN7Og==
X-Received: by 2002:a05:600c:8608:b0:431:4c14:abf4 with SMTP id 5b1f17b1804b1-432b7887154mr206140385e9.14.1731578769889;
        Thu, 14 Nov 2024 02:06:09 -0800 (PST)
Message-ID: <bfa96484-9539-405e-b589-fe478d0c62e5@suse.com>
Date: Thu, 14 Nov 2024 11:06:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/multiboot: Make headers be standalone
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241113185118.1786703-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241113185118.1786703-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2024 19:51, Andrew Cooper wrote:
> --- a/xen/include/xen/multiboot.h
> +++ b/xen/include/xen/multiboot.h
> @@ -17,7 +17,7 @@
>  #ifndef __MULTIBOOT_H__
>  #define __MULTIBOOT_H__
>  
> -#include "const.h"
> +#include <xen/const.h>
>  
>  /*
>   * Multiboot header structure.
> @@ -45,41 +45,43 @@
>  
>  #ifndef __ASSEMBLY__
>  
> +#include <xen/types.h>

Isn't xen/stdint.h sufficient to include both here and ...

> --- a/xen/include/xen/multiboot2.h
> +++ b/xen/include/xen/multiboot2.h
> @@ -114,6 +114,9 @@
>  #define MULTIBOOT2_FRAMEBUFFER_TYPE_EGA_TEXT            2
>  
>  #ifndef __ASSEMBLY__
> +
> +#include <xen/types.h>
> +
>  typedef struct {
>      uint32_t total_size;
>      uint32_t reserved;

... here?

Jan

