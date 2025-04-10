Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C30BA83DF1
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 11:09:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945060.1343327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2nuB-0001T8-BT; Thu, 10 Apr 2025 09:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945060.1343327; Thu, 10 Apr 2025 09:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2nuB-0001S1-7p; Thu, 10 Apr 2025 09:09:03 +0000
Received: by outflank-mailman (input) for mailman id 945060;
 Thu, 10 Apr 2025 09:09:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2nu9-0001Rv-ML
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 09:09:01 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70f939aa-15eb-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 11:09:00 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39c0e0bc733so440070f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 02:09:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893f0cebsm4155127f8f.61.2025.04.10.02.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 02:08:59 -0700 (PDT)
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
X-Inumbo-ID: 70f939aa-15eb-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744276140; x=1744880940; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6WXqvtwxi/xM2HV6yukyzdpkByjc4er6MVuqZZvXXk8=;
        b=Pv6fgVW/8AIP03ACSEvkuF9l8/ZyYTfOhVOjCSXBNlHe+sK31WoegAuumjDBHQOKks
         NhOQbUiuMwywssriZK+xu+9ExXEVfGcIcXsDET+ECj/6GMFpBcRX7XWwhcWDzTjkHsXv
         uyL9zvsnI2fH97IePmybkG9eYEdrspAXIF1wezxR759ZJwxUw/qQz7dJ9+9heXuRxP8P
         dm+xE21Kxn0hB41WefIzaTnH5snbG9cnOQqkkM1NcV6V1jQ6xWtijlalWjVnrOJFUN6T
         p6M9sQNBWhDeUJcdcSM3KzPGepE64+Kq63MXrJ/bw7Sx5SKWUox6S2gEhZkHOmd1ukow
         zbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744276140; x=1744880940;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WXqvtwxi/xM2HV6yukyzdpkByjc4er6MVuqZZvXXk8=;
        b=gIY+/9nanHTL9K7exX9kt27TMm2jJS7Xyg5AGFBFrEVJLFFZI1EzHw+UAtIP0fM4nY
         PSuxuFIgCW+PvaeBSnKD7VqQmcgZItrF2rbSb7udCPflEOLpZE2ETAUT0V5tW+j6WoMq
         VcP562HhMHGsJUuhmu6u2psYHXTyDHoQZHI+GWUCwZhOYLbp6dW6WntszMsE70lcLJsk
         INXNpLLY+W6GHqPXuObrDxPlz92/oKOFCfS+VdGDMJI0F2ELpwCsI2Wjw0moaAJ3GpcB
         Zok9LiJ0gePEtp4xqdVWZLIVJ9Mu854ruLthm3khqHkJdQx7tchgnQCg4NCtIX91BRnW
         1ojQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjF0NZGikw8GKgUOu+1lEOcqBz0MA+ovM4VWmiFzKUH80sd9VmsF/l5TmBO+tgH4CwG1bRXzr1dyQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfHiEvmI09e3YxEZGM4Nty9i1On//nyPQqDsvc6bNjshCKDxMj
	DklzHdbOmDB/zlR2NgXrJ9qIh3+IwKOWpbw0+OvRQCAekx+ABQdbtsFeX9iQWg==
X-Gm-Gg: ASbGnctYp1XkhthxRNV0luq8gID/X+1cGFkRnaBZM/asdu+0WZVTns0Bpo0lN8+3AP+
	om+6O9gyY2tUzmk5PnUbiLt+sceyouJt080V9JqD7agacVmvOE+lxQwJ7EcFU+zC73qgQ10UHCx
	qzmW2BhpovrBgo/gGt32BNcOOlD/sHkENvYDBn+G92oli6h7U0UqPck8davtTdwUiPGyYvR1Zf4
	JghoSpANn1475zEWOdJUzKpHG/vXV1ZqRPKQejHCSg/lNJfVfxy2xfBqAc/I5FJ/wR131pv4G0v
	UhIJGvXzVbKeiKm8IGI/yoyq8AtlfhIjmClcYfsXV/lX62xlBw2bhLfjdAZcOs4t0yW5uwYvUvY
	7oWKMih17JNSZgqpKi7brWv+bVQ==
X-Google-Smtp-Source: AGHT+IF0doi8+8zKbYGHwCAmool+DcQeWaQFnMTiLPhPKfe0VRA3aJhpdE8bEkdJSY9iCUIGBD3RTw==
X-Received: by 2002:a05:6000:2505:b0:39c:1efb:ec93 with SMTP id ffacd0b85a97d-39d8f4e8b02mr1565651f8f.48.1744276140087;
        Thu, 10 Apr 2025 02:09:00 -0700 (PDT)
Message-ID: <d61f5fbc-8e28-454b-9931-c267d67cb491@suse.com>
Date: Thu, 10 Apr 2025 11:08:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/16] kconfig: introduce domain builder config option
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-6-agarciav@amd.com>
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
In-Reply-To: <20250408160802.49870-6-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 18:07, Alejandro Vallejo wrote:
> --- /dev/null
> +++ b/xen/arch/x86/domain-builder/Kconfig

This really looks to be the first patch where it needs settling on whether
all of this is to live under arch/x86/. If it is to, the reasons need writing
down somewhere - maybe not here, but at least in the cover letter.

> @@ -0,0 +1,15 @@
> +
> +menu "Domain Builder Features"
> +
> +config DOMAIN_BUILDER
> +	bool "Domain builder (UNSUPPORTED)" if UNSUPPORTED
> +	select LIB_DEVICE_TREE

Was this meant to be LIBFDT?

Jan

