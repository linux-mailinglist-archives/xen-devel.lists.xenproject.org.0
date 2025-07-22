Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 372E9B0D908
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:11:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052472.1421213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBpf-0004pG-QY; Tue, 22 Jul 2025 12:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052472.1421213; Tue, 22 Jul 2025 12:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBpf-0004ng-Nu; Tue, 22 Jul 2025 12:10:55 +0000
Received: by outflank-mailman (input) for mailman id 1052472;
 Tue, 22 Jul 2025 12:10:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueBpe-0004na-7I
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:10:54 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8afaaf7-66f4-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 14:10:51 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so3406250f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 05:10:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6efe95sm75178025ad.217.2025.07.22.05.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 05:10:48 -0700 (PDT)
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
X-Inumbo-ID: e8afaaf7-66f4-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753186250; x=1753791050; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SNc4ASlY+mUwINS2FT2h7nBQBsHaJF+mb+fWiQxddw0=;
        b=QCH1qh3k2VxaDGRKojDUR/hGDmdrrSAoS7XOkAZgAUQlpR1XjqOlrm1xVhuFZvGhH4
         Zfir+WmS9U5QkslYeJNJPp/0mkOdwawKkN9fLcN+OncRszMi0x7m0vzzL/54skNKrhP8
         rOK05NDLpEJOefXNNeOk3BcCZY/tPSbEXcMgTWSCGSbUEH+S37/EaRWzUm8u35Axm8YE
         nwstmfawt/bveDUmea0HPspaosgSAkifBS0vabsbciMQeoxj1Ua0PQoUBW8MVCwCceu1
         LB5cGkKE2iBO61iXGfe2ZE01q7wLHWX7Ih76uruJwiVXChdcLwTDsBWYs/F8YeIqqTwB
         MBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753186250; x=1753791050;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNc4ASlY+mUwINS2FT2h7nBQBsHaJF+mb+fWiQxddw0=;
        b=wPRYqfnoH2T1NgeYf/SAs1Kt4M5/iJ+3UzVPq+/OpRl3a7edDLyOgwdNxt5AYy+Ecs
         6OqzHo341FV25u7xo+oc1WUl3F11gvB2rwrpbnIxRlu0M9Uz5MgAHyQroz5s7bV4pamK
         gturkr7fvOv2031kalckiUe7A1c/ZwVLlnatushXwHxJg5gqQIYyXmEB8utTvuZ+LYpd
         WGvbDRRR19QoZ9sBPxLZac/NSy4jP/9Yqgu+T5p7g45dbGf3SNzG/CCN+L7I5L511sh5
         LQanjvTh/KeThQkvlxDkShFOj127v+DMxjpVoaMiLqBUxnCCv0FdnBW37iCb61g9ZiwF
         gspQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSPcDXkhwH2/bAAXib6QMW/q/n7rSxygFIHVHpn/hKP0iuerMMVP3qIlJ4tJZNoDvinXcXO7Ss4ns=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypK7VYCF58E0qJU0hGz5CB1+1KODwjZPoRp+42OpPeEZFXYGdw
	bY8hwH5bGj1pdwQBwAZi9wZti7YbtRk72a0b/ky+9WlVir184LYh/56EAraAL7WJ2MXQZxO5ZSh
	K3tg=
X-Gm-Gg: ASbGncv7/bdiLUa9yYVyF0is0u0QKlwMPWMTlRRm2ZEy5la89g96qfGCkyPyTqaBZBd
	wa/d+ZzSl2vJqY0KG+wnpSCvuzk5IvbTT0R9MRBdvQAIrXzqk8/UoNRln8ZCXd7Mn5pSIhqzFq2
	aHzPeJ5XYij8lg925iChZr3BiXoMfGhu108V82BXBbjzqcCT4Hc40gOSJJOQTOsFxuBPHChoRE+
	UHjY+D4N2hxpewJH5WAv3on2R1QR9oz1XM6IUOxogN2CeR2FrP+ThiE+PTpe2cLxJz8zZ71Imhm
	hMOzcYH61j5SSduAOV56Ky0cU+qgg77C6Nf5JSacLGKU9JzLdrIIcFkOhA0iNpK7TjJ/fhmka5G
	RxGA1pqZB2e+kzyUHlaeQWpNxRiD2KGD+ydwhtlain8JoLvU/1ycMCDRIRKtKfhn2kFZfgz6MOH
	7NCWJKwOY=
X-Google-Smtp-Source: AGHT+IHGP2uWRuoST385u4GHs1fc6vj6d8lcxjJMqqycuUjvEDScGV0VeOjrZxLeh8CEXK1/QvCD4Q==
X-Received: by 2002:a05:6000:2089:b0:3a5:8991:64b7 with SMTP id ffacd0b85a97d-3b7634f80a3mr2523622f8f.26.1753186250558;
        Tue, 22 Jul 2025 05:10:50 -0700 (PDT)
Message-ID: <c72a8ff3-e3e3-437d-b169-031571a18dcc@suse.com>
Date: Tue, 22 Jul 2025 14:10:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] static-evtchn: Add missing include
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Alejandro Vallejo <agarciav@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
 <20250722115955.57167-2-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20250722115955.57167-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2025 13:59, Alejandro Vallejo wrote:
> From: Alejandro Vallejo <agarciav@amd.com>
> 
> When later on x86 starts using this file in later patches it won't find
> device_tree.h because it's only transitively included by arm.
> 
> Make it explicit.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> Acked-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

I'm certainly happy to trust you, but on a v1 submission I'm a little
surprised to find two tags present already.

Jan

