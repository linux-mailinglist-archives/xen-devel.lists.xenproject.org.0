Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DD211AA82
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 13:13:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if0oa-0005gl-AL; Wed, 11 Dec 2019 12:10:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+9Em=2B=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1if0oY-0005fP-82
 for xen-devel@lists.xen.org; Wed, 11 Dec 2019 12:09:58 +0000
X-Inumbo-ID: 1a1b4bd6-1c0f-11ea-8b1b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a1b4bd6-1c0f-11ea-8b1b-12813bfff9fa;
 Wed, 11 Dec 2019 12:09:37 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1if0o9-0008S0-Ac; Wed, 11 Dec 2019 12:09:33 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1if0o9-0001dU-9U; Wed, 11 Dec 2019 12:09:33 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.508 (Entity 5.508)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
Message-Id: <E1if0o9-0001dU-9U@xenbits.xenproject.org>
Date: Wed, 11 Dec 2019 12:09:33 +0000
Subject: [Xen-devel] Xen Security Advisory 308 v3 (CVE-2019-19583) - VMX:
 VMentry failure with debug exceptions and blocked states
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

            Xen Security Advisory CVE-2019-19583 / XSA-308
                               version 3

     VMX: VMentry failure with debug exceptions and blocked states

UPDATES IN VERSION 3
====================

Public release.

Updated metadata to add 4.13, update StableRef's

ISSUE DESCRIPTION
=================

Please see XSA-260 for background on the MovSS shadow:
  http://xenbits.xen.org/xsa/advisory-260.html

Please see XSA-156 for background on the need for #DB interception:
  http://xenbits.xen.org/xsa/advisory-156.html

The VMX VMEntry checks does not like the exact combination of state
which occurs when #DB in intercepted, Single Stepping is active, and
blocked by STI/MovSS is active, despite this being a legitimate state to
be in.  The resulting VMEntry failure is fatal to the guest.

IMPACT
======

HVM/PVH guest userspace code may be able to crash the guest, resulting
in a guest Denial of Service.

VULNERABLE SYSTEMS
==================

All versions of Xen are affected.

Only systems supporting VMX hardware virtual extensions (Intel, Cyrix or
Zhaoxin CPUs) are affected. Arm and AMD systems are unaffected.

Only HVM/PVH guests are affected.  PV guests cannot leverage the
vulnerability.

MITIGATION
==========

Running only PV guests will avoid this vulnerability.

Running HVM guests on only AMD hardware will also avoid this
vulnerability.

CREDITS
=======

This issue was discovered by Håkon Alstadheim and diagnosed as a
security issue by Andrew Cooper of Citrix.

RESOLUTION
==========

Applying the attached patch resolves this issue.

xsa308.patch           xen-unstable, Xen 4.13.x .. Xen 4.8.x

