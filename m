Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B128C2B5C
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 23:00:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720046.1122980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5XKm-00043K-3V; Fri, 10 May 2024 20:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720046.1122980; Fri, 10 May 2024 20:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5XKl-00040x-W6; Fri, 10 May 2024 20:59:15 +0000
Received: by outflank-mailman (input) for mailman id 720046;
 Fri, 10 May 2024 20:59:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s5XKk-00040r-Vn
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 20:59:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5XKk-0006dm-3K; Fri, 10 May 2024 20:59:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5XKj-0007u2-Qx; Fri, 10 May 2024 20:59:13 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=DqBTFidJT/35FJRBdx2zdosdhl55KUQFS99G2blc5WY=; b=r6eAUzTucXye3FtYeeqwwUkRN7
	DrXCus8xZekIHjL4UErTRk/yywWfiwDZMBfFGC9tiECEsKbig+h8pi7y+9paacdUrQ5TWPS9FAfNa
	PV4weSCv574d/yNw5QVt3TNca6jWDLqnWHtjnd8cDjd/LLZWNy+SvkUK+Myo06k2XMq8=;
Message-ID: <d659e73f-762a-48c9-8936-94bbc771218c@xen.org>
Date: Fri, 10 May 2024 21:59:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] arm/mem_access: add conditional build of
 mem_access.c
Content-Language: en-GB
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <b3f03c4f5a78b86b01750f10bb0cebcdb2fd35cc.1715265720.git.alessandro.zucchelli@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b3f03c4f5a78b86b01750f10bb0cebcdb2fd35cc.1715265720.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/05/2024 13:32, Alessandro Zucchelli wrote:
> In order to comply to MISRA C:2012 Rule 8.4 for ARM the following
> changes are done:
> revert preprocessor conditional changes to xen/mem_access.h which
> had it build unconditionally, add conditional build for xen/mem_access.c

I am afraid, I don't understand this one as you don't seem to modify 
xen/mem_access.h. Is this meant to be part of the changelog?

You also don't seem to mention the change in Makefile. This is the one I 
was asking for in the previous version. So what about:

"xen/arm: mem_access: Conditionally compile mem_access.c

Commit 634cfc8beb ("Make MEM_ACCESS configurable") intended to make 
MEM_ACCESS configurable on Arm to reduce the code size when the user 
doesn't need it.

However, this didn't cover the arch specific code. None of the code in 
arm/mem_access.c is necessary when MEM_ACCESS=n, so it can be compiled 
out. This will require to provide some stub for functions called by the 
common code.

This is also fixing violation of the MISRA C:2012 Rule 8.4 reported by 
ECLAIR.
"

The patch itself loks good so once we agree on the commit message, then 
I am happy to update it on commit.

Cheers,

-- 
Julien Grall

