Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A58B1A96A0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 10:35:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOdVt-0008Bq-PY; Wed, 15 Apr 2020 08:35:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HD5o=57=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jOdVr-0008Bl-UU
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 08:35:15 +0000
X-Inumbo-ID: 072e8c48-7ef4-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 072e8c48-7ef4-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 08:35:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 20D3CABE7;
 Wed, 15 Apr 2020 08:35:13 +0000 (UTC)
Subject: Re: [PATCH] docs: update xenstore migration design document
To: paul@xen.org, xen-devel@lists.xenproject.org
References: <20200414155942.3347-1-jgross@suse.com>
 <002701d612fd$26f1b950$74d52bf0$@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7c0dcc04-8c55-d59a-65fb-f26251e12c97@suse.com>
Date: Wed, 15 Apr 2020 10:35:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <002701d612fd$26f1b950$74d52bf0$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.04.20 10:09, Paul Durrant wrote:
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Juergen Gross
>> Sent: 14 April 2020 17:00
>> To: xen-devel@lists.xenproject.org
>> Cc: Juergen Gross <jgross@suse.com>; Stefano Stabellini <sstabellini@kernel.org>; Julien Grall
>> <julien@xen.org>; Wei Liu <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>; Ian Jackson
>> <ian.jackson@eu.citrix.com>; George Dunlap <george.dunlap@citrix.com>; Jan Beulich <jbeulich@suse.com>
>> Subject: [PATCH] docs: update xenstore migration design document
>>
>> In the past there have been several attempts to make Xenstore
>> restartable. This requires to transfer the internal Xenstore state to
>> the new instance. With the Xenstore migration protocol added recently
>> to Xen's documentation a first base has been defined to represent the
>> state of Xenstore. This can be expanded a little bit in order to have
>> a full state representation which is needed as a first step for live
>> updating Xenstore.
>>
>> Add some definitions to designs/xenstore-migration.md which are needed
>> for live update of xenstored.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   docs/designs/xenstore-migration.md | 90 ++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 87 insertions(+), 3 deletions(-)
>>
>> diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
>> index 6ab351e8fe..09bb4700b4 100644
>> --- a/docs/designs/xenstore-migration.md
>> +++ b/docs/designs/xenstore-migration.md
>> @@ -9,6 +9,10 @@ records must include details of registered xenstore watches as well as
>>   content; information that cannot currently be recovered from `xenstored`,
>>   and hence some extension to the xenstore protocol[2] will also be required.
>>
>> +As a similar set of data is needed for transferring xenstore data from
>> +one instance to another when live updating xenstored the same definitions
>> +are being used.
>> +
> 
> That makes sense, but using an external entity to extract the state makes less sense in the context of live update so, going
> forward, I suggest dropping the section on extra commands.

Right, this (if still needed) should rather go to docs/misc/xenstore.txt

> Also, we should define a separate 'xenstore domain image format' which can be included as an opaque entity in the migration stream,
> in the same way as the qemu save image.

Fine with me.

