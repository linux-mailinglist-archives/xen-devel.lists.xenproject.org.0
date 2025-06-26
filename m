Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D44AEA2FC
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 17:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026730.1401924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUosy-0006L5-Vy; Thu, 26 Jun 2025 15:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026730.1401924; Thu, 26 Jun 2025 15:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUosy-0006IY-TA; Thu, 26 Jun 2025 15:51:36 +0000
Received: by outflank-mailman (input) for mailman id 1026730;
 Thu, 26 Jun 2025 15:51:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUosx-0006IS-JT
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 15:51:35 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fae8573-52a5-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 17:51:34 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so1103015f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 08:51:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23abe3f4001sm1126535ad.162.2025.06.26.08.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 08:51:33 -0700 (PDT)
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
X-Inumbo-ID: 6fae8573-52a5-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750953094; x=1751557894; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XMH7NJmQpgEZtIptyfWpGZKvZi25xkE+dUzrCuXHHlY=;
        b=OxXqTP1t8CMJMPLESMeqztTFAHWPB/Su377qwrxwV8+0xeA9Sggao9Drlw1b9u6b+K
         6lhTnEe5eD287KZQVzLhX0nYrDrkuw6la9jnodQfvFlJC2fkzGte1709zzyW4QegWwtB
         GtoAl6J301DUZKKXnCx9Z4LsKEIdpw4N2Hsz9HlwnNOOln6fzTjB0+CEsjJo+HDbANEE
         eyt33UkTlMdfh0p17zDJ5Rz+GAjlMi5qavfR4qZMn1Tzw3o3lhU4QOlG15Aq12977BQZ
         6kFm7AcrRZxXHkpUljnqAKOr7K+6IC9ASpHKluTSVYWxqtG1hX6C5P0bvj4rZLE2gy9z
         /JFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750953094; x=1751557894;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMH7NJmQpgEZtIptyfWpGZKvZi25xkE+dUzrCuXHHlY=;
        b=WFeUvNW26qPEmAAr25G3KfixMiFnJhjx4nHw7DJVF3ytno2wb6yl4JYN6vVbgU+GRZ
         uzIwYC7m90K6gdOs9rVpchAXof2OORxxxf2Omo4E+lJk7s08qLWiTbBr7j8nJ3yHn0Ja
         75ReYGqLgC+V81+3LjlhjPCortC4VcF3AyUBDJSGVySTk8GzCowFYw/gKUlece/k69ss
         1/mdWUAFOc5S5JfRu0MAbRmDu9Lko5oYqbyodoMi7zvyz9JA1h3d5iPa++zfFwbzdVQa
         TdboFi153jXFQybE/Mx1Na50yeS8SWG7JJFQ0jR6kYdsr925I2mIpYvv86ztb2pLCO3F
         yRnw==
X-Forwarded-Encrypted: i=1; AJvYcCXjUoeOozwpPupEou9JljwYTWcaa6WggQKUp+A/V9Kq9O50pNhwi0WMt/kW1ZDD9CuKVvxLAFIcnzM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz18g4MnJfglxAStcZRR7KtK4ZS0fGLBabQIavoA1S/yWNQW5Ro
	wqYJjWu4X/h255hq2hZtvk7RWDpxfT89GCGCejpnHqykF/F3L6ATjpM1AKGQBR7EjA==
X-Gm-Gg: ASbGnctre8HzdqV9HjS9LerplEt1jGinvTFaS2Ng97P5Wa7tuFKa6kGYJHHoOvaDbil
	fJvKmmf7PhaOh6xSsigDZXZs6aShnaKUyBJWjTvfz6pFjx3h2h3akYNHgKkRLot4ZrdwXhfQNck
	KVj4jolKIqFzxCydGYNGEjr8gKLrGEUubafnzTzKzxc7nAHmnyKCsKrmwisBuUit5AP6IpvCClp
	KFttAgOSRSvZi3dTRSofGd+kMBDXR7sgoj171RppDRmTwJT0BiGJMur+18GIFgqDQuXHctT9UfN
	lggthkqmD3rtY7s4zP4bH86wCY44GB9i8V+ZYMe0LuEjSS6EME6lKz3kahOS1/ijrfseVXYk51S
	aGq3/AHhbmMcHCGXDZxRl3bAr7G3w8vTwDv6fNPEO0qiJqro=
X-Google-Smtp-Source: AGHT+IHjsauj8msB2NXjd4GJqODEZwb2GxtPJmR3Uiw5/UijiBGjpbMETmDnCasg9rO4ehdoeHwrJw==
X-Received: by 2002:a05:6000:2a88:b0:3a5:8905:2dda with SMTP id ffacd0b85a97d-3a8f4549d3amr37874f8f.43.1750953094002;
        Thu, 26 Jun 2025 08:51:34 -0700 (PDT)
Message-ID: <2e35ed6d-f9a5-48c7-8e81-6f5daa5c16d7@suse.com>
Date: Thu, 26 Jun 2025 17:51:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/18] xen: introduce CONFIG_SYSCTL
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org, xen-devel@dornerworks.com
References: <20250616064128.581164-1-Penny.Zheng@amd.com>
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
In-Reply-To: <20250616064128.581164-1-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.06.2025 08:41, Penny Zheng wrote:
> It can be beneficial for some dom0less systems to further reduce Xen footprint
> via disabling some hypercalls handling code, which may not to be used &
> required in such systems. Each hypercall has a separate option to keep
> configuration flexible.
> 
> Options to disable hypercalls:
> - sysctl
> - domctl
> - hvm
> - physdev
> - platform
> 
> This patch serie is only focusing on introducing CONFIG_SYSCTL. Different
> options will be covered in different patch serie.
> 
> Features, like LIVEPATCH, Overlay DTB, which fully rely on sysctl op, will
> be wrapped with CONFIG_SYSCTL, to reduce Xen footprint as much as possible.
> 
> It is derived from Stefano Stabellini's commit "xen: introduce kconfig options to
> disable hypercalls"(
> https://lore.kernel.org/xen-devel/20241219092917.3006174-1-Sergiy_Kibrik@epam.com)
> 
> Penny Zheng (16):
>   xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
>   xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL
>   xen/sysctl: wrap around XEN_SYSCTL_readconsole
>   xen/sysctl: make CONFIG_TRACEBUFFER depend on CONFIG_SYSCTL
>   xen/sysctl: wrap around XEN_SYSCTL_sched_id
>   xen/sysctl: wrap around XEN_SYSCTL_perfc_op
>   xen/sysctl: wrap around XEN_SYSCTL_lockprof_op
>   xen/pmstat: introduce CONFIG_PM_OP
>   xen/sysctl: introduce CONFIG_PM_STATS
>   xen/sysctl: wrap around XEN_SYSCTL_page_offline_op
>   xen/sysctl: wrap around XEN_SYSCTL_cpupool_op
>   xen/sysctl: wrap around XEN_SYSCTL_scheduler_op
>   xen/sysctl: wrap around XEN_SYSCTL_physinfo
>   xen/sysctl: make CONFIG_COVERAGE depend on CONFIG_SYSCTL
>   xen/sysctl: make CONFIG_LIVEPATCH depend on CONFIG_SYSCTL
>   xen/sysctl: wrap around arch-specific arch_do_sysctl

When thinking about whether to commit part of the series, it occurred to me that
to avoid transiently regressing shim (in size), shouldn't the currently 1st patch
be moved to be 2nd to last, and then be committed together with the last one? In
any event the plan right now is to commit some patches from the beginning of this
series, but specifically without patch 1. Please shout if you see any problem
with this.

Jan

