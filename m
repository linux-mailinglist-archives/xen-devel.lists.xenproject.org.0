Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5D5B1B224
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 12:41:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070321.1433979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujF6D-0006at-AD; Tue, 05 Aug 2025 10:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070321.1433979; Tue, 05 Aug 2025 10:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujF6D-0006Y6-77; Tue, 05 Aug 2025 10:40:53 +0000
Received: by outflank-mailman (input) for mailman id 1070321;
 Tue, 05 Aug 2025 10:40:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujF6C-0006Y0-Fd
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 10:40:52 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a78d7de1-71e8-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 12:40:50 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6155e75a9acso7923639a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 03:40:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f2b892sm8265861a12.25.2025.08.05.03.40.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 03:40:49 -0700 (PDT)
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
X-Inumbo-ID: a78d7de1-71e8-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754390450; x=1754995250; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v/NojL9DA8erZOR3grqoJmP8QltDWfQE2isDLJNdhFs=;
        b=XL8q1j20S+V+XPrLx7I7UPyeHjgbUEO4egvkEaYFgTtngwQPTz7OZOLhttDLIcf3yb
         PKBZpqNm4hN9GdliPRexjAIPn1oZIMmNgHPKnwOMbcRw3QzpYPz0ZXiiB2rRvsRpCkAS
         S+DPzJZMlfklrZpTNvqoqQZp5DZ+ZiK0u5CleMdEddDF8JTEzKCkuohbsuG1shoahSQU
         eZnE3dQ0SQKL1GH/p1rxGw2DtpokbgHei/KwV4uVNW49uyVdAgR1hrMEt2xU6ByyM1dF
         ye8tW/p2xBMoBfVaCPiZzCcxgSo2t0TRI+UiD5WI4uMll3GV9xnzJyG+aP/QoqvQlwVZ
         0KBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754390450; x=1754995250;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/NojL9DA8erZOR3grqoJmP8QltDWfQE2isDLJNdhFs=;
        b=L/WJ7S0V5W9qqicr9BIabc0TWqTHgWOX7ycYf4/b5mrIfRNUgtGBmCcEeNQNlyB0oT
         sMAZcKyJLyMx4ssxy9IfPpU8Flt8oT00m++zmmVT7cHOs9NCsBQ2f6TThoo/hJK6GJ42
         Hm4XvewWcnyDGuLrH73rl1mLICDHdd0R9dK/zMz53wsemDthZtjdwaOEF+EH790uHIQS
         Y+sllAxshgBiy+xMph5U+shblXfb4660QMGz8misIaE71spG2q7l3KYgBVRatRacvJnv
         LZBjvnm5EKAiD9iVQKjYj9J9fmK0THMjFwsek2T02mMyBeHDh6vj7zU752HVl0ZAkIWo
         sgWw==
X-Forwarded-Encrypted: i=1; AJvYcCWs5vuU24YCIHutOW3/HeiXLRCY44eWgITFv++AB5apqN8RYX6lhyY+xnJCBHiXePrmh90POMiNfSU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLNZDDHz/xhQjkGp9plgfvJMv16wZJs1U8wiMsQO9fET+z7T8R
	6jsajIvMVTvas9KD3trzdzc59LCOibkqAmMSkuiRt1CysWJpXXBBRMl6u9fakmFBQQ==
X-Gm-Gg: ASbGncsPTm/H/q4/ScYemIA5aF2VvTnH9NeUTnXInfljfCF4M+5E5iTHAELkJpc4wuZ
	kkigmOJOnHnk1zjDdBTM9fi86yzCxEOfZicGuiDj3+JVehptE4FO0QQTZl19aL+WCoiubxF6K/V
	2LxRxQKc8u7Rldtu/4hLk7n0gpGPezXxlt19XkEHanFOUug9CFJWX1CDu5wfEgwgIWR8CKAa+PT
	dWttp63scxk1BlS0nwkDxsOa1B9H2gRgV9T5Q0VeKygI+mMd/kduWtfQWupaqOZ9QzMAD0spoL4
	crXpkaxWvMnvpD1AcLeDZ3TsY4mtaR88mqksm4A4BqFPghp2S48dAlZAKNaMGH57dktRX9bom44
	89LMniNPKkKzcNKzblJ8Of/zyrW19AdEsBmUCsSihOLJMIc8ZQNgJzS4NXi3FTaV8JvllxLnkf3
	4zrDqntVw=
X-Google-Smtp-Source: AGHT+IHGvYk3fEe0rqgYa5+t6PEcHzVsqMuJEelPjXU7EgSS7GRoV+maJvgoAFE+pxm9MFOp45xNrg==
X-Received: by 2002:a05:6402:50cf:b0:615:a3c2:2e5d with SMTP id 4fb4d7f45d1cf-615e6f52cefmr11454061a12.19.1754390450146;
        Tue, 05 Aug 2025 03:40:50 -0700 (PDT)
Message-ID: <ae570c32-e6d0-4131-af2b-d6984ff92750@suse.com>
Date: Tue, 5 Aug 2025 12:40:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/20] xen/riscv: construct the P2M pages pool for
 guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <4e7de8ffc929c1bdfa28b40fdd31b814acef103c.1753973161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <4e7de8ffc929c1bdfa28b40fdd31b814acef103c.1753973161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 17:58, Oleksii Kurochko wrote:
> @@ -30,3 +34,18 @@ int p2m_init(struct domain *d)
>  
>      return 0;
>  }
> +
> +/*
> + * Set the pool of pages to the required number of pages.
> + * Returns 0 for success, non-zero for failure.
> + * Call with d->arch.paging.lock held.
> + */
> +int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)

Noticed only when looking at the subsequent patch: With this being ...

> +{
> +    int rc;
> +
> +    if ( (rc = paging_freelist_init(d, pages, preempted)) )

... a caller of this function, the "init" in the name feels wrong.

Jan