> 
>>   The *libxenlight Domain Image Format* specification[3] already defines a
>>   record type `EMULATOR_XENSTORE_DATA` but this is not suitable for
>>   transferring xenstore data pertaining to the domain directly as it is
>> @@ -48,7 +52,10 @@ where type is one of the following values
>>   |        | 0x00000001: NODE_DATA                            |
>>   |        | 0x00000002: WATCH_DATA                           |
>>   |        | 0x00000003: TRANSACTION_DATA                     |
>> -|        | 0x00000004 - 0xFFFFFFFF: reserved for future use |
>> +|        | 0x00000004: TRANSACTION_NODE_DATA                |
>> +|        | 0x00000005: GUEST_RING_DATA                      |
>> +|        | 0x00000006: DOMAIN_START (live update only)      |
>> +|        | 0x00000007 - 0xFFFFFFFF: reserved for future use |
>>
>>
>>   and data is one of the record data formats described in the following
>> @@ -79,7 +86,7 @@ as follows:
>>   +-------------------------------+
>>   | perm count (N)                |
>>   +-------------------------------+
>> -| perm0                         |
>> +| perm1                         |
>>   +-------------------------------+
>>   ...
>>   +-------------------------------+
>> @@ -93,7 +100,7 @@ as follows:
>>   +-------------------------------+
>>   ```
>>
>> -where perm0..N are formatted as follows:
>> +where perm1..N are formatted as follows:
>>
>>
>>   ```
>> @@ -164,6 +171,83 @@ as follows:
>>   where tx_id is the non-zero identifier values of an open transaction.
>>
>>
>> +**TRANSACTION_NODE_DATA**
>> +
>> +
>> +Each TRANSACTION_NODE_DATA record specifies a transaction local xenstore
>> +node. Its is similar to the NODE_DATA record with the addition of a
>> +transaction id:
>> +
>> +```
>> +    0       1       2       3     octet
>> ++-------+-------+-------+-------+
>> +| TRANSACTION_NODE_DATA         |
>> ++-------------------------------+
>> +| tx_id                         |
>> ++-------------------------------+
>> +| path length                   |
>> ++-------------------------------+
>> +| path data                     |
>> +...
>> +| pad (0 to 3 octets)           |
>> ++-------------------------------+
>> +| perm count (N)                |
>> ++-------------------------------+
>> +| perm1                         |
>> ++-------------------------------+
>> +...
>> ++-------------------------------+
>> +| permN                         |
>> ++-------------------------------+
>> +| value length                  |
>> ++-------------------------------+
>> +| value data                    |
>> +...
>> +| pad (0 to 3 octets)           |
>> ++-------------------------------+
>> +```
>> +
>> +where perm1..N are formatted as specified in the NODE_DATA record. A perm
>> +count of 0 denotes a node having been deleted in the transaction.
>> +
> 
> Transferring this state means we can presumably drop the TRANSACTION_DATA, since we can infer open transactions from the presence of
> these records?

No, I don't think so. Imagine a case where just a transaction has
been started without any further activity in this transaction having
happened yet.

> 
>> +
>> +**GUEST_RING_DATA**
>> +
>> +
>> +The GUEST_RING_DATA record is used to transfer data which is pending to be
>> +written to the guest's xenstore ring buffer. It si formatted as follows:
>> +
>> +
>> +```
>> ++-------+-------+-------+-------+
>> +| GUEST_RING_DATA               |
>> ++-------------------------------+
>> +| value length                  |
>> ++-------------------------------+
>> +| value data                    |
>> +...
>> +| pad (0 to 3 octets)           |
>> ++-------------------------------+
>> +```
>> +
>> +**DOMAIN_START**
>> +
>> +
>> +For live updating xenstored data of multiple domains needs to be transferred.
>> +For this purpose the DOMAIN_START record is being used. All records of types
>> +other than NODE_DATA always relate to the last DOMAIN_START record in the
>> +stream. A DOMAIN_START record just contains a domain-id:
> 
> If we define a separate stream format as I suggest above, I'd expect the domain-id to be part of the header.

Yes.

> 
>> +
>> +
>> +```
>> ++-------+-------+-------+-------+
>> +| DOMAIN_START                  |
>> ++-------------------------------+
>> +| domid         | pad           |
>> ++-------------------------------+
>> +```
>> +
>> +
>>   ### Protocol Extension
> 
> As mentioned above, this section ought to be dropped for the moment. We should define the ways in which xenstored should dump state
> in various scenarios: e.g. for LU it will likely be serialize to memory (possibly dev/shmem?), for migration/save-restore it will
> probably be serialize to fd (socket/file). We should also define how dumping state will be triggered.

I was planning to use XS_CONTROL for this purpose. But I'm open for
other solutions, too. And even using XS_CONTROL might want us to
have a library routine for that purpose encapsulating the way how the
extracted state is being transferred.

In the LU case the state dumping will need to be handled Xenstore
internally (especially in stubdom this will just be a memory blob inside
the stubdom, while in the daemon case it could easily be a file).


Juergen

