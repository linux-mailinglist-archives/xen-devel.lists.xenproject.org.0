Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DE347A92F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 13:03:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249613.430087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzHNz-0003Gt-Nv; Mon, 20 Dec 2021 12:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249613.430087; Mon, 20 Dec 2021 12:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzHNz-000393-Hd; Mon, 20 Dec 2021 12:03:23 +0000
Received: by outflank-mailman (input) for mailman id 249613;
 Mon, 20 Dec 2021 12:03:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IL3F=RF=xenbits.xen.org=julieng@srs-se1.protection.inumbo.net>)
 id 1mzHNx-0001n7-JB
 for xen-devel@lists.xen.org; Mon, 20 Dec 2021 12:03:21 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d19f504e-618c-11ec-85d3-df6b77346a89;
 Mon, 20 Dec 2021 13:03:20 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1mzHNl-0003vK-1Z; Mon, 20 Dec 2021 12:03:09 +0000
Received: from julieng by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1mzHNl-0002XV-04; Mon, 20 Dec 2021 12:03:09 +0000
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
X-Inumbo-ID: d19f504e-618c-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=6Hw5fE7cUwe2ArMj2R1FdsYTBEwKvx7jgxqt04XTWtc=; b=aGUxZCr2r6wBmy6x4WMy8Vs9ST
	zKHtMdDRqXWhFDaFW6meUtNig+mbivEN1SHjLSoE7EZz+Z1xn5DUnKtJP/eAnUktZ9X+H0aQFH0Lj
	lLY/FUKUhB170rFZ5dayr+1UMky9X0XwXgj4qdOiVpwZk5iNesZxpbWqGwKGM80w8X0I=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 392 v4 (CVE-2021-28714,CVE-2021-28715) -
 Guest can force Linux netback driver to hog large amounts of kernel memory
Message-Id: <E1mzHNl-0002XV-04@xenbits.xenproject.org>
Date: Mon, 20 Dec 2021 12:03:09 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

     Xen Security Advisory CVE-2021-28714,CVE-2021-28715 / XSA-392
                               version 4

 Guest can force Linux netback driver to hog large amounts of kernel memory

UPDATES IN VERSION 4
====================

Public release

ISSUE DESCRIPTION
=================

Incoming data packets for a guest in the Linux kernel's netback driver
are buffered until the guest is ready to process them. There are some
measures taken for avoiding to pile up too much data, but those can
be bypassed by the guest:

There is a timeout how long the client side of an interface can stop
consuming new packets before it is assumed to have stalled, but this
timeout is rather long (60 seconds by default). Using a UDP connection
on a fast interface can easily accumulate gigabytes of data in that
time.  (CVE-2021-28715)

The timeout could even never trigger if the guest manages to have only
one free slot in its RX queue ring page and the next package would
require more than one free slot, which may be the case when using GSO,
XDP, or software hashing.  (CVE-2021-28714)

IMPACT
======

The Linux kernel's xen-netback backend driver can be forced by guests
to queue arbitrary amounts of network data, finally causing an out of
memory situation in the domain the backend is running in (usually dom0).

VULNERABLE SYSTEMS
==================

All systems using the Linux kernel based network backend xen-netback
are vulnerable.

MITIGATION
==========

Using another PV network backend (e.g. the qemu based "qnic" backend)
will mitigate the problem.

Using a dedicated network driver domain per guest will mitigate the
problem.

RESOLUTION
==========

Applying the attached patches resolves this issue.

xsa392-linux-1.patch   Linux 5.15
xsa392-linux-2.patch   Linux 5.15

$ sha256sum xsa392*
9cf75e9919415267266a7f69ca0f3dbbafc1c55d4243cff1cb26072e28bb6e26  xsa392-linux-1.patch
f390da9723ed03948855bfc3b112fc11bcc794fc59502d4fc5e8e358321e8684  xsa392-linux-2.patch
$

CREDITS
=======

This issue was discovered by  Jürgen Groß of SUSE.

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the *patches* is permitted during the embargo, even on
public-facing systems with untrusted guest users and administrators.

But: Distribution of updated software is prohibited (except to other
members of the predisclosure list).


