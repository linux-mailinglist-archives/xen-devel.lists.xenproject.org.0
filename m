Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6241349C826
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 11:58:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260803.450901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCg0D-0006z8-19; Wed, 26 Jan 2022 10:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260803.450901; Wed, 26 Jan 2022 10:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCg0C-0006wo-U8; Wed, 26 Jan 2022 10:58:12 +0000
Received: by outflank-mailman (input) for mailman id 260803;
 Wed, 26 Jan 2022 10:58:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nCg0B-0006wi-E8
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 10:58:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCg0B-0008TA-6G; Wed, 26 Jan 2022 10:58:11 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224] helo=[10.95.98.192])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCg0B-0004Uw-0O; Wed, 26 Jan 2022 10:58:11 +0000
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
	bh=DnGJciX5v4cgg7TTRPsPFQ28fwLVUi/0thk4r1lqr0M=; b=xK5DZP7738dzzbh51cFT8lFOGn
	hcX/ZwSCm05IrpFUhgK97siTXMDfvs7hYC6dddqxE/WfC3d2dPKNw29MaDEpRaxb9oZRoNWfmrIPu
	TIrxMvcyzRqhp1mrHDqvUF+NYnqDvh7VtL03706uzudjo5cei1g2GgtlSo3tfA5Xo88s=;
Message-ID: <c820b027-1b23-a762-ca91-7a2f0a46f423@xen.org>
Date: Wed, 26 Jan 2022 10:58:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] design: design doc for shared memory on a dom0less system
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20220126100943.4086208-1-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220126100943.4086208-1-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/01/2022 10:09, Penny Zheng wrote:
> This commit provides a design doc for static shared memory
> on a dom0less system.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   design/shm-dom0less.md | 182 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 182 insertions(+)
>   create mode 100644 design/shm-dom0less.md
> 
> diff --git a/design/shm-dom0less.md b/design/shm-dom0less.md
> new file mode 100644
> index 0000000..b46199d
> --- /dev/null
> +++ b/design/shm-dom0less.md
> @@ -0,0 +1,182 @@
> +# Static Shared Memory between domains on a dom0less system
> +
> +This design aims to provide an overview of the new feature: setting up static
> +shared memory between domains on a dom0less system, through device tree
> +configuration.
> +
> +The new feature is driven by the need of finding a way to build up
> +communication channels on dom0less system, since the legacy ways including
> +grant table, etc are all absent there.

Stefano has a series to add support for grant-table [2]. So I think you 
want to justify it differently.

> +
> +It was inspired by the patch serie of "xl/libxl-based shared memory", see
> +[1] for more details.
> +
> +# Static Shared Memory Device Tree Configuration
> +
> +The static shared memory device tree nodes allow users to statically set up
> +shared memory among a group of dom0less DomUs and Dom0, enabling domains
> +to do shm-based communication.
> +
> +- compatible
> +
> +    "xen,domain-shared-memory-v1"
> +
> +- xen,shm-id

 From the document, it is not clear to me what is the purpose of the 
identifier. Could you clarify it?

> +
> +    An u32 value represents the unique identifier of the shared memory region.
> +    User valuing per shared memory region shall follow the ascending order,
> +    starting from xen,shm-id = <0x0>, to the maximum identifier
> +    xen,shm-id = <0x126>.

Why is it limit to 0x126? And also, why do they have to be allocated in 
ascending order?

> The special xen,shm-id = <0x127> is reserved for
> +    INVALID_SHMID.

Why do we need to reserve invalid?

> +
> +- xen,shared-mem
> +
> +    An array takes a physical address, which is the base address of the
> +    shared memory region in host physical address space, a size, and a guest
> +    physical address, as the target address of the mapping.

I think shared memory is useful without static allocation. So I think we 
want to make the host physical address optional.

> +
> +- role(Optional)
> +
> +    A string property specifying the ownership of a shared memory region,
> +    the value must be one of the following: "owner", or "borrower"
> +    A shared memory region could be explicitly backed by one domain, which is
> +    called "owner domain", and all the other domains who are also sharing
> +    this region are called "borrower domain".
> +    If not specified, the default value is "borrower" and owner is
> +    "dom_shared", a system domain.

I don't particularly like adding another system domain. Instead, it 
would be better to always specify the owner.

