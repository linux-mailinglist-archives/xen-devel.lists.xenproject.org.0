Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D5C670D0E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 00:17:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479970.744088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHvCF-0005Sd-DD; Tue, 17 Jan 2023 23:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479970.744088; Tue, 17 Jan 2023 23:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHvCF-0005Pr-AT; Tue, 17 Jan 2023 23:16:51 +0000
Received: by outflank-mailman (input) for mailman id 479970;
 Tue, 17 Jan 2023 23:16:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHvCE-0005Pl-2Q
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 23:16:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHvCD-0006kv-J6; Tue, 17 Jan 2023 23:16:49 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHvCD-0002xt-DP; Tue, 17 Jan 2023 23:16:49 +0000
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
	bh=y4y2F/N7XxRFF1gg8TL5NCZE3HwrkgzPAbqv97unP2w=; b=sQey8TmkcwlMBjDh8HdI7kZfKE
	+9MRyNiObG/gWX8c7mAsd1i7pdOopSqqc3HnEw6VF3C8qT5KW7YAhgzrT3hrLkg+qVVC39TsOghkp
	V6ERGkQdJ/i0nIimG+9hHmWmeZMr5uhjcxiRS9D1s8LsHX4jGhMkpZ9E2zyRL38tI4Mo=;
Message-ID: <759544c9-7783-c61d-75bd-0a9dab364be2@xen.org>
Date: Tue, 17 Jan 2023 23:16:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 03/40] xen/arm: adjust Xen TLB helpers for Armv8-R64
 PMSA
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-4-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230113052914.3845596-4-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/01/2023 05:28, Penny Zheng wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
>  From Arm ARM Supplement of Armv8-R AArch64 (DDI 0600A) [1],
> section D1.6.2 TLB maintenance instructions, we know that
> Armv8-R AArch64 permits an implementation to cache stage 1
> VMSAv8-64 and stage 2 PMSAv8-64 attributes as a common entry
> for the Secure EL1&0 translation regime. But for Xen itself,
> it's running with stage 1 PMSAv8-64 on Armv8-R AArch64. The
> EL2 MPU updates for stage 1 PMSAv8-64 will not be cached in
> TLB entries. So we don't need any TLB invalidation for Xen
> itself in EL2.

So I understand the theory here. But I would expect that none of the 
common code will call any of those helpers. Therefore the #ifdef should 
be unnecessary.

Can you clarify if my understanding is correct?

Cheers,

-- 
Julien Grall

