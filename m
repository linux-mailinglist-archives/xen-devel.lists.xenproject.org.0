Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AA04FC3FB
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 20:17:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303221.517319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndyb0-0007le-Cd; Mon, 11 Apr 2022 18:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303221.517319; Mon, 11 Apr 2022 18:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndyb0-0007ja-9P; Mon, 11 Apr 2022 18:17:02 +0000
Received: by outflank-mailman (input) for mailman id 303221;
 Mon, 11 Apr 2022 18:17:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ndyaz-0007jU-3B
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 18:17:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndyax-00056d-TS; Mon, 11 Apr 2022 18:16:59 +0000
Received: from [54.239.6.185] (helo=[192.168.17.122])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndyax-00076Z-Mu; Mon, 11 Apr 2022 18:16:59 +0000
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
	bh=+hHmId337KFi3wMWdY1+FntArzPNcwmgCzWrzNnpxuU=; b=5GD1AmPys+2Sz94K4jTm2g8hWL
	KWA6nTnqRtgDYu8sDe77S0LIWR6LBKZYNDW5LQ8FQBVQDdWVAhMLkeq2PwRED5iR3NUbGtqDxFZCM
	lOP2yEinv9k6T7L330QLjYr9nUjnqfq4jluUCUNxRrhWouZ8BEY8rbqzEUll83r9Tqy4=;
Message-ID: <0210f3c6-0f06-4ff5-9f66-8410fd540171@xen.org>
Date: Mon, 11 Apr 2022 19:16:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] xen/evtchn: Add design for static event channel signaling
 for domUs..
To: Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2204081649370.3066615@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2204081649370.3066615@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 09/04/2022 02:00, Stefano Stabellini wrote:
> On Wed, 23 Mar 2022, Rahul Singh wrote:
>> in dom0less system. This patch introduce the new feature to support the
>> signaling between two domUs in dom0less system.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>>   docs/designs/dom0less-evtchn.md | 96 +++++++++++++++++++++++++++++++++
>>   1 file changed, 96 insertions(+)
>>   create mode 100644 docs/designs/dom0less-evtchn.md
>>
>> diff --git a/docs/designs/dom0less-evtchn.md b/docs/designs/dom0less-evtchn.md
>> new file mode 100644
>> index 0000000000..6a1b7e8c22
>> --- /dev/null
>> +++ b/docs/designs/dom0less-evtchn.md
>> @@ -0,0 +1,96 @@
>> +# Signaling support between two domUs on dom0less system
>> +
>> +## Current state: Draft version
>> +
>> +## Proposer(s): Rahul Singh, Bertrand Marquis
>> +
>> +## Problem Statement:
>> +
>> +The goal of this work is to define a simple signaling system between Xen guests
>> +in dom0less systems.
>> +
>> +In dom0less system, we cannot make use of xenbus and xenstore that are used in
>> +normal systems with dynamic VMs to communicate between domains by providing a
>> +bus abstraction for paravirtualized drivers.
>> +
>> +One possible solution to implement the signaling system between domUs is based
>> +on event channels.
> 
> I suggest to reword this as follows:
> 
> ---
> Dom0less guests would benefit from a statically-defined memory sharing
> and signally system for communication. One that would be immediately
> available at boot without any need for dynamic configurations.
> 
> In embedded a great variety of guest operating system kernels exist,
> many of which don't have support for xenstore, grant table or other
> complex drivers. Some of them are small kernel-space applications (often
> called "baremetal", not to be confused with the term "baremetal" used in
> datacenter which means "without hypervisors") or RTOSes.  Additionally,
> for safety reasons, users often need to be able to configure the full
> system statically so that it can be verified statically.
> 
> Event channels are very simple and can be added even to baremetal
> applications. This proposal introduces a way to define them statically
> to make them suitable to dom0less embedded deployments.
> ---
> 
> 
>> +## Proposal:
>> +
>> +Event channels are the basic primitive provided by Xen for event notifications.
>> +An event channel is a logical connection between 2 domains (more specifically
>> +between dom1,port1 and dom2,port2). They essentially store one bit of
>> +information, the event of interest is signalled by transitioning this bit from
>> +0 to 1. An event is an equivalent of a hardware interrupt.
>> +
>> +Notifications are received by a guest via an interrupt from Xen to the guest,
>> +indicating when an event arrives (setting the bit). Further notifications are
>> +masked until the bit is cleared again. When a domain wants to wait for data it
>> +will block until an event arrives, and then send an event to signal that data
>> +has been consumed. Events are delivered asynchronously to guests and are
>> +enqueued when the guest is not running.
>> +
>> +Event channel communication will be established statically between two domU
>> +guests before unpausing the domains after domain creation. Event channel
>> +connection information between domUs will be passed to XEN via device tree
>> +node.
>> +
>> +Under the /chosen node, there needs to be sub nodes with compatible
>> +"xen,evtchn" that descibes the event channel connection between two domUs.
>> +
>> +The event channel sub-node has the following properties:
>> +
>> +- compatible
>> +
>> +    "xen,evtchn"
>> +
>> +- xen,evtchn
>> +
>> +    The property is four numbers of tuples of
>> +    (local-port-domU1,domU1-phandle,local-port-domU2,domU2-phandle) where:
>> +
>> +    local-port-domU1 is an integer value that will be used to allocte local
>> +    port for domU1 to send an event notification to the remote domain.
>> +
>> +    domU1-phandle is a single phandle to an domain to which local-port-domU1
>> +    will be allocated.
>> +
>> +    local-port-domU2 is an integer value that will be used to allocte local
>> +    port for domU2 to send an event notification to the remote domain.
>> +
>> +    domU2-phandle is a single phandle to an domain to which local-port-domU2
>> +    will be allocated.
>> +
>> +Example:
>> +
>> +    chosen {
>> +        ....
>> +
>> +        domU1: domU1 {
>> +            ......
>> +        };
>> +
>> +        domU2: domU2 {
>> +            ......
>> +        };
>> +
>> +        evtchn@1 {
>> +            compatible = "xen,evtchn";
>> +            xen,evtchn = <0xa &domU1 0xb &domU2>;
>> +        };
>> +
>> +        evtchn@2 {
>> +            compatible = "xen,evtchn";
>> +            xen,evtchn = <0xc &domU1 0xd &domU2>;
>> +        };
>> +    };
> 
> There is no need to use two evtchn nodes for this given that in device
> tree it is entirely normal to have multiple tuplets in a property. Also,
> it would be good to have a version number in the compatible string so
> that we can change version in the future.
> 
> 1)
>      chosen {
>          ....
> 
>          domU1: domU1 {
>              ......
>          };
> 
>          domU2: domU2 {
>              ......
>          };
> 
>          evtchn {
>              compatible = "xen,evtchn-v1";
>              xen,evtchn = <0xa &domU1 0xb &domU2 0xc &domU1 0xd &domU2>;
>          };
>      };
> 
> 
> I should mention that it would be also possible to use sub-nodes to
> express this information:
> 
> 2)
>          domU1: domU1 {
>              ...
>              /* one sub-node per local event channel */
>              ec1: evtchn@a {
>                  compatible = "xen,evtchn-v1";
>                  /* local-evtchn link-to-foreign-evtchn */
>                  xen,evtchn = <0xa &ec3>
>              };
>              ec2: evtchn@c {
>                  compatible = "xen,evtchn-v1";
>                  xen,evtchn = <0xc &ec4>
>              };
>          };
> 
>          domU2: domU2 {
>              ...
>              ec3: evtchn@b {
>                  compatible = "xen,evtchn-v1";
>                  xen,evtchn = <0xb &ec1>
>              };
>              ec4: evtchn@d {
>                  compatible = "xen,evtchn-v1";
>                  xen,evtchn = <0xa &ec2>
>              };
>          };
>      };

