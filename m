Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10364D12688
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 12:54:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200155.1516154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfGV5-0001x7-1n; Mon, 12 Jan 2026 11:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200155.1516154; Mon, 12 Jan 2026 11:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfGV4-0001vK-VF; Mon, 12 Jan 2026 11:54:22 +0000
Received: by outflank-mailman (input) for mailman id 1200155;
 Mon, 12 Jan 2026 11:54:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfGV3-0001uv-R2
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 11:54:21 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d7a7c18-efad-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 12:54:19 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-432d256c2e6so3012337f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 03:54:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dacdcsm37744762f8f.1.2026.01.12.03.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:54:18 -0800 (PST)
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
X-Inumbo-ID: 6d7a7c18-efad-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768218859; x=1768823659; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jwWw97Vb+USIfgM6nN7v8myQ2HrpTiLfCwyLKZ1PtVc=;
        b=Jn8PRvrLWjVyPIX35TAr8MJYPENJoZU83JJpU21ZTQgt+Ikh/oZfW5KnU8oinrgyVG
         aJtWUWEQRRBeSKmdV0xCuVEPoxvSR6/6UbF/fn7JnI5qG01GQnJXu9bR4CPgZOZz3+ky
         zHKFk142lwE9iIFHcSRSycBD54KDlya0IPgLDSTOFnUDNaW7B/qRktoif3lpBNFF2hrh
         xmm+Myw2qbiiD5UoUDjmImK8Ohn1HJTwbhZZS405PenFPD4ssEqHkCoKiI+lSNOt2d/b
         IOvNX748gKoJJWsR1AEuXy6qbTNeCObCzkcSbYP0+QY9mtSJfqzfxdhuiWnnS8j38DXH
         x8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768218859; x=1768823659;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwWw97Vb+USIfgM6nN7v8myQ2HrpTiLfCwyLKZ1PtVc=;
        b=DXCfSAZY1E4Ha59V4+C6vhnHqgaYi8evQEwhhiCI8ZtJXmRQ+E71UY4narWclWHoyo
         rRPqVPmW0i6205f9MZq/kRTCzLNDkwFk4lTDNscIaKD8N6+f+aXxwjrB8AKkxG9jdlCn
         qHMQ5D52mPC6cXrLVm14nD/FZXtP/RCrY9ejyAAQojJXnMBfxuoMetKrye3BrV/UCt8K
         oAt4QfxOUPDqifq46Bo9ei3i677mxVo34wCgYoFiSTlm7Ye+lCHMqz1SvX+povZxE/oq
         GxvjSG1fzu2dPUIr3xkGqZSk2Bu9KUbwxEw+gA9FD+mn22tPWgYV//XjLuhlS/f9KZzt
         cIxQ==
X-Gm-Message-State: AOJu0Yxt33mplqcvHdtExctXDGhAQQiTr0V+hYNHITh9QvvMZYk1yKzF
	5Zrn5sYKoHjEnh75QY2adHbJm3gfMd8PTXu95bjj0PL4550nUXRXSPaAKH9M7BSMmg==
X-Gm-Gg: AY/fxX5GKVJhalTjuZOYh6eEM9pNfZtKgZ9a7hzfDYFGaqAvru/fu8foj+h60R8zsKn
	XiCZAb5ehCjpt9zcE6IJCxC0urum2nQfIQ0f7lfJ4tXn7jhB/U210EdwBnkFeT6jWkuXYCfYlr4
	Z4PpJKMrVHxNgRlwVQr6Crei+c1giJ0SpIeUhK0aXNA+tmVs8UlvG3wmyg/3LVIKWHKX6b8HhX4
	ny0xEgXxhGY9N17c76pjJl7FCDvGN0Ho+7Fxh0EQGz778ymbz00AtJIkeFxWx5R/xovnBe+OkeY
	0LgfPxrOAhYRrqiZ9NyUtJbPu2tHowlgbLU9RfTWn4kZNOlkTAp0uXchHkOg5VKibcDgXbzcwyX
	ZrCZNR2bRuXurR/yPTUUraJKQsjeiFCq9FVpcKWivaMMtsKcO0mFGCv9b/vovn3fqlORYsOXaF8
	i3Hyj01BB2q9Oo8Xqy2lNATQIGK/wOfmvF0SzyO7qBJYe6LsbM3wxOdHVheycO8ixMUAbamLRsw
	uA=
X-Google-Smtp-Source: AGHT+IFjM82r+52sJgkVCHt24myO6WA2E9TdFudM88b1vqjNcHFBHjC5BLtkqMznB0tWm0/n9brmGQ==
X-Received: by 2002:adf:fe8f:0:b0:430:f97a:6f43 with SMTP id ffacd0b85a97d-432c379f3c9mr18414287f8f.53.1768218858820;
        Mon, 12 Jan 2026 03:54:18 -0800 (PST)
Message-ID: <87031758-8385-4b06-8c96-06457992755b@suse.com>
Date: Mon, 12 Jan 2026 12:54:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] xenpm: Don't build outside of x86
To: Anthony PERARD <anthony@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <cover.1766158766.git.teddy.astie@vates.tech>
 <77dc07c4b4431fb53aa5b226d302f437e4314d8c.1766158766.git.teddy.astie@vates.tech>
 <aV6CwQx3sNuIMbxl@l14>
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
In-Reply-To: <aV6CwQx3sNuIMbxl@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.01.2026 16:58, Anthony PERARD wrote:
> On Fri, Dec 19, 2025 at 03:42:17PM +0000, Teddy Astie wrote:
>> --- a/tools/misc/Makefile
>> +++ b/tools/misc/Makefile
>> @@ -23,13 +23,13 @@ INSTALL_SBIN-$(CONFIG_X86)     += xen-lowmemd
>>  INSTALL_SBIN-$(CONFIG_X86)     += xen-mceinj
>>  INSTALL_SBIN-$(CONFIG_X86)     += xen-memshare
>>  INSTALL_SBIN-$(CONFIG_X86)     += xen-mfndump
>> +INSTALL_SBIN-$(CONFIG_X86)     += xenpm
> 
> Nit: I would sort this by taking the dash `-` into account since we do
> so for the arch-common list, so xenpm would go after xen-vmtrace.

Not really; imo it's coincidental that all present x86-only ones have a
dash. I think this simply wants to ...

>>  INSTALL_SBIN-$(CONFIG_X86)     += xen-ucode
>>  INSTALL_SBIN-$(CONFIG_X86)     += xen-vmtrace
>>  INSTALL_SBIN                   += xencov
>>  INSTALL_SBIN                   += xenhypfs
>>  INSTALL_SBIN                   += xenlockprof
>>  INSTALL_SBIN                   += xenperf
>> -INSTALL_SBIN                   += xenpm

... stay in its present place, merely becoming conditional.

>>  INSTALL_SBIN                   += xenwatchdogd
>>  INSTALL_SBIN                   += xen-access
>>  INSTALL_SBIN                   += xen-livepatch

The three entries with dashes quite likely were blindly added to the tail,
without paying attention to sorting. Imo they want moving up into their
respective positions.

Jan

