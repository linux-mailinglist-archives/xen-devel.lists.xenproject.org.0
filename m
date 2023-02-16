Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B95AC699B77
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 18:45:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496697.767579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSiJf-0006CX-IW; Thu, 16 Feb 2023 17:45:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496697.767579; Thu, 16 Feb 2023 17:45:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSiJf-00069Q-Ec; Thu, 16 Feb 2023 17:45:07 +0000
Received: by outflank-mailman (input) for mailman id 496697;
 Thu, 16 Feb 2023 17:45:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9gUu=6M=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1pSiJd-000698-6o
 for xen-devel@lists.xen.org; Thu, 16 Feb 2023 17:45:05 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a09a86c2-ae21-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 18:45:00 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1pSiJN-0002Kh-7g; Thu, 16 Feb 2023 17:44:49 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1pSiJN-0000j3-5f; Thu, 16 Feb 2023 17:44:49 +0000
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
X-Inumbo-ID: a09a86c2-ae21-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=gVlMyknwYbBFxIAmk6bJKXG1nRp1hzFYvzTLkEeKQVY=; b=c86dFYsX4HBbPeHKMzANDywfKG
	o07r6j+cAueqldgLBeuGWLT6XrZIhDjGT+XE8UJHD2lDp2vAcQ1PQ7ws2f/8TiyWVbZAG1bFYnt+k
	KLrHet9v00P7NMlWarSEN0v9JR4m/uuKahWTI/Gl3WxuqAodVh4dD1YnsulpfO+RRjKE=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 426 v2 (CVE-2022-27672) - x86: Cross-Thread
 Return Address Predictions
Message-Id: <E1pSiJN-0000j3-5f@xenbits.xenproject.org>
Date: Thu, 16 Feb 2023 17:44:49 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2022-27672 / XSA-426
                               version 2

             x86: Cross-Thread Return Address Predictions

UPDATES IN VERSION 2
====================

Xen 4.16 is vulnerable too.  The previous analysis of impacted versions
was incorrect.

The same patch is applicable to Xen 4.16, and the staging-4.16 branch
has already had the backport applied.

ISSUE DESCRIPTION
=================

It has been discovered that on some AMD CPUs, the RAS (Return Address
Stack, also called RAP - Return Address Predictor - in some AMD
documentation, and RSB - Return Stack Buffer - in Intel terminology) is
dynamically partitioned between non-idle threads.  This allows an
attacker to control speculative execution on the adjacent thread.

For more details, see:
  https://www.amd.com/en/corporate/product-security/bulletin/amd-sb-1045

IMPACT
======

An attacker might be able to infer the contents of arbitrary host
memory, including memory assigned to other guests.

VULNERABLE SYSTEMS
==================

Only AMD CPUs are known to be potentially vulnerable.  CPUs from other
hardware vendors are not believed to be impacted.

Only the Zen1 and Zen2 microarchitectures are believed to be potentially
vulnerable.  Other microarchitectures are not believed to be vulnerable.

Only configurations with SMT activate are potentially vulnerable.  If
SMT is disabled by the firmware, or at runtime with `smt=0` on Xen's
command line, then the platform is not vulnerable.

Xen 4.16 and later contains an optimisation, specifically:

  c/s afab477fba3b ("x86/spec-ctrl: Skip RSB overwriting when safe to do so")

which in combination with disabling 32bit PV guests (either at compile
time with CONFIG_PV32=n, or at runtime with `pv=no-32` on the command
line) renders Xen vulnerable to attack from PV guests.

Note: multiple downstreams are known to have backported this
optimisation to older versions of Xen.  Consult your software vendor
documentation.

MITIGATION
==========

On otherwise-vulnerable configurations, the issue can be mitigated by
booting Xen with `spec-ctrl=rsb`, which will override the aforementioned
optimisation.

Alternatively, SMT can be disabled either in the firmware, or by booting
Xen with `smt=0`.

