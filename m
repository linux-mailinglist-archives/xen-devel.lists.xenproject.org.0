Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0479C3B67
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 10:53:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833452.1248604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAR5X-0002QB-Gq; Mon, 11 Nov 2024 09:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833452.1248604; Mon, 11 Nov 2024 09:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAR5X-0002OK-CC; Mon, 11 Nov 2024 09:52:03 +0000
Received: by outflank-mailman (input) for mailman id 833452;
 Mon, 11 Nov 2024 09:52:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAR5V-0002OE-Q6
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 09:52:01 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 973b6e19-a012-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 10:51:58 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43167ff0f91so37787995e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 01:51:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa5b5fb1sm213944345e9.8.2024.11.11.01.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 01:51:57 -0800 (PST)
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
X-Inumbo-ID: 973b6e19-a012-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC13bTEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk3M2I2ZTE5LWEwMTItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzE4NzE4LjE3ODM4Miwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731318717; x=1731923517; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NxDbsYYmTyK4GLQIdZ0EG7BslDm6UFCW/AUHCbeebxA=;
        b=fkk4g/gjU+X2mg0dufy+GJpSYRw8+ykxbObghm1tPy4ShwIOk1qaQNTdwBd5vFRcfs
         AJbByk6c74YfYoacRCBCQvPcqZSH09MDaPVr4BF8x4DVMo0Dxcl30Y3auQaqjNwsm/JS
         x8wW/tx0cZtHN4yttbtiphFGmCxmrjk43Yx0eChjYgPGUbskvligfosKdjKiyrKkOyTf
         X+JprkbHm1z9Bgcujp4raerXSoxZ6ldxHBIyDZqpvQuatZbYpVbwdPYc7mwIQNy2kh03
         D0jS5sZ/zSlE1M2/k8oiFqGcS6ey3dSvn1fwtIvJtH5WcZ3EnQQHY9ZyHNhuGiaY84Zk
         A7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318717; x=1731923517;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxDbsYYmTyK4GLQIdZ0EG7BslDm6UFCW/AUHCbeebxA=;
        b=bqiyDWvmNaiQj3B4+w63w2KKXIwawiTVyzYUE6lbLLBlgJfrBP4lh0AV6bw2cf0/hS
         KaHnclinjAzd7VZt8Zq94KgECI6/s4YoBAf9P6oVjARTlYcNgrUUosmNrCiioMRZeyWv
         dI/GlW/laeL4F7kHXzrCnitqd6vLgHWWmicI1vk4+3mq+XKO48UbZ0vAajJIRJRrXgfM
         BlJo5jT97jnJCqPGerCSZ1suz7RI55CSkzkYWS0qUsfvsR2Q2aN02gpVrUuLtdiQ7j1P
         TKHJChvYsW3FJ5MbzL8ro72ZZvxHxsLPW+yojzeGssX2SznUr2sbvMpaerh60hvDgf1B
         hZlA==
X-Forwarded-Encrypted: i=1; AJvYcCVQEwiQejks/FHQSJ9IT7wifhZAIO4nNqnNpV2kTg8LVhxkFSys5m89dBC7GmJLeEWjuQjCscFugG8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0AYhaDamn/HGYRIp/LIzzG3zS5PCi09aoBYGTljz93D7Z7neo
	N/9h43J4uE9CWwkPmip7ps5uU5BSKiFQicq5QW2SFiVKK6l2uR0CtpQX829JhA==
X-Google-Smtp-Source: AGHT+IEbdUqgXJcAgC4jdb52mcSRqEBT8CKz5HIQE/jiVaIWCYb+KYBF37M74E6g5rzPoRdwrvEayQ==
X-Received: by 2002:a05:600c:3586:b0:42c:b74c:d8c3 with SMTP id 5b1f17b1804b1-432b7522c60mr90092735e9.32.1731318717457;
        Mon, 11 Nov 2024 01:51:57 -0800 (PST)
Message-ID: <34a2d071-59a8-46eb-a9fd-516cce801343@suse.com>
Date: Mon, 11 Nov 2024 10:51:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/2] x86/hvm: introduce config option for ACPI PM
 timer
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1730887415.git.Sergiy_Kibrik@epam.com>
 <da2758bba96e247027106e13129c87ae31193e97.1730887415.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <da2758bba96e247027106e13129c87ae31193e97.1730887415.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.11.2024 11:14, Sergiy Kibrik wrote:
> Introduce config option X86_HVM_PMTIMER and make pmtimer emulation driver
> configurable and possible to disable on systems that don't need it.
> Option X86_X86_HVM_PMTIMER depends on HVM option, because this driver is part
> of HVM support code.
> 
> Introduced additional check of domain's emulation flags, to cover the case
> when user explicitly states the requirement of emulated devices that are
> disabled in the build. HVM always require these devices to be present so domains
> of this type can't be created when pmtimer or any other emulated device are
> disabled.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>

What exactly was it that Roger suggested? I don't think it was what the patch
does overall, but just _how_ it is being done? That makes quite a bit of a
difference, as the former could be read as kind of an implicit ack to what is
being done here (and also in the other patch). Issue is: I remain unconvinced
that this conditionalizing is actually something we really want/need.

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -144,6 +144,19 @@ config INTEL_VMX
>  	  If your system includes a processor with Intel VT-x support, say Y.
>  	  If in doubt, say Y.
>  
> +menu "Emulated HVM devices support"
> +       visible if EXPERT
> +       depends on HVM
> +
> +config X86_HVM_PMTIMER
> +	bool "ACPI PM timer emulation support"
> +	default y
> +	help
> +	  Build pmtimer driver that emulates ACPI PM timer for HVM/PVH guests.

Does this really affect PVH guests? Isn't the whole point of the change
that in a PVH-only environment this wouldn't be needed in Xen?

I wonder how meaningful "pmtimer" is to someone reading this help test in
isolation. I'd just drop the word.

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -742,11 +742,16 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>  
>  static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>  {
> -#ifdef CONFIG_HVM
> +    const uint32_t disabled_emu_mask = X86_EMU_PM;
> +
> +#if defined(CONFIG_X86_HVM_PMTIMER)
>      /* This doesn't catch !CONFIG_HVM case but it is better than nothing */
>      BUILD_BUG_ON(X86_EMU_ALL != XEN_X86_EMU_ALL);
>  #endif
>  
> +    if ( emflags & disabled_emu_mask )
> +        return false;
> +
>      if ( is_hvm_domain(d) )
>      {
>          if ( is_hardware_domain(d) &&

While you commented on this hunk, it didn't become clear what exactly the
resulting new hunk would be. I question in particular the change to the
#ifdef: If that's changed and the BUILD_BUG_ON() kept as is, the comment
also needs adjusting. Yet it would perhaps be better of the BUILD_BUG_ON()
was split accordingly.

Jan

