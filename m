Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EE49C09CC
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 16:14:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831973.1247344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94DL-0002tp-Og; Thu, 07 Nov 2024 15:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831973.1247344; Thu, 07 Nov 2024 15:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t94DL-0002rA-LF; Thu, 07 Nov 2024 15:14:27 +0000
Received: by outflank-mailman (input) for mailman id 831973;
 Thu, 07 Nov 2024 15:14:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t94DK-0002r4-2y
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 15:14:26 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7936326-9d1a-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 16:14:22 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43155afca99so12828275e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 07:14:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b05e5bddsm28038725e9.38.2024.11.07.07.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 07:14:21 -0800 (PST)
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
X-Inumbo-ID: f7936326-9d1a-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzUiLCJoZWxvIjoibWFpbC13bTEteDMzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY3OTM2MzI2LTlkMWEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTkyNDYyLjI1MTQ5Miwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730992461; x=1731597261; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c5h7gu01U4ciFqAZdnOd9/Q6V7zCCLDtQan6smJx2Ps=;
        b=EPnLmLoVl/FhIVsFKojph+ezv4NgpYWXdwRcPvVyTEGYsRS/DZRbjPHayKxYwGrADm
         LWtnhXKqGs+xiJcqnqhhChWSz5uqR49WElVacqEI9hUTZ3Cin+OWeaAX+3BLT3MH6Uri
         bAut32ehJdHjraAl5UaukAcLMV5q5/vrEXaWO30VE/ZLAiRsRLjl3lFY1pYBxh1yHuDB
         lC+EOcbaFwAyYB81Cw+AK0kpbSwuQplwOWfklZlrHpBrHxMbrSj0G1GJgzT1amGn/bkA
         fqAMo9uy8ze4GUAyT74d5m+XcR3h56dtyg14Gsbr4CMFl+XKRXXcJKOpXFuVK++deSk1
         cVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730992461; x=1731597261;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5h7gu01U4ciFqAZdnOd9/Q6V7zCCLDtQan6smJx2Ps=;
        b=QscP9dtpESygU75kRMVWavZk+aXAveIX91iPz28zp9VxH5T5CNeLwC7LYrEqCRWK7g
         geotr2ORrM2pzhvO+r2lC2i4nluVd+uH4Nv5Oej2LANuGrrs+DapBJM5K/uJGLrPTEHt
         EqGaoeaDRR++Mqz45i2Is2LH3mBGDM45Wpdhe3J2CAGBK5k5K67O0MuYQIsg+jmnEi3b
         eiaCsM9JcKXr1svbhNp8PQ1txr+1JPcfDFYod7TgsMzasvQVlyE/kPZWowtXw8H6VpVY
         VKwaTCqS99DiYnkUCP71qqBVZ5bcHxf4NmDCVh6KDxiyr2IvWeuJGqh+Q/SqmXzJaBtn
         YPjw==
X-Forwarded-Encrypted: i=1; AJvYcCXDexHtM8xb75BdvTngrsOolufTiAta+sDz5Emyt1xrtVVBbxx7dspSFvTtqFWMXWLwTmNpcT3N4HY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIJwkbviUY00ob9K63Z0BKmFRk8Mm4P/mgORpHH88YAZkWGJt/
	cHADwPngRqvVvYWlgthfKrWja/kvgncIyYzP6p4Ij/wDphcoEPbBVqYCjpVp6w==
X-Google-Smtp-Source: AGHT+IGruvmNgTCICTjRuqz68/jR5OG+DgCulzYM6z7z86vuCUSpF1nJySr9UsFrrY3VxQ2W6D5aGg==
X-Received: by 2002:a5d:64a9:0:b0:374:c7cd:8818 with SMTP id ffacd0b85a97d-381f0ae8885mr294595f8f.22.1730992461520;
        Thu, 07 Nov 2024 07:14:21 -0800 (PST)
Message-ID: <0cd98d20-9377-479a-8f24-ebfdbfceda8f@suse.com>
Date: Thu, 7 Nov 2024 16:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: prevent addition of .note.gnu.property if
 livepatch is enabled
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241107145952.73403-1-roger.pau@citrix.com>
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
In-Reply-To: <20241107145952.73403-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.11.2024 15:59, Roger Pau Monne wrote:
> GNU assembly that supports such feature will unconditionally add a
> .note.gnu.property section to object files.  The content of that section can
> change depending on the generated instructions.  The current logic in
> livepatch-build-tools doesn't know how to deal with such section changing
> as a result of applying a patch and rebuilding.
> 
> Since .note.gnu.property is not consumed by the Xen build, suppress its
> addition when livepatch support is enabled.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Just one thing though:

> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -26,6 +26,12 @@ $(call as-option-add,CFLAGS,CC,"invpcid (%rax)$(comma)%rax",-DHAVE_AS_INVPCID)
>  $(call as-option-add,CFLAGS,CC,"movdiri %rax$(comma)(%rax)",-DHAVE_AS_MOVDIR)
>  $(call as-option-add,CFLAGS,CC,"enqcmd (%rax)$(comma)%rax",-DHAVE_AS_ENQCMD)
>  
> +# Disable the addition of a .note.gnu.property section to object files when
> +# livepatch support is enabled.  The contents of that section can change
> +# depending on the instructions used, and livepatch-build-tools doesn't know
> +# how to deal with such changes.
> +$(call cc-option-add,CFLAGS-$(CONFIG_LIVEPATCH),CC,-Wa$$(comma)-mx86-used-note=no)
> +
>  # Check to see whether the assmbler supports the .nop directive.
>  $(call as-option-add,CFLAGS,CC,\
>      ".L1: .L2: .nops (.L2 - .L1)$(comma)9",-DHAVE_AS_NOPS_DIRECTIVE)

I don't really like this being squashed between two as-option-add invocations.
Can this be moved down, e.g. before or after the XEN_IBT chunk? Happy to move
while committing ...

Jan

