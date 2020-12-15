Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8676D2DAD39
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 13:29:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.53314.93025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp9SK-0008PM-8g; Tue, 15 Dec 2020 12:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 53314.93025; Tue, 15 Dec 2020 12:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp9SK-0008OJ-1d; Tue, 15 Dec 2020 12:29:28 +0000
Received: by outflank-mailman (input) for mailman id 53314;
 Tue, 15 Dec 2020 12:29:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tdgx=FT=xenbits.xen.org=gdunlap@srs-us1.protection.inumbo.net>)
 id 1kp9KB-0004t1-LS
 for xen-devel@lists.xen.org; Tue, 15 Dec 2020 12:21:03 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3f95b74-d345-4c82-b3f6-7b8e6c0f5962;
 Tue, 15 Dec 2020 12:20:25 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gdunlap@xenbits.xen.org>)
 id 1kp9JU-0005hi-Ky; Tue, 15 Dec 2020 12:20:20 +0000
Received: from gdunlap by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <gdunlap@xenbits.xen.org>)
 id 1kp9JU-00073K-Jw; Tue, 15 Dec 2020 12:20:20 +0000
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
X-Inumbo-ID: a3f95b74-d345-4c82-b3f6-7b8e6c0f5962
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=92GPzvwfdZ6eh4w1oyvyPZtRd6zHFwxAqkbJrFVbRPo=; b=sjFhDTGswDILlEuD2Dg0AJUWxL
	8rnZyq8A/MpUna7Iwg1q5yv5xmRIDs0JAjDNZNSBpv4TgWzcxH6xew643E8duO241jA56Tp3WnuiD
	fUdcqAgNfvyVlQHN7PJnhD5fGZ4/QRWnr5inLJxsBYeINspuu0JQD2JLyVl3r+MvwZYs=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 330 v3 (CVE-2020-29485) - oxenstored memory
 leak in reset_watches
Message-Id: <E1kp9JU-00073K-Jw@xenbits.xenproject.org>
Date: Tue, 15 Dec 2020 12:20:20 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2020-29485 / XSA-330
                               version 3

                oxenstored memory leak in reset_watches

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

When acting upon a guest XS_RESET_WATCHES request, not all tracking
information is freed.

IMPACT
======

A guest can cause unbounded memory usage in oxenstored.  This can lead
to a system-wide DoS.

VULNERABLE SYSTEMS
==================

All version of Xen since 4.6 are vulnerable.

Only systems using the Ocaml Xenstored implementation are vulnerable.
Systems using the C Xenstored implementaion are not vulnerable.

MITIGATION
==========

There are no mitigations.

Changing to use of C xenstored would avoid this vulnerability.  However,
given the other vulnerabilities in both versions of xenstored being
reported at this time, changing xenstored implementation is not a
recommended approach to mitigation of individual issues.

CREDITS
=======

This issue was discovered by Edwin Török of Citrix.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa330.patch           Xen 4.12 - xen-unstable
xsa330-4.11.patch      Xen 4.10 - 4.11

