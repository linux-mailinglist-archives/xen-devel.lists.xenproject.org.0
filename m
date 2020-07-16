Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 064E42223BA
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 15:19:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw3n5-0004s3-6e; Thu, 16 Jul 2020 13:19:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xJjh=A3=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1jw3n3-0004rq-Rn
 for xen-devel@lists.xen.org; Thu, 16 Jul 2020 13:19:09 +0000
X-Inumbo-ID: eb9fc9f4-c766-11ea-b7bb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb9fc9f4-c766-11ea-b7bb-bc764e2007e4;
 Thu, 16 Jul 2020 13:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3VGZzYg6mn62RtPmWMdMHRbsHJM8t32N5zUX+qK4CUw=; b=G7u8LMu9ALbkKy8HZA3VKFPwtJ
 ExmVOFeRW3Hkjfbt1HVZrvl2CAeZsfBaiq++awmQq1YLnmRYVn9YPIXoEm46dg9pJ6Ps4DPkdYzwd
 pHGAM9/5cy/0G36Iv8l0Y5VmPyGTJIxMP3KLqKuPyYsnAunp95ZFEt46TTSt9M8iRZIY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1jw3ms-0006Kq-VB; Thu, 16 Jul 2020 13:18:58 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1jw3ms-0006i6-Se; Thu, 16 Jul 2020 13:18:58 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
Subject: Xen Security Advisory 329 v2 - Linux ioperm bitmap context
 switching issues
Message-Id: <E1jw3ms-0006i6-Se@xenbits.xenproject.org>
Date: Thu, 16 Jul 2020 13:18:58 +0000
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
Cc: "Xen.org security team" <security-team-members@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

                    Xen Security Advisory XSA-329
                              version 2

             Linux ioperm bitmap context switching issues

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

Linux 5.5 overhauled the internal state handling for the iopl() and ioperm()
system calls.  Unfortunately, one aspect on context switch wasn't wired up
correctly for the Xen PVOps case.

IMPACT
======

IO port permissions don't get rescinded when context switching to an
unprivileged task.  Therefore, all userspace can use the IO ports granted to
the most recently scheduled task with IO port permissions.

VULNERABLE SYSTEMS
==================

Only x86 guests are vulnerable.

All versions of Linux from 5.5 are potentially vulnerable.

Linux is only vulnerable when running as x86 PV guest.  Linux is not
vulnerable when running as an x86 HVM/PVH guests.

The vulnerability can only be exploited in domains which have been granted
access to IO ports by Xen.  This is typically only the hardware domain, and
guests configured with PCI Passthrough.

MITIGATION
==========

Running only HVM/PVH guests avoids the vulnerability.

CREDITS
=======

This issue was discovered by Andy Lutomirski.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

xsa329.patch           Linux 5.5 and later

