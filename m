Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A598B0784D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 16:40:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045289.1415375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc3IP-0005TN-9t; Wed, 16 Jul 2025 14:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045289.1415375; Wed, 16 Jul 2025 14:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc3IP-0005RJ-6C; Wed, 16 Jul 2025 14:39:45 +0000
Received: by outflank-mailman (input) for mailman id 1045289;
 Wed, 16 Jul 2025 14:39:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uc3IN-0005RD-UK
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 14:39:43 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b51936be-6252-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 16:39:41 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso3169953f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 07:39:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3bbe6bd903sm14041826a12.49.2025.07.16.07.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 07:39:39 -0700 (PDT)
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
X-Inumbo-ID: b51936be-6252-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752676781; x=1753281581; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=65lH/+aIGd8SU1NSg62J/mkbiheGCCh5LG3Ru1ZOMdQ=;
        b=PVxn6AcvdpW8DDLAl/nDW6UUNLVNHX0G6rnLyBdYqWvKosb4MorOuh6DU0Orj2553U
         +eMI7MdH45xdWbzJRxp5VG3uxDa7PdFFNiVSOBEpM60IN5jb1HBWcOTds8UW1L0PTeCk
         IOJLl+CLmN4uHqN8h5C+kqjmqZl89gPR/ATIKgiU+5YdgKtMxaAlFNE97diieY/uUQJU
         LgoYnng2peJpaqdvt1zPJEu+Od9YwmmWOgyf0F2fycHNjmP54BaFS+ThGOn7b58igWET
         nih/P/4uVRJyx08VMavkcD7t0Q4bZ57oNBXvZUFIiFeCototIARdBfnP/yg7W/9SEeXg
         xjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752676781; x=1753281581;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65lH/+aIGd8SU1NSg62J/mkbiheGCCh5LG3Ru1ZOMdQ=;
        b=waaahWRzlq3VnVIH9DnO9/Plm8iREkpfu+d6Mtvj2O6X0izEAL5j+9Jf9So1oyv5X4
         cfIJ1qX2uSp04MOnG9Ys8PDJr9fkHKAlBvAPuEaXIZ93loUmA1xhU2D5cB6LukuLRXry
         RGzyfU+riDLqFnJCpyVkLYCvIe7OjPbYFZaDcSYEv9c9HOG5ghbVJCUdNQn5K0zQJATq
         wcRwXxgvOpnkZiKS7+9Vm6KLB/s+DQDyKedu5/LQ2qHmUx1IeqToMyiSIFu8DPdlNPdp
         m00RKPefxU0kmGnkrUWNHcxR0yMvXujz9TmMH8IVudfY8YzN0PGMIHI+nx67nRkZDUwU
         /AMg==
X-Forwarded-Encrypted: i=1; AJvYcCX2ApHu4rwX0WnkOR9zFRYH21/CLmGwBsjFk4atpC5rzMEdnoHIilVZRW9MHAM0VCcowS0r/sfd8EE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdrQ19MOdY6f8fxpnU3CS8zkDnc0A24pJMCSqCFEV+exTHuPR1
	xnIIpsy7pnfJD63shLaVJUqYfINTn7yi2xDeaEVLJ0sDMkWR/t16bW/Bmavy9c2eqg==
X-Gm-Gg: ASbGncsBMGacY7OIom8nveDcF5Gc4QKgzsnfE9wNosugQxdVv0s75lMh9lLOm2wefaJ
	H9lMUs5EnX2AteXP3zyGSdSMNtkobOWnu2jfykcnb1D5mHu86YCFeORfxZn3eAutOSumMVdQXxb
	kRmZ50TA+t47AO+S6Xd76frn7rN0C5/hCa0D9y/KIkqfJS9cIJgUkQUOdLMrVIvggSJB72BvKpE
	1okmj3vn3PRFP3Tbl605oh5cVaiA9qeW1icUI1zU/zsZuWutllnFfZcrXQ2xzei/aRubpbPCgVt
	Xox2NPIR2dpieAW4qAnn/jjIT+0+r7cZREiFwihdzcyARO1vuywWzaNIFpf9g0v2PKOqbvpm5v6
	h3bsHMhV8VbPGtnbcPW9Wj3hc5iRBmlSrcwzEbpMG/Li2LOTvNT/eRFI9hRl8+12PZTOXJWdyRq
	ZnIrHKTcc=
X-Google-Smtp-Source: AGHT+IF524ENwfXPXVMRxkLuA88s+zmWexcRMc7Ao+aDpIllvMd5aoRh+23HhiRNzzXth671uWxkxw==
X-Received: by 2002:a05:6000:440f:b0:3a1:f5c4:b81b with SMTP id ffacd0b85a97d-3b60dd55b45mr2163502f8f.23.1752676780912;
        Wed, 16 Jul 2025 07:39:40 -0700 (PDT)
Message-ID: <e642029b-c43a-4526-bf00-f113971f0a10@suse.com>
Date: Wed, 16 Jul 2025 16:39:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Prefer d->max_vcpus to dom0_max_vcpus()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250716141807.52585-1-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20250716141807.52585-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2025 16:18, Alejandro Vallejo wrote:
> These days d->max_vcpus is populated on domain_create(), so use that instead and
> avoid a function call.

And it's not just this. As it's not straightforward to prove that two runs of
this function, at different points in time, would yield the same result, it's
also quite desirable that then there's only a single call remaining.

> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

