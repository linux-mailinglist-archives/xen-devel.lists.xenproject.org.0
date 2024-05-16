Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F9D8C7466
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:10:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723018.1127542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Y3O-0001wV-EP; Thu, 16 May 2024 10:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723018.1127542; Thu, 16 May 2024 10:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Y3O-0001uD-Ad; Thu, 16 May 2024 10:09:38 +0000
Received: by outflank-mailman (input) for mailman id 723018;
 Thu, 16 May 2024 10:09:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7Y3N-0001u7-IQ
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:09:37 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66309779-136c-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 12:09:36 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a5a89787ea4so281386566b.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 03:09:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7d92sm975284866b.98.2024.05.16.03.09.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 03:09:35 -0700 (PDT)
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
X-Inumbo-ID: 66309779-136c-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715854176; x=1716458976; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JR9aeLFq4ryr+Yj+8/m/OwHuECrOwQkncyie1IKBjiI=;
        b=a2br3zxdMqlgKQuES3zJkCUdm+O14uBjQaGnjiH1RiD6gZyXhrAo9w+5Et0HIy5rHE
         CUJdu202i69xB0/tHhdujBUnGHAaqmHtE32HE7pQQtBzbSQO7GI0wEaYczDx6BbEs+1l
         8oS54irTGaF+9xOYQRgplfnOoew1iYZfwOFIXWOjZ3i3b635TzX/4iNLmCGx2tw7Eaik
         YzlHF0JkQMluWvNpcXkrDgJRTIoS5sAFtWUIS93fFTg62DaORMpDApnqMK/DgbplvRhD
         BL70vVGETM+QO/r2XXggg7FOqL96r9C6Itm6UZIxwvrXknwkgpx8/+wndca7qtIEw2rw
         sjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715854176; x=1716458976;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JR9aeLFq4ryr+Yj+8/m/OwHuECrOwQkncyie1IKBjiI=;
        b=YQf0pRVApm8iWtjnoD2uI7xK9ooz3JrlGngjx5k/eRCsaZ690aUXSO/YSKX8ROXf1I
         z4tAOLdNeBU3yAhjMzQ6fZHDWHCsHt1Lm2YLZaF52UR4W4BVsGdqwCqcuj9nEWz7GY3v
         a0heljgNXwBjiksJ3xVEaeYNzf9IvNtkphC7pF2wuWqu/Q0PQwWqyAk4LnLc9mkJ52h2
         lzjycPaxFEP7Koh+KOo91mkKNvEaLuI1h4O06E0DKdILCM3gnfgQtkE+QnE0im9BD8Xp
         pyHLE9JZnIVxHdDHN/1azLDMkentttySX+sTKhL+8A8jIlMmtOEkZyV6nj1jemTDqwRp
         cx2g==
X-Forwarded-Encrypted: i=1; AJvYcCVLUueNOuCLFjP8NLNJ5qByNLDJyVriNuOecz9ev6skEDmSgtmJ68WVOKCWJDgaFhe+hEfeVfdRXDhNxxqdA683J23ZpPc94lIoDLkyYFg=
X-Gm-Message-State: AOJu0Yxvr4hHA8Y4RMkoxtheHwS9NegRxxQ8OdriQl3l4C2tKUXBrHIZ
	NeWEdHXP1iBHAyk9JWbONHLJwfMPoYSuJPO1vkbWzdD4zkOf2420zrVSZ/5EcQ==
X-Google-Smtp-Source: AGHT+IFV5M8qk/sfaer7kl772vjhVQrVuwUWZr29IEfUV6zihYFi+G1sgVcyN9ZxGIIXWlisuy4zdw==
X-Received: by 2002:a17:907:1118:b0:a59:c5c2:a320 with SMTP id a640c23a62f3a-a5a2d581b19mr1207651966b.23.1715854175994;
        Thu, 16 May 2024 03:09:35 -0700 (PDT)
Message-ID: <55062fd5-89cc-4c68-a303-24922192344d@suse.com>
Date: Thu, 16 May 2024 12:09:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 01/15] x86: introduce AMD-V and Intel VT-x Kconfig
 options
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <3f2168a337a192336e9a7fb797185c39978db11b.1715761386.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <3f2168a337a192336e9a7fb797185c39978db11b.1715761386.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2024 10:59, Sergiy Kibrik wrote:
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

In principle I'm okay with this, so
Acked-by: Jan Beulich <jbeulich@suse.com>
Nevertheless, ...

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -122,6 +122,12 @@ config HVM
>  
>  	  If unsure, say Y.
>  
> +config SVM
> +	def_bool HVM
> +
> +config VMX
> +	def_bool HVM

... VT-x having a sub-technology abbreviated as SVM (Secure Virtual Memory),
I wonder if we wouldn't be better off using AMD_SVM and INTEL_VMX. Andrew,
Roger?

> --- a/xen/arch/x86/mm/Makefile
> +++ b/xen/arch/x86/mm/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_MEM_SHARING) += mem_sharing.o
>  obj-$(CONFIG_HVM) += nested.o
>  obj-$(CONFIG_HVM) += p2m.o
>  obj-y += p2m-basic.o
> -obj-$(CONFIG_HVM) += p2m-ept.o p2m-pod.o p2m-pt.o
> +obj-$(CONFIG_VMX) += p2m-ept.o
> +obj-$(CONFIG_HVM) += p2m-pod.o p2m-pt.o
>  obj-y += paging.o
>  obj-y += physmap.o

Just as a remark, with no request for you to change anything right here:
With SVM=n and SHADOW_PAGING=n, I don't think we really need to build
p2m-pt.c. Yet of course this may require adjustments outside of the
Makefile to then actually build correctly.

Jan

