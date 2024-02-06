Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA91A84B61E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 14:14:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676911.1053262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXLGu-0005f9-QU; Tue, 06 Feb 2024 13:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676911.1053262; Tue, 06 Feb 2024 13:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXLGu-0005da-Ml; Tue, 06 Feb 2024 13:13:56 +0000
Received: by outflank-mailman (input) for mailman id 676911;
 Tue, 06 Feb 2024 13:13:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gccX=JP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXLGs-0005dD-Co
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 13:13:54 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92274308-c4f1-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 14:13:51 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40f02b8d176so48632555e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 05:13:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fc19-20020a05600c525300b0040fcaec04b8sm1996152wmb.22.2024.02.06.05.13.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 05:13:51 -0800 (PST)
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
X-Inumbo-ID: 92274308-c4f1-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707225231; x=1707830031; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w/RTkzwejvO8GT5sxjE1uL/S79JQp+vP3t+IpcqvOSI=;
        b=Ee0Td7hBxJrBVk2VlNHu2BNxBhHTitSiKBhWUoO0tyI+ZdgqxDG1E0MM67RjXfn20l
         k1DkqkU2xJBG9fPV2agJV+X1ueQXyOaK09WunF7ZUWX6pLuwlt+Qrv25eJ6Q7vBCmjcR
         iW0zvcdXH6v7YVXHPeLMxbEmnTSDB3zmqnjuDPh59/dy0MOENzYnYq/N3hRBChJ/9HVs
         Yh1moiTIE9QcXUNt46RzE0Q0QoJgn0UzHLzlDR5FXcnXl/sENJzjUCEUjok35arqKv1z
         7BO+54+PCjB2eIysbxVcq33O7jLaxuTmg0CR0/T4Stnrgk8mjBT8Nn6ptZ3hkyzVFHoD
         wwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707225231; x=1707830031;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w/RTkzwejvO8GT5sxjE1uL/S79JQp+vP3t+IpcqvOSI=;
        b=BXbu46f+/grZfVRQwI4BNAExmdNvZPChdoGwUmWpIg+3lz1mWvdnOCYTExQxBHg0Fr
         Q30ErUbzKq2JvsBQWG8GRkQ4nePNO/HgnrdxpS0bL35mO3SOUF1xXs1q+nkATErBIygj
         pInT/ijnmLtn6IyB7lwJQtGlZFM6IfnT6xAjmJjOBJJ/vIcdWklMtyTF25i3MgMrH/F1
         YtLeo6ZNgRaf3xRtwJIi1ut587teLXDQTvDOMPSLYI66DSJHsg0Q33biIPr4dXFr3W7E
         opkkiG2fOwHtPJYCtivGyp9p9/ypcT1pM3nyGvxvYS+vpLy+iorvvHr2Lx8SH4JNokkz
         16cQ==
X-Gm-Message-State: AOJu0Yw/I3GhV+l/rfZUK42dCMt9rbqyiL/2/IU9qcdAYLNM9QPxmT7z
	dsJSFloPP04p/7uD8k7HOFZZd1lYv5/re6bxk0hj2HePj/1J2gzPVNCPbb4BAw==
X-Google-Smtp-Source: AGHT+IENXEYRmfoz3vzYurbgEB9BslGMtuJvh8RijiU02++tGp9rzba9fbp+S95ZlW8JktcIFDuhRQ==
X-Received: by 2002:a05:600c:4f53:b0:40e:f693:94f6 with SMTP id m19-20020a05600c4f5300b0040ef69394f6mr1962721wmq.35.1707225231676;
        Tue, 06 Feb 2024 05:13:51 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVgbweWNOu1465ZembDIY5p07eJyABHlEzCe31bKXNZR2ClswGWLF9LCuOqpQTDwHzERb88dIrQMATBlHi6BhbttRnRzxJPsxJtyIddzWzbgrIOKX/bpfHS5Dy/PEkVwJLZPiKzPTvkOfotxXBGDESGrZwz9jFR2gbRPOCAW2a16ovUsf8SfvEGYVcVIHqnJD3gDY23JzHqoKTWiRGmuvJYd3ci
