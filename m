Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 155E02DACE7
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 13:20:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.53147.92823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp9Jt-0005B0-Md; Tue, 15 Dec 2020 12:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 53147.92823; Tue, 15 Dec 2020 12:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp9Jt-0005A5-Fa; Tue, 15 Dec 2020 12:20:45 +0000
Received: by outflank-mailman (input) for mailman id 53147;
 Tue, 15 Dec 2020 12:20:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tdgx=FT=xenbits.xen.org=gdunlap@srs-us1.protection.inumbo.net>)
 id 1kp9Jr-0004t1-Km
 for xen-devel@lists.xen.org; Tue, 15 Dec 2020 12:20:43 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a8e9201-670a-4a40-bb4a-f69eee5766bc;
 Tue, 15 Dec 2020 12:20:23 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gdunlap@xenbits.xen.org>)
 id 1kp9JS-0005hC-M7; Tue, 15 Dec 2020 12:20:18 +0000
Received: from gdunlap by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <gdunlap@xenbits.xen.org>)
 id 1kp9JS-00071M-L4; Tue, 15 Dec 2020 12:20:18 +0000
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
X-Inumbo-ID: 7a8e9201-670a-4a40-bb4a-f69eee5766bc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=sFsBolSRPNjeYw9DvQPhXm69yPmYRcRSCuSvqENNVoc=; b=ocof4P2UiDxXaCf5aodT+7C73t
	WurKV3ign8eBilaYTliqqxrEcJVofiVSa4zUDBf2RR8HGsWKDDh+SIfoValM0/pFGIo7ktImghKw2
	vh29XyNP6T/T5ja+6VhALGwX0sSH2DuODv62zLeYDLSUa5GPmA0DKnTwC7lR5MMDlU7c=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 324 v3 (CVE-2020-29484) - Xenstore: guests
 can crash xenstored via watchs
Message-Id: <E1kp9JS-00071M-L4@xenbits.xenproject.org>
Date: Tue, 15 Dec 2020 12:20:18 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2020-29484 / XSA-324
                               version 3

            Xenstore: guests can crash xenstored via watchs

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

When a Xenstore watch fires, the xenstore client which registered the
watch will receive a Xenstore message containing the path of the
modified Xenstore entry which triggered the watch, and the tag which
was specified when registering the watch.

Any communication with xenstored is done via Xenstore messages,
consisting of a message header and the payload. The payload length is
limited to 4096 bytes. Any request to xenstored resulting in a
response with a payload longer than 4096 bytes will result in an
error.

When registering a watch the payload length limit applies to the
combined length of the watched path and the specified tag. As watches
for a specific path are also triggered for all nodes below that path,
the payload of a watch event message can be longer than the payload
needed to register the watch.

A malicious guest which registers a watch using a very large tag (ie
with a registration operation payload length close to the 4096 byte
limit) can cause the generation of watch events with a payload length
larger than 4096 bytes, by writing to Xenstore entries below the
watched path.

This will result in an error condition in xenstored.  This error can
result in a NULL pointer dereference leading to a crash of xenstored.

IMPACT
======

A malicious guest administrator can cause xenstored to crash, leading
to a denial of service.  Following a xenstored crash, domains may
continue to run, but management operations will be impossible.

VULNERABLE SYSTEMS
==================

All Xen versions are affected.

Only C xenstored is affected, oxenstored is not affected.

MITIGATION
==========

There are no mitigations.

Changing to use of Ocaml xenstored would avoid this vulnerability.
However, given the other vulnerabilities in both versions of xenstored
being reported at this time, changing xenstored implementation is not a
recommended approach to mitigation of individual issues.

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

xsa324.patch           xen-unstable - 4.10

