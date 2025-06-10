Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD568AD3DE9
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 17:51:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011084.1389395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP1G5-0005TY-7w; Tue, 10 Jun 2025 15:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011084.1389395; Tue, 10 Jun 2025 15:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP1G5-0005R5-4t; Tue, 10 Jun 2025 15:51:29 +0000
Received: by outflank-mailman (input) for mailman id 1011084;
 Tue, 10 Jun 2025 15:51:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HnHp=YZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uP1G4-0005Qz-3m
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 15:51:28 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c39d8c2d-4612-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 17:51:25 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-450cf214200so52416935e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 08:51:25 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4521375a392sm143260235e9.36.2025.06.10.08.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 08:51:24 -0700 (PDT)
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
X-Inumbo-ID: c39d8c2d-4612-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749570685; x=1750175485; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G2r4MTM5pRk3wWbzXUGSI1FwuXdTy/sRwKyqcokCv08=;
        b=qj6fCV7Lbnwa5DqZmQLw+w5TvLv735PTRafrpvHl/CFHhW+or9NXh2w+mNzkzFMaaY
         mZ6oyNCFDKbuVxfFhOA/Jte7BQls0WCOOPlSWSh3VdSv7xYanu3sDE3T7ampyFR6tQlq
         hhMLTXdWeAZ9byugVQ1v7Y7gQ7Oodgz8IzG2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749570685; x=1750175485;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G2r4MTM5pRk3wWbzXUGSI1FwuXdTy/sRwKyqcokCv08=;
        b=feWPJaSxAfokhjWtM9aE/z4Hq/Hd2pTeMyusZqgROvF4AgL2HCou3+j+kC09iU9Wzu
         0kCJEqVePavv3+AU5TiFSKLEDBLOX609AL0+FKsX6Qo9wExoisO5PzEG14R9i/ZwOW+r
         wZinDdfGH1XEPy/0a1F7KRD4H4IpFIA1JdE7CfZhLGTSqGQRwNxV8PJDtOSBtR7wJfF2
         6mEWD1mbi4DvG+yLMqQj2u+vFVb+bnNzAAGUMNctkq1bChmf/rk0cPoZqvIBGSOzrIcF
         Ww6eVbrOpEOqmSsUSzr7unKpx2K7cNy/Co6vo1EWRMHLu+dI8/QRRj9f5/lhsfrOCn2B
         5Utg==
X-Gm-Message-State: AOJu0Yx99b/d3F2D0mzVOU1y7I9BmGl8FPfUoPRC829NiRFSlyF6hB35
	awI75kbHISaHtLykieIIRGHZrpzndNY3JUkyi8klfv1Y9K5TYCKzDMyCBdHa+Zvy4k0=
X-Gm-Gg: ASbGncuqpDEO7iX5B+Iw0nNjH8+9EJAQ54q4rFgyn9ZBiTz1bWudsclWFbHNL0h5AwF
	kYpjCHjIW0DEHAGF2uAm/P8BJKwmPkRINzHUek6XlaUvDfuT1IxZakxMZ53A7R/HxNSzoyJqCMI
	Y/Psez2Athdpi/e14Xms+6Mc76g7KROfh9wWF7tqfYfr+1PAsSTfln84quyToMPE4i7i9lskYkz
	REVlG/TvIcKHlmBjeMJ79oUXigdPE2OsV2VXkENPNHwf0OBECnS4x5Z9YBk/Tc+oPHnyuM9YN7J
	IdwESGNE7d6+gDh/ugM1WGXCZZHGdsVRgILbu7w96s7J+bef4mvRmsTM/BN1wN//GI7EQfeHpg1
	PysbBz6/rRo1QvuyHkBnGSx3qdjTZWknF4p/RHzWW957j0w==
X-Google-Smtp-Source: AGHT+IEKRGlRhSPlRuLKGklu50cZbQKqbxkqwGvNGoRPr7o3Mkx/QYLUsLDWdIXGKib1o6rfegz7Ug==
X-Received: by 2002:a05:600c:3b0e:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-4520147f41emr166549335e9.18.1749570684877;
        Tue, 10 Jun 2025 08:51:24 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:51:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: fix build with HAS_PCI
Message-ID: <aEhUe30Hojo8CoeP@macbook.local>
References: <20250610142300.197599-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610142300.197599-1-stewart.hildebrand@amd.com>

On Tue, Jun 10, 2025 at 10:22:57AM -0400, Stewart Hildebrand wrote:
> In file included from ./include/xen/pci.h:72,
>                  from drivers/pci/pci.c:8:
> ./arch/arm/include/asm/pci.h:131:50: error: ‘struct rangeset’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>   131 | static inline int pci_sanitize_bar_memory(struct rangeset *r)
>       |                                                  ^~~~~~~~
> cc1: all warnings being treated as errors
> 
> Fixes: 4acab25a9300 ("x86/vpci: fix handling of BAR overlaps with non-hole regions")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Sorry, it was my fault.

Would it make sense to introduce a Gitlab build that has HAS_PCI
enabled?  Or it won't build either without extra patches?

Thanks, Roger.

