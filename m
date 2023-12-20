Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A091819D60
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 11:51:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657622.1026594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuA8-0000qo-9y; Wed, 20 Dec 2023 10:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657622.1026594; Wed, 20 Dec 2023 10:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuA8-0000oh-7Q; Wed, 20 Dec 2023 10:50:52 +0000
Received: by outflank-mailman (input) for mailman id 657622;
 Wed, 20 Dec 2023 10:50:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFuA7-0000ob-9i
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 10:50:51 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2cb7442-9f25-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 11:50:49 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40d38f03712so1326195e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 02:50:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ay38-20020a05600c1e2600b0040d37e93cc5sm1352285wmb.27.2023.12.20.02.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 02:50:48 -0800 (PST)
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
X-Inumbo-ID: a2cb7442-9f25-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703069448; x=1703674248; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IdeWQHDu4H895lhKeQa/FOBu65GthT+971dnLSSPxxI=;
        b=SToBmwHMxfUxWVljG2pTriwroZjC0e5GJ2pJ+QwGHGr6D9t8PSmTQvgQZZ2DJdlvtK
         +UWUtUp+v9onIHnBtW2nqz51E9N3QY8kOGbLyP5Dt9qLykqOcfVEG2aMLtTz2DKEg19/
         a7bteOtwxzot31cD/3rLhMar27ykJ2gB3ROW4vwkym2NsJF8OjilNy6SbdD55wyNYeLf
         4/KM6roTEZcMTjtX4xBcIEXxaYaYDZdzmiIP8YLF2vzRpu3mPm4lk9i3yfCW9EW/vT20
         yANTGoyd2sOStTXVFvKZPpDICLeqcX1SKdsQByXHPiOqSWnYDFGUmo+rqd8nj5GL4yva
         qF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703069448; x=1703674248;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IdeWQHDu4H895lhKeQa/FOBu65GthT+971dnLSSPxxI=;
        b=LRcb90IuPMHYK7tcJGyMRgqiZD+jScBSX3pJ6ji4R035gEIJZSkBoYA5N2hNqd3c3S
         p6W7lYm2Ks9K3BOrzJY5ve/eeN2iFgptBe1utUeKCLi//3KkmCaTidFTp61ZKxGkCfda
         jAZqMiELtlwQNz7NEErsh9pA40JqSMREQOiNJyO2ODqONYpYc/rHigE/hSYL6bAKLMOe
         muORA+VomVYyonPVgRFCHp+Nd5QJ6DFi2GJGe2NLU8Dynbdom6oyeXD5uc3yhIY8Vddb
         +ICQmwrUvd7bGMxPtSpM4Arkcw9jk6nX3o+ellzHUSz7ED5C0Yp40VJnr8otKlG/rSe5
         7tcA==
X-Gm-Message-State: AOJu0Yz3/tmSCw9Hz2cA7w8c4M4YJIQX+9d77eyFLnixX6aXwn2TxmfY
	QQoCOTBwRHVZ64EB99DA6Qwf
X-Google-Smtp-Source: AGHT+IG54WAjKvi2fa6Nm4691aUqg4ohmi1lw2Q/l5LOd0RTDySNIikF+u7t3xKqyf1Ju51Jracp4A==
X-Received: by 2002:a05:600c:4f07:b0:40c:6b55:d9c1 with SMTP id l7-20020a05600c4f0700b0040c6b55d9c1mr4633347wmq.30.1703069448460;
        Wed, 20 Dec 2023 02:50:48 -0800 (PST)
Message-ID: <73fe1d0e-c9f3-4941-9a15-0250c9bd34b4@suse.com>
Date: Wed, 20 Dec 2023 11:50:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] xen: add deviations for Rule 11.8
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1702982442.git.maria.celeste.cesario@bugseng.com>
 <04cdbf21db915634acd49108edab7d6331df35eb.1702982442.git.maria.celeste.cesario@bugseng.com>
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
In-Reply-To: <04cdbf21db915634acd49108edab7d6331df35eb.1702982442.git.maria.celeste.cesario@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2023 12:05, Simone Ballarin wrote:
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -248,6 +248,13 @@ Deviations related to MISRA C:2012 Rules:
>         If no bits are set, 0 is returned.
>       - Tagged as `safe` for ECLAIR.
>  
> +   * - R11.8
> +     - Violations caused by container_of are due to pointer arithmetic operations
> +       with the provided offset. The resulting pointer is then immediately cast back to its
> +       original type, which preserves the qualifier. This use is deemed safe.
> +       Fixing this violation would require to increase code complexity and lower readability.
> +     - Tagged as `safe` for ECLAIR.
> +    

Going forward can you please avoid adding trailing whitespace. "git am"
doesn't really like that, and hence it requires extra steps to clean up.

Jan

