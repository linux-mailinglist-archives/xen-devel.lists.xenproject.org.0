Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C68AAEF7A5
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 14:01:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029615.1403409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWZfL-0000ws-34; Tue, 01 Jul 2025 12:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029615.1403409; Tue, 01 Jul 2025 12:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWZfK-0000vP-Vn; Tue, 01 Jul 2025 12:00:46 +0000
Received: by outflank-mailman (input) for mailman id 1029615;
 Tue, 01 Jul 2025 12:00:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TMYy=ZO=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1uWZfJ-0000CO-2a
 for xen-devel@lists.xen.org; Tue, 01 Jul 2025 12:00:45 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0135d967-5673-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 14:00:42 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1uWZf4-00CyMt-2K;
 Tue, 01 Jul 2025 12:00:30 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1uWZf3-004MTf-2x;
 Tue, 01 Jul 2025 12:00:29 +0000
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
X-Inumbo-ID: 0135d967-5673-11f0-a313-13f23c93f187
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.510 (Entity 5.510)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 470 v2 (CVE-2025-27465) - x86: Incorrect
 stubs exception handling for flags recovery
Message-Id: <E1uWZf3-004MTf-2x@xenbits.xenproject.org>
Date: Tue, 01 Jul 2025 12:00:29 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2025-27465 / XSA-470
                               version 2

       x86: Incorrect stubs exception handling for flags recovery

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

Certain instructions need intercepting and emulating by Xen.  In some
cases Xen emulates the instruction by replaying it, using an executable
stub.  Some instructions may raise an exception, which is supposed to be
handled gracefully.  Certain replayed instructions have additional logic
to set up and recover the changes to the arithmetic flags.

For replayed instructions where the flags recovery logic is used, the
metadata for exception handling was incorrect, preventing Xen from
handling the the exception gracefully, treating it as fatal instead.

IMPACT
======

An unprivileged guest can cause a hypervisor crash, causing a Denial of
Service (DoS) of the entire host.

VULNERABLE SYSTEMS
==================

Xen 4.9 and onwards are vulnerable.  Xen 4.8 and older are not
vulnerable.

Only x86 systems are vulnerable.  ARM systems are not vulnerable.

Only HVM or PVH guests can leverage the vulnerability.  PV guests cannot
leverage the vulnerability.

MITIGATION
==========

There are no mitigations.

CREDITS
=======

This issue was discovered by Andrew Cooper of XenServer.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa470.patch           xen-unstable - Xen 4.18.x
xsa470-4.17.patch      Xen 4.17.x

