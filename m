Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C79A384E414
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 16:30:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678277.1055382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY6M9-0000qQ-9J; Thu, 08 Feb 2024 15:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678277.1055382; Thu, 08 Feb 2024 15:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY6M9-0000nv-60; Thu, 08 Feb 2024 15:30:29 +0000
Received: by outflank-mailman (input) for mailman id 678277;
 Thu, 08 Feb 2024 15:30:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rY6M7-0000nV-3r
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 15:30:27 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa9f5d4e-c696-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 16:30:24 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4104dee26bfso2550195e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 07:30:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bv7-20020a0560001f0700b0033b525dbc70sm2625796wrb.79.2024.02.08.07.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 07:30:24 -0800 (PST)
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
X-Inumbo-ID: fa9f5d4e-c696-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707406224; x=1708011024; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3LL+IMK6+DyY0TYkPMCbzd0twwOfkoWuFWCqCoHRBMs=;
        b=T/mIcKvHpnjdszn2gzNtrnhweIPqGFhnb0A03fQvy+SOPdh6dK+jc3WbarE4/Poi+j
         4RC6255QzbT8tSxN0Gz1pRDfcMtvQpD4NHFoaid3IkRXSz61gLjNuVSJjzpfg7YY4+GF
         XECJa8Q9NP3q9B/psevdeTH8Ttepeyjde/XJC9rgD56NOFV43+H2yGICF9qn4n22Icmn
         lAD/S+VYLcsMdex5av04DvvM3YyH4R0oI6T+r1Q6+WN6tT20cjdACwYB5T7XViLNvB9u
         JstIk7toKxRDsH9jpjpmtWQ+UMUDVKIqcFzughivtaho0Tsi2kpTrV7MjbXRaSEZ7KlV
         XMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707406224; x=1708011024;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3LL+IMK6+DyY0TYkPMCbzd0twwOfkoWuFWCqCoHRBMs=;
        b=iFZbmWUkIb3kwlmyjwYWZP4Iu3ruCSJZX0UFMsaw+GiVJBlDGq6qDdqtYmg6f37qwk
         f03LXHPVgmmOBkWpwMN/a3HoV0Jpx462l2UY9oLB8hnHC8S6UFEoGGDVZ+nlxH9llONL
         O3tLrM1e9DMIiKRG7C/qG8EImFi7HKkwUNOZJx2zVwDcbR+cbKNQ2+3A0f1BRen6izKb
         bc/hmUPJqb4dSobGDl4PpkRM74EcVM6UOb6hsl7rgnzoE+UAy8GKgRcl9bKTX8EtSaP7
         dM+XH+2goxJikxLLShmvkTWpjWXSjTu7RVBVnKw0IurORNI7M8ASZOVdFhbHqfnL/VN6
         k5rw==
X-Forwarded-Encrypted: i=1; AJvYcCVWU9xlIBlL7kDVXYdlBpr/TwbSabKWwrAIhGT/sdWwWTcyVzft0CpIv0YSPWwi1T/EvgZraEknjfBXbtHe+79MX/pdve/CcZWIjoyaWDY=
X-Gm-Message-State: AOJu0YyXLTG+t2Gxk0QjR2+KMGTk5XGlpGUo5KScK7EhXTzYdYjTNNXm
	C9rCpxnwBB3EdBG35Yp3Pq8Vgzz3CKkXtgwkRpArWt4seMZ+wnGpBzTdrD73uw==
X-Google-Smtp-Source: AGHT+IE0Dl/N99PnPibWJIickBNqMnZ0Fjq4u43fhDJ8c3bBfixc1L3kWFxq9qTE3ag5aV+2n6lMAA==
X-Received: by 2002:a5d:49c8:0:b0:33b:226c:ecea with SMTP id t8-20020a5d49c8000000b0033b226ceceamr6165279wrs.32.1707406224429;
        Thu, 08 Feb 2024 07:30:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX1iAALmx159uWm5Zw1hdhg2C5teSCMYiU0L0KLxrnGXdFTa9xu7HE7T9YUc7FY/0czozCOGafzrmmZmyC/lwWbDwONXMrSUZ0Obr/bCOhIaaLIubxj9enEp/xm6BWO86j0qs8Vefeq9byystT+761jswg3ivqTFVnWR1u0wRfuf3coyUDYMiB4nZ0ywHIFU7S9dROtKSVjiISeQSc=
Message-ID: <1a0368d3-9562-4225-b2d2-26dc13d741e2@suse.com>
Date: Thu, 8 Feb 2024 16:30:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] config: update Mini-OS commit
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240208142852.3819-1-jgross@suse.com>
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
In-Reply-To: <20240208142852.3819-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.02.2024 15:28, Juergen Gross wrote:
> Update the Mini-OS upstream revision.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



