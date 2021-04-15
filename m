Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 410FA360BBA
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 16:22:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111263.212780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2tG-00084e-BG; Thu, 15 Apr 2021 14:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111263.212780; Thu, 15 Apr 2021 14:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2tG-00084I-82; Thu, 15 Apr 2021 14:22:42 +0000
Received: by outflank-mailman (input) for mailman id 111263;
 Thu, 15 Apr 2021 14:22:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lX2tF-00084C-Fl
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 14:22:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36129436-dbe9-4e4b-a0ba-1ad624e744c2;
 Thu, 15 Apr 2021 14:22:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0DE2DAF79;
 Thu, 15 Apr 2021 14:22:40 +0000 (UTC)
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
X-Inumbo-ID: 36129436-dbe9-4e4b-a0ba-1ad624e744c2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618496560; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1IPtRFErwYfDHMEq0K5fG1FI5xXzh8w7kMgqtY5TcfI=;
	b=iUgEL7lMyfqCWi7w1BObpr+AjAt2ySaAa3e6YS20prxMdhB78ZAGwS/7rDWDS3K6YsM1ch
	YLL/YIljh4h8/SQiJbRbwATcj3b4qKj//A0O2vXfW9JOT1H/YZOQSH9uJQ+7T9KCRM/wtT
	ZPFy23Et0I0OAxcm/dVWa0H7GULVcuM=
Subject: Re: [PATCH v3 12/15] unxz: replace INIT{,DATA} and STATIC
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
 <4e0a0db2-db34-a738-2f5e-1d5cd2c37e19@suse.com>
 <c52c9670-d87e-79f9-0104-e6e074419c31@xen.org>
 <a9adf993-0f2d-acb1-b671-7b8c3b15b4d8@suse.com>
 <eaf819a8-985f-d33f-902d-58320c99a8d8@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1a3f4d72-d57a-dde3-fb46-c91508f09b2a@suse.com>
Date: Thu, 15 Apr 2021 16:22:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <eaf819a8-985f-d33f-902d-58320c99a8d8@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.04.2021 16:18, Julien Grall wrote:
> 
> 
> On 15/04/2021 15:16, Jan Beulich wrote:
>> On 15.04.2021 13:58, Julien Grall wrote:
>>> On 26/01/2021 09:52, Jan Beulich wrote:
>>>> --- a/xen/common/decompress.h
>>>> +++ b/xen/common/decompress.h
>>>> @@ -9,7 +9,6 @@
>>>>    
>>>>    #define STATIC static
>>>>    #define INIT __init
>>>> -#define INITDATA __initdata
>>>>    
>>>>    #define malloc xmalloc_bytes
>>>>    #define free xfree
>>>> @@ -21,7 +20,6 @@
>>>>    
>>>>    #define STATIC static
>>>>    #define INIT
>>>> -#define INITDATA
>>>
>>> Shouldn't the two changes be part of patch #14?
>>
>> One could do it that way, sure, but the last uses are gone here,
>> and hence I wanted to get rid of this one item right away.
> 
> AFAICT, the same is true for STATIC and INIT. So it doesn't sense to not 
> be consistent in the way you treat them.

No, further uses of STATIC and INIT get dropped by later patches.

Jan

