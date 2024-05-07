Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 748C18BEA24
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 19:13:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718325.1120919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4ON4-0000dk-1j; Tue, 07 May 2024 17:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718325.1120919; Tue, 07 May 2024 17:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4ON3-0000c6-Uh; Tue, 07 May 2024 17:12:53 +0000
Received: by outflank-mailman (input) for mailman id 718325;
 Tue, 07 May 2024 17:12:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b+jw=MK=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1s4ON2-0000bq-0C
 for xen-devel@lists.xen.org; Tue, 07 May 2024 17:12:52 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07c5027c-0c95-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 19:12:50 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1s4OMs-0003Fk-Qq; Tue, 07 May 2024 17:12:42 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1s4OMs-0002AQ-Oo; Tue, 07 May 2024 17:12:42 +0000
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
X-Inumbo-ID: 07c5027c-0c95-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=xm3rIbfTJrlQM5CEIPJ8p75FFBGnHoEQ30OngBr9mv0=; b=yVMUvwkxlJBei7PPdyHvy6+gdu
	mBNmeoDu86YQnBGCbKJ9ZzaOcrOSR2A+uZ0WJIKPQ6gvcXjD8SASdS2vgLg5IqHRFwy3QdRi46Ey/
	DiragXdDijWwZlz9ZhCCgzBlXbSOdEbUkw8kshtk1/3CviTW6DMIIvOpFeDkk6euQvRw=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 456 v3 (CVE-2024-2201) - x86: Native Branch
 History Injection
Message-Id: <E1s4OMs-0002AQ-Oo@xenbits.xenproject.org>
Date: Tue, 07 May 2024 17:12:42 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2024-2201 / XSA-456
                              version 3

                 x86: Native Branch History Injection

UPDATES IN VERSION 3
====================

Issues were found with the original code changes.  See the bottom of the
Resolution section for how to obtain those.

ISSUE DESCRIPTION
=================

In August 2022, researchers at VU Amsterdam disclosed Spectre-BHB.

Spectre-BHB was discussed in XSA-398.  At the time, the susceptibility
of Xen to Spectre-BHB was uncertain so no specific action was taken in
XSA-398.  However, various changes were made thereafter in upstream Xen
as a consequence; more on these later.

VU Amsterdam have subsequently adjusted the attack to be pulled off
entirely from userspace, without the aid of a managed runtime in the
victim context.

For more details, see:
  https://vusec.net/projects/native-bhi
  https://vusec.net/projects/bhi-spectre-bhb
  https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/technical-documentation/branch-history-injection.html
  https://xenbits.xen.org/xsa/advisory-398.html

IMPACT
======

An attacker might be able to infer the contents of arbitrary host
memory, including memory assigned to other guests.

VULNERABLE SYSTEMS
==================

Systems running all versions of Xen are affected.

Only Intel x86 CPUs are potentially affected.  CPUs from other
manufacturers are not known to be affected.

A wide range of Intel CPUs employ Branch History prediction techniques.
However for older CPUs existing Spectre-v2 mitigations (XSA-254) are
believed to be sufficient to mitigate Native-BHI.

Therefore, the rest of the discussion will be limited in scope to the
CPUs for which a change in behaviour is expected.  These are believed to
be all CPUs with eIBRS (Enhanced IBRS, a.k.a. IBRS_ALL or IBRS_ATT).
eIBRS signifies a hardware adjustment (mode-tagged indirect predictions)
designed to combat Spectre-v2, available in CPUs from 2019 onwards.

To determine if a system has eIBRS, run `xen-cpuid -v` in dom0, looking for
the string "eibrs" in the Dynamic Raw block of information.  e.g.

  # xen-cpuid -v
  ...
  Dynamic sets:
  Raw                             ...
    ...
    [16] MSR_ARCH_CAPS.lo         ... eibrs ...
    ...
  ...

