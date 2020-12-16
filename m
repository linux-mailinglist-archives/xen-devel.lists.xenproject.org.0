Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F83B2DC4FF
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 18:05:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55424.96626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpaEY-0001gk-M7; Wed, 16 Dec 2020 17:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55424.96626; Wed, 16 Dec 2020 17:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpaEY-0001g5-Hk; Wed, 16 Dec 2020 17:05:02 +0000
Received: by outflank-mailman (input) for mailman id 55424;
 Wed, 16 Dec 2020 17:05:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DfXp=FU=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kpaEX-0001Ls-8H
 for xen-devel@lists.xen.org; Wed, 16 Dec 2020 17:05:01 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eca3f244-30d2-4811-90bd-f80ecdddecbf;
 Wed, 16 Dec 2020 17:04:39 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1kpaE5-0003ne-JC; Wed, 16 Dec 2020 17:04:33 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1kpaE5-0006zV-Gk; Wed, 16 Dec 2020 17:04:33 +0000
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
X-Inumbo-ID: eca3f244-30d2-4811-90bd-f80ecdddecbf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=VjL2K3I6xHxwJ5PIAY3BGQUreSWLBHFBY5XsSudfb48=; b=QJZmExHmf5/+4nUx6r3uN9LFw7
	nL/D0QNv0eGMVzZ2rbCmJKu225eHoyOn49rseQu2SLx7AQa8mcowXvVKU5OqDZnxDaPWEH7No0DAc
	shtGlg5cRo8zz38EPF2j1JLEcd8k+wMg4LBoAyAbO0hiLbhe0ME1uJ5k4unmHXT64aeY=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 358 v5 (CVE-2020-29570) - FIFO event
 channels control block related ordering
Message-Id: <E1kpaE5-0006zV-Gk@xenbits.xenproject.org>
Date: Wed, 16 Dec 2020 17:04:33 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2020-29570 / XSA-358
                               version 5

          FIFO event channels control block related ordering

UPDATES IN VERSION 5
====================

"Unstable" patch updated (needed re-basing).

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

xsa358.patch           xen-unstable
xsa358-4.14.patch      Xen 4.14 - 4.10

