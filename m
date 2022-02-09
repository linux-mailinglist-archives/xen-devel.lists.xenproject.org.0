Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 852624AF503
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 16:19:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269296.463340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHokJ-0001lx-GF; Wed, 09 Feb 2022 15:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269296.463340; Wed, 09 Feb 2022 15:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHokJ-0001ia-D2; Wed, 09 Feb 2022 15:19:03 +0000
Received: by outflank-mailman (input) for mailman id 269296;
 Wed, 09 Feb 2022 15:19:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nHokI-0001iU-OK
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 15:19:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHokI-0007FU-FP; Wed, 09 Feb 2022 15:19:02 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.1.215]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHokI-00081n-9t; Wed, 09 Feb 2022 15:19:02 +0000
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
	bh=dDyJRDojRyImTcR8brNKqsf72ejG1zg7dCu3fTd6OWs=; b=ElK8mK1pevgWEhKrdGlLBGHp2O
	UmBh7OqWwukgXyPmYd7ZTYbVWuTKUtRhM7rOHE++q6zTdtywdL4uSKJ9dQop0vTJL6HlTh5gYiqWB
	5M7tzctbQzjhpb+j2nVjPj3AP96dC7x/oTk2eCE2KOgYhIMuIgTW4vBcRnU2ib9QC270=;
Message-ID: <a6d0b96b-7776-660b-4e06-e1c5649cd328@xen.org>
Date: Wed, 9 Feb 2022 15:19:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v5 10/11] xen/arm: if direct-map domain use native UART
 address and IRQ number for vPL011
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20220127074929.502885-1-penny.zheng@arm.com>
 <20220127074929.502885-11-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220127074929.502885-11-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 27/01/2022 07:49, Penny Zheng wrote:
> From: Stefano Stabellini <sstabellini@kernel.org>
> 
> We always use a fix address to map the vPL011 to domains. The address
> could be a problem for direct-map domains.
> 
> So, for domains that are directly mapped, reuse the address of the
> physical UART on the platform to avoid potential clashes.
> 
> Do the same for the virtual IRQ number: instead of always using
> GUEST_VPL011_SPI, try to reuse the physical SPI number if possible.
> 
> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

