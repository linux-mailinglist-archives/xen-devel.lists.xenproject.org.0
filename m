Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B2EB55A74
	for <lists+xen-devel@lfdr.de>; Sat, 13 Sep 2025 01:46:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122827.1466301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxDSP-0002pv-3S; Fri, 12 Sep 2025 23:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122827.1466301; Fri, 12 Sep 2025 23:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxDSP-0002oS-0M; Fri, 12 Sep 2025 23:45:33 +0000
Received: by outflank-mailman (input) for mailman id 1122827;
 Fri, 12 Sep 2025 23:45:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uxDSO-0002oM-5m
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 23:45:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxDSN-006gXl-2R;
 Fri, 12 Sep 2025 23:45:31 +0000
Received: from [2a02:8012:3a1:0:95d0:d8bb:cf45:58c2]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxDSN-006IF0-2L;
 Fri, 12 Sep 2025 23:45:31 +0000
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
	bh=ORhsJawLryrRsLHdoo+dTD19aW3s/bereOldDhCGGbI=; b=hWIzrzVx+b1zr8uF70TUqhBaiY
	nK2yX4FDPAoHS3eD2lM6zKW/YaKG+DFyLmUFd5L+ol1sTWc4kBUa9IfnotU1vev82R5t69Glm4lH1
	o8KoxxIgHSVrJ7MWrmA/ZetiUUkvpwmAfxzZ6uudXqYSgrs3pjX7g17G/R/zSFI3dlWo=;
Message-ID: <40480c61-0619-41b8-866a-85a219f5e157@xen.org>
Date: Sat, 13 Sep 2025 00:45:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/13] xen/arm: Don't release IRQs on suspend
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
 <293acbb653b5f4d5bf71dc459f9de3e729bff3e1.1756763487.git.mykola_kvach@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <293acbb653b5f4d5bf71dc459f9de3e729bff3e1.1756763487.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykola,

On 01/09/2025 23:10, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> If we call disable_nonboot_cpus on ARM64 with system_state set
> to SYS_STATE_suspend, the following assertion will be triggered:

Looking at the stack trace, I don't understand why this error would not 
happen when offlining a CPU. Can you clarify?

Anyway, I am not very happy to special case suspend/resume in the IRQ 
code. So I would strongly prefer if we follow a different approach.

The one that come to my mind is to switch from request_irq() to 
setup_irq() and allocate the action in a per-cpu variable. With that, 
there should be no free happening with the stop_machine helper.

Cheers,

-- 
Julien Grall


