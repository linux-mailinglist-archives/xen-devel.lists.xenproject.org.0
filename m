Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE4CA6B4A6
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 07:52:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923348.1326886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvWF7-0007YH-TQ; Fri, 21 Mar 2025 06:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923348.1326886; Fri, 21 Mar 2025 06:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvWF7-0007W9-QQ; Fri, 21 Mar 2025 06:52:33 +0000
Received: by outflank-mailman (input) for mailman id 923348;
 Fri, 21 Mar 2025 06:52:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvWF6-0007W0-Gz
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 06:52:32 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f927b8d-0621-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 07:52:31 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so768512f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 23:52:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a31a7sm1534605f8f.23.2025.03.20.23.52.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 23:52:30 -0700 (PDT)
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
X-Inumbo-ID: 0f927b8d-0621-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742539951; x=1743144751; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oFBVHx9ww6oNU9A9k2GSmApwKYbwXdRL1usCo8RhrhQ=;
        b=F+/iDquKqZqjz03UvbZV8tR97ps8GAnVdSsLyQnx/9h9YCZAtldB6iDczw886QlnxK
         mvSFfQICQyDoM9xtqJmW9jY6Ks7nNJOqE8HZFOnbKBPgv2yIuBrmt9AQpdyd/Sfcr7vN
         Kx19bcyv+sfMR2TxvLU87Xx7bjjVkC6SJNGCjACIOE4SrSg8TPZz090XsdrC/7vku9ZG
         KXjoP+plN1KCZvxw2A8dwn347oZr0RHRLyYoEz7Dxs6eTyJzjby+JAsDZTv430LOTrGV
         Ms+EtMEMsE6VPgfuI2x96noNN5Od8hiJa16nfP9/KQvo3XH4w3/sldT/NwsLaJ2mBC+Y
         lbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742539951; x=1743144751;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFBVHx9ww6oNU9A9k2GSmApwKYbwXdRL1usCo8RhrhQ=;
        b=Cbl11oWfcwXfJZJ30Bfjm/p/gwi+VB9KB/czlf/QBi+uuR75jqJq2uQLxsHhA3gQy4
         OFSrz362JlCC9khkAthVPSsbwzmu0r9EY/gRplYXx+fWucU+pYXO3PI699PSWjz1stbU
         K2HKKSdsvcJkcP4ajgqcZlpkOLaG5Zn/7TYCX5OVr4/s6AvvP9xU7AN3q9Ob9KLgQjdg
         LK/3sQsYRsqcUdB3wOgHCMERUZUadaN9Gx3olIm8t70NgZG+yyaRK3GpnPyBMX5mGGEP
         IfovzuwhZqUamfk/eBDyT0gniTjG6jBGy0VmvqniZjrifUdlmBYPm9HzVYLYsvyA2k45
         LXAA==
X-Forwarded-Encrypted: i=1; AJvYcCWYmgxqXwn74hA4TzLxMzL2V2fDL7w39vsbA04To4mlsl45qpNBJ9LyVHGpR89c8P6K/IlP6lVEwvM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYyCvk+21uyIP+kF5+4Pos83fl9AHOEqw2B4lIpB6ibGsBC3qS
	DXf8C5Jidlh8oJsVcLvzYin7YtTSJaGp9bldyjNWKxTq/vX9mnFalWWssmj/Eg==
X-Gm-Gg: ASbGnct57Uu8WeGxygt9KnsAPLOmzDo5b7LBMg3tG1npwYjVKCFoVszcNOncFnNs2Qt
	a60oA+kLZh8NCzeRUL3OGvsirD1GGkBSvOCvkKrapSvM/gGRhp+xo+bz+N7QG5y7OpI9u/Gx7fb
	jxBacnDXrgFFp04KYjecple4Jciln1WJegVF9jdDPO0HpRXlBBibpBDqVvsbKamH94sTvdVA4Tk
	ztseHpFufr4DnD3XhMq83Bzc+TvvSOkcINqf7OepfycXNiT1IP9DTEbfx2haDCkxSEiKaGcztXx
	5nF3gDvVfmCyVqUaBb1vK/avERlgq8rmT3oeceg3GN5BEsda2AkgFUd0DzQ6mwlWdbbU4SrEflL
	2ghJQmNJSpa3qEwzyARkAqTdb9Pdacg==
X-Google-Smtp-Source: AGHT+IEat8PQc+HKfLEcTs9pgU3vrU60xjZgWybvO3nZuAL+vmFJK3LoOhncKLJA0dDevspYNXPf0g==
X-Received: by 2002:a05:6000:42c8:b0:391:4873:7943 with SMTP id ffacd0b85a97d-3997f92901emr1338767f8f.32.1742539950916;
        Thu, 20 Mar 2025 23:52:30 -0700 (PDT)
Message-ID: <c2923773-ae95-4baa-a441-6bedc25be32f@suse.com>
Date: Fri, 21 Mar 2025 07:52:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/traps: Introduce early_traps_init() and simplify
 setup
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250317192023.568432-1-andrew.cooper3@citrix.com>
 <20250317192023.568432-5-andrew.cooper3@citrix.com>
 <801007e0-2c02-48f8-856d-8f06eb698fb5@suse.com>
 <29d645e3-f8ae-4f55-8371-aa67da295ff8@citrix.com>
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
In-Reply-To: <29d645e3-f8ae-4f55-8371-aa67da295ff8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2025 18:56, Andrew Cooper wrote:
> On 18/03/2025 3:26 pm, Jan Beulich wrote:
>> The sole dependency is percpu_init_areas(),
>> which runs - as even visible from patch context here - ahead of
>> early_traps_init().
> 
> percpu_init_areas() isn't even a dependency.  Notice how it only starts
> from CPU1.  CPU0 (which is what this_cpu() refers to in both of these
> functions) is correct (i.e. 0) at build time.

Oh, right.

> I still intend to remove percpu_init_areas().  It's all build-time
> constant; it just needs doing by the assembler, rather than the
> compiler, as (-(long)__per_cpu_start) is not an integer constant expression.

Except that this value also cannot be expressed by a relocation, afaict,
so the assembler would choke when trying to write the object file. (Same
for x86'es alternative initializer.)

Jan

