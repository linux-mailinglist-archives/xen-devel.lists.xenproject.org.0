Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F244368E1
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 19:17:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214539.373122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdbfo-00063W-9g; Thu, 21 Oct 2021 17:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214539.373122; Thu, 21 Oct 2021 17:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdbfo-00060h-5o; Thu, 21 Oct 2021 17:16:12 +0000
Received: by outflank-mailman (input) for mailman id 214539;
 Thu, 21 Oct 2021 17:16:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mdbfm-00060b-FL
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 17:16:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdbfl-0005kR-V4; Thu, 21 Oct 2021 17:16:09 +0000
Received: from [54.239.6.190] (helo=[192.168.27.91])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdbfl-0008I4-P2; Thu, 21 Oct 2021 17:16:09 +0000
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
	bh=MSaQ8HxK/6BgSHTIie+s5NToYoto/9DyxxeSqeay/1o=; b=JZdA/AYnIRrV34NnCamLcOtNIx
	7IOksC0nVa3pffn4L1nMT9wyokCF3pb+0jnooHoUAybWYyQzCPbkI7qY3pkSD4SSl38mczHxmJFTX
	Hjmn55vwfLjAkDhD5g2Ny6/Czyvc3vLqD1i+qPgdMSzOaGwD5T5JUt+D9dNP08sEHoJk=;
Message-ID: <5bb464f6-0b71-d419-b05c-82abdebf85e3@xen.org>
Date: Thu, 21 Oct 2021 18:16:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [for-4.16] Re: [PATCH v4] xen/arm: vgic: Ignore write access to
 ICPENDR*
From: Julien Grall <julien@xen.org>
To: Hongda Deng <Hongda.Deng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 Ian Jackson <iwj@xenproject.org>
References: <20211021120319.2394-1-Hongda.Deng@arm.com>
 <e7804793-82a4-b2ac-0146-fe5bbed2bfbf@xen.org>
In-Reply-To: <e7804793-82a4-b2ac-0146-fe5bbed2bfbf@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/10/2021 16:14, Julien Grall wrote:
> On the previous version, we discussed to include the patch for 4.16. So 
> please tag it with for-4.16 and CC the Release Manager (Ian). This will 
> help him to track what's outstanding for the release.
> 
> On 21/10/2021 13:03, Hongda Deng wrote:
>> Currently, Xen will return IO unhandled when guests write ICPENDR*
>> virtual registers, which will raise a data abort inside the guest.
>> For Linux guest, these virtual registers will not be accessed. But
>> for Zephyr, these virtual registers will be accessed during the
>> initialization. Zephyr guest will get an IO data abort and crash.
>> Emulating ICPENDR is not easy with the existing vGIC, this patch
>> reworks the emulation to ignore write access to ICPENDR* virtual
>> registers and print a message about whether they are already pending
>> instead of returning unhandled.
>> More details can be found at [1].
>>
>> [1] https://github.com/zephyrproject-rtos/zephyr/blob/eaf6cf745df3807e6e
>> cc941c3a30de6c179ae359/drivers/interrupt_controller/intc_gicv3.c#L274
>>
>> Signed-off-by: Hongda Deng <hongda.deng@arm.com>
> 
> While I agree the Reviewed-by from Bertrand should be dropped, the 
> Release-acked-by from Ian is simply a way to say he is happy to include 
> the patch for 4.16. So this should have been retain.
> 
> The patch looks good to me, so I can add Ian's tag on commit:
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Committed.

Cheers,

-- 
Julien Grall