$ sha256sum xsa324*
78932f0a83b479902553b1acdf601f7625b383497c03c6e834a0a2b847f1a72e  xsa324.meta
8dba79842fa913290c7043d065a50abb0efe27fa5a173e421c21c544cc1e264c  xsa324.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl/Yqd4MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZBoIH/ir2NdOiUg6JFoa/DXgtMBosLXRkRRjikvlaMJTY
krz3r/aBZ0nLn8wsF5u+BctJYdHrIQDrt3N7GGv1wyvnLA18HrtupsxqrHj+CCMD
pogl6QxRmmqRina7+EzRTt8N8qe6fhi8tuVmH3TYlsL1PeHyqNurwwTZizHL9BFx
uCY10qNUV0FTY05tUhdP0FD3yiNfN8QwytARo/LRhELbUMx7D+N/CmUtCKh5uklr
KfBBHy3Vb4MDlGPN7pa5vdEjZGFVj4xHWxUP+72C+bdhvLEiDi+IKkvy/TVbjoAN
eQEfFVjBpj21MeQV+3mHJMJGknaJ8NTc00txrLM5D+WscHM=
=KypE
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa324.meta"
Content-Disposition: attachment; filename="xsa324.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzMjQsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNCIsCiAgICAiNC4xMyIsCiAgICAiNC4xMiIs
CiAgICAiNC4xMSIsCiAgICAiNC4xMCIKICBdLAogICJUcmVlcyI6IFsKICAg
ICJ4ZW4iCiAgXSwKICAiUmVjaXBlcyI6IHsKICAgICI0LjEwIjogewogICAg
ICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0
YWJsZVJlZiI6ICIxZDcyZDk5MTVlZGZmMGRkNDFmNjAxYmJiMGIxZjgzYzAy
ZmYxNjg5IiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAz
NTMsCiAgICAgICAgICAgIDExNSwKICAgICAgICAgICAgMzIyLAogICAgICAg
ICAgICAzMjMKICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsK
ICAgICAgICAgICAgInhzYTMyNC5wYXRjaCIKICAgICAgICAgIF0KICAgICAg
ICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC4xMSI6IHsKICAgICAgIlJlY2lw
ZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYi
OiAiNDFhODIyYzM5MjYzNTBmMjY5MTdkNzQ3YzhkZmVkMWM0NGEyY2Y0MiIs
CiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAgICAgMzUzLAogICAg
ICAgICAgICAxMTUsCiAgICAgICAgICAgIDMyMiwKICAgICAgICAgICAgMzIz
CiAgICAgICAgICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAg
ICAgICJ4c2EzMjQucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAg
ICB9CiAgICB9LAogICAgIjQuMTIiOiB7CiAgICAgICJSZWNpcGVzIjogewog
ICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogIjgxNDVk
MzhiNDgwMDkyNTVhMzJhYjg3YTAyZTQ4MWNkMDljODExZjkiLAogICAgICAg
ICAgIlByZXJlcXMiOiBbCiAgICAgICAgICAgIDM1MywKICAgICAgICAgICAg
MTE1LAogICAgICAgICAgICAzMjIsCiAgICAgICAgICAgIDMyMwogICAgICAg
ICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNh
MzI0LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAg
fSwKICAgICI0LjEzIjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAi
eGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICJiNTMwMjI3M2UyYzUx
OTQwMTcyNDAwNDg2NjQ0NjM2ZjJmNGZjNjRhIiwKICAgICAgICAgICJQcmVy
ZXFzIjogWwogICAgICAgICAgICAzNTMsCiAgICAgICAgICAgIDExNSwKICAg
ICAgICAgICAgMzIyLAogICAgICAgICAgICAzMjMKICAgICAgICAgIF0sCiAg
ICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTMyNC5wYXRj
aCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAi
NC4xNCI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsK
ICAgICAgICAgICJTdGFibGVSZWYiOiAiMWQxZDFmNTM5MTk3NjQ1NmE3OWRh
YWMwZGNmZTcxNTdkYTFlNTRmNyIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsK
ICAgICAgICAgICAgMzUzLAogICAgICAgICAgICAxMTUsCiAgICAgICAgICAg
IDMyMiwKICAgICAgICAgICAgMzIzCiAgICAgICAgICBdLAogICAgICAgICAg
IlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EzMjQucGF0Y2giCiAgICAg
ICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAgIm1hc3RlciI6
IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAg
ICAgICJTdGFibGVSZWYiOiAiM2FlNDY5YWY4ZTY4MGRmMzFlZWNkMGEyYWM2
YTgzYjU4YWQ3Y2U1MyIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAgICAg
ICAgICAgMzUzLAogICAgICAgICAgICAxMTUsCiAgICAgICAgICAgIDMyMiwK
ICAgICAgICAgICAgMzIzCiAgICAgICAgICBdLAogICAgICAgICAgIlBhdGNo
ZXMiOiBbCiAgICAgICAgICAgICJ4c2EzMjQucGF0Y2giCiAgICAgICAgICBd
CiAgICAgICAgfQogICAgICB9CiAgICB9CiAgfQp9

--=separator
Content-Type: application/octet-stream; name="xsa324.patch"
Content-Disposition: attachment; filename="xsa324.patch"
Content-Transfer-Encoding: base64

RnJvbTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpTdWJqZWN0
OiB0b29scy94ZW5zdG9yZTogZHJvcCB3YXRjaCBldmVudCBtZXNzYWdlcyBl
eGNlZWRpbmcgbWF4aW11bSBzaXplCgpCeSBzZXR0aW5nIGEgd2F0Y2ggd2l0
aCBhIHZlcnkgbGFyZ2UgdGFnIGl0IGlzIHBvc3NpYmxlIHRvIHRyaWNrCnhl
bnN0b3JlZCB0byBzZW5kIHdhdGNoIGV2ZW50IG1lc3NhZ2VzIGV4Y2VlZGlu
ZyB0aGUgbWF4aW11bSBhbGxvd2VkCnBheWxvYWQgc2l6ZS4gVGhpcyBtaWdo
dCBpbiB0dXJuIGxlYWQgdG8gYSBjcmFzaCBvZiB4ZW5zdG9yZWQgYXMgdGhl
CnJlc3VsdGluZyBlcnJvciBjYW4gY2F1c2UgZGVyZWZlcmVuY2luZyBhIE5V
TEwgcG9pbnRlciBpbiBjYXNlIHRoZXJlCmlzIG5vIGFjdGl2ZSByZXF1ZXN0
IGJlaW5nIGhhbmRsZWQgYnkgdGhlIGd1ZXN0IHRoZSB3YXRjaCBldmVudCBp
cwpiZWluZyBzZW50IHRvLgoKRml4IHRoYXQgYnkganVzdCBkcm9wcGluZyBz
dWNoIHdhdGNoIGV2ZW50cy4gQWRkaXRpb25hbGx5IG1vZGlmeSB0aGUKZXJy
b3IgaGFuZGxpbmcgdG8gdGVzdCB0aGUgcG9pbnRlciB0byBiZSBub3QgTlVM
TCBiZWZvcmUgZGVyZWZlcmVuY2luZwppdC4KClRoaXMgaXMgWFNBLTMyNC4K
ClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+
CgpkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUu
YyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMKaW5kZXggMzNm
OTVkY2YzYy4uM2Q3NGRiYmI0MCAxMDA2NDQKLS0tIGEvdG9vbHMveGVuc3Rv
cmUveGVuc3RvcmVkX2NvcmUuYworKysgYi90b29scy94ZW5zdG9yZS94ZW5z
dG9yZWRfY29yZS5jCkBAIC02NzQsNiArNjc0LDkgQEAgdm9pZCBzZW5kX3Jl
cGx5KHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCBlbnVtIHhzZF9zb2NrbXNn
X3R5cGUgdHlwZSwKIAkvKiBSZXBsaWVzIHJldXNlIHRoZSByZXF1ZXN0IGJ1
ZmZlciwgZXZlbnRzIG5lZWQgYSBuZXcgb25lLiAqLwogCWlmICh0eXBlICE9
IFhTX1dBVENIX0VWRU5UKSB7CiAJCWJkYXRhID0gY29ubi0+aW47CisJCS8q
IERyb3AgYXN5bmNocm9ub3VzIHJlc3BvbnNlcywgZS5nLiBlcnJvcnMgZm9y
IHdhdGNoIGV2ZW50cy4gKi8KKwkJaWYgKCFiZGF0YSkKKwkJCXJldHVybjsK
IAkJYmRhdGEtPmluaGRyID0gdHJ1ZTsKIAkJYmRhdGEtPnVzZWQgPSAwOwog
CQljb25uLT5pbiA9IE5VTEw7CmRpZmYgLS1naXQgYS90b29scy94ZW5zdG9y
ZS94ZW5zdG9yZWRfd2F0Y2guYyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3Jl
ZF93YXRjaC5jCmluZGV4IDcxYzEwOGVhOTkuLjlmZjIwNjkwYzAgMTAwNjQ0
Ci0tLSBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF93YXRjaC5jCisrKyBi
L3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF93YXRjaC5jCkBAIC05Miw2ICs5
MiwxMCBAQCBzdGF0aWMgdm9pZCBhZGRfZXZlbnQoc3RydWN0IGNvbm5lY3Rp
b24gKmNvbm4sCiAJfQogCiAJbGVuID0gc3RybGVuKG5hbWUpICsgMSArIHN0
cmxlbih3YXRjaC0+dG9rZW4pICsgMTsKKwkvKiBEb24ndCB0cnkgdG8gc2Vu
ZCBvdmVyLWxvbmcgZXZlbnRzLiAqLworCWlmIChsZW4gPiBYRU5TVE9SRV9Q
QVlMT0FEX01BWCkKKwkJcmV0dXJuOworCiAJZGF0YSA9IHRhbGxvY19hcnJh
eShjdHgsIGNoYXIsIGxlbik7CiAJaWYgKCFkYXRhKQogCQlyZXR1cm47Cg==

--=separator--

