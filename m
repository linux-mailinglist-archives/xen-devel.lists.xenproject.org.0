Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 194D4ACDBFF
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 12:34:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005360.1384844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMlQt-0005TN-BQ; Wed, 04 Jun 2025 10:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005360.1384844; Wed, 04 Jun 2025 10:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMlQt-0005Ru-8o; Wed, 04 Jun 2025 10:33:19 +0000
Received: by outflank-mailman (input) for mailman id 1005360;
 Wed, 04 Jun 2025 10:33:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMlQr-0005Rl-FY
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 10:33:17 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5322c15a-412f-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 12:33:16 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-acb39c45b4eso1061912766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 03:33:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada6ad39420sm1079928166b.136.2025.06.04.03.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 03:33:15 -0700 (PDT)
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
X-Inumbo-ID: 5322c15a-412f-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749033196; x=1749637996; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=97SXe+q169l9mnHBS3nIc28wgOZ/0HzJFNuHFvC0sLk=;
        b=DnCFNIvcOkekx7Fq7P75KoSrOJ3QvuYwEOjgrEcEW96aSUW1xeOchkaNmXkAK64AaA
         ZJbEU8IyyBtMS6WzsukMXUVTnbhfpuvGCgXZ/I8tyfINZmJG3ZQV1iyAIdobInD5OPxx
         BjKEF+TVZA0PZ/I1KvZZ8TtCNNLk+50bG1jB0Lb04njfViRFvMdnK7Pz8INSscgQ2eYh
         jUgAbd6x8UBj8BhX5aSoQMqwjxY7/fvy1ZgiAs5yROTFnZ37Rn1SMopsSUxP6zc8WtyH
         DZHtrzkXljPCW4U+5NWOVpPm+/knaeZ/aV+hOPOixx+o96cgIvsEy+s6F7QaH8ZvCjSS
         Ju5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749033196; x=1749637996;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97SXe+q169l9mnHBS3nIc28wgOZ/0HzJFNuHFvC0sLk=;
        b=AIVGnaCnqVX5rWCVHyJMDsvzCzl8Gf9VQtbOCDZpnM7xL6IsGZX2t8xMY4YtiW6EpA
         xUlkQPJP4zCZ1jsNC9jNScq221aUuNXisx0iky99bQeiybc9OTrhOgbWrcaYyqrVn4c3
         zJ2UbUCwB1uWA9rln78ZeuKlASsC4spoD4dgSAgHtNqQAOKxhFENLrDOLGfqI7uoKS1k
         K/jXQrW45NKUJ2SrteW27mJFvXyW08oqX03UeUhjkW/Nf57q1K25TUtztog4mxRcbkJ+
         H+L8gTWn3stPVd73Ju2cRtnSs5uWDT1mooktoouql1g9tvUS3z5+HTwVIsjGdevnQqxs
         OyJw==
X-Forwarded-Encrypted: i=1; AJvYcCVqUaDzGnoz8VsNnXlsQ+xl/Ymag1cH8dUd6K9auo8TBoEYyulAjNCTED1pWY1ikk5RAd7wbdARzxA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzaHRIFqHijBEa+NSknEPwxS9w6Lp/+IPWhQWnGp6MAUXStKZpi
	lrQgmRZLj07X1hd1MLvF5TmGsQzBMAWq1qg66YGjaMh3C/BsmbNffq4kfYtOg7gPvg==
X-Gm-Gg: ASbGnctwIu620VIqYRKxFB5qIWkVdsjbeqQ7o1C1VBggKxCMvJgXzMSs5phZ3/I9PkQ
	kPBsu5Dw7B9qzwQ2ouhwMeqQJTiv/FglBSIAWSBF3MeL2LSFNbxqzmqNEx0UyHrqYe2e80KvqD8
	WysJ4Qi1IDUgBLMYMOxYWRlwkzHgVzuwatzcHs3mnUoGAHey35S81xAg611yZWhSekW3kW7ZTcJ
	uKmrVtkpeG/RpUGhDoSrDlMh2MComgqUujv3xB/nN4sD0zeialWuBkSRplub9Jth+jPQJldDoff
	J4eyC6ixJheSS3eFhhT09+8Bu3f+QTXM8SLoG0w/tZ0VboH9vds02EpBjy7tyaNM5YjPWIbB5/0
	iNYYY6jycIXXtmJwDDJ0wW3aq/5gyRdlPtbNyB4MNDfl08AE=
X-Google-Smtp-Source: AGHT+IFjcxel4oqWYrNtvT20WhfO6k7FvpyLRmCoztVdVWZTnBBprC5ONlSystpY0dwbdqJP3rnA1A==
X-Received: by 2002:a17:907:86a7:b0:add:ede0:b9d4 with SMTP id a640c23a62f3a-addf89e8fe6mr195165266b.0.1749033195781;
        Wed, 04 Jun 2025 03:33:15 -0700 (PDT)
Message-ID: <49f31b2a-d171-4ab1-8002-67453804fa60@suse.com>
Date: Wed, 4 Jun 2025 12:33:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen: Introduce system suspend config option
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Mykyta Poturai <mykyta_poturai@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1748381788.git.mykola_kvach@epam.com>
 <eb586049ef5180bb33e9414c4754ee2621a772bc.1748381788.git.mykola_kvach@epam.com>
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
In-Reply-To: <eb586049ef5180bb33e9414c4754ee2621a772bc.1748381788.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.05.2025 10:05, Mykola Kvach wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -33,6 +33,8 @@ config X86
>  	select HAS_VMAP
>  	select HAS_VPCI if HVM
>  	select NEEDS_LIBELF
> +	select HAS_SYSTEM_SUSPEND
> +	select SYSTEM_SUSPEND_ALWAYS_ON

To avoid other architectures potentially also needing to select both, how about
moving the former one ...

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -579,4 +579,21 @@ config BUDDY_ALLOCATOR_SIZE
>  	  Amount of memory reserved for the buddy allocator to serve Xen heap,
>  	  working alongside the colored one.
>  
> +config HAS_SYSTEM_SUSPEND
> +	bool
> +
> +config SYSTEM_SUSPEND_ALWAYS_ON
> +	bool

... here?

> +config SYSTEM_SUSPEND
> +	bool "System suspend support"
> +	depends on HAS_SYSTEM_SUSPEND
> +	default y if SYSTEM_SUSPEND_ALWAYS_ON

Hmm, this way "always on" isn't achieved. Someone can still turn it off, likely
causing the build to fail (until it is properly made an optional feature). You
also need to make the prompt invisible (by attaching "if SYSTEM_SUSPEND_ALWAYS_ON").

Also the default line could be shorter as "default SYSTEM_SUSPEND_ALWAYS_ON";
aiui with modern kconfig there's no difference anymore between the two.

Jan

