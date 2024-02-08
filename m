Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E9C84E48F
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 16:59:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678309.1055432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY6o5-00071Y-Hf; Thu, 08 Feb 2024 15:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678309.1055432; Thu, 08 Feb 2024 15:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY6o5-0006zc-F5; Thu, 08 Feb 2024 15:59:21 +0000
Received: by outflank-mailman (input) for mailman id 678309;
 Thu, 08 Feb 2024 15:59:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rY6o3-0006zU-MT
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 15:59:19 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 041bd668-c69b-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 16:59:18 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-51168addef1so2897156e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 07:59:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 jl26-20020a05600c6a9a00b0040fff3382casm1965797wmb.46.2024.02.08.07.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 07:59:17 -0800 (PST)
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
X-Inumbo-ID: 041bd668-c69b-11ee-8a4a-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707407958; x=1708012758; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=opkDLlYlwAcgajlR7y6ntiRvdsqEsQAXt5P7B8Dgv+g=;
        b=c+3n51K/JUk79gdtph/xFjCCtBD19yk8lw4IH5sF83REetMd727xI7bKeySEj7/RXI
         7RJMJTaOQsieXWDi/5yLQTxvhl0EJxIxSoSbX58QkcFlvdAMs28Wgtob+FUrDGNsX7dx
         QbsipxS3fcfYgSCK3i9XZPwdPYU/Mn5pCq89DVvTxzkDajbJ05NxCO0X+QC/1r/aMHpu
         f1xXyTzoN1a0GjXuYD7HPn4k1MtLfNd/IR1DQL14uXFlWGVdBnKXh+3KB9Yka0SVAGMx
         3R+tZrsNqsx9n16opH0uNkdkGwT3yFJVXVGknlU7vSYTfQgb6RDp5+gYED+Vg7Z6nycg
         BaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707407958; x=1708012758;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=opkDLlYlwAcgajlR7y6ntiRvdsqEsQAXt5P7B8Dgv+g=;
        b=v9TbtIdZ/C0vUo4WztQiKHOFRHMdGpjuDmeRhlrB4FOIToLuT5MPrJZTwUxVsk30sm
         LvimEp2dqcktPZyGMQKoA6GIcElSCXv3hgbc6suMCWIaTjA/jWtIDvMAI9mahNIyCKty
         C5ZsUHuwL6GIq/iIkEO6uItPfOHufBt5iBRkxc6Ik/SoUCjIhMt5QtSn4gqsfkelHpM8
         EC6zqn7EEapebdyncPcAFZA3DzcRsHjhqwEfcOfMcw5q0iOuSkoVWvn79CvqYlQqR2o9
         NlNvumBIetK5U/rdc7hvdU3ue+qFfcpuU7naqwYLVeHuctNrowJPPWGUiNd6DKJtRQ7S
         p9OA==
X-Gm-Message-State: AOJu0Yzpw84zRHeHpFxLR0qVqpQbm1+D5NAsOYRQIUajQzFmAx3f+kY3
	40/wWBg52qu9iUSGTgk58rz/0s8m11UVXqNq3InDdl+TSH1k3KAR5VtpU72xE4rCF1Ip+ajjaQ0
	=
X-Google-Smtp-Source: AGHT+IFDCeuGS01OPrOQ2jug1IHE7nVncAtND3DA5AgLA/umbntR63ri6VA+u11tzQJih9c+39Rz+A==
X-Received: by 2002:a05:6512:23a3:b0:511:5322:345b with SMTP id c35-20020a05651223a300b005115322345bmr7321843lfv.7.1707407958189;
        Thu, 08 Feb 2024 07:59:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVqAk52yeXQyinP+0NOLH6e/ts7RO36WE2W/hIN/7MljLN1qdkDaP0FSrYnZnRv0zuYhJtXBLd1BOH5Ww1NjB5uAP5ZDBzdjxNAt5o32Wa+cUm6jGDGvGtoDCTJyFQ3PB1oRqCi6D7Uein9QU1oiL6NFyelKaI=
Message-ID: <c0a2b6fe-e64f-433a-accf-124a7cee3f91@suse.com>
Date: Thu, 8 Feb 2024 16:59:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HVM: tidy state on hvmemul_map_linear_addr()'s error
 path
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Manuel Andreas <manuel.andreas@tum.de>, Paul Durrant <paul@xen.org>
References: <c4c1d2b3-591e-403f-879b-bbb897f7ff25@suse.com>
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
In-Reply-To: <c4c1d2b3-591e-403f-879b-bbb897f7ff25@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2024 13:06, Jan Beulich wrote:
> While in the vast majority of cases failure of the function will not
> be followed by re-invocation with the same emulation context, a few
> very specific insns - involving multiple independent writes, e.g. ENTER
> and PUSHA - exist where this can happen. Since failure of the function
> only signals to the caller that it ought to try an MMIO write instead,
> such failure also cannot be assumed to result in wholesale failure of
> emulation of the current insn. Instead we have to maintain internal
> state such that another invocation of the function with the same
> emulation context remains possible. To achieve that we need to reset MFN
> slots after putting page references on the error path.
> 
> Note that all of this affects debugging code only, in causing an
> assertion to trigger (higher up in the function). There's otherwise no
> misbehavior - such a "leftover" slot would simply be overwritten by new
> contents in a release build.
> 
> Also extend the related unmap() assertion, to further check for MFN 0.
> 
> Fixes: 8cbd4fb0b7ea ("x86/hvm: implement hvmemul_write() using real mappings")
> Reported.by: Manuel Andreas <manuel.andreas@tum.de>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Just noticed that I forgot to Cc Paul.

Jan

> ---
> While probably I could be convinced to omit the #ifndef, I'm really
> considering to extend the one in hvmemul_unmap_linear_addr(), to
> eliminate the zapping from release builds: Leaving MFN 0 in place is not
> much better than leaving a (presently) guest-owned one there. And we
> can't really put/leave INVALID_MFN there, as that would conflict with
> other debug checking.
> 
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -696,7 +696,12 @@ static void *hvmemul_map_linear_addr(
>   out:
>      /* Drop all held references. */
>      while ( mfn-- > hvmemul_ctxt->mfn )
> +    {
>          put_page(mfn_to_page(*mfn));
> +#ifndef NDEBUG /* Clean slot for a subsequent map()'s error checking. */
> +        *mfn = _mfn(0);
> +#endif
> +    }
>  
>      return err;
>  }
> @@ -718,7 +723,7 @@ static void hvmemul_unmap_linear_addr(
>  
>      for ( i = 0; i < nr_frames; i++ )
>      {
> -        ASSERT(mfn_valid(*mfn));
> +        ASSERT(mfn_x(*mfn) && mfn_valid(*mfn));
>          paging_mark_dirty(currd, *mfn);
>          put_page(mfn_to_page(*mfn));
>  