$ sha256sum xsa330*
efd95a883f227d63366a745b6007aa0c59cc612573235ba72108c8f89ecef7f3  xsa330.meta
1cda4fd8c91ceb132c5770d90375626521025e078c6ac1b53b68d78815997722  xsa330.patch
87284eaf6df92a78476f49a5587e28e1f5b9ca16ace5ad2e10b4b13abf50e034  xsa330-4.11.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl/Yqd8MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZXCMH/i2lw6MRNCz3BFqan9PSE0pWGn1LxMpd/kSV0/eH
Y/TjXaCNcvK11d4fc1x8a0Wc3A/bu3uACpFFrcRuWgG5QkMKZRyOkQv7FwW1VaVd
u2NGJVetpfiDZhcSorAdS7CCJZEEt+3a7iFjH9cZKVEwZcS5Cq82UVog05MWLE80
pJ5Cid7K/urD1Zu/v3AGWESuaVYwdvwn6RcePVAs8b0sM2osYXBuKeMwOe1bXaBO
D5qPLEfLfOgLrXi77ssUzfmfRY6Z+LuQAhfug6Lv/n06Y9lyNXewmYalsnobGQSI
FTzWs0QVmFBMY/PEuZv3cRrihTs2ygu9HW7OLO2Bt+VKfcg=
=MqjK
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa330.meta"
Content-Disposition: attachment; filename="xsa330.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzMzAsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNCIsCiAgICAiNC4xMyIsCiAgICAiNC4xMiIs
CiAgICAiNC4xMSIsCiAgICAiNC4xMCIKICBdLAogICJUcmVlcyI6IFsKICAg
ICJ4ZW4iCiAgXSwKICAiUmVjaXBlcyI6IHsKICAgICI0LjEwIjogewogICAg
ICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0
YWJsZVJlZiI6ICIxZDcyZDk5MTVlZGZmMGRkNDFmNjAxYmJiMGIxZjgzYzAy
ZmYxNjg5IiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAz
NTMsCiAgICAgICAgICAgIDExNSwKICAgICAgICAgICAgMzIyLAogICAgICAg
ICAgICAzMjMsCiAgICAgICAgICAgIDMyNCwKICAgICAgICAgICAgMzI1CiAg
ICAgICAgICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAg
ICJ4c2EzMzAtNC4xMS5wYXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAg
ICAgIH0KICAgIH0sCiAgICAiNC4xMSI6IHsKICAgICAgIlJlY2lwZXMiOiB7
CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiNDFh
ODIyYzM5MjYzNTBmMjY5MTdkNzQ3YzhkZmVkMWM0NGEyY2Y0MiIsCiAgICAg
ICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAgICAgMzUzLAogICAgICAgICAg
ICAxMTUsCiAgICAgICAgICAgIDMyMiwKICAgICAgICAgICAgMzIzLAogICAg
ICAgICAgICAzMjQsCiAgICAgICAgICAgIDMyNQogICAgICAgICAgXSwKICAg
ICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMzMwLTQuMTEu
cGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAog
ICAgIjQuMTIiOiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4i
OiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogIjgxNDVkMzhiNDgwMDkyNTVh
MzJhYjg3YTAyZTQ4MWNkMDljODExZjkiLAogICAgICAgICAgIlByZXJlcXMi
OiBbCiAgICAgICAgICAgIDM1MywKICAgICAgICAgICAgMTE1LAogICAgICAg
ICAgICAzMjIsCiAgICAgICAgICAgIDMyMywKICAgICAgICAgICAgMzI0LAog
ICAgICAgICAgICAzMjUKICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hl
cyI6IFsKICAgICAgICAgICAgInhzYTMzMC5wYXRjaCIKICAgICAgICAgIF0K
ICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC4xMyI6IHsKICAgICAg
IlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFi
bGVSZWYiOiAiYjUzMDIyNzNlMmM1MTk0MDE3MjQwMDQ4NjY0NDYzNmYyZjRm
YzY0YSIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAgICAgMzUz
LAogICAgICAgICAgICAxMTUsCiAgICAgICAgICAgIDMyMiwKICAgICAgICAg
ICAgMzIzLAogICAgICAgICAgICAzMjQsCiAgICAgICAgICAgIDMyNQogICAg
ICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAi
eHNhMzMwLnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQog
ICAgfSwKICAgICI0LjE0IjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAg
ICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICIxZDFkMWY1Mzkx
OTc2NDU2YTc5ZGFhYzBkY2ZlNzE1N2RhMWU1NGY3IiwKICAgICAgICAgICJQ
cmVyZXFzIjogWwogICAgICAgICAgICAzNTMsCiAgICAgICAgICAgIDExNSwK
ICAgICAgICAgICAgMzIyLAogICAgICAgICAgICAzMjMsCiAgICAgICAgICAg
IDMyNCwKICAgICAgICAgICAgMzI1CiAgICAgICAgICBdLAogICAgICAgICAg
IlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EzMzAucGF0Y2giCiAgICAg
ICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAgIm1hc3RlciI6
IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAg
ICAgICJTdGFibGVSZWYiOiAiM2FlNDY5YWY4ZTY4MGRmMzFlZWNkMGEyYWM2
YTgzYjU4YWQ3Y2U1MyIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAgICAg
ICAgICAgMzUzLAogICAgICAgICAgICAxMTUsCiAgICAgICAgICAgIDMyMiwK
ICAgICAgICAgICAgMzIzLAogICAgICAgICAgICAzMjQsCiAgICAgICAgICAg
IDMyNQogICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAg
ICAgICAgICAieHNhMzMwLnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0K
ICAgICAgfQogICAgfQogIH0KfQ==

