Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB289F4AD3
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 13:19:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858916.1271172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNWXN-0002zi-T4; Tue, 17 Dec 2024 12:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858916.1271172; Tue, 17 Dec 2024 12:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNWXN-0002wf-Oc; Tue, 17 Dec 2024 12:18:53 +0000
Received: by outflank-mailman (input) for mailman id 858916;
 Tue, 17 Dec 2024 12:18:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9m0=TK=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1tNWXM-0002GC-Eo
 for xen-devel@lists.xen.org; Tue, 17 Dec 2024 12:18:52 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10800b33-bc71-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 13:18:48 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1tNWXC-0081kR-16;
 Tue, 17 Dec 2024 12:18:42 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1tNWXC-00E24k-1b;
 Tue, 17 Dec 2024 12:18:42 +0000
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
X-Inumbo-ID: 10800b33-bc71-11ef-a0d6-8be0dac302b0
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.510 (Entity 5.510)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 465 v3 (CVE-2024-53240) - Backend can crash
 Linux netfront
Message-Id: <E1tNWXC-00E24k-1b@xenbits.xenproject.org>
Date: Tue, 17 Dec 2024 12:18:42 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

             Xen Security Advisory CVE-2024-53240 / XSA-465
                                version 3

                   Backend can crash Linux netfront

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

After a suspend/resume cycle of a Linux guest (e.g. via "virsh dompmsuspend"/
"virsh dompmwakeup") a malicious network backend can crash the guest via a
NULL-pointer dereference in the guest's xen-netfront driver.

During the resume operation the xen-netfront driver will release some data
structures used for communication with the backend, in order to reallocate
these data structures with possibly different parameters specified by the
backend. If the backend is triggering a network device removal in the
guest before any network I/O has happened, the NULL-pointer dereference
may happen, causing a crash of the guest.

IMPACT
======

In setups with non-trusted network backends (e.g. when using untrusted
network driver domains) suspend/resume cycles of guests can result in
those guests being crashed by a malicious network backend.

VULNERABLE SYSTEMS
==================

Only systems with non-trusted network backends are vulnerable.

As far as known only Linux guests with the fix for CVE-2022-48969 applied
are vulnerable (this includes all kernel versions from 6.1 onwards).

All guest types (x86 PV, x86 PVH/HVM and Arm32/Arm64) are vulnerable.

MITIGATION
==========

Not doing guest suspend/resume cycles will avoid the vulnerability.

Using emulated NICs instead of PV ones will avoid the vulnerability.

CREDITS
=======

This issue was discovered by Marek Marczykowski-Górecki of Invisible Things Lab.

RESOLUTION
==========

Applying the attached patch resolves this issue.

xsa465-linux.patch     Linux

$ sha256sum xsa465*
7207a22e1e70d0b00278d90e797313bee9d72a968ddd38464b90f0612667826e  xsa465-linux.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of patches or mitigations is NOT permitted (except where
all the affected systems and VMs are administered and used only by
organisations which are members of the Xen Project Security Issues
Predisclosure List).  Specifically, deployment on public cloud systems
is NOT permitted.

This is because the patches need to be applied to the guests and using
emulated NICs is a guest visible configuration change.

Deployment is permitted only AFTER the embargo ends.

