Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C86A43557AF
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 17:25:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106074.202837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTnZs-0005Me-Dy; Tue, 06 Apr 2021 15:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106074.202837; Tue, 06 Apr 2021 15:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTnZs-0005MI-Aw; Tue, 06 Apr 2021 15:25:16 +0000
Received: by outflank-mailman (input) for mailman id 106074;
 Tue, 06 Apr 2021 15:25:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lTnZr-0005MD-Bw
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 15:25:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4aca2816-0816-4cc4-84a6-a04d2506a5ca;
 Tue, 06 Apr 2021 15:25:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C3E27B219;
 Tue,  6 Apr 2021 15:25:13 +0000 (UTC)
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
X-Inumbo-ID: 4aca2816-0816-4cc4-84a6-a04d2506a5ca
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617722713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S6o5tS0m5yh6tj7X6nh04+aJGyfnsOlVgA94CJCVRDc=;
	b=UmG3ymytF8W0WykASOTCM0G1uWeBfAX7HO2JVM7xrKi2H1dT1/xFTM9s6tzVhwuCTv17dC
	EySuub1hyEtmkCsHSAFhAMKHV+TCbhW0LdUjFOwkFRYuuYsgQVBvu9dmdoQR/pgLHfy15z
	bYAlX1DGjKUEn8NFbope2vVBLyjU3qo=
Subject: Re: [PATCH 2/2] xen/pci: Gate all MSI code in common code with
 CONFIG_HAS_PCI_MSI
To: Julien Grall <julien@xen.org>, Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1617702520.git.rahul.singh@arm.com>
 <4471ba4fffc8a0cef24cc11314fc788334f85ccc.1617702520.git.rahul.singh@arm.com>
 <YGxsfdK9GEefLgAv@Air-de-Roger>
 <75848a0d-d060-6a8b-5ebc-7376ffc14af0@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b0eb0833-50aa-d9a1-3265-3255970ef210@suse.com>
Date: Tue, 6 Apr 2021 17:25:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <75848a0d-d060-6a8b-5ebc-7376ffc14af0@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 06.04.2021 16:30, Julien Grall wrote:
> Hi Roger,
> 
> On 06/04/2021 15:13, Roger Pau Monné wrote:
>> On Tue, Apr 06, 2021 at 12:39:11PM +0100, Rahul Singh wrote:
>>> MSI support is not implemented for ARM architecture but it is enabled
>>> for x86 architecture and referenced in common passthrough/pci.c code.
>>>
>>> Therefore introducing the new flag to gate the MSI code for ARM in
>>> common code to avoid compilation error when HAS_PCI is enabled for ARM.
>>
>> Is such option really interesting long term?
>>
>> IIRC PCI Express mandates MSI support, at which point I don't see much
>> value in being able to compile out the MSI support.
> 
> I am pretty sure there are board out with PCI support but no MSI 
> support. Anyway, even if the spec may mandate it...
> 
>>
>> So while maybe helpful for Arm PCI efforts ATM, I'm not sure it
>> warrants a Kconfig option, I would rather see Arm introduce dummy
>> helpers for the missing functionality, even if unimplemented at the
>> moment.
> 
> ... from my understanding, most of (if not all) the MSI code is not very 
> useful on Arm when using the GICv3 ITS.
> 
> The GICv3 ITS will do the isolation for you and therefore we should not 
> need to keep track of the state at the vPCI level.

But that's then not "has PCI MSI" but "need to intercept PCI MSI
accesses", i.e. I don't think the Kconfig option is correctly
named. If a device with MSI support is used, you can't make that
MSI support go away, after all.

And of course I agree with the desire to have less #ifdef-ary
here.

Jan

