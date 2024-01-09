Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1CD82890B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 16:32:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664694.1034779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNE59-00077L-2b; Tue, 09 Jan 2024 15:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664694.1034779; Tue, 09 Jan 2024 15:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNE58-00075o-WA; Tue, 09 Jan 2024 15:31:58 +0000
Received: by outflank-mailman (input) for mailman id 664694;
 Tue, 09 Jan 2024 15:31:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rNE57-00075i-G8
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 15:31:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rNE57-0002dm-Aa; Tue, 09 Jan 2024 15:31:57 +0000
Received: from [15.248.2.151] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rNE57-0000Y4-4p; Tue, 09 Jan 2024 15:31:57 +0000
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
	bh=SuAblUljxg3JbFXhjmgVvNf4F0yHwRVvrKNh87/n0zE=; b=lBr8/bbeJoCf0Msxk3TUP5LrO9
	6PCtDi7Wimbm+LYs7thDyA69HDNPvDfwpql6lil2RDbhhpI67hx9ygjb1Vn6Eiemmr/NeILXP3uGa
	Sql+E88a0KyDkE8w757t50bM4+BV0rbNw3pfQk75BX+X0PElggl9XEph+5xomstCQrnQ=;
Message-ID: <e579994b-80ff-42db-bf57-6c6068fca902@xen.org>
Date: Tue, 9 Jan 2024 15:31:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.18 v1] xen/common: Don't dereference overlay_node
 after checking that it is NULL
Content-Language: en-GB
To: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Cc: Vikram Garhwal <vikram.garhwal@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <6b2db92de764b6031647926d27cb14dd455eff7d.1704809355.git.javi.merino@cloud.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6b2db92de764b6031647926d27cb14dd455eff7d.1704809355.git.javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Javi,

Title: Any reason this is titled for-4.18? Shouldn't this patch also be 
merged in staging?

On 09/01/2024 14:19, Javi Merino wrote:
> In remove_nodes(), overlay_node is dereferenced when printing the
> error message even though it is known to be NULLL.  Fix the error

Typo: s/NULLL/NULL/

This can be fixed on commit if there is nothing else.

> message to avoid dereferencing a NULL pointer.
> 
> The semantic patch that spots this code is available in
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccinelle/null/deref_null.cocci?id=1f874787ed9a2d78ed59cb21d0d90ac0178eceb0

Good catch and glad to see that coccinelle can work on Xen. I am looking 
forward for more work in that area :).

> 
> Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functionalities")
> Signed-off-by: Javi Merino <javi.merino@cloud.com>
c> ---
> CC: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> Vikram, I didn't know what to put in the error message.  Feel free to
> suggest something more appropriate than "Device not present in the
> tree".

More questions for Vikram, looking at the code, it is not 100% clear in 
which condition overlay_node could be NULL. Is this a programming error? 
if so, maybe this should be an ASSERT_UNREACHABLE() (could be added 
separately) and it would be fine to print nothing.

Cheers,

-- 
Julien Grall

