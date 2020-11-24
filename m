Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D579F2C29E2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 15:42:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36474.68383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khZWa-0006o6-0I; Tue, 24 Nov 2020 14:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36474.68383; Tue, 24 Nov 2020 14:42:31 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khZWZ-0006nh-T5; Tue, 24 Nov 2020 14:42:31 +0000
Received: by outflank-mailman (input) for mailman id 36474;
 Tue, 24 Nov 2020 14:42:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khZWY-0006nc-3q
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 14:42:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1c86dd2-b1ef-4ad8-9153-5fa3045bf660;
 Tue, 24 Nov 2020 14:42:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 82033AC66;
 Tue, 24 Nov 2020 14:42:28 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khZWY-0006nc-3q
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 14:42:30 +0000
X-Inumbo-ID: b1c86dd2-b1ef-4ad8-9153-5fa3045bf660
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b1c86dd2-b1ef-4ad8-9153-5fa3045bf660;
	Tue, 24 Nov 2020 14:42:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606228948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HHoOdfLHT+/hVeeCayRObbNFDm4WCLh/XJDus/9snho=;
	b=ncJ45mmsFQEAt/F5vuCR3gCpzWthcwfdhh4AWnrA8SfPTFx81b/TIasR6RdhRUp5CPv0S+
	knvr+e8/A4ukWkEAkewMb+pefrV12tUXp0zD85dRbejHy1QyJPhaRXqq7VuMi7bi994D7c
	Hk7jdVnqu6VxqvpSQ7Kn810sHcC2C2c=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 82033AC66;
	Tue, 24 Nov 2020 14:42:28 +0000 (UTC)
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Manuel Bouyer <bouyer@antioche.eu.org>
References: <20201120085249.GA1508@antioche.eu.org>
 <97f371a9-00fe-33fe-8923-c247f44f9af6@suse.com>
 <20201120092754.GH1508@antioche.eu.org>
 <20904a6a-ac64-755d-d228-4c49faf66fb5@suse.com>
 <20201120103824.GJ1508@antioche.eu.org>
 <20201123095713.orfpg72r73m7f46n@Air-de-Roger>
 <20201123113241.GE2520@antioche.eu.org>
 <20201123125112.q3zqb4e5nk6jg4hw@Air-de-Roger>
 <20201123143150.GG2520@antioche.eu.org>
 <20201123170610.kzfxvcgkdkvh3ex4@Air-de-Roger>
 <20201123173925.GG4662@antioche.eu.org>
 <b3912e97-9684-fe97-1053-ad7168a19721@suse.com>
Message-ID: <ee63d6c2-4d0f-a3b7-37d0-8ce45c9e6fb1@suse.com>
Date: Tue, 24 Nov 2020 15:42:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <b3912e97-9684-fe97-1053-ad7168a19721@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 24.11.2020 11:05, Jan Beulich wrote:
> On 23.11.2020 18:39, Manuel Bouyer wrote:
>> On Mon, Nov 23, 2020 at 06:06:10PM +0100, Roger Pau Monné wrote:
>>> OK, I'm afraid this is likely too verbose and messes with the timings.
>>>
>>> I've been looking (again) into the code, and I found something weird
>>> that I think could be related to the issue you are seeing, but haven't
>>> managed to try to boot the NetBSD kernel provided in order to assert
>>> whether it solves the issue or not (or even whether I'm able to
>>> repro it). Would you mind giving the patch below a try?
>>
>> With this, I get the same hang but XEN outputs don't wake up the interrupt
>> any more. The NetBSD counter shows only one interrupt for ioapic2 pin 2,
>> while I would have about 8 at the time of the hang.
>>
>> So, now it looks like interrupts are blocked forever.
> 
> Which may be a good thing for debugging purposes, because now we have
> a way to investigate what is actually blocking the interrupt's
> delivery without having to worry about more output screwing the
> overall picture.
> 
>> At
>> http://www-soc.lip6.fr/~bouyer/xen-log5.txt
>> you'll find the output of the 'i' key.
> 
> (XEN)    IRQ:  34 vec:59 IO-APIC-level   status=010 aff:{0}/{0-7} in-flight=1 d0: 34(-MM)
> 
> (XEN)     IRQ 34 Vec 89:
> (XEN)       Apic 0x02, Pin  2: vec=59 delivery=LoPri dest=L status=1 polarity=1 irr=1 trig=L mask=0 dest_id:00000001

Since it repeats in Manuel's latest dump, perhaps the odd combination
of status=1 and irr=1 is to tell us something? It is my understanding
that irr ought to become set only when delivery-status clears. Yet I
don't know what to take from this...

Jan

