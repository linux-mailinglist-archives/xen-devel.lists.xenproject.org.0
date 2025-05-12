Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A56FAB3B98
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 17:05:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981685.1368090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUiD-0004AW-Tt; Mon, 12 May 2025 15:05:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981685.1368090; Mon, 12 May 2025 15:05:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUiD-000494-Qh; Mon, 12 May 2025 15:05:01 +0000
Received: by outflank-mailman (input) for mailman id 981685;
 Mon, 12 May 2025 15:05:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEUiC-00048i-JA
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 15:05:00 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78706fd7-2f42-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 17:04:58 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-acb39c45b4eso745907766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 08:04:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad24121e992sm359062466b.14.2025.05.12.08.04.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 08:04:57 -0700 (PDT)
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
X-Inumbo-ID: 78706fd7-2f42-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747062298; x=1747667098; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=unh1Z08yi853tTMmNV7mBkk/ke51ca0jr1QFjP9DroA=;
        b=Ue3/Zb3/5/E/9x9O5VD+/2m/80O6zC4/ie1s42WvLUxFWn3HSVZSNm0SSW/nF+HRkN
         gCRCiajy7TWsuzmP0hKaRxFR4VJVPDiKP85kIR/e1MQs29W9/Mee/CD3Wru1g9l559Pd
         iR6bLOCx32gBTL/LyucVarB2lSWyANKxN4S5gxGx0pSlX11Q07VO9v/f21FgHnLing9H
         DBnqsghRJjBqFFKvLdHYWKftSPpTZiw111iAimPwkzZFNDsvAnGZB639ncH8UFcRVjtk
         te20SAuRDEc7IyobdrvzQ6xYKIG2HIj/Mv5NZnqPQf0ZDuRgTZzeBD5zphRGDqFoQW88
         UWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747062298; x=1747667098;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unh1Z08yi853tTMmNV7mBkk/ke51ca0jr1QFjP9DroA=;
        b=Gbar+QXyB++sNf/o8L+EsgwU2ZIA/LJ7debGRl17VWde6szNe6YAke5M5Loy8f5jFr
         FiEjKw04qWJnU97aziK4iXPZ0Kids/LeMpb+iA6u4/5nziMQwVhuccA3Smr7raSMKU7+
         ojkqFx2wjeUHgOXuQAKgaWG72cpzdtcBGQ5oF0pkfKB4Dc2axKNVg4oPBhMMC8YA7XFn
         0sXXztX7rU2gD8dLMcMIDukCZ//z0yWJDAprkbF/9WhjSLzU6vrQm8Xdh5BZ8WyxpvJm
         X+b2YJvnJ7UixCkKvtESN4x1P1agkYNJdl1KIHttQNOi1mM+p4DyZ7gxt3wqQHdMUPQp
         SphQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlN2yV51evoYyEcaFhNfmmgbnPJW5WLuMXpj/X1DOWytwjH1AKXVKHj5mex9JtEkQqat8HROFprso=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxX1asoJzi3O2s/y7KYfOnHGCTV6hZh4DlXLKR4tPdKaSjxhpD6
	XGdEU2+7TKlaJAhtV3Ll3DMrqYjAzo7Y04j+5Sbi/XZnp0NFyTlHhjI2R/55mA==
X-Gm-Gg: ASbGncsv1qfG/eCbUYwN88LnHO5Vpm2V6uzbAjawgr5LWZxBmztSoNgCJdp+eY1YDEP
	YdpcZ0xrofQ4XMCmrVnbt1AOC2lBB9jzvcH1g3OTvwAKNZgUxCnEVVAeUD5BmW1hfIxJPmjqhl2
	jIv1rDrjmgHW6n1dZ7Ew5sVjUBDcQFTW7goxt1jY0QcH9MiFlsu9C/OmblljyACDUbL5su1X2WT
	JDH5Dy4ul+sD5t5Nr4hDhuSfcVWUvnrgp9nWrccmNfCEIzJTWwACCw32yX293FgKRCdQaL4kAQU
	kViQjPe7g++yIXM9jcaT7tguQZo8LICiYURjwIyyQnlUqsSIFcaU3vPnbp9XLPGt+epfGmJ1AVu
	r0gbNrQGvX+yfVcqeDH0/prf4Tx6wRYcVIbk1
X-Google-Smtp-Source: AGHT+IHIufP0jYW6y/4AHW+DTVoBN67DkruUehK8TXSz5LL7qGijP9kOuuL13ctSG5wUwERzq93p7w==
X-Received: by 2002:a17:907:7fa6:b0:ad2:54c5:42e8 with SMTP id a640c23a62f3a-ad254c54483mr279783366b.8.1747062297748;
        Mon, 12 May 2025 08:04:57 -0700 (PDT)
Message-ID: <853ffc16-f14b-44fa-9e71-4fae8377fa95@suse.com>
Date: Mon, 12 May 2025 17:04:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] x86/mtrr: use memory_type_changed() in
 hvm_set_mem_pinned_cacheattr()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-6-roger.pau@citrix.com>
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
In-Reply-To: <20250506083148.34963-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2025 10:31, Roger Pau Monne wrote:
> The current logic partially open-codes memory_type_changed(), but doesn't
> check whether the type change or the cache flush is actually needed.
> Instead switch to using memory_type_changed(), at possibly a higher expense
> cost of not exclusively issuing cache flushes when limiting cacheability.
> 
> However using memory_type_changed() has the benefit of limiting
> recalculations and cache flushes to strictly only when it's meaningful due
> to the guest configuration, like having devices or IO regions assigned.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Hmm, I'm not convinced this is a win. This operation isn't normally used on
a running guest, aiui.

What's more, this heavily conflicts with a patch posted (again) over 2 years
ago [1]. Unless there's something severely wrong with that (and unless your
patch would make that old one unnecessary), I'm again of the opinion that
that one should go in first. It is becoming increasingly noticeable that it's
unhelpful if posted patches aren't being looked at.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2023-03/msg01551.html


