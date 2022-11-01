Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0589614A35
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 13:01:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433478.686466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oppwy-0005VS-1u; Tue, 01 Nov 2022 12:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433478.686466; Tue, 01 Nov 2022 12:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oppwx-0005SF-Mb; Tue, 01 Nov 2022 12:00:59 +0000
Received: by outflank-mailman (input) for mailman id 433478;
 Tue, 01 Nov 2022 12:00:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lfjo=3B=xenbits.xen.org=jgross@srs-se1.protection.inumbo.net>)
 id 1oppwv-0004vc-SF
 for xen-devel@lists.xen.org; Tue, 01 Nov 2022 12:00:58 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6e218a4-59dc-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 13:00:55 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@xenbits.xen.org>)
 id 1oppwj-0005YG-On; Tue, 01 Nov 2022 12:00:45 +0000
Received: from jgross by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <jgross@xenbits.xen.org>)
 id 1oppwj-0005Sr-O2; Tue, 01 Nov 2022 12:00:45 +0000
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
X-Inumbo-ID: d6e218a4-59dc-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=LulF0SjJkPbTMdPOIUhIbTFk50qgFW4z7xiLfy7d2C0=; b=5VdXa1F/bsRS12I2XWPcJY13oK
	zNgx2hyEW7Cj5F0DQpSZTrpqa0snkIk15RQHCR3JSM4dITRV9MY8WyXI4YILPhmMccdxN1V0QLTDy
	addMTGCGxOWhwCcnNis0EnQcN7X6BetBfo5qgIhtT5GYUEo3myJl/0nhHu7mVfGF+PVA=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 417 v2 (CVE-2022-42320) - Xenstore: Guests
 can get access to Xenstore nodes of deleted domains
Message-Id: <E1oppwj-0005Sr-O2@xenbits.xenproject.org>
Date: Tue, 01 Nov 2022 12:00:45 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2022-42320 / XSA-417
                               version 2

 Xenstore: Guests can get access to Xenstore nodes of deleted domains

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

Access rights of Xenstore nodes are per domid.  When a domain is gone,
there might be Xenstore nodes left with access rights containing the
domid of the removed domain.  This is normally no problem, as those
access right entries will be corrected when such a node is written
later.

There is a small time window when a new domain is created, where the
access rights of a past domain with the same domid as the new one will
be regarded to be still valid, leading to the new domain being able to
get access to a node which was meant to be accessible by the removed
domain.  For this to happen another domain needs to write the node
before the newly created domain is being introduced to Xenstore by
dom0.

IMPACT
======

In some circumstances, it might be possible for a new guest domain to
access resources belonging to a previous domain.  The impact would
depend on the software in use and the configuration, but might include
any of denial of service, information leak, or privilege escalation.

VULNERABLE SYSTEMS
==================

All versions of Xen are in principle vulnerable.

Only systems running the C variant of Xenstore (xenstored or xenstore-
stubdom) are vulnerable.

Systems using the Ocaml variant of Xenstore (oxenstored) are not vulnerable.

Vulnerable systems are only those running software where one domain is
granted access to another's xenstore nodes, without complete cleanup
of those nodes on domain destruction.  No such software is enabled in
default configurations of upstream Xen.

Therefore upstream Xen, without additional management software (in
host or guest(s)), is not vulnerable in the default (host and guest)
configuration.

MITIGATION
==========

Running oxenstored instead of xenstored will avoid the vulnerability.

CREDITS
=======

This issue was discovered by Jürgen Groß of SUSE.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa417.patch           xen-unstable, Xen 4.16.x - 4.13.x

$ sha256sum xsa417*
62b37c77cc97374685d1df31da57809ddd6c9ad2272fb3380555e81dc85f0cd8  xsa417.meta
b0c3bdc1723ead350c86b5a42f5e28445fa331ba5f463d82385fdaeb80119b30  xsa417.patch
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

