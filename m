Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D83752DAD44
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 13:32:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.53495.93244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp9Uz-0003lO-Jp; Tue, 15 Dec 2020 12:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 53495.93244; Tue, 15 Dec 2020 12:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp9Uz-0003kV-Fm; Tue, 15 Dec 2020 12:32:13 +0000
Received: by outflank-mailman (input) for mailman id 53495;
 Tue, 15 Dec 2020 12:32:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tdgx=FT=xenbits.xen.org=gdunlap@srs-us1.protection.inumbo.net>)
 id 1kp9Ls-0004t1-P8
 for xen-devel@lists.xen.org; Tue, 15 Dec 2020 12:22:48 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0473e96-39de-4f5c-b191-083d229ca08d;
 Tue, 15 Dec 2020 12:20:33 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gdunlap@xenbits.xen.org>)
 id 1kp9Jd-0005l7-8X; Tue, 15 Dec 2020 12:20:29 +0000
Received: from gdunlap by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <gdunlap@xenbits.xen.org>)
 id 1kp9Jd-0007Cj-7U; Tue, 15 Dec 2020 12:20:29 +0000
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
X-Inumbo-ID: b0473e96-39de-4f5c-b191-083d229ca08d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=DTGzKZvQBksUtA7KN6vQ6CiaDeJA+4XjSDthDt+VsaA=; b=MjBAuCP3VL1ehn2MvtIe6Bg2ho
	rQfAaSpxiWFCSQQdx6BOxPd0JCqhwAYxFoa/Q0USpDy5gnbgXNy6uO53PC4seslINVUlTsXjs1jrL
	bWYQUSHZFGpaHLDeh1wjURAGOzzlEc8cM2tPBBSrx9SjlMh+JGodSqLjLSsaa5qUUI54=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 359 v3 (CVE-2020-29571) - FIFO event
 channels control structure ordering
Message-Id: <E1kp9Jd-0007Cj-7U@xenbits.xenproject.org>
Date: Tue, 15 Dec 2020 12:20:29 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2020-29571 / XSA-359
                               version 3

            FIFO event channels control structure ordering

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

A bounds check common to most operation time functions specific to FIFO
event channels depends on the CPU observing consistent state.  While the
producer side uses appropriately ordered writes, the consumer side isn't
protected against re-ordered reads, and may hence end up de-referencing
a NULL pointer.

IMPACT
======

Malicious or buggy guest kernels can mount a Denial of Service (DoS)
attack affecting the entire system.

VULNERABLE SYSTEMS
==================

All Xen versions from 4.4 onwards are vulnerable.  Xen versions 4.3 and
earlier are not vulnerable.

Only Arm systems may be vulnerable.  Whether a system is vulnerable will
depend on the specific CPU.  x86 systems are not vulnerable.

MITIGATION
==========

There is no known mitigation.

CREDITS
=======

This issue was discovered by Julien Grall of Amazon.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa359.patch           xen-unstable - 4.10

