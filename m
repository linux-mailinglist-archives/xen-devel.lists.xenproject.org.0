Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDDE96A0BA
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 16:33:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789300.1198890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slUaJ-0004ch-99; Tue, 03 Sep 2024 14:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789300.1198890; Tue, 03 Sep 2024 14:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slUaJ-0004a2-6A; Tue, 03 Sep 2024 14:32:43 +0000
Received: by outflank-mailman (input) for mailman id 789300;
 Tue, 03 Sep 2024 14:32:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slUaH-0004Zw-GS
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 14:32:41 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f9f9152-6a01-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 16:32:40 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2f3e071eb64so359131fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 07:32:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb2a3sm692834366b.3.2024.09.03.07.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 07:32:39 -0700 (PDT)
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
X-Inumbo-ID: 5f9f9152-6a01-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725373960; x=1725978760; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LMilm+zN1MVSBPSpieXnHR/mylp1DK9Uy0XzqfnYprA=;
        b=LMajifYslRqelji4TUYh9m23sMVWvMLu+Tb+6wXMDriTQk42PwQ11oh0MtIu/aGRc6
         DvWseqtCQpV6Ko/AY1EZF1vxcaPDsfp76Or4Nymh5IshAxh2XsbrufT22gPs/GuLG7LG
         iYEDoNiJmG0ERiCJaf0X4q4HFxLYnXDzE+zpiYFMAvFuhHkh8N5Dlnk9NBMhz5XhjUxj
         fOu5hUsMUtU+gYQyN/RgTsbhOu7I+RFED7NEAB745HuGqjfYDEy7uls18U9dPw1MFR0k
         uTBogODdlBSNDoGVoNDF8XcjR2Md35QOe2zUuvkjpzflernFT69Xa9b0sZeOOYhY2aov
         V7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725373960; x=1725978760;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMilm+zN1MVSBPSpieXnHR/mylp1DK9Uy0XzqfnYprA=;
        b=MHP5K4DwqpHWaMEKZGwMCmf3cw6Jt1e9PJx9EJvg//W6a6FavJ58+ylo8Xs7uYBvbP
         EPc/49Lp2rtB48Mly/HlPe7ZxyTdviZVQq9m8LBF96zZCGNdbnJ107W/FF+ofMc7CuX0
         Q/zHjoXQTVrWNq/Eu53fB5pMXnsXcypISpDfUvOeod8hWdG38Fr+hnZiuSGPsLx7XgEJ
         J/iC2f2Hn4rW/Q7+RLC/GCBnxRA6q4myCYAqylYxIDA4iQOzVbVHwE027aOMbEH7i2A6
         7aKedkjVWYNiMt01z0CQGI+nl/gxBG/BgZV0Q01TG+gy/LzM/WwkTd9ERIM0egy7Zn7j
         YtpA==
X-Forwarded-Encrypted: i=1; AJvYcCWY2hF5mjwWytVY5psfOZKUy3IPJ2KrcKCQyiHJE3wnFfvzY2f1UkHKKGJH/q3MghQxbgw2MSdzwmU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxBVbE9snXFJrylv1Lm0/gmVPYXuwBV1Kh60uqeFF4+SjOLu2G
	8m8xfBO7i1SHssOscuPytT0sVkauxGzVrP+46jLK+6aOmbW66tbRlhUpjnGAKg==
X-Google-Smtp-Source: AGHT+IE4ePbWic3ELodHV+vxrprYra1zPvQEaf0MzsmFFAxgulsqrHuaK5WmuosrLNEiuGCED+csXw==
X-Received: by 2002:a2e:612:0:b0:2f3:f9f1:4799 with SMTP id 38308e7fff4ca-2f61089390cmr116131061fa.31.1725373959911;
        Tue, 03 Sep 2024 07:32:39 -0700 (PDT)
Message-ID: <2115ac3a-84d3-427a-8601-c37e4732089a@suse.com>
Date: Tue, 3 Sep 2024 16:32:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/boot: Fix include paths for 32bit objects
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240903104940.3514994-1-andrew.cooper3@citrix.com>
 <20240903115334.3526368-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240903115334.3526368-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.09.2024 13:53, Andrew Cooper wrote:
> Most of Xen is build using -nostdinc and a fully specified include path.
> However, the makefile line:
> 
>   $(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
> 
> discards XEN_CFLAGS and replaces them with CFLAGS_x86_32.
> 
> Reinstate -nostdinc, and copy all -I (and -Wa,-I) arguments from XEN_CFLAGS.

And the files in boot/ indeed need the -Wa,-I? I'd favor us not propagating
such without actually being required for a particular reason.

Jan

