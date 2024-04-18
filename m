Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60748A985F
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 13:17:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708225.1106910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxPkk-0007Is-UC; Thu, 18 Apr 2024 11:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708225.1106910; Thu, 18 Apr 2024 11:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxPkk-0007Gd-Rc; Thu, 18 Apr 2024 11:16:30 +0000
Received: by outflank-mailman (input) for mailman id 708225;
 Thu, 18 Apr 2024 11:16:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxPkj-0007GV-Pq
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 11:16:29 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1974cfcc-fd75-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 13:16:27 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-418a02562b3so6186295e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 04:16:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a12-20020a056000100c00b00349ceadededsm1598066wrx.16.2024.04.18.04.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 04:16:26 -0700 (PDT)
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
X-Inumbo-ID: 1974cfcc-fd75-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713438987; x=1714043787; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMNGKzRzUdfJ3G/0b2iRXr3nsFYo6Mcz9mjsNx0KCi0=;
        b=EMQGYH7ASrx6LEXRXHyjbNUMNhFaMgNB72WyRkp2hqhdEvWebL7W6FCH4NEuTrd2kh
         /cMeXuW/KsQkCfBiQh2vwCjYwAYVo24nv9736Px7SneuWvCR3Yzo6wG7cGDpZj6PByTB
         Ps3DwX+RMa7vftUuK+0Rw48FJ+n0PWr24XRKV++RTAuyW6leZ40/l9goafUwljv0MINj
         /SCeNYHBlZu9rrp+QiobZEqMH2XbgsFRqOqGZvwzA+PeiXh/ZdIvDKboXZ03ET/qh2XC
         vPir5Y148jTHMN7WZBkJm8jG11hhDfahjjbkeucGi99m0fbeuvFs4oKeQpiHB0LIFb0y
         AV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713438987; x=1714043787;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FMNGKzRzUdfJ3G/0b2iRXr3nsFYo6Mcz9mjsNx0KCi0=;
        b=Um/e7PgT2GajRWvQ6abLu/SF8IjhbJ9V1tMxMnuvNkzXY4W/I4/bAH0rfXQOorjkpg
         YoAIAkoS5Hy1owbKQwCWcNOA6E7ROmQtnHpQ+pEYW+4xn8tCT+ZUwQA9NsUqFgHDQYVr
         h78J+wS6x06JiA9ZhV66iTUTA3rpX1/hU/D3S/Y8jYEZVCpkB6neruf6lxvRdvJGr3KG
         kHNBjb3UJfqLvlvDjWYeoE0z1J/uv40AMeNSyX8CK3D4wRuyQcGHDUfZhCwlhNqbbaaM
         QkKGq7/ec/QYFba7pz74dhnm1j6aTvhaPJnT2NK7Ouz5dhH5N9cHf9GF39crCWm31U/+
         BCkg==
X-Forwarded-Encrypted: i=1; AJvYcCWLl3RretGJqXFpMBGj+CDttpcQpSLkUSZARF9EiT45R2SKkaAU1A0Mc9qbgPTJ6IhnrpxWn3k2GtAuBcA7t+cIft9+GHvGGFSUxcsESiA=
X-Gm-Message-State: AOJu0YzgOslYxnM1dFBKuqgDLQtsVrQ+bZNK+ybhWioEetVkakwrCKl7
	dNBkieyT+Y9V19bBaV8WWUhJzyDC053STIC2ys1TgpQGEHCSdkT1+RzKRXkrtg==
X-Google-Smtp-Source: AGHT+IHlkGQlv1GSZcuHWNdAlgXqxkh0tGTRSB2V8bQuVp1PlmMMwK5iaNoaalsO+64M9HrspNFd3g==
X-Received: by 2002:a05:600c:444a:b0:418:49ad:6fd3 with SMTP id v10-20020a05600c444a00b0041849ad6fd3mr1620672wmn.19.1713438987023;
        Thu, 18 Apr 2024 04:16:27 -0700 (PDT)
Message-ID: <6166e740-3710-4687-ba1f-d4058a2e3d55@suse.com>
Date: Thu, 18 Apr 2024 13:16:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 01/15] x86: introduce AMD-V and Intel VT-x Kconfig
 options
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240416062052.3467935-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20240416062052.3467935-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2024 08:20, Sergiy Kibrik wrote:
> From: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> Introduce two new Kconfig options, SVM and VMX, to allow code
> specific to each virtualization technology to be separated and, when not
> required, stripped.
> CONFIG_SVM will be used to enable virtual machine extensions on platforms that
> implement the AMD Virtualization Technology (AMD-V).
> CONFIG_VMX will be used to enable virtual machine extensions on platforms that
> implement the Intel Virtualization Technology (Intel VT-x).
> 
> Both features depend on HVM support.
> 
> Since, at this point, disabling any of them would cause Xen to not compile,
> the options are enabled by default if HVM and are not selectable by the user.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

In the subject tag you say v1, but I think this is a re-post? In which
case and with it having been a long time since then it would be even
more so important that a proper revision log is present in each individual
patch.

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -120,6 +120,12 @@ config HVM
>  
>  	  If unsure, say Y.
>  
> +config SVM
> +	def_bool y if HVM
> +
> +config VMX
> +	def_bool y if HVM

It was probably me to have requested this form, but meanwhile I've learned
(on the Linux side) that newer kconfig is capable to dealing with

config SVM
	def_bool HVM

config VMX
	def_bool HVM

quite fine (i.e. no longer leaving around useless "# CONFIG_... is not set"
when (in this case) HVM=n. Please double check with the kconfig we use
whether that's the case there, too, and simplify if so.

> --- a/xen/arch/x86/mm/Makefile
> +++ b/xen/arch/x86/mm/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_MEM_SHARING) += mem_sharing.o
>  obj-$(CONFIG_HVM) += nested.o
>  obj-$(CONFIG_HVM) += p2m.o
>  obj-y += p2m-basic.o
> -obj-$(CONFIG_HVM) += p2m-ept.o p2m-pod.o p2m-pt.o
> +obj-$(CONFIG_HVM) += p2m-pod.o p2m-pt.o
> +obj-$(CONFIG_VMX) += p2m-ept.o

Please can these be kept in alphabetical order?

Jan

