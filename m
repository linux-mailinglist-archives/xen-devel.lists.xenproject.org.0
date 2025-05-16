Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8461EAB9A4E
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 12:38:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986923.1372442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsSI-0008Va-Uz; Fri, 16 May 2025 10:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986923.1372442; Fri, 16 May 2025 10:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsSI-0008U1-RV; Fri, 16 May 2025 10:38:18 +0000
Received: by outflank-mailman (input) for mailman id 986923;
 Fri, 16 May 2025 10:38:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFsSH-0008Tv-Ja
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 10:38:17 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9140c02-3241-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 12:38:04 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ad2452e877aso296716666b.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 03:38:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d04e821sm136950066b.17.2025.05.16.03.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 03:38:03 -0700 (PDT)
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
X-Inumbo-ID: d9140c02-3241-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747391884; x=1747996684; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hQ7Hd87HNDW0MzwrSZRli/A0eaSCQqXZn4YO+frEP3A=;
        b=Kn6cJh6PKhWR6HoMCn0L1BLpbXeq+lMkeS0t8E44ZOtyEttivr/B6IzbhNlLZ3oUs4
         glDtVUTUDgN1UMJxfF+DDZ4h523kyiiO7vv0Kyc4C/Q83P5XvJQlCbEoF4Fb4kI9BbVH
         P7nIJa05bdWH8UhBznGAI8wCWTfIErvMfG8R/bzbGjcsbri6yc3E7TdOOhBxvdlNPW2W
         dUkyZiphw7Bl9Mv6R/HIEa0/Bp68+E2Zu0nZrnQqv/mj/TLNRlANTD5UCzlbDYC5Pwdh
         sq8+6gaW3iQsRJ1xRNQDWunyo9YhEh/dsS+6Gxufs+ZOPtewi0nrZSG+szh8reXEnB2s
         nKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747391884; x=1747996684;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ7Hd87HNDW0MzwrSZRli/A0eaSCQqXZn4YO+frEP3A=;
        b=f4ZpMO0BTCauatTonZfdWngRyHd9RogrRZ4KDRqJP+ya6MkXbxvHUdT3vzsyM4M6m0
         6sIMm6I/geOjseFpGw6aMdpacbCogxyDn9nUj2bcgLie6bp13O8vP0MQzpR2LU7J4txQ
         JwTZRk5FKZ2pPSOCTw9bR8zv63eDTNAFBWEqjhOp7zR2hMsAQ+3XVU8vtZcrl+agpAqv
         zCBeOPl9h/3ohCqOBVOCS+L9rJXe1Nz8pF1/p9BcWXGgOi00NRMGIEcF7JudDbcIvNXO
         fzSf0n8r0G0RApRUVEPOhmq8LNK+fuGGIAMTQWO/43P6UQXh4vVCHdk6mFztC27+Lnxx
         +szg==
X-Forwarded-Encrypted: i=1; AJvYcCUpZM9hwcnGAm3bvAUraOVI2CvF4ccTcuh1O0xYN6wGiwncEKQooYh+HaqIwLP3L90i7a0/vyyjKYM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSb4f51GROf+qEmI0ObHcSH9nw2SOgO5AYU/pH8yNrsIkCQ5XR
	BCSf8oayR9JzvIfO00U2NIsIUwJD0oXNo/AeDSgYs5J4iJvmf3sHcVxcFgAWfxizCg==
X-Gm-Gg: ASbGnctILBCbNJI6TlIsonLcDa/gpIZfUCEPZUO1zAvtkOjgKShXxy+8O+qMxoHy81W
	aBZjckx+O4JyuT5MV0/+5f2fvaJQkKfT6WLilW5qrV6oAVBRbQ8KATMBJ081XwulEfPzpva31xu
	F9vCcORPxgweEQcaWIKLMmrfuAJ4Ti/lyIlcrTR88CabHvNBaAQMan2Ar5WbQdzFEKEnS266AJ7
	4lpX1wQq3CbaSZ0UQdgBlzDx5QIal2Nk5w1j03SUM9C65pHnPsE8ZUViMyZXbi0QJVYeb0leP/U
	joFFJS0/KuCeuFJFVEMuqdZ3szj4CKLfeXRdHkBU09Kfc77VlTDonM3NVGEHGjBksx3oGVt0A1K
	UNNSSEo2bZW8eI172onjYXfYKtd8d/USxfMK9
X-Google-Smtp-Source: AGHT+IGzb1egvPvnA8XI0Kya/EZBWWSS3lu0jifzdeGaP3m17xxysht+ccq3tnrzQ8JVxzALorBhkg==
X-Received: by 2002:a17:907:2d1f:b0:ad2:40ee:5e29 with SMTP id a640c23a62f3a-ad536b56f88mr174089566b.10.1747391883980;
        Fri, 16 May 2025 03:38:03 -0700 (PDT)
Message-ID: <885b6722-5a68-419e-9d63-bf5977194c96@suse.com>
Date: Fri, 16 May 2025 12:38:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] x86/gnttab: do not implement GNTTABOP_cache_flush
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250516094535.63472-1-roger.pau@citrix.com>
 <20250516094535.63472-3-roger.pau@citrix.com>
 <b7d2f338-6918-4052-99e1-733dbb0aac7d@suse.com>
 <aCcUHtWNBdbK7Iy0@macbook.lan>
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
In-Reply-To: <aCcUHtWNBdbK7Iy0@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.05.2025 12:31, Roger Pau Monné wrote:
> On Fri, May 16, 2025 at 11:48:48AM +0200, Jan Beulich wrote:
>> On 16.05.2025 11:45, Roger Pau Monne wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -35,6 +35,11 @@ config GRANT_TABLE
>>>  
>>>  	  If unsure, say Y.
>>>  
>>> +config HAS_GRANT_CACHE_FLUSH
>>> +	bool
>>> +	depends on GRANT_TABLE
>>> +	default ARM
>>
>> To keep arch stuff out of common file as much as possible, I think this instead
>> wants to be a "select ..." from ARM. Then:
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> My first attempt was to do it as you suggest, but then if the users
> disables GRANT_TABLE you get the following warning:
> 
> WARNING: unmet direct dependencies detected for HAS_GRANT_CACHE_FLUSH
>   Depends on [n]: GRANT_TABLE [=n]
>   Selected by [y]:
>   - ARM [=y]
> configuration written to .config

Right, it needs to be

	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE

(and the "depends on" on the new HAS_* can also go away; HAS_* imo shouldn't
normally have any dependencies).

Jan

