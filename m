Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE4D740A66
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 10:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556347.868799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEQAi-00062j-56; Wed, 28 Jun 2023 08:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556347.868799; Wed, 28 Jun 2023 08:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEQAi-0005zz-2P; Wed, 28 Jun 2023 08:05:04 +0000
Received: by outflank-mailman (input) for mailman id 556347;
 Wed, 28 Jun 2023 08:05:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qEQAg-0005zt-DG
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 08:05:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEQAg-0004Rn-5X; Wed, 28 Jun 2023 08:05:02 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEQAg-0003RI-0J; Wed, 28 Jun 2023 08:05:02 +0000
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
	bh=xeE+COy3hQqN3URoO7GZ4U+Yg+rZy27QXI3uX3zcEWQ=; b=bnnmSqOtJGwIqx30rglS3MYJdL
	1e3QuV2w7ipFph6Mo5fz9sUdHEsRhzSY4FrSM/Wdu1KZPnQ0UBS8ajhUe9PZ9jQbNfkmSLWr96c0j
	wBjA1/Kg05XaP1HgjGHd3AJFybi5Te/x4XDNjf0u0ImPR3dr1qKynFvTbBsHjrfF7SM4=;
Message-ID: <f3e233d0-c04d-ca19-4230-c7d6f9871b6d@xen.org>
Date: Wed, 28 Jun 2023 09:05:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 02/52] xen/arm: make ARM_EFI selectable for Arm64
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-3-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230626033443.2943270-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/06/2023 04:33, Penny Zheng wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> Currently, ARM_EFI will mandatorily selected by Arm64.

I think there is a missing 'be' after 'mandatorily'.

> Even if the user knows for sure that their images will not
> start in the EFI environment, they can't disable the EFI
> support for Arm64. This means there will be about 3K lines
> unused code in their images.
> 
> So in this patch, we make ARM_EFI selectable for Arm64, and
> based on that, we can use CONFIG_ARM_EFI to gate the EFI
> specific code in head.S for those images that will not be
> booted in EFI environment.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

