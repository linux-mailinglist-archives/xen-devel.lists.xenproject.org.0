Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A628614A47
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 13:06:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433790.686720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opq1l-0004Ja-F2; Tue, 01 Nov 2022 12:05:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433790.686720; Tue, 01 Nov 2022 12:05:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opq1l-0004Ha-BE; Tue, 01 Nov 2022 12:05:57 +0000
Received: by outflank-mailman (input) for mailman id 433790;
 Tue, 01 Nov 2022 12:05:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lfjo=3B=xenbits.xen.org=jgross@srs-se1.protection.inumbo.net>)
 id 1oppx4-0004vc-Tz
 for xen-devel@lists.xen.org; Tue, 01 Nov 2022 12:01:07 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d751b0c6-59dc-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 13:00:56 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@xenbits.xen.org>)
 id 1oppwm-0005ZZ-0t; Tue, 01 Nov 2022 12:00:48 +0000
Received: from jgross by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <jgross@xenbits.xen.org>)
 id 1oppwm-0005Y4-0C; Tue, 01 Nov 2022 12:00:48 +0000
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
X-Inumbo-ID: d751b0c6-59dc-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=21s15ERchiw4PqUfHttR5tSjM7ku7FiDMNkcgB7n5dk=; b=RdINySdOmxocMWLisN/iWqmFlv
	+AGfcxKrdDmOt3r6G5M7Q4arP+3z6/Ip/yCWO/prUG1tgsWjOOybw0GU1FcD+Rv6s+S3xQHO9iGfo
	PzZIPAiRnGulTcS/VmECBLwqh8xAAMFm3zSAArd+rsfydxWaBMjio5266jT4FWyGxhpo=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 420 v2 (CVE-2022-42324) - Oxenstored 32->31
 bit integer truncation issues
Message-Id: <E1oppwm-0005Y4-0C@xenbits.xenproject.org>
Date: Tue, 01 Nov 2022 12:00:48 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2022-42324 / XSA-420
                               version 2

            Oxenstored 32->31 bit integer truncation issues

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

Integers in Ocaml are 63 or 31 bits of signed precision.

The Ocaml Xenbus library takes a C uint32_t out of the ring and casts it
directly to an Ocaml integer.  In 64-bit Ocaml builds this is fine, but
in 32-bit builds, it truncates off the most significant bit, and then
creates unsigned/signed confusion in the remainder.

This in turn can feed a negative value into logic not expecting a
negative value, resulting in unexpected exceptions being thrown.

The unexpected exception is not handled suitably, creating a busy-loop
trying (and failing) to take the bad packet out of the xenstore ring.

IMPACT
======

A malicious or buggy guest can write a packet into the xenstore ring
which causes 32-bit builds of oxenstored to busy loop.

VULNERABLE SYSTEMS
==================

All versions of Xen are affected.

Systems running a 32-bit build of oxenstored are affected.

Systems running a 64-bit build of oxenstored, or systems running (C)
xenstored are not affected.

MITIGATION
==========

Running xenstored instead of oxenstored will avoid the vulnerability.

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

xsa420.patch           xen-unstable - Xen 4.13.x

