Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A14788C6A44
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 18:11:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722554.1126640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7HCr-00048V-9h; Wed, 15 May 2024 16:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722554.1126640; Wed, 15 May 2024 16:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7HCr-00046z-6y; Wed, 15 May 2024 16:10:17 +0000
Received: by outflank-mailman (input) for mailman id 722554;
 Wed, 15 May 2024 16:10:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1aeg=MS=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s7HCq-00046t-DW
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 16:10:16 +0000
Received: from doppler.solinno.uk
 (8.1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.9.a.d.0.6.f.d.1.0.b.8.0.1.0.0.2.ip6.arpa
 [2001:8b0:1df6:da9::18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d5f2675-12d5-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 18:10:15 +0200 (CEST)
Received: from mail.solinno.uk (localhost [127.0.0.1])
 by doppler.solinno.uk (Postfix) with ESMTP id 85A3E80068;
 Wed, 15 May 2024 17:10:14 +0100 (BST)
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
X-Inumbo-ID: 9d5f2675-12d5-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1715789414;
	bh=OjqAW+TAGPOZIhhrPnD6hgyoZ74oVlIcnOnEsUGmRhY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LTo3lADku09O/lUuo/3NLVPMr9EJwBdPm9x8P6w5mnp4Ga0mtjBnNf6mmdPpICVij
	 BqZbI7byS/dAZwf7fEEnEVPBkI1zA8fkVzKwrsmRb3DRgxZ/4JNQbt6IdrNVZBOjFV
	 zOkyP3kl5g6m3VbsheOzJrJOGs6Sdz1cZBmmnYi8=
MIME-Version: 1.0
Date: Wed, 15 May 2024 17:10:14 +0100
From: Leigh Brown <leigh@solinno.co.uk>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@citrix.com
Subject: Re: [RFC PATCH v2 5/5] tools/examples: Example Linux bridge VLAN
 config
In-Reply-To: <CAKf6xpt+UTwY0hFuODhpeb6rWOB0kgbqrrFVprP7MZYOTJ59YA@mail.gmail.com>
References: <20240508213824.55824-1-leigh@solinno.co.uk>
 <20240508213824.55824-6-leigh@solinno.co.uk>
 <CAKf6xpt+UTwY0hFuODhpeb6rWOB0kgbqrrFVprP7MZYOTJ59YA@mail.gmail.com>
Message-ID: <ec51767e47d0a5b9baea46173b1e9e9e@solinno.co.uk>
X-Sender: leigh@solinno.co.uk
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Hi Jason,

On 2024-05-15 01:58, Jason Andryuk wrote:
> On Wed, May 8, 2024 at 6:08 PM Leigh Brown <leigh@solinno.co.uk> 
> wrote:>
>> Add a new directory linux-bridge-vlan with examples files showing
>> how to configure systemd-networkd to support a bridge VLAN
>> configuration.
>> 
>> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
>> ---
>>  tools/examples/linux-bridge-vlan/README       | 68 
>> +++++++++++++++++++
>>  tools/examples/linux-bridge-vlan/br0.netdev   |  7 ++
>>  tools/examples/linux-bridge-vlan/br0.network  |  8 +++
>>  .../examples/linux-bridge-vlan/enp0s0.network | 16 +++++
>>  4 files changed, 99 insertions(+)
>>  create mode 100644 tools/examples/linux-bridge-vlan/README
>>  create mode 100644 tools/examples/linux-bridge-vlan/br0.netdev
>>  create mode 100644 tools/examples/linux-bridge-vlan/br0.network
>>  create mode 100644 tools/examples/linux-bridge-vlan/enp0s0.network
> 
> I think putting these in docs/misc/linux-bridge-vlan/ might be a
> better location.

No problem, will move.

>> diff --git a/tools/examples/linux-bridge-vlan/README 
>> b/tools/examples/linux-bridge-vlan/README
>> new file mode 100644
>> index 0000000000..83b9fa3fd6
>> --- /dev/null
>> +++ b/tools/examples/linux-bridge-vlan/README
>> @@ -0,0 +1,68 @@
>> +Linux Xen Dom0 single bridge multiple VLAN configuration with systemd
>> +=====================================================================
>> +
>> +Introduction
>> +------------
>> +
>> +This directory contains example files to be placed in 
>> /etc/systemd/network
>> +to enable a single bridge with multiple VLAN support.
>> +
>> +The example is to support the scenario where the Xen host network 
>> interface
>> +is connected to an Ethernet switch configured as a trunk port. Each 
>> domain
>> +VIF can then be configured with one or more VLAN IDs, one of which 
>> will be
>> +the PVID.
>> +
>> +The example files create a bridge device called br0, with a physical 
>> interface
>> +called enp0s0. You will need to update this with your system's device 
>> name.
>> +
>> +Key points of the configuration are:
>> +
>> +1. In br0.netdev, VLANFiltering=on is set. This is required to ensure 
>> the
>> +   VLAN tags are handled correctly.  If it is not set then the 
>> packets
>> +   from the VIF interfaces will not have the correct VLAN tags set.
>> +
>> +2. In br0.network, a system IPv4 address is configured that can be 
>> updated
>> +   according to your local network settings.
>> +
>> +3. In enp0s0.network, Bridge=br0 sets the bridge device to connect 
>> to. There
>> +   is also a [BridgeVLAN] section for each VLAN you want to give 
>> access
>> +   to the switch. Note, if you want to create an internal VLAN 
>> private to
> 
> For
> "for each VLAN you want to give access to the switch"
> do you mean:
> "for each VLAN you want connected with the external network"
> or
> "for each VLAN you want accessible on the external network"
> ?
> The "access to the switch" part I find unclear.
> 

On re-reading it is not as clear as I'd hope - I will adjust.

>> +   the host, do not include its VLAN ID in this file.
> 
> 
>> +Domain configuration
>> +--------------------
>> +
>> +Add the vlan= keyword to the vif definition in the domain. The 
>> simplest
>> +and most common example is a domain that wishes to connect to a 
>> single VLAN:
>> +
>> +vif = [ 'mac=xx:xx:xx:xx:xx:xx, bridge=br0, vlan=10' ]
>> +
>> +If you wish to configure a domain to route between two VLANs, you 
>> have two
>> +options. Option 1 is to create multiple interfaces on different 
>> VLANs:
>> +
>> +vif = [ 'mac=xx:xx:xx:xx:xx:xx, bridge=br0, vlan=10',
>> +       'max=xx:xx:xx:xx:xx:xx, bridge=br0, vlan=20' ]
> 
> Hard tab here makes the diff look off, but the file would be aligned.

Will fix up so all the indents are spaced, to be consistent.

> I think this is good content.  I'm not familiar with the systemd
> networking stuff to give an R-b.  But it's only examples, so I think
> it should be okay.  I'm not a maintainer, but it would be an Acked-by,
> if I were.
> 
> Regards,
> Jason

Regards,

Leigh.

