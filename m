Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E92A7902644
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 18:05:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737440.1143753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGhVq-0003y8-6M; Mon, 10 Jun 2024 16:04:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737440.1143753; Mon, 10 Jun 2024 16:04:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGhVq-0003v9-3W; Mon, 10 Jun 2024 16:04:50 +0000
Received: by outflank-mailman (input) for mailman id 737440;
 Mon, 10 Jun 2024 16:04:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGhVo-0003v1-05
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 16:04:48 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 286d05c8-2743-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 18:04:46 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a6ef46d25efso345702766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 09:04:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f2d3a02dcsm57697066b.106.2024.06.10.09.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 09:04:45 -0700 (PDT)
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
X-Inumbo-ID: 286d05c8-2743-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718035486; x=1718640286; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bTWDUdkQF7tsItu6ZwtaKt2W0JOuvyHlIXFHCYV4rEE=;
        b=at84pYW+lFwAlW0Wd6OOM32nps9RDREyTpuWax82M2gvuV6eGYhjES0iV+sFilOnxN
         c1ikkqnc0bxJg8g7MSyS4mJUdzwSlqLQTpz8V2oHtJixYC6HNtmBlPqXaIZbssiq1/Tr
         v1XCFurrSfIm/6+DIifwV7ydtRxGH97EWwfRD3xJHpqRoxpQRISPTTEiYwIXfQGFmMR5
         WV91OqHUiYuSyqIhWz2iuA6OjMcK/LchuTr124KLbPMD+/2pyynBl3xKWlprZ2hCh/ju
         mMIaVw2DAiVIk9kKWmS1ZU6uMdaH/VQwDcoQSLS8azgGPIQq01DKxyBANE38GqlD5U4e
         qy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718035486; x=1718640286;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTWDUdkQF7tsItu6ZwtaKt2W0JOuvyHlIXFHCYV4rEE=;
        b=cw7nTeis3CJfbWq/BcJlHFsgcQiGHNfl3LffnGD8AQ/hDjTw4vdCn6VQnjJ/2qUiCz
         yf1So+HleDa2Lz5nA4jDpbY1+qEmZufDAm6AScGFezxyXa0kJqj6rysJtzwWb1BJV6Nz
         I6PJVeJ+VhzuC4qzJUd5C0LyRdUf68nR7a28qcAyG6X8H1ilwrjbiTK4m+TGyQU1FaBv
         GUTSsevW9fAK3/WFwqEg8yubGmwQ7UrB5F2wcUHGTMU5AZ3sM2gLEpplGQAsRgloSIjD
         d4SIILg6XoxqDepRTQ2zgf3HAxiNQmDjoo43kakeX95y91zpNbKGvs8BKo0V8oCUKbkk
         kacw==
X-Forwarded-Encrypted: i=1; AJvYcCU1vF4FrsPqhudDe6yYyue4Zba9/jobj6higt+8nAd/2AwW/ieHadRA/bhorZ8WCjbfkpZFcp8Vrwu+R6wyde7fPjAz1jE+gWkfnKZdEAI=
X-Gm-Message-State: AOJu0YzVruwaaSJ0RlB3cBs8Uzh4xAtEZCB6enCg3PiSz9HpW/fUVlFC
	9dNHGsZSQwFFLbGiw68pST5k0DCYUMI6VnFPbRQbZQV7on4XER4mluSAa+vslw==
X-Google-Smtp-Source: AGHT+IFbP5G4bPHAhpeqdqRbQ1kF8ONmRQvp1jB12XG0rjl+KPNHDNMnktyjJoLYcL2FmOIdTeI+IA==
X-Received: by 2002:a17:906:6bc8:b0:a6e:c5b0:b64e with SMTP id a640c23a62f3a-a6ec5b0b6e4mr524206766b.9.1718035486164;
        Mon, 10 Jun 2024 09:04:46 -0700 (PDT)
Message-ID: <38b5bf96-22fe-444c-824b-b4c2d6e107d0@suse.com>
Date: Mon, 10 Jun 2024 18:04:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v9 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240607081127.126593-1-Jiqian.Chen@amd.com>
 <20240607081127.126593-4-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240607081127.126593-4-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.06.2024 10:11, Jiqian Chen wrote:
> On PVH dom0, the gsis don't get registered, but
> the gsi of a passthrough device must be configured for it to
> be able to be mapped into a hvm domU.
> On Linux kernel side, it calles PHYSDEVOP_setup_gsi for
> passthrough devices to register gsi when dom0 is PVH.

"it calls" implies that ...

> So, add PHYSDEVOP_setup_gsi for above purpose.
> 
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> The code link that will call this hypercall on linux kernel side is as follows
> https://lore.kernel.org/lkml/20240607075109.126277-3-Jiqian.Chen@amd.com/T/#u

... the code only to be added there would already be upstream. As I think the
hypervisor change wants to come first, this part of the description will want
re-wording to along the lines of "will need to" or some such.

As to GSIs not being registered: If that's not a problem for Dom0's own
operation, I think it'll also want/need explaining why what is sufficient for
Dom0 alone isn't sufficient when pass-through comes into play.

Jan

