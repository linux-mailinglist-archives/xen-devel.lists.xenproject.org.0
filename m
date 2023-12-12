Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 511E180F3C4
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 17:57:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653337.1019817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD64K-0006KK-VJ; Tue, 12 Dec 2023 16:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653337.1019817; Tue, 12 Dec 2023 16:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD64K-0006HX-SX; Tue, 12 Dec 2023 16:57:16 +0000
Received: by outflank-mailman (input) for mailman id 653337;
 Tue, 12 Dec 2023 16:57:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/PU=HX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rD64J-00066Z-BI
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 16:57:15 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f524162-990f-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 17:57:13 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3360ae1b937so2921786f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 08:57:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h4-20020a05600004c400b0033621fe3a29sm4873600wri.26.2023.12.12.08.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 08:57:12 -0800 (PST)
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
X-Inumbo-ID: 7f524162-990f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702400233; x=1703005033; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IlsBuXrdrUY13Ll0FrcTZ09U5KvbDKYxEXqZDMbOQK0=;
        b=YBBrZSvIs1HnngMXn0H5c9MzmICiTBL792af5gQDtSEGAKyM8ZAYYhSr2ZcDa2PceJ
         S8sharH6tK+x9lLNnTnhkRp+WShrA+2neJXJ6lSy8UzIO16UjlqefBklptv2f+xtPNRe
         GoTMFQONUHD6xT453Ex6vLeRZG/rxPc96a8k/ar5km6YeYUaYLsWyD48nwHt2Nd6e1pV
         QTU1lvNEv+Fi0ZwH3XLKY/xrP7ut4wcgjDKpByyd0znxQ6Q45KwIRpZO2JgvXmu80kzJ
         uKhB81jJ/IBVOJP2DFoyR5vZXXi5t5b44wdN50/ExWDNFqUq5AKU/JRpstTBz10cnXG+
         H+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702400233; x=1703005033;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IlsBuXrdrUY13Ll0FrcTZ09U5KvbDKYxEXqZDMbOQK0=;
        b=EZZSpM7X8mUiAbqxPIgJsQT6qPSXA0JqQriJRxF3haB0EcnJgSr9dSbTl3C6ki+mLT
         VBzbPiEPdj9zaIXAQqGtOJaMJkyv7YS6LKue9XQL77x2A27AV9KknL6xun2NAaLglQvb
         UHZPg/jtz4vW8ClOYiPVaQWqIIBM0ea7gIcYjrFV590wBKfWZRhPPfcFGqcFhAySdgD4
         5t8NEfT28rbGBzvfeD7y5oDvUkZ7wMZIJgNcTcEgxXvHI1u49rYQ7x+uBUcMqtHibwWZ
         964+ivnosNCyJTyyE07mjR0G8BAmU1o6CNqWmXSMW1f9hhPbtskJDTFRA+JlHcbsfbm8
         KkwQ==
X-Gm-Message-State: AOJu0Yx7jqRwP3JmxHw7AFZpfFrtlFgX7ckQBr/Hks5U7MExHt3sdrwn
	nnFojR6EE+42LcPlHOGnd8tN
X-Google-Smtp-Source: AGHT+IGFE309IqIHgNLTyUc0ecOEO6ZqMPFn9SBmYlYzRTYO+7pgHRXC60d5R9rKANrOhSDameIQrg==
X-Received: by 2002:adf:a1d8:0:b0:333:2fd2:812c with SMTP id v24-20020adfa1d8000000b003332fd2812cmr3393379wrv.73.1702400233214;
        Tue, 12 Dec 2023 08:57:13 -0800 (PST)
Message-ID: <e3647328-0d20-4800-ad86-b7f2c93f620c@suse.com>
Date: Tue, 12 Dec 2023 17:57:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/39] xen/riscv: define bug frame tables in xen.lds.S
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <2d9a1d2847be15e025121694ead80bee27c5ed97.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2d9a1d2847be15e025121694ead80bee27c5ed97.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



