Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C642C29C7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 15:36:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36466.68371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khZQf-0005tJ-As; Tue, 24 Nov 2020 14:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36466.68371; Tue, 24 Nov 2020 14:36:25 +0000
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
	id 1khZQf-0005sw-75; Tue, 24 Nov 2020 14:36:25 +0000
Received: by outflank-mailman (input) for mailman id 36466;
 Tue, 24 Nov 2020 14:36:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khZQd-0005sq-O8
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 14:36:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79ee8c41-88f3-4974-bf49-8178a65a14e6;
 Tue, 24 Nov 2020 14:36:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 39D3AAD63;
 Tue, 24 Nov 2020 14:36:22 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khZQd-0005sq-O8
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 14:36:23 +0000
X-Inumbo-ID: 79ee8c41-88f3-4974-bf49-8178a65a14e6
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 79ee8c41-88f3-4974-bf49-8178a65a14e6;
	Tue, 24 Nov 2020 14:36:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606228582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jddJcJOBahWscYIeBSLixsP2HFFL5FW7IAtYuZSn+a8=;
	b=kVeWmAGd5wl0fqeiWH2rzszMPTrW61UhI8w5MqX2FHabKWEtxdR5TEYADP+EQ3Z/Ct+EQ2
	YwjM0Kh5v7ks2NT1ZJs1Aw9toBp6Y/JwvskZtYcb+MpBm45Lms8aC6tUHpISwgUnq2PssA
	zMYyzPLfh6OKOd4012VeR8T7C7LAGtA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 39D3AAD63;
	Tue, 24 Nov 2020 14:36:22 +0000 (UTC)
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
From: Jan Beulich <jbeulich@suse.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
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
 <068d11b3-f2d6-d9f4-9565-e2dbf4292df1@suse.com>
Message-ID: <1adc92cf-649f-9c75-98a1-05a34b3af42f@suse.com>
Date: Tue, 24 Nov 2020 15:36:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <068d11b3-f2d6-d9f4-9565-e2dbf4292df1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.11.2020 15:33, Jan Beulich wrote:
> On 24.11.2020 15:27, Manuel Bouyer wrote:
>> Ops, sorry I copied xen.gz to the wrong place.
>> new log at
>> http://www-soc.lip6.fr/~bouyer/xen-log7.txt
>>
>> this one ends up in a panic,
> 
> Argh - too much output triggered the watchdog. I guess we need to
> cut down on the vIO-APIC dumping, permaps limiting it to just the
> one RTE we care about. But let me (and Roger) see if there's
> anything to be derived from the LAPIC state...

All IRRs and ISRs are completely clear of set bits. Highly mysterious
how the IRQ then doesn't get delivered.

Jan

