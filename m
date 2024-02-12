Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B97851791
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 16:05:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679625.1057157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZXsN-0000vG-2y; Mon, 12 Feb 2024 15:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679625.1057157; Mon, 12 Feb 2024 15:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZXsM-0000tK-Vk; Mon, 12 Feb 2024 15:05:42 +0000
Received: by outflank-mailman (input) for mailman id 679625;
 Mon, 12 Feb 2024 15:05:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZXsL-0000qI-Hk
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 15:05:41 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fbf85c3-c9b8-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 16:05:40 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-411a5b8765bso1823275e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 07:05:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n16-20020a5d67d0000000b0033af26545c8sm6987897wrw.50.2024.02.12.07.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 07:05:40 -0800 (PST)
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
X-Inumbo-ID: 2fbf85c3-c9b8-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707750340; x=1708355140; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G7EAqjlnRFxD16UrnMJajlEeaimgLOuCMVU+W7dSDyU=;
        b=MOyRXtpqMqNBT2hiM5EmXZ1VbNep9WLhbjrzQ79HD4tPiwsRzRHtJMaHLAFczfN3eT
         +MH8YI0gxnKEjT3xzRJwhh+yaRCzdaA1mKXmxijmvoIj23ecNR9RxUxT6yQy6cZrbQyB
         XKZajsfEDCkYd02r/TM8293iCPvXzJuSyPvQMdCYXKE7neCNYDURmEumst2MyMlKRBea
         R+CWCqvd87Gjs/w6rrZYWebtpNzY2NPFekGeHB+DgkJVHmY3teOWifCMkYBxOqSGakYs
         LL9FoyqohLt2ByGvTpoC2YXpLEVQco80BOiWJgT7xdsxKfTA49LJQpFXgF/JyyqrFlrG
         tITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707750340; x=1708355140;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7EAqjlnRFxD16UrnMJajlEeaimgLOuCMVU+W7dSDyU=;
        b=umiTwJ7f8xPpyHyZPQ3gdYm29QDEyUIU/SVAWIIIZAojd2ZkQrDafgbsJyO5IEkDFf
         I+QxtQusvm/XqTo57mYoCf7Ona9wL/CTPlvQYJyZmKIKbBotsR/UU6FeZN1/6U3ky1Po
         9XJSMs1qiif0xKwH+0aEBqRpXFFHBOiwpjrb8v5/eR4AiDVasVCZ9ygBSk9siRsa9sJB
         x6ily5i/GfY4rDM+a8dqsNTQNlrkCtmDh8vYzJwNIKSCqu59fziyOaBGjG/eEc8ctud/
         TyHNg4CW45SSWIcL5kkf03ckihgT72Zxmh8b1bMOToqeqJeo5PWGCnykrOPj7nfIiaK4
         bF8w==
X-Forwarded-Encrypted: i=1; AJvYcCW8OXnJHE/gUCe2My37TlywTlVMqC2DWb5hHZ7UhoM7cFoFjy0ut7U5SdOYo8bSIr8OrF387ZaE0pkbeHvqZtIIG/UuxCvB1rH5yMy9VBQ=
X-Gm-Message-State: AOJu0Yxix3l245BXInCSX2OomO/Z+WzBolaIP3DRO7xCfRdpAv+62uV/
	CvInOfIhJgBxQaY98r45sGP34EImGoH6h8EYgnuEx7D7oQxYdHQXTH6mPeUU3g==
X-Google-Smtp-Source: AGHT+IGy0VFkhkTLhNt+G9H60u9TGF9DW/ZeWApp2ury9xxkqzHDCeCyUqAp+QrPN/PzuU7+3LbV8g==
X-Received: by 2002:a05:600c:4f4b:b0:410:ce61:8609 with SMTP id m11-20020a05600c4f4b00b00410ce618609mr2883617wmq.11.1707750340389;
        Mon, 12 Feb 2024 07:05:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWfbj8Vmg0UNwF4rBg47khSVQE2Ff5q8ggcypWcRXorFraBcAV+sX+8QuU98MAz2x4rin8cQtpazQBxvhBuT0lhrKW0T6XNy8buvWBP96xYvF0tPXJ5f7D8FQponHNdUH5uWR8jfkjPRjmdNOfydXQte/k3EHixWcV9qSsrCUnst2Auc9eXmj29ccYEM6WEbgNQHBl1XIwc/TNfTRM=
Message-ID: <b3141aff-32ad-4e2c-aa2c-a5803924951f@suse.com>
Date: Mon, 12 Feb 2024 16:05:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/30] xen: add support in public/hvm/save.h for PPC
 and RISC-V
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <c929f784466e1ba57c19663e88f22c598d961709.1707146506.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c929f784466e1ba57c19663e88f22c598d961709.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 16:32, Oleksii Kurochko wrote:
> No specific header is needed to include in public/hvm/save.h for
> PPC and RISC-V for now.
> 
> Code related to PPC was changed based on the comment:
> https://lore.kernel.org/xen-devel/c2f3280e-2208-496b-a0b5-fda1a2076b3a@raptorengineering.com/
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Albeit I don't see why ...

> --- a/xen/include/public/hvm/save.h
> +++ b/xen/include/public/hvm/save.h
> @@ -89,8 +89,8 @@ DECLARE_HVM_SAVE_TYPE(END, 0, struct hvm_save_end);
>  #include "../arch-x86/hvm/save.h"
>  #elif defined(__arm__) || defined(__aarch64__)
>  #include "../arch-arm/hvm/save.h"
> -#elif defined(__powerpc64__)
> -#include "../arch-ppc.h"
> +#elif defined(__powerpc64__) || defined(__riscv)
> +/* no specific header to include */
>  #else

... this isn't simply

#elif !defined(__powerpc64__) && !defined(__riscv)

Jan

>  #error "unsupported architecture"
>  #endif


