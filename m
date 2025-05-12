Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B57DAB3BB0
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 17:10:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981692.1368100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUn7-0005PW-Fa; Mon, 12 May 2025 15:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981692.1368100; Mon, 12 May 2025 15:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUn7-0005Ma-CK; Mon, 12 May 2025 15:10:05 +0000
Received: by outflank-mailman (input) for mailman id 981692;
 Mon, 12 May 2025 15:10:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEUn6-0004zQ-9I
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 15:10:04 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d9c65cd-2f43-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 17:10:02 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5fc3f0a5506so933186a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 08:10:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad225a6bac2sm550603866b.101.2025.05.12.08.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 08:10:01 -0700 (PDT)
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
X-Inumbo-ID: 2d9c65cd-2f43-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747062602; x=1747667402; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Rp7tiJIV3rnHgB93GQ0E3AMTocGLPGRp9ek9HbTTwME=;
        b=AudirPBh3Cayytmns04so/r+brO70ZOlwe/K3KwbeSNuOG45NFqcEMfahYouxFFT1r
         uzNweG1kS/o8+vjKsXWEZBzFfrWVhnQxxAtanlwohg3M9kPNLtdu5VuRQK3bnhV3YjEk
         P2qH7fsocxMG/FchQeGinF9Dw51xPScduXm2XwQRVs8KLKAvbbi+PceIWnrbFS909hmE
         6NQjgm3WLI8dxaanL9Zb1B9+rCh1snSK33TRA6cS+8Z1kctyzLusPD5t8rDgXsE5O6QE
         lIgA2lpXKz6Gw6lJjsUjWY2P0wPYW6SqEvyt0dNDskRrnxKgq/sH976mbj+JB8mpEqLJ
         uCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747062602; x=1747667402;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rp7tiJIV3rnHgB93GQ0E3AMTocGLPGRp9ek9HbTTwME=;
        b=oJ/bWy04GW8Ld2zSJww6JyMwllKCc3OW8/h4he7VlPfBl9Au4nZBt93YCD3GeYh+wy
         h5p08kPnPJcnMvdHIzZYyG6vdyHKHjuTV58csUbiDOWqaTE38QRjTzqmL6tVOJJbTk7O
         gp+c5O8g1tMcscd8MkCoBTGB/9I+21Meip9I77m7kmO6nEyGRzCz4plNhvTUrZVTWe01
         i6FVkhMnyj3PzcC57qjengltJPIdZP47grHTs/XFPs5hRSjzD0cv/h5DB3OHf2pZiGk8
         xr7mSkxw1/VZdZ0RMmVKcsWyOSfdAR7CKXDLi+Of4qizT3VgUOWvc9uCxPqkrEJH4Dd+
         zKcg==
X-Forwarded-Encrypted: i=1; AJvYcCWboUx8dGIn/kIx+z8yt4vkb7cdUWx6e0bNGtSHQiTXpSkeSvtCEhkQqfBIf7mHFvoGZJbXBVuUgus=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxbh1pi3NvvBndbycSaTarIWFe4Jy78TbH27v2lhuZnor0LcZRg
	PUUJkdwo3CByIqDsVU0RM3CeaGSCXYYFCMCrmJZ+0R6rqlYIyjyhP/Rufy8/Pw==
X-Gm-Gg: ASbGncvlFDLO75+1YeMK2xaGQxt7rLrM0gdSO7pHmEOzSRM9X+0sz4qvLRarIaPgoj1
	4ZXaSsNyDjMXdEiWCkjwF5NfWDbLNzW9UmACLufuxcUZa/TKzxiAj77FT3gUVdN0A2SgrKJTxVK
	8pb5zgxv06J3cmAVdn7rdX8dyNoeZjUm7il3yOkYGaEOBsl9aPKj9OHpdxzlwnAe9XNeffBO5fF
	npHniRBHcH5zhswu6POiGhX21/6sWmqFS/qho4iE7vsSSQdxD0xSNmoCr0+jCZijv6DQy825Li9
	uVFX723BRhG9yL/BaSExiNIQf+Lg8r2Ba8H/TlE6vpLbIHOjvCUcmOUGIIp8VFHxfOn4hYFZxtC
	Cu8FA/F3GbeKLIPgWfwV8kpTNDS7SSs+bK7S2
X-Google-Smtp-Source: AGHT+IFjTRqfI+Vnr0XiLOGcimLe6d/X8BkHTZF7LXKz1OYE4qvCK2pQMXw346Q2lr6bfo9UsgwkFQ==
X-Received: by 2002:a17:907:6e94:b0:ad2:428e:dd2a with SMTP id a640c23a62f3a-ad2428ef7c1mr678244266b.60.1747062601709;
        Mon, 12 May 2025 08:10:01 -0700 (PDT)
Message-ID: <ea112ede-b619-46f9-a9ba-ce7dafa91b3e@suse.com>
Date: Mon, 12 May 2025 17:10:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] x86/p2m: limit cache flush in memory_type_changed()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-7-roger.pau@citrix.com>
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
In-Reply-To: <20250506083148.34963-7-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2025 10:31, Roger Pau Monne wrote:
> Only do the cache flush when there's a p2m type change to propagate,
> otherwise there's no change in the p2m effective caching attributes.
> 
> If the p2m memory_type_changed hook is not set p2m_memory_type_changed() is
> a no-op, no recalculation of caching attributes is needed, nor flushing of
> the previous cache contents.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



