Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7E1C1604B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 18:01:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152264.1482795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDn4R-0004cD-TG; Tue, 28 Oct 2025 17:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152264.1482795; Tue, 28 Oct 2025 17:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDn4R-0004Zt-QW; Tue, 28 Oct 2025 17:01:19 +0000
Received: by outflank-mailman (input) for mailman id 1152264;
 Tue, 28 Oct 2025 17:01:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vDn4Q-0004Zn-Fp
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 17:01:18 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b811ba22-b41f-11f0-9d16-b5c5bf9af7f9;
 Tue, 28 Oct 2025 18:01:17 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso59712f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 10:01:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47718fe6382sm23721525e9.4.2025.10.28.10.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 10:01:16 -0700 (PDT)
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
X-Inumbo-ID: b811ba22-b41f-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761670877; x=1762275677; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/UvbOvjBQOYoX0fPAjfJyDcRSsU7ePxkkpMQl82L5XM=;
        b=Je41eo9a7jOtj4Kl/Aq0wHN9Bszt0mDqyyuJD03F95tw3BhCiglTDe2BgVpMcyCmXt
         5IsP+2jkm9AXYQfS4wgh4bs3R6+nFKSGoizN36BzRZxctcGbJ5mENw+QVZtYf6awobci
         rtS1IBStEZriEpX14VPtzOSjwMX+9Cl1W8QqRydDZ7QzEoIkhIk2CQFDogS9Os4KQTk8
         3q+ZLgbS1bWkhD01krv6OJWzb9doxEym9xqh/6idrAz7Xu4Vj/pKz6Ef2pIplzi8y24k
         j1HRbg4c9qfTKO9Bdhtlk0ea7kqLSWdLuuIowDZXNPYIJQXZgHiTlCBi1Q00DNZMdT3R
         eKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670877; x=1762275677;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UvbOvjBQOYoX0fPAjfJyDcRSsU7ePxkkpMQl82L5XM=;
        b=aiLLy0RZvivWYDQYmL9k7pBI5Qpt0vilMEvWmq39bPXW1LKCrGJH84aNrcvduOepLG
         j8mpGJkybvCeZ3Iy+QPJNSzooK7bnQCX64gobd9jzuKEWG3xqud0zRHwvilkRrVrm/Lj
         S5ckSlb1aQaGzBSua8tFOJ6OsENA2YWyWjHgd26oXOAXitkd0UIbtCRtAizl1Hhj5una
         U+00pf3uB6+5XwEogySjOSH8FLgqP6UXTEaCXA/CkjbDax4lM8MqmgqaAQkQDYvtuWFa
         s3U4blKgNPlMGILArfbWgy5DLt0fkZGeUSEJ2BiFFlzFfPNIA0DncG3xApeU64RHOGT7
         fdlA==
X-Forwarded-Encrypted: i=1; AJvYcCU84jfdxNKE2dZakA75JPc64j1Nre/owgDbRRz4gAd9WY2vEouVTdWuL+VAwKINydr9vRlJDdtNBis=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVgfstH9SKBSPOaBFKA2/paB2jOPN57I8rHJVyiWuWvR8pgTYH
	W+Ou8j8pkxJP6Zq0FC3r3OvXVJVglFKXCM57mNkQjUgFUQORR8Gz1JJdKw+xipykqw==
X-Gm-Gg: ASbGncu4AaVidRhwKNeXynzVdKsvsjrzk1vhgTAn4slhh8+u+cQ9PGB+kERjUEdHrlt
	rbxUm0dRVAyCOO26sHt4uht9otkAl4Gu+2xA0Np4v+yGrjjpatZWNcRkuZlNUUY8/eoWB1Qz143
	vrsR5Is004I89uYS0+vM3vn/1QMfJlfM76P+8K1Blhg87pk2hh+Pe0eHlZT1ziPQFXRzhzzlvmA
	f2d3O25p5RpCrBj5VDmGHr1pI9lowR0lMWtNptzCNP6Mp2VLVCjNBoIfPYhlV9nru9BMzSk7kDp
	0b5ZLEYNCKspPBCl1bFsuFoJN1VWRdxHCHiJNyS2hD3/9KhZOJ/+etv9QFjjq/jxl+eUt1es2cb
	8TPQkJzfaxOZ6fUeeByfxTwQ6Kmb/mcHYvz1Ydb0TqxCw+dvMrHeCqYfityg+W3e3YjngX5yA87
	Vr63cyT1e/2r1b2UmTRYEt/Py9pgKcmNKuw/sHlCTeaSRfNvJFke1By8XLISac
X-Google-Smtp-Source: AGHT+IEFd0QESdK1IkEj5RhBEftExp0+zZ8+wIRuOFIpaqu51HlcPblAg/1D/nOqi8JUaCfNloQeBw==
X-Received: by 2002:a05:6000:258a:b0:3ee:11d1:2a1e with SMTP id ffacd0b85a97d-429a81b1151mr3674329f8f.10.1761670876918;
        Tue, 28 Oct 2025 10:01:16 -0700 (PDT)
Message-ID: <7c0ee0ac-294a-4de8-9e8e-26353ed65434@suse.com>
Date: Tue, 28 Oct 2025 18:01:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/28] xen/mem_sharing: wrap
 hvm_copy_context_and_params() with CONFIG_MEM_SHARING
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, oleksii.kurochko@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-3-Penny.Zheng@amd.com>
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
In-Reply-To: <20251013101540.3502842-3-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.10.2025 12:15, Penny Zheng wrote:
> The only reference of hvm_copy_context_and_params() is in
> arch/x86/mm/mem_sharing.c, so it shall be wrapped with CONFIG_MEM_SHARING.
> Otherwise it will become unreachable when MEM_SHARING=n, and hence violating
> Misra rule 2.1.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


