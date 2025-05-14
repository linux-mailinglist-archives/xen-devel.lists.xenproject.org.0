Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D809AAB642F
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 09:25:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983897.1370074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6UA-00081E-SA; Wed, 14 May 2025 07:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983897.1370074; Wed, 14 May 2025 07:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6UA-0007yi-Ol; Wed, 14 May 2025 07:25:02 +0000
Received: by outflank-mailman (input) for mailman id 983897;
 Wed, 14 May 2025 07:25:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uF6U9-0007yb-IK
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 07:25:01 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ae9156f-3094-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 09:24:59 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5fc8c68dc9fso5793461a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 00:24:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9d70f51esm8228189a12.79.2025.05.14.00.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 00:24:58 -0700 (PDT)
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
X-Inumbo-ID: 8ae9156f-3094-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747207499; x=1747812299; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dRLP3HqlbEl3Brvt/dSwvcuwAQHJmAP62JYmPmkodFg=;
        b=H7Gh9fROxXb3vAKEssEhOXYTHkxPsX+/RbLLr17st8UblQyvbU1v6FsRUsoB1IDhhT
         scTxSE0t1m3D7E0u3zoz3f6YFJbaSBThQ2SEj2rt/fYVXpp/haiRK3ICOq2kTp4Cb4Uy
         su3Bepo0sKG2TicPWDpLPqxYjZYR/yYboJAofow8qPXJVb6jj7rcR8+b5Z57FhZynMDq
         9t7qGV08ySUdlhUSYQ5hBlBQkIy+RErV8Phh1Glo0xUvKWbvt5/oBfosIbDnuH3Tj3BF
         7Zctq28iuQWOllTFbG8R/2GOsQ2kBOQZaCccv5dX245L3l3X3tVdfTsyvdlWHMuKQ3px
         iJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747207499; x=1747812299;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRLP3HqlbEl3Brvt/dSwvcuwAQHJmAP62JYmPmkodFg=;
        b=gCfzmhUKuVkgzJ6c6RGQNkG8knd+CXAdJjI11CykEzeJpN2HQQCWrPxtJsG0bXcHcj
         Eg4sreXJWsHADXF3irqGjevh9tRIyDGrhe3ydqjkIs/9dOB7Nzaaezs2w1jegdkylVdz
         rWYfIccoV/jhEyqcLA3o48gwZC5/SvhLlwtb471f9zWnAK5beStApTQkuX0FcQV/gP+m
         lfCYUgWlwrGqk+ETOIRA+Y7zJnk0x7+KeMYbKOhiNken4+/hxH8hs7RsCBRa07zmiLti
         8lvlufwdnjHzAgiiZWUs8cQidr13FVP5s7V9QpVWbw5qYfBSN4C/+ae1INJOxneCgkts
         HulQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBbsuryZNwbErk7rp+VPfCEcgJR8U98yGpnD0DrMlfyQZ8ePqPKvdF+4u90BI1Eo+n6JcpfNR+YYA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxySwfE3ROb2wSIYner+5KJHSZR8om7DEtmaRESTLIbhWPydRVv
	uTblGmJunawRdjJtxyg9HvZRZHYITrkX4MLVKSlWCJ+MPXxAuOTYkExTN1wN9w==
X-Gm-Gg: ASbGnctdxS3XWUwnjwqT4PQC0Go/8h6e42RF7oMQzBtCnFu2oFTQb4RPpC/6AoYIiYw
	T9S2USfJX2dLEgbcWQAk2JGj4CzD1wxamh3xDeUeEUXEGPkdTX/E/ZQZB2F0JlDxcGZhrwCTDwJ
	M09WR/+2lpq1Z+NIZVzxzdy/O7KFL3JwFa0uodThKz/zAbXwU6j/lhKy9+Z82gC6l7qQz4PlP6B
	N7HxFsTX6dvZVROleURJ9hd/J0IEeE6qg/XizWK2/edSx5BmE9kSsBEKx955UinEO0CI3xvMF8L
	bUlpqXlIM87VMkk7xdK57sBGHyn5B6hCobBErZZTVnSmEhyCQzqeRl86XfkUw4kaNbT4DEECgvC
	jaa5nY0HnY09rzUQKjxJ6YUKkVFddvLFkoanA
