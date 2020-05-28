Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AB31E5B3F
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 10:56:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeEKq-0000py-2e; Thu, 28 May 2020 08:56:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l/Gm=7K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jeEKo-0000pt-QD
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 08:56:18 +0000
X-Inumbo-ID: 17af58ba-a0c1-11ea-9dbe-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17af58ba-a0c1-11ea-9dbe-bc764e2007e4;
 Thu, 28 May 2020 08:56:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3E211AF9C;
 Thu, 28 May 2020 08:56:16 +0000 (UTC)
Subject: Re: [PATCH v2] docs: update xenstore-migration.md
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20200528082217.26057-1-jgross@suse.com>
 <57f59299-0723-bfcc-33b3-a97562c87150@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d20c15c2-0b60-9892-f849-9ba69e62ac34@suse.com>
Date: Thu, 28 May 2020 10:56:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <57f59299-0723-bfcc-33b3-a97562c87150@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.05.20 10:34, Julien Grall wrote:
> Hi Juergen,
> 
> On 28/05/2020 09:22, Juergen Gross wrote:
>> -| Field       | Description                                     |
>> -|-------------|-------------------------------------------------|
>> -| `conn-id`   | A non-zero number used to identify this         |
>> -|             | connection in subsequent connection-specific    |
>> -|             | records                                         |
>> -|             |                                                 |
>> -| `conn-type` | 0x0000: shared ring                             |
>> -|             | 0x0001: socket                                  |
>> -|             | 0x0002 - 0xFFFF: reserved for future use        |
>> -|             |                                                 |
>> -| `conn-spec` | See below                                       |
>> -|             |                                                 |
>> -| `data-len`  | The length (in octets) of any pending data not  |
>> -|             | yet written to the connection                   |
>> -|             |                                                 |
>> -| `data`      | Pending data (may be empty)                     |
>> +| Field          | Description                                  |
>> +|----------------|----------------------------------------------|
>> +| `conn-id`      | A non-zero number used to identify this      |
>> +|                | connection in subsequent connection-specific |
>> +|                | records                                      |
>> +|                |                                              |
>> +| `flags`        | A bit-wise OR of:                            |
>> +|                | 0001: read-only                              |
> 
> NIT: It is a bit odd the flags is in the header after `conn-type` and 
> described before.

Okay, I'll swap the descriptions.

> 
>> +|                |                                              |
>> +| `conn-type`    | 0x0000: shared ring                          |
>> +|                | 0x0001: socket                               |
>> +|                | 0x0002 - 0xFFFF: reserved for future use     |
>> +|                |                                              |
>> +| `conn-spec`    | See below                                    |
>> +|                |                                              |
>> +| `in-data-len`  | The length (in octets) of any data read      |
>> +|                | from the connection not yet processed        |
>> +|                |                                              |
>> +| `out-resp-len` | The length (in octets) of a partial response |
>> +|                | not yet written to the connection (included  |
>> +|                | in the following `out-data-len`)             |
> 
> This seems to come from nowhere. It would be good to explain in the 
> commit message why this is necessary.

Okay.


Juergen

