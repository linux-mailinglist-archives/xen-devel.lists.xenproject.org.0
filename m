Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCFC971C42
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 16:17:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794569.1203568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfCE-0002nU-66; Mon, 09 Sep 2024 14:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794569.1203568; Mon, 09 Sep 2024 14:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfCE-0002lN-1h; Mon, 09 Sep 2024 14:16:50 +0000
Received: by outflank-mailman (input) for mailman id 794569;
 Mon, 09 Sep 2024 14:16:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snfCC-0002lH-S7
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 14:16:48 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 262d1d4c-6eb6-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 16:16:47 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c26311c6f0so5239904a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 07:16:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd8b126sm3080325a12.85.2024.09.09.07.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 07:16:46 -0700 (PDT)
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
X-Inumbo-ID: 262d1d4c-6eb6-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725891407; x=1726496207; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bPoUZQcplVTvhkZOBbdCix8D/isy/o/QTOHfAH19z9o=;
        b=YGpFKU6fqv4e4VgpXiaxn1yuEjZcAyAyHGMFguU0jmZ8TSfb/Tfm3pBSA3cCy2elgp
         quFL2SEzSYDd9xrfwLV5B7L6z9KtLEGQeX9OgO6NjdHiZFpkTA9jSB5W8cArFu7w1zOt
         Xi6EyfcaVhMQeELmvlGzCCMgI8UVaF/gTyYQ1/DaWjb0C6fVakOvJ568UrNNq7hfe3mo
         Orz9KW6bz5JvT4cz98OSgM6oTwEIATcrVaix/WAMmjwXchRt7XOaF0o3VBFpprrNkDAF
         uFzYOuqOF82sIOLxkC4lqibFhJwmxJfyn4p3s/3b0wafflqcl3frQPmMyaMO+1ZBvR9c
         Vcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725891407; x=1726496207;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPoUZQcplVTvhkZOBbdCix8D/isy/o/QTOHfAH19z9o=;
        b=LH3Vcwik6vtLH8AZsSVUG6k9mqJXkGPRqjcBZvvmTfKCJwOCoqOke1C4c9mdKq6WJ6
         U9t5N28qICDXxtcQGutim+tAHH9OIRf5GrobWqXoIN60nQ9dYHqc9+ppul19t/UDxdHV
         HbXOWwdbSvW/4sj1SHhxiQRjG1cVAInsHMKS36uBQLvxEdFiiDgkaMnp3PPL//kb24J6
         ixtM77rjEB769q34IM4arrYcjncL84JwotfQNn+3eD2HheC2r/aIkiFoGd3WS3ZJ7Z1F
         gUV2rNcYhe8kszR9u1J2zesm9w32ictqco5qPgWVqbbs8NA55Woh1hSrY7xjQ/ZCDnzu
         9FgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUCl8qEiEtSJrxnpgvKhqMgurIRpLPEOT3P2yI3+TUrzADmIm8lDfNjlNA+0pIuhXmv8cckX+6Vdw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKHO7bbb4eiWJvCkY01rhSSqtM9F6jAFQQHckti1snNMfaTJHw
	c9aCI/VYwn20KRZsvwQTHosJHmggNl/hTN58eiml+2atRbkIIh3+0h+hTsk1GA==
X-Google-Smtp-Source: AGHT+IGnWYyqQNp5MDPULAf54Lbx5LK5YKOvIGi9VIW1QBSWgIKPiwN8hqt8Tden9+l0VWmfdlGT0w==
X-Received: by 2002:a05:6402:35d4:b0:5be:fa43:8017 with SMTP id 4fb4d7f45d1cf-5c3dc798e0cmr7049732a12.16.1725891406920;
        Mon, 09 Sep 2024 07:16:46 -0700 (PDT)
Message-ID: <7357f6e8-2630-4027-b339-eedab9ae48c5@suse.com>
Date: Mon, 9 Sep 2024 16:16:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v6] CODING_STYLE: Add a section on header guards
 naming conventions
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <a68267c7465a9b0d2ed8f844a5e0145de50b0f3a.1725550985.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <a68267c7465a9b0d2ed8f844a5e0145de50b0f3a.1725550985.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.09.2024 17:48, Alessandro Zucchelli wrote:
> This section explains which format should be followed by header
> inclusion guards via a drop-down list of rules.
> 
> No functional change.
> 
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> 
> ---
> Changes in v6:
> - edit inclusion guards naming conventions, including more details

Yet I'm afraid that from my pov we're still not there. Specifically ...

> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -159,6 +159,34 @@ Emacs local variables
>  A comment block containing local variables for emacs is permitted at
>  the end of files.  It should be:
>  
> +Header inclusion guards
> +-----------------------
> +
> +Unless otherwise specified, all header files should include proper
> +guards to prevent multiple inclusions. The following naming conventions
> +apply:

... reading this, I can't derive ...

> +- Private headers: <dir>__<filename>_H
> +    - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
> +    - arch/arm/arm32/lib/something.h -> ARM__ARM32__LIB__SOMETHING_H
> +    - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H

... the absence of an equivalent of the arch/ part of the path. As per
my recollection we agreed on that shortening, but it needs spelling out
in the textual description. Such that it is possible to derived what to
uses as a name for, say, a header under common/, crypto/, or drivers/
(or anywhere else of course). Specifically with the further examples ...

> +- asm-generic headers: ASM_GENERIC__<filename>_H
> +    - include/asm-generic/something.h -> ASM_GENERIC__SOMETHING_H
> +
> +- arch-specific headers: ASM__<architecture>__<subdir>__<filename>_H
> +    - arch/x86/include/asm/something.h -> ASM__X86__SOMETHING_H

... here and ...

> +- Xen headers: XEN__<filename>_H
> +    - include/xen/something.h -> XEN__SOMETHING_H

... here, where more than just one path component is omitted, deriving
what's meant can end up ambiguous. Yet ambiguity is what we absolutely
want to avoid, to preempt later discussions on any such naming.

Plus I think that only once properly spelled out as rules it'll become
sufficiently clear whether there is any remaining risk of naming
collisions.

Jan

