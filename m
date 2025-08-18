Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 061EEB29D00
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 11:02:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085757.1444056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvkt-0004EZ-5M; Mon, 18 Aug 2025 09:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085757.1444056; Mon, 18 Aug 2025 09:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvkt-0004C0-1p; Mon, 18 Aug 2025 09:02:15 +0000
Received: by outflank-mailman (input) for mailman id 1085757;
 Mon, 18 Aug 2025 09:02:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1unvks-0004AL-39
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 09:02:14 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07852c3b-7c12-11f0-a32a-13f23c93f187;
 Mon, 18 Aug 2025 11:02:12 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-afcb78fb04cso567755066b.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 02:02:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce53eccsm764041366b.19.2025.08.18.02.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 02:02:11 -0700 (PDT)
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
X-Inumbo-ID: 07852c3b-7c12-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755507732; x=1756112532; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWIZvwksGpTbzlC31RYEcXxtuKNXSor3vPDnyOLtS9g=;
        b=caKMuppSpaMuEYlvCDM7Ekps0u4w4reZsk+Ly/2sXBvd2OohTFcc0IVSxh5Z8IS9pJ
         ixGBF2E7XO6nXoyYkKY/AO4LzT1Y19sBnlAmDwCZaCHeI6GfypnYppN2u4v2pkjYBeYa
         HqfaRyTnnFKBernJCHQxe4l3XDZ3CeWIPkY5HaY9ApkzocQG92SRzLRuoPRKlA/M+4U1
         evwINiuVoD8aMo9EcbR4IBVV5rytlsX7DaFmWHctCmEc5AZsVTTBw69LqqOL4Yna6t9j
         d1XBjH2aS7Tp0dQ6oi6UxphT6h7NyRlrm9zo/TVs7iDZu3JeM2zu51vLpjExSFFYxIdn
         wXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755507732; x=1756112532;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWIZvwksGpTbzlC31RYEcXxtuKNXSor3vPDnyOLtS9g=;
        b=EeMtZZfAmTEkXenDmntEoinRszl15ys1nmkhvbp2SQ9BGMqBXZuRMnYV289GVVd4FA
         XeBVLK0m0Fgi1PdR9hxb3si9bao0H3hkMX0YhGioKMbAXi7NqgyQm36AoS7Px0yaN7Yl
         T4hrK+eCMJg1OdzDFQAHbE5oU9k3CGhlHt2nPMLKuCjyhvdLOX3zLuG/dLZo0befb83a
         hokfX844MEJ4BkYoJMYqbQwJkbCE+AETiLE7hEbs+aMFaBwX7ebnFUqxllId0ENZwddF
         GZGto72FB5V/4x4opF/GLojjSCYfxE6sv8tIVSsCLYu1QR/APGCiomzqVg5b/Jcp08dB
         XHcA==
X-Forwarded-Encrypted: i=1; AJvYcCUnmSn8cPBVgp80JNDG0adN2Ms2XmB2sjZHC3vqII8hVBKqxWP4r+sEVfcQHMjUbP6m+IgIDdV6tJc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywu6i+GKbiHtcVuVnhbOftHFR/OjYIcdt4PKNZAkSpn931og0go
	08D8m3AoYHLFkLXkGEoF5pTQCJLXp7JLBLjYBvgx2EpoJEaLC2/Txb6eQ5PvcGi5kR3dR4NrHNR
	Ta1E=
X-Gm-Gg: ASbGncuVry0/Fe5K/yHxF34z61TlBXbQeJIkClE0IYQo3Xb1nl+qPt4AbYKOr7JPBux
	kpAEH1puS4LQK8Yk/wmBImB5FmgPGAxh2hvbZzMJkoKYmoWCzk3jlV0kFy1lbVYCXBrPsBfOe2R
	9Jdlm4WgmHMc0rs65Y3ZVKl/aiSPfWvOdeef+0Jr+6vrI/LnBc76YI4l0X9WRCZvzWHUCYJh242
	hZ2tpn1xy4Cq9RB+TEvckgV8nP+dhJ0WTfO4zD2YDCCtyRaLojREnwK0GpaTQFURJwx4aA5vjGY
	TtDE/YHi6C+R64UV2iyKcFLPLur/bjSJJEvHWqT1uHavh6lVFvVtOermVH82vvD25/bz5oBGLhJ
	tSm9mTd2IT6FnyT8MzkV7qa99+A8qyJi9PKfoNDI6e3QxQo7Xe4hL5PQu8qc4ip1fFjq8amclfj
	9qRFXCK8g=
X-Google-Smtp-Source: AGHT+IFkYhQggqXKliwBnzROKb1RbmBZrXRs/gII7woUsLohPSgMn1axJDnBYSjLEzj0/BdLhJMYnw==
X-Received: by 2002:a17:907:3d86:b0:ade:3bec:ea30 with SMTP id a640c23a62f3a-afcdc03ed57mr31608866b.1.1755507731972;
        Mon, 18 Aug 2025 02:02:11 -0700 (PDT)
Message-ID: <a875b95b-32a1-4971-9004-b78c24747fc5@suse.com>
Date: Mon, 18 Aug 2025 11:02:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/22] x86: FRED enumerations
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-14-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250808202314.1045968-14-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2025 22:23, Andrew Cooper wrote:
> Of note, CR4.FRED is bit 32 and cannot enabled outside of 64bit mode.
> 
> Most supported toolchains don't understand the FRED instructions yet.  ERETU
> and ERETS are easy to wrap (they encoded as REPZ/REPNE CLAC), while LKGS is
> more complicated and deferred for now.
> 
> I have intentionally named the FRED MSRs differently to the spec.  In the
> spec, the stack pointer names alias the TSS fields of the same name, despite
> very different semantics.

Hmm, looking at this again I'm not entirely convinced: Staying in sync with
the spec also has its merits, and the FRED infix is sufficiently distinguishing
imo.

Jan