$ sha256sum xsa420*
565b332d325fd0fdeb5fee890c0cd9b53c4478c46c6b7ec7b24fd3444d2dc812  xsa420.meta
bfa83ca1e78ef81f93c3d94cb1522d1cffed8b9989c5639e8ec663fad0a71027  xsa420.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmNg+68MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZWJ8H/33T8Ub00BrIWdWSvajjRA4oLamGKRg5uJoI5peJ
cpgKB7iFcoOZcM+G2YfYjm8W2ckoEHXQkJ7fJEbAW0rHc8+WyWl2ulklZSpyi9RX
B6jloIo+5pFoenShirPrJNyfbCmgJduRiUcIzPMRg6vgTmS1RO1W2x3/A6haxez5
LOJCm8dhUBbrp83KH7MgVBlUXIlVQ1irKBmCps11lFG7LaMWjLtScPI4qCpFbMf/
Cmd91Jw6EpzfOWcqohbRabqXXrPZJqSe+EwqrEJsVkkEIK2y2e/kUWcy/9shr9a2
YtudokkROE+bJGbpM9bbucCu/Rnwqj20fDIztR0soCtPbOM=
=QFv9
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa420.meta"
Content-Disposition: attachment; filename="xsa420.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiA0MjAsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNiIsCiAgICAiNC4xNSIsCiAgICAiNC4xNCIs
CiAgICAiNC4xMyIKICBdLAogICJUcmVlcyI6IFsKICAgICJ4ZW4iCiAgXSwK
ICAiUmVjaXBlcyI6IHsKICAgICI0LjEzIjogewogICAgICAiUmVjaXBlcyI6
IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICIw
YmU2M2MyNjE1YjI2ODAwMWY3Y2M5YjcyY2UyNWVlZDk1MjczN2RjIiwKICAg
ICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICA0MTQsCiAgICAgICAg
ICAgIDQxNSwKICAgICAgICAgICAgMzI2LAogICAgICAgICAgICA0MTYsCiAg
ICAgICAgICAgIDQxNywKICAgICAgICAgICAgNDE4LAogICAgICAgICAgICA0
MTkKICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAg
ICAgICAgInhzYTQyMC5wYXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAg
ICAgIH0KICAgIH0sCiAgICAiNC4xNCI6IHsKICAgICAgIlJlY2lwZXMiOiB7
CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiMDE2
ZGU2Mjc0N2IyNmVhZDVhNWM3NjNiNjQwZmU4ZTIwNWNkMTgyYiIsCiAgICAg
ICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAgICAgNDE0LAogICAgICAgICAg
ICA0MTUsCiAgICAgICAgICAgIDMyNiwKICAgICAgICAgICAgNDE2LAogICAg
ICAgICAgICA0MTcsCiAgICAgICAgICAgIDQxOCwKICAgICAgICAgICAgNDE5
CiAgICAgICAgICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAg
ICAgICJ4c2E0MjAucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAg
ICB9CiAgICB9LAogICAgIjQuMTUiOiB7CiAgICAgICJSZWNpcGVzIjogewog
ICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogIjgxNjU4
MGFmZGQxNzMwZDRmODVmNjQ0NzdhMjQyYTQzOWFmMWNkZjgiLAogICAgICAg
ICAgIlByZXJlcXMiOiBbCiAgICAgICAgICAgIDQxNCwKICAgICAgICAgICAg
NDE1LAogICAgICAgICAgICAzMjYsCiAgICAgICAgICAgIDQxNiwKICAgICAg
ICAgICAgNDE3LAogICAgICAgICAgICA0MTgsCiAgICAgICAgICAgIDQxOQog
ICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAg
ICAieHNhNDIwLnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAg
fQogICAgfSwKICAgICI0LjE2IjogewogICAgICAiUmVjaXBlcyI6IHsKICAg
ICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICIxYmNlN2Zi
MWY3MDJkYTRmN2E3NDljNmYxNDU3ZWNiMjBiZjc0ZmNhIiwKICAgICAgICAg
ICJQcmVyZXFzIjogWwogICAgICAgICAgICA0MTIsCiAgICAgICAgICAgIDQx
NCwKICAgICAgICAgICAgNDE1LAogICAgICAgICAgICAzMjYsCiAgICAgICAg
ICAgIDQxNiwKICAgICAgICAgICAgNDE3LAogICAgICAgICAgICA0MTgsCiAg
ICAgICAgICAgIDQxOQogICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVz
IjogWwogICAgICAgICAgICAieHNhNDIwLnBhdGNoIgogICAgICAgICAgXQog
ICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICJtYXN0ZXIiOiB7CiAgICAg
ICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3Rh
YmxlUmVmIjogImNjNDc0N2JlOGJhMTU3YTNiMzEwOTIxZTllZTA3ZmI4NTQ1
YWEyMDYiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAgICAgICAgIDQx
MiwKICAgICAgICAgICAgNDE0LAogICAgICAgICAgICA0MTUsCiAgICAgICAg
ICAgIDMyNiwKICAgICAgICAgICAgNDE2LAogICAgICAgICAgICA0MTcsCiAg
ICAgICAgICAgIDQxOCwKICAgICAgICAgICAgNDE5CiAgICAgICAgICBdLAog
ICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2E0MjAucGF0
Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9CiAgfQp9

--=separator
Content-Type: application/octet-stream; name="xsa420.patch"
Content-Disposition: attachment; filename="xsa420.patch"
Content-Transfer-Encoding: base64

