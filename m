Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B3982DE16
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 18:00:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667539.1038913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPQJu-0005Jd-2P; Mon, 15 Jan 2024 17:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667539.1038913; Mon, 15 Jan 2024 17:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPQJt-0005Gj-V8; Mon, 15 Jan 2024 17:00:17 +0000
Received: by outflank-mailman (input) for mailman id 667539;
 Mon, 15 Jan 2024 17:00:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPQJs-0005Ga-2u
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 17:00:16 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ce222e5-b3c7-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 18:00:14 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e760e5b49so13705495e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 09:00:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 az6-20020a05600c600600b0040e81b4c44esm564909wmb.30.2024.01.15.09.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 09:00:13 -0800 (PST)
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
X-Inumbo-ID: 8ce222e5-b3c7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705338013; x=1705942813; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pjeflTYnTDDc2QUmJAMFZi7rtAys+yOVHuosvqfUx64=;
        b=YcGIT4BtMayRhLKrnoWXbewzIYGYc1jYoP6EuIb1dCCr87QBOx2geMZyPIwNIK7OQm
         QYF7ItIrr/h9mPUJ1MbmeD8lB2WpKChLg6Ki2RMf/1EO/1sE0ds5l6xvA8B2DkCjxTRJ
         GyZttFHQobZXutPFeYaREL378XiWljxe7mr3i+nU+i6RO8hA5C6DOoeMtMmM2MP42NuE
         spCCj2MftX+9To4fzi70lxDO57L1dvITaVB20Md9mA5Fpz6kdKNGP1wpF1C3vwhefgxk
         gIl7e5VvoAZYYcByXn4d+aXZxwjTwhjGD1Vi3ZqE+Tau0a7lRzYO53Kt7dh43HEQBBOx
         bf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705338013; x=1705942813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pjeflTYnTDDc2QUmJAMFZi7rtAys+yOVHuosvqfUx64=;
        b=wsInzb9xi4/H8wLaDQL+YnV38vPxPpPQ6FKDian2tuDkWWTF+up22HLCqxkVuL2f43
         IhO/j3+G/kVQDe1SwqQZdeFsvAz7cBAksrgSln06BxEA+R06U0ebeEnRR+vVZX1TCTxW
         LXu/IKjhMIp6ZXaNaOrSpxydt4fxWK6KfLjGe+h3S4cVJXszAX3JOtHqNYtzvAusDqwC
         y2Y3rSOIbDMZYMZwHOrwkxpNDWSkEKNI2GzZapCmWHHD8lk0AcyBlpHcQB8Ksl03NKPC
         vQZAZ1nF1ReRow4oI6rhpQ4qx0FRmriSxsskEZ6ePhT+3m8E67E3TZnK8yK7o4aNdHcQ
         F3Cg==
X-Gm-Message-State: AOJu0YyaBdbwladU6hrwDPpmHCUlwPMyXvFcNrqSY9A99zxBe+FiMhy5
	/AdYLsWj95Jj5KcAv91XZRNqdYGE6Z6f
X-Google-Smtp-Source: AGHT+IHufjA08DekHuucigPodh+3Too2YLbf+D1br61s72imH+632gECVy6U1R9mk3g3EITjtQyOuA==
X-Received: by 2002:a05:600c:1989:b0:40e:722b:3d1c with SMTP id t9-20020a05600c198900b0040e722b3d1cmr941354wmq.81.1705338013268;
        Mon, 15 Jan 2024 09:00:13 -0800 (PST)
Message-ID: <0d3cf7ef-a601-42c0-a6ed-61ab421f6c69@suse.com>
Date: Mon, 15 Jan 2024 18:00:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 22/34] xen/riscv: introduce regs.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <3d1ae540120804af5fc812a1492931afac66bd39.1703255175.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3d1ae540120804af5fc812a1492931afac66bd39.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 16:13, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V3:
>  - update the commit message
>  - add Acked-by: Jan Beulich <jbeulich@suse.com>

I see none above the --- marker.

Jan

