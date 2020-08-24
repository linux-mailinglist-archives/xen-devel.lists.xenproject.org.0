Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3EA24FDA1
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 14:18:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kABQk-0002fQ-KK; Mon, 24 Aug 2020 12:18:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9lF=CC=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kABQi-0002ek-Vt
 for xen-devel@lists.xen.org; Mon, 24 Aug 2020 12:18:29 +0000
X-Inumbo-ID: 38b6e229-9123-42ff-9e67-b8d31154a7fb
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38b6e229-9123-42ff-9e67-b8d31154a7fb;
 Mon, 24 Aug 2020 12:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 bh=VAjJ1bX8LorcKiqykJ4tMwy/Q1TPnhBAFaZRY89L1CA=; b=njxjZZJP8nlMCjCUcUScXKnyTi
 yZnzMO0o5/3mq7PaG8GiTxu7k4AIxet/0kEaabbDkYtT3U+T/CrclUrI7HlablbxCJKqaf0vPOMVz
 tjNVS/ia4p5EAQTtp/YwMMHvN7f2JWX0ajzJdwKWRqXVWeCK+R4qbS68+Gfml5Drat7w=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1kABQO-0001LV-Fm; Mon, 24 Aug 2020 12:18:08 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1kABQO-0005O2-Dh; Mon, 24 Aug 2020 12:18:08 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 335 v2 (CVE-2020-14364) - QEMU: usb:
 out-of-bounds r/w access issue
Message-Id: <E1kABQO-0005O2-Dh@xenbits.xenproject.org>
Date: Mon, 24 Aug 2020 12:18:08 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2020-14364 / XSA-335
                               version 2

               QEMU: usb: out-of-bounds r/w access issue

UPDATES IN VERSION 2
====================

Don't break the DSO by eliding the SoB on the patch.

Update Vulnerable Systems section.

Public release.

ISSUE DESCRIPTION
=================

An out-of-bounds read/write access issue was found in the USB emulator
of the QEMU. It occurs while processing USB packets from a guest, when
'USBDevice->setup_len' exceeds the USBDevice->data_buf[4096], in
do_token_{in,out} routines.

IMPACT
======

A guest user may use this flaw to crash the QEMU process resulting in
DoS OR potentially execute arbitrary code with the privileges of the
QEMU process on the host.

VULNERABLE SYSTEMS
==================

All versions of Qemu shipped with in-support versions of Xen are
vulnerable.  This includes both qemu-traditional and qemu-xen.

The vulnerability can only be exploited when Qemu is used as a device
model.  This configuration is only used by default for x86 HVM guests.
x86 PV, PVH and ARM guest do not use a device model by default.

Guests configured to use a Qemu stubdomain contain the code execution
within the stubdomain, and are therefore not considered vulnerable.

MITIGATION
==========

No mitigation is available.

CREDITS
=======

This issue was discovered by Xiao Wei of Qihoo 360 Inc.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa335-qemu.patch    QEMU
xsa335-trad.patch    Xen unstable (SUPPORT.md update only)

$ sha256sum xsa335*
3af5f30c4fd21e3679fb749659f9e59d0ff335d092254352e128e7fee3340c41  xsa335-qemu.patch
2ed7b8bac4c473c6f89173a73485904be16785eb29ee18e189717d201381f27f  xsa335-trad.patch
$

"QEMU XEN TRADITIONAL"
======================

This version of qemu is provided by the Xen Project for use as a
device model stub domain.  In that configuration, there is not a
security problem and no action is needed.

But in other configurations, this version of qemu is lacking many
security fixes.  It is beyond the capacity of the Xen Project Security
Team to address these.  There is therefore no code resolution to
XSA-335 for users of qemu-xen-traditional who are not using device
model stub domains.

The patch xsa335-trad.patch included in this advisory is merely an
update for Xen's SUPPORT.md to document this situation.

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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl9Dr+0MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZ274H/3FIK/DecsmdqVFs9UjqCi+RABmz6dFsgUxQYH9c
ysZvN7R/BTR1m425+7tlPK1oglkFkHt6C9snc3+kTh/Bl5ktXakgVacoR6yeTh88
1yJQC3JmG9OaXGS4AR9hmE+Wg0XTlrmvzPMFxtWv055kpPVEG6FWhnhV8d0FavoI
RWnlelNSkXgai5zWlAqhF8jzR4EeEmOp4f/BtQX/cjZAodXZSYMvLW1zy3vx4Wik
ZpL4qkJLE9GHOYZF9Ng8zwWx7c1CIi76zwdUvUgPu6IjTBIpo0LPZxlkbF+CqYcp
rVFaAy7j7+xMOOJntlN2a/NAxD4zs+sCLF1legrfi+9uMH4=
=bMZs
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa335-qemu.patch"
Content-Disposition: attachment; filename="xsa335-qemu.patch"
Content-Transfer-Encoding: base64

