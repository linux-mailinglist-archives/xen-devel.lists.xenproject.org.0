Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE80818C5F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 17:36:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657043.1025674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFd4a-0008Sm-Bi; Tue, 19 Dec 2023 16:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657043.1025674; Tue, 19 Dec 2023 16:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFd4a-0008Q0-8P; Tue, 19 Dec 2023 16:36:00 +0000
Received: by outflank-mailman (input) for mailman id 657043;
 Tue, 19 Dec 2023 16:35:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFd4Z-0008Oc-Ck
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 16:35:59 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b02e817d-9e8c-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 17:35:58 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3367632ce7bso446076f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 08:35:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h3-20020a5d6883000000b00336755f15b0sm1505163wru.68.2023.12.19.08.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 08:35:57 -0800 (PST)
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
X-Inumbo-ID: b02e817d-9e8c-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703003758; x=1703608558; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j9hJKF7RRuBSejCOh++IK5x52P/Eji436fOwdpI2cfA=;
        b=VvJCrTC9YX5gz7kr6GichRnoEskvI0kHSvnRMoxOsAgy8aLwJyfHPjd/GY/wDcLscf
         kloIRlBDEbd4AWTMJt6MmhGXMQd3gbQ4bc+UWKALrZZiCQZ7qouELbBlkz2JDGkprICc
         lY6EuCmr4QlwTMS3SLJIcwZy6dc7UVQFNovoeLf+r4Dwo/0VzhpDXhKeE6FUorjgt5z6
         pBEvWOGrozGupp6jbN+vuuxTt6U30Gj0XoXWNs13Fmi59RVIOuVn9Ytx3A7H5m9wEDLG
         LRlh8uIlOXDE3BBAqFlew/vrjfBN7/H4948mv3/W5SCRg1AUU6CN5g/FtO6Y+c8foh/y
         p1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703003758; x=1703608558;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j9hJKF7RRuBSejCOh++IK5x52P/Eji436fOwdpI2cfA=;
        b=AnIliW4eE51s24uJV6MjuYRaYfxXe4YsiLxf+9QhagfrGlpLfqbALhnvhp49MTxJzB
         I7co7SWc1ny4La67qrfe8YpiDT2vj3qzUl2F7jVQfiPPOpSjX+ofzImJu1GYeT1zCM16
         5WpVS+VVnuzOIel9kP6nC5EKncqFRlucvWZH4rS9PxSAfO/jhaRCFVUAZmJk/Lq8eyJY
         PeKlW4GpiVURoRCmJz+qTAZkTJOlGozEJz1IZOgf5QcGjwKxBohKUrp9XZuyDDN8eraB
         vK+Fxr3OZDOTSh0W7Jmh8lcz99WMflqjXSB2+uiL2M8R7OGxgmirUEJRTWI5HaoMeSn3
         dA2g==
X-Gm-Message-State: AOJu0YzXCEPg7hYpeJj2YCSYbqYj4idoHQSfSv6X++8c6WeQkLndT+1C
	cfb+OiYii9+XOQtEbokG/SZ0
X-Google-Smtp-Source: AGHT+IE88lp1v5YkDqE9DSdZM2tJSZjDJIgm63EytiwTouDSoM34/RqHkkU1qK4fGMnubsPa6QWjiw==
X-Received: by 2002:adf:e2cf:0:b0:333:32d8:e0f2 with SMTP id d15-20020adfe2cf000000b0033332d8e0f2mr10168376wrj.102.1703003757990;
        Tue, 19 Dec 2023 08:35:57 -0800 (PST)
Message-ID: <8a236600-7fa3-48da-a692-8286e5931f21@suse.com>
Date: Tue, 19 Dec 2023 17:35:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] xen/x86: introduce self modifying code test
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20231215111842.8009-1-roger.pau@citrix.com>
 <20231215111842.8009-3-roger.pau@citrix.com>
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
In-Reply-To: <20231215111842.8009-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.12.2023 12:18, Roger Pau Monne wrote:
> Introduce a helper to perform checks related to self modifying code, and start
> by creating a simple test to check that alternatives have been applied.
> 
> Such test is hooked into the boot process and called just after alternatives
> have been applied.  In case of failure a message is printed, and the hypervisor
> is tainted as not having passed the tests, this does require introducing a new
> taint bit (printed as 'T').
> 
> A new sysctl is also introduced to run the tests on demand.  While there are no
> current users introduced here, further changes will introduce those, and it's
> helpful to have the interface defined in the sysctl header from the start.
> 
> Note the sysctl visibility is not limited to x86, albeit the only
> implementation is for x86.  It's expected that other architectures can reuse
> the same sysctl and structure, with possibly different tests.  Leave adjusting
> those to when support for a different architecture is introduced, as the
> sysctl interface is not stable anyway.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



