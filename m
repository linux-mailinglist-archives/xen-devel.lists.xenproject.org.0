Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A6B8C782A
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 16:02:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723378.1128260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7bgD-0005aG-RW; Thu, 16 May 2024 14:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723378.1128260; Thu, 16 May 2024 14:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7bgD-0005Y0-Oc; Thu, 16 May 2024 14:01:57 +0000
Received: by outflank-mailman (input) for mailman id 723378;
 Thu, 16 May 2024 14:01:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7bgC-0005XX-U7
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 14:01:56 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da249614-138c-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 16:01:54 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a59ad12efe3so152006066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 07:01:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574eb5ec296sm3404078a12.35.2024.05.16.07.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 07:01:53 -0700 (PDT)
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
X-Inumbo-ID: da249614-138c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715868114; x=1716472914; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ujnsNAx1jCOYPPKGm0C2coQ22R14RMeSetkSQ4kgQpI=;
        b=YpIgfhOHWA19edn1dYkNmAQ1xZTyx4rrbZKQEZVRO5O0I8R8cYmYFlqoMUJgIlNAsc
         GKzyk3bRRCKWig3Bwh/TmmuiDKH30RaDbEekctkBuAu9fh1ikafHkh/R6v70sRZQuL7+
         zwc0VxzXRnw4SSPC/vlGMY7vqYRPo0tZrerfncs5gFKDscKV1xiYL7d8IhVOLAFtkjv4
         EotZZkUmPJMnDoWZwz12+G/M7wXt9MKjWhmg8iPN4Rz2nJq3fvUJ0a7AKAhvhQKwAmxH
         1rRoLntZ0xzxL202WebN7zRnE8l9ykns6K05YqT/+U0mSY+aH8oVrF+Uu4uyNgq/cGil
         JGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715868114; x=1716472914;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ujnsNAx1jCOYPPKGm0C2coQ22R14RMeSetkSQ4kgQpI=;
        b=GWrjTegF2QOD/2vaCoUz/MkQOvki0vMD0i72pNi/7Bkumecn+S02J6A6ns8EtB0w0f
         OhmYT+8AG6V9HFpU97mg5pOqP4G/vaolxOYzezzxT0neyA9HfJK+SIdNlZEvL8JJCiia
         31GFXdUsJBjf2Yz0YzniH2QkP3TKCIE6pXx6olrece9n7/ILaMBal5E0qim6Qqux1K5+
         J22cIS8O7SWteuZ1Gho3C2wId2sccO6D5ftBFQCfe34dfb7dZEXe39pjGEuGwqQlqKFu
         52G2QGbXtGgKPqlQ8vewv9yAXxgTyZC2UNSYTOuh62X4NjkpRxI4sRR5ZOUaAPKYL4nZ
         b3Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWl1xfURu1JMNNpN1SQMcxdh85sAgkBydpdlu03u6upvbhnRHOaOj/3KKMhtKEQjUU1RuMugCTBzho/rSUyoC/n2v7gNyg8sin9nJZmY3Q=
X-Gm-Message-State: AOJu0YxELyJmG7r0mFsPwGGXGRL6vZSG01KIQc4SgLcxNvnthuDyDXL+
	obVrS63xM05u2K0+triPwIKm6fhrkpys/3bKVfrD99BFc501AZ1TaX24mp/CkA==
X-Google-Smtp-Source: AGHT+IHvWE+TRNm9kP+7gFH5qyrY6kA1hpq9BGUCIFPQ1f08XDQ3RlBLHMAkblTfiUjObY4aRCN0Jg==
X-Received: by 2002:a50:d741:0:b0:572:983e:4aaa with SMTP id 4fb4d7f45d1cf-5734d67f615mr16940880a12.31.1715868114267;
        Thu, 16 May 2024 07:01:54 -0700 (PDT)
Message-ID: <9652011f-3f24-43f8-b91e-88bd3982a4c4@suse.com>
Date: Thu, 16 May 2024 16:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Content-Language: en-US
To: Jiqian Chen <Jiqian.Chen@amd.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-6-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240516095235.64128-6-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 11:52, Jiqian Chen wrote:
> Some type of domain don't have PIRQ, like PVH, when
> passthrough a device to guest on PVH dom0, callstack
> pci_add_dm_done->XEN_DOMCTL_irq_permission will failed
> at domain_pirq_to_irq.
> 
> So, add a new hypercall to grant/revoke gsi permission
> when dom0 is not PV or dom0 has not PIRQ flag.

Honestly I find this hard to follow, and thus not really making clear why
no other existing mechanism could be used.

> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---

Below here in an RFC patch you typically would want to put specific items
you're seeking feedback on. Without that it's hard to tell why this is
marked RFC.

> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -237,6 +237,37 @@ long arch_do_domctl(
>          break;
>      }
>  
> +    case XEN_DOMCTL_gsi_permission:
> +    {
> +        unsigned int gsi = domctl->u.gsi_permission.gsi;
> +        int allow = domctl->u.gsi_permission.allow_access;

bool?

> +        if ( is_pv_domain(current->domain) || has_pirq(current->domain) )
> +        {
> +            ret = -EOPNOTSUPP;
> +            break;
> +        }

Such a restriction imo wants explaining in a comment.

> +        if ( gsi >= nr_irqs_gsi )
> +        {
> +            ret = -EINVAL;
> +            break;
> +        }
> +
> +        if ( !irq_access_permitted(current->domain, gsi) ||

I.e. assuming IRQ == GSI? Is that a valid assumption when any number of
source overrides may be surfaced by ACPI?

> +             xsm_irq_permission(XSM_HOOK, d, gsi, allow) )

Here I'm pretty sure you can't very well re-use an existing hook, as the
value of interest is in a different numbering space, and a possible hook
function has no way of knowing which one it is. Daniel?

> +        {
> +            ret = -EPERM;
> +            break;
> +        }
> +
> +        if ( allow )
> +            ret = irq_permit_access(d, gsi);
> +        else
> +            ret = irq_deny_access(d, gsi);

As above I'm afraid you can't assume IRQ == GSI.

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -447,6 +447,13 @@ struct xen_domctl_irq_permission {
>  };
>  
>  
> +/* XEN_DOMCTL_gsi_permission */
> +struct xen_domctl_gsi_permission {
> +    uint32_t gsi;
> +    uint8_t allow_access;    /* flag to specify enable/disable of x86 gsi access */
> +};

Explicit padding please, including a check that it's zero on input.

> +
> +
>  /* XEN_DOMCTL_iomem_permission */

No double blank lines please. In fact you will want to break the double blank
lines in leading context, inserting in the middle.

Jan

