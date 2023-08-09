Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAB5775EB4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 14:19:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581028.909530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTi9c-0006wV-DT; Wed, 09 Aug 2023 12:19:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581028.909530; Wed, 09 Aug 2023 12:19:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTi9c-0006td-Ae; Wed, 09 Aug 2023 12:19:08 +0000
Received: by outflank-mailman (input) for mailman id 581028;
 Wed, 09 Aug 2023 12:19:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTi9b-0006tX-Ai
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 12:19:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTi9a-0007fK-S1; Wed, 09 Aug 2023 12:19:06 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.16.102]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTi9a-0005o5-Fj; Wed, 09 Aug 2023 12:19:06 +0000
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
	bh=rh+puutyKeAjoWJBiHzu9Jn5y5g+2e2Vl5kbP9d2D5g=; b=BaycMp0q/89eqdhEb1Zr9Erm31
	IK9BM2U2JUjFsDsfyrG4lRL4U5XJiNN96ED8L2cGQBYapDz4EAPuYeyuyrLbzxGX3TtFdU1jSywci
	H9qaTJBvr7dD5/8oVhLHirZjtNggjUMiSWUQxDfLagemca1jhuX71Ekx6MYcWMtpiCO4=;
Message-ID: <83022ef2-dfd1-438c-b8e8-2f1bf0866918@xen.org>
Date: Wed, 9 Aug 2023 13:19:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/13] xen/arm: Move MMU related definitions from
 config.h to mmu/layout.h
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <penny.zheng@arm.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-6-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230801034419.2047541-6-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 01/08/2023 04:44, Henry Wang wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> Xen defines some global configuration macros for Arm in config.h.
> However there are some address layout related definitions that are
> defined for MMU systems only, and these definitions could not be
> used by MPU systems. Adding ifdefs with CONFIG_HAS_MPU to gate these

You haven't yet introduced HAS_MPU. So I would suggest to write: 'Adding 
ifdefs to differentiate the MPU from MMU layout will result in a ...'.

> definitions will result in a messy and hard-to-read/maintain code.
> 
> So move MMU related definitions to a new file, i.e. mmu/layout.h to
> avoid spreading "#ifdef" everywhere.

AFAICT, you are moving all memory layout definition in a separate file. 
So I would say it explicitely rather than using "MMU related definitions".

> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

With the comments addressed:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

