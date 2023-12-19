Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 791D9818568
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 11:39:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656640.1024954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXU5-0002u4-TF; Tue, 19 Dec 2023 10:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656640.1024954; Tue, 19 Dec 2023 10:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXU5-0002sO-PP; Tue, 19 Dec 2023 10:37:57 +0000
Received: by outflank-mailman (input) for mailman id 656640;
 Tue, 19 Dec 2023 10:37:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFXU4-0002sG-2J
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 10:37:56 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa5becd2-9e5a-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 11:37:53 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3367601a301so172676f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 02:37:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o13-20020a5d4a8d000000b0033674e10462sm806999wrq.113.2023.12.19.02.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 02:37:52 -0800 (PST)
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
X-Inumbo-ID: aa5becd2-9e5a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702982273; x=1703587073; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wNSZZCMl3Lz6Z81lcXJlMGDN+6K/tnaMRz8SIdw2LJI=;
        b=K7SbO44PkOqucPVgHM0HQ1JO4S9MDT1nueHLcbruig8ZyX7mqLZfNE/zyKX+PB4eCC
         DvRfGxSjOqHBlRoC2x4hNidsYMeOUq3e+HyUvFS/9nEwZj66aKCwgVKIbOVz93LTBOJm
         TBbbOTin7wavz5gKOvsr9P/Bl99O2QUjJN5KJCa7fghVZMMTiCrDE5rizRRBgDDsxHlH
         0ez/J0xTpPBrklYVA5BNzwkpyF7EWjdqKHXLYGks+IbiJ0ReANHrC8UM09ce4XrcnITs
         oOljMRSiwQne0WCrd/11PMg0SYy2tZtc0RT2gms1HhEbCW76Pnu1UxbNocw3ycUtu44z
         DZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702982273; x=1703587073;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wNSZZCMl3Lz6Z81lcXJlMGDN+6K/tnaMRz8SIdw2LJI=;
        b=IxuGyDljZoiWeOE3An13UpoUgRtmroIflAwc2vOHJh593Kjhnpg3AxBRv3HcRiKVdM
         US///rJ8+s73pG5GQecE/C0/znsN8ktlfDzFwTv/ctfoIvY8ZztqGfBlelHolNMNFVxV
         2yKvavkh1OHMKC8AP10vWIC9mQkygD0ozIYLtSLF/VLDZgbJQr9ZRYXdX0eDJ5pf/X0J
         pPUQtQTsOm6/zrmSlV38u6Dig4GDmIPzU1f4kxVUWKh74d+4oOI6zur5KtmZ5onhTvXr
         z57KxATIVH5Hq/bJ+k08ikydQoh4BdTJ9uydqj4rDzHLnLIlFMwt5R38Qd+4mUo6vg0f
         ht3w==
X-Gm-Message-State: AOJu0YzudCoe8JzYJDuIpCo9/q5+0rcR5yOCbgw7+CTc0u3+1IZX6cQk
	MaqByzN8/JYZ3A2glx2NRfkf
X-Google-Smtp-Source: AGHT+IGz/bWZkLonRKVWBjY9u59cD4myANLl29eY4B/w+zfYGg119fvYXAX5y1pBry8tZodsDhM+dQ==
X-Received: by 2002:a5d:56ce:0:b0:336:73eb:fe8c with SMTP id m14-20020a5d56ce000000b0033673ebfe8cmr257296wrw.8.1702982273314;
        Tue, 19 Dec 2023 02:37:53 -0800 (PST)
Message-ID: <055b6cf3-4f29-4f1d-b650-26c6d9be8832@suse.com>
Date: Tue, 19 Dec 2023 11:37:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen: add acmacros.h to exclude-list.json
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <664ddc412905546d44d3e311a743ba5217a6243b.1702976486.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <664ddc412905546d44d3e311a743ba5217a6243b.1702976486.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2023 10:02, Nicola Vetrini wrote:
> --- a/docs/misra/exclude-list.json
> +++ b/docs/misra/exclude-list.json
> @@ -209,6 +209,10 @@
>            "rel_path": "include/acpi/acglobal.h",
>            "comment": "Imported from Linux, ignore for now"
>          },
> +        {
> +          "rel_path": "include/acpi/acmacros.h",
> +          "comment": "Imported from Linux, ignore for now"
> +        },

Together with what's already there (in context), wouldn't it better be
the entire directory then which is excluded, or at least all
include/acpi/ac*.h collectively (and perhaps also
include/acpi/platform/ac*.h)?

Jan

