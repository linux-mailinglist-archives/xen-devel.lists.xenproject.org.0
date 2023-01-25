Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E6667B538
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 15:57:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484350.750924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKhCp-000233-Sj; Wed, 25 Jan 2023 14:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484350.750924; Wed, 25 Jan 2023 14:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKhCp-00020D-On; Wed, 25 Jan 2023 14:56:55 +0000
Received: by outflank-mailman (input) for mailman id 484350;
 Wed, 25 Jan 2023 14:56:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G8Uq=5W=xenbits.xen.org=julieng@srs-se1.protection.inumbo.net>)
 id 1pKhCo-0001zz-A4
 for xen-devel@lists.xen.org; Wed, 25 Jan 2023 14:56:54 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dcf57f9-9cc0-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 15:56:49 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1pKhCZ-0004qG-Gl; Wed, 25 Jan 2023 14:56:39 +0000
Received: from julieng by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1pKhCZ-0001p5-FK; Wed, 25 Jan 2023 14:56:39 +0000
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
X-Inumbo-ID: 7dcf57f9-9cc0-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=4x+zYFZJ2fux5Y6wWNRS5h2J8/Cv4GXccaEhicN1EBc=; b=gJeN+Tbf+gVwtZasWDv9LrtxkB
	HIua5PqCH9ryAxObrVZLIXuLVCD1CQNRoVFedpw4Yw31Ua3XrxPvE2eR7UCj8YTSNO4L7f6TY8zar
	TlO1teALImTV5W+p56d12sVwXZEKu7LMZikjaKniuE3h7MfVVVPX/KMhmyZjfvJ4ceck=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 425 v1 (CVE-2022-42330) - Guests can cause
 Xenstore crash via soft reset
Message-Id: <E1pKhCZ-0001p5-FK@xenbits.xenproject.org>
Date: Wed, 25 Jan 2023 14:56:39 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2022-42330 / XSA-425

            Guests can cause Xenstore crash via soft reset

ISSUE DESCRIPTION
=================

When a guest issues a "Soft Reset" (e.g. for performing a kexec) the
libxl based Xen toolstack will normally perform a XS_RELEASE Xenstore
operation.

Due to a bug in xenstored this can result in a crash of xenstored.

Any other use of XS_RELEASE will have the same impact.

IMPACT
======

A malicious guest could try to kexec until it hits the xenstored bug,
resulting in the inability to perform any further domain administration
like starting new guests, or adding/removing resources to or from any
existing guest.

VULNERABLE SYSTEMS
==================

Only Xen version 4.17 is vulnerable. Systems running an older version
of Xen are not vulnerable.

All Xen systems using C xenstored are vulnerable. Systems using the
OCaml variant of xenstored are not vulnerable.

Systems running only PV guests (x86 only) are not vulnerable, as long as
they are using a libxl based toolstack.

MITIGATION
==========

The problem can be avoided by either:

- - using the OCaml xenstored variant

- - explicitly configuring guests to NOT perform the "Soft Reset" action
  by adding:
    on_soft_reset="reboot"
  or similar to the guest's configuration. This will break kexec in the
  guest, though.

NOTE REGARDING LACK OF EMBARGO
==============================

This issue was discussed in public already.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa425.patch           xen-unstable, Xen 4.17.x

$ sha256sum xsa425*
49f322c955fe7857cc824bba80625e56f582fdf0a4b244f513b6750e15ba5e48  xsa425.patch
$

