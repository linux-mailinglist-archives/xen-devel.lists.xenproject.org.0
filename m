Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C10CE86CF7F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 17:43:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687317.1070621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjUa-0000l9-B9; Thu, 29 Feb 2024 16:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687317.1070621; Thu, 29 Feb 2024 16:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjUa-0000jd-86; Thu, 29 Feb 2024 16:42:44 +0000
Received: by outflank-mailman (input) for mailman id 687317;
 Thu, 29 Feb 2024 16:42:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfjUZ-0000jV-4K
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 16:42:43 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8dbc9f41-d721-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 17:42:40 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-563b7b3e3ecso1904252a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 08:42:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m5-20020a509305000000b0056676b80a38sm792808eda.3.2024.02.29.08.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 08:42:40 -0800 (PST)
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
X-Inumbo-ID: 8dbc9f41-d721-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709224960; x=1709829760; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vNZxO+maZ/8cU1NVm8QqlPDl3pXTDuL601hEP/qUtHI=;
        b=f7xUX8ZlpInN0K3betHm9pC5JNXXtSwseq2KVVb5xHuzXj10Bexy0CY2ZxiPM8Mk3U
         x/dJ8eCsDp/d3eTdTbQJE0LPQX6/vhot/FEpUwINocXSanePiS6zTjJvL03wo3iUnahU
         uJpDY13nmmgnFfiUK8F6JgpNxb6DReZuPLuYUqOKFv7OyIrPWwJiiZ9iQ8ckb8h1qTB9
         PhaxupZ677RAQ2ROT02+jJ6Go5j0t87WzxPaR1p9fSKM/gjU/Ur880+3yDUZQGJQulTZ
         yuGuI4rwbcvO3tOGfVqEq5qtcEOix/8Uj5E9fRd9T3LYJCglz3o1iR8CjnhdSzkjI9Ho
         e/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709224960; x=1709829760;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vNZxO+maZ/8cU1NVm8QqlPDl3pXTDuL601hEP/qUtHI=;
        b=pSTJ+/rBUCNcJK5wrG6MrcgHxRqu52ksgJTREq0jJXqnrT0ZPrfn1tof/XuUXWeeLF
         Cd1XcLXUt86b46vNfbjQpco3zQcdeCRAynvoP6sgI/hHl4Zh2PmneqHeWh2o8tURlqVP
         Y6IcaeBdUeLPhX4rIBhEX+FsUY4j216IjnFlqVkVONDdVoMtF7AdFEzg9FdvAYRhAGJ5
         lH1MRoTzne/tQcO/l2LDBm6vjm8lxxcZNRhJwC7Z3OU0F6QKRZHDf6f0NV+DGiS+QoF0
         ZXm5HpGFJD6v9kraLznT2FWcobbA5We5nIGHNnmN86w9v9wP2hYskzruVrcKPZeVCOxF
         IRIw==
X-Forwarded-Encrypted: i=1; AJvYcCVliOgto5H6pDeZqk1hvV7lq1JYXXt8++mJRssZv+6R4t1HpRKhw9Pv2/afEtLq77msZ137eHhR/2x/WyCuBKU+cdApNwFiweLwNVMQwgw=
X-Gm-Message-State: AOJu0YytQOldhaMpahBG5a3HygNay4c5wSRUTr7zGDaX2lH1cZn/YNHw
	B7C8MehuwgS0nM9vUdCxz2g/S4+GYYTeuZZf5jeykDKub5z8uPd4ZdvAOZjwEQ==
X-Google-Smtp-Source: AGHT+IG5ddQt4hC4mKS5cvgDWe0fw61PGHx4/ht5iJnK2UBcC+G87TFo7LID5pxTXvQ7LwAPJWGtAQ==
X-Received: by 2002:a50:cc46:0:b0:565:3aa7:565f with SMTP id n6-20020a50cc46000000b005653aa7565fmr1767025edi.8.1709224960317;
        Thu, 29 Feb 2024 08:42:40 -0800 (PST)
Message-ID: <dca418e7-d863-4fa9-9740-aada11313c33@suse.com>
Date: Thu, 29 Feb 2024 17:42:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 05/10] xen/perfc: address violations of MISRA C Rule
 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <3418c09bb8c4ceeceb66334191adfad190954f56.1709219010.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <3418c09bb8c4ceeceb66334191adfad190954f56.1709219010.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.02.2024 16:27, Nicola Vetrini wrote:
> --- a/xen/common/perfc.c
> +++ b/xen/common/perfc.c
> @@ -10,10 +10,10 @@
>  #include <public/sysctl.h>
>  #include <asm/perfc.h>
>  
> -#define PERFCOUNTER( var, name )              { name, TYPE_SINGLE, 0 },
> -#define PERFCOUNTER_ARRAY( var, name, size )  { name, TYPE_ARRAY,  size },
> -#define PERFSTATUS( var, name )               { name, TYPE_S_SINGLE, 0 },
> -#define PERFSTATUS_ARRAY( var, name, size )   { name, TYPE_S_ARRAY,  size },
> +#define PERFCOUNTER( var, name )              { (name), TYPE_SINGLE, 0 },
> +#define PERFCOUNTER_ARRAY( var, name, size )  { (name), TYPE_ARRAY,  (size) },
> +#define PERFSTATUS( var, name )               { (name), TYPE_S_SINGLE, 0 },
> +#define PERFSTATUS_ARRAY( var, name, size )   { (name), TYPE_S_ARRAY,  (size) },

Same question as for patch 4. Plus if this needed touching, then the stray
blanks immediately inside the parentheses would please be dropped as well.

Jan

