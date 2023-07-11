Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE25A74E3AF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 03:47:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561512.877941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ2Rr-0006YG-Ss; Tue, 11 Jul 2023 01:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561512.877941; Tue, 11 Jul 2023 01:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ2Rr-0006WK-Pe; Tue, 11 Jul 2023 01:45:51 +0000
Received: by outflank-mailman (input) for mailman id 561512;
 Tue, 11 Jul 2023 01:45:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j4z7=C5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qJ2Rq-0006WE-7j
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 01:45:50 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a72cef40-1f8c-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 03:45:47 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1689039917513486.26483575552004;
 Mon, 10 Jul 2023 18:45:17 -0700 (PDT)
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
X-Inumbo-ID: a72cef40-1f8c-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1689039919; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LNbMXlFZdC9QLvkSATM6pvc1piDdQtr3Cod9bZ+I4VRe6jTdtd48u25IWrBfqV4W75ibM75QVabS6QMjD96TcSQ0pn8y9Tz6StW6hh9Mn04GzJaPhYZhbnhNAW2KVjIovuInFzU4u9zzhR4ZPni/pK8zXK6xau3xxHKk1GWusoM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1689039919; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=kgHWB+JIkTCLQZb1jJOehzu38V5z1VYek2Z9IqxNwGM=; 
	b=grkn9vLonR5IOVY8on2mk1rti5pKVOsiZb/847LTRyg8hWFzFShZik3+mQ9FGfwzC8qi677bpn9pEGOWViGdV8LSwFR86YZLTlokuaCPl9dloaHnLP40imCGRZaDyHIOgqDcmDluiog5TiIssAP1OtUjYpX/71VT8THGDkgtmaY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1689039919;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=kgHWB+JIkTCLQZb1jJOehzu38V5z1VYek2Z9IqxNwGM=;
	b=ZFBc8gtq+BtYqcmQ6qtiXnplpWbKKc5sCtQ5KcSIn8RBPyZ1J0PiK2iCs9QoaT4b
	YuK5rexIynvJM+0FDUQBJkJMwEbDNDNbLAP1SL8KWeZtf1UcDkRU+9dKVAv4OapDuWQ
	FASriQ4brL5epsQ8L7Fgc/ZxIiOoSyLZVuHq7+N4=
Message-ID: <8ec3da55-b0ca-3b4e-d3b3-8f5560074c99@apertussolutions.com>
Date: Mon, 10 Jul 2023 21:45:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
To: Stefano Stabellini <sstabellini@kernel.org>,
 Rich Persaud <persaur@gmail.com>
Cc: Luca Fancellu <luca.fancellu@arm.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 George Dunlap <george.dunlap@cloud.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Rian Quinn
 <rianquinn@gmail.com>, Ian Jackson <iwj@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Scott Davis <scott.davis@starlab.io>, Adam Fraser <adam@starlab.io>,
 Paul Durrant <paul@xen.org>, rsmith@riversideresearch.org,
 m.a.young@durham.ac.uk, Elliott Mitchell <ehem+xen@m5p.com>,
 openxt <openxt@googlegroups.com>, Jason Andryuk <jandryuk@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <4CAC8F69-ABE0-47D7-9421-77F0719B9BDE@arm.com>
 <7C4F691F-1C60-48EF-A1B6-B358DF16B13B@gmail.com>
 <alpine.DEB.2.22.394.2307081108440.761183@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <alpine.DEB.2.22.394.2307081108440.761183@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 7/8/23 14:08, Stefano Stabellini wrote:
 > On Sat, 8 Jul 2023, Rich Persaud wrote:
 >> On Jul 8, 2023, at 03:29, Luca Fancellu <luca.fancellu@arm.com> wrote:
 >>> ﻿
 >>>>>>
 >>>>>> Instead, the use case configurations should themselves be 
describable.
 >>>>>
 >>>>> Thanks Christopher, Daniel and all!
 >>>>>
 >>>>> So if I understand correctly, you are in favor if renaming 
Dom0less to
 >>>>> Hyperlaunch throughout the Xen codebase? And we need a 
clarification of
 >>>>> the docs/, especially docs/features/dom0less.pandoc?
 >>>>
 >>>> Christopher wrote:
 >>>>>> = Community resourcing
 >>>>
 >>>> Note the pre-requisite work items for upstream Xen, listed under 
"Community Resourcing", to merge code for Hyperlaunch common interfaces 
and test cases, with docs on configuration of Hyperlaunch to deliver 
functionality for dom0less use cases.
 >>>
 >>> Are you saying that before renaming the “dom0less” feature, we 
