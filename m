Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7F99238EB
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 10:53:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752042.1160171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOYqZ-0004Xk-Up; Tue, 02 Jul 2024 08:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752042.1160171; Tue, 02 Jul 2024 08:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOYqZ-0004Uy-S9; Tue, 02 Jul 2024 08:26:43 +0000
Received: by outflank-mailman (input) for mailman id 752042;
 Tue, 02 Jul 2024 08:26:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WXFQ=OC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOYqY-0004Un-KN
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 08:26:42 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ceaf4d2a-384c-11ef-a59d-41c015c667e1;
 Tue, 02 Jul 2024 10:26:41 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-362f62ae4c5so2212155f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 01:26:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac159f502sm77726355ad.294.2024.07.02.01.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 01:26:39 -0700 (PDT)
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
X-Inumbo-ID: ceaf4d2a-384c-11ef-a59d-41c015c667e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719908800; x=1720513600; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FrMZtI+BXJx6wV2rVmh5LFK5v0yqRcfhEliJ+2Lzkck=;
        b=WOFX2fGHLWUDT/4bk0DjPcLf5vB1qk3D8EpXutyxByRj32ibuY4qGgwPPb0RJORnW8
         3chGiD69rxFWJe1PHD6tsVAlpHQAdh2kL/11Dl5tw7vZRcNo2guEV+GPaewkCz0cBe8s
         KJijm320modoBjBgDd/Yi8SXN6s+30dxqXeC+5+pGB8e2DLEGd72iG0aixoPHY3H0tbk
         P8hZNzoY6cixorWaF+jSsDb4eh+AzUbqFlxYTyuBF0RMGq5/g99n7JxVFP5fBpBTTleK
         tIKWSgQq+KOFUkvMd9pq2bXnbaEKvKWYw0ftnXC+ae9qjNLNftAQMsQXcAloNXDano6L
         YOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719908800; x=1720513600;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrMZtI+BXJx6wV2rVmh5LFK5v0yqRcfhEliJ+2Lzkck=;
        b=hkzChtBk/7QhpRr2Gf5+T1QP+tnOuZm/ccD4vuVHwkXuirV4R2FBPZZQdagdVH41YQ
         nT6rHm0dcayCFdijqSbW1/LzrjkrjasLX1jzMKH/W6Xd7Oqn20JLgqx7wo4o56JfifVa
         X7LLNosWceguzl8286/nNSwMy0TEvecxnSbYf5EIongT4i/W9QMkXKfWaJ3jrKxPmua9
         rvccVFvQWB6JAh7RXSMh1GHdretFP/IfyETi6e2uZmU97EKx++2bEonWuVUCSqtpRtuR
         WkUPqJ8iJB4Tl7k1ouIndtNpWAzHAssxOW9KRLKiBPahqGLK7Uw7Oa9xyiWHy33n+9ZI
         ZnCw==
X-Gm-Message-State: AOJu0YwQhSDk7z4HIVyt/6htwPxxFvKG7LP/Uxzx2xNUkZlvxP+wP4BP
	kMa0MiUyhcdtNnINpGLIbSMkOgzrVDEDWI07deEzUuvFFJvzOKvlwjBAcwTuJg==
X-Google-Smtp-Source: AGHT+IFJY+1pfxt0JFmwybTn1EUM4vrgE3RZh8jpcOec9s+6+0h8Z4JdhfG7Qv+wIqmTep80oFiIVQ==
X-Received: by 2002:adf:f64c:0:b0:366:8d90:84c3 with SMTP id ffacd0b85a97d-36760a72555mr8597876f8f.14.1719908800441;
        Tue, 02 Jul 2024 01:26:40 -0700 (PDT)
Message-ID: <a733033f-e456-4488-a9f8-845a7874268d@suse.com>
Date: Tue, 2 Jul 2024 10:26:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 for-4.19? 3/3] cmdline: document and enforce
 "extra_guest_irqs" upper bounds
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <7cb0d24e-2bda-dcda-4874-2c01ba179947@suse.com>
 <3c3a1d0c-06f2-a392-b2f9-381bed5c5e7b@suse.com> <ZoJ9Bd2kg3IQ0Z28@macbook>
 <8ab71a85-6056-4c4f-8513-a21c061a176d@suse.com> <ZoKvP6StEbMTgjrY@macbook>
 <938e5bd1-4523-4b49-80fa-1c3331587972@suse.com> <ZoLIpulcC7dqtxYR@macbook>
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
In-Reply-To: <ZoLIpulcC7dqtxYR@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.07.2024 17:17, Roger Pau Monné wrote:
> I think we are in agreement about what needs doing.  I can provide:
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> With the changes we have agreed to arch_hwdom_irqs().

Yet another request for considering for a release-ack.

Thanks, Jan


