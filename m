Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2564FC3C1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 20:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303217.517308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndyLr-0006B3-6I; Mon, 11 Apr 2022 18:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303217.517308; Mon, 11 Apr 2022 18:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndyLr-00068g-2c; Mon, 11 Apr 2022 18:01:23 +0000
Received: by outflank-mailman (input) for mailman id 303217;
 Mon, 11 Apr 2022 18:01:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ndyLp-00068a-1t
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 18:01:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndyLo-0004lq-IM; Mon, 11 Apr 2022 18:01:20 +0000
Received: from [54.239.6.185] (helo=[192.168.17.122])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndyLo-00062S-Bp; Mon, 11 Apr 2022 18:01:20 +0000
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
	bh=91/dfoNzZ29hQpRnrxvAje+IzY3s4RmxOTU9AKneQGk=; b=0rhH2V7SPqgpxU6+/QmiWAeTjT
	CXckwcFOftpH7ZzJNg+Jmx3ET0c6qG7r7HyB8QBmJjssbSEP/35jeJstPhDsrm96KBBjItsONUo38
	l+w3XxmgKfYSDjOA4PvhJKetririIpjbQOBAfGnFqy1McKAILKzUeVSMwHpw0CgKUUkw=;
Message-ID: <0ecf69d2-c496-d18e-1309-f896ec6bbf4c@xen.org>
Date: Mon, 11 Apr 2022 19:01:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] xen/evtchn: Add design for static event channel signaling
 for domUs..
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Rahul,

Title: s/../.../

On 23/03/2022 15:43, Rahul Singh wrote:
> in dom0less system. This patch introduce the new feature to support the

s/introduce/introduces/
s/the new/a/

> signaling between two domUs in dom0less system.
Did you intend to add a newline before the second sentence?

> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>   docs/designs/dom0less-evtchn.md | 96 +++++++++++++++++++++++++++++++++
>   1 file changed, 96 insertions(+)
>   create mode 100644 docs/designs/dom0less-evtchn.md
> 
> diff --git a/docs/designs/dom0less-evtchn.md b/docs/designs/dom0less-evtchn.md
> new file mode 100644
> index 0000000000..6a1b7e8c22
> --- /dev/null
> +++ b/docs/designs/dom0less-evtchn.md
> @@ -0,0 +1,96 @@
> +# Signaling support between two domUs on dom0less system
> +
> +## Current state: Draft version
> +
> +## Proposer(s): Rahul Singh, Bertrand Marquis
> +
> +## Problem Statement:
> +
> +The goal of this work is to define a simple signaling system between Xen guests
> +in dom0less systems.
> +
> +In dom0less system, we cannot make use of xenbus and xenstore that are used in
> +normal systems with dynamic VMs to communicate between domains by providing a
> +bus abstraction for paravirtualized drivers.
> +
> +One possible solution to implement the signaling system between domUs is based
> +on event channels.
> +
> +## Proposal:
> +
> +Event channels are the basic primitive provided by Xen for event notifications.
> +An event channel is a logical connection between 2 domains (more specifically
> +between dom1,port1 and dom2,port2). They essentially store one bit of
> +information, the event of interest is signalled by transitioning this bit from
> +0 to 1. An event is an equivalent of a hardware interrupt.
> +
> +Notifications are received by a guest via an interrupt from Xen to the guest,
> +indicating when an event arrives (setting the bit). 

I am a bit confused with the description. Are you trying to explain the 
event channel in layman term? If not, then event channel protocol is 
more complicated than that (in particular for fifo).

> Further notifications are
> +masked until the bit is cleared again.

I think "masked" is confusing here.

The event channel differentiate "mask" vs "pending". When sending an 
event, the pending bit will be set to 1. If it wasn't already pending 
and the mask bit is clear, then we will notify the guest.

If the pending bit is already set, then we will ignore.

In fact, the event channel is acting similarly to an edge interrupt. I 
wrote similarly, because IIRC they are behaving slightly differently 
(see [1] for more details).

> When a domain wants to wait for data it
> +will block until an event arrives, and then send an event to signal that data
> +has been consumed.
> Events are delivered asynchronously to guests and are
> +enqueued when the guest is not running.

s/guest/domain/ to stay consistent and also include dom0/hardware domain.

> +
> +Event channel communication will be established statically between two domU
> +guests before unpausing the domains after domain creation. Event channel
> +connection information between domUs will be passed to XEN via device tree
> +node.

Why are we limiting ourself to domUs?

> +
> +Under the /chosen node, there needs to be sub nodes with compatible
> +"xen,evtchn" that descibes the event channel connection between two domUs.

s/descibes/describes/

> +
> +The event channel sub-node has the following properties:
> +
> +- compatible
> +
> +    "xen,evtchn"
> +
> +- xen,evtchn
> +
> +    The property is four numbers of tuples of
> +    (local-port-domU1,domU1-phandle,local-port-domU2,domU2-phandle) where:

This is quite difficult to read. Can we add some space before/after each 
comma?

> +
> +    local-port-domU1 is an integer value that will be used to allocte local

s/allocte/allocate/

> +    port for domU1 to send an event notification to the remote domain.

The port will be used for sending but also receiving event notification.

Also, I would suggest to replace "remote domain" with "domU2". So it is 
more explicit.

> +
> +    domU1-phandle is a single phandle to an domain to which local-port-domU1

s/an domain/a domain/ I think.

> +    will be allocated.
> +
> +    local-port-domU2 is an integer value that will be used to allocte local

s/allocte/allocate/

> +    port for domU2 to send an event notification to the remote domain.

Same as above for "remote domain".

> +
> +    domU2-phandle is a single phandle to an domain to which local-port-domU2
> +    will be allocated.
> +
> +Example:
> +
> +    chosen {
> +        ....
> +
> +        domU1: domU1 {
> +            ......
> +        };
> +
> +        domU2: domU2 {
> +            ......
> +        };
> +
> +        evtchn@1 {
> +            compatible = "xen,evtchn";
> +            xen,evtchn = <0xa &domU1 0xb &domU2>;
> +        };
> +
> +        evtchn@2 {
> +            compatible = "xen,evtchn";
> +            xen,evtchn = <0xc &domU1 0xd &domU2>;
> +        };
> +    };
> +
> +In above example two event channel comunication will be established between
> +domU1 and domU2.
> +
> +    domU1 (port 0xa) <-----------------> domU2 (port 0xb)
> +    domU1 (port 0xc) <-----------------> domU2 (port 0xd)
> +
> +domU1 and domU2 can send the signal to remote domain via hypercall
> +EVTCHNOP_send(.) on local port.

Cheers,

[1] 
https://lore.kernel.org/lkml/dbfd87e9-48fc-f641-9e24-ddb6c4f61135@arm.com/

-- 
Julien Grall

