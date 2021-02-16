Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C30A731CA97
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 13:36:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85544.160547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBzaU-0002le-3t; Tue, 16 Feb 2021 12:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85544.160547; Tue, 16 Feb 2021 12:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBzaT-0002kG-R1; Tue, 16 Feb 2021 12:36:17 +0000
Received: by outflank-mailman (input) for mailman id 85544;
 Tue, 16 Feb 2021 12:36:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y7oK=HS=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1lBzaR-0001zG-R5
 for xen-devel@lists.xen.org; Tue, 16 Feb 2021 12:36:15 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64ffd9fb-5b5f-406e-9569-84fe0147aac7;
 Tue, 16 Feb 2021 12:35:34 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1lBzZh-0008Mj-8f; Tue, 16 Feb 2021 12:35:29 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1lBzZh-0002ZO-3z; Tue, 16 Feb 2021 12:35:29 +0000
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
X-Inumbo-ID: 64ffd9fb-5b5f-406e-9569-84fe0147aac7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=6uIFfku8/Q5IsCoK+QTF4nmrkhXMtquEX3JaPS97YIU=; b=bDZA++vMBKc3gSRgVHpMDYWhO6
	a53h5gkN/Mu4INhupxvR4tjZNbkCU5xxc3by3YuhgFlU4ZuYvxfBO3WrHXXNTrSrmxQJavmiQhG4D
	gPwrhsRPEY7e7CMImoH5qAIWoeh59TPhU8+VouZK4Tu9liTXg5qO6UH9yomsgTpaaZ9o=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 361 v4 (CVE-2021-26932) - Linux: grant
 mapping error handling issues
Message-Id: <E1lBzZh-0002ZO-3z@xenbits.xenproject.org>
Date: Tue, 16 Feb 2021 12:35:29 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2021-26932 / XSA-361
                               version 4

                Linux: grant mapping error handling issues

UPDATES IN VERSION 4
====================

Public release.

ISSUE DESCRIPTION
=================

Grant mapping operations often occur in batch hypercalls, where a
number of operations are done in a single hypercall, the success or
failure of each one reported to the backend driver, and the backend
driver then loops over the results, performing follow-up actions based
on the success or failure of each operation.

Unfortunately, when running in PV mode, the Linux backend drivers
mishandle this: Some errors are ignored, effectively implying their
success from the success of related batch elements.  In other cases,
errors resulting from one batch element lead to further batch elements
not being inspected, and hence successful ones to not be possible to
properly unmap upon error recovery.

IMPACT
======

A malicious or buggy frontend driver may be able to crash the
corresponding backend driver, causing a denial of service potentially
affecting the entire domain running the backend driver.

A malicious or buggy frontend driver may be able to cause resource
leaks in the domain running the corresponding backend driver, leading
to a denial of service.

VULNERABLE SYSTEMS
==================

All Linux versions back to at least 3.2 are vulnerable, when running in
PV mode on x86 or when running on Arm.

On x86, only systems with Linux backends running in PV mode are
vulnerable.  Linux backends run in HVM / PVH modes are not vulnerable.

MITIGATION
==========

On x86, running the backends in HVM or PVH domains will avoid the
vulnerability.

For protocols where other, e.g. non-kernel-based backends are available,
reconfiguring guests to use alternative (e.g. qemu-based) backends may
allow to avoid the vulnerability as long as these backends don't rely on
similar functionality provided by the xen-gntdev (/dev/gntdev) driver.

In all other cases there is no known mitigation.

CREDITS
=======

This issue was discovered by Jan Beulich of SUSE.

RESOLUTION
==========

Applying the attached patches resolves this issue.

xsa361-linux-1.patch           Linux 5.11-rc - 3.19
xsa361-linux-2.patch           Linux 5.11-rc - 3.15
xsa361-linux-3.patch           Linux 5.11-rc - 4.19
xsa361-linux-4.patch           Linux 5.11-rc - 4.19
xsa361-linux-5.patch           Linux 5.11-rc - 4.4

