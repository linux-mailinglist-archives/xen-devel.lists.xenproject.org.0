Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE178C074A
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 00:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719007.1121635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4pdz-00086x-Qn; Wed, 08 May 2024 22:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719007.1121635; Wed, 08 May 2024 22:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4pdz-00083H-M7; Wed, 08 May 2024 22:20:11 +0000
Received: by outflank-mailman (input) for mailman id 719007;
 Wed, 08 May 2024 22:20:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEdx=ML=xenbits.xen.org=julieng@srs-se1.protection.inumbo.net>)
 id 1s4pdy-0007z7-HK
 for xen-devel@lists.xen.org; Wed, 08 May 2024 22:20:10 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e8a195d-0d89-11ef-b4bb-af5377834399;
 Thu, 09 May 2024 00:20:06 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1s4pdm-0001Uy-2T; Wed, 08 May 2024 22:19:58 +0000
Received: from julieng by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1s4pdm-0005hR-0X; Wed, 08 May 2024 22:19:58 +0000
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
X-Inumbo-ID: 1e8a195d-0d89-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=9h/2wzU0Mvhn2MKrTpCI2QVVZK0bZHd1iD7FuzxTA8E=; b=tSR60kzSnRej3nVh6mY4MjCHPJ
	KGGsGnSctV0d2rb8HT4jpEcnuRdfMKp9Z1J8A3DEjpqr7+0AZHEzOMNR/yZaapi9ERIyHckKxHtVl
	bpoSB5FVw+pjsdaSv7X0r9BS/wvgTMXcB4vLp6ibDCckxRGSjANPfeFrtu1n/1onX6aU=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 457 v3 (CVE-2024-27393) - Linux/xen-netfront:
 Memory leak due to missing cleanup function
Message-Id: <E1s4pdm-0005hR-0X@xenbits.xenproject.org>
Date: Wed, 08 May 2024 22:19:58 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2024-27393 / XSA-457
                              version 3

    Linux/xen-netfront: Memory leak due to missing cleanup function

UPDATES IN VERSION 3
====================

CVE assigned.

ISSUE DESCRIPTION
=================

In netfront, xennet_alloc_one_rx_buffer() failed to call the
appropriate clean-up function, resulting in a memory leak.

IMPACT
======

A malicious guest userspace process can exhaust memory resources
within the guest kernel, potentially leading to a guest crash (Denial
of Service). It is not known whether it can be triggered remotely.

VULNERABLE SYSTEMS
==================

Systems with guests running Linux 5.9 and later with Xen PV network
devices are affected.

MITIGATION
==========

For HVM guests, using emulated network devices will avoid this issue.

RESOLUTION
==========

The following patch in Linux resolves the issue:

https://git.kernel.org/torvalds/c/037965402a010898d34f4e35327d22c0a95cd51f

A copy of which is attached.

xsa457.patch           Linux 5.9

$ sha256sum xsa457*
9d6ae3da27f1ff92f9f45c800822beecda603d6dea6726207cee6c768416114c  xsa457.patch
$


NOTE ON THE LACK OF EMBARGO
===========================

The issue was reported initially on a public bug tracker and fixed in
public before it was realized that there was a security aspect.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmY7+mgMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZIygH/2qlkovJs5zZy4dTpsygoSnSiv6L31r2IGmMnR/c
qdgtfedzctQ/ibw0iaz/37w/d0F3lo/lg3iWnVgCcIfV384MvvoArFsOZ4v/RRXL
b0XiNCb0k5xLpw9R86f7oG7cDw59JU+sXVjBH6GcVo86yL+HKaeli7/FZb9zkz/D
VRushpxeA353u3FFdqHJcFlD68wA5nhM2JdjkPk1rrgPVc0sBLjHwrcFOrHHHuuq
epYSYzWEf5HGbOf+zg6NY9B0uD4Vb9J3xa+xcYaHfPlQ1Jexw5GA7vBMO82qcR57
lRwAOav844fHw+lNxizfg8+4ayFpOCyGX2WEag6qjN92qJE=
=mMwm
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa457.patch"
Content-Disposition: attachment; filename="xsa457.patch"
Content-Transfer-Encoding: base64

