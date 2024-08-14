Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F972951807
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 11:47:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777047.1187243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seAbU-0006GE-CL; Wed, 14 Aug 2024 09:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777047.1187243; Wed, 14 Aug 2024 09:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seAbU-0006Eq-8Z; Wed, 14 Aug 2024 09:47:40 +0000
Received: by outflank-mailman (input) for mailman id 777047;
 Wed, 14 Aug 2024 09:47:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1seAbS-0006EU-Eu
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 09:47:38 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c7cb5e8-5a22-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 11:47:36 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7a9cf7d3f3so748596966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 02:47:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f3fafb6csm151261066b.75.2024.08.14.02.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 02:47:35 -0700 (PDT)
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
X-Inumbo-ID: 3c7cb5e8-5a22-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723628856; x=1724233656; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tEWrG0yJSV0lsbIWcLYAH6LHncjvBTeQVVMZSuHvuX4=;
        b=Yp2ftz1runx9pppgUSAz9I3XGC1q6ugs3eulkrwqWdrc5NeAaRK+EyGbsnZeJ0RpEa
         N8aicBWFD43ORQ6ZIp4VY+Ze5PHNj0AFwJx5zCxBSSBj5ub4lHhZK8fpitRZCy9LARWZ
         7RqQZe/dWsNIjv5HnM4lBPJaP9oE00UoAOcLHmMXtXqe7gqvQq/bvryyZS3mOLDj5xqK
         CpfmvmVi41apLdp1Sk44PWvNyJhZCQ7MUzspvfT0eNWpEm22j6JWDpqvoUO3QCLS/rV4
         n4t88X3uxShqE6Le1c9lylBijdrc//M8qE7gDmTtCP3RhhcemJcoEbJlrrBL9fALgp4f
         CS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723628856; x=1724233656;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEWrG0yJSV0lsbIWcLYAH6LHncjvBTeQVVMZSuHvuX4=;
        b=Nyk0krclBBkZbCNxXmjYAFcj1o9xLanjf1uKIhpxFXRsDuOQEglrlM2N8eEkl6guYh
         u6Xthu33OSHHaYWtjsEJfpIoGSPdwaSDhONjIVIvV/rMeeQTpnvWpeyq5hZzAqj1wD+o
         M0UwknPPN3dx2Cd3Swey4Ugp5CLdyCOZPvzj5Ei0q0aS8vaJvPUuTNBV3DmrnEAKR/5m
         c/qKh3f7G3T0w8doOaKuUxru9bYhTigM+RXG9c6XDJkBs3IgqtU3YqGdSQq12kWFH1iu
         clLKGNbC6d1c1ISTUBPLW+7BOTf1JBlLrHyyTB3nNK/8e6tUOatkapql+Mpmkz8gMPza
         CMdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrhkdvDF122DToGVGQKNGu1qBgEgtrm3rk6By270O2urhTYKI1rKzEwB/yKOZyhuyH8kACoQ5Ze58YX0xk1KAoy3Qt7ht899pIdFJR7eM=
X-Gm-Message-State: AOJu0Yx9bRjEJusM7VGGEY8M+mdZGmGIon+k2FZv/b/WuyJHRz+ZBnDo
	nHgsAsz9S2KlUhISkCkCSM7QNUjjhoQSVdoGWA3ASpLA08M2uV3gcrNr7DiWqA==
X-Google-Smtp-Source: AGHT+IFmdNh0QU2C7A6lIprrBYYYs+pt0Xq11izAErFR+U+shXYdMK2Ft/CDWSfyIHV/Zh+135D8IQ==
X-Received: by 2002:a17:907:d3dd:b0:a7a:a06b:eecd with SMTP id a640c23a62f3a-a8366c388f2mr156741666b.5.1723628855628;
        Wed, 14 Aug 2024 02:47:35 -0700 (PDT)
Message-ID: <a4294b19-8b5b-47cf-8d64-431757b696e0@suse.com>
Date: Wed, 14 Aug 2024 11:47:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/22] x86/spec-ctrl: initialize per-domain XPTI in
 spec_ctrl_init_domain()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: alejandro.vallejo@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-8-roger.pau@citrix.com>
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
In-Reply-To: <20240726152206.28411-8-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.07.2024 17:21, Roger Pau Monne wrote:
> XPTI being a speculation mitigation feels better to be initialized in
> spec_ctrl_init_domain().
> 
> No functional change intended, although the call to spec_ctrl_init_domain() in
> arch_domain_create() needs to be moved ahead of pv_domain_initialise() for
> d->->arch.pv.xpti to be correctly set.
> 
> Move it ahead of most of the initialization functions, since
> spec_ctrl_init_domain() doesn't depend on any member in the struct domain being
> set.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



