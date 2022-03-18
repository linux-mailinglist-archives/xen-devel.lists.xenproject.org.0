Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DABA4DDE8D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 17:19:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292143.496163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVFJC-0004Ut-PP; Fri, 18 Mar 2022 16:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292143.496163; Fri, 18 Mar 2022 16:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVFJC-0004S1-L1; Fri, 18 Mar 2022 16:18:34 +0000
Received: by outflank-mailman (input) for mailman id 292143;
 Fri, 18 Mar 2022 16:18:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nVFJB-0004Rv-Tk
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 16:18:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nVFJB-0005mW-Hi; Fri, 18 Mar 2022 16:18:33 +0000
Received: from [54.239.6.185] (helo=[192.168.15.239])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nVFJB-00006O-BB; Fri, 18 Mar 2022 16:18:33 +0000
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
	bh=SGvcYTT9KPucFevs/HFR8gKlRWNjHHgxHfZjDAenkZg=; b=zsJQyE9UyEkceBilVoj2aFGuHf
	Oq4OHw2QXMNDoQX/zqnBs61OEqlLvaM81F6lnhIdpfMLy4j2xbb/jMqa8ruNWZ1mODwKN25GMON1k
	WdHmc2MIAJ8Tj+8F3wCkg452yHNf8T04IXgBGmgJg06ISWdGl0keT6eb0y6oYgBxfEpc=;
Message-ID: <cff3d9a6-fc72-ae05-663c-4f0197525455@xen.org>
Date: Fri, 18 Mar 2022 16:18:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 5/6] arm/dom0less: assign dom0less guests to cpupools
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220318152541.7460-1-luca.fancellu@arm.com>
 <20220318152541.7460-6-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220318152541.7460-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 18/03/2022 15:25, Luca Fancellu wrote:
> Introduce domain-cpupool property of a xen,domain device tree node,
> that specifies the cpupool device tree handle of a xen,cpupool node
> that identifies a cpupool created at boot time where the guest will
> be assigned on creation.
> 
> Add member to the xen_domctl_createdomain public interface so the
> XEN_DOMCTL_INTERFACE_VERSION version is bumped.
> 
> Add public function to retrieve a pool id from the device tree
> cpupool node.
> 
> Update documentation about the property.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes in v3:
> - Use explicitely sized integer for struct xen_domctl_createdomain
>    cpupool_id member. (Stefano)
> - Changed code due to previous commit code changes
> Changes in v2:
> - Moved cpupool_id from arch specific to common part (Juergen)
> - Implemented functions to retrieve the cpupool id from the
>    cpupool dtb node.
> ---
>   docs/misc/arm/device-tree/booting.txt |  5 +++++
>   xen/arch/arm/domain_build.c           | 14 +++++++++++++-
>   xen/common/boot_cpupools.c            | 24 ++++++++++++++++++++++++
>   xen/common/domain.c                   |  2 +-
>   xen/include/public/domctl.h           |  4 +++-
>   xen/include/xen/sched.h               |  9 +++++++++

This patch doesn't seem to contain any change in tools. So...

>           if ( (err = late_hwdom_init(d)) != 0 )
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index b85e6170b0aa..2f4cf56f438d 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -38,7 +38,7 @@
>   #include "hvm/save.h"
>   #include "memory.h"
>   
> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000014
> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000015
>   
>   /*
>    * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
> @@ -106,6 +106,8 @@ struct xen_domctl_createdomain {
>       /* Per-vCPU buffer size in bytes.  0 to disable. */
>       uint32_t vmtrace_size;
>   
> +    uint32_t cpupool_id;

... will the tools (e.g. golang bindings, libxl,..) always zero 
xen_domctl_createdomain?

I also think we may need to regenerate the golang bindings.

Cheers,

-- 
Julien Grall