Be aware that the Static sets are compile time information so will include the
string "eibrs" irrespective of hardware support.  If there is no row for "[16]
MSR_ARCH_CAPS.lo" then the fixes for XSA-435 are missing.

MITIGATION
==========

There are no mitigations.

CREDITS
=======

This issue was discovered by VU Amsterdam.

RESOLUTION
==========

In Xen 4.17, in response to the original Spectre-BHB, CET-IBT support was
added to Xen to use on capable hardware.  It also came with work to remove
unnecessary function pointers, and to de-virtualise function pointers at boot,
as both a performance and hardening improvement.  This work has been steadily
continuing since, and every removed/de-virtualised function pointer reduces
the options available to an adversary trying to mount a Native-BHI attack.
All of this work has been backported to 4.17 and later for this advisory.

Beginning with the Intel Alder Lake (Client) and Sapphire Rapids (Server)
CPUs, a hardware control called BHI_DIS_S is available, which restricts
history-based predictions.  This control requires updated microcode on some
CPUs.  Look for "bhi-ctrl" in `xen-cpuid -v`, similar to eibrs above.

Xen has been updated to use this control when available, and to virtualise it
for guests to use.

For CPUs without BHI_DIS_S, BHB clearing sequences need using.  Out of an
abundance of caution, all sequences in the Intel whitepaper have been
implemented, although Xen will only use the "short" sequence by default.  The
others are available to opt in to.

The work to mitigate Native-BHI is extensive, and the backports are
more-extensive still.

Therefore, we have decided to produce new releases on all stable trees.
Please find fixes in the respective branches under the following release
tags:

  RELEASE-4.18.2
  RELEASE-4.17.4
  RELEASE-4.16.6
  RELEASE-4.15.6

Other release activities (tarballs, announcements, etc) will happen in
due course.

Issues were in those found subsequently.  To address those, newer commits
from the stable branches need updating to, in particular

stable-4.15	056500003eb44314cb90f2e3e7b2d405e86b5657
stable-4.16	d0e8f8ffbb19b5df5f767328baeb54c069b08e6a
stable-4.17	effcf70f020ff12d34c80e2abde0ecb00ce92bda
stable-4.18	f0ff1d9cb96041a84a24857a6464628240deed4f

For 4.15, since we're closing the branch, RELEASE-4.15.7 was tagged in
addition; other release activities - as per above - will follow.

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches and/or mitigations described above (or
others which are substantially similar) is permitted during the
embargo, even on public-facing systems with untrusted guest users and
administrators.

But: Distribution of updated software is prohibited (except to other
members of the predisclosure list).

Predisclosure list members who wish to deploy significantly different
patches and/or mitigations, please contact the Xen Project Security
Team.

(Note: this during-embargo deployment notice is retained in
post-embargo publicly released Xen Project advisories, even though it
is then no longer applicable.  This is to enable the community to have
oversight of the Xen Project Security Team's decisionmaking.)

For more information about permissible uses of embargoed information,
consult the Xen Project community's agreed Security Policy:
  http://www.xenproject.org/security-policy.html
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmY6YBEMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZxKYH/1nCaEsJ6TvDBFc3uB9kLuwcOye56KPa2PQ+9Cqs
5OG+zKG7jaMtPVvsyZQF/o2EHk+Ypj0LbZMQKwvPnV9ajZvACa7ZmJd32XamJpnf
+v4UzCWjKd4seCsdySneU3ap4MhBcOhKXzDMts29dGPNdeol67RrsMjAkuVeDl86
q/VSZnBn6VuiujYS0BtqG1ZB4vVA6nyQccbbprXyi4MMdikrIlaiQqFqCNRdh+lS
tGfhNDRVXcX8ipq+MkHKf+aE3qP/CTWollqgB0eEYi1IPjCJhMIqP4DP8DLvAA+L
Ab3gSVVfvp6IgaFZpVu+Y5T6Z5S6TlKU1YDtR7UE/fML8Ns=
=K66w
-----END PGP SIGNATURE-----

--=separator--

