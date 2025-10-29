Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027B4C1B04C
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 14:57:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152781.1483288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE6g9-0001kn-EF; Wed, 29 Oct 2025 13:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152781.1483288; Wed, 29 Oct 2025 13:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE6g9-0001iT-BL; Wed, 29 Oct 2025 13:57:33 +0000
Received: by outflank-mailman (input) for mailman id 1152781;
 Wed, 29 Oct 2025 13:57:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vE6g7-0001iN-GB
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 13:57:31 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 349792ff-b4cf-11f0-980a-7dc792cee155;
 Wed, 29 Oct 2025 14:57:28 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-475dbb524e4so30563175e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Oct 2025 06:57:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e3ace25sm50398605e9.9.2025.10.29.06.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 06:57:27 -0700 (PDT)
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
X-Inumbo-ID: 349792ff-b4cf-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761746248; x=1762351048; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5E1rEKjUCDH5Wjk0NxuPTVgdssow/HBur47X3j0fDyY=;
        b=X9a8fWCbz5ZkpsYxCxu6e2DYJE5rLD0wcarirYoG2mequwIxPznufJJXvXPcfgm7FJ
         mgAGeFRDkq4AE6zP/cc5JuYGqPT73GTOEwbwCI2h9RMyXI5pAaqrEMuuJ7Xi9c0NPF1Z
         4WN2e0T/+7/3isoO1NoSn3CzMiUPb9YNJr5F19BRFYMyFDQ7TuGR3xIhbsOirN0L/JhW
         YDEAMvTTnqlRl80MJGFrmtsp/BcIEnbR417+U1GKBtlMS0pVaLQzRtxZ/GVwX645n5Lt
         asjkO1G3Qe1Qvo64HbZf9drOpb8bHm6ABMpFGlvj5LWwXEk9vN61pO2sqmtjDJxU3tIq
         fWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746248; x=1762351048;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5E1rEKjUCDH5Wjk0NxuPTVgdssow/HBur47X3j0fDyY=;
        b=r+x/2TYgyOyWjXR7aq4UJxUGTV0hD7oCnyVUfEsWXqzd92cm5+WQnQeCKXpQ7YogRj
         4Ojp6GxzzG5LZaab+HEX35xygzUg3Kzsol6dWBYs8+A96axuPG2eoPE/+ENd8ggFR3/c
         KKiXhXyoeM177p8yLFpki3d6tYCY0JEdumgGWp7SYWGLKavWPQvBzArELGmpae3GjGUx
         5AE1iYTUaxG81gLeU1VXWV5qbY8MUb1RMzyK3nMTFWQoLumjSUjsDBI2EXeWwzrB2DH1
         68Wbf649IEMOWkB6U7+iLwci6QnT6pR4St+ntZo0KvH3aiRoy4T+RS/afPaFvP95njxT
         ekuw==
X-Forwarded-Encrypted: i=1; AJvYcCWmtmwGlEa3qJNQAc5e3tb657HLp14tGN+j6Tb+1UIyU+uWKruT2b8W7w4eIjAZDSfxpGZFd84ZsM4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbF1gl6roR6H/CdN+UVIti2qwCHYHz3mBDqnXuhhF/1IcxFksM
	zmMVzJhw0pkRD3LUbcEzJrFoGBnB82j2R+6d+wVCDfh9lLBUP/ffcYDouvoXgchxrw==
X-Gm-Gg: ASbGncvXNI5tQKCsXIyeLCvgn0JlJcbMQyTOQjIIxhEhPu/30q1LSoPwO33yPCbuSfY
	tINpwvhRe4Nqy5H8wWMfeueiiG3BNE1UsdI2fL3exgm47wdZN1k6t0eOR4mFoWqIDN6VpgqJEV9
	5+wT7v1sxiGhTn7qH/P+tLe0prNmxjyT0OMyMt2LZkaQX/RiM9Q5dbMBAVlMkDu54N6lPAQdTNC
	PaEPbBM6NTKzj0/kBMCWDJkrHU84lD65MNgT9r1u2DMTPc0VC20nai5GzGhF/ltrpKASzxZlNij
	EnfzqEN9QoADEaHdC8T2QEx0pAI/Gl1C7GkF+4tBJjd/WvdTVYk/smJo3qWvP9UkjZDCYYo+I07
	oqLwxFu4RK0nNO/gsKNkW47sdie5K7aOr3BYLWvJLbeTS8FYaNHlGDfVT52A0aNdDHp4yLJVn0g
	Yg1+40Zbee21ZY/MAJ5tk8CyxBqAt0mW1FTqK8CdjPcw4jO6RIaWz8nN6oOS+k
X-Google-Smtp-Source: AGHT+IHeVUcAurJ34ix6WX8yY2+g39ljNhraLhbOpQh4C4psFUgsoL8mu5Xs0fnqK9BC08lLWToVvg==
X-Received: by 2002:a05:600c:4ed1:b0:456:1a69:94fa with SMTP id 5b1f17b1804b1-4771e177c4amr28434545e9.13.1761746248056;
        Wed, 29 Oct 2025 06:57:28 -0700 (PDT)
Message-ID: <9f264a58-9ca2-4323-8f79-edabe70a07a0@suse.com>
Date: Wed, 29 Oct 2025 14:57:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: remove references to
 docs/misc/kconfig{,-language}.txt files
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6f72dcebf5dbb69e9496b7f0ef96198e9bb9f1e9.1761745058.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <6f72dcebf5dbb69e9496b7f0ef96198e9bb9f1e9.1761745058.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.10.2025 14:38, Dmytro Prokopchuk1 wrote:
> These files 'docs/misc/kconfig{,-language}.txt' were deleted, but
> references are still present in Xen. Remove them to clean-up.
> 
> Fixes: f80fe2b34f08 ("xen: Update Kconfig to Linux v5.4")

Hmm, that commit replaced the .txt files with .rst ones, so maybe you want a
2nd tag here referencing 044503f61c95 ("docs: Delete kconfig docs to fix
licensing violation")?

> --- a/INSTALL
> +++ b/INSTALL
> @@ -23,7 +23,7 @@ Xen Hypervisor
>  ==============
>  
>  Xen itself is configured via a `kconfig' system borrowed from Linux.
> -See docs/misc/kconfig.txt.
> +See https://www.kernel.org/doc/html/latest/kbuild/.

Is linking to "latest" doc really appropriate, when we don't even try to stay
up-to-date? That's what Andrew's commit suggests, but I dare to question this.

> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -1,6 +1,6 @@
>  #
>  # For a description of the syntax of this configuration file,
> -# see docs/misc/kconfig-language.txt
> +# see https://www.kernel.org/doc/html/latest/kbuild/

Maybe more specifically https://www.kernel.org/doc/html/latest/kbuild/kconfig-language.html
at least here (with latest possibly replaced as per above)?

Jan

