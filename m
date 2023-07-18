Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB0D75807C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 17:12:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565356.883468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLmMe-00068y-W3; Tue, 18 Jul 2023 15:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565356.883468; Tue, 18 Jul 2023 15:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLmMe-00065z-Sf; Tue, 18 Jul 2023 15:11:48 +0000
Received: by outflank-mailman (input) for mailman id 565356;
 Tue, 18 Jul 2023 15:11:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qLmMd-00065t-4H
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 15:11:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLmMc-0003j3-1k; Tue, 18 Jul 2023 15:11:46 +0000
Received: from [15.248.2.157] (helo=[10.24.67.41])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLmMb-00059k-S2; Tue, 18 Jul 2023 15:11:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=5cjKGiRV0bGIIpodIFBH2Ro7CfW2RtTn25viqyVxa44=; b=67vBu0nABq779f2lMZ2YMcz6kF
	+rV9a3vGS/4Oa784AI7btuSNy7odDPZ+WBKTonZ/xd3qr2Rqaa3fPfMRqkyQgB5nUX2Zc0NwAgE1T
	CJqyPHGV3X5+k7N4c2C6r+yV5WLkdsNdzPrv9bpMGmF9snN1URUZn7vh8vUBlarhhD00=;
Message-ID: <9abe0edb-6bc4-0270-a0bd-88634caed88c@xen.org>
Date: Tue, 18 Jul 2023 16:11:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2] ns16550: add support for polling mode when device tree
 is used
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <ce821c1c81ba69397047daae0b0e6d44893ec28d.1689689630.git.oleksii.kurochko@gmail.com>
 <b37b15c6-d7f7-df9d-83c1-337f434a713b@xen.org>
 <346bea980c63d3e56429c63566513c535d04d32b.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <346bea980c63d3e56429c63566513c535d04d32b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 18/07/2023 16:00, Oleksii wrote:
> On Tue, 2023-07-18 at 15:23 +0100, Julien Grall wrote:
>>
>>
>> On 18/07/2023 15:13, Oleksii Kurochko wrote:
>>> RISC-V doesn't support interrupts for the time being, so it would
>>> be nice to
>>> have polling mode.
>>>
>>> The patch assumes that polling mode will be used if there is no
>>> interrupt
>>> property
>>
>> As I asked in v1, please explain that this is allowed by the binding
>> and
>> provide a link for others to verify.
> According to 4.2.2 National Semiconductor 16450/16550 Compatible UART
> Requirements from The Devicetree Specification v0.4
> ( https://www.devicetree.org/specifications/ ) interrupts property
> should always present.

I don't read the spec the same way as you. The property is marked as 
'OR' which means the property is optional but recommended.

Therefore, what you just wrote is enough to justify why we can relax the 
check.

>>
>>> or the interrupt is equal to some unused UART interrupt number (
>>> look
>>> at the definition of NO_IRQ_POLL in ns16550.c ).
>>
>> Nack. If you want to use polling mode and yet have an interrupts
>> property then you should provide the information differently. This
>> would
>> either be via the command line or an extra property in the DT node.
>>
>> If the latter, it would need to be standardized first.
> What does it mean 'standardized'? Do you mean that it should updated
> The Devicetree Specification?

I mean that the binding for the ns16550 in 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings 
should be updated.

I will not accept any code in Xen which use properties that have not 
been accepted by the Linux/Device-Tree community. Unless this is a 
binding "owned" by Xen (e.g. the nodes for dom0less).

> 
> I am not sure that I know the process of standardization of such stuff
> could you please give me any pointers?

In general, this is sending an e-mail to the device-tree mailing with 
your proposal in the form of a patch.

> 
> It looks like it will be faster to pass it via the command line as
> standardization can consume some time...

Well yes. But as usual, it depends on your end goal. For instance, we 
would not want to describe the HW on the command line.

Thinking a bit more, in this case, the command line option is probably 
best because you want to override what's describe in the firmware table.

Cheers,

-- 
Julien Grall