Deployment of the *mitigations* (switching to driver domains or using
a qemu based backend) is NOT permitted (except where all the affected
systems and VMs are administered and used only by organisations which
are members of the Xen Project Security Issues Predisclosure List).
Specifically, deployment of the mitigations on public cloud systems is
NOT permitted.

This is because the mitigations will result in discoverable changes of
Xenstore entries for the guest.

Deployment of the mitigations is permitted only AFTER the embargo ends.


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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmG8sr8MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZQGsH/igyavZ/s8jbiANP/jVW9/4wegsqqaeaQBEyhP0o
P2wEwX30taFmT+kC/7Rf+62O2vdOJKow4C+JouCKcigDH2+nvkki/gd65cpKLkk4
BKBuSnkTkagdokTPqpQ57zKTe9R5OP4Iw8B01YCI0k08aKE782xbxLr+pac3dw2C
3tB24fdFibrzlXeMbYXM2Aw8aeSWkVjJ40XrW+Xo6k8GdgTZY9SDgTqGAv71g+bJ
liCQheGkQIQPDjFUf6S/ykRCwaQVtnHqThASPoWOwzYto3uvjyMJm74Rr9n6TLzz
WvJLQPDgObyU9RUlUXU3fgCaYgvh2ufuNreQt1d1NY01s04=
=54ve
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa392-linux-1.patch"
Content-Disposition: attachment; filename="xsa392-linux-1.patch"
Content-Transfer-Encoding: base64

