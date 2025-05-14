Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FF0AB648F
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 09:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983953.1370124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6fD-0003zv-Qa; Wed, 14 May 2025 07:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983953.1370124; Wed, 14 May 2025 07:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6fD-0003vy-NH; Wed, 14 May 2025 07:36:27 +0000
Received: by outflank-mailman (input) for mailman id 983953;
 Wed, 14 May 2025 07:36:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uF6fC-0003vX-5N
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 07:36:26 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22e192db-3096-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 09:36:23 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ad1f6aa2f84so135695466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 00:36:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fe86b239d1sm3897297a12.35.2025.05.14.00.36.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 00:36:23 -0700 (PDT)
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
X-Inumbo-ID: 22e192db-3096-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747208183; x=1747812983; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tSZqls8tlSS3jOxVyex5ucGJihf1GprkiyKwcEsHybc=;
        b=Xycvq+RN93ltwZmpcbqfOZEAxdb5IBRpwgD99wd1iwxy7czLTyEHSK6zvKa8B5E/Da
         3XMOlqBkybL+FFEJiyYcIezCDNkCEktjjxcZE/Pk74I0AUDHRzsZfq39Evzxr8Z7BKty
         MfwdgEHjNMsHfkhyFUv/gKeORsKe4WUiy1duWs4l3U1bBV9PgUxt6ycWWYxbYf9NafJN
         EnUU+gKfyO+ra2gcSjdAVSnZU9XQVb+1yAxZEfWMTGorYSWzh0E/9yReyGSBCelwPhh4
         8P+CEHr2u91AouA1e5Pd8qrOwa4B7/TyrK7C5WYpc573cLemq4BZXy3EoFIw8l4AAKjx
         hzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747208183; x=1747812983;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSZqls8tlSS3jOxVyex5ucGJihf1GprkiyKwcEsHybc=;
        b=M8z4ptASqayWQxydauiGDvypEFEtJu0jdHlAqFAIALVd9F2KjbLAvpsHhRBcApQ2A1
         91XnElwZUwabv+fSkTbJme8eOBUQKzrciKd1+HeXwSrKMhCw7flhN0+YYolzYr8nsqEc
         5anwUMd2qBmcIQUrqQ8u3lg4/nhs4uUHaH8ZEVx0puiAKhH3RD9tfAhEvmle23M1eG8Y
         bGUVGx5Ey/Nn0dbI5PYsgY59sFfOm2RN7XyYYpZsN4vpR/0la8I6CHXTm9d3Rj/pUu1D
         hU+vq6th/8zk7mOYvN2MMHZc1PABojwY9aO9U/si3UD/C7OFR9huJTJTzIKZbMTkxmHg
         v+5w==
X-Gm-Message-State: AOJu0YwjkeELi5PFTGcVrKpF7fdgbFFzVh4RcNQmeRZtwXlE2M8UrTmC
	KHQJGNzZ8Rvky5dc+ZupKVnb8kPIpgQKQ6VBcRY5o+S5vOq3BXQTMHZaLD+2DDFxIj5QV/qX2Uc
	=
X-Gm-Gg: ASbGncsc+4asDlsqKZkdS4B0RyDRdUaVTFhScwZQGXirNVpGKGxpHINuy9dy2tH6rRE
	KW+/AVRQZEZdhRtWpa0ZDxtZjrgw1Er2fra0TI9UF3pJNbfzGhZDcD6ptlj90Q9nMy/raufclPR
	cg+dhmSJvtXk0247KPGn/bc1lVa0xGibRY6Qa5W3pt8PXTtAnSlZUNJknh9RIeVKMblO2kaCVT5
	f6JQhUPHno4O0wLJMEV0f7qqnrfFaXHOxYfzIxDUOTZMzpnP6x+sdJY9wDpBLEeOfjki9uWyGFD
	0s+0ReTYsu0XC2HX1uNz89pojKjdRA9hZL7SvSHZS56zSIGeSiZGsHuJ+nm+bi5iPyFbJvOlgPN
	sTZhzjTR/WL8KLqX6d2EiDTyBsJpCooGVvKOX
X-Google-Smtp-Source: AGHT+IGcXPgePM/t+9C/r1iw+pKfOEY5fUWr29to6rxJEDgbzRM8vQZ53DrpNT8iIYDIRoxRx5ttCw==
X-Received: by 2002:a17:906:6a19:b0:ad2:27e6:7e62 with SMTP id a640c23a62f3a-ad4d52bf2b4mr562013366b.27.1747208183572;
        Wed, 14 May 2025 00:36:23 -0700 (PDT)
Message-ID: <080883ed-a1eb-43fd-80e1-1653859b2eba@suse.com>
Date: Wed, 14 May 2025 09:36:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/dom0less: mark domain_p2m_set_allocation __init
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20250513171810.668370-1-stewart.hildebrand@amd.com>
 <alpine.DEB.2.22.394.2505131707020.368682@ubuntu-linux-20-04-desktop>
 <cacb0002-dd6b-49e5-8019-2d323771e3e7@amd.com>
 <4e684e38-ed64-4731-8f00-afba938a28a0@suse.com>
 <369ccaf5-5c17-4601-88b0-eb32af8608d6@amd.com>
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
In-Reply-To: <369ccaf5-5c17-4601-88b0-eb32af8608d6@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.05.2025 09:04, Orzel, Michal wrote:
> On 14/05/2025 08:56, Jan Beulich wrote:
>> On 14.05.2025 08:31, Orzel, Michal wrote:
>>> On 14/05/2025 02:07, Stefano Stabellini wrote:
>>>> On Tue, 13 May 2025, Stewart Hildebrand wrote:
>>>>> All functions in dom0less-build.c should be __init.
>>> Why? This patch is first in your series and by that time there is no build time
>>> enforcement. Together with the Fixes tag it implies that this is somehow an
>>> issue (i.e. build/runtime issue) other than inconsistency for which we surely
>>> don't need Fixes tag.
>>
>> I disagree: Code not called post-init should be in .init.*. While not formally
>> a Misra violation (and wrongly so, I think), it imo effectively is: Such code
>> is otherwise unreachable post-init.
> You have a point here, I agree. Although I don't think MISRA differentiates
> between unreachable in general vs pre or post init. It defines it as code that
> cannot be executed. It does not go into stages of runtime execution.

Right, hence how I wrote my earlier reply. Elsewhere, however, Misra (or at
least our interpretation of it) does appear to care about init vs runtime,
in e.g. desiring no runtime allocations.

> I'm thinking how this is different from a function that is called e.g. only once
> at specific point at runtime execution for which we did not come up with a
> separate section?

With enough effort such could also be covered, I expect, yet at the same time the
ultimate result may be coming close to getting out of control. Whereas for init
vs post-init we already have a pretty clear boundary, with memory used merely for
init actually properly reclaimed.

Jan

