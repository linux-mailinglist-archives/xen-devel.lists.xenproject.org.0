Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A70E4989
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 13:13:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNxUl-0001qi-77; Fri, 25 Oct 2019 11:11:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PbB1=YS=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1iNxUk-0001qP-ED
 for xen-devel@lists.xen.org; Fri, 25 Oct 2019 11:11:02 +0000
X-Inumbo-ID: 15661916-f718-11e9-94c4-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15661916-f718-11e9-94c4-12813bfff9fa;
 Fri, 25 Oct 2019 11:10:42 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1iNxUK-0001WO-V6; Fri, 25 Oct 2019 11:10:36 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1iNxUK-0002k5-SN; Fri, 25 Oct 2019 11:10:36 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.508 (Entity 5.508)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
Message-Id: <E1iNxUK-0002k5-SN@xenbits.xenproject.org>
Date: Fri, 25 Oct 2019 11:10:36 +0000
Subject: [Xen-devel] Xen Security Advisory 291 v3 (CVE-2019-17345) - x86/PV:
 page type reference counting issue with failed IOMMU update
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Xen.org security team" <security-team-members@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2019-17345 / XSA-291
                              version 3

  x86/PV: page type reference counting issue with failed IOMMU update

UPDATES IN VERSION 3
====================

CVE assigned.

ISSUE DESCRIPTION
=================

When an x86 PV domain has a passed-through PCI device assigned, IOMMU
mappings may need to be updated when the type of a particular page
changes.  Such an IOMMU operation may fail.  In the event of failure,
while at present the affected guest would be forcibly crashed, the
already recorded additional type reference was not dropped again.  This
causes a bug check to trigger while cleaning up after the crashed
guest.

IMPACT
======

Malicious or buggy x86 PV guest kernels can mount a Denial of Service
(DoS) attack affecting the whole system.

VULNERABLE SYSTEMS
==================

Xen versions from 4.8 onwards are vulnerable.

Only x86 systems are vulnerable.  ARM systems are not vulnerable.

Only x86 PV guests can exploit the vulnerability.  x86 HVM and PVH
guests cannot exploit the vulnerability.

Only guests which are assigned a physical device can exploit this
vulnerability.  Guests which are not assigned physical devices cannot
exploit this vulnerability.

MITIGATION
==========

Running only HVM or PVH guests avoids the vulnerability.

Not passing through PCI devices to PV guests also avoids the
vulnerability.

CREDITS
=======

This issue was discovered by Igor Druzhinin and Andrew Cooper of Citrix.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

xsa291.patch           xen-unstable
xsa291-4.11.patch      Xen 4.11.x, Xen 4.10.x
xsa291-4.9.patch       Xen 4.9.x, Xen 4.8.x

