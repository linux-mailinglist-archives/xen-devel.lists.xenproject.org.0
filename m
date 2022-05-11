Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 212C2523A46
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 18:26:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327100.549829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nop9I-0001RQ-TZ; Wed, 11 May 2022 16:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327100.549829; Wed, 11 May 2022 16:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nop9I-0001ON-Q8; Wed, 11 May 2022 16:25:16 +0000
Received: by outflank-mailman (input) for mailman id 327100;
 Wed, 11 May 2022 16:25:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nop9G-0001OH-Nc
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 16:25:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nop9E-0002jG-Jl; Wed, 11 May 2022 16:25:12 +0000
Received: from [54.239.6.188] (helo=[192.168.11.111])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nop9E-0000VZ-DT; Wed, 11 May 2022 16:25:12 +0000
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
	bh=dXupqShq+dtvCWywt1KvffqVJ1KKzm32vQnxTMmFV0Y=; b=sJ+gSsAfISfu6NdzcyME/a6NxP
	WGnCf3IN9Adyw7MbqGoZCw6rrKm5yqRkHr1tVXsZyZcY2ImVeXNzUCQ4Bt2+GefLSWuKosYtXYd2W
	OPs5r332xcP1WP93e+04EMf5gAPy91O6wUI+/T5WamUTCi/nDjKJ6UKMM4F4J2mZCEi8=;
Message-ID: <acc3532f-093c-61e1-c756-d213a77d7a29@xen.org>
Date: Wed, 11 May 2022 17:25:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with Linux 5.18-rc3
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <George.Dunlap@citrix.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <832955382caa4ced744ec7894282592b62e8cf61.1651570561.git.bertrand.marquis@arm.com>
 <a05b426c-1800-a365-5b02-f82f0a391306@xen.org>
 <2E66F8B4-4DDA-47E2-B93C-E36FEB70F552@arm.com>
 <f1315848-fe9e-b365-bbf6-a596abc6e0de@xen.org>
 <31F40037-3A43-4F94-8C03-D9F939DAF8C6@arm.com>
 <139b3f6c-ebb9-6ed2-f173-a7dbd3c94a95@xen.org>
 <alpine.DEB.2.22.394.2205091857230.43560@ubuntu-linux-20-04-desktop>
 <BCE017C4-53AA-4918-AEBD-D3CCEF0913F4@arm.com>
 <19a140a9-f8a3-79d6-54fa-a873dab6ff42@xen.org>
 <F60293D4-0A44-4365-939E-5C1A80D7A159@arm.com>
 <0a1faec6-b265-567e-0ad1-478dff6bc81d@xen.org>
 <BB14834F-424D-4024-9A54-4BE20F7700D5@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <BB14834F-424D-4024-9A54-4BE20F7700D5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/05/2022 17:01, Bertrand Marquis wrote:
> Hi,
> 
>> On 11 May 2022, at 16:47, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Bertrand,
>>
>> On 11/05/2022 16:40, Bertrand Marquis wrote:
>>>> On 11 May 2022, at 16:20, Julien Grall <julien@xen.org> wrote:
>>>> Technically, speaking you only copied the code from Linux and therefore you are not the author of some of the changes.
>>>>
>>>> For such case, our general process is:
>>> Could you tell me where this process is described ?
>>
>> The closest description I could find is:
>>
>> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/process/sending-patches.pandoc;h=7ff7826c992b68804b41cc4a8605329f7a10e44c;hb=HEAD#l75
> 
> This state to give the origin which I can easily do for my patch.
> But it does not state that we need to list all the authors from all changes in the origin.
Hmmmm.... I guess we are reading the following statement differently:

All tags **above** the `Origin:` tag are from the original patch (which
should all be kept), while tags **after** `Origin:` are related to the
normal Xen patch process as described here.

> 
> Are you only requesting to modify my patch to add one origin line with the SHA or to actually list all authors of all patches for all changes between the previous state in Xen and the state after my patch ?
> 
>>
>>>> 1) Backport the commit as-is (i.e the Author is the original Author)
>>>> 2) Add the tag Origin (recently introduced)
>>>> 3) Add your signed-off-by
>>> So following this theory, if we import a file from Linux we should list all the people who contributed to it since it was created ?
>>
>> Technically yes.
> 
> But this does not apply here as I am not back porting a patch but syncing a file.

I am not sure why you want to differentiate the two. In the latter it is 
actually easy to find the authors (you are syncing after all!):

   git log lastbaseline...newbaseline myfile.c

The result could be pasted in the commit message. As the code is meant 
to follow Linux, then all the commits in the list should be valid for Xen.

Cheers,

-- 
Julien Grall