--=separator
Content-Type: application/octet-stream; name="xsa330.patch"
Content-Disposition: attachment; filename="xsa330.patch"
Content-Transfer-Encoding: base64

RnJvbTogPT9VVEYtOD9xP0Vkd2luPTIwVD1DMz1CNnI9QzM9QjZrPz0gPGVk
dmluLnRvcm9rQGNpdHJpeC5jb20+ClN1YmplY3Q6IHRvb2xzL29jYW1sL3hl
bnN0b3JlZDogZGVsZXRlIHdhdGNoIGZyb20gdHJpZSB0b28gd2hlbiByZXNl
dHRpbmcKIHdhdGNoZXMKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBl
OiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXIt
RW5jb2Rpbmc6IDhiaXQKCmMvcyBmOGM3MmI1MjYxMjkgIm94ZW5zdG9yZWQ6
IGltcGxlbWVudCBYU19SRVNFVF9XQVRDSEVTIiBmcm9tIFhlbiA0LjYKaW50
cm9kdWNlZCByZXNldCB3YXRjaGVzIHN1cHBvcnQgaW4gb3hlbnN0b3JlZCBi
eSBtaXJyb3JpbmcgdGhlIGNoYW5nZQppbiBjeGVuc3RvcmVkLgoKSG93ZXZl
ciB0aGUgT0NhbWwgdmVyc2lvbiBoYXMgc29tZSBhZGRpdGlvbmFsIGRhdGEg
c3RydWN0dXJlcyB0bwpvcHRpbWl6ZSB3YXRjaCBmaXJpbmcsIGFuZCBqdXN0
IHJlc2V0dGluZyB0aGUgd2F0Y2hlcyBpbiBvbmUgb2YgdGhlIGRhdGEKc3Ry
dWN0dXJlcyBjcmVhdGVzIGEgc2VjdXJpdHkgYnVnIHdoZXJlIGEgbWFsaWNp
b3VzIGd1ZXN0IGtlcm5lbCBjYW4KZXhjZWVkIGl0cyB3YXRjaCBxdW90YSwg
ZHJpdmluZyBveGVuc3RvcmVkIGludG8gT09NOgogKiBjcmVhdGUgd2F0Y2hl
cwogKiByZXNldCB3YXRjaGVzICh0aGlzIHN0aWxsIGtlZXBzIHRoZSB3YXRj
aGVzIGxpbmdlcmluZyBpbiBhbm90aGVyIGRhdGEKICAgc3RydWN0dXJlLCB1
c2luZyBtZW1vcnkpCiAqIGNyZWF0ZSBzb21lIG1vcmUgd2F0Y2hlcwogKiBs
b29wIHVudGlsIG94ZW5zdG9yZWQgZGllcwoKVGhlIGd1ZXN0IGtlcm5lbCBk
b2Vzbid0IG5lY2Vzc2FyaWx5IGhhdmUgdG8gYmUgbWFsaWNpb3VzIHRvIHRy
aWdnZXIKdGhpczoKICogaWYgY29udHJvbC9wbGF0Zm9ybS1mZWF0dXJlLXhz
X3Jlc2V0X3dhdGNoZXMgaXMgc2V0CiAqIHRoZSBndWVzdCBrZXhlY3MgKGUu
Zy4gYmVjYXVzZSBpdCBjcmFzaGVzKQogKiBvbiBib290IG1vcmUgd2F0Y2hl
cyBhcmUgc2V0IHVwCiAqIHRoaXMgd2lsbCBzbG93bHkgImxlYWsiIG1lbW9y
eSBmb3Igd2F0Y2hlcyBpbiBveGVuc3RvcmVkLCBkcml2aW5nIGl0CiAgIHRv
d2FyZHMgT09NLgoKVGhpcyBpcyBYU0EtMzMwLgoKRml4ZXM6IGY4YzcyYjUy
NjEyOSAoIm94ZW5zdG9yZWQ6IGltcGxlbWVudCBYU19SRVNFVF9XQVRDSEVT
IikKU2lnbmVkLW9mZi1ieTogRWR3aW4gVMO2csO2ayA8ZWR2aW4udG9yb2tA
Y2l0cml4LmNvbT4KQWNrZWQtYnk6IENocmlzdGlhbiBMaW5kaWcgPGNocmlz
dGlhbi5saW5kaWdAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpkaWZmIC0tZ2l0
IGEvdG9vbHMvb2NhbWwveGVuc3RvcmVkL2Nvbm5lY3Rpb25zLm1sIGIvdG9v
bHMvb2NhbWwveGVuc3RvcmVkL2Nvbm5lY3Rpb25zLm1sCmluZGV4IDlmOWY3
ZWUyZjAuLjZlZTM1NTJlYzIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL29jYW1sL3hl
bnN0b3JlZC9jb25uZWN0aW9ucy5tbAorKysgYi90b29scy9vY2FtbC94ZW5z
dG9yZWQvY29ubmVjdGlvbnMubWwKQEAgLTEzNCw2ICsxMzQsMTAgQEAgbGV0
IGRlbF93YXRjaCBjb25zIGNvbiBwYXRoIHRva2VuID0KIAkJY29ucy53YXRj
aGVzIDwtIFRyaWUuc2V0IGNvbnMud2F0Y2hlcyBrZXkgd2F0Y2hlczsKICAJ
d2F0Y2gKIAorbGV0IGRlbF93YXRjaGVzIGNvbnMgY29uID0KKwlDb25uZWN0
aW9uLmRlbF93YXRjaGVzIGNvbjsKKwljb25zLndhdGNoZXMgPC0gVHJpZS5t
YXAgKGRlbF93YXRjaGVzX29mX2NvbiBjb24pIGNvbnMud2F0Y2hlcworCiAo
KiBwYXRoIGlzIGFic29sdXRlICopCiBsZXQgZmlyZV93YXRjaGVzID9vbGRy
b290IHJvb3QgY29ucyBwYXRoIHJlY3Vyc2UgPQogCWxldCBrZXkgPSBrZXlf
b2ZfcGF0aCBwYXRoIGluCmRpZmYgLS1naXQgYS90b29scy9vY2FtbC94ZW5z
dG9yZWQvcHJvY2Vzcy5tbCBiL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9wcm9j
ZXNzLm1sCmluZGV4IDczZTA0Y2MxOGIuLjQzN2QyZGNmOWUgMTAwNjQ0Ci0t
LSBhL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9wcm9jZXNzLm1sCisrKyBiL3Rv
b2xzL29jYW1sL3hlbnN0b3JlZC9wcm9jZXNzLm1sCkBAIC0xNzksOCArMTc5
LDggQEAgbGV0IGRvX2lzaW50cm9kdWNlZCBjb24gX3QgZG9tYWlucyBfY29u
cyBkYXRhID0KIAlpZiBkb21pZCA9IERlZmluZS5kb21pZF9zZWxmIHx8IERv
bWFpbnMuZXhpc3QgZG9tYWlucyBkb21pZCB0aGVuICJUXDAwMCIgZWxzZSAi
RlwwMDAiCiAKICgqIG9ubHkgaW4geGVuID49IDQuMiAqKQotbGV0IGRvX3Jl
c2V0X3dhdGNoZXMgY29uIF90IF9kb21haW5zIF9jb25zIF9kYXRhID0KLSAg
Q29ubmVjdGlvbi5kZWxfd2F0Y2hlcyBjb247CitsZXQgZG9fcmVzZXRfd2F0
Y2hlcyBjb24gX3QgX2RvbWFpbnMgY29ucyBfZGF0YSA9CisgIENvbm5lY3Rp
b25zLmRlbF93YXRjaGVzIGNvbnMgY29uOwogICBDb25uZWN0aW9uLmRlbF90
cmFuc2FjdGlvbnMgY29uCiAKICgqIG9ubHkgaW4gPj0geGVuMy4zICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKikK

