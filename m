Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5A3589F9D
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 18:58:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380627.614931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJeAt-00032n-HS; Thu, 04 Aug 2022 16:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380627.614931; Thu, 04 Aug 2022 16:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJeAt-00030Q-E0; Thu, 04 Aug 2022 16:58:19 +0000
Received: by outflank-mailman (input) for mailman id 380627;
 Thu, 04 Aug 2022 16:58:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oJeAs-00030K-53
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 16:58:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJeAp-0000jo-5i; Thu, 04 Aug 2022 16:58:15 +0000
Received: from [54.239.6.184] (helo=[10.7.237.15])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJeAo-0006BE-Tx; Thu, 04 Aug 2022 16:58:15 +0000
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
	bh=GvydFCQ2McL0Lz14H/79C8r3vd+shNocBWO3JksUbFY=; b=LV87WKHvj5dZlSLKUh4X8T5gs3
	UzKwU1fOLBQc5roqUOzlK4L4x4IaEmfqJ12JFmjMGk9kARVNJAYgM5f0o+r+NNY5WVQQblw4wMkld
	4425/D+nnCZJlNGYOye7TwDYPUar4TULLti6SgQg1YJ/mqcErHwlThx2F/x8dReGyDXM=;
Message-ID: <970cecfe-0c69-08b7-566b-6bd1fd470992@xen.org>
Date: Thu, 4 Aug 2022 17:58:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v2] tools: use $(PYTHON) to call cppcheck tools
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <708f00303d1c370622707866d41a868425a17324.1659527529.git.bertrand.marquis@arm.com>
 <dd4a5616-5c1f-51f2-0bce-3679432dcd58@suse.com>
 <07858193-47b0-f1a5-6bdc-4cac4dbe2ed7@xen.org>
 <6FFB4DB2-5F3B-4E2F-AF7D-A5C47D497476@arm.com>
 <773AB351-B4C7-43ED-AA83-FC80DCF2541D@arm.com>
 <c953cce8-223a-4498-c840-3784d77c0a3c@xen.org>
 <DC024A67-B743-4D82-B9B0-966FA0F1853C@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DC024A67-B743-4D82-B9B0-966FA0F1853C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 03/08/2022 14:29, Bertrand Marquis wrote:
> 
> 
>> On 3 Aug 2022, at 14:01, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Bertrand,
>>
>> On 03/08/2022 13:56, Bertrand Marquis wrote:
>>>> On 3 Aug 2022, at 13:55, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
>>>>
>>>>
>>>>
>>>>> On 3 Aug 2022, at 13:10, Julien Grall <julien@xen.org> wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> On 03/08/2022 13:05, Jan Beulich wrote:
>>>>>> On 03.08.2022 13:57, Bertrand Marquis wrote:
>>>>>>> When calling python tools to convert misra documentation or merge
>>>>>>> cppcheck xml files, use $(PYTHON).
>>>>>>> While there fix misra document conversion script to be executable.
>>>>>>>
>>>>>>> Fixes: 57caa53753 (xen: Add MISRA support to cppcheck make rule)
>>>>>>> Fixes: 43aa3f6e72 xen/build: Add cppcheck and cppcheck-html make rules
>>>>>> Nit: These two titles would want expressing consistently. If I
>>>>>> end up committing this, I'll try to remember to adjust.
>>>>>
>>>>> There are actually a few issues with the Fixes tags. From the doc [1] :
>>>>> - the sha1 should be 12 characters (rather than 10)
>>>>> - the format should be:
>>>>> Fixes: <comidid> ("Commit title")
>>>>
>>>> You want me to resend and fix that ?
>>
>> If Jan doesn't want to fix it on commit. Then I would be happy to do it.
> 
> Thanks a lot

I have committed with the adjustments discussed.

Cheers,

-- 
Julien Grall

