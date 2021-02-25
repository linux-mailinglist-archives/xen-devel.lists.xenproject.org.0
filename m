Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB983254D9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 18:53:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89912.169867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKpF-0007u2-Nf; Thu, 25 Feb 2021 17:53:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89912.169867; Thu, 25 Feb 2021 17:53:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKpF-0007td-KL; Thu, 25 Feb 2021 17:53:21 +0000
Received: by outflank-mailman (input) for mailman id 89912;
 Thu, 25 Feb 2021 17:53:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lFKpE-0007tW-6M
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:53:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFKpC-00062V-2V; Thu, 25 Feb 2021 17:53:18 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFKpB-0003iN-Pt; Thu, 25 Feb 2021 17:53:17 +0000
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
	bh=Ie01WITm9WmXn52XbujX95vhQugB0mW2LjRGpKPcuCs=; b=a4qomH4pT7tTWEhpOQtm+C7fe6
	vGR466bHXIhcQ3h7gsJDTQfjKoqOGMXecVduZtRsSOP1H9jSX9woxIl4bMYeJJPEZmiD4KumRPTw0
	ZUnv/UGLjcM2SzeUNyy//GR4+KkP1ZgzRYXfBpMy/I7DtP4qcsCo27ONOriDG01WPrPc=;
Subject: Re: [PATCH for-4.15 5/5] tools/xenstored: Silence coverity when using
 xs_state_* structures
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <20210225174131.10115-1-julien@xen.org>
 <20210225174131.10115-6-julien@xen.org>
 <1d456d07-a27e-aa3a-1a0e-46d7e71ba1e7@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1ff6526c-3d8b-f41f-793f-82d4327e15d0@xen.org>
Date: Thu, 25 Feb 2021 17:53:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1d456d07-a27e-aa3a-1a0e-46d7e71ba1e7@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 25/02/2021 17:47, Andrew Cooper wrote:
> On 25/02/2021 17:41, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Coverity will report unitialized values for every use of xs_state_*
>> structures in the save part. This can be prevented by using the [0]
>> rather than [] to define variable length array.
>>
>> Coverity-ID: 1472398
>> Coverity-ID: 1472397
>> Coverity-ID: 1472396
>> Coverity-ID: 1472395
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>
>>  From my understanding, the tools and the hypervisor already rely on GNU
>> extensions. So the change should be fine.
>>
>> If not, we can use the same approach as XEN_FLEX_ARRAY_DIM.
> 
> Linux has recently purged the use of [0] because it causes sizeof() to
> do unsafe things.

Do you have a link to the Linux thread?

> 
> Flexible array members is a C99 standard - are we sure that Coverity is
> doing something wrong with them?
I have run coverity with one of the structure switched to [0] and it 
removed the unitialized warning for that specific one.

So clearly coverity is not happy with []. Although, I am not sure why.

Do you have a suggestion how to approach the problem?

Cheers,

-- 
Julien Grall

