Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD1DB01375
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 08:25:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040497.1411920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua7Bg-0002oq-Pb; Fri, 11 Jul 2025 06:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040497.1411920; Fri, 11 Jul 2025 06:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua7Bg-0002mI-M5; Fri, 11 Jul 2025 06:24:48 +0000
Received: by outflank-mailman (input) for mailman id 1040497;
 Fri, 11 Jul 2025 06:24:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yw5d=ZY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ua7Bf-0002m5-Eu
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 06:24:47 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd68d900-5e1f-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 08:24:46 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-454df871875so4537175e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 23:24:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f4b16fsm3970209b3a.120.2025.07.10.23.24.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 23:24:45 -0700 (PDT)
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
X-Inumbo-ID: bd68d900-5e1f-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752215086; x=1752819886; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nzt2XbScEuaa70g7MbhiFbO5RvGnL/d+D9V5h448sGQ=;
        b=ZJTFVnul4prcs+kFhcJgxWMy6Bb8Lls2bmLujBYbVwLySXk3ulj6ICB/bUQYRlRm31
         bFSgYI3Q9sJuiw0X53V2waPvvEri/LlC4u/35vfpEUIk/SIj8vgZ5cuNNNNQqFMfi4v5
         5navtRsP7YjS8AFFB5oWyo2XLOzDxqIAJ09sMflYKODWKX+82/xjROKh7wAYruSoi/Uy
         +3qSDDtK94Hg6H+g8Ums/V7dPlHPykRFLgR1Mzpq8dPjH0KVJ+nEUL/tZhT/BLj5U42d
         K14mUcPhT65qA29gkCqwWM0EVvMM4vaEmokhjaZDSoyqh4Eiem97zMARMRPk+x3xOtBX
         FJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752215086; x=1752819886;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzt2XbScEuaa70g7MbhiFbO5RvGnL/d+D9V5h448sGQ=;
        b=kf02xxS1ou0HZ6mb29LHtb9JFrQ0NUH1YRc1vBaOKybTHIE3YUKH8ctPSggrePrn+G
         Se8XDbUuj1S3q4YLkTEwnoq7VuYjXmJ2vX7tMbO3IY1txwAqqobPIan1F8UH42apu1he
         yGoRtmWQ08jGrvJcKKt2CLseZlISq93kXoVQx/ulALwmRcuyqm61hxSJT9xMPN8jxR8M
         +BPexExrgCCsC3H0pgyWX+tlDdYP/+rF3lFpPD+K5P6RrG9lcaCLzH7XdX5mw4z+U2ZP
         IN35EJm3pBAlmUZP24g22/Dv7nqSmcBUWoYUceQiE2Xig9ioVSvIKp1SL0FT15pIzIrc
         tg1w==
X-Forwarded-Encrypted: i=1; AJvYcCWVuItDG3tZt3x3ifMW3ao2+wIyGpMQDxuMT4nA4KrAqM/3wHwLS35D57FMpXiht/l0rRf7KkPXGoo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgJiI+YSvslfwpfQYBUTYaC4JCqPFAOryznis22MJfbEdHABIu
	emOwem5MMiObCrYFVLafMe+HorOAz+rC2EZAiOIrDQuhGSwhX8nvwwZgrAkmotPTwqVw0ZHCtMH
	e51M=
X-Gm-Gg: ASbGncuWw1UhtKa9yvcydUq9vo06rCn/IDPQD9sbD57JXCJwhVBtiV0Q5DYSaa45X0+
	1gsIbvJ2s054uDD5nRwTc5e7WZwbMcZqAktm8Ew+K8w96Nye86SXuRvYgHfqvpULN7lSGXs50Ko
	fPDKBZV21MXGq1Kic9BGT30oH+Kc0F/m9lf1I+kioiDycgWFTEtDTGAy0MybQ+xDbdrPKDh5Dfu
	1oD+pF6IAxjtEE1HEdSByGk4Qm/9f6pPmv7cyuXR64/9Y8VKwy6WafGI3vADtiHhzh5nwEmiqb4
	sNxyrt++AwScib1Z74OqJMprV3IsgzxOaMrrDFkQlxvKerNyfP6MHxD1CuQ1l0Yi0ROjYv+LY7k
	gycfvM41Yz2tJrhoe4hfqLQOv5XTysX7LrzSTwh3MdGRR0gG/oDWNDyIBfybbK3qa5r0VlSNgkt
	eGNoizRXs=
X-Google-Smtp-Source: AGHT+IH2n5qqcUn772RmaVPwwwrq2lfKa3rxzcGBx/XVkGixQG3KSZKyti9WK0qkF1MMYUsXRzcPVg==
X-Received: by 2002:a05:6000:4412:b0:3a6:d145:e2cc with SMTP id ffacd0b85a97d-3b5f187e927mr1212451f8f.15.1752215085855;
        Thu, 10 Jul 2025 23:24:45 -0700 (PDT)
Message-ID: <6102acd3-b4c0-45a1-87d1-8f4888c662cd@suse.com>
Date: Fri, 11 Jul 2025 08:24:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 11/19] mini-os: config: add support for config
 items with numerical values
To: Juergen Gross <jgross@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-12-jgross@suse.com>
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
In-Reply-To: <20250702081254.14383-12-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2025 10:12, Juergen Gross wrote:
> Add support for a Mini-OS config file containing config items with
> numerical values, e.g. CONFIG_FOO=7.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Albeit I'm puzzled by the use in the next patch. Besides me perhaps simply
not knowing where the new CONFIG_* would actually have its value set, I
wonder why, ...

> --- a/Config.mk
> +++ b/Config.mk
> @@ -178,6 +178,7 @@ endif
>  # CONFIG-y contains all items defaulting to "y"
>  # CONFIG-n contains all items defaulting to "n"
>  # CONFIG-x contains all items being calculated if not set explicitly
> +# CONFIG-val-y contains all items with numerical values, defaulting to 0
>  CONFIG-y += CONFIG_START_NETWORK
>  CONFIG-y += CONFIG_SPARSE_BSS
>  CONFIG-y += CONFIG_BLKFRONT
> @@ -219,6 +220,8 @@ CONFIG-$(lwip) += CONFIG_LWIP
>  $(foreach i,$(CONFIG-y),$(eval $(i) ?= y))
>  $(foreach i,$(CONFIG-n),$(eval $(i) ?= n))
>  
> +$(foreach i,$(CONFIG-val-y),$(eval $(i) ?= 0))

... with this and ...

> @@ -226,6 +229,7 @@ CONFIG-all := $(CONFIG-y) $(CONFIG-n) $(CONFIG-x)
>  
>  # Export config items as compiler directives
>  $(foreach i,$(CONFIG-all),$(eval DEFINES-$($(i)) += -D$(i)))
> +$(foreach i,$(CONFIG-val-y),$(eval DEFINES-y += -D$(i)=$($(i))))

... this, kexec.h still needs to have a fallback #define there.

Jan

