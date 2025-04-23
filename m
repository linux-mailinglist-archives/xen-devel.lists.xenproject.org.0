Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69204A982AA
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 10:16:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964115.1354981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7VHT-0008Kj-FS; Wed, 23 Apr 2025 08:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964115.1354981; Wed, 23 Apr 2025 08:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7VHT-0008Hw-Cw; Wed, 23 Apr 2025 08:16:31 +0000
Received: by outflank-mailman (input) for mailman id 964115;
 Wed, 23 Apr 2025 08:16:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7VHS-0008Hp-HD
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 08:16:30 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4165627b-201b-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 10:16:28 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso42434765e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 01:16:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa433354sm18206504f8f.32.2025.04.23.01.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 01:16:27 -0700 (PDT)
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
X-Inumbo-ID: 4165627b-201b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745396188; x=1746000988; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=50hCIdHX0c5taQUAro0WKpxwNiENh6xzXyZ4uswSuA4=;
        b=CG07gXDl7Fuz9743kP8hGJnzCFJ+n1KXVi+aCmAEPqyzjsVQagkgX6+9iwCuFiqORC
         gIl2ZV0T6+xh5fpFIAVVj75TuJwWkb29SgC2UuP3bvrVH7FwQpKruQPgxfDvjTl0oW2C
         riqHcikdf39naeT/fEGfzVZFXw/PBbtlAGvzODixkBQ8C0MdUt/CbkoT7UrQFuwhysXO
         XicwKrAT5Jn/lXjEvfOoVUbpPFhIU3X2rPWBmaVS8SX2i0YbVoduafiD3cy3HYS6E/HD
         xl6ySL2/VMJXtEzwP+CywHHH+Obb7knxrjD/fYYWmFHY0PF1UaRQl1t38ZNRe8TfEJEo
         v1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745396188; x=1746000988;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50hCIdHX0c5taQUAro0WKpxwNiENh6xzXyZ4uswSuA4=;
        b=NmIGqJZOIMJGPdK09iutAkBh1wH0UxI6sZ4qXfzc3yaTqk20SrHz/VUnaDYnUIKZfr
         H3unzSF/jJZrxSyjXBTkfPX/3l9cdDbDikA0GABVHiNcnImYtBU+I7hxOv2vA5Ew7185
         FLrV4Br5dw9rozrUbWS4UoPaVJ9wiyp8VXB+M6vvJn38mSp3zLlFi+y9D3M0fU8WS/JL
         pGddIt3d0475pQuLsQEjoehKYZMH84vM4cp/MobX750BIbdWbb+BqV354qgsWix2AVfz
         Mq94YNmlZeyEOzMw0Mb1220fkTm4zw/5RfVc7awcyeEw38yNwQ8w2YaxJnzIaHuP5uQA
         Hbfg==
X-Forwarded-Encrypted: i=1; AJvYcCV1EllJvtavrliQzOTXgkAO0JOzFS7tiN/MLso93aln8k7d2bULMubmg3SqQldL/PEiD8Ixio/oV3c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJu/K48hMcIzg9dz7L0iphy0SYXJaNCRgtZIvfKk4H1c4eLTX4
	PpcRg8FAgli5CCKqgtBhhA28B/mJF4oGz+KWpnec9Di5QE/LfXRpCGwaXpJjTg==
X-Gm-Gg: ASbGncsM0MhjLNBStrt2oXyhaw+8g1cxsQmFxAw38XGbMiXXxgKgb39Vm37dcefGAds
	B8bD0Hmp8gu4fHoOiBNqnUaHlfv39ispUhWiGB00eHffyXsb4KfMwXnRi2k+eg8qkS6v1uW9I80
	Vx3IcY93dXMSLDB8joNHYEqkbZMHvA6/6N9ZTgoTlOdJR2bhhoKtGapd8wCQPDBqvvs6PMcK7Iy
	tsEdxyDMFUwB/npPBPxikt15KuccfRaffoEhb6JPuMzD9gGmE3ok5GDpjf7SBjTXHvWewtN7LRu
	e8FiVrFdUtwZsILXFFZPPlx+jeB2H2CUu0bfOOuhhZpRHWhzP66XTlG9pQ485V6iOHuUWU7s6PG
	JMBItLCq9DbMpXua1f7DCsURIeg==
X-Google-Smtp-Source: AGHT+IG32+2Evbnz7tZ/kAsOBBaon8NSly1G4CFDWL+QxBr45mSM9FnOhD4w5XIXVVwhQvbRH47ptQ==
X-Received: by 2002:adf:ee0b:0:b0:39f:b62:8cb2 with SMTP id ffacd0b85a97d-39f0b628d40mr6685183f8f.38.1745396187788;
        Wed, 23 Apr 2025 01:16:27 -0700 (PDT)
Message-ID: <5af03482-a21e-4040-a8c8-78c4dbf72ba2@suse.com>
Date: Wed, 23 Apr 2025 10:16:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] x86/altcall: Introduce new simpler scheme
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
 <20250423010237.1528582-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250423010237.1528582-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2025 03:02, Andrew Cooper wrote:
> Encoding altcalls as regular alternatives leads to an unreasonable amount of
> complexity in _apply_alternatives().
> 
> Introduce apply_alt_calls(), and an .alt_call_sites section which simply
> tracks the source address (relative, to save on space).  That's literally all
> that is needed in order to devirtualise the function pointers.
> 
> apply_alt_calls() is mostly as per _apply_alternatives(), except the size is
> known to be 6 bytes.  Drop the logic for JMP *RIPREL, as there's no support
> for tailcall optimisations, nor a feasbile plan on how to introduce support.
> Pad with a redundant prefix to avoid needing a separate NOP on the end.
> 
> Wire it up in nmi_apply_alternatives(), although the section is empty at this
> juncture so nothing happens in practice.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> Finding a 6-byte UD instruction that is distinct from ud2 turns out to be
> quite challengning.  The easy way involves a length changing prefix, which is
> best avoided.  Suggestions for alternative patterns welcome.

(Intel syntax, sorry.)

	ud0	edi, [edi+edi-1]
	ud1	edi, [edi+edi-1]

	ud0	edi, cs:[rdi+rdi-1]
	ud1	edi, cs:[rdi+rdi-1]

Jan

