Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5519E805323
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:38:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647675.1011173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATkf-0004ID-8k; Tue, 05 Dec 2023 11:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647675.1011173; Tue, 05 Dec 2023 11:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATkf-0004GE-4B; Tue, 05 Dec 2023 11:38:09 +0000
Received: by outflank-mailman (input) for mailman id 647675;
 Tue, 05 Dec 2023 11:38:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rATkc-0004Er-VU
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:38:06 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0e06ecb-9362-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 12:38:04 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40b2ad4953cso41095885e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 03:38:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bg24-20020a05600c3c9800b0040b3d33ab55sm22284633wmb.47.2023.12.05.03.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 03:38:04 -0800 (PST)
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
X-Inumbo-ID: c0e06ecb-9362-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701776284; x=1702381084; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hzKa1Dx2dZg8S7YoZWzImzxxkEiCHh71hCRgk8iUnCM=;
        b=Vw5vT90I1zD+bb2heoQhjm1F1ywJigVLyJb16UHNl76BeVrxemqZ8gnhnsucMH440F
         rTC+T/1fol4djdPFLVWv2xPB9462vWvxQni8ZiJCFR7mH3ReuRDbT5VO2MS6ra4RAsI1
         E64zPqW11vjNHm0AzBVxzbdbpsLo7MoIpeGzzAfIKjkumnzBI9HUrWvRfoqeWLrUKXLF
         ECBHLnned8Q0oRfSBVQAo4gLm7YelmqX6bzDEayjqbmFPnAKJbk5hEPpsM5ZDG81Y6LU
         oZM2GUnTU/3Nheg+JXD6HENiB2i5jN+Xp6WyUSo6pnqy+K7ba0xiuK2Yh72l3w8RqrjB
         euaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701776284; x=1702381084;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hzKa1Dx2dZg8S7YoZWzImzxxkEiCHh71hCRgk8iUnCM=;
        b=rAXWTpnR0cKWZbdlEihbQOWzw9glwg84PchHq0nE7MJ9xzgfl7lsi8YcvNeXlutCUr
         21237rw9YelDIDkCbks3gL0FRPeoNfqgoe+oRkA8x6hgOa+sXBszdzNTdWu5vmTr3c98
         FmgCafDiEE0NSdt0hZZ58Ac1cMl0jxzmifqDKLsYAiC0m6JSCwo0Jy1oIjYBMgrZZpKr
         8lC2krWzohYi/FpxBVCsPpf223L4yF0g9qVlwIby5qXCwPM5skpjdaYFsSr6gCFddsxf
         dp17t1PmYAJZY3CzjdyetbgMnx4MWofVxkhV2AiTYjLNfuUjq62WSZh/wMJCh9saj6lh
         UBjQ==
X-Gm-Message-State: AOJu0YzRkUC4+7ehmhns6rek6pYjJMCRyQdGuceTnf5gjY4H9kElCn/U
	UugP1Uy1EtLCIAWiBnpM0TqF
X-Google-Smtp-Source: AGHT+IE+0UfSMY5RmZdIWdGIoDJePrEVu/5oBUk9g1tCz0qZstyFZFK9gDngh9FLJ/F6eNrP3lbr0Q==
X-Received: by 2002:a05:600c:4c08:b0:40b:5e4a:2368 with SMTP id d8-20020a05600c4c0800b0040b5e4a2368mr413527wmp.106.1701776284412;
        Tue, 05 Dec 2023 03:38:04 -0800 (PST)
Message-ID: <4797d75b-5ad9-445d-bbd7-6e90cd80f5a3@suse.com>
Date: Tue, 5 Dec 2023 12:38:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] config: update Mini-OS commit
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231205103508.5811-1-jgross@suse.com>
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
In-Reply-To: <20231205103508.5811-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2023 11:35, Juergen Gross wrote:
> Update the Mini-OS upstream revision.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



