Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37473A77E32
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 16:50:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934533.1336212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzcw7-0002d1-4h; Tue, 01 Apr 2025 14:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934533.1336212; Tue, 01 Apr 2025 14:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzcw7-0002b3-0r; Tue, 01 Apr 2025 14:49:55 +0000
Received: by outflank-mailman (input) for mailman id 934533;
 Tue, 01 Apr 2025 14:49:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzcw5-00028a-KZ
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 14:49:53 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90ee4f11-0f08-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 16:49:51 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so36888225e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 07:49:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a41f5sm14158388f8f.84.2025.04.01.07.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 07:49:50 -0700 (PDT)
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
X-Inumbo-ID: 90ee4f11-0f08-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743518991; x=1744123791; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bf4xWtutcIU0nIWyeM8P8wncGvIAGEevQlSWy4SuPjA=;
        b=C1E6hs4zZ2NST/pONrR0Jw4k+1m5tkK3AtRKYCXS1WA7hc+NwmTei21siagL1j3sAC
         Lg76UsusE/WstFlLc0cTPicvMeucAD4bZ++CD/iHUcgI+psVHWh8a6OQxpcq2/+cAyoX
         KbNRM/ealhtTiYxqIZh2QDcoWF397a9/B3FIFJUmmYIxmW9TqmcOsfp8u6NDgYvyYicF
         5B7TWVYh/LwCrnsnP7DocW6DQz+MO16xdj4AmR8KzZ6KsQkAgAr/WaTcDxiRRmP7GOLR
         7CAfvudnSgm8jPwEY4qKnRWTR/9lhZnf4t69JJL3Qxhh73T1DzLUvnwRsjnromSxlBWj
         rMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743518991; x=1744123791;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bf4xWtutcIU0nIWyeM8P8wncGvIAGEevQlSWy4SuPjA=;
        b=eSZiN/sdWmPiq5GQr5iqXi0xLGm7OCsJOorM6OJA/En85x60TWsTu2J92daKsr3ckk
         phQ2/gaYJfBX5ToWLRJH/++xnqDhUSnJ4tWXX3rmxlslcXNmwsVVeD9jpkTaP5D1HhC+
         lQIR6I+6rm3zCqXcd3LzovIpV3KTEjUNoa8Vv0QVhog2Ql97ZfewHzByOpAcCA0Opfc7
         Y2xGhYUfQMYpCkCgawjpl8oYiMpcwHIiUSevy+Aw0VIRGl7wrfXisQWKpCorBKgtt0v7
         vg+Ui6u0rrent7HsNEznr1vbsRhgHRcjv3JJ9KhsR4wDtrIOUJmlDwGOCx7ysr/Yb+Sq
         Qg8w==
X-Forwarded-Encrypted: i=1; AJvYcCVL1HOUP4nnPxf+vV7oDzn5fCYWPfzf935CMqBKIpzHEyX61JbqxE27z6NYbKUsCmt+M4yg4/5h8VI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywklaskc7MqTE+2uuXXM8AzYJ4u0s7xxbfK3mt9YrvFgoJasZof
	l+bWCLdtvBpQnI6EbuGS8WrPjHRlu0eNvcZvaahgBRJoEVYfsn3elR748xke6A==
X-Gm-Gg: ASbGnctp7Hd19qVW6oWU9M/Nif/UrRm61KUDPqnG7xKifwzJqGNMdXk46sr/FQXwHhX
	j9jLYju4VhXHWVF03shQt0E5H+z4cvLna9w1y5OjYd0Ot5TCGdjO4i4asaMj4VHRCGcohNqXIyy
	Xootoak01+tAIEYNA8Zv5iDM0LTFubfXzg8YSSkdMm/Elfe6eRYUIMmgcSmz3wxiT5fYNbmKPSb
	VYajPX8LHzxnN7FdnjACYs/objDc8VuGHVLjlohr71yekuVvHEnvvRNOhQeRpSQedXqTB8ufn5j
	/6tUGVdH+TOaq8Q5p5LBpr3yULQZ5RYaGXdtODwQZLI9xILkBcB6agWeR532q1ogIsYk+ay4T6+
	poG0iioJg4PQ7pWKh4QR5dNyQ5CPeGg==
X-Google-Smtp-Source: AGHT+IE/KyBhInVGibA+sbRLDo1czCrkiOmrJ3LyC5soQg7zujsoLTFtmBHZvHUetzNAIkFTjtneFQ==
X-Received: by 2002:a05:6000:178c:b0:39c:2264:fb22 with SMTP id ffacd0b85a97d-39c2366b028mr2691598f8f.46.1743518991020;
        Tue, 01 Apr 2025 07:49:51 -0700 (PDT)
Message-ID: <8a1bc63a-125f-424b-87bd-acd608fdab73@suse.com>
Date: Tue, 1 Apr 2025 16:49:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/19] xen/sysctl: wrap around sysctl hypercall
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-20-Penny.Zheng@amd.com>
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
In-Reply-To: <20250326055053.3313146-20-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2025 06:50, Penny Zheng wrote:
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -69,7 +69,7 @@ obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o
>  ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
>  obj-y += domctl.o
>  obj-$(CONFIG_VM_EVENT) += monitor.o
> -obj-y += sysctl.o
> +obj-$(CONFIG_SYSCTL) += sysctl.o
>  endif

Same as for the respective x86 change: Imo this needs to move out of the
conditional again, back into the normal list of objects.

> --- a/xen/include/hypercall-defs.c
> +++ b/xen/include/hypercall-defs.c
> @@ -195,10 +195,12 @@ kexec_op(unsigned long op, void *uarg)
>  dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
>  #endif
>  #ifndef CONFIG_PV_SHIM_EXCLUSIVE
> -sysctl(xen_sysctl_t *u_sysctl)
>  domctl(xen_domctl_t *u_domctl)
>  paging_domctl_cont(xen_domctl_t *u_domctl)
>  platform_op(xen_platform_op_t *u_xenpf_op)
> +#ifdef CONFIG_SYSCTL
> +sysctl(xen_sysctl_t *u_sysctl)
> +#endif
>  #endif

If you don't move this out of the enclosing #ifdef, I don't see why you move
it at all.

> @@ -274,8 +276,10 @@ physdev_op                         compat   do       hvm      hvm      do_arm
>  hvm_op                             do       do       do       do       do
>  #endif
>  #ifndef CONFIG_PV_SHIM_EXCLUSIVE
> -sysctl                             do       do       do       do       do
>  domctl                             do       do       do       do       do
> +#ifdef CONFIG_SYSCTL
> +sysctl                             do       do       do       do       do
> +#endif
>  #endif

Same here.

Jan

