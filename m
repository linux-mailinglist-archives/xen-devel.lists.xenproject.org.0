Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5D21BA214
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 13:13:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT1hZ-0005nX-HF; Mon, 27 Apr 2020 11:13:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5iRA=6L=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jT1hY-0005nP-CX
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 11:13:28 +0000
X-Inumbo-ID: 1e154dba-8878-11ea-9761-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e154dba-8878-11ea-9761-12813bfff9fa;
 Mon, 27 Apr 2020 11:13:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D70CDAE2C;
 Mon, 27 Apr 2020 11:13:25 +0000 (UTC)
Subject: Re: [PATCH v2] docs/designs: re-work the xenstore migration
 document...
To: paul@xen.org, xen-devel@lists.xenproject.org
References: <20200427075342.149-1-paul@xen.org>
 <6004fb95-42e1-1ee3-5215-0d0dede73f0f@suse.com>
 <000a01d61c80$fd1e47a0$f75ad6e0$@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ff0a5505-77aa-905b-7b77-af418a586a47@suse.com>
Date: Mon, 27 Apr 2020 13:13:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <000a01d61c80$fd1e47a0$f75ad6e0$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Paul Durrant' <pdurrant@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.04.20 12:45, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jürgen Groß <jgross@suse.com>
>> Sent: 27 April 2020 11:37
>> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
>> Cc: Paul Durrant <pdurrant@amazon.com>
>> Subject: Re: [PATCH v2] docs/designs: re-work the xenstore migration document...
>>
>> On 27.04.20 09:53, Paul Durrant wrote:
>>> From: Paul Durrant <pdurrant@amazon.com>
>>>
>>> ... to specify a separate migration stream that will also be suitable for
>>> live update.
>>>
>>> The original scope of the document was to support non-cooperative migration
>>> of guests [1] but, since then, live update of xenstored has been brought into
>>> scope. Thus it makes more sense to define a separate image format for
>>> serializing xenstore state that is suitable for both purposes.
>>>
>>> The document has been limited to specifying a new image format. The mechanism
>>> for acquiring the image for live update or migration is not covered as that
>>> is more appropriately dealt with by a patch to docs/misc/xenstore.txt. It is
>>> also expected that, when the first implementation of live update or migration
>>> making use of this specification is committed, that the document is moved from
>>> docs/designs into docs/specs.
>>>
>>> [1] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/designs/non-cooperative-migration.md
>>>
>>> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
>>> ---
>>> Juergen Gross <jgross@suse.com>
>>> Andrew Cooper <andrew.cooper3@citrix.com>
>>> George Dunlap <george.dunlap@citrix.com>
>>> Ian Jackson <ian.jackson@eu.citrix.com>
>>> Jan Beulich <jbeulich@suse.com>
>>> Julien Grall <julien@xen.org>
>>> Stefano Stabellini <sstabellini@kernel.org>
>>> Wei Liu <wl@xen.org>
>>
>> Mind adding CC: before those mail addresses in order to let git add
>> those to the recipients list?
>>
> 
> D'oh... good spot.
> 
>>>
>>> v2:
>>>    - Address comments from Juergen
>>
>> Not all unfortunately. :-(
>>
> 
> OK.
> 
>>> +### CONNECTION_DATA
>>>
>>> -Each WATCH_DATA record specifies a registered watch and is formatted as
>>> -follows:
>>> +For live update the image format will contain a `CONNECTION_DATA` record for
>>> +each connection to xenstore. For migration it will only contain a record for
>>> +the domain being migrated.
>>>
>>>
>>>    ```
>>> -    0       1       2       3     octet
>>> -+-------+-------+-------+-------+
>>> -| WATCH_DATA                    |
>>> -+-------------------------------+
>>> -| wpath length                  |
>>> -+-------------------------------+
>>> -| wpath data                    |
>>> -...
>>> -| pad (0 to 3 octets)           |
>>> -+-------------------------------+
>>> +    0       1       2       3       4       5       6       7    octet
>>> ++-------+-------+-------+-------+-------+-------+-------+-------+
>>> +| conn-id                       | pad                           |
>>> ++---------------+-----------------------------------------------+
>>> +| conn-type     | conn-spec
>>>    ...
>>
>> I asked whether it wouldn't be better to drop the pad and move conn-type
>> and a 2-byte (unified) flag field at its position. This together ...
>>
>>> ++-------------------------------+-------------------------------+
>>> +| data-len                      | data
>>>    +-------------------------------+
>>> -| token length                  |
>>> -+-------------------------------+
>>> -| token data                    |
>>>    ...
>>> -| pad (0 to 3 octets)           |
>>> -+-------------------------------+
>>>    ```
>>>
>>> -wpath length and token length are specified in octets (excluding the NUL
>>> -terminator). The wpath should be as described for the `WATCH` operation in
>>> -[2]. The token is an arbitrary string of octets not containing any NUL
>>> -values.
>>>
>>> +| Field       | Description                                     |
>>> +|-------------|-------------------------------------------------|
>>> +| `conn-id`   | A non-zero number used to identify this         |
>>> +|             | connection in subsequent connection-specific    |
>>> +|             | records                                         |
>>> +|             |                                                 |
>>> +| `conn-type` | 0x0000: shared ring                             |
>>> +|             | 0x0001: socket                                  |
>>> +|             |                                                 |
>>> +| `conn-spec` | See below                                       |
>>> +|             |                                                 |
>>> +| `data-len`  | The length (in octets) of any pending data not  |
>>> +|             | yet written to the connection                   |
>>> +|             |                                                 |
>>> +| `data`      | Pending data (may be empty)                     |
>>>
>>> -**TRANSACTION_DATA**
>>> +The format of `conn-spec` is dependent upon `conn-type`.
>>>
>>> +\pagebreak
>>>
>>> -Each TRANSACTION_DATA record specifies an open transaction and is formatted
>>> -as follows:
>>> +For `shared ring` connections it is as follows:
>>>
>>>
>>>    ```
>>> -    0       1       2       3     octet
>>> -+-------+-------+-------+-------+
>>> -| TRANSACTION_DATA              |
>>> -+-------------------------------+
>>> -| tx_id                         |
>>> -+-------------------------------+
>>> +    0       1       2       3       4       5       6       7    octet
>>> +                +-------+-------+-------+-------+-------+-------+
>>> +                | domid         | tdomid        | flags         |
>>> ++---------------+---------------+---------------+---------------+
>>> +| revtchn                       | levtchn                       |
>>> ++-------------------------------+-------------------------------+
>>> +| mfn                                                           |
>>> ++---------------------------------------------------------------+
>>
>> ... with dropping levtchn (which isn't needed IMO) will make it much
>> easier to have a union in C (which needs to be aligned to 8 bytes
>> and have a length of a multiple of 8 bytes due to mfn).
>>
>> So something like:
>>
>> struct xs_state_connection {
>>       uint32_t conn_id;
>>       uint16_t conn_type;
>> #define XS_STATE_CONN_TYPE_RING   0
>> #define XS_STATE_CONN_TYPE_SOCKET 1
>>       uint16_t flags;
>> #define XS_STATE_CONN_INTRODUCED  0x0001
>> #define XS_STATE_CONN_RELEASED    0x0002
>> #define XS_STATE_CONN_READONLY    0x0004
>>       union {
>>           struct {
>>               uint16_t domid;
>>               uint16_t tdomid;
>> #define XS_STATE_DOMID_INVALID  0xffffU
>>               uint32_t evtchn;
>>               uint64_t mfn;
>> #define XS_STATE_MFN_INVALID    0xffffffffffffffffUL
>>           } ring;
>>           int32_t socket_fd;
>>       } spec;
>>       uint32_t data_out_len;
>>       uint8_t  data[];
>> };
> 
> The issue is making sure that the mfn is properly aligned. If I can drop the levtchn then this gets easier.
> 
>>
>>>    ```
>>>
>>> -where tx_id is the non-zero identifier values of an open transaction.
>>> -
>>>
>>> -### Protocol Extension
>>> +| Field      | Description                                      |
>>> +|------------|--------------------------------------------------|
>>> +| `domid`    | The domain-id that owns the shared page          |
>>> +|            |                                                  |
>>> +| `tdomid`   | The domain-id that `domid` acts on behalf of if  |
>>> +|            | it has been subject to an SET_TARGET             |
>>> +|            | operation [2] or DOMID_INVALID otherwise         |
>>
>> DOMID_INVALID needs to be defined (or we need a reference where it is
>> coming from).
> 
> OK. It's in a public header... I'll reference it.
> 
>>
>>> +|            |                                                  |
>>> +| `flags`    | A bit-wise OR of:                                |
>>> +|            | 0x0001: INTRODUCE has been issued                |

Just realized, I think we can drop those flags.

Reasoning: if INTRODUCE hasn't been issued, there can't be an active
connection to Xenstore for that domain, as Xenstore doesn't know about
the parameters to connect (especially the event channel is missing).

>>> +|            | 0x0002: RELEASE has been issued                  |

And the same applies here: RELEASE will drop the connection to the
domain, so it can't appear in a connection record.


Juergen

