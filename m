Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2278382DD9
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 15:48:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128262.240829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidbG-0006Bi-5I; Mon, 17 May 2021 13:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128262.240829; Mon, 17 May 2021 13:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidbG-00069q-2B; Mon, 17 May 2021 13:48:02 +0000
Received: by outflank-mailman (input) for mailman id 128262;
 Mon, 17 May 2021 13:48:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lidbE-00069U-Kl
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 13:48:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1bdf183-4b76-4cf9-943f-5d6723c56553;
 Mon, 17 May 2021 13:47:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C4DFCAD2D;
 Mon, 17 May 2021 13:47:58 +0000 (UTC)
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
X-Inumbo-ID: d1bdf183-4b76-4cf9-943f-5d6723c56553
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621259278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bl+QFlr3DTg8dgbGhORW0TRkVne+U+NysgYfakjAjVE=;
	b=uF4XldrdwPHMJlisteYMEMgYgujoVRt8uRrpo/cA0OLrefdRXGT43/SCknaQqkO2q5FUKv
	lGoceC5VcemztObAEZqrusPMxfyilH7SzdmcfUux18WV8MZHY9O153ziVKMEbrZHMAD/v0
	CNQ2Mm6v92kyr5o1q7fDLOK+rAPJ6WY=
Subject: Re: [PATCH] drivers/char: Add USB3 debug capability driver
To: Connor Davis <connojdavis@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <9a6a15ebc538105c83be88883ab3a7125ed52d37.1620776791.git.connojdavis@gmail.com>
 <912fa28c-5cb3-cf40-00db-19423c442da3@suse.com>
 <b31e6eed-437e-de23-1395-48db052d6237@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b049745e-3004-cfc5-7130-e70452936cf9@suse.com>
Date: Mon, 17 May 2021 15:47:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b31e6eed-437e-de23-1395-48db052d6237@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17.05.2021 15:40, Connor Davis wrote:
> On 5/17/21 3:27 AM, Jan Beulich wrote:
>> On 12.05.2021 02:12, Connor Davis wrote:
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -714,9 +714,26 @@ Available alternatives, with their meaning, are:
>>>   ### dbgp
>>>   > `= ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
>>>   
>>> -Specify the USB controller to use, either by instance number (when going
>>> +Specify the EHCI USB controller to use, either by instance number (when going
>>>   over the PCI busses sequentially) or by PCI device (must be on segment 0).
>>>   
>>> +If you have a system with an xHCI USB controller that supports the Debug
>>> +Capability (DbC), you can use
>>> +
>>> +> `= xhci[ <integer> | @pci<bus>:<slot>.<func> ]`
>>> +
>>> +To use this, you need a USB3 A/A debugging cable plugged into a SuperSpeed
>>> +root port on the target machine. Recent kernels expose the existence of the
>>> +DbC at /sys/kernel/debug/usb/xhci/<seg>:<bus>:<slot>.<func>/reg-ext-dbc:00.
>>> +Note that to see output and process input after dom0 is started, you need to
>>> +ensure that the host controller's DMA is not remapped (e.g. with
>>> +dom0-iommu=passthrough).
>> This is a relatively bad limitation imo - people would better not get
>> used to using passthrough mode, and debugging other IOMMU modes (for
>> Dom0) may then be impossible at all.
> 
> Why is turning on passthrough mode to debug something bad? Sure
> 
> it shouldn't be done in a production deployment, but I don't see the
> 
> issue if it is used in a debug environment.

But then you develop with and test something that's not what gets
used in production.

>>> --- a/xen/arch/x86/Kconfig
>>> +++ b/xen/arch/x86/Kconfig
>>> @@ -11,7 +11,6 @@ config X86
>>>   	select HAS_ALTERNATIVE
>>>   	select HAS_COMPAT
>>>   	select HAS_CPUFREQ
>>> -	select HAS_EHCI
>> Why?
>>
>>> --- a/xen/drivers/char/Kconfig
>>> +++ b/xen/drivers/char/Kconfig
>>> @@ -63,6 +63,21 @@ config HAS_SCIF
>>>   config HAS_EHCI
>>>   	bool
>>>   	depends on X86
>>> +        default y if !HAS_XHCI_DBC
>> Again, why? The two drivers shouldn't be exclusive of one another.
> 
> They both implement the dbgp_op hypercall, so they can't both
> 
> be built, otherwise the build fails (as the code stands now with this
> 
> patch that is)

Oh, right - this hypercall needs properly multiplexing onto
whichever of the two drivers is actually in use. Not sure
whether even the case when both are in use at the same time
needs considering / dealing with.

Jan