RnJvbSA4YjAxZWMyNmI2OWRmYjhmYzAzMzYwMDQ1NmM3NTIyNzc3YzhlMTgz
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CkRhdGU6IEZyaSwgMjYgTm92IDIwMjEgMTA6
MzY6NTcgKzAxMDAKU3ViamVjdDogW1BBVENIIDEvMl0geGVuL25ldGJhY2s6
IGZpeCByeCBxdWV1ZSBzdGFsbCBkZXRlY3Rpb24KCkNvbW1pdCAxZDVkNDg1
MjM5MDBhNGIgKCJ4ZW4tbmV0YmFjazogcmVxdWlyZSBmZXdlciBndWVzdCBS
eCBzbG90cyB3aGVuCm5vdCB1c2luZyBHU08iKSBpbnRyb2R1Y2VkIGEgc2Vj
dXJpdHkgcHJvYmxlbSBpbiBuZXRiYWNrLCBhcyBhbgppbnRlcmZhY2Ugd291
bGQgb25seSBiZSByZWdhcmRlZCB0byBiZSBzdGFsbGVkIGlmIG5vIHNsb3Qg
aXMgYXZhaWxhYmxlCmluIHRoZSByeCBxdWV1ZSByaW5nIHBhZ2UuIEluIGNh
c2UgdGhlIFNLQiBhdCB0aGUgaGVhZCBvZiB0aGUgcXVldWVkCnJlcXVlc3Rz
IHdpbGwgbmVlZCBtb3JlIHRoYW4gb25lIHJ4IHNsb3QgYW5kIG9ubHkgb25l
IHNsb3QgaXMgZnJlZSB0aGUKc3RhbGwgZGV0ZWN0aW9uIGxvZ2ljIHdpbGwg
bmV2ZXIgdHJpZ2dlciwgYXMgdGhlIHRlc3QgZm9yIHRoYXQgaXMgb25seQps
b29raW5nIGZvciBhdCBsZWFzdCBvbmUgc2xvdCB0byBiZSBmcmVlLgoKRml4
IHRoYXQgYnkgdGVzdGluZyBmb3IgdGhlIG5lZWRlZCBudW1iZXIgb2Ygc2xv
dHMgaW5zdGVhZCBvZiBvbmx5IG9uZQpzbG90IGJlaW5nIGF2YWlsYWJsZS4K
CkluIG9yZGVyIHRvIG5vdCBoYXZlIHRvIHRha2UgdGhlIHJ4IHF1ZXVlIGxv
Y2sgdGhhdCBvZnRlbiwgc3RvcmUgdGhlCm51bWJlciBvZiBuZWVkZWQgc2xv
dHMgaW4gdGhlIHF1ZXVlIGRhdGEuIEFzIGFsbCBTS0IgZGVxdWV1ZSBvcGVy
YXRpb25zCmhhcHBlbiBpbiB0aGUgcnggcXVldWUga2VybmVsIHRocmVhZCB0
aGlzIGlzIHNhZmUsIGFzIGxvbmcgYXMgdGhlCm51bWJlciBvZiBuZWVkZWQg
c2xvdHMgaXMgYWNjZXNzZWQgdmlhIFJFQUQvV1JJVEVfT05DRSgpIG9ubHkg
YW5kCnVwZGF0ZXMgYXJlIGFsd2F5cyBkb25lIHdpdGggdGhlIHJ4IHF1ZXVl
IGxvY2sgaGVsZC4KCkFkZCBhIHNtYWxsIGhlbHBlciBmb3Igb2J0YWluaW5n
IHRoZSBudW1iZXIgb2YgZnJlZSBzbG90cy4KClRoaXMgaXMgQ1ZFLTIwMjEt
Mjg3MTQsIHBhcnQgb2YgWFNBLTM5MgoKRml4ZXM6IDFkNWQ0ODUyMzkwMGE0
YiAoInhlbi1uZXRiYWNrOiByZXF1aXJlIGZld2VyIGd1ZXN0IFJ4IHNsb3Rz
IHdoZW4gbm90IHVzaW5nIEdTTyIpClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCiBkcml2ZXJzL25ldC94ZW4t
bmV0YmFjay9jb21tb24uaCB8ICAxICsKIGRyaXZlcnMvbmV0L3hlbi1uZXRi
YWNrL3J4LmMgICAgIHwgNjUgKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgMjQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQveGVuLW5l
dGJhY2svY29tbW9uLmggYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9jb21t
b24uaAppbmRleCA0YTE2ZDZlMzNjMDkuLmQ5ZGVhNDgyOWM4NiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svY29tbW9uLmgKKysrIGIv
ZHJpdmVycy9uZXQveGVuLW5ldGJhY2svY29tbW9uLmgKQEAgLTIwMyw2ICsy
MDMsNyBAQCBzdHJ1Y3QgeGVudmlmX3F1ZXVlIHsgLyogUGVyLXF1ZXVlIGRh
dGEgZm9yIHhlbnZpZiAqLwogCXVuc2lnbmVkIGludCByeF9xdWV1ZV9tYXg7
CiAJdW5zaWduZWQgaW50IHJ4X3F1ZXVlX2xlbjsKIAl1bnNpZ25lZCBsb25n
IGxhc3RfcnhfdGltZTsKKwl1bnNpZ25lZCBpbnQgcnhfc2xvdHNfbmVlZGVk
OwogCWJvb2wgc3RhbGxlZDsKIAogCXN0cnVjdCB4ZW52aWZfY29weV9zdGF0
ZSByeF9jb3B5OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQveGVuLW5ldGJh
Y2svcnguYyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL3J4LmMKaW5kZXgg
YWNjYzk5MWQxNTNmLi5hODUxMWUyN2Q2YzEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbmV0L3hlbi1uZXRiYWNrL3J4LmMKKysrIGIvZHJpdmVycy9uZXQveGVu
LW5ldGJhY2svcnguYwpAQCAtMzMsMjggKzMzLDM2IEBACiAjaW5jbHVkZSA8
eGVuL3hlbi5oPgogI2luY2x1ZGUgPHhlbi9ldmVudHMuaD4KIAotc3RhdGlj
IGJvb2wgeGVudmlmX3J4X3Jpbmdfc2xvdHNfYXZhaWxhYmxlKHN0cnVjdCB4
ZW52aWZfcXVldWUgKnF1ZXVlKQorLyoKKyAqIFVwZGF0ZSB0aGUgbmVlZGVk
IHJpbmcgcGFnZSBzbG90cyBmb3IgdGhlIGZpcnN0IFNLQiBxdWV1ZWQuCisg
KiBOb3RlIHRoYXQgYW55IGNhbGwgc2VxdWVuY2Ugb3V0c2lkZSB0aGUgUlgg
dGhyZWFkIGNhbGxpbmcgdGhpcyBmdW5jdGlvbgorICogbmVlZHMgdG8gd2Fr
ZSB1cCB0aGUgUlggdGhyZWFkIHZpYSBhIGNhbGwgb2YgeGVudmlmX2tpY2tf
dGhyZWFkKCkKKyAqIGFmdGVyd2FyZHMgaW4gb3JkZXIgdG8gYXZvaWQgYSBy
YWNlIHdpdGggcHV0dGluZyB0aGUgdGhyZWFkIHRvIHNsZWVwLgorICovCitz
dGF0aWMgdm9pZCB4ZW52aWZfdXBkYXRlX25lZWRlZF9zbG90cyhzdHJ1Y3Qg
eGVudmlmX3F1ZXVlICpxdWV1ZSwKKwkJCQkgICAgICAgY29uc3Qgc3RydWN0
IHNrX2J1ZmYgKnNrYikKIHsKLQlSSU5HX0lEWCBwcm9kLCBjb25zOwotCXN0
cnVjdCBza19idWZmICpza2I7Ci0JaW50IG5lZWRlZDsKLQl1bnNpZ25lZCBs
b25nIGZsYWdzOwotCi0Jc3Bpbl9sb2NrX2lycXNhdmUoJnF1ZXVlLT5yeF9x
dWV1ZS5sb2NrLCBmbGFncyk7CisJdW5zaWduZWQgaW50IG5lZWRlZCA9IDA7
CiAKLQlza2IgPSBza2JfcGVlaygmcXVldWUtPnJ4X3F1ZXVlKTsKLQlpZiAo
IXNrYikgewotCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZxdWV1ZS0+cnhf
cXVldWUubG9jaywgZmxhZ3MpOwotCQlyZXR1cm4gZmFsc2U7CisJaWYgKHNr
YikgeworCQluZWVkZWQgPSBESVZfUk9VTkRfVVAoc2tiLT5sZW4sIFhFTl9Q
QUdFX1NJWkUpOworCQlpZiAoc2tiX2lzX2dzbyhza2IpKQorCQkJbmVlZGVk
Kys7CisJCWlmIChza2ItPnN3X2hhc2gpCisJCQluZWVkZWQrKzsKIAl9CiAK
LQluZWVkZWQgPSBESVZfUk9VTkRfVVAoc2tiLT5sZW4sIFhFTl9QQUdFX1NJ
WkUpOwotCWlmIChza2JfaXNfZ3NvKHNrYikpCi0JCW5lZWRlZCsrOwotCWlm
IChza2ItPnN3X2hhc2gpCi0JCW5lZWRlZCsrOworCVdSSVRFX09OQ0UocXVl
dWUtPnJ4X3Nsb3RzX25lZWRlZCwgbmVlZGVkKTsKK30KIAotCXNwaW5fdW5s
b2NrX2lycXJlc3RvcmUoJnF1ZXVlLT5yeF9xdWV1ZS5sb2NrLCBmbGFncyk7
CitzdGF0aWMgYm9vbCB4ZW52aWZfcnhfcmluZ19zbG90c19hdmFpbGFibGUo
c3RydWN0IHhlbnZpZl9xdWV1ZSAqcXVldWUpCit7CisJUklOR19JRFggcHJv
ZCwgY29uczsKKwl1bnNpZ25lZCBpbnQgbmVlZGVkOworCisJbmVlZGVkID0g
UkVBRF9PTkNFKHF1ZXVlLT5yeF9zbG90c19uZWVkZWQpOworCWlmICghbmVl
ZGVkKQorCQlyZXR1cm4gZmFsc2U7CiAKIAlkbyB7CiAJCXByb2QgPSBxdWV1
ZS0+cnguc3JpbmctPnJlcV9wcm9kOwpAQCAtODAsNiArODgsOSBAQCB2b2lk
IHhlbnZpZl9yeF9xdWV1ZV90YWlsKHN0cnVjdCB4ZW52aWZfcXVldWUgKnF1
ZXVlLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQogCiAJc3Bpbl9sb2NrX2lycXNh
dmUoJnF1ZXVlLT5yeF9xdWV1ZS5sb2NrLCBmbGFncyk7CiAKKwlpZiAoc2ti
X3F1ZXVlX2VtcHR5KCZxdWV1ZS0+cnhfcXVldWUpKQorCQl4ZW52aWZfdXBk
YXRlX25lZWRlZF9zbG90cyhxdWV1ZSwgc2tiKTsKKwogCV9fc2tiX3F1ZXVl
X3RhaWwoJnF1ZXVlLT5yeF9xdWV1ZSwgc2tiKTsKIAogCXF1ZXVlLT5yeF9x
dWV1ZV9sZW4gKz0gc2tiLT5sZW47CkBAIC0xMDAsNiArMTExLDggQEAgc3Rh
dGljIHN0cnVjdCBza19idWZmICp4ZW52aWZfcnhfZGVxdWV1ZShzdHJ1Y3Qg
eGVudmlmX3F1ZXVlICpxdWV1ZSkKIAogCXNrYiA9IF9fc2tiX2RlcXVldWUo
JnF1ZXVlLT5yeF9xdWV1ZSk7CiAJaWYgKHNrYikgeworCQl4ZW52aWZfdXBk
YXRlX25lZWRlZF9zbG90cyhxdWV1ZSwgc2tiX3BlZWsoJnF1ZXVlLT5yeF9x
dWV1ZSkpOworCiAJCXF1ZXVlLT5yeF9xdWV1ZV9sZW4gLT0gc2tiLT5sZW47
CiAJCWlmIChxdWV1ZS0+cnhfcXVldWVfbGVuIDwgcXVldWUtPnJ4X3F1ZXVl
X21heCkgewogCQkJc3RydWN0IG5ldGRldl9xdWV1ZSAqdHhxOwpAQCAtNDg3
LDI3ICs1MDAsMzEgQEAgdm9pZCB4ZW52aWZfcnhfYWN0aW9uKHN0cnVjdCB4
ZW52aWZfcXVldWUgKnF1ZXVlKQogCXhlbnZpZl9yeF9jb3B5X2ZsdXNoKHF1
ZXVlKTsKIH0KIAotc3RhdGljIGJvb2wgeGVudmlmX3J4X3F1ZXVlX3N0YWxs
ZWQoc3RydWN0IHhlbnZpZl9xdWV1ZSAqcXVldWUpCitzdGF0aWMgUklOR19J
RFggeGVudmlmX3J4X3F1ZXVlX3Nsb3RzKGNvbnN0IHN0cnVjdCB4ZW52aWZf
cXVldWUgKnF1ZXVlKQogewogCVJJTkdfSURYIHByb2QsIGNvbnM7CiAKIAlw
cm9kID0gcXVldWUtPnJ4LnNyaW5nLT5yZXFfcHJvZDsKIAljb25zID0gcXVl
dWUtPnJ4LnJlcV9jb25zOwogCisJcmV0dXJuIHByb2QgLSBjb25zOworfQor
CitzdGF0aWMgYm9vbCB4ZW52aWZfcnhfcXVldWVfc3RhbGxlZChjb25zdCBz
dHJ1Y3QgeGVudmlmX3F1ZXVlICpxdWV1ZSkKK3sKKwl1bnNpZ25lZCBpbnQg
bmVlZGVkID0gUkVBRF9PTkNFKHF1ZXVlLT5yeF9zbG90c19uZWVkZWQpOwor
CiAJcmV0dXJuICFxdWV1ZS0+c3RhbGxlZCAmJgotCQlwcm9kIC0gY29ucyA8
IDEgJiYKKwkJeGVudmlmX3J4X3F1ZXVlX3Nsb3RzKHF1ZXVlKSA8IG5lZWRl
ZCAmJgogCQl0aW1lX2FmdGVyKGppZmZpZXMsCiAJCQkgICBxdWV1ZS0+bGFz
dF9yeF90aW1lICsgcXVldWUtPnZpZi0+c3RhbGxfdGltZW91dCk7CiB9CiAK
IHN0YXRpYyBib29sIHhlbnZpZl9yeF9xdWV1ZV9yZWFkeShzdHJ1Y3QgeGVu
dmlmX3F1ZXVlICpxdWV1ZSkKIHsKLQlSSU5HX0lEWCBwcm9kLCBjb25zOwot
Ci0JcHJvZCA9IHF1ZXVlLT5yeC5zcmluZy0+cmVxX3Byb2Q7Ci0JY29ucyA9
IHF1ZXVlLT5yeC5yZXFfY29uczsKKwl1bnNpZ25lZCBpbnQgbmVlZGVkID0g
UkVBRF9PTkNFKHF1ZXVlLT5yeF9zbG90c19uZWVkZWQpOwogCi0JcmV0dXJu
IHF1ZXVlLT5zdGFsbGVkICYmIHByb2QgLSBjb25zID49IDE7CisJcmV0dXJu
IHF1ZXVlLT5zdGFsbGVkICYmIHhlbnZpZl9yeF9xdWV1ZV9zbG90cyhxdWV1
ZSkgPj0gbmVlZGVkOwogfQogCiBib29sIHhlbnZpZl9oYXZlX3J4X3dvcmso
c3RydWN0IHhlbnZpZl9xdWV1ZSAqcXVldWUsIGJvb2wgdGVzdF9rdGhyZWFk
KQotLSAKMi4yNi4yCgo=

