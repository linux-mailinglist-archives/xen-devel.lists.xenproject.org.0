Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4577F97A88C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 23:02:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799706.1209686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqIqs-0003Pj-JZ; Mon, 16 Sep 2024 21:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799706.1209686; Mon, 16 Sep 2024 21:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqIqs-0003OD-Gr; Mon, 16 Sep 2024 21:01:42 +0000
Received: by outflank-mailman (input) for mailman id 799706;
 Mon, 16 Sep 2024 21:01:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sqIqq-0003O7-PR
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 21:01:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sqIqq-0004Vb-0e; Mon, 16 Sep 2024 21:01:40 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sqIqp-0004x0-Qb; Mon, 16 Sep 2024 21:01:39 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=HSNr6s5BvcyAl860BK4aa3vxC05zj2BQvTRcViwCT/Y=; b=m/9IYKvMpZv73FkEsh7UmTxU96
	vJHOEcE6WVWBtzd5x+kyHfqpd3O3s3Zi7uDRwLmWOFxiL8yf1lpW5mV1NyH48/nM2hijI8sx0GkEj
	zEstmPXj1HFp+R4UB9CraKfjmy00OvQqwYidExyV1/AFBnzPqAIK6tdUpF3JI2A9Ojsw=;
Message-ID: <c06e8aa4-5490-487e-a8cb-a0c611857ea3@xen.org>
Date: Mon, 16 Sep 2024 22:01:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] xen/arm: Enable workaround for Cortex-A53 erratum
 #1530924
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com>
 <20240910143411.178704-6-andrei.cherechesu@oss.nxp.com>
 <a07182a9-da28-4442-9691-dcb271dedea0@xen.org>
In-Reply-To: <a07182a9-da28-4442-9691-dcb271dedea0@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/09/2024 10:17, Julien Grall wrote:
> On 10/09/2024 15:34, Andrei Cherechesu (OSS) wrote:
>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>
>> All versions of Cortex-A53 cores are affected by the speculative
>> AT instruction erratum, as mentioned in the Cortex-A53 Revision r0
>> SDEN v21 documentation.
>>
>> Enabled ARM64_WORKAROUND_AT_SPECULATE for all versions of Cortex-A53
>> cores, to avoid corrupting the TLB if performing a speculative AT
>> instruction during a guest context switch.
>>
>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

I have committed this patch.

Cheers,

-- 
Julien Grall

