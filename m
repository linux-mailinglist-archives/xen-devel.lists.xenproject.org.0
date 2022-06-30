Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7353F562232
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 20:39:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358673.587970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6z3z-00022g-OB; Thu, 30 Jun 2022 18:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358673.587970; Thu, 30 Jun 2022 18:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6z3z-000205-Lb; Thu, 30 Jun 2022 18:38:51 +0000
Received: by outflank-mailman (input) for mailman id 358673;
 Thu, 30 Jun 2022 18:38:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o6z3y-0001zz-A3
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 18:38:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6z3y-0002VE-7n; Thu, 30 Jun 2022 18:38:50 +0000
Received: from [54.239.6.182] (helo=[10.95.73.91])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6z3y-0000jw-1t; Thu, 30 Jun 2022 18:38:50 +0000
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
	bh=OQpsZkzuNqW0jNbsgmu7rgznVeDDHQswnpLellJCMNg=; b=5O7HEOxJkS8ieLo8C7ru4cp8MO
	2O0VGE4829t78LgT/toCUbbhcDadcj7xvLLf7Z0GttOVqo0hXVfgyVT/OaarjflL3FEzkKkJ/5YNl
	lIjxh5JXkris3iMOKcose2TQapLRxIf5vwAW1jTHtDp7jtaNi0le5qgpwNA0pRUabtGc=;
Message-ID: <62b8dcc6-f2f0-7821-4402-9c4637a121c9@xen.org>
Date: Thu, 30 Jun 2022 19:38:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] public/io: xs_wire: Allow Xenstore to report EPERM
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, Julien Grall <jgrall@amazon.com>
References: <20220627123635.3416-1-julien@xen.org>
 <20220627123635.3416-3-julien@xen.org>
 <2d95bb8c-c89d-c5d7-4171-12ba64721480@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2d95bb8c-c89d-c5d7-4171-12ba64721480@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 27/06/2022 15:52, Juergen Gross wrote:
> On 27.06.22 14:36, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> C Xenstored is using EPERM when the client is not allowed to change
>> the owner (see GET_PERMS). However, the xenstore protocol doesn't
>> describe EPERM so EINVAL will be sent to the client.
>>
>> When writing test, it would be useful to differentiate between EINVAL
>> (e.g. parsing error) and EPERM (i.e. no permission). So extend
>> xsd_errors[] to support return EPERM.
>>
>> Looking at previous time xsd_errors was extended (8b2c441a1b), it was
>> considered to be safe to add a new error because at least Linux driver
>> and libxenstore treat an unknown error code as EINVAL.
>>
>> This statement doesn't cover other possible OSes, however I am not
>> aware of any breakage.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks. I have committed this patch and respin the first one.

Cheers,

-- 
Julien Grall

