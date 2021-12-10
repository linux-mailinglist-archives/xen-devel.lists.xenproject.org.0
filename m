Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C57B247076A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 18:35:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244147.422264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvjne-0002ek-TW; Fri, 10 Dec 2021 17:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244147.422264; Fri, 10 Dec 2021 17:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvjne-0002cu-Pr; Fri, 10 Dec 2021 17:35:14 +0000
Received: by outflank-mailman (input) for mailman id 244147;
 Fri, 10 Dec 2021 17:35:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mvjnd-0002co-JR
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 17:35:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mvjnb-0002nk-KK; Fri, 10 Dec 2021 17:35:11 +0000
Received: from [54.239.6.184] (helo=[192.168.9.67])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mvjnb-000747-DT; Fri, 10 Dec 2021 17:35:11 +0000
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
	bh=zgovlK2ID0qdTuKm0DMRoPu3r+zdo5udp66lQV6Z7Tw=; b=PemTjtpoEnWC8cLsW8bKv74TVj
	v6b0GnnJhNNqhw6/g9mskf9+8n6ckonJdkJ/VA2TmuVjPYUvprU5vXtEOVt9TYF+zXxgrA0vTJlmd
	UmCZH0g0JUD7udZGQ07a4KKkl073cMEGBu7c74G0+DUZke8bq2d02dAELc+paEfpslf0=;
Message-ID: <226e66d0-72a6-e106-4daf-a873a0e76add@xen.org>
Date: Fri, 10 Dec 2021 17:35:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH] arm/efi: Handle Xen bootargs from both xen.cfg and DT
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20211206153658.49727-1-luca.fancellu@arm.com>
 <984732f0-8433-a294-acaf-c4130a2ab341@xen.org>
 <E84E06F3-8468-426C-AFE1-DB0E0A49B353@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <E84E06F3-8468-426C-AFE1-DB0E0A49B353@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 10/12/2021 10:26, Luca Fancellu wrote:
> 
> 
>> On 8 Dec 2021, at 18:10, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 06/12/2021 15:36, Luca Fancellu wrote:
>>> Currently the Xen UEFI stub can accept Xen boot arguments from
>>> the Xen configuration file using the "options=" keyword, but also
>>> directly from the device tree specifying xen,xen-bootargs
>>> property.
>>> When the configuration file is used, device tree boot arguments
>>> are ignored and overwritten even if the keyword "options=" is
>>> not used.
>>> This patch handle this case, if xen,xen-bootargs is found in the
>>> device tree, it is used for xen boot arguments regardless they
>>> are specified in the Xen configuration file or not.
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>>   docs/misc/efi.pandoc        | 4 ++++
>>>   xen/arch/arm/efi/efi-boot.h | 7 +++++++
>>>   2 files changed, 11 insertions(+)
>>> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
>>> index abafb3452758..b7d99de87f15 100644
>>> --- a/docs/misc/efi.pandoc
>>> +++ b/docs/misc/efi.pandoc
>>> @@ -249,6 +249,10 @@ UEFI stub for module loading.
>>>   When adding DomU modules to device tree, also add the property
>>>   xen,uefi-cfg-load under chosen for Xen to load the Xen config file.
>>>   Otherwise, Xen will skip the config file and rely on device tree alone.
>>> +When using the Xen configuration file in conjunction with the device tree, you
>>> +can specify the Xen boot arguments in the configuration file with the "options="
>>> +keyword or in the device tree with the "xen,xen-bootargs" property, but be
>>> +aware that a device tree value has a precedence over the configuration file.
>>
>> I am not sure I agree with the precedence chosen here. With UEFI environment it is a lot easier to update the configuration file over the Device-Tree. So this could be used to quickly test a command line before updating the Device-Tree.
>>
>> Also, somewhat unrelated to this patch. Looking at the code, the command line is a concatenation of "options=" from the configuration file and the extra arguments provided on the command line used to execute the UEFI binary.
>>
>> When using the command line from the Device-Tree, I think it would still make sense to append the later because it could allow a user to provide a single Device-Tree with extra options on the UEFI command line.
>>
>> But I think this is a separate subject. So if we are going to go with the precedence you suggested, then we should at least clarify in the documentation that it will replace both.
>
> Yes I see your point, currently the boot arguments are done in this way <image name> <CFG bootargs> <CMD line bootargs> as you pointed out,
> 
> would it be ok in your opinion to check if <CFG bootargs> is specified and if it’s not, use the <DT bootargs> instead (if any)?

I am happy with this approach.

Cheers,

-- 
Julien Grall

