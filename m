Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADBCA79E65
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 10:43:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936357.1337626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0GAW-0000jD-E8; Thu, 03 Apr 2025 08:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936357.1337626; Thu, 03 Apr 2025 08:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0GAW-0000hL-Bb; Thu, 03 Apr 2025 08:43:24 +0000
Received: by outflank-mailman (input) for mailman id 936357;
 Thu, 03 Apr 2025 08:43:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0GAU-0000hF-LW
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 08:43:22 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b18190ee-1067-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 10:43:19 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso3903825e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 01:43:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b8161sm1180683f8f.50.2025.04.03.01.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 01:43:19 -0700 (PDT)
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
X-Inumbo-ID: b18190ee-1067-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743669800; x=1744274600; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KDN37NcvX8KcUZxPKc9glr1elKUrs+22KzM5rpYWI2o=;
        b=Bwb6WUDLLLXW/APVs2KkvrzRpB8hBbPp7Qr7kLXXHUaQUC5Wk/LdwKpRmRo8PiSPo4
         60eW0dM7n6yqEttx1/1yWmx4C/rpzgD/HUp3ac4E33KxoS1QK0Kc1a5pVK30Wb4sYxiG
         YheDEmmy2uXxJB9skLD8YDI9CIgKNPgHcztBA1sWkzfjBFMjj2pKA3Jt4QGgKeDRalNM
         k06ltNk2Gz1PoDlf/NyooZ8go5NJDMjtc/1rHXV0uXGFtRyLla7Y8LYIhBlrG6jT/7bo
         l2xLoe5SNVgLhFnjgs42MIPsSLOuAkiNjLzlwL06T4Y+wuhzb+bq1g+eriVrxwiCpQ2J
         fdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743669800; x=1744274600;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDN37NcvX8KcUZxPKc9glr1elKUrs+22KzM5rpYWI2o=;
        b=vqPKmwyxBwJrG7oex1JO/ypUwWCAXY9UcBvGw2y0xPtdJHchANO7CsNCaXDevAbGBU
         xtDRM5UkhX+W4k2yIafe+LmcrjJ4ty2tHi1MwX8Ix861jNJxs/piv+WODk3+sgbIZbvy
         gnz6QyByIPp09Mkh1KMvnc0e7eWSqiFT/dyYFWfdfVb2UQRPHJEt5Wvh/tt+8Ev1RPKH
         liMgjvSPtpi+6s45eMSYx7aMYN1RuL1g94D56LE6GS0EAd3Gt2ga/pTnSmItKBsnCY1B
         StRIHFwC7Vj9bR0v0zzmyyG65dnodKaVarJzZRxOrrgn7+yfEpM5CVD6ycw8eEqkbJt0
         200g==
X-Forwarded-Encrypted: i=1; AJvYcCWO3pyaY6jet9iXocjjCmKk19YK7wmPB2KUbNTirQAWAUlHIQb6MoLeQloEF2KtkIXgFTlF5nsafbQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxVim5dn4vQ+S1cOEMTrWNesiuDljoFrmVKLAHHge+7ijL0iTB
	qoywBwvUuxXQ90OtJbZABo1CFA7YkbE/P/1/rUNZku2UTQwvl/a6vhg9mz4j6A==
X-Gm-Gg: ASbGncvEik/XqvBlz6LQMAdumlF5Dz0PVxZMmudgf5kw5Kyb/ECvaScvW78uNbmzS10
	sXgfMPN9zrmn2NDumJ3RbJp/6uwL3e47X5RX5FhycXVJ2Rtu0uChqZxOtUwGMcExn1kTthAbzuA
	u4tKgYuISgm6XI0s54R8spVuyh9ZPL20UuRTJdb3+F0kaFWjb52wrp3nIiyq71qSm2mnNhCI3hA
	8tF1fG69BbXBp32IFQv9axCR0nPqzGUdyoG5L8xww+7BA2c6nLwkhYsSzvM3nou0R98niC3Or6R
	jle2cAd/rpbPUi66U8Y2TF9nq/JHeSNRkta+jH+8uTEan2YJTJfZuiyJdj40O0JGsCtgxRhAf4V
	igUJyu9iJZ82k9vFGCewpVHXM186DQZ0HFFelJM7o
X-Google-Smtp-Source: AGHT+IFd4XGJG4KU/7DYvVw1f0BuBWZlGc83gee9Bp7RpmsayEjU2fkX1xpvlykZaZEYH7/eywzuxQ==
X-Received: by 2002:a5d:648d:0:b0:391:47d8:de3d with SMTP id ffacd0b85a97d-39c2f8d40a9mr1386652f8f.16.1743669799807;
        Thu, 03 Apr 2025 01:43:19 -0700 (PDT)
Message-ID: <20ac780b-f5ac-4531-997e-362d72adddd2@suse.com>
Date: Thu, 3 Apr 2025 10:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation: Add Arm64 MPU build job
To: Michal Orzel <michal.orzel@amd.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
References: <20250403081916.6834-1-michal.orzel@amd.com>
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
In-Reply-To: <20250403081916.6834-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2025 10:19, Michal Orzel wrote:
> Just like for RISCV and PPC, the earlier we enable the CI build the
> better.

What about Arm32?

Jan

