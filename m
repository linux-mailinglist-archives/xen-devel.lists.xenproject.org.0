Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1572C9752B8
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 14:42:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796568.1206235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMg6-0004vi-6h; Wed, 11 Sep 2024 12:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796568.1206235; Wed, 11 Sep 2024 12:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMg6-0004tN-2P; Wed, 11 Sep 2024 12:42:34 +0000
Received: by outflank-mailman (input) for mailman id 796568;
 Wed, 11 Sep 2024 12:42:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soMg5-0004sX-6v
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 12:42:33 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f94646f-703b-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 14:42:31 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53659867cbdso8848441e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 05:42:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c61263sm610913966b.128.2024.09.11.05.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 05:42:30 -0700 (PDT)
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
X-Inumbo-ID: 4f94646f-703b-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726058551; x=1726663351; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V9dEOpK4ovjIi18sxmQt40qb0PptLucMHyyeM+vNIsQ=;
        b=Zs4owEbr0hO//xmccEE8nhHtWIir8/0F5519CLOfWDp+5nb8dvpWqOP6xfhoVB5i3R
         fs+70oSNyyXY5xh/aU4n0RvZqyeGNS1cu5RiXK2T3KTY0rZ3MR2kGZ1ED6ctkoQHgdVx
         MdPHeSLL2kEAsZj3KFXrm0OfRNl+hqp7C0UsrDv4gnDAnN75O6/rCEd92auGa3wajoVF
         ECEn6szGizz8JenowaCR4HVyqRtSCqWMdrVJWZsZa7qusKBuQD2NQs4ZQOI+CvE7LIdR
         ANgbh9LEWw+Hr+Aw/4GVG/X3vvnxFNAl1zSm/26tYtzDQfxUqqCFaf3ZtFSx7eRAA1rt
         y0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726058551; x=1726663351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9dEOpK4ovjIi18sxmQt40qb0PptLucMHyyeM+vNIsQ=;
        b=vm89CcMwsNwTwDWohKIb4JiXcpVVDCn9JJno1jDuRZ/i3KqZFbyyHzHNCImJsfOGkQ
         cmUuh8+Oh3no5vkETXj1ZGU0u2cCAql8r/09mISxRN0dhqpzzYOZViAqNY3blpBJWKD3
         rp+wiuVK9zmYHbS0xwggnDLk48QBXZa4DlhrDAh2t/Pq9oIfDHnoxQsXTcIxhDb4I9Y0
         b27Rn74P+SIj8vxKwFgV66ECoZGvIAQPkuZJlIpp7gdmzPX7hvMZRBlnxPEArrQuV51U
         Zrj+7jmvGqnj1eA4TbJAdW0FDNObtDYJxY0iLy39TT4VObSDvoYL8Mxnqqge/fFnQE+a
         lHkw==
X-Forwarded-Encrypted: i=1; AJvYcCWpIh1qjio/nod1Yu4FsdakiWtpZM9KuwUhQs25k28viKIEG3Q3Ui43+PZfE2wwC+fP3v76f4RVYQM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyz2A8lxLXkNFBkRS3K9Vbmu65JHR7rNok0k4yuA6uA0RixdUzB
	rZrih2d+VxKQsnfGpf6GGZGO8rDDRbiS7Dd/HX6New7f6lSLY43mcCxFGVxhxw==
X-Google-Smtp-Source: AGHT+IGhrhTuRYJox5KErdQV5I1Md3ar4Qooe2FgF5MB/ota01MmtTSJRohdgSUIoO2EQ2zOWNNUow==
X-Received: by 2002:a05:6512:3b10:b0:533:c9d:a01f with SMTP id 2adb3069b0e04-536587a6704mr14371868e87.4.1726058550488;
        Wed, 11 Sep 2024 05:42:30 -0700 (PDT)
Message-ID: <1e6e2bb8-2a27-4cac-a888-7d785bc4c463@suse.com>
Date: Wed, 11 Sep 2024 14:42:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 09/12] x86/emul: address violations of MISRA C Rule
 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1725958416.git.federico.serafini@bugseng.com>
 <0fa68b9aee5a7a3f1b696bfc6b18ecc826663212.1725958417.git.federico.serafini@bugseng.com>
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
In-Reply-To: <0fa68b9aee5a7a3f1b696bfc6b18ecc826663212.1725958417.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 12:09, Federico Serafini wrote:
> --- a/xen/arch/x86/x86_emulate/fpu.c
> +++ b/xen/arch/x86/x86_emulate/fpu.c
> @@ -218,6 +218,7 @@ int x86emul_fpu(struct x86_emulate_state *s,
>               */
>              if ( dst->type == OP_MEM && !s->fpu_ctrl && !fpu_check_write() )
>                  dst->type = OP_NONE;
> +            break;
>          }
>          break;
>  
> @@ -296,6 +297,7 @@ int x86emul_fpu(struct x86_emulate_state *s,
>              default:
>                  generate_exception(X86_EXC_UD);
>              }
> +            break;
>          }
>          break;
>  
> @@ -386,6 +388,7 @@ int x86emul_fpu(struct x86_emulate_state *s,
>               */
>              if ( dst->type == OP_MEM && !s->fpu_ctrl && !fpu_check_write() )
>                  dst->type = OP_NONE;
> +            break;
>          }
>          break;
>  
> @@ -457,6 +460,7 @@ int x86emul_fpu(struct x86_emulate_state *s,
>              case 7: /* fistp m64i */
>                  goto fpu_memdst64;
>              }
> +            break;

Aren't you swapping one violation for another here? Unlike in the earlier
three cases, this new break is unreachable, because of the nature of the
preceding switch() statement (cases being exhaustive and every case ending
in "goto"; this is something even a static analyzer can [in principle]
spot).

Jan

