Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 810385B32F9
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 11:12:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403971.646255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWa3o-00069k-I7; Fri, 09 Sep 2022 09:12:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403971.646255; Fri, 09 Sep 2022 09:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWa3o-00066Z-Et; Fri, 09 Sep 2022 09:12:28 +0000
Received: by outflank-mailman (input) for mailman id 403971;
 Fri, 09 Sep 2022 09:12:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oWa3n-00066R-B8
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 09:12:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWa3h-0005eB-7y; Fri, 09 Sep 2022 09:12:21 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.11.73]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWa3h-0007vN-1M; Fri, 09 Sep 2022 09:12:21 +0000
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
	bh=sV+BSW1mGd8DPZbM7pXw76q/NvxaaMCD6kRuWPkJOCU=; b=BmdLE8m+gPpx5Sy7pMQYRnW7DE
	PFDk+N3btCDQ/5ZOGMhnt9cnG56RjoseF7sSo/aNCTAaT3RJ+iWQ+hvgJ9iYLGG0O2h5FyJ+hYgqO
	QEcNyTNYQD44YOjzhisLXw8aQBF8o01T9aCMQVvHObHJcavuH08nK6bgQzRu1Z3v3qyA=;
Message-ID: <ea6fbe3b-b33b-137b-86fc-2d4ebf5025c5@xen.org>
Date: Fri, 9 Sep 2022 10:12:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220909080944.28559-1-jgross@suse.com>
 <AS8PR08MB79918E22F292563B320F502592439@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <29e45aa2-910e-33ae-cdaa-be2f9e9d2942@xen.org>
 <a01caa0f-9db2-e1a9-1330-5bec6e9b4009@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a01caa0f-9db2-e1a9-1330-5bec6e9b4009@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 09/09/2022 10:10, Jan Beulich wrote:
> On 09.09.2022 11:04, Julien Grall wrote:
>> Unrelated to this patch, but as this is your first Released-acked-by
>> tag, I wanted to check the policy going forward.
>>
>>   From now, will any new patch need your approval before been merged?
> 
> It was my understanding (from past releases) that bug fixes would be
> fine to go in without until code freeze (in 3 weeks as per the current
> schedule).
This is my understanding as well. But I wanted to check with Henry just 
in case he decided something different.

Cheers,

-- 
Julien Grall

