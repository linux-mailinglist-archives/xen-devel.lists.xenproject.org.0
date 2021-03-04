Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 435C132D0FB
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 11:41:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93104.175785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHlOp-0006qs-Ro; Thu, 04 Mar 2021 10:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93104.175785; Thu, 04 Mar 2021 10:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHlOp-0006qL-Mk; Thu, 04 Mar 2021 10:40:07 +0000
Received: by outflank-mailman (input) for mailman id 93104;
 Thu, 04 Mar 2021 10:40:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PH3V=IC=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1lHlOo-00065n-Qu
 for xen-devel@lists.xen.org; Thu, 04 Mar 2021 10:40:06 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 371d9cdb-5c63-454a-9f7f-84cd4103e0dc;
 Thu, 04 Mar 2021 10:39:51 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1lHlOS-0000bP-VK; Thu, 04 Mar 2021 10:39:44 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1lHlOS-0000Se-RY; Thu, 04 Mar 2021 10:39:44 +0000
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
X-Inumbo-ID: 371d9cdb-5c63-454a-9f7f-84cd4103e0dc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=my0l2403/dVXAUYLCcMAG2vIG582kdfMfEvrO9lUiLo=; b=v9RdhD+AJ/fpTm0ck/gSTXVE/S
	yPUcPnw0xBszoN8OQaV+Twztk3899MbFf0NZ3n2hK1fRVmadGWHaw3SbVd1lq9OZ7EprB8jF+C2HA
	PadLCN5HWot1YqOfN2AxT26NWyCiiscF+MjULXNcjFIKi1jflXsfZrBNQ4mEytaNvw4s=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 367 v1 - Linux: netback fails to honor
 grant mapping errors
Message-Id: <E1lHlOS-0000Se-RY@xenbits.xenproject.org>
Date: Thu, 04 Mar 2021 10:39:44 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

                    Xen Security Advisory XSA-367

          Linux: netback fails to honor grant mapping errors

ISSUE DESCRIPTION
=================

XSA-362 tried to address issues here, but in the case of the netback
driver the changes were insufficient: It left the relevant function
invocation with, effectively, no error handling at all.  As a result,
memory allocation failures there could still lead to frontend-induced
crashes of the backend.

IMPACT
======

A malicious or buggy networking frontend driver may be able to crash
the corresponding backend driver, potentially affecting the entire
domain running the backend driver.  In a typical (non-disaggregated)
system that is a host-wide denial of service (DoS).

VULNERABLE SYSTEMS
==================

Linux versions from at least 2.6.39 onwards are vulnerable, when run in
PV mode.  Earlier versions differ significantly in behavior and may
therefore instead surface other issues under the same conditions.  Linux
run in HVM / PVH modes is not vulnerable.

MITIGATION
==========

For Linux, running the backends in HVM or PVH domains will avoid the
vulnerability.  For example, by running the dom0 in PVH mode.

In all other cases there is no known mitigation.

RESOLUTION
==========

Applying the attached patch resolves this issue.

xsa367-linux.patch           Linux 5.12-rc

$ sha256sum xsa367*
b0244bfddee91cd7986172893e70664b74e698c5d44f25865870f179f80f9a92  xsa367-linux.patch
$

CREDITS
=======

This issue was reported by Intel's kernel test robot and recognized as a
security issue by Jan Beulich of SUSE.

NOTE REGARDING LACK OF EMBARGO
==============================