$ sha256sum xsa361*
bb00ab6319b4fc536566af50c73e064f10f8b99eaa6b0f0b35a8d174c285a905  xsa361-linux-1.patch
73b6a54aa3773ce11f0de6b9aa1d80dd7f4c297dc71924b1a3886bc3b99ac859  xsa361-linux-2.patch
8e554cfab8cdb4fe1b74601a9432ea4c570f74a952ad757f9294ba1666cbeaea  xsa361-linux-3.patch
8c290895d10fc148f99e2a6587811b3037f29c3a0201d69d448ff520cea6f96d  xsa361-linux-4.patch
231ae3e1b9bec1b75dbbbee4b5acff620ef7ac2853332aa7b3c4957c6ca7f341  xsa361-linux-5.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches described above (or others which are
substantially similar) is permitted during the embargo, even on
public-facing systems with untrusted guest users and administrators.

Deployment of the mitigation to switch to HVM / PVH backend domains is
also permitted during the embargo, even on public-facing systems with
untrusted guest users and administrators.

HOWEVER, deployment of the non-kernel-based backends mitigation
described above is NOT permitted during the embargo on public-facing
systems with untrusted guest users and administrators.  This is because
such a configuration change may be recognizable by the affected guests.

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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmAru/QMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZmFkH/Ay1RoZbbcA4ywdhy9xdnpt0DHMFLjZSbE4sNTi+
J+m9rn69UTK01VDD0RUohTcmWO0nv8ZD+jKETsSq31GiYhVk7XnSmCJkzILGujr8
cf+7jUWWJPcqBmN7xcLBaor9lhpKfMpYlMLBG7twIRHfqOSw6Sm+iD4YC23nkGKF
Cb8tpkYCpX3dPMMP74nX00Wta2rqd1BrpAGvAnt9hrHIBfTcpwWE8A4H1eFL/7Dv
5+pVvrSMkyzaR5kI/QBeriXsuOP509CiafUBpeXU85pGWpLgZAqD+puodEVQ2fpT
/MqATdNRhgnCzqSqh/ElN/1ZdB7406DbdCnErJiyDdN/OCE=
=DUXr
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa361-linux-1.patch"
Content-Disposition: attachment; filename="xsa361-linux-1.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBYZW4veDg2OiBkb24ndCBiYWlsIGVhcmx5IGZyb20gY2xlYXJfZm9yZWln
bl9wMm1fbWFwcGluZygpCgpJdHMgc2libGluZyAoc2V0X2ZvcmVpZ25fcDJt
X21hcHBpbmcoKSkgYXMgd2VsbCBhcyB0aGUgc2libGluZyBvZiBpdHMKb25s
eSBjYWxsZXIgKGdudHRhYl9tYXBfcmVmcygpKSBkb24ndCBjbGVhbiB1cCBh
ZnRlciB0aGVtc2VsdmVzIGluIGNhc2UKb2YgZXJyb3IuIEhpZ2hlciBsZXZl
bCBjYWxsZXJzIGFyZSBleHBlY3RlZCB0byBkbyBzby4gSG93ZXZlciwgaW4g
b3JkZXIKZm9yIHRoYXQgdG8gcmVhbGx5IGNsZWFuIHVwIGFueSBwYXJ0aWFs
bHkgc2V0IHVwIHN0YXRlLCB0aGUgb3BlcmF0aW9uCnNob3VsZCBub3QgdGVy
bWluYXRlIHVwb24gZW5jb3VudGVyaW5nIGFuIGVudHJ5IGluIHVuZXhwZWN0
ZWQgc3RhdGUuIEl0CmlzIHBhcnRpY3VsYXJseSByZWxldmFudCB0byBub3Rp
Y2UgaGVyZSB0aGF0IHNldF9mb3JlaWduX3AybV9tYXBwaW5nKCkKd291bGQg
c2tpcCBzZXR0aW5nIHVwIGEgcDJtIGVudHJ5IGlmIGl0cyBncmFudCBtYXBw
aW5nIGZhaWxlZCwgYnV0IGl0CndvdWxkIGNvbnRpbnVlIHRvIHNldCB1cCBm
dXJ0aGVyIHAybSBlbnRyaWVzIGFzIGxvbmcgYXMgdGhlaXIgbWFwcGluZ3MK
c3VjY2VlZGVkLgoKQXJndWFibHkgZG93biB0aGUgcm9hZCBzZXRfZm9yZWln
bl9wMm1fbWFwcGluZygpIG1heSB3YW50IGl0cyBwYWdlIHN0YXRlCnJlbGF0
ZWQgV0FSTl9PTigpIGFsc28gY29udmVydGVkIHRvIGFuIGVycm9yIHJldHVy
bi4KClRoaXMgaXMgcGFydCBvZiBYU0EtMzYxLgoKU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogc3RhYmxlQHZn
ZXIua2VybmVsLm9yZwpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgoKLS0tIGEvYXJjaC94ODYveGVuL3AybS5jCisrKyBi
L2FyY2gveDg2L3hlbi9wMm0uYwpAQCAtNzUwLDE3ICs3NTAsMTUgQEAgaW50
IGNsZWFyX2ZvcmVpZ25fcDJtX21hcHBpbmcoc3RydWN0IGdudAogCQl1bnNp
Z25lZCBsb25nIG1mbiA9IF9fcGZuX3RvX21mbihwYWdlX3RvX3BmbihwYWdl
c1tpXSkpOwogCQl1bnNpZ25lZCBsb25nIHBmbiA9IHBhZ2VfdG9fcGZuKHBh
Z2VzW2ldKTsKIAotCQlpZiAobWZuID09IElOVkFMSURfUDJNX0VOVFJZIHx8
ICEobWZuICYgRk9SRUlHTl9GUkFNRV9CSVQpKSB7CisJCWlmIChtZm4gIT0g
SU5WQUxJRF9QMk1fRU5UUlkgJiYgKG1mbiAmIEZPUkVJR05fRlJBTUVfQklU
KSkKKwkJCXNldF9waHlzX3RvX21hY2hpbmUocGZuLCBJTlZBTElEX1AyTV9F
TlRSWSk7CisJCWVsc2UKIAkJCXJldCA9IC1FSU5WQUw7Ci0JCQlnb3RvIG91
dDsKLQkJfQotCi0JCXNldF9waHlzX3RvX21hY2hpbmUocGZuLCBJTlZBTElE
X1AyTV9FTlRSWSk7CiAJfQogCWlmIChrdW5tYXBfb3BzKQogCQlyZXQgPSBI
WVBFUlZJU09SX2dyYW50X3RhYmxlX29wKEdOVFRBQk9QX3VubWFwX2dyYW50
X3JlZiwKLQkJCQkJCWt1bm1hcF9vcHMsIGNvdW50KTsKLW91dDoKKwkJCQkJ
CWt1bm1hcF9vcHMsIGNvdW50KSA/OiByZXQ7CisKIAlyZXR1cm4gcmV0Owog
fQogRVhQT1JUX1NZTUJPTF9HUEwoY2xlYXJfZm9yZWlnbl9wMm1fbWFwcGlu
Zyk7Cg==

