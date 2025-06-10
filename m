Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81998AD37B1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:00:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010765.1388952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyas-00038T-38; Tue, 10 Jun 2025 13:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010765.1388952; Tue, 10 Jun 2025 13:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyas-00036n-0A; Tue, 10 Jun 2025 13:00:46 +0000
Received: by outflank-mailman (input) for mailman id 1010765;
 Tue, 10 Jun 2025 13:00:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOyaq-00036h-Iu
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:00:44 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eae77f53-45fa-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 15:00:43 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so3663320f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:00:43 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53229de53sm12177335f8f.8.2025.06.10.06.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 06:00:42 -0700 (PDT)
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
X-Inumbo-ID: eae77f53-45fa-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749560443; x=1750165243; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xNp44KD4Or1m1CBQh/PgKZvs8rzRrWzGzLvzSCSzHa8=;
        b=CiWpFLV8ox1sKhJhgf+T5Zr9IMVckWQsZoiD/V4eH51wxDX9BRpmQTX2a7il9FQjNl
         EJeexgWI4RIfyPavXW1gxoFJzvavpHchnt0zpbv3HTY/eQ8MXQNamLUeNi1rwy/u3Qmm
         J843zWnZmdMPJPH04GrpGxPIIWzjxoB3E6PehFjw4OEx4T9bQwUwBVnTesIEKBN5t7MO
         1UclqYDGcOvr/OL85G7JQ8t4LTfpmWt+UrIWY3C3GAAR23tU3vBiasn8HouSTfYSbRTs
         OSsSN1CA/G3sFaILP0L9fVUSFulCDwaIWsA3TIaxxJ1fDPDJR9OANEp+C/cjqLcO6YAb
         g3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560443; x=1750165243;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNp44KD4Or1m1CBQh/PgKZvs8rzRrWzGzLvzSCSzHa8=;
        b=nmTiyBB+SHS2ZIusO0xr3hE8WbAy+p65R3TJ96NWiB35CXsusrlcrBBd9Fwxzl9dGU
         t1v6jNzLAhjxu6bavEQ1H5dcJQMh5IK/Zpvqj1MwubrPONjPoHiV57x+yYlbxIGx3Esp
         qjPsXHO6yjqb0YxltDG2Cs83Qh0t+afFInC/aDTHqR3nQU7clzb7Pq8o5y+rgTtrNf+m
         coaVusT8AunFSyLMrerdzQ6oC0+Kn9TtFp3rlJVe/0Wso6b9MeBC+f3JG17VW/dor1Kg
         2Z4p4gCre1vP2xC3lJ3IJcPRGGmMfXvXl38Saz8GO2f6y4wxPSw0HnDXz9fk3R7/V8gN
         6TlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxmMLPh7q+JUMHU4g0Mj4eOQ1MaUCQRUFb2Aek8bLKvkS7rpKUj8X79PSNxYr+lkpxB9PCJ+GJ6Js=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6W4aqhQqIHzxgL0UzQwDx6+ExzJz9W9eQ7I+DPvhTzwDyNa6y
	Clo8ZaSEz4PMDHhoHVCqv+m1Hmkozp9ELlUGRF1OWIVLYNxVh+9p7f2j4kNrpwjSWw==
X-Gm-Gg: ASbGncsmc9oAB11GJLGA9juFAO4tJ64QmsIaqyccnNuDsKWcLIFPbvxDGz4oEapFTYL
	kiYLQSkdE79ol1VSOF8CQB4mXor8lLl0B+/k7oxB5xFGxl+Th0eIUgCaoGZCWGwWiCUu7U3JYwp
	/jO4TMF+AEhHs5SOAAKjxhVM3Ee0nN1Id/9x7o3uwa7D0FtK2NauCZcVbdOmdtejfgFXZC1lfDX
	s/I5+lOuXIh9FhNAi4VeYXfKE/gMlkQI+7GTaZ9KrP6MQNM6xtjUuGTz3HcrzaTI7NxK5YrLg8R
	GsMSwAwXHNM1cCa+vgy+DVfepahX0ONfwEUo//so/mitIyS/5VNwJb+nUG/OF6K8uR068U3GKWx
	k6tIikT4ukfJLwC14JWxKLGV+XbEhx02DMeMO8qZAZ802pvGxGddjaKx+ddEpMNa9xfTh0CrwKe
	7KBzShCLMqa/AlRJhygk8j
