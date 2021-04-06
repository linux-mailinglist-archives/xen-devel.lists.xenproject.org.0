Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9FD355B4B
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 20:26:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106207.203126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTqP2-0006TG-DK; Tue, 06 Apr 2021 18:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106207.203126; Tue, 06 Apr 2021 18:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTqP2-0006Sr-A3; Tue, 06 Apr 2021 18:26:16 +0000
Received: by outflank-mailman (input) for mailman id 106207;
 Tue, 06 Apr 2021 18:26:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTqP0-0006Sm-FZ
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 18:26:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTqOv-0004fw-BY; Tue, 06 Apr 2021 18:26:09 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTqOv-0004Cj-4M; Tue, 06 Apr 2021 18:26:09 +0000
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
	bh=0b5sLwNEeehztREUU62IQW7PgLfii4IsKMXwP9NoywY=; b=fs/go8C4j/gVZZOHllM4d02HLB
	RLrLFLvFTd/yNm0aU9jdCxaQGjwF75DvuzxvI4hKmwk0FVU/9CPhGKmLnqeSAfp6Yx7Lycja484V0
	gsZTzDcB1+ZdVVXtbStFTk3g/zUSNEbBt00jpFPw6H6pD7DZRwycrEDEJLTO0H5zSs3E=;
Subject: Re: [PATCH 03/14] xen/x86: shadow: The return type of
 sh_audit_flags() should be const
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-4-julien@xen.org> <YGwMojJV0gCFa4fd@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <3108400e-8d3d-5878-b7ac-3dd9e5fe6ded@xen.org>
Date: Tue, 6 Apr 2021 19:26:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YGwMojJV0gCFa4fd@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Roger,

On 06/04/2021 08:24, Roger Pau Monné wrote:
> On Mon, Apr 05, 2021 at 04:57:02PM +0100, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The function sh_audit_flags() is returning pointer to literal strings.
>> They should not be modified, so the return is now const and this is
>> propagated to the callers.
>>
>> Take the opportunity to fix the coding style in the declaration of
>> sh_audit_flags.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> While doing the cleanup I think you could narrow the scope of the 's'
> variables also, but doesn't need to be part of this patch:

I think you are right. I will look at it as a follow-up.

> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks for the review!

Cheers,

-- 
Julien Grall

