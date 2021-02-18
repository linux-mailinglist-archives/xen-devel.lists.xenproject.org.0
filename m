Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD8B31E913
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 12:47:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86550.162682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lChmQ-0000Ph-AV; Thu, 18 Feb 2021 11:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86550.162682; Thu, 18 Feb 2021 11:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lChmQ-0000PA-5k; Thu, 18 Feb 2021 11:47:34 +0000
Received: by outflank-mailman (input) for mailman id 86550;
 Thu, 18 Feb 2021 11:47:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZheJ=HU=xenbits.xen.org=gdunlap@srs-us1.protection.inumbo.net>)
 id 1lChmO-0000Mp-Cm
 for xen-devel@lists.xen.org; Thu, 18 Feb 2021 11:47:32 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98c26d30-926e-4a86-8b2e-550b9188d054;
 Thu, 18 Feb 2021 11:47:21 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gdunlap@xenbits.xen.org>)
 id 1lChm8-0004oj-9n; Thu, 18 Feb 2021 11:47:16 +0000
Received: from gdunlap by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <gdunlap@xenbits.xen.org>)
 id 1lChm8-0008V9-8E; Thu, 18 Feb 2021 11:47:16 +0000
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
X-Inumbo-ID: 98c26d30-926e-4a86-8b2e-550b9188d054
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=qAwJ86xNj6iy18bFGlL0Zzk4WSB6wYKH7ThjA2nJMbc=; b=bcGgWZH0tqptJxUlJZbVCtjYcp
	LFW4FUt251tKzjm4otY0GBQoMCyB8XyeeY6drDkaC+tshsCnldctbYVNIh9loeP0DKpWCDANAOodX
	G0/IwRq008RCT+2y99kvrhTMeWI2hWWfildC8sQFJigWFEOPpQoZPIOGc06X1dkvPXD8=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 366 v1 - missed flush in XSA-321 backport
Message-Id: <E1lChm8-0008V9-8E@xenbits.xenproject.org>
Date: Thu, 18 Feb 2021 11:47:16 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

                    Xen Security Advisory XSA-366

                   missed flush in XSA-321 backport

ISSUE DESCRIPTION
=================

An oversight was made when backporting XSA-320, leading entries in the
IOMMU not being properly updated under certain circumstances.

IMPACT
======

A malicious guest may be able to retain read/write DMA access to
frames returned to Xen's free pool, and later reused for another
purpose.  Host crashes (leading to a Denial of Service) and privilege
escalation cannot be ruled out.

VULNERABLE SYSTEMS
==================

Xen versions up to 4.11, from at least 3.2 onwards, are affected.  Xen
versions 4.12 and newer are not affected.

Only x86 Intel systems are affected.  x86 AMD as well as Arm systems are
not affected.

Only x86 HVM guests using hardware assisted paging (HAP), having a
passed through PCI device assigned, and having page table sharing
enabled can leverage the vulnerability.  Note that page table
sharing will be enabled (by default) only if Xen considers IOMMU and
CPU large page size support compatible.

MITIGATION
==========

Suppressing the use of page table sharing will avoid the vulnerability
(command line option "iommu=no-sharept").

Suppressing the use of large HAP pages will avoid the vulnerability
(command line options "hap_2mb=no hap_1gb=no").

Not passing through PCI devices to HVM guests will avoid the
vulnerability.

CREDITS
=======

This issue was reported as a bug by M. Vefa Bicakci, and recognized as
a security issue by Roger Pau Monne of Citrix.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa366-4.11.patch      Xen 4.11.x

$ sha256sum xsa366*
3131c9487b9446655e2e21df4ccf1e003bec471881396d7b2b1a0939f5cbae96  xsa366.meta
8c8c18ca8425e6167535c3cf774ffeb9dcb4572e81c8d2ff4a73fefede2d4d94  xsa366-4.11.patch
$

NOTE REGARDING LACK OF EMBARGO
==============================

This was reported and debugged publicly, before the security
implications were apparent.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmAuU5EMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZMCkIAKq1dU6xOMN3lFqY6LeIV+Pn+JQDvJKhDT+lJT9b
KAP+a44ks5bHHSD6CPyiq5boU5APE7yqiyJnXBycXVDLH6GGjh7uBvc6A00YkeHU
y08l8jxa6/FAyrvCj5P0pYItALwH0NZDtfUE57ueloYUu3KJnyBRtl9icvx/sCa9
CUkpKDpS0te+Rk+G57UPDjGvSPwpIh01vphJ5tyf+2Lrk8rsHTJYWQ7eD8A09jCr
DtSD6FylzEuGGY30vPGLUzXgOm8Nji/WgnXnmmbILCEo8PQs3CcoxN53/F8cYvr6
NRERHKZFhHoLmUUCImoFcApxzzdt11USDnCdEXiAkrEOYsk=
=w9OA
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa366.meta"
Content-Disposition: attachment; filename="xsa366.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzNjYsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
IjQuMTEiCiAgXSwKICAiVHJlZXMiOiBbCiAgICAieGVuIgogIF0sCiAgIlJl
Y2lwZXMiOiB7CiAgICAiNC4xMSI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAg
ICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiODBjYWQ1
ODRmYjRjMjU5OWFlMTc0MjI2ZTJjOTEzYmIyM2RmM2JmYSIsCiAgICAgICAg
ICAiUHJlcmVxcyI6IFtdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAg
ICAgICAgICJ4c2EzNjYtNC4xMS5wYXRjaCIKICAgICAgICAgIF0KICAgICAg
ICB9CiAgICAgIH0KICAgIH0KICB9Cn0=