$ sha256sum xsa358*
0e8428a52e9bedafb2d8cbbb8dffae4e882e4b0898e4e7df3576c99e0e607167  xsa358.meta
c0763c85287d138a02dc795aa5d2e903ca7efc641390bee53ea2f7473f4f95af  xsa358.patch
937a3786d3d0147aef63eed373ed1df9ede75d1fabf5ad8f6ccaacfbf7fbcf42  xsa358-4.14.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl/aPhoMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZhWkH/08MG6OKo6O0vXv9PuznO/6JPjpSmAgkQYUBqYkw
cAp/yq1kXo3kA+TyHQUPZwBzWx+B0OAG7OBDIoyDlVRhj5Z24YINY+knWzocyXmn
7b6p8RdEf47cvWYn3Nugh2KXDdVo+CZ2C597kUBJSSuAJicT3BU3NIexXXLM9phU
zeGcm39u4/ucZoBAAzP8IlsjxTs3woZG8ZlNNRrcF2QF98AWK1joIR3j54bWqwKs
xvI+BLOXjhpr9Q2P/WY7zQsvWfw2dRsYpGMtPRpug+jpYOV51q//CnrDoSF7mXj9
oHMklW1n/C+U0NeXMXdiwb+PhcP40m1ltya0Vfal8rPH1G4=
=GzHh
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
UGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTM1OC00LjE0LnBhdGNoIgog
ICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICI0LjEx
IjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAg
ICAgICAgIlN0YWJsZVJlZiI6ICI0MWE4MjJjMzkyNjM1MGYyNjkxN2Q3NDdj
OGRmZWQxYzQ0YTJjZjQyIiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAg
ICAgICAgICAzNTMsCiAgICAgICAgICAgIDExNSwKICAgICAgICAgICAgMzIy
LAogICAgICAgICAgICAzMjMsCiAgICAgICAgICAgIDMyNCwKICAgICAgICAg
ICAgMzI1LAogICAgICAgICAgICAzMzAsCiAgICAgICAgICAgIDM1MiwKICAg
ICAgICAgICAgMzQ4LAogICAgICAgICAgICAzNTYKICAgICAgICAgIF0sCiAg
ICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTM1OC00LjE0
LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwK
ICAgICI0LjEyIjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVu
IjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICI4MTQ1ZDM4YjQ4MDA5MjU1
YTMyYWI4N2EwMmU0ODFjZDA5YzgxMWY5IiwKICAgICAgICAgICJQcmVyZXFz
IjogWwogICAgICAgICAgICAzNTMsCiAgICAgICAgICAgIDExNSwKICAgICAg
ICAgICAgMzIyLAogICAgICAgICAgICAzMjMsCiAgICAgICAgICAgIDMyNCwK
ICAgICAgICAgICAgMzI1LAogICAgICAgICAgICAzMzAsCiAgICAgICAgICAg
IDM1MiwKICAgICAgICAgICAgMzQ4LAogICAgICAgICAgICAzNTYKICAgICAg
ICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhz
YTM1OC00LjE0LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAg
fQogICAgfSwKICAgICI0LjEzIjogewogICAgICAiUmVjaXBlcyI6IHsKICAg
ICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICJiNTMwMjI3
M2UyYzUxOTQwMTcyNDAwNDg2NjQ0NjM2ZjJmNGZjNjRhIiwKICAgICAgICAg
ICJQcmVyZXFzIjogWwogICAgICAgICAgICAzNTMsCiAgICAgICAgICAgIDEx
NSwKICAgICAgICAgICAgMzIyLAogICAgICAgICAgICAzMjMsCiAgICAgICAg
ICAgIDMyNCwKICAgICAgICAgICAgMzI1LAogICAgICAgICAgICAzMzAsCiAg
ICAgICAgICAgIDM1MiwKICAgICAgICAgICAgMzQ4LAogICAgICAgICAgICAz
NTYKICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAg
ICAgICAgInhzYTM1OC00LjE0LnBhdGNoIgogICAgICAgICAgXQogICAgICAg
IH0KICAgICAgfQogICAgfSwKICAgICI0LjE0IjogewogICAgICAiUmVjaXBl
cyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6
ICIxZDFkMWY1MzkxOTc2NDU2YTc5ZGFhYzBkY2ZlNzE1N2RhMWU1NGY3IiwK
ICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAzNTMsCiAgICAg
ICAgICAgIDExNSwKICAgICAgICAgICAgMzIyLAogICAgICAgICAgICAzMjMs
CiAgICAgICAgICAgIDMyNCwKICAgICAgICAgICAgMzI1LAogICAgICAgICAg
ICAzMzAsCiAgICAgICAgICAgIDM1MiwKICAgICAgICAgICAgMzQ4LAogICAg
ICAgICAgICAzNTYKICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6
IFsKICAgICAgICAgICAgInhzYTM1OC00LjE0LnBhdGNoIgogICAgICAgICAg
XQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICJtYXN0ZXIiOiB7CiAg
ICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAi
U3RhYmxlUmVmIjogImRjOGIwMWFmZmQ3ZjZmMzZkMzRjMzg1NGY1MWRmMDg0
N2RmM2VjMGUiLAogICAgICAgICAgIlByZXJlcXMiOiBbXSwKICAgICAgICAg
ICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMzU4LnBhdGNoIgogICAg
ICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfQogIH0KfQ==

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
LmNvbT4KLS0tCnY0OiBSZS1iYXNlLgp2MzogRHJvcCByZWFkLXNpZGUgYmFy
cmllciBhZ2FpbiwgbGV2ZXJhZ2luZyBndWVzdF90ZXN0X2FuZF9zZXRfYml0
KCkuCnYyOiBSZS1iYXNlIG92ZXIgcXVldWUgbG9ja2luZyByZS13b3JrLgoK
LS0tIGEveGVuL2NvbW1vbi9ldmVudF9maWZvLmMKKysrIGIveGVuL2NvbW1v
bi9ldmVudF9maWZvLmMKQEAgLTI0OSw2ICsyNDksMTAgQEAgc3RhdGljIHZv
aWQgZXZ0Y2huX2ZpZm9fc2V0X3BlbmRpbmcoc3RydQogICAgICAqIExpbmsg
dGhlIGV2ZW50IGlmIGl0IHVubWFza2VkIGFuZCBub3QgYWxyZWFkeSBsaW5r
ZWQuCiAgICAgICovCiAgICAgaWYgKCAhZ3Vlc3RfdGVzdF9iaXQoZCwgRVZU
Q0hOX0ZJRk9fTUFTS0VELCB3b3JkKSAmJgorICAgICAgICAgLyoKKyAgICAg
ICAgICAqIFRoaXMgYWxzbyBhY3RzIGFzIHRoZSByZWFkIGNvdW50ZXJwYXJ0
IG9mIHRoZSBzbXBfd21iKCkgaW4KKyAgICAgICAgICAqIG1hcF9jb250cm9s
X2Jsb2NrKCkuCisgICAgICAgICAgKi8KICAgICAgICAgICFndWVzdF90ZXN0
X2FuZF9zZXRfYml0KGQsIEVWVENITl9GSUZPX0xJTktFRCwgd29yZCkgKQog
ICAgIHsKICAgICAgICAgLyoKQEAgLTQ3NCw2ICs0NzgsNyBAQCBzdGF0aWMg
aW50IHNldHVwX2NvbnRyb2xfYmxvY2soc3RydWN0IHZjCiBzdGF0aWMgaW50
IG1hcF9jb250cm9sX2Jsb2NrKHN0cnVjdCB2Y3B1ICp2LCB1aW50NjRfdCBn
Zm4sIHVpbnQzMl90IG9mZnNldCkKIHsKICAgICB2b2lkICp2aXJ0OworICAg
IHN0cnVjdCBldnRjaG5fZmlmb19jb250cm9sX2Jsb2NrICpjb250cm9sX2Js
b2NrOwogICAgIHVuc2lnbmVkIGludCBpOwogICAgIGludCByYzsKIApAQCAt
NDg0LDEwICs0ODksMTUgQEAgc3RhdGljIGludCBtYXBfY29udHJvbF9ibG9j
ayhzdHJ1Y3QgdmNwdQogICAgIGlmICggcmMgPCAwICkKICAgICAgICAgcmV0
dXJuIHJjOwogCi0gICAgdi0+ZXZ0Y2huX2ZpZm8tPmNvbnRyb2xfYmxvY2sg
PSB2aXJ0ICsgb2Zmc2V0OworICAgIGNvbnRyb2xfYmxvY2sgPSB2aXJ0ICsg
b2Zmc2V0OwogCiAgICAgZm9yICggaSA9IDA7IGkgPD0gRVZUQ0hOX0ZJRk9f
UFJJT1JJVFlfTUlOOyBpKysgKQotICAgICAgICB2LT5ldnRjaG5fZmlmby0+
cXVldWVbaV0uaGVhZCA9ICZ2LT5ldnRjaG5fZmlmby0+Y29udHJvbF9ibG9j
ay0+aGVhZFtpXTsKKyAgICAgICAgdi0+ZXZ0Y2huX2ZpZm8tPnF1ZXVlW2ld
LmhlYWQgPSAmY29udHJvbF9ibG9jay0+aGVhZFtpXTsKKworICAgIC8qIEFs
bCBxdWV1ZSBoZWFkcyBtdXN0IGhhdmUgYmVlbiBzZXQgYmVmb3JlIHNldHRp
bmcgdGhlIGNvbnRyb2wgYmxvY2suICovCisgICAgc21wX3dtYigpOworCisg
ICAgdi0+ZXZ0Y2huX2ZpZm8tPmNvbnRyb2xfYmxvY2sgPSBjb250cm9sX2Js
b2NrOwogCiAgICAgcmV0dXJuIDA7CiB9Cg==

