Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E434A39B29
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 12:41:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891345.1300401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkLyS-00083b-1L; Tue, 18 Feb 2025 11:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891345.1300401; Tue, 18 Feb 2025 11:41:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkLyR-000827-T4; Tue, 18 Feb 2025 11:41:11 +0000
Received: by outflank-mailman (input) for mailman id 891345;
 Tue, 18 Feb 2025 11:41:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v6LV=VJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tkLyQ-00080n-Gz
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 11:41:10 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ddc0918-eded-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 12:41:08 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-220c92c857aso83476995ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 03:41:08 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fc13ac0d3bsm9784709a91.13.2025.02.18.03.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 03:41:06 -0800 (PST)
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
X-Inumbo-ID: 3ddc0918-eded-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739878866; x=1740483666; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=25wU3eP3nEpB42qGvd6KBr2K95NiQMSlBdqihxpD2MU=;
        b=Tyy8UfDwW3PV+5MVn9N/LccpfCBVMjgVshod0EnASca2/6qbc1uyUClTOx8EAGh7zv
         lHMA5P0cD/eC/JJ4muEtuNf1vzKVHk+2+9dHpwjI8GB6Nwzvpy2ZnXIclrUYnDwhznmK
         lDDenZ0wwrYq+DUJ3ahgbabuzNcJG0dZrqGV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739878866; x=1740483666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25wU3eP3nEpB42qGvd6KBr2K95NiQMSlBdqihxpD2MU=;
        b=sUVKBmAe+Z8m97fkvOhSJYwNAlzyTVNpEP/4CEnw7hw7U/r1UcRcVYrah/mKm3Hxvz
         mHCjhofEH1AYcrNls3ZyWiNPJA5C0u0ALySp6LPPuPLnE06bxdaS7CoLYceetCgsvNxq
         +PEJl/RMutlEQkYrWLmDVc6FabCozDKg8lqNjUsu7evDe2/cGk7Sshy+BlJfIN+jOtkS
         G73RBin9jKqltDAeF0BUyfLBD/kipTIX7dG35livin4TPxGsvXViy+dJbB7bHPnBvqNH
         12OHBjsLUtM/KH9nkkg5ZRbAArsfuFuyvxRSoUmNW3AsUa3dzeTlpBjQKkCDaCBjLQg6
         cDdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTeiljrfbon1NUWGH7q8chZYbHAOLgSiyFVudp7Vu2cwsmgN6Mb3tLDXCncjB/l4Mn8IqBEoS2wxs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzlLtHcRBnZfdRLjtv3a5PY06/lOjtlbX51pEL1B5wbRrO8xPiD
	NIi6R5Oyi3Q/FXMcLoyaKZyGIqP4C0LnJJ4lcAGIB/C9oW82X4U+2HbXvGFfIxQ=
X-Gm-Gg: ASbGncsjdIm0CafkiS6cNGKbetrv6mHy81Buw67IfU/TpXPevzfoigb4pwZW2Y7ssaW
	JQgDPLe6V+f3iqTlpxGeN4IAP2gvhnTeA+073pVzOCsF8NPAWBSSdbXXeP8g5HD5qv5pRiaXCj4
	ppH8FxFLR1mtDbT08o8HiWSZNMHrLJT6RNeAQsAtNV/fKSdl2JiFgOk54UKbTcXrWg8mzAS8IMT
	uoefWuLzIH47o5elete85eWYbnEb8QCbMD7KiX/DlAeL8UED3GuFyiUQopYAvB4ifL/N1AYhqNy
	TW/bDsHRJKHsx798A4J+
X-Google-Smtp-Source: AGHT+IG7ejpDraE/t+LVEdr+jSNyUxJWmaxruzcjHb5Obo+lum01aMga3Us4Ssa9B6hN+lfIvyFcZg==
X-Received: by 2002:a17:903:28f:b0:21f:7078:4074 with SMTP id d9443c01a7336-220d33c0eb6mr352239545ad.7.1739878866647;
        Tue, 18 Feb 2025 03:41:06 -0800 (PST)
Date: Tue, 18 Feb 2025 12:41:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Oleksandr Andrushchenko <andr2000@gmail.com>,
	xen-devel@lists.xenproject.org, sstabellini@kernel.org,
	Artem_Mygaiev@epam.com, jbeulich@suse.com, Luca.Fancellu@arm.com,
	marmarek@invisiblethingslab.com, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech
Subject: Re: [PATCH 0/2] code style exercise: Drivers folder samples
Message-ID: <Z7RxzdK9wJy5K_c4@macbook.local>
References: <20250216102108.2665222-1-andr2000@gmail.com>
 <6c25b6fb-989c-4788-9f3f-c2e309bec4ba@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6c25b6fb-989c-4788-9f3f-c2e309bec4ba@epam.com>

On Tue, Feb 18, 2025 at 11:56:48AM +0200, Grygorii Strashko wrote:
> Honestly, It looks a bit strange that Xen community is considering batch automated code formatting,
> For example Linux kernel cleanly rejected such approach.
> Linux kernel docs "4.1.1. Coding style" section [1].
> 
> Another thing, checking the new code and accepting code style violations (if any) on per-patch basis.

That would indeed be my preference, from what I've seen the
clang-format based style could live together with the previous style,
there doesn't seem to be any irreconcilable style differences that
would prevent new and old code chunks from being adjacent.

Thanks, Roger.

