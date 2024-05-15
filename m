Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F478C61C6
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 09:36:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721970.1125739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s79B4-0007V4-Fk; Wed, 15 May 2024 07:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721970.1125739; Wed, 15 May 2024 07:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s79B4-0007SN-BV; Wed, 15 May 2024 07:35:54 +0000
Received: by outflank-mailman (input) for mailman id 721970;
 Wed, 15 May 2024 07:35:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s79B3-0007SA-GJ
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 07:35:53 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1e66429-128d-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 09:35:52 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a59c448b44aso145094066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 00:35:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781d2dcsm820694166b.44.2024.05.15.00.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 00:35:51 -0700 (PDT)
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
X-Inumbo-ID: c1e66429-128d-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715758552; x=1716363352; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lWSzj71CoUYpciKV+ThBycq38u3zBqG1EESkCslYEhE=;
        b=UzLFFvYaHeEnI2eIn5Us7koW4LFic+qCcGlDtkkYucCgGXwCU3O7nKRURZP+WxmQ/B
         ooK7Jg3NeBM25kHNILfSRuJtaogWyKftegc28ZSlHm8ieP48kFN8P44AnNSpsPn+AtLW
         j23BDE+/WjxmPy7SD+0oAKaT77LondFDvIU8jHBdB4uju80Nl92MQoFh+VRAiXbhBmHf
         IB5Os5DP+sRa66zdmEH6yRCGbsZQxGIAognMcCqLwYQvfwm7kNFsjdmnJcMPqn5CV2Jm
         zNSo5BDJ/WPNWzKc824i7ooCY9MEIZQePn9tFYginfqzLXY4bQrg3xknPVmIT73XV/iA
         GJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715758552; x=1716363352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lWSzj71CoUYpciKV+ThBycq38u3zBqG1EESkCslYEhE=;
        b=tWDdRRRkIjKyCiL09QCV3Pg38hLDtqOsQutdNFx3muOWw7zkHMTdWbwl5s5oSBfSnN
         bUELy+UwfcUbXk0wehbdumEhb1t1Wp4Go2XCUqwbF8uMVUd+AruUO9DaJ28hcCCI67zU
         HguduC8DPkkc1PA8YPw0majla/Zdv1YDpjWVwT72mlQaXbkO1Od7JWCDzA7A3VsEIvTc
         VVwikh8E27sWewEfvfy10vDHe9XVufla+aJ9mjzqVVGk9GTiL12WOb44ID/krHnYkVh7
         qaM2GQvdcqFncxvfw80tIvC3dcTqFMAjb5uJJeKabogCFv+RKW6p68CCXt5Og0NFf4sa
         cqLA==
X-Forwarded-Encrypted: i=1; AJvYcCViZSSXnniir5/BJelzz8J4ffHwExWE841yvOkEjR4/Tf5eHlZ6cjRKQvYBYgxWhkC1GMlambKTHdpK9GQluNxDIc9OVFyRNEp51Swn3t4=
X-Gm-Message-State: AOJu0Yw+ORoDcgx1aNExJcfrt5Pxy1fa5AS0RIjj3PbKvzWkbilriaMc
	GVIbMVV80ntoq9ZUPQbv75pSvLIXWa+HHphVEOJMFtID7tQsTGWuYwE7AnX8Rg==
X-Google-Smtp-Source: AGHT+IF1OrqJ5l2SNwEbkVug/7e2pgUHNcvJWTks/0smXfwL0q5G2lCN70yH/bigXODJfNswmNGjkg==
X-Received: by 2002:a17:906:d935:b0:a59:d243:945 with SMTP id a640c23a62f3a-a5a2d66a888mr955341666b.57.1715758552072;
        Wed, 15 May 2024 00:35:52 -0700 (PDT)
Message-ID: <bd1072c5-1533-46b7-b6c8-fab1c0f80ab3@suse.com>
Date: Wed, 15 May 2024 09:35:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/misra: add D4.12
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, roberto.bagnara@bugseng.com,
 consulting@bugseng.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2405141611170.2544314@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405141611170.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2024 01:15, Stefano Stabellini wrote:
> Add D4.12 with the same explanation as the rules of the R21 series.
> D4.12 refers to the standard library memory allocation functions and
> similar third party libraries with memory allocation functions. It
> doesn't refer to the in-tree implementation we have in Xen which is
> subject to MISRA C rules and MISRA C scanning.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 80e5e972ad..bc8506add4 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -76,6 +76,11 @@ maintainers if you want to suggest a change.
>         considered libraries from MISRA C point of view as they are
>         imported in source form)
>  
> +   * - `Dir 4.12 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_12.c>`_
> +     - Required
> +     - Dynamic memory allocation shall not be used
> +     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_

I'm having trouble connecting this remark with the directive. We do have
dynamic memory allocation routines, and we use them. It doesn't really
matter that they don't come from an external library, does it?

Jan

