Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 915457825BB
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 10:43:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587382.918744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY0VO-0004LX-R2; Mon, 21 Aug 2023 08:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587382.918744; Mon, 21 Aug 2023 08:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY0VO-0004JD-N7; Mon, 21 Aug 2023 08:43:22 +0000
Received: by outflank-mailman (input) for mailman id 587382;
 Mon, 21 Aug 2023 08:43:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qY0VN-0004J5-7t
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 08:43:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY0VM-0000Yh-Ne; Mon, 21 Aug 2023 08:43:20 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY0VM-00032Q-II; Mon, 21 Aug 2023 08:43:20 +0000
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
	bh=6mWBUftbpxrxoUVPJpp5HEf1rI5EL9wHTC0JSg1xFq0=; b=X2+ZeOo6ZDsm4vfDkqOCl9fwUF
	+zCrCZaAIRj8hlDqrd33mRdBuriUZSLHmN1yP6B7HXDELvTL5AaVUrEffd7vPBmIMP7iAPt426a+b
	AmbKGW0hYknO7UH8WgCjWqeIOTPFj35jP+XiNQ13pe1+BIy6Mg6rt5GcIZ5/K8x84swo=;
Message-ID: <71c23767-44fc-44d2-9bfd-0a0d0bdc69c1@xen.org>
Date: Mon, 21 Aug 2023 09:43:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/13] xen/arm: Introduce CONFIG_MMU Kconfig option
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Penny Zheng <penny.zheng@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-3-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814042536.878720-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 14/08/2023 05:25, Henry Wang wrote:
> There are two types of memory system architectures available for
> Arm-based systems, namely the Virtual Memory System Architecture (VMSA)
> and the Protected Memory System Architecture (PMSA). According to
> ARM DDI 0487G.a, A VMSA provides a Memory Management Unit (MMU) that
> controls address translation, access permissions, and memory attribute
> determination and checking, for memory accesses made by the PE. And
> refer to ARM DDI 0600A.c, the PMSA supports a unified memory protection
> scheme where an Memory Protection Unit (MPU) manages instruction and
> data access. Currently, Xen only suuports VMSA.

Typo: s/suuports/supports/

> 
> Introduce a Kconfig option CONFIG_MMU, which is currently default
> set to y and unselectable because currently only VMSA is supported.

NIT: It would be worth to explicit mention that this will be used in 
follow-up patches. So one will wonder what's the goal of introducing an 
unused config.

Or it could have been merged in the first patch splitting the MMU code 
so we don't introduce a config without any use.

> 
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

