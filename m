Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C509853578
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 16:59:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680057.1057896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZvBO-0001ue-8S; Tue, 13 Feb 2024 15:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680057.1057896; Tue, 13 Feb 2024 15:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZvBO-0001sM-5j; Tue, 13 Feb 2024 15:58:54 +0000
Received: by outflank-mailman (input) for mailman id 680057;
 Tue, 13 Feb 2024 15:58:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W/Jz=JW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZvBM-0001sG-7n
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 15:58:52 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7016564-ca88-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 16:58:50 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-411a5a86078so11383415e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 07:58:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n10-20020a05600c4f8a00b0040e4733aecbsm12237247wmq.15.2024.02.13.07.58.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 07:58:48 -0800 (PST)
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
X-Inumbo-ID: c7016564-ca88-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707839929; x=1708444729; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=46qlRpKLlGDPBxcSwlRclGnt3SqxTcaij+FFoWn28VE=;
        b=WKsciw83xvrxx9aONVc4qIigXiWwmCJTJtBI+/Vw4lGyrCgWsoBCpDgSwwUGB4L7E8
         ZtZ497N9WdCiMEYMSxxnKBuZ7Yfeu026X8nwHgNcb/RojVDEQzc1grodVCCJBa8OlKxq
         i3MOx5AIpqjIUD6UJNVEEkdn4GHkSlAUwdg5IDnU4jroD832bez3dsSuQpg8jXlNWd+P
         CvChG6OyVfEyUrXUyDLB3zBE/IB7o3s0hA8xA9MjFvPbrJQ7o56c8zIukR18XCOp1Suf
         wRJ9/IkW2lrxURfLqS2p8QjRW7n+4wFDX8e78kE1g/uDmRMrJ/7RIzo/zpEcpKpsRMrw
         fhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707839929; x=1708444729;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46qlRpKLlGDPBxcSwlRclGnt3SqxTcaij+FFoWn28VE=;
        b=dkbJ+EAr0T9XGlr1WbxousPRsZuN5eFrjc1Mn0CNK9yFu5BuseWXdjyJMVmuYCOlCd
         zlXzR2i5L/leVE/oMBc6imwWpCzpcbnRvwuo+QwIXPJoud9EZmDvGSHKYp6IYezCtoKj
         98A7PW4gtVEmU3+Wg4ABjZHOWkQcHVT4medgZ1Xmb1B/TsQLW1tDXgoeIUvFwUtK67VT
         yHpQw7uAYL9xiFeKi+N7VosRWl30qX48iQsIJoyhOwYDTv+jHUYXlo/b5UeAh+uQVaeC
         Eaosp8VjdiQNkIf+/2WgmiMMGIcgjAfInMwjSKHT+Tv89Tv4QS+5tsEXZSMwBO/bF3gg
         k/Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVao7FvZ5ILicqywVpZY6yKUVp1Oe4NC5OL/t6kAClG0gxQFUYV5LCCPR0H9WtvAjHcqDPjZxAtc5MbWddE/4JHa6MNy+jo7XHAi0Q7eXU=
X-Gm-Message-State: AOJu0YwBB/o0CDQTlzwKXbmRDNqRgMmSCEFEehB2tsNC0haJUN0WGsTh
	m3hcWk6yYwVfxgGf1Kft8+XI7hCWHgyd9L3Hb29IbGnizDtccv9XsoLRum+0lA==
X-Google-Smtp-Source: AGHT+IHk1ZBAYmLVzQ/Acr3FJP59lDkjl6eW+oyCgTX5SwY7MqG0wCbYKTlYBInV82yN6WgpOPmeRw==
X-Received: by 2002:a05:600c:3b26:b0:410:e860:c01f with SMTP id m38-20020a05600c3b2600b00410e860c01fmr60169wms.1.1707839929480;
        Tue, 13 Feb 2024 07:58:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVq8Kx/M2Wb5E9YaMlrrrxvXKpp7GCaBLqiP3iqPztSOig55ZC3p6ToVpWeqtN03biH6d48YBnGkN31San7L5OaMsEsa2zpIC/r2q6ZVGyudpQbztGXk0WGJQVqqWYijxR/80lHFyDa/zrf6l8nXr/3ZjTxrMK1cBCrxqHbiNsh7yqMtjQdZncnyo+7BLixg0aDFvkqhkilXsqPH8TGSQ4LiEk43DHsrqhufQTyDtsihExsRar83cQHVSCU4GlMeqv3s2DK5ttU8RDsc5x3nABbcUD/4Thi77JhAdthDeK/LNq/pAGYuPrMaxLSvmvFEH3l7zAkbh4ll4j/8bDvpuH/cvpGTn9WErZd6whYFPViHirJ0p87UqWEi9hDw+w6xd7E5NE1odw6LcqI6NEdeZHsH+fys0e0t++Wvw6f1C+jsMKX/AVnNrPdQGJS854IdojWxxE6D5moRyPsOHe8ARDNSg6Yi6BktoXyS9iBS6IDdFbOaGTo9RmFr1b0BWQbnX6xiVX6QRblNoqp
Message-ID: <670e4a5e-4eec-4a2c-9ed1-fcc164b1d76c@suse.com>
Date: Tue, 13 Feb 2024 16:58:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] xen/livepatch: align functions to ensure minimal
 distance between entry points
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <20240207145547.89689-1-roger.pau@citrix.com>
 <20240207145547.89689-4-roger.pau@citrix.com>
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
In-Reply-To: <20240207145547.89689-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2024 15:55, Roger Pau Monne wrote:
> The minimal function size requirements for an x86 livepatch are either 5 bytes
> (for jmp) or 9 bytes (for endbr + jmp), and always 4 bytes on Arm.  Ensure that
> distance between functions entry points is always at least of the minimal
> required size for livepatch instruction replacement to be successful.
> 
> Add an additional align directive to the linker scripts, in order to ensure that
> the next section placed after the .text.* (per-function sections) is also
> aligned to the required boundary, so that the distance of the last function
> entry point with the next symbol is also of minimal size.

Perhaps "... minimal required size"?

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -395,8 +395,11 @@ config CRYPTO
>  config LIVEPATCH
>  	bool "Live patching support"
>  	default X86
> -	depends on "$(XEN_HAS_BUILD_ID)" = "y"
> +	depends on "$(XEN_HAS_BUILD_ID)" = "y" && CC_HAS_FUNCTION_ALIGNMENT
>  	select CC_SPLIT_SECTIONS
> +	select FUNCTION_ALIGNMENT_16B if XEN_IBT
> +	select FUNCTION_ALIGNMENT_8B  if X86
> +	select FUNCTION_ALIGNMENT_4B  if ARM

This isn't strictly needed, is it? Would be nice to avoid re-selection
of what the default for an arch is anyway, as otherwise this will start
looking clumsy when a couple more architectures are added. Preferably
with that dropped (or it being clarified why it's still desirable to
have):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

