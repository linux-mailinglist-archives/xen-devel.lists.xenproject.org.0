Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8305B32BB
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 11:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403946.646221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWZwM-0003Fg-4k; Fri, 09 Sep 2022 09:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403946.646221; Fri, 09 Sep 2022 09:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWZwM-0003CJ-23; Fri, 09 Sep 2022 09:04:46 +0000
Received: by outflank-mailman (input) for mailman id 403946;
 Fri, 09 Sep 2022 09:04:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oWZwL-0003CD-02
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 09:04:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWZwK-0005UQ-1c; Fri, 09 Sep 2022 09:04:44 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.11.73]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWZwJ-0007RK-Rc; Fri, 09 Sep 2022 09:04:43 +0000
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
	bh=dxdz9bYcxibHtpA4dSaMTjGhqAloKbcBGjdm6eAbM4k=; b=s7DvgpLK2mBYKww1vLRikMAUsf
	WiJROxtJatjIt0LRFqpRS+DVLDY+/bZ6zFTqarsq90/BzVGAFNpeJG9E6WPAGhHSYC8T5eJsd8IhW
	wsLVIlv6qmwSJMLfrLFVGVJaCL3ydS/N69IZ0TfAfglhCiqTUfBV7bhdekLwcUaveuRs=;
Message-ID: <29e45aa2-910e-33ae-cdaa-be2f9e9d2942@xen.org>
Date: Fri, 9 Sep 2022 10:04:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220909080944.28559-1-jgross@suse.com>
 <AS8PR08MB79918E22F292563B320F502592439@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB79918E22F292563B320F502592439@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 09/09/2022 09:47, Henry Wang wrote:
>> -----Original Message-----
>> From: Juergen Gross <jgross@suse.com>
>> Subject: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
>>
>> Commit 9dc46386d89d ("gnttab: work around "may be used uninitialized"
>> warning") was wrong, as vaddr can legitimately be NULL in case
>> XENMEM_resource_grant_table_id_status was specified for a grant table
>> v1. This would result in crashes in debug builds due to
>> ASSERT_UNREACHABLE() triggering.
>>
>> Basically revert said commit, but keep returning -ENODATA in that case.
>>
>> Fixes: 9dc46386d89d ("gnttab: work around "may be used uninitialized"
>> warning")
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> Might be considered for 4.17 and for backporting
> 
> Of course, feel free to add:
> 
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Unrelated to this patch, but as this is your first Released-acked-by 
tag, I wanted to check the policy going forward.

 From now, will any new patch need your approval before been merged?

Cheers,

-- 
Julien Grall

