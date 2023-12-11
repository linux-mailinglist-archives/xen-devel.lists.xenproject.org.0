Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE17E80D0A5
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 17:11:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652363.1018167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCisX-0001Rx-H8; Mon, 11 Dec 2023 16:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652363.1018167; Mon, 11 Dec 2023 16:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCisX-0001Pi-EV; Mon, 11 Dec 2023 16:11:33 +0000
Received: by outflank-mailman (input) for mailman id 652363;
 Mon, 11 Dec 2023 16:11:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mRXB=HW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rCisW-0001Pa-93
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 16:11:32 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f19fe65b-983f-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 17:11:30 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40c19f5f822so26003165e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 08:11:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q12-20020a05600c46cc00b0040b4c59f133sm13339488wmo.1.2023.12.11.08.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 08:11:29 -0800 (PST)
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
X-Inumbo-ID: f19fe65b-983f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702311089; x=1702915889; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WfFQ31DC5aksTM3eHzPZg7sBtAZMRidND5qGkoyKnho=;
        b=KrHY6OrfttLXoB+J9IHVM9fCI+N/wj6o6Rn0GNpy+KlvwNLtrSJGlxfYVj2j7gDfFY
         239PPw34+EJ0NnABx+pE/ZWeNWBq/MCB13BaeH/1oTDjhGltoTMoe1H157TUHuO3T3dT
         /lf8J+pBwfdOGOcFOQ/ufE+Qub8BeKvFFBilItwSzem8GtMVH94A8moGqZHgLFYvsgsf
         Tb2pRYUc9OcnHf/9WGNwUfDY7nFGL1qp6KxpFPjnjeDBCvefeZRLJ7Hx/FF7yqEoGFnP
         ZXg9Gh8LFiNQ02NYucz5b5D6BNV1cOeg0qbebD6qriN2NQPUL++9KMOi3Fcy/sa5xivq
         5/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311089; x=1702915889;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WfFQ31DC5aksTM3eHzPZg7sBtAZMRidND5qGkoyKnho=;
        b=LvnXXvASoEVHHBxqnzVk9KLR8Oz9zQxHqUM1fk5d86w3tsprqLqXb5v+DgJPfZA9im
         4Wb5moK9y02k2mLjLHBc+xv3bo+G8DdhnhR0FpPWIlKxAw6IRX4oUUwY7VQP/dtBSfxy
         DprSeIbwNGRNdPbwbt2Q345d6pn6HLZ5Okt2UJSHddPAa8GdotEyzWMSBVz0OgivIZLv
         yEwsUpu+X5hwEfYT38Pt0UIwx2NXuTzf5fFHOYEe5U+oQlMJt5PCc4TNpxBu70BbuLkS
         0BffrC3XPFlV9Y60LElDPcwUw9YZY09cXgHBY63l6ezOYaemfCfsLB/gaJ85FAoqI3Lf
         OH5A==
X-Gm-Message-State: AOJu0Yw5+uS9ML+zPDgsNFtIdYvIfsqJqMYngpWr8RiOolt9JzWT6UQb
	wlLLdy0fb9mewA8nQE1y2sM5
X-Google-Smtp-Source: AGHT+IERvdO5C+V+4N+h5P012dbDfI4pKyZ+DYusKF2vKCB8FmsNC+J46ayiLo9fiO91gS6XLFUZ9A==
X-Received: by 2002:a05:600c:35c8:b0:3ff:516b:5c4c with SMTP id r8-20020a05600c35c800b003ff516b5c4cmr2106448wmq.18.1702311089582;
        Mon, 11 Dec 2023 08:11:29 -0800 (PST)
Message-ID: <31c897d6-e196-4eed-998a-d776fbf041b7@suse.com>
Date: Mon, 11 Dec 2023 17:11:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/arm: smmu: move phys_addr_t definition to
 linux-compat.h
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
References: <e525cd0a2770743e052819b2e14f7df50f801a23.1702303903.git.federico.serafini@bugseng.com>
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
In-Reply-To: <e525cd0a2770743e052819b2e14f7df50f801a23.1702303903.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2023 15:54, Federico Serafini wrote:
> --- a/xen/include/xen/linux-compat.h
> +++ b/xen/include/xen/linux-compat.h
> @@ -16,5 +16,6 @@ typedef uint8_t __u8;
>  typedef int16_t __s16;
>  typedef int32_t __s32;
>  typedef int64_t __s64;
> +typedef paddr_t phys_addr_t;

Nit: Wants a blank line above the addition. If no need for a v2 arises,
I'd be happy to adjust on commit.

>  
>  #endif /* __XEN_LINUX_COMPAT_H__ */

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

