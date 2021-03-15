Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100A733B260
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 13:18:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97991.185804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLmAo-0005QV-JH; Mon, 15 Mar 2021 12:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97991.185804; Mon, 15 Mar 2021 12:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLmAo-0005Q5-Fl; Mon, 15 Mar 2021 12:18:14 +0000
Received: by outflank-mailman (input) for mailman id 97991;
 Mon, 15 Mar 2021 12:18:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lLmAn-0005Q0-9r
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 12:18:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lLmAn-0007e6-8e
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 12:18:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lLmAn-0006r6-5x
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 12:18:13 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lLmAk-0003uH-1w; Mon, 15 Mar 2021 12:18:10 +0000
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
	bh=6fUQAluxGPgpdxAwSarKSvJdtmGcprvaQt1ogNA/Y+0=; b=0qqMdY2V0A0qX/QZuT833uAuaK
	ORMhnFspV2W604UZqVKtR9CE6jhrbIqBpvw/esWtjNt37aTu761RhBZ45BbSIXFyywzeJ16GLXATY
	jHfKAl6TDyqa0pmMk/ZsNuUL0VMsOgu2R3HG0YxZk+LoInhzH0kIIc34GWkUE23LBFTk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24655.20609.834996.744652@mariner.uk.xensource.com>
Date: Mon, 15 Mar 2021 12:18:09 +0000
To: committers@xenproject.org,
    xen-devel@lists.xenproject.org
CC: Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    =?iso-8859-1?Q?Fr=E9d=E9ric?= Pierret <frederic.pierret@qubes-os.org>,
    Dario Faggioli <dfaggioli@suse.com>
Subject: [ANNOUNCE] Xen 4.15 release update - still in feature freeze

Thanks everyone for your hard work so far.  I think things are looking
pretty good, although we have slipped.

Please see below for my updated list of release blockers and tracking
issues.  Please let me know if there is information missing, or if you
have corrections.

There is one issue on my radar that I am concerned about and want to
see sorted out: "io-apic issue on Ryzen 1800X".  If we can't get it
fixed soon we may have to live with it as a release notes issue.

I am probably going to take the scheduler issues off this list because
I haven't seen any sign of activity, and because I don't actually
think there are release critical bugs there.  Please let me know if
you disagree.

As previously announced, we are still in codefreeze.  All changes must
have a release-ack.

My current tentative schedule is:

   Tuesday 16th March  RC3 test day

   Wednesday 17th March
       Branch, turn off debug on the 4.15 branch
       xen-next will be open but only for non-disruptive changes

   Monday 22nd March   RC4
   Tuesday 23nd March  RC4 test day

   Week of 29th March **tentative*
       Release (probably Tuesday or Wednesday)

Thanks,
Ian.


OPEN ISSUES AND BLOCKERS
========================

io-apic issue on Ryzen 1800X
Related Qubes issue tracking this:
https://github.com/QubesOS/qubes-issues/issues/6423
Information from
  Jan Beulich <jbeulich@suse.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Frédéric Pierret <frederic.pierret@qubes-os.org>


ABI stability checking

   [PATCH for-4.15 00/10] tools: Support to use abi-dumper on libraries
   [PATCH v2 for-4.15] tools/libxl: Work around unintialised variable libxl__domain_get_device_model_uid()
   etc.

This is testing/build work and will enable ABI checking of future
changes to 4.15 after its release.  I don't think it's a blocker but
it would be nice to have.

My most recent impression is that there are still some loose ends
here.



SCHEDULER ISSUES NOT MAKING PROCESS ?
-------------------------------------

BUG: credit=sched2 machine hang when using DRAKVUF

Information from
  Dario Faggioli <dfaggioli@suse.com>
References
  https://lists.xen.org/archives/html/xen-devel/2020-05/msg01985.html
  https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg01561.html
  https://bugzilla.opensuse.org/show_bug.cgi?id=1179246

Quoting Dario:
| Manifests only with certain combination of hardware and workload. 
| I'm not reproducing, but there are multiple reports of it (see 
| above). I'm investigating and trying to come up at least with 
| debug patches that one of the reporter should be able and willing to 
| test.

Dario is working on this.  Last update 29.1.21 ?


G. Null scheduler and vwfi native problem

Information from
  Dario Faggioli <dfaggioli@suse.com>

References
  https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg01634.html

Quoting Dario:
| RCU issues, but manifests due to scheduler behavior (especially   
| NULL scheduler, especially on ARM).
|
| Patches that should solve the issue for ARM posted already. They
| will need to be slightly adjusted to cover x86 as well.

As of last update from Dario 29.1.21:
waiting for test report from submitter.


H. Ryzen 4000 (Mobile) Softlocks/Micro-stutters

Information from
  Dario Faggioli <dfaggioli@suse.com>

As of last update from Dario 29.1.21:
Discussions currently ongoing about the severity of this issue.


ISSUES BELIEVED NEWLY RESOLVED
==============================

Fallout from MSR handling behavioral change.

I think there are now no outstanding patches to fix/change MSR
behaviour and there is no longer any blocker here ?

Key partipants:
  Jan Beulich <jbeulich@suse.com>
  Andrew Cooper <andrew.cooper3@citrix.com>


Use-after-free in the IOMMU code

Information from
  Julien Grall <julien@xen.org>
References
 [PATCH for-4.15 v5 0/3] xen/iommu: Collection of bug fixes for     
 IOMMU teardown
Now committed


"x86/PV: avoid speculation abuse through guest accessors"

Information from
  Jan Beulich <jbeulich@suse.com>

| F. The almost-XSA "x86/PV: avoid speculation abuse through guest
| accessors" - the first 4 patches are needed to address the actual
| issue. The next 3 patches are needed to get the tree into
| consistent state again, identifier-wise. The remaining patches
| can probably wait.

This has been committed.


Problems with xl save / cancel

Information from Jürgen Groß:
  xl daemon won't kill the domain after it has gone through a
  suspend-cancel cycle.

I think this was fixed by
  tools/libs/light: fix xl save -c handling


x86/time: calibration rendezvous adjustments

Information from
  Jan Beulich <jbeulich@suse.com>

Not entirely a regression.  3 out of the 4 patches seem to have been
committed.

Patch 4/ is not targeted at 4.15 I think.

