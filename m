Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C43C6F0B0A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 19:39:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527046.819216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps5Z8-0007Wm-WF; Thu, 27 Apr 2023 17:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527046.819216; Thu, 27 Apr 2023 17:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps5Z8-0007UV-TP; Thu, 27 Apr 2023 17:37:58 +0000
Received: by outflank-mailman (input) for mailman id 527046;
 Thu, 27 Apr 2023 17:37:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ps5Z7-0007UP-Fz
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 17:37:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ps5Z7-0002vV-69; Thu, 27 Apr 2023 17:37:57 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.9.197]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ps5Z6-0007NK-VB; Thu, 27 Apr 2023 17:37:57 +0000
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
	bh=80QuypVd/flItxQaXZXwpsaWYPqJBcbdQNMI2g0RKPA=; b=ce39Es+cd7VCBVDRArsyMTPMrm
	KQKitOW6tUy0EOOKg72bescPnUS3TRjpc5sNaJfTsNMBsQt/JibCuhOckpc8ua5GECvoOL28Xn56y
	LrjF3ZliXmYwRWiJhF/kaQmBxubp9Ui0XJF2aUjNjbhkBFuZ9bFFQW3hmIjZwHpWZ+LA=;
Message-ID: <d9c6df98-2b38-4a4b-8228-04ce072b3b56@xen.org>
Date: Thu, 27 Apr 2023 18:37:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 00/13] tools/xenstore: rework internal accounting
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230405070349.25293-1-jgross@suse.com>
 <6807cae6-16e1-b041-5492-15eda6732275@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6807cae6-16e1-b041-5492-15eda6732275@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 26/04/2023 08:19, Juergen Gross wrote:
> On 05.04.23 09:03, Juergen Gross wrote:
>> This series reworks the Xenstore internal accounting to use a uniform
>> generic framework. It is adding some additional useful diagnostic
>> information, like accounting trace and max. per-domain and global quota
>> values seen.
>>
>> Changes in V2:
>> - added patch 1 (leftover from previous series)
>> - rebase
>>
>> Changes in V3:
>> - addressed comments
>>
>> Changes in V4:
>> - fixed patch 3
> 
> Another thought for this series and followup one:
> 
> Do we want to keep current coding style in tools/xenstore (basically
> Linux kernel style), or do we want to switch to Xen style instead?

I am a bit split on this one. I don't particularly like the Linux coding 
style, but it has the advantage to be well-documented (if we compare to 
the Xen one).

May I ask what would be the reason to switch?

> 
> If a switch to Xen style is preferred (I do prefer that switch), I'd
> like to suggest that I do a rework of this series and the followup one
> to use the Xen style for new or moved functions.

I think this is a bad idea because it would make difficult for a 
developer/reviewer to know what is the coding style of a given function.

At least in my workflow, it would also means that I need two open the 
file twice with different settings (e.g. soft vs hard tab).

> 
> A more radical approach would be to do a large style switch series
> after the two series, but I'm hesitant as this would affect backports
> rather badly.

In general, I would agree with that. But, after your work, I am under 
the impression that Xenstored will become quite different. So I am not 
convince we will be able to backports a lot of patch without significant 
rework.

Therefore, converting all the files in one pass may not be too bad 
(assuming we agree on switching to the new coding style).

Cheers,

-- 
Julien Grall

