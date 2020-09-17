Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACBF26E076
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 18:19:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIwcV-0007J5-9O; Thu, 17 Sep 2020 16:18:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZJEn=C2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kIwcU-0007J0-Nd
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 16:18:50 +0000
X-Inumbo-ID: 3cc8d12b-93de-477f-8a30-bb244b0dd04e
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3cc8d12b-93de-477f-8a30-bb244b0dd04e;
 Thu, 17 Sep 2020 16:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600359528;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Ld0lG2L3bKX7A5yBclCveKiyIq0s5pZjGOheEVpFNlY=;
 b=Li+pqIoPg/h1sIIuTmtp1F/36NOXOmAHB7r7V43exu1R8UI+2VXgm7FE
 kuVrdsJazOHIRWUpzKCfuYkbFoQ5s4TnqMIEVVCD/3loPuXIwDPUWr3br
 Cf92cM4UjZt+ugoEb+gXDg5fUq4eUFPzZyDHXcu0Q5iqn+1oKWX+9VduN A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 9KOA7JDynw0lVy7kbcVwwJE3Z4GqO/CWPUIYy+LqGyW9JMkAu5eo5a+0rUMnUuTGBD9xePpYXo
 QetD4S2PysyKw/yg9FJlRBBHKXCXGCOvNd1Y+8I6p8WLycXuDjjnQ9O94qIJLi7s05qdIGtRXb
 4W98RT9ERVFqrRb2xTGmKiFGw1uu0fGEWsL3IbbH9nUzbv1zGOJUJRVFbYxxppyZstASg7AKNl
 zyDh/a/p8/xWw3g1hsQrXMcnhvkxmmkpFUtVXWBZbP1HYssmzUc+9QhUxXQPMNZseslXTaXAhz
 3oM=
X-SBRS: 2.7
X-MesageID: 27062845
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,271,1596513600"; d="scan'208";a="27062845"
Subject: Re: [PATCH 5/5] sched/arinc653: Implement CAST-32A multicore
 scheduling
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, Jeff Kubascik
 <Jeff.Kubascik@dornerworks.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: xen-devel <xen-devel@dornerworks.com>, Josh Whitehead
 <Josh.Whitehead@dornerworks.com>, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-6-jeff.kubascik@dornerworks.com>
 <36f7ed35-039c-482b-c04b-0f2348de37f6@citrix.com>
 <CY1P110MB05519EEB1C9F879D54ECF6F58C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f8345a86-1a00-9ec9-036b-853a15484777@citrix.com>
Date: Thu, 17 Sep 2020 17:18:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CY1P110MB05519EEB1C9F879D54ECF6F58C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 17/09/2020 15:57, Stewart Hildebrand wrote:
> On Thursday, September 17, 2020 10:43 AM, Andrew Cooper wrote:
>> On 16/09/2020 19:18, Jeff Kubascik wrote:
>>> +/*
>>> + * A handle with all zeros represents domain 0 if present, otherwise idle UNIT
>>> + */
>>> +#define DOM0_HANDLE ((const xen_domain_handle_t){0})
>> This isn't accurate.
>>
>> There are systems where dom0 doesn't have a zero UUID (XenServer for
>> one), and its easy to create domU's which have a zero UUID.  They are
>> not unique, and can be changed at any time during the running of the VM.
>>
>> If you need a unique identifier, then use domid's.
>>
>> I can't see any legitimate need for the scheduler to handle the UUID at all.
> We tried switching it to domid at one point in the past, but the problem was that when a domU reboots (destroy/create) the domid increments, so the schedule would have to be reinstantiated.

How are settings specified?  If they're manually while the domain is
running, then I'd argue that is a user bug.

If the settings are specified in the VM's configuration file, and they
aren't reapplied on reboot, then that is a toolstack bug.

> At least that was the case before a recent patch series allowing to specify domid [1], but Jeff developed this CAST-32A series prior to that. The UUID can be specified in the .cfg file, allowing domUs to reboot and come back up with the same UUID.

The UUID can and does change at runtime in some cases, when you get into
more complicated lifecycle scenarios such as localhost live migration,
and/or VM Fork/CoW.


Having scheduler settings remembered by UUID, in the lower layers of the
hypervisor, feels like a layering violation.  It might work for your
specific usecase, but it feels like it is papering over the underlying
bug, and it is incompatible with other usage scenarios within Xen.

~Andrew

