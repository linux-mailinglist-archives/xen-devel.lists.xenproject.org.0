Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFD95ACEA1
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 11:18:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398648.639544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV8Ez-00040Q-HA; Mon, 05 Sep 2022 09:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398648.639544; Mon, 05 Sep 2022 09:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV8Ez-0003yU-ED; Mon, 05 Sep 2022 09:18:01 +0000
Received: by outflank-mailman (input) for mailman id 398648;
 Mon, 05 Sep 2022 09:18:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oV8Ey-0003yM-3s
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 09:18:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oV8Ex-00065c-PH; Mon, 05 Sep 2022 09:17:59 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.1.223]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oV8Ex-0004t5-If; Mon, 05 Sep 2022 09:17:59 +0000
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
	bh=lzc6LczOLY1m3dTsd82GgGKmhnO3m4aF7TR0EcG0clI=; b=QXiSQZWyHl4Xk7brJ/O/HWBdfK
	PnP3sW/BQAJfp3jDfncbzXogXC7Xtg1OM2cuhUtHntOEea2wyMLGB5sFxvDe45Jzkq2vh9/d0xiQr
	0bUWoomnty9R1KykyYpKZ2IbnCqadYzxygS+wI1fsHa0FtkZ4Qljarw/JK+1ihTsqBOw=;
Message-ID: <80bfb53c-8aae-bd33-18db-d06c04b18f51@xen.org>
Date: Mon, 5 Sep 2022 10:17:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v2 2/4] xen/arm: bootfdt: Make process_chosen_node()
 return int
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, Henry Wang <Henry.Wang@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220905072635.16294-1-Henry.Wang@arm.com>
 <20220905072635.16294-3-Henry.Wang@arm.com>
 <865125f7-9a15-6495-051a-64b08d6555d6@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <865125f7-9a15-6495-051a-64b08d6555d6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/09/2022 10:16, Michal Orzel wrote:
> Hi Henry,
> 
> On 05/09/2022 09:26, Henry Wang wrote:
>>
>> At the boot time, it is saner to stop booting early if an error occurs
>> when parsing the device tree chosen node, rather than seeing random
>> behavior afterwards. Therefore, this commit changes the return type of
>> the process_chosen_node() from void to int, and return correct errno
>> based on the error type.
>>
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>> ---
>> Changes from v1 to v2:
>> - New commit.
>> ---
> 
> The patch looks good but I think it should be put as the first one in the series
> as this is a natural prerequisite for the introduction of the reserved heap. This
> will also help not to modify the same reserved heap code you introduced in the first patch.

+1. The same could be said with patch #4. The renaming should be before 
patch #3.

Cheers,

-- 
Julien Grall

