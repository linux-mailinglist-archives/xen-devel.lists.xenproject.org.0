Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB699261C3
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 15:27:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753041.1161303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP00V-0001mo-LW; Wed, 03 Jul 2024 13:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753041.1161303; Wed, 03 Jul 2024 13:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP00V-0001kg-IR; Wed, 03 Jul 2024 13:26:47 +0000
Received: by outflank-mailman (input) for mailman id 753041;
 Wed, 03 Jul 2024 13:26:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sP00T-0001kY-Mw
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 13:26:45 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e41d488f-393f-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 15:26:44 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ec1ac1aed2so63853041fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 06:26:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c91ce4526esm10718900a91.20.2024.07.03.06.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 06:26:43 -0700 (PDT)
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
X-Inumbo-ID: e41d488f-393f-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720013204; x=1720618004; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BTgp217jkGxA3qd5eePlwnG7B0Q2D097KFwdsCIW5oc=;
        b=S6Sbjco2ck5ISVnm16P8mgyj72RGCwFgjKqOAoabXwI34hXVX+WYOUEZZderCYvwRF
         727OsZ9Pc2eWS3uUjUExjJOYCcfYzCcIZqzIoyT8g/Tp7mhXj9g5K+i9wlPSZ/+IoE/N
         vHOn7UcAWdsjki4lPI1lmEwvXwpwdK8X3fppkK58V8ztIzCONK7hj2+at1IZidrqN4w5
         Wg7AR+CuQDyn+YfJFPObs0U6LMQ1DUfpIs1ZUMYfmyhUbNXtTAMtpI1sjDZoqdiCwN8X
         qzQledpCysOTjXzY9UA6HmkqW+v1JV4gKID566A2dFOtaAvkry88Eat/eE4q/zzMC2xQ
         xcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720013204; x=1720618004;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTgp217jkGxA3qd5eePlwnG7B0Q2D097KFwdsCIW5oc=;
        b=QCBHgTgQcM0aXIFLa2GSehDZrKzkyPxZp4dU9s4M6RrpKG5q13ySN0YPP2E59iSJEM
         X731CMU+EZSX/YczhdMlwBBJJfd6slUbBVloruCzCngBU6uUf6i72+N09BUzh0fq/4Jh
         MHjzW2SuttVona+q0TUoZpzBYIKJuM/jLMrm0z5fPSto/TDdEwVeCf+2JHk1YbiyHYiD
         CJLlYoBrxSNUuX13+KnGSMKmgEcs16PkY5JwCuW98zMWobxtLkQhidJMvY9oqCE0kMp2
         nZ1H03dlmO8mJMPRdoz20xnKWlD6Ah37kkrJ30GFuzNowGIzonUtZF5HED+N9eW2QAv1
         dxfg==
X-Forwarded-Encrypted: i=1; AJvYcCX6EBwG2ip6jQhVB1uXvJ5tyhqxJv4Q+6aV+FU/YiK+AnWKnn/yPd3UfzqRmX+Q56XlZcQKfNMGIvr27bv+K+ZH2/4cSY05iuV98wIlt+g=
X-Gm-Message-State: AOJu0YxaXJbW7MokI8p+lVbUyAMEJr6zqjfZvTqLhXH2CDQyeWfGjmO6
	snufVD3ciWMfqMeD6DHxSoDmqTMKCE5ERxVq3JNh5IRg1cqyS+wKHphka5ACyA==
X-Google-Smtp-Source: AGHT+IHHMFYk2h7UOwxq6emDfddnW6gy6VFgDR7jwLUJRtotVVQtnl/yk3kMBR91K08pG7Uk/VaURg==
X-Received: by 2002:a2e:240a:0:b0:2ec:1708:4daf with SMTP id 38308e7fff4ca-2ee5e6f542emr64729991fa.47.1720013203938;
        Wed, 03 Jul 2024 06:26:43 -0700 (PDT)
Message-ID: <031bc8af-99cc-45fb-84db-eb9429f00083@suse.com>
Date: Wed, 3 Jul 2024 15:26:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/17] xen/x86: rename inclusion guards for consistency
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: nicola.vetrini@bugseng.com, consulting@bugseng.com,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <cc0189e1db211ae73aa419f4bc956872220d8d3c.1719829101.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <cc0189e1db211ae73aa419f4bc956872220d8d3c.1719829101.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2024 15:46, Alessandro Zucchelli wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> Edit inclusion guards in order to make them consistent with the
> estabilished naming conventions.

The code changes all look okay to me, but as before: Where did those
"established naming conventions" go? Grep-ing for "guard" under
docs/misra/ yields only a single hit, which is unrelated.

Jan