$ sha256sum xsa359*
cb009ad77d1a3d8044431b2af568dd9dffefe07fc9f537fb6b53c2ec57aa77b7  xsa359.meta
3126d9304b68be84a89c42c223227c8f96ecbb96a0385a7e1bdc65ae5e0f344f  xsa359.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl/YqeAMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZt6wIAJhvfVB8eRr5fqCbMUjZ++KKoG0AF/hoS7YRHiDn
zCgK/ff5RkY/pHHkVnrSOQeQg88SPBp/HaYljUXhoANbhXVxlt383QxQb63JwanR
1c3Sdvv5w0HdvrDyUMV16W/Edf/DGlSgciG/2saNz8pPbqiGKzeY3Q7nj3T3vLAE
ouNlHb2NItalKB2AdC62y/BFIjsn66G/P1agxyrcGirJxdvzORBx+LY7VTFOrOEB
L7yb8Y0U6Nj1XjGUXYm4X4xCCm+940Xc0Ht9zkDJlb3xSdO5sOtBE+Cx3F4uXn1c
vTMiKziAOgEKKXWV7P3KSWR/7G1aTm2YVRMy5XWtS6GY5D0=
=uRRE
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa359.meta"
Content-Disposition: attachment; filename="xsa359.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzNTksCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNCIsCiAgICAiNC4xMyIsCiAgICAiNC4xMiIs
CiAgICAiNC4xMSIsCiAgICAiNC4xMCIKICBdLAogICJUcmVlcyI6IFsKICAg
ICJ4ZW4iCiAgXSwKICAiUmVjaXBlcyI6IHsKICAgICI0LjEwIjogewogICAg
ICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0
YWJsZVJlZiI6ICIxZDcyZDk5MTVlZGZmMGRkNDFmNjAxYmJiMGIxZjgzYzAy
ZmYxNjg5IiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAz
NTMsCiAgICAgICAgICAgIDExNSwKICAgICAgICAgICAgMzIyLAogICAgICAg
ICAgICAzMjMsCiAgICAgICAgICAgIDMyNCwKICAgICAgICAgICAgMzI1LAog
ICAgICAgICAgICAzMzAsCiAgICAgICAgICAgIDM1MiwKICAgICAgICAgICAg
MzQ4LAogICAgICAgICAgICAzNTYsCiAgICAgICAgICAgIDM1OAogICAgICAg
ICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNh
MzU5LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAg
fSwKICAgICI0LjExIjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAi
eGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICI0MWE4MjJjMzkyNjM1
MGYyNjkxN2Q3NDdjOGRmZWQxYzQ0YTJjZjQyIiwKICAgICAgICAgICJQcmVy
ZXFzIjogWwogICAgICAgICAgICAzNTMsCiAgICAgICAgICAgIDExNSwKICAg
ICAgICAgICAgMzIyLAogICAgICAgICAgICAzMjMsCiAgICAgICAgICAgIDMy
NCwKICAgICAgICAgICAgMzI1LAogICAgICAgICAgICAzMzAsCiAgICAgICAg
ICAgIDM1MiwKICAgICAgICAgICAgMzQ4LAogICAgICAgICAgICAzNTYsCiAg
ICAgICAgICAgIDM1OAogICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVz
IjogWwogICAgICAgICAgICAieHNhMzU5LnBhdGNoIgogICAgICAgICAgXQog
ICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICI0LjEyIjogewogICAgICAi
UmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJs
ZVJlZiI6ICI4MTQ1ZDM4YjQ4MDA5MjU1YTMyYWI4N2EwMmU0ODFjZDA5Yzgx
MWY5IiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAzNTMs
CiAgICAgICAgICAgIDExNSwKICAgICAgICAgICAgMzIyLAogICAgICAgICAg
ICAzMjMsCiAgICAgICAgICAgIDMyNCwKICAgICAgICAgICAgMzI1LAogICAg
ICAgICAgICAzMzAsCiAgICAgICAgICAgIDM1MiwKICAgICAgICAgICAgMzQ4
LAogICAgICAgICAgICAzNTYsCiAgICAgICAgICAgIDM1OAogICAgICAgICAg
XSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMzU5
LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwK
ICAgICI0LjEzIjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVu
IjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICJiNTMwMjI3M2UyYzUxOTQw
MTcyNDAwNDg2NjQ0NjM2ZjJmNGZjNjRhIiwKICAgICAgICAgICJQcmVyZXFz
IjogWwogICAgICAgICAgICAzNTMsCiAgICAgICAgICAgIDExNSwKICAgICAg
ICAgICAgMzIyLAogICAgICAgICAgICAzMjMsCiAgICAgICAgICAgIDMyNCwK
ICAgICAgICAgICAgMzI1LAogICAgICAgICAgICAzMzAsCiAgICAgICAgICAg
IDM1MiwKICAgICAgICAgICAgMzQ4LAogICAgICAgICAgICAzNTYsCiAgICAg
ICAgICAgIDM1OAogICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjog
WwogICAgICAgICAgICAieHNhMzU5LnBhdGNoIgogICAgICAgICAgXQogICAg
ICAgIH0KICAgICAgfQogICAgfSwKICAgICI0LjE0IjogewogICAgICAiUmVj
aXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJl
ZiI6ICIxZDFkMWY1MzkxOTc2NDU2YTc5ZGFhYzBkY2ZlNzE1N2RhMWU1NGY3
IiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAzNTMsCiAg
ICAgICAgICAgIDExNSwKICAgICAgICAgICAgMzIyLAogICAgICAgICAgICAz
MjMsCiAgICAgICAgICAgIDMyNCwKICAgICAgICAgICAgMzI1LAogICAgICAg
ICAgICAzMzAsCiAgICAgICAgICAgIDM1MiwKICAgICAgICAgICAgMzQ4LAog
ICAgICAgICAgICAzNTYsCiAgICAgICAgICAgIDM1OAogICAgICAgICAgXSwK
ICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMzU5LnBh
dGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAg
ICJtYXN0ZXIiOiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4i
OiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogIjNhZTQ2OWFmOGU2ODBkZjMx
ZWVjZDBhMmFjNmE4M2I1OGFkN2NlNTMiLAogICAgICAgICAgIlByZXJlcXMi
OiBbCiAgICAgICAgICAgIDM1MywKICAgICAgICAgICAgMTE1LAogICAgICAg
ICAgICAzMjIsCiAgICAgICAgICAgIDMyMywKICAgICAgICAgICAgMzI0LAog
ICAgICAgICAgICAzMjUsCiAgICAgICAgICAgIDMzMCwKICAgICAgICAgICAg
MzUyLAogICAgICAgICAgICAzNDgsCiAgICAgICAgICAgIDM1NiwKICAgICAg
ICAgICAgMzU4CiAgICAgICAgICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBb
CiAgICAgICAgICAgICJ4c2EzNTkucGF0Y2giCiAgICAgICAgICBdCiAgICAg
ICAgfQogICAgICB9CiAgICB9CiAgfQp9