--=separator
Content-Type: application/octet-stream; name="xsa330-4.11.patch"
Content-Disposition: attachment; filename="xsa330-4.11.patch"
Content-Transfer-Encoding: base64

RnJvbTogPT9VVEYtOD9xP0Vkd2luPTIwVD1DMz1CNnI9QzM9QjZrPz0gPGVk
dmluLnRvcm9rQGNpdHJpeC5jb20+ClN1YmplY3Q6IHRvb2xzL29jYW1sL3hl
bnN0b3JlZDogZGVsZXRlIHdhdGNoIGZyb20gdHJpZSB0b28gd2hlbiByZXNl
dHRpbmcKIHdhdGNoZXMKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBl
OiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXIt
RW5jb2Rpbmc6IDhiaXQKCmMvcyBmOGM3MmI1MjYxMjkgIm94ZW5zdG9yZWQ6
IGltcGxlbWVudCBYU19SRVNFVF9XQVRDSEVTIiBmcm9tIFhlbiA0LjYKaW50
cm9kdWNlZCByZXNldCB3YXRjaGVzIHN1cHBvcnQgaW4gb3hlbnN0b3JlZCBi
eSBtaXJyb3JpbmcgdGhlIGNoYW5nZQppbiBjeGVuc3RvcmVkLgoKSG93ZXZl
ciB0aGUgT0NhbWwgdmVyc2lvbiBoYXMgc29tZSBhZGRpdGlvbmFsIGRhdGEg
c3RydWN0dXJlcyB0bwpvcHRpbWl6ZSB3YXRjaCBmaXJpbmcsIGFuZCBqdXN0
IHJlc2V0dGluZyB0aGUgd2F0Y2hlcyBpbiBvbmUgb2YgdGhlIGRhdGEKc3Ry
dWN0dXJlcyBjcmVhdGVzIGEgc2VjdXJpdHkgYnVnIHdoZXJlIGEgbWFsaWNp
b3VzIGd1ZXN0IGtlcm5lbCBjYW4KZXhjZWVkIGl0cyB3YXRjaCBxdW90YSwg
ZHJpdmluZyBveGVuc3RvcmVkIGludG8gT09NOgogKiBjcmVhdGUgd2F0Y2hl
cwogKiByZXNldCB3YXRjaGVzICh0aGlzIHN0aWxsIGtlZXBzIHRoZSB3YXRj
aGVzIGxpbmdlcmluZyBpbiBhbm90aGVyIGRhdGEKICAgc3RydWN0dXJlLCB1
c2luZyBtZW1vcnkpCiAqIGNyZWF0ZSBzb21lIG1vcmUgd2F0Y2hlcwogKiBs
b29wIHVudGlsIG94ZW5zdG9yZWQgZGllcwoKVGhlIGd1ZXN0IGtlcm5lbCBk
b2Vzbid0IG5lY2Vzc2FyaWx5IGhhdmUgdG8gYmUgbWFsaWNpb3VzIHRvIHRy
aWdnZXIKdGhpczoKICogaWYgY29udHJvbC9wbGF0Zm9ybS1mZWF0dXJlLXhz
X3Jlc2V0X3dhdGNoZXMgaXMgc2V0CiAqIHRoZSBndWVzdCBrZXhlY3MgKGUu
Zy4gYmVjYXVzZSBpdCBjcmFzaGVzKQogKiBvbiBib290IG1vcmUgd2F0Y2hl
cyBhcmUgc2V0IHVwCiAqIHRoaXMgd2lsbCBzbG93bHkgImxlYWsiIG1lbW9y
eSBmb3Igd2F0Y2hlcyBpbiBveGVuc3RvcmVkLCBkcml2aW5nIGl0CiAgIHRv
d2FyZHMgT09NLgoKVGhpcyBpcyBYU0EtMzMwLgoKRml4ZXM6IGY4YzcyYjUy
NjEyOSAoIm94ZW5zdG9yZWQ6IGltcGxlbWVudCBYU19SRVNFVF9XQVRDSEVT
IikKU2lnbmVkLW9mZi1ieTogRWR3aW4gVMO2csO2ayA8ZWR2aW4udG9yb2tA
Y2l0cml4LmNvbT4KQWNrZWQtYnk6IENocmlzdGlhbiBMaW5kaWcgPGNocmlz
dGlhbi5saW5kaWdAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpkaWZmIC0tZ2l0
IGEvdG9vbHMvb2NhbWwveGVuc3RvcmVkL2Nvbm5lY3Rpb25zLm1sIGIvdG9v
bHMvb2NhbWwveGVuc3RvcmVkL2Nvbm5lY3Rpb25zLm1sCmluZGV4IDAyMGI4
NzVkY2QuLjRlNjlkZTFkNDIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL29jYW1sL3hl
bnN0b3JlZC9jb25uZWN0aW9ucy5tbAorKysgYi90b29scy9vY2FtbC94ZW5z
dG9yZWQvY29ubmVjdGlvbnMubWwKQEAgLTEzNCw2ICsxMzQsMTAgQEAgbGV0
IGRlbF93YXRjaCBjb25zIGNvbiBwYXRoIHRva2VuID0KIAkJY29ucy53YXRj
aGVzIDwtIFRyaWUuc2V0IGNvbnMud2F0Y2hlcyBrZXkgd2F0Y2hlczsKICAJ
d2F0Y2gKIAorbGV0IGRlbF93YXRjaGVzIGNvbnMgY29uID0KKwlDb25uZWN0
aW9uLmRlbF93YXRjaGVzIGNvbjsKKwljb25zLndhdGNoZXMgPC0gVHJpZS5t
YXAgKGRlbF93YXRjaGVzX29mX2NvbiBjb24pIGNvbnMud2F0Y2hlcworCiAo
KiBwYXRoIGlzIGFic29sdXRlICopCiBsZXQgZmlyZV93YXRjaGVzID9vbGRy
b290IHJvb3QgY29ucyBwYXRoIHJlY3Vyc2UgPQogCWxldCBrZXkgPSBrZXlf
b2ZfcGF0aCBwYXRoIGluCmRpZmYgLS1naXQgYS90b29scy9vY2FtbC94ZW5z
dG9yZWQvcHJvY2Vzcy5tbCBiL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9wcm9j
ZXNzLm1sCmluZGV4IDZhOTk4Zjg3NjQuLjEyYWQ2NmZjZTYgMTAwNjQ0Ci0t
LSBhL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9wcm9jZXNzLm1sCisrKyBiL3Rv
b2xzL29jYW1sL3hlbnN0b3JlZC9wcm9jZXNzLm1sCkBAIC0xNzksOCArMTc5
LDggQEAgbGV0IGRvX2lzaW50cm9kdWNlZCBjb24gX3QgZG9tYWlucyBfY29u
cyBkYXRhID0KIAlpZiBkb21pZCA9IERlZmluZS5kb21pZF9zZWxmIHx8IERv
bWFpbnMuZXhpc3QgZG9tYWlucyBkb21pZCB0aGVuICJUXDAwMCIgZWxzZSAi
RlwwMDAiCiAKICgqIG9ubHkgaW4geGVuID49IDQuMiAqKQotbGV0IGRvX3Jl
c2V0X3dhdGNoZXMgY29uIHQgZG9tYWlucyBjb25zIGRhdGEgPQotICBDb25u
ZWN0aW9uLmRlbF93YXRjaGVzIGNvbjsKK2xldCBkb19yZXNldF93YXRjaGVz
IGNvbiBfdCBfZG9tYWlucyBjb25zIF9kYXRhID0KKyAgQ29ubmVjdGlvbnMu
ZGVsX3dhdGNoZXMgY29ucyBjb247CiAgIENvbm5lY3Rpb24uZGVsX3RyYW5z
YWN0aW9ucyBjb24KIAogKCogb25seSBpbiA+PSB4ZW4zLjMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqKQo=

--=separator--

