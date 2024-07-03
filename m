Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9169261BB
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 15:24:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753036.1161294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOzx6-0001Fy-9R; Wed, 03 Jul 2024 13:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753036.1161294; Wed, 03 Jul 2024 13:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOzx6-0001Dt-4t; Wed, 03 Jul 2024 13:23:16 +0000
Received: by outflank-mailman (input) for mailman id 753036;
 Wed, 03 Jul 2024 13:23:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOzx4-0001Dn-RJ
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 13:23:14 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6666077f-393f-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 15:23:13 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52cdcd26d61so6020015e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 06:23:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70801e57aa0sm10381702b3a.28.2024.07.03.06.23.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 06:23:12 -0700 (PDT)
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
X-Inumbo-ID: 6666077f-393f-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720012993; x=1720617793; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2quV5rnAfwvDcfKhpQJUfAoP6PfhuasR6/ZGEPFV34w=;
        b=fmLEG/H2ro3T+rXQau6I6CDeewKZIHGlFSwL9aExooCEwBDCO94bEtlGyV7IKoaPPT
         4tdikn2cwev2/nL1/vErbIpypSeuJ0CN8xtpt0gTJmemIjVNKWWWczYZVllAiPrls7sE
         hsM7/dqa6C43J0fCAved8GFp6BgVhSTJXllHDp4ZRRzje1/5grAopQa2J/+5Gkpk9o3l
         AwmrOcnLcD4gAxZSgMCyKnsYsZBWckrgOn6xL4NDhq/sGB48WNcga1VCHevv7ukkglUU
         Pr1iyq1FjB7sVP8MVauJqx7B3Pr+F+r4BmJ2Po9VN/2DV4TPhiuQewNNYGZb2hGyyWwe
         WtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720012993; x=1720617793;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2quV5rnAfwvDcfKhpQJUfAoP6PfhuasR6/ZGEPFV34w=;
        b=NbHhma93KuKgHDlRendozuqLwgemWqhy6SDsTkkzpynlzNXiGdphmhv4P+nUuVZopf
         mg0CQxa8OXCqWk8PQdsjqLoa+aHO+hNxa0jCT4aRRxgP1E3BpHaWT+gnj6nLvCed4WTJ
         E5KI4HGxAGgn2AUm5OfI+exqTNVoKmYbzW7XFwBswvknq+gDdciCo+aE6kxfqwSGx0RL
         BhQrJXa+mZcUZmJy9AzfEYnaF24CCK1pGDH/XdyHVvHAXl0B1/RL4lKVe/jHVioJnUak
         /uwCugtoK9sAka/Q+qFoyh5P4rDzUGcdjQhBk335RlvpRGtocSnQaCliwrUrrNoGihDd
         gb0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFP1N6QtZYVMJn9nPc1RZVTBSeFRPmS0Y+vH0+mZKOKV4kX8Qo2ew9M/AQszdWDxzzeoCu0TUqKOZnSP2zRy6w9DMPHr1+JSXqEBAqrWo=
X-Gm-Message-State: AOJu0Yx4s0ZmTas7mdCIApdb1CcdOCACu4DIGPp5ywSBNT6PXDDvG9Fn
	T+0+LxVqzbTeGzKeveRU1FZ+2GdKpfIl3zoGYyxFEOe0jFOaDwN3ld6mORtnVQ==
X-Google-Smtp-Source: AGHT+IGRSel4F7Ys2tiBoTN95mTZZx1ntPydssNNV2TDLn9XiyHytjb283rx1/Di+wKhJc2U4/cczw==
X-Received: by 2002:a05:6512:318e:b0:52e:7542:f471 with SMTP id 2adb3069b0e04-52e82686a97mr8344599e87.29.1720012993027;
        Wed, 03 Jul 2024 06:23:13 -0700 (PDT)
Message-ID: <d6c313e5-19c6-4775-8d9c-0742a37032b4@suse.com>
Date: Wed, 3 Jul 2024 15:23:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/17] xen: add SAF deviation for MISRA C Dir 4.10
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <b64a6b53de8bcf14c91a1534bb57b001efc12cce.1719829101.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <b64a6b53de8bcf14c91a1534bb57b001efc12cce.1719829101.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2024 15:45, Alessandro Zucchelli wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

So no description at all for a somewhat unobvious issue with, I think,
a pretty obvious (but entirely different) solution? And that (obvious)
alternative not even being mentioned, together with why it was not
possible to use? Neither ...

> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -99,7 +99,15 @@
>              "text": "Files intended for multiple inclusion are not supposed to comply with D4.10."
>          },
>          {
> -            "id": "SAF-11-safe",
> +            "id": "SAF-12-safe",
> +            "analyser": {
> +                "eclair": "MC3R1.D4.10"
> +            },
> +            "name": "Dir 4.10: arch-x86/xen.h include before guard",
> +            "text": "This file needs to start with #include ../xen.h to generate preprocessed code in the correct order."

... here nor ...

> +        },
> +        {
> +            "id": "SAF-13-safe",
>              "analyser": {},
>              "name": "Sentinel",
>              "text": "Next ID to be used"
> --- a/xen/include/public/arch-x86/xen.h
> +++ b/xen/include/public/arch-x86/xen.h
> @@ -7,6 +7,7 @@
>   * Copyright (c) 2004-2006, K A Fraser
>   */
>  
> +/* SAF-12-safe include before guard needed for correct code generation */
>  #include "../xen.h"
>  
>  #ifndef __XEN_PUBLIC_ARCH_X86_XEN_H__

... here is really becomes clear what "correct" is, or what breaks if this
was moved. However, thinking of moving as the first obvious alternative I
checked other arch-specific headers. None includes ../xen.h (really just
xen.h, as the others all live right in public/) like this. Which made me
conclude that maybe there's something wrong with the x86 header doing so.
And indeed, according to my build testing the #include can simple be
dropped, with just one further change elsewhere; see below.

Jan

public/x86: don't include common xen.h from arch-specific one

No other arch-*.h does so, and arch-x86/xen.h really just takes the role
of arch-x86_32.h and arch-x86_64.h (by those two forwarding there). With
xen.h itself including the per-arch headers, doing so is also kind of
backwards anyway, and just calling for problems. There's exactly one
place where arch-x86/xen.h is included when really xen.h is meant (for
wanting XEN_GUEST_HANDLE_64() to be made available, the default
definition of which lives in the common xen.h).

This then addresses a violation of Misra C:2012 Directive 4.10
("Precautions shall be taken in order to prevent the contents of a
header file being included more than once").

Reported-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -7,8 +7,6 @@
  * Copyright (c) 2004-2006, K A Fraser
  */
 
-#include "../xen.h"
-
 #ifndef __XEN_PUBLIC_ARCH_X86_XEN_H__
 #define __XEN_PUBLIC_ARCH_X86_XEN_H__
 
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -525,7 +525,7 @@ void x86_cpu_policy_bound_max_leaves(str
 void x86_cpu_policy_shrink_max_leaves(struct cpu_policy *p);
 
 #ifdef __XEN__
-#include <public/arch-x86/xen.h>
+#include <public/xen.h>
 typedef XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) cpuid_leaf_buffer_t;
 typedef XEN_GUEST_HANDLE_64(xen_msr_entry_t) msr_entry_buffer_t;
 #else