RnJvbSBjNWJkMjkyNGM2ZDZhNWJjYmZmYjhiNWU3Nzk4YTg4OTcwMTMxYzA3
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBHZXJkIEhvZmZtYW5u
IDxrcmF4ZWxAcmVkaGF0LmNvbT4KRGF0ZTogTW9uLCAxNyBBdWcgMjAyMCAw
ODozNDoyMiArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIHVzYjogZml4IHNldHVw
X2xlbiBpbml0IChDVkUtMjAyMC0xNDM2NCkKClN0b3JlIGNhbGN1bGF0ZWQg
c2V0dXBfbGVuIGluIGEgbG9jYWwgdmFyaWFibGUsIHZlcmlmeSBpdCwgYW5k
IG9ubHkKd3JpdGUgaXQgdG8gdGhlIHN0cnVjdCAoVVNCRGV2aWNlLT5zZXR1
cF9sZW4pIGluIGNhc2UgaXQgcGFzc2VkIHRoZQpzYW5pdHkgY2hlY2tzLgoK
VGhpcyBwcmV2ZW50cyBvdGhlciBjb2RlIChkb190b2tlbl97aW4sb3V0fSBm
dW5jdGlvbnMgc3BlY2lmaWNhbGx5KQpmcm9tIHdvcmtpbmcgd2l0aCBpbnZh
bGlkIFVTQkRldmljZS0+c2V0dXBfbGVuIHZhbHVlcyBhbmQgb3ZlcnJ1bm5p
bmcKdGhlIFVTQkRldmljZS0+c2V0dXBfYnVmW10gYnVmZmVyLgoKRml4ZXM6
IENWRS0yMDIwLTE0MzY0ClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4g
PGtyYXhlbEByZWRoYXQuY29tPgotLS0KIGh3L3VzYi9jb3JlLmMgfCAxNiAr
KysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody91c2IvY29y
ZS5jIGIvaHcvdXNiL2NvcmUuYwppbmRleCA1YWJkMTI4YjZiYzUuLjUyMzRk
Y2M3M2ZlYSAxMDA2NDQKLS0tIGEvaHcvdXNiL2NvcmUuYworKysgYi9ody91
c2IvY29yZS5jCkBAIC0xMjksNiArMTI5LDcgQEAgdm9pZCB1c2Jfd2FrZXVw
KFVTQkVuZHBvaW50ICplcCwgdW5zaWduZWQgaW50IHN0cmVhbSkKIHN0YXRp
YyB2b2lkIGRvX3Rva2VuX3NldHVwKFVTQkRldmljZSAqcywgVVNCUGFja2V0
ICpwKQogewogICAgIGludCByZXF1ZXN0LCB2YWx1ZSwgaW5kZXg7CisgICAg
dW5zaWduZWQgaW50IHNldHVwX2xlbjsKIAogICAgIGlmIChwLT5pb3Yuc2l6
ZSAhPSA4KSB7CiAgICAgICAgIHAtPnN0YXR1cyA9IFVTQl9SRVRfU1RBTEw7
CkBAIC0xMzgsMTQgKzEzOSwxNSBAQCBzdGF0aWMgdm9pZCBkb190b2tlbl9z
ZXR1cChVU0JEZXZpY2UgKnMsIFVTQlBhY2tldCAqcCkKICAgICB1c2JfcGFj
a2V0X2NvcHkocCwgcy0+c2V0dXBfYnVmLCBwLT5pb3Yuc2l6ZSk7CiAgICAg
cy0+c2V0dXBfaW5kZXggPSAwOwogICAgIHAtPmFjdHVhbF9sZW5ndGggPSAw
OwotICAgIHMtPnNldHVwX2xlbiAgID0gKHMtPnNldHVwX2J1Zls3XSA8PCA4
KSB8IHMtPnNldHVwX2J1Zls2XTsKLSAgICBpZiAocy0+c2V0dXBfbGVuID4g
c2l6ZW9mKHMtPmRhdGFfYnVmKSkgeworICAgIHNldHVwX2xlbiA9IChzLT5z
ZXR1cF9idWZbN10gPDwgOCkgfCBzLT5zZXR1cF9idWZbNl07CisgICAgaWYg
KHNldHVwX2xlbiA+IHNpemVvZihzLT5kYXRhX2J1ZikpIHsKICAgICAgICAg
ZnByaW50ZihzdGRlcnIsCiAgICAgICAgICAgICAgICAgInVzYl9nZW5lcmlj
X2hhbmRsZV9wYWNrZXQ6IGN0cmwgYnVmZmVyIHRvbyBzbWFsbCAoJWQgPiAl
enUpXG4iLAotICAgICAgICAgICAgICAgIHMtPnNldHVwX2xlbiwgc2l6ZW9m
KHMtPmRhdGFfYnVmKSk7CisgICAgICAgICAgICAgICAgc2V0dXBfbGVuLCBz
aXplb2Yocy0+ZGF0YV9idWYpKTsKICAgICAgICAgcC0+c3RhdHVzID0gVVNC
X1JFVF9TVEFMTDsKICAgICAgICAgcmV0dXJuOwogICAgIH0KKyAgICBzLT5z
ZXR1cF9sZW4gPSBzZXR1cF9sZW47CiAKICAgICByZXF1ZXN0ID0gKHMtPnNl
dHVwX2J1ZlswXSA8PCA4KSB8IHMtPnNldHVwX2J1ZlsxXTsKICAgICB2YWx1
ZSAgID0gKHMtPnNldHVwX2J1ZlszXSA8PCA4KSB8IHMtPnNldHVwX2J1Zlsy
XTsKQEAgLTI1OSwyNiArMjYxLDI4IEBAIHN0YXRpYyB2b2lkIGRvX3Rva2Vu
X291dChVU0JEZXZpY2UgKnMsIFVTQlBhY2tldCAqcCkKIHN0YXRpYyB2b2lk
IGRvX3BhcmFtZXRlcihVU0JEZXZpY2UgKnMsIFVTQlBhY2tldCAqcCkKIHsK
ICAgICBpbnQgaSwgcmVxdWVzdCwgdmFsdWUsIGluZGV4OworICAgIHVuc2ln
bmVkIGludCBzZXR1cF9sZW47CiAKICAgICBmb3IgKGkgPSAwOyBpIDwgODsg
aSsrKSB7CiAgICAgICAgIHMtPnNldHVwX2J1ZltpXSA9IHAtPnBhcmFtZXRl
ciA+PiAoaSo4KTsKICAgICB9CiAKICAgICBzLT5zZXR1cF9zdGF0ZSA9IFNF
VFVQX1NUQVRFX1BBUkFNOwotICAgIHMtPnNldHVwX2xlbiAgID0gKHMtPnNl
dHVwX2J1Zls3XSA8PCA4KSB8IHMtPnNldHVwX2J1Zls2XTsKICAgICBzLT5z
ZXR1cF9pbmRleCA9IDA7CiAKICAgICByZXF1ZXN0ID0gKHMtPnNldHVwX2J1
ZlswXSA8PCA4KSB8IHMtPnNldHVwX2J1ZlsxXTsKICAgICB2YWx1ZSAgID0g
KHMtPnNldHVwX2J1ZlszXSA8PCA4KSB8IHMtPnNldHVwX2J1ZlsyXTsKICAg
ICBpbmRleCAgID0gKHMtPnNldHVwX2J1Zls1XSA8PCA4KSB8IHMtPnNldHVw
X2J1Zls0XTsKIAotICAgIGlmIChzLT5zZXR1cF9sZW4gPiBzaXplb2Yocy0+
ZGF0YV9idWYpKSB7CisgICAgc2V0dXBfbGVuID0gKHMtPnNldHVwX2J1Zls3
XSA8PCA4KSB8IHMtPnNldHVwX2J1Zls2XTsKKyAgICBpZiAoc2V0dXBfbGVu
ID4gc2l6ZW9mKHMtPmRhdGFfYnVmKSkgewogICAgICAgICBmcHJpbnRmKHN0
ZGVyciwKICAgICAgICAgICAgICAgICAidXNiX2dlbmVyaWNfaGFuZGxlX3Bh
Y2tldDogY3RybCBidWZmZXIgdG9vIHNtYWxsICglZCA+ICV6dSlcbiIsCi0g
ICAgICAgICAgICAgICAgcy0+c2V0dXBfbGVuLCBzaXplb2Yocy0+ZGF0YV9i
dWYpKTsKKyAgICAgICAgICAgICAgICBzZXR1cF9sZW4sIHNpemVvZihzLT5k
YXRhX2J1ZikpOwogICAgICAgICBwLT5zdGF0dXMgPSBVU0JfUkVUX1NUQUxM
OwogICAgICAgICByZXR1cm47CiAgICAgfQorICAgIHMtPnNldHVwX2xlbiA9
IHNldHVwX2xlbjsKIAogICAgIGlmIChwLT5waWQgPT0gVVNCX1RPS0VOX09V
VCkgewogICAgICAgICB1c2JfcGFja2V0X2NvcHkocCwgcy0+ZGF0YV9idWYs
IHMtPnNldHVwX2xlbik7Ci0tIAoyLjE4LjQK

