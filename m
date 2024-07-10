Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B1492CE82
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 11:46:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756696.1165396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRTuL-0007cU-Dj; Wed, 10 Jul 2024 09:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756696.1165396; Wed, 10 Jul 2024 09:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRTuL-0007aG-B5; Wed, 10 Jul 2024 09:46:41 +0000
Received: by outflank-mailman (input) for mailman id 756696;
 Wed, 10 Jul 2024 09:46:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRTuJ-0007MG-AP
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 09:46:39 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d7e28b2-3ea1-11ef-bbfb-fd08da9f4363;
 Wed, 10 Jul 2024 11:46:38 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2eea8ea8c06so36344771fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2024 02:46:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6ab759asm29736205ad.168.2024.07.10.02.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 02:46:37 -0700 (PDT)
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
X-Inumbo-ID: 4d7e28b2-3ea1-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720604798; x=1721209598; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JDqm3k8Bl4DfsHX4ld3VhJKPXBbdcul3PxfSlrObA88=;
        b=R0smrzHl9Z0OxfIqajaBuy4Vz7Mp5qwXp85B3I3gddR64bTu678qGQYFMWdvLQV2MW
         ErsFjAas+u7nAEFi3OBgTElm4eblUgrgFdG6YlCo4/kukctiFgNarZyS2hpDJ9ZixRLC
         eBb0ZbRayvU+KkhpDRJI4ecRCB34dwElhZz1GSgsbNlfgnmgLIxLyH7oUQJWihirvBiz
         BGuSOEQeAxCfnphV10CXLzjNIf1CnR2Sq068Nmicg4ebIc70U+zQwwbMnH3LzFSLg1w/
         C4W/02C/UkVp7nPO9VvNXqYR+bR5wTnGhie2SmYZM0LRwloAINCyZbxcRMv43AXpIegn
         tjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720604798; x=1721209598;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JDqm3k8Bl4DfsHX4ld3VhJKPXBbdcul3PxfSlrObA88=;
        b=Nkg1+IiowjUsjyJy/XqM2gs14/tQCajgu5wdyfq3XJUKV1aXQpcoVUS5A3l7j97xzx
         8Chrjo22bZJ1soWm1tb/D+JOS5NNSpOScYRFBYCGkh9sNhbxijgZk7XTZtbfxfen8s5b
         TnF5/LjgoX2pM5CdWgtGNcRQPSg21aUEQFiuV2iAtRPPaYVbnpdvxoaLdgiuj7pF+ljB
         KF6eFS0PDHpVuzIBUy/xzM1KXPplETz9V/mjgQaspXOHiXxF0VPqafcg790RRFK/5eg5
         dEiWNdabEYu1BahBmNovXRsy3jWRtKGSWYCy/0fU/4WYwsBpHs6JvMq9VzsNpZ3G6NRW
         p+qg==
X-Forwarded-Encrypted: i=1; AJvYcCWTXNv31w0kjJBXdq1gdXI5Ou4l9QiLFzuZtbn37A3EYiHIopsUsN8W3aBq0bu9RepjnOv1LpAfIvh+ldMpMWhMEecHJFbxVVbWqV+/E6M=
X-Gm-Message-State: AOJu0YwIeu461sXnJZaGybcBkkC9RmomIutDJDNLxY0QM3AMKz0n0itU
	a3pZKAFQEJTt4X94/YHUoKNrZrge76RF8Nwd6bWdxAMVScYf0xMjir0Gs7NWWw==
X-Google-Smtp-Source: AGHT+IHYHMWZq1lGy82RKn59uIwY9Yacdo2xF01E/gpCh7wk5Op8AnTXZfK0zYUXy/hF9OlxEgH5rA==
X-Received: by 2002:a2e:9852:0:b0:2ee:6b86:b0a3 with SMTP id 38308e7fff4ca-2eeb3101ddamr32216241fa.30.1720604797804;
        Wed, 10 Jul 2024 02:46:37 -0700 (PDT)
Message-ID: <4555a777-970c-4538-be34-99393426b83e@suse.com>
Date: Wed, 10 Jul 2024 11:46:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/5] xen/riscv: use printk() instead of early_printk()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1719918148.git.oleksii.kurochko@gmail.com>
 <22c78705e4559a049e72950dc311513f1c15e489.1719918148.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <22c78705e4559a049e72950dc311513f1c15e489.1719918148.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2024 13:23, Oleksii Kurochko wrote:
> As common code is available it is better to use printk() instead
> of early_printk().

IOW the function is not just available (allowing linking to succeed),
but is also fully functional (i.e. the line is making it out, and hence
CI, which iirc is looking for that string, is going to be "happy")? If
so:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

