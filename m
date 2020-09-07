Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C97ED25F679
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 11:29:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFDSL-0005dS-54; Mon, 07 Sep 2020 09:28:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b7xj=CQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFDSK-0005dN-4H
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 09:28:56 +0000
X-Inumbo-ID: 61dd1ac0-e639-445e-ba09-0dbea1d8ef3f
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61dd1ac0-e639-445e-ba09-0dbea1d8ef3f;
 Mon, 07 Sep 2020 09:28:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 31F92AD1E;
 Mon,  7 Sep 2020 09:28:55 +0000 (UTC)
Subject: Re: [xen-unstable bisection] complete test-amd64-i386-xl-shadow
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>
References: <E1kF3SG-0000mV-7s@osstest.test-lab.xenproject.org>
 <01e192ce-99ea-2fbd-317c-c9f4b99f6d2a@suse.com>
 <20200907092045.GS753@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c65f06b6-4b42-bdb0-feda-02fcbc060e7d@suse.com>
Date: Mon, 7 Sep 2020 11:28:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200907092045.GS753@Air-de-Roger>
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

On 07.09.2020 11:20, Roger Pau Monné wrote:
> On Mon, Sep 07, 2020 at 10:21:36AM +0200, Jan Beulich wrote:
>> On 07.09.2020 00:48, osstest service owner wrote:
>>> branch xen-unstable
>>> xenbranch xen-unstable
>>> job test-amd64-i386-xl-shadow
>>> testid guest-saverestore
>>>
>>> Tree: linux git://xenbits.xen.org/linux-pvops.git
>>> Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
>>> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
>>> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
>>> Tree: xen git://xenbits.xen.org/xen.git
>>>
>>> *** Found and reproduced problem changeset ***
>>>
>>>   Bug is in tree:  xen git://xenbits.xen.org/xen.git
>>>   Bug introduced:  696c273f3d9a169911308fb7e0a702a3eb6a150d
>>>   Bug not present: a609b6577f7867db4be1470130b7b3c686398c4f
>>>   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/153833/
>>>
>>>
>>>   commit 696c273f3d9a169911308fb7e0a702a3eb6a150d
>>>   Author: Jan Beulich <jbeulich@suse.com>
>>>   Date:   Fri Sep 4 11:13:01 2020 +0200
>>>   
>>>       x86: generalize padding field handling
>>>       
>>>       The original intention was to ignore padding fields, but the pattern
>>>       matched only ones whose names started with an underscore. Also match
>>>       fields whose names are in line with the C spec by not having a leading
>>>       underscore. (Note that the leading ^ in the sed regexps was pointless
>>>       and hence get dropped.)
>>
>> I conclude this needs to be reverted, and there was a thinko of mine
>> involved here: Avoiding translation of padding fields would be okay
>> only when their values don't get checked in the native handler. We
>> effectively have a not written down (afaict) rule here that _pad*
>> fields get ignored (and hence don't need translation), while pad*
>> fields may not be ignored and hence may need translation. I don't
>> like this state, but I also can't think of a good way out of it, at
>> least not just yet.
> 
> I think his stems from the fact that we don't have a rule whether
> explicit padding fields in structs should be zeroed. IIRC there are
> hypercalls that would check for padding fields to be 0, while others
> don't.

Right - we only have an almost-rule for new code.

> At this point I assume we can only implement the least restrictive
> one, which is to not force padding fields to be zeroed?

Well, we could formalize the (or ideally: some) naming model to
distinguish the cases. Question then is going to be in how many
cases neither contributor nor reviewers are(n't) going to pay
attention.

> This would have the side effect that they cannot be later used to
> introduce additional fields to the struct without signaling the
> version in use.

Exactly, so unilaterally going the "don't copy and hence don't
require zero" route is not an option imo.

Jan

