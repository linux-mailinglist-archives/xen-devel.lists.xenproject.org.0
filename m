Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B5384573D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 13:19:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674390.1049251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVW20-000185-SI; Thu, 01 Feb 2024 12:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674390.1049251; Thu, 01 Feb 2024 12:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVW20-000150-PF; Thu, 01 Feb 2024 12:19:00 +0000
Received: by outflank-mailman (input) for mailman id 674390;
 Thu, 01 Feb 2024 12:18:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVW1z-00013X-Lz
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 12:18:59 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12be9131-c0fc-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 13:18:57 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40eacb4bfa0so7382585e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 04:18:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r7-20020adff107000000b0033b1ab837e1sm482525wro.71.2024.02.01.04.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 04:18:56 -0800 (PST)
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
X-Inumbo-ID: 12be9131-c0fc-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706789937; x=1707394737; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eD5NDrU/PsoBq64jRmzK/ZATALjDnfifROpcrYlE12M=;
        b=JEbxKO2h9635JJWO1hgk+WORuQHq1btg8+a6Rc8/D8/3MC5HMQFI4Rpoz8UKn3mOoA
         Pkbv9mO/S3bweIZrlvmtH2FDsmyOeSwtNP8AjAOkDTERDszxmKFLvdD0Q7ReCBFJEi0S
         fYO8PT41xGpYbTKjtaZtSqoHvubI5hJb14dPaGNegil611mIYyZEg8lLhZKXLsKJxbRA
         QGZgRW40WpeHgy0F/SaWqklnBsoJdb1763Vg6wELjyILUFlaSJKC6mBseWhPZCHBjVOJ
         VFE0gu3yDxv0KcOYYeWpXhMW4AMjQ6FxMe5IeFL8aMMH5siDeXLx7l+pOY+TRH1fnUGa
         exgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706789937; x=1707394737;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eD5NDrU/PsoBq64jRmzK/ZATALjDnfifROpcrYlE12M=;
        b=QFVcr/fQ4yfhdmi+XmsuLYtGq3N+1aQaOW7xm2Rv7UPiUVvh4kDqlSau9L7V0KCzWG
         gGekgmNYNC+Sf1f+LlSIiCkrZ7TZpzfj5jgMnUwI51plEWO1nqwfZe7SO9TP0xGDgWqw
         zZXk/19bcyVJFFnM2x+asX/Lu7vdS4gttQoLxV4TPylsLbvqv+F4NPqk5GBKLUJLywxA
         b1Uh/ty6vOlMgbuGW2lz6agX213sRUG+guXSakfl9F3C+U3djneU4ffCzQDBBwfIdIqR
         dgciKlj+xSGT/TNLGawvlThxnVFmwyb6qX9qIojrFC8esODJTz/0Tad2ITogwrZ1lm5c
         6UIg==
X-Gm-Message-State: AOJu0Ywd1r/eimsTb6fheW88ZgBJU/gQO7zOQbIpg/bWD/IK0zYiNHCY
	KXITvSu1kG+lqnJmE5+g0Lw7J6ChNk2uDId99/wG4dTt8RMTjNO5UE8mmeuqTA==
X-Google-Smtp-Source: AGHT+IF/p4o/Xb8wZmChDdC74b5tDL6KyfWTBri+huEg8aWAzIul24aPxXevexGDeI1UJEqM1anbaA==
X-Received: by 2002:a05:600c:5486:b0:40f:2d7:287c with SMTP id iv6-20020a05600c548600b0040f02d7287cmr1475583wmb.8.1706789937022;
        Thu, 01 Feb 2024 04:18:57 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUNUvMIJtlH1LlNw03rIBTiyobe8YrzJIEWgsx2GKoUChIqVmtowcM/clP0WJ7ot75B+qvwekFTWTtkNlpRQqVoda8Vd+dA8JJNav+juC6rbfiBe2ReHsT8TQOYvm4dso10lYz02GaA+0HrylZuXaIoTj28mkfvWx5lgs48Ycml8LPjZyrtNbvlGxsKzQQguvrN4mPlSang167/dH9aCOgsGKa86QQV8sXS/lITIcFkxvkmqYfsoMW8ua+CvaJy4UabjOTJ/X9bxC1Iy4zmpbQJrZhu6C4t
Message-ID: <c6f2c117-c8a7-4356-8421-4781090279c0@suse.com>
Date: Thu, 1 Feb 2024 13:18:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/15] xen/common: add cache coloring common code
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-2-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240129171811.21382-2-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.01.2024 18:17, Carlo Nonato wrote:
> --- /dev/null
> +++ b/docs/misc/cache-coloring.rst
> @@ -0,0 +1,87 @@
> +Xen cache coloring user guide
> +=============================
> +
> +The cache coloring support in Xen allows to reserve Last Level Cache (LLC)
> +partitions for Dom0, DomUs and Xen itself. Currently only ARM64 is supported.
> +
> +To compile LLC coloring support set ``CONFIG_LLC_COLORING=y``.
> +
> +If needed, change the maximum number of colors with
> +``CONFIG_NR_LLC_COLORS=<n>``.
> +
> +Compile Xen and the toolstack and then configure it via
> +`Command line parameters`_.
> +
> +Background
> +**********
> +
> +Cache hierarchy of a modern multi-core CPU typically has first levels dedicated
> +to each core (hence using multiple cache units), while the last level is shared
> +among all of them. Such configuration implies that memory operations on one
> +core (e.g. running a DomU) are able to generate interference on another core
> +(e.g .hosting another DomU). Cache coloring allows eliminating this
> +mutual interference, and thus guaranteeing higher and more predictable
> +performances for memory accesses.

Since you say "eliminating" - what about shared mid-level caches? What about
shared TLBs?

Jan