$ sha256sum xsa291*
01883c11ae45a5771644270445e463538a61d98c66adbba852de74ccd272eae9  xsa291.meta
fb5f2a75ba113f21e9cb2dfbc22520495c69a4fef631c030a4834c680045e587  xsa291.patch
299bb4913e7ddb46ce90f415f91ee5e5480050631281c87e1a764b66fb116d89  xsa291-4.9.patch
16087ba5c59b9644f4f61c0c7fa124d9e04e88089b235aaae91daa04cdf1b8a1  xsa291-4.11.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl2y1+EMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZlLUIAIIHkQgn80yjzaDnIGp0iFhcoTjDGlwk47MaQiJ2
QbmVstpVbg4ZUuPmxJ6eWTJXoMbdelthA9klXX9zc0LWEOrMwWeykAxkWB8uVj+b
URN6fJrLu73U2tqjmPT/P63FVgETXDbFGQcjsSkZ17VHcblmsysCUPmjLWn4r3Tc
/lCXcEjwHYV2HnYUBrXO2biDVChRt3ClLhJZW9pfvI8hIzCqL+tdtNuvvqVSwR3Y
SzR75k2lKwkmHQju2rpL00mNsyHsUOl3tDVeHTQa9V7yW4WO4vSb83oZExz9ChgH
g9ro6epGfGYCQYB9mNSaQbOM3LhOrWeiR1i3nUcR0qRG1wY=
=r9AC
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa291.meta"
Content-Disposition: attachment; filename="xsa291.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAyOTEsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xMSIsCiAgICAiNC4xMCIsCiAgICAiNC45IiwK
ICAgICI0LjgiCiAgXSwKICAiVHJlZXMiOiBbCiAgICAieGVuIgogIF0sCiAg
IlJlY2lwZXMiOiB7CiAgICAiNC4xMCI6IHsKICAgICAgIlJlY2lwZXMiOiB7
CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiYTAx
NmI4ZjIwN2M3YTNmZThiZGQyYjZmN2MwODAwMjBlM2UxYzgyMyIsCiAgICAg
ICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAgICAgMjg0LAogICAgICAgICAg
ICAyODUsCiAgICAgICAgICAgIDI4NywKICAgICAgICAgICAgMjg4LAogICAg
ICAgICAgICAyOTAKICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6
IFsKICAgICAgICAgICAgInhzYTI5MS00LjExLnBhdGNoIgogICAgICAgICAg
XQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICI0LjExIjogewogICAg
ICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0
YWJsZVJlZiI6ICI4N2Y1MWJmMzY2Y2E3OWI5OGUxZTIwMWJmOWJkN2E5YzE2
NDYzMWUyIiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAy
ODQsCiAgICAgICAgICAgIDI4NSwKICAgICAgICAgICAgMjg3LAogICAgICAg
ICAgICAyODgsCiAgICAgICAgICAgIDI5MAogICAgICAgICAgXSwKICAgICAg
ICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMjkxLTQuMTEucGF0
Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAg
IjQuOCI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsK
ICAgICAgICAgICJTdGFibGVSZWYiOiAiOTA4ZTc2OGZhZTQ5YThkYjAwODll
NjgxODg2NTIwNzllM2JmYWE2NiIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsK
ICAgICAgICAgICAgMjg0LAogICAgICAgICAgICAyODUsCiAgICAgICAgICAg
IDI4NywKICAgICAgICAgICAgMjg4LAogICAgICAgICAgICAyOTAKICAgICAg
ICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhz
YTI5MS00LjkucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9
CiAgICB9LAogICAgIjQuOSI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAg
ICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiZjVhY2Y5N2Y2
NjljNmJjOTY5MWUwMzc3MWFkMDY3MDNkYTc3ZTBkNSIsCiAgICAgICAgICAi
UHJlcmVxcyI6IFsKICAgICAgICAgICAgMjg0LAogICAgICAgICAgICAyODUs
CiAgICAgICAgICAgIDI4NywKICAgICAgICAgICAgMjg4LAogICAgICAgICAg
ICAyOTAKICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAg
ICAgICAgICAgInhzYTI5MS00LjkucGF0Y2giCiAgICAgICAgICBdCiAgICAg
ICAgfQogICAgICB9CiAgICB9LAogICAgIm1hc3RlciI6IHsKICAgICAgIlJl
Y2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVS
ZWYiOiAiMjRkNTI4MjUyN2Y0NjQ3OTA3YjM1NzI4MjBiNTMzNWMxNWNkMDM1
NiIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAgICAgMjg0LAog
ICAgICAgICAgICAyODUsCiAgICAgICAgICAgIDI4NywKICAgICAgICAgICAg
Mjg4LAogICAgICAgICAgICAyOTAKICAgICAgICAgIF0sCiAgICAgICAgICAi
UGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTI5MS5wYXRjaCIKICAgICAg
ICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0KICB9Cn0=

