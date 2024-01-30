Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2B38425EB
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 14:13:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673354.1047769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUnvj-00028E-5K; Tue, 30 Jan 2024 13:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673354.1047769; Tue, 30 Jan 2024 13:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUnvj-000252-1L; Tue, 30 Jan 2024 13:13:35 +0000
Received: by outflank-mailman (input) for mailman id 673354;
 Tue, 30 Jan 2024 13:13:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Uj/=JI=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1rUnvh-0000pk-47
 for xen-devel@lists.xen.org; Tue, 30 Jan 2024 13:13:33 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bf34ca0-bf71-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 14:13:29 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1rUnvX-0007gF-K5; Tue, 30 Jan 2024 13:13:23 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1rUnvX-000489-JF; Tue, 30 Jan 2024 13:13:23 +0000
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
X-Inumbo-ID: 5bf34ca0-bf71-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=MXOcSlCBkJ9CQ70sgwho1Hwl0C2uGWGNgUiDqvNQmeA=; b=HtjqrOiEjLyYRzoqhEeDG5Pkb/
	/ZmSQ9Mf8Du/Vjo9oGqBBgoSZXC3WbGtjwdOPVlBCIAfJpvfnR2AwIe3jo361ZePUw7wHKonw9Rvb
	mrCKYskXWzu2WGQ/Kwrz3oko2vbd/Bz+YplSipxdwziZHcVQjqfjd6XofZyHupPupnhM=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 450 v2 (CVE-2023-46840) - VT-d: Failure to
 quarantine devices in !HVM builds
Message-Id: <E1rUnvX-000489-JF@xenbits.xenproject.org>
Date: Tue, 30 Jan 2024 13:13:23 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2023-46840 / XSA-450
                               version 2

           VT-d: Failure to quarantine devices in !HVM builds

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

Incorrect placement of a preprocessor directive in source code results
in logic that doesn't operate as intended when support for HVM guests is
compiled out of Xen.

IMPACT
======

When a device is removed from a domain, it is not properly quarantined
and retains its access to the domain to which it was previously
assigned.

VULNERABLE SYSTEMS
==================

Xen 4.17 and onwards are vulnerable.  Xen 4.16 and older are not
vulnerable.

Only Xen running on x86 platforms with an Intel-compatible VT-d IOMMU is
vulnerable.  Platforms from other manufacturers, or platforms without a
VT-d IOMMU are not vulnerable.

Only systems where PCI devices are passed through to untrusted or
semi-trusted guests are vulnerable.  Systems which do not assign PCI
devices to untrusted guests are not vulnerable.

Xen is only vulnerable when CONFIG_HVM is disabled at build time.  Most
deployments of Xen are expected to have CONFIG_HVM enabled at build
time, and would therefore not be vulnerable.

MITIGATION
==========

There is no mitigation.

CREDITS
=======

This issue was discovered by Teddy Astie of Vates

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa450.patch           xen-unstable - Xen 4.17.x

