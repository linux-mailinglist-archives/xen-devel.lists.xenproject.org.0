Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8039E951BCC
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 15:26:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777239.1187451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seE0s-0001uK-Vv; Wed, 14 Aug 2024 13:26:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777239.1187451; Wed, 14 Aug 2024 13:26:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seE0s-0001sD-SU; Wed, 14 Aug 2024 13:26:06 +0000
Received: by outflank-mailman (input) for mailman id 777239;
 Wed, 14 Aug 2024 13:26:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=glz1=PN=xenbits.xen.org=julieng@srs-se1.protection.inumbo.net>)
 id 1seE0r-0001rP-GZ
 for xen-devel@lists.xen.org; Wed, 14 Aug 2024 13:26:05 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd711bdb-5a40-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 15:25:59 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1seE0f-000169-Qj; Wed, 14 Aug 2024 13:25:53 +0000
Received: from julieng by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1seE0f-0001zO-Nj; Wed, 14 Aug 2024 13:25:53 +0000
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
X-Inumbo-ID: bd711bdb-5a40-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=0cESxM2Nc/a1Y9sxbNz5glxIoFXz8cls7TNWojCBKls=; b=QRt+ev77BYIZc3zRSzK7lN7N7h
	HtQFzrEO7QlN1w5asF6q6/a+tsplonxv2w6lQDu2hj6XlRrjC9VJ6InRPccnGALUSZ7pRneaDFQpU
	uhhzSGScqu2jyBQJfeC+RxJLxt9JoZHNCFB1TIYuwsIZZfTbgAehsdTUzllPIMQVtKBg=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 461 v2 (CVE-2024-31146) - PCI device
 pass-through with shared resources
Message-Id: <E1seE0f-0001zO-Nj@xenbits.xenproject.org>
Date: Wed, 14 Aug 2024 13:25:53 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2024-31146 / XSA-461
                               version 2

             PCI device pass-through with shared resources

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

When multiple devices share resources and one of them is to be passed
through to a guest, security of the entire system and of respective
guests individually cannot really be guaranteed without knowing
internals of any of the involved guests.  Therefore such a configuration
cannot really be security-supported, yet making that explicit was so far
missing.

Resources the sharing of which is known to be problematic include, but
are not limited to
- - PCI Base Address Registers (BARs) of multiple devices mapping to the
  same page (4k on x86),
- - INTx lines.

IMPACT
======

The precise effects when shared resources are in use are system, device,
guest, and resource specific.  None of privilege escalation, information
leaks, or Denial of Service (DoS) can be ruled out.

VULNERABLE SYSTEMS
==================

All systems making use of PCI pass-through are in principle vulnerable,
when any kind of resource is shared.  Just to re-iterate, even in the
absence of resource sharing caveats apply to passing through of PCI
devices to entirely untrusted guests.

MITIGATION
==========

Passing through only SR-IOV virtual functions or devices with well-
separated resources will avoid this particular vulnerability.  Passing
through all devices sharing a given resource to the same guest will also
avoid this particular vulnerability.

RESOLUTION
==========

Applying the appropriate attached patch documents this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa461.patch           xen-unstable - Xen 4.16.x

$ sha256sum xsa461*
2415504496508ad87c306aa7257e836d7c2f0bd8849656de5b586f0ab93fd17f  xsa461.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of patches or mitigations is NOT permitted (except where
all the affected systems and VMs are administered and used only by
organisations which are members of the Xen Project Security Issues
Predisclosure List).  Specifically, deployment on public cloud systems
is NOT permitted.

This is because changing the nature of devices being passed through is
very likely noticeable by the guest.

Deployment is permitted only AFTER the embargo ends.

