Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2104F80F178
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 16:50:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653243.1019688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD516-0002FM-0F; Tue, 12 Dec 2023 15:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653243.1019688; Tue, 12 Dec 2023 15:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD515-0002De-Sp; Tue, 12 Dec 2023 15:49:51 +0000
Received: by outflank-mailman (input) for mailman id 653243;
 Tue, 12 Dec 2023 15:49:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rD514-0002DT-38
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 15:49:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD513-0001nR-Gq; Tue, 12 Dec 2023 15:49:49 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD513-0003vu-AC; Tue, 12 Dec 2023 15:49:49 +0000
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
	bh=EAxpfS6NSLT5CZ1gxVd/mYWapPEK99De7dLkzPi7u7k=; b=EWTFcL2YKt+9//32fdInBvqsTq
	1KPO20SsyjE5v0quPjjGEteMSeSoQjShFTSkITwA/z/NxicG9PqI5XAqlvLdMflSpGJkpbNDd6KGE
	She0s2jyh7mwAy+2xsg2slSlz5PpxMAd0QCigmIOFjLZgT3ZiEpNcvxTNth1yVvlTJBU=;
Message-ID: <240c97ed-ce27-406d-84ad-68b72e999294@xen.org>
Date: Tue, 12 Dec 2023 15:49:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/7] xen/arm: traps: add ASSERT_UNREACHABLE() where
 needed
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <394b69b769f2dc2461d2ddb0c7e037f4794eb244.1702283415.git.nicola.vetrini@bugseng.com>
 <08e3c8f0-772e-4c08-9afc-c623f19c85e3@xen.org>
In-Reply-To: <08e3c8f0-772e-4c08-9afc-c623f19c85e3@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/12/2023 12:32, Julien Grall wrote:
> Hi,
> 
> On 11/12/2023 10:30, Nicola Vetrini wrote:
>> The branches of the switch after a call to 'do_unexpected_trap'
>> cannot return, but there is one path that may return, hence
>> only some clauses are marked with ASSERT_UNREACHABLE().
> I don't understand why this is necessary. The code should never be 
> reachable because do_unexpected_trap() is a noreturn().

 From the matrix discussion, it wasn't clear what was my position on 
this patch.

I would much prefer if the breaks are kept. I could accept:

ASSERT_UNREACHABLE();
break;

But this solution is a Nack because if you are concerned about functions 
like do_unexpected_trap() to return by mistaken, then it needs to also 
be safe in production.

The current proposal is not safe.

Cheers,

-- 
Julien Grall

