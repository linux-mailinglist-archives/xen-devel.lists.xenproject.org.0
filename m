Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E86F559FB0
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 19:34:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355787.583663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4nCP-0005XG-4U; Fri, 24 Jun 2022 17:34:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355787.583663; Fri, 24 Jun 2022 17:34:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4nCP-0005VT-1c; Fri, 24 Jun 2022 17:34:29 +0000
Received: by outflank-mailman (input) for mailman id 355787;
 Fri, 24 Jun 2022 17:34:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4nCO-0005VN-Ai
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 17:34:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4nCO-0003vV-1r; Fri, 24 Jun 2022 17:34:28 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.4.76])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4nCN-0003E5-Rl; Fri, 24 Jun 2022 17:34:27 +0000
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
	bh=GsUC9d5Wa3NI82Wm9SG0/Kl9J6u9HHEBs422+GYu7gY=; b=S3ErcNhqCedS7+G1NfFVYD7ce7
	WKZIUJjGJw8/nEXMsUAofsSpjflBfERbxDOH4joC2Jya2koAKtLrrC8Bp1UVgDcLpmexc9n36tl2o
	1wSoqceWPYtGOJDCTA5neuu/E9kMdAewKwF14Og/9pvp23ksaS2f1tNjFZ3pPVUWIRSI=;
Message-ID: <7561bb54-a96b-0b18-f953-3ad3babf9f22@xen.org>
Date: Fri, 24 Jun 2022 18:34:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/4] tools/xenstore: add documentation for new
 set/get-feature commands
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220527072427.20327-1-jgross@suse.com>
 <20220527072427.20327-3-jgross@suse.com>
 <4f8f6cf3-3aee-9128-df09-d3957c233c42@xen.org>
 <258f4579-7c24-dd98-d4ce-1155b1da8759@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <258f4579-7c24-dd98-d4ce-1155b1da8759@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 24/06/2022 05:13, Juergen Gross wrote:
> On 23.06.22 20:27, Julien Grall wrote:
>> On 27/05/2022 08:24, Juergen Gross wrote:
>>> Add documentation for two new Xenstore wire commands SET_FEATURE and
>>> GET_FEATURE used to set or query the Xenstore features visible in the
>>> ring page of a given domain.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> Do we need support in the migration protocol for the features?
>>
>> I would say yes. You want to make sure that the client can be migrated 
>> without loosing features between two xenstored.
>>
>>> V2:
>>> - remove feature bit (Julien Grall)
>>> - GET_FEATURE without domid will return Xenstore supported features
>>>    (triggered by Julien Grall)
>>> ---
>>>   docs/misc/xenstore.txt | 14 ++++++++++++++
>>>   1 file changed, 14 insertions(+)
>>>
>>> diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
>>> index a3d3da0a5b..00f6969202 100644
>>> --- a/docs/misc/xenstore.txt
>>> +++ b/docs/misc/xenstore.txt
>>> @@ -331,6 +331,20 @@ SET_TARGET        <domid>|<tdomid>|
>>>       xenstored prevents the use of SET_TARGET other than by dom0.
>>> +GET_FEATURE        [<domid>|]        <value>|
>>> +SET_FEATURE        <domid>|<value>|
>>> +    Returns or sets the contents of the "feature" field located at
>>> +    offset 2064 of the Xenstore ring page of the domain specified by
>>> +    <domid>. <value> is a decimal number being a logical or of the
>>
>> In the context of migration, I am stilll a bit concerned that the 
>> features are stored in the ring because the guest could overwrite it.
>>
>> I would expect the migration code to check that the GET_FEATURE 
>> <domid> is a subset of GET_FEATURE on the targeted Xenstored. So it 
>> can easily prevent a guest to migrate.
>>
>> So I think this should be a shadow copy that will be returned instead 
>> of the contents of the "feature" field.
> 
> Of course. The value in the ring is meant only for the guest. Xenstore
> will have the authoritative value in its private memory.

Good. I would suggest to clarify it in xenstore.txt because it suggests 
otherwise so far.

>>> +    feature bits as defined in docs/misc/xenstore-ring.txt. Trying
>>> +    to set a bit for a feature not being supported by the running
>>> +    Xenstore will be denied. Providing no <domid> with the
>>> +    GET_FEATURE command will return the features which are supported
>>> +    by Xenstore.
>>
>> Do we want to allow modifying the features when the guest is running?
> 
> I think we can't remove features, but adding would be fine. For

Agree with removing features, regarding adding I think we would need a 
mechanism to tell the client there is a new feature. It would require 
some work, so...

> simplicity it might be better to just deny a modification while the
> guest is running.

... I agree this is probably best for a first shot. This can be relaxed 
afterwards.

Cheers,

-- 
Julien Grall