$ sha256sum xsa470*
99d7fbe6acb27aa13c586acbc8d15d00b04bb040bb0cb5f8feca495f0f414a10  xsa470.patch
2c6490978bd1ba1578a4c1102a521cf4d01d99792a363708bb1e6a1b879b1f5c  xsa470-4.17.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmhjzN0MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZ6skIAMivsvi9wpvpoaQubdbG3iUFoK4ocOZHdywJbfOQ
OjUK23585BZo45xIp/myqbbmIjQ4PsN4JFh9D9F3xv3xVfSD1RYS8qMPm/pcpY60
dDrk2SeLqqhQzdxguDrQ97qiPtanfDEvkwBUzu2Z7rDgbv/7hBCDURVgwaprs/d6
hvF/K+FIT7rBFFfPJmCzO8RCMO7o3iKia77q7QScFSmm4AeJ+E9NQdPsa2Po9aJG
reHCDEeWaPgktVV/M8nS0an/K6Oavf2jI18hkoweSnok2xAz0t9Me5gQ3UcaOdlz
iNk3ItZ/41ja2+3xO6dFlwOdVSnk3KvWZJxjJMySeWLRTQI=
=uDlQ
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa470.patch"
Content-Disposition: attachment; filename="xsa470.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L2VtdWw6IEZpeCBleHRhYmxlIHJlZ2lzdHJhdGlv
biBpbiBpbnZva2Vfc3R1YigpCgpGb3IgZXhjZXB0aW9uIHJlY292ZXJ5IGlu
IHRoZSBzdHVicywgdGhlIHJlZ2lzdGVyZWQgYWRkcmVzcyBmb3IgZml4dXAg
aXMgdGhlCnJldHVybiBhZGRyZXNzIG9mIHRoZSBDQUxMIGVudGVyaW5nIHRo
ZSBzdHViLgoKSW4gaW52b2tlX3N0dWIoKSwgdGhlICcuTHJldCU9OicgbGFi
ZWwgaXMgdGhlIHdyb25nIHNpZGUgb2YgdGhlICdwb3N0JwpwYXJhbWV0ZXIu
ICBUaGUgJ3Bvc3QnIHBhcmFtZXRlciBpcyBub24tZW1wdHkgaW4gY2FzZXMg
d2hlcmUgdGhlIGFyaXRobWV0aWMKZmxhZ3Mgb2YgdGhlIG9wZXJhdGlvbiBu
ZWVkIHJlY292ZXJpbmcuCgpTcGxpdCB0aGUgbGluZSB0byBzZXBhcmF0ZSAn
cHJlJyBhbmQgJ3Bvc3QnLCBtYWtpbmcgaXQgbW9yZSBvYnZpb3VzIHRoYXQg
dGhlCnJldHVybiBhZGRyZXNzIGxhYmVsIHdhcyBpbiB0aGUgd3JvbmcgcG9z
aXRpb24uCgpIb3dldmVyLCBpbiB0aGUgY2FzZSB0aGF0IGFuIGV4Y2VwdGlv
biBkaWQgb2NjdXIsIHdlIHdhbnQgdG8gc2tpcCAncG9zdCcgYXMKaXQncyBs
b2dpY2FsbHkgcGFydCBvZiB0aGUgb3BlcmF0aW9uIHdoaWNoIGhhZCBhbHJl
YWR5IGZhaWxlZC4gIFRoZXJlZm9yZSwgYWRkCmEgbmV3IHNraXAgbGFiZWwg
YW5kIHVzZSB0aGF0IGZvciB0aGUgZXhjZXB0aW9uIHJlY292ZXJ5IHBhdGgu
CgpUaGlzIGlzIFhTQS00NzAgLyBDVkUtMjAyNS0yNzQ2NQoKRml4ZXM6IDc5
OTAzZTUwZGJhOSAoIng4NmVtdWw6IGNhdGNoIGV4Y2VwdGlvbnMgb2NjdXJy
aW5nIGluIHN0dWJzIikKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYveDg2X2VtdWxhdGUvcHJpdmF0ZS5oIGIveGVuL2FyY2gveDg2
L3g4Nl9lbXVsYXRlL3ByaXZhdGUuaAppbmRleCA0NjdiY2UzYzg0YjguLmE0
YmExYjNjMzkxOSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3g4Nl9lbXVs
YXRlL3ByaXZhdGUuaAorKysgYi94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUv
cHJpdmF0ZS5oCkBAIC03MTQsMTIgKzcxNCwxNSBAQCBzdHJ1Y3Qgc3R1Yl9l
eG4gewogICAgIHN0dWJfZXhuLmluZm8gPSAodW5pb24gc3R1Yl9leGNlcHRp
b25fdG9rZW4pIHsgLnJhdyA9IH4wIH07ICAgICAgICAgXAogICAgIHN0dWJf
ZXhuLmxpbmUgPSBfX0xJTkVfXzsgLyogVXRpbGl0eSBvdXR3ZWlnaHMgbGl2
ZXBhdGNoaW5nIGNvc3QgKi8gXAogICAgIGJsb2NrX3NwZWN1bGF0aW9uKCk7
IC8qIFNDU0IgKi8gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAotICAgIGFzbSB2b2xhdGlsZSAoIHByZSAiXG5cdElORElSRUNUX0NB
TEwgJVtzdHViXVxuXHQiIHBvc3QgIlxuIiAgICAgICAgXAorICAgIGFzbSB2
b2xhdGlsZSAoIHByZSAiXG5cdCIgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAorICAgICAgICAgICAgICAgICAgICJJTkRJ
UkVDVF9DQUxMICVbc3R1Yl1cbiIgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAogICAgICAgICAgICAgICAgICAgICIuTHJldCU9OlxuXHQiICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICAg
ICAgICAgICAgIHBvc3QgIlxuXHQiICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAorICAgICAgICAgICAgICAgICAgICIuTHNr
aXAlPTpcblx0IiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAogICAgICAgICAgICAgICAgICAgICIucHVzaHNlY3Rpb24gLmZpeHVw
LFwiYXhcIlxuIiAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAg
ICAgICAgICAgICIuTGZpeCU9OlxuXHQiICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAgICAgICJwb3Ag
JVtleG5dXG5cdCIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAotICAgICAgICAgICAgICAgICAgICJqbXAgLkxyZXQlPVxuXHQiICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICAg
ICAgICAgICAgICJqbXAgLkxza2lwJT1cblx0IiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAgICAgICIucG9w
c2VjdGlvblxuXHQiICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAogICAgICAgICAgICAgICAgICAgIF9BU01fRVhUQUJMRSguTHJldCU9
LCAuTGZpeCU9KSAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAg
ICAgICAgICAgIDogW2V4bl0gIitnIiAoc3R1Yl9leG4uaW5mbykgQVNNX0NB
TExfQ09OU1RSQUlOVCwgICAgXAo=

