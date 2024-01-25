Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 033D983C49A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 15:23:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671562.1044964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT0d1-0002Pc-TB; Thu, 25 Jan 2024 14:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671562.1044964; Thu, 25 Jan 2024 14:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT0d1-0002Mq-Q3; Thu, 25 Jan 2024 14:22:51 +0000
Received: by outflank-mailman (input) for mailman id 671562;
 Thu, 25 Jan 2024 14:22:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rT0d0-0002Mk-1w
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 14:22:50 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36c39bc4-bb8d-11ee-98f5-efadbce2ee36;
 Thu, 25 Jan 2024 15:22:47 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2cf3a095ba6so5804781fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 06:22:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l4-20020a056e020e4400b00361a956a57bsm4722978ilk.53.2024.01.25.06.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 06:22:20 -0800 (PST)
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
X-Inumbo-ID: 36c39bc4-bb8d-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706192567; x=1706797367; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jjgE4/eD39pLbdN37dGtPPl8iUShLmoC1ifdou/kWqM=;
        b=Qxu3tO092/8Fl54UTO8Ywv2ZR7dFI5UozoRz9hHe07gXzXeqWHETjVvLLj3vRjF/IU
         q8wlzc7rH6C1Apf+xybC2Q0EeIA2bf29O8IPoAOclubRWE1tkUhzyGPQ+ii4Xa5A7FyR
         SELcApEos42zycb0egVw2qclAZHLa3UT3GdKQq+NAJqbS302KKMoZ5qqVvcLqPz+ilFv
         31ct4rWNa8xYLjzuT2jvkEAuO68myAhyq8sGGTvZ45k6lybP+ArwG8go6HcytHzspKTC
         5QF82cuJDbzAZ9QAfx7tCV6b076HdJ3FO+gx4OAczdQJ16KLZ8PScy7PMJwQbPivUVt0
         jj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706192567; x=1706797367;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjgE4/eD39pLbdN37dGtPPl8iUShLmoC1ifdou/kWqM=;
        b=Y8s3dG5zrYCKEXMga+hAxVM51sYkpzTsvp1EUq9KF6DJwOQL00vH21hMGmDnOkCve0
         s0WdgDQ6uiTc8HostL3pDvrwt29KT5ehpr2KWWMIYWvZM7IEnSvplWkPKz+P+579t6u3
         zEpdkNcnAHD0BFlaNMqfBTu6RGj7RV3lQhOiUxcL+Fk3q4MvQDJKUqufVpnY3JlytYHn
         RqBGYX+rhgZrXJWfwp71d8/5tSOvt9ny/pKkmaaXkTdYIkUFCQzn1i46FrrSHaE663J7
         4uVsSj/89Xgm+8YJjf8T7bknODCM4TMPiN6XrsZJdygdLw9tBTiuhjtHu6iLfGe9yp+F
         ADqw==
X-Gm-Message-State: AOJu0YzFu8zquelhDOqfuZT34+nLtSp9kedkm3osI2ph6wv/zwfoXgCy
	CkCks/jf9qwWIG2G9Vt8JHj2EbNCXiKl2rSDpOIcrqm+zHECktu/Q93eOYk20hHoItyO286AG8E
	=
X-Google-Smtp-Source: AGHT+IFoxCuetn85ahuq6bc2E6CJTIq3V2N4smbbROBR/a//nl9GHAtUrc/tpR5KuYWS7oUZnvuklQ==
X-Received: by 2002:a2e:8882:0:b0:2cf:2a9f:7eaf with SMTP id k2-20020a2e8882000000b002cf2a9f7eafmr644140lji.36.1706192567464;
        Thu, 25 Jan 2024 06:22:47 -0800 (PST)
Message-ID: <c6af3d7a-c67f-449f-a04a-1de18db07fc6@suse.com>
Date: Thu, 25 Jan 2024 15:21:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] pmstat: Limit hypercalls under HWP
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
References: <20240124205922.67266-1-jandryuk@gmail.com>
 <20240124205922.67266-2-jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20240124205922.67266-2-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.01.2024 21:59, Jason Andryuk wrote:
> When HWP is active, the cpufreq P-state information is not updated.  In
> that case, return -EOPNOTSUPP instead of bogus, incomplete info.
> 
> Similarly, set_cpufreq_para() is not applicable when HWP is active.
> Many of the options already checked the governor and were inaccessible,
> but SCALING_MIN/MAX_FREQ was still accessible (though it would do
> nothing).  Add an ealier HWP check to handle all cases.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