--=separator
Content-Type: application/octet-stream; name="xsa392-linux-2.patch"
Content-Disposition: attachment; filename="xsa392-linux-2.patch"
Content-Transfer-Encoding: base64

RnJvbSA3MTQ5MmYxZjEyZGI5NTZhOWViNDllNzI3ZDEyYjIyNWRhZDc0MjA1
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CkRhdGU6IEZyaSwgMjYgTm92IDIwMjEgMTA6
MzY6NTcgKzAxMDAKU3ViamVjdDogW1BBVENIIDIvMl0geGVuL25ldGJhY2s6
IGRvbid0IHF1ZXVlIHVubGltaXRlZCBudW1iZXIgb2YgcGFja2FnZXMKCklu
IGNhc2UgYSBndWVzdCBpc24ndCBjb25zdW1pbmcgaW5jb21pbmcgbmV0d29y
ayB0cmFmZmljIGFzIGZhc3QgYXMgaXQKaXMgY29taW5nIGluLCB4ZW4tbmV0
YmFjayBpcyBidWZmZXJpbmcgbmV0d29yayBwYWNrYWdlcyBpbiB1bmxpbWl0
ZWQKbnVtYmVycyB0b2RheS4gVGhpcyBjYW4gcmVzdWx0IGluIGhvc3QgT09N
IHNpdHVhdGlvbnMuCgpDb21taXQgZjQ4ZGE4YjE0ZDA0Y2E4ICgieGVuLW5l
dGJhY2s6IGZpeCB1bmxpbWl0ZWQgZ3Vlc3QgUnggaW50ZXJuYWwKcXVldWUg
YW5kIGNhcnJpZXIgZmxhcHBpbmciKSBtZWFudCB0byBpbnRyb2R1Y2UgYSBt
ZWNoYW5pc20gdG8gbGltaXQKdGhlIGFtb3VudCBvZiBidWZmZXJlZCBkYXRh
IGJ5IHN0b3BwaW5nIHRoZSBUeCBxdWV1ZSB3aGVuIHJlYWNoaW5nIHRoZQpk
YXRhIGxpbWl0LCBidXQgdGhpcyBkb2Vzbid0IHdvcmsgZm9yIGNhc2VzIGxp
a2UgVURQLgoKV2hlbiBoaXR0aW5nIHRoZSBsaW1pdCBkb24ndCBxdWV1ZSBm
dXJ0aGVyIFNLQnMsIGJ1dCBkcm9wIHRoZW0gaW5zdGVhZC4KSW4gb3JkZXIg
dG8gYmUgYWJsZSB0byB0ZWxsIFJ4IHBhY2thZ2VzIGhhdmUgYmVlbiBkcm9w
cGVkIGluY3JlbWVudCB0aGUKcnhfZHJvcHBlZCBzdGF0aXN0aWNzIGNvdW50
ZXIgaW4gdGhpcyBjYXNlLgoKSXQgc2hvdWxkIGJlIG5vdGVkIHRoYXQgdGhl
IG9sZCBzb2x1dGlvbiB0byBjb250aW51ZSBxdWV1ZWluZyBTS0JzIGhhZAp0
aGUgYWRkaXRpb25hbCBwcm9ibGVtIG9mIGFuIG92ZXJmbG93IG9mIHRoZSAz
Mi1iaXQgcnhfcXVldWVfbGVuIHZhbHVlCndvdWxkIHJlc3VsdCBpbiBpbnRl
cm1pdHRlbnQgVHggcXVldWUgZW5hYmxpbmcuCgpUaGlzIGlzIENWRS0yMDIx
LTI4NzE1LCBwYXJ0IG9mIFhTQS0zOTIKCkZpeGVzOiBmNDhkYThiMTRkMDRj
YTggKCJ4ZW4tbmV0YmFjazogZml4IHVubGltaXRlZCBndWVzdCBSeCBpbnRl
cm5hbCBxdWV1ZSBhbmQgY2FycmllciBmbGFwcGluZyIpClNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KUmV2aWV3ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCiBkcml2
ZXJzL25ldC94ZW4tbmV0YmFjay9yeC5jIHwgMTggKysrKysrKysrKystLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFj
ay9yeC5jIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svcnguYwppbmRleCBh
ODUxMWUyN2Q2YzEuLmRiYWM0YzAzZDIxYSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9uZXQveGVuLW5ldGJhY2svcnguYworKysgYi9kcml2ZXJzL25ldC94ZW4t
bmV0YmFjay9yeC5jCkBAIC04OCwxNiArODgsMTkgQEAgdm9pZCB4ZW52aWZf
cnhfcXVldWVfdGFpbChzdHJ1Y3QgeGVudmlmX3F1ZXVlICpxdWV1ZSwgc3Ry
dWN0IHNrX2J1ZmYgKnNrYikKIAogCXNwaW5fbG9ja19pcnFzYXZlKCZxdWV1
ZS0+cnhfcXVldWUubG9jaywgZmxhZ3MpOwogCi0JaWYgKHNrYl9xdWV1ZV9l
bXB0eSgmcXVldWUtPnJ4X3F1ZXVlKSkKLQkJeGVudmlmX3VwZGF0ZV9uZWVk
ZWRfc2xvdHMocXVldWUsIHNrYik7Ci0KLQlfX3NrYl9xdWV1ZV90YWlsKCZx
dWV1ZS0+cnhfcXVldWUsIHNrYik7Ci0KLQlxdWV1ZS0+cnhfcXVldWVfbGVu
ICs9IHNrYi0+bGVuOwotCWlmIChxdWV1ZS0+cnhfcXVldWVfbGVuID4gcXVl
dWUtPnJ4X3F1ZXVlX21heCkgeworCWlmIChxdWV1ZS0+cnhfcXVldWVfbGVu
ID49IHF1ZXVlLT5yeF9xdWV1ZV9tYXgpIHsKIAkJc3RydWN0IG5ldF9kZXZp
Y2UgKmRldiA9IHF1ZXVlLT52aWYtPmRldjsKIAogCQluZXRpZl90eF9zdG9w
X3F1ZXVlKG5ldGRldl9nZXRfdHhfcXVldWUoZGV2LCBxdWV1ZS0+aWQpKTsK
KwkJa2ZyZWVfc2tiKHNrYik7CisJCXF1ZXVlLT52aWYtPmRldi0+c3RhdHMu
cnhfZHJvcHBlZCsrOworCX0gZWxzZSB7CisJCWlmIChza2JfcXVldWVfZW1w
dHkoJnF1ZXVlLT5yeF9xdWV1ZSkpCisJCQl4ZW52aWZfdXBkYXRlX25lZWRl
ZF9zbG90cyhxdWV1ZSwgc2tiKTsKKworCQlfX3NrYl9xdWV1ZV90YWlsKCZx
dWV1ZS0+cnhfcXVldWUsIHNrYik7CisKKwkJcXVldWUtPnJ4X3F1ZXVlX2xl
biArPSBza2ItPmxlbjsKIAl9CiAKIAlzcGluX3VubG9ja19pcnFyZXN0b3Jl
KCZxdWV1ZS0+cnhfcXVldWUubG9jaywgZmxhZ3MpOwpAQCAtMTQ3LDYgKzE1
MCw3IEBAIHN0YXRpYyB2b2lkIHhlbnZpZl9yeF9xdWV1ZV9kcm9wX2V4cGly
ZWQoc3RydWN0IHhlbnZpZl9xdWV1ZSAqcXVldWUpCiAJCQlicmVhazsKIAkJ
eGVudmlmX3J4X2RlcXVldWUocXVldWUpOwogCQlrZnJlZV9za2Ioc2tiKTsK
KwkJcXVldWUtPnZpZi0+ZGV2LT5zdGF0cy5yeF9kcm9wcGVkKys7CiAJfQog
fQogCi0tIAoyLjI2LjIKCg==

--=separator--

