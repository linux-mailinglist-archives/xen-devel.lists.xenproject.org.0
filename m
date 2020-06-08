Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8EB1F1C7A
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 17:56:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiK7W-0002CM-Vw; Mon, 08 Jun 2020 15:55:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jiK7V-0002CH-Em
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 15:55:29 +0000
X-Inumbo-ID: 78f65622-a9a0-11ea-b292-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78f65622-a9a0-11ea-b292-12813bfff9fa;
 Mon, 08 Jun 2020 15:55:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5A809AAE8;
 Mon,  8 Jun 2020 15:55:30 +0000 (UTC)
Subject: Re: [PATCH v4 for-4.14] x86/monitor: revert default behavior when
 monitoring register write events
To: Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <20200603125237.100041-1-tamas@tklengyel.com>
 <20200603150721.GF1195@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <be627680-5ab2-d93d-b042-2b6aadbdcd8d@suse.com>
Date: Mon, 8 Jun 2020 17:55:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200603150721.GF1195@Air-de-Roger>
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Julien Grall <julien@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.06.2020 17:07, Roger Pau Monné wrote:
> On Wed, Jun 03, 2020 at 06:52:37AM -0600, Tamas K Lengyel wrote:
>> For the last couple years we have received numerous reports from users of
>> monitor vm_events of spurious guest crashes when using events. In particular,
>> it has observed that the problem occurs when vm_events are being disabled. The
>> nature of the guest crash varied widely and has only occured occasionally. This
>> made debugging the issue particularly hard. We had discussions about this issue
>> even here on the xen-devel mailinglist with no luck figuring it out.
>>
>> The bug has now been identified as a race-condition between register event
>> handling and disabling the monitor vm_event interface. The default behavior
>> regarding emulation of register write events is changed so that they get
>> postponed until the corresponding vm_event handler decides whether to allow such
>> write to take place. Unfortunately this can only be implemented by performing the
>> deny/allow step when the vCPU gets scheduled.
>>
>> Due to that postponed emulation of the event if the user decides to pause the
>> VM in the vm_event handler and then disable events, the entire emulation step
>> is skipped the next time the vCPU is resumed. Even if the user doesn't pause
>> during the vm_event handling but exits immediately and disables vm_event, the
>> situation becomes racey as disabling vm_event may succeed before the guest's
>> vCPUs get scheduled with the pending emulation task. This has been particularly
>> the case with VMS that have several vCPUs as after the VM is unpaused it may
>> actually take a long time before all vCPUs get scheduled.
>>
>> In this patch we are reverting the default behavior to always perform emulation
>> of register write events when the event occurs. To postpone them can be turned
>> on as an option. In that case the user of the interface still has to take care
>> of only disabling the interface when its safe as it remains buggy.
>>
>> Fixes: 96760e2fba10 ('vm_event: deny register writes if refused by vm_event
>> reply').
>>
>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> 
> Thanks!
> 
> Reviewed-by: Roger Pau Monné <rogerpau@citrix.com>
> 
> I would like to get some input from Bitdefender really, and whether
> they are fine with this approach.

Alexandru, Petre,

have the two of you seen this request?

Jan

