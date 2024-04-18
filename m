Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 015888A9589
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 11:01:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708128.1106738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxNd2-0001Wv-7w; Thu, 18 Apr 2024 09:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708128.1106738; Thu, 18 Apr 2024 09:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxNd2-0001Ut-4Y; Thu, 18 Apr 2024 09:00:24 +0000
Received: by outflank-mailman (input) for mailman id 708128;
 Thu, 18 Apr 2024 09:00:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxNd0-0001Um-F7
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 09:00:22 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15108ab2-fd62-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 11:00:19 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-418e4cd1ffaso2959315e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 02:00:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bh27-20020a05600c3d1b00b004185d1a4512sm1963451wmb.13.2024.04.18.02.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 02:00:18 -0700 (PDT)
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
X-Inumbo-ID: 15108ab2-fd62-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713430819; x=1714035619; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cY+lL+dot9zH5rZRmhh2/gelnpRrMre65ScTOchI7Fo=;
        b=VjAB13K+zvCFksxTz9jeaNTHy3gu66EUhsbXPjESGD5AKmJgVmuUUmeJBxYFDcRaEi
         2qbb1trFBKAeksbqnrNOepPGLtc175WBWntCr4c/nMgFJXUrcnfsIcudHtQyVHZ8MrGB
         Gj5jS8q1OixICavHRcGSFZ9DYOcUP5kXUNpdcGULKH6X4Adc0Ly9LsE1Ja5sv389cPxB
         3CkxUT+a+eq4oOPWIirG10IgzslFTM1pLSY0Gf2qwdc9uOsd0GXh9oCYOq2BRkAJyvkI
         KAewdVesvX0UAdDKvAHXl2M/mysH+Arbd5bw2rFLeB6M/O7sSz8lKaxTV5E8d+cBPa+k
         opWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713430819; x=1714035619;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cY+lL+dot9zH5rZRmhh2/gelnpRrMre65ScTOchI7Fo=;
        b=DQJt4YmAYHakgpeJyY9omayEeEJgfnPhqFguPeOB7wp0GbcqIls8M4nxUS564A++iZ
         yTvhLO8aKaSgvk5GLXftoBxA9OYE9zaXsQTA1Umk7oA/x+b5zFUiYPaNANL67bkNF1/y
         vanSt5tiXbb3OBGTuyELv8aqTEvZ6kce1hNyk8uwTR10SxIWftveK3zIYr/guuXZnWiZ
         wnuHEZz0YjKgFiMTNoES8f7wzbAGdndk99wB9tBy0VKNfgA6t2oS5x3QvtfgKnGm/x4c
         mD8Gxen6Xo6vEFShceTkQeiQ5iOEvcsvaeRYFafDqChbhkaDF0NBpH1kb3C+/HU+pNRQ
         cHag==
X-Forwarded-Encrypted: i=1; AJvYcCXo4twbJQMreBOZeFjqRXWgb0X7twiGlk7ytN7Z+9yHWs8vQrXoShA911Zh3pmHmAfZY4jv0ChHWv+zCGzlYY0sLj6qeI/5RlqQeZFzenc=
X-Gm-Message-State: AOJu0Yyj82MeKdbHFK88pFuaSowzMvThQZsJdQNTuXwA6v9HNgdOi6zf
	hBpXLesUstxXV2JNiHvP6VsIRH6zfl7HrCCE0BPWPszuAEXXE74X4AhBc1UU2Q==
X-Google-Smtp-Source: AGHT+IHwbjEby81ZSIf+CjRiBrw9GzjLuBsTladzGxLcXSDYsLN2H1F/OJ8WMcXpQ3hqBlyP7+UNQA==
X-Received: by 2002:a05:600c:46cc:b0:418:b9fa:43e9 with SMTP id q12-20020a05600c46cc00b00418b9fa43e9mr1612782wmo.29.1713430819270;
        Thu, 18 Apr 2024 02:00:19 -0700 (PDT)
Message-ID: <21436a56-f9e0-4700-8216-3bfa4094cc01@suse.com>
Date: Thu, 18 Apr 2024 11:00:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] xen/xlat: Sort structs per file
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
References: <20240415154155.2718064-1-andrew.cooper3@citrix.com>
 <20240415154155.2718064-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240415154155.2718064-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.04.2024 17:41, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

While I don't mind the change as is, "sort" is ambiguous here in one regard.
Personally I'd prefer if those parts of the change were dropped, but I can
live with the sorting criteria being spelled out in the description:

> @@ -40,13 +40,6 @@
>  
>  ?	cpu_offline_action		arch-x86/xen-mca.h
>  ?	mc				arch-x86/xen-mca.h
> -?	mcinfo_bank			arch-x86/xen-mca.h
> -?	mcinfo_common			arch-x86/xen-mca.h
> -?	mcinfo_extended			arch-x86/xen-mca.h
> -?	mcinfo_global			arch-x86/xen-mca.h
> -?	mcinfo_logical_cpu		arch-x86/xen-mca.h
> -?	mcinfo_msr			arch-x86/xen-mca.h
> -?	mcinfo_recovery			arch-x86/xen-mca.h
>  !	mc_fetch			arch-x86/xen-mca.h
>  ?	mc_info				arch-x86/xen-mca.h
>  ?	mc_inject_v2			arch-x86/xen-mca.h
> @@ -54,6 +47,13 @@
>  ?	mc_msrinject			arch-x86/xen-mca.h
>  ?	mc_notifydomain			arch-x86/xen-mca.h
>  !	mc_physcpuinfo			arch-x86/xen-mca.h
> +?	mcinfo_bank			arch-x86/xen-mca.h
> +?	mcinfo_common			arch-x86/xen-mca.h
> +?	mcinfo_extended			arch-x86/xen-mca.h
> +?	mcinfo_global			arch-x86/xen-mca.h
> +?	mcinfo_logical_cpu		arch-x86/xen-mca.h
> +?	mcinfo_msr			arch-x86/xen-mca.h
> +?	mcinfo_recovery			arch-x86/xen-mca.h
>  ?	page_offline_action		arch-x86/xen-mca.h

Imo this sorting was fine (at least one further instance below): Whether
underscore sorts ahead of lower case letters depends on how sorting is done.
I take you assume sorting as per the C locale, when the original sorting was
considering undercores to be separators, i.e. in a different character class
(together with e.g. dash or tilde).

When using C local sorting, I think arch-x86/xen-@arch@.h also would need
moving past arch-x86/xen.h (whereas right now all separators are deemed
equal and hence @ comes ahead of h which in turn is ahead of m).

Jan