--=separator
Content-Type: application/octet-stream; name="xsa361-linux-2.patch"
Content-Disposition: attachment; filename="xsa361-linux-2.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBYZW4veDg2OiBhbHNvIGNoZWNrIGtlcm5lbCBtYXBwaW5nIGluIHNldF9m
b3JlaWduX3AybV9tYXBwaW5nKCkKCldlIHNob3VsZCBub3Qgc2V0IHVwIGZ1
cnRoZXIgc3RhdGUgaWYgZWl0aGVyIG1hcHBpbmcgZmFpbGVkOyBwYXlpbmcK
YXR0ZW50aW9uIHRvIGp1c3QgdGhlIHVzZXIgbWFwcGluZydzIHN0YXR1cyBp
c24ndCBlbm91Z2guCgpBbHNvIHVzZSBHTlRTVF9va2F5IGluc3RlYWQgb2Yg
aW1wbHlpbmcgaXRzIHZhbHVlICh6ZXJvKS4KClRoaXMgaXMgcGFydCBvZiBY
U0EtMzYxLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpSZXZpZXdl
ZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKLS0tIGEv
YXJjaC94ODYveGVuL3AybS5jCisrKyBiL2FyY2gveDg2L3hlbi9wMm0uYwpA
QCAtNzEyLDcgKzcxMiw4IEBAIGludCBzZXRfZm9yZWlnbl9wMm1fbWFwcGlu
ZyhzdHJ1Y3QgZ250dGEKIAkJdW5zaWduZWQgbG9uZyBtZm4sIHBmbjsKIAog
CQkvKiBEbyBub3QgYWRkIHRvIG92ZXJyaWRlIGlmIHRoZSBtYXAgZmFpbGVk
LiAqLwotCQlpZiAobWFwX29wc1tpXS5zdGF0dXMpCisJCWlmIChtYXBfb3Bz
W2ldLnN0YXR1cyAhPSBHTlRTVF9va2F5IHx8CisJCSAgICAoa21hcF9vcHMg
JiYga21hcF9vcHNbaV0uc3RhdHVzICE9IEdOVFNUX29rYXkpKQogCQkJY29u
dGludWU7CiAKIAkJaWYgKG1hcF9vcHNbaV0uZmxhZ3MgJiBHTlRNQVBfY29u
dGFpbnNfcHRlKSB7Cg==

