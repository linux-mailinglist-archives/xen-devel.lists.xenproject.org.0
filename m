Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E4B423043
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 20:43:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202310.357061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXpPV-0000JO-Sk; Tue, 05 Oct 2021 18:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202310.357061; Tue, 05 Oct 2021 18:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXpPV-0000GQ-Pi; Tue, 05 Oct 2021 18:43:29 +0000
Received: by outflank-mailman (input) for mailman id 202310;
 Tue, 05 Oct 2021 18:43:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zUp0=OZ=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1mXpPU-0007sp-6j
 for xen-devel@lists.xen.org; Tue, 05 Oct 2021 18:43:28 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7faa338-6ff0-4ce1-8566-34655533685a;
 Tue, 05 Oct 2021 18:43:16 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1mXpPC-0001na-3a; Tue, 05 Oct 2021 18:43:10 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1mXpPC-0006vg-20; Tue, 05 Oct 2021 18:43:10 +0000
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
X-Inumbo-ID: c7faa338-6ff0-4ce1-8566-34655533685a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=tfi/3QwQXxxrSN8ZOEpf0N6gSqkc9mlvL65nLRNcV9Y=; b=4Xv/9z2YWtWV1lA5qeAWpVtPNQ
	5K6Zq8UEV8nWtHoISUY5o5Ad0avsVPp+/zKMOwnrN7aQ4pK7yN3USz9sHwwLr0yC/NRBt04PfNNMQ
	oxh5eJlwbfCP2baa4EEHoPfnd9pJzxkofsK1zRuc03Pog9Vc1IdaTRHgjcgCN+40Y4iw=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 386 v1 (CVE-2021-28702) - PCI devices with
 RMRRs not deassigned correctly
Message-Id: <E1mXpPC-0006vg-20@xenbits.xenproject.org>
Date: Tue, 05 Oct 2021 18:43:10 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2021-28702 / XSA-386

            PCI devices with RMRRs not deassigned correctly

ISSUE DESCRIPTION
=================

Certain PCI devices in a system might be assigned Reserved Memory
Regions (specified via Reserved Memory Region Reporting, "RMRR").
These are typically used for platform tasks such as legacy USB
emulation.

If such a device is passed through to a guest, then on guest shutdown
the device is not properly deassigned.  The IOMMU configuration for
these devices which are not properly deassigned ends up pointing to a
freed data structure, including the IO Pagetables.

Subsequent DMA or interrupts from the device will have unpredictable
behaviour, ranging from IOMMU faults to memory corruption.

IMPACT
======

Administrators of guests which have been assigned RMRR-using PCI
devices can cause denial of service and other problems, possibly
including escalation of privilege.

VULNERABLE SYSTEMS
==================

All versions of Xen from at least 4.4 onwards are vulnerable.

Only Intel x86 systems are affected.  AMD x86 systems, and Arm
systems, are all unaffected.

Only systems using PCI passthrough are affected.  (And then, only if
the assigned devices have RMRRs, but whether a device advertises RMRRs
is not easy to discern.)

MITIGATION
==========

There is no mitigation (other than not passing through PCI devices
with RMRRs to guests).

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa386.patch           xen-unstable - Xen 4.12.x

$ sha256sum xsa386*
f2f83c825e249bba9454437b48bbd8307fe7a224f56484388a67af124dfd279b  xsa386.patch
$

NOTE CONCERNING LACK OF EMBARGO
===============================

This issue was reported and debugged in public before the security nature
became apparent.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmFcnH8MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZje0H+QE5A0ZvoaJ5VupZYjAt5ynbQjVqxwxqAxZDTvP7
t3gtpsHSYgrHW+3giULxjGU0ZUGF9daO1JEIZCPCbUdIlmGqGEXdDoqtz0GrXCJJ
swQFeXQVmn9lV4KMTHO0BvGw5aZOft1VgGNrixd3vckFl7c5G8sWFdl7IU7FPDTQ
LiLMg6f1oOntBYjNZUZ2210jqct9GZ4ugURRufwZrwYIpc9H5pFnZAFHKismX/2m
x/PCdmOCeivytmUPA4k62oJVpJdysAL+31XkZz8bbAhjFsUmYBJscW2T5mSfaYIp
TaSrg9WBV+TVW7aNE2iittE2O0/YyOWfpUVh6lliECeFdd0=
=aNEo
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa386.patch"
Content-Disposition: attachment; filename="xsa386.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBWVC1kOiBmaXggZGVhc3NpZ24gb2YgZGV2aWNlIHdpdGggUk1SUgpEYXRl
OiBGcmksIDEgT2N0IDIwMjEgMTU6MDU6NDIgKzAyMDAKCklnbm9yaW5nIGEg
c3BlY2lmaWMgZXJyb3IgY29kZSBoZXJlIHdhcyBub3QgbWVhbnQgdG8gc2hv
cnQgY2lyY3VpdApkZWFzc2lnbiB0byBfanVzdF8gdGhlIHVubWFwcGluZyBv
ZiBSTVJScy4gVGhpcyBidWcgd2FzIHByZXZpb3VzbHkKaGlkZGVuIGJ5IHRo
ZSBib2d1cyAocG90ZW50aWFsbHkgaW5kZWZpbml0ZSkgbG9vcGluZyBpbgpw
Y2lfcmVsZWFzZV9kZXZpY2VzKCksIHVudGlsIGY1OTE3NTU4MjNhNyAoIklP
TU1VL1BDSTogZG9uJ3QgbGV0IGRvbWFpbgpjbGVhbnVwIGNvbnRpbnVlIHdo
ZW4gZGV2aWNlIGRlLWFzc2lnbm1lbnQgZmFpbGVkIikgZml4ZWQgdGhhdCBs
b29wLgoKVGhpcyBpcyBDVkUtMjAyMS0yODcwMiAvIFhTQS0zODYuCgpGaXhl
czogOGI5OWY0NDAwYjY5ICgiVlQtZDogZml4IFJNUlIgcmVsYXRlZCBlcnJv
ciBoYW5kbGluZyIpClJlcG9ydGVkLWJ5OiBJdmFuIEthcmR5a292IDxrYXJk
eWtvdkB0YWJpdC5wcm8+ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KVGVzdGVkLWJ5OiBJdmFuIEthcmR5a292IDxr
YXJkeWtvdkB0YWJpdC5wcm8+CgotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC92dGQvaW9tbXUuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC92dGQvaW9tbXUuYwpAQCAtMjQwOSw3ICsyNDA5LDcgQEAgc3RhdGljIGlu
dCByZWFzc2lnbl9kZXZpY2Vfb3duZXJzaGlwKAogICAgICAgICAgICAgICAg
IHJldCA9IGlvbW11X2lkZW50aXR5X21hcHBpbmcoc291cmNlLCBwMm1fYWNj
ZXNzX3gsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBybXJyLT5iYXNlX2FkZHJlc3MsCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBybXJyLT5lbmRfYWRkcmVz
cywgMCk7Ci0gICAgICAgICAgICAgICAgaWYgKCByZXQgIT0gLUVOT0VOVCAp
CisgICAgICAgICAgICAgICAgaWYgKCByZXQgJiYgcmV0ICE9IC1FTk9FTlQg
KQogICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0OwogICAgICAgICAg
ICAgfQogICAgIH0KCg==

--=separator--

