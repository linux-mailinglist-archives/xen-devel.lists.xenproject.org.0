Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDD8B076BC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 15:18:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045176.1415275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc213-0006NU-FN; Wed, 16 Jul 2025 13:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045176.1415275; Wed, 16 Jul 2025 13:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc213-0006Ls-BW; Wed, 16 Jul 2025 13:17:45 +0000
Received: by outflank-mailman (input) for mailman id 1045176;
 Wed, 16 Jul 2025 13:17:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uc211-0006Lm-Iv
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 13:17:43 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4074d0bc-6247-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 15:17:41 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso4159681f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 06:17:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9e06c72sm14613810b3a.66.2025.07.16.06.17.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 06:17:39 -0700 (PDT)
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
X-Inumbo-ID: 4074d0bc-6247-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752671861; x=1753276661; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NdWWvVtLGLgPGOiAyMLnAP/qkWtx+SiO4TzhyK1D4Ao=;
        b=P+baKiJe+KrLtyqAvlTNkhQrkZlMsKM8Pz6fH6PSHovtiLOF9N79/oHG3RPxBk56ry
         nD/uqQpAMOYJAxtQNXOOpy5SxR67QPiYBrd2svW0pTINWf/SuclxdgZW0RJQjRNEqX2s
         8TorJGBvkNZjkc9GDKwM6YcRyA/p+4jA41RJJ62aRaY9mTc4V0s/9+vFFv+3FrcfaKzK
         qffHcMDRuOjJWgUVZRgdstgqu/FreVcG2lucD54hy9s26XcKVIEv0MZS1KgsJJKa8RXE
         VOq7UySbjXNeS+e03U55tsabZ1hg+ophbWFCDfC5JS7GSE9/EzC8DQpJs54IrKyALlTL
         HoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752671861; x=1753276661;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdWWvVtLGLgPGOiAyMLnAP/qkWtx+SiO4TzhyK1D4Ao=;
        b=KDv0GPncC3zlCAXAphzyBeHPIkw4dSWzBQ7dn709t0Zkqcsjr3aJl8kQHrZ8+PzKlP
         UZ7jWWR949i1Fld4hsMoLBeh9pfUHnz5snH+tSaaXIq/z+n0Qm4XKupIi6KH8tjkBZ1Y
         J9++MsVWtPzqyJqxjhJqRKE3+JuyidF1wU3CVd6mcppHE90YceCx/lF08UEkDGxo7SB0
         OMW6nARNq16kHpQDb/bG5ZZiT/aOZZJRvLPTEz7KzRcseVdQaZtnimpRaCjravQ7QYbp
         fAqMYysB63yUwaU9ea3C0kFlYfyMqQTOdjjvP7tJv7zO+TXx/1k+jKA9TPti20d3nj/K
         nBvg==
X-Forwarded-Encrypted: i=1; AJvYcCXl21c9bX3AeJ5uLMJgZIa5iUEn72bFnIUgWzKp2yA3qy62vcf9Ae/IdnZchOWDNFxedCCBvENS3s4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybcTojw5Du2aXsunDma6zAckohHb3Ol13CmUWWCQ4J79obFRS2
	6x/cft4y0113+p56oAPIkJL+/q47IElaPJ0uA4vrdAECIG/+WXU1OiAW1CMMHMEvDA==
X-Gm-Gg: ASbGnct8c1mQjNXzGl1hWCsrySqRFwfg8M8NwXUFxxYascKmzJQcxG4ou4C6IJDGO0g
	CrBE4KV4lA5xJqaSgpvQE0Xj+0B9uzY7/gM46+EgKmDBnEYB33rt09KDvXdWscRbeHQl17Hfjtv
	3dFSwL26Kc6tRXneJ/4QcpIVX9SOy5KPln3zmq6xkod1mKWuXG2nS3a2aH0sYHED75wrKS8IRB6
	ZyInvFXNVjvqM3zO0R2S0obVV3t8UosFJwRxBkp1s/ut9Qf7y1Ka7y8IcFqWaqs2clsgZE9/DGq
	dWfw34qq4lCf5EP4NsQ/o2m2cGLbhIK+YpGzBx8nJYgI8xUp4csViGrkngwlJcLW6bOQWRAt9D4
	Kxc1takPPLWWUeW3FXVA2dptp30A5RKjeUQSo9wg5XYHPWqU/vm2rWBCI0J/3O22ZUMyOQ1Bzp8
	8UEel++R8=
X-Google-Smtp-Source: AGHT+IEgqpS0OsspiiDJRR+eqf2gRCkVACZL+f+xfBLhIr+Cw7ESLqf6QKduG6IKZWDMQHlFrXU60Q==
X-Received: by 2002:a05:6000:2101:b0:3a5:67d5:a400 with SMTP id ffacd0b85a97d-3b60dd7ad32mr2050990f8f.33.1752671860578;
        Wed, 16 Jul 2025 06:17:40 -0700 (PDT)
Message-ID: <259e20a1-0575-494c-9ee0-9908faa2d4fa@suse.com>
Date: Wed, 16 Jul 2025 15:17:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/ept: batch PML p2m type-changes into single
 locked region
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250715074559.73197-1-roger.pau@citrix.com>
 <20250715074559.73197-3-roger.pau@citrix.com>
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
In-Reply-To: <20250715074559.73197-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.07.2025 09:45, Roger Pau Monne wrote:
> The current p2m type-change loop in ept_vcpu_flush_pml_buffer() relies on
> each call to p2m_change_type_one() taking the p2m lock, doing the change
> and then dropping the lock and flushing the p2m.  Instead take the p2m lock
> outside of the loop, so that calls to gfn_{,un}lock() inside
> p2m_change_type_one() just take the p2m lock recursively, and more
> importantly, the flush is deferred until the p2m is unlocked in
> ept_vcpu_flush_pml_buffer().
> 
> No functional change intended in the end result of
> ept_vcpu_flush_pml_buffer(), however a possibly noticeable performance
> improvement is expected.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


