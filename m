Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF53358943
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 18:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107433.205394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUXBB-0002xB-Jk; Thu, 08 Apr 2021 16:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107433.205394; Thu, 08 Apr 2021 16:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUXBB-0002wm-Gf; Thu, 08 Apr 2021 16:06:49 +0000
Received: by outflank-mailman (input) for mailman id 107433;
 Thu, 08 Apr 2021 16:06:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lUXB9-0002wV-KS
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 16:06:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lUXB9-0007Mj-Is
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 16:06:47 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lUXB9-00068r-HS
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 16:06:47 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lUXB6-0008BY-C3; Thu, 08 Apr 2021 17:06:44 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=a/KqW0TSwzOSXHOGOVB/7134Iw14myvqY/fkf7LzFxw=; b=HWxzObwAbmsZE1IEODYQSB8qOS
	MCJ/Ki5WcPKC9pFVihDTvzluJYmynBSIGCeE57SFTw5IfWSLpp5DPNl4aK3bD5jdHPyPdS33vYQma
	rL4Sgrpq/a2bG3uwIJ5Jw920rwF1hdWGLwnYdvaNM3Q4zV4ysbOZGYZr5hno7QAow+Qk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24687.10772.156017.649523@mariner.uk.xensource.com>
Date: Thu, 8 Apr 2021 17:06:44 +0100
To: xen-announce@lists.xenproject.org
CC: xen-devel@lists.xenproject.org,
    xen-users@lists.xenproject.org
Subject: Xen 4.15 is released

Xen 4.15, the product of 9 months' work by the Xen Project community,
is now released.

You can find it here:
  git clone -b RELEASE-4.15.0 https://xenbits.xen.org/git-http/xen.git
  https://downloads.xenproject.org/release/xen/4.15.0/
For more information see the release notes:
  https://wiki.xenproject.org/wiki/Xen_Project_4.15_Release_Notes
There is also the press release:
  https://xenproject.org/2021/04/08/xen-project-hypervisor-4-15/

Xen 4.15 has a number of improvements, ranging from cleanups to
significant new features in a number of areas:
  https://wiki.xenproject.org/wiki/Xen_Project_4.15_Feature_List
(reproduced below).

Thanks and congratulations are due to all the people and organisations
who have contributed.  Well done, everyone!

Ian.
(Xen 4.15 Release Manager)


Notable Features
================

Arm now allows running device models in dom0 (tech preview), allowing
arbitrary devices to be emulated for Arm guests.  Arm also now has
SMMUv3 support (also tech preview), which will improve security and
reliability of device pass-through on Arm systems.

Xen can now export Intel Processor Trace (IPT) data from guests to
tools in dom0, enabling tools like
https://github.com/intel/kernel-fuzzer-for-xen-project or
https://github.com/CERT-Polska/drakvuf-sandbox

Xen now supports Viridian enlightenments for guests with more than 64
vcpus.

Xenstored and oxenstored both now support LiveUpdate (tech preview),
allowing security fixes to be applied without having to restart the
entire host

"PV Shim" mode, for supporting legacy PV guests on HVM-only systems,
continues to be improved; its size was reduced by further factoring
out HVM-specific code. This will also help reduce the size and
improve the security of any PV-only build of the hypervisor.

Unified boot images: It is now possible to create an image bundling
together files needed for Xen to boot into a single EFI binary; making
it now possible to boot a functional Xen system directly from the EFI
boot manager, rather than having to go through grub multiboot.  Files
that can be bundled include a hypervisor, dom0 kernel, dom0 initrd,
Xen KConfig, XSM configuration, and a device tree.

Developed IOREQ server in Xen on Arm for further enablement of VirtIO
protocols as a generic and standardized solution for I/O
virtualization.  Ability to expose a VirtIO block device to a Xen on
Arm guest.  Reference implementation of VirtIO block device for Xen on
Arm (collaboration between Arm, EPAM and Linaro's project STRATOS)


Features and improvements
=========================

Arm Renesas IPMMU-VMSA support upgraded to Supported, not security
supported (was Tech Preview in 4.14).

Switched x86 MSR accesses to deny by default policy.

Named PCI devices for xl/libxl and improved documentation for xl PCI
configuration format.

Support for zstd-compressed dom0 (x86) and domU kernels.

Reduce ACPI verbosity by default.

Add ucode=allow-same option to test late microcode loading path.

Library improvements from NetBSD ports upstreamed.

x86: Allow domains to use AVX-VNNI instructions.

Added XEN_SCRIPT_DIR configuration option to specify location for Xen
scripts, rather than hard-coding /etc/xen/scripts.

xennet: Documented a way for the backend (or toolstack) to specify MTU
to the frontend.

Some additional affordances in various xl subcommands.

Added workarounds for the following ARM errata: Cortex A53 #843419,
Cortex A55 #1530923, Cortex A72 #853709, Cortex A73 #858921, Cortex
A76 #1286807, Neoverse-N1 #1165522.

On detecting a host crash, some debug key handlers can automatically
triggered to aid in debugging.

Increase the maximum number of guests which can share a single IRQ
from 7 to 16, and make this configurable with irq-max-guests.


CI loop (gitlab CI)
-------------------

Add Alpine Linux, Ubuntu Focal targets; drop CentOS 6.

Add qemu-based dom0 / domU test for ARM.

Add dom0less aarch64 smoke test.


Ongoing activities
==================

The Xen community has several interesting initiatives, where work is
ongoing and is expected to bear fruit in forthcoming releases.  Some
of the highlights:

Functional Safety
-----------------

Progress continues to be made within the Functional Safety
SIG. Specifications are becoming more concrete and the group is
working with other communities to establish standards. Additionally,
Xen is working with other projects to converge best practices across
communities.

Updates include:

Progress on MISRA-C rules tailored for Xen in collaboration with
Zephyr. MISRA-C is a set of coding guidelines for the language for
safety. The SIG now has a shortlist of MISRA-C rules that apply to our
project and we are currently evaluating static analyzers for each of
them.

Progress on tracking and maintaining safety requirements including
collaboration with Zephyr to build a Doxygen-based infrastructure that
generates safety requirements documents from in-code comments and text
files. It will allow proper maintenance of safety-related artifacts
next to the code under git and keep them up to date easily in the
community.

RISC-V Port
-----------

The Xen community, led by sub-project XCP.ng, is working on a RISC-V
Port for Xen.  Progress includes:

Development of host and guest virtual memory management code, one of
the key components necessary for supporting guest virtualization

Development of the internal architecture-specific code to conform to
Xen common APIs

Other interesting progress
--------------------------

Moving towards enabling PCIe virtualization support for Xen on Arm
(collaboration between Xilinx, Arm, EPAM and Renesas)

"Hyperlaunch": "Dom0less" pioneered the ability to configure Xen to
launch a static set of virtual machines by Xen at boot time.  But
configuration for these domains was very basic, and focused on
embedded use cases.  "Hyperlaunch" is a new initiative that intends to
make this configuration far more flexible by generalizing it and
introducing a "boot domain" (domB).  Draft design documents for
Hyperlaunch have been posted, and a working group has been formed to
form a plan to complete iron out the details.


