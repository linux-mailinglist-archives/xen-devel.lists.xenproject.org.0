Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55355951BC8
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 15:25:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777227.1187413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seE0V-0000cb-8h; Wed, 14 Aug 2024 13:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777227.1187413; Wed, 14 Aug 2024 13:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seE0V-0000aU-4W; Wed, 14 Aug 2024 13:25:43 +0000
Received: by outflank-mailman (input) for mailman id 777227;
 Wed, 14 Aug 2024 13:25:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=glz1=PN=xenbits.xen.org=julieng@srs-se1.protection.inumbo.net>)
 id 1seE0T-0000Zz-CW
 for xen-devel@lists.xen.org; Wed, 14 Aug 2024 13:25:41 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b19b2799-5a40-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 15:25:40 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1seE0L-00015O-PH; Wed, 14 Aug 2024 13:25:33 +0000
Received: from julieng by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1seE0L-0001xk-NV; Wed, 14 Aug 2024 13:25:33 +0000
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
X-Inumbo-ID: b19b2799-5a40-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=Y7PBCM24upHm5ZQZt2uHvLuBCEM77iHd0QNUm65etq8=; b=mHpuv4VPDxFyMpp5QLnhLZfZQ7
	zZxypwhs+Wncl8rjU9e3yNhADBYP/MWTdj8JpuUSS/CoVyyfyk+6s9qUBMVg1w0yFYkBbPu29/daN
	rPW8xu1ZQzISF1heFn2tEmJMPD0D8dj/TYVlQQhBkiPTQD/DrL8tnWShSMxOWkOl//sc=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 460 v2 (CVE-2024-31145) - error handling in
 x86 IOMMU identity mapping
Message-Id: <E1seE0L-0001xk-NV@xenbits.xenproject.org>
Date: Wed, 14 Aug 2024 13:25:33 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2024-31145 / XSA-460
                               version 2

             error handling in x86 IOMMU identity mapping

UPDATES IN VERSION 2
====================

Wording updated. Public release.

ISSUE DESCRIPTION
=================

Certain PCI devices in a system might be assigned Reserved Memory
Regions (specified via Reserved Memory Region Reporting, "RMRR") for
Intel VT-d or Unity Mapping ranges for AMD-Vi.  These are typically used
for platform tasks such as legacy USB emulation.

Since the precise purpose of these regions is unknown, once a device
associated with such a region is active, the mappings of these regions
need to remain continuouly accessible by the device.  In the logic
establishing these mappings, error handling was flawed, resulting in
such mappings to potentially remain in place when they should have been
removed again.  Respective guests would then gain access to memory
regions which they aren't supposed to have access to.

IMPACT
======

The precise impact is system specific.  Denial of Service (DoS)
affecting the entire host or individual guests, privilege escalation,
and information leaks cannot be ruled out.

VULNERABLE SYSTEMS
==================

Only x86 systems passing PCI devices with RMRR/Unity regions through to
guests are potentially affected.

PCI devices listed in a vm.cfg file have error handling which causes `xl
create` to abort and tear down the domain, and is thus believed to be
safe.

PCI devices attached using `xl pci-attach` will result in the command
returning nonzero, but will not tear down the domain.  VMs which
continue to run after `xl pci-attach` has failed expose the
vulnerability.

For x86 Intel hardware, Xen versions 4.0 and later are affected.

For all x86 hardware, Xen versions having the XSA-378 fixes applied /
backported are affected.

MITIGATION
==========

Assigning devices using the vm.cfg file for attachment at boot avoids
the vulnerability.

CREDITS
=======

This issue was discovered by Teddy Astie of Vates and diagnosed as a
security issue by Jan Beulich of SUSE.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the respective stable branch before applying these patches.

xsa460.patch           xen-unstable - Xen 4.16.x

$ sha256sum xsa460*
f4ca598f71e9ef6b9bc50803df2996b92d2e69afd8e36d9544823d7e56ec1819  xsa460.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAma8sCIMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZiSUIAMFWxhjNzhsuUGbrUVsO6oDIs7gOcVEsC3BlcsIp
LqetutOWHwR8B9jHeOjewZjgL/q1031qX+nCCcU/ilZtA7cAiVhPNrh4PSD/D9S5
RqUG3oSsFjSTtGwVl2JlqlHoE90tXOqLBhZFCJixQzaW3kbCfhDZdmufj8TQYBCQ
N3ioNAGwvmSeV8QPh8l3P7TRRsMwr0OTWQYtj7r4QuW+dDPJaKzbCpmWVaCPVeI2
uKUxwwIxSE9J9L1mUR34HIJR/clCFNqlcpc/MmQVz0qprBOh4jNDunN+JNDY1VXR
3P+N50ZnHCK5w1z+vjeVvZRyp9JDt2LDUj6XJ6G9IdvN1xA=
=vNzh
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa460.patch"
Content-Disposition: attachment; filename="xsa460.patch"
Content-Transfer-Encoding: base64

RnJvbTogVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+ClN1
YmplY3Q6IHg4Ni9JT01NVTogbW92ZSB0cmFja2luZyBpbiBpb21tdV9pZGVu
dGl0eV9tYXBwaW5nKCkKCklmIGZvciBzb21lIHJlYXNvbiB4bWFsbG9jKCkg
ZmFpbHMgYWZ0ZXIgaGF2aW5nIG1hcHBlZCB0aGUgcmVzZXJ2ZWQKcmVnaW9u
cywgYW4gZXJyb3IgaXMgcmVwb3J0ZWQsIGJ1dCB0aGUgcmVnaW9ucyByZW1h
aW4gbWFwcGVkIGluIHRoZSBQMk0uCgpTaW1pbGFybHkgaWYgYW4gZXJyb3Ig
b2NjdXJzIGR1cmluZyBzZXRfaWRlbnRpdHlfcDJtX2VudHJ5KCkgKGV4Y2Vw
dCBvbgp0aGUgZmlyc3QgY2FsbCksIHRoZSBwYXJ0aWFsIG1hcHBpbmdzIG9m
IHRoZSByZWdpb24gd291bGQgYmUgcmV0YWluZWQKd2l0aG91dCBiZWluZyB0
cmFja2VkIGFueXdoZXJlLCBhbmQgaGVuY2Ugd2l0aG91dCB0aGVyZSBiZWlu
ZyBhIHdheSB0bwpyZW1vdmUgdGhlbSBhZ2FpbiBmcm9tIHRoZSBkb21haW4n
cyBQMk0uCgpNb3ZlIHRoZSBzZXR0aW5nIHVwIG9mIHRoZSBsaXN0IGVudHJ5
IGFoZWFkIG9mIHRyeWluZyB0byBtYXAgdGhlIHJlZ2lvbi4KSW4gY2FzZXMg
b3RoZXIgdGhhbiB0aGUgZmlyc3QgbWFwcGluZyBmYWlsaW5nLCBrZWVwIHJl
Y29yZCBvZiB0aGUgZnVsbApyZWdpb24sIHN1Y2ggdGhhdCBhIHN1YnNlcXVl
bnQgdW5tYXBwaW5nIHJlcXVlc3QgY2FuIGJlIHByb3Blcmx5IHRvcm4KZG93
bi4KClRvIGNvbXBlbnNhdGUgZm9yIHRoZSBwb3RlbnRpYWxseSBleGNlc3Mg
dW5tYXBwaW5nIHJlcXVlc3RzLCBkb24ndCBsb2cgYQp3YXJuaW5nIGZyb20g
cDJtX3JlbW92ZV9pZGVudGl0eV9lbnRyeSgpIHdoZW4gdGhlcmUgcmVhbGx5
IHdhcyBub3RoaW5nCm1hcHBlZCBhdCBhIGdpdmVuIEdGTi4KClRoaXMgaXMg
WFNBLTQ2MCAvIENWRS0yMDI0LTMxMTQ1LgoKRml4ZXM6IDIyMDFiNjdiOTEy
OCAoIlZULWQ6IGltcHJvdmUgUk1SUiByZWdpb24gaGFuZGxpbmciKQpGaXhl
czogYzBlMTlkN2M2YzQyICgiSU9NTVU6IGdlbmVyYWxpemUgVlQtZCdzIHRy
YWNraW5nIG9mIG1hcHBlZCBSTVJSIHJlZ2lvbnMiKQpTaWduZWQtb2ZmLWJ5
OiBUZWRkeSBBc3RpZSA8dGVkZHkuYXN0aWVAdmF0ZXMudGVjaD4KU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpSZXZp
ZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+CgotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKKysrIGIveGVuL2Fy
Y2gveDg2L21tL3AybS5jCkBAIC0xMjY3LDkgKzEyNjcsMTEgQEAgaW50IHAy
bV9yZW1vdmVfaWRlbnRpdHlfZW50cnkoc3RydWN0IGRvbQogICAgIGVsc2UK
ICAgICB7CiAgICAgICAgIGdmbl91bmxvY2socDJtLCBnZm4sIDApOwotICAg
ICAgICBwcmludGsoWEVOTE9HX0dfV0FSTklORwotICAgICAgICAgICAgICAg
Im5vbi1pZGVudGl0eSBtYXAgZCVkOiVseCBub3QgY2xlYXJlZCAobWFwcGVk
IHRvICVseClcbiIsCi0gICAgICAgICAgICAgICBkLT5kb21haW5faWQsIGdm
bl9sLCBtZm5feChtZm4pKTsKKyAgICAgICAgaWYgKCAocDJtdCAhPSBwMm1f
aW52YWxpZCAmJiBwMm10ICE9IHAybV9tbWlvX2RtKSB8fAorICAgICAgICAg
ICAgIGEgIT0gcDJtX2FjY2Vzc19uIHx8ICFtZm5fZXEobWZuLCBJTlZBTElE
X01GTikgKQorICAgICAgICAgICBwcmludGsoWEVOTE9HX0dfV0FSTklORwor
ICAgICAgICAgICAgICAgICAgIm5vbi1pZGVudGl0eSBtYXAgJXBkOiVseCBu
b3QgY2xlYXJlZCAobWFwcGVkIHRvICVseClcbiIsCisgICAgICAgICAgICAg
ICAgICBkLCBnZm5fbCwgbWZuX3gobWZuKSk7CiAgICAgICAgIHJldCA9IDA7
CiAgICAgfQogCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9p
b21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21t
dS5jCkBAIC0yNjcsMjQgKzI2NywzNiBAQCBpbnQgaW9tbXVfaWRlbnRpdHlf
bWFwcGluZyhzdHJ1Y3QgZG9tYWluCiAgICAgaWYgKCBwMm1hID09IHAybV9h
Y2Nlc3NfeCApCiAgICAgICAgIHJldHVybiAtRU5PRU5UOwogCi0gICAgd2hp
bGUgKCBiYXNlX3BmbiA8IGVuZF9wZm4gKQotICAgIHsKLSAgICAgICAgaW50
IGVyciA9IHNldF9pZGVudGl0eV9wMm1fZW50cnkoZCwgYmFzZV9wZm4sIHAy
bWEsIGZsYWcpOwotCi0gICAgICAgIGlmICggZXJyICkKLSAgICAgICAgICAg
IHJldHVybiBlcnI7Ci0gICAgICAgIGJhc2VfcGZuKys7Ci0gICAgfQotCiAg
ICAgbWFwID0geG1hbGxvYyhzdHJ1Y3QgaWRlbnRpdHlfbWFwKTsKICAgICBp
ZiAoICFtYXAgKQogICAgICAgICByZXR1cm4gLUVOT01FTTsKKwogICAgIG1h
cC0+YmFzZSA9IGJhc2U7CiAgICAgbWFwLT5lbmQgPSBlbmQ7CiAgICAgbWFw
LT5hY2Nlc3MgPSBwMm1hOwogICAgIG1hcC0+Y291bnQgPSAxOworCisgICAg
LyoKKyAgICAgKiBJbnNlcnQgaW50byBsaXN0IGFoZWFkIG9mIG1hcHBpbmcs
IHNvIHRoZSByYW5nZSBjYW4gYmUgZm91bmQgd2hlbgorICAgICAqIHRyeWlu
ZyB0byBjbGVhbiB1cC4KKyAgICAgKi8KICAgICBsaXN0X2FkZF90YWlsKCZt
YXAtPmxpc3QsICZoZC0+YXJjaC5pZGVudGl0eV9tYXBzKTsKIAorICAgIGZv
ciAoIDsgYmFzZV9wZm4gPCBlbmRfcGZuOyArK2Jhc2VfcGZuICkKKyAgICB7
CisgICAgICAgIGludCBlcnIgPSBzZXRfaWRlbnRpdHlfcDJtX2VudHJ5KGQs
IGJhc2VfcGZuLCBwMm1hLCBmbGFnKTsKKworICAgICAgICBpZiAoICFlcnIg
KQorICAgICAgICAgICAgY29udGludWU7CisKKyAgICAgICAgaWYgKCAobWFw
LT5iYXNlID4+IFBBR0VfU0hJRlRfNEspID09IGJhc2VfcGZuICkKKyAgICAg
ICAgeworICAgICAgICAgICAgbGlzdF9kZWwoJm1hcC0+bGlzdCk7CisgICAg
ICAgICAgICB4ZnJlZShtYXApOworICAgICAgICB9CisgICAgICAgIHJldHVy
biBlcnI7CisgICAgfQorCiAgICAgcmV0dXJuIDA7CiB9CiAK

--=separator--

