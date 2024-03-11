Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1207877B59
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 08:33:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691203.1076907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rja9T-0007r0-FF; Mon, 11 Mar 2024 07:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691203.1076907; Mon, 11 Mar 2024 07:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rja9T-0007pD-Bw; Mon, 11 Mar 2024 07:32:51 +0000
Received: by outflank-mailman (input) for mailman id 691203;
 Mon, 11 Mar 2024 07:32:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZVPQ=KR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rja9R-0007p7-QK
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 07:32:49 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e1651c9-df79-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 08:32:46 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5684db9147dso1002884a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 00:32:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bm24-20020a0564020b1800b005682f8b62a6sm2616809edb.97.2024.03.11.00.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 00:32:45 -0700 (PDT)
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
X-Inumbo-ID: 8e1651c9-df79-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710142366; x=1710747166; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B3RvATf96rWv6M4+vM3PXqEhIxUAX6vcQRD5Vf2iN8A=;
        b=bwyXJ2LNT6+cK78+n9yDkmH4h7/fHc6/n+X47OENCEKy0oIq/FD/52QFznhLrSMuGn
         GtPEOt6NNRFlr+p0ftb1EzLHHQKraYW7KQwXfGbxc5RtNmKgnQpjxALBJ1Omt4GL3/fR
         6qRKx9tORJmqDcxWYUWUh9U5WxMc/7n7V9dd7Iss9DlBaN2WcTxN2gW/BfpG0udGXr9E
         ZJXoDTTladrWO13rhSid3qJjFtogT1LxlBSb/D96HEUBTfDGJvu2fj1nh6UT9kGQ3BDr
         H0/cBLpJ84/S9NVq5yXMWzZ/tjaG55mAePkPR7qe6DxWn6dtgZlIL8FT/l61K09IczPE
         iQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710142366; x=1710747166;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B3RvATf96rWv6M4+vM3PXqEhIxUAX6vcQRD5Vf2iN8A=;
        b=i3G4mFtXJI6/3Ee2ew4E/3CT9XwsUsX/J5bsny7tW/kN9GEFPcXW+93+xNB2woXnA6
         ep1dVczYJC00Y06osYRFPQCgJN9uGLMG1iZ2cqygnHHZguoydpHFc7UTg6znmdz156dO
         jGxRERS7xV7TnPgqGaAiY/d0tvMZiVFnRop1QU/5b8kovbxiYEcFFbqbeRs9tTQ5DSl0
         xGeQOkNtsXC/qeFCTyPBlJYP+lqEoRZu04ZPVhoKtKFem3Iomjcg5EwVQPUPoeF/6hJY
         MundY6x8pH9altXL7k4Nuc4p3FwjbWHCTVaGz+W9n2vLw4Z2nEhcfOM/s+PZLr+F1+j1
         r/uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRF+Q2V7FRQe0BBe4q8NbAkadecOeduykOglguzeTYpXiq63Ss9R5Td5TywVKPoXYIlTaMS9LL7z/slKZPWZHxZp3LhjP82aeICiwKImo=
X-Gm-Message-State: AOJu0YwQ2gpS55rpseyjZg7fBYRAFjoG0dIFTayzeHCCBiiBcL6nYMH/
	HJLEzqZbC9OFLk30nbZwMHmuI2Fajl16EYzekQJ1Fr5RVS7NPTaN45pFmRGNjw==
X-Google-Smtp-Source: AGHT+IH6Vkzm37VcSz+pvebU/96ODzs6PMdegr8j4jXCeuOsCALjSsVOZC46ECmXwBicAute4wsPDA==
X-Received: by 2002:a50:ab1c:0:b0:568:3367:d603 with SMTP id s28-20020a50ab1c000000b005683367d603mr3606916edc.2.1710142365871;
        Mon, 11 Mar 2024 00:32:45 -0700 (PDT)
Message-ID: <6e2c0cb6-89de-4429-8f43-c4687a26cefe@suse.com>
Date: Mon, 11 Mar 2024 08:32:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/compiler: deviate the inline macro for MISRA C
 Rule 20.4
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <d2b3ae062756a28a040a9553a4f0e621cfdeb5e0.1709885163.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <d2b3ae062756a28a040a9553a4f0e621cfdeb5e0.1709885163.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.03.2024 09:10, Nicola Vetrini wrote:
> Rule 20.4 states: "A macro shall not be defined with the same name
> as a keyword".
> 
> Defining this macro with the same name as the inline keyword
> allows for additionally checking that out-of-lined static inline
> functions end up in the correct section while minimizing churn and
> has a positive impact on the overall safety. See [1] for additional
> context on the motivation of this deviation.
> 
> No functional change.
> 
> [1] https://lore.kernel.org/xen-devel/adaa6d55-266d-4df8-8967-9340080d17e4@citrix.com/
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  docs/misra/safe.json       | 8 ++++++++
>  xen/include/xen/compiler.h | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> index 952324f85cf9..a2bbacddf06a 100644
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -28,6 +28,14 @@
>          },
>          {
>              "id": "SAF-3-safe",
> +            "analyser": {
> +                "eclair": "MC3R1.R20.4"
> +            },
> +            "name": "MC3R1.R20.4: allow the augmentation of the inline keyword in some build configurations",
> +            "text": "The definition of this macro named inline allows further checking in some build configurations that certain symbols end up in the right sections."
> +        },

With this wording the ID isn't going to be re-usable anywhere else. Even
if the exact same reasoning would apply.

> +        {
> +            "id": "SAF-4-safe",
>              "analyser": {},
>              "name": "Sentinel",
>              "text": "Next ID to be used"
> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
> index 16d554f2a593..e3d9f9fb8e4b 100644
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -82,6 +82,7 @@
>   * inline functions not expanded inline get placed in .init.text.
>   */
>  #include <xen/init.h>
> +/* SAF-3-safe MISRA C Rule 20.4: define the inline macro to perform checks */
>  #define inline inline __init
>  #endif

I don't think the definition is "to perform checks"; it's rather to make
sure checking elsewhere wouldn't (seemingly) randomly fail. 'Override
"inline" for section contents checks to pass when the compiler chooses
not to inline a particular function' perhaps? Albeit that's getting
long-ish, I fear.

Jan

