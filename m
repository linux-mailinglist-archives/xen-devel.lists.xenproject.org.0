Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2155B9C40BA
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 15:20:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833901.1249141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAVFw-0004xo-7W; Mon, 11 Nov 2024 14:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833901.1249141; Mon, 11 Nov 2024 14:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAVFw-0004vf-2q; Mon, 11 Nov 2024 14:19:04 +0000
Received: by outflank-mailman (input) for mailman id 833901;
 Mon, 11 Nov 2024 14:19:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAVFu-0004vX-3x
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 14:19:02 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3f19796-a037-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 15:18:58 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37d473c4bb6so4271937f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 06:18:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381fc0f5f91sm4559536f8f.62.2024.11.11.06.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 06:18:57 -0800 (PST)
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
X-Inumbo-ID: e3f19796-a037-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmEiLCJoZWxvIjoibWFpbC13cjEteDQyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImUzZjE5Nzk2LWEwMzctMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzM0NzM4LjE1MTE3Miwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731334737; x=1731939537; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TNbSKNG8vBBGLpvt12IyyKtlyIul0Ev54JEbkiOTFyA=;
        b=XSH9yDWz2WDpArpiGcWK7LcaYyN6Weg2+ReDYogk0dNzR16iy6G1lJEeyGV27rzcUQ
         wG11C9syxnCTNLejuN1Gnd8f0kbtIItEIZWXtdk/emmuaH0fMEfav7ZIPHzbr+l+wLNE
         ejLFpesjSZ6IM7wENEKbKpcopVYZJXz+yrxkyS8ahGut/37M/VLgEINYn0KRi5juAaFn
         YhXccoVT6yrDonh7FvL7/WDQ846hkIEzpjohBUxws5kudZEsKDX5Z/Wny4bkHZGPFZ1G
         jUZ1lseYvfr8+ct2DPqRTCLy5sfB8VpPzQHUqpKcn5QPcbB8Ly4IiGbTYQnU325KMlbO
         yUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731334737; x=1731939537;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNbSKNG8vBBGLpvt12IyyKtlyIul0Ev54JEbkiOTFyA=;
        b=E9rr7UoqQr9fzt59EmehXwiNlC8VopiXLCgRosLaUENOjr4sx3V0pRGtvgzJErNk29
         +LIxsPVovtkWdFw+oZ1zohyxmXSHfHBdA6Cr4n9Pt4UUDHZERR2Bccx/9yj4vGLJPT2O
         v03MrNdHidnYhOlgQgVU9XGB68oxQof5gIAJKd4c4BO5qvRfzAJkqCM4TRJGJWZkWuy2
         jPe4Oe0xFzPa7c2R3u/W1guLnTd+FUO7KsqUbXXTJuH+GtZOAJRNMF9Ekcx+6F9Hygw0
         6N+Vsr3et+Gm5FMNBfvO/Rpv9WuoSSqoyqSNtM2TiruFrv8JZpEPQw+bwc9223Ft1vZA
         VFYA==
X-Forwarded-Encrypted: i=1; AJvYcCUz5uFldd5Y+9mjFnEd/EhZEXr/XEpLKxzovt0iCRzjgdOtTR1pSi+9K8UAvW89xl1C30rdXs67lkM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtyeNomdCRuTfm1pSjXO5p7oTXh+dGke+631fcOWJ9x3sS2wU/
	mAcFF9BkktVW2OrWh/cY25cxysA5aDfGi2/2wTFqgddJURfw0m2PjIhwmHJPBQ==
X-Google-Smtp-Source: AGHT+IGXZQ33vIPyU7NV2Pms5hCxVMc5igdwxNrb/QxK+EJtoldbxA3IbqIUfVU+/K3I4CKG23wG9g==
X-Received: by 2002:a05:6000:2d84:b0:381:f443:21d9 with SMTP id ffacd0b85a97d-381f44324b8mr8669899f8f.56.1731334737447;
        Mon, 11 Nov 2024 06:18:57 -0800 (PST)
Message-ID: <64cf2def-9f8f-4ba7-9050-b82c859a9aba@suse.com>
Date: Mon, 11 Nov 2024 15:18:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/boot: Setup correctly fs segment for
 bogus_real_magic
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241111132823.21658-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241111132823.21658-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2024 14:28, Frediano Ziglio wrote:
> bogus_real_magic code uses fs segment so it should be initialised.
> 
> Fixes: d8c8fef09054 ("Provide basic Xen PM infrastructure")
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