--=separator
Content-Type: application/octet-stream; name="xsa291.patch"
Content-Disposition: attachment; filename="xsa291.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODYvbW06IGRvbid0IHJldGFpbiBwYWdlIHR5cGUgcmVmZXJlbmNlIHdo
ZW4gSU9NTVUgb3BlcmF0aW9uIGZhaWxzCgpUaGUgSU9NTVUgdXBkYXRlIGlu
IF9nZXRfcGFnZV90eXBlKCkgaGFwcGVucyBiZXR3ZWVuIHJlY29yZGluZyBv
ZiB0aGUKbmV3IHJlZmVyZW5jZSBhbmQgdmFsaWRhdGlvbiBvZiB0aGUgcGFn
ZSBmb3IgaXRzIG5ldyB0eXBlIChpZgpuZWNlc3NhcnkpLiBJZiB0aGUgSU9N
TVUgb3BlcmF0aW9uIGZhaWxzLCB0aGVyZSdzIG5vIHBvaW50IGluIGFjdHVh
bGx5CmNhcnJ5aW5nIG91dCB2YWxpZGF0aW9uLiBGdXJ0aGVybW9yZSwgd2l0
aCB0aGlzIHJlc3VsdGluZyBpbiBmYWlsdXJlCmdldHRpbmcgaW5kaWNhdGVk
IHRvIHRoZSBjYWxsZXIsIHRoZSByZWNvcmRlZCB0eXBlIHJlZmVyZW5jZSBh
bHNvIG5lZWRzCnRvIGJlIGRyb3BwZWQgYWdhaW4uCgpOb3RlIHRoYXQgaW4g
Y2FzZSBvZiBmYWlsdXJlIG9mIGFsbG9jX3BhZ2VfdHlwZSgpIHRoZXJlJ3Mg
bm8gbmVlZCB0bwp1bmRvIHRoZSBJT01NVSBvcGVyYXRpb246IE9ubHkgc3Bl
Y2lhbCB0eXBlcyBnZXQgaGFuZGVkIHRvIHRoZSBmdW5jdGlvbi4KVGhlIGZ1
bmN0aW9uLCB1cG9uIGZhaWx1cmUsIGNsZWFycyAtPnUuaW51c2UudHlwZV9p
bmZvLCBlZmZlY3RpdmVseQpjb252ZXJ0aW5nIHRoZSBwYWdlIHRvIFBHVF9u
b25lLiBUaGUgSU9NTVUgbWFwcGluZywgaG93ZXZlciwgc29sZWx5CmRlcGVu
ZHMgb24gd2hldGhlciB0aGUgdHlwZSBpcyBQR1Rfd3JpdGFibGVfcGFnZS4K
ClRoaXMgaXMgWFNBLTI5MS4KClJlcG9ydGVkLWJ5OiBJZ29yIERydXpoaW5p
biA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KUmVwb3J0ZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2
aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvbW0uYworKysgYi94ZW4vYXJj
aC94ODYvbW0uYwpAQCAtMjgwOCw2ICsyODA4LDEzIEBAIHN0YXRpYyBpbnQg
X2dldF9wYWdlX3R5cGUoc3RydWN0IHBhZ2VfaW4KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBBR0VfT1JERVJfNEss
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBJT01NVUZfcmVhZGFibGUgfAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgSU9NTVVGX3dyaXRhYmxlKTsKKworICAg
ICAgICAgICAgaWYgKCB1bmxpa2VseShpb21tdV9yZXQpICkKKyAgICAgICAg
ICAgIHsKKyAgICAgICAgICAgICAgICBfcHV0X3BhZ2VfdHlwZShwYWdlLCBm
YWxzZSwgTlVMTCk7CisgICAgICAgICAgICAgICAgcmMgPSBpb21tdV9yZXQ7
CisgICAgICAgICAgICAgICAgZ290byBvdXQ7CisgICAgICAgICAgICB9CiAg
ICAgICAgIH0KICAgICB9CiAKQEAgLTI4MjIsMTIgKzI4MjksMTAgQEAgc3Rh
dGljIGludCBfZ2V0X3BhZ2VfdHlwZShzdHJ1Y3QgcGFnZV9pbgogICAgICAg
ICByYyA9IGFsbG9jX3BhZ2VfdHlwZShwYWdlLCB0eXBlLCBwcmVlbXB0aWJs
ZSk7CiAgICAgfQogCisgb3V0OgogICAgIGlmICggKHggJiBQR1RfcGFydGlh
bCkgJiYgIShueCAmIFBHVF9wYXJ0aWFsKSApCiAgICAgICAgIHB1dF9wYWdl
KHBhZ2UpOwogCi0gICAgaWYgKCAhcmMgKQotICAgICAgICByYyA9IGlvbW11
X3JldDsKLQogICAgIHJldHVybiByYzsKIH0KIAo=