--=separator
Content-Type: application/octet-stream; name="xsa361-linux-3.patch"
Content-Disposition: attachment; filename="xsa361-linux-3.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBYZW4vZ250ZGV2OiBjb3JyZWN0IGRldl9idXNfYWRkciBoYW5kbGluZyBp
biBnbnRkZXZfbWFwX2dyYW50X3BhZ2VzKCkKCldlIG1heSBub3Qgc2tpcCBz
ZXR0aW5nIHRoZSBmaWVsZCBpbiB0aGUgdW5tYXAgc3RydWN0dXJlIHdoZW4K
R05UTUFQX2RldmljZV9tYXAgaXMgaW4gdXNlIC0gc3VjaCBhbiB1bm1hcCB3
b3VsZCBmYWlsIHRvIHJlbGVhc2UgdGhlCnJlc3BlY3RpdmUgcmVzb3VyY2Vz
IChhIHBhZ2UgcmVmIGluIHRoZSBoeXBlcnZpc29yKS4gT3RvaCB0aGUgZmll
bGQKZG9lc24ndCBuZWVkIHNldHRpbmcgYXQgYWxsIHdoZW4gR05UTUFQX2Rl
dmljZV9tYXAgaXMgbm90IGluIHVzZS4KClRvIHJlY29yZCB0aGUgdmFsdWUg
Zm9yIHVubWFwcGluZywgd2UgYWxzbyBiZXR0ZXIgZG9uJ3QgdXNlIG91ciBs
b2NhbApwMm06IEluIHBhcnRpY3VsYXIgYWZ0ZXIgYSBzdWJzZXF1ZW50IGNo
YW5nZSBpdCBtYXkgbm90IGhhdmUgZ290IHVwZGF0ZWQKZm9yIGFsbCB0aGUg
YmF0Y2ggZWxlbWVudHMuIEluc3RlYWQgaXQgY2FuIHNpbXBseSBiZSB0YWtl
biBmcm9tIHRoZQpyZXNwZWN0aXZlIG1hcCdzIHJlc3VsdHMuCgpXZSBjYW4g
YWRkaXRpb25hbGx5IGF2b2lkIHBsYXlpbmcgdGhpcyBnYW1lIGFsdG9nZXRo
ZXIgZm9yIHRoZSBrZXJuZWwKcGFydCBvZiB0aGUgbWFwcGluZ3MgaW4gKHg4
NikgUFYgbW9kZS4KClRoaXMgaXMgcGFydCBvZiBYU0EtMzYxLgoKU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZwpSZXZpZXdlZC1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgotLS0KdjQ6IFNw
bGl0IGZyb20gc3Vic2VxdWVudCBwYXRjaC4KCi0tLSBhL2RyaXZlcnMveGVu
L2dudGRldi5jCisrKyBiL2RyaXZlcnMveGVuL2dudGRldi5jCkBAIC0zMDks
MTggKzMwOSwyNSBAQCBpbnQgZ250ZGV2X21hcF9ncmFudF9wYWdlcyhzdHJ1
Y3QgZ250ZGV2CiAJCSAqIHRvIHRoZSBrZXJuZWwgbGluZWFyIGFkZHJlc3Nl
cyBvZiB0aGUgc3RydWN0IHBhZ2VzLgogCQkgKiBUaGVzZSBwdGVzIGFyZSBj
b21wbGV0ZWx5IGRpZmZlcmVudCBmcm9tIHRoZSB1c2VyIHB0ZXMgZGVhbHQK
IAkJICogd2l0aCBmaW5kX2dyYW50X3B0ZXMuCisJCSAqIE5vdGUgdGhhdCBH
TlRNQVBfZGV2aWNlX21hcCBpc24ndCBuZWVkZWQgaGVyZTogVGhlCisJCSAq
IGRldl9idXNfYWRkciBvdXRwdXQgZmllbGQgZ2V0cyBjb25zdW1lZCBvbmx5
IGZyb20gLT5tYXBfb3BzLAorCQkgKiBhbmQgYnkgbm90IHJlcXVlc3Rpbmcg
aXQgd2hlbiBtYXBwaW5nIHdlIGFsc28gYXZvaWQgbmVlZGluZworCQkgKiB0
byBtaXJyb3IgZGV2X2J1c19hZGRyIGludG8gLT51bm1hcF9vcHMgKGFuZCBo
b2xkaW5nIGFuIGV4dHJhCisJCSAqIHJlZmVyZW5jZSB0byB0aGUgcGFnZSBp
biB0aGUgaHlwZXJ2aXNvcikuCiAJCSAqLworCQl1bnNpZ25lZCBpbnQgZmxh
Z3MgPSAobWFwLT5mbGFncyAmIH5HTlRNQVBfZGV2aWNlX21hcCkgfAorCQkJ
CSAgICAgR05UTUFQX2hvc3RfbWFwOworCiAJCWZvciAoaSA9IDA7IGkgPCBt
YXAtPmNvdW50OyBpKyspIHsKIAkJCXVuc2lnbmVkIGxvbmcgYWRkcmVzcyA9
ICh1bnNpZ25lZCBsb25nKQogCQkJCXBmbl90b19rYWRkcihwYWdlX3RvX3Bm
bihtYXAtPnBhZ2VzW2ldKSk7CiAJCQlCVUdfT04oUGFnZUhpZ2hNZW0obWFw
LT5wYWdlc1tpXSkpOwogCi0JCQlnbnR0YWJfc2V0X21hcF9vcCgmbWFwLT5r
bWFwX29wc1tpXSwgYWRkcmVzcywKLQkJCQltYXAtPmZsYWdzIHwgR05UTUFQ
X2hvc3RfbWFwLAorCQkJZ250dGFiX3NldF9tYXBfb3AoJm1hcC0+a21hcF9v
cHNbaV0sIGFkZHJlc3MsIGZsYWdzLAogCQkJCW1hcC0+Z3JhbnRzW2ldLnJl
ZiwKIAkJCQltYXAtPmdyYW50c1tpXS5kb21pZCk7CiAJCQlnbnR0YWJfc2V0
X3VubWFwX29wKCZtYXAtPmt1bm1hcF9vcHNbaV0sIGFkZHJlc3MsCi0JCQkJ
bWFwLT5mbGFncyB8IEdOVE1BUF9ob3N0X21hcCwgLTEpOworCQkJCWZsYWdz
LCAtMSk7CiAJCX0KIAl9CiAKQEAgLTMzNiwxNyArMzQzLDEyIEBAIGludCBn
bnRkZXZfbWFwX2dyYW50X3BhZ2VzKHN0cnVjdCBnbnRkZXYKIAkJCWNvbnRp
bnVlOwogCQl9CiAKKwkJaWYgKG1hcC0+ZmxhZ3MgJiBHTlRNQVBfZGV2aWNl
X21hcCkKKwkJCW1hcC0+dW5tYXBfb3BzW2ldLmRldl9idXNfYWRkciA9IG1h
cC0+bWFwX29wc1tpXS5kZXZfYnVzX2FkZHI7CisKIAkJbWFwLT51bm1hcF9v
cHNbaV0uaGFuZGxlID0gbWFwLT5tYXBfb3BzW2ldLmhhbmRsZTsKIAkJaWYg
KHVzZV9wdGVtb2QpCiAJCQltYXAtPmt1bm1hcF9vcHNbaV0uaGFuZGxlID0g
bWFwLT5rbWFwX29wc1tpXS5oYW5kbGU7Ci0jaWZkZWYgQ09ORklHX1hFTl9H
UkFOVF9ETUFfQUxMT0MKLQkJZWxzZSBpZiAobWFwLT5kbWFfdmFkZHIpIHsK
LQkJCXVuc2lnbmVkIGxvbmcgYmZuOwotCi0JCQliZm4gPSBwZm5fdG9fYmZu
KHBhZ2VfdG9fcGZuKG1hcC0+cGFnZXNbaV0pKTsKLQkJCW1hcC0+dW5tYXBf
b3BzW2ldLmRldl9idXNfYWRkciA9IF9fcGZuX3RvX3BoeXMoYmZuKTsKLQkJ
fQotI2VuZGlmCiAJfQogCXJldHVybiBlcnI7CiB9Cg==