As for 1), you could combine all the ports in one node.

> 
> This format has the advantage that doesn't need a new top-level node
> type under /chosen. That is desirable few a few reasons. Today we only
> have domains (dom0 is legacy). In the future we might have nested
> domains and non-Xen domains. With System Device Tree, domains are under
> /domains instead of /chosen.
> 
> So normally I would argue to use the sub-node format because it doesn't
> need a new top-level node under /chosen. However, in this case it looks
> like the 1) format is simpler to write and also simpler to parse in Xen.

I am not sure for both. For the writing part: In one hand, it is nice to 
have all the event channels defined in one place. One the other hand, it 
is more messy if you want to visually check that you don't duplicate the 
event channels.

It may also end up to be complex to read if you have many events 
channels. So if we go with 1), I think we would want to allow multiple 
nodes to help the user to keep a clean/readable DT.

> 
> In 1), we would need to loop over xen,evtchn and for each tuplet we
> would only need to fetch the foreign domid.

You will need to loop over all the nodes in chosen to find "xen,evtchn" 
and also fetch two phandles.

> 
> In 2), we would need to check the compatible string of every
> "xen,evtchn-v1" node, and we would have to fetch from the phandle both
> the remote event channel number but also the domain-id of the parent.
> 
> So it looks like 1) is better because it is much simpler to parse. Do
> you agree?

See above, I am not sure the code to parse will end up to be much bigger 
because we would still need to loop on the nodes in chosen and fetch two 
phandles.

That said, we are potentially going to need to loop on more nodes.

So overall, I am 50/50 on which one to chose.

Cheers,

-- 
Julien Grall

