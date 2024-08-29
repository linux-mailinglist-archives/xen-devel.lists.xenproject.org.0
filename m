Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FF29647A8
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 16:10:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785917.1195454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjfqt-0008Q2-KI; Thu, 29 Aug 2024 14:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785917.1195454; Thu, 29 Aug 2024 14:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjfqt-0008OE-HR; Thu, 29 Aug 2024 14:10:19 +0000
Received: by outflank-mailman (input) for mailman id 785917;
 Thu, 29 Aug 2024 14:10:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjfqr-0008O6-NU
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 14:10:17 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a072015-6610-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 16:10:15 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8679f534c3so77492566b.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 07:10:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891968e9sm83045666b.120.2024.08.29.07.10.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 07:10:14 -0700 (PDT)
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
X-Inumbo-ID: 6a072015-6610-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724940615; x=1725545415; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xChegkYL3ZJ3hmg0fZfaQeXYfxu5WzVZDZ2+vkj50kU=;
        b=eUKzs7fMLMEfZZZjkkQyXLz113nJIBnC0M+1ScfzBrKIdGutXXbjBLrYAO8nM1uKHO
         lNoSpWbh61xbcutidXwFZsSwnEyVjvOz9+8SQrtlyUAcRIB6uU5zxtSwQN0YFSBMGBAA
         bC60304mK92a1y/HT0QpI0+0Uv2KMIJyPuyfUTIFXIptHcJXmR+ShrprTtEb0yeZqoKO
         aVhNgljlEdOEInfXSdtGYtO6DHEdGEBG4OYEEOMg6opl6UnnyO89tQflHd6QFERFKrVj
         T6B/wlMCnHFv+2mlamEY4ylmwNB0ecqyi36AbM+dBsd9Xo3vbzQ0BUyFcXxm1n/Lr2GW
         yAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724940615; x=1725545415;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xChegkYL3ZJ3hmg0fZfaQeXYfxu5WzVZDZ2+vkj50kU=;
        b=j0BM0Hqix7I/csR/3cLeBxkn0bIpyzibUmALc07FmRg2eI/pwdN4arCU91+uerfNJb
         X/ygyCJSEG2SgBnv+upQ5yESph6bP1wjL9N2ZH9rwHBdSrOS9xfQANXLHLmfJRDdyo0t
         NCT0cQ1sHB+7Fx42Q0hI3iBYhKMrTptOoxCPq56kTdNwlQY6GqxF7iSbtRChKmpGrafe
         LE3kE+n7nUE+FNf2TflL/MC6eH5axTyqxzd+Zw6YEcBw2OkiSMOIWoswlqreY5HydSEA
         ApONdMhXIsOH14IoCLNTVq532nptd6TYKbFoLg5fCSIiJq/Yd8P5bpYABz0TwNIeI5p9
         XakQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMnG/+ZOSqbh7Fkr1M+tln1+l7xw2JkJLnXXurCvItI2yAxFkq2YcS9RU5f+9Hb3vaERDTWfjdCdM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpJtr2gwr5HJpJssVrp4OSYn0c9+sXGCa6vNcGK9aKUdCNQXFy
	KiBYBPiPXteEFyODGhGE2wREpuZOj3zNCC564DsO1LBspe6BPovrcGIucf6HBg==
X-Google-Smtp-Source: AGHT+IHFLDd0NcJ9MrqY+G+kYbalA83Mlp/cdd+cMqkVXXw7P90ybkVpx/rPfKdTIWuFF4NoieR3ww==
X-Received: by 2002:a17:907:980f:b0:a7a:929f:c0cf with SMTP id a640c23a62f3a-a897f83ad77mr250599966b.21.1724940615074;
        Thu, 29 Aug 2024 07:10:15 -0700 (PDT)
Message-ID: <3a397df2-7a29-4e30-bb8c-4ec8b54d949c@suse.com>
Date: Thu, 29 Aug 2024 16:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] xen/bitops: Introduce generic_hweightl() and
 hweightl()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
 <20240828220351.2686408-8-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240828220351.2686408-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2024 00:03, Andrew Cooper wrote:
> There are 6 remaining callers in Xen:
> 
>   * The two hweight32() calls, _domain_struct_bits() and efi_find_gop_mode(),
>     are __init only.
>   * The two hweight_long() calls are both in bitmap_weight().
>   * The two hweight64() calls are hv_vpset_nr_banks() and x86_emulate().
> 
> Only bitmap_weight() and possibly hv_vpset_nr_banks() can be considered fast
> paths, and they're all of GPR-width form.
> 
> Furthermore, the differences between a generic int and generic long form is
> only an ADD and SHIFT, and only in !CONFIG_HAS_FAST_MULTIPLY builds.
> 
> Therefore, it is definitely not worth having both generic implemenations.
> 
> Implement generic_hweightl() based on the current generic_hweight64(),
> adjusted to be compatible with ARM32, along with standard SELF_TESTS.
> 
> Implement hweightl() with usual constant-folding and arch opt-in support.  PPC
> is the only architecture that devates from generic, and it simply uses the
> builtin.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



