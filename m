Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C818BF6432
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 14:00:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147033.1479354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBB2O-0005yU-EQ; Tue, 21 Oct 2025 12:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147033.1479354; Tue, 21 Oct 2025 12:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBB2O-0005wF-9m; Tue, 21 Oct 2025 12:00:24 +0000
Received: by outflank-mailman (input) for mailman id 1147033;
 Tue, 21 Oct 2025 12:00:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DCT0=46=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1vBB2M-0005sa-HI
 for xen-devel@lists.xen.org; Tue, 21 Oct 2025 12:00:22 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8281166a-ae75-11f0-9d15-b5c5bf9af7f9;
 Tue, 21 Oct 2025 14:00:20 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1vBB2B-00Chk7-1N;
 Tue, 21 Oct 2025 12:00:11 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1vBB2B-005gLp-1f;
 Tue, 21 Oct 2025 12:00:11 +0000
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
X-Inumbo-ID: 8281166a-ae75-11f0-9d15-b5c5bf9af7f9
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.510 (Entity 5.510)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 475 v2 (CVE-2025-58147,CVE-2025-58148) -
 x86: Incorrect input sanitisation in Viridian hypercalls
Message-Id: <E1vBB2B-005gLp-1f@xenbits.xenproject.org>
Date: Tue, 21 Oct 2025 12:00:11 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

     Xen Security Advisory CVE-2025-58147,CVE-2025-58148 / XSA-475
                               version 2

       x86: Incorrect input sanitisation in Viridian hypercalls

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

Some Viridian hypercalls can specify a mask of vCPU IDs as an input, in
one of three formats.  Xen has boundary checking bugs with all three
formats, which can cause out-of-bounds reads and writes while processing
the inputs.

 * CVE-2025-58147.  Hypercalls using the HV_VP_SET Sparse format can
   cause vpmask_set() to write out of bounds when converting the bitmap
   to Xen's format.

 * CVE-2025-58148.  Hypercalls using any input format can cause
   send_ipi() to read d->vcpu[] out-of-bounds, and operate on a wild
   vCPU pointer.

IMPACT
======

A buggy or malicious guest can cause Denial of Service (DoS) affecting
the entire host, information leaks, or elevation of privilege.

VULNERABLE SYSTEMS
==================

Xen versions 4.15 and newer are vulnerable.  Versions 4.14 and older are
not vulnerable.

Only x86 HVM guests which have Viridian enabled can leverage the
vulnerability.

With the `xl` toolstack, this means any `viridian=` setting in the VM's
configuration file.

Note - despite:

  `viridian=["!hcall_remote_tlb_flush", "!hcall_ipi", "!ex_processor_masks"]`

being documented to turns off the relevant functionality, this
configuration does not block the relevant hypercalls.

MITIGATION
==========

Not enabling Viridian will avoid the issuse.

CREDITS
=======

This issue was discovered by Teddy Astie of Vates

RESOLUTION
==========

Applying the appropriate set of attached patches resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa475-?.patch           xen-unstable - Xen 4.20.x
xsa475-4.19-?.patch      Xen 4.19.x - Xen 4.17.x

$ sha256sum xsa475*
25ba4933e4cf94e81d192f3ba522ec7b258c6e69015a43d169b0325e61957f42  xsa475-1.patch
d012541f99c69279b30554e8ea7a7da2790aaa6ff81b0d597f305e4498391369  xsa475-2.patch
6b820b116418e6fd376b6d23ede589e4f86fea4ea775e9afb5c631ceba44d05f  xsa475-4.19-1.patch
f94b48392179bc08f412ead900a91299ef3a27a6dd4f5fdcf7a152fd65d3a02b  xsa475-4.19-2.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches (but not mitigations) described above (or others
which are substantially similar) is permitted during the embargo, even on
public-facing systems with untrusted guest users and administrators.

