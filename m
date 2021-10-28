Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4473543E2BC
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 15:55:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218057.378341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg5rp-000303-Jt; Thu, 28 Oct 2021 13:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218057.378341; Thu, 28 Oct 2021 13:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg5rp-0002xq-Go; Thu, 28 Oct 2021 13:54:53 +0000
Received: by outflank-mailman (input) for mailman id 218057;
 Thu, 28 Oct 2021 13:54:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mg5ro-0002xk-0o
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 13:54:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mg5rm-0000BM-2F; Thu, 28 Oct 2021 13:54:50 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[10.7.236.13])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mg5rl-0003pg-RP; Thu, 28 Oct 2021 13:54:49 +0000
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
	bh=ZSGZqzfT5vAhsS+EOmQ9PiDOya2zVesOw3BdOVIRcmU=; b=q7waaba8jwwYOpQFwUfXNL91u0
	Uy0CrhVJj2Ce3dR6flM7AnG9EwwGZSLvGkKa3oy27dkfV9yrcL1GPWRCQkYsFpKsH3BT8ozxoTtG8
	CtzQLZSik7jC7gj/2/XUJNDk9XpEN83k8sabRWkJ4Lw0XuLojqMYFy9fsKWByAc/Jg/g=;
Message-ID: <5bd3b7e3-5193-4d16-5d3a-950d973e664d@xen.org>
Date: Thu, 28 Oct 2021 14:54:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [patch-4.16] arm/smmuv1,v2: Protect smmu master list with a lock
To: Michal Orzel <michal.orzel@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Ian Jackson <iwj@xenproject.org>
References: <20211026122903.15042-1-michal.orzel@arm.com>
 <e5632a4e-db98-41b4-1045-2b3532c098fa@xen.org>
 <70c30a6c-b779-805e-079a-41bb484894b9@xen.org>
 <cb452c0c-ccde-7798-c403-f972b48a2c46@arm.com>
 <01545115-e82e-2a9d-a8e4-da9676080c0f@xen.org>
 <alpine.DEB.2.21.2110271557570.20134@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2SSgG7a87_xTGT5LeNLgubOLQf1+dbnrsTsP8_p5ErJg@mail.gmail.com>
 <alpine.DEB.2.21.2110271658330.20134@sstabellini-ThinkPad-T480s>
 <4554621d-63da-ea3e-e56a-4e01d0cef347@xen.org>
 <560e75eb-fa0d-a13a-219c-3c1db0b28fa1@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <560e75eb-fa0d-a13a-219c-3c1db0b28fa1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/10/2021 13:15, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 28.10.2021 12:05, Julien Grall wrote:
> The purpose of this patch is to fix the issue that is present in 4.16.

I think this is a latent bug (see more below).

> The patch adding support for removal you are reffering to:
> -is in RFC state
> -is not meant for 4.16
> -will need to be modified anyway because of the future PCI passthrough patches that are going to modify lots of stuff
> 
> That being said, the bug we want to fix touches only point 1). And in fact my patch is solving this issue.
> So I think we should focus on 4.16 and fixing bugs for it without thinking of future patches/modifications.

I would have agreed with your reasoning if this bug could be triggered 
with Xen 4.16 out-of-box. AFAIK, this is not the case because PCI 
devices cannot be registered with the SMMU driver.

> I agree that the locking behaviour will change as soon as the patch you are reffering to will be merged.
> However, the PCI passthrough patches are going to modify this code anyway, so all in all the future modifications will be needed.

Right. PCI passthrough is not going to work in 4.16 whether this patch 
is merged or not. We are past the code freeze and as you said the code 
(and potentially the locking) is going to be reworked for PCI passthrough.

So, I think this is a bad idea to rush this patch in 4.16. Instead, we 
should focus on getting a consistent locking for 4.17 that would cover 
the removal part and all PCI and DT concurrent call.

To be clear, I am not expecting you to implement the both part. I am 
fine if you focus only on the latter. But first, we need to agree on the 
approach (see my 2 proposals sent earlier).

Regarding the patch itself, I will be happy to queue the patch when it 
is fully ready and merge it after the tree is re-opened for 4.17.

Cheers,

-- 
Julien Grall

