Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C274A32561
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 12:50:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886382.1296048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiBGR-000399-SU; Wed, 12 Feb 2025 11:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886382.1296048; Wed, 12 Feb 2025 11:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiBGR-00037I-P4; Wed, 12 Feb 2025 11:50:47 +0000
Received: by outflank-mailman (input) for mailman id 886382;
 Wed, 12 Feb 2025 11:50:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p9NR=VD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tiBGQ-00037A-HT
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 11:50:46 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98023557-e937-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 12:50:45 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4395561ab71so17766455e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 03:50:45 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b8868sm17394985e9.39.2025.02.12.03.50.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 03:50:44 -0800 (PST)
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
X-Inumbo-ID: 98023557-e937-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739361045; x=1739965845; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gn2HuIjCHUkdNPT29WH4Pj9OMIPYQG2aMe7ANrbLrfo=;
        b=spXKVlf3vz1lcJhdsfhTYiWtN01AtT9sQcYK1L0AnUS5AiwOVOBHcnuoLZsJmrUULO
         Rom1nk9qbq5amZWmmFpqm8KnU665HumjmaqSojgK3Q3wNrFjgZpNfzIPZ/FWnYi8UbYh
         J0ZJGqZOHIwiTrURrTX2pC9g70xO/4vtdwV7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739361045; x=1739965845;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gn2HuIjCHUkdNPT29WH4Pj9OMIPYQG2aMe7ANrbLrfo=;
        b=GUMEOBTMsDS80JCZslzLz0gz6j+p66jJ2rhNrVJbQ5YlCwW6U6ghQpVwLGqZCaHb/X
         OyILwsZOOv6FNF69RbL7YWf6yJDpCDkvmbXh6SiW+DhmlqNTnybMDx/HnLD9RBgkRjnk
         jFfZS7s5BADPxPOsjouQuuMJCUVckjM1+cdfcDPrAXbDrckU3A6GkVj0vnCr3K2QzLTi
         +fr+Bffk3rQNjM6kpwyOrEYlx6CHt3tQ3WbCHynAsxMAK/js7CFmQPMi204oEy3YDDga
         En8oQoFNvmhmtt6876+XnYdJtjMZdweUb3liM2JEuXs/3TUzqzKo2uQ1LfAo+8X1yKvn
         3eUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKJuP2+c6ano4qITdJdC0vMqYoGqDOMufA3yWREIhYBvmpSp/9zcTH0lMcVcZqNzimuLdUdGV0IPo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGhZqkHgEwJXbcSJrCAuUD5K0OVAMcxlfqsqm8VjsXS71T7rQH
	3E2Y3y84NmcFm9aQtyNC9roEpdDwSiiiiipARuZZyjIFfcGkpFzqispUqLDbF7M=
X-Gm-Gg: ASbGncsmsJLyG8+o5JysepDkyqprVLidCZFYb273rKbn+LGfe89GXIaRxtVWhzl+nKD
	2NVoER0AFKpoaUhyNOi23Dymd63adXIloeuPSXVHWqjyKcPRKyCozVDEPEKA0RzNRqGgWJw2tRL
	AXF9k7C5PCMVzFs9iDilNlh+/TJKSlrNE+YNZx4+HcBTlmmwiC4QPUSe8UzNiT+Pivi+dOpOHMp
	+8r8uQMv6mCpwrekA2/0MaGduEQU0iQnLIWPXiVwivn7Dje/994d89gbLc7kMS8tjFTbMVW6cE1
	nCYvzniA1gGN7PNKGylQcBVWN+5jO6l2NruDtPmjIBL8yHntUSmZG48=
X-Google-Smtp-Source: AGHT+IE+qx7FmTbpUkebzKiwD/FMIW/flUdComwIo6D/mwSodR8HrOvjc1TcXgxv54Hq8rzDiPOR1w==
X-Received: by 2002:a05:600c:510c:b0:439:48f6:dd6e with SMTP id 5b1f17b1804b1-439581be2demr26064995e9.19.1739361045033;
        Wed, 12 Feb 2025 03:50:45 -0800 (PST)
Message-ID: <c97cb922-733c-4afb-ac0f-6223ace5b956@citrix.com>
Date: Wed, 12 Feb 2025 11:50:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250212091900.1515563-1-luca.fancellu@arm.com>
 <20250212091900.1515563-2-luca.fancellu@arm.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250212091900.1515563-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2025 9:18 am, Luca Fancellu wrote:
> When Xen is built without HAS_PASSTHROUGH, there are some parts
> in arm and x86 where iommu_* functions are called in the codebase,
> but their implementation is under xen/drivers/passthrough that is
> not built.
>
> So provide some stub for these functions in order to build Xen
> when !HAS_PASSTHROUGH, which is the case for example on systems
> with MPU support.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/include/asm/grant_table.h |  8 ++++++
>  xen/include/xen/iommu.h                | 40 +++++++++++++++++++++++---
>  2 files changed, 44 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
> index d3c518a926b9..e21634b752df 100644
> --- a/xen/arch/arm/include/asm/grant_table.h
> +++ b/xen/arch/arm/include/asm/grant_table.h
> @@ -73,9 +73,17 @@ int replace_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
>  #define gnttab_status_gfn(d, t, i)                                       \
>      page_get_xenheap_gfn(gnttab_status_page(t, i))
>  
> +#ifdef CONFIG_HAS_PASSTHROUGH
> +
>  #define gnttab_need_iommu_mapping(d)                    \
>      (is_domain_direct_mapped(d) && is_iommu_enabled(d))
>  
> +#else
> +
> +#define gnttab_need_iommu_mapping(d) (false)

This doesn't evaluate d, which can lead to other build problems.

Instead of providing two, you should insert
"IS_ENABLED(CONFIG_HAS_PASSTHROUGH) &&" into the existing
gnttab_need_iommu_mapping().

The same applies to several other hunks too.

~Andrew

