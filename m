Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9FCAE5BE9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 07:43:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023063.1398957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTwQw-0001yF-5w; Tue, 24 Jun 2025 05:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023063.1398957; Tue, 24 Jun 2025 05:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTwQw-0001vV-2A; Tue, 24 Jun 2025 05:43:02 +0000
Received: by outflank-mailman (input) for mailman id 1023063;
 Tue, 24 Jun 2025 05:43:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTwQv-0001vP-78
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 05:43:01 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 164fda6b-50be-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 07:42:59 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so33825255e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 22:42:59 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2f9:d2d:164b:59bd:2475?
 (p200300cab711f2f90d2d164b59bd2475.dip0.t-ipconnect.de.
 [2003:ca:b711:f2f9:d2d:164b:59bd:2475])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535ebcecb5sm165211135e9.37.2025.06.23.22.42.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 22:42:58 -0700 (PDT)
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
X-Inumbo-ID: 164fda6b-50be-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750743779; x=1751348579; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YII/pg33QDjWUEY7B65NUePtYiEVx/EClHtlZV0meDY=;
        b=cjTS0CPEZtAIFEolRrZT7GN+Gi8ByZKTXUQqcpR+sdgHPh+GsOdfXWHgXgtIJOy/hJ
         G1+cmL3HX5tl218lJ9iEGdiERnBMXFRkT/+eAYdb26AjnYgruylwOAJRIzELrfixYBdh
         wi6u+5gecWPkxTFdAUjIOqjUi1Szxt1In7ivjdHhGf1PmZMDaRp45F6nIreL/POCTSUf
         3bSSufYi+aKvRvt4A0nIgzaxAHOmJQFIvC9AKij3lQSs9sqKAt2PvsSQIWSXEAlD3cb4
         cmYBFal91rqxQVDh73f9ZU4ljWI0fNVWfXUkF6EJb44nil7ojwXbxDL/fU5aRSCrSw23
         3Frw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750743779; x=1751348579;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YII/pg33QDjWUEY7B65NUePtYiEVx/EClHtlZV0meDY=;
        b=Tg1n8BGWOJ8Rkc4+PjsHJ7sCiz7wW/F5UGw4YUH104J+DBIaoqAviF/np5ubAftvoO
         zVTbKEnU53q2DryE/kZOy5SC7EPANdu5b3oH1HJf777rxuTbq+NhPXJezsQdK7ZGvOyl
         /EMOnMYcF+8gli0MLm53LsCWsy+irnc5tT7jFPsy0s6SOV23mS0pg2TnUI1/4UDKPLmy
         8Mk7nBaDh3NHNiGygoYH2nnoTYZUYC/gUGTlg62iSHmkoO774qtV4OUy8SNE+Ze0e+9k
         s5PsFcEwOp+7bbkI4tFYep8QuS/4ZOt8lsW0+Hwdumiq29V08a0CAQtvQAmzscenjNJy
         FtPw==
X-Forwarded-Encrypted: i=1; AJvYcCUy1FHWn6ZV7lHOj2qr/U4HNVWFzs3CAzLVOT75NUTFryxKTF851+8jz5kdulMFAFJehkDJKXdRfV8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxamo1pE6uOtiElijNR24o5lwJLC7XOV3kv9Wf4l3qvXxVyLXCY
	zLRd8XGmkIN6ews0CkHbgbeTRjdZ3kWV4898VGIIQK3sGyaYGicuNPfDvPog4klqKA==
X-Gm-Gg: ASbGnct7AC2OSMAs7TgLD6z37QVDCnH1Cdq2dDnHD4Y5IkY8s++Ds4XtaNKhs0HYmoY
	VnvJXYDCnK6fJ+vO/60+ZxHKsapCFkTRLrXCqewZfqYmfg1HmLMFGtifN4UOr1VvjNpDI1G1Urn
	RljI+lhJsG43bQ9n0jc4j8kZWl/ZKeHsquR/ZUIDUcgRa2MdvJiuj3/qtTgp6b4s4bDHVui2h2O
	Q4SJ8c5RJSla5qv+RnIjEOB1zSLMxaGUNo4A+eayghYDig2gO18fVHXtzZO+RBmSLzOzFza4vdd
	XG26ci/SbTXJEDnRdTATbN4tA0wQn/x/b3xMxjalpdr/Q1qzOoD+GwINUp+ofLjuSii9eqqOriU
	GFOePVH8ZuynfMrRlNoy2GrwqdDlqUF7uFCRB66E6+amZPihZcJR8STSQGEI9PaMl1YbwBYAEFO
	3hrOneDXtmEC4oh5LUBg==
