Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D9F880408
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 18:56:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695558.1085411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmdgH-0004Nl-7d; Tue, 19 Mar 2024 17:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695558.1085411; Tue, 19 Mar 2024 17:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmdgH-0004Lg-4j; Tue, 19 Mar 2024 17:55:21 +0000
Received: by outflank-mailman (input) for mailman id 695558;
 Tue, 19 Mar 2024 17:55:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yEhX=KZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmdgF-0004La-Pi
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 17:55:19 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d92ae894-e619-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 18:55:18 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33ff53528ceso2060897f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 10:55:18 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 z5-20020a5d44c5000000b0033b87c2725csm12838740wrr.104.2024.03.19.10.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 10:55:18 -0700 (PDT)
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
X-Inumbo-ID: d92ae894-e619-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710870918; x=1711475718; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pOorp9oPj27UM7coMUX9+JZpLzJHJalw1+cwFEHhakg=;
        b=HuGCQy3jiCohaW+qGkKcxIBiIZzAN/tXSPOVqndp+dKQbw+9EJHC/sgP787++e3MTQ
         ZtYPEpJGcPwmJbifvmZ/l/ceudQ9/HFiqiBXHNjZ1/nPV9PEs9/DWx9kwyOpBuLWd/5D
         RIB/aRJE+r/hmBUYaOA0WjpPBOjTkOP+psawg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710870918; x=1711475718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOorp9oPj27UM7coMUX9+JZpLzJHJalw1+cwFEHhakg=;
        b=JVpdhowQc7bJgpYZjy0tYfMV1wi5zEtFhSGPNC8w8q1WpS9K3WtapoVlyamMtZaLSp
         xCbxLhxB6pNyA2tA2J30OfMvWFs9/PeUhbrrHCpKG48UEQG3ed0t6AUwI76D1DUjGgQN
         e4oAk1vVv0W87FZAR3IkvwuyCD6zIXsWjBXBHXX1GRQWEKP4xLYfVA1ejw+8dVvl0St6
         5Va18wrqeMyGrI97COJVr86oVsa019cieO+6NImEt/A7btyLU2I77i6a4z8uhScfMYw2
         0Eojuu6QaFMOOgKK7WbuOUdnRdaO+bkEw+uAcZLe98uuW1wDZyLr8tItKLRzZEQhIiqs
         6Djw==
X-Gm-Message-State: AOJu0YwqerdN1kHjDPwLfVNVmfOQU0OOaG8ViTgwZZPOygFRngf4sGP3
	+zGjmyQVIpYVe4CTiyQ0xM9xPL3ZP6ZY7LJjSezLf91OcyvY5H4mII4JMbb+M4U=
X-Google-Smtp-Source: AGHT+IECCSk49H6gp6UgFinGb3tXDmyb5T5o7xPSV/1U4MvK4o2xRAjHWBmtYxIx6BCOcBS+lwQouQ==
X-Received: by 2002:a5d:4607:0:b0:33e:7029:96bf with SMTP id t7-20020a5d4607000000b0033e702996bfmr10934084wrq.58.1710870918224;
        Tue, 19 Mar 2024 10:55:18 -0700 (PDT)
Date: Tue, 19 Mar 2024 18:55:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/6] tools/xc: Add xc_cpu_policy to the public xenctrl.h
 header
Message-ID: <ZfnRhQ94uIwQCN3v@macbook>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-3-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240109153834.4192-3-alejandro.vallejo@cloud.com>

On Tue, Jan 09, 2024 at 03:38:30PM +0000, Alejandro Vallejo wrote:
> Move struct xc_cpu_policy data structure out of xg_private.h and into
> the public xenguest.h so it can be used by libxl.

I will let Andrew comment on this one, IIRC the initial idea was to
not leak cpu_policy into libxl, and to instead have it as an opaque
object that libxl can interact with using helpers.

I haven't looked at followup patches - I assume this is done to
manipulate the cpuid data more easily from libxl, and ultimately drop
xc_xend_cpuid?

> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  tools/include/xenguest.h             |  8 +++++++-
>  tools/libs/guest/xg_private.h        | 10 ----------
>  xen/include/xen/lib/x86/cpu-policy.h |  5 +++++
>  3 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
> index e01f494b77..4e9078fdee 100644
> --- a/tools/include/xenguest.h
> +++ b/tools/include/xenguest.h
> @@ -784,7 +784,13 @@ xen_pfn_t *xc_map_m2p(xc_interface *xch,
>                        unsigned long *mfn0);
>  
>  #if defined(__i386__) || defined(__x86_64__)
> -typedef struct xc_cpu_policy xc_cpu_policy_t;
> +#include <xen/lib/x86/cpu-policy.h>
> +
> +typedef struct xc_cpu_policy {
> +    struct cpu_policy policy;
> +    xen_cpuid_leaf_t leaves[CPUID_MAX_SERIALISED_LEAVES];
> +    xen_msr_entry_t msrs[MSR_MAX_SERIALISED_ENTRIES];
> +} xc_cpu_policy_t;
>  
>  /* Create and free a xc_cpu_policy object. */
>  xc_cpu_policy_t *xc_cpu_policy_init(void);
> diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
> index d73947094f..d1940f1ea4 100644
> --- a/tools/libs/guest/xg_private.h
> +++ b/tools/libs/guest/xg_private.h
> @@ -170,14 +170,4 @@ int pin_table(xc_interface *xch, unsigned int type, unsigned long mfn,
>  #define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), M2P_SHIFT)
>  #define M2P_CHUNKS(_m)  (M2P_SIZE((_m)) >> M2P_SHIFT)
>  
> -#if defined(__x86_64__) || defined(__i386__)
> -#include <xen/lib/x86/cpu-policy.h>
> -
> -struct xc_cpu_policy {
> -    struct cpu_policy policy;
> -    xen_cpuid_leaf_t leaves[CPUID_MAX_SERIALISED_LEAVES];
> -    xen_msr_entry_t msrs[MSR_MAX_SERIALISED_ENTRIES];
> -};
> -#endif /* x86 */
> -
>  #endif /* XG_PRIVATE_H */
> diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
> index 14724cedff..65f6335b32 100644
> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -85,6 +85,11 @@ unsigned int x86_cpuid_lookup_vendor(uint32_t ebx, uint32_t ecx, uint32_t edx);
>   */
>  const char *x86_cpuid_vendor_to_str(unsigned int vendor);
>  
> +#ifndef __XEN__
> +/* Needed for MAX() */
> +#include <xen-tools/common-macros.h>
> +#endif /* __XEN__ */

I think for this header it is up to the user to provide the required
context, iow: it should be tools/include/xenguest.h to include
xen-tools/common-macros.h ahead of cpu-policy.h.  Otherwise we should
likely do the same for #ifdef __XEN__ branch and include whatever
header that defines MAX().

Thanks, Roger.

