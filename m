Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E9C9EC5EF
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 08:49:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854013.1267326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHT8-0005OA-RC; Wed, 11 Dec 2024 07:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854013.1267326; Wed, 11 Dec 2024 07:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHT8-0005MN-OI; Wed, 11 Dec 2024 07:49:14 +0000
Received: by outflank-mailman (input) for mailman id 854013;
 Wed, 11 Dec 2024 07:49:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLHT7-0005MH-9G
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 07:49:13 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 689706ff-b794-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 08:49:11 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4361c705434so2567825e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 23:49:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef2700bb9asm12900735a91.19.2024.12.10.23.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 23:49:10 -0800 (PST)
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
X-Inumbo-ID: 689706ff-b794-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733903350; x=1734508150; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YfmqqyM7+ybeKmdpaT8e8CdFNymTsVJO6P0YDkmCAXE=;
        b=aYdxVt61Lq71wiP12bxofLGPD6T0ZE71sRbkc1qRZ5jJOFlPlNlpB0ZPW2rFNEW5ND
         Y346hoVfl2ZgoGD/AhGM6TuZOWAn8yD4VtghZpCiQGzJ/A4/8lPoZvRx/ASp7QY4a0LL
         tRrf6HzweGM1RLkZ+OS0kdJ7Yn9ns7LaGqinxG3NJe4kuKMTzszayhvhBQLNTQE/uTYr
         ZN6qBczmf7TEZj/XOP3jAa05D/50xvrud9X86jiNVLHOsdmCJnELmnffvasXDOCNQuIb
         gDYdDEdqzfeqL5rMfB6mviF0SPJWdzbHAZwXUlNGvf85LIKigjPVNb08IN1Hz0xNLpta
         kRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733903350; x=1734508150;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfmqqyM7+ybeKmdpaT8e8CdFNymTsVJO6P0YDkmCAXE=;
        b=Y/n0IFvlKnv2fmT5B/QqJjhkd8d08wFhSVco4R0GU/LcT2af/Ro8fd89/bBTl+HsF7
         etbZz0k3EIOBbNDFfoHuQnI+sQGm1MgsnXNP1ePCQT+5xfAJIHON1gxUoOnd0HSW4m9/
         mgzkTrlwbaVslE2sGMVwjgRzaLniTVAqyMzvY8b4WGzAeXW2Aq6yRAag4SJpVUazzXg9
         GkJB8A0chvE/Lvv3/F3+MNBSjiJ093PsEUnkEw283Q4oS+4Up2oeiVeXUFrI1O2jr/lX
         xTpfkI5jG6byRp9fIGTtHlI4jq1t5abSrwtt1QHGcippf+5zVXJTVPgWWZzO3DJma6eA
         TSXA==
X-Forwarded-Encrypted: i=1; AJvYcCXI0stEaTGkMrltG1sGPGPXXyqKvB5F1XRFKgX5pcXonZ8jgCsI9iIy3p67V8gAH2K67WGyqRC/C38=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysgzUrQckvkMTK5WUfMUSTwCjT/8lypYarHPOjyXd43EosSJ66
	Y5vG0PtGTwUmWV7ajGcyORnE+oLuQoXraHU76fht49nU29r4MUSssjpuTturxQ==
X-Gm-Gg: ASbGncsES9ECrR9+Jv8W0jgeww9MShWXR0ZJoKW7+ky6Q4/vr9WkKuujZd8wbPYtwWK
	xgsjEFqmo/yfoLPe5cZa0fF2pNpj91iLpgKeGSIoZyo3aZdWEpvljL7/bkAwFY9/nkfH/mxatZ0
	m3x6vKaKE1JVQ8GlDBh/MtXH3/z2QdDgha0cMoD092+HTkmhEM+a6hr+IPPf/06EULQqKOl1i8o
	MFGcPzVudWucfyqIyEuc7VZBQHB8QU0DloyZDyE6zbcjSsNnHhvQXoTpctq3Y+bzEFpJoOBY+eu
	oMwVGQYtMzhGt3IQrtcIiYTmRfEKez1gWy2wRcs=
X-Google-Smtp-Source: AGHT+IEVDCxU28Pl+GetfoEJREW01k+uw+1DriVfuOiYtS1vhAwfBZm6TTQ1DWH8QQE6MndaMgTvlA==
X-Received: by 2002:a05:6000:184d:b0:385:fc97:9c63 with SMTP id ffacd0b85a97d-3864ce894a8mr1471863f8f.9.1733903350573;
        Tue, 10 Dec 2024 23:49:10 -0800 (PST)
Message-ID: <c5346fba-f63b-4275-b0ee-1d7e47059c17@suse.com>
Date: Wed, 11 Dec 2024 08:49:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] common: remove -fno-stack-protector from
 EMBEDDED_EXTRA_CFLAGS
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
 <20241211020424.401614-2-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20241211020424.401614-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2024 03:04, Volodymyr Babchuk wrote:
> This patch is preparation for making stack protector
> configurable. First step is to remove -fno-stack-protector flag from
> EMBEDDED_EXTRA_CFLAGS so separate components (Hypervisor in this case)
> can enable/disable this feature by themselves.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/stubdom/Makefile
> +++ b/stubdom/Makefile
> @@ -14,6 +14,8 @@ export debug=y
>  # Moved from config/StdGNU.mk
>  CFLAGS += -O1 -fno-omit-frame-pointer
>  
> +CFLAGS += -fno-stack-protector
> +
>  ifeq (,$(findstring clean,$(MAKECMDGOALS)))
>    ifeq ($(wildcard $(MINI_OS)/Config.mk),)
>      $(error Please run 'make mini-os-dir' in top-level directory)
> @@ -54,6 +56,7 @@ TARGET_CFLAGS += $(CFLAGS)
>  TARGET_CPPFLAGS += $(CPPFLAGS)
>  $(call cc-options-add,TARGET_CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>  
> +
>  # Do not use host headers and libs
>  GCC_INSTALL = $(shell LANG=C gcc -print-search-dirs | sed -n -e 's/install: \(.*\)/\1/p')
>  TARGET_CPPFLAGS += -U __linux__ -U __FreeBSD__ -U __sun__

... this stray (and wrong) hunk dropped. Can likely be done while committing.

Jan

