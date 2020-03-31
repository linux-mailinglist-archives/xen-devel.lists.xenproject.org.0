Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE97D199382
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:34:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJEBG-00016J-TH; Tue, 31 Mar 2020 10:31:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=sM9E=5Q=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jJEBF-00015W-42
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:31:37 +0000
X-Inumbo-ID: cc8af73a-733a-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc8af73a-733a-11ea-b4f4-bc764e2007e4;
 Tue, 31 Mar 2020 10:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S16JMbe4oecwCGPghUtdUbzdZk9pI8R5Q9hqBmJjAXE=; b=fUMD0xtpDfcfL/weoN7s/zFbY+
 jtsp3Pe6XqZlg8QyZbjZWzhpxdS+tMXcZ9AvomRiljDv0L2A/RDQv4ndQeHTqpMUOLNDZg8wv7s69
 cFo6m45RF3cgr8I6I7QAgeIbYO/vph/kkvhE9p7qFCBQXog6SoM+GjL+/CxiCpHrqIM8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJEBC-0002Lu-9S; Tue, 31 Mar 2020 10:31:34 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJEBB-0004ul-Li; Tue, 31 Mar 2020 10:31:34 +0000
Subject: Re: [PATCH] Revert "domctl: improve locking during domain destruction"
To: Jim Fehlig <jfehlig@suse.com>, Jan Beulich <jbeulich@suse.com>
References: <de46590ad566d9be55b26eaca0bc4dc7fbbada59.1585063311.git.hongyxia@amazon.com>
 <37dcd2d8-8ffe-a58e-4c7a-6dafc935b1c1@suse.com>
 <94abc4e0-b11e-df0f-3e3c-c3a61d87c63a@xen.org>
 <30f1ec6d-b5be-fcb1-c685-ed02961175c1@suse.com>
 <547e509f-93ba-2bbf-f12d-21b9443e12e4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <94fc29a5-bfa4-4361-0654-789f2b80c89c@xen.org>
Date: Tue, 31 Mar 2020 11:31:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <547e509f-93ba-2bbf-f12d-21b9443e12e4@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Hongyan Xia <hx242@xen.org>, Charles Arnold <CARNOLD@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jim,

On 26/03/2020 16:55, Jim Fehlig wrote:
> On 3/25/20 1:11 AM, Jan Beulich wrote:
>> On 24.03.2020 19:39, Julien Grall wrote:
>>> On 24/03/2020 16:13, Jan Beulich wrote:
>>>> On 24.03.2020 16:21, Hongyan Xia wrote:
>>>>> From: Hongyan Xia <hongyxia@amazon.com>
>>>>> In contrast,
>>>>> after dropping that commit, parallel domain destructions will just 
>>>>> fail
>>>>> to take the domctl lock, creating a hypercall continuation and backing
>>>>> off immediately, allowing the thread that holds the lock to destroy a
>>>>> domain much more quickly and allowing backed-off threads to process
>>>>> events and irqs.
>>>>>
>>>>> On a 144-core server with 4TiB of memory, destroying 32 guests (each
>>>>> with 4 vcpus and 122GiB memory) simultaneously takes:
>>>>>
>>>>> before the revert: 29 minutes
>>>>> after the revert: 6 minutes
>>>>
>>>> This wants comparing against numbers demonstrating the bad effects of
>>>> the global domctl lock. Iirc they were quite a bit higher than 6 min,
>>>> perhaps depending on guest properties.
>>>
>>> Your original commit message doesn't contain any clue in which
>>> cases the domctl lock was an issue. So please provide information
>>> on the setups you think it will make it worse.
>>
>> I did never observe the issue myself - let's see whether one of the SUSE
>> people possibly involved in this back then recall (or have further
>> pointers; Jim, Charles?), or whether any of the (partly former) Citrix
>> folks do. My vague recollection is that the issue was the tool stack as
>> a whole stalling for far too long in particular when destroying very
>> large guests.
> 
> I too only have a vague memory of the issue but do recall shutting down 
> large guests (e.g. 500GB) taking a long time and blocking other 
> toolstack operations. I haven't checked on the behavior in quite some 
> time though.

It might be worth checking how toolstack operations (such as domain 
creating) is affected by the revert. @Hongyan would you be able to test it?

> 
>> One important aspect not discussed in the commit message
>> at all is that holding the domctl lock block basically _all_ tool stack
>> operations (including e.g. creation of new guests), whereas the new
>> issue attempted to be addressed is limited to just domain cleanup.
> 
> I more vaguely recall shutting down the host taking a *long* time when 
> dom0 had large amounts of memory, e.g. when it had all host memory (no 
> dom0_mem= setting and autoballooning enabled).

AFAIK, we never relinquish memory from dom0. So I am not sure how a 
large amount of memory in Dom0 would affect the host shutting down.

Cheers,

-- 
Julien Grall

