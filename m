Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FD074238A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 11:55:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556714.869433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEoMa-0007Ja-99; Thu, 29 Jun 2023 09:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556714.869433; Thu, 29 Jun 2023 09:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEoMa-0007GR-6D; Thu, 29 Jun 2023 09:54:56 +0000
Received: by outflank-mailman (input) for mailman id 556714;
 Thu, 29 Jun 2023 09:54:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZKvI=CR=bounce.vates.fr=bounce-md_30504962.649d54eb.v1-5497fb31433b4b638e5117a9e82528d9@srs-se1.protection.inumbo.net>)
 id 1qEoMY-0007GH-Mz
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 09:54:54 +0000
Received: from mail137-13.atl71.mandrillapp.com
 (mail137-13.atl71.mandrillapp.com [198.2.137.13])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe2a2d36-1662-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 11:54:53 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-13.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4QsDMH40ClzLfGvv1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jun 2023 09:54:51 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5497fb31433b4b638e5117a9e82528d9; Thu, 29 Jun 2023 09:54:51 +0000
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
X-Inumbo-ID: fe2a2d36-1662-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1688032491; x=1688292991; i=yann.dirson@vates.fr;
	bh=rhHp8FaNw6YAWNQ+2itu01kjJAtTTVVvLTc1JkqmIHA=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Fh0qhkb8Qvt3Pm5bACbQTSxoj9waCyiOHpySu4CJ84ozdyE7U5h748y7Ojy4ECH2A
	 CbZBu027jVNWBKQHJLjrPHeEt0MfriZOsweAKsF4RJg3nUJ+Aw5EpcmIIvdAF/T2kH
	 LEN6EfMz+PU9aYQ1hH/X44GRCj+iDQ+TYfPBDwkc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1688032491; h=From : 
 Subject : Message-Id : To : Date : MIME-Version : Content-Type : 
 Content-Transfer-Encoding : From : Subject : Date : X-Mandrill-User : 
 List-Unsubscribe; bh=rhHp8FaNw6YAWNQ+2itu01kjJAtTTVVvLTc1JkqmIHA=; 
 b=TrDzX5ha0WFmFUC4Wo1eHlaoGoU+Wnj9ie2P3Uqem8lVARfeAIM9XeQTaxfZlwicWwtbMo
 6vRpDDJVhA5Olxzq4p/Vwo4LCgpAWgcKGCDwWZr3vvNT6YeZpymTVPzLpkxiCpiPydxOVxD6
 AtjrLQ+6fC4ZB+uwDM4rT1wwor7yo=
From: Yann Dirson <yann.dirson@vates.fr>
Subject: =?utf-8?Q?Xen=20Summit=202023=20Design=20Session:=20Communicating=20guest=20informations=20to=20the=20management=20stack?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 39f1d088-dab6-450b-998d-f0ee110bfa80
X-Bm-Transport-Timestamp: 1688032490609
Message-Id: <ec552c9d-c625-5fab-ac8c-f968b42c9309@vates.fr>
To: xen-devel@lists.xenproject.org
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5497fb31433b4b638e5117a9e82528d9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20230629:md
Date: Thu, 29 Jun 2023 09:54:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Here are my notes from memory, organized by topic (and somehow enriched 
with more details in places)

# context

Guest-management stacks typically need the guest to communicate some 
information back. This essentially happens through Xenstore and some of 
it has been normalized in the Xen docs.

Some of those pieces of information are filled by PV drivers (eg. 
~/control/feature-poweroff), others like information on network 
configuration are more commonly filled by a userspace daemon (eg. 
xe-guest-utilities for XAPI-based platforms). People in need to publish 
such info even turn to forked old versions of those tools for lack of a 
central solution.

We have started to work on a prototype guest agent (written in Rust) 
with the goal of providing such an official guest service within the Xen 
Project, that would be easily portable and use low resources.


# guest agent Rust prototype

Question was asked why we selected Rust: aside from the language's 
well-known selling-points this was largely a political decision, 
intended to send a signal that the Xen project values such new technologies.

There is a separate Xenserver guest agent for Windows guests.  The Rust 
agent could likely get implementations for writing to the Windows idiom 
for Xenstore (through WMI), and to get notified of network config 
changes, which would still allow to share the rest (policy, xenstore 
layout, likely other things in the future).

It has been pointed out the Xenserver Windows guest agent has support 
for other features not available in the Linux version, like Copy-paste 
(which currently is problematic, using Xenstore to stream 
potentially-large amounts of data).  Such features should be made 
better, and available everywhere.

Another lesser-known feature of the Xenserver windows guest agent allows 
(depending on a guest registry key for enabling the feature) to let dom0 
execute commands in the guest.  It was noted the concept is not that far 
for QubesOS qrexec mechanism.


# NIC information

The most visible info provided by guest tools is external IP addresses. 
This is useful for scripts in dom0 to discover it to communicate with 
guests through a given VNIC, and for users to get the information 
without having to manually log through the VM console.

Today addresses are reported for VIF and SRIOV-passthrough interfaces, 
but not for those on PCI-passthrough, USB-passthrough[0] or bridges that 
include such interfaces.  Reporting more info in a backward-compatible 
way would make it easier for the rest of the world.

For additional passed-through devices we need a way for the guest to 
identify the devices to report about (MAC address?  hw topology?), and 
we'll have to dedicate a new xenstore subtree to those.

For bridged VNICs the bridge IP can accurately be reported for the VNIC 
itself, as if it were not bridged.  But confusion can occur if 2 VNICs 
get bridged together, as they would both report the same IP.  This could 
be made better by adding more information to the VNIC in addition to 
addresses, e.g. adding a guest-unique identifier for the bridge 
interface, so the toolstack can deduce the existence of the bridge.


[0] although we likely don't care much about that one in the server 
space, desktop xen distros could have a need for this - edge computing 
and homelab possibly too, eg. for the RaspberryPi Ethernet


# control of memory ballooning

Current Xenserver guest agent sets a `feature-balloon` flag.  It is not 
meant as a feature flag though, but signals to the XAPI balloon 
controller (squeezed) that the guest has booted far enough that all its 
memory has been allocated, and that it can now "calibrate its behaviour" 
to be able to decide when a balloon driver has reached the goal it was set.

My evaluation was that the balloon driver would better report to 
xenstore when it has reached its target, rather than having the balloon 
controller doing guesswork.  It was added that it would be useful for 
the balloon driver to report impossibility to reach a target, and 
possibly other conditions.

Guest agent would still have to write this node for backward compatibility.

It was mentioned that a "guest booted" report could be more generally 
useful.  (we did not discuss any particular use, or whether that would 
be a job for guest tools or PV drivers)


# standardization of xenstore interface

Usage of xenstore by the guest agent and PV drivers was documented after 
the fact in the xenstore-paths document in Xen source tree.  That could 
be cleaned up and made more useful.

My proposed patch to standardize the permissions on `~/control/` as set 
by libxl was noted as problematic for XAPI: standardization should leave 
the current situation legal and allow both alternatives.



Thanks to everyone who attended and contributed.

-- 
Yann Dirson | Vates Platform Developer
XCP-ng & Xen Orchestra - Vates solutions
w: vates.tech | xcp-ng.org | xen-orchestra.com


Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions
web: https://vates.tech

