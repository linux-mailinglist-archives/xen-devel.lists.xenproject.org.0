Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 630CD806A24
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 09:53:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648987.1013166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAne5-00058w-R2; Wed, 06 Dec 2023 08:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648987.1013166; Wed, 06 Dec 2023 08:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAne5-00055v-Nt; Wed, 06 Dec 2023 08:52:41 +0000
Received: by outflank-mailman (input) for mailman id 648987;
 Wed, 06 Dec 2023 08:52:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAne4-00055p-LN
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 08:52:40 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce67d714-9414-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 09:52:38 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3332f1512e8so443069f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 00:52:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q15-20020a056000136f00b0033332524235sm13555128wrz.82.2023.12.06.00.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 00:52:37 -0800 (PST)
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
X-Inumbo-ID: ce67d714-9414-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701852757; x=1702457557; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1t7Z/c0xt0riUyHpPIzTr8cBpcGMvqg1+423qEyu9VM=;
        b=gpsErwXlOG1mnauitBJTInZrTAW7hpE/ywrdCyZiffN8rstbL81rDgActURicbnZbg
         AtlO78uRktVZw5DdEwLi9PfiRwwVKgruCfsAh/PnCbIyBsq9zY9d2dNFPCw884lzqmCj
         I2KYOED9Us0QjOLORraQlnZze7N8S7k4vGHeAAtadyd7rssRYz4B58NXgcTmYtjdIrVc
         lm67o2pvjpar9NAKkdpqvGyKvVekpg9lw1WmvUNSbs4qvLQPkI4p+vxStAoTSYV3H79l
         cssWL73xgGPmnVfpW9Bw+cRD8+YWFfBf2fWKbnmedYPgibCdvgII0c/utwaLwoGMDm5e
         AmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701852757; x=1702457557;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1t7Z/c0xt0riUyHpPIzTr8cBpcGMvqg1+423qEyu9VM=;
        b=hYJMbL00n3ZS+2PLd+6xi4l4BTMdJxEyxOTPYaDNsWhZXHneCzImmGCGGiFRVGI4RU
         X+UvgF7KCS9tLKyaXs8J5fNwETEIaNl2TdEshnNl5QqmKxL2slE77hW3XvdPDVoZo1zA
         poK0KRU7goGHvWmJIYWtYZIGNnlpiWmAhamrY6i9GmbSC/3bE10VbUyhhl22UUFM1uJC
         Lhp3V01MSkTDqGokfuriQ+GbdsFICzs9qm6fyuiCI6QxMIp2YNi85VTIVz0d+19jnXcf
         ZJErBQnk4KMhxutlEWv64QbiD35S+BcM9qIp1jskMKmP7tNHszQ0EaudUe8+uEF23khG
         iHMQ==
X-Gm-Message-State: AOJu0YwTMVUHikELB3+MJuD8Eiy+EfyEWu4xnKZi2a/NSxj+Trb4cXEi
	T5lQKWXrd35AI04Wx70dElTf
X-Google-Smtp-Source: AGHT+IGKDyBaI0fPrtefGHsEZXos9JxcIpP/9F5+1wNelO1/5D7EF7IxjkLrmyOjunDuGWo40VtA2A==
X-Received: by 2002:adf:e647:0:b0:333:543e:6a68 with SMTP id b7-20020adfe647000000b00333543e6a68mr310023wrn.32.1701852757468;
        Wed, 06 Dec 2023 00:52:37 -0800 (PST)
Message-ID: <c7d844ea-139e-416f-bb8e-51e63c0fe3ed@suse.com>
Date: Wed, 6 Dec 2023 09:52:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Only compile the hypervisor with
 -Wdeclaration-after-statement
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>,
 Juergen Gross <jgross@suse.com>, Alexander Kanavin <alex@linutronix.de>,
 xen-devel@lists.xenproject.org
References: <20231205183226.26636-1-julien@xen.org>
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
In-Reply-To: <20231205183226.26636-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2023 19:32, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Right now, all tools and hypervisor will be complied with the option
> -Wdeclaration-after-statement. While most of the code in the hypervisor
> is controlled by us, for tools we may import external libraries.
> 
> The build will fail if one of them are using the construct we are
> trying to prevent. This is the case when building against Python 3.12
> and Yocto:
> 
> | In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/Python.h:44,
> |                  from xen/lowlevel/xc/xc.c:8:
> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h: In function 'Py_SIZE':
> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h:233:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
> |   233 |     PyVarObject *var_ob = _PyVarObject_CAST(ob);
> |       |     ^~~~~~~~~~~
> | In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/Python.h:53:
> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h: In function '_PyLong_CompactValue':
> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h:121:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
> |   121 |     Py_ssize_t sign = 1 - (op->long_value.lv_tag & _PyLong_SIGN_MASK);
> |       |     ^~~~~~~~~~
> | cc1: all warnings being treated as errors
> 
> Looking at the tools directory, a fair few directory already add
> -Wno-declaration-after-statement to inhibit the default behavior.
> 
> We have always build the hypervisor with the flag, so for now remove
> only the flag for anything but the hypervisor. We can decide at later
> time whether we want to relax.
> 
> Also remove the -Wno-declaration-after-statement in some subdirectory
> as the flag is now unnecessary.

With all these removals, don't you need to add the option centrally
somewhere? Or else are you sure that no compiler version, including
distro-customized ones, would ever come with the warning enabled by
default?

Jan

