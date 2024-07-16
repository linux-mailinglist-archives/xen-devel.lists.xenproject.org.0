Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA1A932612
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 14:01:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759480.1169222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTgrE-0005Oa-OM; Tue, 16 Jul 2024 12:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759480.1169222; Tue, 16 Jul 2024 12:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTgrE-0005Jy-Jr; Tue, 16 Jul 2024 12:00:36 +0000
Received: by outflank-mailman (input) for mailman id 759480;
 Tue, 16 Jul 2024 12:00:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P7YT=OQ=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1sTgrC-0004Jo-Tw
 for xen-devel@lists.xen.org; Tue, 16 Jul 2024 12:00:35 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0036d869-436b-11ef-bbfb-fd08da9f4363;
 Tue, 16 Jul 2024 14:00:33 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1sTgr3-0004pq-UW; Tue, 16 Jul 2024 12:00:25 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1sTgr3-0008Me-ST; Tue, 16 Jul 2024 12:00:25 +0000
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
X-Inumbo-ID: 0036d869-436b-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=M5rB02SLJZDbI6JKq9D+ODSGiMLDb9EDbXXqElGskSo=; b=RLZ9FDiTbdivvZl4Q04OQW9ZRd
	qitPBCwMcpo98HyFB8JMZX09Ivam+cOopWS3d6ebG1O0uvrUZNXqIKYOmlQFSAPIdTbJ3Gp3uL4dZ
	dd42pF6yL7Lgp/vY/1LO3p+x8mhPkQEUMvmqfKJahW0Go8EVeSfo+WKGFWPNu69u/HkQ=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 459 v2 (CVE-2024-31144) - Xapi: Metadata
 injection attack against backup/restore functionality
Message-Id: <E1sTgr3-0008Me-ST@xenbits.xenproject.org>
Date: Tue, 16 Jul 2024 12:00:25 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2024-31144 / XSA-459
                               version 2

  Xapi: Metadata injection attack against backup/restore functionality

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

For a brief summary of Xapi terminology, see:

  https://xapi-project.github.io/xen-api/overview.html#object-model-overview

Xapi contains functionality to backup and restore metadata about Virtual
Machines and Storage Repositories (SRs).

The metadata itself is stored in a Virtual Disk Image (VDI) inside an
SR.  This is used for two purposes; a general backup of metadata
(e.g. to recover from a host failure if the filer is still good), and
Portable SRs (e.g. using an external hard drive to move VMs to another
host).

Metadata is only restored as an explicit administrator action, but
occurs in cases where the host has no information about the SR, and must
locate the metadata VDI in order to retrieve the metadata.

The metadata VDI is located by searching (in UUID alphanumeric order)
each VDI, mounting it, and seeing if there is a suitable metadata file
present.  The first matching VDI is deemed to be the metadata VDI, and
is restored from.

In the general case, the content of VDIs are controlled by the VM owner,
and should not be trusted by the host administrator.

A malicious guest can manipulate its disk to appear to be a metadata
backup.

A guest cannot choose the UUIDs of its VDIs, but a guest with one disk
has a 50% chance of sorting ahead of the legitimate metadata backup.  A
guest with two disks has a 75% chance, etc.

IMPACT
======

If a fraudulent metadata backup has been written into an SR which also
contains a legitimate metadata backup, and an administrator explicitly
chooses to restore from backup, the fraudulent metadata might be
consumed instead of the legitimate metadata.

Control over meta data includes: which VMs are created, disk assignment,
vCPU/RAM requirements, GPU allocation, etc.

VULNERABLE SYSTEMS
==================

Systems running Xapi v1.249.x are affected.

Systems running Xapi v24.x are potentially affected.  However it is
believed that the only supported products using this version of Xapi
have not shipped the metadata backup/restore functionality.

To leverage the vulnerability, an attacker would likely need insider
information to construct a plausible-looking metadata backup, and would
have to persuade a real administrator to perform a data-recovery action.

MITIGATION
==========

Not using the metadata restore functionality avoids the vulnerability.

CREDITS
=======

This issue was discovered by XenServer.

RESOLUTION
==========

The attached patches resolve the issue for Xapi v1.249.x releases.

xsa459-xen-api.patch (based on v1.249.37) causes all new metadata VDIs
to be created with a deterministic UUID, and restore functionality to use
that UUID only; not to search all disks to find the metadata.

After installing the updated Xapi, a new metadata backup should be
taken, to create a VDI with the new deterministic UUID.

The ability to restore from an old backup VDI is retained, but the
administrator is required to specify the exact VDI to use, so as to
avoid searching the SR.

Because xsa459-xen-api.patch alters the behaviour of the
xe-{backup,restore}-metadata scripts, a companion patch
xsa459-xsconsole.patch (based on v10.1.13.1) is needed to keep the
pre-existing menu options working, and to ask for user conformation if
needing to restore from a prior backup.

Note: some work was carried out in public on this issue before the
security implications were understood.  These changes are present in
xen-api.git and tagged as v1.249.37, which is used as the base for this
patch.

$ sha256sum xsa459*
89dba36a1889a41fbf585a25432079d10991d9e9f3c2d9f93f285c11e17e02c3  xsa459-xen-api.patch
0fc4dabd3a84055644fe415f55d8a1148ad2c17aaa2f8b52889cb11800c612d2  xsa459-xsconsole.patch
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


