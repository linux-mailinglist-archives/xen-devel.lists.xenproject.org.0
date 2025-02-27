Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A568BA47E49
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 13:54:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898008.1306601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tndOb-0001S2-Of; Thu, 27 Feb 2025 12:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898008.1306601; Thu, 27 Feb 2025 12:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tndOb-0001Pc-Jw; Thu, 27 Feb 2025 12:53:45 +0000
Received: by outflank-mailman (input) for mailman id 898008;
 Thu, 27 Feb 2025 12:53:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XPKz=VS=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1tndOZ-0001LK-UJ
 for xen-devel@lists.xen.org; Thu, 27 Feb 2025 12:53:43 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc357fad-f509-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 13:53:38 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1tndOP-008PWx-0O;
 Thu, 27 Feb 2025 12:53:32 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1tndOO-00CM3B-2R;
 Thu, 27 Feb 2025 12:53:32 +0000
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
X-Inumbo-ID: dc357fad-f509-11ef-9898-31a8f345e629
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.510 (Entity 5.510)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 467 v1 (CVE-2025-1713) - deadlock potential
 with VT-d and legacy PCI device pass-through
Message-Id: <E1tndOO-00CM3B-2R@xenbits.xenproject.org>
Date: Thu, 27 Feb 2025 12:53:32 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2025-1713 / XSA-467

    deadlock potential with VT-d and legacy PCI device pass-through

ISSUE DESCRIPTION
=================

When setting up interrupt remapping for legacy PCI(-X) devices,
including PCI(-X) bridges, a lookup of the upstream bridge is required.
This lookup, itself involving acquiring of a lock, is done in a context
where acquiring that lock is unsafe.  This can lead to a deadlock.

IMPACT
======

The passing through of certain kinds of devices to an unprivileged guest
can result in a Denial of Service (DoS) affecting the entire host.

Note: Normal usage of such devices by a privileged domain can also
      trigger the issue.  In such a scenario, the deadlock is not
      considered a security issue, but just a plain bug.

VULNERABLE SYSTEMS
==================

Xen versions 4.0 and later are affected.  Xen versions 3.4 and earlier
are not directly affected, but had other issues.

Systems with Intel IOMMU hardware (VT-d) are affected.  Systems using
AMD or non-x86 hardware are not affected.

Only systems where certain kinds of devices are passed through to an
unprivileged guest are vulnerable.

MITIGATION
==========

Avoiding the passing through of the affected device types will avoid
the vulnerability.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa467.patch           xen-unstable - Xen 4.17.x

$ sha256sum xsa467*
2fffaa8892b3daecd698b4af95701045874a76edc2e18c8d2abbec85a39aa05c  xsa467.patch
$

NOTE REGARDING LACK OF EMBARGO
==============================

