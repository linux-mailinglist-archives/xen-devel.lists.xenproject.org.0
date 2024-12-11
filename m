Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A169EC5E4
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 08:47:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854003.1267316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHQm-0004om-Ei; Wed, 11 Dec 2024 07:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854003.1267316; Wed, 11 Dec 2024 07:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHQm-0004m1-C3; Wed, 11 Dec 2024 07:46:48 +0000
Received: by outflank-mailman (input) for mailman id 854003;
 Wed, 11 Dec 2024 07:46:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLHQl-0004Wu-0n
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 07:46:47 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1268239c-b794-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 08:46:46 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-434e8aa84f7so37327025e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 23:46:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef2708b807sm12793724a91.43.2024.12.10.23.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 23:46:45 -0800 (PST)
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
X-Inumbo-ID: 1268239c-b794-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733903206; x=1734508006; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cBqtTvH3R1pz0NEETzJ3MOIMbUmBCgNF/TTgWnNyT2U=;
        b=Il+XtDdB/evBxWLNk1WU2y/2SEW7TN1RA/9yYySrsFLF82vdp6LREBzqdiGra88458
         d+YEmv/KL5DaujvK8DGzjH9O1vOWMD7yXLpncvx/YeiAMNxC2JaF+BghDu85Ry4Qxt3R
         ASmIMBs8dBFo9BV+YrVsfdke/ZPB9uJkLDqieXDxN4+IU7di27RE3dOOd0+JQgw/KiaB
         W6eepLCsdYtZPa/OVzBKs3P9AKc98sQwwJopl4yQ98PStXphStjdw+EiRxW4VTqliy+C
         ZLA6gpjWi6fa7/Hokpodam7k2NMqcmQi3V1u/vHapCahx45qJykMyHeNdNoruAS95uir
         HaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733903206; x=1734508006;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBqtTvH3R1pz0NEETzJ3MOIMbUmBCgNF/TTgWnNyT2U=;
        b=EWCxR2M1WT9GWzGFDunrpxJlmCy4NhGOssnrJ5MSamFfrYU2CafyDnOC6z7ixZm0zG
         1VqOvOYQWE9WB1I/zkTIKu5CHVrqwPbfwPYTnui6l5t695q+spYinsAGSst7bcyDNqmM
         fZsv2Jo3fkeKQdW/HrIkcpJlEwWvH1x1/bRCPy2z4dEcLarmVEpvwyIDh5cwJhGPQU4N
         fIl4Gb1OgpPXcEjxIlGWJYwAxEwokYd9ZMXoQ/gnwsBkevGIVMPs1NEWKCrV2hmO1Yee
         BclgWcQ67jVy9U7+nU4tDh+B1fODnKoazsFsGwwWUj/g3cNoiolleUOloJZyRE7ghVIJ
         NPbw==
X-Forwarded-Encrypted: i=1; AJvYcCW0bqWDQLKYN/5fmJvSRXfIty2iZhvoh1LGp6HUmoGSRQWpbPujmFIXwvuPHXpWvBbGZtUPcnFGvjU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyGYXqO5igWAwuL0rk/N0fPeoQCGjuN4Dj8i0C1otDFdXlBM8/
	Ae52vE86Z/6Yic6+G5fMtyQ5BSC4O6vqu4Pkr3WiybaKgbB0pVcbhyso1uMvfw==
X-Gm-Gg: ASbGncuWvBOXo0nn1JoWrSutnWYlMRq1pRbAT6z0543Z2IlpBq/9B7OavmcRdQYT6pc
	ukfL936Oxxe4BjQFwTTXsTvK0p9eayo/pf55wKx0tZFcXqD/TCGjSjFpTym2BCdytr5p9g9rDr0
	I6mzd/D7+wRLwiyies2HAyh22CGf+j+07kzIwdhQX8vw8UmcgD9M0rqKaG6tEN3GQ804eEnuSDJ
	kWX4bJUf41c67N7gDYZxLo6S91cUYtdBNhW86e+WSjvX3m/AzadDCyzYkUM9/wgk/pWNPoKK0hu
	awJXqR+IxTp3bz3m+mMiGqC2riiCvRcT5dxsQGs=
X-Google-Smtp-Source: AGHT+IFDST+NwUbVRb9fWZdqCIA2B/IhslDvmwuJVfkQxy9k6AEgkAzPTBoXFSJXDTYH/meUNN2z3A==
X-Received: by 2002:a5d:5989:0:b0:385:fb2c:6034 with SMTP id ffacd0b85a97d-3864cec3a6emr1238840f8f.47.1733903205941;
        Tue, 10 Dec 2024 23:46:45 -0800 (PST)
Message-ID: <f1e86e0e-985a-41ae-a94c-979288275257@suse.com>
Date: Wed, 11 Dec 2024 08:46:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add stack protector
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2024 03:04, Volodymyr Babchuk wrote:
> Both GCC and Clang support -fstack-protector feature, which add stack
> canaries to functions where stack corruption is possible. This series
> makes possible to use this feature in Xen. I tested this on ARM64 and
> it is working as intended. Tested both with GCC and Clang.
> 
> It is hard to enable this feature on x86, as GCC stores stack canary
> in %fs:40 by default, but Xen can't use %fs for various reasons. It is
> possibly to change stack canary location new newer GCC versions, but
> this will change minimal GCC requirement, which is also hard due to
> various reasons. So, this series focus mostly on ARM and RISCV.

Why exactly would it not be possible to offer the feature when new enough
gcc is in use?

Jan

