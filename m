Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E186D2CE01
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 08:04:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206217.1519900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgdsS-0000kH-GR; Fri, 16 Jan 2026 07:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206217.1519900; Fri, 16 Jan 2026 07:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgdsS-0000hK-Dh; Fri, 16 Jan 2026 07:04:12 +0000
Received: by outflank-mailman (input) for mailman id 1206217;
 Fri, 16 Jan 2026 07:04:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgdsR-0000hC-0u
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 07:04:11 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d6327f6-f2a9-11f0-9ccf-f158ae23cfc8;
 Fri, 16 Jan 2026 08:04:08 +0100 (CET)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-47fedb7c68dso11058775e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 23:04:08 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a3e:55b2:6ac3:5c03:be67?
 (p200300cab70c6a3e55b26ac35c03be67.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a3e:55b2:6ac3:5c03:be67])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356992681esm3366346f8f.11.2026.01.15.23.04.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 23:04:07 -0800 (PST)
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
X-Inumbo-ID: 8d6327f6-f2a9-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768547048; x=1769151848; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2/uxT1IsHyoq40vUl8mHMMfSOqv4Eb1xS5Yuvea9w5E=;
        b=E4+BofxQo1L1VFyVj5B/O2RQM3qFoDyfeAVMPJY9OBj9MBs2UcA55AOpvoY1EgHxEh
         ChH4e+cYhl89tLShFgF4KS8NNcKB9D5o6Zi9osHKS9aluwk6RrMGZQ8OwNQ8FkUDkr/A
         kUbhvqqXbxflrOJkerFrG/Da9l36yKkb9IL/OI1z+eN41O95Yb6AZBdQwt2eEoUiRlBf
         8obI/eNwlvjeVsup4qci8ELntyDR+gqFwFMXhdtIA8DZVPWXXcWrEvdd5ip92LJRa76n
         GYVgm0+TaR4kL4lSZicIxvZ1BY72GfhCUulyTooho46K9tp2Uas0qXJmqE7VfIubgMxS
         rIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768547048; x=1769151848;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/uxT1IsHyoq40vUl8mHMMfSOqv4Eb1xS5Yuvea9w5E=;
        b=Sc6kC10j4xip6iOb1RjBlfFNlWtB4T1CEccNROvaz7TCvl/eIMfKUxxYQFLsqPV1VU
         sAMPaNzchZDVFt+sOdOuuC4kTHexfSji1/AIKIzQoji4yMEnEtuZBJoYjniUsjQ3Q580
         /jl1+2+eO8JzSbib1YZOoxAK3/r2Xhh98QJqrxFm1eGrCQk0O9VppOjigys+qI0WqVKX
         DdD7+HMqbS9X+5Cbp5vEp5phez5Z7kuJtfgqHRYtkrFE/yjvMs0WNXi5eytF/k/+vu5E
         xJp8+0g1M5gLvss6xH0qevtrcxevCfbXazKbKMH6RyxsCpbhUpAH8EIDGeWbk/vA2Wui
         FaUg==
X-Forwarded-Encrypted: i=1; AJvYcCW7Ry34IZy6bwsNIJO8P7mpBlsEnmuMrxopYnv1rUYeppH8wrvVI5/O7K5Ph6FTXgdNEecUbzfaT0k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxeUv3TYTcR1cPYY3yb1ubGNyGjeT+5YK/KMJxO1YXv/vVLh4ok
	rx0iDSjVjm7AryubSVIP7PbVHpN8N1Ne5e5RQyXkrxiL4ErnnSlMkbb5BpvWjk0lLA==
X-Gm-Gg: AY/fxX7r6tSitr9PColIGcM+82LW8tLHFFRGP4itK95N2pde9b4i71EB44OisojZ0I1
	xK9BXpIYaq+iCTsHFr0D0OXaxKW5jssAi2k+TCUGgjbMU8/ZcgKrqsxuVD/NQr+s7KGJLbaMJf9
	BLw2ltQ9FquBywQFCJoaEqV+7mXNALdcRalpoMKs12GF20fJlnbQZ6l1p93I0+0LaF+Jcf01sW1
	xENl3XaepnlLqlCvJlTwOGFI0IVAiSuV5W0XluVGYuKrIW3G3A3tUDS6u59+0pwLQcXy0S19ywb
	Hb3GPko2vBERlAlRixaQzMW7kvTq/qjY5a3L4ptsbwo4SW9s8TNIr5B27WLUBpBYKcmG4xlm6hp
	Rn5uZlo8Iv+UO1L1zG7g1xVY0m34mGXuqXoGeC9Wqsrpvy5gO6sfJYG6WOYvxOib3ywSGUAfOQO
	y07tUAC47TNqHNEdCe4MvSm/tj621Kzo9hxRPN54a/P6rQkdiFYVTt8fd/2XWfublqlswDVcXr7
	oq9bWaTXP9z5HHp6GD4mxyyDL2v9teF4Oaj7wC++HSQo/ig
X-Received: by 2002:a5d:5f96:0:b0:431:a0:7de0 with SMTP id ffacd0b85a97d-43569bc1928mr1889259f8f.35.1768547047369;
        Thu, 15 Jan 2026 23:04:07 -0800 (PST)
Message-ID: <09c0007b-3cac-469a-83a0-726c1be149da@suse.com>
Date: Fri, 16 Jan 2026 08:04:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] INSTALL: remove unsupported XEN_CONFIG_EXPERT from
 documentation
To: dmukhin@xen.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20260116030842.415583-2-dmukhin@ford.com>
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
In-Reply-To: <20260116030842.415583-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2026 04:08, dmukhin@xen.org wrote:
> --- a/INSTALL
> +++ b/INSTALL
> @@ -33,11 +33,11 @@ small subset of the options.  Attempts to change other options will be
>  silently overridden.  The only way to find which configuration options
>  are available is to run `make menuconfig' or the like.

I fear this earlier paragraph needs editing as well, which will then
make more clear that ...

> -You can counter-override this behaviour by setting XEN_CONFIG_EXPERT=y
> -in your environment.  However, doing this is not supported and the
> -resulting configurations do not receive security support.  If you set
> -this variable there is nothing stopping you setting dangerously
> -experimental combinations of features - not even any warnings.
> +This behavior can be overridden by enabling "Configure EXPERT features"
> +in Kconfig (CONFIG_EXPERT).

... this may not be quite adequate.

Jan

> However, resulting configurations do not
> +receive security support. In addition, CONFIG_EXPERT permits the
> +selection of experimental and potentially unsafe feature combinations
> +without generating configuration warnings.



