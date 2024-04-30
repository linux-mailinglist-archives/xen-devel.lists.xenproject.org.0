Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFE98B74BA
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 13:43:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714765.1116090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1lt3-0002nU-Ap; Tue, 30 Apr 2024 11:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714765.1116090; Tue, 30 Apr 2024 11:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1lt3-0002kK-82; Tue, 30 Apr 2024 11:43:05 +0000
Received: by outflank-mailman (input) for mailman id 714765;
 Tue, 30 Apr 2024 11:43:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q3to=MD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1lt0-0002kE-Uf
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 11:43:02 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cca3be27-06e6-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 13:43:02 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41a1d2a7b81so37697675e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 04:43:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c4f8300b0041be58cdf83sm12008766wmq.4.2024.04.30.04.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 04:43:01 -0700 (PDT)
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
X-Inumbo-ID: cca3be27-06e6-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714477381; x=1715082181; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hlfRLkXu/zsik/9FKrNtbckUsn14hT6U140XTAc6xWE=;
        b=Qo3VKFM4KiIwC7sUT7Ue4ZXJ15oWXlt6UJ3GdxByYjsWsi/Bctdia8DQHrYDRyKk98
         nV6Bu97b4ro/QQbb3nf5oLYzJ24XnSlglPQH1DLSSCd9Qhjj/DgNdt9SXrKCfn1GGr4G
         OLjGO+IMicsJ5BTLWr84N9j5CkbN1Q/r+g15KN8TtXmJAFTlPITslgIISC9mJG0JDNON
         a4FP6uF8n+QTfHLL4Nnh/npg+Okn6qWP2CC+DgEQbHiJ3X+lZ9tCtfgeNyJenGLjeExt
         IJLblzcQsRhL6keI4BPffA1SWDDbC+cPfC233BIOa1qEe+ddf4rDyR7hAg+vRh9AmtOh
         k2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714477381; x=1715082181;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hlfRLkXu/zsik/9FKrNtbckUsn14hT6U140XTAc6xWE=;
        b=sg0bmXAl64fXCNtuye8uRwJImmLybCqf8WzXrrxbor5gKjwJaWaF18SE33kA2LcAvM
         JPlOcHBIRqAJSOxPQi6yvyH5CWXEtKmHjrr2XcOyMrBzbdeGSINUYLDrxp+A0dTjMCw3
         i2XLddi7VgF2Ufs9VwbSNmQRNIyWI+496ty3EjrnnfKWfaMvp2ULCmUh/UOAgO4fASIo
         izkt5Dum0Qlhxd1dRvABPzW48CZNDDBioBpO2xfgyile6Cy2QS4b6QeQf50asD9VT6QH
         BKuqvVH+9AH+XQBXZIXaWuqmiei0lRkV5ltX2zsiQ/B8xcC13HhkDGhMv6q6TvgWv4QH
         rMkw==
X-Forwarded-Encrypted: i=1; AJvYcCUIecztdFi2EYmbfPD/FPiW9sqYW7DnAAOeekVZtIj6jHTGY+gS6WJUHV3vSHiMbKnWgZUfid6MMOh4bTtzsPS/DEHbenTtKZD3xFWX6TQ=
X-Gm-Message-State: AOJu0Ywds8rM2joGinZRJG1fIn8cVgfo3RzfREF7nQNqbhKTbUlcGQ1E
	bsmgQg626NE0QQyAWD5c+ZloRHTfDxldbg3avmAa5tbr7NFmG4T9IMxroACWEw==
X-Google-Smtp-Source: AGHT+IE4XdFFNFONub6IPJ0Fh1kdVVcTKIV6OGhSp0pY71kl+blW4B4RRmuS3JgUNPTnqtN4/p/wjA==
X-Received: by 2002:a05:600c:5110:b0:418:c6a:1765 with SMTP id o16-20020a05600c511000b004180c6a1765mr2095186wms.16.1714477381292;
        Tue, 30 Apr 2024 04:43:01 -0700 (PDT)
Message-ID: <cd2352aa-e94b-43ef-b3fc-359cc1f43fb0@suse.com>
Date: Tue, 30 Apr 2024 13:43:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/kernel.h: Import __struct_group from Linux
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: consulting@bugseng.com, nicola.vetrini@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240430110922.15052-1-luca.fancellu@arm.com>
 <20240430110922.15052-2-luca.fancellu@arm.com>
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
In-Reply-To: <20240430110922.15052-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2024 13:09, Luca Fancellu wrote:
> --- a/xen/include/xen/kernel.h
> +++ b/xen/include/xen/kernel.h
> @@ -54,6 +54,27 @@
>          typeof_field(type, member) *__mptr = (ptr);             \
>          (type *)( (char *)__mptr - offsetof(type,member) );})
>  
> +/**
> + * __struct_group() - Create a mirrored named and anonyomous struct
> + *
> + * @TAG: The tag name for the named sub-struct (usually empty)
> + * @NAME: The identifier name of the mirrored sub-struct
> + * @ATTRS: Any struct attributes (usually empty)
> + * @MEMBERS: The member declarations for the mirrored structs
> + *
> + * Used to create an anonymous union of two structs with identical layout
> + * and size: one anonymous and one named. The former's members can be used
> + * normally without sub-struct naming, and the latter can be used to
> + * reason about the start, end, and size of the group of struct members.
> + * The named struct can also be explicitly tagged for layer reuse, as well
> + * as both having struct attributes appended.
> + */
> +#define __struct_group(TAG, NAME, ATTRS, MEMBERS...) \
> +    union { \
> +        struct { MEMBERS } ATTRS; \
> +        struct TAG { MEMBERS } ATTRS NAME; \
> +    } ATTRS

Besides my hesitance towards having this construct, can you explain why
ATTR needs using 3 times, i.e. also on the wrapping union?

Jan

