Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B609D8509
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 13:06:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842445.1257973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFXqj-0002V8-LP; Mon, 25 Nov 2024 12:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842445.1257973; Mon, 25 Nov 2024 12:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFXqj-0002Sq-It; Mon, 25 Nov 2024 12:05:53 +0000
Received: by outflank-mailman (input) for mailman id 842445;
 Mon, 25 Nov 2024 12:05:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFXqi-0002Sh-6A
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 12:05:52 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9baf5d49-ab25-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 13:05:48 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3823f1ed492so2941118f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 04:05:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fbc44f7sm10473723f8f.82.2024.11.25.04.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 04:05:47 -0800 (PST)
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
X-Inumbo-ID: 9baf5d49-ab25-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzYiLCJoZWxvIjoibWFpbC13cjEteDQzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjliYWY1ZDQ5LWFiMjUtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTM2MzQ4Ljc4Nzc3Miwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732536348; x=1733141148; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bhTUQvWK+IbBPczmdne1syuVVX03IKsz/I++qDCzcdY=;
        b=M09v7tW0r3HVvRyOT2/Ez+hzZUl3d5bmLCiInqdr4u96zah0Al7WzgaR0Vqtf1GfMo
         3VC83C34AOWZdiGsTIMdPqyai3XR/lpRrEp4quSSAxyxzEv1/7u6gqwnqRmOjAXwpEpE
         9lipwMIN1gkXNBdLTaVje8GnWSSXqFxM+nZNL2eKwoZIIsZvB8SufpkkPqF5ieRadaft
         NaiW3Ln6ZdjZhnAgmEumtQdYU88tbNLKD92rw4CsqS3vMhpparg+TW2dVPKD2oQp8bUG
         Q6DRwX1sts0GZqNSXNxP0v+GwSg1xvBHglQ2NAua+cVYVZlqsmiqKtw2BnNR6+8v4BlD
         Uvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536348; x=1733141148;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhTUQvWK+IbBPczmdne1syuVVX03IKsz/I++qDCzcdY=;
        b=U6KFO8c0vk3/WnyDheEtUbPWfWkhoDfRHLp+LbclO2M8HuJzgPGRTSGZkLuNEyjvic
         QwllhlkJfG85a8pBUFypyJIqUEDfdVJe9GfAZutZW2sz+JLVLAFrwBZ3yOX9WMyQYqXR
         lTZFr88FqPnae2DKfcm0e2zlpjnBE7uy7e75xdJahtcKL8Ycm/vBcl86REzeg61dRAgU
         LVic4Q55z+nMmIir9xh1Rq0Q79ouhHxj5lkE6fmkCaMaynJSyFtvO4oFjYCWad8r93LM
         eLJYZA3OoEdJXNPFefiNFCTEkzRKAo4I30bCUBcF1Ew3PkyfcpW5fEps3KIamAeHCR4W
         n2FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyBYxKKhy0R5T6NCute/FFcgS0Wqonyy8Cld+whFsZCPW/5MpMmuveD9EC03eycNSiWLO+dE0kXFo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKc6UJMd9eQ8CsX7yrJc6Ta1OYFAajDewj3Szonh83Q3a1eXao
	/Y7oh7iydgI+Wn3sghYo+hiAHpi9w2QoUML8cV/DekMCgDfueDz2ryMPBKXkaw==
X-Gm-Gg: ASbGncsePKXztm8PtDCW1rN5nh/+6V0Cl7E65xAgvYxgIh15601c7QfEor//iZYC75T
	CPy1Swxkb9Q06GOtMCtjAx5qKvI5TV9rhtqGC7xRMB7K2IBBy6vvtBYfJdYGkG2bRnU3q9gpXYZ
	LAGkFwoENjgyV+R7l15LXLiIggJfRPLpCIgliDGNfHwIir88mou6a+vuRZTXF7tKGgJgQkM4hyX
	87DlZdslC5G0f+LpGMmhWgqTNIVsmT2Qj37CkfweaSbQdpcQuut3vmMsfPxOyEhVxAZ6TwDElxH
	yMHPl8jWczJnWzKZ+7TQmbzTwMUW7Zh2UGs=
X-Google-Smtp-Source: AGHT+IE/WY9xHTfVTMWqiS9iwg5D+2gbkz2+G1cCwSFwB1fl9iRAOFQ1LmIxjQTn3TD+hEogTFfBVA==
X-Received: by 2002:a5d:64ce:0:b0:37d:34e7:6d24 with SMTP id ffacd0b85a97d-38259d2b848mr13227256f8f.18.1732536348158;
        Mon, 25 Nov 2024 04:05:48 -0800 (PST)
Message-ID: <0a5a66d9-4fd4-4084-b7f9-0923d5a4c6d5@suse.com>
Date: Mon, 25 Nov 2024 13:05:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/25] xen: Replace sysctl/readconsole with
 autogenerated version
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
 <20241115115200.2824-13-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241115115200.2824-13-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.11.2024 12:51, Alejandro Vallejo wrote:
> Describe sysctl/readconsole as a TOML specification, remove old
> hand-coded version and replace it with autogenerated file.
> 
> While at it, transform the console driver to use uint8_t rather than
> char in order to mandate the type to be unsigned and ensure the ABI is
> not defined with regards to C-specific types.

