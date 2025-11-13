Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A93C57938
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 14:12:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161444.1489395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJX86-0004ds-MT; Thu, 13 Nov 2025 13:12:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161444.1489395; Thu, 13 Nov 2025 13:12:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJX86-0004c3-JP; Thu, 13 Nov 2025 13:12:50 +0000
Received: by outflank-mailman (input) for mailman id 1161444;
 Thu, 13 Nov 2025 13:12:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJX85-0004bx-SJ
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 13:12:49 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73b20b2d-c092-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 14:12:48 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b735487129fso97649066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 05:12:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a497ffdsm1435956a12.21.2025.11.13.05.12.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 05:12:47 -0800 (PST)
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
X-Inumbo-ID: 73b20b2d-c092-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763039568; x=1763644368; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uWmOl/0OF3kohnl+GhEeii8xZ3sWFeGO/MAqVUdJQ5I=;
        b=PKzwzsCzlaaRVh7a+WdKfjOO0f9+wi/Q9NcYj08WywA9QBgHDvxDTmqDqFDX4qVrIu
         jR1oZ64BJQr+oacdcGoTz5nXSxWMAr54VmWkzKw8yL5XC3qT/x68K/63U4eCJ97tG/Wv
         C/bASkWlN2ry5addpTmvuMdjtntfi3my9g+thZUKOboK6dzotVgCSRRpCyYLiVCN7lFH
         hkUTIYY6Vr9AYBfVo3awnERKipoRqaah+ctwK/O9OOiw8E/IGanoNNBQyGnT55y/9koM
         D2maE1WcMxhoPm7sCU2TDv3ejvEQBb3uFiIY4ovIqBibYbUxzn29GQaPHCrPYZBz7nBX
         RrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763039568; x=1763644368;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWmOl/0OF3kohnl+GhEeii8xZ3sWFeGO/MAqVUdJQ5I=;
        b=abDbxH9GJKolEteD/A24DorXOOYAPKIqXyy3EPYyYY8/4H8vGWD3ggnGblWMM+WrOe
         S1kR6BbtnZHq9xGCjaEPArB0aGvzshz36wrMAAxT5Qb+E/6UO+WA0AL0MduFVgaNWoZ2
         4vx1QQQuyrTx53K2DebamOOhbzZiZZopEVQzgIJt81rkz/tgztJsLvjuNBUJ/te01H3L
         eThcNojB7EmR20UyFL+MJZX/sUzY9S+5IyFCgNbOcMEs4dbBj5bc3trgRkNN9g5vQamO
         1EiXjh0pRK2FsnTcOqwHOcnonBZ1t7QgbIkAKp4MOgpiwhQL6+tnSpbQf3znU7//Stoh
         1pAQ==
X-Gm-Message-State: AOJu0YzVHrZrAzkiSVe3qilhgpvyAgUZKkDDrM5rPBSE6znNrxtwrin8
	RxYliXTumOFJNZMm9lh9EH3HWHuxWnPDHRLCBsk6cLSxF5hDUFKJwz673kzFl1kqrg==
X-Gm-Gg: ASbGncsojk+u97UvtFph66Wsu4xLdKoyo4h6ssaIcJxI8/LbItH3fWLPilEfkgm9ED1
	IAn4BDlPZXzek47JzlX4QWJhn2Jo4xKc5opQaK28I422DQNeTrzjxxAgsN5DPqo0GvWDqr8wIqV
	+PEi9DYtoKIi96AjdgjhW+2/GQ2qM0oWRpugnDDOHffnYgSTgi/6iNLAldFRGB6vg4ATZRyf2Uu
	qK6tQXPvGEvhJosFFrzQeI8O8jaxAqCdmo1NuiTKb8Ei6PXXUtXKpz2rFe9br88a77zER6k9x2/
	LV3bsTvnrRWeiBmqoJkCCBgSHBQYQemZbYuSesh7EXKP7g6X0gOOfsZWMpgoSi/UYm5qQbVRM6V
	N91DD1E6Yz5Q5oJoPbIqjnIFpWcTHJ+k+xTUgFaRb8HOiiAWAYwmLAfBJL0ZWiJvW1mXoQ7ywXr
	XtbZ205e0ieKEv4NG8m6Ye7uOlgfQEerrlZy9BYi5TF0TOYTCwlRgG6qR6F7y1qcBN
X-Google-Smtp-Source: AGHT+IGwFanqLa0mTgFI/Q8WENhka7d3jzmgQ5XFtAwWAtJLK5U7NXW+hbx2TyJCOjhnwX0l4677vA==
X-Received: by 2002:a17:907:c11:b0:b40:e687:c2c with SMTP id a640c23a62f3a-b7331a6a9aamr787680066b.37.1763039568215;
        Thu, 13 Nov 2025 05:12:48 -0800 (PST)
Message-ID: <ce976661-927c-44e0-a478-893242bacba3@suse.com>
Date: Thu, 13 Nov 2025 14:12:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] mktarball: Drop double-processing of the archive
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20251113130154.220139-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Cc: Xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <20251113130154.220139-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 14:01, Andrew Cooper wrote:
> This is a partial backport of commit 63ebd0e9649e ("releases: use newer
> compression methods for tarballs"), but keeping gz as the only compression
> method.
> 
> In addition to efficiency, this causes the tarball to use root/root ownership,
> rather than leak whomever produced the tarball.

I don't understand this part. Isn't the ownership whatever "git archive" reports?
I have to admit though ...

> --- a/tools/misc/mktarball
> +++ b/tools/misc/mktarball
> @@ -5,14 +5,6 @@
>  # Takes 2 arguments, the path to the dist directory and the version
>  set -ex
>  
> -function git_archive_into {
> -    mkdir -p "$2"
> -
> -    git --git-dir="$1"/.git \
> -	archive --format=tar HEAD | \
> -	tar Cxf "$2" -

... that I'm unaware of what the C here does. It can't be the same as -C, and the
--help output of the GNU tar that I checked doesn't mention anything else at all.

Jan

