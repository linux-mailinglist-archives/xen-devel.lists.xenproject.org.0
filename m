Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B54FA36C206
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 11:47:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118224.224267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbKJg-0000bO-EY; Tue, 27 Apr 2021 09:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118224.224267; Tue, 27 Apr 2021 09:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbKJg-0000az-BH; Tue, 27 Apr 2021 09:47:40 +0000
Received: by outflank-mailman (input) for mailman id 118224;
 Tue, 27 Apr 2021 09:47:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lbKJf-0000au-2T
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 09:47:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbKJd-00047q-SA; Tue, 27 Apr 2021 09:47:37 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbKJd-0003fN-M2; Tue, 27 Apr 2021 09:47:37 +0000
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
	bh=HKwdU9LGuBne+RvINOhZ14VyltUsSbX4S42lXLXJwo8=; b=LG1q4UMizetf4RTUg2mbvdJCwW
	gynrYmTDZT/vQHbIGdXJLcQDc7rcY4qWoZC1vhOm5UzHwKum8lJubDsZnSRNDPPuIwRqIJbZMFm2f
	OzpoIJv9maUFXmrRAtcXLPb5RMHclP5/vbQPqxHOcX3lpWAg7MM2VlEmRFIkpQqw6ebQ=;
Subject: Re: [PATCH v2 03/10] arm: Modify type of actlr to register_t
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210427093546.30703-1-michal.orzel@arm.com>
 <20210427093546.30703-4-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <160ccd79-1a6e-059f-82a7-996c8bcc68f3@xen.org>
Date: Tue, 27 Apr 2021 10:47:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427093546.30703-4-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 27/04/2021 10:35, Michal Orzel wrote:
> AArch64 registers are 64bit whereas AArch32 registers
> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
> we should get rid of helpers READ/WRITE_SYSREG32
> in favour of using READ/WRITE_SYSREG.
> We should also use register_t type when reading sysregs
> which can correspond to uint64_t or uint32_t.
> Even though many AArch64 registers have upper 32bit reserved
> it does not mean that they can't be widen in the future.

This is a pretty generic message but doesn't really explain the change 
itself and point out this is a bug (possibly latent on current HW) 
because it is implementation defined. IOW a CPU implementer may already 
have decided to use the top 32-bit without our knowledge.

Cheers,

-- 
Julien Grall

