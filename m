Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9888C1274
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 18:11:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719316.1122003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s56MB-0005Wq-TV; Thu, 09 May 2024 16:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719316.1122003; Thu, 09 May 2024 16:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s56MB-0005UP-QF; Thu, 09 May 2024 16:10:55 +0000
Received: by outflank-mailman (input) for mailman id 719316;
 Thu, 09 May 2024 16:10:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y6XG=MM=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s56M9-0005UJ-Nq
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 16:10:54 +0000
Received: from doppler.solinno.uk
 (8.1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.9.a.d.0.6.f.d.1.0.b.8.0.1.0.0.2.ip6.arpa
 [2001:8b0:1df6:da9::18])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b43ed473-0e1e-11ef-b4bb-af5377834399;
 Thu, 09 May 2024 18:10:51 +0200 (CEST)
Received: from mail.solinno.uk (localhost [127.0.0.1])
 by doppler.solinno.uk (Postfix) with ESMTP id 5B25F80058;
 Thu,  9 May 2024 17:10:50 +0100 (BST)
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
X-Inumbo-ID: b43ed473-0e1e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1715271050;
	bh=28qez7AsmLm1bdQt/hM8A9aHukwMHE/I7EpLIEWCf68=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VyKqEEl5+vnojZHjPS+4VCT7PCG3WTcg4cofqNAijZDHokz5sMoMiTJIjwwC3GYDc
	 3sPRSmQuLffMmTrqtj+U9xEtLCZKafA9UvxW3TVBj998jFJVTVhVZSgS9rOUL5F7ie
	 ssWLgKhAktPJDofIwe8DMxhYPgOcIXu57JaGLXpI=
MIME-Version: 1.0
Date: Thu, 09 May 2024 17:10:50 +0100
From: Leigh Brown <leigh@solinno.co.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, Jason Andryuk
 <jandryuk@gmail.com>
Subject: Re: [RFC PATCH v2 0/5] Add bridge VLAN support
In-Reply-To: <f5300cd1-4200-4957-9e4b-9ba0c1f40fa2@citrix.com>
References: <20240508213824.55824-1-leigh@solinno.co.uk>
 <f5300cd1-4200-4957-9e4b-9ba0c1f40fa2@citrix.com>
