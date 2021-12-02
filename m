Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C27C466585
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 15:41:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236633.410516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msnGo-0007KS-Iv; Thu, 02 Dec 2021 14:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236633.410516; Thu, 02 Dec 2021 14:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msnGo-0007Ic-DK; Thu, 02 Dec 2021 14:41:10 +0000
Received: by outflank-mailman (input) for mailman id 236633;
 Thu, 02 Dec 2021 14:41:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1msnGn-00072F-8v
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 14:41:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1msnGn-0002sp-84
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 14:41:09 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1msnGn-0004iZ-7D
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 14:41:09 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1msnGg-0001cG-CA; Thu, 02 Dec 2021 14:41:02 +0000
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
	bh=IdKijzTVza9VWjHs/w1KY38fWn3s9Wj3zBBWmEmfja0=; b=LAVEUZyFpxd1q1hrejfirCsl6f
	5+5XU7/LrXsB+ZHVsJqqncU9J2T3QZHvlIItNNJVSLDrwt3dJC9F7S4fGSEjH65RuMhhnkL5+A+W6
	LOxd5bMj0zHNQJ5VPQIhBCD1Dew+iVmeDVN639lgq27bTaR3LyQoVqXEn08RneTqEpuU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-ID: <25000.56055.611856.335342@mariner.uk.xensource.com>
Date: Thu, 2 Dec 2021 14:40:55 +0000
To: xen-announce@lists.xenproject.org
CC: xen-devel@lists.xenproject.org,
    xen-users@lists.xenproject.org
Subject: Xen 4.16 is released

Xen 4.16, the product of 9 months' work by the Xen Project community,
is now released.

You can find it here:
  git clone -b RELEASE-4.16.0 https://xenbits.xen.org/git-http/xen.git
  https://downloads.xenproject.org/release/xen/4.16.0/
For more information see the release notes:
  https://wiki.xenproject.org/wiki/Xen_Project_4.16_Release_Notes
There is also the press release:
  https://xenproject.org/2021/04/08/xen-project-hypervisor-4-15/

Xen 4.16 has a number of improvements, ranging from cleanups to
significant new features in a number of areas:
  https://wiki.xenproject.org/wiki/Xen_Project_4.16_Feature_List
(reproduced below).

Thanks and congratulations are due to all the people and organisations
who have contributed.  Well done, everyone!

Ian.
(Xen 4.16 Release Manager)


Notable Features
================

This release has seen the increase in hardware support for both x86 and Arm,
together with the addition of other improvements and features:

  • Miscellaneous fixes to the TPM manager software in preparation for TPM 2.0
    support.
  • Increased reliance on the PV shim as 32-bit PV guests will only be
    supported in shim mode going forward. This change reduces the attack
    surface in the hypervisor.
  • Increased hardware support by allowing Xen to boot on Intel devices that
    lack a Programmable Interval Timer.
  • Cleanup of legacy components by no longer building QEMU Traditional or
    PV-Grub by default. Note both projects have upstream Xen support merged
    now, so it is no longer recommended to use the Xen specific forks.
  • Initial support for guest virtualized Performance Monitor Counters on Arm.
  • Improved support for dom0less mode by allowing the usage on Arm 64bit
    hardware with EFI firmware.
  • Improved support for Arm 64-bit heterogeneous systems by leveling the CPU
    features across all to improve big.LITTLE support.

Features and improvements
=========================

CI loop (gitlab CI)

  • 32-bit Arm builds.
  • Full system tests for x86.

Ongoing activities
==================

The Xen community has several interesting initiatives, where work is ongoing
and is expected to bear fruit in forthcoming releases. Some of the highlights:

Functional Safety
-----------------

In collaboration with the Zephyr project and the MISRA consortium, the Xen
FuSaSpecial Interest Group analyzed MISRA C rules in depth and defined a subset
of rules that apply to Xen and will be tackled with the community. The SIG
evaluated several static code analyzers to scan the Xen code base for MISRA
Cviolations. The team started enhancing the Xen build system with the ability
to run open source MISRA C checkers as part of the Xen build, so that for
future releases Xen, contributors will be able to easily improve the quality of
their patches.

RISC-V Port
-----------

RISC-V, an open standard instruction set architecture (ISA) based on
established reduced instruction set computer (RISC) principles, is a free and
open ISA enabling hardware designers to design simpler chips with a
royalty-free ISA. The Xen community, led by sub-project XCP.ng, is working on a
RISC-V Port for Xen. During this release cycle significant work has been
ongoing internally in order to get dom0 booting on RISC-V hardware, focusing on
introducing the functionality to allow interrupt management, together with
other interfaces required for early boot code.

VirtIO
------

The development of VirtIO support for Arm continued making progress, currently
focusing on introducing a mechanism to ease the mapping of memory from remote
domains by reporting memory regions of the domain currently unused. Further
work has also been done in order to improve the toolstack support to handle
VirtIO block devices.

Zephyr RTOS
-----------

As a result of collaboration between the Zephyr and Xen projects, starting
version 2.7.0, Zephyr RTOS supports some basic Xen specific features allowing
it to run on Xen. With further Xen enhancements on review and development:
grant tables, XenBus and starting Zephyr as Domain-0, Xen is getting closer to
a full implementation of a RTOS-based "thin dom0" targeting Embedded and Safety
use cases.

