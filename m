Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AACE572BF4B
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 12:39:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546982.854123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8exF-0002Li-Qw; Mon, 12 Jun 2023 10:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546982.854123; Mon, 12 Jun 2023 10:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8exF-0002JZ-OK; Mon, 12 Jun 2023 10:39:21 +0000
Received: by outflank-mailman (input) for mailman id 546982;
 Mon, 12 Jun 2023 10:39:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q8exE-0002J8-7Q
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 10:39:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q8exD-000410-Aa; Mon, 12 Jun 2023 10:39:19 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q8exD-0006hf-33; Mon, 12 Jun 2023 10:39:19 +0000
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
	bh=lpAUEBrhc916bsDup1vsTCIzzVnPp97Sd4hzhuCXjRY=; b=lYoo1NXpTNr2DQnJLgZmDpT936
	nPemmWJ0YcrB7HAWOGam2Fvz2exsT7I34b9Df4BYRWe+8ULXQZyiPOcNxdQC/oIq4I6mYkSnymAc3
	Q+RrFrTYEVRSJLsITwOyIrHum1TUEzPE+MgXF7CnltRI16CVMQXIE9JhPOvcJZVVIBE8=;
Message-ID: <1e4ed7c3-e949-7a77-053d-f987b44fa73a@xen.org>
Date: Mon, 12 Jun 2023 11:39:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v3 10/16] tools/libs/store: use xen_list.h instead of
 xenstore/list.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530085418.5417-1-jgross@suse.com>
 <20230530085418.5417-11-jgross@suse.com>
 <5eee062b-8028-bc5e-2a5c-2422430894e6@xen.org>
 <b34ce9b4-f289-c836-17d6-fcdd105f301f@suse.com>
 <f51554bf-616b-b568-a33b-1585878a1e19@xen.org>
 <8dcedf30-996c-6746-5788-253e07ff8467@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8dcedf30-996c-6746-5788-253e07ff8467@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/06/2023 11:37, Juergen Gross wrote:
> On 12.06.23 12:34, Julien Grall wrote:
>> Hi,
>>
>> On 12/06/2023 08:02, Juergen Gross wrote:
>>> On 09.06.23 20:09, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> On 30/05/2023 09:54, Juergen Gross wrote:
>>>>> Replace the usage of the xenstore private list.h header with the
>>>>> common xen_list.h one.
>>>>>
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>> ---
>>>>> V3:
>>>>> - new patch
>>>>> ---
>>>>>   tools/libs/store/xs.c | 56 
>>>>> +++++++++++++++++++++----------------------
>>>>>   1 file changed, 28 insertions(+), 28 deletions(-)
>>>>>
>>>>> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
>>>>> index 7a9a8b1656..3813b69ae2 100644
>>>>> --- a/tools/libs/store/xs.c
>>>>> +++ b/tools/libs/store/xs.c
>>>>> @@ -35,13 +35,13 @@
>>>>>   #include <errno.h>
>>>>>   #include "xenstore.h"
>>>>>   #include "xs_lib.h"
>>>>> -#include "list.h"
>>>>>   #include "utils.h"
>>>>>   #include <xentoolcore_internal.h>
>>>>> +#include <xen_list.h>
>>>>>   struct xs_stored_msg {
>>>>> -    struct list_head list;
>>>>> +    XEN_TAILQ_ENTRY(struct xs_stored_msg) list;
>>>>
>>>> I have expected us to use to XEN_LIST_*. Can you explain why you 
>>>> didn't use them?
>>>
>>> XEN_LIST_* doesn't provide a list_add_tail() replacement.
>>
>> Ok. Did you look at whether list_add_tail() could be replaced with 
>> adding the element at the head?
>>
>> Anyway, I can understand that this would not be a straight swap. But 
>> it would be good to have some rationale in the commit message as this 
>> helps understanding the choice.
> 
> Okay, I'll add: "Use the XEN_TAILQ type list, as it allows to directly 
> swap the
> related macros/functions without having to change the logic."

Thanks. I am happy to add it whilst committing.

Cheers,

-- 
Julien Grall

