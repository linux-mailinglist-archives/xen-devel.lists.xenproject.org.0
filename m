Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBAA867CBA
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 17:53:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685677.1066793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reeDt-0007RI-MR; Mon, 26 Feb 2024 16:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685677.1066793; Mon, 26 Feb 2024 16:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reeDt-0007P5-Ih; Mon, 26 Feb 2024 16:53:01 +0000
Received: by outflank-mailman (input) for mailman id 685677;
 Mon, 26 Feb 2024 16:53:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reeDr-0007Oz-Uv
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 16:52:59 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ee6b210-d4c7-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 17:52:58 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a3e552eff09so359939066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 08:52:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r19-20020a170906365300b00a3d68aad90dsm2591068ejb.97.2024.02.26.08.52.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 08:52:58 -0800 (PST)
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
X-Inumbo-ID: 7ee6b210-d4c7-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708966378; x=1709571178; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zyFC6O9pVQ06Jhy/ge+QJAOQeVFoqSyVhea9OGY/icE=;
        b=WwRF9//g3m4qwp2Ue8H+8LbZcOLOtNPt8OOtUFa9PPUPqlQxmksKmhawA8AFnllwoF
         55fPE/kMe54J8Rja41CGIVoRwOl4kSA10AIi07mf+Ywe1vKBqFNFrVdVe/tArXO8H7kj
         oMO4NZLQ3USA1Kw37ZIEzWVE/6upambwYzcQHqzt3utn/epxv/K1grSFvJNfPeMJwU+z
         2xCSrUNQ7doptYvapcjdtY/koBjNvKg/N8H86wcWVgeWVKO3EIXgfk5j0XQDem5hwgJr
         akb1z/gxz0Lce/3+AOV/h3PmVM/6thX6UELTz1y79ElymcEg2aQ2/lYlI+Iw9Ow5OqyY
         AFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708966378; x=1709571178;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyFC6O9pVQ06Jhy/ge+QJAOQeVFoqSyVhea9OGY/icE=;
        b=YdE3GKpWjGbIzw+agsVyUm1T1HsVhUdLbJ/pFHFQ1R6FRq7LAPNXsf3V9s2Xx5l9Ft
         BCH6YRog66cGKx+ddnIHgcIbbNdnZO2YpWeqe8nrfOc2kYv9Dd5n4p4f5r2X3+06yg04
         +k2wTKJBEwjyYwKe+FHWgIt6qtA4vP2qyCegESE/TLEPEH+Wa4tXxEOqbXetA2vuEUnP
         zeGv0X6pwMYTydVJllhFvJ330EKXmBGc7NX7AWhLuli/nIQCHjloovSg3COmWNCiu09O
         N9eVUSILW8WLuM2QjMnOWfbSA4Cvtct+0EtgKQIdzBPlLJqKHSH5wFwjHFm18jOhoxZL
         QaEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/s+xBGdYarYoJ38nJ19MGErPSngNhcMuRA2BkvUtFTODytPBb/W2wit+vXBqjefCNcn/jIatezr4k8BpmNREAyN20T+krLMq5yMDDN14=
X-Gm-Message-State: AOJu0YyOdLtkd9purW5vJg7Yl9cRoHomtyaIIwPI5bA1zb2MwzdAtQW8
	+tGRPlX4Vr9sFhlQGvS1471g0vT3IuO0lcJfnknkPUbZfpFlZzsS+F/E1y+XuQ==
X-Google-Smtp-Source: AGHT+IG3aLTKib0FsS/a33AaUyViTnOvhl3GigJjoR9+U0zLbfY4g9JDPQWZD6/4wC/z4P1QxRWBQA==
X-Received: by 2002:a17:906:2794:b0:a43:72f6:723 with SMTP id j20-20020a170906279400b00a4372f60723mr1410817ejc.17.1708966378327;
        Mon, 26 Feb 2024 08:52:58 -0800 (PST)
Message-ID: <d026feda-1997-43fc-94e6-cb9da1ef807c@suse.com>
Date: Mon, 26 Feb 2024 17:52:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/sphinx: Start an FAQ, and add Kconfig/CET details
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240226162527.1247421-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240226162527.1247421-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 17:25, Andrew Cooper wrote:
> This is long overdue, and we need to start somewhere.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
perhaps (nit) with ...

> --- /dev/null
> +++ b/docs/faq.rst
> @@ -0,0 +1,71 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Frequently Asked Questions
> +==========================
> +
> +How do I...
> +-----------
> +
> +... check whether a Kconfig option is active?
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +  Kconfig is a build time configuration system, combining inherent knowledge,
> +  the capabilities of the toolchain, and explicit user choice to form a
> +  configuration of a build of Xen.
> +
> +  A file, by default ``.config``, is produced by the build identifying the
> +  configuration used.  Kconfig symbols all start with ``CONFIG_``, and come in
> +  a variety of types including strings, integers and booleans.  Booleans are
> +  the most common, and when active are expressed with ``...=y``.  e.g.::
> +
> +    xen.git/xen$ grep CONFIG_FOO .config
> +    CONFIG_FOO_BOOLEAN=y
> +    CONFIG_FOO_STRING="lorem ipsum"
> +    CONFIG_FOO_INTEGER=42
> +
> +  Symbols which are either absent, or expressed as ``... is not set`` are
> +  disabled.  e.g.::
> +
> +    xen.git/xen$ grep CONFIG_BAR .config
> +    # CONFIG_BAR is not set
> +
> +  Builds of Xen configured with ``CONFIG_HYPFS_CONFIG=y`` embed their own
> +  ``.config`` at build time, and can provide it to the :term:`control domain`
> +  upon requested.  e.g.::
> +
> +    [root@host ~]# xenhypfs cat /buildinfo/config | grep -e FOO -e BAR
> +    CONFIG_FOO=y
> +    # CONFIG_BAR is not set
> +
> +
> +... tell if CET is active?
> +^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +  Control-flow Enforcement Technology support was added to Xen 4.14.  It is
> +  build time conditional, dependent on both having a new-enough toolchain and
> +  an explicit Kconfig option, and also requires capable hardware.  See
> +  :term:`CET`.
> +
> +  For CET-SS, Shadow Stacks, the minimum toolchain requirements are ``binutils
> +  >= 2.29`` or ``LLVM >= 6``.  No specific compiler support is required.
> +  Check for ``CONFIG_XEN_SHSTK`` being active.
> +
> +  For CET-IBT, Indirect Branch Tracking, the minimum toolchain requirements
> +  are ``GCC >= 9`` and ``binutils >= 2.29``.  Xen relies on a compiler feature
> +  which is specific to GCC at the time of writing.  Check for
> +  ``CONFIG_XEN_IBT`` being active.
> +
> +  If a capable Xen with booted on capable hardware, and CET is not disabled by

... s/with/is/ (or "was").

Jan

