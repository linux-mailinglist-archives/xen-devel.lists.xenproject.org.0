Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A27923AA9
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 11:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752166.1160289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOaA2-0005US-3i; Tue, 02 Jul 2024 09:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752166.1160289; Tue, 02 Jul 2024 09:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOaA2-0005RG-08; Tue, 02 Jul 2024 09:50:54 +0000
Received: by outflank-mailman (input) for mailman id 752166;
 Tue, 02 Jul 2024 09:50:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WXFQ=OC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOaA0-0005OH-Dv
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 09:50:52 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9101a6b0-3858-11ef-958a-bbd156597b9e;
 Tue, 02 Jul 2024 11:50:51 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2e72224c395so44703061fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 02:50:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-708043b7ef1sm8300023b3a.146.2024.07.02.02.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 02:50:50 -0700 (PDT)
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
X-Inumbo-ID: 9101a6b0-3858-11ef-958a-bbd156597b9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719913851; x=1720518651; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xlU3JLGYsPTMg+fdYDnoNfQQGvLgpez333kOy85g32M=;
        b=OflER6dTcIuniHWAX7KH4JnPoI/BFj5Pxh0lSmDP+2wl/3UCoRY8J7JHJGCjfRe4ut
         2qSZPdA2/XMSGuH/9beVGVPnAUnAUbyQe/GNkiDs7CH6N5UGd8uFiFwTwKs4RKvkUtru
         +aqNhYEoV8/1SzKlhbF+zG91qZ6wZ2h2tJz+DRmLq9XU1bzJj0U2YrCQcB1aiVqAhhtx
         UHpTcRcLM5X1zPBZ9YVYNXSTn8wCbdr3XRTLnrT6CigcCpABqjgBtLM17yiLJajG/039
         e+FZCSXqo8AsNSfYGep6cLnMaQ0ERV2hvUQtuJbMWM6LLbAbmbsja2H1pY8/R9kMSOpC
         LS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719913851; x=1720518651;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xlU3JLGYsPTMg+fdYDnoNfQQGvLgpez333kOy85g32M=;
        b=G/HZgNkN/vHebSn20m5BFD0qFk4yUNsVyESF5dpr92hJ03/c38vF/wH7DhMVahLyhy
         evS2Oc+AYE/a61bDBYkYihOaHkD5ijclRKxW6A75TeDErXK3ZQQncxclLv1EAlUQXszd
         O3pK6Mt0F0QM8sIJ2J3jDW/Yqz3vMSLm5Y34+pIP5G04NU6pIzzzRdL5Y2EI1T5yWTz6
         wvSzXnwFNyg3er8qLgetVgYKvfkzKy74j84r74ZX6rM38/RlkccYeKzJqbqpy0p8seYx
         AMLjoumvdm6pKuRTB0EyvhzcmRi3F0G7ZosYNqxygfomGD7bchAeaDBpQ3k9SGfktaKE
         tFdQ==
X-Gm-Message-State: AOJu0Yz7uBa6j1/6gfCHqPsHlzc+79+wK9o96UvXm7261c3dzDx6NU4u
	4Et+jk8wZMjlXGtnj90AXL8PCuCN0IWPtJiexPe5LAjRCxbT+AF3JIzWqe4DWdLSH83Ynjy2lXY
	=
X-Google-Smtp-Source: AGHT+IGIz8lvTryiEQ/GBSdLJD1UTP9/gYbaTiE46SoqNogKphMj58bDsO+pJAaHhKscC4Bke9TDMA==
X-Received: by 2002:a2e:91d4:0:b0:2ec:47fa:b0af with SMTP id 38308e7fff4ca-2ee5e36ee9emr49170411fa.22.1719913850946;
        Tue, 02 Jul 2024 02:50:50 -0700 (PDT)
Message-ID: <03f6674c-f2d1-4ec1-995e-a3e25278ceac@suse.com>
Date: Tue, 2 Jul 2024 11:50:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 for-4.19? 0/2] new extra_guest_irqs adjustment
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Language: en-US
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

New patch 2 addresses a concern raised by Roger when reviewing what is
now patch 1.

1: cmdline: document and enforce "extra_guest_irqs" upper bounds
2: cmdline: "extra_guest_irqs" is inapplicable to PVH

Jan

