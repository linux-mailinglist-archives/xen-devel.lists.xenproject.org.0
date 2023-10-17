Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 724587CCA6F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 20:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618326.961835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsoZI-0002YQ-Uv; Tue, 17 Oct 2023 18:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618326.961835; Tue, 17 Oct 2023 18:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsoZI-0002W1-RN; Tue, 17 Oct 2023 18:13:24 +0000
Received: by outflank-mailman (input) for mailman id 618326;
 Tue, 17 Oct 2023 18:13:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qsoZH-0002Vv-5g
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 18:13:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsoZG-00048m-Sc; Tue, 17 Oct 2023 18:13:22 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsoZG-00078A-J8; Tue, 17 Oct 2023 18:13:22 +0000
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
	bh=wC1/0PukIRonx3dtGo4ro4BLNmVgYugQ4QkYYYBnicM=; b=ljIwagHARvTjxELy4X8jnDH6aP
	2o02Q339VkJzKh+8TPXmueTxrm2XV44PNT4U+uoWROiShOpPgb1yeLQFP3l6m+yXu86J1M0JjOPFK
	cO9v0uZfuxb9bD4LE4tZ1jEsJmCfGpXJP02gP+QuvUq0YLfMRY8gyuNYZcdwqjHPVfJQ=;
Message-ID: <c31aa392-bc06-4631-be3c-2973c74dfa51@xen.org>
Date: Tue, 17 Oct 2023 19:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 8/8] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <20231009010313.3668423-1-Henry.Wang@arm.com>
 <20231009010313.3668423-9-Henry.Wang@arm.com>
 <af6a376c-a224-45d7-9972-d69ee44239d6@xen.org>
 <038DAAA9-25B5-4DDD-8206-35C3BCF69360@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <038DAAA9-25B5-4DDD-8206-35C3BCF69360@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Henry,

On 17/10/2023 06:55, Henry Wang wrote:
>> On Oct 14, 2023, at 02:22, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Henry,
>>
>> On 09/10/2023 02:03, Henry Wang wrote:
>>>
>>> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
>>> index 940495d42b..a9622dac9a 100644
>>> --- a/xen/arch/arm/include/asm/p2m.h
>>> +++ b/xen/arch/arm/include/asm/p2m.h
>>> @@ -19,6 +19,22 @@ extern unsigned int p2m_root_level;
>>>   #define P2M_ROOT_ORDER    p2m_root_order
>>
>> You seem to use P2M_ROOT_ORDER to allocate p2m->root in arm/p2m.c. However, as I mentioned before, I don't think the defintion of p2m->root is suitable for the MPU. I think the two functions using p2m->root should be moved in mmu/p2m.c and P2M_ROOT_ORDER should be moved in mmu/p2m.h.
> 
> While working on this, I noticed that if we move p2m_final_teardown() (one of the two
> functions you mentioned that consuming p2m->root), we also need to move the static
> function p2m_free_vmid(). This seems reasonable as on MPU we only have dom0less
> domUs so we don’t really need to free vmid.

Regardless on whether you need to free VMID on MPU, the allocation and 
free functions should live in the same unit. So if you plan to move 
p2m_final_teardown() in mmu/p2m.c, then p2m_free_vmid should be exported.

Cheers,

-- 
Julien Grall