X-Google-Smtp-Source: AGHT+IG5+cap860JXD2/phP74gzUqDLovGSeEphWO1D5NzNq5T5iDnicpibE0V0RBR7FmPF80o+hfg==
X-Received: by 2002:a05:600c:81c8:b0:441:d4e8:76cd with SMTP id 5b1f17b1804b1-453659f6a8cmr144683075e9.29.1750743779200;
        Mon, 23 Jun 2025 22:42:59 -0700 (PDT)
Message-ID: <b31da849-283e-4f84-854a-50da2d0878d7@suse.com>
Date: Tue, 24 Jun 2025 07:42:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/x86: address violations of Rule 11.3
To: victorm.lira@amd.com, Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?B?Um9nZXIgUGF1IE1vbm7Dg8Kp?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20250624002018.4121819-1-victorm.lira@amd.com>
 <20250624002018.4121819-2-victorm.lira@amd.com>
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
In-Reply-To: <20250624002018.4121819-2-victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 02:20, victorm.lira@amd.com wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Use {get,put}_unaligned_t to ensure that reads and writes are
> safe to perform even on potentially misaligned pointers.

Also applicable to the Arm patch: Please can such patches mention the
main subject of the rule, not just the number?

Overall I'm unconvinced we really want or need this on x86; I'm curious
what Andrew and Roger think. Further, even beyond the respective remark
below, I'd be pretty surprised if these were all of the places that
would need fiddling with. Mind me asking how the places to touch were
identified? (This may actually be a good thing to mention in the
description.)

> @@ -388,7 +392,7 @@ static int init_or_livepatch apply_alt_calls(
>              return -EINVAL;
>          }
> 
> -        disp = *(int32_t *)(orig + 2);
> +        disp = get_unaligned_t(int32_t, orig + 2);
>          dest = *(const void **)(orig + 6 + disp);

Why is this latter line not also adjusted? The field is expected to be
aligned, yes, but for the code here there's no guarantee. Imo if this
was left alone along with applying the suggested change, a code comment
would need adding.

> --- a/xen/arch/x86/include/asm/hvm/vlapic.h
> +++ b/xen/arch/x86/include/asm/hvm/vlapic.h
> @@ -10,6 +10,7 @@
>  #define __ASM_X86_HVM_VLAPIC_H__
> 
>  #include <xen/tasklet.h>
> +#include <xen/unaligned.h>
>  #include <asm/hvm/vpt.h>
> 
>  #define vcpu_vlapic(x)   (&(x)->arch.hvm.vlapic)
> @@ -85,13 +86,13 @@ struct vlapic {
>  static inline uint32_t vlapic_get_reg(const struct vlapic *vlapic,
>                                        uint32_t reg)
>  {
> -    return *((uint32_t *)(&vlapic->regs->data[reg]));
> +    return get_unaligned_t(uint32_t, &vlapic->regs->data[reg]);

This, aiui (or should I say "I hope"), also addresses another violation
(casting away of const). Such will want mentioning in the description,
imo.

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1249,7 +1249,7 @@ void asmlinkage __init noreturn __start_xen(void)
>                 (caps & 2) ? " V2" : "",
>                 !(caps & 3) ? " none" : "");
>          printk("EDID transfer time: %d seconds\n", caps >> 8);
> -        if ( *(u32 *)bootsym(boot_edid_info) == 0x13131313 )
> +        if ( get_unaligned_t(u32, bootsym(boot_edid_info)) == 0x13131313 )

When touching such, please can you also convert to uint<N>_t?

Jan

