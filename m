Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26833AE3722
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 09:40:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022080.1397794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTbmm-0003qo-TK; Mon, 23 Jun 2025 07:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022080.1397794; Mon, 23 Jun 2025 07:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTbmm-0003ol-QC; Mon, 23 Jun 2025 07:40:12 +0000
Received: by outflank-mailman (input) for mailman id 1022080;
 Mon, 23 Jun 2025 07:40:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTbml-0003of-D0
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 07:40:11 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47f864a1-5005-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 09:40:06 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-450cfb790f7so27618735e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 00:40:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d8640c61sm78285515ad.141.2025.06.23.00.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 00:40:05 -0700 (PDT)
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
X-Inumbo-ID: 47f864a1-5005-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750664406; x=1751269206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iYDGgVU5TbBCRp/ft5iGMCvr6kD9RNtfXSBetMQZjK4=;
        b=V4GCPa1flyDcAi46Z7Q3DyfUkS2qCh3gyfFM8QTgoCZBaoIrmM4BapCnlztHJCys1O
         98qBcX4DMTNyvazILHYIzni/zMqC9NZoDgf3df48v2jhnGE7RDfcKjtxS4NNZGeQN6Y9
         /wJ37EPyiC/9v59KVICty93ZW/Divfmxo+YFlg9vQoJzsjB+MHivmCTIsY2sOJbXXwFw
         BbACVLp5GbUfmb5/sZQ2F+h0rNA8WuXPn4eG7E9k83m9peNq333o3Mh69q3OWSWRlYx/
         qGIEM8GrfGRYMagggoAgRts0PDtOlN6TMCc9uN1g6eRPd5VI27OKq53J0k6uvPxfWwFG
         +Leg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750664406; x=1751269206;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYDGgVU5TbBCRp/ft5iGMCvr6kD9RNtfXSBetMQZjK4=;
        b=LvH2AC7J8VKb9aFKg4kzER6alVpmxJMMvJETVh6sA7sVtqwlSO2s2oNDPwq+80p5Of
         GxW8C53K0UlzxYCSMZxO0T/apg6XfgkqTEWZxDAMMBA5mxWW28rORnnhYsMSHTiGCfIv
         4kqPz8eexygoYCp+Dc9zX3ebGTEY+LcvMzfsBGhtwIz06M2r/HXESz5OUbIkuNO1tBDV
         lcDFhbR6DJcEAaGfY1n/ZB1UhIDnmtPb0fsgNLeEsdFWEvzZq0owOfjBdTqUn4lUnCN1
         dVlfHNzHTEf1x67/AkDnXKXiQ9pKkwszhTUX+7/8zmxDRe03cMaKCFpKNAJWXuudFvl5
         6g6g==
X-Forwarded-Encrypted: i=1; AJvYcCXvChbnTog88CgVaMM1y8LeTET35ZeuqRMb9azZ7gz8vqr0qA1FBSLhHLbTPkWgh9ryZKJp7sE7oPU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyiGzWNir7Gg3b3w1dGiR6CDPI7AmS4BDeEhdJGkqosQbWl55yv
	VYzjRoVm0/Fm+brxDJaep5PY0rkF2RFpm5YOaZmszozmJBaQrtQjjIkiel69eU1tVA==
X-Gm-Gg: ASbGncuOnslyX5SRHH/RjgWq3xZYtCt7TYwlSPIbw1qQ9dyKaITuwPkPw+pNYG2yq7C
	OBq81uDUZVuuqQsjEL8dIfQiRIEZY9nkz718Va4F50RZ3aYiVNaYHs7HLn5Vq4cISJlkmbimUyz
	j3Hh8wXCrcHDQY1XEixe5S6TG8JsgwaQ2z3b3sAWoLQl+PSxZhuhCMEBjfWoUSE+j4+vnqoLdGk
	gRcSDiaVhlAxf9qvsGBOo88egFKwyoS8Ioz3CJFZIOoS6d4FkgaClJP8OS7G+kj8B3v7bSODy1f
	+CluMnRfsD08QKiW/bB+xkf4913xv//VdEeIPVPcYyBThpGrDuuKO5XEqFKfTUupk+5s1hazKVz
	4bLxka3ffoUDleIXK64Le8iJ87cdU2L/+zXWrWuNptui7lv8=