should wait for it to be ported to the common code?
 >>
 >> Why "wait"? In what timeframe do you expect dom0less to use 
Hyperlaunch code?
 >>
 >> Can kernel component foo adopt the name of kernel component bar 
without code change?
 >>
 >> Can dom0less stakeholders derive Hyperlaunch benefits without using 
Hyperlaunch code?
 >
 >
 > I think Rich is saying that before using the same name we should make
 > sure that the interfaces and features are actually comparable and maybe
 > even "compatible". I think that is very reasonable. Rich, did I
 > understand correctly?

Essentially, yes this is what is being sought here. This does not mean 
that the full capability has to be present for the adoption of the 
common name, but that it can be accomplished through a path of integration.

 > The Hyperlaunch (x86) code is not yet upstream, but the design document
 > that describes the device tree interface shows an interface that is very
 > similar, almost compatible, with today's dom0less (ARM) device tree
 > interface.

I would caution the use of the current in-tree document as it is today, 
it was posted under the design folder as it was only the design and not 
burdened with the realities of implementation. Along the path of v1 
implementation, recent PVH expansion, and roles update, each have 
required updates to the design which are not yet included in the in-tree 
docs.

To address, this the plan below starts with the documentation patch 
posted in v1 of the hyperlaunch series:

 
https://lists.xenproject.org/archives/html/xen-devel/2022-07/msg00353.html

and will contain updates for community feedback received:

 
https://lists.xenproject.org/archives/html/xen-devel/2022-07/msg01015.html

and development work that has been done for PVH and roles.

 > The structure of the device tree information is the same. Going through
 > it I could only spot only tiny differences:
 > - top level node is "hypervisor" instead of "chosen"
 > - "module-addr" instead of "reg"
 > - "module,kernel" instead of "multiboot,kernel"
 > - "module,ramdisk" instead of "multiboot,ramdisk"
 >
 > The rest is the same. If we sort out these small differences one way or
 > the other then the resulting interface should actually be fully
 > compatible and we could reuse the existing Dom0less (ARM) code to parse
 > an HyperLaunch (x86) configuration.
 >
 > The top level node is not a problem. We could easily deal with both
 > "hypervisor" and also "chosen". Or we could pick a third different name
 > for both: "domains" which is the one used by System Device Tree.
 >
 > I think we should rename "module-addr" to "reg" in the hyperlaunch
 > design document. I don't think it would have any effect on the existing
 > hyperlaunch (x86) code and usage because direct addresses are typically
 > not used on x86.
 >
 > "module,kernel" and "module,ramdisk": we could either get rid of them in
 > favor of "multiboot,kernel" and "multiboot,ramdisk", or we could add
 > "module,kernel" and "module,ramdisk" as alternative aliases in the
 > existing dom0less (ARM) code. We already have "xen,linux-zimage" and
 > "xen,linux-initrd" as aliases so it is not a problem.
 >
 >
 > Also, I do think that Dom0less stakeholders would benefit from
 > Hyperlaunch code such as Dom0's reduction of privilege. Things like
 > "permissions" and "functions" of the Hyperlauch device tree interface
 > design document.

The roles work takes that to its final conclusion, from which everyone 
will benefit.

 > So, my opinion is that we should go ahead with dom0less->hyperlaunch
 > rename but we should also try to make the two device tree interfaces
 > compatible, sorting out the small differences above. That would help a
 > lot in terms of documentation and tooling. It would be ideal if things
 > like ImageBuilder worked equally well for Hyperlaunch (x86) and Dom0less
 > (ARM).

Let me build on the plan laid out by Christopher, that detailed arriving 
at the completion for hyperlaunch, and provide a set of steps to arrive 
at a new short-term milestone to a larger roadmap. The intent being to 
arrive at the immediate desire of the community to see dom0less renamed. 
For the longer term, as Christopher was alluding, there is still a 
significant amount of work to be done to deliver one of the biggest 
market differentiating capabilities for Xen in some time.

As Stefano has acknowledged, hyperlaunch is a concept that is beyond 
domain construction and that is, or will be, embodied by a set of 
interfaces and capabilities. Considering dom0less as it is implemented 
today, does not meet the former and in spirit meets the latter. 
Compounding this is that dom0less is a supported feature today, with its 
own defined interface, and a user base that is using that interface, at 
least to some degree AIUI.

We have a responsibility to the dom0less user base and future 
hyperlaunch users with requirements based on hyperlaunch design docs and 
presentations.  As such, any action taken should be done so under a 
larger roadmap of adding the complete hyperlaunch capability to Xen.

