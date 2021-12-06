Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5862146992E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:39:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239162.414543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muF9E-0001c5-Ez; Mon, 06 Dec 2021 14:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239162.414543; Mon, 06 Dec 2021 14:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muF9E-0001Yz-Ar; Mon, 06 Dec 2021 14:39:20 +0000
Received: by outflank-mailman (input) for mailman id 239162;
 Mon, 06 Dec 2021 14:39:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1muF9C-0001JC-MO
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:39:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1muF9C-0007Ug-Bl; Mon, 06 Dec 2021 14:39:18 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.26.205]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1muF9C-0005GA-6H; Mon, 06 Dec 2021 14:39:18 +0000
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
	bh=4VwpTfZamIt2RpE5WV0n6aJNbr+/ynJ/bABg4AUcSIk=; b=Od6328SSFKyVDWcSbRidcuohRH
	6T/BYkD1kssbzdwP9m/IbaOM85Sehj7tpo1tTFoAyArPohnoQzRt125QSrvQT5eHCRuj7R0Szm1T7
	mFPCYljLuAxq/SXbaCy1neCk1SdpU9ICJrMvLS6H/uSzUUrzSW5YHMCX5iJ5nz9nGeZ8=;
Message-ID: <61a730e2-fe20-ae74-bf47-a283c5efc717@xen.org>
Date: Mon, 6 Dec 2021 14:39:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] xen/arm: Do not include in the image functions...
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211206141923.26757-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211206141923.26757-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 06/12/2021 14:19, Michal Orzel wrote:
> vtimer_update_irqs, vtimer_update_irq and vcpu_update_evtchn_irq if
> CONFIG_NEW_VGIC is not set.
> 
> enter_hypervisor_from_guest is protecting calls to these functions
> with CONFIG_NEW_VGIC but their definitions and declarations are not > protected. This means that we are including them in the image even
> though we are not making use of them. Fix that.

While I agree, they are only used by the new vGIC, the implementation of 
the functions are not. So I don't think they should be protected by 
CONFIG_NEW_VGIC.

Actually, I am not convinced they should be protected. But I guess you 
did that for a reason. Would you be able to clarify what is your reason?

Cheers,

-- 
Julien Grall

