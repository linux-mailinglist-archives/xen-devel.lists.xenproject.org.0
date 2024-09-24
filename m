Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450CE9845AE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 14:14:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802689.1212987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st4QX-00050v-8S; Tue, 24 Sep 2024 12:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802689.1212987; Tue, 24 Sep 2024 12:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st4QX-0004zJ-5L; Tue, 24 Sep 2024 12:13:57 +0000
Received: by outflank-mailman (input) for mailman id 802689;
 Tue, 24 Sep 2024 12:13:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ruj9=QW=xenbits.xen.org=julieng@srs-se1.protection.inumbo.net>)
 id 1st4QV-0004z6-W5
 for xen-devel@lists.xen.org; Tue, 24 Sep 2024 12:13:55 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74bc199f-7a6e-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 14:13:51 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1st4QL-0006UK-Q4; Tue, 24 Sep 2024 12:13:45 +0000
Received: from julieng by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1st4QL-0005gb-N8; Tue, 24 Sep 2024 12:13:45 +0000
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
X-Inumbo-ID: 74bc199f-7a6e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=Pikb5xGF7Yi594aVvQQ4PAPf66I5y1EIaZtzhUUSOlk=; b=Jn4C93CUQsFNZdVUvjh57+fVvi
	APFu4294TgL6hsimOjBiL6sxQ+JN2brDn0FiKUpg5Si5kwws0s5K/eegXgN/LK7uhmidmYouKhjK0
	9VWA88KyaVM4nS39D1SNUvIroFS7dOVJ3A/sU60PEothV/BnKTDw/IZfxxzjqk+5xOwM=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 462 v2 (CVE-2024-45817) - x86: Deadlock in
 vlapic_error()
Message-Id: <E1st4QL-0005gb-N8@xenbits.xenproject.org>
Date: Tue, 24 Sep 2024 12:13:45 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2024-45817 / XSA-462
                               version 2

                    x86: Deadlock in vlapic_error()

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

In x86's APIC (Advanced Programmable Interrupt Controller) architecture,
error conditions are reported in a status register.  Furthermore, the OS
can opt to receive an interrupt when a new error occurs.

It is possible to configure the error interrupt with an illegal vector,
which generates an error when an error interrupt is raised.

This case causes Xen to recurse through vlapic_error().  The recursion
itself is bounded; errors accumulate in the the status register and only
generate an interrupt when a new status bit becomes set.

However, the lock protecting this state in Xen will try to be taken
recursively, and deadlock.

IMPACT
======

A buggy or malicious HVM or PVH guest can deadlock Xen, leading to a
DoS.

VULNERABLE SYSTEMS
==================

Xen 4.5 and onwards are vulnerable.  Xen 4.4 and older are not vulnerable.

Only x86 systems running HVM or PVH guests are vulnerable.
Architectures other than x86 are not vulnerable.

Only HVM or PVH guests can leverage the vulnerability.  PV guests cannot
leverage the vulnerability.

MITIGATION
==========

Not running untrusted HVM or PVH VMs will avoid this vulnerability.

CREDITS
=======

This issue was discovered after a BUGSENG team working on MISRA C
compliance of Xen pointed attention to ECLAIR reports for MISRA C Rule
17.2 (Functions shall not call themselves, either directly or
indirectly).

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa462.patch           xen-unstable - Xen 4.16.x

