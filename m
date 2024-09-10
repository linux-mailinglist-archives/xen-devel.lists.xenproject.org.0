Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABAD97321A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:18:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795286.1204580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxwg-0006nF-M0; Tue, 10 Sep 2024 10:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795286.1204580; Tue, 10 Sep 2024 10:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxwg-0006km-JO; Tue, 10 Sep 2024 10:18:02 +0000
Received: by outflank-mailman (input) for mailman id 795286;
 Tue, 10 Sep 2024 10:18:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W0jq=QI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1snxwf-0006ke-6v
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:18:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4f56364-6f5d-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 12:18:00 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id D33C84EE07A5;
 Tue, 10 Sep 2024 12:17:59 +0200 (CEST)
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
X-Inumbo-ID: f4f56364-6f5d-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725963479; bh=vd48NYPv1hQfgAFaz+IETF5DS0GT7eFU3AfR4ZKF5hs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BZSP3Ks/jQBgS2Ee4kdIxWtFkpxdP05Wqksaenm6wX6+4HXA+L5PZgUtSaSSlTYAL
	 GN5ptg2PxWIYbRS4q1GIlWFVaqAiwBwuGhSLxduqJtYO93cCwF7EZye+hVjxzcD8En
	 XzfZnSAicVvWPek6xRUFrVYRVCu67Gu0bHqzQ13RgL9W+tZ1EeWlFAchxs5XOXa3OM
	 MTo6y8JxRcjMxbRV1lk6oTSYK3mvBoa1Frzcb42OLd+xZXN5ML/H7pfOKBGhEDfNX1
	 YDRbt2DqCSv//lde3jUl+5Mi9qbUQF/i7P7Q9mxA3d++OGbb8sz6xhPev//gfYZfNd
	 +sNmCMNG/bcng==
MIME-Version: 1.0
Date: Tue, 10 Sep 2024 12:17:59 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2] x86: p2m-pod: address violation of MISRA C Rule
 2.1
In-Reply-To: <38c34b50-56a5-498a-8ed6-d57a8f02a964@suse.com>
References: <43b3a42f9d323cc3f9747c56e8f59f9dffa69321.1719556140.git.nicola.vetrini@bugseng.com>
 <38b57a6f-187c-440a-b3b4-9e7e124e1802@suse.com>
 <25b6a974b7c9aaec32b11930168148a5@bugseng.com>
 <4e54f8e0-43ce-4dd6-b1b4-cf72b59d96be@suse.com>
 <1a139b44effdeefab6b3e0ee7ae0c43d@bugseng.com>
 <38c34b50-56a5-498a-8ed6-d57a8f02a964@suse.com>
Message-ID: <3f3f43e894a2b9e506dcfba38a578880@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-09-10 12:03, Jan Beulich wrote:
> On 10.09.2024 11:53, Nicola Vetrini wrote:
>> On 2024-09-10 11:08, Jan Beulich wrote:
>>> On 10.09.2024 10:56, Nicola Vetrini wrote:
>>>> On 2024-07-01 10:36, Jan Beulich wrote:
>>>>> On 28.06.2024 08:30, Nicola Vetrini wrote:
>>>>> This being about unreachable code, why are the domain_crash() not 
>>>>> the
>>>>> crucial points of "unreachability"? And even if they weren't there,
>>>>> why
>>>>> wouldn't it be the goto or ...
>>>>> 
>>>>>> --- a/xen/arch/x86/mm/p2m-pod.c
>>>>>> +++ b/xen/arch/x86/mm/p2m-pod.c
>>>>>> @@ -1040,6 +1040,7 @@ out_unmap:
>>>>>>       * Something went wrong, probably crashing the domain.  Unmap
>>>>>>       * everything and return.
>>>>>>       */
>>>>>> +    /* SAF-8-safe Rule 2.1: defensive programming */
>>>>>>      for ( i = 0; i < count; i++ )
>>>>>>          if ( map[i] )
>>>>>>              unmap_domain_page(map[i]);
>>>>> 
>>>>> ... the label (just out of context) where the comment needs to go?
>>>> 
>>>> Because of the way this rule's configuration work, deviations are
>>>> placed
>>>> on the construct that ends up being the target of the 
>>>> unreachability,
>>> 
>>> What's "target" here? What if this loop was removed from the 
>>> function?
>>> Then both the label and the domain_crash() invocations would still be
>>> unreachable in debug builds. Are you telling me that this then 
>>> wouldn't
>>> be diagnosed by Eclair? Or that it would then consider the closing
>>> figure brace of the function "the target of the unreachability"?
>> 
>> Exactly, the end brace is a target to which the "function end" 
>> construct
>> is associated.
>> It would be kind of strange, though: why not just doing 
>> "domain_crash();
>> return;" in that case?
> 
> Sure, the question was theoretical. Now if "return" was used directly
> there, what would then be the "target"? IOW - the more abstract 
> question
> of my earlier reply still wasn't answered.
> 

The return statement in

...
domain_crash();
return;
<~~~~~>

Whichever statement is found to be unreachable in the current 
preprocessed code.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

