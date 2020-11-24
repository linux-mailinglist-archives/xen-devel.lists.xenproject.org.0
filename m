Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BCC2C29B7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 15:33:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36459.68358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khZNr-0005jW-Lm; Tue, 24 Nov 2020 14:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36459.68358; Tue, 24 Nov 2020 14:33:31 +0000
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
	id 1khZNr-0005j7-ID; Tue, 24 Nov 2020 14:33:31 +0000
Received: by outflank-mailman (input) for mailman id 36459;
 Tue, 24 Nov 2020 14:33:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khZNp-0005j2-NO
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 14:33:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40e05122-fc9e-4b7e-a3c1-059dbbe08f0f;
 Tue, 24 Nov 2020 14:33:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E9100AC66;
 Tue, 24 Nov 2020 14:33:27 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khZNp-0005j2-NO
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 14:33:29 +0000
X-Inumbo-ID: 40e05122-fc9e-4b7e-a3c1-059dbbe08f0f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 40e05122-fc9e-4b7e-a3c1-059dbbe08f0f;
	Tue, 24 Nov 2020 14:33:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606228408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=72US9npDgaskd4cP/ILcLEymqpRkyFp/DHcNxbrW19Y=;
	b=t7S8Hs3D9tderOZA65L2wQEJhxvoL8kYaIu66JGnnTSlWyLAo6u0PT8klQcg0mb0Fnehrm
	gmZ9Fvg3abO8fdepxnL+qW1JGQqmSycSDbf4txAyu8DR5P0t2w7WsH5UrybCsw4DpnJ1M3
	kJ+MbcAE/tZcPSZadTFe/E+3bVf0xtE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E9100AC66;
	Tue, 24 Nov 2020 14:33:27 +0000 (UTC)
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20201123095713.orfpg72r73m7f46n@Air-de-Roger>
 <20201123113241.GE2520@antioche.eu.org>
 <20201123125112.q3zqb4e5nk6jg4hw@Air-de-Roger>
 <20201123143150.GG2520@antioche.eu.org>
 <20201123170610.kzfxvcgkdkvh3ex4@Air-de-Roger>
 <20201123173925.GG4662@antioche.eu.org>
 <b3912e97-9684-fe97-1053-ad7168a19721@suse.com>
 <20201124122102.3igsriesou3vl6mu@Air-de-Roger>
 <20201124135948.GL2020@antioche.eu.org>
 <6d6a77cf-58de-4e4d-ed75-e9365be060b7@suse.com>
 <20201124142713.GM2020@antioche.eu.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <068d11b3-f2d6-d9f4-9565-e2dbf4292df1@suse.com>
Date: Tue, 24 Nov 2020 15:33:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201124142713.GM2020@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.11.2020 15:27, Manuel Bouyer wrote:
> On Tue, Nov 24, 2020 at 03:09:55PM +0100, Jan Beulich wrote:
>>>> [...]
>>>>> What we're missing is LAPIC information, since the masked status logged
>>>>> is unclear: (-MM) isn't fully matching up with "mask=0". But of course
>>>>> the former is just a software representation, while the latter is what
>>>>> the RTE holds. IOW for the interrupt to not get delivered, there needs
>>>>> to be this or a higher ISR bit set (considering we don't use the TPR),
>>>>> or (I think we can pretty much exclude this) we'd need to be running
>>>>> with IRQs off for extended periods of time.
>>>>
>>>> Let's dump the physical lapic(s) IRR and ISR together with the
>>>> IO-APIC state. Can you please apply the following patch and use the
>>>> 'i' key again? (please keep the previous patch applied)
>>>
>>> Done, you'll find the log at
>>> http://www-soc.lip6.fr/~bouyer/xen-log6.txt
>>
>> Hmm, I can't spot respective output. Are you sure you did this with
>> a hypervisor with Roger's latest patch in place?
> 
> Ops, sorry I copied xen.gz to the wrong place.
> new log at
> http://www-soc.lip6.fr/~bouyer/xen-log7.txt
> 
> this one ends up in a panic,

Argh - too much output triggered the watchdog. I guess we need to
cut down on the vIO-APIC dumping, permaps limiting it to just the
one RTE we care about. But let me (and Roger) see if there's
anything to be derived from the LAPIC state...

Jan

