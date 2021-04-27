Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF88736C258
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 12:09:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118258.224314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbKek-0002xo-UL; Tue, 27 Apr 2021 10:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118258.224314; Tue, 27 Apr 2021 10:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbKek-0002xS-Qx; Tue, 27 Apr 2021 10:09:26 +0000
Received: by outflank-mailman (input) for mailman id 118258;
 Tue, 27 Apr 2021 10:09:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lbKei-0002xN-RO
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 10:09:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbKeh-0004eL-M3; Tue, 27 Apr 2021 10:09:23 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbKeh-0005Eq-C5; Tue, 27 Apr 2021 10:09:23 +0000
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
	bh=oodx0IIQ1y1r/WdXkQ45vjtLEEdiPEgCDItjeq6aTZ0=; b=l2Ydouw3m95Fxh1Z8i+fpigigi
	uQt3Csk/uf8NCgCxK4fknOFpKtX+mGpPobuC2FCG1E4OOhQ9+KPYK52hFSldQtDfbGm0GnMIB9jJk
	EcSLRgXk60Y4zTxcfLUID/ISLpuC64nQkpvmzYDVYbk/rAbht1+Cximrxn4lTZSvbY4A=;
Subject: Re: [PATCH v2 09/10] arm/time,vtimer: Get rid of READ/WRITE_SYSREG32
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210427093546.30703-1-michal.orzel@arm.com>
 <20210427093546.30703-10-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <99d4150b-32cf-5065-0599-bc625deacc22@xen.org>
Date: Tue, 27 Apr 2021 11:09:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427093546.30703-10-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 27/04/2021 10:35, Michal Orzel wrote:
> AArch64 registers are 64bit whereas AArch32 registers
> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
> we should get rid of helpers READ/WRITE_SYSREG32
> in favour of using READ/WRITE_SYSREG.
> We should also use register_t type when reading sysregs
> which can correspond to uint64_t or uint32_t.
> Even though many AArch64 registers have upper 32bit reserved
> it does not mean that they can't be widen in the future.
> 
> Modify type of vtimer structure's member: ctl to register_t.
> 
> Add macro CNTFRQ_MASK containing mask for timer clock frequency
> field of CNTFRQ_EL0 register.
> 
> Modify CNTx_CTL_MASK to return unsigned long instead of
> unsigned int as ctl is now of type register_t.

You modify all the CTX_CTL_* macros.

This can be fixed on commit.

> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

