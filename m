Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E020CB9681C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 17:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128485.1468826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v14gA-0002dl-Vb; Tue, 23 Sep 2025 15:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128485.1468826; Tue, 23 Sep 2025 15:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v14gA-0002be-SF; Tue, 23 Sep 2025 15:11:42 +0000
Received: by outflank-mailman (input) for mailman id 1128485;
 Tue, 23 Sep 2025 15:11:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QOel=4C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v14g9-0002bY-4X
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 15:11:41 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b28d063-988f-11f0-9d14-b5c5bf9af7f9;
 Tue, 23 Sep 2025 17:11:40 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3fc36b99e92so1560705f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Sep 2025 08:11:40 -0700 (PDT)
Received: from [172.20.5.108] ([50.239.116.157])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269802df8aesm166193195ad.89.2025.09.23.08.11.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 08:11:38 -0700 (PDT)
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
X-Inumbo-ID: 9b28d063-988f-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758640299; x=1759245099; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eGQ9guI+tCSuiyQKmyajSqUi/6qy2GdsmB01BXZmrs0=;
        b=T8Hy7Zqax/0j1diZKt2QhLDSHiaPdBl6fkPR3KmmiHqGJ4maZMeqjRZbkd0MH7k9qs
         oyfeiaIkSp2zn/VlBmks7A0sP8te18bDVwx1DrRtmesg2RKzD7oktJd0oPFZzCDmV6Zj
         LsE6zNENnY/keTYvLQw0yNjS014ViMbSyZYyUW4TiNVC72xPrAqbxsSt8qxoV0FWtlfK
         18PZirmlpO1nV22idaj5VjG+ND8qo7r9mpH+WGuwzlZk32o3bxdoBxybDTU16yBcQ6ZU
         yJXc1ueFVKakASnfVC6VRmgVlAQ+j6xbZ6rUkv5mLAcVEuTETdGYQf1UgHN23k3Ar5mq
         2/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758640299; x=1759245099;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGQ9guI+tCSuiyQKmyajSqUi/6qy2GdsmB01BXZmrs0=;
        b=ITMbvibohXdNL5LC0zwMc3G96qXF5cP4nR+zqvSSAU63hPkA228//i4vddU+GpEvxY
         cOjMvLUQi/st16Y7GPrs/lHI2zlprPOwrg+et0gDkCxD/I0GpODfFQ9CGKgfoTNdUvE6
         RGSCylrSJ7WGzVT+dYRZKOxfXcIq4dSVKRvXpUQEET9AZ2VrzJ8rsFa9dFTIhiR82BAL
         sh6QwpvwmTIt4GfYQ5SHYiOCz3ldgk+CiResoW4PvtqRoYHOOm98cmfmvt0D88F7hIzV
         jSkQSRyFHoqPrs/PAscJp6caZlNRnCIeEt626PyYiwZ+AsTbErsy9hbQ0jDsxancr4nf
         0Qdg==
X-Forwarded-Encrypted: i=1; AJvYcCVL8XSBUrqEzVVAIxH+7ksFabYQ57JwDAl7+IXLO+dZ9av/dkumTJQxhYps7WuTC/R3fomJ12t7Dnw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAl3W9tytOKu9ZbnJXmwkqcmeqRn6CiQs8rI3B1T0n0p1B2mb3
	GGeiFGHg+nKp+DEQMmjeroBJhW11kJ2a0JXpQXQjQMNJ7hnH3cyx2ePCuD0VycG+JA==
X-Gm-Gg: ASbGncvButVgs5e9QwY6RDk8aYxLxts7LeZn0b+OKYQhzD01QDwLzp5/+DSLMjUBnu6
	3voE/bxOd7JO70xxGwJ2UqjzGgrFN9tKvjgSLIEz3XtT7wu7vv5vLUCygzO6YU0eFA4RCTQfy0Z
	URPvMlUBpbX5DFSlMJsBkJUXtWDWVCOdliMlXvgBtRruF/ipsUDGbgknR+8/bWxxCtUUw0KtH9H
	Sw0QePluffEAiCstImHMQkQJLcm7hq/Dmy7S1XxNg+mJ4oN+p/k9rl+ug0cnX0pvc25dnohCdo5
	gnep8xtpxIwMb9VmsZwSSlU9LBZeviZPpH9wPQe6tz/PNdTxUJBuOibZcbXm3d3fWJyuKufEFj/
	3H7HasxIpA97FCwPRvs4ohoEoAcwe5+1RVtXWDB2twzI=