--=separator
Content-Type: application/octet-stream; name="xsa291-4.9.patch"
Content-Disposition: attachment; filename="xsa291-4.9.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODYvbW06IGRvbid0IHJldGFpbiBwYWdlIHR5cGUgcmVmZXJlbmNlIHdo
ZW4gSU9NTVUgb3BlcmF0aW9uIGZhaWxzCgpUaGUgSU9NTVUgdXBkYXRlIGlu
IF9nZXRfcGFnZV90eXBlKCkgaGFwcGVucyBiZXR3ZWVuIHJlY29yZGluZyBv
ZiB0aGUKbmV3IHJlZmVyZW5jZSBhbmQgdmFsaWRhdGlvbiBvZiB0aGUgcGFn
ZSBmb3IgaXRzIG5ldyB0eXBlIChpZgpuZWNlc3NhcnkpLiBJZiB0aGUgSU9N
TVUgb3BlcmF0aW9uIGZhaWxzLCB0aGVyZSdzIG5vIHBvaW50IGluIGFjdHVh
bGx5CmNhcnJ5aW5nIG91dCB2YWxpZGF0aW9uLiBGdXJ0aGVybW9yZSwgd2l0
aCB0aGlzIHJlc3VsdGluZyBpbiBmYWlsdXJlCmdldHRpbmcgaW5kaWNhdGVk
IHRvIHRoZSBjYWxsZXIsIHRoZSByZWNvcmRlZCB0eXBlIHJlZmVyZW5jZSBh
bHNvIG5lZWRzCnRvIGJlIGRyb3BwZWQgYWdhaW4uCgpOb3RlIHRoYXQgaW4g
Y2FzZSBvZiBmYWlsdXJlIG9mIGFsbG9jX3BhZ2VfdHlwZSgpIHRoZXJlJ3Mg
bm8gbmVlZCB0bwp1bmRvIHRoZSBJT01NVSBvcGVyYXRpb246IE9ubHkgc3Bl
Y2lhbCB0eXBlcyBnZXQgaGFuZGVkIHRvIHRoZSBmdW5jdGlvbi4KVGhlIGZ1
bmN0aW9uLCB1cG9uIGZhaWx1cmUsIGNsZWFycyAtPnUuaW51c2UudHlwZV9p
bmZvLCBlZmZlY3RpdmVseQpjb252ZXJ0aW5nIHRoZSBwYWdlIHRvIFBHVF9u
b25lLiBUaGUgSU9NTVUgbWFwcGluZywgaG93ZXZlciwgc29sZWx5CmRlcGVu
ZHMgb24gd2hldGhlciB0aGUgdHlwZSBpcyBQR1Rfd3JpdGFibGVfcGFnZS4K
ClRoaXMgaXMgWFNBLTI5MS4KClJlcG9ydGVkLWJ5OiBJZ29yIERydXpoaW5p
biA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KUmVwb3J0ZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2
aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvbW0uYworKysgYi94ZW4vYXJj
aC94ODYvbW0uYwpAQCAtMjg5Miw2ICsyODkyLDEzIEBAIHN0YXRpYyBpbnQg
X19nZXRfcGFnZV90eXBlKHN0cnVjdCBwYWdlX2kKICAgICAgICAgICAgICAg
ICBpb21tdV9yZXQgPSBpb21tdV9tYXBfcGFnZShkLCBtZm5fdG9fZ21mbihk
LCBwYWdlX3RvX21mbihwYWdlKSksCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGFnZV90b19tZm4ocGFnZSksCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSU9NTVVG
X3JlYWRhYmxlfElPTU1VRl93cml0YWJsZSk7CisKKyAgICAgICAgICAgIGlm
ICggdW5saWtlbHkoaW9tbXVfcmV0KSApCisgICAgICAgICAgICB7CisgICAg
ICAgICAgICAgICAgX3B1dF9wYWdlX3R5cGUocGFnZSwgZmFsc2UsIE5VTEwp
OworICAgICAgICAgICAgICAgIHJjID0gaW9tbXVfcmV0OworICAgICAgICAg
ICAgICAgIGdvdG8gb3V0OworICAgICAgICAgICAgfQogICAgICAgICB9CiAg
ICAgfQogCkBAIC0yOTA2LDEyICsyOTEzLDEwIEBAIHN0YXRpYyBpbnQgX19n
ZXRfcGFnZV90eXBlKHN0cnVjdCBwYWdlX2kKICAgICAgICAgcmMgPSBhbGxv
Y19wYWdlX3R5cGUocGFnZSwgdHlwZSwgcHJlZW1wdGlibGUpOwogICAgIH0K
IAorIG91dDoKICAgICBpZiAoICh4ICYgUEdUX3BhcnRpYWwpICYmICEobngg
JiBQR1RfcGFydGlhbCkgKQogICAgICAgICBwdXRfcGFnZShwYWdlKTsKIAot
ICAgIGlmICggIXJjICkKLSAgICAgICAgcmMgPSBpb21tdV9yZXQ7Ci0KICAg
ICByZXR1cm4gcmM7CiB9CiAK

