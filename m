Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FE49C86DA
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 11:07:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836193.1252071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBWlC-0000Xr-C4; Thu, 14 Nov 2024 10:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836193.1252071; Thu, 14 Nov 2024 10:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBWlC-0000VA-9Y; Thu, 14 Nov 2024 10:07:34 +0000
Received: by outflank-mailman (input) for mailman id 836193;
 Thu, 14 Nov 2024 10:07:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBWlB-0000V1-8j
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 10:07:33 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 424cf16e-a270-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 11:07:30 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so5410815e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 02:07:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dab80869sm14787605e9.22.2024.11.14.02.07.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 02:07:29 -0800 (PST)
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
X-Inumbo-ID: 424cf16e-a270-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzQiLCJoZWxvIjoibWFpbC13bTEteDMzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQyNGNmMTZlLWEyNzAtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTc4ODUwLjc4ODcwOCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731578850; x=1732183650; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h35C8okQB3vNG4nYnR3qa6Ma0o9RA/+n/DAO/zZDwzY=;
        b=Guxe0J+fbZQb0rTPaL5MaJ3l2oNdOkFhu50DP+bbF4xbhbla/HXMBjTkewvrvwZtoJ
         mIkSh2JHwJUKRI7wbiPppncMA3tJVCycMvkppbXu51Q2B5DekbZ9Urh3Ws65L4VqF4T5
         EZzmkOpbP5vSzuRJguZWJ2ttLvmj2aQnIlfctNGYBGrFFpUrAM/D1xhCgojTOm6p0PIb
         Ue4E695choF9H8dodtMVHqnOX6AKJoP2pTU4whOZcGhlQDBEcifi1eKci7OyVLS7bCHi
         ilfreoJwkHqcsyyZhANXSPFi6h6mW1fOW/Wp1cmAdmCiWQ66YY7nbF3DEO/+f63L/jEf
         ExvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731578850; x=1732183650;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h35C8okQB3vNG4nYnR3qa6Ma0o9RA/+n/DAO/zZDwzY=;
        b=vPpp88rwohAWBod4Ne1waXxXRdCqfFqZXZZwLorDajKLAk/MXeUkqAieMjlO0cGe8h
         ekXa/SvtwfTMsL7yK/JaCkU3MoZK6oSZvfRRNDApQIM+RfKjW+78r9m/ynTrdkBrh9kj
         oUIkEy51skMpMEawZmc/uxOW3JO2S8AkH7k7IqNsRiw3BQPz5vPL1tkOTA+IqdTA6EvR
         sKLtx0d32SwzQrPmBuUV6b6StKxNKABa74Prg2mNdOoNR9z5MD1g/43X6Oy++E+SCqqm
         iHIcZh23FPjpKdp+7w2uS9v6ugRMc1fqu/wl3k6huDMh3jXjo8SC+IVDGyq0MkDZlxjo
         ko+w==
X-Forwarded-Encrypted: i=1; AJvYcCVVjmOd4wcXZxQrF+bgknvV4dMmy8NBwBWPlfmc3Q0P6VptETCicDtJGBVsI+kWauoA5iJTKCfPBFo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxzbWOn4If2/KBJYcSnigJY4s6hsm358y8myfFBHmiUS+AZWDG
	If4MnYx6FROU0w3NAj+HaUOGBZFdeFxLuMwDOEBup8eatABU1m1MgIubsE19VA==
X-Google-Smtp-Source: AGHT+IFv+mi/8TtfDSFXoiFf+r7veAvvmt6Alm4tF7Jef+vjQ8x65PxZWcWFJjkuJ+W7QVD5CxHBbw==
X-Received: by 2002:a05:600c:314c:b0:431:9a26:3cf6 with SMTP id 5b1f17b1804b1-432da7a050fmr17177635e9.4.1731578849976;
        Thu, 14 Nov 2024 02:07:29 -0800 (PST)
Message-ID: <f9142dfb-8403-46d6-a4a9-3d09966cefb2@suse.com>
Date: Thu, 14 Nov 2024 11:07:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86/trampoline: Check the size permanent
 trampoline at link time
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241114090810.1961175-1-andrew.cooper3@citrix.com>
 <20241114090810.1961175-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241114090810.1961175-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2024 10:08, Andrew Cooper wrote:
> This is a little safer than leaving it to hope.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



