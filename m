Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F8382BED9
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 12:05:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666808.1037684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOFKn-0004S8-GE; Fri, 12 Jan 2024 11:04:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666808.1037684; Fri, 12 Jan 2024 11:04:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOFKn-0004Pw-DJ; Fri, 12 Jan 2024 11:04:21 +0000
Received: by outflank-mailman (input) for mailman id 666808;
 Fri, 12 Jan 2024 11:04:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rOFKl-0004Pq-MR
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 11:04:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rOFKl-0007FD-CG; Fri, 12 Jan 2024 11:04:19 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rOFKl-0007OC-6C; Fri, 12 Jan 2024 11:04:19 +0000
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
	bh=8FQlyWnaYDTmxOeyyKm4QXo5oeOlMEeqrWlm4JS9Zrc=; b=i91B19iY2VJvFWwlwcRRNrWuFF
	vEK6o8tECFHME8/upHhITI5tdFd2pW4UIhExSvVxEEJQc37WestvAMHjWsdC/eNYvtPmFWgktNSD8
	ZbDZXfhtT9cc+GUUcy00xCPHrka9SkS3lJwtQ8cZEN1n1Rzo7ijH8aXrH6roDxwxiC/I=;
Message-ID: <addeb29a-0c4d-4222-96b7-123c7ad8b15e@xen.org>
Date: Fri, 12 Jan 2024 11:04:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/common: Don't dereference overlay_node after
 checking that it is NULL
Content-Language: en-GB
To: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Cc: Vikram Garhwal <vikram.garhwal@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <18b7b16d0cce886728410784a7b6063116be7e2d.1704970589.git.javi.merino@cloud.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <18b7b16d0cce886728410784a7b6063116be7e2d.1704970589.git.javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Javi,

On 11/01/2024 12:09, Javi Merino wrote:
> In remove_nodes(), overlay_node is dereferenced when printing the
> error message even though it is known to be NULL.  Return without
> printing as an error message is already printed by the caller.
> 
> The semantic patch that spots this code is available in
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccinelle/null/deref_null.cocci?id=1f874787ed9a2d78ed59cb21d0d90ac0178eceb0
> 
> Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functionalities")
> Signed-off-by: Javi Merino <javi.merino@cloud.com>

Acked-by: Julien Grall <jgrall@amazon.com>

And committed.

Cheers,

-- 
Julien Grall

