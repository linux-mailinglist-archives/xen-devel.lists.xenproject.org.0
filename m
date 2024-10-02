Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D9098CD5A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 08:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808602.1220529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svtAK-00081z-4z; Wed, 02 Oct 2024 06:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808602.1220529; Wed, 02 Oct 2024 06:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svtAK-00081Q-1n; Wed, 02 Oct 2024 06:48:52 +0000
Received: by outflank-mailman (input) for mailman id 808602;
 Wed, 02 Oct 2024 06:48:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RwxN=Q6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svtAI-00080W-KE
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 06:48:50 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f8b369e-808a-11ef-99a2-01e77a169b0f;
 Wed, 02 Oct 2024 08:48:47 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8d6d0fe021so1082333966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 23:48:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27d42e3sm819235466b.82.2024.10.01.23.48.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 23:48:44 -0700 (PDT)
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
X-Inumbo-ID: 5f8b369e-808a-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727851726; x=1728456526; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FlWFXIjnCDKjAtOuPtExjYh4CMIMeQIKG+6CBXp26bU=;
        b=aoVxyT/KJzmyyqccsgN/x6FLibRxblsn4GbF6yX996+Rx5+sD6qZk4Xt0dEQCrRP6+
         luhInC3VIQxTCcIdLQ8WoGTfVhaT9xGjIbIbUUDAWhj6oA4RLmxbGsVOgWc7LFKh8mqU
         Ezv2z8ZJp3DpJ56oi26SQ/BeDIzMBkpM3WDFEZghdSNnMhpjys/FU5xAYH/YFSmA2ngN
         8NzvwR77J4OGMC1rwKwwC3Zt6xUJkCJY+Hv94M78Q+ogZcceyx1GI3J2Z7WCjhzOib9a
         QrnMjNfkdSmFK2rSN7xg3MymfjqGzloH+gQfeGMSLLOLGJwinBBIWOewb3/ZOT9304YB
         U8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727851726; x=1728456526;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlWFXIjnCDKjAtOuPtExjYh4CMIMeQIKG+6CBXp26bU=;
        b=xC5x5R87IMoz82B6H5l1aps+CH6oJMp5zW6AP/1WI5aTqRMCsLa3HXSzaf1mfPK3lk
         N/CHcCINQeYZeFe4YWBR5xPyPirx+Fusd0qsuQCSwgpbBACkE12YxF+4n6ErtI/ttkOy
         Rkl3my9LK8gcLmVnNpp7jZeVjwAw7m0QmcwFoKWn1edykuGWq1NIXJWSm2oMBaKlCqyh
         CbbLUFGHIgfhxpbY87Ep7Ag5yp9jkMhf8ZH+IXZw9Xflocq3sx8PY76+bOpzBeI0GWEN
         KABy7wl35D8qa0695ZGdqg0q1d2WUfnGy2r76TmAYxbVmP2ZkgXzTRxnw1rK+TvRYSOy
         Soig==
X-Forwarded-Encrypted: i=1; AJvYcCWpyI0HGd6c4C+ZdM47uifP4GNcLvAjNZll2svk0qqMDe8dekZZFYwjKOQBzm75toY7TCF+aPYAu5w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBad7nOoCRpaIUqQWOC+kW14yEKZCQbz4sAQxTTCcL0ZYRLzTM
	GucykMWOC4ymUni0u6+ubgvMSb9AMskQ4WZhNCb1Gu07fla0LQwUWAvOO0wJZw==
X-Google-Smtp-Source: AGHT+IFQKLmxoMIFt47Wl37195TQtKmR2mLHZ5RYvOLeuZEF4WZ84B3li2hma6M+knOfyi7oEhJvlw==
X-Received: by 2002:a17:907:9495:b0:a8a:9207:c4c1 with SMTP id a640c23a62f3a-a98f839e360mr169688366b.58.1727851725217;
        Tue, 01 Oct 2024 23:48:45 -0700 (PDT)
Message-ID: <a13f5f67-8ea7-44a5-ad44-7866786cdf50@suse.com>
Date: Wed, 2 Oct 2024 08:48:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] x86/boot: Rewrite EFI/MBI2 code partly in C
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20241001102239.2609631-1-frediano.ziglio@cloud.com>
 <20241001102239.2609631-2-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241001102239.2609631-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.10.2024 12:22, Frediano Ziglio wrote:
> No need to have it coded in assembly.
> Declare efi_multiboot2 in a new header to reuse between implementations
> and caller.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


