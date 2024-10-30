Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2EB9B60B9
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 12:00:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828068.1242878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66Qi-0005MC-Ij; Wed, 30 Oct 2024 11:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828068.1242878; Wed, 30 Oct 2024 11:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66Qi-0005JW-FR; Wed, 30 Oct 2024 11:00:00 +0000
Received: by outflank-mailman (input) for mailman id 828068;
 Wed, 30 Oct 2024 10:59:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t66Qh-0005FP-Fu
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 10:59:59 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18e305f2-96ae-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 11:59:57 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-37d495d217bso5791257f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 03:59:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b132fbsm15114317f8f.4.2024.10.30.03.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 03:59:55 -0700 (PDT)
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
X-Inumbo-ID: 18e305f2-96ae-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmQiLCJoZWxvIjoibWFpbC13cjEteDQyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE4ZTMwNWYyLTk2YWUtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjg1OTk3LjAwMTc4Miwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730285995; x=1730890795; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B2QoleF1EN3+NxuNwheEM2xs+vG9hzrY1cF3vkFeQZo=;
        b=fhi9RE6yr6KB/ZxPeTVlZlem0ChFLGBn+dsLuloD0l4SB1VvNFum+m4lCtBK/17S4j
         vMETi35YFne0Vyn5MtcZF15bVxbV7aDsfZ+sWm2h++4kFkC1cCUeSxhp3mj7TzPD03PI
         lbbM5aAOu32fIiqEHtQ8Wo+U/6EH53ohusJ0B7QZeOF4Z11pDuR3FEUYFzcAF4oMzq9/
         Woqz6cbf85MKYKYYD7Bi+4PA9Jo7WmA1QpfbhuvjGaJFsmBg1rxngkqQnBd+K2zqfi7q
         y439ABaW9xOiV0bpAygoZ3N3YZf+r2QDQ/i8eXAexrdlPWFot+2iFThdlUWHdD2d31L8
         8+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730285995; x=1730890795;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2QoleF1EN3+NxuNwheEM2xs+vG9hzrY1cF3vkFeQZo=;
        b=ntf5H+VoC2+9d7Q5KPoIgeOfWCo1RFKtXkFiMZaNsbu3BUUqbC4aS0g7biA2wcWzB1
         FF3iato8s5Tf1mImEngIuOkgjjG+GeRc455reSzkqsMn39+oOiFP4eYqLMKQWR22lVhb
         M64/9fgDrg8LQSmA/hOZVixX7GOS8x8/RHGYMXuU7BvgDM4zeclDYLRcLah0SYFPI1/o
         zrMuMxANllrXPCAoyuK99n1+za+7+9yuvgL+WBBMbuYsgFi2HMaizgCbD29eKBGYrFmW
         GnmBzuSvcvi0kTt3diEmtL67gR78jK/kLbCQOVqJkQOXiIq+Nc6E1Np+o7LoeQq9I7r8
         //zg==
X-Forwarded-Encrypted: i=1; AJvYcCWMaP91q6PCRmYx98DDqqid5RdtLD/vucZOK6LNiEYu2CAKC8HyvMMuV75f2yBHPoqKMpv/YxHj9g4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwbV6MtxgfV7NzCfW+60xJblksjdXla+5b/SDoBeZ6+gnqH/TD
	1Fi0LKr6ylC3OJC0PyIwfxcbDYhR0eRAFQ+NtQ8n0klRMwC5Ute2NBPCZc2hTg==
X-Google-Smtp-Source: AGHT+IGqZy4zDEv+PY+voOtTEuG5sHKH5SMP/GJbGSekZo11/UlbB35p1/xQ8klJjC+OG7Qb5sUmKQ==
X-Received: by 2002:adf:e34e:0:b0:37d:5042:c8de with SMTP id ffacd0b85a97d-38061172d7dmr12856372f8f.22.1730285995344;
        Wed, 30 Oct 2024 03:59:55 -0700 (PDT)
Message-ID: <1fa03cb0-ded1-4904-8830-f3feefecc404@suse.com>
Date: Wed, 30 Oct 2024 11:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/setup: Make setup.h header self contained
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241030104406.2173357-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241030104406.2173357-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.10.2024 11:44, Frediano Ziglio wrote:
> The header uses rangeset structure typedef which definition
> is not included.

And it doesn't need to be. For

int remove_xen_ranges(struct rangeset *r);

we don't need ...

> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -2,6 +2,7 @@
>  #define __X86_SETUP_H_
>  
>  #include <xen/multiboot.h>
> +#include <xen/rangeset.h>
>  #include <asm/numa.h>
>  
>  extern const char __2M_text_start[], __2M_text_end[];

... this, a mere

struct rangeset;

forward decl will suffice.

Jan