X-Google-Smtp-Source: AGHT+IGSIWt8/uaa+mouaHSon9+mLvPQTxFyLnP2VHzpSfUqC1ZIHqNUIzdquMQBqmkXnGPhJxGn1A==
X-Received: by 2002:a05:6000:2dc9:b0:3a3:6415:96c8 with SMTP id ffacd0b85a97d-3a5319a78fcmr12756224f8f.41.1749560442787;
        Tue, 10 Jun 2025 06:00:42 -0700 (PDT)
Message-ID: <1a73c720-012a-4795-9f47-f9c23b643de1@suse.com>
Date: Tue, 10 Jun 2025 15:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/20] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
 <20250528091708.390767-4-Penny.Zheng@amd.com>
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
In-Reply-To: <20250528091708.390767-4-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.05.2025 11:16, Penny Zheng wrote:
> Remove all "depends on !PV_SHIM_EXCLUSIVE" (also the functionally
> equivalent "if !...") in Kconfig file, since negative dependancy will badly
> affect allyesconfig. To make sure unchanging produced config file based
> on "pvshim_defconfig", we shall explicitly state according Kconfig is not set
> 
> Add "default y" for SHADOW_PAGING and TBOOT, otherwise we will have unset
> values when running make defconfig based on "x86_64_defconfig".

I fear I don't understand this, perhaps related to me also not seeing how ...

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -143,7 +143,7 @@ config XEN_IBT
>  
>  config SHADOW_PAGING
>  	bool "Shadow Paging"
> -	default !PV_SHIM_EXCLUSIVE
> +	default y
>  	depends on PV || HVM
>  	help
>  
> @@ -175,7 +175,7 @@ config BIGMEM
>  config TBOOT
>  	bool "Xen tboot support (UNSUPPORTED)"
>  	depends on INTEL && UNSUPPORTED
> -	default !PV_SHIM_EXCLUSIVE
> +	default y
>  	select CRYPTO
>  	help
>  	  Allows support for Trusted Boot using the Intel(R) Trusted Execution

... these two fit with title and description. The justification for removing
the !PV_SHIM_EXCLUSIVE here is not "breaks allyesconfig".

> @@ -288,7 +288,6 @@ config PV_SHIM_EXCLUSIVE
>  
>  	  If unsure, say N.
>  
> -if !PV_SHIM_EXCLUSIVE
>  
>  config HYPERV_GUEST
>  	bool "Hyper-V Guest"
> @@ -298,7 +297,6 @@ config HYPERV_GUEST
>  
>  	  If unsure, say N.
>  
> -endif
>  
>  config REQUIRE_NX
>  	bool "Require NX (No eXecute) support"

Please don't leave double blank lines.

> --- a/xen/arch/x86/configs/pvshim_defconfig
> +++ b/xen/arch/x86/configs/pvshim_defconfig
> @@ -26,3 +26,8 @@ CONFIG_EXPERT=y
>  # CONFIG_INTEL_IOMMU is not set
>  # CONFIG_DEBUG is not set
>  # CONFIG_GDBSX is not set
> +# CONFIG_SHADOW_PAGING is not set
> +# CONFIG_TBOOT is not set
> +# HYPERV_HYPERV_GUEST is not set

This one doesn't look right, simply by its name.

> +# CONFIG_HVM is not set
> +# CONFIG_VGA is not set

Just to mention it - I'm unsure whether adding such at the end isn't going
to cause issues. But maybe I'm paranoid ...

> --- a/xen/drivers/video/Kconfig
> +++ b/xen/drivers/video/Kconfig
> @@ -3,10 +3,10 @@ config VIDEO
>  	bool
>  
>  config VGA
> -	bool "VGA support" if !PV_SHIM_EXCLUSIVE
> +	bool "VGA support"
>  	select VIDEO
>  	depends on X86
> -	default y if !PV_SHIM_EXCLUSIVE
> +	default y
>  	help
>  	  Enable VGA output for the Xen hypervisor.

Like above, this change also doesn't really fit with title and description.

Jan

