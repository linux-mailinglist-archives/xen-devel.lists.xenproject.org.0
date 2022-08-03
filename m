Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E40BF588C9C
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 15:02:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379933.613839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJE0g-0000an-69; Wed, 03 Aug 2022 13:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379933.613839; Wed, 03 Aug 2022 13:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJE0g-0000Xn-2s; Wed, 03 Aug 2022 13:02:02 +0000
Received: by outflank-mailman (input) for mailman id 379933;
 Wed, 03 Aug 2022 13:02:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oJE0e-0000Xh-Ll
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 13:02:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJE0b-0000Mh-OD; Wed, 03 Aug 2022 13:01:57 +0000
Received: from [54.239.6.189] (helo=[10.7.237.20])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJE0b-0004Kk-HT; Wed, 03 Aug 2022 13:01:57 +0000
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
	bh=su/42yZTHH8m1qzwIC19o2LVptySkIWDtYLdMxXZYGk=; b=epm4iVnxUG0XlM22+u8JzxdtMw
	d/PhP7Vb10ahumwvBZtl/xz8CWFf5bJeIGG6InRkcyFo9kD/ZqJRynyXYynd0wsfc/LsznFDq4OW6
	QJcy7xy9qWZ+aQvIpe+flV9EdUSnvbk8WIAXG4RxDBSZLIMoUJpElTaaYNa54BdKTJcU=;
Message-ID: <c953cce8-223a-4498-c840-3784d77c0a3c@xen.org>
Date: Wed, 3 Aug 2022 14:01:55 +0100
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <773AB351-B4C7-43ED-AA83-FC80DCF2541D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bertrand,

On 03/08/2022 13:56, Bertrand Marquis wrote:
> 
> 
>> On 3 Aug 2022, at 13:55, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
>>
>>
>>
>>> On 3 Aug 2022, at 13:10, Julien Grall <julien@xen.org> wrote:
>>>
>>> Hi,
>>>
>>> On 03/08/2022 13:05, Jan Beulich wrote:
>>>> On 03.08.2022 13:57, Bertrand Marquis wrote:
>>>>> When calling python tools to convert misra documentation or merge
>>>>> cppcheck xml files, use $(PYTHON).
>>>>> While there fix misra document conversion script to be executable.
>>>>>
>>>>> Fixes: 57caa53753 (xen: Add MISRA support to cppcheck make rule)
>>>>> Fixes: 43aa3f6e72 xen/build: Add cppcheck and cppcheck-html make rules
>>>> Nit: These two titles would want expressing consistently. If I
>>>> end up committing this, I'll try to remember to adjust.
>>>
>>> There are actually a few issues with the Fixes tags. From the doc [1] :
>>> - the sha1 should be 12 characters (rather than 10)
>>> - the format should be:
>>> Fixes: <comidid> ("Commit title")
>>
>> You want me to resend and fix that ?

If Jan doesn't want to fix it on commit. Then I would be happy to do it.

>>
>> On the 12 chars one, I must admit I used git log —oneline and did not count.
>> Any particular reason to use 12 instead of the 10 that git log is giving ?

10 characters will often result to clash. 12 is known to be sufficient 
and also used by Linux.

>> Should we suggest how to get this properly in a simple manner ?
> 
> Meaning without changing the git config :-)

You could use

42sh> git log --abbrev=<N> --abbrev-commit

where N is the number of characters.

Cheers,

-- 
Julien Grall

