Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC71CADCB5
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 17:57:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181027.1504115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSeY3-0005ZU-Dt; Mon, 08 Dec 2025 16:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181027.1504115; Mon, 08 Dec 2025 16:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSeY3-0005WH-Ah; Mon, 08 Dec 2025 16:57:19 +0000
Received: by outflank-mailman (input) for mailman id 1181027;
 Mon, 08 Dec 2025 16:57:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vSeY1-0005Vi-Cs
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 16:57:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vSeXy-0009hj-2a;
 Mon, 08 Dec 2025 16:57:15 +0000
Received: from [2a01:cb15:80df:da00:7079:39df:8b4d:ea79] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vSeXy-007eR4-2H;
 Mon, 08 Dec 2025 16:57:14 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=tyh7rUR1TZifH49DZZ/IvKJaatZDA4M+FIa7Um3V2aE=; b=FU8PtWB80aQttr45UUl69Nve4P
	hOBH7re/668cNwuU8RWx1WWL+HG+ZhC7TSsz8ctacHMZcHfB722vxmAu4ZLBEBjoe/8Mv2RuIc1an
	X24G0dtV9fpb6Sys5/AjV1eg5zoOyUMA4Kf/7xPCrhs1lU0+tF/YY/PJE0T/+xKvtTVU=;
Date: Mon, 8 Dec 2025 17:57:12 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
	dmukhin@ford.com
Subject: Re: [PATCH v1 0/2] tools/tests: test harness fragment
Message-ID: <aTcDaLfjHNQ410zM@l14>
References: <20251204123712.721443-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204123712.721443-1-dmukhin@ford.com>

On Thu, Dec 04, 2025 at 04:37:10AM -0800, dmukhin@xen.org wrote:
> This is a follow-on mini-series based on the original feedback in [1].
> 
> Patch 1 addresses the remaining feedback from [1].

You mean the feedback about the comment? I guess that's addressed by
removing the comment, there's just more unrelated changes in the patch.

> Patch 2 adds a new fragment for auto-generating test harness dependencies.

I feel like this second patch could be made useful, and easier to
review, if a second user of Tests.mk was added.

> [1] https://lore.kernel.org/xen-devel/aLmZLm2_G48yfPWR@l14/
> [2] CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2195624771
> 
> Denis Mukhin (2):
>   tests: fixup domid test harness dependencies
>   tests: introduce Tests.mk fragment
> 
>  tools/Tests.mk             | 34 ++++++++++++++++++++++++++++++++++

If this new file is useful, could you move it "tools/tests/"?

BTW, if we really want some generic test harness makefile, maybe looking
at what was done for "tools/libs/libs.mk" for example.

Cheers,

-- 
Anthony PERARD

