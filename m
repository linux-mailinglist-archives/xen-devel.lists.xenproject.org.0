Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B03449B380
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 13:06:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260148.449478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCKZc-0007mY-AS; Tue, 25 Jan 2022 12:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260148.449478; Tue, 25 Jan 2022 12:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCKZc-0007jf-52; Tue, 25 Jan 2022 12:05:20 +0000
Received: by outflank-mailman (input) for mailman id 260148;
 Tue, 25 Jan 2022 12:05:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jkQr=SJ=xenbits.xen.org=julieng@srs-se1.protection.inumbo.net>)
 id 1nCKZa-0006BM-A1
 for xen-devel@lists.xen.org; Tue, 25 Jan 2022 12:05:18 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bf4ba89-7dd7-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 13:05:13 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1nCKZL-0004le-52; Tue, 25 Jan 2022 12:05:03 +0000
Received: from julieng by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1nCKZL-0003VD-3e; Tue, 25 Jan 2022 12:05:03 +0000
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
X-Inumbo-ID: 0bf4ba89-7dd7-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=VmWNriyLFTfh/JVHKywpt4uT0cVmAH/APAeCVQbFqMY=; b=hz90k1v8QUUKTW/XFAOfDgI4Uu
	bgzM72nUMBiO1rv9abWUONjbjiWVCXSsfMMvlfM7N/zCKYQLb67nHx/1oHq9/S+l1zbFIpcmEza3V
	Gi4HvGtwJSb//kS4ALnw18cZ/Ag+Zv44Ns2pEAHol5s+cNgB4L7xfqAN2L0Eg/7gQdvA=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 394 v3 (CVE-2022-23034) - A PV guest could
 DoS Xen while unmapping a grant
Message-Id: <E1nCKZL-0003VD-3e@xenbits.xenproject.org>
Date: Tue, 25 Jan 2022 12:05:03 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2022-23034 / XSA-394
                               version 3

           A PV guest could DoS Xen while unmapping a grant

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

To address XSA-380, reference counting was introduced for grant
mappings for the case where a PV guest would have the IOMMU enabled. PV
guests can request two forms of mappings.  When both are in use for any
individual mapping, unmapping of such a mapping can be requested in two
steps.  The reference count for such a mapping would then mistakenly be
decremented twice.  Underflow of the counters gets detected, resulting
in the triggering of a hypervisor bug check.

IMPACT
======

Malicious guest kernels may be able to mount a Denial of Service (DoS)
attack affecting the entire system.

VULNERABLE SYSTEMS
==================

All Xen versions from at least 3.2 onwards are vulnerable in principle,
if they have the XSA-380 fixes applied.

Only x86 systems are vulnerable.  Arm systems are not vulnerable.

Only x86 PV guests with access to PCI devices can leverage the
vulnerability.  x86 HVM and PVH guests, as well as PV guests without
access to PCI devices, cannot leverage the vulnerability.

Additionally from Xen 4.13 onwards x86 PV guests can leverage this
vulnerability only when being granted access to pages owned by another
domain.

MITIGATION
==========

Not running PV guests will avoid the vulnerability.

For Xen 4.12 and older not passing through PCI devices to PV guests will
avoid the vulnerability.

For Xen 4.13 and newer not enabling PCI device pass-through for PV
guests will avoid the vulnerability.  This can be achieved via omitting
any "passthrough=..." and "pci=..." settings from xl guest configuration
files, or by setting "passthrough=disabled" there.

- From Xen 4.13 onwards, XSM SILO can be available as a security policy
designed to permit guests to only be able to communicate with Dom0.
Dom0 does not normally offer its pages for guests to map, which means
the use of SILO mode normally mitigates the vulnerability.

CREDITS
=======

This issue was discovered by Julien Grall of Amazon.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa394.patch           xen-unstable - Xen 4.13.x
xsa394-4.12.patch      Xen 4.12.x

$ sha256sum xsa394*
93f4d3b58d49ba239115753c9905b7c3720b438c48ef8fb701f15081aa317159  xsa394.meta
f2a3420e8d3eb1cf728f90d3c352ace0d3c67f7933201ce9b784d63afaeaa179  xsa394.patch
ee93797546ac9e82f98211366f9acc733332b0d5ab7ef73840c2acd2bb1439ca  xsa394-4.12.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches described above (or others which are
substantially similar) is permitted during the embargo, even on public-
facing systems with untrusted guest users and administrators.

