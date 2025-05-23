Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A131AC1FB1
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 11:25:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995492.1377871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIOdI-0004TG-Ti; Fri, 23 May 2025 09:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995492.1377871; Fri, 23 May 2025 09:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIOdI-0004Qj-QO; Fri, 23 May 2025 09:24:04 +0000
Received: by outflank-mailman (input) for mailman id 995492;
 Fri, 23 May 2025 09:24:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GSxL=YH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uIOdH-0004Qd-9y
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 09:24:03 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8f110c3-37b7-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 11:24:00 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so65694955e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 23 May 2025 02:24:00 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-44ab793a7d5sm45063185e9.1.2025.05.23.02.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 02:23:59 -0700 (PDT)
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
X-Inumbo-ID: a8f110c3-37b7-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747992240; x=1748597040; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IZJNTmOBPKYosd+xCBlKV6aSMJxN28zdgo/kHzmHxHA=;
        b=GckQR0feSKl0EbsEo9P2dxlVQR714X4F5Ybt6U5rc9s2NE4fOUsv5Jxbi2DR9MYjP3
         ZlR3eg7hk9eceu+r7djsaJUaESe4He4CgRmRT7Ds7f93W1RYcLNfewDQu+KSoK7juAOO
         P8LMOTBsMUEqQHWlfeb8pfK4oGmg0rKT7Nmjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747992240; x=1748597040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZJNTmOBPKYosd+xCBlKV6aSMJxN28zdgo/kHzmHxHA=;
        b=k3yS/sXQUSpFsLbn8DMYpLNgmJ6OkdzrSsNXktp2J7uI1OFsfXA3XfpoAXUhj2dM79
         ismijvF2Bfkb6VIw+IRjwgP6PHqsgrlgFFFY3c0BzV/H3KY/45/JuS4KDx7KZxSMDF8z
         2OExd/l4OWpLZtlPsfjCJDSXenam722E97qU6ZNzUswAAoKoE+f1niR/SVrX84lFN7zH
         gnBbUrt5iRwgrH2cqXgGYyMImn3fiNub7QMlOPi1kwWxtyf+dTdew0s59ZKAGdOMKZeT
         WP6uZxxZTGogL1HpNjEa92jMyvn6N7wr6mMqZQm8e5duJhY8AVwpw8U/eGTPJgMlaZOy
         viDQ==
X-Gm-Message-State: AOJu0YxsPh8Qb+r1g6fAMdCrfE4skSIxLXSWMkfDpYGltGOT83o9S/lx
	0IxzvEB8oHMrxMxoG24QsJK/FksOnS3s41XeuwHahPYJ6Y1qglX8H08bqNcJ5XeNexS/OFyqgfA
	yh4g4
X-Gm-Gg: ASbGncumasBf6g+8LiOw3RLD5Mh+Sh+whhei2zLwxyAFeiFa6aYmUGB9F/D0lKCFvVa
	lTIqsnH+guZeXioG7xM/noOrE6pTqRTeS/mNfi/k+8spgm/wCzsg6sJTN/vM4DWe/FCk5h3j+Hr
	D+bnobDoMWodB66luXFgWXykWAEapzRnKU8PKKP/vhXQ9c5iANjpRD4psbZXZOVJbuXLXrDBKgy
	B7u9umGng/FzZukPHmRxCsInXBoz+D7N5fV+hiaQroDFcR8ZXNlI39FQAmguHYNuW6C9LN2AH3+
	YS1Fo+ZROeiy/CJrgkAW7BHX5oRbPYxH2M2kJPTEk3tU6fbbN7Yct1/rv9NzthDQ/yeocDCv5HN
	wMeGPQ1398XrWH23NtbMMXBc8
X-Google-Smtp-Source: AGHT+IGWQQyFxCg8OVdmZSzMnxZAnpvNtcD2gChq/YGOm+N986cciKgVkG9Cy2HbQFiotccAMNUWOA==
X-Received: by 2002:a05:600c:4688:b0:442:f4a3:8c5c with SMTP id 5b1f17b1804b1-44b6d2cc4a9mr33037755e9.10.1747992239640;
        Fri, 23 May 2025 02:23:59 -0700 (PDT)
Date: Fri, 23 May 2025 11:23:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] iommu/amd: Remove dead non-atomic update checking
Message-ID: <aDA-rq89rWodAzvE@macbook.local>
References: <761f464ae56a449291e38724a1f823606f3ba9d0.1747924653.git.teddy.astie@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <761f464ae56a449291e38724a1f823606f3ba9d0.1747924653.git.teddy.astie@vates.tech>

On Thu, May 22, 2025 at 03:44:12PM +0000, Teddy Astie wrote:
> When updating a DTE, amd_iommu_setup_domain_device checks if the update had been
> non-atomic (i.e rc > 0) and eventually throws a warning but since [1], rc can
> no longer be positive, making this check never taken.
> 
> [1] x86/iommu: remove non-CX16 logic from DMA remapping
>     https://gitlab.com/xen-project/xen/-/commit/3fc44151d83d3d63320036bcf06634dfbebe1ff3

I would avoid putting links to commits, and just reference the commit
by hash:

"When updating a DTE, amd_iommu_setup_domain_device() would check if
the update had been non-atomic (i.e rc > 0) and throw a warning if
such non-atomic update could be dangerous.  However since commit
3fc44151d83d, rc can no longer be positive, making this branch
unreachable code.

No functional change intended."

> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>  xen/drivers/passthrough/amd/iommu_map.c     |  4 +---
>  xen/drivers/passthrough/amd/pci_amd_iommu.c | 18 ------------------
>  2 files changed, 1 insertion(+), 21 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
> index dde393645a..07f405ed63 100644
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -157,9 +157,7 @@ static void set_iommu_ptes_present(unsigned long pt_mfn,
>  /*
>   * This function returns
>   * - -errno for errors,
> - * - 0 for a successful update, atomic when necessary
> - * - 1 for a successful but non-atomic update, which may need to be warned
> - *   about by the caller.
> + * - 0 for a successful update

I think you can remove the comment completely.  Returning -errno or 0
is the expected behavior.  We just add those comments when functions
diverge from the classic -errno/0 return codes.

>   */
>  int amd_iommu_set_root_page_table(struct amd_iommu_dte *dte,
>                                    uint64_t root_ptr, uint16_t domain_id,
> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> index d00697edb3..409752ffc8 100644
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -225,24 +225,6 @@ static int __must_check amd_iommu_setup_domain_device(
>              spin_unlock_irqrestore(&iommu->lock, flags);
>              return rc;
>          }

You might want to also adjust the previous if condition (out of
context here) so it's if ( rc ) rather than rc < 0.

Thanks, Roger.