iQE/BAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmNg+6gMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZCj8H93lp5U3OwMNzzrurILUGMY/N6rcGnuoWqa91FslA
C7PSK+A51TvrODUi7bo3YQ1mImW75NmyasMey7/I78DUdHuRwj4L9XOI+W9J5ePk
oSVBja6jUC6LawLxj21DBP1rhufqVnJ0lOsO6rK+v/awJOkANH1nstUksqvxPmKa
ESMDudyo4+2wWH/DKizq6FYexyEQ/rlCktWZTQi1T1PXFX5xMOk+dzd+SSxifX/7
BSLc/HdRzNt1UemKtKvw7KJqCys0Sw8EWAwu6vpQCqczNbkM8CmhzapSWc+IyCZ3
RMOxk9OuW8+6/9D0s4oqWJ7lV4UfW1kZ8euPeybEhLXo5w==
=Kkzx
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa417.meta"
Content-Disposition: attachment; filename="xsa417.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiA0MTcsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNiIsCiAgICAiNC4xNSIsCiAgICAiNC4xNCIs
CiAgICAiNC4xMyIKICBdLAogICJUcmVlcyI6IFsKICAgICJ4ZW4iCiAgXSwK
ICAiUmVjaXBlcyI6IHsKICAgICI0LjEzIjogewogICAgICAiUmVjaXBlcyI6
IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICIw
YmU2M2MyNjE1YjI2ODAwMWY3Y2M5YjcyY2UyNWVlZDk1MjczN2RjIiwKICAg
ICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICA0MTQsCiAgICAgICAg
ICAgIDQxNSwKICAgICAgICAgICAgMzI2LAogICAgICAgICAgICA0MTYKICAg
ICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAg
InhzYTQxNy5wYXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0K
ICAgIH0sCiAgICAiNC4xNCI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAg
ICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiMDE2ZGU2Mjc0
N2IyNmVhZDVhNWM3NjNiNjQwZmU4ZTIwNWNkMTgyYiIsCiAgICAgICAgICAi
UHJlcmVxcyI6IFsKICAgICAgICAgICAgNDE0LAogICAgICAgICAgICA0MTUs
CiAgICAgICAgICAgIDMyNiwKICAgICAgICAgICAgNDE2CiAgICAgICAgICBd
LAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2E0MTcu
cGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAog
ICAgIjQuMTUiOiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4i
OiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogIjgxNjU4MGFmZGQxNzMwZDRm
ODVmNjQ0NzdhMjQyYTQzOWFmMWNkZjgiLAogICAgICAgICAgIlByZXJlcXMi
OiBbCiAgICAgICAgICAgIDQxNCwKICAgICAgICAgICAgNDE1LAogICAgICAg
ICAgICAzMjYsCiAgICAgICAgICAgIDQxNgogICAgICAgICAgXSwKICAgICAg
ICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhNDE3LnBhdGNoIgog
ICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICI0LjE2
IjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAg
ICAgICAgIlN0YWJsZVJlZiI6ICIxYmNlN2ZiMWY3MDJkYTRmN2E3NDljNmYx
NDU3ZWNiMjBiZjc0ZmNhIiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAg
ICAgICAgICA0MTIsCiAgICAgICAgICAgIDQxNCwKICAgICAgICAgICAgNDE1
LAogICAgICAgICAgICAzMjYsCiAgICAgICAgICAgIDQxNgogICAgICAgICAg
XSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhNDE3
LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwK
ICAgICJtYXN0ZXIiOiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4
ZW4iOiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogImNjNDc0N2JlOGJhMTU3
YTNiMzEwOTIxZTllZTA3ZmI4NTQ1YWEyMDYiLAogICAgICAgICAgIlByZXJl
cXMiOiBbCiAgICAgICAgICAgIDQxMiwKICAgICAgICAgICAgNDE0LAogICAg
ICAgICAgICA0MTUsCiAgICAgICAgICAgIDMyNiwKICAgICAgICAgICAgNDE2
CiAgICAgICAgICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAg
ICAgICJ4c2E0MTcucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAg
ICB9CiAgICB9CiAgfQp9

--=separator
Content-Type: application/octet-stream; name="xsa417.patch"
Content-Disposition: attachment; filename="xsa417.patch"
Content-Transfer-Encoding: base64

