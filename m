Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C68F58C70F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 13:01:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382375.617305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL0Uj-00054I-U3; Mon, 08 Aug 2022 11:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382375.617305; Mon, 08 Aug 2022 11:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL0Uj-00051E-Qn; Mon, 08 Aug 2022 11:00:25 +0000
Received: by outflank-mailman (input) for mailman id 382375;
 Mon, 08 Aug 2022 11:00:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oL0Uh-000518-Uz
 for xen-devel@lists.xenproject.org; Mon, 08 Aug 2022 11:00:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oL0Uh-0003Tr-G9; Mon, 08 Aug 2022 11:00:23 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[10.95.148.130]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oL0Uh-0008UT-4W; Mon, 08 Aug 2022 11:00:23 +0000
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
	bh=kT6wRwofyVm/Xl6bCDZwUN+TugVz/lksoYm7hLZ0kpw=; b=4dFWk9nmc3gcsF0/jmPxTyNRi4
	x7XWvF0hZJo2GhtknAfw4Xs7BP8Kfn60tjJYpm7J2nV3u594jukgUMAPuGjc4BsC2RY5bDax7/Ii7
	aViaojKClMjIBBvWo2N/EjedF6lperUCDVl4sE6GXlQMqecgS19R3Ch2I8sDU/NEKDUo=;
Message-ID: <68ca5d7c-d443-ea48-3984-ff76652392df@xen.org>
Date: Mon, 8 Aug 2022 12:00:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v3 5/5] tools/xenstore: add migration stream extensions
 for new features
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220803115950.10904-1-jgross@suse.com>
 <20220803115950.10904-6-jgross@suse.com>
 <f38fdd2d-a463-2e84-8f6b-5acc29e4ff1e@xen.org>
 <6e62b262-f4ef-ecd7-291a-ca39f67c3065@suse.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <6e62b262-f4ef-ecd7-291a-ca39f67c3065@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 08/08/2022 07:33, Juergen Gross wrote:
> On 04.08.22 21:28, Julien Grall wrote:
>> On 03/08/2022 12:59, Juergen Gross wrote:
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
>>> ---
>>>   docs/designs/xenstore-migration.md | 85 ++++++++++++++++++++++++++++--
>>>   1 file changed, 82 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/docs/designs/xenstore-migration.md 
>>> b/docs/designs/xenstore-migration.md
>>> index efa526f420..b2b1d3d5c7 100644
>>> --- a/docs/designs/xenstore-migration.md
>>> +++ b/docs/designs/xenstore-migration.md
>>> @@ -43,7 +43,13 @@ the setting of the endianness bit.
>>>   |-----------|---------------------------------------------------|
>>>   | `ident`   | 0x78656e73746f7265 ('xenstore' in ASCII)          |
>>>   |           |                                                   |
>>> -| `version` | 0x00000001 (the version of the specification)     |
>>> +| `version` | The version of the specification, defined values: |
>>> +|           | 0x00000001: all fields without any explicitly     |
>>> +|           |             mentioned version dependency are      |
>>> +|           |             valid.                                |
>>> +|           | 0x00000002: all fields valid for version 1 plus   |
>>> +|           |             fields explicitly stated to be        |
>>> +|           |             supported in version 2 are valid.     |
>>
>> I am a bit concerned with the bump of the versions. It means, it will 
>> be necessary for Xenstored to know whether the new Xenstored speaks v1 
>> or v2. This is less an issue when Live-Migration (although there is a 
>> fleet management problem) but it will be one for Live-Update if we 
>> need to rollback.
>>
>> So I am wondering if we can avoid to bump the version and use other 
>> means to detect the difference.
> 
> In the end this is exactly what the version was meant to be used for.
> 
> I think it would make much more sense to think about the way to handle a
> bump of the version in a compatible way.
> 
> My idea was to add a xenstored command line parameter for limiting the
> migration stream version to be used to a specified version, causing new
> features probably to not be available, though.

I think this is fine. Someone that cares about rollback will also likely 
care about fleet diversity. So they will want to avoid enabling a 
feature until they know it can work everywhere.

