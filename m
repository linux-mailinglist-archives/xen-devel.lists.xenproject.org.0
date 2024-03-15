Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A714C87CA72
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 10:13:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693703.1082089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl3cP-0004Yl-Uv; Fri, 15 Mar 2024 09:12:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693703.1082089; Fri, 15 Mar 2024 09:12:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl3cP-0004XA-SN; Fri, 15 Mar 2024 09:12:49 +0000
Received: by outflank-mailman (input) for mailman id 693703;
 Fri, 15 Mar 2024 09:12:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rl3cP-0004X1-0G
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 09:12:49 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f0cdb41-e2ac-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 10:12:44 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a449c5411e1so239191466b.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 02:12:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h21-20020a17090619d500b00a46447348e8sm1510700ejd.191.2024.03.15.02.12.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 02:12:44 -0700 (PDT)
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
X-Inumbo-ID: 2f0cdb41-e2ac-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710493964; x=1711098764; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jVOgakGe8faeutUV1zRVP7AxkFZ6opIywJfJEZvuySI=;
        b=cGJcag21FPF31XowVnHlhF5NwyDRLapFoDBrYRvRPc2+31P3dtIOYsN1v5QNP9cgBK
         M0W4rdhqnm8Ck5Dc67jy8CBSNk+A5hQAqO03oPFeG1gPkpErfTYf522L9LUUREgD+GRT
         2Gg2UMurxeCZfUu/QI2Ltadq4d1rTHVIUSXSvsl9n9EaixrKPG7SyA69Kuh6YHOL+gWM
         Hc4QA+Q7uvNhV4F32NHk/bD/ojDsiYrJd/zttxsaK0R+9seZlnxwjoZ55edBSHu47yQe
         OPRxDD+4vXIKvtHTlN366A0Ayt5L4NtFhBjfcelXot30N5LEzda1hDT7O8WdYJXvNQwA
         gZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710493964; x=1711098764;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jVOgakGe8faeutUV1zRVP7AxkFZ6opIywJfJEZvuySI=;
        b=YFVAccTAogZs5C4GUxRzfMf/AxpQZvq4sPQK6F0l2ArjJaXPaAKW9RRooB9slq0rWe
         9rSaw3Bh2vbQmhTK1NCBb1dvhIcWF5q1QvjNkzQJaUk83aQq6j8Vmsy4IuA7lqwV27Us
         jQXk8R6ZpMK02goqaTKI6vmMHiSzj6tvgqfMLWUVjRQ3BPf7HXZLNpG1BHXUL6G0JpAw
         zXaBbH3vE10eli+TFKBSJQOxfMLC4Ux2qIgN3drD0hyw4xmwyXTXreVVTTB3D7vM4SJT
         +TTU2JvL7u9ILsYiY5fxZClgPdrOgNOTMHVaaRHmPfXhdMR3BESt3YIn63ulp+SAhjnN
         z2Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWCibu/nBVnzpMc5fJuRXlO6jAoJYtyGniTS2ESXliZgKqKKknTRRSy+JLS28EiHb0QKWi9/TXKpBTOUjzeH8C9PlDQ7tj/keO3zCzxPFI=
X-Gm-Message-State: AOJu0YzrWtmYxfVCMhuZxQB7QCbWKoBSbStw3/J1JFwzdWb6rqd2ErgE
	ww6OumhGAb0bIE5thp33XWbRRekKLkFaCOpBn0DfMHGRGbnv2QQHWU4voxg7WQ==
X-Google-Smtp-Source: AGHT+IFGmhPGHf8xubxpEjvi8G1D1dt3RI7nSybuQy9yeA/Hkmp8/13SoUQlQ6sM6Xde7510j8u+WQ==
X-Received: by 2002:a17:906:3545:b0:a46:1fb:1df with SMTP id s5-20020a170906354500b00a4601fb01dfmr2642544eja.42.1710493964451;
        Fri, 15 Mar 2024 02:12:44 -0700 (PDT)
Message-ID: <f3c56a60-2f66-4d9a-bd29-1e573122080d@suse.com>
Date: Fri, 15 Mar 2024 10:12:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: allow parameter name "unused"
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <f2666bff183d5497b4993fdc27f6a66141ec8d85.1710433895.git.federico.serafini@bugseng.com>
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
In-Reply-To: <f2666bff183d5497b4993fdc27f6a66141ec8d85.1710433895.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 17:35, Federico Serafini wrote:
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -157,6 +157,11 @@ Deviations related to MISRA C:2012 Rules:
>           - xen/common/unxz.c
>           - xen/common/unzstd.c
>  
> +   * - R8.3
> +     - Parameter name "unused" is deliberate and makes explicit the intention
> +       of not using the parameter within the function.
> +     - Tagged as `deliberate` for ECLAIR.

Before writing this, did you consider what is going to happen when a
function happens to have more than one unused parameter? They can't all
be named "unused", so some flexibility is needed here. E.g. by permitting
a number to be appended.

Jan

