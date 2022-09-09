Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D905B33D6
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 11:29:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404016.646321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWaJz-0002rC-9X; Fri, 09 Sep 2022 09:29:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404016.646321; Fri, 09 Sep 2022 09:29:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWaJz-0002nj-6V; Fri, 09 Sep 2022 09:29:11 +0000
Received: by outflank-mailman (input) for mailman id 404016;
 Fri, 09 Sep 2022 09:29:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oWaJx-0002nU-7L
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 09:29:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWaJu-0005xY-4x; Fri, 09 Sep 2022 09:29:06 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.11.73]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWaJt-0008SB-TZ; Fri, 09 Sep 2022 09:29:06 +0000
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
	bh=OYWEndsuigTxfVwCTpaAjzjJElinrnZLsB7dLsfGigc=; b=MJrEzB++yAsqsapxKupAvQD/nw
	NsJT7WaTUQVi3CWwW97gYgoKVtm8WbyR4/CnLe4kQ6V3BsRnS8RkspRSLR3kG83sMgh7TDDIBuTC5
	v/BTmkUkHlZh9oB+IfbUnWk9/+vT6fpN8ecADfj70g2TB3yBTychCRx6mq+1Wel+mJo8=;
Message-ID: <79382cfc-9567-a3a3-e91f-6d242dc7c0ca@xen.org>
Date: Fri, 9 Sep 2022 10:29:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220909080944.28559-1-jgross@suse.com>
 <52ff1228-3092-c455-479d-315a16cfaaa6@suse.com>
 <77d2c3fa-7cee-6f86-215a-a95ce242a990@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <77d2c3fa-7cee-6f86-215a-a95ce242a990@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 09/09/2022 10:25, Juergen Gross wrote:
> On 09.09.22 11:15, Jan Beulich wrote:
>> On 09.09.2022 10:09, Juergen Gross wrote:
>>> Commit 9dc46386d89d ("gnttab: work around "may be used uninitialized"
>>> warning") was wrong, as vaddr can legitimately be NULL in case
>>> XENMEM_resource_grant_table_id_status was specified for a grant table
>>> v1. This would result in crashes in debug builds due to
>>> ASSERT_UNREACHABLE() triggering.
>>>
>>> Basically revert said commit, but keep returning -ENODATA in that case.
>>>
>>> Fixes: 9dc46386d89d ("gnttab: work around "may be used uninitialized" 
>>> warning")
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> Might be considered for 4.17 and for backporting
>>> ---
>>>   xen/common/grant_table.c | 14 +++-----------
>>>   1 file changed, 3 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
>>> index ad773a6996..68e7f1df38 100644
>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -4125,7 +4125,10 @@ int gnttab_acquire_resource(
>>>       case XENMEM_resource_grant_table_id_status:
>>>           if ( gt->gt_version != 2 )
>>> +        {
>>> +            rc = -ENODATA;
>>>               break;
>>> +        }
>>
>> This path is supposed to produce -EINVAL.
> 
> Okay.
> 
>>
>>> @@ -4135,17 +4138,6 @@ int gnttab_acquire_resource(
>>>           break;
>>>       }
>>> -    /*
>>> -     * Some older toolchains can't spot that vaddrs won't remain 
>>> uninitialized
>>> -     * on non-error paths, and hence it needs setting to NULL at the 
>>> top of the
>>> -     * function.  Leave some runtime safety.
>>> -     */
>>> -    if ( !vaddrs )
>>
>> I guess this wants amending by "&& !rc"?
> 
> I can do that, if you like that better.

I would prefer that as well. Although I think it would be clear if we write

"
if ( rc )
    return rc
  else if ( !vaddrs )
"

Cheers,

-- 
Julien Grall

