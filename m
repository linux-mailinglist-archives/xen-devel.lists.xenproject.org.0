Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C901CE4990
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 13:14:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNxV1-00024u-8y; Fri, 25 Oct 2019 11:11:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PbB1=YS=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1iNxUz-00023V-Eb
 for xen-devel@lists.xen.org; Fri, 25 Oct 2019 11:11:17 +0000
X-Inumbo-ID: 1576e67e-f718-11e9-94c4-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1576e67e-f718-11e9-94c4-12813bfff9fa;
 Fri, 25 Oct 2019 11:10:42 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1iNxUF-0001Vj-GY; Fri, 25 Oct 2019 11:10:31 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1iNxUF-0002fv-DR; Fri, 25 Oct 2019 11:10:31 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.508 (Entity 5.508)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
Message-Id: <E1iNxUF-0002fv-DR@xenbits.xenproject.org>
Date: Fri, 25 Oct 2019 11:10:31 +0000
Subject: [Xen-devel] Xen Security Advisory 285 v3 (CVE-2019-17341) - race
 with pass-through device hotplug
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

            Xen Security Advisory CVE-2019-17341 / XSA-285
                              version 3

                 race with pass-through device hotplug

UPDATES IN VERSION 3
====================

CVE assigned.

ISSUE DESCRIPTION
=================

When adding a passed-through PCI device to a domain after it was already
started, IOMMU page tables may need constructing on the fly.  For PV
guests the decision whether a page ought to have a mapping is based on
whether the page is writable, to prevent IOMMU access to things like
page tables.  Writablility of a page may, however, change at any time.
Failure of the relevant code to respect this possible race may lead
to IOMMU mappings of, in particular, page tables, allowing the guest
to alter such page tables without Xen auditing the changes.

IMPACT
======

Malicious PV guests can escalate their privilege to that of the
hypervisor.

VULNERABLE SYSTEMS
==================

All versions of Xen are vulnerable.

Only x86 systems are vulnerable.  ARM systems are not vulnerable.

Only x86 PV guests can exploit the vulnerability.  x86 HVM and PVH
guests cannot exploit the vulnerability.

Only guests which are assigned a device after domain creation can
exploit this vulnerability.  Guests which are not assigned devices, or
guests assigned devices at domain creation time, cannot exploit this
vulnerability.

MITIGATION
==========

Running only HVM or PVH guests avoids the vulnerability.

Assigning passed-through PCI devices to PV guests at domain creation
time also avoids the vulnerability.

CREDITS
=======

This issue was discovered by Jan Beulich of SUSE.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

xsa285.patch           xen-unstable
xsa285-4.11.patch      Xen 4.7.x - Xen 4.11.x

