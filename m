Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E672813681
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 17:41:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654706.1021936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDolo-0005Cm-An; Thu, 14 Dec 2023 16:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654706.1021936; Thu, 14 Dec 2023 16:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDolo-00059a-7Y; Thu, 14 Dec 2023 16:41:08 +0000
Received: by outflank-mailman (input) for mailman id 654706;
 Thu, 14 Dec 2023 16:41:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDoln-0004qM-NE
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 16:41:07 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93764c8b-9a9f-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 17:41:06 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-54cde11d0f4so11512505a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 08:41:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 tp25-20020a170907c49900b00a1f7c502736sm8344807ejc.164.2023.12.14.08.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 08:41:04 -0800 (PST)
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
X-Inumbo-ID: 93764c8b-9a9f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702572065; x=1703176865; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WZymVK33WgTVZ4huU390OLbZTDqEpS01bezEYBsmnGQ=;
        b=BP8pUDSmqcaRUV1DuQSihblQU0XO6MnwuhlWezvg3LJMOPyCjmWhIowl20skzvpdm3
         tQKZq9mz5v9yCZZ8Fp1oiylVP5I3PdOtF7dkjeOSnR0hUtu4WpvKSn4MSycg0w93qEWG
         lNsg+IYAbeRZhCkcgPg9uC5qILjYfjHiEDcyQSoUUH1uYHu15PSlaxdpjNFLi1SFEbWV
         ePTydmV6jypdoVyGUh46ngGDKSmc3pR26kvtBwOd4/k1v5xmRveZfYaTJVqmVwYTeYex
         CW/+wocSyaQy1Ys8u4RjvdwrAhBRv8ZXy23bfse/aBgVt1L2BRmUflMkaHxiQ5n6BQaK
         KgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702572065; x=1703176865;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZymVK33WgTVZ4huU390OLbZTDqEpS01bezEYBsmnGQ=;
        b=ZJvKzqyb6UUm2rhbocLCRK/eLYY9ye16TR6TapsEvbxbmOwysg8iNDi4qh++q38A/7
         GD/GoTepYGQvLIrk+D7/jyEGQwdsY8v+vWo9p/NTrP18ge2lTEKXEpPa4k3LohFuYjBZ
         riB2iNQNy9L8AuObXZvJ9CnwWHCtW9Fcr6ICLL/T9oA4xM1dYgw60W42ipEIcomGCpHb
         oVK0s8stiJfRwiM4hURhigFAVVQMryaZmcCLWSR3fA+k5B1yAUi8ZzQJI/zEyaDAPwzD
         ujxjTO7lIx9D9dKs67U+RPBfPvl5xPONUJ6jTIDSTrPag/s+pTIpbV4TxYLstI/cRhka
         xq9g==
X-Gm-Message-State: AOJu0Yyt6pItxcaPsaA8CXYkd4bzzy4qrS8yqieOBYSq79W4TTXBuxFE
	WZOS71o3w+22yVgAO1/zJqlvFwUsIRMkhdujmrqS
X-Google-Smtp-Source: AGHT+IFWJGVtecjVtZQzWPHsibwEYPDmor3cI9s5xyrUZynWoYtN5z5kpl9yW88HzAv98baQTg05qw==
X-Received: by 2002:a17:907:31c3:b0:a19:a1ba:da2d with SMTP id xf3-20020a17090731c300b00a19a1bada2dmr6405591ejb.84.1702572065590;
        Thu, 14 Dec 2023 08:41:05 -0800 (PST)
Message-ID: <0aad77af-e760-4ea9-b2e7-b308bbdbfa44@suse.com>
Date: Thu, 14 Dec 2023 17:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] xen/x86: address violations of MISRA C:2012 Rule 11.8
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
 <68e28c7631f1233df1527674cfc27cf3f44797a7.1702555387.git.maria.celeste.cesario@bugseng.com>
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
In-Reply-To: <68e28c7631f1233df1527674cfc27cf3f44797a7.1702555387.git.maria.celeste.cesario@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.12.2023 13:07, Simone Ballarin wrote:
> --- a/xen/arch/x86/boot/reloc.c
> +++ b/xen/arch/x86/boot/reloc.c
> @@ -300,8 +300,8 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
>                  const struct vesa_mode_info *mi;
>  
>                  video = _p(video_out);
> -                ci = (void *)get_mb2_data(tag, vbe, vbe_control_info);
> -                mi = (void *)get_mb2_data(tag, vbe, vbe_mode_info);
> +                ci = (const void *)get_mb2_data(tag, vbe, vbe_control_info);
> +                mi = (const void *)get_mb2_data(tag, vbe, vbe_mode_info);

This wasn't and isn't very nice, but I also can't think of a way to
improve it, so
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

