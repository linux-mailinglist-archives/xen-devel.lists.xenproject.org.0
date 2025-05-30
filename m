Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34752AC96BE
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 22:46:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001529.1381654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL6cA-0001MI-U9; Fri, 30 May 2025 20:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001529.1381654; Fri, 30 May 2025 20:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL6cA-0001K4-RV; Fri, 30 May 2025 20:46:06 +0000
Received: by outflank-mailman (input) for mailman id 1001529;
 Fri, 30 May 2025 20:46:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uL6c9-0001Jy-9c
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 20:46:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uL6c8-00AE1N-2k;
 Fri, 30 May 2025 20:46:04 +0000
Received: from [2a02:8012:3a1:0:ec4a:d3ec:7374:b46c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uL6c9-009t2R-0L;
 Fri, 30 May 2025 20:46:04 +0000
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
	bh=B4TZgQrlu9nT4psl9N0o0ax6hckkptF0ookl5izPB34=; b=GOvJuNimeoisVWCUg5i3WJxtI2
	qL+0DZ6FT2RSomTXkFBjwvLk2WA6UkhFOVUGetUaIFKLI8VmqwiJcCFG9wdAn0J0OW/Z5VdJnlnp7
	5ODxwDGN2TKPaDGuJK3cEYwVZX4A9vSQHeNRs5m0kgNOJ/g3DIoXT3UGWAEZIw1nS5Ho=;
Message-ID: <2ee722ec-1ec8-4411-a2e7-bd6efe963c29@xen.org>
Date: Fri, 30 May 2025 21:46:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] xen/arm: ffa: Rework partinfo_get implementation
Content-Language: en-GB
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org, Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1747925287.git.bertrand.marquis@arm.com>
 <bd3f0706872b5797d38ea1236536f0bd6aa51856.1747925287.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bd3f0706872b5797d38ea1236536f0bd6aa51856.1747925287.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 22/05/2025 16:08, Bertrand Marquis wrote:
> This patch is in preparation for VM to VM support in order to do the
> changes on the SP handling part of partinfo_get before adding support
> for the VM part.
> 
> This patches is doing the following changes:
> - split partinfo_get into 3 functions to have the locking handling and
>    proper exit on error handled more clearly
> - add some potential overflow checks to validate the offset and sizes
>    passed by the VM on partinfo call.
> - Introduce a maximum number of SPs (for now set to 64) to prevent
>    holding the CPU for too long in case there would be a lot of
>    partitions in the secure world. The limit currently set is thought to
>    be realistic for most use cases as 64 secure partitions is a very high
>    number compared to current seen usage (more 3 or 4).
> - fix include ordering in ffa_private.h to be in alphabetic order
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