--=separator
Content-Type: application/octet-stream; name="xsa470-4.17.patch"
Content-Disposition: attachment; filename="xsa470-4.17.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L2VtdWw6IEZpeCBleHRhYmxlIHJlZ2lzdHJhdGlv
biBpbiBpbnZva2Vfc3R1YigpCgpGb3IgZXhjZXB0aW9uIHJlY292ZXJ5IGlu
IHRoZSBzdHVicywgdGhlIHJlZ2lzdGVyZWQgYWRkcmVzcyBmb3IgZml4dXAg
aXMgdGhlCnJldHVybiBhZGRyZXNzIG9mIHRoZSBDQUxMIGVudGVyaW5nIHRo
ZSBzdHViLgoKSW4gaW52b2tlX3N0dWIoKSwgdGhlICcuTHJldCU9OicgbGFi
ZWwgaXMgdGhlIHdyb25nIHNpZGUgb2YgdGhlICdwb3N0JwpwYXJhbWV0ZXIu
ICBUaGUgJ3Bvc3QnIHBhcmFtZXRlciBpcyBub24tZW1wdHkgaW4gY2FzZXMg
d2hlcmUgdGhlIGFyaXRobWV0aWMKZmxhZ3Mgb2YgdGhlIG9wZXJhdGlvbiBu
ZWVkIHJlY292ZXJpbmcuCgpTcGxpdCB0aGUgbGluZSB0byBzZXBhcmF0ZSAn
cHJlJyBhbmQgJ3Bvc3QnLCBtYWtpbmcgaXQgbW9yZSBvYnZpb3VzIHRoYXQg
dGhlCnJldHVybiBhZGRyZXNzIGxhYmVsIHdhcyBpbiB0aGUgd3JvbmcgcG9z
aXRpb24uCgpIb3dldmVyLCBpbiB0aGUgY2FzZSB0aGF0IGFuIGV4Y2VwdGlv
biBkaWQgb2NjdXIsIHdlIHdhbnQgdG8gc2tpcCAncG9zdCcgYXMKaXQncyBs
b2dpY2FsbHkgcGFydCBvZiB0aGUgb3BlcmF0aW9uIHdoaWNoIGhhZCBhbHJl
YWR5IGZhaWxlZC4gIFRoZXJlZm9yZSwgYWRkCmEgbmV3IHNraXAgbGFiZWwg
YW5kIHVzZSB0aGF0IGZvciB0aGUgZXhjZXB0aW9uIHJlY292ZXJ5IHBhdGgu
CgpUaGlzIGlzIFhTQS00NzAgLyBDVkUtMjAyNS0yNzQ2NQoKRml4ZXM6IDc5
OTAzZTUwZGJhOSAoIng4NmVtdWw6IGNhdGNoIGV4Y2VwdGlvbnMgb2NjdXJy
aW5nIGluIHN0dWJzIikKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYyBiL3hlbi9hcmNo
L3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCmluZGV4IGI1ZWNhMTM0
MTBjZC4uNWE2MWJhNjEzNjBkIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYv
eDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYworKysgYi94ZW4vYXJjaC94ODYv
eDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwpAQCAtMTI1OCwxMiArMTI1OCwx
NSBAQCBzdGF0aWMgaW5saW5lIGludCBta2VjKHVpbnQ4X3QgZSwgaW50MzJf
dCBlYywgLi4uKQogICAgIHN0dWJfZXhuLmluZm8gPSAodW5pb24gc3R1Yl9l
eGNlcHRpb25fdG9rZW4pIHsgLnJhdyA9IH4wIH07ICAgICAgICAgXAogICAg
IHN0dWJfZXhuLmxpbmUgPSBfX0xJTkVfXzsgLyogVXRpbGl0eSBvdXR3ZWln
aHMgbGl2ZXBhdGNoaW5nIGNvc3QgKi8gXAogICAgIGJsb2NrX3NwZWN1bGF0
aW9uKCk7IC8qIFNDU0IgKi8gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAotICAgIGFzbSB2b2xhdGlsZSAoIHByZSAiXG5cdElORElS
RUNUX0NBTEwgJVtzdHViXVxuXHQiIHBvc3QgIlxuIiAgICAgICAgXAorICAg
IGFzbSB2b2xhdGlsZSAoIHByZSAiXG5cdCIgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICAgICAgICAgICAg
ICJJTkRJUkVDVF9DQUxMICVbc3R1Yl1cbiIgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAogICAgICAgICAgICAgICAgICAgICIuTHJldCU9OlxuXHQi
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAg
ICAgICAgICAgICAgICAgIHBvc3QgIlxuXHQiICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICAgICAgICAgICAg
ICIuTHNraXAlPTpcblx0IiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAogICAgICAgICAgICAgICAgICAgICIucHVzaHNlY3Rpb24g
LmZpeHVwLFwiYXhcIlxuIiAgICAgICAgICAgICAgICAgICAgICAgXAogICAg
ICAgICAgICAgICAgICAgICIuTGZpeCU9OlxuXHQiICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAgICAg
ICJwb3AgJVtleG5dXG5cdCIgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAotICAgICAgICAgICAgICAgICAgICJqbXAgLkxyZXQlPVxu
XHQiICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAg
ICAgICAgICAgICAgICAgICJqbXAgLkxza2lwJT1cblx0IiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAgICAg
ICIucG9wc2VjdGlvblxuXHQiICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAogICAgICAgICAgICAgICAgICAgIF9BU01fRVhUQUJMRSgu
THJldCU9LCAuTGZpeCU9KSAgICAgICAgICAgICAgICAgICAgICAgXAogICAg
ICAgICAgICAgICAgICAgIDogW2V4bl0gIitnIiAoc3R1Yl9leG4uaW5mbykg
QVNNX0NBTExfQ09OU1RSQUlOVCwgICAgXAo=

--=separator--

