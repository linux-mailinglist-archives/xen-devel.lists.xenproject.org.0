Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C39198BAD1E
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 15:05:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716407.1118507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2saf-0006h0-Vs; Fri, 03 May 2024 13:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716407.1118507; Fri, 03 May 2024 13:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2saf-0006do-Se; Fri, 03 May 2024 13:04:41 +0000
Received: by outflank-mailman (input) for mailman id 716407;
 Fri, 03 May 2024 13:04:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s2sae-0006di-E1
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 13:04:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s2sae-0004dB-1v; Fri, 03 May 2024 13:04:40 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s2sad-00084r-SH; Fri, 03 May 2024 13:04:39 +0000
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
	bh=6Msoz6Zv678H7c5aiwWQ9ATzQgshUlA6DxmcE0GJf/w=; b=SzgnfhV2qa632CONvy3EnpSp4G
	386EqF8kSrClU9y3PFvh0oS0CKLv1U2etK98yufilH6K07cDFqeTAL14o+fG8JPa3lNv86yWNmUul
	KKW7M8Ox+kDsd0U9kseSQtDye+BcjAWL9Am8rhJUIHwXG4UKm1yEYGMG5s8mmYCOFDng=;
Message-ID: <835099c8-6cf0-4f6d-899b-07388df89319@xen.org>
Date: Fri, 3 May 2024 14:04:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1.1] xen/commom/dt-overlay: Fix missing lock when remove
 the device
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
References: <20240426015550.577986-1-xin.wang2@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240426015550.577986-1-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Henry,

On 26/04/2024 02:55, Henry Wang wrote:
> If CONFIG_DEBUG=y, below assertion will be triggered:
> (XEN) Assertion 'rw_is_locked(&dt_host_lock)' failed at drivers/passthrough/device_tree.c:146
> (XEN) ----[ Xen-4.19-unstable  arm64  debug=y  Not tainted ]----
> (XEN) CPU:    0
> (XEN) PC:     00000a0000257418 iommu_remove_dt_device+0x8c/0xd4
> (XEN) LR:     00000a00002573a0
> (XEN) SP:     00008000fff7fb30
> (XEN) CPSR:   0000000000000249 MODE:64-bit EL2h (Hypervisor, handler)
> [...]
> 
> (XEN) Xen call trace:
> (XEN)    [<00000a0000257418>] iommu_remove_dt_device+0x8c/0xd4 (PC)
> (XEN)    [<00000a00002573a0>] iommu_remove_dt_device+0x14/0xd4 (LR)
> (XEN)    [<00000a000020797c>] dt-overlay.c#remove_node_resources+0x8c/0x90
> (XEN)    [<00000a0000207f14>] dt-overlay.c#remove_nodes+0x524/0x648
> (XEN)    [<00000a0000208460>] dt_overlay_sysctl+0x428/0xc68
> (XEN)    [<00000a00002707f8>] arch_do_sysctl+0x1c/0x2c
> (XEN)    [<00000a0000230b40>] do_sysctl+0x96c/0x9ec
> (XEN)    [<00000a0000271e08>] traps.c#do_trap_hypercall+0x1e8/0x288
> (XEN)    [<00000a0000273490>] do_trap_guest_sync+0x448/0x63c
> (XEN)    [<00000a000025c480>] entry.o#guest_sync_slowpath+0xa8/0xd8
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Assertion 'rw_is_locked(&dt_host_lock)' failed at drivers/passthrough/device_tree.c:146
> (XEN) ****************************************
> 
> This is because iommu_remove_dt_device() is called without taking the
> dt_host_lock. Fix the issue by taking and releasing the lock properly.
> 
> Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functionalities")
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
> v1.1:
> - Move the unlock position before the check of rc.
> ---
>   xen/common/dt-overlay.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
> index 1b197381f6..ab8f43aea2 100644
> --- a/xen/common/dt-overlay.c
> +++ b/xen/common/dt-overlay.c
> @@ -381,7 +381,9 @@ static int remove_node_resources(struct dt_device_node *device_node)
>       {
>           if ( dt_device_is_protected(device_node) )
>           {
> +            write_lock(&dt_host_lock);

Looking at the code, we are not modifying the device_node, so shouldn't 
this be a read_lock()?

That said, even though either fix your issue, I am not entirely 
convinced this is the correct position for the lock. From my 
understanding, dt_host_lock is meant to ensure that the DT node will not 
disappear behind your back. So in theory, shouldn't the lock be taken as 
soon as you get hold of device_node?

Cheers,

-- 
Julien Grall