This is because the mitigations are guest visible changes, and hence could
give hints to users about the upcoming vulnerabilities.

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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmj3daEMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZnvgIAJzU/Bczr7/Gj3pIqop+rgDsoLw/PU2tGkwhumJQ
0lICxaHWlqrk8cL0y+Ll0nQV4DTwoZbhSm9Bz3S9ZKo6/Qby9YZzo0Tyt9U2OxNU
YTpiYGSwrSlCs8cpfj4gwKGzEZ0nNTBTVbAa9UfqIYcvNF4j/L0Tnl6cJOZ/xNhh
8BoH02j+vCF8B8ZInutJjHhKPtrmDta0/md9R4Ydrx4OrLlAoYA4hKnkOuBWfhHg
amL1aJ3vk9kNNkP6sO19Vnp5KTawnLGZwN95+FDlDGuh8n8ixKfURvZ9eK8Ycfir
naItP4wBkFC9ukzlvGtkwoHPDspxKjtFTYfNvVNvoV6JOWc=
=oSQZ
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa475-1.patch"
Content-Disposition: attachment; filename="xsa475-1.patch"
Content-Transfer-Encoding: base64

RnJvbTogVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+ClN1
YmplY3Q6IHg4Ni92aXJpZGlhbjogRW5mb3JjZSBib3VuZHMgY2hlY2sgaW4g
dnBtYXNrX3NldCgpCgpDYWxsZXJzIGNhbiBwYXNzIHZwL21hc2sgdmFsdWVz
IHdoaWNoIGV4Y2VlZCB0aGUgc2l6ZSBvZiB2cG1hc2stPm1hc2suICBFbnN1
cmUKd2Ugb25seSBzZXQgYml0cyB3aGljaCBhcmUgd2l0aGluIGJvdW5kcy4K
ClRoaXMgaXMgWFNBLTQ3NSAvIENWRS0yMDI1LTU4MTQ3LgoKRml4ZXM6IGI0
MTI0NjgyZGI2ZSAoInZpcmlkaWFuOiBhZGQgRXhQcm9jZXNzb3JNYXNrcyB2
YXJpYW50cyBvZiB0aGUgZmx1c2ggaHlwZXJjYWxscyIpClNpZ25lZC1vZmYt
Ynk6IFRlZGR5IEFzdGllIDx0ZWRkeS5hc3RpZUB2YXRlcy50ZWNoPgpSZXZp
ZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFu
L3ZpcmlkaWFuLmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3Zpcmlk
aWFuLmMKaW5kZXggYzBiZTI0YmQyMjEwLi43MDNmOWFjOGJjYzEgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdmlyaWRpYW4uYwor
KysgYi94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3ZpcmlkaWFuLmMKQEAg
LTU2Miw3ICs1NjIsOCBAQCBzdGF0aWMgdm9pZCB2cG1hc2tfc2V0KHN0cnVj
dCBoeXBlcmNhbGxfdnBtYXNrICp2cG1hc2ssIHVuc2lnbmVkIGludCB2cCwK
IAogICAgICAgICBpZiAoIG1hc2sgJiAxICkKICAgICAgICAgewotICAgICAg
ICAgICAgQVNTRVJUKHZwIDwgSFZNX01BWF9WQ1BVUyk7CisgICAgICAgICAg
ICBpZiAoIHZwID49IEhWTV9NQVhfVkNQVVMgKQorICAgICAgICAgICAgICAg
IGJyZWFrOwogICAgICAgICAgICAgX19zZXRfYml0KHZwLCB2cG1hc2stPm1h
c2spOwogICAgICAgICB9CiAK

--=separator
Content-Type: application/octet-stream; name="xsa475-2.patch"
Content-Disposition: attachment; filename="xsa475-2.patch"
Content-Transfer-Encoding: base64

RnJvbTogVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+ClN1
YmplY3Q6IHg4Ni92aXJpZGlhbjogRW5mb3JjZSBib3VuZHMgY2hlY2sgaW4g
c2VuZF9pcGkoKQoKQ2FsbGVycyBjYW4gcGFzcyBpbiBhIHZwbWFzayB3aGlj
aCBleGNlZWRzIGQtPm1heF92Y3B1cy4gIFByZXZlbnQgb3V0LW9mLWJvdW5k
CnJlYWRzIG9mIGQtPnZjcHVbXS4KClRoaXMgaXMgWFNBLTQ3NSAvIENWRS0y
MDI1LTU4MTQ4LgoKRml4ZXM6IDcyOGFjYmExYmE0YSAoInZpcmlkaWFuOiB1
c2UgaHlwZXJjYWxsX3ZwbWFzayBpbiBodmNhbGxfaXBpKCkiKQpTaWduZWQt
b2ZmLWJ5OiBUZWRkeSBBc3RpZSA8dGVkZHkuYXN0aWVAdmF0ZXMudGVjaD4K
UmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92aXJp
ZGlhbi92aXJpZGlhbi5jIGIveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi92
aXJpZGlhbi5jCmluZGV4IDcwM2Y5YWM4YmNjMS4uZjc5Y2ZmY2IzNzY3IDEw
MDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3ZpcmlkaWFu
LmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi92aXJpZGlhbi5j
CkBAIC01NzcsMjYgKzU3Nyw2IEBAIHN0YXRpYyB2b2lkIHZwbWFza19maWxs
KHN0cnVjdCBoeXBlcmNhbGxfdnBtYXNrICp2cG1hc2spCiAgICAgYml0bWFw
X2ZpbGwodnBtYXNrLT5tYXNrLCBIVk1fTUFYX1ZDUFVTKTsKIH0KIAotc3Rh
dGljIHVuc2lnbmVkIGludCB2cG1hc2tfZmlyc3QoY29uc3Qgc3RydWN0IGh5
cGVyY2FsbF92cG1hc2sgKnZwbWFzaykKLXsKLSAgICByZXR1cm4gZmluZF9m
aXJzdF9iaXQodnBtYXNrLT5tYXNrLCBIVk1fTUFYX1ZDUFVTKTsKLX0KLQot
c3RhdGljIHVuc2lnbmVkIGludCB2cG1hc2tfbmV4dChjb25zdCBzdHJ1Y3Qg
aHlwZXJjYWxsX3ZwbWFzayAqdnBtYXNrLAotICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgdnApCi17Ci0gICAgLyoKLSAg
ICAgKiBJZiB2cCArIDEgPiBIVk1fTUFYX1ZDUFVTIHRoZW4gZmluZF9uZXh0
X2JpdCgpIHdpbGwgcmV0dXJuCi0gICAgICogSFZNX01BWF9WQ1BVUywgZW5z
dXJpbmcgdGhlIGZvcl9lYWNoX3ZwICggLi4uICkgbG9vcCB0ZXJtaW5hdGVz
LgotICAgICAqLwotICAgIHJldHVybiBmaW5kX25leHRfYml0KHZwbWFzay0+
bWFzaywgSFZNX01BWF9WQ1BVUywgdnAgKyAxKTsKLX0KLQotI2RlZmluZSBm
b3JfZWFjaF92cCh2cG1hc2ssIHZwKSBcCi0JZm9yICggKHZwKSA9IHZwbWFz
a19maXJzdCh2cG1hc2spOyBcCi0JICAgICAgKHZwKSA8IEhWTV9NQVhfVkNQ
VVM7IFwKLQkgICAgICAodnApID0gdnBtYXNrX25leHQodnBtYXNrLCB2cCkg
KQotCiBzdGF0aWMgdW5zaWduZWQgaW50IHZwbWFza19ucihjb25zdCBzdHJ1
Y3QgaHlwZXJjYWxsX3ZwbWFzayAqdnBtYXNrKQogewogICAgIHJldHVybiBi
aXRtYXBfd2VpZ2h0KHZwbWFzay0+bWFzaywgSFZNX01BWF9WQ1BVUyk7CkBA
IC04MTMsNyArNzkzLDcgQEAgc3RhdGljIHZvaWQgc2VuZF9pcGkoc3RydWN0
IGh5cGVyY2FsbF92cG1hc2sgKnZwbWFzaywgdWludDhfdCB2ZWN0b3IpCiAg
ICAgaWYgKCBuciA+IDEgKQogICAgICAgICBjcHVfcmFpc2Vfc29mdGlycV9i
YXRjaF9iZWdpbigpOwogCi0gICAgZm9yX2VhY2hfdnAgKCB2cG1hc2ssIHZw
ICkKKyAgICBiaXRtYXBfZm9yX2VhY2ggKCB2cCwgdnBtYXNrLT5tYXNrLCBj
dXJyZC0+bWF4X3ZjcHVzICkKICAgICB7CiAgICAgICAgIHN0cnVjdCB2bGFw
aWMgKnZsYXBpYyA9IHZjcHVfdmxhcGljKGN1cnJkLT52Y3B1W3ZwXSk7CiAK

