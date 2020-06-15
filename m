Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A27581F9CEB
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 18:17:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkrnL-0004t1-EU; Mon, 15 Jun 2020 16:17:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gw2r=74=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jkrnJ-0004sw-KT
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 16:17:09 +0000
X-Inumbo-ID: a90e7e06-af23-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a90e7e06-af23-11ea-bb8b-bc764e2007e4;
 Mon, 15 Jun 2020 16:17:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 95C0AAE61;
 Mon, 15 Jun 2020 16:17:11 +0000 (UTC)
Subject: Re: [PATCH for-4.14 v2 2/2] x86/passthrough: introduce a flag for
 GSIs not requiring an EOI or unmask
To: paul@xen.org, 'Andrew Cooper' <andrew.cooper3@citrix.com>
References: <20200610142923.9074-1-roger.pau@citrix.com>
 <20200610142923.9074-3-roger.pau@citrix.com>
 <6de3a582-d9a8-60b5-9525-c9223932e4ed@citrix.com>
 <00f901d64013$6615a860$3240f920$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <73dcc93f-3d2e-e6f0-a044-83a060bddaa4@suse.com>
Date: Mon, 15 Jun 2020 18:17:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <00f901d64013$6615a860$3240f920$@xen.org>
Content-Type: text/plain; charset=utf-8
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
Cc: xen-devel@lists.xenproject.org, 'Wei Liu' <wl@xen.org>,
 'Roger Pau Monne' <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.06.2020 19:11, Paul Durrant wrote:
>> -----Original Message-----
>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>> Sent: 11 June 2020 17:26
>> To: Roger Pau Monne <roger.pau@citrix.com>; xen-devel@lists.xenproject.org
>> Cc: paul@xen.org; Jan Beulich <jbeulich@suse.com>; Wei Liu <wl@xen.org>
>> Subject: Re: [PATCH for-4.14 v2 2/2] x86/passthrough: introduce a flag for GSIs not requiring an EOI
>> or unmask
>>
>> On 10/06/2020 15:29, Roger Pau Monne wrote:
>>> There's no need to setup a timer for GSIs that are edge triggered,
>>> since those don't require any EIO or unmask, and hence couldn't block
>>> other interrupts.
>>>
>>> Note this is only used by PVH dom0, that can setup the passthrough of
>>> edge triggered interrupts from the vIO-APIC. One example of such kind
>>> of interrupt that can be used by a PVH dom0 would be the RTC timer.
>>>
>>> While there introduce an out label to do the unlock and reduce code
>>> duplication.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Release-acked-by: Paul Durrant <paul@xen.org>

Strictly speaking these tags were too little for the patch to go
in - the change to drivers/passthrough/io.c would also have
required Paul's (or my) R-b. I take it that this was sort of
implied by the R-a-b.

Jan

