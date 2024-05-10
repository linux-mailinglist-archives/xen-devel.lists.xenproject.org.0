Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CD28C24E2
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 14:30:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719852.1122701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5PN2-0004HI-4S; Fri, 10 May 2024 12:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719852.1122701; Fri, 10 May 2024 12:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5PN2-0004E9-0l; Fri, 10 May 2024 12:29:04 +0000
Received: by outflank-mailman (input) for mailman id 719852;
 Fri, 10 May 2024 12:29:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+D8H=MN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s5PN0-0004E3-VM
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 12:29:03 +0000
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [2607:f8b0:4864:20::e32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0d64e2b-0ec8-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 14:29:00 +0200 (CEST)
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-47ef11b1a31so824057137.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 05:29:00 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df5513017sm20748731cf.46.2024.05.10.05.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 05:28:57 -0700 (PDT)
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
X-Inumbo-ID: e0d64e2b-0ec8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715344139; x=1715948939; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zVZagDSfufW5sKWfE9/POvo7VWOMtlKaVnyuvAnZeFo=;
        b=kenX9gKtQR7SMshhzldQhqU86xLBIVMtz+OzeUtVDqWZlw3MVLdAth2JW4RDO4KCym
         AqgYxKuTmYyKOQJcVMRlK7wrOB9N24pW1VprSWQ2cZSI4nuuaHyNZI5hA3HctgmpeXWG
         c/xjfNtIhvuoUBqFyY9p9OrqHCcgggztkbVug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715344139; x=1715948939;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zVZagDSfufW5sKWfE9/POvo7VWOMtlKaVnyuvAnZeFo=;
        b=eu+t2xuaAQYuxQjlFLASDNTAkDjCkb3ulm1hA8QqxMBzbFnSOgx/Bv408+DJCn/GgJ
         uKSJpIs9Hknel6BON5Jm5FJMvhRd7Jrp7JPq5WZWGktyGpMuWgUykdpesAgr2dqdXSsh
         6eHbbgwfhNdRwyf0edaBJNsOAmYWg6TkmKNTjZVQq5EflGTYFn71bgchw26h5BkFkiM2
         8dIp/2YjIEe7hQRCoxu+zsnv4LJkuIQa3E368COfiQskOFym8HZ3Oko0AnT8wOhxnZB4
         Qx2UG1QydpVlp19/EAqrgEeFBRngbr8rhOfHZXtXMwfZuzXJQGM5OWa+GreaaOwzbt3Z
         nozA==
X-Gm-Message-State: AOJu0YxIg2Nf5WQZGfPzlrhrYJK2F7ZXLHIH1mOidscTuA9AumL3EyG1
	hL8eJYuAVA9XWnlzxslpUlhwo8elKsSEirHodG0ZDgFpN6v8c07J4aMU3XLy0iwocPDGgmGIuOH
	7
X-Google-Smtp-Source: AGHT+IEGu544bcBvZtqjfCZMb4mtH8Ju2ZiAI5Zv/cCa6ulyaanyEFIeYF1ckbJvq8OXer+Rx5xXZQ==
X-Received: by 2002:a05:6102:41a8:b0:47b:6fb1:5299 with SMTP id ada2fe7eead31-48077e03423mr2609268137.14.1715344137600;
        Fri, 10 May 2024 05:28:57 -0700 (PDT)
Date: Fri, 10 May 2024 14:28:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH for-4.19 v2 3/3] xen/x86: remove foreign mappings from
 the p2m on teardown
Message-ID: <Zj4TB9iXpwFkQoLE@macbook>
References: <20240508112323.38946-1-roger.pau@citrix.com>
 <20240508112323.38946-4-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240508112323.38946-4-roger.pau@citrix.com>

