Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B327B818FD7
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 19:36:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657086.1025764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFewb-0003C3-0R; Tue, 19 Dec 2023 18:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657086.1025764; Tue, 19 Dec 2023 18:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFewa-00038k-Ta; Tue, 19 Dec 2023 18:35:52 +0000
Received: by outflank-mailman (input) for mailman id 657086;
 Tue, 19 Dec 2023 18:35:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFewZ-00038e-NE
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 18:35:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFewZ-0008W9-8t; Tue, 19 Dec 2023 18:35:51 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.3.234]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFewZ-0001y5-1g; Tue, 19 Dec 2023 18:35:51 +0000
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
	bh=FYbAyzkqvFiTw5GWoZjdB+7DSNxMG9waUewCjzSHIow=; b=T2KqbSh0hRV6VlXYjMx2pQLl1z
	xnX/P1g1dIS7H3noau6B4fgxMrA/PHpeLX3jBXGGUamKReiKMIvE4p2dZuBo9359TdZAMusohA6GC
	C9sAVGmYZkML7rubJLeZqpGJ+NAd47Ek7c8wiGz3QVjVsazaYp+RtG4URHh7G930cZdo=;
Message-ID: <90c9b993-5c3b-4be3-b273-8c3bba842e94@xen.org>
Date: Tue, 19 Dec 2023 18:35:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/arm: ffa: return fpi size from
 FFA_PARTITION_INFO_GET
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "patches@linaro.org" <patches@linaro.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20231213103135.2346238-1-jens.wiklander@linaro.org>
 <62A3B41A-0362-411A-89D3-64787DDC1AE1@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <62A3B41A-0362-411A-89D3-64787DDC1AE1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 18/12/2023 14:33, Bertrand Marquis wrote:
> Hi Jens,
> 
>> On 13 Dec 2023, at 11:31, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>>
>> Until now has FFA_PARTITION_INFO_GET always returned zero in w3, but
>> FF-A v1.1 requires FFA_PARTITION_INFO_GET to return the size of each
>> partition information descriptor returned if
>> FFA_PARTITION_INFO_GET_COUNT_FLAG isn't set.
>>
> 
> Good finding.
> 
>> The SPMC queried with FFA_PARTITION_INFO_GET must also return the each
>> partition information descriptor returned so fix this by passing along
>> the same value.
>>
>> Fixes: caf6491e95a9 ("xen/arm: ffa: support guest FFA_PARTITION_INFO_GET")
>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

It is now committed.

Cheers,

-- 
Julien Grall

