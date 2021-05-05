Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B96F43735F1
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 10:00:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122883.231821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCS2-0005Ez-Bw; Wed, 05 May 2021 08:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122883.231821; Wed, 05 May 2021 08:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCS2-0005D8-8Y; Wed, 05 May 2021 08:00:10 +0000
Received: by outflank-mailman (input) for mailman id 122883;
 Wed, 05 May 2021 08:00:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6083=KA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1leCS1-0005D2-EK
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 08:00:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0757c91-ea72-4346-987f-2d75b82459c9;
 Wed, 05 May 2021 08:00:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B362BB07B;
 Wed,  5 May 2021 08:00:07 +0000 (UTC)
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
X-Inumbo-ID: f0757c91-ea72-4346-987f-2d75b82459c9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620201607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8MLrzM8DJ5vvj2ns/MlzkH9tsXQ2lFuGE80d21MMdhI=;
	b=Z870sb4ltm4o5ZE+uI8VsSzDlpJJSnHgR8W3/h8oZ50Ii1lNthKwP6DenSQ52YRQCHqm/J
	dyVir7RW9Mr/rXMtr+y3cgsk+SYK0cQWEWB4kWeBLYsnfSnxzhGVc7jzGY6wgZg1KMCRv6
	N0VtO/pANlUkJ3zAudfx2VASVzA0sL0=
Subject: Re: [PATCH v3 10/10] arm64: Change type of hsr, cpsr, spsr_el1 to
 uint64_t
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, bertrand.marquis@arm.com,
 wei.chen@arm.com, xen-devel@lists.xenproject.org
References: <20210505074308.11016-1-michal.orzel@arm.com>
 <20210505074308.11016-11-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c5676e69-a474-d1ad-c7e9-49c03be3ab66@suse.com>
Date: Wed, 5 May 2021 10:00:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210505074308.11016-11-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.05.2021 09:43, Michal Orzel wrote:
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -267,10 +267,10 @@ struct vcpu_guest_core_regs
>  
>      /* Return address and mode */
>      __DECL_REG(pc64,         pc32);             /* ELR_EL2 */
> -    uint32_t cpsr;                              /* SPSR_EL2 */
> +    uint64_t cpsr;                              /* SPSR_EL2 */
>  
>      union {
> -        uint32_t spsr_el1;       /* AArch64 */
> +        uint64_t spsr_el1;       /* AArch64 */
>          uint32_t spsr_svc;       /* AArch32 */
>      };

This change affects, besides domctl, also default_initialise_vcpu(),
which Arm's arch_initialise_vcpu() calls. I realize do_arm_vcpu_op()
only allows two unrelated VCPUOP_* to pass, but then I don't
understand why arch_initialise_vcpu() doesn't simply return e.g.
-EOPNOTSUPP. Hence I suspect I'm missing something.

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -38,7 +38,7 @@
>  #include "hvm/save.h"
>  #include "memory.h"
>  
> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000013
> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000014

So this is to cover for the struct vcpu_guest_core_regs change.

> --- a/xen/include/public/vm_event.h
> +++ b/xen/include/public/vm_event.h
> @@ -266,8 +266,7 @@ struct vm_event_regs_arm {
>      uint64_t ttbr1;
>      uint64_t ttbcr;
>      uint64_t pc;
> -    uint32_t cpsr;
> -    uint32_t _pad;
> +    uint64_t cpsr;
>  };

Then I wonder why this isn't accompanied by a similar bump of
VM_EVENT_INTERFACE_VERSION. I don't see you drop any checking /
filling of the _pad field, so existing callers may pass garbage
there, and new callers need to be prevented from looking at the
upper half when running on an older hypervisor.

Jan