--=separator
Content-Type: application/octet-stream; name="xsa359.patch"
Content-Disposition: attachment; filename="xsa359.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBldnRjaG4vRklGTzogYWRkIDJuZCBzbXBfcm1iKCkgdG8gZXZ0Y2huX2Zp
Zm9fd29yZF9mcm9tX3BvcnQoKQoKQmVzaWRlcyB3aXRoIGFkZF9wYWdlX3Rv
X2V2ZW50X2FycmF5KCkgdGhlIGZ1bmN0aW9uIGFsc28gbmVlZHMgdG8Kc3lu
Y2hyb25pemUgd2l0aCBldnRjaG5fZmlmb19pbml0X2NvbnRyb2woKSBzZXR0
aW5nIGJvdGggZC0+ZXZ0Y2huX2ZpZm8KYW5kIChzdWJzZXF1ZW50bHkpIGQt
PmV2dGNobl9wb3J0X29wcy4KClRoaXMgaXMgWFNBLTM1OSAvIENWRS0yMDIw
LTI5NTcxLgoKUmVwb3J0ZWQtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFt
YXpvbi5jb20+ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxs
QGFtYXpvbi5jb20+CgotLS0gYS94ZW4vY29tbW9uL2V2ZW50X2ZpZm8uYwor
KysgYi94ZW4vY29tbW9uL2V2ZW50X2ZpZm8uYwpAQCAtNTUsNiArNTUsMTMg
QEAgc3RhdGljIGlubGluZSBldmVudF93b3JkX3QgKmV2dGNobl9maWZvXwog
ewogICAgIHVuc2lnbmVkIGludCBwLCB3OwogCisgICAgLyoKKyAgICAgKiBD
YWxsZXJzIGFyZW4ndCByZXF1aXJlZCB0byBob2xkIGQtPmV2ZW50X2xvY2ss
IHNvIHdlIG5lZWQgdG8gc3luY2hyb25pemUKKyAgICAgKiB3aXRoIGV2dGNo
bl9maWZvX2luaXRfY29udHJvbCgpIHNldHRpbmcgZC0+ZXZ0Y2huX3BvcnRf
b3BzIC9hZnRlci8KKyAgICAgKiBkLT5ldnRjaG5fZmlmby4KKyAgICAgKi8K
KyAgICBzbXBfcm1iKCk7CisKICAgICBpZiAoIHVubGlrZWx5KHBvcnQgPj0g
ZC0+ZXZ0Y2huX2ZpZm8tPm51bV9ldnRjaG5zKSApCiAgICAgICAgIHJldHVy
biBOVUxMOwogCkBAIC02MDYsNiArNjEzLDEwIEBAIGludCBldnRjaG5fZmlm
b19pbml0X2NvbnRyb2woc3RydWN0IGV2dGMKICAgICAgICAgaWYgKCByYyA8
IDAgKQogICAgICAgICAgICAgZ290byBlcnJvcjsKIAorICAgICAgICAvKgor
ICAgICAgICAgKiBUaGlzIGNhbGwsIGFzIGEgc2lkZSBlZmZlY3QsIHN5bmNo
cm9uaXplcyB3aXRoCisgICAgICAgICAqIGV2dGNobl9maWZvX3dvcmRfZnJv
bV9wb3J0KCkuCisgICAgICAgICAqLwogICAgICAgICByYyA9IG1hcF9jb250
cm9sX2Jsb2NrKHYsIGdmbiwgb2Zmc2V0KTsKICAgICAgICAgaWYgKCByYyA8
IDAgKQogICAgICAgICAgICAgZ290byBlcnJvcjsK

--=separator--