RnJvbSAwMzc5NjU0MDJhMDEwODk4ZDM0ZjRlMzUzMjdkMjJjMGE5NWNkNTFm
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKZXNwZXIgRGFuZ2Fh
cmQgQnJvdWVyIDxoYXdrQGtlcm5lbC5vcmc+CkRhdGU6IFdlZCwgMjcgTWFy
IDIwMjQgMTM6MTQ6NTYgKzAxMDAKU3ViamVjdDogeGVuLW5ldGZyb250OiBB
ZGQgbWlzc2luZyBza2JfbWFya19mb3JfcmVjeWNsZQoKTm90aWNlIHRoYXQg
c2tiX21hcmtfZm9yX3JlY3ljbGUoKSBpcyBpbnRyb2R1Y2VkIGxhdGVyIHRo
YW4gZml4ZXMgdGFnIGluCmNvbW1pdCA2YTViY2Q4NGU4ODYgKCJwYWdlX3Bv
b2w6IEFsbG93IGRyaXZlcnMgdG8gaGludCBvbiBTS0IgcmVjeWNsaW5nIiku
CgpJdCBpcyBiZWxpZXZlZCB0aGF0IGZpeGVzIHRhZyB3ZXJlIG1pc3Npbmcg
YSBjYWxsIHRvIHBhZ2VfcG9vbF9yZWxlYXNlX3BhZ2UoKQpiZXR3ZWVuIHY1
LjkgdG8gdjUuMTQsIGFmdGVyIHdoaWNoIGlzIHNob3VsZCBoYXZlIHVzZWQg
c2tiX21hcmtfZm9yX3JlY3ljbGUoKS4KU2luY2UgdjYuNiB0aGUgY2FsbCBw
YWdlX3Bvb2xfcmVsZWFzZV9wYWdlKCkgd2VyZSByZW1vdmVkIChpbgpjb21t
aXQgNTM1YjljNjFiZGVmICgibmV0OiBwYWdlX3Bvb2w6IGhpZGUgcGFnZV9w
b29sX3JlbGVhc2VfcGFnZSgpIikKYW5kIHJlbWFpbmluZyBjYWxsZXJzIGNv
bnZlcnRlZCAoaW4gY29tbWl0IDZiZmVmMmVjMDE3MiAoIk1lcmdlIGJyYW5j
aAonbmV0LXBhZ2VfcG9vbC1yZW1vdmUtcGFnZV9wb29sX3JlbGVhc2VfcGFn
ZSciKSkuCgpUaGlzIGxlYWsgYmVjYW1lIHZpc2libGUgaW4gdjYuOCB2aWEg
Y29tbWl0IGRiYTFiOGE3YWI2OCAoIm1tL3BhZ2VfcG9vbDogY2F0Y2gKcGFn
ZV9wb29sIG1lbW9yeSBsZWFrcyIpLgoKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmcKRml4ZXM6IDZjNWFhNmZjNGRlZiAoInhlbiBuZXR3b3JraW5nOiBh
ZGQgYmFzaWMgWERQIHN1cHBvcnQgZm9yIHhlbi1uZXRmcm9udCIpClJlcG9y
dGVkLWJ5OiBMZW9uaWRhcyBTcHlyb3BvdWxvcyA8YXJ0YWZpbmRlQGFyY2hs
aW51eC5jb20+Ckxpbms6IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9z
aG93X2J1Zy5jZ2k/aWQ9MjE4NjU0ClJlcG9ydGVkLWJ5OiBBcnRodXIgQm9y
c2Jvb20gPGFydGh1cmJvcnNib29tQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1i
eTogSmVzcGVyIERhbmdhYXJkIEJyb3VlciA8aGF3a0BrZXJuZWwub3JnPgpM
aW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzE3MTE1NDE2NzQ0Ni4y
NjcxMDYyLjkxMjcxMDUzODQ1OTEyMzczNjMuc3RnaXRAZmlyZXNvdWwKU2ln
bmVkLW9mZi1ieTogSmFrdWIgS2ljaW5za2kgPGt1YmFAa2VybmVsLm9yZz4K
LS0tCiBkcml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQuYyB8IDEgKwogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9uZXQveGVuLW5ldGZyb250LmMgYi9kcml2ZXJzL25ldC94ZW4tbmV0ZnJv
bnQuYwppbmRleCBhZDI5ZjM3MDAzNGU0Zi4uOGQyYWVlODg1MjZjNjkgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jCisrKyBiL2Ry
aXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jCkBAIC0yODUsNiArMjg1LDcgQEAg
c3RhdGljIHN0cnVjdCBza19idWZmICp4ZW5uZXRfYWxsb2Nfb25lX3J4X2J1
ZmZlcihzdHJ1Y3QgbmV0ZnJvbnRfcXVldWUgKnF1ZXVlKQogCQlyZXR1cm4g
TlVMTDsKIAl9CiAJc2tiX2FkZF9yeF9mcmFnKHNrYiwgMCwgcGFnZSwgMCwg
MCwgUEFHRV9TSVpFKTsKKwlza2JfbWFya19mb3JfcmVjeWNsZShza2IpOwog
CiAJLyogQWxpZ24gaXAgaGVhZGVyIHRvIGEgMTYgYnl0ZXMgYm91bmRhcnkg
Ki8KIAlza2JfcmVzZXJ2ZShza2IsIE5FVF9JUF9BTElHTik7Ci0tIApjZ2l0
IDEuMi4zLWtvcmcKCg==

--=separator--

