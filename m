Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76781E5B50
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 10:59:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeENI-00010U-Ko; Thu, 28 May 2020 08:58:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l/Gm=7K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jeENH-00010P-Cn
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 08:58:51 +0000
X-Inumbo-ID: 72128386-a0c1-11ea-a7a8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72128386-a0c1-11ea-a7a8-12813bfff9fa;
 Thu, 28 May 2020 08:58:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E04FBACF9;
 Thu, 28 May 2020 08:58:47 +0000 (UTC)
Subject: Re: [PATCH v2] docs: update xenstore-migration.md
To: paul@xen.org, xen-devel@lists.xenproject.org
References: <20200528082217.26057-1-jgross@suse.com>
 <00a001d634cd$7c9afb40$75d0f1c0$@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ad448884-6705-9473-597c-10388b398972@suse.com>
Date: Thu, 28 May 2020 10:58:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <00a001d634cd$7c9afb40$75d0f1c0$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.05.20 10:53, Paul Durrant wrote:
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Juergen Gross
>> Sent: 28 May 2020 09:22
>> To: xen-devel@lists.xenproject.org
>> Cc: Juergen Gross <jgross@suse.com>; Stefano Stabellini <sstabellini@kernel.org>; Julien Grall
>> <julien@xen.org>; Wei Liu <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>; Ian Jackson
>> <ian.jackson@eu.citrix.com>; George Dunlap <george.dunlap@citrix.com>; Jan Beulich <jbeulich@suse.com>
>> Subject: [PATCH v2] docs: update xenstore-migration.md
>>
>> Update connection record details: make flags common for sockets and
>> domains, and add pending incoming data.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V2:
>> - added out-resp-len to connection record
>> ---
>>   docs/designs/xenstore-migration.md | 71 +++++++++++++++++-------------
>>   1 file changed, 40 insertions(+), 31 deletions(-)
>>
>> diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
>> index 34a2afd17e..5736bbad94 100644
>> --- a/docs/designs/xenstore-migration.md
>> +++ b/docs/designs/xenstore-migration.md
>> @@ -147,43 +147,59 @@ the domain being migrated.
>>   ```
>>       0       1       2       3       4       5       6       7    octet
>>   +-------+-------+-------+-------+-------+-------+-------+-------+
>> -| conn-id                       | conn-type     | conn-spec
>> +| conn-id                       | conn-type     | flags         |
>> ++-------------------------------+---------------+---------------+
>> +| conn-spec
>>   ...
>> -+-------------------------------+-------------------------------+
>> -| data-len                      | data
>> -+-------------------------------+
>> ++---------------+---------------+-------------------------------+
>> +| in-data-len   | out-resp-len  | out-data-len                  |
>> ++---------------+---------------+-------------------------------+
>> +| data
>>   ...
>>   ```
>>
>>
>> -| Field       | Description                                     |
>> -|-------------|-------------------------------------------------|
>> -| `conn-id`   | A non-zero number used to identify this         |
>> -|             | connection in subsequent connection-specific    |
>> -|             | records                                         |
>> -|             |                                                 |
>> -| `conn-type` | 0x0000: shared ring                             |
>> -|             | 0x0001: socket                                  |
>> -|             | 0x0002 - 0xFFFF: reserved for future use        |
>> -|             |                                                 |
>> -| `conn-spec` | See below                                       |
>> -|             |                                                 |
>> -| `data-len`  | The length (in octets) of any pending data not  |
>> -|             | yet written to the connection                   |
>> -|             |                                                 |
>> -| `data`      | Pending data (may be empty)                     |
>> +| Field          | Description                                  |
>> +|----------------|----------------------------------------------|
>> +| `conn-id`      | A non-zero number used to identify this      |
>> +|                | connection in subsequent connection-specific |
>> +|                | records                                      |
>> +|                |                                              |
>> +| `flags`        | A bit-wise OR of:                            |
>> +|                | 0001: read-only                              |
>> +|                |                                              |
>> +| `conn-type`    | 0x0000: shared ring                          |
>> +|                | 0x0001: socket                               |
>> +|                | 0x0002 - 0xFFFF: reserved for future use     |
>> +|                |                                              |
> 
> Agreed with Julien... the above two would be better swapped to match the order of the fields in the record.

Yes.

> 
>> +| `conn-spec`    | See below                                    |
>> +|                |                                              |
>> +| `in-data-len`  | The length (in octets) of any data read      |
>> +|                | from the connection not yet processed        |
>> +|                |                                              |
>> +| `out-resp-len` | The length (in octets) of a partial response |
>> +|                | not yet written to the connection (included  |
>> +|                | in the following `out-data-len`)             |
>> +|                |                                              |
>> +| `out-data-len` | The length (in octets) of any pending data   |
>> +|                | not yet written to the connection            |
> 
> So, IIUC out-data-len is inclusive of out-resp-len?

Yes.

> 
>> +|                |                                              |
>> +| `data`         | Pending data, first read data, then written  |
>> +|                | data (any of both may be empty)              |
> 
> Perhaps be more explicit here:
> 
> "Pending data: first in-data-len octets of read data, then out-data-len octets of written data"

Okay.

> 
>>
>> -The format of `conn-spec` is dependent upon `conn-type`.
>> +In case of live update the connection record for the connection via which
>> +the live update command was issued will contain the response for the live
>> +update command in the pending write data.
> 
> s/write/written for consistency I think.

I'll use "... in the pending not yet written data".


Juergen