$ sha256sum xsa450*
738c79b92ab5ea57f446df3daff6564727fea5feebf8fadeb32acd0cf06ff9fb  xsa450.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmW49MwMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZnwcIALs07CQFYSuQmdgWRYeepkjehMSVhPhvJcYBCFWU
p+80oreGP2pC1LN+T9ndN0kDeUHAO8PeT+XqxHSNfT16Q5EOSeLpUQ8m+UfHUFLU
vtPMjR4sMpnvuZfx0OCMJctDDTM+/muw4AH0BO2zxFfDzGkM96zZ6vAokeer+5HQ
/P9usMm/6jphixVq919RBJ78fFZxKpKhil9tEwNuD6HJW3VNMWp1ypGNyFI3iRhw
XpYzWMB0eW6B6rSInohHJiTS7P6KE5zeXeBPZ5yVHy2J3e3c7nXyrQaaONSRCBdm
/Px2xcg1SpH+3UwoT56Z7tj1DhlgjcY4peb5B58oDK68hMU=
=Dp+G
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa450.patch"
Content-Disposition: attachment; filename="xsa450.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogVlQtZDogRml4ICJlbHNlIiB2cyAiI2VuZGlmIiBtaXNw
bGFjZW1lbnQKCkluIGRvbWFpbl9wZ2RfbWFkZHIoKSB0aGUgIiNlbmRpZiIg
aXMgbWlzcGxhY2VkIHdpdGggcmVzcGVjdCB0byAiZWxzZSIuICBUaGlzCmdl
bmVyYXRlcyBpbmNvcnJlY3QgbG9naWMgd2hlbiBDT05GSUdfSFZNIGlzIGNv
bXBpbGVkIG91dCwgYXMgdGhlICJlbHNlIiBib2R5CmlzIGV4ZWN1dGVkIHVu
Y29uZGl0aW9uYWxseS4KClJld29yayB0aGUgbG9naWMgdG8gdXNlIElTX0VO
QUJMRUQoKSBpbnN0ZWFkIG9mIGV4cGxpY2l0ICNpZmRlZi1hcnksIGFzIGl0
J3MKY2xlYXJlciB0byBmb2xsb3cuICBUaGlzIGluIHR1cm4gaW52b2x2ZXMg
YWRqdXN0aW5nIHAybV9nZXRfcGFnZXRhYmxlKCkgdG8KY29tcGlsZSB3aGVu
IENPTkZJR19IVk0gaXMgZGlzYWJsZWQuCgpUaGlzIGlzIFhTQS00NTAgLyBD
VkUtMjAyMy00Njg0MC4KClJlcG9ydGVkLWJ5OiBSZXBvcnRlZC1ieTogVGVk
ZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+CkZpeGVzOiAwMzNm
ZjkwYWE5YzEgKCJ4ODYvUDJNOiBwMm1fe2FsbG9jLGZyZWV9X3B0cCgpIGFu
ZCBwMm1fYWxsb2NfdGFibGUoKSBhcmUgSFZNLW9ubHkiKQpTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wMm0u
aCBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wMm0uaAppbmRleCAzMmYz
ZjM5NGIwNWEuLjZhZGE1ODVlYWFjMiAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL3AybS5oCisrKyBiL3hlbi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9wMm0uaApAQCAtNDM1LDcgKzQzNSwxNCBAQCBzdGF0aWMgaW5s
aW5lIGJvb2wgcDJtX2lzX2FsdHAybShjb25zdCBzdHJ1Y3QgcDJtX2RvbWFp
biAqcDJtKQogICAgIHJldHVybiBwMm0tPnAybV9jbGFzcyA9PSBwMm1fYWx0
ZXJuYXRlOwogfQogCi0jZGVmaW5lIHAybV9nZXRfcGFnZXRhYmxlKHAybSkg
ICgocDJtKS0+cGh5c190YWJsZSkKKyNpZmRlZiBDT05GSUdfSFZNCitzdGF0
aWMgaW5saW5lIHBhZ2V0YWJsZV90IHAybV9nZXRfcGFnZXRhYmxlKGNvbnN0
IHN0cnVjdCBwMm1fZG9tYWluICpwMm0pCit7CisgICAgcmV0dXJuIHAybS0+
cGh5c190YWJsZTsKK30KKyNlbHNlCitwYWdldGFibGVfdCBwMm1fZ2V0X3Bh
Z2V0YWJsZShjb25zdCBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtKTsKKyNlbmRp
ZgogCiAvKgogICogRW5zdXJlIGFueSBkZWZlcnJlZCBwMm0gVExCIGZsdXNo
IGhhcyBiZWVuIGNvbXBsZXRlZCBvbiBhbGwgVkNQVXMuCmRpZmYgLS1naXQg
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCmluZGV4IDk5YjY0MmYx
MmVmOS4uNDI0NDg1NTAzMmVlIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC92dGQvaW9tbXUuYworKysgYi94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC92dGQvaW9tbXUuYwpAQCAtNDM4LDE1ICs0MzgsMTMgQEAgc3Rh
dGljIHBhZGRyX3QgZG9tYWluX3BnZF9tYWRkcihzdHJ1Y3QgZG9tYWluICpk
LCBwYWRkcl90IHBnZF9tYWRkciwKIAogICAgIGlmICggcGdkX21hZGRyICkK
ICAgICAgICAgLyogbm90aGluZyAqLzsKLSNpZmRlZiBDT05GSUdfSFZNCi0g
ICAgZWxzZSBpZiAoIGlvbW11X3VzZV9oYXBfcHQoZCkgKQorICAgIGVsc2Ug
aWYgKCBJU19FTkFCTEVEKENPTkZJR19IVk0pICYmIGlvbW11X3VzZV9oYXBf
cHQoZCkgKQogICAgIHsKICAgICAgICAgcGFnZXRhYmxlX3QgcGd0ID0gcDJt
X2dldF9wYWdldGFibGUocDJtX2dldF9ob3N0cDJtKGQpKTsKIAogICAgICAg
ICBwZ2RfbWFkZHIgPSBwYWdldGFibGVfZ2V0X3BhZGRyKHBndCk7CiAgICAg
fQogICAgIGVsc2UKLSNlbmRpZgogICAgIHsKICAgICAgICAgaWYgKCAhaGQt
PmFyY2gudnRkLnBnZF9tYWRkciApCiAgICAgICAgIHsK

--=separator--