$ sha256sum xsa329*
cdb5ac9bfd21192b5965e8ec0a1c4fcf12d0a94a962a8158cd27810e6aa362f0  xsa329.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl8QU6EMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZ/sEIAMiCOnz119KTlRU50HTwa4pvIgLphf9htTbPzHXS
iEb8yINqMxmep8NRcAzwFREQP+Z4Tue1upt31Vx0RPkFZpUklLuuBSXsV0JA7+UM
LSGyWhkzDdnfj6iPUHycGmFzRTzkbB7qfcMj7khCvuYtSNbTUdOgUq04ngZksrSJ
UMhfgUNKXawULKvVe7572L/AQTmMXK8eaolb+eWtf1U2pFkZQR8GWoLmiFbKLks2
X2tRUF4U4cHEBzxXRzYrD1ArWLajqK6hQmauwgkCCSowvCHoD1dTv55GlrlEo4od
MSB6YOVLl7HJuUw1GmwlKjA8XqStHq1Fi0urvlKCfHfK2Wk=
=MP+m
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa329.patch"
Content-Disposition: attachment; filename="xsa329.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5keSBMdXRvbWlyc2tpIDxsdXRvQGtlcm5lbC5vcmc+ClN1Ympl
Y3Q6IHg4Ni9pb3Blcm06IEZpeCBpbyBiaXRtYXAgaW52YWxpZGF0aW9uIG9u
IFhlbiBQVgoKdHNzX2ludmFsaWRhdGVfaW9fYml0bWFwKCkgd2Fzbid0IHdp
cmVkIHVwIHByb3Blcmx5IHRocm91Z2ggdGhlIHB2b3AKbWFjaGluZXJ5LCBz
byB0aGUgVFNTIGFuZCBYZW4ncyBpbyBiaXRtYXAgd291bGQgZ2V0IG91dCBv
ZiBzeW5jCndoZW5ldmVyIGRpc2FibGluZyBhIHZhbGlkIGlvIGJpdG1hcC4K
CkFkZCBhIG5ldyBwdm9wIGZvciB0c3NfaW52YWxpZGF0ZV9pb19iaXRtYXAo
KSB0byBmaXggaXQuCgpUaGlzIGlzIFhTQS0zMjkuCgpGaXhlczogMjJmZTVi
MDQzOWRkICgieDg2L2lvcGVybTogTW92ZSBUU1MgYml0bWFwIHVwZGF0ZSB0
byBleGl0IHRvIHVzZXIgd29yayIpClNpZ25lZC1vZmYtYnk6IEFuZHkgTHV0
b21pcnNraSA8bHV0b0BrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogVGhvbWFz
IEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CgpkaWZmIC0tZ2l0IGEv
YXJjaC94ODYvaW5jbHVkZS9hc20vaW9fYml0bWFwLmggYi9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9pb19iaXRtYXAuaAppbmRleCBhYzFhOTlmZmJkOGQuLjdm
MDgwZjVjN2RlZiAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20v
aW9fYml0bWFwLmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vaW9fYml0
bWFwLmgKQEAgLTE5LDEyICsxOSwyOCBAQCBzdHJ1Y3QgdGFza19zdHJ1Y3Q7
CiB2b2lkIGlvX2JpdG1hcF9zaGFyZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRz
ayk7CiB2b2lkIGlvX2JpdG1hcF9leGl0KHN0cnVjdCB0YXNrX3N0cnVjdCAq
dHNrKTsKIAorc3RhdGljIGlubGluZSB2b2lkIG5hdGl2ZV90c3NfaW52YWxp
ZGF0ZV9pb19iaXRtYXAodm9pZCkKK3sKKwkvKgorCSAqIEludmFsaWRhdGUg
dGhlIEkvTyBiaXRtYXAgYnkgbW92aW5nIGlvX2JpdG1hcF9iYXNlIG91dHNp
ZGUgdGhlCisJICogVFNTIGxpbWl0IHNvIGFueSBzdWJzZXF1ZW50IEkvTyBh
Y2Nlc3MgZnJvbSB1c2VyIHNwYWNlIHdpbGwKKwkgKiB0cmlnZ2VyIGEgI0dQ
LgorCSAqCisJICogVGhpcyBpcyBjb3JyZWN0IGV2ZW4gd2hlbiBWTUVYSVQg
cmV3cml0ZXMgdGhlIFRTUyBsaW1pdAorCSAqIHRvIDB4NjcgYXMgdGhlIG9u
bHkgcmVxdWlyZW1lbnQgaXMgdGhhdCB0aGUgYmFzZSBwb2ludHMKKwkgKiBv
dXRzaWRlIHRoZSBsaW1pdC4KKwkgKi8KKwl0aGlzX2NwdV93cml0ZShjcHVf
dHNzX3J3Lng4Nl90c3MuaW9fYml0bWFwX2Jhc2UsCisJCSAgICAgICBJT19C
SVRNQVBfT0ZGU0VUX0lOVkFMSUQpOworfQorCiB2b2lkIG5hdGl2ZV90c3Nf
dXBkYXRlX2lvX2JpdG1hcCh2b2lkKTsKIAogI2lmZGVmIENPTkZJR19QQVJB
VklSVF9YWEwKICNpbmNsdWRlIDxhc20vcGFyYXZpcnQuaD4KICNlbHNlCiAj
ZGVmaW5lIHRzc191cGRhdGVfaW9fYml0bWFwIG5hdGl2ZV90c3NfdXBkYXRl
X2lvX2JpdG1hcAorI2RlZmluZSB0c3NfaW52YWxpZGF0ZV9pb19iaXRtYXAg
bmF0aXZlX3Rzc19pbnZhbGlkYXRlX2lvX2JpdG1hcAogI2VuZGlmCiAKICNl
bHNlCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYXJhdmly
dC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnQuaAppbmRleCA1
Y2E1ZDI5N2RmNzUuLjNkMmFmZWNkZTUwYyAxMDA2NDQKLS0tIGEvYXJjaC94
ODYvaW5jbHVkZS9hc20vcGFyYXZpcnQuaAorKysgYi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9wYXJhdmlydC5oCkBAIC0zMDIsNiArMzAyLDExIEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCB3cml0ZV9pZHRfZW50cnkoZ2F0ZV9kZXNjICpkdCwg
aW50IGVudHJ5LCBjb25zdCBnYXRlX2Rlc2MgKmcpCiB9CiAKICNpZmRlZiBD
T05GSUdfWDg2X0lPUExfSU9QRVJNCitzdGF0aWMgaW5saW5lIHZvaWQgdHNz
X2ludmFsaWRhdGVfaW9fYml0bWFwKHZvaWQpCit7CisJUFZPUF9WQ0FMTDAo
Y3B1LmludmFsaWRhdGVfaW9fYml0bWFwKTsKK30KKwogc3RhdGljIGlubGlu
ZSB2b2lkIHRzc191cGRhdGVfaW9fYml0bWFwKHZvaWQpCiB7CiAJUFZPUF9W
Q0FMTDAoY3B1LnVwZGF0ZV9pb19iaXRtYXApOwpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnRfdHlwZXMuaCBiL2FyY2gveDg2
L2luY2x1ZGUvYXNtL3BhcmF2aXJ0X3R5cGVzLmgKaW5kZXggNzMyZjYyZTA0
ZGRiLi44ZGZjYjI1MDhlNmQgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1
ZGUvYXNtL3BhcmF2aXJ0X3R5cGVzLmgKKysrIGIvYXJjaC94ODYvaW5jbHVk
ZS9hc20vcGFyYXZpcnRfdHlwZXMuaApAQCAtMTQxLDYgKzE0MSw3IEBAIHN0
cnVjdCBwdl9jcHVfb3BzIHsKIAl2b2lkICgqbG9hZF9zcDApKHVuc2lnbmVk
IGxvbmcgc3AwKTsKIAogI2lmZGVmIENPTkZJR19YODZfSU9QTF9JT1BFUk0K
Kwl2b2lkICgqaW52YWxpZGF0ZV9pb19iaXRtYXApKHZvaWQpOwogCXZvaWQg
KCp1cGRhdGVfaW9fYml0bWFwKSh2b2lkKTsKICNlbmRpZgogCmRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni9rZXJuZWwvcGFyYXZpcnQuYyBiL2FyY2gveDg2L2tl
cm5lbC9wYXJhdmlydC5jCmluZGV4IDY3NGE3ZDY2ZDk2MC4uZGUyMTM4YmEz
OGU1IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rZXJuZWwvcGFyYXZpcnQuYwor
KysgYi9hcmNoL3g4Ni9rZXJuZWwvcGFyYXZpcnQuYwpAQCAtMzI0LDcgKzMy
NCw4IEBAIHN0cnVjdCBwYXJhdmlydF9wYXRjaF90ZW1wbGF0ZSBwdl9vcHMg
PSB7CiAJLmNwdS5zd2FwZ3MJCT0gbmF0aXZlX3N3YXBncywKIAogI2lmZGVm
IENPTkZJR19YODZfSU9QTF9JT1BFUk0KLQkuY3B1LnVwZGF0ZV9pb19iaXRt
YXAJPSBuYXRpdmVfdHNzX3VwZGF0ZV9pb19iaXRtYXAsCisJLmNwdS5pbnZh
bGlkYXRlX2lvX2JpdG1hcAk9IG5hdGl2ZV90c3NfaW52YWxpZGF0ZV9pb19i
aXRtYXAsCisJLmNwdS51cGRhdGVfaW9fYml0bWFwCQk9IG5hdGl2ZV90c3Nf
dXBkYXRlX2lvX2JpdG1hcCwKICNlbmRpZgogCiAJLmNwdS5zdGFydF9jb250
ZXh0X3N3aXRjaAk9IHBhcmF2aXJ0X25vcCwKZGlmZiAtLWdpdCBhL2FyY2gv
eDg2L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL3g4Ni9rZXJuZWwvcHJvY2Vz
cy5jCmluZGV4IGYzNjJjZTBkNWFjMC4uZmU2N2RiZDc2ZTUxIDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni9rZXJuZWwvcHJvY2Vzcy5jCisrKyBiL2FyY2gveDg2
L2tlcm5lbC9wcm9jZXNzLmMKQEAgLTMyMiwyMCArMzIyLDYgQEAgdm9pZCBh
cmNoX3NldHVwX25ld19leGVjKHZvaWQpCiB9CiAKICNpZmRlZiBDT05GSUdf
WDg2X0lPUExfSU9QRVJNCi1zdGF0aWMgaW5saW5lIHZvaWQgdHNzX2ludmFs
aWRhdGVfaW9fYml0bWFwKHN0cnVjdCB0c3Nfc3RydWN0ICp0c3MpCi17Ci0J
LyoKLQkgKiBJbnZhbGlkYXRlIHRoZSBJL08gYml0bWFwIGJ5IG1vdmluZyBp
b19iaXRtYXBfYmFzZSBvdXRzaWRlIHRoZQotCSAqIFRTUyBsaW1pdCBzbyBh
bnkgc3Vic2VxdWVudCBJL08gYWNjZXNzIGZyb20gdXNlciBzcGFjZSB3aWxs
Ci0JICogdHJpZ2dlciBhICNHUC4KLQkgKgotCSAqIFRoaXMgaXMgY29ycmVj
dCBldmVuIHdoZW4gVk1FWElUIHJld3JpdGVzIHRoZSBUU1MgbGltaXQKLQkg
KiB0byAweDY3IGFzIHRoZSBvbmx5IHJlcXVpcmVtZW50IGlzIHRoYXQgdGhl
IGJhc2UgcG9pbnRzCi0JICogb3V0c2lkZSB0aGUgbGltaXQuCi0JICovCi0J
dHNzLT54ODZfdHNzLmlvX2JpdG1hcF9iYXNlID0gSU9fQklUTUFQX09GRlNF
VF9JTlZBTElEOwotfQotCiBzdGF0aWMgaW5saW5lIHZvaWQgc3dpdGNoX3Rv
X2JpdG1hcCh1bnNpZ25lZCBsb25nIHRpZnApCiB7CiAJLyoKQEAgLTM0Niw3
ICszMzIsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc3dpdGNoX3RvX2JpdG1h
cCh1bnNpZ25lZCBsb25nIHRpZnApCiAJICogdXNlciBtb2RlLgogCSAqLwog
CWlmICh0aWZwICYgX1RJRl9JT19CSVRNQVApCi0JCXRzc19pbnZhbGlkYXRl
X2lvX2JpdG1hcCh0aGlzX2NwdV9wdHIoJmNwdV90c3NfcncpKTsKKwkJdHNz
X2ludmFsaWRhdGVfaW9fYml0bWFwKCk7CiB9CiAKIHN0YXRpYyB2b2lkIHRz
c19jb3B5X2lvX2JpdG1hcChzdHJ1Y3QgdHNzX3N0cnVjdCAqdHNzLCBzdHJ1
Y3QgaW9fYml0bWFwICppb2JtKQpAQCAtMzgwLDcgKzM2Niw3IEBAIHZvaWQg
bmF0aXZlX3Rzc191cGRhdGVfaW9fYml0bWFwKHZvaWQpCiAJdTE2ICpiYXNl
ID0gJnRzcy0+eDg2X3Rzcy5pb19iaXRtYXBfYmFzZTsKIAogCWlmICghdGVz
dF90aHJlYWRfZmxhZyhUSUZfSU9fQklUTUFQKSkgewotCQl0c3NfaW52YWxp
ZGF0ZV9pb19iaXRtYXAodHNzKTsKKwkJbmF0aXZlX3Rzc19pbnZhbGlkYXRl
X2lvX2JpdG1hcCgpOwogCQlyZXR1cm47CiAJfQogCmRpZmYgLS1naXQgYS9h
cmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMgYi9hcmNoL3g4Ni94ZW4vZW5s
aWdodGVuX3B2LmMKaW5kZXggYWNjNDlmYTZhMDk3Li5jNDc1YTExYzY2MjAg
MTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYworKysg
Yi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKQEAgLTg1MCw2ICs4NTAs
MTcgQEAgc3RhdGljIHZvaWQgeGVuX2xvYWRfc3AwKHVuc2lnbmVkIGxvbmcg
c3AwKQogfQogCiAjaWZkZWYgQ09ORklHX1g4Nl9JT1BMX0lPUEVSTQorc3Rh
dGljIHZvaWQgeGVuX2ludmFsaWRhdGVfaW9fYml0bWFwKHZvaWQpCit7CisJ
c3RydWN0IHBoeXNkZXZfc2V0X2lvYml0bWFwIGlvYml0bWFwID0geworCQku
Yml0bWFwID0gMCwKKwkJLm5yX3BvcnRzID0gMCwKKwl9OworCisJbmF0aXZl
X3Rzc19pbnZhbGlkYXRlX2lvX2JpdG1hcCgpOworCUhZUEVSVklTT1JfcGh5
c2Rldl9vcChQSFlTREVWT1Bfc2V0X2lvYml0bWFwLCAmaW9iaXRtYXApOwor
fQorCiBzdGF0aWMgdm9pZCB4ZW5fdXBkYXRlX2lvX2JpdG1hcCh2b2lkKQog
ewogCXN0cnVjdCBwaHlzZGV2X3NldF9pb2JpdG1hcCBpb2JpdG1hcDsKQEAg
LTEwNzksNiArMTA5MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHZfY3B1
X29wcyB4ZW5fY3B1X29wcyBfX2luaXRjb25zdCA9IHsKIAkubG9hZF9zcDAg
PSB4ZW5fbG9hZF9zcDAsCiAKICNpZmRlZiBDT05GSUdfWDg2X0lPUExfSU9Q
RVJNCisJLmludmFsaWRhdGVfaW9fYml0bWFwID0geGVuX2ludmFsaWRhdGVf
aW9fYml0bWFwLAogCS51cGRhdGVfaW9fYml0bWFwID0geGVuX3VwZGF0ZV9p
b19iaXRtYXAsCiAjZW5kaWYKIAkuaW9fZGVsYXkgPSB4ZW5faW9fZGVsYXks
Cg==

--=separator--

