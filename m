Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FBE36225A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 16:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111821.213838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXPYt-0008Bm-2B; Fri, 16 Apr 2021 14:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111821.213838; Fri, 16 Apr 2021 14:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXPYs-0008BM-VE; Fri, 16 Apr 2021 14:35:10 +0000
Received: by outflank-mailman (input) for mailman id 111821;
 Fri, 16 Apr 2021 14:35:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lXPYr-0008BG-J5
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 14:35:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lXPYq-0008EL-GS; Fri, 16 Apr 2021 14:35:08 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lXPYq-0008Hr-1O; Fri, 16 Apr 2021 14:35:08 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=3KAeZ0PxqUnHyQxAynro00Zq8BtxXDyHD3cVH0TTUS4=; b=sZKN5dwPA4o9KL9rDkcpb3aU5T
	cQqdKALHJZ1WiF43+eQvFCaOs5tiCn4iLbb45y3p6ZCLYJLN8lOKpdtSqNQi2pfT9rJaRHbbF5sFz
	isrUvQaYv9XVNsFf171QT3o2eztykjgCWoFBVk9IN1T/DBG3eQY6j5noTF7B5fkSzlkk=;
Subject: Re: [PATCH] xen/arm: smmuv1: Revert associating the group pointer
 with the S2CR
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <d2e4ed0eaf25a6b581fdec63cd31a742f3182118.1618572178.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6e75d112-6cc1-4b7c-9751-4064b3250dbf@xen.org>
Date: Fri, 16 Apr 2021 15:35:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <d2e4ed0eaf25a6b581fdec63cd31a742f3182118.1618572178.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

On 16/04/2021 12:25, Rahul Singh wrote:
> Revert the code that associates the group pointer with the S2CR as this
> code causing an issue when the SMMU device has more than one master
> device.

It is not clear to me why this change was first added. Are we missing 
any feature when reverting it?

> This code is merged with the commit  "xen/arm: smmuv1: Intelligent
> SMR allocation”.
> 

This wants a fixes tag. Can be added on commit if there is nothing else 
to change.

Cheers,

-- 
Julien Grall