(Note: this during-embargo deployment notice is retained in
post-embargo publicly released Xen Project advisories, even though it
is then no longer applicable.  This is to enable the community to have
oversight of the Xen Project Security Team's decisionmaking.)

For more information about permissible uses of embargoed information,
consult the Xen Project community's agreed Security Policy:
  http://www.xenproject.org/security-policy.html
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmdhaw0MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZ1kYH/3u0RtjvoOLf2CTFAPhBfgVXZ0nbaQAVeVY14OXL
3WAOQzrspobwSJtVUqRCg14NllEkM2ityeAlussY++b9BFW7nqxji9yL/rSMpuPh
vsH/sDByBSUYxpaw/LgbkZVvhRq3vbK6E7fnXCw8BO9LYA+uTZRf4P6PRe0JeQtz
t0IyHsECXaPoSWzX18OtSrg1JFYhgBqB9vK4rKMvMjPpqZDIKlEgIpFwNlywZ6jx
H6T3CCKUPUZqmVegxJtXIof3STEr9bzd4StPaUrRXfToOg5ZsknUkari0Nr8xW27
mcTZaFVWgWwfI0irMs9jTp2agfQ6T+yptA8ZfM3J7kGvGcc=
=+A6o
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa465-linux.patch"
Content-Disposition: attachment; filename="xsa465-linux.patch"
Content-Transfer-Encoding: base64

RnJvbSBmOTI0NGZiNTVmMzczNTZmNzVjNzM5YzU3MzIzZDk0MjJkN2FhMGY4
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CkRhdGU6IFRodSwgNyBOb3YgMjAyNCAxNjox
NzowMCArMDEwMApTdWJqZWN0OiB4ZW4vbmV0ZnJvbnQ6IGZpeCBjcmFzaCB3
aGVuIHJlbW92aW5nIGRldmljZQpNSU1FLVZlcnNpb246IDEuMApDb250ZW50
LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFu
c2Zlci1FbmNvZGluZzogOGJpdAoKV2hlbiByZW1vdmluZyBhIG5ldGZyb250
IGRldmljZSBkaXJlY3RseSBhZnRlciBhIHN1c3BlbmQvcmVzdW1lIGN5Y2xl
Cml0IG1pZ2h0IGhhcHBlbiB0aGF0IHRoZSBxdWV1ZXMgaGF2ZSBub3QgYmVl
biBzZXR1cCBhZ2FpbiwgY2F1c2luZyBhCmNyYXNoIGR1cmluZyB0aGUgYXR0
ZW1wdCB0byBzdG9wIHRoZSBxdWV1ZXMgYW5vdGhlciB0aW1lLgoKRml4IHRo
YXQgYnkgY2hlY2tpbmcgdGhlIHF1ZXVlcyBhcmUgZXhpc3RpbmcgYmVmb3Jl
IHRyeWluZyB0byBzdG9wCnRoZW0uCgpUaGlzIGlzIFhTQS00NjUgLyBDVkUt
MjAyNC01MzI0MC4KClJlcG9ydGVkLWJ5OiBNYXJlayBNYXJjenlrb3dza2kt
R8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+CkZp
eGVzOiBkNTBiNzkxNGZhZTAgKCJ4ZW4tbmV0ZnJvbnQ6IEZpeCBOVUxMIHNy
aW5nIGFmdGVyIGxpdmUgbWlncmF0aW9uIikKU2lnbmVkLW9mZi1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIGRyaXZlcnMvbmV0
L3hlbi1uZXRmcm9udC5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jIGIvZHJpdmVycy9uZXQveGVuLW5l
dGZyb250LmMKaW5kZXggNDI2NWMxY2QwZmY3Li42M2ZlNTFkMGU2NGQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jCisrKyBiL2Ry
aXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jCkBAIC04NjcsNyArODY3LDcgQEAg
c3RhdGljIG5ldGRldl90eF90IHhlbm5ldF9zdGFydF94bWl0KHN0cnVjdCBz
a19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNlICpkZXYKIHN0YXRpYyBp
bnQgeGVubmV0X2Nsb3NlKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpCiB7CiAJ
c3RydWN0IG5ldGZyb250X2luZm8gKm5wID0gbmV0ZGV2X3ByaXYoZGV2KTsK
LQl1bnNpZ25lZCBpbnQgbnVtX3F1ZXVlcyA9IGRldi0+cmVhbF9udW1fdHhf
cXVldWVzOworCXVuc2lnbmVkIGludCBudW1fcXVldWVzID0gbnAtPnF1ZXVl
cyA/IGRldi0+cmVhbF9udW1fdHhfcXVldWVzIDogMDsKIAl1bnNpZ25lZCBp
bnQgaTsKIAlzdHJ1Y3QgbmV0ZnJvbnRfcXVldWUgKnF1ZXVlOwogCW5ldGlm
X3R4X3N0b3BfYWxsX3F1ZXVlcyhucC0+bmV0ZGV2KTsKQEAgLTg4Miw2ICs4
ODIsOSBAQCBzdGF0aWMgdm9pZCB4ZW5uZXRfZGVzdHJveV9xdWV1ZXMoc3Ry
dWN0IG5ldGZyb250X2luZm8gKmluZm8pCiB7CiAJdW5zaWduZWQgaW50IGk7
CiAKKwlpZiAoIWluZm8tPnF1ZXVlcykKKwkJcmV0dXJuOworCiAJZm9yIChp
ID0gMDsgaSA8IGluZm8tPm5ldGRldi0+cmVhbF9udW1fdHhfcXVldWVzOyBp
KyspIHsKIAkJc3RydWN0IG5ldGZyb250X3F1ZXVlICpxdWV1ZSA9ICZpbmZv
LT5xdWV1ZXNbaV07CiAKLS0gCjIuNDMuMAoK

--=separator--

