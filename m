Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B93B3D0785
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 06:12:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159103.292693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m63ae-0001V9-Kv; Wed, 21 Jul 2021 04:12:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159103.292693; Wed, 21 Jul 2021 04:12:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m63ae-0001Sr-HW; Wed, 21 Jul 2021 04:12:12 +0000
Received: by outflank-mailman (input) for mailman id 159103;
 Wed, 21 Jul 2021 04:09:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+O/=MN=comcast.net=xentrigued@srs-us1.protection.inumbo.net>)
 id 1m63Y5-0000hM-Vx
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 04:09:34 +0000
Received: from resqmta-po-08v.sys.comcast.net (unknown
 [2001:558:fe16:19:96:114:154:167])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fb8b5df-eead-439c-ad14-738ac96f49b6;
 Wed, 21 Jul 2021 04:09:33 +0000 (UTC)
Received: from resomta-po-13v.sys.comcast.net ([96.114.154.237])
 by resqmta-po-08v.sys.comcast.net with ESMTP
 id 63WTmyBXPArcZ63Y4mzu1w; Wed, 21 Jul 2021 04:09:32 +0000
Received: from ASUSN550JK ([IPv6:2601:80:4203:a8a1:28b5:a97c:4bea:4aff])
 by resomta-po-13v.sys.comcast.net with ESMTPSA
 id 63Y2maxUCW1PG63Y3mfr1y; Wed, 21 Jul 2021 04:09:32 +0000
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
X-Inumbo-ID: 0fb8b5df-eead-439c-ad14-738ac96f49b6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=20190202a; t=1626840572;
	bh=WJt6Gde1jl2zwCm9tTT+kg48dDhf+GDp/R3VtJ9PGZg=;
	h=Received:Received:From:To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type;
	b=euRMcERPDAMn3+6GSuGUfw0sxB/0Ewr3tF/HTj9A7KxG96/x6T2Z0D73lmV3/iG1Z
	 zcfaWWkwQhfpXBnUzB9OGMFVHDlCybXepCbJXcJ3g2QUyKVdN4MtpMOyhmktygu6r0
	 eIHXGwvOvBOk4F8f3dZ8IQo/GcQyZsFFPCgTbSpQCe6sEdSIgm8lWGGKgr9tOuoB6m
	 XHRI/vi/41wrwBBgr0JAjcumb74Gob4Jyaxc7yC6JeQMe9uFte0VbHItCnin4qhfeN
	 tk4uj3i7KkEClN+IXx8p1m9Bx4LaA3LZytWsmdj70oJvYlQW5pblpvcbzY/BwXhYH2
	 4vR7V3DUFEalg==
X-Xfinity-VMeta: sc=0.00;st=legit
From: "Xentrigued" <xentrigued@comcast.net>
To: <xen-devel@lists.xenproject.org>
Subject: Nested Virtualization of Hyper-V on Xen Not Working
Date: Wed, 21 Jul 2021 00:09:30 -0400
Message-ID: <001401d77de6$34ff5de0$9efe19a0$@comcast.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Add95Ay+sEH/JKKzR5yp5H78o7x4jg==
Content-Language: en-us

RATIONALE: Features in recent versions of Windows now REQUIRE Hyper-V
support to work.  In particular, Windows Containers, Sandbox, Docker Desktop
and the Windows Subsystem for Linux version 2 (WSL2).  Running Windows in a
VM as a development and test platform is currently a common requirement for
various user segments and will likely become necessary for production in the
future.  Nested virtualization of Hyper-V currently works on VMware ESXi,
Microsoft Hyper-V and KVM-based hypervisors.  This puts Xen and its
derivatives at a disadvantage when choosing a hypervisor.

WHAT IS NOT WORKING?  Provided the requirements set forth in:
https://wiki.xenproject.org/wiki/Nested_Virtualization_in_Xen have been met,
an hvm guest running Windows 10 PRO Version 21H1 x64 shows that all four
requirements for running Hyper-V are available using the msinfo32.exe or
systeminfo.exe commands.  More granular knowledge of the CPU capabilities
exposed to the guest can be observed using the Sysinternals Coreinfo64.exe
command.  CPUID flags present appear to mirror those on other working nested
hypervisor configurations.

Enabling Windows Features for Hyper-V, Virtual Machine Platform, etc. all
appear to work without error.  However, after the finishing reboot, Hyper-V
is simply not active.  This--despite the fact that vmcompute.exe (Hyper-V
host compute service) is running and there are no errors in the logs.  In
addition, all four Hyper-V prerequisites continue to show as available.

By contrast, after the finishing reboot of an analogous Windows VM running
on ESXi, the four prerequisites are reversed:  hypervisor is now active;
vmx, ept and urg (unrestricted guest) are all off as viewed with the
Coreinfo64.exe -v command.  Furthermore, all functions requiring Hyper-V are
now active and working as expected.

This deficiency has been observed in two test setups running Xen 4.15 from
source and XCP-ng 8.2, both running on Intel with all of the latest,
generally available patches.  We presume that the same behavior is present
on Citrix Hypervisor 8.2 as well.
    
SUMMATION:
Clearly, much effort has already been expended to support the Viridian
enlightenments that optimize running Windows on Xen.  It also looks like a
significant amount of effort has been put forth to advance nested
virtualization in general.

Therefore, if it would be helpful, I am willing to perform testing and
provide feedback and logs as appropriate in order to help get this working.

While my day job is managing a heterogeneous collection of systems running
on various hypervisors, I have learned the rudiments of integrating patches
and rebuilding Xen from source so could no doubt be useful in assisting you
with this worthwhile endeavor.