> 
> I don't see how e.g. a rollback would be doable in case a domain already
> started to use a new feature like the third parameter when setting a watch.
> Even if we'd drop the depth information when rolling back a watch set
> afterwards with an additional depth added would be rejected by the older
> xenstored, which would be unexpected failure for the guest.

See above.

> 
> It might make sense to try to use the V1 stream when doing a live update,
> e.g. covering the case when the SET_FEATURE command was used for each
> active guest to limit the features to V1 compatible ones. A force parameter
> might be used to use the V1 stream even if guests are using V2 features,
> risking breakage of those guests.

I don't have a strong opinion on this yet. I might have some when seen 
the code :).

[...]

> This would even be possible using the global record of V1, as
> the length information of the record allows to add new fields without
> having to bump the version.

I was actually thinking about this when writing the e-mail last week. 
There are no dynamic length array in the global records so far, so using 
the length information would be ok. I am more concerned about the others 
because we are mixing fixed and dynamic length.

This means it is more difficult to read the code and the layout.

> 
>>
>>> +| `n-glob-quota` | Number of quota values which apply globally  |
>>> +|                | only. Valid only for version 2 and later.    |
>>> +|                |                                              |
>>> +| `quota-val`    | Quota values, first the ones applying per    |
>>> +|                | domain, then the ones applying globally. A   |
>>> +|                | value of 0 has the semantics of "unlimited". |
>>> +|                | Valid only for version 2 and later.          |
>>> +|                |                                              |
>>> +| `quota-names`  | 0 delimited strings of the quota names in    |
>>> +|                | the same sequence as the `quota-val` values. | > 
>>> +|                | Valid only for version 2 and later.          |
>>
>>  From my understanding, both version of Xenstored needs to agree on 
>> the quota names. So it means the name have to be defined as part of 
>> the spec. At which point, I think it would be better to use ID.
> 
> I don't think so. For one the minimal set of quota names has been defined
> already in patch 3.

Someone reading the migration stream will not necessarily read the 
Xenstore protocol. So I think we should either make them explicit in the 
documentation or have a link to the other document.

> And even with using an ID you'd have the same problem
> again, but without having the possibility to add variant specific quota

Fair enough.

> (remember that there already has been a statement that doing a live update
> from C to OCAML or vice versa would probably break users due to some
> deviations in behavior)
I can't find such statement in public documentation. Do you have a link?

That said, a guest doesn't have a (easy?) way to know how Xenstored is 
implemented. So it is quite concerning to hear some of them may rely on 
behaviors. How did that happen?

> 
>> Also, can you clarify what would happen if the stream contains a quota 
>> not supported by the new Xenstored?
> 
> Yes, I'll add a sentence that those should be ignored.
> 
>>
>>> +
>>>   xenstored will resume in the original process context. Hence 
>>> `rw-socket-fd`
>>>   simply specifies the file descriptor of the socket. Sockets are not 
>>> always
>>> @@ -145,7 +177,7 @@ the domain being migrated.
>>>   ```
>>>       0       1       2       3       4       5       6       7    octet
>>>   +-------+-------+-------+-------+-------+-------+-------+-------+
>>> -| conn-id                       | conn-type     |               |
>>> +| conn-id                       | conn-type     | n-quota       |
>>>   +-------------------------------+---------------+---------------+
>>>   | conn-spec
>>>   ...
>>> @@ -154,6 +186,17 @@ the domain being migrated.
>>>   +---------------+---------------+-------------------------------+
>>>   | data
>>>   ...
>>> ++-------------------------------+
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
>>>   ```
>>> @@ -167,6 +210,10 @@ the domain being migrated.
>>>   |                | 0x0001: socket                               |
>>>   |                | 0x0002 - 0xFFFF: reserved for future use     |
>>>   |                |                                              |
>>> +| `n-quota`      | Number of quota values.                      |
>>> +|                | Only for `conn-type` 0 (shared ring).        |
>>> +|                | Only valid for version 2 and later.          |
>>> +|                |                                              |
>>>   | `conn-spec`    | See below                                    |
>>>   |                |                                              |
>>>   | `in-data-len`  | The length (in octets) of any data read      |
>>> @@ -182,6 +229,22 @@ the domain being migrated.
>>>   | `data`         | Pending data: first in-data-len octets of    |
>>>   |                | read data, then out-data-len octets of       |
>>>   |                | written data (any of both may be empty)      |
>>> +|                |                                              |
>>> +| `features`     | Value of the feature field visible by the    |
>>> +|                | guest at offset 2064 of the ring page.       |
>>> +|                | Aligned to the next 4 octet boundary.        |
>>> +|                | Only for `conn-type` 0 (shared ring).        |
>>
>> For the purpose of the stream, I would consider to make it available 
>> for the socket connection. This could potentially be used in the 
>> future to allow each application to have a different behavior when 
>> socket is used.
> 
> This would break the use of xenstore-stubdom for such a setup.

