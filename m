Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F02FC5AFF80
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 10:45:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400997.642654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqfr-0007Qm-QM; Wed, 07 Sep 2022 08:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400997.642654; Wed, 07 Sep 2022 08:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqfr-0007OQ-MA; Wed, 07 Sep 2022 08:44:43 +0000
Received: by outflank-mailman (input) for mailman id 400997;
 Wed, 07 Sep 2022 08:44:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVqfq-0007OK-O4
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 08:44:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVqfq-0000oA-3j; Wed, 07 Sep 2022 08:44:42 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVqfp-0006Bc-P1; Wed, 07 Sep 2022 08:44:42 +0000
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
	bh=PwSD9Z9/gjYJjqG/fUwrwQTyB8NO6mrSOGhquyflNrk=; b=ZqunzL7uy2w/gtic8f+yeQacuj
	6lpKMvc5SLLLE3hVV+o8SGOgDHjSnKuUVAG80kuurK5sFaZtlYbWzEYtZZ8nMlmRmMIvglHQDWVDa
	ibkvK0GXRp2A5Y9CzK3Flzk0a1wpG9K2BrNczdi0VheMBGmKM7PmZgyRDWalkhRR18yk=;
Message-ID: <1410d4ef-7b9a-6567-74f1-f900602f5d8f@xen.org>
Date: Wed, 7 Sep 2022 09:44:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v4 4/4] tools/xenstore: add migration stream extensions
 for new features
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220905124746.1975-1-jgross@suse.com>
 <20220905124746.1975-5-jgross@suse.com>
 <adc4143d-9f75-bac7-19c0-debde8a710b9@xen.org>
 <48bdfa39-ce5a-6d48-0bb4-8a0270e181c9@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <48bdfa39-ce5a-6d48-0bb4-8a0270e181c9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 07/09/2022 07:28, Juergen Gross wrote:
