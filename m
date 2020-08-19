Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4825D2496D9
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 09:13:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8IGV-0007KN-EY; Wed, 19 Aug 2020 07:12:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b5Wx=B5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k8IGT-0007KI-Co
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 07:12:05 +0000
X-Inumbo-ID: b79dfb94-fbb7-4c02-8855-b471468e9539
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b79dfb94-fbb7-4c02-8855-b471468e9539;
 Wed, 19 Aug 2020 07:12:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B2377B598;
 Wed, 19 Aug 2020 07:12:29 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v2] x86/hvm: re-work viridian APIC assist code
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: paul@xen.org, 'David Woodhouse' <dwmw2@infradead.org>,
 'Paul Durrant' <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org,
 'Eslam Elnikety' <elnikety@amazon.de>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Shan Haitao' <haitao.shan@intel.com>
References: <20180118151059.1336-1-paul.durrant@citrix.com>
 <1535153880.24926.28.camel@infradead.org>
 <7547be305e3ede9edb897e2be898fe54e0b4065c.camel@infradead.org>
 <002d01d67149$37404b00$a5c0e100$@xen.org> <20200813094555.GF975@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f2aa0cd1-61c9-c788-56fb-b2546feed74b@suse.com>
Date: Wed, 19 Aug 2020 09:12:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200813094555.GF975@Air-de-Roger>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 13.08.2020 11:45, Roger Pau Monné wrote:
> On Thu, Aug 13, 2020 at 09:10:31AM +0100, Paul Durrant wrote:
>>> -----Original Message-----
>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of David Woodhouse
>>> Sent: 11 August 2020 14:25
>>> To: Paul Durrant <paul.durrant@citrix.com>; xen-devel@lists.xenproject.org; Roger Pau Monne
>>> <roger.pau@citrix.com>
>>> Cc: Eslam Elnikety <elnikety@amazon.de>; Andrew Cooper <andrew.cooper3@citrix.com>; Shan Haitao
>>> <haitao.shan@intel.com>; Jan Beulich <jbeulich@suse.com>
>>> Subject: Re: [Xen-devel] [PATCH v2] x86/hvm: re-work viridian APIC assist code
>>>
>>> Resending this straw man patch at Roger's request, to restart discussion.
>>>
>>> Redux: In order to cope with the relatively rare case of unmaskable
>>> legacy MSIs, each vlapic EOI takes a domain-global spinlock just to
>>> iterate over all IRQs and determine that there's actually nothing to
>>> do.
>>>
>>> In my testing, I observe that this drops Windows performance on passed-
>>> through NVMe from 2.2M IOPS down to about 1.0M IOPS.
>>>
>>> I have a variant of this patch which just has a single per-domain "I
>>> attached legacy unmaskable MSIs" flag, which is never cleared. The
>>> patch below is per-vector (but Roger points out it should be per-vCPU
>>> per-vector). I don't know that we really care enough to do more than
>>> the single per-domain flag, which in real life would never happen
>>> anyway unless you have crappy hardware, at which point you get back to
>>> today's status quo.
>>>
>>> My main concern is that this code is fairly sparsely documented and I'm
>>> only 99% sure that this code path really *is* only for unmaskable MSIs,
>>> and doesn't have some other esoteric use. A second opinion on that
>>> would be particularly welcome.
>>>
>>
>> The loop appears to be there to handle the case where multiple
>> devices assigned to a domain have MSIs programmed with the same
>> dest/vector... which seems like an odd thing for a guest to do but I
>> guess it is at liberty to do it. Does it matter whether they are
>> maskable or not?
> 
> Such configuration would never work properly, as lapic vectors are
> edge triggered and thus can't be safely shared between devices?

Wait - there are two aspects here: Vectors are difficult to be shared
on the same CPU (but it's not impossible if the devices and their
drivers meet certain conditions). But the bitmap gets installed as a
per-domain rather than a per-vcpu one, and using the same vector on
different CPUs is definitely possible, as demonstrated by both Xen
itself as well as Linux.

Jan

