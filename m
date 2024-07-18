Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D50934C50
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 13:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760401.1170243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUPBK-0005yf-Jj; Thu, 18 Jul 2024 11:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760401.1170243; Thu, 18 Jul 2024 11:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUPBK-0005wJ-H8; Thu, 18 Jul 2024 11:20:18 +0000
Received: by outflank-mailman (input) for mailman id 760401;
 Thu, 18 Jul 2024 11:20:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sUPBJ-0005w6-1h
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 11:20:17 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b47fd165-44f7-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 13:20:15 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ee920b0781so9209261fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 04:20:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7eca662csm10177182b3a.147.2024.07.18.04.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 04:20:13 -0700 (PDT)
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
X-Inumbo-ID: b47fd165-44f7-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721301614; x=1721906414; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mc6QN7fXJBk2HasrqrAYGkWmoE0Im1l/xBI0Ue+u0x8=;
        b=SbR/VMk9KADP1cpF55RuuBYk99P8SmvWum4bEAyO7pzYoeiM6/lVFbuuOFp2z6ZXmZ
         C/kT0VJObW1llF+r/VQJDW1oEsNlv6TiPJUpgBGoYPZNBTq/KMu+4gEWyJrBytp5GSEM
         rraWCY9vB76k8Qe8ZMJNEQwuCiR5csOdqA+/u1ymvJ5jD5K+WikWrN5KJVjlJXoGfFI5
         nc0nAw/lvYuvmd3iXWJuXarKnxY0lvMszwdGZtsXucTc6XuHKrdcFaUmFwLmh+Bwu9gu
         D1PSHkOUNB3317EeYjyzC0kg0JxRg5iIn8HVIQZhibcKKlXXD/tTlzEAK9TNRvT0bcod
         5lAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721301614; x=1721906414;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mc6QN7fXJBk2HasrqrAYGkWmoE0Im1l/xBI0Ue+u0x8=;
        b=Ov8K+oUg2fnuVqkbH7V2YAjMGKGCO/sELbXy0s5JTLSTAn+T3+i1b29/d8ymJ1XkzU
         JkBrY9ZMEFuUUilG+7+X0iozFJETeHSYkK/xkddbiJ/Gn5l5/peG/bSK/Q4ZhuW2Dz9O
         9SdaZF77x7ylh1sfcpVqUd95YADZJ7ALbrZwpkSEUzGScthNKSi6TuMQ2TF92dGTRnOj
         jY3pdZcJdhmuUKhBjF82NXww1Vyb7irKImIDveyks0gPsNvica7GrvC+zQYzkAmjfYaq
         loTQ93RlJsvDOEJxK+yRQRD3mYDlEsusnCSaCs3i4vS796Co66roaGQTjxBfV1CddPWv
         dq0w==
X-Forwarded-Encrypted: i=1; AJvYcCUiz6EA2D0i5uWzJFw94qRTEqBfLx29tV5UW981BzVDyrqe41uwtwaS+YYZBcSw4sybyaIQAG8t5Hn5fAM9XTRDktR2nKR37gfCtbbVLJ8=
X-Gm-Message-State: AOJu0YyVXlbrHVzHJnH+hNPBeWJlN1sOeOqCUf+13RmpTr9hp3ncR/KO
	A4aSeTg+Kkyt9HJI4L/ahfXttBgZ88V/R6bqkfZOm8iZaiYbuUTOLRl4Cvg43g==
X-Google-Smtp-Source: AGHT+IHoYO1TT0Bsh5sPYtbbr3PZL3mEfiMFrTlcZJgkLSGXPHZrJ4lDZLGmYqEhCi+39LeMA9Msxw==
X-Received: by 2002:a2e:9b56:0:b0:2ec:54ec:1741 with SMTP id 38308e7fff4ca-2ef05c7507cmr13282631fa.18.1721301614258;
        Thu, 18 Jul 2024 04:20:14 -0700 (PDT)
Message-ID: <7da4a590-921c-42ed-a734-f8150bea407e@suse.com>
Date: Thu, 18 Jul 2024 13:20:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 1/4] x86/xstate: Use compression check helper in
 xstate_all()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1720538832.git.alejandro.vallejo@cloud.com>
 <c12704135bf9ae1cf59ea4f8a05485d505b7863c.1720538832.git.alejandro.vallejo@cloud.com>
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
In-Reply-To: <c12704135bf9ae1cf59ea4f8a05485d505b7863c.1720538832.git.alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2024 17:52, Alejandro Vallejo wrote:
> Minor refactor to make xstate_all() use a helper rather than poking directly
> into the XSAVE header.
> 
> No functional change
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