Message-ID: <b23ffbf2-e1b1-42f5-b0ea-9f0889a5a7af@suse.com>
Date: Tue, 6 Feb 2024 14:13:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 3/4] xen/x86: address violations of MISRA C:2012
 Rule 13.1
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1706886631.git.simone.ballarin@bugseng.com>
 <16bb514ac0a5fe0d6e9a2c95279a8200ff4495c6.1706886631.git.simone.ballarin@bugseng.com>
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
In-Reply-To: <16bb514ac0a5fe0d6e9a2c95279a8200ff4495c6.1706886631.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.02.2024 16:16, Simone Ballarin wrote:
> Rule 13.1: Initializer lists shall not contain persistent side effects
> 
> This patch moves expressions with side-effects into new variables before
> the initializer lists.
> 
> No functional changes.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

To be honest, I don't like this. It's more code for no gain. Really its
hampering clarity imo. I'm willing to be convinced otherwise, but for
now this gets a nack from me.

As an aside, ...

> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -2559,9 +2559,12 @@ integer_param("max_gsi_irqs", max_gsi_irqs);
>  
>  static __init bool bad_ioapic_register(unsigned int idx)
>  {
> -    union IO_APIC_reg_00 reg_00 = { .raw = io_apic_read(idx, 0) };
> -    union IO_APIC_reg_01 reg_01 = { .raw = io_apic_read(idx, 1) };
> -    union IO_APIC_reg_02 reg_02 = { .raw = io_apic_read(idx, 2) };
> +    uint32_t reg_00_raw = io_apic_read(idx, 0);
> +    uint32_t reg_01_raw = io_apic_read(idx, 1);
> +    uint32_t reg_02_raw = io_apic_read(idx, 2);

... while you properly use uint32_t here, ...

> +    union IO_APIC_reg_00 reg_00 = { .raw = reg_00_raw };
> +    union IO_APIC_reg_01 reg_01 = { .raw = reg_01_raw };
> +    union IO_APIC_reg_02 reg_02 = { .raw = reg_02_raw };
>  
>      if ( reg_00.raw == -1 && reg_01.raw == -1 && reg_02.raw == -1 )
>      {
> --- a/xen/arch/x86/mpparse.c
> +++ b/xen/arch/x86/mpparse.c
> @@ -798,11 +798,12 @@ void __init mp_register_lapic_address (
>  
>  int mp_register_lapic(u32 id, bool enabled, bool hotplug)
>  {
> +	u32 apic = apic_read(APIC_LVR);

... why the being-phased-out u32 here?

Jan

>  	struct mpc_config_processor processor = {
>  		.mpc_type = MP_PROCESSOR,
>  		/* Note: We don't fill in fields not consumed anywhere. */
>  		.mpc_apicid = id,
> -		.mpc_apicver = GET_APIC_VERSION(apic_read(APIC_LVR)),
> +		.mpc_apicver = GET_APIC_VERSION(apic),
>  		.mpc_cpuflag = (enabled ? CPU_ENABLED : 0) |
>  			       (id == boot_cpu_physical_apicid ?
>  				CPU_BOOTPROCESSOR : 0),
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -885,13 +885,14 @@ static struct domain *__init create_dom0(const module_t *image,
>  {
>      static char __initdata cmdline[MAX_GUEST_CMDLINE];
>  
> +    unsigned int max_vcpus = dom0_max_vcpus();
>      struct xen_domctl_createdomain dom0_cfg = {
>          .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
>          .max_evtchn_port = -1,
>          .max_grant_frames = -1,
>          .max_maptrack_frames = -1,
>          .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
> -        .max_vcpus = dom0_max_vcpus(),
> +        .max_vcpus = max_vcpus,
>          .arch = {
>              .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
>          },


