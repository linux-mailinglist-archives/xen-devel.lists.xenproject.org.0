Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBE5AB5964
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 18:09:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983111.1369468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEsC8-0001uF-FB; Tue, 13 May 2025 16:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983111.1369468; Tue, 13 May 2025 16:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEsC8-0001rK-Bx; Tue, 13 May 2025 16:09:28 +0000
Received: by outflank-mailman (input) for mailman id 983111;
 Tue, 13 May 2025 16:09:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEsC7-0001rE-4Z
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 16:09:27 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a38c8a46-3014-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 18:09:25 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ad1a87d93f7so885480966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 09:09:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd2c0sm798346566b.130.2025.05.13.09.09.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 09:09:19 -0700 (PDT)
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
X-Inumbo-ID: a38c8a46-3014-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747152564; x=1747757364; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+EF/B3R6fhMuYybsaftITDkJqLfXGKGTJ0TR54IzNfQ=;
        b=B6oxkMSbrhy2ylK7y2EYUbhnbGvEd1a7H5AzHTZdpgttk4s1sUTC5I5BzTAjJ/O3vL
         nY6HTDBtaHlTfM9dHpGMK8hwKsyFH2fqTUdqIyq3uMtX894+GvIKICt38MCWF810CTCr
         CfZgxAhwF9D3//tnoToqI+7ioZIPnb1Zy7faajIikeRA3aLsD2MhMfqvLbpzdBnSnHGc
         5fxF7PuQSBpzEvuQSZM3ls8jjnlgWkZhwCfq9Ka5oHOo4uOszFjKpTO4Y31nkwHcwxb3
         vqJtQRF4zA/67XXOD3qzsftBSx15VXQw5TYWukFc5rr1MynPFVf6Xo92R1cH9xesscIX
         nIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747152564; x=1747757364;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EF/B3R6fhMuYybsaftITDkJqLfXGKGTJ0TR54IzNfQ=;
        b=hweiD8b2vXZH5BFpyKdz1mwpEwLukpzGGN9esGqYwFlpepkAEr8KLGfeMR/gFjHyx6
         EywWcr4KgzN0a+OgQk5i5msRls3NXUimUURIShbniXhbkc2gN5+hb8+K1jhY5mNgpIGg
         Vpsw+ImjXR4xZAK/517AImCh1h9DqJRHMcCf+Vfri3Ie5+DcYiFfKFkZFLVnwiTr882z
         xGcTiOLToQ2IWVBb+wdYxP4jyVGErQxOI6e/ry6zGF8bAxUbz5LZbmJjI+2PQZm+mtef
         oNbhkWmOIOElLZUc+KIxFFOyjARsj72Y59c2pheVB0+7FMocpSWHPz/ZldsrDx8RA7Tp
         EQzA==
X-Forwarded-Encrypted: i=1; AJvYcCU1Av9VU2iKA7J+45L05FkAsG1YdEfeOu/5O10vmxAwo6ilUxSvP3xE9pH77o8jplpMQc3i/FzjnTY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydUomdtho0eLT7PP0RyOYslfe4q/BGd0eoJ8Mnkof3V8Gztv/w
	mhC1zCRayZMGOf3OMY1BvwWlLfF2IQrE8dYzlX//uunJGqG+vbbviRVk0Bb6hg==
X-Gm-Gg: ASbGncuj2gcRtpfzbSbDFBLpIkZwvN+XF+ZZdLDqI/6eGV/B9sEna+46SL9pVzhMLmR
	YdYih7uNPA0VPM319TzGjcxOe6iryYm8Fqav7klSh72I6O7aY7aFwqREGpjnHOieRC1Ces/NhLW
	Gx/xaCLMbhCVosrMp9Czd5QIK/oagWGAFbqFIk5IkIZ9miLuAaZ1ZqlSOsN5Tmgzucm15GDfScJ
	9HKABCic8+ZsrfbZyEJhNsFdAnc8K9PCYarF/HOaSNpHiYNKsCbKbDH1W0gY0FenQ4pLhIUMrCk
	pflsW9I6CWP2V9dzETBSLq0BKWTOWgJmpsE4rf//FrMcDUdZHapztUnZlEyn5IVezkljlIt0miy
	KRY+CXxj4xzDiqqNW8JqkbecW+JywR6i/hPr9
X-Google-Smtp-Source: AGHT+IFPpu4pfQ5TpO7rV+E6nGI8SR/dPtvjKtLLetPlJSSudg6HOgJZ/7VLC1Ml+Lxr6aSgzKLY1Q==
X-Received: by 2002:a17:906:6207:b0:ad2:5499:75a1 with SMTP id a640c23a62f3a-ad4f715873cmr14568266b.32.1747152559332;
        Tue, 13 May 2025 09:09:19 -0700 (PDT)
Message-ID: <9575eb5b-d789-4430-aafa-0b8fc5070952@suse.com>
Date: Tue, 13 May 2025 18:09:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] Add lockdown mode
To: Kevin Lampis <kevin.lampis@cloud.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20250506162510.1676425-1-kevin.lampis@cloud.com>
 <db6316fb-89bd-4891-a4ff-2a13feda112f@suse.com>
 <CAHaoHxY4W2bbi3i+R_-tk7PG+4s2OdU9OSf1+o1wDXTvMBJozA@mail.gmail.com>
 <504f0be0-91fd-4847-8fcd-505771674814@suse.com>
 <CAHaoHxYojvmAe_jtwjHzCMKGKa_0fkGc-cbypRpKCRFQt0sbHw@mail.gmail.com>
 <55e73266-7727-4a1c-93e8-dd69712d64d2@suse.com>
 <CAHaoHxbvT5dbhVMnrPoWq3ma-maeLJh56N--B7svMXU+gY2Yrw@mail.gmail.com>
 <d5e62b4f-816f-4948-a9ec-4a7dedcb31d2@suse.com>
 <CAHaoHxbiQgiRpZLTP4RaEyNyhXYaUejZrESqM6NzH_t+EqdqQA@mail.gmail.com>
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
In-Reply-To: <CAHaoHxbiQgiRpZLTP4RaEyNyhXYaUejZrESqM6NzH_t+EqdqQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.05.2025 17:59, Kevin Lampis wrote:
> On Tue, May 13, 2025 at 3:32 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> Well, it's easily possible to catch that error without any extra parsing.
> 
> If `lockdown` is not the first argument then we should print a warning
> to tell the user that Xen may have already parsed some insecure
> arguments and lockdown mode will not be effective.
> 
> What would be a good way to check if lockdown is or isn't the first
> argument? I am not sure.

It'll be a little hack-ish, I suppose (yet the option is quite special,
after all), but I can see various options. For example, have the resulting
variable not be boolean, and OR in a separate flag after parsing the first
option. Then warn if the flag is clear after all options were parsed.

Jan

