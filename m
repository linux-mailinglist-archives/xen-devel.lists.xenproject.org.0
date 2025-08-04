Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9A7B1A6E4
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 17:59:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069713.1433479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uixaU-0005H0-PX; Mon, 04 Aug 2025 15:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069713.1433479; Mon, 04 Aug 2025 15:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uixaU-0005Ep-Mp; Mon, 04 Aug 2025 15:58:58 +0000
Received: by outflank-mailman (input) for mailman id 1069713;
 Mon, 04 Aug 2025 15:58:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uixaT-0005Ej-Ij
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 15:58:57 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed3cc2e2-714b-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 17:58:56 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-af958127df5so324736666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 08:58:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3981sm753607666b.35.2025.08.04.08.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 08:58:55 -0700 (PDT)
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
X-Inumbo-ID: ed3cc2e2-714b-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754323136; x=1754927936; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yI7Yb0AYIcmOD6mV+6lj+VTP26acA9tTSKKEj246r98=;
        b=AUq5MD+F5jOzp+VE6I6LRkwdQSuTPp6MR0T461Qdf4sc83t41wKkl0s3SAs6TvED8Y
         5Sip4jf/YalQ5spS6OKWP9/u1wN8pPaiVnt8msLwkpjn6HEz42XKEuJZq6BFzVIPBGWM
         GVfwTtRErqV3QTgKHXxE6YwL4CmFAvDE12p0o1KyGMonz/0Fw7DPgoPmU53ZS8az1TOw
         n/bpCHfl6OgPhUsqWqJH7Jvtfhi14dwFQ/b52VsqrDbUIN8STLwikStJeg0UeK3FH1zj
         g0/ssZeqX3ov4rqeBPZdMW05dInjZJCtyy0O4KpefXZvvGZGwLhaw9jdwooeRz8oYeMT
         NLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754323136; x=1754927936;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yI7Yb0AYIcmOD6mV+6lj+VTP26acA9tTSKKEj246r98=;
        b=mFriUrh6DCxM3JI8yALPJGi1WggIjNqbFvDQe7BLPif+EnqwND3dkfVYJXucKx6iT6
         QW16GfO8zb8ruz/riDH2nAtOzEKSk3h52MOhoH5JOztWBGJ4ZWYKS1BHF6NswN4eFoKA
         YG2yFv0ukLB4q3Cy0okJWOVWy4yG54EGQe1iH3ZONrm7pM/zrpEPxJy1Snk0xVh5OHcp
         OEhCrt4Jzl17CG4IJYEiL173XGkeEs4BJhXi+X1/s9kiBKXxYiXZu7c3G65+7hIyei8T
         e4B+lrCNQegRee4tz4+no6Sj66oNl0JvQTQyLa2TsRvmnaYRaJqsHJUVBGLgKAKXXqoO
         yj2w==
X-Forwarded-Encrypted: i=1; AJvYcCUCFi9ET8cpJwzF4V/JuyuArA4ZUfZ975akRQhhtE+Qvnht5YdWnAQKHAuh19o52c4c8JtwDasU1f8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3BEo9YJyaNUkgQ47Z7/YU7xehVP0fZ6Q5Zu4RJzO0ZIywFt1X
	QDxnR4lv73lxXBgSSdmVZJ2HLY62/BwX/uHDyfPytyvY/j1BFnIxskqFLPPNMNMv9g==
X-Gm-Gg: ASbGncti4RptKdINZXnhUR3stVCqC8lqjVTB/ufhfADww8kUPIHdd79vfOtp7+0DDdL
	83AKXh3Up81ucrZjgofyAmmRMdJBYvm4HKKvMTRQeaRTtOt1xxtq4dGJMyUWV4ttMDtGmUnot1Y
	QRRe5EzNw7ifR4S3O2lwa2kqNC4fcjDBDJYspP4ygBpzUlCeWkcefGcjvps5NApuxTxVlDqjS6/
	ZHGF/DyAPzs7HP8/2p7nwXjYt/fgMKul9TMweRVU/SG1SZhyEXv809mLxMwN52QTNV+9DEV53kA
	26vK6munegoeGR9hBh+3lDCicEnk9EN0zSZ7ddhUfrecXUZso3BZId/8l7QX91kOsLaj5nxRe4F
	Ey+tLYRtKdCc7avppivfg7e7ws9y+hSI9xk0Vs8pCMxDMUmHlu41OAJ3HRJXl6Uxb90LHF6/y/0
	gH+5uU7XA=
X-Google-Smtp-Source: AGHT+IHN1EeEnNpNmRdZ9y/2EcbclvjVsGA7nR1zcI+jq78GBMd6fRHO12FOyKJrBCfO2sngY9flUw==
X-Received: by 2002:a17:906:c10b:b0:ae0:9fdf:25e8 with SMTP id a640c23a62f3a-af940243f74mr1227163366b.47.1754323135967;
        Mon, 04 Aug 2025 08:58:55 -0700 (PDT)
Message-ID: <db365e00-47ac-4586-9037-874f32af044e@suse.com>
Date: Mon, 4 Aug 2025 17:58:54 +0200
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
> Implement p2m_set_allocation() to construct p2m pages pool for guests
> based on required number of pages.
> 
> This is implemented by:
> - Adding a `struct paging_domain` which contains a freelist, a
>   counter variable and a spinlock to `struct arch_domain` to
>   indicate the free p2m pages and the number of p2m total pages in
>   the p2m pages pool.
> - Adding a helper `p2m_set_allocation` to set the p2m pages pool
>   size. This helper should be called before allocating memory for
>   a guest and is called from domain_p2m_set_allocation(), the latter
>   is a part of common dom0less code.
> - Adding paging_freelist_init() to struct paging_domain.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


