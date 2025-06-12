Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C359FAD71A3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 15:22:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013085.1391620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPhso-0007Ri-My; Thu, 12 Jun 2025 13:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013085.1391620; Thu, 12 Jun 2025 13:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPhso-0007P6-KJ; Thu, 12 Jun 2025 13:22:18 +0000
Received: by outflank-mailman (input) for mailman id 1013085;
 Thu, 12 Jun 2025 13:22:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPhsn-0007Oy-Ft
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 13:22:17 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41bc7563-4790-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 15:22:15 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a4f78ebec8so721743f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 06:22:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2364e6d99d2sm13377755ad.130.2025.06.12.06.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 06:22:13 -0700 (PDT)
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
X-Inumbo-ID: 41bc7563-4790-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749734535; x=1750339335; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kqT5/LLk930IJEsFDdlPEKdhXsX/vrLGpTstZqfZ4cw=;
        b=ec+cuIyczGtRc3GVcxoqUV+MIF5R80ZwvefOVIrHBSupHgW/f3p0pSUcx2dd8dIQdK
         UJcnavGZNHyL5kdy7aDixKof2BKIRTH5dejWv2RZjKYfk38oqwvh+XRoHgWCMmGu7J69
         lfeoe2o1X/FqlrqNSFtFd6HhH1SS1mrSU0nkyfVSkVZ6QGnCbKU4JnWsayYv3tNuXIsY
         OkgswiIsxIbOp+GBLuS5bjfJhee4Quw9ErOAwKz9z49KP6PQnVrvnFgsKd2CQzQ2vOxH
         5TyomQxyP8VOoUiDCp6F6Vlp5a4jbgJXBt6FLh768o+raZxGZzY6NEl+RVx9zp0czKFx
         UK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734535; x=1750339335;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqT5/LLk930IJEsFDdlPEKdhXsX/vrLGpTstZqfZ4cw=;
        b=vEY8Z/5Y0Xm1mBkDbjBXZ6ZGICQQeVp1Kr28oZ8hNY6K/b2Pc4vnuCSi16dxgDTZsK
         jj52Rk4wew/xu610NRkiIv0l3Y7scKcbQHDF3Xp9diUjfAtPPynT18hm8x1tOib9J6pM
         BA5Qy09G0TGA4s+yFgDozkgD+72yHt+nwfjR201akM3gUZchXLkDYZSJvgqQDxrj10HB
         7KNjXX1J2F2SKvzDrD1H8yhAhmDD2UPsuqYyJKib54fFmK7Gry/+OvB+AqcC4S72rIMT
         FAUYnQbNa6wA26RaP9PrdhcM+Ku00/eiwZuGoC4TDS6LHXh/F7ITuCFPwq77LaXCpGVZ
         5jgw==
X-Forwarded-Encrypted: i=1; AJvYcCWB8UwBsPPAChliS/5ABrvuGXSAjanfR7FuAgKmL/MTHJoCGmTfZ87Zi/u0zC3jtm7fxe3MbjjYAoo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMtLEDjtTeM1MVujp5897URug2m8P5FCHiphOfAwiSbiROsWRO
	RBjt8eqji6ricbeIyco5JRf65/kLIRZMsaGOXeEdy33uw0ksLV8urJX2H2wqXRGRbA==
X-Gm-Gg: ASbGncuoQzxppSS4sImUTRvffWcVjjMP6AWVDWvgyoMI5w9xWlShGawacYmrLw4q0Q0
	u6i8+qkSt7/hvmcgE+R2y3EZOpYfqrw8BdAG/dMBYiQ0IOhOARU2CXZDENyOlHuD4VkROwDTDCI
	oEST6YAAfkJOCZi7KgruK6rWm1O4irdC0yJArM4SUSUlFczkwO1Mi2gLc6AnMlXe/vRojXeS1Hc
	is/a+Qjh412bczK5wU2mHcspRcCJUSV7JXTSbsDas95mPSv+fLqjcG8u9NKCP/Oja4nqJhxZYU0
	4MeIm2KzdFLUncRDm4ZaYp1EsZX5oAcmmbSIAKQXCU00QfmLZN7trM0u4hEd5zpiRx3gAe6Mdct
	epzM/9B4H9yBVr6d6K6ac9p+sdalEgz4bsqmqGXnSievvQgE=
X-Google-Smtp-Source: AGHT+IHLyXGMPFj3xjDuT5iKPffAPIr21r4xBqfCo5jDkqom6JJNreu37j3/tpv+8pmIbysaPT32Kw==
X-Received: by 2002:a05:6000:2481:b0:3a4:e8bc:594 with SMTP id ffacd0b85a97d-3a56069467dmr2702440f8f.8.1749734534639;
        Thu, 12 Jun 2025 06:22:14 -0700 (PDT)
Message-ID: <53e8cacd-e035-47ca-906e-35f748559328@suse.com>
Date: Thu, 12 Jun 2025 15:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Trammell Hudson <hudson@trmm.net>,
 Ross Lagerwall <ross.lagerwall@cloud.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 Kevin Lampis <kevin.lampis@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250611235851.167385-1-andrew.cooper3@citrix.com>
 <4226d6ef-a1eb-4210-8cae-2b9b2d906d1c@vates.tech>
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
In-Reply-To: <4226d6ef-a1eb-4210-8cae-2b9b2d906d1c@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2025 15:15, Tu Dinh wrote:
> On 12/06/2025 02:03, Andrew Cooper wrote:
>> +Secure Boot Advanced Targeting
>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> +
>> +SBAT is a recovation scheme for Secure Boot enabled components, using a
>> +generation based scheme.  See `Shim SBAT.md
>> +<https://github.com/rhboot/shim/blob/main/SBAT.md>`_ for full details.
>> +
>> +Upstream Xen provides the infrastructure to embed SBAT metadata in
>> +``xen.efi``, but does not maintain a generation number itself.  Downstreams
>> +are expected to maintain their own generation numbers.
>> +
> 
> Why would Xen not maintain its own SBAT generation? An upstream SBAT 
> incremented for every Secure Boot bypass XSA would make it far easier to 
> block vulnerable variants and help downstreams coordinate fixes.

Quoting from the SBAT patch that was submitted a little while ago:

"The SBAT section provides a way for the binary to declare a generation
 id for its upstream source and any vendor changes applied."

That is, the generation ID is per-vendor. Upstream incrementing whatever
ID would be meaningless to downstreams then. Hence we can as well not do
so in the first place.

Jan