Yet the derived C representation imo then should still be using char, not
uint8_t. In particular it would be a good sign if the Xen sources wouldn't
need to change, unlike happens here (altering types of a few internals of
the console machinery).

> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  stubdom/Makefile                              |  2 +-
>  tools/rust/Makefile                           | 19 ++++++++
>  .../xenbindgen/extra/sysctl/readconsole.toml  | 43 +++++++++++++++++++
>  xen/drivers/char/console.c                    | 12 +++---
>  xen/include/public/autogen/sysctl.h           | 35 +++++++++++++++

In the build tree, having an autogen subdir under public/ _may_ be okay
(personally I dislike even that). I didn't manage to spot adjustments to
how files are eventually installed, yet at that point there clearly
shouldn't be any autogen subdir(s) anymore. How the individual files come
into existence is, imo, nothing consumers of the interface ought to (need
to) care about.

> --- /dev/null
> +++ b/tools/rust/xenbindgen/extra/sysctl/readconsole.toml
> @@ -0,0 +1,43 @@
> +[[structs]]
> +name = "xen_sysctl_readconsole"
> +description = "Read console content from Xen buffer ring."
> +
> +[[structs.fields]]
> +name = "clear"
> +description = "IN: Non-zero -> clear after reading."
> +typ = { tag = "u8" }
> +
> +[[structs.fields]]
> +name = "incremental"
> +description = "IN: Non-zero -> start index specified by `index` field."
> +typ = { tag = "u8" }
> +
> +[[structs.fields]]
> +name = "_pad"
> +description = "Unused."
> +typ = { tag = "u16" }
> +
> +[[structs.fields]]
> +name = "index"
> +description = """
> +IN:  Start index for consuming from ring buffer (if @incremental);
> +OUT: End index after consuming from ring buffer."""
> +typ = { tag = "u32" }
> +
> +[[structs.fields]]
> +name = "buffer"
> +description = """
> +IN: Virtual address to write console data.
> +
> +NOTE: The pointer itself is IN, but the contents of the buffer are OUT."""
> +typ = { tag = "ptr", args = { tag = "u8" } }
> +
> +[[structs.fields]]
> +name = "count"
> +description = "IN: Size of buffer; OUT: Bytes written to buffer."
> +typ = { tag = "u32" }
> +
> +[[structs.fields]]
> +name = "rsvd0_a"
> +description = "Tail padding reserved to zero."
> +typ = { tag = "u32" }

Up to here I wasn't able to spot any documentation on what it to be written
in which way. I already struggle with the double square brackets. The TOML
doc I found when searching the web doesn't have such. Taking just the example
above also doesn't allow me to conclude how e.g. nested structures would be
specified. Really, when talk was of some form of IDL, I expected to see
something IDLish (im particular closer to typical programming languages we
use). Whereas TOML, aiui, is more an easy language for config files of all
sorts.

What I have in mind wouldn't allow for descriptions, yet I'm not sure that's
relevant. The description ought to, first of all, live in the primary source
(i.e. the IDL itself) anyway. Commentary there might be possible to extract
into proper (machine generated/derived) documentation.

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -42,6 +42,8 @@
>  #include <asm/vpl011.h>
>  #endif
>  
> +#include <public/xen.h>

Why would this be needed all of the sudden?

> --- /dev/null
> +++ b/xen/include/public/autogen/sysctl.h
> @@ -0,0 +1,35 @@
> +/*
> + * sysctl
> + *
> + * AUTOGENERATED. DO NOT MODIFY
> + */
> +#ifndef __XEN_AUTOGEN_SYSCTL_H
> +#define __XEN_AUTOGEN_SYSCTL_H
> +
> +/* Read console content from Xen buffer ring. */
> +struct xen_sysctl_readconsole {
> +    /* IN: Non-zero -> clear after reading. */
> +    uint8_t clear;
> +    /* IN: Non-zero -> start index specified by `index` field. */
> +    uint8_t incremental;
> +    /* Unused. */
> +    uint16_t _pad;
> +    /*
> +     * IN:  Start index for consuming from ring buffer (if @incremental);
> +     * OUT: End index after consuming from ring buffer.
> +     */
> +    uint32_t index;
> +    /*
> +     * IN: Virtual address to write console data.
> +     *
> +     * NOTE: The pointer itself is IN, but the contents of the buffer are OUT.
> +     */
> +    XEN_GUEST_HANDLE_64(uint8) buffer;
> +    /* IN: Size of buffer; OUT: Bytes written to buffer. */
> +    uint32_t count;
> +    /* Tail padding reserved to zero. */
> +    uint32_t rsvd0_a;
> +};
> +
> +#endif /* __XEN_AUTOGEN_SYSCTL_H */
> +

If this file is auto-generated, why would it need committing? And yes, there
is the connected question: Will everyone then need to have a Rust compiler
available?

Nit: For anything that is committed, it would be nice if those files were as
tidy as possible style-wise. Most of the above looks entirely okay, just
that there is an unnecessary trailing blank line.

Jan

