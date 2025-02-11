Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DE3A31278
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 18:12:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885807.1295609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thtnc-0007XY-W4; Tue, 11 Feb 2025 17:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885807.1295609; Tue, 11 Feb 2025 17:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thtnc-0007W5-T4; Tue, 11 Feb 2025 17:11:52 +0000
Received: by outflank-mailman (input) for mailman id 885807;
 Tue, 11 Feb 2025 17:11:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hORk=VC=bounce.vates.tech=bounce-md_30504962.67ab84b2.v1-99c1cc8962d44f57aed95356c8770e37@srs-se1.protection.inumbo.net>)
 id 1thtn7-0007KR-G0
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 17:11:21 +0000
Received: from mail179-38.suw41.mandrillapp.com
 (mail179-38.suw41.mandrillapp.com [198.2.179.38])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 334cd139-e89b-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 18:11:15 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-38.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4Ysnz63VQ3z2K1rkQ
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 17:11:14 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 99c1cc8962d44f57aed95356c8770e37; Tue, 11 Feb 2025 17:11:14 +0000
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
X-Inumbo-ID: 334cd139-e89b-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1739293874; x=1739563874;
	bh=DVo+Uu+LqFv/lyxEybYNv2OHESBnq0EWV4fgZ9LnomE=;
	h=From:Subject:To:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=UrFAnWRNhrixWRDT4kj0HE9SKicrR4oboiaGXZE3D04DeGnU/iiGfUBOpjaX3eMNi
	 wZCt+h2mRSo4bJaIL4tjldE6/d/lcGqY7Bro5RQ1+sxobSklMvKpJsSxCz1co0G/e1
	 E4pPDJlZ15veqnAHoUxm9C9RIWetfMlyzYhgBAuWwdAFrL4X74XpMx9gz6HBpH8/YV
	 4r5M5l4NxG03MvsrutAGg+OtuKRBq4pJpREOjMwQXAUsvsgEDO81EZaE96Ab60XXAB
	 mM0ePMFcX8+E1XmU82C5apHe3XyAbeCdYnKpH/Ws0EdIu2syTwMIqkLtjwel6pl2vl
	 bUq7L06msqLqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1739293874; x=1739554374; i=samuel.verschelde@vates.tech;
	bh=DVo+Uu+LqFv/lyxEybYNv2OHESBnq0EWV4fgZ9LnomE=;
	h=From:Subject:To:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=ZMMgp7siwbbdeoxJQ1uUOJMhfHhL3loBqQhftkqCH4dm6aaZgewbWIXTglWXERxAc
	 DGxwJjMvuubEfkGOujAJtS6F7KbEJQma7lABHBmVwi6O6tyGgutcMDPLVA4+1XQEkx
	 /eyIANfGEX+q3RVTv5BSMd1w92aIr4XZbx1EMXxSXv/fSqyZsoqJhlP46tbMiQEUJE
	 +c1Af+NqCJl3X9+OSES3N2M3RbFhNsGQVlyjieOMzKz57oVAjUHCr2VN+5wC8QkkdB
	 jFA0jmo62Q34OLUfMzKvTZasQL4cCj2ehLauzvv8GlmCgg8ertMCVlZnbt8WJrMWr+
	 B/Xwdkei/y99w==
From: "Samuel Verschelde" <samuel.verschelde@vates.tech>
Subject: =?utf-8?Q?Xen=20Winter=20Meetup=202025=20design=20session=20notes:=20PVH?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1739293873640
To: xen-devel@lists.xenproject.org
Message-Id: <f83b99b0-bdb8-7c36-843d-907dafa22e2b@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.99c1cc8962d44f57aed95356c8770e37?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250211:md
Date: Tue, 11 Feb 2025 17:11:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

The description of the design session was:

PVH: limitations, requirements & future considerations

A general discussion on PVH from both guest and Dom0 perspectives, covering:

     Trade-offs and key limitations
     Required work for PCI passthrough and SR-IOV support
     Dom0 feasibility: kernel requirements and long-term viability
     Impact on end users compared to HVM simplicity

This session aims to clarify open questions and guide future development
priorities.

---

Rather than an actual design session, we had a Q&A session regarding
PVH, to "keep the ball rolling", with Roger and Andrew answering the
questions.

I will reference these notes in the gitlab EPIC related to full PVH
support: https://gitlab.com/groups/xen-project/-/epics/2

First, see Roger's presentation for PVH:
https://www.youtube.com/watch?v=J4qA-efLXJo

We discussed the advantages and tradeoffs of PVH.

Advantages:
- HVM guests without Qemu (lower attack surface, less usage)
- Reduction of attack surface in the hypervisor too, no HPET...

Neutral:
- No difference between modes for the Hypervisor

Tradeoffs / challenges (for guests):
- Biggest differences => no emulated VGA, text console that can be
turned into VNC but no GUI.
- No QEMU => no clipboard "hack" as exists in XenServer and XCP-ng.
- No device emulator, can't boot other kernel than Linux at the moment.
- PVH DomU no passthrough
- PVH DomU PCIe passthrough => should be priority

Tradeoffs / challenges (for dom0)
- PVH Dom0 is a lot of problems
- PVH Dom0 no passthrough for any guests

There's work from AMD on SR-IOV for PVH guests.

Roger: has a branch mostly working, should not be used with security in mind

x86 needs a root complex exposed to guest, needs Q35 support.
Minimal emulation of a PCIe root complex to attach SR-IOV to PVH guests.
Could be another emulator in Dom0 but some people don't want Dom0 (dom0less)
Emulator in the hypervisor needed in this case

Question: difference between normal root complex for SR-IOV and normal
devices?
=> Need IOAPIC for normal devices (SRIOV doesn't use IOAPIC, no legacy
PCI interrupt)
=> SR-IOV first is because it has more restrictions on things it can do
=> Since it needs some kind of logic to trap weird accesses (work
already done in Qemu that need to be added to the Xen emulator)
==> Roger's post-session addition, when we had trouble understanding the
notes: "SR-IOV VF have less registers implemented by the hardware, and
it requires a bit more emulation on QEMU (or vPCI) to work.  I think
that's the point of Andrew's remark."

=> Root complex is not that different for SR-IOV and normal devices
==> Roger's post-session addition: "root complex emulation should likely
be the same whether it's VFs or regular PCI devices that are exposed."

There's a plan to make Windows work: PVH OVMF
Plan to Windows install driver thanks to UEFI interface to ask it to
install drivers
Should be faster, can boot on PV device directly

Question: How does a PVH guest boot?
=> It's complicated, wait for documentation entries about this.

Question: When will PCIe passthrough for PVH guests happen?
=> Patches welcomed

Question: Is IOAPIC needed for devices doing MSI?
=> Yes, because line interrupt are the only needing things for a normal
PCIe while MSI are not needed. SR-IOV devices don't need legacy PCI
interrupts.
Windows does message on a bus saying that devices won't do line interrupt.

Question: What if a driver disables legacy interrupt?
=> Would work only until one device does a line interrupt. And some
devices would do legacy interrupt if MSI are masked.

Viridian and VMBUS are not the same thing, VMBUS is not a open
interface, one implementation might become available in Linux soon.



Samuel Verschelde | Vates XCP-ng Lead Maintainer / Release Manager / Technical Product Manager

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