HOWEVER, deployment of the mitigations described above is NOT permitted
during the embargo on public-facing systems with untrusted guest users
and administrators.  This is because such a configuration change is
recognizable by the affected guests.

AND: Distribution of updated software is prohibited (except to other
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmHv39IMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZfCYH/iZn73/JRTKI7B+9v2fW6v/k1IcVhpu+N4+TuRhh
Al5igmiTJLU3LcHM/H2KScgtnSwEKfCyddY1Gt3MZ+5lBDwR8elRkPdqn+P7xfol
4D5NgnEJDAYUWwJZOFn0qWfqNDnDkAvuKpm1zmv8RE0Xmw6a74Fvbfvi8PCuN9CO
zdippi5r5FlzFU7Q5MoWmOhmvVe3Fg7tGs4GXIyVUYkpDYyBGEWBo6rcoQ5aDvir
g8T0P1Y8XKCVvYM9SOdKWENppam0uIh00Mm+QDjQNaXD4I3DCDXLXkT7OGImZglr
MW8z5iNFjd0iXxFqTVBe1omxUhLC1xcB1fNySjd3zpt3RfA=
=mIA+
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa394.meta"
Content-Disposition: attachment; filename="xsa394.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzOTQsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNiIsCiAgICAiNC4xNSIsCiAgICAiNC4xNCIs
CiAgICAiNC4xMyIsCiAgICAiNC4xMiIKICBdLAogICJUcmVlcyI6IFsKICAg
ICJ4ZW4iCiAgXSwKICAiUmVjaXBlcyI6IHsKICAgICI0LjEyIjogewogICAg
ICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0
YWJsZVJlZiI6ICJiOWFhMTYzNWIzOGE3YmMwOTJkNjAxMjNiODdjNTQ1ZjI1
ZGIzMWU0IiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAz
OTMKICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAg
ICAgICAgInhzYTM5NC00LjEyLnBhdGNoIgogICAgICAgICAgXQogICAgICAg
IH0KICAgICAgfQogICAgfSwKICAgICI0LjEzIjogewogICAgICAiUmVjaXBl
cyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6
ICJkMGUyYzI3NjJiOTgxYWJkOTg0YWY2NmE4NDRhYzEyZDhiZjhmODEzIiwK
ICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAzOTMKICAgICAg
ICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhz
YTM5NC5wYXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAg
IH0sCiAgICAiNC4xNCI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAg
InhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiY2JhZGY2N2JjYWI0
ZTI5Yzg4MzQxMGRiMzkzZjRmNWVmMzRkZjA0YSIsCiAgICAgICAgICAiUHJl
cmVxcyI6IFsKICAgICAgICAgICAgMzkzCiAgICAgICAgICBdLAogICAgICAg
ICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EzOTQucGF0Y2giCiAg
ICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQuMTUi
OiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAg
ICAgICAiU3RhYmxlUmVmIjogImFiYTIyYzY3ZWZlNDQwNGEyYTg0ZTM3OGJm
ZDk4ZGVmNWVjOGU2NDciLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAg
ICAgICAgIDM5MwogICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjog
WwogICAgICAgICAgICAieHNhMzk0LnBhdGNoIgogICAgICAgICAgXQogICAg
ICAgIH0KICAgICAgfQogICAgfSwKICAgICI0LjE2IjogewogICAgICAiUmVj
aXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJl
ZiI6ICJkMGQwYWY2N2VlZGU1NjBmYWFiNThmMTYxZDk2MDhhNjljNzc5ZDQx
IiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAzOTMKICAg
ICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAg
InhzYTM5NC5wYXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0K
ICAgIH0sCiAgICAibWFzdGVyIjogewogICAgICAiUmVjaXBlcyI6IHsKICAg
ICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICIzMWYzYmM5
N2Y0NTA4Njg3MjE1ZTQ1OWE1ZTM1Njc2ZWVjZjE3NzJiIiwKICAgICAgICAg
ICJQcmVyZXFzIjogWwogICAgICAgICAgICAzOTMKICAgICAgICAgIF0sCiAg
ICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTM5NC5wYXRj
aCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0KICB9Cn0=

--=separator
Content-Type: application/octet-stream; name="xsa394.patch"
Content-Disposition: attachment; filename="xsa394.patch"
Content-Transfer-Encoding: base64

RnJvbSBhOGJkZWU3YTMwZDBjZDEzMzQxZDJjYTE3NTM1NjliMTcxZGFmNWI4
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWxpZW4gR3JhbGwg
PGpncmFsbEBhbWF6b24uY29tPgpEYXRlOiBGcmksIDE5IE5vdiAyMDIxIDEx
OjI3OjQ3ICswMDAwClN1YmplY3Q6IFtQQVRDSF0geGVuL2dyYW50LXRhYmxl
OiBPbmx5IGRlY3JlbWVudCB0aGUgcmVmY291bnRlciB3aGVuIGdyYW50IGlz
CiBmdWxseSB1bm1hcHBlZAoKVGhlIGdyYW50IHVubWFwcGluZyBoeXBlcmNh
bGwgKEdOVFRBQk9QX3VubWFwX2dyYW50X3JlZikgaXMgbm90IGEKc2ltcGxl
IHJldmVydCBvZiB0aGUgY2hhbmdlcyBkb25lIGJ5IHRoZSBncmFudCBtYXBw
aW5nIGh5cGVyY2FsbAooR05UVEFCT1BfbWFwX2dyYW50X3JlZikuCgpJbnN0
ZWFkLCBpdCBpcyBwb3NzaWJsZSB0byBwYXJ0aWFsbHkgKG9yIGV2ZW4gbm90
KSBjbGVhciBzb21lIGZsYWdzLgpUaGlzIHdpbGwgbGVhdmUgdGhlIGdyYW50
IGlzIG1hcHBlZCB1bnRpbCBhIGZ1dHVyZSBjYWxsIHdoZXJlIGFsbAp0aGUg
ZmxhZ3Mgd291bGQgYmUgY2xlYXJlZC4KClhTQS0zODAgaW50cm9kdWNlZCBh
IHJlZmNvdW50aW5nIHRoYXQgaXMgbWVhbnQgdG8gb25seSBiZSBkcm9wcGVk
CndoZW4gdGhlIGdyYW50IGlzIGZ1bGx5IHVubWFwcGVkLiBVbmZvcnR1bmF0
ZWx5LCB1bm1hcF9jb21tb24oKSB3aWxsCmRlY3JlbWVudCB0aGUgcmVmY291
bnQgZm9yIGV2ZXJ5IHN1Y2Nlc3NmdWwgY2FsbC4KCkEgY29uc2VxdWVuY2Ug
aXMgYSBkb21haW4gd291bGQgYmUgYWJsZSB0byB1bmRlcmZsb3cgdGhlIHJl
ZmNvdW50CmFuZCB0cmlnZ2VyIGEgQlVHKCkuCgpMb29raW5nIGF0IHRoZSBj
b2RlLCBpdCBpcyBub3QgY2xlYXIgdG8gbWUgd2h5IGEgZG9tYWluIHdvdWxk
CndhbnQgdG8gcGFydGlhbGx5IGNsZWFyIHNvbWUgZmxhZ3MgaW4gdGhlIGdy
YW50LXRhYmxlLiBCdXQgYXMKdGhpcyBpcyBwYXJ0IG9mIHRoZSBBQkksIGl0
IGlzIGJldHRlciB0byBub3QgY2hhbmdlIHRoZSBiZWhhdmlvcgpmb3Igbm93
LgoKRml4IGl0IGJ5IGNoZWNraW5nIGlmIHRoZSBtYXB0cmFjayBoYW5kbGUg
aGFzIGJlZW4gcmVsZWFzZWQgYmVmb3JlCmRlY3JlbWVudGluZyB0aGUgcmVm
Y291bnRpbmcuCgpUaGlzIGlzIENWRS0yMDIyLTIzMDM0IC8gWFNBLTM5NC4K
CkZpeGVzOiA5NzgxYjUxZWZkZTIgKCJnbnR0YWI6IHJlcGxhY2UgbWFwa2lu
ZCgpIikKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1h
em9uLmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgfCAxMSAr
KysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2dyYW50
X3RhYmxlLmMgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKaW5kZXggMDI2
MmYyYzQ4YWY4Li5lZDFlMmZhYmNlYTYgMTAwNjQ0Ci0tLSBhL3hlbi9jb21t
b24vZ3JhbnRfdGFibGUuYworKysgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxl
LmMKQEAgLTE0ODgsOCArMTQ4OCwxNSBAQCB1bm1hcF9jb21tb24oCiAgICAg
aWYgKCBwdXRfaGFuZGxlICkKICAgICAgICAgcHV0X21hcHRyYWNrX2hhbmRs
ZShsZ3QsIG9wLT5oYW5kbGUpOwogCi0gICAgLyogU2VlIHRoZSByZXNwZWN0
aXZlIGNvbW1lbnQgaW4gbWFwX2dyYW50X3JlZigpLiAqLwotICAgIGlmICgg
cmMgPT0gR05UU1Rfb2theSAmJiBsZCAhPSByZCAmJiBnbnR0YWJfbmVlZF9p
b21tdV9tYXBwaW5nKGxkKSApCisgICAgLyoKKyAgICAgKiBtYXBfZ3JhbnRf
cmVmKCkgd2lsbCBvbmx5IGluY3JlbWVudCB0aGUgcmVmY291bnQgKGFuZCB1
cGRhdGUgdGhlCisgICAgICogSU9NTVUpIG9uY2UgcGVyIG1hcHBpbmcuIFNv
IHdlIG9ubHkgd2FudCB0byBkZWNyZW1lbnQgaXQgb25jZSB0aGUKKyAgICAg
KiBtYXB0cmFjayBoYW5kbGUgaGFzIGJlZW4gcHV0LCBhbG9uZ3NpZGUgdGhl
IGZ1cnRoZXIgSU9NTVUgdXBkYXRlLgorICAgICAqCisgICAgICogRm9yIHRo
ZSBzZWNvbmQgYW5kIHRoaXJkIGNoZWNrLCBzZWUgdGhlIHJlc3BlY3RpdmUg
Y29tbWVudCBpbgorICAgICAqIG1hcF9ncmFudF9yZWYoKS4KKyAgICAgKi8K
KyAgICBpZiAoIHB1dF9oYW5kbGUgJiYgbGQgIT0gcmQgJiYgZ250dGFiX25l
ZWRfaW9tbXVfbWFwcGluZyhsZCkgKQogICAgIHsKICAgICAgICAgdm9pZCAq
KnNsb3Q7CiAgICAgICAgIHVuaW9uIG1hcHRyYWNrX25vZGUgbm9kZTsKLS0g
CjIuMzIuMAoK

--=separator
Content-Type: application/octet-stream; name="xsa394-4.12.patch"
Content-Disposition: attachment; filename="xsa394-4.12.patch"
Content-Transfer-Encoding: base64

RnJvbSA2MDRmYjY5MWVlZTViYmViYTc3MDEyNjQ1MWQ4ODBiOTMyNTY1ZTY1
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWxpZW4gR3JhbGwg
PGpncmFsbEBhbWF6b24uY29tPgpEYXRlOiBXZWQsIDUgSmFuIDIwMjIgMTc6
NTU6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSB4ZW4vZ3JhbnQtdGFibGU6
IE9ubHkgZGVjcmVtZW50IHRoZSByZWZjb3VudGVyIHdoZW4gZ3JhbnQgaXMK
IGZ1bGx5IHVubWFwcGVkCgpUaGUgZ3JhbnQgdW5tYXBwaW5nIGh5cGVyY2Fs
bCAoR05UVEFCT1BfdW5tYXBfZ3JhbnRfcmVmKSBpcyBub3QgYQpzaW1wbGUg
cmV2ZXJ0IG9mIHRoZSBjaGFuZ2VzIGRvbmUgYnkgdGhlIGdyYW50IG1hcHBp
bmcgaHlwZXJjYWxsCihHTlRUQUJPUF9tYXBfZ3JhbnRfcmVmKS4KCkluc3Rl
YWQsIGl0IGlzIHBvc3NpYmxlIHRvIHBhcnRpYWxseSAob3IgZXZlbiBub3Qp
IGNsZWFyIHNvbWUgZmxhZ3MuClRoaXMgd2lsbCBsZWF2ZSB0aGUgZ3JhbnQg
aXMgbWFwcGVkIHVudGlsIGEgZnV0dXJlIGNhbGwgd2hlcmUgYWxsCnRoZSBm
bGFncyB3b3VsZCBiZSBjbGVhcmVkLgoKWFNBLTM4MCBpbnRyb2R1Y2VkIGEg
cmVmY291bnRpbmcgdGhhdCBpcyBtZWFudCB0byBvbmx5IGJlIGRyb3BwZWQK
d2hlbiB0aGUgZ3JhbnQgaXMgZnVsbHkgdW5tYXBwZWQuIFVuZm9ydHVuYXRl
bHksIHVubWFwX2NvbW1vbigpIHdpbGwKZGVjcmVtZW50IHRoZSByZWZjb3Vu
dCBmb3IgZXZlcnkgc3VjY2Vzc2Z1bCBjYWxsLgoKQSBjb25zZXF1ZW5jZSBp
cyBhIGRvbWFpbiB3b3VsZCBiZSBhYmxlIHRvIHVuZGVyZmxvdyB0aGUgcmVm
Y291bnQKYW5kIHRyaWdnZXIgYSBCVUcoKS4KCkxvb2tpbmcgYXQgdGhlIGNv
ZGUsIGl0IGlzIG5vdCBjbGVhciB0byBtZSB3aHkgYSBkb21haW4gd291bGQK
d2FudCB0byBwYXJ0aWFsbHkgY2xlYXIgc29tZSBmbGFncyBpbiB0aGUgZ3Jh
bnQtdGFibGUuIEJ1dCBhcwp0aGlzIGlzIHBhcnQgb2YgdGhlIEFCSSwgaXQg
aXMgYmV0dGVyIHRvIG5vdCBjaGFuZ2UgdGhlIGJlaGF2aW9yCmZvciBub3cu
CgpGaXggaXQgYnkgY2hlY2tpbmcgaWYgdGhlIG1hcHRyYWNrIGhhbmRsZSBo
YXMgYmVlbiByZWxlYXNlZCBiZWZvcmUKZGVjcmVtZW50aW5nIHRoZSByZWZj
b3VudGluZy4KClRoaXMgaXMgQ1ZFLTIwMjItMjMwMzQgLyBYU0EtMzk0LgoK
Rml4ZXM6IDk3ODFiNTFlZmRlMiAoImdudHRhYjogcmVwbGFjZSBtYXBraW5k
KCkiKQpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6
b24uY29tPgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgotLS0KIHhlbi9jb21tb24vZ3JhbnRfdGFibGUuYyB8IDcgKysr
KysrLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUu
YyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwppbmRleCBlZTU3NDhlNzRl
YjkuLjYxZDI5ZGY3YmRmNiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9ncmFu
dF90YWJsZS5jCisrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwpAQCAt
MTQwMiw3ICsxNDAyLDEyIEBAIHVubWFwX2NvbW1vbigKICAgICBpZiAoIHB1
dF9oYW5kbGUgKQogICAgICAgICBwdXRfbWFwdHJhY2tfaGFuZGxlKGxndCwg
b3AtPmhhbmRsZSk7CiAKLSAgICBpZiAoIHJjID09IEdOVFNUX29rYXkgJiYg
Z250dGFiX25lZWRfaW9tbXVfbWFwcGluZyhsZCkgKQorICAgIC8qCisgICAg
ICogbWFwX2dyYW50X3JlZigpIHdpbGwgb25seSBpbmNyZW1lbnQgdGhlIHJl
ZmNvdW50IChhbmQgdXBkYXRlIHRoZQorICAgICAqIElPTU1VKSBvbmNlIHBl
ciBtYXBwaW5nLiBTbyB3ZSBvbmx5IHdhbnQgdG8gZGVjcmVtZW50IGl0IG9u
Y2UgdGhlCisgICAgICogbWFwdHJhY2sgaGFuZGxlIGhhcyBiZWVuIHB1dCwg
YWxvbmdzaWRlIHRoZSBmdXJ0aGVyIElPTU1VIHVwZGF0ZS4KKyAgICAgKi8K
KyAgICBpZiAoIHB1dF9oYW5kbGUgJiYgZ250dGFiX25lZWRfaW9tbXVfbWFw
cGluZyhsZCkgKQogICAgIHsKICAgICAgICAgdm9pZCAqKnNsb3Q7CiAgICAg
ICAgIHVuaW9uIG1hcHRyYWNrX25vZGUgbm9kZTsKLS0gCjIuMzIuMAoK

--=separator--

