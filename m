Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1974B87CA85
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 10:16:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693705.1082100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl3g0-00058z-Dv; Fri, 15 Mar 2024 09:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693705.1082100; Fri, 15 Mar 2024 09:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl3g0-00056o-Aq; Fri, 15 Mar 2024 09:16:32 +0000
Received: by outflank-mailman (input) for mailman id 693705;
 Fri, 15 Mar 2024 09:16:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rl3fy-00056b-Np
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 09:16:30 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b47066f1-e2ac-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 10:16:28 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a466f89560eso217391766b.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 02:16:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 jo26-20020a170906f6da00b00a45f63d2959sm1509823ejb.210.2024.03.15.02.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 02:16:28 -0700 (PDT)
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
X-Inumbo-ID: b47066f1-e2ac-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710494188; x=1711098988; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hdcfZXt+BfhaR+5vj1AtvNow29vmEI8shV/8Y9XsK4=;
        b=IkAc7qxrmFOk+3q8q4aB3UngiZyHgf/KVbNgldY1K9vxqIUJshx9ViohK88XYALdH8
         g8SWaMgTkWnH6cKNkSmJ+a9dJmvBPmP6yJYYH2TDh6aLkYVLvJtCs3agnDVM8WjW4miR
         3Us7Xa362Qzm4OMalkikt36zhvejNz4q/IheudTWeMXerukWJ28Ir1N0IiNtD+DIMdPe
         a1yRpj0Ps9P4KnwM/eihhlGaeQ4STls+vBvdqUU103CiHJYPV5qswqlGg+zQoLEAPZZY
         EV7bGOx1b2I0lRUFUtBRSgUskIjpKZQ7UUy1cessfvwwGvG0hWWFSVeyF00dGJI0Xi7w
         2sxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710494188; x=1711098988;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0hdcfZXt+BfhaR+5vj1AtvNow29vmEI8shV/8Y9XsK4=;
        b=nKq3kQWDoiEaYCUfoJRN452fugBZzOMZBSPxgPmpQQWjOzBNSSrIwB/M9RIDmOwPc6
         fO2oiU8Ks4Nk1QUKrboISaL+aHJhO0dfOyqw8JHSlvWnVhUs1EaG1b1J0DRSa+3s4o91
         ADzss/Br/T/mJbeZP/wHRpcQtzdoh9OSf87F5ab8nHlJQbHBe+/zF4msi6wYmO936/KO
         1IQ4IhIDEfXEXW9/WjQjfTkgc2VLvTFTkaybgSYYYxBOruQbYx1supIOBTRwYDfg7LLE
         +HMXrwshgihWl+hU5iHGheM9mAiZosXcixDns62C+P8bqzmrDL9/dgmSka3I6QC3Z0Vp
         2aoA==
X-Forwarded-Encrypted: i=1; AJvYcCV1gHb6wWVk45ZODMaPJLLIGdjF5pr8r7S2fcc4yUiDAlAPmBDdpD10Tbms6S85p3O8+kyqJI8FmKYXvX8+IxPwMzV41HvMCvoCJeWYPcg=
X-Gm-Message-State: AOJu0YwSqi2rBuVe79cMivGSzqgrw2lWuduDNHpyUFd9IiY08rYETUOX
	mOJOj9ZNmAPZz8xxgPizskozgB2eajDh37uKap84gXZkSXyeL8msaEE2/AkWXA==
X-Google-Smtp-Source: AGHT+IEdXWF6zuyRlPEeIIohOi3bLNcjKdTXo1CEPzeyiWowRjdJ7XHTUW1G2BIphG//lI8mIo70Rw==
X-Received: by 2002:a17:906:a40c:b0:a46:2874:ecd5 with SMTP id l12-20020a170906a40c00b00a462874ecd5mr2472107ejz.55.1710494188344;
        Fri, 15 Mar 2024 02:16:28 -0700 (PDT)
Message-ID: <152e76ee-6e75-4881-aa88-313f0ae058be@suse.com>
Date: Fri, 15 Mar 2024 10:16:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <039524d4157dddb2faf6887739a727f6e993b53f.1710443965.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <039524d4157dddb2faf6887739a727f6e993b53f.1710443965.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 23:15, Shawn Anastasio wrote:
> Arm's setup.c contains a collection of functions for parsing memory map
> and other boot information from a device tree. Since these routines are
> generally useful on any architecture that supports device tree booting,
> move them into xen/common/device-tree.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>  MAINTAINERS                       |   1 +
>  xen/arch/arm/setup.c              | 419 --------------------------
>  xen/common/Makefile               |   1 +
>  xen/common/device-tree/Makefile   |   1 +
>  xen/common/device-tree/bootinfo.c | 469 ++++++++++++++++++++++++++++++
>  5 files changed, 472 insertions(+), 419 deletions(-)
>  create mode 100644 xen/common/device-tree/Makefile
>  create mode 100644 xen/common/device-tree/bootinfo.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 56a6932037..e85fbe6737 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -301,6 +301,7 @@ M:	Stefano Stabellini <sstabellini@kernel.org>
>  M:	Julien Grall <julien@xen.org>
>  S:	Supported
>  F:	xen/common/libfdt/
> +F:	xen/common/device-tree/setup.c

Perhaps more generally

F:	xen/common/device-tree/

?

Jan

