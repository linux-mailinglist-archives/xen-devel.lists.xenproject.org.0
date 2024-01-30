Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 545228425EC
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 14:13:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673351.1047725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUnvf-0000yw-D8; Tue, 30 Jan 2024 13:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673351.1047725; Tue, 30 Jan 2024 13:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUnvf-0000vU-89; Tue, 30 Jan 2024 13:13:31 +0000
Received: by outflank-mailman (input) for mailman id 673351;
 Tue, 30 Jan 2024 13:13:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Uj/=JI=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1rUnve-0000pk-3k
 for xen-devel@lists.xen.org; Tue, 30 Jan 2024 13:13:30 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a8e6048-bf71-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 14:13:28 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1rUnvT-0007fl-FD; Tue, 30 Jan 2024 13:13:19 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1rUnvT-00046x-CL; Tue, 30 Jan 2024 13:13:19 +0000
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
X-Inumbo-ID: 5a8e6048-bf71-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=7/aLK6Od+sHmkaIiXf9KF2yeIUFRYRw8RdaAJCtP6vY=; b=vPhrlCJhSOvk1KlKVfLfaZ1RZ0
	v2S8sEzN3vf+eKWKej9Yhe8lTREFhy8jqaH5Wv9meqcXWxxUCpaKvSvrhXAQqio8hH0KcMrVcmPZ7
	xwOfrpp/E4cesArauTe+4U3gLAgoD/iDMSLNJ1dbMBgps0kxB2gHH92MTJDu0BoaQ+eE=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 449 v2 (CVE-2023-46839) - pci: phantom
 functions assigned to incorrect contexts
Message-Id: <E1rUnvT-00046x-CL@xenbits.xenproject.org>
Date: Tue, 30 Jan 2024 13:13:19 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2023-46839 / XSA-449
                               version 2

         pci: phantom functions assigned to incorrect contexts

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

PCI devices can make use of a functionality called phantom functions,
that when enabled allows the device to generate requests using the IDs
of functions that are otherwise unpopulated.  This allows a device to
extend the number of outstanding requests.

Such phantom functions need an IOMMU context setup, but failure to
setup the context is not fatal when the device is assigned.  Not
failing device assignment when such failure happens can lead to the
primary device being assigned to a guest, while some of the phantom
functions are assigned to a different domain.

IMPACT
======

Under certain circumstances a malicious guest assigned a PCI device
with phantom functions may be able to access memory from a previous
owner of the device.

VULNERABLE SYSTEMS
==================

Systems running all version of Xen are affected.

Only x86 systems are vulnerable.  Arm systems are not vulnerable.

Only systems using PCI passthrough of devices with phantom functions
are affected.

MITIGATION
==========

There is no mitigation (other than not passing through PCI devices
with phantom functions to guests).

CREDITS
=======

This issue was discovered by Roger Pau Monné of XenServer.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa449.patch           xen-unstable - Xen 4.17.x
xsa449-4.16.patch      Xen 4.16.x - Xen 4.15.x

$ sha256sum xsa449*
f77914aae8f917952f66d863d26314875ff96a0d8178f64c94b95825eabbc8a8  xsa449.patch
8f0302c24535ad4c7379469f33afcfdce08ba6db970e0ca1a1bfdd788af6fc6c  xsa449-4.16.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches described above (or others which are
substantially similar) is permitted during the embargo, even on
public-facing systems with untrusted guest users and administrators.

HOWEVER, deployment of the mitigation is NOT permitted (except where
all the affected systems and VMs are administered and used only by
organisations which are members of the Xen Project Security Issues
Predisclosure List).  Specifically, deployment on public cloud systems
is NOT permitted.

This is because removing/replacing of pass-through devices or their
replacement by emulated devices is a guest visible configuration
change, which may lead to re-discovery of the issue.

Deployment of this mitigation is permitted only AFTER the embargo ends.

