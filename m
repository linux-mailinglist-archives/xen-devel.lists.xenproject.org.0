Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B4E2DAD3A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 13:29:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.53335.93065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp9ST-0000CF-0I; Tue, 15 Dec 2020 12:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 53335.93065; Tue, 15 Dec 2020 12:29:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp9SS-0000Ak-Or; Tue, 15 Dec 2020 12:29:36 +0000
Received: by outflank-mailman (input) for mailman id 53335;
 Tue, 15 Dec 2020 12:29:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tdgx=FT=xenbits.xen.org=gdunlap@srs-us1.protection.inumbo.net>)
 id 1kp9LK-0004tM-55
 for xen-devel@lists.xen.org; Tue, 15 Dec 2020 12:22:14 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9eead270-3558-4f71-b4c2-f23cd526df3c;
 Tue, 15 Dec 2020 12:20:32 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gdunlap@xenbits.xen.org>)
 id 1kp9Jc-0005ke-AN; Tue, 15 Dec 2020 12:20:28 +0000
Received: from gdunlap by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <gdunlap@xenbits.xen.org>)
 id 1kp9Jc-0007Bp-9a; Tue, 15 Dec 2020 12:20:28 +0000
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
X-Inumbo-ID: 9eead270-3558-4f71-b4c2-f23cd526df3c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=qwX7c8Iq4udLBN2i+1bIIl7S6k70oFw1h75yc/A/GH8=; b=WaOy0XVVA/VZUwpBih3i5GNSiH
	CJZN7Dw0VxwgSaoxeUHepeKMzzy/Q/DGubTRElChX4cjmwwjseIyUKNugI/4JN3rf7KYwjMRLHd2k
	sQORxrR1lb7IlaLD6e4fzItcF0/p8451p/HxgvEPYYYCCAUdwyxpJ33uOjsoIqMaBvF4=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 358 v4 (CVE-2020-29570) - FIFO event
 channels control block related ordering
Message-Id: <E1kp9Jc-0007Bp-9a@xenbits.xenproject.org>
Date: Tue, 15 Dec 2020 12:20:28 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2020-29570 / XSA-358
                               version 4

          FIFO event channels control block related ordering

UPDATES IN VERSION 4
====================

Public release.

ISSUE DESCRIPTION
=================

Recording of the per-vCPU control block mapping maintained by Xen and
that of pointers into the control block is reversed.  The consumer
assumes, seeing the former initialized, that the latter are also ready
for use.

IMPACT
======

Malicious or buggy guest kernels can mount a Denial of Service (DoS)
attack affecting the entire system.

VULNERABLE SYSTEMS
==================

All Xen versions from 4.4 onwards are vulnerable.  Xen versions 4.3 and
earlier are not vulnerable.

MITIGATION
==========

There is no known mitigation.

CREDITS
=======

This issue was discovered by Julien Grall of Amazon.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa358.patch           xen-unstable - 4.10

