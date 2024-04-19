Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 800EE8AAC94
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 12:12:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708931.1108140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlEE-0006kP-OO; Fri, 19 Apr 2024 10:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708931.1108140; Fri, 19 Apr 2024 10:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlEE-0006hx-Lk; Fri, 19 Apr 2024 10:12:22 +0000
Received: by outflank-mailman (input) for mailman id 708931;
 Fri, 19 Apr 2024 10:12:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmAy=LY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxlED-0006hr-TC
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 10:12:21 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e5a32e1-fe35-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 12:12:19 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-418c2bf2f90so10467915e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 03:12:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bd6-20020a05600c1f0600b00419c24abaccsm388584wmb.12.2024.04.19.03.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 03:12:18 -0700 (PDT)
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
X-Inumbo-ID: 4e5a32e1-fe35-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713521539; x=1714126339; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nffn3BKQGqcRxTiO78Z/gQ5yBv7ZrNCWyiLWNwZ/NeM=;
        b=Eyv/ismoPYRox/uLhwJLhNP7t7bQ1ysDFTn6/IUU5UXW0DDdJ8/DHZmstAYTRxNxzQ
         TooETH2SgJf+3wZhKIOVSpvMZ4r5ISYZXnOe7EuWCRMBi7Mpg9tn+VZAL1f9o4zg5Wxk
         ksk8y3lqsB2n6NR+oGvmyk1xXBKvw7IYfLtgUnlDXfpNETKguPFDD2/UCOSRZLMjez4o
         vXap7TVqFiP9ND5ilZ8Ip47cM/6ygaUyn3i3/efGvFnQ3D/8djmsznxKYIscDcrNJEP5
         gIQ6IuIpJ5QF+JpEzZOChdo0e+n+kzMadwWoBcip8pKgbguqUNd/c7wruBfdxU/YZAuZ
         gJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713521539; x=1714126339;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nffn3BKQGqcRxTiO78Z/gQ5yBv7ZrNCWyiLWNwZ/NeM=;
        b=O8xX1jZWQ/50wIu6xJX29MBMbYtFvjnF3KSw/gRAhOUuvSOL6mqtH1ThDn5rgRniHf
         c0sFXdTNJ/pGRDW61AJFyVLdPZ4XSDOXVl0KBLT7jecD1vdhQsLx/QBmwbQJnTvI4S8S
         /2naaIq6ubsRf1M98+ROvrFoL9nrJfbzKIAod+u/gsxuX0QVJ6AukSgLj9cTlGfBmNhJ
         2udm29j5OjR5xwtEmQlnsxWo3FzQ/5a/JP4iknykvdHS7v65dDD9wqtSqwj1xgxShGHj
         tKpgaobrO1KIcbtShhhV7JXs1mSf2IbGoCmv67+6C7xZo8ZbA30KQLLByeE0UM/Rk8Zd
         p68A==
X-Forwarded-Encrypted: i=1; AJvYcCVNU/z06zjv/VjIgaTYTZC1/BskJtBt231rqIVpIMFPd80GKHOhq/zuY87A+uCyFNSVnyph+JLsP78AHuONQQq8US0Lc5Az5D2CbtlEjhU=
X-Gm-Message-State: AOJu0Yz23dc34hhZ4IpZR9bW8nmanINTp9G+8buQlQ8acNt3CNzYwuoL
	jI1NRkByvqMoYrRfSumjCtP6vhDq8kTk5/5o6ThN0Ua0cf/WhY6v/QxKXubLIg==
X-Google-Smtp-Source: AGHT+IFH276pMQ6E5XNzMq3HQbcsj4wWej19w9pyhPjfUNspmZcrVYyZTRQ69hMtj5fSRN+XyTR4MA==
X-Received: by 2002:a05:600c:3b1d:b0:418:c6a:1765 with SMTP id m29-20020a05600c3b1d00b004180c6a1765mr4243761wms.16.1713521539188;
        Fri, 19 Apr 2024 03:12:19 -0700 (PDT)
Message-ID: <0fe755cd-722e-41cd-9499-49dc628bf52b@suse.com>
Date: Fri, 19 Apr 2024 12:12:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen: introduce header file with section related
 symbols
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20240419100217.12072-1-roger.pau@citrix.com>
 <20240419100217.12072-2-roger.pau@citrix.com>
 <a5253ad9-02e6-408d-862c-91a3a87ad9e2@citrix.com>
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
In-Reply-To: <a5253ad9-02e6-408d-862c-91a3a87ad9e2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.04.2024 12:08, Andrew Cooper wrote:
> On 19/04/2024 11:02 am, Roger Pau Monne wrote:
>> Start by declaring the beginning and end of the init section.
>>
>> No functional change intended.
>>
>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> TYVM for doing this.  There's a lot of cleanup which can follow on for it.
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> although if anyone has a better name than sections.h then speak now.

For what is put there now, and for any other section bounds markers the
name is fine with me. I'm not presently convinced though we want to put
__read_mostly and friends there.

Jan