$ sha256sum xsa285*
0851a4a9120220e2b03eafaf94648077154b6a6f27c29055d3779ccad7684fce  xsa285.meta
9e96d3763158edde8d664c3e26761e63ca6f96bb921e0d7eb68351fe47499bde  xsa285.patch
38ec20b04e0a859abe9850803ae00a33e48591a9949e5287dfa3725f3bd179f3  xsa285-4.11.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl2y178MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZnhUIALWg5ROzP7vpvNOEQDICm/A/AxjPLB6uHnj95bBJ
CxfLZPZyxUak9jmn8bJJrhJBNGS/RFUWrwWm+mHku8ywNKTcHkhGtweS8/GjuMeG
I7hhh/Ux39vs/kPWvy7uydMIMrcIsiG69NWXl6xWMGkcmcmlkJCAi2KHX20Jb5qi
Izy7swNoBFWuuGMaBTg8YJ+XfqQGonemzgviY01EHQqJo/2wPyJjgsbZzu6XlNJc
R3K9K4RDzjtemIEQps9CWA8ilEXxv6DIhVKBx0gNLIrJZPVEh2awLr5Ve2YZIdk6
N5hSP2LFyueDhmKvwrMnrrKF4XqHlfyIsW0l8TXwa/OUTVI=
=6noj
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa285.meta"
Content-Disposition: attachment; filename="xsa285.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAyODUsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xMSIsCiAgICAiNC4xMCIsCiAgICAiNC45IiwK
ICAgICI0LjgiLAogICAgIjQuNyIKICBdLAogICJUcmVlcyI6IFsKICAgICJ4
ZW4iCiAgXSwKICAiUmVjaXBlcyI6IHsKICAgICI0LjEwIjogewogICAgICAi
UmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJs
ZVJlZiI6ICJhMDE2YjhmMjA3YzdhM2ZlOGJkZDJiNmY3YzA4MDAyMGUzZTFj
ODIzIiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAyODQK
ICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAg
ICAgInhzYTI4NS00LjExLnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0K
ICAgICAgfQogICAgfSwKICAgICI0LjExIjogewogICAgICAiUmVjaXBlcyI6
IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICI4
N2Y1MWJmMzY2Y2E3OWI5OGUxZTIwMWJmOWJkN2E5YzE2NDYzMWUyIiwKICAg
ICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAyODQKICAgICAgICAg
IF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTI4
NS00LjExLnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQog
ICAgfSwKICAgICI0LjciOiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAg
ICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogIjcxMGNjMDk2OTcx
MDE5YmMyZTVhOWFhYmI5YWYxYWNjYTBiNWI5ZTciLAogICAgICAgICAgIlBy
ZXJlcXMiOiBbCiAgICAgICAgICAgIDI4NAogICAgICAgICAgXSwKICAgICAg
ICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMjg1LTQuMTEucGF0
Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAg
IjQuOCI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsK
ICAgICAgICAgICJTdGFibGVSZWYiOiAiOTA4ZTc2OGZhZTQ5YThkYjAwODll
NjgxODg2NTIwNzllM2JmYWE2NiIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsK
ICAgICAgICAgICAgMjg0CiAgICAgICAgICBdLAogICAgICAgICAgIlBhdGNo
ZXMiOiBbCiAgICAgICAgICAgICJ4c2EyODUtNC4xMS5wYXRjaCIKICAgICAg
ICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC45Ijogewog
ICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAg
IlN0YWJsZVJlZiI6ICJmNWFjZjk3ZjY2OWM2YmM5NjkxZTAzNzcxYWQwNjcw
M2RhNzdlMGQ1IiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAg
ICAyODQKICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAg
ICAgICAgICAgInhzYTI4NS00LjExLnBhdGNoIgogICAgICAgICAgXQogICAg
ICAgIH0KICAgICAgfQogICAgfSwKICAgICJtYXN0ZXIiOiB7CiAgICAgICJS
ZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxl
UmVmIjogIjI0ZDUyODI1MjdmNDY0NzkwN2IzNTcyODIwYjUzMzVjMTVjZDAz
NTYiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAgICAgICAgIDI4NAog
ICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAg
ICAieHNhMjg1LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAg
fQogICAgfQogIH0KfQ==