With the initial funding by AMD, the first milestone was to be moving 
Xen on to a common representation of boot material provided to the 
hypervisor. As a result of this discussion, I would like to put forth a 
new nearer term milestone of incorporating dom0less under hyperlaunch.

The naming suggestions by the community are greatly appreciated, and I 
do not want to seem dismissive of clear offers of help and assistance. 
This area is something Christopher and I discussed at length during the 
drafting of the hyperlaunch design. Something we arrived at is that 
there is only a single top level feature, which is hyperlaunch. The 
hyperlaunch feature itself will provide multiple means to configure how 
a launch will occur, one could even consider them modes of operation.

Reviewing the design doc, you will see that an initial attempt to 
categorize them was done, splitting them into a dynamic mode and static 
mode. Under these modes were multiple use cases. With that, we did not 
mean to limit the hyperlaunch modes to strictly those two, and thus 
other modes are more than reasonable to add. As such, my suggestion 
would be the introduction of the dom0less compatibility mode for 
hyperlaunch. Its very definition is a mode of hyperlaunch that supports 
the "legacy" dom0less configuration interface. This approach allows 
dom0less to effectively become hyperlaunch, deconflicts the fact that 
hyperlaunch proper has a different interface than dom0less, and provides 
a clean roadmap for migration to existing dom0less users.

To provide a concrete, measurable set of steps to achieve the dom0less 
merging milestone, I will lay out the approach as three patch series 
that will be a collaboration by the community. Each will need to be 
submitted, reviewed and merged into the tree, with the end being the 
existing dom0less becoming hyperlaunch's dom0less compatibility mode.

== Patch Series 1 (Resourced by Apertus)

The goal of this series is to properly introduce the hyperlaunch 
"feature" in to Xen. This series would be submitted by myself and will 
consist of two patches derived from the original hyperlaunch v1 series. 
The first patch is the docs patch that updates the hyperlaunch device 
tree design to reflect review feedback and updates for PVH and roles, 
mentioned above.

The second patch will start with the v1 series patch that moved the fdt 
parsing helpers into common:
https://lists.xenproject.org/archives/html/xen-devel/2022-07/msg00352.html

The patch currently moves common FDT parsing to common/fdt.c, it will be 
updated to add this path to DEVICE TREE in MAINTAINERS. As part of 
updating MAINTAINERS, there will be the addition of HYPERLAUNCH, which 
will own common/domain-builder/ and doc/design/launch paths. As such, 
this will effectively be a declaration of the top level hyperlaunch 
feature, with this as an interface, and establish the maintainers of the 
feature.

== Patch Series 2 (Requesting resourcing by Arm)

The goal of this series would be to move the dom0less device tree 
parsing under hyperlaunch. We would respectfully request a member of the 
Arm community to volunteer to take ownership and steward the series 
through submission and review process.

The implementation of this series would see dom0less device tree parsing 
to use, and expand if necessary, the common/fdt parsing helpers. I 
personally would see this logic move under common/domain-builder using a 
file name that would not collide with the files from the hyperlaunch v1 
series, e.g.  a suggestion would be fdt-dom0less.c.

As for ownership of that file, I would suggest the addition of a 
HYPERLAUNCH DOM0LESS COMPATIBILITY be added to MAINTAINERS with the 
appropriate Arm community members, but understand and willing to 
consider the position that it falls under HYPERLAUNCH. The purpose of 
using HYPERLAUNCH DOM0LESS COMPATIBILITY will be to provide a means to 
signal the retirement of dom0less compatibility mode at some future point.

== Patch Series 3 (Resourced by Apertus)

The goal of this series will be to formalize hyperlaunch dom0less 
compatibility mode. The series would be submitted by myself and/or 
Christopher. It will consist of documentation patches that will add a 
doc/features/hyperlaunch.rst and a 
doc/features/hyperlaunch/dom0less-compatiblilty.rst. The hyperlaunch.rst 
path will fall under HYPERLAUNCH, while dom0less-compatiblilty.rst will 
fall under HYPERLAUNCH DOM0LESS COMPATIBILITY. This will also see 
DOM0LESS in SUPPORTED.md be renamed to HYPERLAUNCH.

In summary, I would like to reiterate points made by Rich and 
Christopher. The motivation and concept of the hypervisor 
differentiating capability that is hyperlaunch goes back to the 2012 
domain builder work that was a companion to the hardware domain work.

Since then, there have been a few of us in the OpenXT community that 
desired to make this an integral part of Xen. Internal OpenXT 
discussions in 2017-2018 along with the announcement of dom0less 
inspired confidence there were in fact other uses cases and interest in 
Xen gaining such an integrated capability.

