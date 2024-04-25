Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A24808B258D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 17:47:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712162.1112629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s01K0-0006Rk-5M; Thu, 25 Apr 2024 15:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712162.1112629; Thu, 25 Apr 2024 15:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s01K0-0006QD-0E; Thu, 25 Apr 2024 15:47:40 +0000
Received: by outflank-mailman (input) for mailman id 712162;
 Thu, 25 Apr 2024 15:47:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s01Jy-0006Q7-IN
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 15:47:38 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2356ce3c-031b-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 17:47:36 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a556d22fa93so139631066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 08:47:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 le23-20020a170906ae1700b00a4e4c944e77sm9637139ejb.40.2024.04.25.08.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 08:47:35 -0700 (PDT)
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
X-Inumbo-ID: 2356ce3c-031b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714060056; x=1714664856; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2oYt/jIM6peXz1IU9bBS20I6AfhXNf0l1tAzrxz5TwI=;
        b=VJPkQ5LzD4VLilvTJuBt4LdehWq6TO2P50yjMYgcqcRScbtgqUWKNONj+p3lEyQUD4
         KvXecNikOqPZXlvRMAsk5sNPi2dlDPwo1AzRpT2PzeUF2GP0R3RVFhd8yk1pEyfVJhxu
         +kQ26RpBMr7SY07bgCnmf7HhT+joI/OjTiXEdtBqfiGIYwXTaoRDK7N7pAxh2JPVemZZ
         15MWw+u2/hUjpjY0f10g36DTatqyewQI2R8EUtVUJ8TzmcL7qkJGWdT7O+l5NoQa2uYg
         Pzr9XBbC0XF99LpEu8mDVpiOL1aevUrK+lQxwNTMdL464M8mcTWF8Fn0fYKxuherBvQD
         VqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714060056; x=1714664856;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2oYt/jIM6peXz1IU9bBS20I6AfhXNf0l1tAzrxz5TwI=;
        b=PmVrXARwa5ddB531qYtn0t/ZbYxASGzt8bsNF2gJ9F6yj5xTx8uMljWo12YNrvo9cH
         1NnYlDwKJs9W70HcbSMzgAyFYRFFcVn2aV0kaeuez5qiiNw7CxinYEvmFfJIHRsCXKtA
         amdIYtkFByn/2FoXKovhhE8GRxfOXua5mzf/UiL3/k/3I4eks2lQ2928OokUlm9f1sNJ
         KLor2LcO3yIiBExbg4uq9zPc9Jtj9UIIdtCcoaA8wHZ4aoe+YPXDYAXoufnu9pRkUrR9
         h9xIwuJx8m+eGBRNKtBkQW8P6T2z2RB0C7hiQha8b0LsEUl4WiF2W/fAwijTLfjexKOc
         ytoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmYOPzB23GlD3vdQvMI6te+K/VREHX5f2EWM8fMht0oLou1h0ZxNdouPt7OgIxFMxcxFU43Vsikro8zuqa03FdVP5hTAMOzfRs9GtGf/8=
X-Gm-Message-State: AOJu0YxhUpg17ECeeJFSg9u8lyYrg/GyEZiCIWZT7tE0p/2j5rE9igDU
	j7vv3F7/I9axnEtZaM9vmgHklAEehCD1O6nSxNGt7syVRLU2yTBjOLAV6A7hpQ==
X-Google-Smtp-Source: AGHT+IFJPZVocSX4ve9TUnS07wydtRIc1K1UfKTWf8XocgT/VhgbgPSnHRwqAFM8j7hZ3QPItKgbaw==
X-Received: by 2002:a17:906:315b:b0:a58:9096:ba43 with SMTP id e27-20020a170906315b00b00a589096ba43mr102192eje.15.1714060055948;
        Thu, 25 Apr 2024 08:47:35 -0700 (PDT)
Message-ID: <484b887b-c4fa-45fa-be8a-ff742dde38d8@suse.com>
Date: Thu, 25 Apr 2024 17:47:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/17] xen/bitops: put __ffs() into linux compatible
 header
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
 <2ea76feebc5ffe543801b9b3935a82a64708a909.1713347222.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2ea76feebc5ffe543801b9b3935a82a64708a909.1713347222.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2024 12:04, Oleksii Kurochko wrote:
> --- a/xen/include/xen/linux-compat.h
> +++ b/xen/include/xen/linux-compat.h
> @@ -19,4 +19,6 @@ typedef int64_t __s64;
>  
>  typedef paddr_t phys_addr_t;
>  
> +#define __ffs(x) (ffsl(x) - 1)

See my v7 reply.

Jan

