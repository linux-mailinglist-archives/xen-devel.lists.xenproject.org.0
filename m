Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B59DEA920AE
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 17:00:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958004.1350984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Qiz-0000Wh-I2; Thu, 17 Apr 2025 15:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958004.1350984; Thu, 17 Apr 2025 15:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Qiz-0000UN-F9; Thu, 17 Apr 2025 15:00:21 +0000
Received: by outflank-mailman (input) for mailman id 958004;
 Thu, 17 Apr 2025 15:00:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5Qix-0000UF-LQ
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 15:00:19 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acb09b02-1b9c-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 17:00:17 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39ee5a5bb66so589695f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 08:00:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47ae9c4ce42sm98991cf.43.2025.04.17.08.00.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 08:00:16 -0700 (PDT)
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
X-Inumbo-ID: acb09b02-1b9c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744902017; x=1745506817; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=48QHCiULivBXj3ock91PjLD0fxWJWNOWWAy1791nwQw=;
        b=F0qAHuezRO9gKi09ckY5HUpTXEFDlyto33jl0YvpMB4EOgfpMVVO1SlLpTLXG3TKDg
         wq9CHeHLE3LN+Ml2z+Fm4cEuYxAOD9rc+GpC+wtgT0LsC0QYF/QvGwRmgpk1ZO/EDhWc
         fNSMy9h6s8PD81o3ljMEisiI2fMIyIbEuwif1wKVH4vYR/Og8NdEJ2yp6PfKP9bOyRqC
         LDSg8HtyfQfX/7M9ox1gnuJwh1cOKRy5sBErmJGnegg/oWgzJ7KWnzig1pURNwn/h+B+
         JJEBHgQvw644mxJVNpXdPzgfDmNznei7rcRlWdngVFuf+ZMdJdRQUTU5TVafXrdVPGMS
         VCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744902017; x=1745506817;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48QHCiULivBXj3ock91PjLD0fxWJWNOWWAy1791nwQw=;
        b=OmgxMT57td5tQAfROFSCVKYSJDHXFZI7HBBy2KPxHhwLJPR/IDGtLbTf9PlazTc5XE
         X+o4z/MPdwMA5mAiJRb/9jdQV54n4Lyh9UuzUDYfyuDQgbi/uXFQyFtoC9aW0JWvBsN2
         fmsX8EbuvGPOIm/qeoGtTJzyDyGHrn96ZvsjnRnvas5XmpKrJzkinopRELVfuiXgUB6l
         MipySyCSmytk/kTN6n8NEo2Ij1xxo3G6l/XT3scjZaNEMQXdU4c2/P7MxiAW54TcaLUj
         rTXUuhHT2lEFet8uKKA3TMGz71/car+iU5beQHUFQePhsqrqdCFZJTXj/XkJucWQtalK
         unhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeR7Bh0y/LnJP5vdeWsRiFzBtmmQXllvooUsiGq3fOFt919iNlHgZdtkyeDKM0mXTUapHMYVpcuz4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBoGkx99D8hFdEqhKRZuDVug+TK3B4R5N+8e27GR5jxU+LLeXL
	1Bj5sQWxBrPQGJdZEwIrVJLPhJFaAf3NL7AxFJO0AhveevuY0H3LPSsdgoznZA==
X-Gm-Gg: ASbGnct8SjEzpilN9Jzn02IlNem2X6iIe4s013QH5oxg1AxYF9dSVDqM7Wc7L5Cg5AT
	OKSriuqjrbubad/Ysw1h3WCHub+5oQrHyotSbfwEHdqNh3KcXL9kKGbv/51MuFayk2FV4LNxcrZ
	o6413sGRGmulBZ8tDpOwiD8wlfZLtJrwwxozWhnNvJGlZuUAIoPuZ+TvZ13r7Z6rKCoqg6wfT4Q
	ZiN/ZamIvG+/0C4d/n3YapNWOGP3tt7XuzI3tAyftOYozf7wrK1aV48FcF58+EPPtIKj8Vnf68w
	qbLnEo6sJ+M1oo9iFu57TI8u7nV5HfnJ+huRFW0mQCIRqpzYsFcQoavMHFhYI+Twgjj7gno+CaV
	09cyihpqS4Vki1Caw8PFyNGsWyA==
X-Google-Smtp-Source: AGHT+IGVvLWyAYYkLWnib7g6/qJKPyHIGmsBKYN1DaA4uHTlMsN1J6qG1zsZFbmhoObVJsMXK2NB4A==
X-Received: by 2002:a05:6000:2508:b0:391:4743:6dc2 with SMTP id ffacd0b85a97d-39ee5b1cf93mr5523499f8f.25.1744902017038;
        Thu, 17 Apr 2025 08:00:17 -0700 (PDT)
Message-ID: <6b7728d0-0464-44ad-8af6-e2816e83a2a6@suse.com>
Date: Thu, 17 Apr 2025 17:00:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/13] kconfig: introduce domain builder config options
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250417124844.11143-1-agarciav@amd.com>
 <20250417124844.11143-3-agarciav@amd.com>
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
In-Reply-To: <20250417124844.11143-3-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2025 14:48, Alejandro Vallejo wrote:
> --- /dev/null
> +++ b/xen/common/domain-builder/Kconfig
> @@ -0,0 +1,18 @@
> +
> +menu "Domain Builder Features"
> +depends on HAS_BOOT_INFO

That is, what's going to further be added here will not ...

> +config DOMAIN_BUILDER

...depend on this, but just on HAS_BOOT_INFO? Seems not very likely, but
I'll be looking forward to learn what the plans are.

Also, if the entire contents here is to depend on HAS_BOOT_INFO, can't
the "source" line pulling in this Kconfig be put inside "if HAS_BOOT_INFO"?
That would centralize definition and use of that symbol to a single file.

> +	bool "Domain builder (UNSUPPORTED)" if UNSUPPORTED
> +	select LIBFDT
> +	help
> +	  Xen has a built-in mechanisms to automatically construct domains
> +	  (like dom0) during the boot phase. The domain builder is an enhanced
> +	  form of that mechanism to enable constructing predefined domains
> +	  described on a flattened device tree.

I'm not a native speaker, but (perhaps because of that) "on" here reads
odd. More logical to me would be "by" or "via".

Jan