AND: Distribution of updated software is prohibited (except to other
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmW49O0MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZqVQH/jvY8MptcxkihMhykNkRON6H5aBaY0UQKzbiCVBy
Q0g6FoE59mHIsoIYvPHFFw0BNbxgubWkJRgowRTtwxKay9HWUKo22eKaLpX9I+TX
LUo7KFE02/MRWus6mjGNdaTghC2SzGghqAcwhQcPzuaE1qS31S/iWXTe9u0hITHv
M/zswSWuZK0UaejBy55hd/+L554yZ976coSFGyjqqIuSHvkR6+NFCzTSLp3GHsue
5CI3ouW0fR2aQ/Gu3pXBPgG464rQ9rQptsFW11uZ1Ahw9T4ZYQis9cRNNsM5I+f8
paGiJO2+y9oYoMkKRrkHXVwkhmZJbFzvpq0e4VkgHwZxbIc=
=L484
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa449.patch"
Content-Disposition: attachment; filename="xsa449.patch"
Content-Transfer-Encoding: base64

RnJvbSBkOGI5MmIyMWIyMjQxMjY4NjA5NzhlNGM2MDQzMDJmM2MxZTNiZjc1
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpEYXRlOiBXZWQsIDEzIERlYyAy
MDIzIDE1OjUxOjU5ICswMTAwClN1YmplY3Q6IFtQQVRDSF0gcGNpOiBmYWls
IGRldmljZSBhc3NpZ25tZW50IGlmIHBoYW50b20gZnVuY3Rpb25zIGNhbm5v
dCBiZQogYXNzaWduZWQKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBl
OiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXIt
RW5jb2Rpbmc6IDhiaXQKClRoZSBjdXJyZW50IGJlaGF2aW9yIGlzIHRoYXQg
bm8gZXJyb3IgaXMgcmVwb3J0ZWQgaWYgKHNvbWUpIHBoYW50b20gZnVuY3Rp
b25zCmZhaWwgdG8gYmUgYXNzaWduZWQgZHVyaW5nIGRldmljZSBhZGQgb3Ig
YXNzaWdubWVudCwgc28gdGhlIG9wZXJhdGlvbiBzdWNjZWVkcwpldmVuIGlm
IHNvbWUgcGhhbnRvbSBmdW5jdGlvbnMgYXJlIG5vdCBjb3JyZWN0bHkgc2V0
dXAuCgpUaGlzIGNhbiBsZWFkIHRvIGRldmljZXMgcG9zc2libHkgYmVpbmcg
c3VjY2Vzc2Z1bGx5IGFzc2lnbmVkIHRvIGEgZG9tVSB3aGlsZQpzb21lIG9m
IHRoZSBkZXZpY2UgcGhhbnRvbSBmdW5jdGlvbnMgYXJlIHN0aWxsIGFzc2ln
bmVkIHRvIGRvbTAuICBFdmVuIHdoZW4gdGhlCmRldmljZSBpcyBhc3NpZ25l
ZCBkb21JTyBiZWZvcmUgYmVpbmcgYXNzaWduZWQgdG8gYSBkb21VIHBoYW50
b20gZnVuY3Rpb25zCm1pZ2h0IGZhaWwgdG8gYmUgYXNzaWduZWQgdG8gZG9t
SU8sIGFuZCBhbHNvIGZhaWwgdG8gYmUgYXNzaWduZWQgdG8gdGhlIGRvbVUs
CmxlYXZpbmcgdGhlbSBhc3NpZ25lZCB0byBkb20wLgoKU2luY2UgdGhlIGRl
dmljZSBjYW4gZ2VuZXJhdGUgcmVxdWVzdHMgdXNpbmcgdGhlIElEcyBvZiB0
aG9zZSBwaGFudG9tCmZ1bmN0aW9ucywgZ2l2ZW4gdGhlIHNjZW5hcmlvIGFi
b3ZlIGEgZGV2aWNlIGluIHN1Y2ggc3RhdGUgd291bGQgYmUgaW4gY29udHJv
bApvZiBhIGRvbVUsIGJ1dCBzdGlsbCBjYXBhYmxlIG9mIGdlbmVyYXRpbmcg
dHJhbnNhY3Rpb25zIHRoYXQgdXNlIGEgY29udGV4dCBJRAp0YXJnZXRpbmcg
ZG9tMCBvd25lZCBtZW1vcnkuCgpNb2RpZnkgZGV2aWNlIGFzc2lnbiBpbiBv
cmRlciB0byBhdHRlbXB0IHRvIGRlYXNzaWduIHRoZSBkZXZpY2UgaWYgcGhh
bnRvbQpmdW5jdGlvbnMgZmFpbGVkIHRvIGJlIGFzc2lnbmVkLgoKTm90ZSB0
aGF0IGRldmljZSBhZGRpdGlvbiBpcyBub3QgbW9kaWZpZWQgaW4gdGhlIHNh
bWUgd2F5LCBhcyBpbiB0aGF0IGNhc2UgdGhlCmRldmljZSBpcyBhc3NpZ25l
ZCB0byBhIHRydXN0ZWQgZG9tYWluLCBhbmQgaGVuY2UgcGFydGlhbCBhc3Np
Z24gY2FuIGxlYWQgdG8KZGV2aWNlIG1hbGZ1bmN0aW9uIGJ1dCBub3QgYSBz
ZWN1cml0eSBpc3N1ZS4KClRoaXMgaXMgWFNBLTQ0OSAvIENWRS0yMDIzLTQ2
ODM5CgpGaXhlczogNGU5OTUwZGMxYmQyICgnSU9NTVU6IGFkZCBwaGFudG9t
IGZ1bmN0aW9uIHN1cHBvcnQnKQpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCiB4ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9wY2kuYyB8IDI3ICsrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvcGNpLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYwpp
bmRleCAxNDM5ZDFlZjJiMjYuLjQ3YzBlZWU3YmRjYyAxMDA2NDQKLS0tIGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKKysrIGIveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvcGNpLmMKQEAgLTE0ODgsMTEgKzE0ODgsMTAgQEAg
c3RhdGljIGludCBhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUx
NiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4sIHUzMiBmbGFnKQogCiAgICAgcGRl
di0+ZmF1bHQuY291bnQgPSAwOwogCi0gICAgaWYgKCAocmMgPSBpb21tdV9j
YWxsKGhkLT5wbGF0Zm9ybV9vcHMsIGFzc2lnbl9kZXZpY2UsIGQsIGRldmZu
LAotICAgICAgICAgICAgICAgICAgICAgICAgICBwY2lfdG9fZGV2KHBkZXYp
LCBmbGFnKSkgKQotICAgICAgICBnb3RvIGRvbmU7CisgICAgcmMgPSBpb21t
dV9jYWxsKGhkLT5wbGF0Zm9ybV9vcHMsIGFzc2lnbl9kZXZpY2UsIGQsIGRl
dmZuLCBwY2lfdG9fZGV2KHBkZXYpLAorICAgICAgICAgICAgICAgICAgICBm
bGFnKTsKIAotICAgIGZvciAoIDsgcGRldi0+cGhhbnRvbV9zdHJpZGU7IHJj
ID0gMCApCisgICAgd2hpbGUgKCBwZGV2LT5waGFudG9tX3N0cmlkZSAmJiAh
cmMgKQogICAgIHsKICAgICAgICAgZGV2Zm4gKz0gcGRldi0+cGhhbnRvbV9z
dHJpZGU7CiAgICAgICAgIGlmICggUENJX1NMT1QoZGV2Zm4pICE9IFBDSV9T
TE9UKHBkZXYtPmRldmZuKSApCkBAIC0xNTAzLDggKzE1MDIsMjQgQEAgc3Rh
dGljIGludCBhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUxNiBz
ZWcsIHU4IGJ1cywgdTggZGV2Zm4sIHUzMiBmbGFnKQogCiAgZG9uZToKICAg
ICBpZiAoIHJjICkKLSAgICAgICAgcHJpbnRrKFhFTkxPR19HX1dBUk5JTkcg
IiVwZDogYXNzaWduICglcHApIGZhaWxlZCAoJWQpXG4iLAotICAgICAgICAg
ICAgICAgZCwgJlBDSV9TQkRGKHNlZywgYnVzLCBkZXZmbiksIHJjKTsKKyAg
ICB7CisgICAgICAgIHByaW50ayhYRU5MT0dfR19XQVJOSU5HICIlcGQ6IGFz
c2lnbiAlcyglcHApIGZhaWxlZCAoJWQpXG4iLAorICAgICAgICAgICAgICAg
ZCwgZGV2Zm4gIT0gcGRldi0+ZGV2Zm4gPyAicGhhbnRvbSBmdW5jdGlvbiAi
IDogIiIsCisgICAgICAgICAgICAgICAmUENJX1NCREYoc2VnLCBidXMsIGRl
dmZuKSwgcmMpOworCisgICAgICAgIGlmICggZGV2Zm4gIT0gcGRldi0+ZGV2
Zm4gJiYgZGVhc3NpZ25fZGV2aWNlKGQsIHNlZywgYnVzLCBwZGV2LT5kZXZm
bikgKQorICAgICAgICB7CisgICAgICAgICAgICAvKgorICAgICAgICAgICAg
ICogRGV2aWNlIHdpdGggcGhhbnRvbSBmdW5jdGlvbnMgdGhhdCBmYWlsZWQg
dG8gYm90aCBhc3NpZ24gYW5kCisgICAgICAgICAgICAgKiByb2xsYmFjay4g
IE1hcmsgdGhlIGRldmljZSBhcyBicm9rZW4gYW5kIGNyYXNoIHRoZSB0YXJn
ZXQgZG9tYWluLAorICAgICAgICAgICAgICogYXMgdGhlIHN0YXRlIG9mIHRo
ZSBmdW5jdGlvbnMgYXQgdGhpcyBwb2ludCBpcyB1bmtub3duIGFuZCBYZW4K
KyAgICAgICAgICAgICAqIGhhcyBubyB3YXkgdG8gYXNzZXJ0IGNvbnNpc3Rl
bnQgY29udGV4dCBhc3NpZ25tZW50IGFtb25nIHRoZW0uCisgICAgICAgICAg
ICAgKi8KKyAgICAgICAgICAgIHBkZXYtPmJyb2tlbiA9IHRydWU7CisgICAg
ICAgICAgICBpZiAoICFpc19oYXJkd2FyZV9kb21haW4oZCkgJiYgZCAhPSBk
b21faW8gKQorICAgICAgICAgICAgICAgIGRvbWFpbl9jcmFzaChkKTsKKyAg
ICAgICAgfQorICAgIH0KICAgICAvKiBUaGUgZGV2aWNlIGlzIGFzc2lnbmVk
IHRvIGRvbV9pbyBzbyBtYXJrIGl0IGFzIHF1YXJhbnRpbmVkICovCiAgICAg
ZWxzZSBpZiAoIGQgPT0gZG9tX2lvICkKICAgICAgICAgcGRldi0+cXVhcmFu
dGluZSA9IHRydWU7Ci0tIAoyLjQzLjAKCg==

--=separator
Content-Type: application/octet-stream; name="xsa449-4.16.patch"
Content-Disposition: attachment; filename="xsa449-4.16.patch"
Content-Transfer-Encoding: base64

RnJvbSBlYzVlOGMxNWUzMDM4NWE2MmI3OGYyN2I3NTJhMTljODc5YTkxZWUx
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpEYXRlOiBXZWQsIDEzIERlYyAy
MDIzIDE1OjUxOjU5ICswMTAwClN1YmplY3Q6IFtQQVRDSF0gcGNpOiBmYWls
IGRldmljZSBhc3NpZ25tZW50IGlmIHBoYW50b20gZnVuY3Rpb25zIGNhbm5v
dCBiZQogYXNzaWduZWQKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBl
OiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXIt
RW5jb2Rpbmc6IDhiaXQKClRoZSBjdXJyZW50IGJlaGF2aW9yIGlzIHRoYXQg
bm8gZXJyb3IgaXMgcmVwb3J0ZWQgaWYgKHNvbWUpIHBoYW50b20gZnVuY3Rp
b25zCmZhaWwgdG8gYmUgYXNzaWduZWQgZHVyaW5nIGRldmljZSBhZGQgb3Ig
YXNzaWdubWVudCwgc28gdGhlIG9wZXJhdGlvbiBzdWNjZWVkcwpldmVuIGlm
IHNvbWUgcGhhbnRvbSBmdW5jdGlvbnMgYXJlIG5vdCBjb3JyZWN0bHkgc2V0
dXAuCgpUaGlzIGNhbiBsZWFkIHRvIGRldmljZXMgcG9zc2libHkgYmVpbmcg
c3VjY2Vzc2Z1bGx5IGFzc2lnbmVkIHRvIGEgZG9tVSB3aGlsZQpzb21lIG9m
IHRoZSBkZXZpY2UgcGhhbnRvbSBmdW5jdGlvbnMgYXJlIHN0aWxsIGFzc2ln
bmVkIHRvIGRvbTAuICBFdmVuIHdoZW4gdGhlCmRldmljZSBpcyBhc3NpZ25l
ZCBkb21JTyBiZWZvcmUgYmVpbmcgYXNzaWduZWQgdG8gYSBkb21VIHBoYW50
b20gZnVuY3Rpb25zCm1pZ2h0IGZhaWwgdG8gYmUgYXNzaWduZWQgdG8gZG9t
SU8sIGFuZCBhbHNvIGZhaWwgdG8gYmUgYXNzaWduZWQgdG8gdGhlIGRvbVUs
CmxlYXZpbmcgdGhlbSBhc3NpZ25lZCB0byBkb20wLgoKU2luY2UgdGhlIGRl
dmljZSBjYW4gZ2VuZXJhdGUgcmVxdWVzdHMgdXNpbmcgdGhlIElEcyBvZiB0
aG9zZSBwaGFudG9tCmZ1bmN0aW9ucywgZ2l2ZW4gdGhlIHNjZW5hcmlvIGFi
b3ZlIGEgZGV2aWNlIGluIHN1Y2ggc3RhdGUgd291bGQgYmUgaW4gY29udHJv
bApvZiBhIGRvbVUsIGJ1dCBzdGlsbCBjYXBhYmxlIG9mIGdlbmVyYXRpbmcg
dHJhbnNhY3Rpb25zIHRoYXQgdXNlIGEgY29udGV4dCBJRAp0YXJnZXRpbmcg
ZG9tMCBvd25lZCBtZW1vcnkuCgpNb2RpZnkgZGV2aWNlIGFzc2lnbiBpbiBv
cmRlciB0byBhdHRlbXB0IHRvIGRlYXNzaWduIHRoZSBkZXZpY2UgaWYgcGhh
bnRvbQpmdW5jdGlvbnMgZmFpbGVkIHRvIGJlIGFzc2lnbmVkLgoKTm90ZSB0
aGF0IGRldmljZSBhZGRpdGlvbiBpcyBub3QgbW9kaWZpZWQgaW4gdGhlIHNh
bWUgd2F5LCBhcyBpbiB0aGF0IGNhc2UgdGhlCmRldmljZSBpcyBhc3NpZ25l
ZCB0byBhIHRydXN0ZWQgZG9tYWluLCBhbmQgaGVuY2UgcGFydGlhbCBhc3Np
Z24gY2FuIGxlYWQgdG8KZGV2aWNlIG1hbGZ1bmN0aW9uIGJ1dCBub3QgYSBz
ZWN1cml0eSBpc3N1ZS4KClRoaXMgaXMgWFNBLTQ0OSAvIENWRS0yMDIzLTQ2
ODM5CgpGaXhlczogNGU5OTUwZGMxYmQyICgnSU9NTVU6IGFkZCBwaGFudG9t
IGZ1bmN0aW9uIHN1cHBvcnQnKQpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCiB4ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9wY2kuYyB8IDIzICsrKysrKysrKysrKysrKysrKy0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9wY2kuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCmluZGV4
IGE5ZGE3MzY3YzI5Yy4uNmZjMjdlN2VkZTQwIDEwMDY0NAotLS0gYS94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYworKysgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9wY2kuYwpAQCAtMTQ0OCwxMCArMTQ0OCw5IEBAIHN0YXRp
YyBpbnQgYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCB1MTYgc2Vn
LCB1OCBidXMsIHU4IGRldmZuLCB1MzIgZmxhZykKIAogICAgIHBkZXYtPmZh
dWx0LmNvdW50ID0gMDsKIAotICAgIGlmICggKHJjID0gaGQtPnBsYXRmb3Jt
X29wcy0+YXNzaWduX2RldmljZShkLCBkZXZmbiwgcGNpX3RvX2RldihwZGV2
KSwgZmxhZykpICkKLSAgICAgICAgZ290byBkb25lOworICAgIHJjID0gaGQt
PnBsYXRmb3JtX29wcy0+YXNzaWduX2RldmljZShkLCBkZXZmbiwgcGNpX3Rv
X2RldihwZGV2KSwgZmxhZyk7CiAKLSAgICBmb3IgKCA7IHBkZXYtPnBoYW50
b21fc3RyaWRlOyByYyA9IDAgKQorICAgIHdoaWxlICggcGRldi0+cGhhbnRv
bV9zdHJpZGUgJiYgIXJjICkKICAgICB7CiAgICAgICAgIGRldmZuICs9IHBk
ZXYtPnBoYW50b21fc3RyaWRlOwogICAgICAgICBpZiAoIFBDSV9TTE9UKGRl
dmZuKSAhPSBQQ0lfU0xPVChwZGV2LT5kZXZmbikgKQpAQCAtMTQ2MSw4ICsx
NDYwLDIyIEBAIHN0YXRpYyBpbnQgYXNzaWduX2RldmljZShzdHJ1Y3QgZG9t
YWluICpkLCB1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLCB1MzIgZmxhZykK
IAogIGRvbmU6CiAgICAgaWYgKCByYyApCi0gICAgICAgIHByaW50ayhYRU5M
T0dfR19XQVJOSU5HICIlcGQ6IGFzc2lnbiAoJXBwKSBmYWlsZWQgKCVkKVxu
IiwKLSAgICAgICAgICAgICAgIGQsICZQQ0lfU0JERjMoc2VnLCBidXMsIGRl
dmZuKSwgcmMpOworICAgIHsKKyAgICAgICAgcHJpbnRrKFhFTkxPR19HX1dB
Uk5JTkcgIiVwZDogYXNzaWduICVzKCVwcCkgZmFpbGVkICglZClcbiIsCisg
ICAgICAgICAgICAgICBkLCBkZXZmbiAhPSBwZGV2LT5kZXZmbiA/ICJwaGFu
dG9tIGZ1bmN0aW9uICIgOiAiIiwKKyAgICAgICAgICAgICAgICZQQ0lfU0JE
RjMoc2VnLCBidXMsIGRldmZuKSwgcmMpOworCisgICAgICAgIGlmICggZGV2
Zm4gIT0gcGRldi0+ZGV2Zm4gJiYKKyAgICAgICAgICAgICBkZWFzc2lnbl9k
ZXZpY2UoZCwgc2VnLCBidXMsIHBkZXYtPmRldmZuKSAmJgorICAgICAgICAg
ICAgICFpc19oYXJkd2FyZV9kb21haW4oZCkgJiYgZCAhPSBkb21faW8gKQor
ICAgICAgICAgICAgLyoKKyAgICAgICAgICAgICAqIERldmljZSB3aXRoIHBo
YW50b20gZnVuY3Rpb25zIHRoYXQgZmFpbGVkIHRvIGJvdGggYXNzaWduIGFu
ZAorICAgICAgICAgICAgICogcm9sbGJhY2suICBDcmFzaCB0aGUgdGFyZ2V0
IGRvbWFpbiwgYXMgdGhlIHN0YXRlIG9mIHRoZQorICAgICAgICAgICAgICog
ZnVuY3Rpb25zIGF0IHRoaXMgcG9pbnQgaXMgdW5rbm93biBhbmQgWGVuIGhh
cyBubyB3YXkgdG8gYXNzZXJ0CisgICAgICAgICAgICAgKiBjb25zaXN0ZW50
IGNvbnRleHQgYXNzaWdubWVudCBhbW9uZyB0aGVtLgorICAgICAgICAgICAg
ICovCisgICAgICAgICAgICBkb21haW5fY3Jhc2goZCk7CisgICAgfQogICAg
IC8qIFRoZSBkZXZpY2UgaXMgYXNzaWduZWQgdG8gZG9tX2lvIHNvIG1hcmsg
aXQgYXMgcXVhcmFudGluZWQgKi8KICAgICBlbHNlIGlmICggZCA9PSBkb21f
aW8gKQogICAgICAgICBwZGV2LT5xdWFyYW50aW5lID0gdHJ1ZTsKLS0gCjIu
NDMuMAoK

--=separator--