-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmPRQroMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZEpsIAJmIVB2lvqT2Qdp0pPSoaJIxXxuGE320kVTWmudB
F2WbRCxeubqoOC/MyHTLOujMix6wBHnbm1cMQo0r4Vah/KX34vPS3wYqDZQYZtES
aEkOQ+214QLAS2futcT0gde9idKpShI9jjWSRwcH01a7V6tlwwidc4V0luUFV0iX
EKHPJ89rbbCMP1fOq5B+C7UP8oyiHItNWPWPFBwtUeXKvFiPOoyUPCoTHG8CCYHG
WiVbeaZab7x/9+WUwXJ6hZqZiVr6NqoaItOx9Nbw4yCHwJlAj2UfA9skmqtGbPbB
vxhkbIgOeiWoPvZgTGQjzZLosWO5+y30Fv5QYIbjA2/1OSQ=
=7kiM
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa425.patch"
Content-Disposition: attachment; filename="xsa425.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPgpTdWJq
ZWN0OiBSZXZlcnQgInRvb2xzL3hlbnN0b3JlOiBzaW1wbGlmeSBsb29wIGhh
bmRsaW5nIGNvbm5lY3Rpb24gSS9PIgoKSSdtIG9ic2VydmluZyBndWVzdCBr
ZXhlYyB0cmlnZ2VyIHhlbnN0b3JlZCB0byBhYm9ydCBvbiBhIGRvdWJsZSBm
cmVlLgoKZ2RiIG91dHB1dDoKUHJvZ3JhbSByZWNlaXZlZCBzaWduYWwgU0lH
QUJSVCwgQWJvcnRlZC4KX19wdGhyZWFkX2tpbGxfaW1wbGVtZW50YXRpb24g
KG5vX3RpZD0wLCBzaWdubz02LCB0aHJlYWRpZD0xNDA2NDU2MTQyNTgxMTIp
IGF0IC4vbnB0bC9wdGhyZWFkX2tpbGwuYzo0NAo0NCAgICAuL25wdGwvcHRo
cmVhZF9raWxsLmM6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkuCihnZGIp
IGJ0CiAgICBhdCAuL25wdGwvcHRocmVhZF9raWxsLmM6NDQKICAgIGF0IC4v
bnB0bC9wdGhyZWFkX2tpbGwuYzo3OAogICAgYXQgLi9ucHRsL3B0aHJlYWRf
a2lsbC5jOjg5CiAgICBhdCAuLi9zeXNkZXBzL3Bvc2l4L3JhaXNlLmM6MjYK
ICAgIGF0IHRhbGxvYy5jOjExOQogICAgcHRyPXB0ckBlbnRyeT0weDU1OWZh
ZTcyNDI5MCkgYXQgdGFsbG9jLmM6MjMyCiAgICBhdCB4ZW5zdG9yZWRfY29y
ZS5jOjI5NDUKKGdkYikgZnJhbWUgNQogICAgYXQgdGFsbG9jLmM6MTE5CjEx
OSAgICAgICAgICAgIFRBTExPQ19BQk9SVCgiQmFkIHRhbGxvYyBtYWdpYyB2
YWx1ZSAtIGRvdWJsZSBmcmVlIik7CihnZGIpIGZyYW1lIDcKICAgIGF0IHhl
bnN0b3JlZF9jb3JlLmM6Mjk0NQoyOTQ1ICAgICAgICAgICAgICAgIHRhbGxv
Y19pbmNyZWFzZV9yZWZfY291bnQoY29ubik7CihnZGIpIHAgY29ubgokMSA9
IChzdHJ1Y3QgY29ubmVjdGlvbiAqKSAweDU1OWZhZTcyNDI5MAoKTG9va2lu
ZyBhdCBhIHhlbnN0b3JlIHRyYWNlLCB3ZSBoYXZlOgpJTiAweDU1OWZhZTcx
ZjI1MCAyMDIzMDEyMCAxNzo0MDo1MyBSRUFEICgvbG9jYWwvZG9tYWluLzMv
aW1hZ2UvZGV2aWNlLW1vZGVsLWRvbQppZCApCndybDogZG9tICAgIDAgICAg
ICAxICBtc2VjICAgICAgMTAwMDAgY3JlZGl0ICAgICAxMDAwMDAwIHJlc2Vy
dmUgICAgICAgIDEwMCBkaXNjCmFyZAp3cmw6IGRvbSAgICAzICAgICAgMSAg
bXNlYyAgICAgIDEwMDAwIGNyZWRpdCAgICAgMTAwMDAwMCByZXNlcnZlICAg
ICAgICAxMDAgZGlzYwphcmQKd3JsOiBkb20gICAgMCAgICAgIDAgIG1zZWMg
ICAgICAxMDAwMCBjcmVkaXQgICAgIDEwMDAwMDAgcmVzZXJ2ZSAgICAgICAg
ICAwIGRpc2MKYXJkCndybDogZG9tICAgIDMgICAgICAwICBtc2VjICAgICAg
MTAwMDAgY3JlZGl0ICAgICAxMDAwMDAwIHJlc2VydmUgICAgICAgICAgMCBk
aXNjCmFyZApPVVQgMHg1NTlmYWU3MWYyNTAgMjAyMzAxMjAgMTc6NDA6NTMg
RVJST1IgKEVOT0VOVCApCndybDogZG9tICAgIDAgICAgICAxICBtc2VjICAg
ICAgMTAwMDAgY3JlZGl0ICAgICAxMDAwMDAwIHJlc2VydmUgICAgICAgIDEw
MCBkaXNjCmFyZAp3cmw6IGRvbSAgICAzICAgICAgMSAgbXNlYyAgICAgIDEw
MDAwIGNyZWRpdCAgICAgMTAwMDAwMCByZXNlcnZlICAgICAgICAxMDAgZGlz
YwphcmQKSU4gMHg1NTlmYWU3MWYyNTAgMjAyMzAxMjAgMTc6NDA6NTMgUkVM
RUFTRSAoMyApCkRFU1RST1kgd2F0Y2ggMHg1NTlmYWU3M2Y2MzAKREVTVFJP
WSB3YXRjaCAweDU1OWZhZTc1ZGRmMApERVNUUk9ZIHdhdGNoIDB4NTU5ZmFl
NzVlYzMwCkRFU1RST1kgd2F0Y2ggMHg1NTlmYWU3NWVhNjAKREVTVFJPWSB3
YXRjaCAweDU1OWZhZTczMmMwMApERVNUUk9ZIHdhdGNoIDB4NTU5ZmFlNzJj
ZWEwCkRFU1RST1kgd2F0Y2ggMHg1NTlmYWU3MjhmYzAKREVTVFJPWSB3YXRj
aCAweDU1OWZhZTcyOTU3MApERVNUUk9ZIGNvbm5lY3Rpb24gMHg1NTlmYWU3
MjQyOTAKb3JwaGFuZWQgbm9kZSAvbG9jYWwvZG9tYWluLzMvZGV2aWNlL3N1
c3BlbmQvZXZlbnQtY2hhbm5lbCBkZWxldGVkCm9ycGhhbmVkIG5vZGUgL2xv
Y2FsL2RvbWFpbi8zL2RldmljZS92YmQvNTE3MTIgZGVsZXRlZApvcnBoYW5l
ZCBub2RlIC9sb2NhbC9kb21haW4vMy9kZXZpY2UvdmtiZC8wIGRlbGV0ZWQK
b3JwaGFuZWQgbm9kZSAvbG9jYWwvZG9tYWluLzMvZGV2aWNlL3ZpZi8wIGRl
bGV0ZWQKb3JwaGFuZWQgbm9kZSAvbG9jYWwvZG9tYWluLzMvY29udHJvbC9z
aHV0ZG93biBkZWxldGVkCm9ycGhhbmVkIG5vZGUgL2xvY2FsL2RvbWFpbi8z
L2NvbnRyb2wvZmVhdHVyZS1wb3dlcm9mZiBkZWxldGVkCm9ycGhhbmVkIG5v
ZGUgL2xvY2FsL2RvbWFpbi8zL2NvbnRyb2wvZmVhdHVyZS1yZWJvb3QgZGVs
ZXRlZApvcnBoYW5lZCBub2RlIC9sb2NhbC9kb21haW4vMy9jb250cm9sL2Zl
YXR1cmUtc3VzcGVuZCBkZWxldGVkCm9ycGhhbmVkIG5vZGUgL2xvY2FsL2Rv
bWFpbi8zL2NvbnRyb2wvZmVhdHVyZS1zMyBkZWxldGVkCm9ycGhhbmVkIG5v
ZGUgL2xvY2FsL2RvbWFpbi8zL2NvbnRyb2wvZmVhdHVyZS1zNCBkZWxldGVk
Cm9ycGhhbmVkIG5vZGUgL2xvY2FsL2RvbWFpbi8zL2NvbnRyb2wvc3lzcnEg
ZGVsZXRlZApvcnBoYW5lZCBub2RlIC9sb2NhbC9kb21haW4vMy9kYXRhIGRl
bGV0ZWQKb3JwaGFuZWQgbm9kZSAvbG9jYWwvZG9tYWluLzMvZHJpdmVycyBk
ZWxldGVkCm9ycGhhbmVkIG5vZGUgL2xvY2FsL2RvbWFpbi8zL2ZlYXR1cmUg
ZGVsZXRlZApvcnBoYW5lZCBub2RlIC9sb2NhbC9kb21haW4vMy9hdHRyIGRl
bGV0ZWQKb3JwaGFuZWQgbm9kZSAvbG9jYWwvZG9tYWluLzMvZXJyb3IgZGVs
ZXRlZApvcnBoYW5lZCBub2RlIC9sb2NhbC9kb21haW4vMy9jb25zb2xlL2Jh
Y2tlbmQtaWQgZGVsZXRlZAoKYW5kIG5vIGZ1cnRoZXIgb3V0cHV0LgoKVGhl
IHRyYWNlIHNob3dzIHRoYXQgREVTVFJPWSB3YXMgY2FsbGVkIGZvciBjb25u
ZWN0aW9uIDB4NTU5ZmFlNzI0MjkwLApidXQgdGhhdCBpcyB0aGUgc2FtZSBw
b2ludGVyIChjb25uKSBtYWluKCkgd2FzIGxvb3BpbmcgdGhyb3VnaCBmcm9t
CmNvbm5lY3Rpb25zLiAgU28gaXQgd2Fzbid0IGFjdHVhbGx5IHJlbW92ZWQg
ZnJvbSB0aGUgY29ubmVjdGlvbnMgbGlzdD8KClJldmVydGluZyBjb21taXQg
ZThlNmU0MjI3OWE1ICJ0b29scy94ZW5zdG9yZTogc2ltcGxpZnkgbG9vcCBo
YW5kbGluZwpjb25uZWN0aW9uIEkvTyIgZml4ZXMgdGhlIGFib3J0L2RvdWJs
ZSBmcmVlLiAgSSB0aGluayB0aGUgdXNlIG9mCmxpc3RfZm9yX2VhY2hfZW50
cnlfc2FmZSBpcyBpbmNvcnJlY3QuICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3Nh
ZmUgbWFrZXMKdHJhdmVyc2FsIHNhZmUgZm9yIGRlbGV0aW5nIHRoZSBjdXJy
ZW50IGl0ZXJhdG9yLCBidXQgUkVMRUFTRS9kb19yZWxlYXNlCndpbGwgZGVs
ZXRlIHNvbWUgb3RoZXIgZW50cnkgaW4gdGhlIGNvbm5lY3Rpb25zIGxpc3Qu
ICBJIHRoaW5rIHRoZQpvYnNlcnZlZCBhYm9ydCBpcyBiZWNhdXNlIGxpc3Rf
Zm9yX2VhY2hfZW50cnkgaGFzIG5leHQgcG9pbnRpbmcgdG8gdGhlCmRlbGV0
ZWQgY29ubmVjdGlvbiwgYW5kIGl0IGlzIHVzZWQgaW4gdGhlIHN1YnNlcXVl
bnQgaXRlcmF0aW9uLgoKQWRkIGEgY29tbWVudCBleHBsYWluaW5nIHRoZSB1
bnN1aXRhYmlsaXR5IG9mIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZS4KQWxz
byBub3RpY2UgdGhhdCB0aGUgb2xkIGNvZGUgdGFrZXMgYSByZWZlcmVuY2Ug
b24gbmV4dCB3aGljaCB3b3VsZApwcmV2ZW50cyBhIHVzZS1hZnRlci1mcmVl
LgoKVGhpcyByZXZlcnRzIGNvbW1pdCBlOGU2ZTQyMjc5YTU3MjMyMzljNWM0
MGJhNGM3ZjU3OWE5Nzk0NjVkLgoKVGhpcyBpcyBYU0EtNDI1L0NWRS0yMDIy
LTQyMzMwLgoKRml4ZXM6IGU4ZTZlNDIyNzlhNSAoInRvb2xzL3hlbnN0b3Jl
OiBzaW1wbGlmeSBsb29wIGhhbmRsaW5nIGNvbm5lY3Rpb24gSS9PIikKU2ln
bmVkLW9mZi1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29t
PgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgpSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNv
bT4KLS0tCiB0b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jIHwgMTkg
KysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMv
eGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYyBiL3Rvb2xzL3hlbnN0b3JlL3hl
bnN0b3JlZF9jb3JlLmMKaW5kZXggNzhhM2VkYWE0ZS4uMDI5ZTM4NTJmYyAx
MDA2NDQKLS0tIGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYwor
KysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jCkBAIC0yOTQx
LDggKzI5NDEsMjMgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3Zb
XSkKIAkJCX0KIAkJfQogCi0JCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShj
b25uLCBuZXh0LCAmY29ubmVjdGlvbnMsIGxpc3QpIHsKLQkJCXRhbGxvY19p
bmNyZWFzZV9yZWZfY291bnQoY29ubik7CisJCS8qCisJCSAqIGxpc3RfZm9y
X2VhY2hfZW50cnlfc2FmZSBpcyBub3Qgc3VpdGFibGUgaGVyZSBiZWNhdXNl
CisJCSAqIGhhbmRsZV9pbnB1dCBtYXkgZGVsZXRlIGVudHJpZXMgYmVzaWRl
cyB0aGUgY3VycmVudCBvbmUsIGJ1dAorCQkgKiB0aG9zZSBtYXkgYmUgaW4g
dGhlIHRlbXBvcmFyeSBuZXh0IHdoaWNoIHdvdWxkIHRyaWdnZXIgYQorCQkg
KiB1c2UtYWZ0ZXItZnJlZS4gIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZSBp
cyBvbmx5IHNhZmUgZm9yCisJCSAqIGRlbGV0aW5nIHRoZSBjdXJyZW50IGVu
dHJ5LgorCQkgKi8KKwkJbmV4dCA9IGxpc3RfZW50cnkoY29ubmVjdGlvbnMu
bmV4dCwgdHlwZW9mKCpjb25uKSwgbGlzdCk7CisJCWlmICgmbmV4dC0+bGlz
dCAhPSAmY29ubmVjdGlvbnMpCisJCQl0YWxsb2NfaW5jcmVhc2VfcmVmX2Nv
dW50KG5leHQpOworCQl3aGlsZSAoJm5leHQtPmxpc3QgIT0gJmNvbm5lY3Rp
b25zKSB7CisJCQljb25uID0gbmV4dDsKKworCQkJbmV4dCA9IGxpc3RfZW50
cnkoY29ubi0+bGlzdC5uZXh0LAorCQkJCQkgIHR5cGVvZigqY29ubiksIGxp
c3QpOworCQkJaWYgKCZuZXh0LT5saXN0ICE9ICZjb25uZWN0aW9ucykKKwkJ
CQl0YWxsb2NfaW5jcmVhc2VfcmVmX2NvdW50KG5leHQpOwogCiAJCQlpZiAo
Y29ubl9jYW5fcmVhZChjb25uKSkKIAkJCQloYW5kbGVfaW5wdXQoY29ubik7
Ci0tIAoyLjM0LjEK

--=separator--

