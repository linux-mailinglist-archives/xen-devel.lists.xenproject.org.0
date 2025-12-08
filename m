Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94143CADAB6
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 16:56:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180893.1503994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSdaM-000878-Lv; Mon, 08 Dec 2025 15:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180893.1503994; Mon, 08 Dec 2025 15:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSdaM-00084x-JM; Mon, 08 Dec 2025 15:55:38 +0000
Received: by outflank-mailman (input) for mailman id 1180893;
 Mon, 08 Dec 2025 15:55:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSdaL-00084r-01
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 15:55:37 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 558dc6de-d44e-11f0-b15b-2bf370ae4941;
 Mon, 08 Dec 2025 16:55:35 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47790b080e4so28066535e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 07:55:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479310ca502sm257272645e9.7.2025.12.08.07.55.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 07:55:34 -0800 (PST)
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
X-Inumbo-ID: 558dc6de-d44e-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765209335; x=1765814135; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UARdBC53eU6s31PDlnbM9DZxzQi1gP/r1hVAu4vCCyc=;
        b=WrtBr/Y3kyh0EVqvNSkyg9b8QiPadc/emL4KA3TS37gn6+1nnRpZgvGxYiNZchPU3X
         iyEH06BuuEbHXNV1t4s9FSNv1JeCWxSBlsMy6sEyhswRD2IcnyxtUzwb/V/3fRZMoKLY
         G6POGVc7kVeRf1Uzw8iB3qSBlgvn9bNsefg4pLzjD4wkQAzMmj+vx06NCi4/AQXGVjiY
         7VY3HZqNKl88LTtfu8c9XPXxzTP7BIfRk7QJnTeYQoHeQrOlpBO/nEveif/VkWhs1jKK
         FrcBALPmkcP/bBfLapJPmS2XE9Uf55w2JP9fE/CWBhMlOob4MvApWZknTBMHwEF/o1b/
         318Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765209335; x=1765814135;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UARdBC53eU6s31PDlnbM9DZxzQi1gP/r1hVAu4vCCyc=;
        b=Mxt5jp/rWs/BnLamdjhsEVOo3iwiUwGh8sODv4xwWYUrXBbkzLtt/Tr1HganPB5oxl
         fRbFteCyIzq2IdZRzW17qVq+1XeGygOOp86zR+z7gOemQbe/msVWXL0aIKB3huA5waVp
         0Tq7R7MkPiznAQfzFmgd1pXwUy3A8Fz+isjhkyvo9dT5CqOM5MKJXezlHlE7Gl4Evh/2
         LxdcjR110yn8sE06HVkc2aXuCWXpOJfJDrlFvHWj2qrwXh8yzPR5vyqOizRce94IdWK0
         gYV5+hgxFzU6/BR1ND6Bq3TVSuS5uLK0yUiosGnMp3GpRb+5E6oqPErs8ocQ+pSNqebp
         fy7w==
X-Forwarded-Encrypted: i=1; AJvYcCUHiq5e4HzqFeW1+JtdrV6FsSp2ZANpaqgbfNJOKpNvGl3Xq0S0sva07fekeMaKCmeLv2Q/A+mjrdE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzItoydH7oxjrWFA1wYDhNu7zdDD+evG6ZJo+aOHp2J7i47bVbP
	C6v4/3KFGWtD7ZiMXL0uycwtkhCNMVE07DyFKDkkbAn5jGbuxkyP7EsY03FYa2APjg==
X-Gm-Gg: ASbGncuSTpuq/nXHRJxObK5kKvDyAcCD3zd2qGeWMb0LjCVK1U16gPv3H/rmjR9Ptsn
	Wxqjidf+aJj1481bOlcmSdWfYzUkMiDnsIJud4h97sUaK/dwGe04MIP3hAe3Znvb02UAahksw7d
	88irG60c1Ijdr1zxXTDBTHd5wGOVTebE1nh/+kFLYN0iy4hvpFZ9gdVQUsN1FsDmmuoj0i7zHGH
	BVxuCrUIpyg1OmqG8HcpV9MeQ/slYW5CISI7v1WKqjos5WcMJM2R0i3BgmcJmddrlrTcT/gsVeH
	z0yXEkMHB/8U30k0swuyUNlISTaQBLHngdfZYZC9jfg/9e2E7H+01lnYNKusWxEbHiI2pWpQ8KN
	jGYmwsOctLV+d3RjsFO/Rw6WsBgJNObwwKmLqkRaVJbcbJAoQ9oGALAHExBvNgscJc2zJATZz+H
	FgMk1AHX74tG8zLW1M6+Iqs/9n+WlAtGKFEcEC0cU/Qgn7HMVNq1SPaG+PQkWe+z+W9dvAyIqT5
	yU=
X-Google-Smtp-Source: AGHT+IE7PuA/6K+t18dGZWHZZj7w9v0OxJkeMD4XTtK/Y2MgziwGN04dYyZ4FvaZ84XIpy1AH1WwMQ==
X-Received: by 2002:a05:600c:a087:b0:477:7925:f7f3 with SMTP id 5b1f17b1804b1-47939df563amr104769865e9.14.1765209335154;
        Mon, 08 Dec 2025 07:55:35 -0800 (PST)
Message-ID: <5610abdb-2390-4621-9345-33a0fef09837@suse.com>
Date: Mon, 8 Dec 2025 16:55:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: switch KBL console into polling mode
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251208153519.1198226-1-marmarek@invisiblethingslab.com>
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
In-Reply-To: <20251208153519.1198226-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.12.2025 16:35, Marek Marczykowski-Górecki wrote:
> In an attempt to debug/workaround occasional console freeze, switch it
> to polling mode. If that helps, it will narrow down the search.

Just to mention: On at least one of my boxes I see such a loss-of-console
issue too, when using MSI. As it's entirely random (and can recover itself
after a while), it so far has escaped debugging attempts.

Jan

