Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F421BBB25
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 12:23:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTNOd-0006pA-IS; Tue, 28 Apr 2020 10:23:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c5nG=6M=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jTNOc-0006p5-CC
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 10:23:22 +0000
X-Inumbo-ID: 48d53462-893a-11ea-9848-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48d53462-893a-11ea-9848-12813bfff9fa;
 Tue, 28 Apr 2020 10:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WdL+tRd89XoXFlZNEtfi3nhZsBi/cccWkhKZhUzmap4=; b=TtT4g4Tm7N8qC8Ecl8715+TUne
 jZnduYwhZ2c/L9gpeINZngTeIhuxjtdRAvg+KVh4vjguJc1QSu2Y2FYcgnEHWH3lmFhU6co3cp3sz
 VCxDkEHsZn5C0nq+reR6WCdWjVhGZoYR16V0PoRqKQ0ex4CClsRuja4Ut8/ONsZw2heY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jTNOY-0000SX-W2; Tue, 28 Apr 2020 10:23:18 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jTNOY-0006Om-HW; Tue, 28 Apr 2020 10:23:18 +0000
Subject: Re: [PATCH v4] docs/designs: re-work the xenstore migration
 document...
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200427155035.668-1-paul@xen.org>
 <7ab25832-66e6-020f-b343-059f21771054@xen.org>
 <f13de8bc-ca5d-2341-3797-b34f9f2c70ef@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2087b3dd-7d2c-3ab3-d6ce-a4d132f7ec4d@xen.org>
Date: Tue, 28 Apr 2020 11:23:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f13de8bc-ca5d-2341-3797-b34f9f2c70ef@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Juergen,

On 28/04/2020 11:10, Jürgen Groß wrote:
> On 28.04.20 11:05, Julien Grall wrote:
>>> -where tx_id is the non-zero identifier values of an open transaction.
>>> +| Field     | Description                                       |
>>> +|-----------|---------------------------------------------------|
>>> +| `domid`   | The domain-id that owns the shared page           |
>>> +|           |                                                   |
>>> +| `tdomid`  | The domain-id that `domid` acts on behalf of if   |
>>> +|           | it has been subject to an SET_TARGET              |
>>> +|           | operation [2] or DOMID_INVALID [3] otherwise      |
>>> +|           |                                                   |
>>> +| `flags`   | Must be zero                                      |
>>> +|           |                                                   |
>>> +| `evtchn`  | The port number of the interdomain channel used   |
>>> +|           | by `domid` to communicate with xenstored          |
>>> +|           |                                                   |
>>> +| `mfn`     | The MFN of the shared page for a live update or   |
>>> +|           | ~0 (i.e. all bits set) otherwise                  |
>>> -### Protocol Extension
>>> +Since the ABI guarantees that entry 1 in `domid`'s grant table will 
>>> always
>>> +contain the GFN of the shared page, so for a live update `mfn` can 
>>> be used to
>>> +give confidence that `domid` has not been re-cycled during the update.
>>
>> I am confused, there is no way a XenStored running in an Arm domain 
>> can map the MFN of the shared page. So how is this going to work out?
> 
> I guess this will be a MFN for PV guests and a guest PFN else.

If we use Xen terminology (xen/include/xen/mm.h), this would be a GFN.

> 
>>
>> [...]
>>
>>> -START_DOMAIN_TRANSACTION    <domid>|<transid>|
>>> +    0       1       2       3    octet
>>> ++-------+-------+-------+-------+
>>> +| conn-id                       |
>>> ++-------------------------------+
>>> +| tx-id                         |
>>> ++---------------+---------------+
>>> +| path-len      | value-len     |
>>> ++---------------+---------------+
>>> +| access        | perm-count    |
>>> ++---------------+---------------+
>>> +| perm1                         |
>>> ++-------------------------------+
>>> +...
>>> ++-------------------------------+
>>> +| permN                         |
>>> ++---------------+---------------+
>>> +| path
>>> +...
>>> +| value
>>> +...
>>> +```
>>> +
>>> +
>>> +| Field        | Description                                    |
>>> +|--------------|------------------------------------------------|
>>> +| `conn-id`    | If this value is non-zero then this record     |
>>> +|              | related to a pending transaction               |
>>
>> If conn-id is 0, how do you know the owner of the node?
> 
> The first permission entry's domid is the owner.

I think this should be spell out in the specification.

> 
>>
>>> +|              |                                                |
>>> +| `tx-id`      | This value should be ignored if `conn-id` is   |
>>> +|              | zero. Otherwise it specifies the id of the     |
>>> +|              | pending transaction                            |
>>> +|              |                                                |
>>> +| `path-len`   | The length (in octets) of `path` including the |
>>> +|              | NUL terminator                                 |
>>> +|              |                                                |
>>> +| `value-len`  | The length (in octets) of `value` (which will  |
>>> +|              | be zero for a deleted node)                    |
>>> +|              |                                                |
>>> +| `access`     | This value should be ignored if this record    |
>>> +|              | does not relate to a pending transaction,      |
>>> +|              | otherwise it specifies the accesses made to    |
>>> +|              | the node and hence is a bitwise OR of:         |
>>> +|              |                                                |
>>> +|              | 0x0001: read                                   |
>>> +|              | 0x0002: written                                |
>>> +|              |                                                |
>>> +|              | The value will be zero for a deleted node      |
>>> +|              |                                                |
>>> +| `perm-count` | The number (N) of node permission specifiers   |
>>> +|              | (which will be 0 for a node deleted in a       |
>>> +|              | pending transaction)                           |
>>> +|              |                                                |
>>> +| `perm1..N`   | A list of zero or more node permission         |
>>> +|              | specifiers (see below)                         |
>>
>> This is a bit odd to start at one. Does it mean perm0 exists and not 
>> preserved?
> 
> Why? perm0 does not exist. If you have N permissions 1..N is just fine.
> If you have no permissions (N=0) you won't have any permX entry.
> 
> In theory you could say perm0..N-1, but this would result in perm0..-1
> for N=0 which would be really odd.

As it is odd to me to start at 1 (I am used to index starting at 0) ;). 
The more it wasn't clear how you would specify the owner. So I thought 
perm0 had a specific meaning.

If you clarify perm1 is the owner, then it may make easier to figure out 
that perm0 doesn't exist.

Cheers,

-- 
Julien Grall

