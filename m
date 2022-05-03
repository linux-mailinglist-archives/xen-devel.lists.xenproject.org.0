Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E00518C12
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 20:18:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319883.540326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlx5u-000139-3c; Tue, 03 May 2022 18:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319883.540326; Tue, 03 May 2022 18:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlx5u-00010G-07; Tue, 03 May 2022 18:17:54 +0000
Received: by outflank-mailman (input) for mailman id 319883;
 Tue, 03 May 2022 18:17:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nlx5s-00010A-Fn
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 18:17:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nlx5s-0000py-3A; Tue, 03 May 2022 18:17:52 +0000
Received: from [54.239.6.185] (helo=[192.168.2.157])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nlx5r-0007sm-SS; Tue, 03 May 2022 18:17:52 +0000
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
	bh=Gk+fqLWnYDeGe+z0ICz8HBceXXit2p94eMJ49M1NvSE=; b=aFPcUwtbMPSwSIHBa1il9zqXGD
	7vbuByH6Ud1CCbFOE+DKoeQuA5nBfMS/btUXS9ETEvL3UhH5ylNRSCSLb+QAL6zxy+wf4X6eleGm0
	70vE8IVLFsdbneQwhqbzRowJCCSgpfyj0d3wK5K1otncIiqeCTh9lvIw+kxSSFOkPGkQ=;
Message-ID: <becd3d5f-a5ac-a69d-40a3-b29a541773b3@xen.org>
Date: Tue, 3 May 2022 19:17:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH 2/3] xen/arm: Advertise workaround 1 if we apply 3
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <8119538cce93516f1e78d37d578996a195686f89.1651570561.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8119538cce93516f1e78d37d578996a195686f89.1651570561.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 03/05/2022 10:38, Bertrand Marquis wrote:
> SMCC_WORKAROUND_3 is handling both Spectre v2 and spectre BHB.
> So when a guest is asking if we support workaround 1, tell yes if we
> apply workaround 3 on exception entry as it handles it.
> 
> This will allow guests not supporting Spectre BHB but impacted by
> spectre v2 to still handle it correctly.
> The modified behaviour is coherent with what the Linux kernel does in
> KVM for guests.
> 
> While there use ARM_SMCCC_SUCCESS instead of 0 for the return code value
> for workaround detection to be coherent with Workaround 2 handling.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

I think we should also consider for backport.

Cheers,

-- 
Julien Grall

