Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 073153747D8
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 20:08:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123269.232523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leLwJ-0005Lv-Gm; Wed, 05 May 2021 18:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123269.232523; Wed, 05 May 2021 18:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leLwJ-0005JM-DL; Wed, 05 May 2021 18:08:03 +0000
Received: by outflank-mailman (input) for mailman id 123269;
 Wed, 05 May 2021 18:08:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1leLwH-0005J9-Mx
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 18:08:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1leLwG-0007Xy-M4; Wed, 05 May 2021 18:08:00 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1leLwG-0004d3-GN; Wed, 05 May 2021 18:08:00 +0000
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
	bh=zp4bXx3kOruJRP+AQYdn7Zevw+C9xfLRB4BzJ1fEqH4=; b=vthv/7/bfAtmlcya/HbcUuu9gp
	pPrQtX8k1H62qEOr4cTEh0jiU27jYItxkRxopzdYEfLE5NCKAeo8AkUeQG2Vnjj0vNni9nFEutYvt
	QKeEBx8WBOvdQBm2CDAZcUoIYLkOb0W2KfjnjdEsFkB8YSOR+3D6WNvyTk0HGKgpV9sY=;
Subject: Re: [PATCH v3 07/10] xen/arm: Always access SCTLR_EL2 using
 READ/WRITE_SYSREG()
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com,
 wei.chen@arm.com
References: <20210505074308.11016-1-michal.orzel@arm.com>
 <20210505074308.11016-8-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <758c4de0-f31e-78fc-7db6-878acb5f6f54@xen.org>
Date: Wed, 5 May 2021 19:07:58 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210505074308.11016-8-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 05/05/2021 08:43, Michal Orzel wrote:
> The Armv8 specification describes the system register as a 64-bit value
> on AArch64 and 32-bit value on AArch32 (same as ARMv7).
> 
> Unfortunately, Xen is accessing the system registers using
> READ/WRITE_SYSREG32() which means the top 32-bit are clobbered.
> 
> This is only a latent bug so far because Xen will not yet use the top
> 32-bit.
> 
> There is also no change in behavior because arch/arm/arm64/head.S will
> initialize SCTLR_EL2 to a sane value with the top 32-bit zeroed.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