$ sha256sum xsa308*
4aa06d21478d9debb12388ff14d8abc31982e18895db40d0cec78fcc9fe68ef2  xsa308.meta
7e782b09b16f7534c8db52042f7bb3bd730d108571c8b10af184ae0b02fdae9d  xsa308.patch
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
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl3w3FsMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZWHwIAIfuiZE/IyxMwTAkZL3EugBnlxxHodoBuj6imn+n
c9DvMk3TCi3vSgvZQtVpP0eNuuLN5285hVyI95lRE0LTmtRLc7jATktStRTgGkua
znW8U1sqkVRWJcVuN4uAM2zIY60pMZnFjZxdJW12+wpcA13LInE1cDWnlRv+cdD9
7DtVkGUWXjfbcm3KXGZw8YpKvTgVp983VpywR/1lzXZ+MexWzKuEco8fZFayw0ne
3nT/23Y1ofjCflNFjc7HoeJZl+zy493J/rqHS8yYI3d4vTdIfjue3rZ/X6305el9
zjCG5zXygrWVAoKGWVnPZweX1jw8rd6BlsPTqQb53UH94zc=
=yTxW
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa308.meta"
Content-Disposition: attachment; filename="xsa308.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzMDgsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xMyIsCiAgICAiNC4xMiIsCiAgICAiNC4xMSIs
CiAgICAiNC4xMCIsCiAgICAiNC45IiwKICAgICI0LjgiCiAgXSwKICAiVHJl
ZXMiOiBbCiAgICAieGVuIgogIF0sCiAgIlJlY2lwZXMiOiB7CiAgICAiNC4x
MCI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAg
ICAgICAgICJTdGFibGVSZWYiOiAiZTQ4OTk1NTBmZjc4MzRlMWVhNWRmYmJm
YjFjNjE4ZjY0ZTI0Nzc2MSIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAg
ICAgICAgICAgMzA3CiAgICAgICAgICBdLAogICAgICAgICAgIlBhdGNoZXMi
OiBbCiAgICAgICAgICAgICJ4c2EzMDgucGF0Y2giCiAgICAgICAgICBdCiAg
ICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQuMTEiOiB7CiAgICAgICJS
ZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxl
UmVmIjogIjIzOWQzN2U1MTRjOTNlMjlkNTBkNzFmNzM0YjFkYzQ1M2IyMjM2
YTYiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAgICAgICAgIDMwNwog
ICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAg
ICAieHNhMzA4LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAg
fQogICAgfSwKICAgICI0LjEyIjogewogICAgICAiUmVjaXBlcyI6IHsKICAg
ICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICIyMTJiODUw
MGNiMzk0YjNhNjY0NjU1Zjc5Y2EwYmRjYjMxMjQ2ZmY3IiwKICAgICAgICAg
ICJQcmVyZXFzIjogWwogICAgICAgICAgICAzMDcKICAgICAgICAgIF0sCiAg
ICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTMwOC5wYXRj
aCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAi
NC4xMyI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsK
ICAgICAgICAgICJTdGFibGVSZWYiOiAiZmQ5YmZhYmY2OWVhNTlmMjI4MGMx
NzAzNTAwNzkzZmExNWU4MTk1NiIsCiAgICAgICAgICAiUHJlcmVxcyI6IFtd
LAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EzMDgu
cGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAog
ICAgIjQuOCI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6
IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiYTI2MGU5M2RiNzk0ZjU2MDUw
MmU4OTg1OWFhZjExMWQxNzhlODBlNCIsCiAgICAgICAgICAiUHJlcmVxcyI6
IFsKICAgICAgICAgICAgMzA3CiAgICAgICAgICBdLAogICAgICAgICAgIlBh
dGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EzMDgucGF0Y2giCiAgICAgICAg
ICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQuOSI6IHsKICAg
ICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJT
dGFibGVSZWYiOiAiOGQxZWU5ZjJjNDczZmVjNTRiNTAxOGMwMWFkNTU2ZDdh
ZmQ2MmMxNyIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAgICAg
MzA3CiAgICAgICAgICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAg
ICAgICAgICJ4c2EzMDgucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQog
ICAgICB9CiAgICB9LAogICAgIm1hc3RlciI6IHsKICAgICAgIlJlY2lwZXMi
OiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAi
YjczYWFkNGM4YjZhNzY3Y2UxNWNjOGNiNjVmOWVlYWI3YmZjY2RhZSIsCiAg
ICAgICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAgICAgMzA3CiAgICAgICAg
ICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2Ez
MDgucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9
CiAgfQp9

