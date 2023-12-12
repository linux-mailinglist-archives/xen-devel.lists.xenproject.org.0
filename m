Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 858B780E8B0
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 11:08:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652913.1019050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzgS-0005a9-2q; Tue, 12 Dec 2023 10:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652913.1019050; Tue, 12 Dec 2023 10:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzgR-0005XX-VC; Tue, 12 Dec 2023 10:08:11 +0000
Received: by outflank-mailman (input) for mailman id 652913;
 Tue, 12 Dec 2023 10:08:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/PU=HX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rCzgQ-0005XR-JL
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 10:08:10 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 595a1ab1-98d6-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 11:08:08 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33338c47134so5098293f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 02:08:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 je16-20020a05600c1f9000b00405442edc69sm18164399wmb.14.2023.12.12.02.08.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 02:08:07 -0800 (PST)
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
X-Inumbo-ID: 595a1ab1-98d6-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702375688; x=1702980488; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KZwg/RtqM0NKLso9LDrpoMoAu9y2dzBm8vps/3U6MIE=;
        b=HpAP8PdGOu+W15FUDrjccVmt5scRh965iPZSQwe/W95CXDwVi6ANSXYVOqmLA/TRhr
         +nfMqQBhPHkTS5UhA40EctXfkgjas6DGPiTv+KMIsERyF/8S4RvRKD18G3TuRkbjoUuL
         vS54ZsdwggijdLVIW4whmO3KdPegFZybf3xdR/gB3wGavqZ3n/mKXlmKDDSu29CETLV6
         r/HzYk604HzEEEZnwCMKLkmsbCdxigEQGHH07U76W7AFUDdmE6N386cg+Z6/v36Ouxsg
         n8bZRl01QuneFcZ/PWyi0ITJ/MTZtfxkeifohd6D/VgmSJIsT0Dz6i5wRG62ebxM9WmB
         EMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702375688; x=1702980488;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZwg/RtqM0NKLso9LDrpoMoAu9y2dzBm8vps/3U6MIE=;
        b=B/jNhlIj1huoXshSJNHhSR+pXf/Go+Jnig5Nm5n3ci+91LDAnFP4gwckHHa25wfXqH
         GHdp49Mui/cQSvbbD2yLdR+chH+HK4ozga148SuxlluJemYcCKzcRkJzEbCDopHJSFLF
         3kdsg4wXYeCEn3W0Rf8pOf40xhH5tG/V63QoWsY90nsyuImVuflwYnWkG09qa1odG+vt
         pJXjDn3Dxx8yz1ybXuTp1JeJ1OI4IGWH1KdWN3ES3KX2jJ3QkDgZzrwpcwJPz2F6fmey
         y6eFWQ+l23qo9KvRlG7fpt50OuOhM6ZLKJZj11wO9l5NmRui5ZFjX74jTFuhdS7tI51b
         Ojvg==
X-Gm-Message-State: AOJu0Yx3zcEXUtA09cD2XyBB7r8DX3iHVKL/6anX7VR0+awHHQbOW6Ug
	NF6Ds8oxno43a6u8OYNLvw7M
X-Google-Smtp-Source: AGHT+IFMpUOfenFNBgzneXK9DaKmJxPHFZ9++jtQn70bdMYhkdtVZOs3a64lS1VjTJePT96WWl3rHA==
X-Received: by 2002:a7b:c5cc:0:b0:40c:53d1:4c6 with SMTP id n12-20020a7bc5cc000000b0040c53d104c6mr152574wmk.166.1702375688038;
        Tue, 12 Dec 2023 02:08:08 -0800 (PST)
Message-ID: <af20721d-c353-4327-8ae2-6e803de4ba37@suse.com>
Date: Tue, 12 Dec 2023 11:07:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 7/7] x86/xstate: move BUILD_BUG_ON to address MISRA
 C:2012 Rule 2.1
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <a969550faea681c69730c0968264781f7739670d.1702283415.git.nicola.vetrini@bugseng.com>
 <1d05baf2-e262-4151-b5a3-308f0ffa1e97@suse.com>
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
In-Reply-To: <1d05baf2-e262-4151-b5a3-308f0ffa1e97@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2023 11:04, Jan Beulich wrote:
> On 11.12.2023 11:30, Nicola Vetrini wrote:
>> The string literal inside the expansion of BUILD_BUG_ON is considered
>> unreachable code; however, such statement can be moved earlier
>> with no functional change.
> 
> First: Why is this deemed dead code in its present position, but okay when
> moved? Second: While moving is indeed no functional change (really
> BUILD_BUG_ON() can be moved about anywhere, for not producing any code in
> the final binary), it removes the connection between it and the respective
> asm() (where %z would have been nice to use).

Oh, and third: Which string literal? I expect you're not building with
an ancient compiler, so it got to be

#define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), "!(" #cond ")"); })

which you see in use. Yet that string literal isn't "code" or "data", but
an argument to _Static_assert(). Is Eclair perhaps not properly aware of
_Static_assert()?

Jan