$ sha256sum xsa462*
c8cb03fdcfffa7e043b1d82643efde0f93bff5ce484887c6f59207777ee95be7  xsa462.patch
$

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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmbymG8MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZ+MYIALQiqD84Ryme+mKRunKqDuH3P3pTX9bvxFp8sRZd
B0A3ysBKsC+eSJHsuH+vaTPG25e72+cqSs1Wr1PHs+p99UA4QxG8vT8pbAIAyr3f
lHVJvHfqMYA3xxNwS82us2Hjiv0t4spBBDje9TgcRvJf8nAcrPrQ+k6eycTTTGiz
kMT5pjkaiKTf0+uZ13krzHHCTyDwYKYJJly0FOv4TbNH+Bxj0i7b630BUtxGibMT
Cm5ay+CK3QSIJUGG6OjSAfFQWxZJ0W7gg1RNsH/ExsvsMw9sE2mX0YbHKaYD6yWf
wEmwQvAwYeaa91fcRnkr9dTZMYy5ObeUQLqJz1EJJ1indyU=
=dr22
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa462.patch"
Content-Disposition: attachment; filename="xsa462.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODYvdkxBUElDOiBwcmV2ZW50IHVuZHVlIHJlY3Vyc2lvbiBvZiB2bGFw
aWNfZXJyb3IoKQoKV2l0aCB0aGUgZXJyb3IgdmVjdG9yIHNldCB0byBhbiBp
bGxlZ2FsIHZhbHVlLCB0aGUgZnVuY3Rpb24gaW52b2tpbmcKdmxhcGljX3Nl
dF9pcnEoKSB3b3VsZCBicmluZyBleGVjdXRpb24gYmFjayBoZXJlLCB3aXRo
IHRoZSBub24tcmVjdXJzaXZlCmxvY2sgYWxyZWFkeSBoZWxkLiBBdm9pZCB0
aGUgY2FsbCBpbiB0aGlzIGNhc2UsIG1lcmVseSBmdXJ0aGVyIHVwZGF0aW5n
CkVTUiAoaWYgbmVjZXNzYXJ5KS4KClRoaXMgaXMgWFNBLTQ2MiAvIENWRS0y
MDI0LTQ1ODE3LgoKRml4ZXM6IDVmMzJkMTg2YThiMSAoIng4Ni92bGFwaWM6
IGRvbid0IHNpbGVudGx5IGFjY2VwdCBiYWQgdmVjdG9ycyIpClJlcG9ydGVk
LWJ5OiBGZWRlcmljbyBTZXJhZmluaSA8ZmVkZXJpY28uc2VyYWZpbmlAYnVn
c2VuZy5jb20+ClJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClJldmlld2VkLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdmxhcGljLmMgYi94ZW4v
YXJjaC94ODYvaHZtL3ZsYXBpYy5jCmluZGV4IDJlYzk1OTQyNzEzZS4uODc1
OGM0MjE3ZmFiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZsYXBp
Yy5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdmxhcGljLmMKQEAgLTExMiw5
ICsxMTIsMjQgQEAgc3RhdGljIHZvaWQgdmxhcGljX2Vycm9yKHN0cnVjdCB2
bGFwaWMgKnZsYXBpYywgdW5zaWduZWQgaW50IGVycm1hc2spCiAgICAgaWYg
KCAoZXNyICYgZXJybWFzaykgIT0gZXJybWFzayApCiAgICAgewogICAgICAg
ICB1aW50MzJfdCBsdnRlcnIgPSB2bGFwaWNfZ2V0X3JlZyh2bGFwaWMsIEFQ
SUNfTFZURVJSKTsKKyAgICAgICAgYm9vbCBpbmogPSBmYWxzZTsKIAotICAg
ICAgICB2bGFwaWNfc2V0X3JlZyh2bGFwaWMsIEFQSUNfRVNSLCBlc3IgfCBl
cnJtYXNrKTsKICAgICAgICAgaWYgKCAhKGx2dGVyciAmIEFQSUNfTFZUX01B
U0tFRCkgKQorICAgICAgICB7CisgICAgICAgICAgICAvKgorICAgICAgICAg
ICAgICogSWYgTFZURVJSIGlzIHVubWFza2VkIGFuZCBoYXMgYW4gaWxsZWdh
bCB2ZWN0b3IsIHZsYXBpY19zZXRfaXJxKCkKKyAgICAgICAgICAgICAqIHdp
bGwgZW5kIHVwIGJhY2sgaGVyZS4gIEJyZWFrIHRoZSBjeWNsZSBieSBvbmx5
IGluamVjdGluZyBMVlRFUlIKKyAgICAgICAgICAgICAqIGlmIGl0IHdpbGwg
c3VjY2VlZCwgYW5kIGZvbGRpbmcgaW4gUkVDVklMTCBvdGhlcndpc2UuCisg
ICAgICAgICAgICAgKi8KKyAgICAgICAgICAgIGlmICggKGx2dGVyciAmIEFQ
SUNfVkVDVE9SX01BU0spID49IDE2ICkKKyAgICAgICAgICAgICAgICAgaW5q
ID0gdHJ1ZTsKKyAgICAgICAgICAgIGVsc2UKKyAgICAgICAgICAgICAgICAg
ZXJybWFzayB8PSBBUElDX0VTUl9SRUNWSUxMOworICAgICAgICB9CisKKyAg
ICAgICAgdmxhcGljX3NldF9yZWcodmxhcGljLCBBUElDX0VTUiwgZXNyIHwg
ZXJybWFzayk7CisKKyAgICAgICAgaWYgKCBpbmogKQogICAgICAgICAgICAg
dmxhcGljX3NldF9pcnEodmxhcGljLCBsdnRlcnIgJiBBUElDX1ZFQ1RPUl9N
QVNLLCAwKTsKICAgICB9CiAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgm
dmxhcGljLT5lc3JfbG9jaywgZmxhZ3MpOwo=

--=separator--

