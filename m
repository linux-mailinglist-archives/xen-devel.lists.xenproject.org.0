Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FhyIb6SsWmRDgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 17:05:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B52266F35
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 17:05:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251313.1548501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0M3B-0000p7-MW; Wed, 11 Mar 2026 16:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251313.1548501; Wed, 11 Mar 2026 16:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0M3B-0000mX-Jy; Wed, 11 Mar 2026 16:04:45 +0000
Received: by outflank-mailman (input) for mailman id 1251313;
 Wed, 11 Mar 2026 16:04:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0M3A-0000mR-VE
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 16:04:45 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03ec7219-1d64-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Mar 2026 17:04:42 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48538c5956bso912385e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2026 09:04:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b0ea7easm44901275e9.5.2026.03.11.09.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 09:04:41 -0700 (PDT)
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
X-Inumbo-ID: 03ec7219-1d64-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773245082; x=1773849882; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TT/SgzB7mUw3EoSGp78Tjf3cOUEGaf5p5hMLQXHI3Es=;
        b=TJ4vO90VppXFLrYmJTq6sd2VQ8nx2zAiIcJnHmcQEmlu0xQQ3z+bfgK7pd0MXTv5sf
         o3LXlK81siLvfmxw2AMzh5+MWmEHG4cAukHoVgdE/+8HwqRexFMYZwFGz0w32TiVsVtu
         73+b1Kr5eAdV/6MjTrjNIaMLyvSb76GC/YQUKRH+RUzQ+64doYF/rhOPoidkUUCQFT6d
         tKoljiWzNxfiyY/LfDu2VnuOK6gOx4D0oEBhZdpYzcVb8Vrg2+cDqGU2Aqr0gTHjpDSL
         2LWmdVE/7XiWBwWZmpACGOEFdoz+vtjPBwwRo18uaOg8nphe+dSiIw6oHf7sj+AAKJO+
         ehPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245082; x=1773849882;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TT/SgzB7mUw3EoSGp78Tjf3cOUEGaf5p5hMLQXHI3Es=;
        b=w8tXiVuLFH0BoSWQM7Oi7S58BfQMNqhZFNTJakrKdxNZHYmQ49E7PRc+FIoR2Eyxfv
         1euLRDwLx6MROCxzRrhzjn5LyygSS7BMmHbuHI//9aeS0GzN3ZXUbVkQsvKTu2b/rHtT
         hQwzOYCDw8qQkPU7ceAwwSL2lfoaWO3YNPz+i/WvouTqkjnHi15yv1Au8sa3ewZLmsso
         EKdY+ZoO8KHpLbNdS++E62kmt8nMJoEwRlv+R4jl1Yngmg5VKyvIBAXbNbPp6UnXA2MI
         j14TRLSjfDkVSoYSBYRCKdmVBAWS/wuM2hmC6rkgPBaXpGeZdcTIaA0Z+GIXmrHg8Mow
         WnCg==
X-Forwarded-Encrypted: i=1; AJvYcCUNlltCcG1sBPMyNh5HzTT0zlTstg3wjWNdTNPuWQz3UdDJEb7GC/ZRRjRlBbNGX6dlhnpUsO/uTTg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyr+yafC5QIwzD5hz3HX1X3qSUsqeufumi1ExXK/3LjfCHEIfBL
	AGJlAbuoBH6C50hciX3HHTQgO1cLR9So1DltHPRSTPtMHW7vAQHVUOmFemgTe3rg4w==
X-Gm-Gg: ATEYQzxDciCr5iRv8ISNs2O6ZqaAomlHmqvbiZbVCuQe+gk+FXYdub23Nk87LDD2ukd
	7r1087A1tgPhvNibiJnltWkzAfwMJERE9nc/9rhFB89OAvt1DqJldHKi4PEti1A9UlI+ZWKOwzN
	I0b0wXTSWBOBZJNV3J0TMwhgRXq+hU7PCn6IekL7OEPqqKVHdbf3Zmx3fUlak3gGOcDgeaXPvjF
	I9075ahmp6Bp03k6c9SmckcWTr/I+zddwAtoGn3LrSoMiX70SAjIxtWkpwy+L7k9AiajJ0xwtNm
	nr6a9D8DGm3GotBFqXwEQePU5rjg+bmWhzfuKgH6qPSRYziNbEA3I4i93+NMGHMERpHE4RyNEGe
	dahBrf0AD8y5TDNKxEh8/GFZEUALfTbSphI0fYmaNDEAJNZbvKtBPq8z8gPlCqjaxlOBrwKqFmt
	iZegoeaYIt2I/pYkfnUwaCkZC/RD2eOE46J1TpRp/XxgfN7we2+kCN4sr5c0+xmvCBKtX2dBG3J
	faUg496r0wYbKM=
X-Received: by 2002:a05:600c:310b:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-4854f590efamr2030355e9.11.1773245081852;
        Wed, 11 Mar 2026 09:04:41 -0700 (PDT)
