Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5386BB1ED5F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 18:54:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074856.1437324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukQLR-0000ib-TG; Fri, 08 Aug 2025 16:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074856.1437324; Fri, 08 Aug 2025 16:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukQLR-0000fl-Q7; Fri, 08 Aug 2025 16:53:29 +0000
Received: by outflank-mailman (input) for mailman id 1074856;
 Fri, 08 Aug 2025 16:53:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ukQLQ-0000ff-2Z
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 16:53:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ukQLP-0082jh-1e;
 Fri, 08 Aug 2025 16:53:27 +0000
Received: from [2a02:8012:3a1:0:a91b:b567:8726:98f7]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ukQLP-009JTZ-0v;
 Fri, 08 Aug 2025 16:53:27 +0000
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
	bh=xVGlLHV/S2IO9jByEajlUvng8m4rJSVsMd3dAgZ3GX8=; b=VN0pJ/MjJqLpJNiQ1lgd7AsgIw
	EgMkJmH4y28kC4wm04pfGh5ZdeoWlEmOxU36jkGkB9v3bZielaLdAwizb/hyr961e9drFYtstV61J
	dgTcJzHxj05ADy/GU5SnrOOhATRcMiz4b7kz4ximyV/PtzB9LTqeBr0dVfn2XGxIbrGU=;
Message-ID: <39df0f84-3004-479e-990d-a8437a384294@xen.org>
Date: Fri, 8 Aug 2025 17:53:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] xen/arm: ffa: Introduce VM to VM support
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org, Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1752754016.git.bertrand.marquis@arm.com>
 <50224eb7cca4eaef2646ad8e33f689d912704733.1752754016.git.bertrand.marquis@arm.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <50224eb7cca4eaef2646ad8e33f689d912704733.1752754016.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 17/07/2025 13:11, Bertrand Marquis wrote:
> Create a CONFIG_FFA_VM_TO_VM parameter to activate FFA communication
> between VMs.
> When activated list VMs in the system with FF-A support in part_info_get.
> 
> When VM to VM is activated, Xen will be tainted as Insecure and a
> message is displayed to the user during the boot as there is no
> filtering of VMs in FF-A so any VM can communicate or see any other VM
> in the system.
> 
> WARNING: There is no filtering for now and all VMs are listed !!
> 
> This patch is reorganizing the ffa_ctx structure to make clear which
> lock is protecting what parts.
> 
> This patch is introducing a chain list of the ffa_ctx with a FFA Version
> negociated allowing to create the partinfo results for VMs in parallel
> by using rwlock which only ensure addition/removal of entries are
> protected.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

With two remarks below:

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> Changes in v7:
> - protect ffa_ctx list with a rw lock to allow several partinfo_get in
>    parallel but protect adding/removing entries.
> Changes in v6:
> - remove ACCESS_ONCE for guest_vers access and take the context lock
>    before modifying it
> - move guest_vers in context declaration to fields protected by the
>    context lock and add a comment to state that lock in only needed when
>    modifying it
> Changes in v5:
> - remove invalid comment about 1.1 firmware support
> - rename variables from d and dom to curr_d and dest_d (Julien)
> - add a TODO in the code for potential holding for long of the CPU
>    (Julien)
> - use an atomic global variable to store the number of VMs instead of
>    recomputing the value each time (Julien)
> - add partinfo information in ffa_ctx (id, cpus and 64bit) and create a
>    chain list of ctx. Use this chain list to create the partinfo result
>    without holding a global lock to prevent concurrency issues.
> - Move some changes in a preparation patch modifying partinfo for sps to
>    reduce this patch size and make the review easier
> Changes in v4:
> - properly handle SPMC version 1.0 header size case in partinfo_get
> - switch to local counting variables instead of *pointer += 1 form
> - coding style issue with missing spaces in if ()
> Changes in v3:
> - break partinfo_get in several sub functions to make the implementation
>    easier to understand and lock handling easier
> - rework implementation to check size along the way and prevent previous
>    implementation limits which had to check that the number of VMs or SPs
>    did not change
> - taint Xen as INSECURE when VM to VM is enabled
> Changes in v2:
> - Switch ifdef to IS_ENABLED
> - dom was not switched to d as requested by Jan because there is already
>    a variable d pointing to the current domain and it must not be
>    shadowed.
> ---
>   xen/arch/arm/tee/Kconfig        |  11 +++
>   xen/arch/arm/tee/ffa.c          |  47 +++++++++++++
>   xen/arch/arm/tee/ffa_partinfo.c | 100 ++++++++++++++++++++++++---
>   xen/arch/arm/tee/ffa_private.h  | 117 ++++++++++++++++++++++++++------
>   4 files changed, 245 insertions(+), 30 deletions(-)
> 
> diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
> index c5b0f88d7522..88a4c4c99154 100644
> --- a/xen/arch/arm/tee/Kconfig
> +++ b/xen/arch/arm/tee/Kconfig
> @@ -28,5 +28,16 @@ config FFA
>   
>   	  [1] https://developer.arm.com/documentation/den0077/latest
>   
> +config FFA_VM_TO_VM
> +    bool "Enable FF-A between VMs (UNSUPPORTED)" if UNSUPPORTED
> +    default n
> +    depends on FFA
> +    help
> +      This option enables to use FF-A between VMs.
> +      This is experimental and there is no access control so any
> +      guest can communicate with any other guest.
> +
> +      If unsure, say N.
> +
>   endmenu
>   
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 3bbdd7168a6b..be71eda4869f 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -118,6 +118,13 @@ void *ffa_tx __read_mostly;
>   DEFINE_SPINLOCK(ffa_rx_buffer_lock);
>   DEFINE_SPINLOCK(ffa_tx_buffer_lock);
>   
> +struct list_head ffa_ctx_head;

A more common pattern is to use LIST_HEAD(ffa_ctx_head) and ...

> +/* RW Lock to protect addition/removal and reading in ffa_ctx_head */
> +rwlock_t ffa_ctx_list_rwlock;

... DEFINE_RWLOCK(ffa_ctx_list_rwlock) which will also initialize 
list/rwlock for you. So no need for extra code further down and less 
risk if the variables are used before they are initialized.

Cheers,

-- 
Julien Grall


