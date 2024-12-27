Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3C49FD537
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2024 15:35:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863442.1274859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tRBQF-0007Jy-O6; Fri, 27 Dec 2024 14:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863442.1274859; Fri, 27 Dec 2024 14:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tRBQF-0007Hj-LY; Fri, 27 Dec 2024 14:34:39 +0000
Received: by outflank-mailman (input) for mailman id 863442;
 Fri, 27 Dec 2024 14:34:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tRBQE-0007Hd-9m
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2024 14:34:38 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b237b88c-c45f-11ef-99a3-01e77a169b0f;
 Fri, 27 Dec 2024 15:34:36 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385e3621518so3412489f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Dec 2024 06:34:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c848a47sm22075282f8f.62.2024.12.27.06.34.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Dec 2024 06:34:35 -0800 (PST)
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
X-Inumbo-ID: b237b88c-c45f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1735310076; x=1735914876; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6V3D5WZDehBaxCmvKw467CN62gjUjp0x+68Uq5ioTEQ=;
        b=dWDfcA9xHAY/7dobUKm7SU6rppb48sRCof+JOwUAy3wcvYgdTABYARUyD7OIQWXes6
         a1qYNIOhMS4UxFU4zy16Ff9Nd2+cLQaxRw5tsJqNqVv6q88rJYZxUKqmOimNYcM9wjZf
         SjLiJKkIQ29tKNkqXE0ET7OiTzFYEwrn1rWLpfjgfjPYpJAI3NI4HOsBbZTLkcrNu8ki
         sqRiht9LM/gCUiaIoMCBlw92y6wpqHnRIwr2taO/LF8rawhZUEoD8jrLLxONiTA4Va2v
         tnUDBGLZ2b5PidgbAKopdIbsWxW5rTdAW0u6eE5uvxmOSSwrL6Umv8OAv/oSUj4BPYRe
         FBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735310076; x=1735914876;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6V3D5WZDehBaxCmvKw467CN62gjUjp0x+68Uq5ioTEQ=;
        b=GWydjeAllUHl3MiVSIiJqmJjnmeI+ZtYhzHhYEUzHKIyouheGLO7quliqo1gEJnwxO
         EQnymEC0YGs+RGfwBOV22vAbH09Hb+LcE9FyIuKZHIdEXFL8uDnthP7i5eqEUGNJQlW+
         Lp36lSYddq29RhpcPdGEJ4bAzzMnNRJn1Q5N+G8f9LvXo7t1gLo+DERYUmzH2J2RktWn
         GvUmE44FaAFfGmbV2IIL3D2sppISeTI+A9Bb1oCB/p/t+5JsxvvUNMAObvxVBpfcuJ/T
         QcGtuwHjD04OdyOKUp/qiMirU7vO+Ys7n+a5NKY7vH4zoRXGvREwgCxRk3WEs+NpX5UC
         JQwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh+dLrXuM4lRDuZICO8nStBBTCZ1wlUkJ4mMdMbhNx/HRjYc3+D5R+HK1WIUAmoC0h7qQLBtakiJk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxvvp/CxGtHhMAYQ+4owAdmckgN/9KSkUQguUzSLs63ek/cF+8b
	VGjBGTUCkHRGt+XB0zMo+rCZ3czsG1i60RCtfKkcKUNXOe7hjGlPKNwL52sYEw==
X-Gm-Gg: ASbGnctbtPfRY/MpN3Ns3ASMTnUXO8gsxph635V/e0b5Azc5LOXRoM0g7Cu/r0AGpfb
	t3afoH0ruLu0mdwkIQYU5gn9sKFkTosIxS6EBAaiqKumfUI3Ro3mJzkVMcqCoJrDJeiRvXmb9kx
	kBbJomktroTSVQ5mbT9wbzgSOgB7H658eRBAB1cWoc5+xd20t6H69IwY6iPneXIommWaRbjVcuF
	Ox/l5tDQ2PJVa2aVJKn7/oRusONstZVR86QHdWV/Lrrapk1lq9k7wB0Ynym7/PYCuYAlJy7J/9X
	5tb93JEIecWs1C+V4fk/K5h5BR86CWO3eRtFcyzfEQ==
X-Google-Smtp-Source: AGHT+IEJoSEzBBK18680/01g1l2aUwqWvDl/KjPOloc2zIqE4/nwdSB6BwLD5+m9xuVjil/8r+NUkg==
X-Received: by 2002:a5d:6f01:0:b0:386:3dad:8147 with SMTP id ffacd0b85a97d-38a221f9ed6mr17745870f8f.32.1735310075685;
        Fri, 27 Dec 2024 06:34:35 -0800 (PST)
Message-ID: <735f8d30-5f42-4fa6-acb0-f82b5b759183@suse.com>
Date: Fri, 27 Dec 2024 15:34:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen: introduce kconfig options to disable
 hypercalls
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241219092917.3006174-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20241219092917.3006174-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2024 10:29, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -74,12 +74,12 @@ obj-y += hpet.o
>  obj-y += vm_event.o
>  obj-y += xstate.o
>  
> -ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
> -obj-y += domctl.o
> +obj-$(CONFIG_DOMCTL) += domctl.o
> +ifeq ($(CONFIG_PLATFORM_OP),y)
>  obj-y += platform_hypercall.o
>  obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
> -obj-y += sysctl.o
>  endif

Personally I'd prefer if we avoided ifeq here:

obj-$(CONFIG_PLATFORM_OP) += platform_hypercall.o
obj-$(filter $(CONFIG_COMPAT),$(CONFIG_PLATFORM_OP)) += x86_64/platform_hypercall.o

Yet I realize this (once again) may be contentious.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -516,4 +516,33 @@ config TRACEBUFFER
>  	  to be collected at run time for debugging or performance analysis.
>  	  Memory and execution overhead when not active is minimal.
>  
> +menu "Supported hypercall interfaces"
> +	visible if DOM0LESS_BOOT && EXPERT
> +
> +config SYSCTL
> +	bool "Enable sysctl hypercall"
> +	depends on !PV_SHIM_EXCLUSIVE
> +	default y
> +
> +config DOMCTL
> +	bool "Enable domctl hypercalls"
> +	depends on !PV_SHIM_EXCLUSIVE
> +	default y
> +
> +config HVM_OP
> +	bool "Enable HVM hypercalls"
> +	depends on HVM
> +	default y
> +
> +config PLATFORM_OP
> +	bool "Enable platform hypercalls"
> +	depends on !PV_SHIM_EXCLUSIVE
> +	default y

Just to re-iterate an earlier comment: Andrew (imo validly) raised concern of
such negative dependencies. As said before, imo we'd better resolve that before
extending the issue (whether by the patch I once sent or something else is then
secondary).

> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -66,10 +66,10 @@ obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo un
>  obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
>  
>  ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
> -obj-y += domctl.o
>  obj-y += monitor.o
> -obj-y += sysctl.o
>  endif
> +obj-$(CONFIG_DOMCTL) += domctl.o
> +obj-$(CONFIG_SYSCTL) += sysctl.o

These two then want to move back up into their normal slots.

Jan

