Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C08FF374760
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 20:05:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123262.232499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leLtL-00046P-Ps; Wed, 05 May 2021 18:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123262.232499; Wed, 05 May 2021 18:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leLtL-00043I-ML; Wed, 05 May 2021 18:04:59 +0000
Received: by outflank-mailman (input) for mailman id 123262;
 Wed, 05 May 2021 18:04:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1leLtK-000436-92
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 18:04:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1leLtI-0007TF-W6; Wed, 05 May 2021 18:04:56 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1leLtI-0004No-QH; Wed, 05 May 2021 18:04:56 +0000
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
	bh=/DYUmA5f9c+lzpD5sDjrB0XYy8SP54I5BlRu7i/Rd+4=; b=Gd6P4ukskumqdlntqbLqkC+Iv4
	yD/ecaOeYGZ6m3cFO7bECFuFgmsqDPzZvpr+/Yc6rCuaJVJcX5CHL/2X41IBlkI8JaXzvCM9B7O9n
	A2UGdgDqFSzCwk41Oxbvp3OmzFUZqPMGuVR7odSBx6tTXgGotU2YPBfLFGvcxywLYhtU=;
Subject: Re: [PATCH v3 03/10] arm: Modify type of actlr to register_t
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com,
 wei.chen@arm.com
References: <20210505074308.11016-1-michal.orzel@arm.com>
 <20210505074308.11016-4-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a54f17a9-b977-a264-afd0-551cc56d6f52@xen.org>
Date: Wed, 5 May 2021 19:04:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210505074308.11016-4-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 05/05/2021 08:43, Michal Orzel wrote:
> AArch64 registers are 64bit whereas AArch32 registers
> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
> we should get rid of helpers READ/WRITE_SYSREG32
> in favour of using READ/WRITE_SYSREG.
> We should also use register_t type when reading sysregs
> which can correspond to uint64_t or uint32_t.
> Even though many AArch64 registers have upper 32bit reserved
> it does not mean that they can't be widen in the future.
> 
> ACTLR_EL1 system register bits are implementation defined
> which means it is possibly a latent bug on current HW as the CPU
> implementer may already have decided to use the top 32bit.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

This patch will want to be backported.

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