> On 06.09.22 19:27, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 05/09/2022 13:47, Juergen Gross wrote:
>>> Extend the definition of the Xenstore migration stream to cover new
>>> features:
>>>
>>> - per domain features
>>> - extended watches (watch depth)
>>> - per domain quota
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> V3:
>>> - new patch
>>> V4:
>>> - add new record types instead of modifying the existing ones
>>>    (Julien Grall)
>>> ---
>>>   docs/designs/xenstore-migration.md | 160 ++++++++++++++++++++++++++++-
>>>   1 file changed, 155 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/docs/designs/xenstore-migration.md 
>>> b/docs/designs/xenstore-migration.md
>>> index efa526f420..c70505c43a 100644
>>> --- a/docs/designs/xenstore-migration.md
>>> +++ b/docs/designs/xenstore-migration.md
>>> @@ -43,7 +43,14 @@ the setting of the endianness bit.
>>>   |-----------|---------------------------------------------------|
>>>   | `ident`   | 0x78656e73746f7265 ('xenstore' in ASCII)          |
>>>   |           |                                                   |
>>> -| `version` | 0x00000001 (the version of the specification)     |
>>> +| `version` | The version of the specification, defined values: |
>>> +|           | 0x00000001: all fields and records without any    |
>>> +|           |             explicitly mentioned version          |
>>> +|           |             dependency are valid.                 |
>>> +|           | 0x00000002: all fields and records valid for      |
>>> +|           |             version 1 plus fields and records     |
>>> +|           |             explicitly stated to be supported in  |
>>> +|           |             version 2 are valid.                  |
>>
>> I think it would be useful to outline in the commit message why the 
>> version had to be bumped.
> 
> Okay.
> 
>>
>>>   |           |                                                   |
>>>   | `flags`   | 0 (LSB): Endianness: 0 = little, 1 = big          |
>>>   |           |                                                   |
>>> @@ -77,7 +84,10 @@ NOTE: padding octets here and in all subsequent 
>>> format specifications must be
>>>   |        | 0x00000003: WATCH_DATA                               |
>>>   |        | 0x00000004: TRANSACTION_DATA                         |
>>>   |        | 0x00000005: NODE_DATA                                |
>>> -|        | 0x00000006 - 0xFFFFFFFF: reserved for future use     |
>>> +|        | 0x00000006: GLOBAL_QUOTA_DATA                        |
>>> +|        | 0x00000007: DOMAIN_DATA                              |
>>> +|        | 0x00000008: WATCH_DATA_EXTENDED (version 2 and up)   |
>>> +|        | 0x00000009 - 0xFFFFFFFF: reserved for future use     |
>>>   |        |                                                      |
>>>   | `len`  | The length (in octets) of `body`                     |
>>>   |        |                                                      |
>>> @@ -129,6 +139,7 @@ xenstored state that needs to be restored.
>>>   | `evtchn-fd`    | The file descriptor used to communicate with |
>>>   |                | the event channel driver                     |
>>> +
>>
>> Spurious change?
> 
> Yes.
> 
>>
>>>   xenstored will resume in the original process context. Hence 
>>> `rw-socket-fd`
>>>   simply specifies the file descriptor of the socket. Sockets are not 
>>> always
>>>   used, however, and so -1 will be used to denote an unused socket.
>>> @@ -241,9 +252,9 @@ the file descriptor of the socket connection.
>>>   ### WATCH_DATA
>>> -The image format will contain a `WATCH_DATA` record for each watch 
>>> registered
>>> -by a connection for which there is `CONNECTION_DATA` record 
>>> previously present.
>>> -
>>> +The image format will contain either a `WATCH_DATA` or a 
>>> `WATCH_DATA_EXTENDED`
>>> +record for each watch registered by a connection for which there is
>>> +`CONNECTION_DATA` record previously present.
>>>   ```
>>>       0       1       2       3    octet
>>> @@ -406,6 +417,145 @@ A node permission specifier has the following 
>>> format:
>>>   Note that perm1 defines the domain owning the node. See [4] for more
>>>   explanation of node permissions.
>>> +\pagebreak
>>> +
>>> +### GLOBAL_QUOTA_DATA
>>> +
>>> +This record is only relevant for live update. It contains the global 
>>> settings
>>> +of xenstored quota.
>>> +
>>> +```
>>> +    0       1       2       3    octet
>>> ++-------+-------+-------+-------+
>>> +| n-dom-quota   | n-glob-quota  |
>>> ++---------------+---------------+
>>> +| quota-val 1                   |
>>> ++-------------------------------+
>>> +...
>>> ++-------------------------------+
>>> +| quota-val N                   |
>>> ++-------------------------------+
>>> +| quota-names
>>> +...
>>> +```
>>> +
>>> +
>>> +| Field          | Description                                  |
>>> +|----------------|----------------------------------------------|
>>> +| `n-dom-quota`  | Number of quota values which apply per       |
>>> +|                | domain.                                      |
>>
>> I would add "by default" or something similar to make clear that the 
>> value in DOMAIN_DATA will override any quota set here. But see below 
>> about 'n-dom-quota' and 'n-glob-quota'.
> 
> Okay.
> 
>>
>>> +|                |                                              |
>>> +| `n-glob-quota` | Number of quota values which apply globally  |
>>> +|                | only.                                        |
>>> +|                |                                              |
>>> +| `quota-val`    | Quota values, first the ones applying per    |
>>> +|                | domain, then the ones applying globally. A   |
>>> +|                | value of 0 has the semantics of "unlimited". |
>>
>> It is unclear to me why you need to make the distinction between "per 
>> domain" and "globally". IOW shouldn't be the name of the quota already 
>> indicates that?
> 
> I think it could help in special cases.
> 
> Imagine Xenstore A knows about global quota g and domain quota d, while
> Xenstore B doesn't know both. Initially I'm running Xenstore A on a
> host, then I'm live-updating to B.
> 
> B gets the information that g is global, and d is per-domain, but has no
> other idea what to do with the values of g and d. OTOH it knows that each
> new domain should get d with the related value, so it can set d for each
> newly created domain.
> 
> When B is either downgraded to A again, or a domain is migrated to another
> host running A, B can add the quota information of d for all domains.
> 
> While this is nothing I'm planning to do in the near future, it might help
> e.g. in cases with mixed C-xenstored and O-xenstored setups.
> 
> It doesn't cost really much, so I wanted to support this possibility in the
> migration stream from the beginning.

I can see the use-case. However...

> 
>>
>>> +|                |                                              |
>>> +| `quota-names`  | 0 delimited strings of the quota names in    |
>>> +|                | the same sequence as the `quota-val` values. |
>>> +
>>> +
>>> +Allowed quota names are those explicitly named in [2] for the 
>>> `GET_QUOTA`
>>> +and `SET_QUOTA` commands, plus implementation specific ones. Quota 
>>> names not
>>> +recognized by the receiving side must be ignored.

... this is seem to directly conflict with this sentence as to me 
"ignore" means drop. What you want is for Xenstore to optionally preserve.

Also, I think what you wrote above would be helpful in the commit 
message. It gives some insights for future reader on how the stream was 
designed.

>>> +
>>> +\pagebreak
>>> +
>>> +### DOMAIN_DATA
>>> +
>>> +This record is optional and can be present once for each domain.
>>> +
>>> +
>>> +```
>>> +    0       1       2       3     octet
>>> ++-------+-------+-------+-------+
>>> +| domain-id     | n-quota       |
>>> ++---------------+---------------+
>>> +| features                      |
>>> ++-------------------------------+
>>> +| quota-val 1                   |
>>> ++-------------------------------+
>>> +...
>>> ++-------------------------------+
>>> +| quota-val N                   |
>>> ++-------------------------------+
>>> +| quota-names
>>> +...
>>> +```
>>> +
>>> +
>>> +| Field          | Description                                  |
>>> +|----------------|----------------------------------------------|
>>> +| `domain-id`    | The domain-id of the domain this record      |
>>> +|                | belongs to.                                  |
>>> +|                |                                              |
>>> +| `n-quota`      | Number of quota values.                      |
>>> +|                |                                              |
>>> +| `features`     | Value of the feature field visible by the    |
>>> +|                | guest at offset 2064 of the ring page.       |
>>> +|                | Aligned to the next 4 octet boundary.        |
>>
>> Stale sentence?
> 
> Oh yes, a survivor of V3.
> 
>>
>>> +|                | Only valid for version 2 and later.          |
>>
>> Can you mention explicitly whether the field will unknown or 0 for 
>> version 1?
> 
> We have the general note "padding octets here and in all subsequent format
> specifications must be written as zero". I think this should suffice.

I don't view this field as padding because it has a meaning. So I argue 
it is not cover by the sentence.

Therefore I would add "Otherwise, the field is unknown/0" (pick the one 
you prefer between 0 and unknown).

> 
>>
>>> +|                |                                              |
>>> +| `quota-val`    | Quota values, a value of 0 has the semantics |
>>> +|                | "unlimited".                                 |
>>> +|                |                                              |
>>> +| `quota-names`  | 0 delimited strings of the quota names in    |
>>> +|                | the same sequence as the `quota-val` values. |
>>> +
>>> +Allowed quota names are those explicitly named in [2] for the 
>>> `GET_QUOTA`
>>> +and `SET_QUOTA` commands, plus implementation specific ones. Quota 
>>> names not
>>> +recognized by the receiving side must be ignored.
>>> +
>>> +\pagebreak
>>> +
>>> +### WATCH_DATA_EXTENDED
>>
>> NIT: I think it would be more logical if this is defined right next 
>> after WATCH_DATA.
> 
> I was following the record type numbering, but I can move this record
> description up if you like that better.
> 
>>
>>> +
>>> +The image format will contain either a `WATCH_DATA` or a 
>>> `WATCH_DATA_EXTENDED`
>>> +record for each watch registered by a connection for which there is
>>> +`CONNECTION_DATA` record previously present. The 
>>> `WATCH_DATA_EXTENDED` record
>>> +type is valid only in version 2 and later.
>>> +
>>> +```
>>> +    0       1       2       3    octet
>>> ++-------+-------+-------+-------+
>>> +| conn-id                       |
>>> ++---------------+---------------+
>>> +| wpath-len     | token-len     |
>>> ++---------------+---------------+
>>> +| depth         |               |
>>> ++---------------+---------------+
>>
>> It is not clear what would be the value of octet 2-3. Is it RES0 or 
>> UNKNOWN?
> 
> I don't understand the question. conn-id is a 4-byte item.

I was referring to the blank after 'depth'. In other record, we use 'pad'.

Cheers,

-- 
Julien Grall

