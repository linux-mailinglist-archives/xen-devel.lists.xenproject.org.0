Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 924D0C5785A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 14:02:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161406.1489366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWyP-0000zI-Ex; Thu, 13 Nov 2025 13:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161406.1489366; Thu, 13 Nov 2025 13:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWyP-0000wU-Bk; Thu, 13 Nov 2025 13:02:49 +0000
Received: by outflank-mailman (input) for mailman id 1161406;
 Thu, 13 Nov 2025 13:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJWyO-0007t1-9R
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 13:02:48 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d5cee99-c091-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 14:02:47 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b72db05e50fso137144966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 05:02:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad456bsm162385366b.21.2025.11.13.05.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 05:02:46 -0800 (PST)
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
X-Inumbo-ID: 0d5cee99-c091-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763038967; x=1763643767; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ETWY528pqlBy23k7ipqABn7uFpS88F7MUgzDNXFgrcU=;
        b=TpGcaQxfCNE8KHM1Zov6lB8R6mIZYSw1PoQO2qK0hvLvyvbYmy/1JYFw2yGJKn8uQA
         RFIf8UaIQ/Zp4fWivtKu1trJSJEufxge0r1QgclfiWEyt6sLEqeUReBZIHxPOWV0t3PB
         xJNaIfWNG3FWqLC6f43k5dbhe6kcYVI6KkLoTK/m2fSHjafghOXsgmNNR+rq0wLEEKYo
         EaGO/zMWJNAo0qI57KMVQTt3o2tIEMdv2AwpAhG0suRYxkxCBPcS5iMA9KyO4LYr5T4k
         C15EIx62xsuT14LDwaRqHElZ5ZyhYAABwS+6iuPxHeyLXecsAeqLK/WNHhAUe61UOlC9
         GBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763038967; x=1763643767;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETWY528pqlBy23k7ipqABn7uFpS88F7MUgzDNXFgrcU=;
        b=EiRF827OlREKpcrkmtzwy+RkFt7/HGtz0icmTwOS1EHQuEceqt5dDfJtKltKnpKHNq
         ajwKCJAqRD1ecTGkBO5hFpMzYDwGZ/xVSbs2DGJzn8zHAEnEu48XHjhzWiGxmMNzNg/M
         zdZvQhRc3ufKppERqfT14XMSWI6sED3hdTnWWfJo6SVCXIhcw2mvcAROFmxamHttY4kX
         3rHjKe8p0bYNk29tAb1PzzV42USeOPy59A6suDM6DFxuHFOUfkyyjmuVtry5Mc4e0mgM
         IXBZGcMyZuZvbQrW5Wok9AIzAZ1jMhmQgjpZB3LpdNaU2jsoKb9YIPjd/N71AVYsj70i
         CxIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPHirnzsaa8eDW3kNTTgU7mtaZoK29WHibLDfNNXaqvBTa/xwK059vS4CjzU/f/OgCo+H0Q73HPR8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrrtKhyfIMNTP10fE6uirPwcdtv7EQvtWa0iR+UhGVTCA6LWzv
	zDAHDxPFEBMwDVSR77vb/ac4WXQhuKsrKNwUArN+FwYZ+0OiqWa4ejCgXtF/IA93PA==
X-Gm-Gg: ASbGncsoa5tqOmUfLsMCaE3RgaOWO6cZBGvmCBbKadJ7WRxGwkGqyg6UBqmXab8Hx3o
	IHdDmGBcYcTGx6vHUMy0iD43hkkPEwjUB/C/389N/l+gh0AP8iD/3mjv8FR0impBie0qn0I51z9
	gI2exob3PNeNKgS0czA3H7DDMHBwiIjOgp8vUfJG20cjAHjSqQMi82EkrTJWiKvgrJupGGlTyAA
	egDci6hih0IRiVr0BWtz949/i9H0eFgwpzuZ9edxlTCI496IMux/Q/tydL407fl+g6gybr0RrjI
	q6njhYkEitITXi/znUhMbb/iUR0D4s9eyn4UsaUcDKEwfjGGZY2uEkKoyl6NjQ+geuM8Dt44hx/
	qGYpTWFwtc/u85PjyvVbVp8P4vraunqiIAIhV8spgB7nwq/gH13zQT9QDyXSj+PJIyOTWI1eOOp
	UDwaTss1y4prh/001Lk2NUzBmHZdZWuGOOTehrVrRbl+36xwW3vWEtq8bnLZiNmi+ggUpKJ7ME+
	TM=
X-Google-Smtp-Source: AGHT+IHigfWs3Z+ML/0r+JwPR7g/d4hkj7XNpo8Zt28Szg5Fih/LGkjuHo18wfoOXZOYMUQ6kTFcwg==
X-Received: by 2002:a17:906:794e:b0:b46:8bad:6972 with SMTP id a640c23a62f3a-b7331aabdaemr683049466b.38.1763038966769;
        Thu, 13 Nov 2025 05:02:46 -0800 (PST)
Message-ID: <70c36cf7-de4e-418a-921c-fe1268178194@suse.com>
Date: Thu, 13 Nov 2025 14:02:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] xen: Strip xen.efi by default
To: Frediano Ziglio <frediano.ziglio@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Frediano Ziglio <freddy77@gmail.com>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
References: <20251113124945.25343-1-frediano.ziglio@citrix.com>
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
In-Reply-To: <20251113124945.25343-1-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 13:49, Frediano Ziglio wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -65,6 +65,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>        for hypervisor mode.
>  
>  ### Removed
> + - The install-time environment variable INSTALL_EFI_STRIP is no longer
> +   supported, xen.efi will is now always being stripped.
> +
>   - On x86:
>     - GNTTABOP_cache_flush: it's unused on x86 and the implementation is
>       broken.

That's the wrong "Removed" section, though. Moving it where you put it would
be part of backporting (to 4.21) effort.

Plus it should go under "On x86".

Jan

