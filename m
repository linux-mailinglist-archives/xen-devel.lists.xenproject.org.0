Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72383521580
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 14:33:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325585.548220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noP2z-0006M3-9H; Tue, 10 May 2022 12:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325585.548220; Tue, 10 May 2022 12:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noP2z-0006Iu-5s; Tue, 10 May 2022 12:33:01 +0000
Received: by outflank-mailman (input) for mailman id 325585;
 Tue, 10 May 2022 12:32:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1noP2x-0006Io-8z
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 12:32:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noP2w-0005NB-Qo; Tue, 10 May 2022 12:32:58 +0000
Received: from [54.239.6.189] (helo=[192.168.24.150])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noP2w-0001bJ-KE; Tue, 10 May 2022 12:32:58 +0000
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
	bh=7h7Yw7tNQ24qD99Cl5/gMsYGdW5f+JrvI7xCOVuYn8k=; b=L/vn6pIOURKWdXbOLcflQwvQCz
	dSR+s8RsiAdaKBpnfJW+uvXwNgbqyOBdZJJqCo0ZbcVPoLx6+psf37AAMTqJgzJDJjQiXtAUfAgZm
	s00Czo7swja3sQXczKJO6c71sA6k8m6s7BSX8gGErlps5NJqHqwfWM5xrNKfZ073Pqu0=;
Message-ID: <cd402709-619f-7189-3d95-fea4ad6bf637@xen.org>
Date: Tue, 10 May 2022 13:32:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2] xen/evtchn: Add design for static event channel
 signaling
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <10d83478f116c923271a6c2f7d413f6ec117598d.1651685393.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <10d83478f116c923271a6c2f7d413f6ec117598d.1651685393.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Rahul,

On 04/05/2022 18:34, Rahul Singh wrote:
> This patch introduces a new feature to support the signaling between
> two domains in dom0less system.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> v2 changes:
> - switch to the one-subnode-per-evtchn under xen,domain" compatible node.
> - Add more detail about event-channel
> ---
>   docs/designs/dom0less-evtchn.md | 126 ++++++++++++++++++++++++++++++++

Answering here to also keep the history. On IRC, Bertrand was asking 
whether we merge design proposal.

We have merged proposal in the past (e.g. non-cooperative migration) and 
I would be ready to do it again as it is easier to find them afterwards.

However, I wonder whether it would be better to turn this proposal to a 
binding change in misc/arm/device-tree/. Any thoughts?

>   1 file changed, 126 insertions(+)
>   create mode 100644 docs/designs/dom0less-evtchn.md
> 
> diff --git a/docs/designs/dom0less-evtchn.md b/docs/designs/dom0less-evtchn.md
> new file mode 100644
> index 0000000000..62ec8a4009
> --- /dev/null
> +++ b/docs/designs/dom0less-evtchn.md
> @@ -0,0 +1,126 @@
> +# Signaling support between two domUs on dom0less system
> +
> +## Current state: Draft version
> +
> +## Proposer(s): Rahul Singh, Bertrand Marquis
> +
> +## Problem Statement:
> +
> +Dom0less guests would benefit from a statically-defined memory sharing and
> +signally system for communication. One that would be immediately available at
> +boot without any need for dynamic configurations.
> +
> +In embedded a great variety of guest operating system kernels exist, many of
> +which don't have support for xenstore, grant table, or other complex drivers.

I am not sure I would consider event channel FIFO a "trival" drivers :).

> +Some of them are small kernel-space applications (often called "baremetal",
> +not to be confused with the term "baremetal" used in the data center which
> +means "without hypervisors") or RTOSes. Additionally, for safety reasons, users
> +often need to be able to configure the full system statically so that it can
> +be verified statically.
> +
> +Event channels are very simple and can be added even to baremetal applications.
> +This proposal introduces a way to define them statically to make them suitable
> +for dom0less embedded deployments.
> +
> +## Proposal:
> +
> +Event channels are the basic primitive provided by Xen for event notifications.
> +An event channel is a logical connection between 2 domains (more specifically
> +between dom1,port1, and dom2,port2). Each event has a pending and a masked bit.
> +The pending bit indicates the event has been raised. The masked bit is used by
> +the domain to prevent the delivery of that specific event. Xen only performs a
> +0 → 1 transition on the pending bits and does not touch the mask bit. The