X-Google-Smtp-Source: AGHT+IFw6K0qAM9XWVpoD8l/82NEoEfQqly5si5XlSkUN4OVx3dF3tFosl5G7b6PRrAX+OxYtmvpCA==
X-Received: by 2002:a05:6000:2485:b0:3ec:db88:bf1 with SMTP id ffacd0b85a97d-405cb2f125cmr3121567f8f.12.1758640299470;
        Tue, 23 Sep 2025 08:11:39 -0700 (PDT)
Message-ID: <5badf139-1c53-4573-821f-20c343de449f@suse.com>
Date: Tue, 23 Sep 2025 17:11:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/8] tools/cpufreq: extract CPPC para from cpufreq
 para
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250923043826.3831957-1-Penny.Zheng@amd.com>
 <20250923043826.3831957-6-Penny.Zheng@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250923043826.3831957-6-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.09.2025 06:38, Penny Zheng wrote:
> We extract cppc info from "struct xen_get_cpufreq_para", where it acts as
> a member of union, and share the space with governor info.
> However, it may fail in amd-cppc passive mode, in which governor info and
> CPPC info could co-exist, and both need to be printed together via xenpm tool.
> If we tried to still put it in "struct xen_get_cpufreq_para" (e.g. just move
> out of union), "struct xen_get_cpufreq_para" will enlarge too much to further
> make xen_sysctl.u exceed 128 bytes.
> 
> So we introduce a new sub-field GET_CPUFREQ_CPPC to dedicatedly acquire
> CPPC-related para, and make get-cpufreq-para invoke GET_CPUFREQ_CPPC
> if available.
> New helpers print_cppc_para() and get_cpufreq_cppc() are introduced to
> extract CPPC-related parameters process from cpufreq para.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com> # hypervisor
> Acked-by: Anthony PERARD <anthony.perard@vates.tech>
> ---
> v4 -> v5:
> - new commit
> ---
> v5 -> v6:
> - remove the changes for get-cpufreq-para
> ---
> v6 -> v7:
> - make get-cpufreq-para invoke GET_CPUFREQ_CPPC
> ---
> v7 -> v8:
> - use structure assignment as it is a alias
> - add errno info to the error print
> ---
> v9 -> v10
> - drop the outer union

In the interest of getting this series in I think we will want to take
this patch as is (I yet have to see the other, related patch though),
but ...

> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -478,22 +478,19 @@ struct xen_get_cpufreq_para {
>      uint32_t cpuinfo_cur_freq;
>      uint32_t cpuinfo_max_freq;
>      uint32_t cpuinfo_min_freq;
> -    union {
> -        struct {
> -            uint32_t scaling_cur_freq;
> -
> -            char scaling_governor[CPUFREQ_NAME_LEN];
> -            uint32_t scaling_max_freq;
> -            uint32_t scaling_min_freq;
> -
> -            /* for specific governor */
> -            union {
> -                struct  xen_userspace userspace;
> -                struct  xen_ondemand ondemand;
> -            } u;
> -        } s;
> -        struct xen_get_cppc_para cppc_para;
> -    } u;
> +    struct {
> +        uint32_t scaling_cur_freq;
> +
> +        char scaling_governor[CPUFREQ_NAME_LEN];
> +        uint32_t scaling_max_freq;
> +        uint32_t scaling_min_freq;
> +
> +        /* for specific governor */
> +        union {
> +            struct  xen_userspace userspace;
> +            struct  xen_ondemand ondemand;
> +        } u;
> +    } s;

... I don't quite see why we'd need to retain the nested struct now
either. Imo we ought to be cleaning this up for 4.22.

Jan

