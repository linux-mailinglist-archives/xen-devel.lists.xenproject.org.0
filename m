Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 861667B83E2
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 17:42:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612697.952747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo40E-0004Ue-PP; Wed, 04 Oct 2023 15:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612697.952747; Wed, 04 Oct 2023 15:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo40E-0004Rq-M5; Wed, 04 Oct 2023 15:41:34 +0000
Received: by outflank-mailman (input) for mailman id 612697;
 Wed, 04 Oct 2023 15:41:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qo40D-0004Rh-TN
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 15:41:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qo40D-0006jH-9d; Wed, 04 Oct 2023 15:41:33 +0000
Received: from [15.248.2.150] (helo=[10.24.67.38])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qo40D-0001g0-3g; Wed, 04 Oct 2023 15:41:33 +0000
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
	bh=USryev3r0pVojqfcVSenieL0a1SEmW95Au1bA7n5dis=; b=HulH0VMGmF7s9EEYTA9ttQkEPc
	x5NdmKUaWJiZn2RuUhTVy4fRJ98BrG3RzdZ4BhrZKyRVUQ6pGEwlvVXWTuN5sli8erM6CjL5lj5OF
	xqcoYxW5FQvQnPL2G5u4C7K8I7wvuSCEmyHH4iCvnXyd02LJD7yTZCdWKW8aBhoIPHD8=;
Message-ID: <f419a108-f594-4a00-9445-e1c072777379@xen.org>
Date: Wed, 4 Oct 2023 16:41:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/ioreq: clean data field in ioreq struct on read
 operations
Content-Language: en-GB
To: Andrii Chepurnyi <Andrii_Chepurnyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "andrii.chepurnyi82@gmail.com" <andrii.chepurnyi82@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231003131923.2289867-1-andrii_chepurnyi@epam.com>
 <27044e68-4a49-4f1d-b8a9-174810efb5fe@xen.org>
 <ec7089d1-0111-1e34-900b-b5c40dcb41d2@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ec7089d1-0111-1e34-900b-b5c40dcb41d2@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/10/2023 09:42, Andrii Chepurnyi wrote:
> Hello,

Hi,

> On 10/3/23 16:49, Julien Grall wrote:
>> Hi,
>>
>> On 03/10/2023 14:19, Andrii Chepurnyi wrote:
>>> For read operations, there's a potential issue when the data field
>>> of the ioreq struct is partially updated in the response. To address
>>> this, zero data field during read operations. This modification
>>> serves as a safeguard against implementations that may inadvertently
>>> partially update the data field in response to read requests.
>>> For instance, consider an 8-bit read operation. In such cases, QEMU,
>>> returns the same content of the data field with only 8 bits of
>>> updated data.
>>
>> Do you have a pointer to the code?
> 
> First of all, using the term "user-space" with respect to this problem
> was a mistake from my side.
> 
> In general, my use case is to run u-boot with virtio-blk inside the
> guest domain.
> I.e. setup configuration(hardware renesas gen3 kingfisher board):  Dom0,
> DomD ( QEMU as backend) and running u-boot in DomA with virtio-blk.
> The problem appeared inside the u-boot code :

I was asking a pointer to the code in the Device Emulator (QEMU in your 
case). I am confident the code is correct in U-boot, because when using 
'w0', the unused bits are meant to be set to zero (per the Arm Arm). But 
I am curious to know why QEMU is not doing it.

Cheers,

-- 
Julien Grall

