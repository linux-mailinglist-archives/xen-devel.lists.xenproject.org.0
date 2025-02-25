Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A092A435F5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 08:14:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895423.1304020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmp82-0006DL-Nd; Tue, 25 Feb 2025 07:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895423.1304020; Tue, 25 Feb 2025 07:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmp82-0006Aq-Kc; Tue, 25 Feb 2025 07:13:18 +0000
Received: by outflank-mailman (input) for mailman id 895423;
 Tue, 25 Feb 2025 07:13:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmp80-0006Af-VA
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 07:13:16 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f84648da-f347-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 08:13:10 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43995b907cfso32011645e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 23:13:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8fbb5dsm1248365f8f.84.2025.02.24.23.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 23:13:09 -0800 (PST)
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
X-Inumbo-ID: f84648da-f347-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740467590; x=1741072390; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=imMpuRSvhfJcDKVbUNASMxca1rUMrzV+ZVgH6gUhP8A=;
        b=E8vTOJUqbCmhs6q8zFaegOjtDQPiCyW3sPzsdl+VpuSR2LXjLNDpIMeAti0Gp0tE5n
         cVm6w0g3oRY9Kn6bfjc9EYO1BNDCSrIc9G7iZR5rRL8WFpttehNyrlCpbcpvfGyHNcHt
         dhHirEEjFMs+sjMJEwpnkUExqbJ3YN9V3GlmUcDe3Cj+tPy+n7VMpfacz4poCGdBTdey
         B6M48eWFU0W7S3vTbyeZtAl1Uahgs3w7tpGkvMY16T6+BHJ6HveXCUvdW6V2pwkNk6T8
         zQg54rR0lNZBf8SwiAjbofGWsV6LlARvRY4v87RU261Bd0EPRwKloquhVTJIIWo+4ax/
         C+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740467590; x=1741072390;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imMpuRSvhfJcDKVbUNASMxca1rUMrzV+ZVgH6gUhP8A=;
        b=R6lQJdq9mLmJxLVQ4A8F6VNelGndb5BTNDNc+MlXgCobrQ13amdh29uP9c5HIkbtfg
         PNWF3q+zfoIE9JIO6YqXvb4bp/B9d2LhZohH/34vjTvhfEPAlNup68EdJECzotVBSN2Z
         h5MD5fcsO08XZVYAvkFJeyFzDUkxq3VtGP1DFUo+O/Kn6wmNZNy2TAM3sbPMvEz3W3qv
         9JBXuUl99lWt3+vAOYeFdV98SLteChUsyW2JR8qPtbEPVtStfPZz7bRsTFOsYekLMJAb
         1QCeVYaqKt8cuAPXsj08qlyyfFgQfJRVZF3DcOZ0pPHNbXJ7DGfrG45b4+yGRomxJRm3
         3wCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBb+EPW53eA1olgcpALm1miM522AaVt2vXk9yOpZovF5YL0nAQcZiXGNho326elvNbc34keFKPnC8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwE5mAdMbT4sRYO6vOKt8Aihj/FME47vWZ8JFZCdUY1gp36XlDR
	Pw46v47MtSLyFKY1YoEhQ9JSEtuUDciL/AgiDTMHcBtGGLqIyN9gCKTmJK1piQ==
X-Gm-Gg: ASbGncv6cwlZg7XQp9Kgs7i4/DZycy4uWAZojzKwkHIxAKKtXUmwdhMvugdN9cZmijT
	O6oM4kBvPF0Dh5iI1BGMGHiHS5t/ABlJtXizNYoPDaV5nIj9hAcyPMLZlroq9DWavnnUP1MD8jF
	3p92jAWMAeOa8dlxbM4w5xcjERbtUeFld0P196ZRrhNcABHP9DzKGFhWc6Es4zywpSieWa48P7W
	JVuesYrQiW+kWLOToejZ8Q6VHYNOcSDE3kKCHQ1B/tjMbVNremoDFS+R/REc2d53nAn0EFcl50T
	mKi4+mb5wlFLN6A8oDNlZ2xg/dYMdpQ5yNLU6+Yv9xPz1ALmN3lWVKacWXD9ANQPzPLPtjb9NQI
	CKCi06rlD2rw=
X-Google-Smtp-Source: AGHT+IGKiqV2MHDnSdjUb3h7F5p9akM4QTXd20VIWZMREaWZbAqk1oeCYYfLRfzCoXukPLRirj+CgQ==
X-Received: by 2002:a05:600c:4f85:b0:439:8c80:6af2 with SMTP id 5b1f17b1804b1-43ab0f6601dmr12339935e9.21.1740467590159;
        Mon, 24 Feb 2025 23:13:10 -0800 (PST)
Message-ID: <b6e03e25-2fa3-42d0-9755-61a71466f9b6@suse.com>
Date: Tue, 25 Feb 2025 08:13:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CHANGELOG.md: Finalize changes in 4.20 release cycle
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: committers@xenproject.org,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250224182548.10812-1-oleksii.kurochko@gmail.com>
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
In-Reply-To: <20250224182548.10812-1-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.02.2025 19:25, Oleksii Kurochko wrote:
> @@ -25,6 +30,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>       interrupts instead of logical destination mode.
>  
>  ### Added
> + - Support device passthrough when dom0 is PVH on Xen.

Was this work complete? (I'm truly uncertain, so not a rhetorical question.
IIRC SR-IOV is still unsupported, without which I'd not consider this work
complete.) In any event it's x86-only and hence would rather belong ...

> + - Enable CONFIG_UBSAN (Arm, x86, RISC-V) for GitLab CI.
>   - On Arm:
>     - Experimental support for Armv8-R.
>     - Support for NXP S32G3 Processors Family and NXP LINFlexD UART driver.
> @@ -34,6 +41,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - On x86:
>     - xl suspend/resume subcommands.
>     - `wallclock` command line option to select time source.
> +   - Add Support for Paging-Write Feature.
> +   - Zen5 support (including new hardware support to mitigate the SRSO
> +     speculative vulnerability).

... here?

Jan