--=separator
Content-Type: application/octet-stream; name="xsa358-4.14.patch"
Content-Disposition: attachment; filename="xsa358-4.14.patch"
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
LmNvbT4KCi0tLSBhL3hlbi9jb21tb24vZXZlbnRfZmlmby5jCisrKyBiL3hl
bi9jb21tb24vZXZlbnRfZmlmby5jCkBAIC0yNDksNiArMjQ5LDEwIEBAIHN0
YXRpYyB2b2lkIGV2dGNobl9maWZvX3NldF9wZW5kaW5nKHN0cnUKICAgICAg
ICAgICAgIGdvdG8gdW5sb2NrOwogICAgICAgICB9CiAKKyAgICAgICAgLyoK
KyAgICAgICAgICogVGhpcyBhbHNvIGFjdHMgYXMgdGhlIHJlYWQgY291bnRl
cnBhcnQgb2YgdGhlIHNtcF93bWIoKSBpbgorICAgICAgICAgKiBtYXBfY29u
dHJvbF9ibG9jaygpLgorICAgICAgICAgKi8KICAgICAgICAgaWYgKCBndWVz
dF90ZXN0X2FuZF9zZXRfYml0KGQsIEVWVENITl9GSUZPX0xJTktFRCwgd29y
ZCkgKQogICAgICAgICAgICAgZ290byB1bmxvY2s7CiAKQEAgLTQ3NCw2ICs0
NzgsNyBAQCBzdGF0aWMgaW50IHNldHVwX2NvbnRyb2xfYmxvY2soc3RydWN0
IHZjCiBzdGF0aWMgaW50IG1hcF9jb250cm9sX2Jsb2NrKHN0cnVjdCB2Y3B1
ICp2LCB1aW50NjRfdCBnZm4sIHVpbnQzMl90IG9mZnNldCkKIHsKICAgICB2
b2lkICp2aXJ0OworICAgIHN0cnVjdCBldnRjaG5fZmlmb19jb250cm9sX2Js
b2NrICpjb250cm9sX2Jsb2NrOwogICAgIHVuc2lnbmVkIGludCBpOwogICAg
IGludCByYzsKIApAQCAtNDg0LDEwICs0ODksMTUgQEAgc3RhdGljIGludCBt
YXBfY29udHJvbF9ibG9jayhzdHJ1Y3QgdmNwdQogICAgIGlmICggcmMgPCAw
ICkKICAgICAgICAgcmV0dXJuIHJjOwogCi0gICAgdi0+ZXZ0Y2huX2ZpZm8t
PmNvbnRyb2xfYmxvY2sgPSB2aXJ0ICsgb2Zmc2V0OworICAgIGNvbnRyb2xf
YmxvY2sgPSB2aXJ0ICsgb2Zmc2V0OwogCiAgICAgZm9yICggaSA9IDA7IGkg
PD0gRVZUQ0hOX0ZJRk9fUFJJT1JJVFlfTUlOOyBpKysgKQotICAgICAgICB2
LT5ldnRjaG5fZmlmby0+cXVldWVbaV0uaGVhZCA9ICZ2LT5ldnRjaG5fZmlm
by0+Y29udHJvbF9ibG9jay0+aGVhZFtpXTsKKyAgICAgICAgdi0+ZXZ0Y2hu
X2ZpZm8tPnF1ZXVlW2ldLmhlYWQgPSAmY29udHJvbF9ibG9jay0+aGVhZFtp
XTsKKworICAgIC8qIEFsbCBxdWV1ZSBoZWFkcyBtdXN0IGhhdmUgYmVlbiBz
ZXQgYmVmb3JlIHNldHRpbmcgdGhlIGNvbnRyb2wgYmxvY2suICovCisgICAg
c21wX3dtYigpOworCisgICAgdi0+ZXZ0Y2huX2ZpZm8tPmNvbnRyb2xfYmxv
Y2sgPSBjb250cm9sX2Jsb2NrOwogCiAgICAgcmV0dXJuIDA7CiB9Cg==

--=separator--

