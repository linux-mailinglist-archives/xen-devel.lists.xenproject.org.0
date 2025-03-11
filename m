Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19493A5CE3D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 19:52:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908871.1315911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts4i8-0006h6-FT; Tue, 11 Mar 2025 18:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908871.1315911; Tue, 11 Mar 2025 18:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts4i8-0006gG-AO; Tue, 11 Mar 2025 18:52:16 +0000
Received: by outflank-mailman (input) for mailman id 908871;
 Tue, 11 Mar 2025 18:52:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ts4i6-0006fP-UO
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 18:52:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts4i6-00Eg9l-2W;
 Tue, 11 Mar 2025 18:52:14 +0000
Received: from [2a02:8012:3a1:0:d5e1:ab8b:3d02:5aa4]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts4i6-004ab4-12;
 Tue, 11 Mar 2025 18:52:14 +0000
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
	bh=EIisbHXrg5iwS6s/4dMZJgpXXtialHm7BA+pr+x3Hy8=; b=NRDdjGv4o9Mpqid2Q6837+HnKu
	K+zpnawfuxsPfCr48nFTKJkjTDrZv6JRc3xCCTKzbSZRu7uPI3JwroZ/ZkLdAuDdsYj4vc6ByjR4O
	8kNE7vidFU54pTj6mXIkZ4U1svjkVpxU3bcr0Xu/xXjKUZSG5lkcxPX+dXIXsojzIqB8=;
Message-ID: <1d5aca81-ef32-4baf-a0c0-d648c43b2f77@xen.org>
Date: Tue, 11 Mar 2025 18:52:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/9] docs: update xenstore migration stream definition
Content-Language: en-GB
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250204113407.16839-1-jgross@suse.com>
 <20250204113407.16839-8-jgross@suse.com>
 <526952a6-eb7a-4055-bd3f-eae1af203f80@xen.org>
 <5316de12-303b-4a2e-af34-3029ac03153b@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5316de12-303b-4a2e-af34-3029ac03153b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11/03/2025 09:58, Jürgen Groß wrote:
> On 11.03.25 10:43, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 04/02/2025 11:34, Juergen Gross wrote:
>>> In order to close a race window for Xenstore live update when using
>>> the new unique_id of domains, the migration stream needs to contain
>>> this unique_id for each domain known by Xenstore.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> V8:
>>> - new patch
>>> ---
>>>   docs/designs/xenstore-migration.md | 14 +++++++++++++-
>>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/docs/designs/xenstore-migration.md b/docs/designs/ 
>>> xenstore- migration.md
>>> index 082314bf72..fba691ee0d 100644
>>> --- a/docs/designs/xenstore-migration.md
>>> +++ b/docs/designs/xenstore-migration.md
>>> @@ -156,7 +156,7 @@ the domain being migrated.
>>>   ```
>>>       0       1       2       3       4       5       6       7    octet
>>>   +-------+-------+-------+-------+-------+-------+-------+-------+
>>> -| conn-id                       | conn-type     |               |
>>> +| conn-id                       | conn-type     | uniq-id-off   |
>>>   +-------------------------------+---------------+---------------+
>>  >   | conn-spec>   ...
>>> @@ -165,6 +165,9 @@ the domain being migrated.
>>>   +---------------+---------------+-------------------------------+
>>>   | data
>>>   ...
>>> ++---------------------------------------------------------------+
>>> +| unique-id                                                     |
>>> ++---------------------------------------------------------------+
>>>   ```
>>> @@ -178,6 +181,12 @@ the domain being migrated.
>>>   |                | 0x0001: socket                               |
>>>   |                | 0x0002 - 0xFFFF: reserved for future use     |
>>>   |                |                                              |
>>> +| `uniq-id-off`  | The offset (in octets) of the `unique-id`    |
>>> +|                | field from the start of the record body.     |
>>> +|                | If 0, no `unique-id` field is present.       |
>>> +|                | Only needed for `shared ring` connection in  |
>>> +|                | live update streams.                         |
>>> +|                |                                              |
>>
>> Looking at the rest of the record, the unique ID would be past the in- 
>> data (length is 2-byte) and the out-data (length is 4-byte). So 
>> technically the offset would need 5-bytes. But here you are using 2- 
>> bytes. Can you explain why?
> 
> Good catch.
> 
> I think I need to change this to be a flag indicating that the unique-id
> is present and located at the next 8-byte boundary after "data".

This would work for me.

Cheers,

-- 
Julien Grall