--=separator
Content-Type: application/octet-stream; name="xsa335-trad.patch"
Content-Disposition: attachment; filename="xsa335-trad.patch"
Content-Transfer-Encoding: base64

RnJvbSBhNjJjZGQ2NzViYzZhODA1M2Y2Nzk3YjZhZGQyOWIyODUzYjA4MWUz
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KRGF0ZTogV2VkLCAxOSBBdWcg
MjAyMCAxODozMTo0NSArMDEwMApTdWJqZWN0OiBbUEFUQ0hdIFNVUFBPUlQu
bWQ6IERlc3VwcG9ydCBxZW11IHRyYWQgZXhjZXB0IHN0dWIgZG0KCldoaWxl
IGludmVzdGlnYXRpbmcgWFNBLTMzNSB3ZSBkaXNjb3ZlcmVkIHRoYXQgbWFu
eSB1cHN0cmVhbSBzZWN1cml0eQpmaXhlcyB3ZXJlIG1pc3NpbmcuICBJdCBp
cyBub3QgcHJhY3RpY2FsIHRvIGJhY2twb3J0IHRoZW0uICBUaGVyZSBpcwpu
byBnb29kIHJlYXNvbiB0byBiZSBydW5uaW5nIHRoaXMgdmVyeSBhbmNpZW50
IHZlcnNpb24gb2YgcWVtdSwgZXhjZXB0CnRoYXQgaXQgaXMgdGhlIG9ubHkg
d2F5IHRvIHJ1biBhIHN0dWIgZG0gd2hpY2ggaXMgY3VycmVudGx5IHN1cHBv
cnRlZApieSB1cHN0cmVhbS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIFNVUFBPUlQubWQg
fCAxNSArKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvU1VQUE9SVC5tZCBiL1NVUFBPUlQu
bWQKaW5kZXggMTQ3OTA1NWM0NS4uYjA5MzkwNTJlMiAxMDA2NDQKLS0tIGEv
U1VQUE9SVC5tZAorKysgYi9TVVBQT1JULm1kCkBAIC03NTgsNyArNzU4LDIx
IEBAIFNlZSB0aGUgc2VjdGlvbiAqKkJsa2JhY2sqKiBmb3IgaW1hZ2UgZm9y
bWF0cyBzdXBwb3J0ZWQgYnkgUUVNVS4KIAogICAgIFN0YXR1czogU3VwcG9y
dGVkLCBub3Qgc2VjdXJpdHkgc3VwcG9ydGVkCiAKKyMjIyBxZW11LXhlbi10
cmFkaXRpb25hbCAjIyMKKworVGhlIFhlbiBQcm9qZWN0IHByb3ZpZGVzIGFu
IG9sZCB2ZXJzaW9uIG9mIHFlbXUgd2l0aCBtb2RpZmljYXRpb25zCit3aGlj
aCBlbmFibGUgdXNlIGFzIGEgZGV2aWNlIG1vZGVsIHN0dWIgZG9tYWluLiAg
VGhlIG9sZCB2ZXJzaW9uIGlzCitub3JtYWxseSBzZWxlY3RlZCBieSBkZWZh
dWx0IG9ubHkgaW4gYSBzdHViIGRtIGNvbmZpZ3VyYXRpb24sIGJ1dCBpdAor
Y2FuIGJlIHJlcXVlc3RlZCBleHBsaWNpdGx5IGluIG90aGVyIGNvbmZpZ3Vy
YXRpb25zLCBmb3IgZXhhbXBsZSBpbgorYHhsYCB3aXRoIGBkZXZpY2VfbW9k
ZWxfdmVyc2lvbj0iUUVNVV9YRU5fVFJBRElUSU9OQUwiYC4KKworICAgIFN0
YXR1cywgRGV2aWNlIE1vZGVsIFN0dWIgRG9tYWluczogU3VwcG9ydGVkLCB3
aXRoIGNhdmVhdHMKKyAgICBTdGF0dXMsIGFzIGhvc3QgcHJvY2VzcyBkZXZp
Y2UgbW9kZWw6IE5vIHNlY3VyaXR5IHN1cHBvcnQsIG5vdCByZWNvbW1lbmRl
ZAorCitxZW11LXhlbi10cmFkaXRpb25hbCBpcyBzZWN1cml0eSBzdXBwb3J0
ZWQgb25seSBmb3IgdGhvc2UgYXZhaWxhYmxlCitkZXZpY2VzIHdoaWNoIGFy
ZSBzdXBwb3J0ZWQgZm9yIG1haW5zdHJlYW0gUUVNVSAoc2VlIGFib3ZlKSwg
d2l0aAordHJ1c3RlZCBkcml2ZXIgZG9tYWlucyAoc2VlIERldmljZSBNb2Rl
bCBTdHViIERvbWFpbnMpLgorCiAjIyBWaXJ0dWFsIEZpcm13YXJlCiAKICMj
IyB4ODYvSFZNIGlQWEUKLS0gCjIuMjAuMQoK

--=separator--

