Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0CFABCECF
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 07:54:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990424.1374367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHFvH-0000Ai-Ph; Tue, 20 May 2025 05:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990424.1374367; Tue, 20 May 2025 05:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHFvH-00007K-N1; Tue, 20 May 2025 05:53:55 +0000
Received: by outflank-mailman (input) for mailman id 990424;
 Tue, 20 May 2025 05:53:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHFvG-00007E-Lq
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 05:53:54 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf8cc990-353e-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 07:53:53 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-601fb2b7884so2244964a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 22:53:53 -0700 (PDT)
Received: from [10.1.250.198] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005a6e3ca0sm6866877a12.42.2025.05.19.22.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 22:53:52 -0700 (PDT)
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
X-Inumbo-ID: cf8cc990-353e-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747720433; x=1748325233; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PMYEZev2uqmCun+CImMtT9WPp/EgThbcBu50Mxy6KuE=;
        b=XECNfkKQK1mN6Dm87jjgerUubAHSHnAyA9OLX5Tm2C7XE2Gb/a0cly3PE95hNiYiX7
         9UTmi3Em7sG8kILElFozPXwzN8efmaaFttTUl0IsQ6A/4zebAe+CB3pnAwvSX3UVKOXs
         8pExvy09vmqP7kJWYILTrB63xw/p4d6FvWVlRn6sH9CCkzBIlEvagNQdHmtI+WamDdgt
         Iry1Y4gkdWtogip33lYFKUrs6MFGOvuXyEXq9+rxDPo3jr6X1ImkJj/tqFCxfMmuDosP
         PMrM1KVRhE08+Ogpua8A9Dj/z4xb2a4qqigNfalA1VWReG1pzNrGYw8FIoyVR96GqV7o
         BrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747720433; x=1748325233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PMYEZev2uqmCun+CImMtT9WPp/EgThbcBu50Mxy6KuE=;
        b=FK+ZayE5urmShxdQAGLZVdyWJL8yur3Ik0vSApmU1T7mPvzedIljaAwX+APQ9ddQ4e
         VQDwwy49bchhgE5M0AHJ761c4Li8QpmdvQeqdr82kDwzjqaj1J1AskvQvn1z54IxqjIm
         gTfw2FI5bupxxfwVIx0YM+sDn3thTWHDfb5IDe3HjJK1xO8n3GQwF3/Cga+d86NuwUmo
         EC+gAfvbXvbkxRxRkWAdi72k8VSmt85V4vzN61SVYewaZgmJTYKSLfD2GnHbyiHuKblq
         EKVz4+/Ank663Uke2valwmsG3W8zKulYSPnzUgoJxQiojuBuoUS80vI9DytrkH/dXqem
         u1Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVJaEWQQXm70By30/0/Pu76fC+7Dd4ExeM8j08IVA7wE3HDa5Zpza6eSVpsJ7zLu1Aw3dlisSVVZUc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywh2Viz5Ujyz3xRWYe4Gq5PTctQBXjkN4B/gGy1D+/LefuYiePw
	HMX+Agc/t4PRfxOJw2tPiUTWEu3TerjBqthme79o9GYOvza7txS8sD+nrNm+mwik8A==
X-Gm-Gg: ASbGncs5PK9g0DYlKhnocuQWE48BfMVGUq/N50R+a10AjuI3Jt2bdQoIKcajS7kLqS4
	Fzk7cn0OggNX/9kH1I51+5jOxRsu6AMxDux048H4T5Y4SKljJlUnLmWUfCyxuq1Xg788ykw7iez
	IifCapxzmpPPzJrXE5dr+Hh3PWRhDucr0VCpLBJ9f1fkHofJlLroLSxdTJyNdrjhcAF2Kz4qYea
	Uf8x+B1kk1/NHRD90OBEDvB2uYWOOxg/EgzX//6o3MAyebESwFGDQnXcI09QmeFDG0leLdSdDb/
	Q0DbGYEc8I0Hj9jCA7cDpeF0VEpW94glltuvWdEZ9+ZL1JYnvV2zFhIMBfQGnvX2Idm9YSf6
X-Google-Smtp-Source: AGHT+IF100UZdYHREK4A/KGabhrOYo/M6Yc49kVlj/LovL3UryUpWEqcp5Hl5M/hzce+RWm+Mvd7yw==
X-Received: by 2002:a05:6402:1ecc:b0:602:15f:5883 with SMTP id 4fb4d7f45d1cf-602015f5946mr2574730a12.9.1747720433191;
        Mon, 19 May 2025 22:53:53 -0700 (PDT)
Message-ID: <d496c174-5403-49f4-ae1b-63a8d2a1f23f@suse.com>
Date: Tue, 20 May 2025 07:53:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] xen/domain: unify domain ID allocation
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250519192306.1364471-1-dmukhin@ford.com>
 <20250519192306.1364471-2-dmukhin@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250519192306.1364471-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.05.2025 21:23, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Currently, hypervisor code has two different non-system domain ID allocation
> implementations:
> 
>   (a) Sequential IDs allocation in dom0less Arm code based on max_init_domid;
> 
>   (b) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not use
>       max_init_domid (both Arm and x86).
> 
> It makes sense to have a common helper code for such task across architectures
> (Arm and x86) and between dom0less / toolstack domU allocation.
> 
> Wrap the domain ID allocation as an arch-independent function domid_alloc() in
> common/domain.c based on the bitmap.
> 
> Allocation algorithm:
> - If an explicit domain ID is provided, verify its availability and use it if
>   ID is not used;
> - If DOMID_INVALID is provided, perform an exhaustive search within
>   [0..CONFIG_MAX_DOMID-1] range, starting from the last used domain ID.

CONFIG_MAX_DOMID first appears in patch 3 afaics, and hence doesn't want
mentioning here, yet. That patch,for eample, may never make it into the
tree (and thus the description here may be confusing to future readers).

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -66,6 +66,12 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
>  static struct domain *domain_hash[DOMAIN_HASH_SIZE];
>  struct domain *domain_list;
>  
> +/* Non-system domain ID allocator. */
> +#define CONFIG_MAX_DOMID DOMID_FIRST_RESERVED

Oh, wait - you're actually introducing such an identifier. Please don't.
It's bad enough that we still have a few CONFIG_* left which aren't
Kconfig-controlled. We don't want any new ones.

Jan

