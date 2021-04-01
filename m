Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3046235157B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 16:04:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104515.199969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxva-0001Zp-QG; Thu, 01 Apr 2021 14:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104515.199969; Thu, 01 Apr 2021 14:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxva-0001ZQ-N0; Thu, 01 Apr 2021 14:04:06 +0000
Received: by outflank-mailman (input) for mailman id 104515;
 Thu, 01 Apr 2021 14:04:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lRxva-0001ZL-0B
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 14:04:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lRxvY-0007IN-NU; Thu, 01 Apr 2021 14:04:04 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lRxvY-0007p5-HG; Thu, 01 Apr 2021 14:04:04 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=oxS3dMoshd19B3V90o3bmPWkqypn36Zp+eVdVJW1c4E=; b=DkDO9Rlno7NY5lYiCLZ7bBxP7X
	vlz9rOT7z1KvqT4SMU23FIwKKlETSMy1V9pkwtE+4xTDmBZcPVpnQegio9UEzJKaTICvhPVf84HLm
	JSY4fwB4lLmsxWimFO7ov096OovcG1wvF18i05MfPgsBGQNoa71vf6q/QR6g2OJaTj4Y=;
Subject: Re: [PATCH 00/23] further population of xen/lib/
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
 <27916fa0-9ebd-a49a-bbb9-1ef47c2b5bf6@xen.org>
 <4f745d03-baa8-e9e6-692c-f9c9f401b766@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6a38f0db-938b-fd13-48e6-6b538c85fe42@xen.org>
Date: Thu, 1 Apr 2021 15:04:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4f745d03-baa8-e9e6-692c-f9c9f401b766@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 01/04/2021 14:43, Jan Beulich wrote:
> On 01.04.2021 13:54, Julien Grall wrote:
>> On 01/04/2021 11:14, Jan Beulich wrote:
>>> This is to dissolve / move xen/common/lib.c and xen/common/string.c.
>>> One benefit of moving these functions into an archive is that we can
>>> drop some of the related __HAVE_ARCH_* #define-s: By living in an
>>> archive, the per-arch functions will preempt any loading of the
>>> respective functions (objects) from the archive. (Down the road we
>>> may want to move the per-arch functions into archives as well, at
>>> which point the per-arch archive(s) would need to be specified ahead
>>> of the common one(s) to the linker.)
>>
>> While I think it is a good idea to move code in xen/lib, I am not
>> convinced that having a single function per file is that beneficial.
>>
>> Do you have numbers showing how much Xen will shrink after this series?
> 
> In the default build, from all I was able to tell, there's one function
> that's unused (strspn(), as mentioned in the respective patch description).
> I don't think I've been claiming any space savings here, though, so I

You didn't. I was trying to guess why you wrote this series given that 
your cover letter doesn't provide a lot of benefits (other than dropping 
__HAVE_ARCH_*).

> wonder why you make this a criteria at all.

Because this is the main reason I would be willing to ack this series. 
This outweight the increase number of files with just a single function 
implemented.

> The functions being one per
> CU is such that they can be individually overridden by an arch, without
> pulling in dead code.

I would agree with functions like memcpy/memset() because you can gain a 
lot to outweight the implementation in assembly. I am not convinced this 
would be true for functions such as strlen().

So overall, the number of functions requiring overriding will likely be 
pretty limited and #ifdef would be IMHO tolerable.

Although, I would be OK with creating a file per function that are 
already overrided. For all the others, I think this is just pointless.

Cheers,

-- 
Julien Grall

