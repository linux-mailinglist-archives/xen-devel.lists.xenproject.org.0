Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A2F37475E
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 20:04:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123259.232487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leLrz-0003Vy-Ez; Wed, 05 May 2021 18:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123259.232487; Wed, 05 May 2021 18:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leLrz-0003Sr-Bz; Wed, 05 May 2021 18:03:35 +0000
Received: by outflank-mailman (input) for mailman id 123259;
 Wed, 05 May 2021 18:03:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1leLrx-0003Sl-Rj
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 18:03:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1leLrw-0007S0-N5; Wed, 05 May 2021 18:03:32 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1leLrw-0004Ht-HD; Wed, 05 May 2021 18:03:32 +0000
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
	bh=pJbHyV4z2ohhk1VnAZPH6PxVRo4S+PfURaaaI670+8g=; b=btRFDEabB9PoYjH5FPWbkyS9WJ
	b/8YBpXvkF0jWOw/6D3viB1vjIhd0eYpsQzgBq3RGlvIh+UICmuKGjLFyKJ9jaMU5uBE83yo40kAG
	IKMS9N2uGzplriWxT5PHuNkaA0JxsLQb+x4K4wX2dRiqSxkmEpNROAqsGt3GHf5n39zg=;
Subject: Re: [PATCH v3 02/10] arm/domain: Get rid of READ/WRITE_SYSREG32
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com,
 wei.chen@arm.com
References: <20210505074308.11016-1-michal.orzel@arm.com>
 <20210505074308.11016-3-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <fd49021f-c437-fd0c-b3a8-e3a237e633be@xen.org>
Date: Wed, 5 May 2021 19:03:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210505074308.11016-3-michal.orzel@arm.com>
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
> Modify type of register cntkctl to register_t.
> 
> Modify accesses to thumbee registers to use READ/WRITE_SYSREG.
> Thumbee registers are only usable by a 32bit domain and in fact
> should be only accessed on ARMv7 as they were retrospectively dropped
> on ARMv8.

Sorry for not replying on v2. How about:

"
Thumbee registers are only usable by a 32-bit domain and therefore we 
can just store the bottom 32-bit (IOW there is no type change). In fact, 
this could technically be restricted to Armv7 HW (the support was 
dropped retrospectively in Armv8) but leave it as-is for now.
"

If you are happy with it, I will do it on commit.

Cheers,

-- 
Julien Grall