RnJvbSAyMTA4Nzk0NTY3NjljYTIxMWM2NjMwZjQ3Mzk5Y2E3YTYxYTM3ZjM1
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/RWR3
aW49MjBUPUMzPUI2cj1DMz1CNms/PSA8ZWR2aW4udG9yb2tAY2l0cml4LmNv
bT4KRGF0ZTogV2VkLCAxMiBPY3QgMjAyMiAxOToxMzowNSArMDEwMApTdWJq
ZWN0OiB0b29scy9vY2FtbDogRW5zdXJlIHBhY2tldCBzaXplIGlzIG5ldmVy
IG5lZ2F0aXZlCk1JTUUtVmVyc2lvbjogMS4wCkNvbnRlbnQtVHlwZTogdGV4
dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRyYW5zZmVyLUVuY29k
aW5nOiA4Yml0CgpJbnRlZ2VycyBpbiBPY2FtbCBoYXZlIDYzIG9yIDMxIGJp
dHMgb2Ygc2lnbmVkIHByZWNpc2lvbi4KCk9uIDY0LWJpdCBidWlsZHMgb2Yg
T2NhbWwsIHRoaXMgaXMgZmluZSBiZWNhdXNlIGEgQyB1aW50MzJfdCBhbHdh
eXMgZml0cwp3aXRoaW4gYSA2My1iaXQgc2lnbmVkIGludGVnZXIuCgpJbiAz
Mi1iaXQgYnVpbGRzIG9mIE9jYW1sLCB0aGlzIGdvZXMgd3JvbmcuICBUaGUg
QyB1aW50MzJfdCBpcyB0cnVuY2F0ZWQKZmlyc3QgKGxvc2VzIHRoZSB0b3Ag
Yml0KSwgdGhlbiBoYXMgYSB1bnNpZ25lZC9zaWduZWQgbWlzbWF0Y2guCgpB
ICJuZWdhdGl2ZSIgdmFsdWUgKGkuZS4gYSBwYWNrZXQgb24gdGhlIHJpbmcg
b2YgYmV0d2VlbiAxRyBhbmQgMkcgaW4gc2l6ZSkKd2lsbCB0cmlnZ2VyIGFu
IGV4Y2VwdGlvbiBsYXRlciBpbiBCeXRlcy5tYWtlIGluIHhiLm1sLCBhbmQg
YmVjYXVzZSB0aGUgcGFja2V0CmlzIG5vdCByZW1vdmVkIGZyb20gdGhlIHJp
bmcsIHRoZSBleGNlcHRpb24gcmUtdHJpZ2dlcnMgb24gZXZlcnkgc3Vic2Vx
dWVudApxdWVyeSwgY3JlYXRpbmcgYSBsaXZlbG9jay4KCkZpeCBib3RoIHRo
ZSBzb3VyY2Ugb2YgdGhlIGV4Y2VwdGlvbiBpbiBYYiwgYW5kIGFzIGRlZmVu
Y2UgaW4gZGVwdGgsIG1hcmsgdGhlCmRvbWFpbiBhcyBiYWQgZm9yIGFueSBJ
bnZhbGlkX2FyZ3VtZW50IGV4Y2VwdGlvbnMgdG8gYXZvaWQgdGhlIHJpc2sg
b2YKbGl2ZWxvY2suCgpUaGlzIGlzIFhTQS00MjAgLyBDVkUtMjAyMi00MjMy
NC4KClJlcG9ydGVkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+ClNpZ25lZC1vZmYtYnk6IEVkd2luIFTDtnLDtmsgPGVkdmluLnRvcm9r
QGNpdHJpeC5jb20+CkFja2VkLWJ5OiBDaHJpc3RpYW4gTGluZGlnIDxjaHJp
c3RpYW4ubGluZGlnQGNpdHJpeC5jb20+CgpkaWZmIC0tZ2l0IGEvdG9vbHMv
b2NhbWwvbGlicy94Yi9wYXJ0aWFsLm1sIGIvdG9vbHMvb2NhbWwvbGlicy94
Yi9wYXJ0aWFsLm1sCmluZGV4IGI2ZTJhNzE2ZTI2My4uM2FhODkyN2ViN2Yw
IDEwMDY0NAotLS0gYS90b29scy9vY2FtbC9saWJzL3hiL3BhcnRpYWwubWwK
KysrIGIvdG9vbHMvb2NhbWwvbGlicy94Yi9wYXJ0aWFsLm1sCkBAIC0zNiw3
ICszNiw3IEBAIGxldCBvZl9zdHJpbmcgcyA9CiAJICAgVGhpcyB3aWxsIGxl
YXZlIHRoZSBndWVzdCBjb25uZWN0aW9uIGlzIGEgYmFkIHN0YXRlIGFuZCB3
aWxsCiAJICAgYmUgaGFyZCB0byByZWNvdmVyIGZyb20gd2l0aG91dCByZXN0
YXJ0aW5nIHRoZSBjb25uZWN0aW9uCiAJICAgKGllIHJlYm9vdGluZyB0aGUg
Z3Vlc3QpICopCi0JbGV0IGRsZW4gPSBtaW4geGVuc3RvcmVfcGF5bG9hZF9t
YXggZGxlbiBpbgorCWxldCBkbGVuID0gbWF4IDAgKG1pbiB4ZW5zdG9yZV9w
YXlsb2FkX21heCBkbGVuKSBpbgogCXsKIAkJdGlkID0gdGlkOwogCQlyaWQg
PSByaWQ7CkBAIC00Niw4ICs0Niw4IEBAIGxldCBvZl9zdHJpbmcgcyA9CiAJ
fQogCiBsZXQgYXBwZW5kIHBrdCBzIHN6ID0KLQlpZiBwa3QubGVuID4gNDA5
NiB0aGVuIGZhaWx3aXRoICJCdWZmZXIuYWRkOiBjYW5ub3QgZ3JvdyBidWZm
ZXIiOwotCUJ1ZmZlci5hZGRfc3RyaW5nIHBrdC5idWYgKFN0cmluZy5zdWIg
cyAwIHN6KQorCWlmIEJ1ZmZlci5sZW5ndGggcGt0LmJ1ZiArIHN6ID4geGVu
c3RvcmVfcGF5bG9hZF9tYXggdGhlbiBmYWlsd2l0aCAiQnVmZmVyLmFkZDog
Y2Fubm90IGdyb3cgYnVmZmVyIjsKKwlCdWZmZXIuYWRkX3N1YnN0cmluZyBw
a3QuYnVmIHMgMCBzegogCiBsZXQgdG9fY29tcGxldGUgcGt0ID0KIAlwa3Qu
bGVuIC0gKEJ1ZmZlci5sZW5ndGggcGt0LmJ1ZikKZGlmZiAtLWdpdCBhL3Rv
b2xzL29jYW1sL3hlbnN0b3JlZC9wcm9jZXNzLm1sIGIvdG9vbHMvb2NhbWwv
eGVuc3RvcmVkL3Byb2Nlc3MubWwKaW5kZXggNWY0MzlmZTU5ZjQ3Li5mM2E3
MWIyNGFkOTQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9w
cm9jZXNzLm1sCisrKyBiL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9wcm9jZXNz
Lm1sCkBAIC03MjIsNyArNzIyLDcgQEAgbGV0IGRvX2lucHV0IHN0b3JlIGNv
bnMgZG9tcyBjb24gPQogCQkJSGlzdG9yeS5yZWNvbm5lY3QgY29uOwogCQkJ
aW5mbyAiJXMgcmVjb25uZWN0aW9uIGNvbXBsZXRlIiAoQ29ubmVjdGlvbi5n
ZXRfZG9tc3RyIGNvbik7CiAJCQlOb25lCi0JCXwgRmFpbHVyZSBleHAgLT4K
KwkJfCBJbnZhbGlkX2FyZ3VtZW50IGV4cCB8IEZhaWx1cmUgZXhwIC0+CiAJ
CQllcnJvciAiY2F1Z2h0IGV4Y2VwdGlvbiAlcyIgZXhwOwogCQkJZXJyb3Ig
ImdvdCBhIGJhZCBjbGllbnQgJXMiIChzcHJpbnRmICIlLThzIiAoQ29ubmVj
dGlvbi5nZXRfZG9tc3RyIGNvbikpOwogCQkJQ29ubmVjdGlvbi5tYXJrX2Fz
X2JhZCBjb247Cg==

--=separator--