NIT: I think → is not an ascii character. Can you use "->"?

> +domain may toggle masked bits in the masked bit field and should clear the
> +pending bit when an event has been processed
> +
> +Events are received by a domain via an interrupt from Xen to the domain,
> +indicating when an event arrives (setting the bit). Further notifications are
> +blocked until the bit is cleared again. Events are delivered asynchronously to
> +a domain and are enqueued when the domain is not running.
> +More information about FIFO based event channel can be found at:

I think the explanation is fine for a design proposal. If you want to 
use it as documentation, then I would suggest to clarify there are two 
different ABI for event channel: FIFO and 2L.

2L is the easiest one to implement and for embedded we may want to steer 
the users towards it.

> +https://xenbits.xen.org/people/dvrabel/event-channels-H.pdf

It is quite unfortunate that this wasn't merged in docs/. Oh well, no 
action for you here.

> +
> +The event channel communication will be established statically between two
> +domains (dom0 and domU also) before unpausing the domains after domain creation.
> +Event channel connection information between domains will be passed to XEN via

NIT: above you are using "Xen". So s/XEN/Xen/ for consistency.

> +the device tree node. The event channel will be created and established
> +beforehand in XEN before the domain started. The domain doesn’t need to do any

Same here.

NIT: I think "beforehand" and "before" is redundant.

> +operation to establish a connection. Domain only needs hypercall
> +EVTCHNOP_send(local port) to send notifications to the remote guest.
> +
> +There is no need to describe the static event channel info in the domU device
> +tree. Static event channels are only useful in fully static configurations,
> +and in those configurations the domU device tree dynamically generated by Xen
> +is not needed.
> +
> +Under the "xen,domain" compatible node, there need to be sub-nodes with
> +compatible "xen,evtchn" that describe the event channel connection between two
> +domains(dom0 and domU also).

Below you provided an example between two domUs. Can you provide one 
between dom0 and a domU?

> +
> +The event channel sub-node has the following properties:
> +
> +- compatible
> +
> +    "xen,evtchn"
> +
> +- xen,evtchn
> +
> +    The property is tuples of two numbers
> +    (local-evtchn link-to-foreign-evtchn) where:
> +
> +    local-evtchn is an integer value that will be used to allocate local port
> +    for a domain to send and receive event notifications to/from the remote
> +    domain.
Port 0 is reserved and both FIFO/2L have limit on the port numbers.

I think we should let know the users about those limitations but I am 
not sure whether the binding is the right place for that.

> +
> +    link-to-foreign-evtchn is a single phandle to a remote evtchn to which
> +    local-evtchn will be connected.

I would consider to relax the wording so a user can create an event 
channel with the both end in the same domain.

Implementation wise, it should make no difference as you still need to 
lookup the domain.

> +
> +
> +Example:
> +
> +    chosen {
> +        ....
> +
> +        domU1: domU1 {
> +            compatible = "xen,domain";
> +
> +            /* one sub-node per local event channel */
> +            ec1: evtchn@1 {
> +                compatible = "xen,evtchn-v1";
> +                /* local-evtchn link-to-foreign-evtchn */
> +                xen,evtchn = <0xa &ec3>;
> +            };
> +
> +            ec2: evtchn@2 {
> +                compatible = "xen,evtchn-v1";
> +                xen,evtchn = <0xc &ec4>;
> +            };
> +            ....
> +        };
> +
> +        domU2: domU2 {
> +            compatible = "xen,domain";
> +
> +            /* one sub-node per local event channel */
> +            ec3: evtchn@3 {
> +                compatible = "xen,evtchn-v1";
> +                /* local-evtchn link-to-foreign-evtchn */
> +                xen,evtchn = <0xb &ec1>;
> +            };
> +
> +            ec4: evtchn@4 {
> +                compatible = "xen,evtchn-v1";
> +                xen,evtchn = <0xd &ec2>;
> +            };
> +            ....
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

-- 
Julien Grall

