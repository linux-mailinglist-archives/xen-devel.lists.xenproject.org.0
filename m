Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B63EDB1ED9F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 19:04:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074892.1437364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukQW8-0004Dg-ML; Fri, 08 Aug 2025 17:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074892.1437364; Fri, 08 Aug 2025 17:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukQW8-0004At-Jq; Fri, 08 Aug 2025 17:04:32 +0000
Received: by outflank-mailman (input) for mailman id 1074892;
 Fri, 08 Aug 2025 17:04:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ukQW7-0004Ah-9o
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 17:04:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ukQW6-0082ys-2z;
 Fri, 08 Aug 2025 17:04:30 +0000
Received: from [2a02:8012:3a1:0:a91b:b567:8726:98f7]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ukQW6-009MRY-2Q;
 Fri, 08 Aug 2025 17:04:30 +0000
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
	bh=Sw8BCxiBnS3dZm4Eomw4ndZ4m8tGN3vOSmmNUYA5sXY=; b=Hotdm+hbkGquTAUsn6vn3gFVUS
	WtunmQGsEt0eE7eF1cJpHMWz2+L2Iib6WDpMygKn5Q6oXu3S7Q6K+LObL6MKw/tTk0uI80wv3kK9K
	RKpwrmx6QVuDjrW3EMPICPCywJrechkegOP3szol60rOxTENz+T3bTmNtbBQyh+LKzj0=;
Message-ID: <ee580076-994d-47a4-b4a8-450783369738@xen.org>
Date: Fri, 8 Aug 2025 18:04:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] xen/arm: ffa: Enable VM to VM without firmware
Content-Language: en-GB
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org, Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1752754016.git.bertrand.marquis@arm.com>
 <9ed199ef3be4b6dc665f19f96ba4063c61ccbf00.1752754016.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9ed199ef3be4b6dc665f19f96ba4063c61ccbf00.1752754016.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 17/07/2025 13:11, Bertrand Marquis wrote:
> When VM to VM support is activated and there is no suitable FF-A support
> in the firmware, enable FF-A support for VMs to allow using it for VM to
> VM communications.
> If there is OP-TEE running in the secure world and using the non FF-A
> communication system, having CONFIG_FFA_VM_TO_VM could be non functional
> (if optee is probed first) or OP-TEE could be non functional (if FF-A is
> probed first) so it is not recommended to activate the configuration
> option for such systems.
> 
> To make buffer full notification work between VMs when there is no
> firmware, rework the notification handling and modify the global flag to
> only be used as check for firmware notification support instead.
> 
> Also split probe function into one for firmware and one for vm to vm to
> make the implementation clearer.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