Message-ID: <55a65f8d-40df-4841-8e76-200c82f397c5@suse.com>
Date: Wed, 11 Mar 2026 17:04:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] x86/dmop: Add XEN_DMOP_{bind,unbind}_pt_msi_irq DM
 ops
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <20260309123055.880050-1-julian.vetter@vates.tech>
 <20260309123055.880050-5-julian.vetter@vates.tech>
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
In-Reply-To: <20260309123055.880050-5-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:julien@xen.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E0B52266F35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.03.2026 13:31, Julian Vetter wrote:
> @@ -607,6 +631,83 @@ int dm_op(const struct dmop_args *op_args)
>          break;
>      }
>  
> +    case XEN_DMOP_bind_pt_msi_irq:
> +    {
> +        const struct xen_dm_op_bind_pt_msi_irq *data =
> +            &op.u.bind_pt_msi_irq;
> +        struct xen_domctl_bind_pt_irq bind = {
> +            .machine_irq = data->machine_irq,
> +            .irq_type = PT_IRQ_TYPE_MSI,
> +        };
> +        int irq;
> +
> +        rc = -EINVAL;
> +        if ( data->pad0 || data->pad1 )
> +            break;
> +
> +        if ( data->flags & ~XEN_DMOP_MSI_FLAG_UNMASKED )
> +            break;
> +
> +        irq = domain_pirq_to_irq(d, bind.machine_irq);
> +
> +        rc = -EPERM;
> +        if ( irq <= 0 || !irq_access_permitted(current->domain, irq) )
> +            break;
> +
> +        bind.u.msi.gvec = data->gvec;
> +        bind.u.msi.gflags =
> +            msi_addr_to_gflags(data->addr, data->data,
> +                               !(data->flags & XEN_DMOP_MSI_FLAG_UNMASKED));
> +        bind.u.msi.gtable = data->gtable;
> +
> +        rc = -ESRCH;
> +        if ( is_iommu_enabled(d) )
> +        {
> +            pcidevs_lock();
> +            rc = pt_irq_create_bind(d, &bind);
> +            pcidevs_unlock();

I understand the same locking is used at the other call site, but it's as
questionable there as it is here. We should try hard to avoid use of this
global lock when something lighter-weight would do.

> +        }
> +        if ( rc < 0 )
> +            printk(XENLOG_G_ERR
> +                   "pt_irq_create_bind failed (%ld) for dom%d\n",
> +                   rc, d->domain_id);

%pd please in new code. Also this message needs to be distinguishable
from that in arch_do_domctl().

> --- a/xen/include/public/hvm/dm_op.h
> +++ b/xen/include/public/hvm/dm_op.h
> @@ -444,6 +444,28 @@ struct xen_dm_op_nr_vcpus {
>  };
>  typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
>  
> +#define XEN_DMOP_bind_pt_msi_irq   21
> +#define XEN_DMOP_unbind_pt_msi_irq 22
> +
> +struct xen_dm_op_bind_pt_msi_irq {
> +    /* IN - physical IRQ (pirq) */
> +    uint32_t machine_irq;
> +    /* IN - guest vector */
> +    uint8_t  gvec;
> +    uint8_t  pad0;
> +    uint16_t pad1;
> +    /* IN - MSI data (vector, delivery, trigger) */
> +    uint32_t data;
> +    /* IN - flags */
> +    uint32_t flags;
> +#define XEN_DMOP_MSI_FLAG_UNMASKED (1u << 0)
> +    /* IN - MSI address (0xfeexxxxx, includes ext dest) */

The address given is x86-specific, while the header is arch-generic. (If
this was to be an x86-only interface, ...

> +    uint64_aligned_t addr;

... this also wouldn't need to be a 64-bit address, for example.)

> +    /* IN - MSI-X table base GFN, 0 for MSI */
> +    uint64_aligned_t gtable;
> +};

Commentary throughout also leaves unclear which of the fields are actually
meaningful for XEN_DMOP_unbind_pt_msi_irq. In a new interface, the unused
fields would want checking to be zero. Yet better may be to have unbind
have its own, much smaller structure.

> +typedef struct xen_dm_op_bind_pt_msi_irq xen_dm_op_bind_pt_msi_irq_t;

Is this typedef actually needed anywhere? Clearly ...

> @@ -468,6 +490,7 @@ struct xen_dm_op {
>          xen_dm_op_relocate_memory_t relocate_memory;
>          xen_dm_op_pin_memory_cacheattr_t pin_memory_cacheattr;
>          xen_dm_op_nr_vcpus_t nr_vcpus;
> +        xen_dm_op_bind_pt_msi_irq_t bind_pt_msi_irq;

... the plain struct can be used e.g. here. Imo we should stop cluttering
the namespace with typedef-s which aren't actually needed. (A case where
they are needed is when a guest handle needs defining for the type.)

> --- a/xen/include/xlat.lst
> +++ b/xen/include/xlat.lst
> @@ -107,6 +107,7 @@
>  ?	dm_op_map_mem_type_to_ioreq_server hvm/dm_op.h
>  ?	dm_op_modified_memory		hvm/dm_op.h
>  ?	dm_op_nr_vcpus			hvm/dm_op.h
> +?	dm_op_bind_pt_msi_irq		hvm/dm_op.h
>  ?	dm_op_pin_memory_cacheattr	hvm/dm_op.h
>  ?	dm_op_relocate_memory		hvm/dm_op.h
>  ?	dm_op_remote_shutdown		hvm/dm_op.h

I'm curious: How did you determine the insertion point?

Jan