(Note: this during-embargo deployment notice is retained in
post-embargo publicly released Xen Project advisories, even though it
is then no longer applicable.  This is to enable the community to have
oversight of the Xen Project Security Team's decisionmaking.)

For more information about permissible uses of embargoed information,
consult the Xen Project community's agreed Security Policy:
  http://www.xenproject.org/security-policy.html
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAma8sCkMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZLDkH/i6esACkik7iglEESFgCj0x6fc3KdpVzsCPznmsn
uWZzBO9xuggoPOONJ70Or7tsIdaYDAkealZrBGreXlPEgd0MOtozLYrvB2IIqJEj
cKyC4Y04VpBkynaOiLraFvUs0xyC0cew1NZdE/cxr9ewRvvrHVcyBI5GBAMKworh
g4hjIDOR9ohhvxN2P7Yz59OY+Ojo57t+IlpvPPm+c53bARYR6H/cxyUDLYVlfrk2
iNPif7Wpi1PU/Sjz5XqBF5mXW+LLsLnbyw8Iyhnjqv1zC/tUdzl1INUBd24eHSjP
aXnrlExoGAuvUcf/6YVfU0u2dB7iISGYAs2ESeYuxpJnZ8E=
=LkWz
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa461.patch"
Content-Disposition: attachment; filename="xsa461.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODYvcGFzcy10aHJvdWdoOiBkb2N1bWVudHMgYXMgc2VjdXJpdHktdW5z
dXBwb3J0ZWQgd2hlbiBzaGFyaW5nIHJlc291cmNlcwoKV2hlbiBtdWx0aXBs
ZSBkZXZpY2VzIHNoYXJlIHJlc291cmNlcyBhbmQgb25lIG9mIHRoZW0gaXMg
dG8gYmUgcGFzc2VkCnRocm91Z2ggdG8gYSBndWVzdCwgc2VjdXJpdHkgb2Yg
dGhlIGVudGlyZSBzeXN0ZW0gYW5kIG9mIHJlc3BlY3RpdmUKZ3Vlc3RzIGlu
ZGl2aWR1YWxseSBjYW5ub3QgcmVhbGx5IGJlIGd1YXJhbnRlZWQgd2l0aG91
dCBrbm93aW5nCmludGVybmFscyBvZiBhbnkgb2YgdGhlIGludm9sdmVkIGd1
ZXN0cy4gIFRoZXJlZm9yZSBzdWNoIGEgY29uZmlndXJhdGlvbgpjYW5ub3Qg
cmVhbGx5IGJlIHNlY3VyaXR5LXN1cHBvcnRlZCwgeWV0IG1ha2luZyB0aGF0
IGV4cGxpY2l0IHdhcyBzbyBmYXIKbWlzc2luZy4KClRoaXMgaXMgWFNBLTQ2
MSAvIENWRS0yMDI0LTMxMTQ2LgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KVEJEOiBPZiBjb3Vyc2UgdGhl
IHN5c3RlbSBidXMoZXMpIGlzIGEgLyBhcmUgc2hhcmVkIHJlc291cmNlKHMp
LCB0b28uCiAgICAgSSdtIGFmcmFpZCBJIGRvbid0IGtub3cgdGhlIGxvdyBs
ZXZlbCBkZXRhaWxzIG9mIFBDSSB0byBiZSBhYmxlIHRvCiAgICAgdGVsbCB3
aGV0aGVyIHRoZXJlIGFyZSBhbnkgZmFpcm5lc3MgZ3VhcmFudGVlcyB0aGVy
ZS4KCi0tLSBhL1NVUFBPUlQubWQKKysrIGIvU1VQUE9SVC5tZApAQCAtODQx
LDYgKzg0MSwxMSBAQCBUaGlzIGZlYXR1cmUgaXMgbm90IHNlY3VyaXR5IHN1
cHBvcnRlZDoKIAogT25seSBzeXN0ZW1zIHVzaW5nIElPTU1VcyBhcmUgc3Vw
cG9ydGVkLgogCitQYXNzaW5nIHRocm91Z2ggb2YgZGV2aWNlcyBzaGFyaW5n
IHJlc291cmNlcyB3aXRoIGFub3RoZXIgZGV2aWNlIGlzIG5vdAorc2VjdXJp
dHkgc3VwcG9ydGVkLiAgU3VjaCBzaGFyaW5nIGNvdWxkIGUuZy4gYmUgdGhl
IHNhbWUgbGluZSBpbnRlcnJ1cHQgYmVpbmcKK3VzZWQgYnkgbXVsdGlwbGUg
ZGV2aWNlcywgb25lIG9mIHdoaWNoIGlzIHRvIGJlIHBhc3NlZCB0aHJvdWdo
LCBvciB0d28gc3VjaAorZGV2aWNlcyBoYXZpbmcgbWVtb3J5IEJBUnMgd2l0
aGluIHRoZSBzYW1lIDRrIHBhZ2UuCisKIE5vdCBjb21wYXRpYmxlIHdpdGgg
bWlncmF0aW9uLCBwb3B1bGF0ZS1vbi1kZW1hbmQsIGFsdHAybSwKIGludHJv
c3BlY3Rpb24sIG1lbW9yeSBzaGFyaW5nLCBvciBtZW1vcnkgcGFnaW5nLgog
Cg==

--=separator--

