Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 260869A2594
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 16:52:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820680.1234236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Rqv-00058S-0d; Thu, 17 Oct 2024 14:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820680.1234236; Thu, 17 Oct 2024 14:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Rqu-00056Z-UL; Thu, 17 Oct 2024 14:51:48 +0000
Received: by outflank-mailman (input) for mailman id 820680;
 Thu, 17 Oct 2024 14:51:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rwie=RN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t1Rqt-00056T-UA
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 14:51:47 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 547e2ba9-8c97-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 16:51:45 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42f6bec84b5so11352825e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 07:51:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7fa90818sm7487579f8f.53.2024.10.17.07.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 07:51:44 -0700 (PDT)
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
X-Inumbo-ID: 547e2ba9-8c97-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729176705; x=1729781505; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2MsMwOd7nSHUKEo246bmkYH4R+Lqrf6ER7hND9/0lfQ=;
        b=YX1HsHCkQWnd6pYbtBXZBV0lOOm+Vd+nWqDuIJfvKhpGvV3SoScqG/pXAV0Bb7ErRO
         c0HgG9kc67GcMBv7ZOwbo/aYGxDtPJVIZZzgsCvXnihq+qFjpxmyYn7kHSjn5Y+4JQyX
         i0eP+zaNuFjDS1rEoLzc+V1+4SsMdtWFfP8fB0ZFwtfuOg+sZqGy6XwnimabbRqsTxaK
         JsO9eRmI4z/gC1M/rJGU+JxwELUzPZGfWUVAezsZfO/hWlEcOJ8iD90ueNyjv6hBnNn2
         SUvmO6GF0aLlO1tLfeo/ccUecNJAz+ZjFg9tFZhxAJGGd7sicp56Kg2dshsHuLH6Q40R
         k+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729176705; x=1729781505;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MsMwOd7nSHUKEo246bmkYH4R+Lqrf6ER7hND9/0lfQ=;
        b=ie4MZkAwwGtfGk5wuFK7c84UThxV0QQ53nJcueLIjWFWrkWdJIsDkvYE9SyIayE70j
         XRMMYILdhfJvvP9PFw+hWR6tZG9uIrpDLFABmeQthqshixAARA/BoxRtpWEgz8OCZrSu
         6sGMHcQO2ov42peb6SLrKlKs7mT+RQ5tR640L0aueN9ELR3CkAKmIXAcy9RNz5ycxIo7
         0cYiW4EMZXEQyvHq2o6txyA/xJnOtOoqrOJszIdITDUHaZRR4BRFCPESQaK9RpbiAXx1
         +iRJCw7T+NojSOJ8/2aTC7/uBJ6INMNL28uWpZaz0DouIW9X1yBd7gu8wEglSaylm25m
         BDPA==
X-Forwarded-Encrypted: i=1; AJvYcCVxLw7wTtH7JCnWDz+AwHGlNG9FUatv75sU5fXyRUZ0ikUICbBR2iLOmcQEHUDNT4sGfPf/gzJSoRY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuRNV9ktIuaqRdJF5at1bebFEOCe3Y0R3V+Nga/MvnZpoTPExt
	CG0lIYPc8G4aLDlBmWa56FbmO9M1qLuMV4Mw6YNYNbxM4DFEVL+cSAMohZq34w==
X-Google-Smtp-Source: AGHT+IFc3Gitn3w0eSAd/rwCJbaQBpr2vEUUUYdsxrOkTdR6v5h5TAOEs1KvOmxPsjK3+nFY9Ps0lA==
X-Received: by 2002:a05:600c:3328:b0:431:5970:806f with SMTP id 5b1f17b1804b1-43159708617mr22028675e9.34.1729176705156;
        Thu, 17 Oct 2024 07:51:45 -0700 (PDT)
Message-ID: <b8de7161-5d71-4ed7-a3cf-611f4a860926@suse.com>
Date: Thu, 17 Oct 2024 16:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] xen/riscv: add stub for
 share_xen_page_with_guest()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1729068334.git.oleksii.kurochko@gmail.com>
 <3dfd4bdf6584e73ecdbff5a66fdbaec68e31cc3c.1729068334.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3dfd4bdf6584e73ecdbff5a66fdbaec68e31cc3c.1729068334.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.10.2024 11:15, Oleksii Kurochko wrote:
> To avoid the following linkage fail the stub for share_xen_page_with_guest()
> is introduced:

What do you intend to express with "is introduced"? Is there a problem now?
Would there be a problem with subsequent changes? I'm entirely fine with
adding that stub, but the description should make clear why /when exactly
it's needed.

Jan

>   riscv64-linux-gnu-ld: prelink.o: in function `tasklet_kill':
>   /build/xen/common/tasklet.c:176: undefined reference to `share_xen_page_with_guest'
>   riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `share_xen_page_with_guest' isn't defined
>   riscv64-linux-gnu-ld: final link failed: bad value
> 
> $ find . -name \*.o | while read F; do nm $F | grep share_xen_page_with_guest && echo $F; done
>                  U share_xen_page_with_guest
> ./xen/common/built_in.o
>                  U share_xen_page_with_guest
> ./xen/common/trace.o
>                  U share_xen_page_with_guest
> ./xen/prelink.o
> 
> Despite the linker fingering tasklet.c (very likely a toolchain bug),
> it's trace.o which has the undefined reference.
> 
> Looking at trace.i, there is call of share_xen_page_with_guest() in
> share_xen_page_with_privileged_guests() from asm/mm.h.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/stubs.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> index 5951b0ce91..c9a590b225 100644
> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -2,7 +2,9 @@
>  #include <xen/cpumask.h>
>  #include <xen/domain.h>
>  #include <xen/irq.h>
> +#include <xen/mm.h>
>  #include <xen/nodemask.h>
> +#include <xen/sched.h>
>  #include <xen/sections.h>
>  #include <xen/time.h>
>  #include <public/domctl.h>
> @@ -409,3 +411,11 @@ unsigned long get_upper_mfn_bound(void)
>  {
>      BUG_ON("unimplemented");
>  }
> +
> +/* mm.c */
> +
> +void share_xen_page_with_guest(struct page_info *page, struct domain *d,
> +                               enum XENSHARE_flags flags)
> +{
> +    BUG_ON("unimplemented");
> +}