Alternatively, if 32bit PV guests are only runtime disabled in Xen, this
issue can also be mitigated by booting Xen with `pv=32` to enable
support 32bit PV guests.  It is not necessary for a 32bit PV guest to
actually be running in order to mitigate the issue.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa426.patch          xen-unstable - Xen 4.16

$ sha256sum xsa426*
425b1d8931e02852afec9fe3d9f1d009f6d8a33c6387b2e8b3896f374732d470  xsa426.patch
$
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmPuawUMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZW1UIAJ6tjOwbjPJigbSVVfyr5FRnIIYjzVBqkhL5ufvc
TQY6ZoPsEEkXzx+jJeVa3NveiegqNvIdK26exlp7n2NrrWCRWlrdGlp+/83TWfUA
gwxBzERTVBmi67+9razBYKzxKAwXO2zOHsvgSB2aCX43K+e9SvlKMny8Wp9j0Z99
SRGxzZ8D4I7kKnMMpQIGvp/rt5+k+Q2oxXmNHnIsnCGshF+Y+zK7VwlSEpFYE1ga
78XWYULa1qOEbaj+xsPtf9mMIiWfViwKkX7ZT/EPFBbFxGHSK/aeiQmWdNcFGI3D
6L7vfJIo1Xsw26ozja+C+m3cFPhNSYJDRj92oCKmLPl8iII=
=hFGs
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa426.patch"
Content-Disposition: attachment; filename="xsa426.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L3NwZWMtY3RybDogTWl0aWdhdGUgQ3Jvc3MtVGhy
ZWFkIFJldHVybiBBZGRyZXNzIFByZWRpY3Rpb25zCgpUaGlzIGlzIFhTQS00
MjYgLyBDVkUtMjAyMi0yNzY3MgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCmRpZmYgLS1naXQg
YS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgYi9kb2NzL21p
c2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKaW5kZXggOTIzOTEwZjU1M2M1
Li5hMmZmMzhjZGViZjIgMTAwNjQ0Ci0tLSBhL2RvY3MvbWlzYy94ZW4tY29t
bWFuZC1saW5lLnBhbmRvYworKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQt
bGluZS5wYW5kb2MKQEAgLTIzNTUsNyArMjM1NSw3IEBAIGd1ZXN0cyB0byB1
c2UuCiAgIG9uIGVudHJ5IGFuZCBleGl0LiAgVGhlc2UgYmxvY2tzIGFyZSBu
ZWNlc3NhcnkgdG8gdmlydHVhbGlzZSBzdXBwb3J0IGZvcgogICBndWVzdHMg
YW5kIGlmIGRpc2FibGVkLCBndWVzdHMgd2lsbCBiZSB1bmFibGUgdG8gdXNl
IElCUlMvU1RJQlAvU1NCRC9ldGMuCiAqIGByc2I9YCBvZmZlcnMgY29udHJv
bCBvdmVyIHdoZXRoZXIgdG8gb3ZlcndyaXRlIHRoZSBSZXR1cm4gU3RhY2sg
QnVmZmVyIC8KLSAgUmV0dXJuIEFkZHJlc3MgU3RhY2sgb24gZW50cnkgdG8g
WGVuLgorICBSZXR1cm4gQWRkcmVzcyBTdGFjayBvbiBlbnRyeSB0byBYZW4g
YW5kIG9uIGlkbGUuCiAqIGBtZC1jbGVhcj1gIG9mZmVycyBjb250cm9sIG92
ZXIgd2hldGhlciB0byB1c2UgVkVSVyB0byBmbHVzaAogICBtaWNyb2FyY2hp
dGVjdHVyYWwgYnVmZmVycyBvbiBpZGxlIGFuZCBleGl0IGZyb20gWGVuLiAg
Kk5vdGU6IEZvcgogICBjb21wYXRpYmlsaXR5IHdpdGggZGV2ZWxvcG1lbnQg
dmVyc2lvbnMgb2YgdGhpcyBmaXgsIGBtZHM9YCBpcyBhbHNvIGFjY2VwdGVk
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vY3B1ZmVh
dHVyZXMuaCBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9jcHVmZWF0dXJl
cy5oCmluZGV4IDg2NWYxMTA5ODY2ZC4uZGEwNTkzZGU4NTQyIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZXMuaAor
KysgYi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZXMuaApA
QCAtMzUsNyArMzUsOCBAQCBYRU5fQ1BVRkVBVFVSRShTQ19SU0JfSFZNLCAg
ICAgICAgWDg2X1NZTlRIKDE5KSkgLyogUlNCIG92ZXJ3cml0ZSBuZWVkZWQg
Zm9yIEhWTQogWEVOX0NQVUZFQVRVUkUoWEVOX1NFTEZTTk9PUCwgICAgIFg4
Nl9TWU5USCgyMCkpIC8qIFNFTEZTTk9PUCBnZXRzIHVzZWQgYnkgWGVuIGl0
c2VsZiAqLwogWEVOX0NQVUZFQVRVUkUoU0NfTVNSX0lETEUsICAgICAgIFg4
Nl9TWU5USCgyMSkpIC8qIENsZWFyIE1TUl9TUEVDX0NUUkwgb24gaWRsZSAq
LwogWEVOX0NQVUZFQVRVUkUoWEVOX0xCUiwgICAgICAgICAgIFg4Nl9TWU5U
SCgyMikpIC8qIFhlbiB1c2VzIE1TUl9ERUJVR0NUTC5MQlIgKi8KLS8qIEJp
dHMgMjMsMjQgdW51c2VkLiAqLworLyogQml0cyAyMyB1bnVzZWQuICovCitY
RU5fQ1BVRkVBVFVSRShTQ19SU0JfSURMRSwgICAgICAgWDg2X1NZTlRIKDI0
KSkgLyogUlNCIG92ZXJ3cml0ZSBuZWVkZWQgZm9yIGlkbGUuICovCiBYRU5f
Q1BVRkVBVFVSRShTQ19WRVJXX0lETEUsICAgICAgWDg2X1NZTlRIKDI1KSkg
LyogVkVSVyB1c2VkIGJ5IFhlbiBmb3IgaWRsZSAqLwogWEVOX0NQVUZFQVRV
UkUoWEVOX1NIU1RLLCAgICAgICAgIFg4Nl9TWU5USCgyNikpIC8qIFhlbiB1
c2VzIENFVCBTaGFkb3cgU3RhY2tzICovCiBYRU5fQ1BVRkVBVFVSRShYRU5f
SUJULCAgICAgICAgICAgWDg2X1NZTlRIKDI3KSkgLyogWGVuIHVzZXMgQ0VU
IEluZGlyZWN0IEJyYW5jaCBUcmFja2luZyAqLwpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2luY2x1ZGUvYXNtL3NwZWNfY3RybC5oIGIveGVuL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL3NwZWNfY3RybC5oCmluZGV4IDZhNzdjMzkzNzg0
NC4uMzkxOTczZWY2YTI4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaW5j
bHVkZS9hc20vc3BlY19jdHJsLmgKKysrIGIveGVuL2FyY2gveDg2L2luY2x1
ZGUvYXNtL3NwZWNfY3RybC5oCkBAIC0xNTksNiArMTU5LDIxIEBAIHN0YXRp
YyBhbHdheXNfaW5saW5lIHZvaWQgc3BlY19jdHJsX2VudGVyX2lkbGUoc3Ry
dWN0IGNwdV9pbmZvICppbmZvKQogICAgICAqLwogICAgIGFsdGVybmF0aXZl
X2lucHV0KCIiLCAidmVydyAlW3NlbF0iLCBYODZfRkVBVFVSRV9TQ19WRVJX
X0lETEUsCiAgICAgICAgICAgICAgICAgICAgICAgW3NlbF0gIm0iIChpbmZv
LT52ZXJ3X3NlbCkpOworCisgICAgLyoKKyAgICAgKiBDcm9zcy1UaHJlYWQg
UmV0dXJuIEFkZHJlc3MgUHJlZGljdGlvbnM6CisgICAgICoKKyAgICAgKiBP
biB2dWxuZXJhYmxlIHN5c3RlbXMsIHRoZSByZXR1cm4gcHJlZGljdGlvbnMg
KFJTQi9SQVMpIGFyZSBzdGF0aWNhbGx5CisgICAgICogcGFydGl0aW9uZWQg
YmV0d2VlbiBhY3RpdmUgdGhyZWFkcy4gIFdoZW4gZW50ZXJpbmcgaWRsZSwg
b3VyIGVudHJpZXMKKyAgICAgKiBhcmUgcmUtcGFydGl0aW9uZWQgdG8gYWxs
b3cgdGhlIG90aGVyIHRocmVhZHMgdG8gdXNlIHRoZW0uCisgICAgICoKKyAg
ICAgKiBJbiBzb21lIGNhc2VzLCB3ZSBtaWdodCBzdGlsbCBoYXZlIGd1ZXN0
IGVudHJpZXMgaW4gdGhlIFJBUywgc28gZmx1c2gKKyAgICAgKiB0aGVtIGJl
Zm9yZSBpbmplY3RpbmcgdGhlbSBzaWRld2F5cyB0byBvdXIgc2libGluZyB0
aHJlYWQuCisgICAgICoKKyAgICAgKiAoYWIpdXNlIGFsdGVybmF0aXZlX2lu
cHV0KCkgdG8gc3BlY2lmeSBjbG9iYmVycy4KKyAgICAgKi8KKyAgICBhbHRl
cm5hdGl2ZV9pbnB1dCgiIiwgIkRPX09WRVJXUklURV9SU0IiLCBYODZfRkVB
VFVSRV9TQ19SU0JfSURMRSwKKyAgICAgICAgICAgICAgICAgICAgICA6ICJy
YXgiLCAicmN4Iik7CiB9CiAKIC8qIFdBUk5JTkchIGByZXRgLCBgY2FsbCAq
YCwgYGptcCAqYCBub3Qgc2FmZSBiZWZvcmUgdGhpcyBjYWxsLiAqLwpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L3NwZWNfY3RybC5jIGIveGVuL2FyY2gv
eDg2L3NwZWNfY3RybC5jCmluZGV4IGEzMjBiODE5NDdjOC4uZTgwZTJhNWVk
MWE5IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc3BlY19jdHJsLmMKKysr
IGIveGVuL2FyY2gveDg2L3NwZWNfY3RybC5jCkBAIC0xMzI3LDEzICsxMzI3
LDM4IEBAIHZvaWQgX19pbml0IGluaXRfc3BlY3VsYXRpb25fbWl0aWdhdGlv
bnModm9pZCkKICAgICAgKiAzKSBTb21lIENQVXMgaGF2ZSBSU0JzIHdoaWNo
IGFyZSBub3QgZnVsbCB3aWR0aCwgd2hpY2ggYWxsb3cgdGhlCiAgICAgICog
ICAgYXR0YWNrZXIncyBlbnRyaWVzIHRvIGFsaWFzIFhlbiBhZGRyZXNzZXMu
CiAgICAgICoKKyAgICAgKiA0KSBTb21lIENQVXMgaGF2ZSBSU0JzIHdoaWNo
IGFyZSByZS1wYXJ0aXRpb25lZCBiYXNlZCBvbiB0aHJlYWQKKyAgICAgKiAg
ICBpZGxlbmVzcywgd2hpY2ggYWxsb3dzIGFuIGF0dGFja2VyIHRvIGluamVj
dCBlbnRyaWVzIGludG8gdGhlIG90aGVyCisgICAgICogICAgdGhyZWFkLiAg
V2Ugc3RpbGwgYWN0aXZlIHRoZSBvcHRpbWlzYXRpb24gaW4gdGhpcyBjYXNl
LCBhbmQgbWl0aWdhdGUKKyAgICAgKiAgICBpbiB0aGUgaWRsZSBwYXRoIHdo
aWNoIGhhcyBsb3dlciBvdmVyaGVhZC4KKyAgICAgKgogICAgICAqIEl0IGlz
IHNhZmUgdG8gdHVybiBvZmYgUlNCIHN0dWZmaW5nIHdoZW4gWGVuIGlzIHVz
aW5nIFNNRVAgaXRzZWxmLCBhbmQKICAgICAgKiAzMmJpdCBQViBndWVzdHMg
YXJlIGRpc2FibGVkLCBhbmQgd2hlbiB0aGUgUlNCIGlzIGZ1bGwgd2lkdGgu
CiAgICAgICovCiAgICAgQlVJTERfQlVHX09OKFJPX01QVF9WSVJUX1NUQVJU
ICE9IFBNTDRfQUREUigyNTYpKTsKLSAgICBpZiAoIG9wdF9yc2JfcHYgPT0g
LTEgJiYgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX1hFTl9TTUVQKSAmJgot
ICAgICAgICAgIW9wdF9wdjMyICYmIHJzYl9pc19mdWxsX3dpZHRoKCkgKQot
ICAgICAgICBvcHRfcnNiX3B2ID0gMDsKKyAgICBpZiAoIG9wdF9yc2JfcHYg
PT0gLTEgKQorICAgIHsKKyAgICAgICAgb3B0X3JzYl9wdiA9IChvcHRfcHYz
MiB8fCAhYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX1hFTl9TTUVQKSB8fAor
ICAgICAgICAgICAgICAgICAgICAgICFyc2JfaXNfZnVsbF93aWR0aCgpKTsK
KworICAgICAgICAvKgorICAgICAgICAgKiBDcm9zcy1UaHJlYWQgUmV0dXJu
IEFkZHJlc3MgUHJlZGljdGlvbnMuCisgICAgICAgICAqCisgICAgICAgICAq
IFZ1bG5lcmFibGUgc3lzdGVtcyBhcmUgWmVuMS9aZW4yIHVhcmNoLCB3aGlj
aCBpcyBBTUQgRmFtMTcgLyBIeWdvbgorICAgICAgICAgKiBGYW0xOCwgd2hl
biBTTVQgaXMgYWN0aXZlLgorICAgICAgICAgKgorICAgICAgICAgKiBUbyBt
aXRpZ2F0ZSwgd2UgbXVzdCBmbHVzaCB0aGUgUlNCL1JBUy9SQVAgb25jZSBi
ZXR3ZWVuIGVudGVyaW5nCisgICAgICAgICAqIFhlbiBhbmQgZ29pbmcgaWRs
ZS4KKyAgICAgICAgICoKKyAgICAgICAgICogTW9zdCBjYXNlcyBmbHVzaCBv
biBlbnRyeSB0byBYZW4gYW55d2F5LiAgVGhlIG9uZSBjYXNlIHdoZXJlIHdl
CisgICAgICAgICAqIGRvbid0IGlzIHdoZW4gdXNpbmcgdGhlIFNNRVAgb3B0
aW1pc2F0aW9uIGZvciBQViBndWVzdHMuICBGbHVzaGluZworICAgICAgICAg
KiBiZWZvcmUgZ29pbmcgaWRsZSBpcyBsZXNzIG92ZXJoZWFkIHRoYW4gZmx1
c2hpbmcgb24gUFYgZW50cnkuCisgICAgICAgICAqLworICAgICAgICBpZiAo
ICFvcHRfcnNiX3B2ICYmIGh3X3NtdF9lbmFibGVkICYmCisgICAgICAgICAg
ICAgKGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciAmIChYODZfVkVORE9SX0FN
RHxYODZfVkVORE9SX0hZR09OKSkgJiYKKyAgICAgICAgICAgICAoYm9vdF9j
cHVfZGF0YS54ODYgPT0gMHgxNyB8fCBib290X2NwdV9kYXRhLng4NiA9PSAw
eDE4KSApCisgICAgICAgICAgICBzZXR1cF9mb3JjZV9jcHVfY2FwKFg4Nl9G
RUFUVVJFX1NDX1JTQl9JRExFKTsKKyAgICB9CiAKICAgICBpZiAoIG9wdF9y
c2JfcHYgKQogICAgIHsK

--=separator--

