Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3912974E04
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 11:09:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796299.1205815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soJLS-0006xA-U8; Wed, 11 Sep 2024 09:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796299.1205815; Wed, 11 Sep 2024 09:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soJLS-0006ut-RN; Wed, 11 Sep 2024 09:09:02 +0000
Received: by outflank-mailman (input) for mailman id 796299;
 Wed, 11 Sep 2024 09:09:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soJLS-0006un-0p
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 09:09:02 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b8ad979-701d-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 11:09:00 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c24ebaa427so1073712a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 02:09:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25952761sm589448466b.59.2024.09.11.02.08.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 02:08:59 -0700 (PDT)
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
X-Inumbo-ID: 7b8ad979-701d-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726045740; x=1726650540; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pzMCOHVgKK4dbRoEujNK9J/rnYQhlnAFDshX2JTyzck=;
        b=gqGqwJuLaziv1cKmXqN+Ia3lN7kyuYJADJHlSVT3mjFVR6VtWpprSvA71HTYjSCJlQ
         2uI8pKbmgpSfnkGKPNL84DR9djcbWg1xHeKaH6zAq4IPmtkR14WNccvbrREGxjJZvRTv
         pTLgoFuRZRgDBD5upUGuQ/lVhJANW2jrAS9bu1YZpfn9G3/d0CDOtlh5jhH2eAEAlaTK
         dnH4L1coXkBYOQ9kljHwu9e9m/yXX3U+z3ljOsYdC29apQASPGDQK/KBOnbR5r4Vi2nn
         JNeOKI0gSsAMOwa0nEEBWGovpv3ZlNMgoCmC5ZiyEggqABHy5KdSzx7nzNA+m9mG6KrI
         L8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726045740; x=1726650540;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzMCOHVgKK4dbRoEujNK9J/rnYQhlnAFDshX2JTyzck=;
        b=XcjdCyI/tCWt5dStLhOIp2bYfVHkfo2ok/Jhde0tf91+p0BlaHa6kz6+A9vTUMYigk
         lSueF4pvXWaLiNfIGXgSlE8Ya8Uyq5baVpOy3J7EUkh7f+0gEbmgqQu0LA7TYi58N1ou
         yX6TzB1jJEG0qs+4JuZydc3uR/fYnq+L3Rh0GA/UbwXJZL1RcQ7MnjEks4yYasK6vTWI
         NNKz5frvIRHBAGyMLwox5L812dN2XufX+K3ki8EnvwWxcKyQ2x+mh+hn/1swE3bZoNhr
         A1QW9efMIHPnNr1tgw8LozkDVosAbB8wvyj9sxXx5xwONWowAqYMxmiFov18uf+MwGl0
         VeDg==
X-Forwarded-Encrypted: i=1; AJvYcCU75EB4vIaxCRtgEjhuzcbraaBN2R2JMmJ++6rG9hqdcqQYkEZSAN4F3USO5aJhyWU4k1xajS1bz48=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYVRpRmDcgwYVRq+VdgTlcxxrEOjMeWd2lf9dBivuhn6eWjRuN
	UFhxFypBwJHBEBYLYx3l13VlZfv2DCVY/SBFbBAaJtlKsTdI0o5yoinWs/UB/2950xkELtFFqAA
	=
X-Google-Smtp-Source: AGHT+IFVagSWbVv8bLFw4ZrhnA2NQg5TigFuVBPrq7AhXjCXaigcndeeEdJ0MCufzrxoM2D/ycoSQQ==
X-Received: by 2002:a17:906:bc24:b0:a8d:43c5:9a16 with SMTP id a640c23a62f3a-a8ffb1c213dmr391382066b.6.1726045739509;
        Wed, 11 Sep 2024 02:08:59 -0700 (PDT)
Message-ID: <1a5b71df-dd4a-48bb-aaca-176376a33047@suse.com>
Date: Wed, 11 Sep 2024 11:08:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] x86/HVM: remove unused MMIO handling code
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cd97dd61-c75c-4ab6-b36f-b2b035c4a564@suse.com>
 <d5739021-be35-4414-8ebe-efc472df4231@suse.com>
 <09c85d55-630b-44c6-ba71-e0f0f68bd727@citrix.com>
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
In-Reply-To: <09c85d55-630b-44c6-ba71-e0f0f68bd727@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.09.2024 20:08, Andrew Cooper wrote:
> On 10/09/2024 3:40 pm, Jan Beulich wrote:
>> All read accesses are rejected by the ->accept handler, while writes
>> bypass the bulk of the function body. Drop the dead code, leaving an
>> assertion in the read handler.
>>
>> A number of other static items (and a macro) are then unreferenced and
>> hence also need (want) dropping. The same applies to the "latch" field
>> of the state structure.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> In the read handler, I don't think we need to fill in ~0.  A while back,
> we had the base layer fill this in, to fix stack rubble leaks.

It fills something, yes, but 0, not ~0. Plus I was trying to make obvious
by just looking at the function that nothing unexpected can happen even
in release builds, if the function was really called in error.

>  Either way,
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

