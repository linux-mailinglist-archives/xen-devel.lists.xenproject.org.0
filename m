Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047F151BD84
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 12:51:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321978.543143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmZ4s-0006ep-L2; Thu, 05 May 2022 10:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321978.543143; Thu, 05 May 2022 10:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmZ4s-0006cN-Hx; Thu, 05 May 2022 10:51:22 +0000
Received: by outflank-mailman (input) for mailman id 321978;
 Thu, 05 May 2022 10:51:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nmZ4q-0006cG-KY
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 10:51:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmZ4p-0003rF-Jz; Thu, 05 May 2022 10:51:19 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.7.236.17])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmZ4p-0000xR-Du; Thu, 05 May 2022 10:51:19 +0000
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
	bh=9w/c8Nvl31x+9xKc098sP9ad/LGa5RXA+jKL7wWmspQ=; b=OJA78OD5hp002ho72HJR74DcPu
	DNDFiLzAScCtIbg4dJjS3MS4HT+Qr2W4gCDVSssahx0yFBUTmzgFnK/xnVG9DJFxAee5Kozv5J2cC
	+Ny6piMVXWUx0uKDxg4RTq2Eh83qNxG9A/2AqqFw5QdkEKbwiZ05vMETEr8L7fN1VluU=;
Message-ID: <6035b26c-e011-b905-6295-fc55f0070f29@xen.org>
Date: Thu, 5 May 2022 11:51:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH 2/3] xen/arm: Advertise workaround 1 if we apply 3
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <8119538cce93516f1e78d37d578996a195686f89.1651570561.git.bertrand.marquis@arm.com>
 <becd3d5f-a5ac-a69d-40a3-b29a541773b3@xen.org>
 <3700FF65-C9BD-44D6-87EA-7C2B4B2A8557@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3700FF65-C9BD-44D6-87EA-7C2B4B2A8557@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/05/2022 08:25, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 3 May 2022, at 19:17, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Bertrand,
>>
>> On 03/05/2022 10:38, Bertrand Marquis wrote:
>>> SMCC_WORKAROUND_3 is handling both Spectre v2 and spectre BHB.
>>> So when a guest is asking if we support workaround 1, tell yes if we
>>> apply workaround 3 on exception entry as it handles it.
>>> This will allow guests not supporting Spectre BHB but impacted by
>>> spectre v2 to still handle it correctly.
>>> The modified behaviour is coherent with what the Linux kernel does in
>>> KVM for guests.
>>> While there use ARM_SMCCC_SUCCESS instead of 0 for the return code value
>>> for workaround detection to be coherent with Workaround 2 handling.
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Thanks
> 
>>
>> I think we should also consider for backport.
> 
> Agree.

I have committed this patch and added to my list of backport candidate.

Cheers,

-- 
Julien Grall

