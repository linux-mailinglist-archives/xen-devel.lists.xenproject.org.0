Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13612AE5C0C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 07:50:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023079.1398976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTwYI-0004nm-7c; Tue, 24 Jun 2025 05:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023079.1398976; Tue, 24 Jun 2025 05:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTwYI-0004k5-4v; Tue, 24 Jun 2025 05:50:38 +0000
Received: by outflank-mailman (input) for mailman id 1023079;
 Tue, 24 Jun 2025 05:50:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTwYG-0004jz-Gc
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 05:50:36 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25dcd7db-50bf-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 07:50:35 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so2383553f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 22:50:35 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2f9:d2d:164b:59bd:2475?
 (p200300cab711f2f90d2d164b59bd2475.dip0.t-ipconnect.de.
 [2003:ca:b711:f2f9:d2d:164b:59bd:2475])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535eada7adsm166545225e9.35.2025.06.23.22.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 22:50:34 -0700 (PDT)
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
X-Inumbo-ID: 25dcd7db-50bf-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750744235; x=1751349035; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HB7iLFXg4b/ij/EZdtrHNAjWItdhh4KH8xY/4DGCqrE=;
        b=gBonfCFrsSs4S+gGPCU33N7vXP6s0SFx0WhtZi7tZU1Fr7moB1vKCCq6HknzlICczd
         3AEC+6SyYhIIo+Vgam3TtKeY+ViCwe5ISHUhrS+sF31zxmX4uiCa84NpngiKy9yrp1r4
         3aEp/yv431+ALYX58230FBlN/JEGe1BxXGINhOl3IQBU5rC/Voi56WMEmQxGH39CqLrs
         +brmLNxWsQbMyCuk7E6np1DHTorGLebI1ILSJG0IPksOqPfNeUEcu6YMWe3sWDkQRP7c
         XF31BSWiSD9TFEckfP10PyaG5waMMnZoxwuy0qOgw5nJke9K+IL6kKCRqGPvCopbjkfw
         cnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750744235; x=1751349035;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HB7iLFXg4b/ij/EZdtrHNAjWItdhh4KH8xY/4DGCqrE=;
        b=o6uv1j0zCSp3ySnLb5QzxWf+uItPeq9yov911SIb+JgrcyeD1JtwZzKgnAwS9hY0QJ
         h4QG1eHTrA2L84L2tjzHyG6vnRxhJhcpvtkHvhpMBlj4ULR9Qb02CJnbPh/c9jufS6Ez
         4vAeAGy9lYROpvQuS27g5hRrkwwTuIJPC01myj3V9OSYVenRaDQftdwAnkkv7Z3Gc/jl
         kUrXpccYZAIUsbx7Nb3N65AoJ74Y06k1giivTEOJJD54Hlg6RU6LzxdhQoyPnKvazctG
         TeTyiw30iWLOJQRylYKEE71czSODvv9zBJ62+2PbhRKCbAOxT6ZUUBSSf2A2tonN62xv
         5thA==
X-Forwarded-Encrypted: i=1; AJvYcCW57iKRnN5N4M8Ok37e8zAvmeJqjM15HKDaKjGhtoiaBHWA2X5iJ12psecvSpzYdUeQngPnqS2cmOk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyphRsLuxKz4+sgXeZAXSq5OoPZXwuPbrtzjO5uqcHAy769/kiw
	2vBp7vThWPhjOZ2cSOSZNHhjyErJRgnP0rYbIYo9Bsk62aqn5pWv4FbIOg/PJ5QMBw==
X-Gm-Gg: ASbGncsMCtqaTUMQPky89v5Ug6Ax8jXfjdRPnIqG/935L6NoF0G9mdAQA9rvWULVQTj
	IdP9E8/1mn0aiMG/z9flNVWoYixgTnucW/oYzQFYe1ENt3QD22XfYM8I735VErpVHW175r+hL68
	mF8mhTlwwTgrhaZP2Xfz1ZL4PltBvxHmRRtIDJDuZX5TMazeAImFcsmQMEPGFl+mc36+iBxF1Pt
	7SQcKCmtSF9ntlcP9DXo7ISBIbUTxSOMWMa0X8pNCjJgQztyBivlF3yDJMo5H35iiaOv8n9wc7r
	YfJeyfkno5ku2WhAhj4IRucyK4AChSvl90WDQdd35gQLGHpWBLK3+68bLiUXvrikPtkigo0E0lz
	WNZ+4PLxIYDk3nC9/yO1rQtm8iUMLENYv63QFMGuiOQs5NaP4E6m1d7XKYWqaxC9XtHkXsWZTwk
	OENBlsXmAR1UOSosWW4dN8gwH3bGXu
X-Google-Smtp-Source: AGHT+IEJ4/J4xqEOAFBPIpQZL4lncdgODu9XZJzYHmFynzz8iBowRH3vnPAKrO/qMX2apIBtuK1Eag==
X-Received: by 2002:a05:6000:2911:b0:3a3:7cbd:39b1 with SMTP id ffacd0b85a97d-3a6d12e2888mr13575355f8f.24.1750744234749;
        Mon, 23 Jun 2025 22:50:34 -0700 (PDT)
Message-ID: <6b2938a2-aa42-421f-b948-44e74f463b21@suse.com>
Date: Tue, 24 Jun 2025 07:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/16] drivers/vuart: move PL011 emulator code
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250624035443.344099-1-dmukhin@ford.com>
 <20250624035443.344099-14-dmukhin@ford.com>
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
In-Reply-To: <20250624035443.344099-14-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 05:56, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Move PL011 emulator to the new location for UART emulators.
> 
> No functional change intended.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/arch/arm/Kconfig                               |  7 -------
>  xen/arch/arm/Makefile                              |  1 -
>  xen/drivers/Kconfig                                |  2 ++
>  xen/drivers/Makefile                               |  1 +
>  xen/drivers/vuart/Kconfig                          | 14 ++++++++++++++
>  xen/drivers/vuart/Makefile                         |  1 +
>  .../arm/vpl011.c => drivers/vuart/vuart-pl011.c}   |  0
>  7 files changed, 18 insertions(+), 8 deletions(-)
>  create mode 100644 xen/drivers/vuart/Kconfig
>  create mode 100644 xen/drivers/vuart/Makefile
>  rename xen/{arch/arm/vpl011.c => drivers/vuart/vuart-pl011.c} (100%)

I question the placement under drivers/. To me, driver != emulator. I
wonder what others think. But yes, we already have drivers/vpci/. That
may want moving then ...

Jan

