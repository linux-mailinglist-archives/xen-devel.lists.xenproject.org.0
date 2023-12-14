Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E7F8130A5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 13:56:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654566.1021593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDlG0-00087l-AH; Thu, 14 Dec 2023 12:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654566.1021593; Thu, 14 Dec 2023 12:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDlG0-00085Q-7b; Thu, 14 Dec 2023 12:56:04 +0000
Received: by outflank-mailman (input) for mailman id 654566;
 Thu, 14 Dec 2023 12:56:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDlFy-00085K-3v
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 12:56:02 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 212dba49-9a80-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 13:55:59 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cc259392a6so56279301fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 04:55:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ch13-20020a0564021bcd00b005485282a520sm1730096edb.75.2023.12.14.04.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 04:55:58 -0800 (PST)
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
X-Inumbo-ID: 212dba49-9a80-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702558559; x=1703163359; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QkoaH5WsVctKTNHsw0uJGdS4MR6bkE9ymMeyyLGWHo=;
        b=Lsj19HXfacqXX7O0QkM+6oJXNSybTt+gLFNiKhdu3mnbv+IhcwJ22Dv/v/sdDmHPcF
         X37i5Fa8OfViZhPMoBQwW3v2IkFUA/TCgg7Vj83nun0f5ovjuB1EMKpKGouJY2exlrn9
         1V12nJWuBqfQnQQ2tFCQ8IAoKYIzSdL6jQ8MiDDqTWGVD06mxS1cHH11gJbbdruDoyh1
         4wHhAd0vTS/0BZ6ZSrXO+VIL5yI74e/oR3L4SkbohZg5fFehaTD7AYX+e/jRUYOobfuV
         0XSRuilCY6rPjzZP+OMfUbN1hI/tMp6yMy/W7QNJhfRRxEguzYYdddYy44xswL63bM/j
         hBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702558559; x=1703163359;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+QkoaH5WsVctKTNHsw0uJGdS4MR6bkE9ymMeyyLGWHo=;
        b=IrRZrA3W6zb6yd8McYaxvM4NXbYSYEzfhrdC9kzQ4NVahmXqjel/yT4TbpDAOw/jlo
         dWbzQqXLSd8eU3v1rivUavGAIn6IwzfpuL9wv82aiWkANE6/RmsIW3ZDjlCCweKfR/y6
         4pORE0BVmPN0Ow9t/CcOA5UdpAEO1Uype9eFdvp6rtYOEKVK3GV8etQPjpkOTLb/zHB4
         kSWiNvC2iezhrNxA+cTCnw36ma+1chyHd7++DvjfDmb5Z/HUEXl6/E09VwAf5kBoT0p8
         UFruUdNHHBaXUutqhK7Q5dK6ty3BMnukcLSD399ZBaLvGlsHFh5YslzwWHwCxFAUFJ1e
         GQzw==
X-Gm-Message-State: AOJu0YxSNOQXQT6PMJLiqbZow304scgOikU38evJ+XRzJdaFF3l2xtwa
	EtmtH5lcMqYVnxx7csgxbbck
X-Google-Smtp-Source: AGHT+IEGjD6L85IxpCrAfW44BH75qJqrAjpdQnpTBlIuJC3yfio7B2LiPNtNrdxpqXWUhvKjkbUxUA==
X-Received: by 2002:a2e:a5c3:0:b0:2cc:1ea9:c34 with SMTP id n3-20020a2ea5c3000000b002cc1ea90c34mr6128511ljp.63.1702558559380;
        Thu, 14 Dec 2023 04:55:59 -0800 (PST)
Message-ID: <a50a26c4-9de6-4443-8ee4-e5ce867fe90d@suse.com>
Date: Thu, 14 Dec 2023 13:55:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] x86/livepatch: introduce a basic live patch test
 to gitlab CI
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20231214101719.18770-1-roger.pau@citrix.com>
 <20231214101719.18770-4-roger.pau@citrix.com>
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
In-Reply-To: <20231214101719.18770-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.12.2023 11:17, Roger Pau Monne wrote:
> Introduce a basic livepatch test using the interface to run self modifying
> tests.  The introduced test relies on changing a function from returning false
> to returning true.
> 
> To simplify the burden of keeping a patch that can be provided to
> livepatch-build-tools, introduce two new files: one containing the unpatched
> test functions, and another one that contains the patched forms of such
> functions.  Note that only the former is linked into the Xen image, the latter
> is built but the object file is not consumed afterwards.  Do this to assert
> that the file containing the patched functions continues to build.
> 
> Since livepatch testing will ensure that the functions are not patched previous
> the applying the livepatch, allow the livepatch related tests to fail without
> tainting the hypervisor.
> 
> Note the livepatch tests are not run as part of the self modifying checks
> executed during boot, as they would obviously fail.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I'm still not overly happy with those comments though, but yes - -O2 is likely
the only thing that matters in practice, until such time that we have a way to
allow use of -Os without any Makefile changes or other custom overrides.

Jan