--=separator
Content-Type: application/octet-stream; name="xsa285.patch"
Content-Disposition: attachment; filename="xsa285.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBJT01NVS94ODY6IGZpeCB0eXBlIHJlZi1jb3VudGluZyByYWNlIHVwb24g
SU9NTVUgcGFnZSB0YWJsZSBjb25zdHJ1Y3Rpb24KCldoZW4gYXJjaF9pb21t
dV9wb3B1bGF0ZV9wYWdlX3RhYmxlKCkgZ2V0cyBpbnZva2VkIGZvciBhbiBh
bHJlYWR5CnJ1bm5pbmcgZ3Vlc3QsIHNpbXBseSBsb29raW5nIGF0IHBhZ2Ug
dHlwZXMgb25jZSBpc24ndCBlbm91Z2gsIGFzIHRoZXkKbWF5IGNoYW5nZSBh
dCBhbnkgdGltZS4gQWRkIGxvZ2ljIHRvIHJlLWNoZWNrIHRoZSB0eXBlIGFm
dGVyIGhhdmluZwptYXBwZWQgdGhlIHBhZ2UsIHVubWFwcGluZyBpdCBhZ2Fp
biBpZiBuZWVkZWQuCgpUaGlzIGlzIFhTQS0yODUuCgpTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClRlbnRhdGl2ZWx5
LUFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgotLS0KdjQ6IFJlLXdyaXRlIGNvbW1lbnQgKHVzZSBHZW9yZ2Un
cyB3b3JkaW5nKS4KdjM6IFJlLWJhc2UuCnYyOiBSZS1iYXNlLgoKLS0tIGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMKKysrIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMKQEAgLTcwLDYgKzcw
LDI3IEBAIGludCBhcmNoX2lvbW11X3BvcHVsYXRlX3BhZ2VfdGFibGUoc3Ry
dWMKICAgICAgICAgICAgICAgICByYyA9IGlvbW11X21hcChkLCBfZGZuKGdm
biksIF9tZm4obWZuKSwgUEFHRV9PUkRFUl80SywKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBJT01NVUZfcmVhZGFibGUgfCBJT01NVUZfd3Jp
dGFibGUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmZsdXNo
X2ZsYWdzKTsKKworICAgICAgICAgICAgICAgIC8qCisgICAgICAgICAgICAg
ICAgICogV2UgbWF5IGJlIHdvcmtpbmcgYmVoaW5kIHRoZSBiYWNrIG9mIGEg
cnVubmluZyBndWVzdCwgd2hpY2gKKyAgICAgICAgICAgICAgICAgKiBtYXkg
Y2hhbmdlIHRoZSB0eXBlIG9mIGEgcGFnZSBhdCBhbnkgdGltZS4gIFdlIGNh
bid0IHByZXZlbnQKKyAgICAgICAgICAgICAgICAgKiB0aGlzIChmb3IgaW5z
dGFuY2UsIGJ5IGJ1bXBpbmcgdGhlIHR5cGUgY291bnQgd2hpbGUgbWFwcGlu
ZworICAgICAgICAgICAgICAgICAqIHRoZSBwYWdlKSB3aXRob3V0IGNhdXNp
bmcgbGVnaXRpbWF0ZSBndWVzdCB0eXBlLWNoYW5nZQorICAgICAgICAgICAg
ICAgICAqIG9wZXJhdGlvbnMgdG8gZmFpbC4gIFNvIGFmdGVyIGFkZGluZyB0
aGUgcGFnZSB0byB0aGUgSU9NTVUsCisgICAgICAgICAgICAgICAgICogY2hl
Y2sgYWdhaW4gdG8gbWFrZSBzdXJlIHRoaXMgaXMgc3RpbGwgdmFsaWQuICBO
QiB0aGF0IHRoZQorICAgICAgICAgICAgICAgICAqIHdyaXRhYmxlIGVudHJ5
IGluIHRoZSBpb21tdSBpcyBoYXJtbGVzcyB1bnRpbCBsYXRlciwgd2hlbgor
ICAgICAgICAgICAgICAgICAqIHRoZSBhY3R1YWwgZGV2aWNlIGdldHMgYXNz
aWduZWQuCisgICAgICAgICAgICAgICAgICovCisgICAgICAgICAgICAgICAg
aWYgKCAhcmMgJiYgIWlzX2h2bV9kb21haW4oZCkgJiYKKyAgICAgICAgICAg
ICAgICAgICAgICgocGFnZS0+dS5pbnVzZS50eXBlX2luZm8gJiBQR1RfdHlw
ZV9tYXNrKSAhPQorICAgICAgICAgICAgICAgICAgICAgIFBHVF93cml0YWJs
ZV9wYWdlKSApCisgICAgICAgICAgICAgICAgeworICAgICAgICAgICAgICAg
ICAgICByYyA9IGlvbW11X3VubWFwKGQsIF9kZm4oZ2ZuKSwgUEFHRV9PUkRF
Ul80SywgJmZsdXNoX2ZsYWdzKTsKKyAgICAgICAgICAgICAgICAgICAgLyog
SWYgdGhlIHR5cGUgY2hhbmdlZCB5ZXQgYWdhaW4sIHNpbXBseSBmb3JjZSBh
IHJldHJ5LiAqLworICAgICAgICAgICAgICAgICAgICBpZiAoICFyYyAmJiAo
KHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvICYgUEdUX3R5cGVfbWFzaykgPT0K
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBHVF93cml0YWJs
ZV9wYWdlKSApCisgICAgICAgICAgICAgICAgICAgICAgICByYyA9IC1FUkVT
VEFSVDsKKyAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICB9CiAgICAg
ICAgICAgICBpZiAoIHJjICkKICAgICAgICAgICAgIHsK

