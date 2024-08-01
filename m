Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7180594454D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 09:19:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769385.1180258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZQ5X-0004xa-Hz; Thu, 01 Aug 2024 07:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769385.1180258; Thu, 01 Aug 2024 07:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZQ5X-0004ut-FE; Thu, 01 Aug 2024 07:19:03 +0000
Received: by outflank-mailman (input) for mailman id 769385;
 Thu, 01 Aug 2024 07:19:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZQ5W-0004un-Hy
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 07:19:02 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52f22bb3-4fd6-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 09:19:00 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a7d89bb07e7so359865266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 00:19:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadb8072sm853418866b.196.2024.08.01.00.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 00:18:59 -0700 (PDT)
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
X-Inumbo-ID: 52f22bb3-4fd6-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722496740; x=1723101540; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cXWYNbgdry2va3J1g0/Mel9z+qK9Zc6esLgfAqzyg34=;
        b=KGO81fV+N/1ymHU1X3w8CzNPO0JcWXTPBueJ1vFOFXw6D/7cHKEcALy52spwt/dXdP
         8OGTTs3bwh2mTN0yuppVMEl58gXIunI1DV9+DTFOOSdF39+fuK9mpIeoHL//s39s1XaK
         u1DIeNQkXQcTjn6zRuIHDUcx5pFg7HN3aRD/6+/yIyMP8Y4l7WcJdQTk2IleuhXr97yf
         fAU/C+CGMN7B2qYQstlNcHbjJyiX6n9noPeH3zzXyKx17+riuwrMOgEDHEU0FW13LQRG
         zYxCVtPVIib6NeB/1cG0KgCZDbSpMPl+Lkok7czD0J47Q/+kDDPynE+f6haKYdsH0JrG
         ePnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722496740; x=1723101540;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXWYNbgdry2va3J1g0/Mel9z+qK9Zc6esLgfAqzyg34=;
        b=LEcBNvZKzmoWyA5SPDU1ThlhcsaA9c2TZdyP6ibXJh5kXWCbFudhexkIIDqpDjyF3i
         9G4bAl9tmhA4T8I44xUueFjPn9Z/AsVrbUIZ3zLFokFwkXatYkmdjeY9qb6wqxzZq2TY
         bASw35NvvfgMaROSggFLfXW4CAGBxy3FNyLkPpZpaInrQZ/Ii+SWK0xupJrJ3PLKUqVI
         RRVzqbvelO7c8knbk7dtwQQwI/1txV4tV6BL71b0ZnEE0JHXHc2gnZab7fi0IFAf0Dqp
         6XxwmdQW9MFr5UPdxzFU5lprucBIpLtPL/VdkWvpHIrk7Nd8PQNSDmerJn/81K96OBmM
         QKDg==
X-Gm-Message-State: AOJu0YwtWn2zomTCIakwWlc91L9yU1PEC5FPOyQZbKXaO/QvTXh1FCB+
	jgcbvR/+afQRdwnTjWkeBN7FBDS1aAFTbqndaQi8Y5GouA+A792g8x/OD0aQQj7m+49vU9agWvs
	=
X-Google-Smtp-Source: AGHT+IEeH4qvuSfymUkt7FgY/yK/7+Y8yXczxVdaV3xcRBY1/QmYdlHold1mh5O82SQkgrkDBqMlJQ==
X-Received: by 2002:a17:907:9688:b0:a7a:b9dd:775a with SMTP id a640c23a62f3a-a7daf79561cmr98251966b.67.1722496739900;
        Thu, 01 Aug 2024 00:18:59 -0700 (PDT)
Message-ID: <fb9589e3-a4d4-4278-b8e2-65ae7c3c02b9@suse.com>
Date: Thu, 1 Aug 2024 09:18:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] docs: fusa : reqs: Added a sample of requirements
 [DO_NOT_MERGE]
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, artem_mygaiev@epam.com,
 julien@xen.org
References: <20240731163614.616162-1-ayan.kumar.halder@amd.com>
 <20240731163614.616162-3-ayan.kumar.halder@amd.com>
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
In-Reply-To: <20240731163614.616162-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2024 18:36, Ayan Kumar Halder wrote:
> Added a sample of market, product and design requirements. This is to
> help explain how we are writing the requirements and understand the
> context of the first patch.
> We will be sending these requirements for review in the subsequent
> patches.
> 
> Please do not merge this patch.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>  .../reqs/design_reqs/arm64/emulated_uart.rst  | 240 ++++++++++++++++++
>  .../reqs/design_reqs/arm64/generic_timer.rst  | 146 +++++++++++
>  docs/fusa/reqs/design_reqs/xen_version.rst    | 207 +++++++++++++++
>  docs/fusa/reqs/market_reqs/reqs.rst           |  77 ++++++
>  docs/fusa/reqs/product_reqs/reqs.rst          |  64 +++++
>  5 files changed, 734 insertions(+)
>  create mode 100644 docs/fusa/reqs/design_reqs/arm64/emulated_uart.rst
>  create mode 100644 docs/fusa/reqs/design_reqs/arm64/generic_timer.rst
>  create mode 100644 docs/fusa/reqs/design_reqs/xen_version.rst

Just one formal comment here: New files want to prefer - over _ in
their names, unless specific reasons exist why - cannot be used.

Jan

