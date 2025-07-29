Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF36B14B50
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 11:35:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062360.1428023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uggjO-0001uq-38; Tue, 29 Jul 2025 09:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062360.1428023; Tue, 29 Jul 2025 09:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uggjO-0001sW-0U; Tue, 29 Jul 2025 09:34:46 +0000
Received: by outflank-mailman (input) for mailman id 1062360;
 Tue, 29 Jul 2025 09:34:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uggjM-0001sQ-Jw
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 09:34:44 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4110eddc-6c5f-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 11:34:42 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b77673fd78so2576695f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 02:34:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23ffa37f078sm55046675ad.115.2025.07.29.02.34.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 02:34:40 -0700 (PDT)
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
X-Inumbo-ID: 4110eddc-6c5f-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753781681; x=1754386481; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8vmpqp+2EQa9CxQWC01acB9uIKclrzWJrxJnqoYBcj8=;
        b=ZfGLB8UQQFJFZ8a6evbKVXrcWbyfeFJOOeaV9zIoqx1bJsZwKFrNlRntYxMle/Aaxf
         bu1N15pVe3yXcykJDwoSWbIUpN5VQ4sP3prkHQDGJencAAFsoGzeXwMTYfK5VC0VFDyb
         wJnZEIfTqZKtXwFO6Y/d+BTMHU5qmRmqIYNoHWVOd7QZuj1szHTLrf41VRQb3DFFNLsu
         byvi4+qZaMFG6Ur3/GRxLkUlxHXlGaJel8sqc/yvzV6WjuYY1JiQp+egnCG7VA/L5brh
         DeMpxGVSrN4/q7mTXL91iS7YGSrbaPZ6h/61LIXzx+xz73EbDyhJON5UgquzhgiF9r7w
         Vkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753781681; x=1754386481;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vmpqp+2EQa9CxQWC01acB9uIKclrzWJrxJnqoYBcj8=;
        b=mvAYZmsyZUoaWPjfN/AnCNU0GXziMq07QatCFuMOklpb6pSeTBwqoZiS4p3Pk0+TRG
         di+T1WgwKFf3kbozblaUS5p2vjoNFFO4xpxFLM4wp8H+YjRdTdlRfaJJJeAFZyc7CDKh
         z6oScWsREiax3vLdjTv/UIjsPyDXKlDztVkvNNid6+bne8tXYxfLezOYgoj7fnlnM9t8
         zI+Fo8sxC0NXRuWVgtZUxpF4uGbE/bOLWr0s4D9BbG4Iha9sqryRxpbSf8sMfPOa68oq
         o8RkwcLa8Q3OR1d12E1qG3fWtK+iuOEtjNpJ7CuETzM16dbt8HQj467SLvIBI8SHy1Km
         7zVA==
X-Gm-Message-State: AOJu0YwrubqzeOy13cv3zw+9YuciNAJVDE0ERgdYTHDeEsY4YhLQ/vMg
	lxVqImOdURTAZHwOcbmbHwISCMcLKOVE8wIZYl87SyFWsjT6QelA9djesYWQ8euQGg==
X-Gm-Gg: ASbGncuCYM5nX60qm1hi0Bq0ztTm5z3ewkjdE6JrZ44/FMAek1A75rOxkBokwY1AQNp
	JL1IQGkJybNxUmU2lwPo64XkrPwMi+Ub6T4rDoUDlTo+W8ICtftiQQ91fy3Rbk/M2zIPnYxqi5o
	iDAjp1GvkYt9dyZwUWmztPx1Qvo0aJYwGQ8ArC2Q8kAuMoF/KGk4imgzYrTCBIUFo/GR1TRB6jY
	2mF9o+UDFrCCAg8jJ5FJ7PFBqFMmJrsprk6gkaFHSnmLmUe9kEkngCc6M2py1SsuL38uoYjcWHj
	dNKGeZ2s0Pb8Vkt1635NOgTFUWvfob/hFMrPpH8jeD7hkJEsz02+gxfgp2TlvkCq/AGOj5zFW9u
	+ZkHWB8OwXBudm+kWmSWlXXwqhrtv5H1ivCZiTQozljfR/WnlkgUyy4Kk39geLVvJ7bEwIVh6zp
	WrREoL6k8=
X-Google-Smtp-Source: AGHT+IFtxYd4HZr4aKbEsmqBdZ1xwchAPBX4LxJJHXTQ12IOINt+xcT5J6r2vrFHWA3DhYMByJ+khA==
X-Received: by 2002:a05:6000:2406:b0:3a4:f024:6717 with SMTP id ffacd0b85a97d-3b77667aa69mr11950069f8f.53.1753781681256;
        Tue, 29 Jul 2025 02:34:41 -0700 (PDT)
Message-ID: <3d56dc63-34e9-4dd2-8d9a-418a791610ca@suse.com>
Date: Tue, 29 Jul 2025 11:34:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/rangeset: fix typo in comment
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250728125036.41305-1-frediano.ziglio@cloud.com>
 <aIeWTNM21dme8Dgn@macbook.local>
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
In-Reply-To: <aIeWTNM21dme8Dgn@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.07.2025 17:25, Roger Pau Monné wrote:
> On Mon, Jul 28, 2025 at 01:50:33PM +0100, Frediano Ziglio wrote:
>> Fixes: fc41b5c1fdbe ("Extend the range abstraction"...)
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Just to mention: I committed this as is with Roger's ack, but I don't think
a Fixes: tag is really appropriate here (I'm certainly not intending to
pick this up for backporting). Even further I question a patch changing the
spelling of a single word in a comment: It not only took you time to make
and send the patch, it also took people time to look at it, Roger to send
an ack, me to commit it, and now CI will put extra effort into testing it
in isolation via the build-each-commit job. That's way too much resource use
imo to justify the extremely minor effect. Such spelling mistakes are imo
best corrected when touching adjacent code anyway.

Jan