I am not sure why it would break the use of xenstore-stubdom. An 
application will already need to cope with the case Xenstored doesn't 
support a feature.

At which point, it would be easy to say "I don't want this feature" when 
using a socket.

> 
>> I can't make my mind yet if we can avoid bumping the version for this 
>> field. What would happen if we need to rollback?
> 
> I think an active usage of the new features and a rollback are mutually
> exclusive. See above.
>>> +|                |                                              |
>>> +| `quota-names`  | 0 delimited strings of the quota names in    |
>>> +|                | the same sequence as the `quota-val` values. |
>>> +|                | Only for `conn-type` 0 (shared ring).        |
>>> +|                | Only valid for version 2 and later.          |
>>
>> As for the "global" quotas, I would move the quotas in a separate 
>> record. In this case, this would also be useful to avoid having may 
>> dynamic length field within the same record.
> 
> I like having the data together more.

Which is fine so long the code doesn't become too horrible to 
read/maintain. I think having dynamic length array in the middle of the 
record makes it trickier.

This will only become worse as we introduce new fields in newer 
revision. So at which point would you say the record has grown too much?

To me, this is already the point and we have plenty of record ID to 
handle that.

>>
>>>   In case of live update the connection record for the connection via 
>>> which
>>>   the live update command was issued will contain the response for 
>>> the live
>>> @@ -247,7 +310,7 @@ by a connection for which there is 
>>> `CONNECTION_DATA` record previously present.
>>>   ```
>>>       0       1       2       3    octet
>>> -+-------+-------+-------+-------+
>>> ++---------------+---------------+
>>>   | conn-id                       |
>>>   +---------------+---------------+
>>>   | wpath-len     | token-len     |
>>> @@ -256,6 +319,9 @@ by a connection for which there is 
>>> `CONNECTION_DATA` record previously present.
>>>   ...
>>>   | token
>>>   ...
>>> ++---------------+---------------+
>>> +| depth         |               |
>>> ++---------------+---------------+
>>>   ```
>>> @@ -275,6 +341,13 @@ by a connection for which there is 
>>> `CONNECTION_DATA` record previously present.
>>>   |             |                                                 |
>>>   | `token`     | The watch identifier token, as specified in the |
>>>   |             | `WATCH` operation                               |
>>> +|             |                                                 |
>>> +| `depth`     | The number of directory levels below the        |
>>> +|             | watched path to consider for a match. This      |
>>> +|             | field is aligned to the next 4 octet boundary.  |
>>> +|             | A value of 0xffff is used for unlimited depth.  |
>>> +|             | This field is valid only for version 2 and      |
>>> +|             | higher.                                         |
>>
>> If we are going to bump the stream version, then I think we should 
>> move the field before token/path.
> 
> I thought about that, but liked it better to be able to keep a common 
> struct
> layout for the record with the V2 fields being at the end.
> 
> Main reason is the ability to avoid duplication of code for being able to
> handle both versions.

The cons is you can't easily describe the record in "struct ...". As I 
wrote above, I think have dynamic length array in the middle of a record 
is wrong.

I have looked at the code, I don't think there will be enough code 
duplication to warrant adding fixed field at the end of the record.

Cheers,

-- 
Julien Grall

