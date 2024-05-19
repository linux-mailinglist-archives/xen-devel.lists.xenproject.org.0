Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7CC8C9445
	for <lists+xen-devel@lfdr.de>; Sun, 19 May 2024 12:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.725551.1130025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8dOj-0002qj-NS; Sun, 19 May 2024 10:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 725551.1130025; Sun, 19 May 2024 10:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8dOj-0002nX-Ka; Sun, 19 May 2024 10:04:09 +0000
Received: by outflank-mailman (input) for mailman id 725551;
 Sun, 19 May 2024 10:04:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s8dOi-0002nR-AV
 for xen-devel@lists.xenproject.org; Sun, 19 May 2024 10:04:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s8dOi-0005qo-4i; Sun, 19 May 2024 10:04:08 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s8dOh-00055q-Vm; Sun, 19 May 2024 10:04:08 +0000
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
	bh=17Umg97djKNIGcrRa6KjlmrflguEWj93dNOJwvfqHIk=; b=bbCnZVmjCZ4f1Czf1F/qenyL3l
	JWB6pKN5S+1vCVeEqUhht2IB1CsYM9uPyndsVxT2i8Zji1qdRdh6fflJk04E+0RKJnVza4RWNoFwm
	Qq47dF1q1T5NZ68t/XvVmNFA6aL0WqDlqJQOsW/VIa7+iWkkK7PdEq/WkSr9bTABiJgQ=;
Message-ID: <c1ff249f-bd00-4b15-8e25-2ead4fc5e852@xen.org>
Date: Sun, 19 May 2024 11:04:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] xen/common/dt-overlay: Fix lock issue when
 add/remove the device
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
 <20240516100330.1433265-2-xin.wang2@amd.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240516100330.1433265-2-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 16/05/2024 11:03, Henry Wang wrote:
> If CONFIG_DEBUG=y, below assertion will be triggered:
> (XEN) Assertion 'rw_is_locked(&dt_host_lock)' failed at drivers/passthrough/device_tree.c:146
> (XEN) ----[ Xen-4.19-unstable  arm64  debug=y  Not tainted ]----
> [...]
> (XEN) Xen call trace:
> (XEN)    [<00000a0000257418>] iommu_remove_dt_device+0x8c/0xd4 (PC)
> (XEN)    [<00000a00002573a0>] iommu_remove_dt_device+0x14/0xd4 (LR)
> (XEN)    [<00000a000020797c>] dt-overlay.c#remove_node_resources+0x8c/0x90
> (XEN)    [<00000a0000207f14>] dt-overlay.c#remove_nodes+0x524/0x648
> (XEN)    [<00000a0000208460>] dt_overlay_sysctl+0x428/0xc68
> (XEN)    [<00000a00002707f8>] arch_do_sysctl+0x1c/0x2c
> (XEN)    [<00000a0000230b40>] do_sysctl+0x96c/0x9ec
> (XEN)    [<00000a0000271e08>] traps.c#do_trap_hypercall+0x1e8/0x288
> (XEN)    [<00000a0000273490>] do_trap_guest_sync+0x448/0x63c
> (XEN)    [<00000a000025c480>] entry.o#guest_sync_slowpath+0xa8/0xd8
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Assertion 'rw_is_locked(&dt_host_lock)' failed at drivers/passthrough/device_tree.c:146
> (XEN) ****************************************
> 
> This is because iommu_remove_dt_device() is called without taking the
> dt_host_lock. dt_host_lock is meant to ensure that the DT node will not
> disappear behind back. So fix the issue by taking the lock as soon as
> getting hold of overlay_node.
> 
> Similar issue will be observed in adding the dtbo:
> (XEN) Assertion 'system_state < SYS_STATE_active || rw_is_locked(&dt_host_lock)'
> failed at xen-source/xen/drivers/passthrough/device_tree.c:192
> (XEN) ----[ Xen-4.19-unstable  arm64  debug=y  Not tainted ]----
> [...]
> (XEN) Xen call trace:
> (XEN)    [<00000a00002594f4>] iommu_add_dt_device+0x7c/0x17c (PC)
> (XEN)    [<00000a0000259494>] iommu_add_dt_device+0x1c/0x17c (LR)
> (XEN)    [<00000a0000267db4>] handle_device+0x68/0x1e8
> (XEN)    [<00000a0000208ba8>] dt_overlay_sysctl+0x9d4/0xb84
> (XEN)    [<00000a000027342c>] arch_do_sysctl+0x24/0x38
> (XEN)    [<00000a0000231ac8>] do_sysctl+0x9ac/0xa34
> (XEN)    [<00000a0000274b70>] traps.c#do_trap_hypercall+0x230/0x2dc
> (XEN)    [<00000a0000276330>] do_trap_guest_sync+0x478/0x688
> (XEN)    [<00000a000025e480>] entry.o#guest_sync_slowpath+0xa8/0xd8
> 
> This is because the lock is released too early. So fix the issue by
> releasing the lock after handle_device().
> 
> Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functionalities")
> Signed-off-by: Henry Wang <xin.wang2@amd.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