This issue was reported publicly, before the XSA could be issued.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmBAuOYMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZUCAH/1zw5d2l1R3k+nvJ659plwOYDe8Cmh4GeJ02PoUv
fC/5efe7l/tXEmfg4rg5WiY8JZqQGeGmhwiOs8bI/8c5IXucaPOM1wDUaHUMkWTA
tl/P/tbDamzd1/dSK4DdILTApibU+M/nmUn0sBBYpu53VUbeyXq2EAtjmliKgCG9
Oo4PW4ys5ro+hwrPtYdLD1ktIN64+C+TqkKUdJset7po5sWX4nV1Cwp/4oKaNyeF
Alh495TUCnhgc8gnXUgXhmxWKp3Iag/tHjmtu34mT5HHZdBrNBShFKhHSP5bJHE2
CxYD1b/KbkRiLPOgZXNec+ikDQT4bTCeVLpnWvOXQ1FTXR4=
=hY2s
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa367-linux.patch"
Content-Disposition: attachment; filename="xsa367-linux.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBYZW4vZ250dGFiOiBoYW5kbGUgcDJtIHVwZGF0ZSBlcnJvcnMgb24gYSBw
ZXItc2xvdCBiYXNpcwoKQmFpbGluZyBpbW1lZGlhdGVseSBmcm9tIHNldF9m
b3JlaWduX3AybV9tYXBwaW5nKCkgdXBvbiBhIHAybSB1cGRhdGluZwplcnJv
ciBsZWF2ZXMgdGhlIGZ1bGwgYmF0Y2ggaW4gYW4gYW1iaWd1b3VzIHN0YXRl
IGFzIGZhciBhcyB0aGUgY2FsbGVyCmlzIGNvbmNlcm5lZC4gSW5zdGVhZCBm
bGFncyByZXNwZWN0aXZlIHNsb3RzIGFzIGJhZCwgdW5tYXBwaW5nIHdoYXQK
d2FzIG1hcHBlZCB0aGVyZSByaWdodCBhd2F5LgoKSFlQRVJWSVNPUl9ncmFu
dF90YWJsZV9vcCgpJ3MgcmV0dXJuIHZhbHVlIGFuZCB0aGUgaW5kaXZpZHVh
bCB1bm1hcApzbG90cycgc3RhdHVzIGZpZWxkcyBnZXQgdXNlZCBvbmx5IGZv
ciBhIG9uZS10aW1lIC0gdGhlcmUncyBub3QgbXVjaCB3ZQpjYW4gZG8gaW4g
Y2FzZSBvZiBhIGZhaWx1cmUuCgpOb3RlIHRoYXQgdGhlcmUncyBubyBHTlRT
VF9lbm9tZW0gb3IgYWxpa2UsIHNvIEdOVFNUX2dlbmVyYWxfZXJyb3IgZ2V0
cwp1c2VkLgoKVGhlIG1hcCBvcHMnIGhhbmRsZSBmaWVsZHMgZ2V0IG92ZXJ3
cml0dGVuIGp1c3QgdG8gYmUgb24gdGhlIHNhZmUgc2lkZS4KClRoaXMgaXMg
WFNBLTM2Ny4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXVAa2Vy
bmVsLm9yZz4KLS0tCnYyOiBMb2cgbWVzc2FnZS4gSW52YWxpZGF0ZSBtYXAg
b3BzJyBoYW5kbGVzLgoKLS0tIGEvYXJjaC9hcm0veGVuL3AybS5jCisrKyBi
L2FyY2gvYXJtL3hlbi9wMm0uYwpAQCAtOTMsMTIgKzkzLDM5IEBAIGludCBz
ZXRfZm9yZWlnbl9wMm1fbWFwcGluZyhzdHJ1Y3QgZ250dGEKIAlpbnQgaTsK
IAogCWZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7CisJCXN0cnVjdCBn
bnR0YWJfdW5tYXBfZ3JhbnRfcmVmIHVubWFwOworCQlpbnQgcmM7CisKIAkJ
aWYgKG1hcF9vcHNbaV0uc3RhdHVzKQogCQkJY29udGludWU7Ci0JCWlmICh1
bmxpa2VseSghc2V0X3BoeXNfdG9fbWFjaGluZShtYXBfb3BzW2ldLmhvc3Rf
YWRkciA+PiBYRU5fUEFHRV9TSElGVCwKLQkJCQkgICAgbWFwX29wc1tpXS5k
ZXZfYnVzX2FkZHIgPj4gWEVOX1BBR0VfU0hJRlQpKSkgewotCQkJcmV0dXJu
IC1FTk9NRU07Ci0JCX0KKwkJaWYgKGxpa2VseShzZXRfcGh5c190b19tYWNo
aW5lKG1hcF9vcHNbaV0uaG9zdF9hZGRyID4+IFhFTl9QQUdFX1NISUZULAor
CQkJCSAgICBtYXBfb3BzW2ldLmRldl9idXNfYWRkciA+PiBYRU5fUEFHRV9T
SElGVCkpKQorCQkJY29udGludWU7CisKKwkJLyoKKwkJICogU2lnbmFsIGFu
IGVycm9yIGZvciB0aGlzIHNsb3QuIFRoaXMgaW4gdHVybiByZXF1aXJlcwor
CQkgKiBpbW1lZGlhdGUgdW5tYXBwaW5nLgorCQkgKi8KKwkJbWFwX29wc1tp
XS5zdGF0dXMgPSBHTlRTVF9nZW5lcmFsX2Vycm9yOworCQl1bm1hcC5ob3N0
X2FkZHIgPSBtYXBfb3BzW2ldLmhvc3RfYWRkciwKKwkJdW5tYXAuaGFuZGxl
ID0gbWFwX29wc1tpXS5oYW5kbGU7CisJCW1hcF9vcHNbaV0uaGFuZGxlID0g
fjA7CisJCWlmIChtYXBfb3BzW2ldLmZsYWdzICYgR05UTUFQX2RldmljZV9t
YXApCisJCQl1bm1hcC5kZXZfYnVzX2FkZHIgPSBtYXBfb3BzW2ldLmRldl9i
dXNfYWRkcjsKKwkJZWxzZQorCQkJdW5tYXAuZGV2X2J1c19hZGRyID0gMDsK
KworCQkvKgorCQkgKiBQcmUtcG9wdWxhdGUgdGhlIHN0YXR1cyBmaWVsZCwg
dG8gYmUgcmVjb2duaXphYmxlIGluCisJCSAqIHRoZSBsb2cgbWVzc2FnZSBi
ZWxvdy4KKwkJICovCisJCXVubWFwLnN0YXR1cyA9IDE7CisKKwkJcmMgPSBI
WVBFUlZJU09SX2dyYW50X3RhYmxlX29wKEdOVFRBQk9QX3VubWFwX2dyYW50
X3JlZiwKKwkJCQkJICAgICAgICZ1bm1hcCwgMSk7CisJCWlmIChyYyB8fCB1
bm1hcC5zdGF0dXMgIT0gR05UU1Rfb2theSkKKwkJCXByX2Vycl9vbmNlKCJn
bnR0YWIgdW5tYXAgZmFpbGVkOiByYz0lZCBzdD0lZFxuIiwKKwkJCQkgICAg
cmMsIHVubWFwLnN0YXR1cyk7CiAJfQogCiAJcmV0dXJuIDA7Ci0tLSBhL2Fy
Y2gveDg2L3hlbi9wMm0uYworKysgYi9hcmNoL3g4Ni94ZW4vcDJtLmMKQEAg
LTcxMCw2ICs3MTAsOCBAQCBpbnQgc2V0X2ZvcmVpZ25fcDJtX21hcHBpbmco
c3RydWN0IGdudHRhCiAKIAlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykg
ewogCQl1bnNpZ25lZCBsb25nIG1mbiwgcGZuOworCQlzdHJ1Y3QgZ250dGFi
X3VubWFwX2dyYW50X3JlZiB1bm1hcFsyXTsKKwkJaW50IHJjOwogCiAJCS8q
IERvIG5vdCBhZGQgdG8gb3ZlcnJpZGUgaWYgdGhlIG1hcCBmYWlsZWQuICov
CiAJCWlmIChtYXBfb3BzW2ldLnN0YXR1cyAhPSBHTlRTVF9va2F5IHx8CkBA
IC03MjcsMTAgKzcyOSw0NiBAQCBpbnQgc2V0X2ZvcmVpZ25fcDJtX21hcHBp
bmcoc3RydWN0IGdudHRhCiAKIAkJV0FSTihwZm5fdG9fbWZuKHBmbikgIT0g
SU5WQUxJRF9QMk1fRU5UUlksICJwYWdlIG11c3QgYmUgYmFsbG9vbmVkIik7
CiAKLQkJaWYgKHVubGlrZWx5KCFzZXRfcGh5c190b19tYWNoaW5lKHBmbiwg
Rk9SRUlHTl9GUkFNRShtZm4pKSkpIHsKLQkJCXJldCA9IC1FTk9NRU07Ci0J
CQlnb3RvIG91dDsKKwkJaWYgKGxpa2VseShzZXRfcGh5c190b19tYWNoaW5l
KHBmbiwgRk9SRUlHTl9GUkFNRShtZm4pKSkpCisJCQljb250aW51ZTsKKwor
CQkvKgorCQkgKiBTaWduYWwgYW4gZXJyb3IgZm9yIHRoaXMgc2xvdC4gVGhp
cyBpbiB0dXJuIHJlcXVpcmVzCisJCSAqIGltbWVkaWF0ZSB1bm1hcHBpbmcu
CisJCSAqLworCQltYXBfb3BzW2ldLnN0YXR1cyA9IEdOVFNUX2dlbmVyYWxf
ZXJyb3I7CisJCXVubWFwWzBdLmhvc3RfYWRkciA9IG1hcF9vcHNbaV0uaG9z
dF9hZGRyLAorCQl1bm1hcFswXS5oYW5kbGUgPSBtYXBfb3BzW2ldLmhhbmRs
ZTsKKwkJbWFwX29wc1tpXS5oYW5kbGUgPSB+MDsKKwkJaWYgKG1hcF9vcHNb
aV0uZmxhZ3MgJiBHTlRNQVBfZGV2aWNlX21hcCkKKwkJCXVubWFwWzBdLmRl
dl9idXNfYWRkciA9IG1hcF9vcHNbaV0uZGV2X2J1c19hZGRyOworCQllbHNl
CisJCQl1bm1hcFswXS5kZXZfYnVzX2FkZHIgPSAwOworCisJCWlmIChrbWFw
X29wcykgeworCQkJa21hcF9vcHNbaV0uc3RhdHVzID0gR05UU1RfZ2VuZXJh
bF9lcnJvcjsKKwkJCXVubWFwWzFdLmhvc3RfYWRkciA9IGttYXBfb3BzW2ld
Lmhvc3RfYWRkciwKKwkJCXVubWFwWzFdLmhhbmRsZSA9IGttYXBfb3BzW2ld
LmhhbmRsZTsKKwkJCWttYXBfb3BzW2ldLmhhbmRsZSA9IH4wOworCQkJaWYg
KGttYXBfb3BzW2ldLmZsYWdzICYgR05UTUFQX2RldmljZV9tYXApCisJCQkJ
dW5tYXBbMV0uZGV2X2J1c19hZGRyID0ga21hcF9vcHNbaV0uZGV2X2J1c19h
ZGRyOworCQkJZWxzZQorCQkJCXVubWFwWzFdLmRldl9idXNfYWRkciA9IDA7
CiAJCX0KKworCQkvKgorCQkgKiBQcmUtcG9wdWxhdGUgYm90aCBzdGF0dXMg
ZmllbGRzLCB0byBiZSByZWNvZ25pemFibGUgaW4KKwkJICogdGhlIGxvZyBt
ZXNzYWdlIGJlbG93LgorCQkgKi8KKwkJdW5tYXBbMF0uc3RhdHVzID0gMTsK
KwkJdW5tYXBbMV0uc3RhdHVzID0gMTsKKworCQlyYyA9IEhZUEVSVklTT1Jf
Z3JhbnRfdGFibGVfb3AoR05UVEFCT1BfdW5tYXBfZ3JhbnRfcmVmLAorCQkJ
CQkgICAgICAgdW5tYXAsIDEgKyAhIWttYXBfb3BzKTsKKwkJaWYgKHJjIHx8
IHVubWFwWzBdLnN0YXR1cyAhPSBHTlRTVF9va2F5IHx8CisJCSAgICB1bm1h
cFsxXS5zdGF0dXMgIT0gR05UU1Rfb2theSkKKwkJCXByX2Vycl9vbmNlKCJn
bnR0YWIgdW5tYXAgZmFpbGVkOiByYz0lZCBzdDA9JWQgc3QxPSVkXG4iLAor
CQkJCSAgICByYywgdW5tYXBbMF0uc3RhdHVzLCB1bm1hcFsxXS5zdGF0dXMp
OwogCX0KIAogb3V0Ogo=

--=separator--

