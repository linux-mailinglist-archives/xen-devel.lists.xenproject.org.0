Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F4A5B03EF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 14:32:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401544.643392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuDx-00073Z-H2; Wed, 07 Sep 2022 12:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401544.643392; Wed, 07 Sep 2022 12:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuDx-00070U-De; Wed, 07 Sep 2022 12:32:09 +0000
Received: by outflank-mailman (input) for mailman id 401544;
 Wed, 07 Sep 2022 12:32:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVuDw-0006zq-1i
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 12:32:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVuDv-0005Aq-KJ; Wed, 07 Sep 2022 12:32:07 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVuDv-0000ID-E6; Wed, 07 Sep 2022 12:32:07 +0000
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
	bh=QLUPRD+hrCaiP40mYsr/vDgpVae2cAsYLGRi4dS/GFc=; b=eVv0PAiDBoTh36nwRFmW+162ua
	jNZAkXBF+hwS7cScYPuC2vOnpzV+GoCumsNxaDcv4CHPSL0EP054os0hYsX/lzNkFXj6Asb0Iwj4R
	QkxqNzxPyCf13i4XkS9obEivyrcKe9L4xkk5RCtAVTmhj0HCWFenHidqwXvV5rJRYuIE=;
Message-ID: <e5e9a62d-6072-463e-6c4c-8d94aa29589b@xen.org>
Date: Wed, 7 Sep 2022 13:32:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, Henry Wang <Henry.Wang@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <penny.zheng@arm.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-3-Henry.Wang@arm.com>
 <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org>
 <9a66b6df-bc37-d836-8175-3b98be07c696@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9a66b6df-bc37-d836-8175-3b98be07c696@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/09/2022 13:12, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 07/09/2022 13:36, Julien Grall wrote:
>>
>> Hi Henry,
>>
>> While reviewing the binding sent by Penny I noticed some inconsistency
>> with the one you introduced. See below.
>>
>> On 07/09/2022 09:36, Henry Wang wrote:
>>> +- xen,static-heap
>>> +
>>> +    Property under the top-level "chosen" node. It specifies the address
>>> +    and size of Xen static heap memory. Note that at least a 64KB
>>> +    alignment is required.
>>> +
>>> +- #xen,static-heap-address-cells and #xen,static-heap-size-cells
>>> +
>>> +    Specify the number of cells used for the address and size of the
>>> +    "xen,static-heap" property under "chosen".
>>> +
>>> +Below is an example on how to specify the static heap in device tree:
>>> +
>>> +    / {
>>> +        chosen {
>>> +            #xen,static-heap-address-cells = <0x2>;
>>> +            #xen,static-heap-size-cells = <0x2>;
>>
>> Your binding, is introduce #xen,static-heap-{address, size}-cells
>> whereas Penny's one is using #{address, size}-cells even if the property
>> is not "reg".
>>
>> I would like some consistency in the way we define bindings. Looking at
>> the tree, we already seem to have introduced
>> #xen-static-mem-address-cells. So maybe we should follow your approach?
>>
>> That said, I am wondering whether we should just use one set of property
>> name.
>>
>> I am open to suggestion here. My only request is we are consistent (i.e.
>> this doesn't depend on who wrote the bindings).
>>
> In my opinion we should follow the device tree specification which states
> that the #address-cells and #size-cells correspond to the reg property.

Hmmm.... Looking at [1], the two properties are not exclusive to 'reg' 
Furthermore, I am not aware of any restriction for us to re-use them. Do 
you have a pointer?

Cheers,

[1] https://elinux.org/Device_Tree_Mysteries#.23xxx-cells_property_name

> 
> ~Michal

-- 
Julien Grall

