Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 832721B7BA7
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 18:31:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jS1EM-00013h-CR; Fri, 24 Apr 2020 16:31:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Nbk=6I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jS1EL-00013c-0F
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 16:31:09 +0000
X-Inumbo-ID: fff18e42-8648-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fff18e42-8648-11ea-b4f4-bc764e2007e4;
 Fri, 24 Apr 2020 16:31:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6DE59ABEA;
 Fri, 24 Apr 2020 16:31:06 +0000 (UTC)
Subject: Re: [PATCH] docs/designs: re-work the xenstore migration document...
To: paul@xen.org, 'Julien Grall' <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <20200424133736.737-1-paul@xen.org>
 <a1febde5-0a34-6480-6400-7142a6bb6f52@suse.com>
 <c7cb8073-44ef-c92e-2962-d427e1568748@xen.org>
 <8029c772-9c42-460c-e17c-85e18b32f102@suse.com>
 <7ae1bb1c-0029-c3f0-1565-e5f99effee51@xen.org>
 <33b38b41-9112-5a7f-7d3a-1663132b9603@suse.com>
 <e614fa8c-cea6-43f3-0bf2-003eabb4ae8f@xen.org>
 <000301d61a54$498f2020$dcad6060$@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4763e0d9-07b9-af23-fb69-42d25ceb3295@suse.com>
Date: Fri, 24 Apr 2020 18:31:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <000301d61a54$498f2020$dcad6060$@xen.org>
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

On 24.04.20 18:20, Paul Durrant wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 24 April 2020 17:04
>> To: Jürgen Groß <jgross@suse.com>; Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
>> Cc: Paul Durrant <pdurrant@amazon.com>
>> Subject: Re: [PATCH] docs/designs: re-work the xenstore migration document...
>>
>> Hi,
>>
>> On 24/04/2020 16:59, Jürgen Groß wrote:
>>> On 24.04.20 17:44, Julien Grall wrote:
>>> If I extend the record and do a downgrade I'm losing the information,
>>> too, as the old version won't read it in any case. BTW, extending the
>>> record is no problem, as the length is stored in the header. Unknown
>>> records (and extensions) will be just ignored when reading.
>>
>> That's very much up to the implementation. An implementation may decide
>> to bail out if the record is not an exact size.
>>
> 
> It won't know. The record will be whatever size it says it is, and if the format doesn't match what the implementation was expecting then it'll probably crash.
> 
>>>
>>> In your case when reusing the paddings and doing a downgrade you would
>>> crash, as the paddings are no longer zero.
>>>
>>> In case a downgrade should not be done due to vital information loss
>>> then you should just not do it.
>>
>> Of course, however I don't think a user will necessarily know it should
>> not do it. So how do you protect against misuse?
>>
> 
> The stream is versioned. If information is vital then I'd expect the version to be bumped, which should prevent a downgrade.

Uh, this is problematic. I agree that a downgrade will be prevented, but
merely via a crash. We won't have both versions active in parallel, but
the version we are updating to will make it or not. There is no way
back.

The general rule should be to be as forgiving to errors in the stream
as possible in order _not_ to have a crashing xenstored due to strict
parameter testing.

And in case there is a potential of problems it needs to be documented
and then its up to the user to follow the documentation.


Juergen