The issue was reported initially on a public bug tracker and discussed in
public before it was realized that there was a security aspect.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmfAX/kMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZ++UH/0n3V1omvWiPXQCSOl+HawK77MezS2MkjRx6HQ/N
0SeaaWodvhBMeGd/FAECc7CY3G+sdLkOmwpVFtKvxBOjMRyEc6IsqdAa1CxkUZ0p
S+K7/MNmBB8qzB73sSpFpssR7NYGQXTQNxbQOuYURSyyZK5yejavgQ0oTc8jhhsH
NQOaTJPU/p6HBjDRlPcWB9EraJlPsr2iqv4FrbzDK+dS+I8BpfmElpnJkQOiOECg
McfLgod2jwV8y9l9Zvzx8IXJMkWxIHTdXkgmZq2sDr6foiFEbFUHV1ZG0rr8l+Sl
ckqx01g9UEDVmvjasWVjxeZUiaMLtppAp3SrewGjGwlx6oA=
=3+H1
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa467.patch"
Content-Disposition: attachment; filename="xsa467.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBJT01NVS94ODY6IHRoZSBidXMtdG8tYnJpZGdlIGxvY2sgbmVlZHMgdG8g
YmUgYWNxdWlyZWQgSVJRLXNhZmUKClRoZSBmdW5jdGlvbidzIHVzZSBmcm9t
IHNldF9tc2lfc291cmNlX2lkKCkgaXMgZ3VhcmFudGVlZCB0byBiZSBpbiBh
bgpJUlFzLW9mZiByZWdpb24uIFdoaWxlIHRoZSBpbnZvY2F0aW9uIG9mIHRo
YXQgZnVuY3Rpb24gY291bGQgYmUgbW92ZWQKYWhlYWQgaW4gbXNpX21zZ190
b19yZW1hcF9lbnRyeSgpIChkb2Vzbid0IG5lZWQgdG8gYmUgaW4gdGhlIElP
TU1VLQppbnRyZW1hcC1sb2NrZWQgcmVnaW9uKSwgdGhlIGNhbGwgdHJlZSBm
cm9tIG1hcF9kb21haW5fcGlycSgpIGhvbGRzIGFuCklSUSBkZXNjcmlwdG9y
IGxvY2suIEhlbmNlIGFsbCB1c2Ugc2l0ZXMgb2YgdGhlIGxvY2sgbmVlZCBi
ZWNvbWUgSVJRLQpzYWZlIG9uZXMuCgpJbiBmaW5kX3Vwc3RyZWFtX2JyaWRn
ZSgpIGRvIGEgdGlueSBiaXQgb2YgdGlkeWluZyBpbiBhZGphY2VudCBjb2Rl
OgpDaGFuZ2UgYSB2YXJpYWJsZSdzIHR5cGUgdG8gdW5zaWduZWQgYW5kIG1l
cmdlIGEgcmVkdW5kYW50IGFzc2lnbm1lbnQKaW50byBhbm90aGVyIHZhcmlh
YmxlJ3MgaW5pdGlhbGl6ZXIuCgpUaGlzIGlzIFhTQS00NjcgLyBDVkUtMjAy
NS0xNzEzLgoKRml4ZXM6IDQ3NmJiY2NjODExYyAoIlZULWQ6IGZpeCBNU0kg
c291cmNlLWlkIG9mIGludGVycnVwdCByZW1hcHBpbmciKQpTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2Vk
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+ClJldmlld2Vk
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCisrKyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCkBAIC0zNTQsMjAgKzM1NCwy
MSBAQCBzdGF0aWMgc3RydWN0IHBjaV9kZXYgKmFsbG9jX3BkZXYoc3RydWN0
CiAgICAgc3dpdGNoICggcGRldi0+dHlwZSA9IHBkZXZfdHlwZShwc2VnLT5u
ciwgYnVzLCBkZXZmbikgKQogICAgIHsKICAgICAgICAgdW5zaWduZWQgaW50
IGNhcCwgc2VjX2J1cywgc3ViX2J1czsKKyAgICAgICAgdW5zaWduZWQgbG9u
ZyBmbGFnczsKIAogICAgICAgICBjYXNlIERFVl9UWVBFX1BDSWUyUENJX0JS
SURHRToKICAgICAgICAgY2FzZSBERVZfVFlQRV9MRUdBQ1lfUENJX0JSSURH
RToKICAgICAgICAgICAgIHNlY19idXMgPSBwY2lfY29uZl9yZWFkOChwZGV2
LT5zYmRmLCBQQ0lfU0VDT05EQVJZX0JVUyk7CiAgICAgICAgICAgICBzdWJf
YnVzID0gcGNpX2NvbmZfcmVhZDgocGRldi0+c2JkZiwgUENJX1NVQk9SRElO
QVRFX0JVUyk7CiAKLSAgICAgICAgICAgIHNwaW5fbG9jaygmcHNlZy0+YnVz
MmJyaWRnZV9sb2NrKTsKKyAgICAgICAgICAgIHNwaW5fbG9ja19pcnFzYXZl
KCZwc2VnLT5idXMyYnJpZGdlX2xvY2ssIGZsYWdzKTsKICAgICAgICAgICAg
IGZvciAoIDsgc2VjX2J1cyA8PSBzdWJfYnVzOyBzZWNfYnVzKysgKQogICAg
ICAgICAgICAgewogICAgICAgICAgICAgICAgIHBzZWctPmJ1czJicmlkZ2Vb
c2VjX2J1c10ubWFwID0gMTsKICAgICAgICAgICAgICAgICBwc2VnLT5idXMy
YnJpZGdlW3NlY19idXNdLmJ1cyA9IGJ1czsKICAgICAgICAgICAgICAgICBw
c2VnLT5idXMyYnJpZGdlW3NlY19idXNdLmRldmZuID0gZGV2Zm47CiAgICAg
ICAgICAgICB9Ci0gICAgICAgICAgICBzcGluX3VubG9jaygmcHNlZy0+YnVz
MmJyaWRnZV9sb2NrKTsKKyAgICAgICAgICAgIHNwaW5fdW5sb2NrX2lycXJl
c3RvcmUoJnBzZWctPmJ1czJicmlkZ2VfbG9jaywgZmxhZ3MpOwogICAgICAg
ICAgICAgYnJlYWs7CiAKICAgICAgICAgY2FzZSBERVZfVFlQRV9QQ0llX0VO
RFBPSU5UOgpAQCAtNDM3LDE2ICs0MzgsMTcgQEAgc3RhdGljIHZvaWQgZnJl
ZV9wZGV2KHN0cnVjdCBwY2lfc2VnICpwcwogICAgIHN3aXRjaCAoIHBkZXYt
PnR5cGUgKQogICAgIHsKICAgICAgICAgdW5zaWduZWQgaW50IHNlY19idXMs
IHN1Yl9idXM7CisgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAKICAg
ICAgICAgY2FzZSBERVZfVFlQRV9QQ0llMlBDSV9CUklER0U6CiAgICAgICAg
IGNhc2UgREVWX1RZUEVfTEVHQUNZX1BDSV9CUklER0U6CiAgICAgICAgICAg
ICBzZWNfYnVzID0gcGNpX2NvbmZfcmVhZDgocGRldi0+c2JkZiwgUENJX1NF
Q09OREFSWV9CVVMpOwogICAgICAgICAgICAgc3ViX2J1cyA9IHBjaV9jb25m
X3JlYWQ4KHBkZXYtPnNiZGYsIFBDSV9TVUJPUkRJTkFURV9CVVMpOwogCi0g
ICAgICAgICAgICBzcGluX2xvY2soJnBzZWctPmJ1czJicmlkZ2VfbG9jayk7
CisgICAgICAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmcHNlZy0+YnVzMmJy
aWRnZV9sb2NrLCBmbGFncyk7CiAgICAgICAgICAgICBmb3IgKCA7IHNlY19i
dXMgPD0gc3ViX2J1czsgc2VjX2J1cysrICkKICAgICAgICAgICAgICAgICBw
c2VnLT5idXMyYnJpZGdlW3NlY19idXNdID0gcHNlZy0+YnVzMmJyaWRnZVtw
ZGV2LT5idXNdOwotICAgICAgICAgICAgc3Bpbl91bmxvY2soJnBzZWctPmJ1
czJicmlkZ2VfbG9jayk7CisgICAgICAgICAgICBzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZwc2VnLT5idXMyYnJpZGdlX2xvY2ssIGZsYWdzKTsKICAgICAg
ICAgICAgIGJyZWFrOwogCiAgICAgICAgIGRlZmF1bHQ6CkBAIC0xMDUzLDgg
KzEwNTUsOSBAQCBlbnVtIHBkZXZfdHlwZSBwZGV2X3R5cGUodTE2IHNlZywg
dTggYnVzCiBpbnQgZmluZF91cHN0cmVhbV9icmlkZ2UodTE2IHNlZywgdTgg
KmJ1cywgdTggKmRldmZuLCB1OCAqc2VjYnVzKQogewogICAgIHN0cnVjdCBw
Y2lfc2VnICpwc2VnID0gZ2V0X3BzZWcoc2VnKTsKLSAgICBpbnQgcmV0ID0g
MDsKLSAgICBpbnQgY250ID0gMDsKKyAgICBpbnQgcmV0ID0gMTsKKyAgICB1
bnNpZ25lZCBsb25nIGZsYWdzOworICAgIHVuc2lnbmVkIGludCBjbnQgPSAw
OwogCiAgICAgaWYgKCAqYnVzID09IDAgKQogICAgICAgICByZXR1cm4gMDsK
QEAgLTEwNjUsOCArMTA2OCw3IEBAIGludCBmaW5kX3Vwc3RyZWFtX2JyaWRn
ZSh1MTYgc2VnLCB1OCAqYnUKICAgICBpZiAoICFwc2VnLT5idXMyYnJpZGdl
WypidXNdLm1hcCApCiAgICAgICAgIHJldHVybiAwOwogCi0gICAgcmV0ID0g
MTsKLSAgICBzcGluX2xvY2soJnBzZWctPmJ1czJicmlkZ2VfbG9jayk7Cisg
ICAgc3Bpbl9sb2NrX2lycXNhdmUoJnBzZWctPmJ1czJicmlkZ2VfbG9jaywg
ZmxhZ3MpOwogICAgIHdoaWxlICggcHNlZy0+YnVzMmJyaWRnZVsqYnVzXS5t
YXAgKQogICAgIHsKICAgICAgICAgKnNlY2J1cyA9ICpidXM7CkBAIC0xMDgw
LDcgKzEwODIsNyBAQCBpbnQgZmluZF91cHN0cmVhbV9icmlkZ2UodTE2IHNl
ZywgdTggKmJ1CiAgICAgfQogCiBvdXQ6Ci0gICAgc3Bpbl91bmxvY2soJnBz
ZWctPmJ1czJicmlkZ2VfbG9jayk7CisgICAgc3Bpbl91bmxvY2tfaXJxcmVz
dG9yZSgmcHNlZy0+YnVzMmJyaWRnZV9sb2NrLCBmbGFncyk7CiAgICAgcmV0
dXJuIHJldDsKIH0KIAo=

--=separator--