A fact that should not go overlooked or undervalued is that hyperlauch 
would not exist today without the extremely generous support StarLab 
provided to sponsor Christopher and I to do the R&D, proof of viability, 
and a full working prototype that provided the basis for the v1 series. 
This was not a minor investment on their part, and taking the design to 
completion requires further substantial investment. Due to an 
acquisition imposed shift in market focus, StarLab has since stepped away.

Fortunately, and for which we are immensely appreciative, AMD has 
recently stepped up to fund some hyperlaunch work items. With a growing 
number of hyperlaunch use cases, I would be happy to help those with 
budgetary influence to communicate the business benefits of investment 
in open work items, targeting specific launch configurations, safety and 
security properties.

The amount of work to be done goes beyond just parallel domain 
construction, there are tangential capabilities that need updating and 
incorporation. For instance, a topic discussed during the summit, VPCI 
and device assignment at/during hypervisor startup. Anyone looking or 
willing to provide purely financial support, feel free to reach out 
directly to Christopher and me, as we have a few avenues to enable the 
flow of funds.

Attached are candidate work items for funding and resourcing of 
hyperlaunch integration, building upon the proposed Apertus and Arm 
patch series for dom0less rename and migration to hyperlaunch common 
interfaces.

Lastly, thank you to everyone who has taken the time to engage and 
collaborate on how to resolve the task at hand!

V/r,
Daniel P. Smith

===

Here are outlines for the next development items appropriate for funding 
for progress on hyperlaunch integration, following on from the three 
series described above.

== Work Item: initial x86 Hyperlaunch SUPPORT and launch of dom0 
(Resourcing TBD)

The goal is to enable initial hyperlaunch SUPPORT on x86, building upon 
from the work in the posted v3 series of hyperlaunch.

Development proceeds from patches 9-12 of the v1 hyperlaunch series, to 
add boot with minimal construction of a classic dom0 from a device tree 
configuration. The Hyperlaunch SUPPORT statement would add x86 and Xen 
nightly CI and release-gating test configurations would be extended to 
include hyperlaunch on x86.


== Work Item: Hyperlaunch XSM policy for guests (Resourcing TBD)

The goal is to ensure that security policies of guests started via 
hyperlaunch are accurately aligned with the configured functions of each 
guest, which would allow for reduction of privilege of the dom0 in 
dom0less systems.

A new XSM policy with granular permissions for domain functions, aligned 
with the roles work, would be integrated into the hypervisor.  It would 
define new domain security labels appropriate for assigning to domUs, 
matching privileges for the domain functions that can be assigned with 
hyperlaunch, and allowing for more expressive policy control than is 
expressible with dom0less.


== Work Item: Hyperlaunch of Arm guests SUPPORT (Resourcing TBD)

The goal of this effort is to enable hyperlaunch of Arm guests.

It would enable use of the architecture-common Hyperlaunch Device Tree 
format on Arm, providing the forward migration path from the Dom0less 
format, to the new format with additional flexibility for guest 
construction, including control over console privilege assignment and 
XSM label control.

It would achieve the objective of using common cross-architecture boot 
structures and community-maintained common code.

Development would proceed from patches 9-10 of the v1 hyperlaunch 
series, to add boot with construction of dom0 and domU guests from a 
hyperlaunch device tree configuration.

Xen nightly CI and release-gating test configurations would be extended 
to include hyperlaunch with guests on Arm.


== Work Item: Hyperlaunch of x86 PV and PVH guests (Resourcing TBD)

The goal of this effort is to enable Hyperlaunch of x86 PV and PVH guests.

This builds upon the initial x86 Hyperlaunch support to add domain 
construction of PV and PVH guests.

Xen nightly CI and release-gating test configurations would be extended 
to include hyperlaunch with guests on x86.


== Work Item: XSM-enforced FuSA (Resourcing TBD)

Hyperlaunch enables disaggregation, and XSM enables granular policy.

The goal of this work is to design and implement new modular, 
fine-grained policy to integrate into Xen for control for 
safety-critical VMs and isolation from non-safety-critical VMs.


== Work Item: Design for Hyperlaunch of x86 HVM guests (Resourcing TBD)

The goal of this effort is to research, prototype and produce design 
documentation for enabling hyperlaunch of x86 HVM guests, ie. with 
support for a device emulator.

This would build upon the x86 Hyperlaunch support for PVH guests.

Investigation to consider:
- launch alongside a classic dom0 domain
- launch on a static partitioned system without a dom0
- stub domains for device emulator isolation
- boot domain integration
- device assignment


-- Thanks for your consideration!


