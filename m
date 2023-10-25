Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE527D67CD
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 12:03:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622779.969907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvajd-0005Km-Ua; Wed, 25 Oct 2023 10:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622779.969907; Wed, 25 Oct 2023 10:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvajd-0005Hx-RI; Wed, 25 Oct 2023 10:03:33 +0000
Received: by outflank-mailman (input) for mailman id 622779;
 Wed, 25 Oct 2023 10:03:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qvajb-0005Hr-Lw
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 10:03:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvaja-0005KS-Vm; Wed, 25 Oct 2023 10:03:30 +0000
Received: from [15.248.3.4] (helo=[10.24.67.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvaja-0005jZ-PX; Wed, 25 Oct 2023 10:03:30 +0000
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
	bh=ALQekrt/1JRIBsl5JJkp3nXRyC/JeeG+lkRoV8Tz61k=; b=uP6ct12lg6mTlPOVY/idbJGtJ+
	ZiUC2mx5HrZ4J1OUXff8bBis+KV75xh6Y4MidI0eIZGvZQNqk5kEeCTLlxsNHgn0xfXo7dP4aZEm1
	fZ3RIVE/bR37JN0/a5KRsCDLip+qh6DW0+9c0d5LtVCfcBKAtXrg7VCuCqR3KMBtGme8=;
Message-ID: <08284b00-7b37-4f4b-b4c6-f465dae75b86@xen.org>
Date: Wed, 25 Oct 2023 11:03:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v2] docs/arm: Document where Xen should be loaded
 in memory
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Henry Wang <Henry.Wang@arm.com>, "michal.orzel@amd.com"
 <michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231024102858.29067-1-julien@xen.org>
 <F5195B0D-C337-4221-9395-56F625497671@arm.com>
 <alpine.DEB.2.22.394.2310241252140.271731@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2310241252140.271731@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 24/10/2023 20:52, Stefano Stabellini wrote:
> On Tue, 24 Oct 2023, Bertrand Marquis wrote:
>> Hi Julien,
>>
>>> On 24 Oct 2023, at 12:28, Julien Grall <julien@xen.org> wrote:
>>>
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> In commit 9d267c049d92 ("xen/arm64: Rework the memory layout"),
>>> we decided to require Xen to be loaded below 2 TiB to simplify
>>> the logic to enable the MMU. The limit was decided based on
>>> how known platform boot plus some slack.
>>>
>>> We had a recent report that this is not sufficient on the AVA
>>> platform with a old firmware [1]. But the restriction is not
>>> going to change in Xen 4.18. So document the limit clearly
>>> in docs/misc/arm/booting.txt.
>>>
>>> [1] https://lore.kernel.org/20231013122658.1270506-3-leo.yan@linaro.org
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Added for for-4.19

It was actually meant for 4.18 as we didn't want to include the patch to 
increase the reserved area for the identity mapping [1]. But I failed to 
use the proper tag.

Henry provided a release-ack and the patch is now committed.

Cheers,

[1]  https://lore.kernel.org/20231013122658.1270506-3-leo.yan@linaro.org

-- 
Julien Grall

