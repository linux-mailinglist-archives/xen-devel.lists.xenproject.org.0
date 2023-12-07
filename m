Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1259680851B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 11:03:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649744.1014577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBBEG-0000Op-8M; Thu, 07 Dec 2023 10:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649744.1014577; Thu, 07 Dec 2023 10:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBBEG-0000M9-5m; Thu, 07 Dec 2023 10:03:36 +0000
Received: by outflank-mailman (input) for mailman id 649744;
 Thu, 07 Dec 2023 10:03:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBBEE-0000M3-IA
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 10:03:34 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0c87b78-94e7-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 11:03:32 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c09b021daso9684595e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 02:03:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h17-20020adff191000000b003334a1e92dasm1019745wro.70.2023.12.07.02.03.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 02:03:31 -0800 (PST)
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
X-Inumbo-ID: e0c87b78-94e7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701943412; x=1702548212; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IVk7Kz7JjYBNQy6gS/IYwYKuDUpulP39JKkQlsuy2a0=;
        b=ZLp/lQBSVZIHfNFtdl0US2SSOt0HkF9sOvRQj+nk8cZAKC87aSWoTyLjuNq8Xlrxy4
         i/TsUwCQJgnkzgXOHYMaEZEiIgqEBZzF0lOb34C44gBsPGjgRvQ5di9BEFLYpx2O+4qG
         lAK1VLsj+X1Qe/VWkpkT/kIKScIQ1RPLQEUHddUe6NxG+arswdY+xPy+Vo7p7lRLUTe/
         f1bJoCD4drPqnD2/bk9aIGwu4XmVqpmbeaVMKcGhucvXYE1SFhOJqLxwJHh92W2s8++t
         JPxrp4Uf4WWlldX6PJvnNoGURGIM7yp/P5Dcoill1kiGT8MB92jyQRl85u/bgR+zj4rx
         FgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701943412; x=1702548212;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IVk7Kz7JjYBNQy6gS/IYwYKuDUpulP39JKkQlsuy2a0=;
        b=BgAIJbVYIMlM3r4KHYlitR/8ZETqMpjTbHOQCvggKGt9BqXIUWBsVXYAMQTSYG6vBD
         Yl3m0W29AeB/JOB1CXYTh6Z8G8/razd1m7zhCAYyUuFMqNKyVv3hONluQzBrFQOZf5f3
         VAV6ifD/zkVBrPCO3NipcndfI5lFaIMh4Iwdq0BhI25sDyMQRUHTrb9vMxe75DKFQBnq
         YIp8ZXycZEzpFvkvRcWMj9OB9yu9zAb0Bwi2lqCfRntefarOP/TVsWVlEsVfKL8xcQ1u
         TN/Emli/rTMRXDrBCWMjLuuV+3xdMUOvXweAiVr3sv3WWj54rV2JXHCkeCl65nxPGw/P
         XJQw==
X-Gm-Message-State: AOJu0Yz6ol1FPpQcY8atjdfBujGaAhJBidxArryCQyWSDxjle33w6GVS
	XvzUsGU4Gc56JbtxH0xAQwx/
X-Google-Smtp-Source: AGHT+IGl0p62CuuMWhPI6V6INjbvgEGHBWQWQq1V1I/vDsKLhCf1MKFL5LkdoZTOcT/KjLFK6LtclA==
X-Received: by 2002:a05:600c:35d1:b0:40b:5e21:bdea with SMTP id r17-20020a05600c35d100b0040b5e21bdeamr1339196wmq.121.1701943412105;
        Thu, 07 Dec 2023 02:03:32 -0800 (PST)
Message-ID: <cf2f9afb-764e-4c2a-b81a-928c912af37e@suse.com>
Date: Thu, 7 Dec 2023 11:03:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] AMD/IOMMU: address violations of MISRA C:2012 Rule
 14.4
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian
 <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <cover.1701941924.git.maria.celeste.cesario@bugseng.com>
 <097df7703c372a687206251fe97bfc5df18222b6.1701941924.git.maria.celeste.cesario@bugseng.com>
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
In-Reply-To: <097df7703c372a687206251fe97bfc5df18222b6.1701941924.git.maria.celeste.cesario@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.12.2023 10:48, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 14.4 whose
> headline states:
> "The controlling expression of an if statement and the controlling
> expression of an iteration-statement shall have essentially Boolean type".
> 
> Add comparisons to avoid using enum constants as controlling expressions
> to comply with Rule 14.4.
> No functional change.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>

Just to mention it here again: I'm not happy about this change, so as
it stands I'm not meaning to ack it. But I'm also not meaning to veto
it in case Andrew is okay(ish) with the proposal.

Jan

