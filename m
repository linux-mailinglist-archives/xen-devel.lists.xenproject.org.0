Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7528A92EA
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 08:18:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707931.1106370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxL61-0004wB-38; Thu, 18 Apr 2024 06:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707931.1106370; Thu, 18 Apr 2024 06:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxL60-0004ue-WB; Thu, 18 Apr 2024 06:18:08 +0000
Received: by outflank-mailman (input) for mailman id 707931;
 Thu, 18 Apr 2024 06:18:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxL5z-0004tn-E7
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 06:18:07 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ac0a7c6-fd4b-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 08:18:05 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3499f1bed15so882003f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 23:18:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n2-20020adfe342000000b00343eac2acc4sm934604wrj.111.2024.04.17.23.18.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 23:18:04 -0700 (PDT)
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
X-Inumbo-ID: 6ac0a7c6-fd4b-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713421085; x=1714025885; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FL9pHAb4eKyRqGy12g+C1hPuQcLPcelW2kVv1aOlZe8=;
        b=ISZ0+igu6hiDcRQyXkzuzgboBEmvvQf9jTWrIaeNZxjeWEMpukyMNJ18Oawm4Lbzdh
         OzWSS5V5s203B0S9QtO0n3ocNNoHp1QEM/Oh1l98sX9zAqiMEprcCgzN7rlWUOzLcGJq
         H9DPfJBgZCRYlPhRm0fm04wo3vWtpl7csYgq2h5rX2Sg1FnAsDYl9hX0r33ZJ20Ao4k9
         WhHqTSGlZqehOB8ULc5BgLhya+XUlrtslvN8tgYwWKkclDBIO3sABfxKrTeYTBN8Cu0H
         tZYePk9VsDiNol8+DscGt1iyPwMdwgvQJCoHyoEud3f6HBjuPeDghdNQjv1MV46L84Be
         RsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713421085; x=1714025885;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FL9pHAb4eKyRqGy12g+C1hPuQcLPcelW2kVv1aOlZe8=;
        b=hltF/xDeG491iYW3YZN/2rR4l/xOLdHQdNC6HVYSSHnkip747fcxWKJGf9jPI9cWrk
         gfV562Jw06KQ4ukM6gp9BcYaIhZkvFr+GlTpFXKFE+qMLIN1gJoKL8CekM30vD5wjEpG
         +dTiDCrgj6+5C8gAZAEG1adCH0VbwiN6pysxL0mCGbBJVBuCgUF3ef6dPr9EQjcGbm9F
         QLD/E0gTsvck5n1A8N9VRbW7GG+YhzvrK/MtT4NQ1ztI/eiU3Eh4NQBpB7mlt/ZGGUzw
         Diur9vCwJP3hrB6itIl/UNpCwM2YfuuM+JfK26j5N7pXR6LSQwH2r7x1CVTLddib5q31
         k6Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUAUCmyYFRwE4KWBjpVuxaa4+e5jcidANI/J5u/dA4lQT5gRs1NOw66MOZob50nWpcWd2IwGG4eQgu+P8d7/HQpxraKlDkzQTDhsPmEYFg=
X-Gm-Message-State: AOJu0YytlMRMqkTTx74DjSnj/V55el1c+fXSLfwT00jS96Ld4VuKteq1
	acI0UC2Wv/hHDUopqCaGkd/O7HhRm0iiIxvN2lKDEltNlgAQ0lbeFeijQTTfvA==
X-Google-Smtp-Source: AGHT+IElFv74fbJz4U3+L4mzncGtyE3vSuAZWzhedT5oCJl2swE4POAGGluUsMKKA1u9FsXaMGgezQ==
X-Received: by 2002:adf:ea82:0:b0:349:7f89:2200 with SMTP id s2-20020adfea82000000b003497f892200mr763451wrm.5.1713421084722;
        Wed, 17 Apr 2024 23:18:04 -0700 (PDT)
Message-ID: <242b106a-a106-4334-9bd3-3aa834f1d66b@suse.com>
Date: Thu, 18 Apr 2024 08:18:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] x86: Add usage() to print out usage message
Content-Language: en-US
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240416091546.11622-1-fouad.hilly@cloud.com>
 <20240416091546.11622-4-fouad.hilly@cloud.com>
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
In-Reply-To: <20240416091546.11622-4-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2024 11:15, Fouad Hilly wrote:
> Refactor xen-ucode tool by adding usage() to handle usage\help messages
> As we add more command options this will keep help\usage messages in common block
> 
> [v2]
> 1- Improved message description.
> 2- Fixed formatting and indentation.
> 3- Error message to print to stderr.

I can't spot any use of stderr in the change here.

> --- a/tools/misc/xen-ucode.c
> +++ b/tools/misc/xen-ucode.c
> @@ -17,6 +17,15 @@ static xc_interface *xch;
>  static const char intel_id[] = "GenuineIntel";
>  static const char   amd_id[] = "AuthenticAMD";
>  
> +static void usage(const char *name)
> +{
> +    printf("%s: Xen microcode updating tool\n"
> +           "Usage: %s [microcode file] [options]\n"
> +           "Options:\n"
> +           "show-cou-info   show CPU information and exit\n",
> +           name, name);
> +}
> +
>  static void show_curr_cpu(FILE *f)
>  {
>      int ret;

Without a caller this is going to cause a compiler warning (unused static
function) and, with -Werror, a build failure.

Jan

