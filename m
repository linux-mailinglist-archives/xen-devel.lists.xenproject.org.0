Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8418840B64
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 17:29:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673036.1047159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUUVJ-0000nB-Sr; Mon, 29 Jan 2024 16:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673036.1047159; Mon, 29 Jan 2024 16:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUUVJ-0000lc-QC; Mon, 29 Jan 2024 16:29:01 +0000
Received: by outflank-mailman (input) for mailman id 673036;
 Mon, 29 Jan 2024 16:29:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9VRI=JH=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1rUUVI-0000lV-SZ
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 16:29:00 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 817c2f60-bec3-11ee-8a43-1f161083a0e0;
 Mon, 29 Jan 2024 17:28:59 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e76626170so35846395e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 08:28:59 -0800 (PST)
Received: from [192.168.13.31] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a05600c354500b0040efb8f7158sm1368762wmq.15.2024.01.29.08.28.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jan 2024 08:28:58 -0800 (PST)
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
X-Inumbo-ID: 817c2f60-bec3-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706545739; x=1707150539; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7l/dgTp2dpCjszrxBKlVP0qaxr76ydhBy5FlppTxtSo=;
        b=DQWsvAM1btXQ5CTRKAwOsE0Tg68WVcUpvyTp3WMcYlXOpIlp6xx0QcrKokuSRHTQDU
         qyRnJwZhiL8qLgg+86CfkC2I/pRljiE5+mBA/JWWS588K0IRhD8gfhihAyOc5JGkVeNF
         ta4LGvEvYaBIx7SZ+JGobH94cIrbjbUB6EtqV167aVBgYy15tyScrICCvqcHbC089txy
         gzS7jbfcebBaLF0g3BgGXgVGo7PRkDVHqVtZIN+yUlZWumNvV/a3b4Zi1xs5aHeDrRU3
         CPXO+WDYJwMsXeAL5lrtwhZCeLqy+5V78xeoGH2WdFZckhOebq6u4YqgzrarChN+ogoi
         BwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706545739; x=1707150539;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7l/dgTp2dpCjszrxBKlVP0qaxr76ydhBy5FlppTxtSo=;
        b=IMeBUWoB7phYkuGbmP3BY6jt+ysCVkyWLPoTbq3ZLwEbZmBMpYlp2writIBhszHNtk
         9y+93wu3smXYVwXthcA++vNxqDODgGGMBQ9FppebluSz3dpaeaiBzATZi+efUE+J5AkO
         AYDAgSJPdpm3gRJ+SGOpOcxQKU+DTY655wgKrY4bQrqel3MCrBQN9ViRncr9HGjeV7XT
         zrHjvApqNn1OpJXSc8AKbEMzMxepgTLFmGh36LSfOeMCaJJdeCGP7Od4H1YzMUf254wZ
         08hYdeP+mtFlds0IJl8llmY7Q3+Mv/mWJL7wWmeXarGiTkkyxRcS5WzywNiuN82KVz2v
         Pi4w==
X-Gm-Message-State: AOJu0Yyy59tgcx9IeCZM2L0P3J8HeVm0jobsbuKbiWWeA0wj7IPQexdb
	5JuV0Q6oE63FCqWPYtq6xY9gGFrV6drM1E7XbJH0Wig/WONFUh36
X-Google-Smtp-Source: AGHT+IG3GgXZB3egKDxLl+WFU1d25cmgYKED43k13u+hgWBh9Cpa5v4U2lxr9qvpcWpLjBFjGQ+2DA==
X-Received: by 2002:a05:600c:3787:b0:40e:6193:b1a5 with SMTP id o7-20020a05600c378700b0040e6193b1a5mr5566533wmr.39.1706545739079;
        Mon, 29 Jan 2024 08:28:59 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <db8cc8b2-79d8-47eb-a7d8-5d0a928ce47b@xen.org>
Date: Mon, 29 Jan 2024 16:28:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v5 2/3] x86/iommu: switch hwdom IOMMU to use a rangeset
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>
References: <20240124172953.29814-1-roger.pau@citrix.com>
 <20240124172953.29814-3-roger.pau@citrix.com>
Organization: Xen Project
In-Reply-To: <20240124172953.29814-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/01/2024 17:29, Roger Pau Monne wrote:
> The current loop that iterates from 0 to the maximum RAM address in order to
> setup the IOMMU mappings is highly inefficient, and it will get worse as the
> amount of RAM increases.  It's also not accounting for any reserved regions
> past the last RAM address.
> 
> Instead of iterating over memory addresses, iterate over the memory map regions
> and use a rangeset in order to keep track of which ranges need to be identity
> mapped in the hardware domain physical address space.
> 
> On an AMD EPYC 7452 with 512GiB of RAM, the time to execute
> arch_iommu_hwdom_init() in nanoseconds is:
> 
> x old
> + new
>      N           Min           Max        Median           Avg        Stddev
> x   5 2.2364154e+10  2.338244e+10 2.2474685e+10 2.2622409e+10 4.2949869e+08
> +   5       1025012       1033036       1026188     1028276.2     3623.1194
> Difference at 95.0% confidence
>          -2.26214e+10 +/- 4.42931e+08
>          -99.9955% +/- 9.05152e-05%
>          (Student's t, pooled s = 3.03701e+08)
> 
> Execution time of arch_iommu_hwdom_init() goes down from ~22s to ~0.001s.
> 
> Note there's a change for HVM domains (ie: PVH dom0) that get switched to
> create the p2m mappings using map_mmio_regions() instead of
> p2m_add_identity_entry(), so that ranges can be mapped with a single function
> call if possible.  Note that the interface of map_mmio_regions() doesn't
> allow creating read-only mappings, but so far there are no such mappings
> created for PVH dom0 in arch_iommu_hwdom_init().
> 
> No change intended in the resulting mappings that a hardware domain gets.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v4:
>   - Add default case to handle ACPI and NVS regions (which are not mapped)
>     unless in the low 4GB and when inclusive mode is set.
>   - Add changelog entry.
>   - Dropped Jans RB.
> 
> Changes since v3:
>   - Remove unnecessary line wraps.
> 
> Changes since v2:
>   - Simplify a bit the logic related to inclusive option, at the cost of making
>     some no-op calls on some cases.
> 
> Changes since v1:
>   - Split from bigger patch.
>   - Remove unneeded default case.
> 
> x86/iommu: add CHANGELOG entry for hwdom setup time improvements
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>


