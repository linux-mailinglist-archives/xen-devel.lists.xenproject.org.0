Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC34A739DCC
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 11:54:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553466.864033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCH05-0007nS-TX; Thu, 22 Jun 2023 09:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553466.864033; Thu, 22 Jun 2023 09:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCH05-0007ln-Qm; Thu, 22 Jun 2023 09:53:13 +0000
Received: by outflank-mailman (input) for mailman id 553466;
 Thu, 22 Jun 2023 09:53:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t1HV=CK=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qCH05-0007lh-0c
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 09:53:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 978de6d2-10e2-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 11:53:08 +0200 (CEST)
Received: from [172.20.10.2] (unknown [37.160.126.171])
 by support.bugseng.com (Postfix) with ESMTPSA id 4A9E44EE0737;
 Thu, 22 Jun 2023 11:53:07 +0200 (CEST)
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
X-Inumbo-ID: 978de6d2-10e2-11ee-8611-37d641c3527e
Message-ID: <2a766c08-3418-c9be-49f0-691366cb8ee5@bugseng.com>
Date: Thu, 22 Jun 2023 11:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH] xen/arm: fixed violations of MISRA C:2012 R8.3 on
 parameter names.
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cb0bbd89e169484ccd22da44bbcace56d5497c3e.1687420119.git.federico.serafini@bugseng.com>
 <7a48c49e-2998-9e34-45ef-a1c3431fbffe@xen.org>
 <ac5f3e6d-f953-d496-cc76-faff68f3e99e@amd.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <ac5f3e6d-f953-d496-cc76-faff68f3e99e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/06/23 10:50, Michal Orzel wrote:
>>> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
>>> index 328fd46d1b..aa9f49409e 100644
>>> --- a/xen/arch/arm/include/asm/vgic.h
>>> +++ b/xen/arch/arm/include/asm/vgic.h
>>> @@ -355,8 +355,8 @@ bool vgic_evtchn_irq_pending(struct vcpu *v);
>>>    int domain_vgic_register(struct domain *d, int *mmio_count);
>>>    int domain_vgic_init(struct domain *d, unsigned int nr_spis);
>>>    void domain_vgic_free(struct domain *d);
>>> -int vcpu_vgic_init(struct vcpu *vcpu);
>>> -int vcpu_vgic_free(struct vcpu *vcpu);
>>> +int vcpu_vgic_init(struct vcpu *v);
>>> +int vcpu_vgic_free(struct vcpu *v);
> I know that new VGIC (files under arch/arm/vgic/) is not covered by the MISRA work, but
> functions there reuse the same prototypes. So by changing the parameter names here, we
> should also change the names in the following definitions for consistency:
> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/vgic/vgic-init.c;h=ea739d081e7879b44c4b05c862ad32c301105732;hb=HEAD#l201
> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/vgic/vgic-init.c;h=ea739d081e7879b44c4b05c862ad32c301105732;hb=HEAD#l242
> 
> I can do this by myself although it would be simpler to have all in one patch.
> 
> ~Michal

Hello Michal,

I can do it.

Regards
-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

