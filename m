Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C34182D615
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 10:36:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667255.1038343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPJNv-0004Hi-RY; Mon, 15 Jan 2024 09:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667255.1038343; Mon, 15 Jan 2024 09:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPJNv-0004Fj-O2; Mon, 15 Jan 2024 09:35:59 +0000
Received: by outflank-mailman (input) for mailman id 667255;
 Mon, 15 Jan 2024 09:35:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPJNu-0003p4-R6
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 09:35:58 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ccddbbd-b389-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 10:35:58 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50edf4f478eso5846198e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 01:35:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d11-20020adfa34b000000b00336e15fbc85sm11401502wrb.82.2024.01.15.01.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 01:35:57 -0800 (PST)
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
X-Inumbo-ID: 7ccddbbd-b389-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705311357; x=1705916157; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f8pJbFLLzq++RLoMdHnUHOsjTOd/6nBu1YmmrG9duUo=;
        b=hDjneoupBb7KSiJwzXS0k5CEgAWjd7JES1BIBoXDNjN6mOOhEBrwr0NvQi6QuAQyDU
         sFbOuZ9GzGTgjeCvegyarTJlI8ZVPCIa1bNvHhuNQ9uylRZUIylBFyG3137Bgj2y8rHu
         3Ci4/NW/E+Y2pcf5l0mgzsf19oAP8QjyN3mvjMG5PLOGHc1ZgFTauACPD25Bb9EFM2XU
         vCIOgRfn4/y6XEE0L7CVKapHrnnpyWsFjSTa//aDSJNaG2WtY5Ne7xwbutjUHJZ4w2dY
         8i92hHzkdHfG+D3QkhebAdHKXdEZy5DovE6ug++io+mYjXTv4QWmgo3xxc1nDa/xF8Qu
         YJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705311357; x=1705916157;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8pJbFLLzq++RLoMdHnUHOsjTOd/6nBu1YmmrG9duUo=;
        b=oX4MS6dljp9l/O1uYUkavcw8uwJkXULLISMViQs/SVs4d6X9u9c4o6IuppNmJFZsj9
         XjfdLyUXC59WkEd+u0psO3EyfeMVOEZCAelps/1EtSDwImIEcKsliKCa6UEW9EStfDqX
         29sbDHveJ42GIS+BUEOhNWbMxTq6VfO2jzqzmgEdfkFp+wAwy3FI79csf07DrKnBQMp/
         JVOwCBy+ctUio0CQVtdAILVo9lkONDtcid6uOf4O1v5JgurvDrzRfN9WAJlwRAJ4G8Jp
         IGmzS8T1XW8f06BKlNfmffnhhlbxnm9J6LYOs/5YAH2ngKyT7Eo+M1H7f9cdCy6goMIo
         DpVA==
X-Gm-Message-State: AOJu0Yx0sZNaWf4K05sg6uvs8PWwvibBBLg3YdZT4WAV8Nqao3Vto1XA
	ODiof2AyZSi+iJXuLumfnAZGtjc9ExBq
X-Google-Smtp-Source: AGHT+IFXPo1gcX1e7EirUbKWg0H9lYqlPaTc6vHwzmSbtDv7MN6c2RvHRQ0NigsYXB+w/hIIdCMzJg==
X-Received: by 2002:ac2:5632:0:b0:50e:7846:7acf with SMTP id b18-20020ac25632000000b0050e78467acfmr1914478lff.34.1705311357631;
        Mon, 15 Jan 2024 01:35:57 -0800 (PST)
