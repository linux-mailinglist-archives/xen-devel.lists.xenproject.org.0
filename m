Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8718804C3D
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 09:27:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647461.1010612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAQlQ-0005A7-R5; Tue, 05 Dec 2023 08:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647461.1010612; Tue, 05 Dec 2023 08:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAQlQ-00057K-Nt; Tue, 05 Dec 2023 08:26:44 +0000
Received: by outflank-mailman (input) for mailman id 647461;
 Tue, 05 Dec 2023 08:26:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAQlP-00057D-Lw
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 08:26:43 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 044c4dab-9348-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 09:26:41 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40a4848c6e1so57072855e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 00:26:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g18-20020a05600c311200b0040b42df75fcsm17896351wmo.39.2023.12.05.00.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 00:26:40 -0800 (PST)
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
X-Inumbo-ID: 044c4dab-9348-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701764801; x=1702369601; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h3rHz7hPHpRpFEzLV7NU+SZsJdf93jlXNE810uL086U=;
        b=KzHSs+Wzwus8H4oVJDbbWUEx/33BI38Vvi+Luzh57MwWh0/GHM3eYW73WIPto3q621
         yMfSF0ue1J9Z2rDUfH+ycHD0RZ2FcwNg/MqyJSMsqf30uHfTHPes16g6UZ2eU7inCBA+
         LLLEiOdv4C3YgDaILw75qaUFUXJhJwVZHd3zS+On4bSwGx/3bFT9XCsFgAM+1mYwc7tw
         Zv6uxLstJlAP0sB+t5rwVX+DzKNxkAIqsmmFcWdd8bvzsfyTbvHNrZWTv7PXYE/0Hyr0
         a4bhv29l3CNDi2S6nYUINGjHJ/uZVExNoPGqdHNxLBLhz+kWKB3j7D0ZYmSophDHfSwC
         hIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701764801; x=1702369601;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3rHz7hPHpRpFEzLV7NU+SZsJdf93jlXNE810uL086U=;
        b=SR6CDOLF+/D0qh+PV/sNqOsesL7FdlWoIFN0n7c7AR9zTuDrfXxa5qzlDyRYTYb76M
         WGwoXO1zldItammWOJ5X9Pu/+Oz0Kv6YSm3S9jlpUwjURA8Q65OjO7zYC8mB0D1SuY5u
         qc8LmYeoMl5TJ7E8N3R0uCIgBzfnd+YelRsG+AbFoZO6GsX/tllIOxYC7yUGRsaDiKqr
         Bg/kFvjdDn/TCA5ZdjDGdet53V0Mn+JmJrugQfUZwj+fCil3tsBvAiNznacO5qqT2T00
         5tmCzDasishcuyUGbG9wbZ7tSsz57egx/qR9lOZAxhTtxuxPk6tzsqyMIbvOigb2nPLG
         F7hQ==
X-Gm-Message-State: AOJu0YxWeI70Gy3xZct8qK32Y3AYcwUWmBxiltk3sEhvuuYtKxGzEQm9
	1ELOXSNBDncxqXh8F1Xwg2ql
X-Google-Smtp-Source: AGHT+IFtWhVqG/9DdiZ1YhA26EGQVqsM8AoUCmR9BBWjh/8RTT4HrK+4hL22GenoWSccw7if8b3nPQ==
X-Received: by 2002:a05:600c:1391:b0:40b:5e4a:4068 with SMTP id u17-20020a05600c139100b0040b5e4a4068mr208296wmf.136.1701764801096;
        Tue, 05 Dec 2023 00:26:41 -0800 (PST)
Message-ID: <a801a2da-6cb7-41df-929e-a4521d581d9d@suse.com>
Date: Tue, 5 Dec 2023 09:26:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/domain: fix error path in domain_create()
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231205032918.3656211-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20231205032918.3656211-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2023 04:29, Stewart Hildebrand wrote:
> If rangeset_new() fails, err would not be set to an appropriate error
> code. Set it to -ENOMEM.
> 
> Fixes: 580c458699e3 ("xen/domain: Call arch_domain_create() as early as possible in domain_create()")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



