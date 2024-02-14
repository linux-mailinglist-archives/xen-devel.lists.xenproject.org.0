Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6AB8548BE
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 12:50:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680652.1058706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDm2-00018I-M7; Wed, 14 Feb 2024 11:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680652.1058706; Wed, 14 Feb 2024 11:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDm2-00015S-Ig; Wed, 14 Feb 2024 11:49:58 +0000
Received: by outflank-mailman (input) for mailman id 680652;
 Wed, 14 Feb 2024 11:49:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raDm1-00015M-8I
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 11:49:57 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b44b4d6-cb2f-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 12:49:54 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33ce2121d5dso635717f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 03:49:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x8-20020a5d6508000000b0033b1b01e4fcsm12195893wru.96.2024.02.14.03.49.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 03:49:53 -0800 (PST)
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
X-Inumbo-ID: 2b44b4d6-cb2f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707911394; x=1708516194; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SJH9x7u+fZSVOBTrC0UwZ3YggKvS80omYArXBXtxJHU=;
        b=H1EieQ7bMo3kgSbhTxZhvq7sHWInGzcbJpidQ4imgAbGlAkQtUk4Ecs2NarwMt4PLR
         b+IL+vFKaho+ATeInkCCtzFGME4NnxT4yCOixixiP0Qxz6fXLki3VprRYr8uZsi2OYA2
         mZnLlVrQFdvb7ohFLesCxGn6+/0fVwx8oKrSSdBXntH2VNnqc8Dca9IiIXaJz/jcICoS
         6IqRo7NiqDtPy3L0Le3IEjK2JwFryKD1qofCQeCPVDT4QQ2hYd5H/YzIgm7FcHI+4RvY
         1vU2M8ycUSyfykPU4J3NAyoJ9bzJ7O3dn647WzYb7wCw/Umq14VU01i+x+7Z2eUBpE15
         tSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707911394; x=1708516194;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJH9x7u+fZSVOBTrC0UwZ3YggKvS80omYArXBXtxJHU=;
        b=Z1dYehu7ywytVxIPUwB01c5scqgoaD3i8DqbNByvtJve00z7enlkaNEeKdl8HwekSN
         RvUnV31kcNpfcJgnsp4Scg3sZaosk42TsTe5wcOpXINC5rFl1OGM03oeBk4kdQorfEiW
         c/ZBZsDmC3GFb1EPfEl4Ka17e4GGcDJwFykeLc5A7QCetoXJc/PRs4OQAtZ1GuU4PGd5
         F7PPeABuZa0I4rsLeVqpLynhAtn4x9YKSVWF5th3/Wz5OGLQQ1jVOOxzDzEid3TZn/sJ
         846iDfAX5Ws9whzQQCJOrqbdFY0Zq0W2Sfn0OmSEdsWHmzq48k3o0ofXKV1hNEqQL7ih
         5OdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV5IO79RufB2fXN5vwumdORDVSKjEnl9Dxvqdy7hgfYNmGozWcXdafbd+kF3SG07IaJzT6b9Az/OU54NN+wn5ouhqVuZ+Y90KRuJCIdTw=
X-Gm-Message-State: AOJu0YzBV1gBmO+Oq+4yBr/6ifP8p0i4d/mGNZrIzE9ggPO3BZ3ETqxu
	2H+4HkhqgnwvLXT2GhRZfCSQ/+cEHm9ev457HoySft9Qkh02RW8FFwkSiWvWqQ==
X-Google-Smtp-Source: AGHT+IHwwKbUV9JDCU4JG0tCYI09ZrfDDscYPkxxinZsIrhZt9zxwYnZgSI8Jux4udD6KYtbd7xJzg==
X-Received: by 2002:a5d:464a:0:b0:33c:e48e:8cc1 with SMTP id j10-20020a5d464a000000b0033ce48e8cc1mr1621430wrs.0.1707911394130;
        Wed, 14 Feb 2024 03:49:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVvFw6M3o1YUycVkoeVW/vwPFZATxkgr8PEPtSLLZYJlcDh6/JEDzyt/IF7A6if4mocJJQgeh/rYMEbEX6LCAGk0eCW1pCM6sSu3uBuyamp5hIgrQ8QOj69LAWgYuqsKxp6AATfqT5MbaAKNvUW9n0ruzviRK0/qlbRqYFUXNidsF8Gl/oOTswp0N3plNe6MX7sdGJxI/UaV5/qx5gv/yQInR9td9YBnmlAZeJrex8h75GQ01Lu+WH8f7Y9pYYFrQ50OV1/jsiYG1EZcfWMxbdLHoCI2q8B1NsHR5heHoVQvOGaba3cRtfXv7h5dXmZk9Q3nBZRjJTfaCelDpoesrc/XPEtpCcap3c0CCgYtQKtLyy7Lrpi2T5lTNRoYCoSmUARhh0XcjpbxorV0ET4clF+w0vAW8fj7yuO1hETuetFw3KrSoilMRKmldLOyWPQhifUZBdrQixelwjcdIAGyGCCvkk=
Message-ID: <3519db82-6126-4aa0-9d04-795edf6f2bca@suse.com>
Date: Wed, 14 Feb 2024 12:49:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair_analysis: deviate certain macros
 for Rule 20.12
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <892be5c403ca7a20b35fb9facacb6a38bc7f6bfe.1707900742.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <892be5c403ca7a20b35fb9facacb6a38bc7f6bfe.1707900742.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.02.2024 12:26, Nicola Vetrini wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -387,6 +387,16 @@ in assignments."
>  {safe, "left_right(^[(,\\[]$,^[),\\]]$)"}
>  -doc_end
>  
> +-doc_begin="The token pasting in variadic macros cannot be replaced."
> +-config=MC3R1.R20.12,macros+={deliberate, "variadic()"}
> +-doc_end
> +
> +-doc_begin="Uses of # and ## operators within the following macros are
> +deliberate."

I don't think this is a good explanation. The use of those operators is
deliberate elsewhere as well.

> +-config=MC3R1.R20.12,macros+={deliberate, "name(ASSERT||BUILD_BUG_ON||BUILD_BUG_ON_ZERO||GENERATE_CASE)"}

I said in another context already that it is necessary to separate
global scope macros from local helper ones. Any CU can introduce another
GENERATE_CASE(), and would be deviated here right away. In fact I
question applicability of the deviation to arm/arm64/vsysreg.c; I only
see it as applicable to arm/vcpreg.c.

Jan

