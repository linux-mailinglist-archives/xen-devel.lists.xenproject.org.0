Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C79E6FF0FB
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 14:01:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533300.829834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px4yl-0006Wg-Qk; Thu, 11 May 2023 12:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533300.829834; Thu, 11 May 2023 12:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px4yl-0006UP-M8; Thu, 11 May 2023 12:01:03 +0000
Received: by outflank-mailman (input) for mailman id 533300;
 Thu, 11 May 2023 12:01:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1px4yj-0006UJ-SE
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 12:01:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1px4yi-0001rS-AM; Thu, 11 May 2023 12:01:00 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.27.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1px4yi-0000Rg-35; Thu, 11 May 2023 12:01:00 +0000
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
	bh=/St88HNcxWkuf4pdozYzqNwz35Cafc4+MSjD0fPYxkk=; b=RuJCaYq9HWkmmCqq2+2aq8JdhQ
	Qkpvz9Afr2nMN4/xH7wpzNQJ/7mpTiL0nAmEtkrP+nkHnwNk2RZFdHJ271ngaTQR4z2QVa2o7zcoK
	FVXJ0sJkcX8dRKvHZ9pA3/46hIUdYFxWe+SVAWCiy1iPe8bX6Y9IJ7InGFkYFOGw8aDs=;
Message-ID: <1473f9f0-5040-c10e-0098-9ba650b5a3e1@xen.org>
Date: Thu, 11 May 2023 13:00:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] xen/arm: pci: fix -Wtype-limits warning in
 pci-host-common.c
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230503191820.78322-1-stewart.hildebrand@amd.com>
 <5D298044-314C-473F-97AB-420DA3DA44A2@arm.com>
 <4ca00734-8e1e-fe5b-b2a0-6f08f3835433@xen.org>
 <837CD804-85F2-4D3C-87FD-3F65F22A8432@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <837CD804-85F2-4D3C-87FD-3F65F22A8432@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 04/05/2023 11:32, Bertrand Marquis wrote:
> Hi,
> 
>> On 4 May 2023, at 12:10, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 04/05/2023 09:59, Bertrand Marquis wrote:
>>> Hi Stewart,
>>>> On 3 May 2023, at 21:18, Stewart Hildebrand <Stewart.Hildebrand@amd.com> wrote:
>>>>
>>>> When building with EXTRA_CFLAGS_XEN_CORE="-Wtype-limits", we observe the
>>>> following warning:
>>>>
>>>> arch/arm/pci/pci-host-common.c: In function ‘pci_host_common_probe’:
>>>> arch/arm/pci/pci-host-common.c:238:26: warning: comparison is always false due to limited range of data type [-Wtype-limits]
>>>>   238 |     if ( bridge->segment < 0 )
>>>>       |                          ^
>>>>
>>>> This is due to bridge->segment being an unsigned type. Fix it by introducing a
>>>> new variable of signed type to use in the condition.
>>>>
>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> I would see this as a bug fix more than a compiler warning fix as the error code was
>>> ignored before that.
>>
>> +1. Also there is a missing fixes tag. AFAICT this issue was introduced by 6ec9176d94ae.
>>
>>> Anyway:
>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> Just to clarify, you are happy with the current commit message? If so, I can commit it later on with the Reviewed-by + fixes tag.
> 
> Would be nice to add the proper fixes flag if you can do it on commit :-)

Sorry for the late. This is now committed.

Cheers,

-- 
Julien Grall

