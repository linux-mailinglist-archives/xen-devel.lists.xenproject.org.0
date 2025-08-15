Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3CFB27CF1
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 11:24:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083121.1442770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umqfZ-0002Go-OB; Fri, 15 Aug 2025 09:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083121.1442770; Fri, 15 Aug 2025 09:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umqfZ-0002EH-Kk; Fri, 15 Aug 2025 09:24:17 +0000
Received: by outflank-mailman (input) for mailman id 1083121;
 Fri, 15 Aug 2025 09:24:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umqfX-0002E7-Ta
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 09:24:15 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a4bb857-79b9-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 11:24:11 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-61868d83059so4838155a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 02:24:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdd016c61sm98269166b.96.2025.08.15.02.24.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 02:24:10 -0700 (PDT)
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
X-Inumbo-ID: 9a4bb857-79b9-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755249851; x=1755854651; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=auio8x0l2qflv9y4/XQOWSDdEvCz7ayC7OM05wHgoTY=;
        b=MNDJojiS2u07CiHpJsE0sB4R4fSuZ+YYiMPzIuI0znxZDGj8phWNGcc91B9/EegEvs
         diTsLoRrYgtdR42SkEiL6IG+vw+oiJRn52JNTib86aCsqoSUXnYp1mGdajgxMCfleLz1
         Wy6XM6rZ5/xvWNk62x9fjzou8Kw0+RV3JZ7GWeE+w399qMe7N3MeolF5aq488nf3QOLB
         PPg7h0HwArQTS78iYf8HK+HL7Lg+P2X5cY7OPE9yjOzxMSij595l2uELPXQTvOWs9DyC
         utt8YXHYGzr7FC8ZEWghKA499F+2lSksXwQLtt1KXhJxYocikLkBUloeid2sc+kvoA7C
         C1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755249851; x=1755854651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auio8x0l2qflv9y4/XQOWSDdEvCz7ayC7OM05wHgoTY=;
        b=CdhFdZl9zeBklv3+QRaCH+rz0p3Vvpu5JbVnPZMb2A0ipmMdiCosS/XbtV0i2ee28z
         oekPoHKP3otINkFGG7E414QlKejhPCvC3rqJOxiWgQYakw/Dzar74Na3mG0Dwx8z3nLB
         pSaBZaPN/GQptfiAKfWBbkU4FtLHY1f5dCVgu7HWFc0uL/NfSEKfBVAqgmu4WLexZ2rd
         4su7fBGkNkhY3eSWKLdoIaBAeXTjOiJypopl5hdKo2t0EjYOgxVQFENZpGcOs71tYtxv
         70VvY/oc6sIgzpQ9DOysQDT/8hHW4anYFrlbSWvGhWg2zKjkuev17hJTFprjF4tAX0mc
         uJiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+TtoqtaCyNBFrVPraBa8HruYY+NC5QOhwMYsgizsKgkjyAMl6Mk5FWAFNLtLLAWMkH4cCFCTKU6g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUokwbVX8XRBgXSj6ZlwSnAfK2kdfriWubqcqcWwteUAQtl2Rh
	L0m/uqlCwTT9P2mSb6BYXFVYXrQxx5jE4dHufq5A6UbwBh6yQOz9/TQeu1oCVc4bPA==
X-Gm-Gg: ASbGncsKZygfW6YED89zAreE5ah+io+s+DUF+wk73bp7g21WS3xbkIe5cFoMaoVdlEA
	bDcWFoDwWgkJpQLvt7L5JWY9S1RMldDOqtOTPNOP3+NlTxUhZGooClsQxJiRYUMFaLz1jWx9aHu
	5Yj/SoNi7nsfjwl9ykpITqzpIRmaFQvz662XhahpkvPPXXbr/7YYXxw37twBX2KEMeMEIeaaw1y
	p1RbZJGaCwlZ9r6mC1GUmz3rmo3Rkd2o72avutYGNYkFMTekboEsnTLscB147VFXuZvoLf6AS82
	C6VKMBmdAWOoJkg+Z5udGgNMu45zO09UESjyNOoCNvkksZt+udp+oV08w2Iijbr74TcT1ODI9Su
	gu0an+MEZMX5Tg1LRoUS9BPLcTiPUO0ertvB2BHtldswjlBhWJ97uyOQZJuitWmfXjkOqQg31+I
	ht8T5JluQ=
X-Google-Smtp-Source: AGHT+IEvKQ/5Szj400mffy58CMu459NDjMQ1FuawO4FDKvL5tKGCdGTbsLDHGjx2mEbvrurPqAv85w==
X-Received: by 2002:a17:906:7316:b0:afc:b3c2:82eb with SMTP id a640c23a62f3a-afcbd67aec3mr607189866b.13.1755249850856;
        Fri, 15 Aug 2025 02:24:10 -0700 (PDT)
Message-ID: <efb23ae1-564b-4336-bba9-7147dc5ed9f0@suse.com>
Date: Fri, 15 Aug 2025 11:24:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1.1 08/22] x86/traps: Introduce percpu_early_traps_init()
 and set up exception handling earlier
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-9-andrew.cooper3@citrix.com>
 <20250814180748.2532533-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250814180748.2532533-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2025 20:07, Andrew Cooper wrote:
> As things stand, we set up AP/S3 exception handling marginally after the
> fragile activity of setting up shadow stacks.  Shadow stack setup is going to
> get more complicated under FRED.
> 
> Introduce percpu_early_traps_init() and call it ahead of setting up shadow
> stacks.  To start with, call load_system_tables() which is sufficient to set
> up full exception handling.
> 
> In order to handle exceptions, current and the speculation controls needs to
> work.  cpu_smpboot_alloc() already constructs some of the AP's top-of-stack
> block, so have it set up a little more.  Zero the whole structure to subsume
> other misc setup.
> 
> This gets us complete exception coverage of setting up shadow stacks, rather
> than dying with a triple fault.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