$ sha256sum xsa358*
c8392659f71ea31574f9f82ab80a37e1359e8b8178d7b060167500bfb134eecc  xsa358.meta
ee719ff8dbf30794ddac1464267cb47c1aac7e39da32d82263f4aebc1a9b509b  xsa358.patch
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
b3JnAAoJEIP+FMlX6CvZlv0H/0tFfvZ8aKiUPFYwu/9WgNwLZIZJUgqIt1q1ooxt
6S+e8yHGhg3mBoAmfqN38sffVdD14z9DVFfIpMtrZpyfGzX2kmCPwC+MAtPliaNC
8rH7CDJHuQU35z5c/3q12pldtAFKLBhhqulg3Q5jLHi/HAKvypJFibLyqmqY+Uoo
yEMqpE1UtzhoYD4RsttcT1chGiBn8Gk8wBVcLx/SzzcU6xJ+X0F37VaIyTPW+69l
74ov4jzpt667mr4VtNOCmIAHuRZNLhValRUwzwSvGGjmiF8ACKbeKZ5IQ3m7gCBA
7fNRaRDdsKJi9amdifKfyn28u/+ltkPoCK6jAQcO1Eg/+0Q=
=lxX6
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa358.meta"
Content-Disposition: attachment; filename="xsa358.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzNTgsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNCIsCiAgICAiNC4xMyIsCiAgICAiNC4xMiIs
CiAgICAiNC4xMSIsCiAgICAiNC4xMCIKICBdLAogICJUcmVlcyI6IFsKICAg
ICJ4ZW4iCiAgXSwKICAiUmVjaXBlcyI6IHsKICAgICI0LjEwIjogewogICAg
ICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0
YWJsZVJlZiI6ICIxZDcyZDk5MTVlZGZmMGRkNDFmNjAxYmJiMGIxZjgzYzAy
ZmYxNjg5IiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAz
NTMsCiAgICAgICAgICAgIDExNSwKICAgICAgICAgICAgMzIyLAogICAgICAg
ICAgICAzMjMsCiAgICAgICAgICAgIDMyNCwKICAgICAgICAgICAgMzI1LAog
ICAgICAgICAgICAzMzAsCiAgICAgICAgICAgIDM1MiwKICAgICAgICAgICAg
MzQ4LAogICAgICAgICAgICAzNTYKICAgICAgICAgIF0sCiAgICAgICAgICAi
UGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTM1OC5wYXRjaCIKICAgICAg
ICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC4xMSI6IHsK
ICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAg
ICJTdGFibGVSZWYiOiAiNDFhODIyYzM5MjYzNTBmMjY5MTdkNzQ3YzhkZmVk
MWM0NGEyY2Y0MiIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAg
ICAgMzUzLAogICAgICAgICAgICAxMTUsCiAgICAgICAgICAgIDMyMiwKICAg
ICAgICAgICAgMzIzLAogICAgICAgICAgICAzMjQsCiAgICAgICAgICAgIDMy
NSwKICAgICAgICAgICAgMzMwLAogICAgICAgICAgICAzNTIsCiAgICAgICAg
ICAgIDM0OCwKICAgICAgICAgICAgMzU2CiAgICAgICAgICBdLAogICAgICAg
ICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EzNTgucGF0Y2giCiAg
ICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQuMTIi
OiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAg
ICAgICAiU3RhYmxlUmVmIjogIjgxNDVkMzhiNDgwMDkyNTVhMzJhYjg3YTAy
ZTQ4MWNkMDljODExZjkiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAg
ICAgICAgIDM1MywKICAgICAgICAgICAgMTE1LAogICAgICAgICAgICAzMjIs
CiAgICAgICAgICAgIDMyMywKICAgICAgICAgICAgMzI0LAogICAgICAgICAg
ICAzMjUsCiAgICAgICAgICAgIDMzMCwKICAgICAgICAgICAgMzUyLAogICAg
ICAgICAgICAzNDgsCiAgICAgICAgICAgIDM1NgogICAgICAgICAgXSwKICAg
ICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMzU4LnBhdGNo
IgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICI0
LjEzIjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewog
ICAgICAgICAgIlN0YWJsZVJlZiI6ICJiNTMwMjI3M2UyYzUxOTQwMTcyNDAw
NDg2NjQ0NjM2ZjJmNGZjNjRhIiwKICAgICAgICAgICJQcmVyZXFzIjogWwog
ICAgICAgICAgICAzNTMsCiAgICAgICAgICAgIDExNSwKICAgICAgICAgICAg
MzIyLAogICAgICAgICAgICAzMjMsCiAgICAgICAgICAgIDMyNCwKICAgICAg
ICAgICAgMzI1LAogICAgICAgICAgICAzMzAsCiAgICAgICAgICAgIDM1MiwK
ICAgICAgICAgICAgMzQ4LAogICAgICAgICAgICAzNTYKICAgICAgICAgIF0s
CiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTM1OC5w
YXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAg
ICAiNC4xNCI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6
IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiMWQxZDFmNTM5MTk3NjQ1NmE3
OWRhYWMwZGNmZTcxNTdkYTFlNTRmNyIsCiAgICAgICAgICAiUHJlcmVxcyI6
IFsKICAgICAgICAgICAgMzUzLAogICAgICAgICAgICAxMTUsCiAgICAgICAg
ICAgIDMyMiwKICAgICAgICAgICAgMzIzLAogICAgICAgICAgICAzMjQsCiAg
ICAgICAgICAgIDMyNSwKICAgICAgICAgICAgMzMwLAogICAgICAgICAgICAz
NTIsCiAgICAgICAgICAgIDM0OCwKICAgICAgICAgICAgMzU2CiAgICAgICAg
ICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2Ez
NTgucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9
LAogICAgIm1hc3RlciI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAg
InhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiM2FlNDY5YWY4ZTY4
MGRmMzFlZWNkMGEyYWM2YTgzYjU4YWQ3Y2U1MyIsCiAgICAgICAgICAiUHJl
cmVxcyI6IFsKICAgICAgICAgICAgMzUzLAogICAgICAgICAgICAxMTUsCiAg
ICAgICAgICAgIDMyMiwKICAgICAgICAgICAgMzIzLAogICAgICAgICAgICAz
MjQsCiAgICAgICAgICAgIDMyNSwKICAgICAgICAgICAgMzMwLAogICAgICAg
ICAgICAzNTIsCiAgICAgICAgICAgIDM0OCwKICAgICAgICAgICAgMzU2CiAg
ICAgICAgICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAg
ICJ4c2EzNTgucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9
CiAgICB9CiAgfQp9

