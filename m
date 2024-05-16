Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3112D8C779A
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 15:30:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723328.1128090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7bBF-0005Bg-Ds; Thu, 16 May 2024 13:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723328.1128090; Thu, 16 May 2024 13:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7bBF-00059T-Aw; Thu, 16 May 2024 13:29:57 +0000
Received: by outflank-mailman (input) for mailman id 723328;
 Thu, 16 May 2024 13:29:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7bBE-00059N-L8
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:29:56 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60a44188-1388-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 15:29:53 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-51f174e316eso939004e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 06:29:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c322c85sm10573149a12.84.2024.05.16.06.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 06:29:52 -0700 (PDT)
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
X-Inumbo-ID: 60a44188-1388-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715866192; x=1716470992; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zDEyhE5ASknvhoXEIMpQKHP43jM+oRuvjSH2AGEV8to=;
        b=HAngb/TcIPFT9qrtVyofQpZSQ4wxk4URUcHcefkrddd2GCB3BsKBMpIY9L9+hZwyfz
         FM1ADCb/ehFTyURQFIkPmEiAGfJlXAQpbYkgnAp83+Km2CVZOd6i55QT/Nr/bNSc1zTZ
         aQdCnOVk8L/nYxkAD9dKg1moD6rnDu6977gLoRQAg7S76S58UR8bZYakc4A1h68LuJW4
         th7xLS6AwOxFnzqPXheirTmzTr2nHMdQbAdz+SbyHTVpcWlt3Z8OsoktZZlEEet+SRm+
         GU5fiTa40NZuQCAdXGzTq7CXqNaq3dWGaBEvHEsi/8hkxCMFB91FwloHqoL4myJKNEKf
         +yUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715866192; x=1716470992;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDEyhE5ASknvhoXEIMpQKHP43jM+oRuvjSH2AGEV8to=;
        b=OSdN4SVwavHg+RTFonA+zRgty6H8mam3i8iqOvoFai1oIysSZfM3jqsqkJ1QMlO5NE
         rspNGH/dEnfQNdh1sfHJ7cLRHsraZjEjXoGDp8nij7BRM9KLpI+GXqMDBsYHkaSQuT3O
         II/lELR7BBNcKz54/dZu403XRqvD+B9me6VoSzhMVmvZeeyhB3pABna0UQb6fAuu6lKD
         mC4w7aD8moJCris0l8NdGnp34r56q51VaUWPSBxBZk5xb5YhjRESs91gF7dWWXbCfcN/
         TUS8QEXFLR0qAveiicK5y0DYaZri9BBwn5niDpFntq0TWonqZ6nYmtPnyOSRQEf3wgYS
         XYWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKy2MxDqOKksAZNgFu5fXLOy2eodWgJb2wLn+R58JixtW4uDKV/MpEATBMKiXDU+VjN8SKIjG0cF81NLTTzWi2Tj7UTW+DhAk1XA/Gymw=
X-Gm-Message-State: AOJu0Yx4mM5yxB7X/uncHWJ/zw67OvW05N0amS/wHiu7pZaIyCdGD3Ec
	3hdtsYEXcLgRk8Xz+D4wc61hfsv5lJ/QEyyUcHVrqdqhFofb5HfIgIKVSVv9ZQ==
X-Google-Smtp-Source: AGHT+IH0fxs0mgXVgSU5rvT6dcBio4Ee8gWbkJCyzHlyVC9igq9fQ6h/RrwhFYtxaWvV0q6N/7qDZw==
X-Received: by 2002:a05:6512:6ca:b0:523:8f5e:4aa0 with SMTP id 2adb3069b0e04-5238f5e4b78mr3932674e87.63.1715866192458;
        Thu, 16 May 2024 06:29:52 -0700 (PDT)
Message-ID: <673505f6-2d0f-4ea7-ab9f-c132adce28c4@suse.com>
Date: Thu, 16 May 2024 15:29:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v8 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Content-Language: en-US
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-3-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240516095235.64128-3-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 11:52, Jiqian Chen wrote:
> If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
> a passthrough device by using gsi, see
> xen_pt_realize->xc_physdev_map_pirq and
> pci_add_dm_done->xc_physdev_map_pirq.

xen_pt_realize() is in qemu, which imo wants saying here (for being a different
repo), the more that pci_add_dm_done() is in libxl.

> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -74,6 +74,8 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      {
>      case PHYSDEVOP_map_pirq:
>      case PHYSDEVOP_unmap_pirq:
> +        break;

I think this could do with a comment as to why it's permitted as well as giving
a reference to where further restrictions are enforced (or simply mentioning
the constraint of this only being permitted for management of other domains).

> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -305,11 +305,23 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      case PHYSDEVOP_map_pirq: {
>          physdev_map_pirq_t map;
>          struct msi_info msi;
> +        struct domain *d;
>  
>          ret = -EFAULT;
>          if ( copy_from_guest(&map, arg, 1) != 0 )
>              break;
>  
> +        d = rcu_lock_domain_by_any_id(map.domid);
> +        if ( d == NULL )
> +            return -ESRCH;
> +        /* If caller is the same HVM guest as current, check pirq flag */

The caller is always current. What I think you mean is "caller is same as
the subject domain". I'm also having trouble with seeing the usefulness
of saying "check pirq flag". Instead I think you want to state the
restriction here that you actually mean to enforce (which would also mean
mentioning PVH in some way, to distinguish from the "normal HVM" case).

> +        if ( !is_pv_domain(d) && !has_pirq(d) && map.domid == DOMID_SELF )

You exclude DOMID_SELF but not the domain's ID? Why not simply check d
being current->domain, thus covering both cases? Plus you could use
rcu_lock_domain_by_id() to exclude DOMID_SELF, and you could use
rcu_lock_remote_domain_by_id() to exclude the local domain altogether.
Finally I'm not even sure you need the RCU lock here (else you could
use knownalive_domain_from_domid()). But perhaps that's better to cover
the qemu-in-stubdom case, which we have to consider potentially malicious.

I'm also inclined to suggest to use is_hvm_domain() here in favor of
!is_pv_domain().

Jan

