Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB6C974E5F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 11:18:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796315.1205835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soJTo-0000pZ-18; Wed, 11 Sep 2024 09:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796315.1205835; Wed, 11 Sep 2024 09:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soJTn-0000nS-Uc; Wed, 11 Sep 2024 09:17:39 +0000
Received: by outflank-mailman (input) for mailman id 796315;
 Wed, 11 Sep 2024 09:17:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1soJTm-0000nM-9x
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 09:17:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1soJTl-0006uP-OR; Wed, 11 Sep 2024 09:17:37 +0000
Received: from [15.248.2.235] (helo=[10.24.67.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1soJTl-0001iS-Gs; Wed, 11 Sep 2024 09:17:37 +0000
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
	bh=zR1fYYnYAI0fPzl2kVxmG1HSFCDzbUpgsOuPqqWDNZ8=; b=y7kD5f2lrxePi5kOu1Kj+IIfyn
	zDFgTxrw+cyGtHRtpTywirfVHEIBUC1u1IokwmljP2//mLuGL1CPqyC2L2yRNzYcdXokc7UVuqbat
	R1pYb8Pyx7wLYj+cM/0YAatGEJFAL6s+gcipbnPHoSzn8k2eT+ObyOXCAAk37IEDCctg=;
Message-ID: <a07182a9-da28-4442-9691-dcb271dedea0@xen.org>
Date: Wed, 11 Sep 2024 10:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] xen/arm: Enable workaround for Cortex-A53 erratum
 #1530924
Content-Language: en-GB
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com>
 <20240910143411.178704-6-andrei.cherechesu@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240910143411.178704-6-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/09/2024 15:34, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> All versions of Cortex-A53 cores are affected by the speculative
> AT instruction erratum, as mentioned in the Cortex-A53 Revision r0
> SDEN v21 documentation.
> 
> Enabled ARM64_WORKAROUND_AT_SPECULATE for all versions of Cortex-A53
> cores, to avoid corrupting the TLB if performing a speculative AT
> instruction during a guest context switch.
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


