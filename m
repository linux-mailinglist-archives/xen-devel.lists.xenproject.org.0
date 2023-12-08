Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0F6809D05
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 08:18:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650386.1015890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBV83-00051e-Ew; Fri, 08 Dec 2023 07:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650386.1015890; Fri, 08 Dec 2023 07:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBV83-0004zO-C5; Fri, 08 Dec 2023 07:18:31 +0000
Received: by outflank-mailman (input) for mailman id 650386;
 Fri, 08 Dec 2023 07:18:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBV81-0004zI-Ko
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 07:18:29 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb2e3e38-9599-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 08:18:27 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40c2308faedso18348965e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 23:18:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d12-20020a05600c3acc00b0040836519dd9sm1925651wms.25.2023.12.07.23.18.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 23:18:26 -0800 (PST)
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
X-Inumbo-ID: fb2e3e38-9599-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702019907; x=1702624707; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1SYdAbmWhos24EuutWwbD8wRit9LFm1H1azNYNy4ZIc=;
        b=M/EhQl8HySJ0XQxi+WtJ8QBWcS+A+iQg+XY/iOOQE8C+LQgjToew49lO69pYZCXyuv
         +RTNdyIL+kPN9PBrz7YE8afHElpaMy4ggmtZTJB0ge7wcRkwe1K7N+iE8BOKHLu1EbNU
         sxgIbgsZLjI39QQR63oS1qd/kPiaTJ5Iq1RviObVdJLgPopsR/jHkH1Yn+N2lXnyfQHw
         QqEI6unOWEH72q8ODHOtncfyq9gkXV34AmR6GC3OGnPwLxrHI8S8OZL63RleSJO7VyfP
         cC/BTS7AAYJbErO+rdrCCPuJAwrTsqSYsD++Fz5ktHkVwr+uxNC0Trmq27ta3pL0RQjq
         89aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702019907; x=1702624707;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1SYdAbmWhos24EuutWwbD8wRit9LFm1H1azNYNy4ZIc=;
        b=r1jWB7D375Jqfgasz2NU1hsnq2j150KkVgDfmLCAzNM4JtskEo0VbLS1GUQPxyXeAb
         /e+22Q1SXCBNOovSDK6GKR655GIbkjJMJHebSQrQugxaDZFKUpLIiwTPeh1XOtQc5Ko9
         Oy/c04RODOa5lXdbvvoZku82dENncO9WS6594KaOV3BsqUrcZxmgoZeXb4lfU9W7ia1/
         hL0FEw0dhY79k298RcKpEuIk9mC5hJp/KPVa+gcZRLW3flTUNwIrzzDRTHlEByKfRi15
         jTSTJ7kJKqI4Td+GpBKWYWzqslv3H3ZUQdM8W58HiKOIy/DvyLS5KBDGAErYoN5DsCQh
         OfYg==
X-Gm-Message-State: AOJu0YwUUkJvHj37B6BvLAaPRER/4Wc6VHHaPkvd6AuG1kKh04PMmJ4J
	qZ+nUQ7RGIs+/6mRyI7oXjrV
X-Google-Smtp-Source: AGHT+IGj8xJ1+rxT7Z6yqtQHbFPQ7IXkVHIm83VLa6wj66o0L56t7s7IzofsyHph2nBfw0Gq59pW0w==
X-Received: by 2002:a05:600c:1c09:b0:40b:36e6:b7ed with SMTP id j9-20020a05600c1c0900b0040b36e6b7edmr2506599wms.7.1702019906783;
        Thu, 07 Dec 2023 23:18:26 -0800 (PST)
Message-ID: <f51e120c-2db9-498c-82bf-66494f862920@suse.com>
Date: Fri, 8 Dec 2023 08:18:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/misra/rules.rst: add more rules
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 bertrand.marquis@arm.com, roger.pau@citrix.com, roberto.bagnara@bugseng.com,
 federico.serafini@bugseng.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2312071609060.1265976@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312071609060.1265976@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.12.2023 01:09, Stefano Stabellini wrote:
> Add the rules accepted in the last three MISRA C working group meetings.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -462,6 +462,13 @@ maintainers if you want to suggest a change.
>  
>         while(0) and while(1) and alike are allowed.
>  
> +   * - `Rule 16.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_03.c>`_
> +     - Required
> +     - An unconditional break statement shall terminate every
> +       switch-clause
> +     - In addition to break, also other flow control statements such as
> +       continue, return, goto are allowed.

To eliminate any room for doubt, maybe add "unconditional" also again here?

Jan