--=separator
Content-Type: application/octet-stream; name="xsa361-linux-4.patch"
Content-Disposition: attachment; filename="xsa361-linux-4.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBYZW4vZ250ZGV2OiBjb3JyZWN0IGVycm9yIGNoZWNraW5nIGluIGdudGRl
dl9tYXBfZ3JhbnRfcGFnZXMoKQoKRmFpbHVyZSBvZiB0aGUga2VybmVsIHBh
cnQgb2YgdGhlIG1hcHBpbmcgb3BlcmF0aW9uIHNob3VsZCBhbHNvIGJlCmlu
ZGljYXRlZCBhcyBhbiBlcnJvciB0byB0aGUgY2FsbGVyLCBvciBlbHNlIGl0
IG1heSBhc3N1bWUgdGhlCnJlc3BlY3RpdmUga2VybmVsIFZBIGlzIG9rYXkg
dG8gYWNjZXNzLgoKRnVydGhlcm1vcmUgZ250dGFiX21hcF9yZWZzKCkgZmFp
bGluZyBzdGlsbCByZXF1aXJlcyByZWNvcmRpbmcKc3VjY2Vzc2Z1bGx5IG1h
cHBlZCBoYW5kbGVzLCBzbyB0aGV5IGNhbiBiZSB1bm1hcHBlZCBzdWJzZXF1
ZW50bHkuIFRoaXMKaW4gdHVybiByZXF1aXJlcyB0aGVyZSB0byBiZSBhIHdh
eSB0byB0ZWxsIGZ1bGwgaHlwZXJjYWxsIGZhaWx1cmUgZnJvbQpwYXJ0aWFs
IHN1Y2Nlc3MgLSBwcmVzZXQgbWFwX29wIHN0YXR1cyBmaWVsZHMgc3VjaCB0
aGF0IHRoZXkgd29uJ3QKImhhcHBlbiIgdG8gbG9vayBhcyBpZiB0aGUgb3Bl
cmF0aW9uIHN1Y2NlZWRlZC4KCkFsc28gYWdhaW4gdXNlIEdOVFNUX29rYXkg
aW5zdGVhZCBvZiBpbXBseWluZyBpdHMgdmFsdWUgKHplcm8pLgoKVGhpcyBp
cyBwYXJ0IG9mIFhTQS0zNjEuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBzdGFibGVAdmdlci5rZXJuZWwu
b3JnClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Ci0tLQp2NDogU3BsaXQgb3V0IHRoZSB2MyBjaGFuZ2VzIGFuZCByZS1i
YXNlIG92ZXIgdGhlIHJlc3VsdGluZyBlYXJsaWVyCiAgICBwYXRjaC4KdjM6
IEFsc28gZml4IEdOVE1BUF9kZXZpY2VfbWFwIC8gLT5kZXZfYnVzX2FkZHIg
aGFuZGxpbmcuCnYyOiBEcm9wIGFuIGluYXBwbGljYWJsZSBwYXJ0IG9mIHRo
ZSBkZXNjcmlwdGlvbi4gVXNlIDEgaW5zdGVhZCBvZgogICAgX19MSU5FX18u
CgotLS0gYS9kcml2ZXJzL3hlbi9nbnRkZXYuYworKysgYi9kcml2ZXJzL3hl
bi9nbnRkZXYuYwpAQCAtMzM0LDIxICszMzQsMjIgQEAgaW50IGdudGRldl9t
YXBfZ3JhbnRfcGFnZXMoc3RydWN0IGdudGRldgogCXByX2RlYnVnKCJtYXAg
JWQrJWRcbiIsIG1hcC0+aW5kZXgsIG1hcC0+Y291bnQpOwogCWVyciA9IGdu
dHRhYl9tYXBfcmVmcyhtYXAtPm1hcF9vcHMsIHVzZV9wdGVtb2QgPyBtYXAt
PmttYXBfb3BzIDogTlVMTCwKIAkJCW1hcC0+cGFnZXMsIG1hcC0+Y291bnQp
OwotCWlmIChlcnIpCi0JCXJldHVybiBlcnI7CiAKIAlmb3IgKGkgPSAwOyBp
IDwgbWFwLT5jb3VudDsgaSsrKSB7Ci0JCWlmIChtYXAtPm1hcF9vcHNbaV0u
c3RhdHVzKSB7CisJCWlmIChtYXAtPm1hcF9vcHNbaV0uc3RhdHVzID09IEdO
VFNUX29rYXkpCisJCQltYXAtPnVubWFwX29wc1tpXS5oYW5kbGUgPSBtYXAt
Pm1hcF9vcHNbaV0uaGFuZGxlOworCQllbHNlIGlmICghZXJyKQogCQkJZXJy
ID0gLUVJTlZBTDsKLQkJCWNvbnRpbnVlOwotCQl9CiAKIAkJaWYgKG1hcC0+
ZmxhZ3MgJiBHTlRNQVBfZGV2aWNlX21hcCkKIAkJCW1hcC0+dW5tYXBfb3Bz
W2ldLmRldl9idXNfYWRkciA9IG1hcC0+bWFwX29wc1tpXS5kZXZfYnVzX2Fk
ZHI7CiAKLQkJbWFwLT51bm1hcF9vcHNbaV0uaGFuZGxlID0gbWFwLT5tYXBf
b3BzW2ldLmhhbmRsZTsKLQkJaWYgKHVzZV9wdGVtb2QpCi0JCQltYXAtPmt1
bm1hcF9vcHNbaV0uaGFuZGxlID0gbWFwLT5rbWFwX29wc1tpXS5oYW5kbGU7
CisJCWlmICh1c2VfcHRlbW9kKSB7CisJCQlpZiAobWFwLT5rbWFwX29wc1tp
XS5zdGF0dXMgPT0gR05UU1Rfb2theSkKKwkJCQltYXAtPmt1bm1hcF9vcHNb
aV0uaGFuZGxlID0gbWFwLT5rbWFwX29wc1tpXS5oYW5kbGU7CisJCQllbHNl
IGlmICghZXJyKQorCQkJCWVyciA9IC1FSU5WQUw7CisJCX0KIAl9CiAJcmV0
dXJuIGVycjsKIH0KLS0tIGEvaW5jbHVkZS94ZW4vZ3JhbnRfdGFibGUuaAor
KysgYi9pbmNsdWRlL3hlbi9ncmFudF90YWJsZS5oCkBAIC0xNTcsNiArMTU3
LDcgQEAgZ250dGFiX3NldF9tYXBfb3Aoc3RydWN0IGdudHRhYl9tYXBfZ3Jh
bgogCW1hcC0+ZmxhZ3MgPSBmbGFnczsKIAltYXAtPnJlZiA9IHJlZjsKIAlt
YXAtPmRvbSA9IGRvbWlkOworCW1hcC0+c3RhdHVzID0gMTsgLyogYXJiaXRy
YXJ5IHBvc2l0aXZlIHZhbHVlICovCiB9CiAKIHN0YXRpYyBpbmxpbmUgdm9p
ZAo=