(Note: this during-embargo deployment notice is retained in
post-embargo publicly released Xen Project advisories, even though it
is then no longer applicable.  This is to enable the community to have
oversight of the Xen Project Security Team's decisionmaking.)

For more information about permissible uses of embargoed information,
consult the Xen Project community's agreed Security Policy:
  http://www.xenproject.org/security-policy.html
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmaWYLkMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZTwkIALcgQmF/UVzUfs54omUKi+E4woQmfEOPO1GNki5x
abjnmv7Nos7AJem6ytX2eLLcPvl7iEtFf8p+pYdXwjjyT+Gtg2+8E/k8m7b4Qx3u
ZoW0ID3LBNb0++Tc+DKJKuEOMg2/OINbcFqAQUWutzbz38QCMJ30JyAkZKU/UYmL
Hs/xb65PpI1khaZD/1ipjxCDP/XJIzV2l1vD23omb1TXiWhsdHtT9YKiypThECnA
/uBUyKHOC9+Tx1eYrG0H8am8t2MKoOQL0Lu2xWFJskrg2LHYkxk3he0OTKWcsVTz
OYs1ReZt1k9KSwpqsIq5uJj/HARUCm+fPmL126IB4q5tMQ4=
=9K9F
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa459-xen-api.patch"
Content-Disposition: attachment; filename="xsa459-xen-api.patch"
Content-Transfer-Encoding: base64

RnJvbSA2NjY0N2FmZmYzMDgwOGNkZTI5MzhiNzI2NGQzNDcyNzMyNWRkZTcw
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IEJyZXR0IDxh
bGV4LmJyZXR0QGNsb3VkLmNvbT4KRGF0ZTogVHVlLCA5IEp1bCAyMDI0IDE2
OjI0OjI4ICswMDAwClN1YmplY3Q6IFtQQVRDSF0gVXBkYXRlcyB0byBQb3J0
YWJsZSBTUiBGdW5jdGlvbmFsaXR5CgpBZGQgYSBuZXcgb3B0aW9uIGAtb2Ag
dG8geGUtcmVzdG9yZS1tZXRhZGF0YSwgd2hpY2ggaXMgdXNlZCB0byBkaXN0
aW5ndWlzaAp3aGV0aGVyIHRvIGFsbG93IHVzZSBvZiBsZWdhY3kgYmFja3Vw
IFZESXMsIG9yIGVuZm9yY2Ugb25seSB1c2Ugb2YgdGhlIG5ldwpmb3JtYXQg
VkRJcyB3aXRoIGtub3duIFVVSURzLgoKQWxzbyBtb2RpZnkgeGUtcmVzdG9y
ZS1tZXRhZGF0YSBzdWNoIHRoYXQgaXQgbm8gbG9uZ2VyIHN0b3BzIHNlYXJj
aGluZyB0aGUKY2FuZGlkYXRlIGxpc3QgaWYgb25seSBvbmUgVkRJIGlzIGZv
dW5kLCBidXQgaW5zdGVhZCBpZGVudGlmaWVzIGFsbCBwb3NzaWJsZQpiYWNr
dXAgVkRJcy4gSWYgbW9yZSB0aGFuIG9uZSBpcyBmb3VuZCwgYW5kIHlvdSBh
cmUgZG9pbmcgYW55dGhpbmcgb3RoZXIgdGhhbgpsaXN0aW5nIHRoZSBWRElz
LCB0aGUgc2NyaXB0IHdpbGwgYWJvcnQuIFRoaXMgaXMgdG8gY292ZXIgdGhl
IGNhc2Ugd2hlcmUgYQptYWxpY2lvdXMgbGVnYWN5IGZvcm1hdCBWREkgaXMg
cHJlc2VudCAtIHdlIHdpbGwgZGV0ZWN0IGl0IGFuZCB0aGUgZXhwZWN0ZWQK
J3JlYWwnIGJhY2t1cCBWREkuCgpNb2RpZnkgeGUtYmFja3VwLW1ldGFkYXRh
IHRvIGFsd2F5cyBleHBlY3QgdG8gdXNlIHRoZSBkZXRlcm1pbmlzdGljIFVV
SUQgdG8KaWRlbnRpZnkgdGhlIFZESSB0byBhZGQgYmFja3VwcyB0bywgZG8g
bm90IHJlbHkgb24gdGhlCmBvdGhlci1jb25maWc6Y3R4cy1wb29sLWJhY2t1
cGAgcHJvcGVydHkgZm9yIGlkZW50aWZpY2F0aW9uIGluIGFueSB3YXkuCgpU
aGlzLCB0b2dldGhlciB3aXRoIGNoYW5nZXMgaW4gdjEuMjQ5LjM3LCBpcyBY
U0EtNDU5IC8gQ1ZFLTIwMjQtMzExNDQKCkFsc28gZml4IHRoZSBmb2xsb3dp
bmcgaXNzdWVzIGludHJvZHVjZWQgd2l0aCBjaGFuZ2VzIGluIHYxLjI0OS4z
NzoKLSBJbmNvcnJlY3QgcGF0aCB0byBgeGVgIHdoZW4gY2FsbGluZyB2bS1p
bXBvcnQKLSBJc3N1ZXMgdXNpbmcgJ2RyeSBydW4nIGZ1bmN0aW9uYWxpdHkg
ZHVlIHRvIHNoZWxsIHF1b3RpbmcgY2hhbmdlcwoKU2lnbmVkLW9mZi1ieTog
QWxleCBCcmV0dCA8YWxleC5icmV0dEBjbG91ZC5jb20+Ci0tLQogc2NyaXB0
cy94ZS1iYWNrdXAtbWV0YWRhdGEgIHwgIDMyICstLS0tLS0KIHNjcmlwdHMv
eGUtcmVzdG9yZS1tZXRhZGF0YSB8IDE2NCArKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTExIGluc2Vy
dGlvbnMoKyksIDg1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Njcmlw
dHMveGUtYmFja3VwLW1ldGFkYXRhIGIvc2NyaXB0cy94ZS1iYWNrdXAtbWV0
YWRhdGEKaW5kZXggZDI1ZTBjY2ZhLi4xNDUyZmJhZjcgMTAwNzU1Ci0tLSBh
L3NjcmlwdHMveGUtYmFja3VwLW1ldGFkYXRhCisrKyBiL3NjcmlwdHMveGUt
YmFja3VwLW1ldGFkYXRhCkBAIC01NSwyMyArNTUsNiBAQCBmdW5jdGlvbiB1
dWlkNSB7CiAgIHB5dGhvbiAtYyAiaW1wb3J0IHV1aWQ7IHByaW50ICh1dWlk
LnV1aWQ1KHV1aWQuVVVJRCgnJDEnKSwgJyQyJykpIgogfQogCi1mdW5jdGlv
biB2YWxpZGF0ZV92ZGlfdXVpZCB7Ci0gICMgd2UgY2hlY2sgdGhhdCB2ZGkg
aGFzIHRoZSBleHBlY3RlZCBVVUlEIHdoaWNoIGRlcGVuZHMgb24gdGhlIFVV
SUQgb2YKLSAgIyB0aGUgU1IuIFRoaXMgaXMgYSBkZXRlcm1pbmlzdGljIGhh
c2ggb2YgdGhlIFNSIFVVSUQgYW5kIHRoZQotICAjIG5hbWVzcGFjZSBVVUlE
ICROUy4gVGhpcyBVVUlEIG11c3QgbWF0Y2ggd2hhdCBYYXBpJ3MgVXVpZHgg
bW9kdWxlIGlzIHVzaW5nLgotICBsb2NhbCBOUz0iZTkzZTA2MzktMmJkYi00
YTU5LThiNDYtMzUyYjNmNDA4YzE5IgotICBsb2NhbCBzcj0iJDEiCi0gIGxv
Y2FsIHZkaT0iJDIiCi0gIGxvY2FsIHV1aWQKLQotICB1dWlkPSQodXVpZDUg
IiROUyIgIiRzciIpCi0gIGlmIFsgIiR2ZGkiICE9ICIkdXVpZCIgXTsgdGhl
bgotICAgIHJldHVybiAxCi0gIGVsc2UKLSAgICByZXR1cm4gMAotICBmaQot
fQotCiBmdW5jdGlvbiB0ZXN0X3NyIHsKICAgc3JfdXVpZF9mb3VuZD0kKCR7
WEV9IHNyLWxpc3QgdXVpZD0iJDEiIC0tbWluaW1hbCkKICAgaWYgWyAiJHtz
cl91dWlkX2ZvdW5kfSIgIT0gIiQxIiBdOyB0aGVuCkBAIC0xMjAsOCArMTAz
LDggQEAgZmkKIHRlc3Rfc3IgIiR7c3JfdXVpZH0iCiAKIHNyX25hbWU9JCgk
e1hFfSBzci1wYXJhbS1nZXQgdXVpZD0iJHtzcl91dWlkfSIgcGFyYW0tbmFt
ZT1uYW1lLWxhYmVsKQotIyBzZWUgaWYgYSBiYWNrdXAgVkRJIGFscmVhZHkg
ZXhpc3RzIG9uIHRoZSBzZWxlY3RlZCBTUgotdmRpX3V1aWQ9JCgke1hFfSB2
ZGktbGlzdCBvdGhlci1jb25maWc6Y3R4cy1wb29sLWJhY2t1cD10cnVlIHNy
LXV1aWQ9IiR7c3JfdXVpZH0iIHBhcmFtcz11dWlkIC0tbWluaW1hbCkKKyMg
YXNzdW1lIHVzZSBvZiB0aGUgbmV3IGZvcm1hdCBwcmVkaWN0YWJsZSBVVUlE
Cit2ZGlfdXVpZD0kKCR7WEV9IHZkaS1saXN0IHV1aWQ9IiQodXVpZDUgImU5
M2UwNjM5LTJiZGItNGE1OS04YjQ2LTM1MmIzZjQwOGMxOSIgIiRzcl91dWlk
IikiIC0tbWluaW1hbCkKIAogbW50PQogZnVuY3Rpb24gY2xlYW51cCB7CkBA
IC0xNjAsMTcgKzE0Myw2IEBAIGZ1bmN0aW9uIGNsZWFudXAgewogICAgZmkK
IH0KIAotIyBpZiB3ZSBjYW4ndCB2YWxpZGF0ZSB0aGUgVVVJRCBvZiB0aGUg
VkRJLCBwcm9tcHQgdGhlIHVzZXIKLWlmIFsgLW4gIiR7dmRpX3V1aWR9IiBd
OyB0aGVuCi0gICAgaWYgISB2YWxpZGF0ZV92ZGlfdXVpZCAiJHtzcl91dWlk
fSIgIiR7dmRpX3V1aWR9IiAmJiBbICIkeWVzIiAtZXEgMCBdOyB0aGVuCi0g
ICAgICAgIGVjaG8gIkJhY2t1cCBWREkgJHZkaV91dWlkIHdhcyBtb3N0IGxp
a2xleSBjcmVhdGUgYnkgYW4gZWFybGllciIKLSAgICAgICAgZWNobyAidmVy
c2lvbiBvZiB0aGlzIGNvZGUuIE1ha2Ugc3VyZSB0aGlzIGlzIGEgVkRJIHRo
YXQgeW91IgotICAgICAgICBlY2hvICJjcmVhdGVkIGFzIHdlIGNhbid0IHZh
bGlkYXRlIGl0IHdpdGhvdXQgbW91bnRpbmcgaXQuIgotICAgICAgICByZWFk
IC1wICJDb250aW51ZT8gW1kvTl0iIC1uIDEgLXI7IGVjaG8KLSAgICAgICAg
aWYgW1sgISAkUkVQTFkgPX4gXltZeV0kIF1dOyB0aGVuIGV4aXQgMTsgZmkK
LSAgICBmaQotZmkKLQogZWNobyAiVXNpbmcgU1I6ICR7c3JfbmFtZX0iCiBp
ZiBbIC16ICIke3ZkaV91dWlkfSIgXTsgdGhlbgogICBpZiBbICIke2NyZWF0
ZV92ZGl9IiAtZ3QgMCBdOyB0aGVuCmRpZmYgLS1naXQgYS9zY3JpcHRzL3hl
LXJlc3RvcmUtbWV0YWRhdGEgYi9zY3JpcHRzL3hlLXJlc3RvcmUtbWV0YWRh
dGEKaW5kZXggOGM2Mjk5ZTljLi4xZjkyMWY3ZWUgMTAwNzU1Ci0tLSBhL3Nj
cmlwdHMveGUtcmVzdG9yZS1tZXRhZGF0YQorKysgYi9zY3JpcHRzL3hlLXJl
c3RvcmUtbWV0YWRhdGEKQEAgLTM1LDExICszNSwxMSBAQCBkZWZhdWx0X3Jl
c3RvcmVfbW9kZT0iYWxsIgogZGVidWc9Ii9iaW4vdHJ1ZSIKIAogZnVuY3Rp
b24gdXNhZ2UgewotICAgIGVjaG8gIlVzYWdlOiAkMCBbLWhdIFstdl0gWy15
XSBbLW5dIFstcF0gWy1mXSBbLXggPFZESSBVVUlEPl0gWy11IDxTUiBVVUlE
Pl0gWy1tIGFsbHxzcl0iCisgICAgZWNobyAiVXNhZ2U6ICQwIFstaF0gWy12
XSBbLXldIFstbl0gWy1wXSBbLWZdIFstb10gWy14IDxWREkgVVVJRD5dIFst
dSA8U1IgVVVJRD5dIFstbSBhbGx8c3JdIgogICAgIGVjaG8KICAgICBlY2hv
ICIgLWg6IERpc3BsYXkgdGhpcyBoZWxwIG1lc3NhZ2UiCiAgICAgZWNobyAi
IC14OiBTcGVjaWZ5IHRoZSBWREkgVVVJRCB0byBvdmVycmlkZSBwcm9iaW5n
IgotICAgIGVjaG8gIiAtcDogSnVzdCBzY2FuIGZvciBhIG1ldGFkYXRhIFZE
SSBhbmQgcHJpbnQgb3V0IGl0cyBVVUlEIHRvIHN0ZG91dCIKKyAgICBlY2hv
ICIgLXA6IEp1c3Qgc2NhbiBmb3IgbWV0YWRhdGEgVkRJKHMpIGFuZCBwcmlu
dCBvdXQgVVVJRChzKSB0byBzdGRvdXQiCiAgICAgZWNobyAiIC11OiBVVUlE
IG9mIHRoZSBTUiB5b3Ugd2lzaCB0byByZXN0b3JlIGZyb20iCiAgICAgZWNo
byAiIC1uOiBQZXJmb3JtIGEgZHJ5IHJ1biBvZiB0aGUgbWV0YWRhdGEgaW1w
b3J0IGNvbW1hbmRzIChkZWZhdWx0OiBmYWxzZSkiCiAgICAgZWNobyAiIC1s
OiBKdXN0IGxpc3QgdGhlIGF2YWlsYWJsZSBiYWNrdXAgZGF0ZXMiCkBAIC00
OCw2ICs0OCw3IEBAIGZ1bmN0aW9uIHVzYWdlIHsKICAgICBlY2hvICIgLXY6
IFZlcmJvc2Ugb3V0cHV0IgogICAgIGVjaG8gIiAteTogQXNzdW1lIG5vbi1p
bnRlcmFjdGl2ZSBtb2RlIGFuZCB5ZXMgdG8gYWxsIHF1ZXN0aW9ucyIKICAg
ICBlY2hvICIgLWY6IEZvcmNpYmx5IHJlc3RvcmUgVk0gbWV0YWRhdGEsIGRh
bmdlcm91cyBkdWUgdG8gaXRzIGRlc3RydWN0aXZlIG5hdHVyZSwgcGxlYXNl
IGFsd2F5cyBkbyBhIGRyeSBydW4gYmVmb3JlIHVzaW5nIHRoaXMgKGRlZmF1
bHQ6IGZhbHNlKSIKKyAgICBlY2hvICIgLW86IEFsbG93IHVzZSBvZiBsZWdh
Y3kgYmFja3VwIFZESXMgKHRoaXMgc2hvdWxkIG5vdCBiZSB1c2VkIHdpdGgg
U1JzIHdpdGggdW50cnVzdGVkIFZESXMpIgogICAgIGVjaG8gCiAgICAgZXhp
dCAxCiB9CkBAIC03NSw3ICs3Niw5IEBAIGp1c3RfcHJvYmU9MAogY2hvc2Vu
X2RhdGU9IiIKIHJlc3RvcmVfbW9kZT0ke2RlZmF1bHRfcmVzdG9yZV9tb2Rl
fQogZm9yY2U9MAotd2hpbGUgZ2V0b3B0cyAieWhwdng6ZDpsbnU6bTpmIiBv
cHQgOyBkbworbGVnYWN5PTAKK3NwZWNpZmllZF92ZGk9Cit3aGlsZSBnZXRv
cHRzICJ5aHB2eDpkOmxudTptOmZvIiBvcHQgOyBkbwogICAgIGNhc2UgJG9w
dCBpbgogICAgIGgpIHVzYWdlIDs7CiAgICAgdSkgc3JfdXVpZD0ke09QVEFS
R30gOzsKQEAgLTg1LDkgKzg4LDEwIEBAIHdoaWxlIGdldG9wdHMgInlocHZ4
OmQ6bG51Om06ZiIgb3B0IDsgZG8KICAgICB2KSBkZWJ1Zz0iIiA7OwogICAg
IGQpIGNob3Nlbl9kYXRlPSR7T1BUQVJHfSA7OwogICAgIG0pIHJlc3RvcmVf
bW9kZT0ke09QVEFSR30gOzsKLSAgICB4KSB2ZGlzPSR7T1BUQVJHfSA7Owor
ICAgIHgpIHNwZWNpZmllZF92ZGk9JHtPUFRBUkd9IDs7CiAgICAgeSkgeWVz
PTEgOzsKICAgICBmKSBmb3JjZT0xIDs7CisgICAgbykgbGVnYWN5PTEgOzsK
ICAgICAqKSBlY2hvICJJbnZhbGlkIG9wdGlvbiI7IHVzYWdlIDs7CiAgICAg
ZXNhYwogZG9uZQpAQCAtMTE4LDE2ICsxMjIsNzUgQEAgc3JfbmFtZT0kKCR7
WEV9IHNyLXBhcmFtLWdldCB1dWlkPSIke3NyX3V1aWR9IiBwYXJhbS1uYW1l
PW5hbWUtbGFiZWwpCiAjIHByb2JlIGZpcnN0IGZvciBhIFZESSB3aXRoIGtu
b3duIFVVSUQgZGVyaXZlZCBmcm9tIHRoZSBTUiB0byBhdm9pZAogIyBzY2Fu
bmluZyBmb3IgYSBWREkKIGJhY2t1cF92ZGk9JCh1dWlkNSAiJHtOU30iICIk
e3NyX3V1aWR9IikKLWlmIFsgLXogIiR7dmRpc30iIF07IHRoZW4KLSAgdmRp
cz0kKCR7WEV9IHZkaS1saXN0IHV1aWQ9IiR7YmFja3VwX3ZkaX0iIHNyLXV1
aWQ9IiR7c3JfdXVpZH0iIHJlYWQtb25seT1mYWxzZSAtLW1pbmltYWwpCisK
KyMgT25seSBhbGxvdyBhIHNwZWNpZmllZCBWREkgdGhhdCBkb2VzIG5vdCBt
YXRjaCB0aGUga25vd24gVVVJRCBpZiBvcGVyYXRpbmcgaW4KKyMgbGVnYWN5
IG1vZGUKK2lmIFsgLW4gIiR7c3BlY2lmaWVkX3ZkaX0iIF07IHRoZW4KKyAg
aWYgWyAiJHtzcGVjaWZpZWRfdmRpfSIgIT0gIiR7YmFja3VwX3ZkaX0iIF0g
JiYgWyAiJGxlZ2FjeSIgLWVxIDAgXTsgdGhlbgorICAgIGVjaG8gIlRoZSBz
cGVjaWZpZWQgVkRJIFVVSUQgaXMgbm90IHBlcm1pdHRlZCwgaWYgYXR0ZW1w
dGluZyB0byB1c2UgYSBsZWdhY3kgYmFja3VwIFZESSBwbGVhc2UgdXNlIHRo
ZSAtbyBmbGFnIiA+JjIKKyAgICBleGl0IDEKKyAgZmkKKyAgdmRpcz0ke3Nw
ZWNpZmllZF92ZGl9CiBmaQogCi0jIGdldCBhIGxpc3Qgb2YgYWxsIFZESXMg
aWYgYW4gb3ZlcnJpZGUgaGFzIG5vdCBiZWVuIHByb3ZpZGVkIG9uIHRoZSBj
bWQgbGluZQogaWYgWyAteiAiJHt2ZGlzfSIgXTsgdGhlbgotICB2ZGlzPSQo
JHtYRX0gdmRpLWxpc3QgcGFyYW1zPXV1aWQgc3ItdXVpZD0iJHtzcl91dWlk
fSIgcmVhZC1vbmx5PWZhbHNlIC0tbWluaW1hbCkKKyAgaWYgWyAiJGxlZ2Fj
eSIgLWVxIDAgXTsgdGhlbgorICAgICMgSW4gbm9uLWxlZ2FjeSBtb2RlLCBv
bmx5IHVzZSB0aGUga25vd24gYmFja3VwX3ZkaSBVVUlECisgICAgdmRpcz0k
KCR7WEV9IHZkaS1saXN0IHV1aWQ9IiR7YmFja3VwX3ZkaX0iIHNyLXV1aWQ9
IiR7c3JfdXVpZH0iIHJlYWQtb25seT1mYWxzZSAtLW1pbmltYWwpCisgIGVs
c2UKKyAgICAjIEluIGxlZ2FjeSBtb2RlLCBzY2FuIGFsbCBWRElzCisgICAg
dmRpcz0kKCR7WEV9IHZkaS1saXN0IHBhcmFtcz11dWlkIHNyLXV1aWQ9IiR7
c3JfdXVpZH0iIHJlYWQtb25seT1mYWxzZSAtLW1pbmltYWwpCisgIGZpCiBm
aQogCiBtbnQ9Cit2ZGlfdXVpZD0KK3ZiZF91dWlkPQorZGV2aWNlPQorZnVu
Y3Rpb24gY3JlYXRldmJkIHsKKyAgJHtkZWJ1Z30gZWNobyAtbiAiQ3JlYXRp
bmcgVkJEOiAiID4mMgorICB2YmRfdXVpZD0kKCR7WEV9IHZiZC1jcmVhdGUg
dm0tdXVpZD0iJHtDT05UUk9MX0RPTUFJTl9VVUlEfSIgdmRpLXV1aWQ9IiR7
dmRpX3V1aWR9IiBkZXZpY2U9YXV0b2RldGVjdCAyPi9kZXYvbnVsbCkKKwor
ICBpZiBbICQ/IC1uZSAwIC1vIC16ICIke3ZiZF91dWlkfSIgXTsgdGhlbgor
ICAgICR7ZGVidWd9IGVjaG8gImVycm9yIGNyZWF0aW5nIFZCRCBmb3IgVkRJ
ICR7dmRpX3V1aWR9IiA+JjIKKyAgICBjbGVhbnVwCisgICAgcmV0dXJuIDEK
KyAgZmkKKworICAke2RlYnVnfSBlY2hvICIke3ZiZF91dWlkfSIgPiYyCisK
KyAgJHtkZWJ1Z30gZWNobyAtbiAiUGx1Z2dpbmcgVkJEOiAiID4mMgorICAk
e1hFfSB2YmQtcGx1ZyB1dWlkPSIke3ZiZF91dWlkfSIKKyAgZGV2aWNlPS9k
ZXYvJCgke1hFfSB2YmQtcGFyYW0tZ2V0IHV1aWQ9IiR7dmJkX3V1aWR9IiBw
YXJhbS1uYW1lPWRldmljZSkKKworICBpZiBbICEgLWIgIiR7ZGV2aWNlfSIg
XTsgdGhlbgorICAgICAke2RlYnVnfSBlY2hvICIke2RldmljZX06IG5vdCBh
IGJsb2NrIHNwZWNpYWwiID4mMgorICAgICBjbGVhbnVwCisgICAgIHJldHVy
biAxCisgIGZpCisKKyAgJHtkZWJ1Z30gZWNobyAiJHtkZXZpY2V9IiA+JjIK
KyAgcmV0dXJuIDAKK30KKworZnVuY3Rpb24gbW91bnR2YmQgeworICBtbnQ9
Ii92YXIvcnVuL3Bvb2wtYmFja3VwLSR7dmRpX3V1aWR9IgorICBta2RpciAt
cCAiJHttbnR9IgorICAvc2Jpbi9mc2NrIC1hICIke2RldmljZX0iID4vZGV2
L251bGwgMj4mMQorICBpZiBbICQ/IC1uZSAwIF07IHRoZW4KKyAgICBlY2hv
ICJGaWxlIHN5c3RlbSBpbnRlZ3JpdHkgZXJyb3IuICBQbGVhc2UgY29ycmVj
dCBtYW51YWxseS4iID4mMgorICAgIGNsZWFudXAKKyAgICByZXR1cm4gMQor
ICBmaQorICBtb3VudCAiJHtkZXZpY2V9IiAiJHttbnR9IiA+L2Rldi9udWxs
IDI+JjEKKyAgaWYgWyAkPyAtbmUgMCBdOyB0aGVuCisgICAgJHtkZWJ1Z30g
ZWNobyBmYWlsZWQgPiYyCisgICAgY2xlYW51cAorICAgIHJldHVybiAxCisg
IGZpCisgIHJldHVybiAwCit9CisKIGZ1bmN0aW9uIGNsZWFudXAgewogICAg
Y2QgLwogICAgaWYgWyAhIC16ICIke21udH0iIF07IHRoZW4KQEAgLTE2NSw2
NSArMjI4LDMyIEBAIGZ1bmN0aW9uIGNsZWFudXAgewogCiBpZiBbIC16ICIk
e3ZkaXN9IiBdOyB0aGVuCiAgICBlY2hvICJObyBWRElzIGZvdW5kIG9uIFNS
LiIgPiYyCisgICBpZiBbICIkbGVnYWN5IiAtZXEgMCBdOyB0aGVuCisgICAg
ICBlY2hvICJJZiB5b3UgYmVsaWV2ZSB0aGVyZSBtYXkgYmUgYSBsZWdhY3kg
YmFja3VwIFZESSBwcmVzZW50LCB5b3UgY2FuIHVzZSB0aGUgLW8gZmxhZyB0
byBzZWFyY2ggZm9yIGl0ICh0aGlzIHNob3VsZCBub3QgYmUgdXNlZCB3aXRo
IHVudHJ1c3RlZCBWRElzKSIgPiYyCisgICBmaQogICAgZXhpdCAwCiBmaQog
CiB0cmFwIGNsZWFudXAgU0lHSU5UIEVSUgogCitkZWNsYXJlIC1hIG1hdGNo
ZWRfdmRpcwogZm9yIHZkaV91dWlkIGluICR7dmRpc307IGRvCi0gICBpZiBb
ICIke3ZkaV91dWlkfSIgIT0gIiR7YmFja3VwX3ZkaX0iIF0gJiYgWyAiJHll
cyIgLWVxIDAgXTsgdGhlbgotICAgICAgZWNobyAiUHJvYmluZyBWREkgJHt2
ZGlfdXVpZH0uIgotICAgICAgZWNobyAiVGhpcyBWREkgd2FzIGNyZWF0ZWQg
d2l0aCBhIHByaW9yIHZlcnNpb24gb2YgdGhpcyBjb2RlLiIKLSAgICAgIGVj
aG8gIkl0cyB2YWxpZGl0eSBjYW4ndCBiZSBjaGVja2VkIHdpdGhvdXQgbW91
bnRpbmcgaXQgZmlyc3QuIgotICAgICAgcmVhZCAtcCAiQ29udGludWU/IFtZ
L05dIiAtbiAxIC1yOyBlY2hvCi0gICAgICBpZiBbWyAhICRSRVBMWSA9fiBe
W1l5XSQgXV07IHRoZW4gZXhpdCAxOyBmaQotICAgZmkKLQotICAgJHtkZWJ1
Z30gZWNobyAtbiAiQ3JlYXRpbmcgVkJEOiAiID4mMgotICAgdmJkX3V1aWQ9
JCgke1hFfSB2YmQtY3JlYXRlIHZtLXV1aWQ9IiR7Q09OVFJPTF9ET01BSU5f
VVVJRH0iIHZkaS11dWlkPSIke3ZkaV91dWlkfSIgZGV2aWNlPWF1dG9kZXRl
Y3QgMj4vZGV2L251bGwpCi0KLSAgIGlmIFsgJD8gLW5lIDAgLW8gLXogIiR7
dmJkX3V1aWR9IiBdOyB0aGVuCi0gICAgICAke2RlYnVnfSBlY2hvICJlcnJv
ciBjcmVhdGluZyBWQkQgZm9yIFZESSAke3ZkaV91dWlkfSIgPiYyCi0gICAg
ICBjbGVhbnVwCi0gICAgICBjb250aW51ZQotICAgZmkKLQotICAgJHtkZWJ1
Z30gZWNobyAiJHt2YmRfdXVpZH0iID4mMgotCi0gICAke2RlYnVnfSBlY2hv
IC1uICJQbHVnZ2luZyBWQkQ6ICIgPiYyCi0gICAke1hFfSB2YmQtcGx1ZyB1
dWlkPSIke3ZiZF91dWlkfSIKLSAgIGRldmljZT0vZGV2LyQoJHtYRX0gdmJk
LXBhcmFtLWdldCB1dWlkPSIke3ZiZF91dWlkfSIgcGFyYW0tbmFtZT1kZXZp
Y2UpCi0KLSAgIGlmIFsgISAtYiAiJHtkZXZpY2V9IiBdOyB0aGVuCi0gICAg
ICR7ZGVidWd9IGVjaG8gIiR7ZGV2aWNlfTogbm90IGEgYmxvY2sgc3BlY2lh
bCIgPiYyCi0gICAgIGNsZWFudXAKKyAgIGNyZWF0ZXZiZAorICAgaWYgWyAk
PyAtbmUgMCBdOyB0aGVuCiAgICAgIGNvbnRpbnVlCiAgICBmaQogCi0gICAk
e2RlYnVnfSBlY2hvICIke2RldmljZX0iID4mMgotCiAgICAke2RlYnVnfSBl
Y2hvIC1uICJQcm9iaW5nIGRldmljZTogIiA+JjIKICAgIG1udD0KICAgIGlm
IFsgIiQoZmlsZV9leGlzdHMgIiR7ZGV2aWNlfSIgIi8uY3R4cy1tZXRhZGF0
YS1iYWNrdXAiKSIgPSB5IF07IHRoZW4KICAgICAgJHtkZWJ1Z30gZWNobyAi
Zm91bmQgbWV0YWRhdGEgYmFja3VwIiA+JjIKLSAgICAgbW50PSIvdmFyL3J1
bi9wb29sLWJhY2t1cC0ke3ZkaV91dWlkfSIKLSAgICAgbWtkaXIgLXAgIiR7
bW50fSIKLSAgICAgL3NiaW4vZTJmc2NrIC1wIC1mICIke2RldmljZX0iID4v
ZGV2L251bGwgMj4mMQorICAgICBtb3VudHZiZAogICAgICBpZiBbICQ/IC1u
ZSAwIF07IHRoZW4KLSAgICAgICAgZWNobyAiRmlsZSBzeXN0ZW0gaW50ZWdy
aXR5IGVycm9yLiAgUGxlYXNlIGNvcnJlY3QgbWFudWFsbHkuIiA+JjIKLSAg
ICAgICAgY2xlYW51cAogICAgICAgICBjb250aW51ZQogICAgICBmaQotICAg
ICBtb3VudCAtbyBybyxub3N1aWQsbm9leGVjLG5vZGV2ICIke2RldmljZX0i
ICIke21udH0iID4vZGV2L251bGwgMj4mMQotICAgICBpZiBbICQ/IC1uZSAw
IF07IHRoZW4KLSAgICAgICAke2RlYnVnfSBlY2hvIGZhaWxlZCA+JjIKLSAg
ICAgICBjbGVhbnVwCi0gICAgIGVsc2UKLSAgICAgICBpZiBbIC1lICIke21u
dH0vLmN0eHMtbWV0YWRhdGEtYmFja3VwIiBdOyB0aGVuCi0gICAgICAgICAg
JHtkZWJ1Z30gZWNobyAiRm91bmQgYmFja3VwIG1ldGFkYXRhIG9uIFZESTog
JHt2ZGlfdXVpZH0iID4mMgotICAgICAgICAgIHhlIHZkaS1wYXJhbS1zZXQg
dXVpZD0iJHt2ZGlfdXVpZH0iIG90aGVyLWNvbmZpZzpjdHhzLXBvb2wtYmFj
a3VwPXRydWUKLSAgICAgICAgICBicmVhawotICAgICAgIGZpCisgICAgIGlm
IFsgLWUgIiR7bW50fS8uY3R4cy1tZXRhZGF0YS1iYWNrdXAiIF07IHRoZW4K
KyAgICAgICAgJHtkZWJ1Z30gZWNobyAiRm91bmQgYmFja3VwIG1ldGFkYXRh
IG9uIFZESTogJHt2ZGlfdXVpZH0iID4mMgorICAgICAgIG1hdGNoZWRfdmRp
cys9KCAke3ZkaV91dWlkfSApCiAgICAgIGZpCiAgICBlbHNlCiAgICAgICR7
ZGVidWd9IGVjaG8gImJhY2t1cCBtZXRhZGF0YSBub3QgZm91bmQiID4mMgpA
QCAtMjMyLDExICsyNjIsMzUgQEAgZm9yIHZkaV91dWlkIGluICR7dmRpc307
IGRvCiBkb25lCiAKIGlmIFsgJGp1c3RfcHJvYmUgLWd0IDAgXTsgdGhlbgot
ICAgZWNobyAiJHt2ZGlfdXVpZH0iCi0gICBjbGVhbnVwCisgICBmb3IgdmRp
X3V1aWQgaW4gIiR7bWF0Y2hlZF92ZGlzW0BdfSI7IGRvCisgICAgICBlY2hv
ICIke3ZkaV91dWlkfSIKKyAgIGRvbmUKICAgIGV4aXQgMAogZmkKIAoraWYg
WyAiJHsjbWF0Y2hlZF92ZGlzW0BdfSIgLWVxIDAgXTsgdGhlbgorICBlY2hv
ICJNZXRhZGF0YSBiYWNrdXBzIG5vdCBmb3VuZC4iID4mMgorICBleGl0IDEK
K2ZpCisKK2lmIFsgIiR7I21hdGNoZWRfdmRpc1tAXX0iIC1ndCAxIF07IHRo
ZW4KKyAgZWNobyAiTXVsdGlwbGUgbWV0YWRhdGEgYmFja3VwcyBmb3VuZCwg
cGxlYXNlIHVzZSAteCB0byBzcGVjaWZ5IHRoZSBWREkgVVVJRCB0byB1c2Ui
ID4mMgorICBleGl0IDEKK2ZpCisKK3ZkaV91dWlkPSR7bWF0Y2hlZF92ZGlz
WzBdfQoreGUgdmRpLXBhcmFtLXNldCB1dWlkPSIke3ZkaV91dWlkfSIgb3Ro
ZXItY29uZmlnOmN0eHMtcG9vbC1iYWNrdXA9dHJ1ZQorY3JlYXRldmJkCitp
ZiBbICQ/IC1uZSAwIF07IHRoZW4KKyAgZWNobyAiRmFpbHVyZSBjcmVhdGlu
ZyBWQkQgZm9yIGJhY2t1cCBWREkgJHt2ZGlfdXVpZH0iID4mMgorICBleGl0
IDEKK2ZpCittb3VudHZiZAoraWYgWyAkPyAtbmUgMCBdOyB0aGVuCisgIGVj
aG8gIkZhaWx1cmUgbW91bnRpbmcgYmFja3VwIFZESSAke3ZkaV91dWlkfSIg
PiYyCisgIGV4aXQgMQorZmkKKwogY2QgIiR7bW50fSIKICR7ZGVidWd9IGVj
aG8gIiIgPiYyCiAKQEAgLTMyMyw4ICszNzcsOCBAQCBlbHNlCiBmaQogc2hv
cHQgLXMgbnVsbGdsb2IKIGZvciBtZXRhIGluICoudm1tZXRhOyBkbwotICAg
ZWNobyB4ZSB2bS1pbXBvcnQgZmlsZW5hbWU9IiR7bWV0YX0iIHNyLXV1aWQ9
IiR7c3JfdXVpZH0iIC0tbWV0YWRhdGEgLS1wcmVzZXJ2ZSIke2ZvcmNlX2Zs
YWd9IiIke2RyeV9ydW5fZmxhZ30iCi0gICAiQEJJTkRJUkAvYmluL3hlIiB2
bS1pbXBvcnQgZmlsZW5hbWU9IiR7ZnVsbF9kaXJ9LyR7bWV0YX0iIHNyLXV1
aWQ9IiR7c3JfdXVpZH0iIC0tcHJlc2VydmUiJHtmb3JjZV9mbGFnfSIiJHtk
cnlfcnVuX2ZsYWd9IgorICAgZWNobyB4ZSB2bS1pbXBvcnQgZmlsZW5hbWU9
IiR7bWV0YX0iIHNyLXV1aWQ9IiR7c3JfdXVpZH0iIC0tbWV0YWRhdGEgLS1w
cmVzZXJ2ZSR7Zm9yY2VfZmxhZ30ke2RyeV9ydW5fZmxhZ30KKyAgICJAQklO
RElSQC94ZSIgdm0taW1wb3J0IGZpbGVuYW1lPSIke2Z1bGxfZGlyfS8ke21l
dGF9IiBzci11dWlkPSIke3NyX3V1aWR9IiAtLW1ldGFkYXRhIC0tcHJlc2Vy
dmUke2ZvcmNlX2ZsYWd9JHtkcnlfcnVuX2ZsYWd9CiAgICBpZiBbICQ/IC1n
dCAwIF07IHRoZW4KICAgICAgIGVycm9yX2NvdW50PSQoKCAkZXJyb3JfY291
bnQgKyAxICkpCiAgICBlbHNlCi0tIAoyLjI1LjEKCg==

--=separator
Content-Type: application/octet-stream; name="xsa459-xsconsole.patch"
Content-Disposition: attachment; filename="xsa459-xsconsole.patch"
Content-Transfer-Encoding: base64

RnJvbSAyMGMwMjc2NWMzMGJkYjdlMTRlM2MwMjBiMmQ3ZTk1NmY4OGM4MTUw
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IEJyZXR0IDxh
bGV4LmJyZXR0QGNsb3VkLmNvbT4KRGF0ZTogVHVlLCA5IEp1bCAyMDI0IDE2
OjQ1OjE2ICswMDAwClN1YmplY3Q6IFtQQVRDSF0gVXBkYXRlcyB0byBQb3J0
YWJsZSBTUiBmdW5jdGlvbmFsaXR5CgpNb2RpZmllcyBmdW5jdGlvbmFsaXR5
IHRvIHVuZGVyc3RhbmQgdGhlIHVzZSBvZiBsZWdhY3kgZm9ybWF0IFZESXM6
Ci0gQWRkcyBhbiBvcHRpb24gdG8gc2VhcmNoIGZvciBhIGxlZ2FjeSBmb3Jt
YXQgVkRJIGlmIGEgbmV3IG9uZSBpcyBub3QgZm91bmQKLSBIYW5kbGVzIHRo
ZSBjYXNlIHdoZXJlIG11bHRpcGxlIGxlZ2FjeSBWRElzIGFyZSBpZGVudGlm
aWVkCi0gUGFzc2VzIHRoZSBhcHByb3ByaWF0ZSBvcHRpb24gdG8gYHhlLXJl
c3RvcmUtbWV0YWRhdGFgIHdoZW4gbmVlZGVkCgpUaGlzIGlzIFhTQS00NTkg
LyBDVkUtMjAyNC0zMTE0NAoKQWxzbyB1cGRhdGUgdGhlIHN1YnByb2Nlc3Mg
Y2FsbHMgdG8gYmUgY29tcGF0aWJsZSB3aXRoIHB5dGhvbjMKClNpZ25lZC1v
ZmYtYnk6IEFsZXggQnJldHQgPGFsZXguYnJldHRAY2xvdWQuY29tPgotLS0K
IHBsdWdpbnMtYmFzZS9YU0ZlYXR1cmVEUlJlc3RvcmUucHkgfCAxNzIgKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
MzUgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvcGx1Z2lucy1iYXNlL1hTRmVhdHVyZURSUmVzdG9yZS5weSBiL3BsdWdp
bnMtYmFzZS9YU0ZlYXR1cmVEUlJlc3RvcmUucHkKaW5kZXggMmNhZGRlNS4u
ZWE3ZmQ3YyAxMDA2NDQKLS0tIGEvcGx1Z2lucy1iYXNlL1hTRmVhdHVyZURS
UmVzdG9yZS5weQorKysgYi9wbHVnaW5zLWJhc2UvWFNGZWF0dXJlRFJSZXN0
b3JlLnB5CkBAIC0xOSwxNCArMTksOTMgQEAgaWYgX19uYW1lX18gPT0gIl9f
bWFpbl9fIjoKIGZyb20gWFNDb25zb2xlU3RhbmRhcmQgaW1wb3J0ICoKIGlt
cG9ydCBzdWJwcm9jZXNzCiAKK2RlZiBfbGlzdEJhY2t1cHMoc3JfdXVpZCwg
dmRpX3V1aWQsIGxlZ2FjeT1GYWxzZSk6CisgICAgIyBsaXN0IHRoZSBhdmFp
bGFibGUgYmFja3VwcworICAgIExheW91dC5JbnN0KCkuVHJhbnNpZW50QmFu
bmVyKExhbmcoIkZvdW5kIFZESSwgcmV0cmlldmluZyBhdmFpbGFibGUgYmFj
a3Vwcy4uLiIpKQorICAgIGNvbW1hbmQgPSBbIiVzL3hlLXJlc3RvcmUtbWV0
YWRhdGEiICUgKENvbmZpZy5JbnN0KCkuSGVscGVyUGF0aCgpLCksICItbCIs
ICItdSIsIHNyX3V1aWQsICIteCIsIHZkaV91dWlkXQorICAgIGlmIGxlZ2Fj
eToKKyAgICAgICAgY29tbWFuZC5hcHBlbmQoIi1vIikKKyAgICBjbWQgPSBz
dWJwcm9jZXNzLlBvcGVuKGNvbW1hbmQsCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdGRvdXQgPSBzdWJwcm9jZXNzLlBJUEUsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdGRlcnIgPSBzdWJwcm9jZXNzLlBJUEUsCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bml2ZXJzYWxfbmV3bGluZXMg
PSBUcnVlKQorICAgIG91dHB1dCwgZXJycHV0ID0gY21kLmNvbW11bmljYXRl
KCkKKyAgICBzdGF0dXMgPSBjbWQucmV0dXJuY29kZQorICAgIGlmIHN0YXR1
cyAhPSAwOgorICAgICAgICByYWlzZSBFeGNlcHRpb24oIiglcywlcykiICUg
KG91dHB1dCxlcnJwdXQpKQorICAgIExheW91dC5JbnN0KCkuUHVzaERpYWxv
Z3VlKERSUmVzdG9yZVNlbGVjdGlvbihvdXRwdXQsIHZkaV91dWlkLCBzcl91
dWlkLCBsZWdhY3k9bGVnYWN5KSkKKworY2xhc3MgRFJSZXN0b3JlVkRJU2Vs
ZWN0aW9uKERpYWxvZ3VlKToKKyAgICBkZWYgX19pbml0X18oc2VsZiwgc3Jf
dXVpZCwgdmRpX3V1aWRzKToKKyAgICAgICAgRGlhbG9ndWUuX19pbml0X18o
c2VsZikKKworICAgICAgICBjaG9pY2VzID0gW10KKworICAgICAgICBzZWxm
LnNyX3V1aWQgPSBzcl91dWlkCisgICAgICAgIHNlbGYudmRpX3V1aWRzID0g
dmRpX3V1aWRzCisgICAgICAgIGluZGV4ID0gMAorICAgICAgICBmb3IgY2hv
aWNlIGluIHNlbGYudmRpX3V1aWRzOgorICAgICAgICAgICAgY2RlZiA9IENo
b2ljZURlZihjaG9pY2UsIGxhbWJkYSBpPWluZGV4OiBzZWxmLkhhbmRsZVZE
SUNob2ljZShpKSkKKyAgICAgICAgICAgIGluZGV4ID0gaW5kZXggKyAxCisg
ICAgICAgICAgICBjaG9pY2VzLmFwcGVuZChjZGVmKQorCisgICAgICAgIHNl
bGYudGVzdE1lbnUgPSBNZW51KHNlbGYsIE5vbmUsICIiLCBjaG9pY2VzKQor
ICAgICAgICBzZWxmLkNoYW5nZVN0YXRlKCdMSVNUVkRJUycpCisKKyAgICBk
ZWYgQnVpbGRQYW5lKHNlbGYpOgorICAgICAgICBwYW5lID0gc2VsZi5OZXdQ
YW5lKERpYWxvZ3VlUGFuZShzZWxmLnBhcmVudCkpCisgICAgICAgIHBhbmUu
VGl0bGVTZXQoTGFuZygnUmVzdG9yZSBWaXJ0dWFsIE1hY2hpbmUgTWV0YWRh
dGEnKSkKKyAgICAgICAgcGFuZS5BZGRCb3goKQorCisgICAgZGVmIFVwZGF0
ZUZpZWxkc0xJU1RWRElTKHNlbGYpOgorICAgICAgICBwYW5lID0gc2VsZi5Q
YW5lKCkKKyAgICAgICAgcGFuZS5SZXNldEZpZWxkcygpCisKKyAgICAgICAg
cGFuZS5UaXRsZVNldCgiQXZhaWxhYmxlIE1ldGFkYXRhIFZESXMiKQorICAg
ICAgICBwYW5lLkFkZFRpdGxlRmllbGQoTGFuZygiU2VsZWN0IE1ldGFkYXRh
IFZESSB0byBSZXN0b3JlIEZyb20iKSkKKyAgICAgICAgcGFuZS5BZGRXYXJu
aW5nRmllbGQoTGFuZygiWW91IHNob3VsZCBvbmx5IHJlc3RvcmUgbWV0YWRh
dGEgZnJvbSBhIHRydXN0d29ydGh5IFZESTsgbG9hZGluZyB1bnRydXN0d29y
dGh5IG1ldGFkYXRhIG1heSBwdXQgeW91ciBzeXN0ZW0gYXQgcmlzayIpKQor
ICAgICAgICBwYW5lLkFkZE1lbnVGaWVsZChzZWxmLnRlc3RNZW51KQorICAg
ICAgICBwYW5lLkFkZEtleUhlbHBGaWVsZCggeyBMYW5nKCI8RW50ZXI+Iikg
OiBMYW5nKCJPSyIpLCBMYW5nKCI8RXNjPiIpIDogTGFuZygiQ2FuY2VsIikg
fSApCisKKyAgICBkZWYgVXBkYXRlRmllbGRzKHNlbGYpOgorICAgICAgICBz
ZWxmLlBhbmUoKS5SZXNldFBvc2l0aW9uKCkKKyAgICAgICAgZ2V0YXR0cihz
ZWxmLCAnVXBkYXRlRmllbGRzJytzZWxmLnN0YXRlKSgpICMgRGVzcGF0Y2gg
bWV0aG9kIG5hbWVkICdVcGRhdGVGaWVsZHMnK3NlbGYuc3RhdGUKKworICAg
IGRlZiBDaGFuZ2VTdGF0ZShzZWxmLCBpblN0YXRlKToKKyAgICAgICAgc2Vs
Zi5zdGF0ZSA9IGluU3RhdGUKKyAgICAgICAgc2VsZi5CdWlsZFBhbmUoKQor
ICAgICAgICBzZWxmLlVwZGF0ZUZpZWxkcygpCisKKyAgICBkZWYgSGFuZGxl
VkRJQ2hvaWNlKHNlbGYsIGluQ2hvaWNlKToKKyAgICAgICAgX2xpc3RCYWNr
dXBzKHNlbGYuc3JfdXVpZCwgc2VsZi52ZGlfdXVpZHNbaW5DaG9pY2VdLCBs
ZWdhY3k9VHJ1ZSkKKworICAgIGRlZiBIYW5kbGVLZXlMSVNUVkRJUyhzZWxm
LCBpbktleSk6CisgICAgICAgIGhhbmRsZWQgPSBzZWxmLnRlc3RNZW51Lkhh
bmRsZUtleShpbktleSkKKyAgICAgICAgaWYgbm90IGhhbmRsZWQgYW5kIGlu
S2V5ID09ICdLRVlfTEVGVCc6CisgICAgICAgICAgICBMYXlvdXQuSW5zdCgp
LlBvcERpYWxvZ3VlKCkKKyAgICAgICAgICAgIGhhbmRsZWQgPSBUcnVlCisg
ICAgICAgIHJldHVybiBoYW5kbGVkCisKKyAgICBkZWYgSGFuZGxlS2V5KHNl
bGYsIGluS2V5KToKKyAgICAgICAgaGFuZGxlZCA9IEZhbHNlCisgICAgICAg
IGlmIGhhc2F0dHIoc2VsZiwgJ0hhbmRsZUtleScrc2VsZi5zdGF0ZSk6Cisg
ICAgICAgICAgICBoYW5kbGVkID0gZ2V0YXR0cihzZWxmLCAnSGFuZGxlS2V5
JytzZWxmLnN0YXRlKShpbktleSkKKworICAgICAgICBpZiBub3QgaGFuZGxl
ZCBhbmQgaW5LZXkgPT0gJ0tFWV9FU0NBUEUnOgorICAgICAgICAgICAgTGF5
b3V0Lkluc3QoKS5Qb3BEaWFsb2d1ZSgpCisgICAgICAgICAgICBoYW5kbGVk
ID0gVHJ1ZQorCisgICAgICAgIHJldHVybiBoYW5kbGVkCisKIGNsYXNzIERS
UmVzdG9yZVNlbGVjdGlvbihEaWFsb2d1ZSk6CiAKLSAgICBkZWYgX19pbml0
X18oc2VsZiwgZGF0ZV9jaG9pY2VzLCB2ZGlfdXVpZCwgc3JfdXVpZCk6Cisg
ICAgZGVmIF9faW5pdF9fKHNlbGYsIGRhdGVfY2hvaWNlcywgdmRpX3V1aWQs
IHNyX3V1aWQsIGxlZ2FjeT1GYWxzZSk6CiAgICAgICAgIERpYWxvZ3VlLl9f
aW5pdF9fKHNlbGYpCiAKICAgICAgICAgY2hvaWNlcyA9IFtdCiAgICAgICAg
IHNlbGYudmRpX3V1aWQgPSB2ZGlfdXVpZAogICAgICAgICBzZWxmLnNyX3V1
aWQgPSBzcl91dWlkCisgICAgICAgIHNlbGYubGVnYWN5ID0gbGVnYWN5CiAg
ICAgICAgIHNlbGYuZGF0ZV9jaG9pY2VzID0gZGF0ZV9jaG9pY2VzLnNwbGl0
bGluZXMoKQogICAgICAgICBpbmRleCA9IDAKICAgICAgICAgZm9yIGNob2lj
ZSBpbiBzZWxmLmRhdGVfY2hvaWNlczoKQEAgLTg2LDE0ICsxNjUsMTkgQEAg
Y2xhc3MgRFJSZXN0b3JlU2VsZWN0aW9uKERpYWxvZ3VlKToKICAgICAgICAg
ICAgIExheW91dC5JbnN0KCkuUHVzaERpYWxvZ3VlKEluZm9EaWFsb2d1ZShM
YW5nKCJJbnRlcm5hbCBFcnJvciwgdW5leHBlY3RlZCBjaG9pY2U6ICIgKyBp
bkNob2ljZSkpKQogICAgICAgICBlbHNlOgogICAgICAgICAgICAgY2hvc2Vu
X21vZGUgPSBpbkNob2ljZQotICAgICAgICAgICAgaWYgZHJ5UnVuOgotICAg
ICAgICAgICAgICBkcnlfZmxhZz0iLW4gIgotICAgICAgICAgICAgZWxzZToK
LSAgICAgICAgICAgICAgZHJ5X2ZsYWc9IiIKICAgICAgICAgICAgIExheW91
dC5JbnN0KCkuVHJhbnNpZW50QmFubmVyKExhbmcoIlJlc3RvcmluZyBWTSBN
ZXRhZGF0YS4gIFRoaXMgbWF5IHRha2UgYSBmZXcgbWludXRlcy4uLiIpKQot
ICAgICAgICAgICAgY29tbWFuZCA9ICIlcy94ZS1yZXN0b3JlLW1ldGFkYXRh
IC15ICVzIC11ICVzIC14ICVzIC1kICVzIC1tICVzIiAlIChDb25maWcuSW5z
dCgpLkhlbHBlclBhdGgoKSwgZHJ5X2ZsYWcsIHNlbGYuc3JfdXVpZCwgc2Vs
Zi52ZGlfdXVpZCwgc2VsZi5jaG9zZW5fZGF0ZSwgY2hvc2VuX21vZGUpCi0g
ICAgICAgICAgICBzdGF0dXMsIG91dHB1dCA9IGNvbW1hbmRzLmdldHN0YXR1
c291dHB1dChjb21tYW5kKQotICAgICAgICAgICAgc3RhdHVzID0gb3MuV0VY
SVRTVEFUVVMoc3RhdHVzKQorICAgICAgICAgICAgY29tbWFuZCA9IFsiJXMv
eGUtcmVzdG9yZS1tZXRhZGF0YSIgJSAoQ29uZmlnLkluc3QoKS5IZWxwZXJQ
YXRoKCksKSwgIi15IiwgIi11Iiwgc2VsZi5zcl91dWlkLCAiLXgiLCBzZWxm
LnZkaV91dWlkLCAiLWQiLCBzZWxmLmNob3Nlbl9kYXRlLCAiLW0iLCBjaG9z
ZW5fbW9kZV0KKyAgICAgICAgICAgIGlmIGRyeVJ1bjoKKyAgICAgICAgICAg
ICAgICBjb21tYW5kLmFwcGVuZCgiLW4iKQorICAgICAgICAgICAgaWYgc2Vs
Zi5sZWdhY3k6CisgICAgICAgICAgICAgICAgY29tbWFuZC5hcHBlbmQoIi1v
IikKKworICAgICAgICAgICAgY21kID0gc3VicHJvY2Vzcy5Qb3Blbihjb21t
YW5kLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGRvdXQg
PSBzdWJwcm9jZXNzLlBJUEUsCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0ZGVyciA9IHN1YnByb2Nlc3MuU1RET1VULAorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1bml2ZXJzYWxfbmV3bGluZXMgPSBU
cnVlKQorICAgICAgICAgICAgb3V0cHV0LCBfID0gY21kLmNvbW11bmljYXRl
KCkKKyAgICAgICAgICAgIHN0YXR1cyA9IGNtZC5yZXR1cm5jb2RlCiAgICAg
ICAgICAgICBMYXlvdXQuSW5zdCgpLlBvcERpYWxvZ3VlKCkKICAgICAgICAg
ICAgIGlmIHN0YXR1cyA9PSAwOgogICAgICAgICAgICAgICAgIExheW91dC5J
bnN0KCkuUHVzaERpYWxvZ3VlKEluZm9EaWFsb2d1ZShMYW5nKCJNZXRhZGF0
YSBSZXN0b3JlIFN1Y2NlZWRlZDogIikgKyBvdXRwdXQpKQpAQCAtMTM3LDQw
ICsyMjEsNTQgQEAgY2xhc3MgRFJSZXN0b3JlRGlhbG9ndWUoU1JEaWFsb2d1
ZSk6CiAgICAgICAgIH0KICAgICAgICAgU1JEaWFsb2d1ZS5fX2luaXRfXyhz
ZWxmKSAjIE11c3QgZmlsbCBpbiBzZWxmLmN1c3RvbSBiZWZvcmUgY2FsbGlu
ZyBfX2luaXRfXwogCisgICAgZGVmIF9zZWFyY2hGb3JWREkoc2VsZiwgc3Jf
dXVpZCwgbGVnYWN5PUZhbHNlKToKKyAgICAgICAgIyBwcm9iZSBmb3IgdGhl
IHJlc3RvcmUgVkRJIFVVSUQKKyAgICAgICAgY29tbWFuZCA9IFsiJXMveGUt
cmVzdG9yZS1tZXRhZGF0YSIgJSAoQ29uZmlnLkluc3QoKS5IZWxwZXJQYXRo
KCksKSwgIi1wIiwgIi11Iiwgc3JfdXVpZF0KKyAgICAgICAgaWYgbGVnYWN5
OgorICAgICAgICAgICAgY29tbWFuZC5hcHBlbmQoIi1vIikKKyAgICAgICAg
Y21kID0gc3VicHJvY2Vzcy5Qb3Blbihjb21tYW5kLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0ZG91dCA9IHN1YnByb2Nlc3MuUElQRSwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGRlcnIgPSBzdWJw
cm9jZXNzLlBJUEUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5pdmVyc2FsX25ld2xpbmVzID0gVHJ1ZSkKKyAgICAgICAgb3V0cHV0LCBl
cnJwdXQgPSBjbWQuY29tbXVuaWNhdGUoKQorICAgICAgICBzdGF0dXMgPSBj
bWQucmV0dXJuY29kZQorICAgICAgICBpZiBzdGF0dXMgIT0gMDoKKyAgICAg
ICAgICAgIHJhaXNlIEV4Y2VwdGlvbigiKCVzLCVzKSIgJSAob3V0cHV0LGVy
cnB1dCkpCisgICAgICAgIGlmIGxlbihvdXRwdXQpID09IDA6CisgICAgICAg
ICAgICByYWlzZSBFeGNlcHRpb24oZXJycHV0KQorICAgICAgICByZXR1cm4g
b3V0cHV0CisKKyAgICBkZWYgX2VhcmxpZXJDb25maXJtSGFuZGxlcihzZWxm
LCBpblllc05vLCBzcl91dWlkKToKKyAgICAgICAgaWYgaW5ZZXNObyA9PSAn
eSc6CisgICAgICAgICAgICBMYXlvdXQuSW5zdCgpLlRyYW5zaWVudEJhbm5l
cihMYW5nKCJTZWFyY2hpbmcgZm9yIGJhY2t1cCBWREkuLi5cblxuQ3RybC1D
IHRvIGFib3J0IikpCisgICAgICAgICAgICB0cnk6CisgICAgICAgICAgICAg
ICAgdmRpX3V1aWRzID0gW3Yuc3RyaXAoKSBmb3IgdiBpbiBzZWxmLl9zZWFy
Y2hGb3JWREkoc3JfdXVpZCwgbGVnYWN5PVRydWUpLnNwbGl0bGluZXMoKV0K
KyAgICAgICAgICAgICAgICBpZiBsZW4odmRpX3V1aWRzKSA9PSAxOgorICAg
ICAgICAgICAgICAgICAgICBfbGlzdEJhY2t1cHMoc3JfdXVpZCwgdmRpX3V1
aWRzWzBdLCBsZWdhY3k9VHJ1ZSkKKyAgICAgICAgICAgICAgICBlbHNlOgor
ICAgICAgICAgICAgICAgICAgICBMYXlvdXQuSW5zdCgpLlB1c2hEaWFsb2d1
ZShEUlJlc3RvcmVWRElTZWxlY3Rpb24oc3JfdXVpZCwgdmRpX3V1aWRzKSkK
KyAgICAgICAgICAgICAgICAgICAgcmV0dXJuCisgICAgICAgICAgICBleGNl
cHQgRXhjZXB0aW9uIGFzIGU6CisgICAgICAgICAgICAgICAgTGF5b3V0Lklu
c3QoKS5QdXNoRGlhbG9ndWUoSW5mb0RpYWxvZ3VlKCBMYW5nKCJNZXRhZGF0
YSBSZXN0b3JlIGZhaWxlZDogIikrTGFuZyhlKSkpCisgICAgICAgIGVsc2U6
CisgICAgICAgICAgICBMYXlvdXQuSW5zdCgpLlB1c2hEaWFsb2d1ZShJbmZv
RGlhbG9ndWUoIExhbmcoIk1ldGFkYXRhIFJlc3RvcmUgZmFpbGVkOiBhIGJh
Y2t1cCBWREkgY291bGQgbm90IGJlIGZvdW5kIikpKQorICAgICAgICBEYXRh
Lkluc3QoKS5VcGRhdGUoKQorCiAgICAgZGVmIERvQWN0aW9uKHNlbGYsIGlu
U1IpOgogICAgICAgICBMYXlvdXQuSW5zdCgpLlBvcERpYWxvZ3VlKCkKICAg
ICAgICAgTGF5b3V0Lkluc3QoKS5UcmFuc2llbnRCYW5uZXIoTGFuZygiU2Vh
cmNoaW5nIGZvciBiYWNrdXAgVkRJLi4uXG5cbkN0cmwtQyB0byBhYm9ydCIp
KQogICAgICAgICBzcl91dWlkID0gaW5TUlsndXVpZCddCiAgICAgICAgIHRy
eToKLSAgICAgICAgICAgICMgcHJvYmUgZm9yIHRoZSByZXN0b3JlIFZESSBV
VUlECi0gICAgICAgICAgICBjb21tYW5kID0gIiVzL3hlLXJlc3RvcmUtbWV0
YWRhdGEgLXAgLXUgJXMiICUgKENvbmZpZy5JbnN0KCkuSGVscGVyUGF0aCgp
LCBzcl91dWlkKQotICAgICAgICAgICAgY21kID0gc3VicHJvY2Vzcy5Qb3Bl
bihjb21tYW5kLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdGRvdXQgPSBzdWJwcm9jZXNzLlBJUEUsCi0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0ZGVyciA9IHN1YnByb2Nlc3MuUElQRSwK
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2hlbGwgPSBU
cnVlKQotICAgICAgICAgICAgb3V0cHV0ID0gIiIuam9pbihjbWQuc3Rkb3V0
KS5zdHJpcCgpCi0gICAgICAgICAgICBlcnJwdXQgPSAiIi5qb2luKGNtZC5z
dGRlcnIpLnN0cmlwKCkKLSAgICAgICAgICAgIHN0YXR1cyA9IGNtZC53YWl0
KCkKLSAgICAgICAgICAgIGlmIHN0YXR1cyAhPSAwOgotICAgICAgICAgICAg
ICAgIHJhaXNlIEV4Y2VwdGlvbigiKCVzLCVzKSIgJSAob3V0cHV0LGVycnB1
dCkpCi0gICAgICAgICAgICBpZiBsZW4ob3V0cHV0KSA9PSAwOgotICAgICAg
ICAgICAgICAgIHJhaXNlIEV4Y2VwdGlvbihlcnJwdXQpCi0gICAgICAgICAg
ICB2ZGlfdXVpZCA9IG91dHB1dAotCi0gICAgICAgICAgICAjIGxpc3QgdGhl
IGF2YWlsYWJsZSBiYWNrdXBzCi0gICAgICAgICAgICBMYXlvdXQuSW5zdCgp
LlRyYW5zaWVudEJhbm5lcihMYW5nKCJGb3VuZCBWREksIHJldHJpZXZpbmcg
YXZhaWxhYmxlIGJhY2t1cHMuLi4iKSkKLSAgICAgICAgICAgIGNvbW1hbmQg
PSAiJXMveGUtcmVzdG9yZS1tZXRhZGF0YSAtbCAtdSAlcyAteCAlcyIgJSAo
Q29uZmlnLkluc3QoKS5IZWxwZXJQYXRoKCksIHNyX3V1aWQsIHZkaV91dWlk
KQotICAgICAgICAgICAgY21kID0gc3VicHJvY2Vzcy5Qb3Blbihjb21tYW5k
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGRvdXQg
PSBzdWJwcm9jZXNzLlBJUEUsCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0ZGVyciA9IHN1YnByb2Nlc3MuUElQRSwKLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc2hlbGwgPSBUcnVlKQotICAg
ICAgICAgICAgb3V0cHV0ID0gIiIuam9pbihjbWQuc3Rkb3V0KS5zdHJpcCgp
Ci0gICAgICAgICAgICBlcnJwdXQgPSAiIi5qb2luKGNtZC5zdGRlcnIpLnN0
cmlwKCkKLSAgICAgICAgICAgIHN0YXR1cyA9IGNtZC53YWl0KCkKLSAgICAg
ICAgICAgIGlmIHN0YXR1cyAhPSAwOgotICAgICAgICAgICAgICAgIHJhaXNl
IEV4Y2VwdGlvbigiKCVzLCVzKSIgJSAob3V0cHV0LGVycnB1dCkpCi0gICAg
ICAgICAgICBMYXlvdXQuSW5zdCgpLlB1c2hEaWFsb2d1ZShEUlJlc3RvcmVT
ZWxlY3Rpb24ob3V0cHV0LCB2ZGlfdXVpZCwgc3JfdXVpZCkpCi0gICAgICAg
IGV4Y2VwdCBFeGNlcHRpb24sIGU6CisgICAgICAgICAgICB0cnk6CisgICAg
ICAgICAgICAgICAgdmRpX3V1aWQgPSBzZWxmLl9zZWFyY2hGb3JWREkoc3Jf
dXVpZCkuc3RyaXAoKQorICAgICAgICAgICAgZXhjZXB0IEV4Y2VwdGlvbiBh
cyBlOgorICAgICAgICAgICAgICAgICMgV2UgY291bGQgbm90IHVuaXF1ZWx5
IGlkZW50aWZ5IHRoZSByZXF1aXJlZCBWREksIGFzayB0aGUgdXNlciBpZiB0
aGV5IHdhbnQgdG8gY2hlY2sgZm9yIGxlZ2FjeSBvbmVzCisgICAgICAgICAg
ICAgICAgbWVzc2FnZSA9IExhbmcoIkEgYmFja3VwIFZESSBjb3VsZCBub3Qg
YmUgcG9zaXRpdmVseSBpZGVudGlmaWVkLiBEbyB5b3Ugd2lzaCB0byBzY2Fu
IGZvciBiYWNrdXAgVkRJcyBjcmVhdGVkIHdpdGggZWFybGllciB2ZXJzaW9u
cyAoV2FybmluZzogdGhpcyBvcGVyYXRpb24gc2hvdWxkIG9ubHkgYmUgcGVy
Zm9ybWVkIGlmIHlvdSB0cnVzdCB0aGUgY29udGVudHMgb2YgYWxsIFZESXMg
aW4gdGhpcyBzdG9yYWdlIHJlcG9zaXRvcnkpPyIpCisgICAgICAgICAgICAg
ICAgTGF5b3V0Lkluc3QoKS5QdXNoRGlhbG9ndWUoUXVlc3Rpb25EaWFsb2d1
ZShtZXNzYWdlLCBsYW1iZGEgeDogc2VsZi5fZWFybGllckNvbmZpcm1IYW5k
bGVyKHgsIHNyX3V1aWQpKSkKKyAgICAgICAgICAgICAgICByZXR1cm4KKwor
ICAgICAgICAgICAgX2xpc3RCYWNrdXBzKHNyX3V1aWQsIHZkaV91dWlkKQor
ICAgICAgICBleGNlcHQgRXhjZXB0aW9uIGFzIGU6CiAgICAgICAgICAgICBM
YXlvdXQuSW5zdCgpLlB1c2hEaWFsb2d1ZShJbmZvRGlhbG9ndWUoIExhbmco
Ik1ldGFkYXRhIFJlc3RvcmUgZmFpbGVkOiAiKStMYW5nKGUpKSkKICAgICAg
ICAgRGF0YS5JbnN0KCkuVXBkYXRlKCkKIAotLSAKMi4yNS4xCgo=

--=separator--