Message-ID: <1793f158-ed83-46f9-be12-68c5ce86e4c4@suse.com>
Date: Mon, 15 Jan 2024 10:35:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/dm: arm: Introduce inject_msi2 DM op
Content-Language: en-US
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1705066642.git.mykyta_poturai@epam.com>
 <6c551b03796fbf091b22fcde96d894cd5308ff91.1705066642.git.mykyta_poturai@epam.com>
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
In-Reply-To: <6c551b03796fbf091b22fcde96d894cd5308ff91.1705066642.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.01.2024 11:01, Mykyta Poturai wrote:
> Add the second version of inject_msi DM op, which allows to specify
> the source_id of an MSI interrupt. This is needed for correct MSI
> injection on ARM.
> 
> It would not be safe to include the source_id in the original inject_msi
> in the pad field, because we have no way to know if it is set or not.

At least on x86 I think 0 could serve as a "not valid" indicator, as that's
always a host bridge, which would never be handed through to guests. Can't
speak for Arm, as I don't know whether 00:00.0 always being a host bridge
(or unpopulated) is a universal requirement of the spec. Therefore this may
be insufficient justification for adding a new sub-op.

> --- a/xen/arch/arm/dm.c
> +++ b/xen/arch/arm/dm.c
> @@ -27,6 +27,7 @@ int dm_op(const struct dmop_args *op_args)
>          [XEN_DMOP_set_ioreq_server_state]           = sizeof(struct xen_dm_op_set_ioreq_server_state),
>          [XEN_DMOP_destroy_ioreq_server]             = sizeof(struct xen_dm_op_destroy_ioreq_server),
>          [XEN_DMOP_set_irq_level]                    = sizeof(struct xen_dm_op_set_irq_level),
> +        [XEN_DMOP_inject_msi2]                      = sizeof(struct xen_dm_op_inject_msi2),
>          [XEN_DMOP_nr_vcpus]                         = sizeof(struct xen_dm_op_nr_vcpus),
>      };
>  
> @@ -112,6 +113,20 @@ int dm_op(const struct dmop_args *op_args)
>          break;
>      }
>  
> +    case XEN_DMOP_inject_msi2:
> +    {
> +        const struct xen_dm_op_inject_msi2 *data =
> +            &op.u.inject_msi2;
> +
> +        if ( !(data->flags & XEN_DMOP_MSI_SOURCE_ID_VALID) )
> +        {
> +            rc = -EINVAL;
> +            break;
> +        }

While I can see the reason for this check here, ...

> @@ -539,6 +540,18 @@ int dm_op(const struct dmop_args *op_args)
>          break;
>      }
>  
> +    case XEN_DMOP_inject_msi2:
> +    {
> +        const struct xen_dm_op_inject_msi2 *data =
> +            &op.u.inject_msi2;
> +
> +        if ( !(data->flags & XEN_DMOP_MSI_SOURCE_ID_VALID) )
> +            printk(XENLOG_WARNING "XEN_DMOP_inject_msi2: source_id is ignored\n");

... I don't understand what's going on here: If the flag isn't set, it's
obvious that the field is to be ignored. Is the conditional inverted?

Also in both cases you will need to check that all other flags fields
are clear, or else we won't be able to give them meaning down the road.

Finally such a message, if really warranted, wants to use gprintk().

> --- a/xen/include/public/hvm/dm_op.h
> +++ b/xen/include/public/hvm/dm_op.h
> @@ -444,6 +444,17 @@ struct xen_dm_op_nr_vcpus {
>  };
>  typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
>  
> +#define XEN_DMOP_inject_msi2 21
> +#define XEN_DMOP_MSI_SOURCE_ID_VALID (1u << 0)
> +
> +struct xen_dm_op_inject_msi2 {
> +    uint64_aligned_t addr;
> +    uint32_t data;
> +    uint32_t source_id; /* PCI SBDF */

Since the comment says SBDF (not BDF), how are multiple segments handled
here? At least on x86 (VT-d and V-i) source IDs are only 16 bits iirc,
and are local to the respective segment. It would feel wrong to use a
32-bit quantity there; IOW I'd rather see this as being two 16-bit fields
(segment and source_id).

> +    uint32_t flags;
> +};

Just like in struct xen_dm_op_inject_msi padding wants making explicit,
and then wants checking for being zero.

Jan