--=separator
Content-Type: application/octet-stream; name="xsa308.patch"
Content-Disposition: attachment; filename="xsa308.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L3Z0eDogV29yayBhcm91bmQgU2luZ2xlU3RlcCAr
IFNUSS9Nb3ZTUyBWTUVudHJ5IGZhaWx1cmVzCgpTZWUgcGF0Y2ggY29tbWVu
dCBmb3IgdGVjaG5pY2FsIGRldGFpbHMuCgpDb25jZXJuaW5nIHRoZSB0aW1l
bGluZSwgdGhpcyB3YXMgZmlyc3QgZGlzY292ZXJlZCBpbiB0aGUgYWZ0ZXJt
YXRoIG9mClhTQS0xNTYgd2hpY2ggY2F1c2VkICNEQiB0byBiZSBpbnRlcmNl
cHRlZCB1bmNvbmRpdGlvbmFsbHksIGJ1dCBvbmx5IGluCml0cyBTaW5nbGVT
dGVwICsgU1RJIGZvcm0gd2hpY2ggaXMgcmVzdHJpY3RlZCB0byBwcml2aWxl
Z2VkIHNvZnR3YXJlLgoKQWZ0ZXIgd29ya2luZyB3aXRoIEludGVsIGFuZCBp
ZGVudGlmeWluZyB0aGUgcHJvYmxlbWF0aWMgdm1lbnRyeSBjaGVjaywKdGhp
cyB3b3JrYXJvdW5kIHdhcyBzdWdnZXN0ZWQsIGFuZCB0aGUgcGF0Y2ggd2Fz
IHBvc3RlZCBpbiBhbiBSRkMKc2VyaWVzLiAgT3V0c3RhbmRpbmcgd29yayBm
b3IgdGhhdCBzZXJpZXMgKG5vdCBicmVha2luZyBJbnRyb3NwZWN0aW9uKQpp
cyBzdGlsbCBwZW5kaW5nLCBhbmQgdGhpcyBmaXggZnJvbSBpdCAod2hpY2gg
d291bGRuJ3QgaGF2ZSBiZWVuIGdvb2QKZW5vdWdoIGluIGl0cyBvcmlnaW5h
bCBmb3JtKSB3YXNuJ3QgY29tbWl0dGVkLgoKQSB2bWVudHJ5IGZhaWx1cmUg
d2FzIHJlcG9ydGVkIHRvIHhlbi1kZXZlbCwgYW5kIGRlYnVnZ2luZyBpZGVu
dGlmaWVkCnRoaXMgYnVnIGluIGl0cyBTaW5nbGVTdGVwICsgTW92U1MgZm9y
bSBieSB3YXkgb2YgSU5UMSwgd2hpY2ggZG9lcyBub3QKaW52b2x2ZSB0aGUg
dXNlIG9mIGFueSBwcml2aWxlZ2VkIGluc3RydWN0aW9ucywgYW5kIHByb3Zp
bmcgdGhpcyB0byBiZSBhCnNlY3VyaXR5IGlzc3VlLgoKVGhpcyBpcyBYU0Et
MzA4CgpSZXBvcnRlZC1ieTogSMOla29uIEFsc3RhZGhlaW0gPGhha29uQGFs
c3RhZGhlaW0ucHJpdi5ubz4KU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQWNrZWQtYnk6IEtldmlu
IFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jIGIveGVuL2FyY2gveDg2L2h2bS92
bXgvdm14LmMKaW5kZXggNmE1ZWViNWMxMy4uNTliODM2ZjQzZiAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKKysrIGIveGVuL2Fy
Y2gveDg2L2h2bS92bXgvdm14LmMKQEAgLTM4MTYsNiArMzgxNiw0MiBAQCB2
b2lkIHZteF92bWV4aXRfaGFuZGxlcihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAq
cmVncykKICAgICAgICAgICAgIEhWTVRSQUNFXzFEKFRSQVBfREVCVUcsIGV4
aXRfcXVhbGlmaWNhdGlvbik7CiAgICAgICAgICAgICBfX3Jlc3RvcmVfZGVi
dWdfcmVnaXN0ZXJzKHYpOwogICAgICAgICAgICAgd3JpdGVfZGVidWdyZWco
NiwgZXhpdF9xdWFsaWZpY2F0aW9uIHwgRFJfU1RBVFVTX1JFU0VSVkVEX09O
RSk7CisKKyAgICAgICAgICAgIC8qCisgICAgICAgICAgICAgKiBXb3JrIGFy
b3VuZCBTaW5nbGVTdGVwICsgU1RJL01vdlNTIFZNRW50cnkgZmFpbHVyZXMu
CisgICAgICAgICAgICAgKgorICAgICAgICAgICAgICogV2UgaW50ZXJjZXB0
ICNEQiB1bmNvbmRpdGlvbmFsbHkgdG8gd29yayBhcm91bmQgQ1ZFLTIwMTUt
ODEwNCAvCisgICAgICAgICAgICAgKiBYU0EtMTU2IChndWVzdC1rZXJuZWwg
aW5kdWNlZCBob3N0IERvUykuCisgICAgICAgICAgICAgKgorICAgICAgICAg
ICAgICogU1RJL01vdlNTIHNoYWRvd3MgYmxvY2svZGVmZXIgaW50ZXJydXB0
cy9leGNlcHRpb25zIChleGFjdAorICAgICAgICAgICAgICogZGV0YWlscyBh
cmUgY29tcGxpY2F0ZWQgYW5kIHBvb3JseSBkb2N1bWVudGVkKS4gIERlYnVn
CisgICAgICAgICAgICAgKiBleGNlcHRpb25zIGRlbGF5ZWQgZm9yIGFueSBy
ZWFzb24gYXJlIHN0b3JlZCBpbiB0aGUKKyAgICAgICAgICAgICAqIFBFTkRJ
TkdfREJHX0VYQ0VQVElPTlMgZmllbGQuCisgICAgICAgICAgICAgKgorICAg
ICAgICAgICAgICogVGhlIGZhbGxpbmcgZWRnZSBvZiBQRU5ESU5HX0RCRyBj
YXVzZXMgI0RCIHRvIGJlIGRlbGl2ZXJlZCwKKyAgICAgICAgICAgICAqIHJl
c3VsdGluZyBpbiBhIFZNRXhpdCwgYXMgI0RCIGlzIGludGVyY2VwdGVkLiAg
VGhlIFZNQ1Mgc3RpbGwKKyAgICAgICAgICAgICAqIHJlcG9ydHMgYmxvY2tl
ZC1ieS1TVEkvTW92U1MuCisgICAgICAgICAgICAgKgorICAgICAgICAgICAg
ICogVGhlIFZNRW50cnkgY2hlY2tzIHdoZW4gRUZMQUdTLlRGIGlzIHNldCBk
b24ndCBsaWtlIGEgVk1DUyBpbgorICAgICAgICAgICAgICogdGhpcyBzdGF0
ZS4gIERlc3BpdGUgYSAjREIgcXVldWVkIGluIFZNRU5UUllfSU5UUl9JTkZP
LCB0aGUKKyAgICAgICAgICAgICAqIHN0YXRlIGlzIHJlamVjdGVkIGFzIERS
Ni5CUyBpc24ndCBwZW5kaW5nLiAgRml4IHRoaXMgdXAuCisgICAgICAgICAg
ICAgKi8KKyAgICAgICAgICAgIGlmICggdW5saWtlbHkocmVncy0+ZWZsYWdz
ICYgWDg2X0VGTEFHU19URikgKQorICAgICAgICAgICAgeworICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgaW50X2luZm87CisKKyAgICAgICAgICAg
ICAgICBfX3ZtcmVhZChHVUVTVF9JTlRFUlJVUFRJQklMSVRZX0lORk8sICZp
bnRfaW5mbyk7CisKKyAgICAgICAgICAgICAgICBpZiAoIGludF9pbmZvICYg
KFZNWF9JTlRSX1NIQURPV19TVEkgfCBWTVhfSU5UUl9TSEFET1dfTU9WX1NT
KSApCisgICAgICAgICAgICAgICAgeworICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBsb25nIHBlbmRpbmdfZGJnOworCisgICAgICAgICAgICAgICAg
ICAgIF9fdm1yZWFkKEdVRVNUX1BFTkRJTkdfREJHX0VYQ0VQVElPTlMsICZw
ZW5kaW5nX2RiZyk7CisgICAgICAgICAgICAgICAgICAgIF9fdm13cml0ZShH
VUVTVF9QRU5ESU5HX0RCR19FWENFUFRJT05TLAorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGVuZGluZ19kYmcgfCBEUl9TVEVQKTsKKyAgICAg
ICAgICAgICAgICB9CisgICAgICAgICAgICB9CisKICAgICAgICAgICAgIGlm
ICggIXYtPmRvbWFpbi0+ZGVidWdnZXJfYXR0YWNoZWQgKQogICAgICAgICAg
ICAgewogICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgaW5zbl9sZW4g
PSAwOwo=

--=separator
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=separator--