RnJvbSA2N2Q1ZWNkNjA5YjhmMTIzNDZlYWRiNDBlNTQ3Y2Q3ZTAxZDgyNWRj
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CkRhdGU6IFR1ZSwgMTMgU2VwIDIwMjIgMDc6
MzU6MTAgKzAyMDAKU3ViamVjdDogdG9vbHMveGVuc3RvcmU6IGZpeCBjaGVj
a2luZyBub2RlIHBlcm1pc3Npb25zCgpUb2RheSBjaGtfZG9tYWluX2dlbmVy
YXRpb24oKSBpcyBiZWluZyB1c2VkIHRvIGNoZWNrIHdoZXRoZXIgYSBub2Rl
CnBlcm1pc3Npb24gZW50cnkgaXMgc3RpbGwgdmFsaWQgb3Igd2hldGhlciBp
dCBpcyByZWZlcnJpbmcgdG8gYSBkb21haW4Kbm8gbG9uZ2VyIGV4aXN0aW5n
LiBUaGlzIGlzIGRvbmUgYnkgY29tcGFyaW5nIHRoZSBub2RlJ3MgYW5kIHRo
ZQpkb21haW4ncyBnZW5lcmF0aW9uIGNvdW50LgoKSW4gY2FzZSBubyBzdHJ1
Y3QgZG9tYWluIGlzIGV4aXN0aW5nIGZvciBhIGNoZWNrZWQgZG9tYWluLCBi
dXQgdGhlCmRvbWFpbiBpdHNlbGYgaXMgdmFsaWQsIGNoa19kb21haW5fZ2Vu
ZXJhdGlvbigpIGFzc3VtZXMgaXQgaXMgYmVpbmcKY2FsbGVkIGR1ZSB0byB0
aGUgZmlyc3Qgbm9kZSBjcmVhdGVkIGZvciBhIG5ldyBkb21haW4gYW5kIGl0
IHdpbGwKcmV0dXJuIHN1Y2Nlc3MuCgpUaGlzIG1pZ2h0IGJlIHdyb25nIGlu
IGNhc2UgdGhlIGNoZWNrZWQgcGVybWlzc2lvbiBpcyByZWxhdGVkIHRvIGFu
Cm9sZCBkb21haW4sIHdoaWNoIGhhcyBqdXN0IGJlZW4gcmVwbGFjZWQgd2l0
aCBhIG5ldyBkb21haW4gdXNpbmcgdGhlCnNhbWUgZG9taWQuCgpGaXggdGhh
dCBieSBsZXR0aW5nIGNoa19kb21haW5fZ2VuZXJhdGlvbigpIGZhaWwgaW4g
Y2FzZSBhIHN0cnVjdApkb21haW4gaXNuJ3QgZm91bmQuIEluIG9yZGVyIHRv
IGNvdmVyIHRoZSBjYXNlIG9mIHRoZSBmaXJzdCBub2RlIGZvcgphIG5ldyBk
b21haW4gdHJ5IHRvIGFsbG9jYXRlIHRoZSBuZWVkZWQgc3RydWN0IGRvbWFp
biBleHBsaWNpdGx5IHdoZW4KcHJvY2Vzc2luZyB0aGUgcmVsYXRlZCBTRVRf
UEVSTVMgY29tbWFuZC4gSW4gY2FzZSBhIHJlZmVyZW5jZWQgZG9tYWluCmlz
bid0IGV4aXN0aW5nLCBmbGFnIHRoZSByZWxhdGVkIHBlcm1pc3Npb24gdG8g
YmUgaWdub3JlZCByaWdodCBhd2F5LgoKVGhpcyBpcyBYU0EtNDE3IC8gQ1ZF
LTIwMjItNDIzMjAuCgpSZXBvcnRlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGpn
cmFsbEBhbWF6b24uY29tPgoKZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3Jl
L3hlbnN0b3JlZF9jb3JlLmMgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRf
Y29yZS5jCmluZGV4IDY2YmJlYWY2YmZiMC4uYTBjMTc2ZmEyMDNlIDEwMDY0
NAotLS0gYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jCisrKyBi
L3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMKQEAgLTE3NTMsNiAr
MTc1MywxMSBAQCBzdGF0aWMgaW50IGRvX3NldF9wZXJtcyhjb25zdCB2b2lk
ICpjdHgsIHN0cnVjdCBjb25uZWN0aW9uICpjb25uLAogCWlmICgheHNfc3Ry
aW5nc190b19wZXJtcyhwZXJtcy5wLCBwZXJtcy5udW0sIHBlcm1zdHIpKQog
CQlyZXR1cm4gZXJybm87CiAKKwlpZiAoZG9tYWluX2FsbG9jX3Blcm1yZWZz
KCZwZXJtcykgPCAwKQorCQlyZXR1cm4gRU5PTUVNOworCWlmIChwZXJtcy5w
WzBdLnBlcm1zICYgWFNfUEVSTV9JR05PUkUpCisJCXJldHVybiBFTk9FTlQ7
CisKIAkvKiBGaXJzdCBhcmcgaXMgbm9kZSBuYW1lLiAqLwogCWlmIChzdHJz
dGFydHMoaW4tPmJ1ZmZlciwgIkAiKSkgewogCQlpZiAoc2V0X3Blcm1zX3Nw
ZWNpYWwoY29ubiwgaW4tPmJ1ZmZlciwgJnBlcm1zKSkKZGlmZiAtLWdpdCBh
L3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uYyBiL3Rvb2xzL3hl
bnN0b3JlL3hlbnN0b3JlZF9kb21haW4uYwppbmRleCBiOWZmNGRlZDgzNjAu
Ljk4YjQwMWZkZWMzMCAxMDA2NDQKLS0tIGEvdG9vbHMveGVuc3RvcmUveGVu
c3RvcmVkX2RvbWFpbi5jCisrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3Jl
ZF9kb21haW4uYwpAQCAtOTA3LDcgKzkwNyw2IEBAIGludCBkb21haW5fZW50
cnlfaW5jKHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCBzdHJ1Y3Qgbm9kZSAq
bm9kZSkKICAqIGNvdW50ICh1c2VkIGZvciB0ZXN0aW5nIHdoZXRoZXIgYSBu
b2RlIHBlcm1pc3Npb24gaXMgb2xkZXIgdGhhbiBhIGRvbWFpbikuCiAgKgog
ICogUmV0dXJuIHZhbHVlczoKLSAqIC0xOiBlcnJvcgogICogIDA6IGRvbWFp
biBoYXMgaGlnaGVyIGdlbmVyYXRpb24gY291bnQgKGl0IGlzIHlvdW5nZXIg
dGhhbiBhIG5vZGUgd2l0aCB0aGUKICAqICAgICBnaXZlbiBjb3VudCksIG9y
IGRvbWFpbiBpc24ndCBleGlzdGluZyBhbnkgbG9uZ2VyCiAgKiAgMTogZG9t
YWluIGlzIG9sZGVyIHRoYW4gdGhlIG5vZGUKQEAgLTkxNSwyMCArOTE0LDM4
IEBAIGludCBkb21haW5fZW50cnlfaW5jKHN0cnVjdCBjb25uZWN0aW9uICpj
b25uLCBzdHJ1Y3Qgbm9kZSAqbm9kZSkKIHN0YXRpYyBpbnQgY2hrX2RvbWFp
bl9nZW5lcmF0aW9uKHVuc2lnbmVkIGludCBkb21pZCwgdWludDY0X3QgZ2Vu
KQogewogCXN0cnVjdCBkb21haW4gKmQ7Ci0JeGNfZG9taW5mb190IGRvbWlu
Zm87CiAKIAlpZiAoIXhjX2hhbmRsZSAmJiBkb21pZCA9PSAwKQogCQlyZXR1
cm4gMTsKIAogCWQgPSBmaW5kX2RvbWFpbl9zdHJ1Y3QoZG9taWQpOwotCWlm
IChkKQotCQlyZXR1cm4gKGQtPmdlbmVyYXRpb24gPD0gZ2VuKSA/IDEgOiAw
OwogCi0JaWYgKCFnZXRfZG9tYWluX2luZm8oZG9taWQsICZkb21pbmZvKSkK
LQkJcmV0dXJuIDA7CisJcmV0dXJuIChkICYmIGQtPmdlbmVyYXRpb24gPD0g
Z2VuKSA/IDEgOiAwOworfQogCi0JZCA9IGFsbG9jX2RvbWFpbihOVUxMLCBk
b21pZCk7Ci0JcmV0dXJuIGQgPyAxIDogLTE7CisvKgorICogQWxsb2NhdGUg
YWxsIG1pc3Npbmcgc3RydWN0IGRvbWFpbiByZWZlcmVuY2VkIGJ5IGEgcGVy
bWlzc2lvbiBzZXQuCisgKiBBbnkgcGVybWlzc2lvbiBlbnRyaWVzIGZvciBu
b3QgZXhpc3RpbmcgZG9tYWlucyB3aWxsIGJlIG1hcmtlZCB0byBiZQorICog
aWdub3JlZC4KKyAqLworaW50IGRvbWFpbl9hbGxvY19wZXJtcmVmcyhzdHJ1
Y3Qgbm9kZV9wZXJtcyAqcGVybXMpCit7CisJdW5zaWduZWQgaW50IGksIGRv
bWlkOworCXN0cnVjdCBkb21haW4gKmQ7CisJeGNfZG9taW5mb190IGRvbWlu
Zm87CisKKwlmb3IgKGkgPSAwOyBpIDwgcGVybXMtPm51bTsgaSsrKSB7CisJ
CWRvbWlkID0gcGVybXMtPnBbaV0uaWQ7CisJCWQgPSBmaW5kX2RvbWFpbl9z
dHJ1Y3QoZG9taWQpOworCQlpZiAoIWQpIHsKKwkJCWlmICghZ2V0X2RvbWFp
bl9pbmZvKGRvbWlkLCAmZG9taW5mbykpCisJCQkJcGVybXMtPnBbaV0ucGVy
bXMgfD0gWFNfUEVSTV9JR05PUkU7CisJCQllbHNlIGlmICghYWxsb2NfZG9t
YWluKE5VTEwsIGRvbWlkKSkKKwkJCQlyZXR1cm4gRU5PTUVNOworCQl9CisJ
fQorCisJcmV0dXJuIDA7CiB9CiAKIC8qCkBAIC05NDEsOCArOTU4LDYgQEAg
aW50IGRvbWFpbl9hZGp1c3Rfbm9kZV9wZXJtcyhzdHJ1Y3QgY29ubmVjdGlv
biAqY29ubiwgc3RydWN0IG5vZGUgKm5vZGUpCiAJaW50IHJldDsKIAogCXJl
dCA9IGNoa19kb21haW5fZ2VuZXJhdGlvbihub2RlLT5wZXJtcy5wWzBdLmlk
LCBub2RlLT5nZW5lcmF0aW9uKTsKLQlpZiAocmV0IDwgMCkKLQkJcmV0dXJu
IGVycm5vOwogCiAJLyogSWYgdGhlIG93bmVyIGRvZXNuJ3QgZXhpc3QgYW55
IGxvbmdlciBnaXZlIGl0IHRvIHByaXYgZG9tYWluLiAqLwogCWlmICghcmV0
KSB7CkBAIC05NTksOCArOTc0LDYgQEAgaW50IGRvbWFpbl9hZGp1c3Rfbm9k
ZV9wZXJtcyhzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwgc3RydWN0IG5vZGUg
Km5vZGUpCiAJCQljb250aW51ZTsKIAkJcmV0ID0gY2hrX2RvbWFpbl9nZW5l
cmF0aW9uKG5vZGUtPnBlcm1zLnBbaV0uaWQsCiAJCQkJCSAgICBub2RlLT5n
ZW5lcmF0aW9uKTsKLQkJaWYgKHJldCA8IDApCi0JCQlyZXR1cm4gZXJybm87
CiAJCWlmICghcmV0KQogCQkJbm9kZS0+cGVybXMucFtpXS5wZXJtcyB8PSBY
U19QRVJNX0lHTk9SRTsKIAl9CmRpZmYgLS1naXQgYS90b29scy94ZW5zdG9y
ZS94ZW5zdG9yZWRfZG9tYWluLmggYi90b29scy94ZW5zdG9yZS94ZW5zdG9y
ZWRfZG9tYWluLmgKaW5kZXggMjA5NDQyMTkwOTExLi43ZmUwYTIxZDllNDUg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4u
aAorKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmgKQEAg
LTYzLDYgKzYzLDcgQEAgYm9vbCBkb21haW5faXNfdW5wcml2aWxlZ2VkKHN0
cnVjdCBjb25uZWN0aW9uICpjb25uKTsKIAogLyogUmVtb3ZlIG5vZGUgcGVy
bWlzc2lvbnMgZm9yIG5vIGxvbmdlciBleGlzdGluZyBkb21haW5zLiAqLwog
aW50IGRvbWFpbl9hZGp1c3Rfbm9kZV9wZXJtcyhzdHJ1Y3QgY29ubmVjdGlv
biAqY29ubiwgc3RydWN0IG5vZGUgKm5vZGUpOworaW50IGRvbWFpbl9hbGxv
Y19wZXJtcmVmcyhzdHJ1Y3Qgbm9kZV9wZXJtcyAqcGVybXMpOwogCiAvKiBR
dW90YSBtYW5pcHVsYXRpb24gKi8KIGludCBkb21haW5fZW50cnlfaW5jKHN0
cnVjdCBjb25uZWN0aW9uICpjb25uLCBzdHJ1Y3Qgbm9kZSAqKTsK

--=separator--