Message-ID: <2d89f70c625c3abd24bd57f2ee0d2f94@solinno.co.uk>
X-Sender: leigh@solinno.co.uk
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 2024-05-09 16:53, Andrew Cooper wrote:
> On 08/05/2024 10:38 pm, Leigh Brown wrote:
>> Hello all,
>> 
>> I realised over the weekend that there is a valid use case for 
>> providing
>> a VIF to a domain that has access to multiple VLANs, e.g. a router. 
>> Yes,
>> you can create a VIF per VLAN, but if you start having several VLANs 
>> (as
>> I do), it would be nicer to create a single interface that has access 
>> to
>> all the relevant VLANs (e.g. enX0.10, enX0.20, etc.).
>> 
>> So, version 2 changes the name and type of the parameter from an 
>> integer
>> called `vid' to a string called `vlan'. The vlan parameter is then
>> parsed by the vif-bridge script (actually, the functions called by it 
>> in
>> xen-network-common.sh).
>> 
>> As it quite a common practice to allocate VLANs in round numbers, I 
>> also
>> implemented the ability to specify contiguous or non-contiguous 
>> ranges.
>> You can specify whether a VLAN is tagged or untagged, and which VLAN 
>> is
>> the PVID (only one PVID is allowed).  For example,
>> 
>> vif = [ 'mac=xx:xx:xx:xx:xx:xx, bridge=br0, vlan=10p/20-29' ]
>> 
>> will setup the VIF so that 10 is the PVID and VLAN IDs 20 through 29
>> are permitted with tags. Another example:
>> 
>> vif = [ 'mac=xx:xx:xx:xx:xx:xx, bridge=br0, vlan=1p/10+10x9' ]
>> 
>> will setup the bridge to set 1 as the PVID and permit access with
>> tags for VLAN IDs 10, 20, 30, 40, 50, 60, 70, 80 and 90.
>> 
>> This patch set enables this capability as follows:
>> 
>> 1. Adds `vlan' as a new member of the libxl_device_nic structure;
>> 2. Adds support to read and write the vlan parameter from the 
>> xenstore;
>> 3. Adds `vlan' as a new keyword for the vif configuration option;
>> 4. Adds support to assign the bridge VLANs in the Linux hotplug 
>> scripts;
>> 5. Updated xl-network-configuration(5) manpage and example configs.
>> 
>> Original blurb below:
>> 
>> For many years I have been configuring VLANs on my Linux Dom0 by
>> creating VLAN interfaces for each VLAN I wanted to connect a domain
>> to and then a corresponding bridge. So I would tend to have things
>> like:
>> 
>> enp0s0    -> br0     -> vif1, vif2
>> enp0s0.10 -> br0vl10 -> vif3, vif4
>> enp0s0.20 -> br0vl20 -> vif5
>> dummy0    -> br1     -> vif6
>> 
>> I recently discovered that iproute2 supports creating bridge VLANs 
>> that
>> allows you to assign a VLAN to each of the interfaces associated to a
>> bridge. This allows a greatly simplified configuration where a single
>> bridge can support all the domains, and the iproute2 bridge command 
>> can
>> assign each VIF to the required VLAN.  This looks like this:
>> 
>> # bridge vlan
>> port              vlan-id
>> enp0s0            1 PVID Egress Untagged
>>                   10
>>                   20
>> br0               1 PVID Egress Untagged
>> vif1.0            1 PVID Egress Untagged
>> vif2.0            1 PVID Egress Untagged
>> vif3.0            10 PVID Egress Untagged
>> vif4.0            10 PVID Egress Untagged
>> vif5.0            20 PVID Egress Untagged
>> vif6.0            30 PVID Egress Untagged
>> 
>> This patch set enables this capability as follows:
>> 
>> 1. Adds `vid' as a new member of the libxl_device_nic structure;
>> 2. Adds support to read and write vid from the xenstore;
>> 3. Adds `vid' as a new keyword for the vif configuration option;
>> 4. Adds support for assign the bridge VLAN in the Linux hotplug 
>> scripts.
>> 
>> I don't believe NetBSD or FreeBSD support this capability, but if they
>> do please point me in the direction of some documentation and/or 
>> examples.
>> 
>> NB: I'm not very familiar with Xen code base so may have missed
>> something important, although I have tested it and it is working well
>> for me.
>> 
>> Cheers,
>> 
>> Leigh.
>> 
>> 
>> Leigh Brown (5):
>>   tools/libs/light: Add vlan field to libxl_device_nic
>>   tools/xl: add vlan keyword to vif option
>>   tools/hotplug/Linux: Add bridge VLAN support
>>   docs/man: document VIF vlan keyword
>>   tools/examples: Example Linux bridge VLAN config
>> 
>>  docs/man/xl-network-configuration.5.pod.in    |  38 ++++++
>>  tools/examples/linux-bridge-vlan/README       |  68 +++++++++++
>>  tools/examples/linux-bridge-vlan/br0.netdev   |   7 ++
>>  tools/examples/linux-bridge-vlan/br0.network  |   8 ++
>>  .../examples/linux-bridge-vlan/enp0s0.network |  16 +++
>>  tools/hotplug/Linux/xen-network-common.sh     | 111 
>> ++++++++++++++++++
>>  tools/libs/light/libxl_nic.c                  |  10 ++
>>  tools/libs/light/libxl_types.idl              |   1 +
>>  tools/xl/xl_parse.c                           |   2 +
>>  9 files changed, 261 insertions(+)
>>  create mode 100644 tools/examples/linux-bridge-vlan/README
>>  create mode 100644 tools/examples/linux-bridge-vlan/br0.netdev
>>  create mode 100644 tools/examples/linux-bridge-vlan/br0.network
>>  create mode 100644 tools/examples/linux-bridge-vlan/enp0s0.network
>> 
> 
> This is past the last-post date, so Oleksii will need to decide whether
> he's happy to make an exception for it.

 From my own perspective, I know this is an enhancement and am more than
happy to maintain it locally for the time being, so no problem if it has
to wait.  Still happy for any feedback though :-)

> Anthony is OoO for a month now, so if this is to get in for 4.19, then
> it will need reviewing by others.  I've CC'd a few plausible 
> candidates...
> 
> ~Andrew

Regards,

Leigh,

