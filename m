Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AB6775E70
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 14:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581014.909510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qThvw-0004nR-V7; Wed, 09 Aug 2023 12:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581014.909510; Wed, 09 Aug 2023 12:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qThvw-0004l2-Sa; Wed, 09 Aug 2023 12:05:00 +0000
Received: by outflank-mailman (input) for mailman id 581014;
 Wed, 09 Aug 2023 12:04:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qThvv-0004kp-2C
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 12:04:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qThvu-0007PM-BL; Wed, 09 Aug 2023 12:04:58 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.16.102]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qThvu-0005Gw-1g; Wed, 09 Aug 2023 12:04:58 +0000
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
	bh=uaoIynkU2pY3gFRMpGc6i6B4rs+Girk9h8f0BeXw+JI=; b=2t5OdSoxAeSEm6igj+c5n66RvY
	LY/pCwSJVE3OuXQ9C75iqTY2SMZ6OLLFGdJw82qQAXgDl4eaV7HeHbeRAQSJuGGmnRcJa2sokfy96
	eNNPrzjV9/gFpZpgeERUXfyGiufflFKzg2X8K7X4DGtafN9MwzYWyQij9f3FQnUJl7Wo=;
Message-ID: <429625da-ec4f-448f-a0c4-47ca0f62f395@xen.org>
Date: Wed, 9 Aug 2023 13:04:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/13] xen/arm: Introduce 'choice' for memory system
 architecture
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Penny Zheng <penny.zheng@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-3-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230801034419.2047541-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 01/08/2023 04:44, Henry Wang wrote:
> There are two types of memory system architectures available for
> Arm-based systems, namely the Virtual Memory System Architecture (VMSA)
> and the Protected Memory System Architecture (PMSA). According to
> ARM DDI 0487G.a, A VMSA provides a Memory Management Unit (MMU) that
> controls address translation, access permissions, and memory attribute
> determination and checking, for memory accesses made by the PE. And
> refer to ARM DDI 0600A.c, the PMSA supports a unified memory protection
> scheme where an Memory Protection Unit (MPU) manages instruction and
> data access. Currently, Xen only suuports VMSA.
> 
> As a preparation of the Xen MPU (PMSA) support. Introduce a Kconfig
> choice under the "Architecture Features" menu for user to choose the
> memory system architecture for the system. Since currently only VMSA
> is supported, only add the bool CONFIG_HAS_MMU to keep consistent with
> the default behavior. User can choose either VMSA or PMSA but not both
> in the future after PMSA/MPU is supported in Xen.

So in the long run I agree that we will want to have a choice. But this 
seems to be a bit premature to introduce it now as the user can't select 
the MPU and also can't deselect MMU.

Therefore, I think it would be best if we introduce an unselectable 
config for now. Like:

HAS_MMU
   def_bool y

This could be turned to a choice once you introduce the MPU.

Also, from my understanding, we are using the prefix HAS_ to indicate if 
an architecture support the given feature. In your case, you will want 
the user to select it, so I would just name the config MMU.

Cheers,

-- 
Julien Grall