--=separator
Content-Type: application/octet-stream; name="xsa358.patch"
Content-Disposition: attachment; filename="xsa358.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBldnRjaG4vRklGTzogcmUtb3JkZXIgYW5kIHN5bmNocm9uaXplICh3aXRo
KSBtYXBfY29udHJvbF9ibG9jaygpCgpGb3IgZXZ0Y2huX2ZpZm9fc2V0X3Bl
bmRpbmcoKSdzIGNoZWNrIG9mIHRoZSBjb250cm9sIGJsb2NrIGhhdmluZyBi
ZWVuCnNldCB0byBiZSBlZmZlY3RpdmUsIG9yZGVyaW5nIG9mIHJlc3BlY3Rp
dmUgcmVhZHMgYW5kIHdyaXRlcyBuZWVkcyB0byBiZQplbnN1cmVkOiBUaGUg
Y29udHJvbCBibG9jayBwb2ludGVyIG5lZWRzIHRvIGJlIHJlY29yZGVkIHN0
cmljdGx5IGFmdGVyCnRoZSBzZXR0aW5nIG9mIGFsbCB0aGUgcXVldWUgaGVh
ZHMsIGFuZCBpdCBuZWVkcyBjaGVja2luZyBzdHJpY3RseQpiZWZvcmUgYW55
IHVzZXMgb2YgdGhlbSAodGhpcyBsYXR0ZXIgYXNwZWN0IHdhcyBhbHJlYWR5
IGd1YXJhbnRlZWQpLgoKVGhpcyBpcyBYU0EtMzU4IC8gQ1ZFLTIwMjAtMjk1
NzAuCgpSZXBvcnRlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9u
LmNvbT4KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9u
LmNvbT4KLS0tCnYzOiBEcm9wIHJlYWQtc2lkZSBiYXJyaWVyIGFnYWluLCBs
ZXZlcmFnaW5nIGd1ZXN0X3Rlc3RfYW5kX3NldF9iaXQoKS4KdjI6IFJlLWJh
c2Ugb3ZlciBxdWV1ZSBsb2NraW5nIHJlLXdvcmsuCgotLS0gYS94ZW4vY29t
bW9uL2V2ZW50X2ZpZm8uYworKysgYi94ZW4vY29tbW9uL2V2ZW50X2ZpZm8u
YwpAQCAtMjQ5LDYgKzI0OSwxMCBAQCBzdGF0aWMgdm9pZCBldnRjaG5fZmlm
b19zZXRfcGVuZGluZyhzdHJ1CiAgICAgICAgICAgICBnb3RvIHVubG9jazsK
ICAgICAgICAgfQogCisgICAgICAgIC8qCisgICAgICAgICAqIFRoaXMgYWxz
byBhY3RzIGFzIHRoZSByZWFkIGNvdW50ZXJwYXJ0IG9mIHRoZSBzbXBfd21i
KCkgaW4KKyAgICAgICAgICogbWFwX2NvbnRyb2xfYmxvY2soKS4KKyAgICAg
ICAgICovCiAgICAgICAgIGlmICggZ3Vlc3RfdGVzdF9hbmRfc2V0X2JpdChk
LCBFVlRDSE5fRklGT19MSU5LRUQsIHdvcmQpICkKICAgICAgICAgICAgIGdv
dG8gdW5sb2NrOwogCkBAIC00NzQsNiArNDc4LDcgQEAgc3RhdGljIGludCBz
ZXR1cF9jb250cm9sX2Jsb2NrKHN0cnVjdCB2Ywogc3RhdGljIGludCBtYXBf
Y29udHJvbF9ibG9jayhzdHJ1Y3QgdmNwdSAqdiwgdWludDY0X3QgZ2ZuLCB1
aW50MzJfdCBvZmZzZXQpCiB7CiAgICAgdm9pZCAqdmlydDsKKyAgICBzdHJ1
Y3QgZXZ0Y2huX2ZpZm9fY29udHJvbF9ibG9jayAqY29udHJvbF9ibG9jazsK
ICAgICB1bnNpZ25lZCBpbnQgaTsKICAgICBpbnQgcmM7CiAKQEAgLTQ4NCwx
MCArNDg5LDE1IEBAIHN0YXRpYyBpbnQgbWFwX2NvbnRyb2xfYmxvY2soc3Ry
dWN0IHZjcHUKICAgICBpZiAoIHJjIDwgMCApCiAgICAgICAgIHJldHVybiBy
YzsKIAotICAgIHYtPmV2dGNobl9maWZvLT5jb250cm9sX2Jsb2NrID0gdmly
dCArIG9mZnNldDsKKyAgICBjb250cm9sX2Jsb2NrID0gdmlydCArIG9mZnNl
dDsKIAogICAgIGZvciAoIGkgPSAwOyBpIDw9IEVWVENITl9GSUZPX1BSSU9S
SVRZX01JTjsgaSsrICkKLSAgICAgICAgdi0+ZXZ0Y2huX2ZpZm8tPnF1ZXVl
W2ldLmhlYWQgPSAmdi0+ZXZ0Y2huX2ZpZm8tPmNvbnRyb2xfYmxvY2stPmhl
YWRbaV07CisgICAgICAgIHYtPmV2dGNobl9maWZvLT5xdWV1ZVtpXS5oZWFk
ID0gJmNvbnRyb2xfYmxvY2stPmhlYWRbaV07CisKKyAgICAvKiBBbGwgcXVl
dWUgaGVhZHMgbXVzdCBoYXZlIGJlZW4gc2V0IGJlZm9yZSBzZXR0aW5nIHRo
ZSBjb250cm9sIGJsb2NrLiAqLworICAgIHNtcF93bWIoKTsKKworICAgIHYt
PmV2dGNobl9maWZvLT5jb250cm9sX2Jsb2NrID0gY29udHJvbF9ibG9jazsK
IAogICAgIHJldHVybiAwOwogfQo=

--=separator--

