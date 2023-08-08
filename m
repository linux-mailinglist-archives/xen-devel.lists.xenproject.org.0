Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D6D774034
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 19:00:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580129.908441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTQ4D-0007Nj-71; Tue, 08 Aug 2023 17:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580129.908441; Tue, 08 Aug 2023 17:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTQ4D-0007M3-3n; Tue, 08 Aug 2023 17:00:21 +0000
Received: by outflank-mailman (input) for mailman id 580129;
 Tue, 08 Aug 2023 17:00:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T7Ie=DZ=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1qTQ4B-0007KP-Nd
 for xen-devel@lists.xen.org; Tue, 08 Aug 2023 17:00:19 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b054daf-360d-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 19:00:15 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1qTQ3w-0002Cv-Ig; Tue, 08 Aug 2023 17:00:04 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1qTQ3w-0002JL-FQ; Tue, 08 Aug 2023 17:00:04 +0000
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
X-Inumbo-ID: 0b054daf-360d-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=hx/b/ysblgOZvwHoYIpAdSgwsVEOYjRPfsd5/+vNC9k=; b=0DBpqTbjDr8PJUmiugsxaL363J
	ZWHE8GoyZaK4fHSBjk6bca98y80xB/RKuSadVHblLGpj3ceLkOooIBE0JnLHN53OQnNq6adHxxj7j
	8slVTZJRPziCiSVbeKyPB4RhCqNOfuK5hDimQIdAsL1aq4MpWX8qOecTwdslljwwWrjI=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 432 v2 (CVE-2023-34319) - Linux: buffer
 overrun in netback due to unusual packet
Message-Id: <E1qTQ3w-0002JL-FQ@xenbits.xenproject.org>
Date: Tue, 08 Aug 2023 17:00:04 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2023-34319 / XSA-432
                               version 2

        Linux: buffer overrun in netback due to unusual packet

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

The fix for XSA-423 added logic to Linux'es netback driver to deal with
a frontend splitting a packet in a way such that not all of the headers
would come in one piece.  Unfortunately the logic introduced there
didn't account for the extreme case of the entire packet being split
into as many pieces as permitted by the protocol, yet still being
smaller than the area that's specially dealt with to keep all (possible)
headers together.  Such an unusual packet would therefore trigger a
buffer overrun in the driver.

IMPACT
======

An unprivileged guest can cause Denial of Service (DoS) of the host by
sending network packets to the backend, causing the backend to crash.

Data corruption or privilege escalation seem unlikely but have not been
ruled out.

VULNERABLE SYSTEMS
==================

All systems using a Linux based network backend with kernel 3.19 and
newer are vulnerable, on the assumption that the fix for XSA-423 was
taken.  Systems using other network backends are not known to be
vulnerable.

MITIGATION
==========

Using another PV network backend (e.g. the qemu based "qnic" backend)
will mitigate the problem.

Using a dedicated network driver domain per guest will mitigate the
problem.

CREDITS
=======

This issue was discovered by Ross Lagerwall of Citrix.

RESOLUTION
==========

Applying the attached patch resolves this issue.

xsa432-linux.patch           Linux 6.3 - 6.5-rc

$ sha256sum xsa432*
bf7acd23be1d185c40aca8b4f7700e25afd482d9ac8671ae22b021380b059091  xsa432-linux.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmTSZKYMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZv9YH+wSW/H8BRo3hat2ssz4GOkNf/okVzOFyde0n6rsI
uPeRbRqjnd9f+rvHFIYhi9sa2MUSZ9Lg/WwmZ1YdTFXB1PBZw1iDujB1HvDu7Xlm
E0f6IkdhC17YaiBnmsUOwGhE/1wj0KOF86t92VX5skWK9NQ2OMOSYsBxHLFkNmBd
VNHApva8ICfSfUA4pXuh3Zgaw2yw8k2ZcyFN8Aixd+1Vrxq7jfZ/PUL6hfLaNjLs
a5xdj/b5+RuwRMqOI8jCFQXSgZLPDtZIIAFRi93ZMtUraARSjiN0tLpoRXsKp1u+
0T1sgTApHJGTm7jgPAz3WMCh2innRBkEVvU55hRKZ4INIbc=
=mMq6
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa432-linux.patch"
Content-Disposition: attachment; filename="xsa432-linux.patch"
Content-Transfer-Encoding: base64

RnJvbTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5j
b20+ClN1YmplY3Q6IHhlbi9uZXRiYWNrOiBGaXggYnVmZmVyIG92ZXJydW4g
dHJpZ2dlcmVkIGJ5IHVudXN1YWwgcGFja2V0CgpJdCBpcyBwb3NzaWJsZSB0
aGF0IGEgZ3Vlc3QgY2FuIHNlbmQgYSBwYWNrZXQgdGhhdCBjb250YWlucyBh
IGhlYWQgKyAxOApzbG90cyBhbmQgeWV0IGhhcyBhIGxlbiA8PSBYRU5fTkVU
QkFDS19UWF9DT1BZX0xFTi4gVGhpcyBjYXVzZXMgbnJfc2xvdHMKdG8gdW5k
ZXJmbG93IGluIHhlbnZpZl9nZXRfcmVxdWVzdHMoKSB3aGljaCB0aGVuIGNh
dXNlcyB0aGUgc3Vic2VxdWVudApsb29wJ3MgdGVybWluYXRpb24gY29uZGl0
aW9uIHRvIGJlIHdyb25nLCBjYXVzaW5nIGEgYnVmZmVyIG92ZXJydW4gb2YK
cXVldWUtPnR4X21hcF9vcHMuCgpSZXdvcmsgdGhlIGNvZGUgdG8gYWNjb3Vu
dCBmb3IgdGhlIGV4dHJhIGZyYWdfb3ZlcmZsb3cgc2xvdHMuCgpUaGlzIGlz
IENWRS0yMDIzLTM0MzE5IC8gWFNBLTQzMi4KCkZpeGVzOiBhZDdmNDAyYWU0
ZjQgKCJ4ZW4vbmV0YmFjazogRW5zdXJlIHByb3RvY29sIGhlYWRlcnMgZG9u
J3QgZmFsbCBpbiB0aGUgbm9uLWxpbmVhciBhcmVhIikKU2lnbmVkLW9mZi1i
eTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+
ClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KUmV2
aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXVAa2VybmVsLm9yZz4KLS0tCiBk
cml2ZXJzL25ldC94ZW4tbmV0YmFjay9uZXRiYWNrLmMgfCAxNSArKysrKysr
KysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3hlbi1u
ZXRiYWNrL25ldGJhY2suYyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL25l
dGJhY2suYwppbmRleCBjMTUwMWY0MWUyZDguLjcyMDkxYjMzMTk2MyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svbmV0YmFjay5jCisr
KyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL25ldGJhY2suYwpAQCAtMzk2
LDcgKzM5Niw3IEBAIHN0YXRpYyB2b2lkIHhlbnZpZl9nZXRfcmVxdWVzdHMo
c3RydWN0IHhlbnZpZl9xdWV1ZSAqcXVldWUsCiAJc3RydWN0IGdudHRhYl9t
YXBfZ3JhbnRfcmVmICpnb3AgPSBxdWV1ZS0+dHhfbWFwX29wcyArICptYXBf
b3BzOwogCXN0cnVjdCB4ZW5fbmV0aWZfdHhfcmVxdWVzdCAqdHhwID0gZmly
c3Q7CiAKLQlucl9zbG90cyA9IHNoaW5mby0+bnJfZnJhZ3MgKyAxOworCW5y
X3Nsb3RzID0gc2hpbmZvLT5ucl9mcmFncyArIGZyYWdfb3ZlcmZsb3cgKyAx
OwogCiAJY29weV9jb3VudChza2IpID0gMDsKIAlYRU5WSUZfVFhfQ0Ioc2ti
KS0+c3BsaXRfbWFzayA9IDA7CkBAIC00NjIsOCArNDYyLDggQEAgc3RhdGlj
IHZvaWQgeGVudmlmX2dldF9yZXF1ZXN0cyhzdHJ1Y3QgeGVudmlmX3F1ZXVl
ICpxdWV1ZSwKIAkJfQogCX0KIAotCWZvciAoc2hpbmZvLT5ucl9mcmFncyA9
IDA7IHNoaW5mby0+bnJfZnJhZ3MgPCBucl9zbG90czsKLQkgICAgIHNoaW5m
by0+bnJfZnJhZ3MrKywgZ29wKyspIHsKKwlmb3IgKHNoaW5mby0+bnJfZnJh
Z3MgPSAwOyBucl9zbG90cyA+IDAgJiYgc2hpbmZvLT5ucl9mcmFncyA8IE1B
WF9TS0JfRlJBR1M7CisJICAgICBzaGluZm8tPm5yX2ZyYWdzKyssIGdvcCsr
LCBucl9zbG90cy0tKSB7CiAJCWluZGV4ID0gcGVuZGluZ19pbmRleChxdWV1
ZS0+cGVuZGluZ19jb25zKyspOwogCQlwZW5kaW5nX2lkeCA9IHF1ZXVlLT5w
ZW5kaW5nX3JpbmdbaW5kZXhdOwogCQl4ZW52aWZfdHhfY3JlYXRlX21hcF9v
cChxdWV1ZSwgcGVuZGluZ19pZHgsIHR4cCwKQEAgLTQ3NiwxMiArNDc2LDEy
IEBAIHN0YXRpYyB2b2lkIHhlbnZpZl9nZXRfcmVxdWVzdHMoc3RydWN0IHhl
bnZpZl9xdWV1ZSAqcXVldWUsCiAJCQl0eHArKzsKIAl9CiAKLQlpZiAoZnJh
Z19vdmVyZmxvdykgeworCWlmIChucl9zbG90cyA+IDApIHsKIAogCQlzaGlu
Zm8gPSBza2Jfc2hpbmZvKG5za2IpOwogCQlmcmFncyA9IHNoaW5mby0+ZnJh
Z3M7CiAKLQkJZm9yIChzaGluZm8tPm5yX2ZyYWdzID0gMDsgc2hpbmZvLT5u
cl9mcmFncyA8IGZyYWdfb3ZlcmZsb3c7CisJCWZvciAoc2hpbmZvLT5ucl9m
cmFncyA9IDA7IHNoaW5mby0+bnJfZnJhZ3MgPCBucl9zbG90czsKIAkJICAg
ICBzaGluZm8tPm5yX2ZyYWdzKyssIHR4cCsrLCBnb3ArKykgewogCQkJaW5k
ZXggPSBwZW5kaW5nX2luZGV4KHF1ZXVlLT5wZW5kaW5nX2NvbnMrKyk7CiAJ
CQlwZW5kaW5nX2lkeCA9IHF1ZXVlLT5wZW5kaW5nX3JpbmdbaW5kZXhdOwpA
QCAtNDkyLDYgKzQ5MiwxMSBAQCBzdGF0aWMgdm9pZCB4ZW52aWZfZ2V0X3Jl
cXVlc3RzKHN0cnVjdCB4ZW52aWZfcXVldWUgKnF1ZXVlLAogCQl9CiAKIAkJ
c2tiX3NoaW5mbyhza2IpLT5mcmFnX2xpc3QgPSBuc2tiOworCX0gZWxzZSBp
ZiAobnNrYikgeworCQkvKiBBIGZyYWdfbGlzdCBza2Igd2FzIGFsbG9jYXRl
ZCBidXQgaXQgaXMgbm8gbG9uZ2VyIG5lZWRlZAorCQkgKiBiZWNhdXNlIGVu
b3VnaCBzbG90cyB3ZXJlIGNvbnZlcnRlZCB0byBjb3B5IG9wcyBhYm92ZS4K
KwkJICovCisJCWtmcmVlX3NrYihuc2tiKTsKIAl9CiAKIAkoKmNvcHlfb3Bz
KSA9IGNvcCAtIHF1ZXVlLT50eF9jb3B5X29wczsK

--=separator--

