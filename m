Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E1CA10C46
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 17:27:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871540.1282522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXjlJ-0001oS-9s; Tue, 14 Jan 2025 16:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871540.1282522; Tue, 14 Jan 2025 16:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXjlJ-0001mA-7I; Tue, 14 Jan 2025 16:27:29 +0000
Received: by outflank-mailman (input) for mailman id 871540;
 Tue, 14 Jan 2025 16:27:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXjlI-0001m4-27
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 16:27:28 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7038a62f-d294-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 17:27:26 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so65315295e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 08:27:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e62116sm179020555e9.35.2025.01.14.08.27.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 08:27:24 -0800 (PST)
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
X-Inumbo-ID: 7038a62f-d294-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736872045; x=1737476845; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YHrfyOk1ENYEzmtT86LPgo2XXs5I/hTYURLr4R/eJE4=;
        b=AOknAaNSx7QAuQY5SBTLvI1F68cRo1mqegVqCBiQWCIxB7b4jlaMedVYyT4h5jIg8X
         HHhsDAF51USbUjlMxk4m56kx7PTokuEM9LSXZ8tT3wNRAjlSY5NGpdi6qq0nsxqnqYZ/
         D8VBb1WhV5aInCd2bZJZoUWfFOOnV3Wi7eMfuQEwuXY/COvAO6Xrk33o+f0xNBqcR6Tm
         wFqIrn+Yk9nkvvQhfF7xsmRplxjOCM4xo7AHl9o0rvwkJCnEomUhzDUh86Cs9pUVvhzw
         tdb0TNu3crpsaI2X5zVoss5GgmWsH+MlmPUSGrWRL4KAv/T04J74cMSBaKO8OC5K5xLm
         bVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736872045; x=1737476845;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHrfyOk1ENYEzmtT86LPgo2XXs5I/hTYURLr4R/eJE4=;
        b=M3GqQqt0mLkmRnLFxY00y1bk66CZ6bOCU7dwzWVcXQuL7OdUMRETXTkNPzfyDe9CbK
         W+/WN8/jl1z85fePTDvAbyGhnWrLg3SerNN8XIAL5cER3P9GNGCa/oW+d7nodYUUg0GT
         fL2AKfXaNPrPUsIFQ6VaarJa/hzcTU/y84B/bKJh1W1acBOBQszsd0l6PFB5fNv5GnXS
         YjZaRh2VYEOVvJntFLLQfXGs+dRrHwnMAL7vPSnDfDsR5UoyJPNK3hycDkJyrk/oXOtn
         mNkC0DLEfdqB7TaM6ZHKI0xGNsSNXjrskrQKq9yYix5fdYRyM0yf4cdNQOu3fD8HAAl5
         V20A==
X-Forwarded-Encrypted: i=1; AJvYcCVHSxyz8pAEe8CIxMlqmkW2FYGeSvBa0kwaxwEjV5xQC8I1T0XtlE8sAD48FiRJ66ti+/voCs6Jvtc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCrs5XT9mV6n8HKbczVG37oBJu9+dyCDtUgwcUpwa5LSAMFv0o
	D82S7byy1hESY0AmuzFjC3ZO5iDtwYmSt1oimjj4h7oFP4aavr9Fj20DSKHUQw==
X-Gm-Gg: ASbGncuLyXYM3SftKvi4W6kmrBRwp6kkf1FjRt0DQDixdpRU7z5fnklE9pl6NtcNLG/
	EQhdWqhItI7XrMW7knA8hB/t8cmlp48wgxT3clAJ/hpccLgk08gbPuV22dRrq6lbQeQ067nEE91
	JKzHQgg6XW32vh/m+sTI5+/98rs7qeKbkjGbRNT8FrfmLW9GZuzQ1BgCUSmg1mkT2fi2C5J04Zg
	sykuz8FYiZpGh1+JSea+vFFWK55byEz6+6TPcwFUP/T3AuLS+wY3xaDbTL9svwnEw495mFhoh9T
	JwTr8Hk6IhAwhyUOTUmeoV57MaEuTdRAYypLPZH7oQ==
X-Google-Smtp-Source: AGHT+IEFP/EDS5aAPJEmQXt0Svz4TaXuDrmkYU0KaLgSJHo+7kTsbp9W0+QFlr6Zu61PO9/LNQ/CVw==
X-Received: by 2002:a05:6000:1542:b0:38a:a047:6c0b with SMTP id ffacd0b85a97d-38aa0476d5amr14447163f8f.35.1736872044753;
        Tue, 14 Jan 2025 08:27:24 -0800 (PST)
Message-ID: <e42f9215-b65e-44cf-8b57-1bd782bf1d52@suse.com>
Date: Tue, 14 Jan 2025 17:27:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/18] x86/mm: switch
 {create,destroy}_perdomain_mapping() domain parameter to vCPU
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-11-roger.pau@citrix.com>
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
In-Reply-To: <20250108142659.99490-11-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2025 15:26, Roger Pau Monne wrote:
> In preparation for the per-domain area being per-vCPU.  This requires moving
> some of the {create,destroy}_perdomain_mapping() calls to the domain
> initialization and tear down paths into vCPU initialization and tear down.

Am I confused or DYM "s/ to / from /"?

Jan

