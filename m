Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8A78689F8
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 08:38:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685888.1067322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1res2b-00016D-3N; Tue, 27 Feb 2024 07:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685888.1067322; Tue, 27 Feb 2024 07:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1res2b-000149-0r; Tue, 27 Feb 2024 07:38:17 +0000
Received: by outflank-mailman (input) for mailman id 685888;
 Tue, 27 Feb 2024 07:38:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HnYt=KE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1res2Z-00013E-OY
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 07:38:15 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29401359-d543-11ee-98f5-efadbce2ee36;
 Tue, 27 Feb 2024 08:38:12 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a3e72ec566aso497415966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 23:38:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 lu17-20020a170906fad100b00a3e45a18a5asm489474ejb.61.2024.02.26.23.38.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 23:38:13 -0800 (PST)
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
X-Inumbo-ID: 29401359-d543-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709019493; x=1709624293; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t8rr3Yu1kppMh7d6qm1M4HurjPsU/I8DuPlwD+6HbtQ=;
        b=Lrx235eoubCcjYFPKB9e4/tJUC0lhF3JHpaUGvnmHzXHjBniRehrljiRxiUC9HOxlx
         6Yb8kMf4J8NP8w5jl6hnD0HPuIctlPBwUszYkfbKJfGPptVN2RhgSKwXNJUN7qM9QW3+
         GO3YXweOSYAUFhoTlw7yHle4MbdFUbmgo9M1xI2b0eJiUC98lbekO38UBPJupDjbYmPQ
         3bSvSrosD3admS97Q/a1e54O8jQI+sFPbbR7Th4USGuSVrI1iHwQnb63RynswEklLS/Y
         Qx50B6fBpFatslbqd/Bo2DT+rn+m4jdq8h65/hvE3TcdsU+NpiAoRvcuV7W675W4Kryz
         AmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709019493; x=1709624293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t8rr3Yu1kppMh7d6qm1M4HurjPsU/I8DuPlwD+6HbtQ=;
        b=do30untyf7a2aRnonkK43tPZEa5ktSGh2TyXhTEaemVU+dY1zOL8Tz31AzCPM7Qq7R
         cYEpfPjCp/ikip++IiKk6vtZ2VDlu1UZTr9/HvU23kZ2vpViOmT5mFGHgdD5Yxk+Yz2x
         MLHqV0ufaYql3NngxSpfkisbYtvpcVEBcRkacqOndOjaxU88xjiPC54uu7pRjwL2nq1G
         qlVOfC2NuJQjT9YB61OFL6YPALwu0f7Dfv7/R9/Krv3IpPx3DT77QWMsZGczzgVRzqdk
         lMfZxbJYHu3zomKXBvAvqIGhANcdsexaByvJ/GKG26Ae3USvAQ0OLLbTCyWUSMaG7j1s
         MIFA==
X-Forwarded-Encrypted: i=1; AJvYcCU0VTDIrgqIyMnfEVVkuDxNVZLa4qD8ZFEP2tspEl2a5StBwWrlBp1HurFmt5RrKQd8ad3I4MMV9MHOugTtWOWBruZG5QdZHXTcn7BnM9c=
X-Gm-Message-State: AOJu0YxZVUfx6qrUF3zkdwDaJX+ws1KmGqRh/WZd7VGJQr+aJb3JtvU7
	dTZJlQVPZlHoZ625FxBaNjLsBU+7JwGwAxO2dbeBRNbnPj2tQZqC3n+Iv5VD6A==
X-Google-Smtp-Source: AGHT+IFCgvsCIJDrbcrG1XQKZuxdSNCmiqPMYqmqG6zl2wy4ypIH/5+a83IAd5W1O7yRyYVQiPBksg==
X-Received: by 2002:a17:906:48c9:b0:a43:3f37:4d88 with SMTP id d9-20020a17090648c900b00a433f374d88mr3941008ejt.71.1709019493296;
        Mon, 26 Feb 2024 23:38:13 -0800 (PST)
Message-ID: <293c6236-1ad0-4a48-853f-afec419656e9@suse.com>
Date: Tue, 27 Feb 2024 08:38:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/23] xen/riscv: introduce nospec.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <16370492de5344ae8e1aab688261600491868f4e.1708962629.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <16370492de5344ae8e1aab688261600491868f4e.1708962629.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 18:38, Oleksii Kurochko wrote:
> From the unpriviliged doc:
>   No standard hints are presently defined.
>   We anticipate standard hints to eventually include memory-system spatial
>   and temporal locality hints, branch prediction hints, thread-scheduling
>   hints, security tags, and instrumentation flags for simulation/emulation.
> 
> Also, there are no speculation execution barriers.
> 
> Therefore, functions evaluate_nospec() and block_speculation() should
> remain empty until a specific platform has an extension to deal with
> speculation execution.

What about array_index_mask_nospec(), though? No custom implementation,
meaning the generic one will be used there? If that's the intention,
then ...

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