> +
> +## Example
> +
> +chosen {
> +    #address-cells = <0x1>;
> +    #size-cells = <0x1>;
> +    xen,xen-bootargs = "console=dtuart dtuart=serial0 bootscrub=0";
> +
> +    ......
> +
> +    /* this is for Dom0 */
> +    dom0-shared-mem@10000000 {
> +        compatible = "xen,domain-shared-memory-v1";
> +        xen,shm-id = <0x0>;
> +        role = "owner";
> +        xen,shared-mem = <0x10000000 0x10000000 0x10000000>;
> +    }
> +
> +    domU1 {
> +        compatible = "xen,domain";
> +        #address-cells = <0x1>;
> +        #size-cells = <0x1>;
> +        memory = <0 131072>;
> +        cpus = <2>;
> +        vpl011;
> +
> +        /*
> +         * shared memory region identified as 0x0(xen,shm-id = <0x0>)
> +         * shared between dom0.
> +         */
> +        domU1-shared-mem@10000000 {
> +            compatible = "xen,domain-shared-memory-v1";
> +            xen,shm-id = <0x0>;
> +            role = "borrower";
> +            xen,shared-mem = <0x10000000 0x10000000 0x50000000>;

Technically, you already know the physical address from the owner. In 
fact, it will only increase the risk to get the wrong binding. So I 
would like to suggest a different binding.

1) Reserve the region in the host memory using reserved-memory binding
2) Create a binding per domain that contains a phandle to the host 
memory and the role.

The advantage with this is we could easily support region that are not 
backed by a reserved-memory.


> +        }
> +
> +        domU1-shared-mem@50000000 {
> +            compatible = "xen,domain-shared-memory-v1";
> +            xen,shm-id = <0x1>;
> +            xen,shared-mem = <0x50000000 0x20000000 0x60000000>;
> +        }
> +
> +        ......
> +
> +    };
> +
> +    domU2 {
> +        compatible = "xen,domain";
> +        #address-cells = <0x1>;
> +        #size-cells = <0x1>;
> +        memory = <0 65536>;
> +        cpus = <1>;
> +
> +        /*
> +         * shared memory region identified as 0x1(xen,shm-id = <0x1>)
> +         * shared between domU1.
> +         */
> +        domU2-shared-mem@50000000 {
> +            compatible = "xen,domain-shared-memory-v1";
> +            xen,shm-id = <0x1>;
> +            xen,shared-mem = <0x50000000 0x20000000 0x70000000>;
> +        }
> +
> +        ......
> +    };
> +};
> +
> +It is the example of two static shared memory regions.
> +
> +In terms of shared memory region identified as 0x0, host physical address
> +starting at 0x10000000 of 256MB will be reserved to be shared between Dom0
> +and DomU1. It will get mapped at 0x10000000 in Dom0 guest physical address
> +space, and at 0x50000000 in DomU1 guest physical address space. Dom0 is the
> +owner domain, and domU1 is the borrower domain.
> +
> +And in terms of shared memory region identified as 0x1, host physical address
> +starting at 0x50000000 of 512MB will be reserved to be shared between DomU1
> +and DomU2. It will get mapped at 0x60000000 in DomU1 guest physical address
> +space, and at 0x70000000 in DomU2 guest physical address space. Since no owner
> +domain is explicitly defined, the default "dom_shared" is the owner domain,
> +and both domU1 and domU2 are the borrower domains.
> +
> +# Overview of Static Shared Memory Flow
> +
> +Static Shared Memory working flow could be classified into the following
> +steps:
> + - Carve out a range of memory in host physical address space to be used
> +for sharing. Define it in device tree configuration, then parse and reserve
> +it to avoid other use.
> + - Create a special domain "dom_shared". It will be the owner domain which
> +is owning the statically shared pages, if "role" property is not specified.
> + - Per shared memory region could be shared with multiple domains. For
> +owner domain, it acquires statically shared pages and assign them to itself,
> +in the same way with static memory. And other than owner domain, the others
> +who are also sharing are called "borrower domain", for which foreign memory
> +map of statically shared pages is required.
> + - Expose the shared memory to the domU using the "xen,shared-memory-v1"
> +reserved-memory binding. See
> +Documentation/devicetree/bindings/reserved-memory/xen,shared-memory.txt
> +in Linux for the corresponding device tree binding.
> +
> +# Memory management of Shared Memory Region
> +
> +Each memory page needs to have an "owner" and it is likely that in many cases
> +the user don't care who the owner is, so it makes sense that users don't
> +need to specify the "role" in device tree if they don't want to, in which
> +scenario, a default domain shall be the owner domain.
> +
> +We propose a new system domain "dom_shared" to be the default domain owning all
> +statically unowned shared pages, assigning it dom_id 0x7FF5(DOMID_SHARED).
> +
> +"dom_shared" domain shall get constructed before domain construction and after
> +"setup_virt_paging", during system boot-time, so it could successfully do
> +p2m initialization.

IHMO, this is going too much into details for a design document. The 
goal is to abstract the feature rather than mentioning the 
implementation (which may change during review or in the future).

> +
> +Owner domain acquires statically shared pages and assign them to itself,
> +while borrower domains get and take reference of them, then do foreign memory
> +map of these statically shared pages.

What happens if the borrower is seen before the owner?

> +
> +When destroying or rebooting a domain, if it is a borrower domain, other than
> +removing foreign memory map of statically shared pages in P2M table, we also
> +need to drop according gained reference. And if it is an owner domain, since
> +statically shared pages are allocated as guest normal ram, it is not needed to
> +do extra removing.
> +
> +However if owner domain is not the default "dom_shared" domain, but specified
> +explicitly in device tree, stopping itself will make shared memory region
> +unaccessible to all borrower domains, so we need to remove foreign memory map
> +for all borrower domains. Notice that all borrowers domains should be stopped
> +before stopping the owner domain.

How will you enforce that?

> +
> +"dom_shared" domain is destroyed when the whole system shuts down, so its
> +owning statically shared pages are only freed at system shutdown.
> +
> +[1] https://marc.info/?l=xen-devel&m=154404821731186

[2] <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>

-- 
Julien Grall