X-Google-Smtp-Source: AGHT+IEFHB7ALrnPs1u381bLELz6gKDA5/XQ1iZfQ6vXAUoAWpkElxowF6ubDRjaepSRZlEr5tj5sQ==
X-Received: by 2002:a05:6000:2504:b0:3a4:f9e7:2796 with SMTP id ffacd0b85a97d-3a6d12fb64emr10832193f8f.35.1750664405563;
        Mon, 23 Jun 2025 00:40:05 -0700 (PDT)
Message-ID: <490ee7bf-cb10-43e3-9416-9a68e7529b96@suse.com>
Date: Mon, 23 Jun 2025 09:39:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] xen: Rename CONFIG_HAS_DEVICE_TREE to
 CONFIG_HAS_DEVICE_TREE_DISCOVERY
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250620182859.23378-1-agarciav@amd.com>
 <20250620182859.23378-11-agarciav@amd.com>
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
In-Reply-To: <20250620182859.23378-11-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.06.2025 20:28, Alejandro Vallejo wrote:
> Moving forward the idea is for there to be:
>   1. Basic DT support: used by dom0less/hyperlaunch.
>   2. Full DT support: used for device discovery and HW setup.
> 
> Rename HAS_DEVICE_TREE to HAS_DEVICE_TREE_DISCOVERY to describe (2), while
> DOM0LESS_BOOT is left to describe (1).

Considering hyperlaunch this feels wrong to me. Did you consider splitting
HAS_DEVICE_TREE into HAS_DEVICE_TREE_PARSE and HAS_DEVICE_TREE_DISCOVERY,
as I suggested on the committers call? You weren't there, but Stefano said
he was taking notes.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -14,7 +14,7 @@ config CORE_PARKING
>  
>  config DOM0LESS_BOOT
>  	bool "Dom0less boot support" if EXPERT
> -	depends on HAS_DOM0LESS && HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS
> +	depends on HAS_DOM0LESS && HAS_DEVICE_TREE_DISCOVERY && DOMAIN_BUILD_HELPERS
>  	default y
>  	help
>  	  Dom0less boot support enables Xen to create and start domU guests during
> @@ -85,7 +85,7 @@ config HAS_ALTERNATIVE
>  config HAS_COMPAT
>  	bool
>  
> -config HAS_DEVICE_TREE
> +config HAS_DEVICE_TREE_DISCOVERY
>  	bool
>  	select LIBFDT

This select imo ought to move to HAS_DEVICE_TREE_PARSE, unless I misunderstand
what LIBFDT covers.

> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -6,9 +6,9 @@ obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
>  obj-$(CONFIG_CORE_PARKING) += core_parking.o
>  obj-y += cpu.o
>  obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
> -obj-$(CONFIG_HAS_DEVICE_TREE) += device.o
> +obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device.o
>  obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
> -obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
> +obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device-tree/

Here I'm less certain - is everything in that subdir truly "discovery" related?

> --- a/xen/common/sched/Kconfig
> +++ b/xen/common/sched/Kconfig
> @@ -67,7 +67,7 @@ endmenu
>  
>  config BOOT_TIME_CPUPOOLS
>  	bool "Create cpupools at boot time"
> -	depends on HAS_DEVICE_TREE
> +	depends on HAS_DEVICE_TREE_DISCOVERY
>  	help
>  	  Creates cpupools during boot time and assigns cpus to them. Cpupools
>  	  options can be specified in the device tree.

This similarly looks wrong to me. Whether to create CPU pools is purely a
Xen-internal software thing, isn't it?

Jan