On Wed, May 08, 2024 at 01:23:23PM +0200, Roger Pau Monne wrote:
> Iterate over the p2m up to the maximum recorded gfn and remove any foreign
> mappings, in order to drop the underlying page references and thus don't keep
> extra page references if a domain is destroyed while still having foreign
> mappings on it's p2m.
> 
> The logic is similar to the one used on Arm.
> 
> Note that foreign mappings cannot be created by guests that have altp2m or
> nested HVM enabled, as p2ms different than the host one are not currently
> scrubbed when destroyed in order to drop references to any foreign maps.
> 
> It's unclear whether the right solution is to take an extra reference when
> foreign maps are added to p2ms different than the host one, or just rely on the
> host p2m already having a reference.  The mapping being removed from the host
> p2m should cause it to be dropped on all domain p2ms.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Use existing p2m max_mapped_pfn field.
>  - Prevent creating foreign mappings by guests that have altp2m or nestedhvm
>    enabled.
> ---
>  CHANGELOG.md                   |  1 +
>  xen/arch/x86/domain.c          |  8 +++-
>  xen/arch/x86/include/asm/p2m.h | 26 +++++++------
>  xen/arch/x86/mm/p2m-basic.c    | 17 +++++++++
>  xen/arch/x86/mm/p2m.c          | 68 ++++++++++++++++++++++++++++++++--
>  5 files changed, 103 insertions(+), 17 deletions(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 8041cfb7d243..09bdb9b97578 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -14,6 +14,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     - HVM PIRQs are disabled by default.
>     - Reduce IOMMU setup time for hardware domain.
>   - xl/libxl configures vkb=[] for HVM domains with priority over vkb_device.
> + - Allow HVM/PVH domains to map foreign pages.
>  
>  ### Added
>   - On x86:
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index dff790060605..1cb3ccddab00 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -718,7 +718,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
>  
> -    if ( altp2m && (altp2m & (altp2m - 1)) )
> +    if ( altp2m & (altp2m - 1) )
>      {
>          dprintk(XENLOG_INFO, "Multiple altp2m options selected in flags: %#x\n",
>                  config->flags);
> @@ -2387,6 +2387,7 @@ int domain_relinquish_resources(struct domain *d)
>          enum {
>              PROG_iommu_pagetables = 1,
>              PROG_shared,
> +            PROG_mappings,
>              PROG_paging,
>              PROG_vcpu_pagetables,
>              PROG_xen,
> @@ -2435,6 +2436,11 @@ int domain_relinquish_resources(struct domain *d)
>          }
>  #endif
>  
> +    PROGRESS(mappings):
> +        ret = relinquish_p2m_mapping(d);
> +        if ( ret )
> +            return ret;
> +
>      PROGRESS(paging):
>  
>          /* Tear down paging-assistance stuff. */
> diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
> index 107b9f260848..c1478ffc3647 100644
> --- a/xen/arch/x86/include/asm/p2m.h
> +++ b/xen/arch/x86/include/asm/p2m.h
> @@ -383,6 +383,8 @@ struct p2m_domain {
>  
>      /* Number of foreign mappings. */
>      unsigned long      nr_foreign;
> +    /* Cursor for iterating over the p2m on teardown. */
> +    unsigned long      teardown_gfn;
>  #endif /* CONFIG_HVM */
>  };
>  
> @@ -395,16 +397,7 @@ struct p2m_domain {
>  #endif
>  #include <xen/p2m-common.h>
>  
> -static inline bool arch_acquire_resource_check(struct domain *d)
> -{
> -    /*
> -     * FIXME: Until foreign pages inserted into the P2M are properly
> -     * reference counted, it is unsafe to allow mapping of
> -     * resource pages unless the caller is the hardware domain
> -     * (see set_foreign_p2m_entry()).
> -     */
> -    return !paging_mode_translate(d) || is_hardware_domain(d);

This must be:

    return is_pv_domain(d) ||
           (d->arch.hvm.params[HVM_PARAM_ALTP2M] == XEN_ALTP2M_disabled &&
            !nestedhvm_enabled(d));

Sorry.