--=separator
Content-Type: application/octet-stream; name="xsa366-4.11.patch"
Content-Disposition: attachment; filename="xsa366-4.11.patch"
Content-Transfer-Encoding: base64

RnJvbTogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
U3ViamVjdDogeDg2L2VwdDogZml4IG1pc3NpbmcgSU9NTVUgZmx1c2ggaW4g
YXRvbWljX3dyaXRlX2VwdF9lbnRyeQoKQmFja3BvcnQgb2YgWFNBLTMyMSBt
aXNzZWQgYSBmbHVzaCBpbiBhdG9taWNfd3JpdGVfZXB0X2VudHJ5IHdoZW4K
bGV2ZWwgd2FzIGRpZmZlcmVudCB0aGFuIDAuIFN1Y2ggb21pc3Npb24gd2ls
bCB1bmRlcm1pbmUgdGhlIGZpeCBmb3IKWFNBLTMyMSwgYmVjYXVzZSBwYWdl
IHRhYmxlIGVudHJpZXMgY2FjaGVkIGluIHRoZSBJT01NVSBjYW4gZ2V0IG91
dApvZiBzeW5jIGFuZCBjb250YWluIHN0YWxlIGVudHJpZXMuCgpGaXggdGhp
cyBieSBzbGlnaHRseSByZS1hcnJhbmdpbmcgdGhlIGNvZGUgdG8gcHJldmVu
dCB0aGUgZWFybHkgcmV0dXJuCndoZW4gbGV2ZWwgaXMgZGlmZmVyZW50IHRo
YXQgMC4gTm90ZSB0aGF0IHRoZSBlYXJseSByZXR1cm4gaXMganVzdCBhbgpv
cHRpbWl6YXRpb24gYmVjYXVzZSBmb3JlaWduIGVudHJpZXMgY2Fubm90IGhh
dmUgbGV2ZWwgPiAwLgoKVGhpcyBpcyBYU0EtMzY2LgoKUmVwb3J0ZWQtYnk6
IE0uIFZlZmEgQmljYWtjaSA8bS52LmJAcnVuYm94LmNvbT4KU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Ci0tLQogeGVuL2FyY2gveDg2L21tL3AybS1lcHQuYyB8IDcgKy0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMgYi94
ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jCmluZGV4IDAzNjc3MWY0M2MuLmZk
ZTJmNWY3ZTMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0
LmMKKysrIGIveGVuL2FyY2gveDg2L21tL3AybS1lcHQuYwpAQCAtNTMsMTIg
KzUzLDcgQEAgc3RhdGljIGludCBhdG9taWNfd3JpdGVfZXB0X2VudHJ5KGVw
dF9lbnRyeV90ICplbnRyeXB0ciwgZXB0X2VudHJ5X3QgbmV3LAogICAgIGJv
b2xfdCBjaGVja19mb3JlaWduID0gKG5ldy5tZm4gIT0gZW50cnlwdHItPm1m
biB8fAogICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5ldy5zYV9wMm10
ICE9IGVudHJ5cHRyLT5zYV9wMm10KTsKIAotICAgIGlmICggbGV2ZWwgKQot
ICAgIHsKLSAgICAgICAgQVNTRVJUKCFpc19lcHRlX3N1cGVycGFnZSgmbmV3
KSB8fCAhcDJtX2lzX2ZvcmVpZ24obmV3LnNhX3AybXQpKTsKLSAgICAgICAg
d3JpdGVfYXRvbWljKCZlbnRyeXB0ci0+ZXB0ZSwgbmV3LmVwdGUpOwotICAg
ICAgICByZXR1cm4gMDsKLSAgICB9CisgICAgQVNTRVJUKCFsZXZlbCB8fCAh
aXNfZXB0ZV9zdXBlcnBhZ2UoJm5ldykgfHwgIXAybV9pc19mb3JlaWduKG5l
dy5zYV9wMm10KSk7CiAKICAgICBpZiAoIHVubGlrZWx5KHAybV9pc19mb3Jl
aWduKG5ldy5zYV9wMm10KSkgKQogICAgIHsK

--=separator--

