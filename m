Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 234EA8B5CAB
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:08:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714173.1115255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Sbd-0004Fo-GJ; Mon, 29 Apr 2024 15:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714173.1115255; Mon, 29 Apr 2024 15:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Sbd-0004DU-Ci; Mon, 29 Apr 2024 15:07:49 +0000
Received: by outflank-mailman (input) for mailman id 714173;
 Mon, 29 Apr 2024 15:07:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1Sbb-0004DO-Nh
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:07:47 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cba1147-063a-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 17:07:47 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41c011bb920so8703335e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:07:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f17-20020a05600c155100b00418db9e4228sm42113471wmg.29.2024.04.29.08.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 08:07:46 -0700 (PDT)
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
X-Inumbo-ID: 3cba1147-063a-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714403266; x=1715008066; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jp1wjCZsoGW2i8AskWs1lRsZ+I+xsoDVAKn5OjIpaD0=;
        b=bGeYZ19+9f+rqyU4VVHZQc1gkkjfadXu653oaMAPetNl9t4bquQVCgOxYDn3cu37fj
         La99rI9hIl5lpWAFuam9wr7XfqbkaipjPV74FGBEuq2oVl2UuctVguY2V/RFvL5Kae1P
         XCTFpD9/MIgiewzCf7xadvaQrkaTU8aofQxjfrK9ZJLQVCFYV10/wnlK/CGpwZA22wnI
         imPaftAvW7OXvE4vTG8VAqfYafyGKkkr/nJ9u6uFZz4wG/zFHerr7cJx1aLUGQUeXHgR
         oqk/vxyN0NU/49eeadzGkYhZtVdmq87HsYxqHoEg4OG0ghXiFI1JY7YnwoUUtrM0LiRz
         E1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403266; x=1715008066;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jp1wjCZsoGW2i8AskWs1lRsZ+I+xsoDVAKn5OjIpaD0=;
        b=KmZCqZGBi49Tli/1wFCIwfBndCsxglzBulklzr/NYIzdd4dbfsYDsv7exoSe6L+uxX
         C58WQiY1qBiOp+0TMSGw6zd7QyMxGTRTj4caJhJANTJ6j+JbSmCptKVYRcOWMT/aPJPH
         lQgobxVnKhhOZFiL81zmJFhYFhyQG9813nZsr+YN09HqtuK7hRpmkT5tP6deRN2+DGTz
         oBqiWn0oNsYijemkBScaknc4w8EOs67jlDK6l5kekyF/KUwsX3aJeEcTcesm3U/XoOM1
         pZyfmt7+vA/bxoR6PnFHXgj0BogYcUEOZM4/2eC5eLNAWpS4aFbS2lShpXL+mUOeW1W6
         g0tA==
X-Forwarded-Encrypted: i=1; AJvYcCVvSTKlx3WjURtzoOXdWBsMEG2C06LFpkKqxOpufTH6SDadDwLMQE6meZwJdIv9J3O3T2Z5H6N1GsHSN2tSv13XvedQOs1VxYp7DOrho5Q=
X-Gm-Message-State: AOJu0Yz256xddm6q1ItXvjfML7RYQsBvC9izmf9Yqm4kUbnVh76bVpsu
	kk0/fB3Mxy8raxKiPJH4N1WRoJ49zIqY1jAMbQI4vxFUJNMCMnwp4mtqyPPmjMl/OIqZn/TW2w8
	=
X-Google-Smtp-Source: AGHT+IGk2YAudYVlFywViJc1Fa0PKeDCDleUIp1dsAVp2XjeXsEseyH34pupjPWsNEiUkL5BKx8bsw==
X-Received: by 2002:a05:600c:1395:b0:41b:d6ca:eefa with SMTP id u21-20020a05600c139500b0041bd6caeefamr5439259wmf.16.1714403266455;
        Mon, 29 Apr 2024 08:07:46 -0700 (PDT)
Message-ID: <49e4079e-e878-42d3-a1ec-033e7c0e2c6f@suse.com>
Date: Mon, 29 Apr 2024 17:07:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] gzip: move output buffer into gunzip state
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240424163422.23276-1-dpsmith@apertussolutions.com>
 <20240424163422.23276-7-dpsmith@apertussolutions.com>
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
In-Reply-To: <20240424163422.23276-7-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.04.2024 18:34, Daniel P. Smith wrote:
> --- a/xen/common/gzip/gunzip.c
> +++ b/xen/common/gzip/gunzip.c
> @@ -15,6 +15,8 @@ struct gunzip_state {
>      size_t insize;
>      /* Index of next byte to be processed in inbuf: */
>      unsigned int inptr;
> +
> +    unsigned long bytes_out;
>  };

The conversion to unsigned long from ...

> @@ -42,7 +44,6 @@ typedef unsigned long   ulg;
>  #  define Tracecv(c, x)
>  #endif
>  
> -static long __initdata bytes_out;

... this originally wants justifying in the (then no longer empty) description.
It's not a lot that needs saying, but such a type change cannot go entirely
silently.

Jan