--=separator
Content-Type: application/octet-stream; name="xsa285-4.11.patch"
Content-Disposition: attachment; filename="xsa285-4.11.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBJT01NVS94ODY6IGZpeCB0eXBlIHJlZi1jb3VudGluZyByYWNlIHVwb24g
SU9NTVUgcGFnZSB0YWJsZSBjb25zdHJ1Y3Rpb24KCldoZW4gYXJjaF9pb21t
dV9wb3B1bGF0ZV9wYWdlX3RhYmxlKCkgZ2V0cyBpbnZva2VkIGZvciBhbiBh
bHJlYWR5CnJ1bm5pbmcgZ3Vlc3QsIHNpbXBseSBsb29raW5nIGF0IHBhZ2Ug
dHlwZXMgb25jZSBpc24ndCBlbm91Z2gsIGFzIHRoZXkKbWF5IGNoYW5nZSBh
dCBhbnkgdGltZS4gQWRkIGxvZ2ljIHRvIHJlLWNoZWNrIHRoZSB0eXBlIGFm
dGVyIGhhdmluZwptYXBwZWQgdGhlIHBhZ2UsIHVubWFwcGluZyBpdCBhZ2Fp
biBpZiBuZWVkZWQuCgpUaGlzIGlzIFhTQS0yODUuCgpTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClRlbnRhdGl2ZWx5
LUFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgoKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lv
bW11LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11
LmMKQEAgLTY4LDYgKzY4LDI3IEBAIGludCBhcmNoX2lvbW11X3BvcHVsYXRl
X3BhZ2VfdGFibGUoc3RydWN0IGRvbWFpbiAqZCkKICAgICAgICAgICAgICAg
ICByYyA9IGhkLT5wbGF0Zm9ybV9vcHMtPm1hcF9wYWdlKGQsIGdmbiwgbWZu
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgSU9NTVVGX3JlYWRhYmxlIHwKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VRl93cml0YWJsZSk7
CisKKyAgICAgICAgICAgICAgICAvKgorICAgICAgICAgICAgICAgICAqIFdl
IG1heSBiZSB3b3JraW5nIGJlaGluZCB0aGUgYmFjayBvZiBhIHJ1bm5pbmcg
Z3Vlc3QsIHdoaWNoCisgICAgICAgICAgICAgICAgICogbWF5IGNoYW5nZSB0
aGUgdHlwZSBvZiBhIHBhZ2UgYXQgYW55IHRpbWUuICBXZSBjYW4ndCBwcmV2
ZW50CisgICAgICAgICAgICAgICAgICogdGhpcyAoZm9yIGluc3RhbmNlLCBi
eSBidW1waW5nIHRoZSB0eXBlIGNvdW50IHdoaWxlIG1hcHBpbmcKKyAgICAg
ICAgICAgICAgICAgKiB0aGUgcGFnZSkgd2l0aG91dCBjYXVzaW5nIGxlZ2l0
aW1hdGUgZ3Vlc3QgdHlwZS1jaGFuZ2UKKyAgICAgICAgICAgICAgICAgKiBv
cGVyYXRpb25zIHRvIGZhaWwuICBTbyBhZnRlciBhZGRpbmcgdGhlIHBhZ2Ug
dG8gdGhlIElPTU1VLAorICAgICAgICAgICAgICAgICAqIGNoZWNrIGFnYWlu
IHRvIG1ha2Ugc3VyZSB0aGlzIGlzIHN0aWxsIHZhbGlkLiAgTkIgdGhhdCB0
aGUKKyAgICAgICAgICAgICAgICAgKiB3cml0YWJsZSBlbnRyeSBpbiB0aGUg
aW9tbXUgaXMgaGFybWxlc3MgdW50aWwgbGF0ZXIsIHdoZW4KKyAgICAgICAg
ICAgICAgICAgKiB0aGUgYWN0dWFsIGRldmljZSBnZXRzIGFzc2lnbmVkLgor
ICAgICAgICAgICAgICAgICAqLworICAgICAgICAgICAgICAgIGlmICggIXJj
ICYmICFpc19odm1fZG9tYWluKGQpICYmCisgICAgICAgICAgICAgICAgICAg
ICAoKHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvICYgUEdUX3R5cGVfbWFzaykg
IT0KKyAgICAgICAgICAgICAgICAgICAgICBQR1Rfd3JpdGFibGVfcGFnZSkg
KQorICAgICAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICAgICAgcmMg
PSBoZC0+cGxhdGZvcm1fb3BzLT51bm1hcF9wYWdlKGQsIGdmbik7CisgICAg
ICAgICAgICAgICAgICAgIC8qIElmIHRoZSB0eXBlIGNoYW5nZWQgeWV0IGFn
YWluLCBzaW1wbHkgZm9yY2UgYSByZXRyeS4gKi8KKyAgICAgICAgICAgICAg
ICAgICAgaWYgKCAhcmMgJiYgKChwYWdlLT51LmludXNlLnR5cGVfaW5mbyAm
IFBHVF90eXBlX21hc2spID09CisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBQR1Rfd3JpdGFibGVfcGFnZSkgKQorICAgICAgICAgICAgICAg
ICAgICAgICAgcmMgPSAtRVJFU1RBUlQ7CisgICAgICAgICAgICAgICAgfQog
ICAgICAgICAgICAgfQogICAgICAgICAgICAgaWYgKCByYyApCiAgICAgICAg
ICAgICB7Cg==

--=separator
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=separator--

