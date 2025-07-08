Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1096AFC60F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 10:46:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036292.1408555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ3y3-0002QS-7y; Tue, 08 Jul 2025 08:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036292.1408555; Tue, 08 Jul 2025 08:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ3y3-0002Nr-5J; Tue, 08 Jul 2025 08:46:23 +0000
Received: by outflank-mailman (input) for mailman id 1036292;
 Tue, 08 Jul 2025 08:46:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ3y1-0002Nl-Tn
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 08:46:21 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04e7b617-5bd8-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 10:46:20 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so3363587f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 01:46:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee475a3asm10875933a12.17.2025.07.08.01.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 01:46:19 -0700 (PDT)
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
X-Inumbo-ID: 04e7b617-5bd8-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751964380; x=1752569180; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=njlzeuybKBabo/g4/p8DIbLJihca99SQ1X6DTXNIP/w=;
        b=WFee6jp9WWksLH9vNLGbF8SAU+8QT1TZmxXE9PJitny8OmhszB+BvJ7xw3RoSCytz4
         6dCRhhugfzilkqmDWtGAllE26HuENY0GUH38OJESQdto6rvhacyVXb+Kailv++oBR0jg
         5p4gaz8LAzWCbhNwLSdZ20S+wOZnrIQNfi2jL9vfuuthcVcQNvWE2qSAiRH3pHmrC3/3
         Q8GMmTonmSFoMuV1wJBtRkdVzkZU/tjw5qrlK4uQVaHne3/MjQkkT7tNmZPLHFjeIyCd
         Am6Psj18ixGlCyjPP3jlS9V+wvX+v4YqHoiFdiB97CxkX259V/8k5BvdoMaLauBG6Dvg
         6OoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751964380; x=1752569180;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njlzeuybKBabo/g4/p8DIbLJihca99SQ1X6DTXNIP/w=;
        b=usbdvYmF6M1/9/i1nIEojH5wqqgJcby5i3zfgm1L5XaDhGxTKqXg/rv9ZjUBi8S06G
         nXCDkFR7o2AgDMnpZXn3PZGiwp26f06k6eCpvxpmjXvCOwACU1YV4veEs+1rg80dOWCz
         WrX7ETb6lrtpZ9/MCFvtC2mWvl6Wbdabt6/R/WEquDvdzs5qTNK1oFLPnAdIVLpKYuYh
         ng3aXhn3lub2fjoS0LTs/Fkc+htlIjuxWBzK0DzKlRxJ5YPF3EQwzQBLoyRk/ClH1wVz
         t/O0D9wD2IfsQJFLQPZbUEFEW3g1hlhOijcsdWK9oZfqfNwBRkvmNINR95fkY10VD/PS
         R1Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWh4Oi8fYIyRfbhBYabqRiQpTfe6+BshJ32/hXj3pAJ9bZsc0jYetDztAOoOHvCHeuXJkTwH+ZOPP8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/uiU0aaGuyXShIL8zBryzUKugicbYk2rM0RFC6zD6Bxpa7Wv0
	lw46zlkZWFY+nkRLuQZrQzE+3ZoutqfFWBk1nFU2LV76dFWf/RmPZmuJQZE0FoCNT7AoPWKuTnn
	/FVI=
X-Gm-Gg: ASbGncttTf9t1Gmug47NRjZlqemsZFCk5poOhcNoSQf+DCZHnWpOpoeBkYaHShudNOs
	OpkIuaoI3+CGKCOPKlUn2tUDkTCkJxsjko9Me1QPAn8n9k3wbpZl7W+RpkGT747JZnG/pN17A8b
	+SxBy9iFceODeyxqwk7Bn0+MIZ4cUG+veRBzjDj94uYsePu8Isxzco9e3UNAHmvhGiLWt4Kr51K
	Xk0Nf+zGJF8UZMX7NtcweRD2Gw4AykQ6PH+bQIhP4CLs7U0kt0FHDvInC8+FR9XR1Y4SO7Ga9wH
	r8YYpHUi9srtIa5NpHoqOVBubxmbvyk6evMMbMLq6kjRTy6HqEgZIJoYMl8fbuHZ8cjwXSui8dK
	C01ObbVQdPJAWOt8u3YnhEFP1A1cR1OQQhndg7Wne2NTt2Uw=
X-Google-Smtp-Source: AGHT+IHA/ui1Yd4ZiP91UZtVEA/yaTtpQTz3PRBSRMKHDVUYhX+Kjy0qHg7teY5HP6CmyfpaX5EZrg==
X-Received: by 2002:a05:6000:24c8:b0:3a4:f038:af76 with SMTP id ffacd0b85a97d-3b49703db1dmr13855050f8f.53.1751964379667;
        Tue, 08 Jul 2025 01:46:19 -0700 (PDT)
Message-ID: <025b2e22-588a-41e4-bed2-e71a42a865ee@suse.com>
Date: Tue, 8 Jul 2025 10:46:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/idle: Implement support for Meteor Lake
To: Alex XZ Cypher Zero <me@alex0.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <2a647ec92d9a66164029c5f8f3c7c8e8f1e06f18.1751916639.git.me@alex0.net>
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
In-Reply-To: <2a647ec92d9a66164029c5f8f3c7c8e8f1e06f18.1751916639.git.me@alex0.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.07.2025 21:30, Alex XZ Cypher Zero wrote:
> Adds support for Meteor Lake C-states. As the spec is identical to Alder Lake as per the Intel specs, I've reused the Alder Lake codepath.

Changes like this want to be done by pulling in respective Linux commits,
where available. Where not available, things need clarifying with more
detail. In particular here, "the spec is identical" doesn't look to match
what was done on the Linux side.

I think I need to go and pick up a number of Linux commits ...

Jan

> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -1148,6 +1148,8 @@ static const struct x86_cpu_id intel_idle_ids[] __initconstrel = {
>  	ICPU(ICELAKE_D,			icx),
>  	ICPU(ALDERLAKE,			adl),
>  	ICPU(ALDERLAKE_L,		adl_l),
> +	ICPU(METEORLAKE,		adl),
> +	ICPU(METEORLAKE_L,		adl_l)
>  	ICPU(SAPPHIRERAPIDS_X,		spr),
>  	ICPU(ATOM_GOLDMONT,		bxt),
>  	ICPU(ATOM_GOLDMONT_PLUS,	bxt),
> @@ -1386,6 +1388,8 @@ static void __init mwait_idle_state_table_update(void)
>  		break;
>  	case INTEL_FAM6_ALDERLAKE:
>  	case INTEL_FAM6_ALDERLAKE_L:
> +	case INTEL_FAM6_METEORLAKE:
> +	case INTEL_FAM6_METEORLAKE_L:
>  		adl_idle_state_table_update();
>  		break;
>  	}


