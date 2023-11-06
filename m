Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA467E188E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 03:20:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627722.978533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzpCi-0005RC-Gi; Mon, 06 Nov 2023 02:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627722.978533; Mon, 06 Nov 2023 02:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzpCi-0005Or-E0; Mon, 06 Nov 2023 02:19:04 +0000
Received: by outflank-mailman (input) for mailman id 627722;
 Mon, 06 Nov 2023 02:19:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4FDE=GT=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qzpCh-0005Ol-N2
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 02:19:03 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c73fdbb6-7c4a-11ee-98d9-6d05b1d4d9a1;
 Mon, 06 Nov 2023 03:18:31 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1cc1e1e74beso35972225ad.1
 for <xen-devel@lists.xenproject.org>; Sun, 05 Nov 2023 18:18:31 -0800 (PST)
Received: from leoy-huanghe.lan ([98.98.115.250])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a170902edca00b001ca4c7bee0csm4753128plk.232.2023.11.05.18.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 18:18:29 -0800 (PST)
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
X-Inumbo-ID: c73fdbb6-7c4a-11ee-98d9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699237110; x=1699841910; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kqf7rNi+WxXAZfOava1mzLsn0PzHha6DHlqJsLtusSA=;
        b=l111KO8BzyFvedQJ6X45H3F98Xnj6ITGtov6yW23v/g1uhcn6usvTuxkdYguvTrgK3
         ZVeiykhBUoupW5J84/w38by6R555PNsLvLaMzljIauKlDMMARDBO9W+plBfogyQ1kKuB
         QcP91HsFviUtnPOBdAq8ic690Loo9MbFAKK+Ls6TJn0sS+eP+4E2nO4sW/FQpOskJQwK
         020q8utYcBdEf+yGHZoHQ+rno+ns4+oVg0Su1iTlzBB1sJjBdMnRU0lhfKsk+UpCtWTO
         wRBLSknR7RNO+Og5Q84RiUpHGjvJ+CKC1vbxAk4GKXcNoac4OWwOS/Npto6y0YHB91++
         +I1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699237110; x=1699841910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqf7rNi+WxXAZfOava1mzLsn0PzHha6DHlqJsLtusSA=;
        b=fgfiHZLqrl01Gk9CSWeE7Mm2zzKgAILfOvPmLMYGAVhUIh6QJfp7arhgkXTZ1p+Ee1
         Pl6B8PbxwZUVIv7tI7+Qw9ebThmD/M4DQ0AUyiO3RN2wayky6csZkNVNcw8UhpgF8BVj
         cv/RpVRTeywXz0jyNcseectfIUM5XEpJeUk6TK0e4scaNdrHlhYZExQtUuA948JAxG8b
         Zfy995NKmeZWNRDzAjEqn7lhix13PHzxLIdw7qXwgr0luwSz4TN+NN0EykGssq0FCjMI
         zi8dtzHqABk9WlF3c6YYxB0Kh4ohWVrwTk6pxzV1vHoqdSnf2nLNsXAKhYRfPCMLwlJc
         GW7w==
X-Gm-Message-State: AOJu0YxBU5HP5lnyPuo3mXHJ8zQ4nYAvxI9y1GaegwaLQAcQ1CTVHPIO
	OvwZ9rgYS9M3PFW5XugKzk+u2H6wD0+EasG6Fq/QAA==
X-Google-Smtp-Source: AGHT+IGLjwE3IIdmC2ADiaVBwy4UibPPS8rUPW8nktlB6ncfb7mVhLrb0tCnNCYDhWjWQIDtk2iUEw==
X-Received: by 2002:a17:902:e2cc:b0:1c3:3b5c:1fbf with SMTP id l12-20020a170902e2cc00b001c33b5c1fbfmr25933284plc.10.1699237110252;
        Sun, 05 Nov 2023 18:18:30 -0800 (PST)
Date: Mon, 6 Nov 2023 10:18:25 +0800
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v4] xen/arm: Skip memory nodes if not enabled
Message-ID: <20231106021742.GA90848@leoy-huanghe.lan>
References: <20231013120442.1267488-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013120442.1267488-1-leo.yan@linaro.org>

Hi maintainers,

On Fri, Oct 13, 2023 at 08:04:42PM +0800, Leo Yan wrote:
> Currently, Xen doesn't check the status property of memory/reserved
> memory nodes, which may lead to the following issues:
> 
> - If a memory node has a status "disabled" it implies that it should
>   not be used. Xen does not handle the status property for the memory
>   node and ends up using it.
> 
> - If a reserved memory node has a status "disabled", it means that this
>   region is no longer reserved and can be used, but the "disabled"
>   status is not handled by Xen.
> 
>   Xen passes the intact device tree binding of the reserved memory nodes
>   to Dom0 and creates a memory node to cover reserved regions. Disabled
>   reserved memory nodes are ignored by the Dom0 Linux kernel, thus the
>   Dom0 Linux kernel will continue to allocate pages from such a region.
> 
>   On the other hand, since the disabled status is not handled by Xen,
>   the disabled reserved memory regions are excluded from the page
>   management in Xen which results in Xen being unable to obtain the
>   corresponding MFN, in the end, Xen reports error like:
> 
>   (XEN) arch/arm/p2m.c:2202: d0v0: Failing to acquire the MFN 0x1a02dc
> 
> This patch introduces a function device_tree_node_is_available(). If it
> detects a memory node is not enabled, Xen will not add the memory region
> into the memory lists. In the end, this avoids to generate the memory
> node for the disabled memory regions sent to the kernel and the kernel
> cannot use the disabled memory nodes any longer.
> 
> Since this patch adds checking device node's status in the
> device_tree_get_meminfo() function, except it checks for memory nodes
> and reserved memory nodes, it also supports status for static memory
> and static heap.
> 
> Suggested-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Gentle ping.

I don't see this patch is landed in Xen master or staging branch, should
anything I need to follow up?

Thanks,
Leo