--=separator
Content-Type: application/octet-stream; name="xsa475-4.19-1.patch"
Content-Disposition: attachment; filename="xsa475-4.19-1.patch"
Content-Transfer-Encoding: base64

RnJvbTogVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+ClN1
YmplY3Q6IHg4Ni92aXJpZGlhbjogRW5mb3JjZSBib3VuZHMgY2hlY2sgaW4g
dnBtYXNrX3NldCgpCgpDYWxsZXJzIGNhbiBwYXNzIHZwL21hc2sgdmFsdWVz
IHdoaWNoIGV4Y2VlZCB0aGUgc2l6ZSBvZiB2cG1hc2stPm1hc2suICBFbnN1
cmUKd2Ugb25seSBzZXQgYml0cyB3aGljaCBhcmUgd2l0aGluIGJvdW5kcy4K
ClRoaXMgaXMgWFNBLTQ3NSAvIENWRS0yMDI1LTU4MTQ3LgoKRml4ZXM6IGI0
MTI0NjgyZGI2ZSAoInZpcmlkaWFuOiBhZGQgRXhQcm9jZXNzb3JNYXNrcyB2
YXJpYW50cyBvZiB0aGUgZmx1c2ggaHlwZXJjYWxscyIpClNpZ25lZC1vZmYt
Ynk6IFRlZGR5IEFzdGllIDx0ZWRkeS5hc3RpZUB2YXRlcy50ZWNoPgpSZXZp
ZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFu
L3ZpcmlkaWFuLmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3Zpcmlk
aWFuLmMKaW5kZXggYTQxYTcwZTM3YTI5Li40MWU5M2VmMjBmYjIgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdmlyaWRpYW4uYwor
KysgYi94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3ZpcmlkaWFuLmMKQEAg
LTU2Miw3ICs1NjIsOCBAQCBzdGF0aWMgdm9pZCB2cG1hc2tfc2V0KHN0cnVj
dCBoeXBlcmNhbGxfdnBtYXNrICp2cG1hc2ssIHVuc2lnbmVkIGludCB2cCwK
IAogICAgICAgICBpZiAoIG1hc2sgJiAxICkKICAgICAgICAgewotICAgICAg
ICAgICAgQVNTRVJUKHZwIDwgSFZNX01BWF9WQ1BVUyk7CisgICAgICAgICAg
ICBpZiAoIHZwID49IEhWTV9NQVhfVkNQVVMgKQorICAgICAgICAgICAgICAg
IGJyZWFrOwogICAgICAgICAgICAgX19zZXRfYml0KHZwLCB2cG1hc2stPm1h
c2spOwogICAgICAgICB9CiAK

--=separator
Content-Type: application/octet-stream; name="xsa475-4.19-2.patch"
Content-Disposition: attachment; filename="xsa475-4.19-2.patch"
Content-Transfer-Encoding: base64

RnJvbTogVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+ClN1
YmplY3Q6IHg4Ni92aXJpZGlhbjogRW5mb3JjZSBib3VuZHMgY2hlY2sgaW4g
c2VuZF9pcGkoKQoKQ2FsbGVycyBjYW4gcGFzcyBpbiBhIHZwbWFzayB3aGlj
aCBleGNlZWRzIGQtPm1heF92Y3B1cy4gIFByZXZlbnQgb3V0LW9mLWJvdW5k
CnJlYWRzIG9mIGQtPnZjcHVbXS4KClRoaXMgaXMgWFNBLTQ3NSAvIENWRS0y
MDI1LTU4MTQ4LgoKRml4ZXM6IDcyOGFjYmExYmE0YSAoInZpcmlkaWFuOiB1
c2UgaHlwZXJjYWxsX3ZwbWFzayBpbiBodmNhbGxfaXBpKCkiKQpTaWduZWQt
b2ZmLWJ5OiBUZWRkeSBBc3RpZSA8dGVkZHkuYXN0aWVAdmF0ZXMudGVjaD4K
UmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92aXJp
ZGlhbi92aXJpZGlhbi5jIGIveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi92
aXJpZGlhbi5jCmluZGV4IDQxZTkzZWYyMGZiMi4uZDQ1NzUxMzY1ZmRlIDEw
MDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3ZpcmlkaWFu
LmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi92aXJpZGlhbi5j
CkBAIC01NzcsMjYgKzU3Nyw2IEBAIHN0YXRpYyB2b2lkIHZwbWFza19maWxs
KHN0cnVjdCBoeXBlcmNhbGxfdnBtYXNrICp2cG1hc2spCiAgICAgYml0bWFw
X2ZpbGwodnBtYXNrLT5tYXNrLCBIVk1fTUFYX1ZDUFVTKTsKIH0KIAotc3Rh
dGljIHVuc2lnbmVkIGludCB2cG1hc2tfZmlyc3QoY29uc3Qgc3RydWN0IGh5
cGVyY2FsbF92cG1hc2sgKnZwbWFzaykKLXsKLSAgICByZXR1cm4gZmluZF9m
aXJzdF9iaXQodnBtYXNrLT5tYXNrLCBIVk1fTUFYX1ZDUFVTKTsKLX0KLQot
c3RhdGljIHVuc2lnbmVkIGludCB2cG1hc2tfbmV4dChjb25zdCBzdHJ1Y3Qg
aHlwZXJjYWxsX3ZwbWFzayAqdnBtYXNrLAotICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgdnApCi17Ci0gICAgLyoKLSAg
ICAgKiBJZiB2cCArIDEgPiBIVk1fTUFYX1ZDUFVTIHRoZW4gZmluZF9uZXh0
X2JpdCgpIHdpbGwgcmV0dXJuCi0gICAgICogSFZNX01BWF9WQ1BVUywgZW5z
dXJpbmcgdGhlIGZvcl9lYWNoX3ZwICggLi4uICkgbG9vcCB0ZXJtaW5hdGVz
LgotICAgICAqLwotICAgIHJldHVybiBmaW5kX25leHRfYml0KHZwbWFzay0+
bWFzaywgSFZNX01BWF9WQ1BVUywgdnAgKyAxKTsKLX0KLQotI2RlZmluZSBm
b3JfZWFjaF92cCh2cG1hc2ssIHZwKSBcCi0JZm9yICggKHZwKSA9IHZwbWFz
a19maXJzdCh2cG1hc2spOyBcCi0JICAgICAgKHZwKSA8IEhWTV9NQVhfVkNQ
VVM7IFwKLQkgICAgICAodnApID0gdnBtYXNrX25leHQodnBtYXNrLCB2cCkg
KQotCiBzdGF0aWMgdW5zaWduZWQgaW50IHZwbWFza19ucihjb25zdCBzdHJ1
Y3QgaHlwZXJjYWxsX3ZwbWFzayAqdnBtYXNrKQogewogICAgIHJldHVybiBi
aXRtYXBfd2VpZ2h0KHZwbWFzay0+bWFzaywgSFZNX01BWF9WQ1BVUyk7CkBA
IC04MTMsNyArNzkzLDcgQEAgc3RhdGljIHZvaWQgc2VuZF9pcGkoc3RydWN0
IGh5cGVyY2FsbF92cG1hc2sgKnZwbWFzaywgdWludDhfdCB2ZWN0b3IpCiAg
ICAgaWYgKCBuciA+IDEgKQogICAgICAgICBjcHVfcmFpc2Vfc29mdGlycV9i
YXRjaF9iZWdpbigpOwogCi0gICAgZm9yX2VhY2hfdnAgKCB2cG1hc2ssIHZw
ICkKKyAgICBmb3JfZWFjaF9zZXRfYml0ICggdnAsIHZwbWFzay0+bWFzaywg
Y3VycmQtPm1heF92Y3B1cyApCiAgICAgewogICAgICAgICBzdHJ1Y3Qgdmxh
cGljICp2bGFwaWMgPSB2Y3B1X3ZsYXBpYyhjdXJyZC0+dmNwdVt2cF0pOwog
Cg==

--=separator--