X-Google-Smtp-Source: AGHT+IEDY7hQGDED6kpRBJkQyn9oqmJM+DVaR/Ps9sGCqAmyEGNgsFKhdoRFB9JLmFT4RB8G6YAhGA==
X-Received: by 2002:a05:6402:50d3:b0:5fd:1696:3c24 with SMTP id 4fb4d7f45d1cf-5ff988d3449mr1800146a12.16.1747207499113;
        Wed, 14 May 2025 00:24:59 -0700 (PDT)
Message-ID: <fe243d1c-7ecf-4183-9def-4207b1ceeb0a@suse.com>
Date: Wed, 14 May 2025 09:24:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] Propose an minimal xen-tools
To: Sookyung Ahn <sookyung.ahn@boeing.com>, xen-devel@lists.xenproject.org
Cc: matthew.l.weber3@boeing.com, joshua.c.whitehead@boeing.com,
 Anderson.Choi@boeing.com, brian.j.wood2@boeing.com, haesun.kim@boeing.com
References: <cover.1747205627.git.sookyung.ahn@boeing.com>
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
In-Reply-To: <cover.1747205627.git.sookyung.ahn@boeing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.05.2025 09:12, Sookyung Ahn wrote:
> I am writing to propose an enhancement to the `xen-tools` for users who require only a minimal subset of its functionality, particularly in safety-critical domains like aerospace.
> 
> I believe that the addition of a new build-time option, `ENABLE_MINIMAL_XEN_TOOLS`, will significantly benefit users by allowing them to build only the essential components needed for their specific applications. 
> This approach not only streamlines the toolset but also reduces the potential for unnecessary complexity in safety-critical environments.
> This proposal is based on `dom0less` environment.
> 
> The proposed implementation includes:
> - Introducing the `ENABLE_MINIMAL_XEN_TOOLS` configuration flag.
> - Modifying the build process to selectively include only the necessary components based on the configuration.
> 
> This implementation can be effectively applied to the following use cases. 
> - Minimal APIs for `dom0less` operation. This involves taking existing Xen functions and shrinking them to minimal needed parts. For example, we can use static device tree instead of XenStore. 
> - By retaining `libxencall` and minimum part of `libxencrtl`, the Hypercall interface can be utilized, enabling support for the Xen ARINC653 Multiple Module Schedules service. 
> - Addition of ARINC653 Part1&2 APIs and services (hosted on the domain OS.)
> 
> I would appreciate any feedback or suggestions you may have regarding this enhancement. 
> Additionally, I would like to emphasize the importance of community input in refining this proposal to ensure it meets the needs of all users.
> 
> Sookyung Ahn (2):
>   changes for minimal-xen-tools
>   add document minimal_xen_tools.pandoc
> 
>  config/Tools.mk.in                    |   1 +
>  docs/designs/minimal_xen_tools.pandoc | 147 ++++++++++++++++++++++++++

Just one nit here: Like you have it in the subject, please prefer dashes over
underscores in the names of new files.

Jan

>  tools/Makefile                        |  19 ++++
>  tools/Rules.mk                        |   9 +-
>  tools/configure.ac                    |  47 +++-----
>  tools/flask/Makefile                  |   4 +
>  tools/hotplug/Linux/Makefile          |   6 ++
>  tools/hotplug/Linux/systemd/Makefile  |   6 ++
>  tools/libs/Makefile                   |   9 ++
>  tools/libs/ctrl/Makefile.common       |  92 +++++++++-------
>  tools/libs/ctrl/xc_private.c          |   6 ++
>  tools/libs/ctrl/xc_private.h          |   7 +-
>  tools/libs/uselibs.mk                 |  76 +++++++------
>  13 files changed, 325 insertions(+), 104 deletions(-)
>  create mode 100644 docs/designs/minimal_xen_tools.pandoc
> 


