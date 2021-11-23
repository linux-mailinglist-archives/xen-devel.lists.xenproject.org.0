Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABD545A246
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 13:12:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229246.396771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpUez-0001LU-EI; Tue, 23 Nov 2021 12:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229246.396771; Tue, 23 Nov 2021 12:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpUez-0001EO-3F; Tue, 23 Nov 2021 12:12:29 +0000
Received: by outflank-mailman (input) for mailman id 229246;
 Tue, 23 Nov 2021 12:12:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ayLh=QK=xenbits.xen.org=iwj@srs-se1.protection.inumbo.net>)
 id 1mpUew-0008MT-OS
 for xen-devel@lists.xen.org; Tue, 23 Nov 2021 12:12:26 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87884040-4c56-11ec-a9d2-d9f7a1cc8784;
 Tue, 23 Nov 2021 13:12:22 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1mpUe8-0002WR-Qw; Tue, 23 Nov 2021 12:11:36 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1mpUe8-0004X3-Q0; Tue, 23 Nov 2021 12:11:36 +0000
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
X-Inumbo-ID: 87884040-4c56-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=q2HCCmRA4eyGBtlwL+LNVG30xiN/OakaIW2lLeVdN2E=; b=JTuizbbtWZk8XJEe1kYE1c8utZ
	fJ4p3XTcPB1Do3cF5H0FHnjqMwN5GlIu9Ld/CseW4EZh5XaNpAYVQD89tGRgCWTdTENS41PskXuco
	zazicsphTovKT/1CxD3niTkJhPjVoJ/gRebdKdEZiOPBMT8Nxf0gJgtKLxq0XVONuPFI=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 387 v2 (CVE-2021-28703) - grant table v2
 status pages may remain accessible after de-allocation (take two)
Message-Id: <E1mpUe8-0004X3-Q0@xenbits.xenproject.org>
Date: Tue, 23 Nov 2021 12:11:36 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2021-28703 / XSA-387
                               version 2

 grant table v2 status pages may remain accessible after de-allocation (take two)

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

Guest get permitted access to certain Xen-owned pages of memory.  The
majority of such pages remain allocated / associated with a guest for
its entire lifetime.  Grant table v2 status pages, however, get
de-allocated when a guest switched (back) from v2 to v1.  The freeing
of such pages requires that the hypervisor know where in the guest
these pages were mapped.  The hypervisor tracks only one use within
guest space, but racing requests from the guest to insert mappings of
these pages may result in any of them to become mapped in multiple
locations.  Upon switching back from v2 to v1, the guest would then
retain access to a page that was freed and perhaps re-used for other
purposes.

This bug was fortuitously fixed by code cleanup in Xen 4.14, and
backported to security-supported Xen branches as a prerequisite of the
fix for XSA-378.

IMPACT
======

A malicious guest may be able to elevate its privileges to that of the
host, cause host or guest Denial of Service (DoS), or cause information
leaks.

VULNERABLE SYSTEMS
==================

All Xen branches up to and including 4.13 are vulnerable,
but only if the patches for XSA-378 have not been applied.

Xen versions 4.13.4, 4.14.x and 4.15.x are not affected.

Only x86 HMV and PVH guests permitted to use grant table version 2
interfaces can leverage this vulnerability.  x86 PV guests cannot
leverage this vulnerability.  On Arm, grant table v2 use is explicitly
unsupported.

MITIGATION
==========

Running only PV guests will avoid this vulnerability.

Suppressing use of grant table v2 interfaces for HVM or PVH guests will
also avoid this vulnerability.

CREDITS
=======

This issue was discovered by Patryk Balicki and Julien Grall of Amazon.

RESOLUTION
==========

Applying the following patch resolves the issue:
  x86/p2m: don't assert that the passed in MFN matches for a remove

This patch was supplied with XSA-378, as one of 378's prerequisites.
The fix has already been applied to Xen stable branches as follows:

c65ea16dbcafbe4fe21693b18f8c2a3c5d14600e   in Xen 4.14.x, 4.15.x
f50fbddbae81fcccae56d27317bd71cc0e678ba2   in Xen 4.13.4
d44643199c96ac22491ae002d3bcd1c989b95ea4   in xen.git#stable-4.12
66f400c71d12fe8adfb895984b14f2941e8cb6ce   in xen.git#stable-4.11

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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmGc2jgMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZlWUIAJ4bU9n2q9A4sqhiW0xJOCI4MIdwV2ym6xziP9iN
e5sg0u3gdp94M1vLf//8h7julxLXgdJd10HWWpJkfRQcsfz3E1ul1O+mAsoHxJwI
/qGl1Xis7AkDFjrPXthJUKh/DNgi8F1Rok7XDbfFznk34v4g6anh4JDfqJIUwIFQ
l2s6qIOc2PjvmrJMXEboT1wEUADZNtChIqOL7Ibre9Zz6/mdr0FjPfPvLAqfvf9m
aLaMElJMRx5iTEUG7qCYXUn8oKLbWNTv88yceudE7QZl3/zv/UnEL8nvBZWs/Gkx
UbrC6wkNFUSpF/ngexvzsSE/SrfMYYaUPfIciyuxvuosGJY=
=DmKh
-----END PGP SIGNATURE-----

--=separator--

