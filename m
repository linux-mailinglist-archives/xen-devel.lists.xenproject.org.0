Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1D2360C1C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 16:46:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111318.212904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX3Fj-0002mW-Nc; Thu, 15 Apr 2021 14:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111318.212904; Thu, 15 Apr 2021 14:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX3Fj-0002m7-KJ; Thu, 15 Apr 2021 14:45:55 +0000
Received: by outflank-mailman (input) for mailman id 111318;
 Thu, 15 Apr 2021 14:45:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lX3Fi-0002m2-Df
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 14:45:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX3Fh-0001pY-D5; Thu, 15 Apr 2021 14:45:53 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX3Fh-0008A7-3a; Thu, 15 Apr 2021 14:45:53 +0000
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
	bh=bwrtqTabdqwBUteMA3h8oCrjrdDQq7TNKoYz4L8jTSI=; b=rOaO6t2iDIAXSTimYxps/5R6do
	ufcDeR1w7Yt1dNtyY63rfsjxr89R/7t9HrVuSPTnthZhaUFNjUoeQq2V/nrrNZ6SYLWM+4IoodAvB
	ODqZIiitxwBUJm1dF44vdmPuUYUVd9AG67/suvc1wwx2QTKsnhd9mTvQ+Dz19FfWGv7A=;
Subject: Re: [PATCH v3 14/15] xen/decompress: drop STATIC and INIT
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
 <b9410d49-8767-a6f2-ccbe-c94e451c60ba@suse.com>
 <e36f9026-edb6-5eb3-fdb2-cd00750b3ee7@xen.org>
 <39c092fe-052c-5900-74ef-310e0ae15453@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4bc3913a-89ba-5b5d-9cf2-301bf10cbf14@xen.org>
Date: Thu, 15 Apr 2021 15:45:51 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <39c092fe-052c-5900-74ef-310e0ae15453@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 15/04/2021 15:32, Jan Beulich wrote:
> On 15.04.2021 16:21, Julien Grall wrote:
>> On 26/01/2021 09:53, Jan Beulich wrote:
>>> All users have been removed in earlier changes.
>>
>> This is not entirely correct given there is a still a user of...
>>
>>>
>>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> v3: New.
>>>
>>> --- a/xen/arch/arm/efi/efi-dom0.c
>>> +++ b/xen/arch/arm/efi/efi-dom0.c
>>> @@ -28,7 +28,7 @@
>>>    #include <asm/setup.h>
>>>    #include <asm/acpi.h>
>>>    #include "../../../common/decompress.h"
>>> -#define XZ_EXTERN STATIC
>>> +#define XZ_EXTERN static
>>
>> STATIC here. So maybe you want to say "all but one users"?
> 
> Sigh. Of course I re-word this. But does it really matter? 

Just consistency between the diff and the commit message.

> The
> more that the thing here is more of an abuse than a proper use
> anyway? I didn't create this hackery ... In fact this odd use
> is why I made this a separate patch in the first place.
>> Also, for consistency, I think you want to either remove INITDATA here
>> or remove INIT in the patch that drop the last user.
> 
> See my other reply - what matters, I think, is a consistent
> end result. I would really like to ask that I be left with some
> room on how precisely to get there.

I thought I would point out because we often request to shuffle code to 
make a series more logical.

This is not a must to me. The code is fine it is.

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

