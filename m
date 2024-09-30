Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8391D989B76
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 09:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807076.1218276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAsE-0007qg-LG; Mon, 30 Sep 2024 07:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807076.1218276; Mon, 30 Sep 2024 07:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAsE-0007oS-IN; Mon, 30 Sep 2024 07:31:14 +0000
Received: by outflank-mailman (input) for mailman id 807076;
 Mon, 30 Sep 2024 07:31:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svAsD-0007oC-1H
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 07:31:13 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f73f8398-7efd-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 09:31:11 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so572790366b.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 00:31:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27c58fbsm482881566b.56.2024.09.30.00.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 00:31:10 -0700 (PDT)
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
X-Inumbo-ID: f73f8398-7efd-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727681471; x=1728286271; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VZQRxL2K5uWGwhrQ5GXxFGovvx1YDTZJo2NnfcjpO8w=;
        b=WgkzR541V0Q3GEJsK6so+S9lT8ebM5EQUBzMmE/GyHr2KNvEfxka8gYibZY0yBvYo4
         +BkOQ7xBMyNczuedHq8YuR+eYlbFQjloM36iAQLxeA7hEc3QdDbaJHN7hcydAyhqxh97
         NAREwbOHv1zoFE/yBWsZVLF1QK3/l6tH4peFVWpDrubyLosRx5Ymou7zd2oPw2KJ1Vc+
         csttA1K8P7JJD+KNpElbcuV1mU7THK1dmqfrF0Q8AytVEIYDu60iNKf1U+l2PqfQ5TC5
         pqYjNh5qoVVsI3hE/Ek+zNKU7iC42uZu2Z/rlLN7w8NNfSqzU7hi9nzZOdhhMcg2X8JR
         J4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681471; x=1728286271;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZQRxL2K5uWGwhrQ5GXxFGovvx1YDTZJo2NnfcjpO8w=;
        b=feLAVKWT32dVaxpZ3btBR1h5S7b4ayWJ6S2TlW0Vlkl9/ZMqt5UI12ml6x+z7oL3y7
         AGHM5ft8j0I+T1VZyVKyxWytgd/yAkWpRF+fbKBnHm82DfyY2szdxe+r38sFXhyZcjrq
         fMHKY0yipP46x9E+yoC0pwBo19xzmTDktrKzOeFNlf1FVZxz3HYkvlLAYgEjzH8Kla9E
         e/7VrzjjSWk5kJqjs1WQLXrSSvDCNmbBDG5CQdif5zk1yn1/5p70BGNOfqakWFQHD1xI
         NP9JVwVmYeHnFNN4wdRBc8SuH8NaK8u+MIlmtSNbeaDv6tIOrIpSMgrVcfk9tgSWjs5r
         meMg==
X-Forwarded-Encrypted: i=1; AJvYcCWvjxiDth+WHlJjAfoEiADQwk5bfLgSPyiH39OhxtjcnhwVtEyzLi0aJnzYd+DKdsqS4KaWShSjm5I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHuDThVFYJUlqe0ctouLETaSB12h+USDUSrbL/AD8XBokY5imb
	TLxNexwLf6Mw+bnKeNVZbU8JZfdgk6fnC3fXizz4EIrcci5aIfVCVvlnL/htoA==
X-Google-Smtp-Source: AGHT+IHqQnSAMFFEUuibujMZ+Vzaw+nnJl+NhUWtTDbyIvMXZBXpTj0GvZcNOKkJK18J5A9yhK8bQQ==
X-Received: by 2002:a17:907:9706:b0:a8d:1774:eb59 with SMTP id a640c23a62f3a-a93c4ab15dcmr1182214466b.54.1727681470656;
        Mon, 30 Sep 2024 00:31:10 -0700 (PDT)
Message-ID: <9d78a6d3-e1c6-471d-ba95-9c9419323154@suse.com>
Date: Mon, 30 Sep 2024 09:31:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v16 1/3] x86/irq: allow setting IRQ permissions from
 GSI instead of pIRQ
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240930034250.2682265-1-Jiqian.Chen@amd.com>
 <20240930034250.2682265-2-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240930034250.2682265-2-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.09.2024 05:42, Jiqian Chen wrote:
> Some domains are not aware of the pIRQ abstraction layer that maps
> interrupt sources into Xen space interrupt numbers.  pIRQs values are
> only exposed to domains that have the option to route physical
> interrupts over event channels.
> 
> This creates issues for PCI-passthrough from a PVH domain, as some of
> the passthrough related hypercalls use pIRQ as references to physical
> interrupts on the system.  One of such interfaces is
> XEN_DOMCTL_irq_permission, used to grant or revoke access to
> interrupts, takes a pIRQ as the reference to the interrupt to be
> adjusted.
> 
> Since PVH doesn't manage interrupts in terms of pIRQs, introduce a new
> hypercall that allows setting interrupt permissions based on GSI value
> rather than pIRQ.
> 
> Note the GSI hypercall parameters is translated to an IRQ value (in
> case there are ACPI overrides) before doing the checks.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