--=separator
Content-Type: application/octet-stream; name="xsa291-4.11.patch"
Content-Disposition: attachment; filename="xsa291-4.11.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODYvbW06IGRvbid0IHJldGFpbiBwYWdlIHR5cGUgcmVmZXJlbmNlIHdo
ZW4gSU9NTVUgb3BlcmF0aW9uIGZhaWxzCgpUaGUgSU9NTVUgdXBkYXRlIGlu
IF9nZXRfcGFnZV90eXBlKCkgaGFwcGVucyBiZXR3ZWVuIHJlY29yZGluZyBv
ZiB0aGUKbmV3IHJlZmVyZW5jZSBhbmQgdmFsaWRhdGlvbiBvZiB0aGUgcGFn
ZSBmb3IgaXRzIG5ldyB0eXBlIChpZgpuZWNlc3NhcnkpLiBJZiB0aGUgSU9N
TVUgb3BlcmF0aW9uIGZhaWxzLCB0aGVyZSdzIG5vIHBvaW50IGluIGFjdHVh
bGx5CmNhcnJ5aW5nIG91dCB2YWxpZGF0aW9uLiBGdXJ0aGVybW9yZSwgd2l0
aCB0aGlzIHJlc3VsdGluZyBpbiBmYWlsdXJlCmdldHRpbmcgaW5kaWNhdGVk
IHRvIHRoZSBjYWxsZXIsIHRoZSByZWNvcmRlZCB0eXBlIHJlZmVyZW5jZSBh
bHNvIG5lZWRzCnRvIGJlIGRyb3BwZWQgYWdhaW4uCgpOb3RlIHRoYXQgaW4g
Y2FzZSBvZiBmYWlsdXJlIG9mIGFsbG9jX3BhZ2VfdHlwZSgpIHRoZXJlJ3Mg
bm8gbmVlZCB0bwp1bmRvIHRoZSBJT01NVSBvcGVyYXRpb246IE9ubHkgc3Bl
Y2lhbCB0eXBlcyBnZXQgaGFuZGVkIHRvIHRoZSBmdW5jdGlvbi4KVGhlIGZ1
bmN0aW9uLCB1cG9uIGZhaWx1cmUsIGNsZWFycyAtPnUuaW51c2UudHlwZV9p
bmZvLCBlZmZlY3RpdmVseQpjb252ZXJ0aW5nIHRoZSBwYWdlIHRvIFBHVF9u
b25lLiBUaGUgSU9NTVUgbWFwcGluZywgaG93ZXZlciwgc29sZWx5CmRlcGVu
ZHMgb24gd2hldGhlciB0aGUgdHlwZSBpcyBQR1Rfd3JpdGFibGVfcGFnZS4K
ClRoaXMgaXMgWFNBLTI5MS4KClJlcG9ydGVkLWJ5OiBJZ29yIERydXpoaW5p
biA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KUmVwb3J0ZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2
aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvbW0uYworKysgYi94ZW4vYXJj
aC94ODYvbW0uYwpAQCAtMjc1MSw2ICsyNzUxLDEzIEBAIHN0YXRpYyBpbnQg
X2dldF9wYWdlX3R5cGUoc3RydWN0IHBhZ2VfaW4KICAgICAgICAgICAgICAg
ICBpb21tdV9yZXQgPSBpb21tdV9tYXBfcGFnZShkLCBnZm5feChnZm4pLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1m
bl94KHBhZ2VfdG9fbWZuKHBhZ2UpKSwKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBJT01NVUZfcmVhZGFibGV8SU9NTVVG
X3dyaXRhYmxlKTsKKworICAgICAgICAgICAgaWYgKCB1bmxpa2VseShpb21t
dV9yZXQpICkKKyAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICBfcHV0
X3BhZ2VfdHlwZShwYWdlLCBmYWxzZSwgTlVMTCk7CisgICAgICAgICAgICAg
ICAgcmMgPSBpb21tdV9yZXQ7CisgICAgICAgICAgICAgICAgZ290byBvdXQ7
CisgICAgICAgICAgICB9CiAgICAgICAgIH0KICAgICB9CiAKQEAgLTI3NjUs
MTIgKzI3NzIsMTAgQEAgc3RhdGljIGludCBfZ2V0X3BhZ2VfdHlwZShzdHJ1
Y3QgcGFnZV9pbgogICAgICAgICByYyA9IGFsbG9jX3BhZ2VfdHlwZShwYWdl
LCB0eXBlLCBwcmVlbXB0aWJsZSk7CiAgICAgfQogCisgb3V0OgogICAgIGlm
ICggKHggJiBQR1RfcGFydGlhbCkgJiYgIShueCAmIFBHVF9wYXJ0aWFsKSAp
CiAgICAgICAgIHB1dF9wYWdlKHBhZ2UpOwogCi0gICAgaWYgKCAhcmMgKQot
ICAgICAgICByYyA9IGlvbW11X3JldDsKLQogICAgIHJldHVybiByYzsKIH0K
IAo=

--=separator
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=separator--