--=separator
Content-Type: application/octet-stream; name="xsa361-linux-5.patch"
Content-Disposition: attachment; filename="xsa361-linux-5.patch"
Content-Transfer-Encoding: base64

RnJvbTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlA
eGlsaW54LmNvbT4KU3ViamVjdDogeGVuL2FybTogZG9uJ3QgaWdub3JlIHJl
dHVybiBlcnJvcnMgZnJvbSBzZXRfcGh5c190b19tYWNoaW5lCgpzZXRfcGh5
c190b19tYWNoaW5lIGNhbiBmYWlsIGR1ZSB0byBsYWNrIG9mIG1lbW9yeSwg
c2VlIHRoZSBremFsbG9jIGNhbGwKaW4gYXJjaC9hcm0veGVuL3AybS5jOl9f
c2V0X3BoeXNfdG9fbWFjaGluZV9tdWx0aS4KCkRvbid0IGlnbm9yZSB0aGUg
cG90ZW50aWFsIHJldHVybiBlcnJvciBpbiBzZXRfZm9yZWlnbl9wMm1fbWFw
cGluZywKcmV0dXJuaW5nIGl0IHRvIHRoZSBjYWxsZXIgaW5zdGVhZC4KClRo
aXMgaXMgcGFydCBvZiBYU0EtMzYxLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFu
byBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54LmNvbT4K
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKUmV2aWV3ZWQtYnk6IEp1bGll
biBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+CgotLS0gYS9hcmNoL2FybS94
ZW4vcDJtLmMKKysrIGIvYXJjaC9hcm0veGVuL3AybS5jCkBAIC05NSw4ICs5
NSwxMCBAQCBpbnQgc2V0X2ZvcmVpZ25fcDJtX21hcHBpbmcoc3RydWN0IGdu
dHRhYl9tYXBfZ3JhbnRfcmVmICptYXBfb3BzLAogCWZvciAoaSA9IDA7IGkg
PCBjb3VudDsgaSsrKSB7CiAJCWlmIChtYXBfb3BzW2ldLnN0YXR1cykKIAkJ
CWNvbnRpbnVlOwotCQlzZXRfcGh5c190b19tYWNoaW5lKG1hcF9vcHNbaV0u
aG9zdF9hZGRyID4+IFhFTl9QQUdFX1NISUZULAotCQkJCSAgICBtYXBfb3Bz
W2ldLmRldl9idXNfYWRkciA+PiBYRU5fUEFHRV9TSElGVCk7CisJCWlmICh1
bmxpa2VseSghc2V0X3BoeXNfdG9fbWFjaGluZShtYXBfb3BzW2ldLmhvc3Rf
YWRkciA+PiBYRU5fUEFHRV9TSElGVCwKKwkJCQkgICAgbWFwX29wc1tpXS5k
ZXZfYnVzX2FkZHIgPj4gWEVOX1BBR0VfU0hJRlQpKSkgeworCQkJcmV0dXJu
IC1FTk9NRU07CisJCX0KIAl9CiAKIAlyZXR1cm4gMDsKCg==

--=separator--

