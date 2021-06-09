Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAD13A161D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 15:51:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139398.257787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqybc-0007Nr-0U; Wed, 09 Jun 2021 13:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139398.257787; Wed, 09 Jun 2021 13:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqybb-0007LF-Sk; Wed, 09 Jun 2021 13:50:51 +0000
Received: by outflank-mailman (input) for mailman id 139398;
 Wed, 09 Jun 2021 13:50:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N7Um=LD=xenbits.xen.org=gdunlap@srs-us1.protection.inumbo.net>)
 id 1lqyba-0007Jc-1m
 for xen-devel@lists.xen.org; Wed, 09 Jun 2021 13:50:50 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8213aecf-b1a1-4682-8ef0-ae9e0af04fc7;
 Wed, 09 Jun 2021 13:50:43 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gdunlap@xenbits.xen.org>)
 id 1lqybO-00009C-7F; Wed, 09 Jun 2021 13:50:38 +0000
Received: from gdunlap by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <gdunlap@xenbits.xen.org>)
 id 1lqybO-0000fZ-5i; Wed, 09 Jun 2021 13:50:38 +0000
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
X-Inumbo-ID: 8213aecf-b1a1-4682-8ef0-ae9e0af04fc7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=QfKpnKz4ByVbxkzhNuZ4GYqpHZ1G4uUiNnR6er0r7Y8=; b=LSRRBAv1p7m1yD14lrjQ0rxVIq
	wTeDtQQhDgcoJWexRe8wrI1fKT/iRNMVCGoAja7Wt6ae+OqgRUJVidxppiZKG9r2SMdbdMQnvQLir
	s0fgZq21BPcJwcrvi/VRm2FB94kus3YqwKQL+8m39NOo+XHUhHjLUSEetR5yA3ghYmdM=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 375 v3 (CVE-2021-0089,CVE-2021-26313) -
 Speculative Code Store Bypass
Message-Id: <E1lqybO-0000fZ-5i@xenbits.xenproject.org>
Date: Wed, 09 Jun 2021 13:50:38 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

      Xen Security Advisory CVE-2021-0089,CVE-2021-26313 / XSA-375
                              version 3

                    Speculative Code Store Bypass

UPDATES IN VERSION 3
====================

Added additional CVE, as Intel and AMD allocated different ones.

ISSUE DESCRIPTION
=================

Modern superscalar processors may employ sophisticated decoding and
caching of the instruction stream to improve performance.  However, a
consequence is that self-modifying code updates may not take effect
instantly.

Whatever the architectural guarantees, some CPUs have microarchitectural
behaviour whereby the stale instruction stream may be speculatively
decoded and executed.

Speculation of this form can suffer from type confusion in registers,
and potentially leak data.

For more details, see:
  https://www.vusec.net/projects/fpvi-scsb
  https://www.amd.com/en/corporate-product-security-bulletin-amd-sb-1003
  https://software.intel.com/content/www/us/en/develop/articles/software-security-guidance/advisory-guidance/speculative-code-store-bypass.html
  https://software.intel.com/content/www/us/en/develop/articles/software-security-guidance/advisory-guidance/floating-point-value-injection.html
  https://developer.arm.com/support/arm-security-updates/speculative-processor-vulnerability/frequently-asked-questions#scsb
  https://developer.arm.com/support/arm-security-updates/speculative-processor-vulnerability/frequently-asked-questions#fvpi

IMPACT
======

In attacker might be able to infer the contents of arbitrary host
memory, including memory assigned to other guests.

VULNERABLE SYSTEMS
==================

Systems running all versions of Xen are affected.

Whether a CPU is potentially vulnerable depends on its
microarchitecture.  Consult your hardware vendor.

Xen running on ARM does not have runtime self-modying code, so is
believed to be not vulnerable, irrespective of any hardware
susceptibility.

Xen running on x86 does have runtime self-modying code as part of
emulation, and is believed to be potentially vulnerable.

Xen is not vulnerable if retpoline or lfence mitigations for Spectre v2
protection are active.  Protections depend on compiler support (as
indicated by INDIRECT_THUNK), and a runtime setting (BTI-Thunk):

  # xl dmesg | grep -e INDIRECT_THUNK -e BTI-Thunk
  (XEN)   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING
  (XEN)   Xen settings: BTI-Thunk RETPOLINE, SPEC_CTRL: IBRS+ SSBD-, Other: SRB_LOCK+ IBPB L1D_FLUSH VERW BRANCH_HARDEN

BTI-Thunk as either RETPOLINE or LFENCE prevents the vulnerability.

MITIGATION
==========

If Spectre v2 support is compiled in, but JMP is used by default,
RETPOLINE or LFENCE can be selected with `spec-ctrl=bti-thunk=retpoline`
or `spec-ctrl=bti-thunk=lfence`.

CREDITS
=======

This issue was discovered by Enrico Barberis, Hany Ragab, Herbert Bos,
and Cristiano Giuffrida from the VUSec group at VU Amsterdam.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.  Note that
in 4.13 and newer the patch will only take effect when the
SPECULATIVE_HARDEN_BRANCH hypervisor config option is enabled.  4.12 and
older do not have such an option, and the change will take effect
unconditionally.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa375.patch           xen-unstable - 4.14.x
xsa375-4.13.patch      Xen 4.13.x
xsa375-4.12.patch      Xen 4.12.x - 4.11.x

$ sha256sum xsa375*
367d5bb97c942b9f744a57645df87148772c0879de6f351f36f88147f3958e83  xsa375.meta
301ef80da837bc2af36a0958f35f42f4d267b20ec6e91ae5faf2616167ef49f8  xsa375.patch
dc024daf17242b6477a16a349754a94b2b25cbbfd8c14475741b778710a44c93  xsa375-4.12.patch
f70511d843c6617b932da11ffe857e2e3aa3834ccff07d4d0beba90d63a3dae2  xsa375-4.13.patch
$

NOTE CONCERNING CVE-2021-0086 / CVE-2021-26314
==============================================

Floating Point Value Injection (FPVI) was discovered and disclosed in
the same research as SCSB.  Xen on x86 does in some cases emulate
floating point operations with guest provided inputs, but does not have
subsequent control flow dependent on results, transient or otherwise, of
the operation.

Therefore, we believe Xen is not vulnerable to FPVI, irrespective of any
hardware susceptibility.

NOTE CONCERNING MULTIPLE CVES
=============================

Intel and AMD allocated different CVEs for SCSB and FPVI.  We have
included both on this advisory.  The allocations are as follows:

  Issue | Intel         | AMD
  ------+---------------+---------------
  SCSB  | CVE-2021-0089 | CVE-2021-26313
  FPVI  | CVE-2021-0086 | CVE-2021-26314

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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmDAxVYMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZfKoH/3oVrY0exNwvxp18bXOCYUrzIUYwaXDYCPt3S4GX
JIEZ5Em1SPKEOfexGfjjul6WTiLXQYVof2gx1gWU06ENafEKqoRVJMTryL2Yfi63
IVUifr2lILnYouuIXk+dGSzPmhg9iZ+HwRseNQHwcrRzJnW16VNijWnn74JwfSAV
AWn1inVKriUXJYCTJBBRraQiHMzrDelOo+qB5pNIJHIMtpAK3N1EfkIJFJ0Xe9gl
iKfn+j66CuZorj83bpj5RvSOjgEJiKuMZsKYXK8TPJK6OLR+fEDNx79mHzh1tl2g
VBZOYxXHvTE+SlZwCJotGQ7g3tQJ0JwACPdzvQ6if+xh2N0=
=o800
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa375.meta"
Content-Disposition: attachment; filename="xsa375.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzNzUsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNSIsCiAgICAiNC4xNCIsCiAgICAiNC4xMyIs
CiAgICAiNC4xMiIsCiAgICAiNC4xMSIKICBdLAogICJUcmVlcyI6IFsKICAg
ICJ4ZW4iCiAgXSwKICAiUmVjaXBlcyI6IHsKICAgICI0LjExIjogewogICAg
ICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0
YWJsZVJlZiI6ICJiMWU0NmJjMzY5YmI0OTBiNzIxYzc3ZjE1ZDI1ODNiYmY0
NjYxNTJkIiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAz
NzIsCiAgICAgICAgICAgIDM3MwogICAgICAgICAgXSwKICAgICAgICAgICJQ
YXRjaGVzIjogWwogICAgICAgICAgICAieHNhMzc1LTQuMTMucGF0Y2giCiAg
ICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQuMTIi
OiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAg
ICAgICAiU3RhYmxlUmVmIjogIjU5ODQ5MDViMjYzOGRmODdhMDI2MmQxZWU5
MWYwYTZlMTRhODZkZjYiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAg
ICAgICAgIDM3MiwKICAgICAgICAgICAgMzczCiAgICAgICAgICBdLAogICAg
ICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EzNzUtNC4xMy5w
YXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAg
ICAiNC4xMyI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6
IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiMjg0MTMyOTM4OTAwY2U4YzNi
MTFiYWJmNzI1NWY1YzZkYmIyMTcxNiIsCiAgICAgICAgICAiUHJlcmVxcyI6
IFsKICAgICAgICAgICAgMzcyLAogICAgICAgICAgICAzNzMKICAgICAgICAg
IF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTM3
NS00LjEzLnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQog
ICAgfSwKICAgICI0LjE0IjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAg
ICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICIxMGYwYjJkNDkz
NzY4NjVkNDk2ODBmMDZjNTJiNDUxZmFiY2UzYmI1IiwKICAgICAgICAgICJQ
cmVyZXFzIjogWwogICAgICAgICAgICAzNzIsCiAgICAgICAgICAgIDM3Mwog
ICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAg
ICAieHNhMzc1LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAg
fQogICAgfSwKICAgICI0LjE1IjogewogICAgICAiUmVjaXBlcyI6IHsKICAg
ICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICIyODBkNDcy
ZjRmY2EwNzBhMTAzNzdlMzE4ZDkwY2FiZmMyNTQwODEwIiwKICAgICAgICAg
ICJQcmVyZXFzIjogWwogICAgICAgICAgICAzNzIsCiAgICAgICAgICAgIDM3
MwogICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAg
ICAgICAieHNhMzc1LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAg
ICAgfQogICAgfSwKICAgICJtYXN0ZXIiOiB7CiAgICAgICJSZWNpcGVzIjog
ewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogImFh
NzdhY2MyODA5OGQwNDk0NWFmOTk4ZjNmYzBkYmQzNzU5YjViNDEiLAogICAg
ICAgICAgIlByZXJlcXMiOiBbCiAgICAgICAgICAgIDM3MiwKICAgICAgICAg
ICAgMzczCiAgICAgICAgICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAg
ICAgICAgICAgICJ4c2EzNzUucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAg
fQogICAgICB9CiAgICB9CiAgfQp9

--=separator
Content-Type: application/octet-stream; name="xsa375.patch"
Content-Disposition: attachment; filename="xsa375.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L3NwZWMtY3RybDogUHJvdGVjdCBhZ2FpbnN0IFNw
ZWN1bGF0aXZlIENvZGUgU3RvcmUgQnlwYXNzCgpNb2Rlcm4geDg2IHByb2Nl
c3NvcnMgaGF2ZSBmYXItYmV0dGVyLXRoYW4tYXJjaGl0ZWN0dXJhbGx5LWd1
YXJhbnRlZWQgc2VsZgptb2RpZnlpbmcgY29kZSBkZXRlY3Rpb24uICBUeXBp
Y2FsbHksIHdoZW4gYSB3cml0ZSBoaXRzIGFuIGluc3RydWN0aW9uIGluCmZs
aWdodCwgYSBNYWNoaW5lIENsZWFyIG9jY3VycyB0byBmbHVzaCBzdGFsZSBj
b250ZW50IGluIHRoZSBmcm9udGVuZCBhbmQKYmFja2VuZC4KCkZvciBzZWxm
IG1vZGlmeWluZyBjb2RlLCBiZWZvcmUgYSB3cml0ZSB3aGljaCBoaXRzIGFu
IGluc3RydWN0aW9uIGluIGZsaWdodApyZXRpcmVzLCB0aGUgZnJvbnRlbmQg
Y2FuIHNwZWN1bGF0aXZlbHkgZGVjb2RlIGFuZCBleGVjdXRlIHRoZSBvbGQg
aW5zdHJ1Y3Rpb24Kc3RyZWFtLiAgU3BlY3VsYXRpb24gb2YgdGhpcyBmb3Jt
IGNhbiBzdWZmZXIgZnJvbSB0eXBlIGNvbmZ1c2lvbiBpbiByZWdpc3RlcnMs
CmFuZCBwb3RlbnRpYWxseSBsZWFrIGRhdGEuCgpGdXJ0aGVybW9yZSwgdXBk
YXRlcyBhcmUgdHlwaWNhbGx5IGJ5dGUtd2lzZSwgcmF0aGVyIHRoYW4gYXRv
bWljLiAgRGVwZW5kaW5nCm9uIHRpbWluZywgc3BlY3VsYXRpb24gY2FuIHJh
Y2UgYWhlYWQgbXVsdGlwbGUgdGltZXMgYmV0d2VlbiBpbmRpdmlkdWFsCndy
aXRlcywgYW5kIGV4ZWN1dGUgdGhlIHRyYW5zaWVudGx5LW1hbGZvcm1lZCBp
bnN0cnVjdGlvbiBzdHJlYW0uCgpYZW4gaGFzIHN0dWJzIHdoaWNoIGFyZSB1
c2VkIGluIGNlcnRhaW4gY2FzZXMgZm9yIGVtdWxhdGlvbiBwdXJwb3Nlcy4g
IEluaGliaXQKc3BlY3VsYXRpb24gYmV0d2VlbiB1cGRhdGluZyB0aGUgc3R1
YiBhbmQgZXhlY3V0aW5nIGl0LgoKVGhpcyBpcyBYU0EtMzc1IC8gQ1ZFLTIw
MjEtMDA4OS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L3B2L2VtdWwtcHJpdi1vcC5jIGIveGVuL2FyY2gveDg2L3B2L2VtdWwt
cHJpdi1vcC5jCmluZGV4IDg4ODk1MDlkMmEuLjExNDY3YTFlM2EgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9wdi9lbXVsLXByaXYtb3AuYworKysgYi94
ZW4vYXJjaC94ODYvcHYvZW11bC1wcml2LW9wLmMKQEAgLTEzOCw2ICsxMzgs
OCBAQCBzdGF0aWMgaW9fZW11bF9zdHViX3QgKmlvX2VtdWxfc3R1Yl9zZXR1
cChzdHJ1Y3QgcHJpdl9vcF9jdHh0ICpjdHh0LCB1OCBvcGNvZGUsCiAgICAg
LyogUnVudGltZSBjb25maXJtYXRpb24gdGhhdCB3ZSBoYXZlbid0IGNsb2Ji
ZXJlZCBhbiBhZGphY2VudCBzdHViLiAqLwogICAgIEJVR19PTihTVFVCX0JV
Rl9TSVpFIC8gMiA8IChwIC0gY3R4dC0+aW9fZW11bF9zdHViKSk7CiAKKyAg
ICBibG9ja19zcGVjdWxhdGlvbigpOyAvKiBTQ1NCICovCisKICAgICAvKiBI
YW5keSBmdW5jdGlvbi10eXBlZCBwb2ludGVyIHRvIHRoZSBzdHViLiAqLwog
ICAgIHJldHVybiAodm9pZCAqKXN0dWJfdmE7CiAKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jIGIveGVuL2Fy
Y2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKaW5kZXggYzI1ZDg4
ZDBkOC4uZjQyZmYyYTgzNyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3g4
Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKKysrIGIveGVuL2FyY2gveDg2L3g4
Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKQEAgLTEyNTcsNiArMTI1Nyw3IEBA
IHN0YXRpYyBpbmxpbmUgaW50IG1rZWModWludDhfdCBlLCBpbnQzMl90IGVj
LCAuLi4pCiAjIGRlZmluZSBpbnZva2Vfc3R1YihwcmUsIHBvc3QsIGNvbnN0
cmFpbnRzLi4uKSBkbyB7ICAgICAgICAgICAgICAgICAgICBcCiAgICAgc3R1
Yl9leG4uaW5mbyA9ICh1bmlvbiBzdHViX2V4Y2VwdGlvbl90b2tlbikgeyAu
cmF3ID0gfjAgfTsgICAgICAgICBcCiAgICAgc3R1Yl9leG4ubGluZSA9IF9f
TElORV9fOyAvKiBVdGlsaXR5IG91dHdlaWdocyBsaXZlcGF0Y2hpbmcgY29z
dCAqLyBcCisgICAgYmxvY2tfc3BlY3VsYXRpb24oKTsgLyogU0NTQiAqLyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgYXNt
IHZvbGF0aWxlICggcHJlICJcblx0SU5ESVJFQ1RfQ0FMTCAlW3N0dWJdXG5c
dCIgcG9zdCAiXG4iICAgICAgICBcCiAgICAgICAgICAgICAgICAgICAgIi5M
cmV0JT06XG5cdCIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCiAgICAgICAgICAgICAgICAgICAgIi5wdXNoc2VjdGlvbiAuZml4
dXAsXCJheFwiXG4iICAgICAgICAgICAgICAgICAgICAgICBcCg==

--=separator
Content-Type: application/octet-stream; name="xsa375-4.12.patch"
Content-Disposition: attachment; filename="xsa375-4.12.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L3NwZWMtY3RybDogUHJvdGVjdCBhZ2FpbnN0IFNw
ZWN1bGF0aXZlIENvZGUgU3RvcmUgQnlwYXNzCgpNb2Rlcm4geDg2IHByb2Nl
c3NvcnMgaGF2ZSBmYXItYmV0dGVyLXRoYW4tYXJjaGl0ZWN0dXJhbGx5LWd1
YXJhbnRlZWQgc2VsZgptb2RpZnlpbmcgY29kZSBkZXRlY3Rpb24uICBUeXBp
Y2FsbHksIHdoZW4gYSB3cml0ZSBoaXRzIGFuIGluc3RydWN0aW9uIGluCmZs
aWdodCwgYSBNYWNoaW5lIENsZWFyIG9jY3VycyB0byBmbHVzaCBzdGFsZSBj
b250ZW50IGluIHRoZSBmcm9udGVuZCBhbmQKYmFja2VuZC4KCkZvciBzZWxm
IG1vZGlmeWluZyBjb2RlLCBiZWZvcmUgYSB3cml0ZSB3aGljaCBoaXRzIGFu
IGluc3RydWN0aW9uIGluIGZsaWdodApyZXRpcmVzLCB0aGUgZnJvbnRlbmQg
Y2FuIHNwZWN1bGF0aXZlbHkgZGVjb2RlIGFuZCBleGVjdXRlIHRoZSBvbGQg
aW5zdHJ1Y3Rpb24Kc3RyZWFtLiAgU3BlY3VsYXRpb24gb2YgdGhpcyBmb3Jt
IGNhbiBzdWZmZXIgZnJvbSB0eXBlIGNvbmZ1c2lvbiBpbiByZWdpc3RlcnMs
CmFuZCBwb3RlbnRpYWxseSBsZWFrIGRhdGEuCgpGdXJ0aGVybW9yZSwgdXBk
YXRlcyBhcmUgdHlwaWNhbGx5IGJ5dGUtd2lzZSwgcmF0aGVyIHRoYW4gYXRv
bWljLiAgRGVwZW5kaW5nCm9uIHRpbWluZywgc3BlY3VsYXRpb24gY2FuIHJh
Y2UgYWhlYWQgbXVsdGlwbGUgdGltZXMgYmV0d2VlbiBpbmRpdmlkdWFsCndy
aXRlcywgYW5kIGV4ZWN1dGUgdGhlIHRyYW5zaWVudGx5LW1hbGZvcm1lZCBp
bnN0cnVjdGlvbiBzdHJlYW0uCgpYZW4gaGFzIHN0dWJzIHdoaWNoIGFyZSB1
c2VkIGluIGNlcnRhaW4gY2FzZXMgZm9yIGVtdWxhdGlvbiBwdXJwb3Nlcy4g
IEluaGliaXQKc3BlY3VsYXRpb24gYmV0d2VlbiB1cGRhdGluZyB0aGUgc3R1
YiBhbmQgZXhlY3V0aW5nIGl0LgoKVGhpcyBpcyBYU0EtMzc1IC8gQ1ZFLTIw
MjEtMDA4OS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L3B2L2VtdWwtcHJpdi1vcC5jIGIveGVuL2FyY2gveDg2L3B2L2VtdWwt
cHJpdi1vcC5jCmluZGV4IDZkYzRmOTJhODQuLjU5YzE1Y2EwZTcgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9wdi9lbXVsLXByaXYtb3AuYworKysgYi94
ZW4vYXJjaC94ODYvcHYvZW11bC1wcml2LW9wLmMKQEAgLTk3LDYgKzk3LDgg
QEAgc3RhdGljIGlvX2VtdWxfc3R1Yl90ICppb19lbXVsX3N0dWJfc2V0dXAo
c3RydWN0IHByaXZfb3BfY3R4dCAqY3R4dCwgdTggb3Bjb2RlLAogICAgIEJV
SUxEX0JVR19PTihTVFVCX0JVRl9TSVpFIC8gMiA8IE1BWCg5LCAvKiBEZWZh
dWx0IGVtdWwgc3R1YiAqLwogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA1ICsgSU9FTVVMX1FVSVJLX1NUVUJfQllURVMpKTsK
IAorICAgIGFzbSB2b2xhdGlsZSAoICJsZmVuY2UiIDo6OiAibWVtb3J5IiAp
OyAvKiBTQ1NCICovCisKICAgICAvKiBIYW5keSBmdW5jdGlvbi10eXBlZCBw
b2ludGVyIHRvIHRoZSBzdHViLiAqLwogICAgIHJldHVybiAodm9pZCAqKXN0
dWJfdmE7CiB9CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveDg2X2VtdWxh
dGUveDg2X2VtdWxhdGUuYyBiL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94
ODZfZW11bGF0ZS5jCmluZGV4IGJiYTZkZDAxODcuLmNkMTIzNDkyYTYgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0
ZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0
ZS5jCkBAIC0xMDkzLDYgKzEwOTMsNyBAQCBzdGF0aWMgaW5saW5lIGludCBt
a2VjKHVpbnQ4X3QgZSwgaW50MzJfdCBlYywgLi4uKQogIyBkZWZpbmUgaW52
b2tlX3N0dWIocHJlLCBwb3N0LCBjb25zdHJhaW50cy4uLikgZG8geyAgICAg
ICAgICAgICAgICAgICAgXAogICAgIHN0dWJfZXhuLmluZm8gPSAodW5pb24g
c3R1Yl9leGNlcHRpb25fdG9rZW4pIHsgLnJhdyA9IH4wIH07ICAgICAgICAg
XAogICAgIHN0dWJfZXhuLmxpbmUgPSBfX0xJTkVfXzsgLyogVXRpbGl0eSBv
dXR3ZWlnaHMgbGl2ZXBhdGNoaW5nIGNvc3QgKi8gXAorICAgIGFzbSB2b2xh
dGlsZSAoICJsZmVuY2UiIDo6OiAibWVtb3J5IiApOyAvKiBTQ1NCICovICAg
ICAgICAgICAgICAgICAgXAogICAgIGFzbSB2b2xhdGlsZSAoIHByZSAiXG5c
dElORElSRUNUX0NBTEwgJVtzdHViXVxuXHQiIHBvc3QgIlxuIiAgICAgICAg
XAogICAgICAgICAgICAgICAgICAgICIuTHJldCU9OlxuXHQiICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAg
ICAgICAgICIucHVzaHNlY3Rpb24gLmZpeHVwLFwiYXhcIlxuIiAgICAgICAg
ICAgICAgICAgICAgICAgXAo=

--=separator
Content-Type: application/octet-stream; name="xsa375-4.13.patch"
Content-Disposition: attachment; filename="xsa375-4.13.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L3NwZWMtY3RybDogUHJvdGVjdCBhZ2FpbnN0IFNw
ZWN1bGF0aXZlIENvZGUgU3RvcmUgQnlwYXNzCgpNb2Rlcm4geDg2IHByb2Nl
c3NvcnMgaGF2ZSBmYXItYmV0dGVyLXRoYW4tYXJjaGl0ZWN0dXJhbGx5LWd1
YXJhbnRlZWQgc2VsZgptb2RpZnlpbmcgY29kZSBkZXRlY3Rpb24uICBUeXBp
Y2FsbHksIHdoZW4gYSB3cml0ZSBoaXRzIGFuIGluc3RydWN0aW9uIGluCmZs
aWdodCwgYSBNYWNoaW5lIENsZWFyIG9jY3VycyB0byBmbHVzaCBzdGFsZSBj
b250ZW50IGluIHRoZSBmcm9udGVuZCBhbmQKYmFja2VuZC4KCkZvciBzZWxm
IG1vZGlmeWluZyBjb2RlLCBiZWZvcmUgYSB3cml0ZSB3aGljaCBoaXRzIGFu
IGluc3RydWN0aW9uIGluIGZsaWdodApyZXRpcmVzLCB0aGUgZnJvbnRlbmQg
Y2FuIHNwZWN1bGF0aXZlbHkgZGVjb2RlIGFuZCBleGVjdXRlIHRoZSBvbGQg
aW5zdHJ1Y3Rpb24Kc3RyZWFtLiAgU3BlY3VsYXRpb24gb2YgdGhpcyBmb3Jt
IGNhbiBzdWZmZXIgZnJvbSB0eXBlIGNvbmZ1c2lvbiBpbiByZWdpc3RlcnMs
CmFuZCBwb3RlbnRpYWxseSBsZWFrIGRhdGEuCgpGdXJ0aGVybW9yZSwgdXBk
YXRlcyBhcmUgdHlwaWNhbGx5IGJ5dGUtd2lzZSwgcmF0aGVyIHRoYW4gYXRv
bWljLiAgRGVwZW5kaW5nCm9uIHRpbWluZywgc3BlY3VsYXRpb24gY2FuIHJh
Y2UgYWhlYWQgbXVsdGlwbGUgdGltZXMgYmV0d2VlbiBpbmRpdmlkdWFsCndy
aXRlcywgYW5kIGV4ZWN1dGUgdGhlIHRyYW5zaWVudGx5LW1hbGZvcm1lZCBp
bnN0cnVjdGlvbiBzdHJlYW0uCgpYZW4gaGFzIHN0dWJzIHdoaWNoIGFyZSB1
c2VkIGluIGNlcnRhaW4gY2FzZXMgZm9yIGVtdWxhdGlvbiBwdXJwb3Nlcy4g
IEluaGliaXQKc3BlY3VsYXRpb24gYmV0d2VlbiB1cGRhdGluZyB0aGUgc3R1
YiBhbmQgZXhlY3V0aW5nIGl0LgoKVGhpcyBpcyBYU0EtMzc1IC8gQ1ZFLTIw
MjEtMDA4OS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L3B2L2VtdWwtcHJpdi1vcC5jIGIveGVuL2FyY2gveDg2L3B2L2VtdWwt
cHJpdi1vcC5jCmluZGV4IDZkYzRmOTJhODQuLjU5YzE1Y2EwZTcgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9wdi9lbXVsLXByaXYtb3AuYworKysgYi94
ZW4vYXJjaC94ODYvcHYvZW11bC1wcml2LW9wLmMKQEAgLTk3LDYgKzk3LDgg
QEAgc3RhdGljIGlvX2VtdWxfc3R1Yl90ICppb19lbXVsX3N0dWJfc2V0dXAo
c3RydWN0IHByaXZfb3BfY3R4dCAqY3R4dCwgdTggb3Bjb2RlLAogICAgIEJV
SUxEX0JVR19PTihTVFVCX0JVRl9TSVpFIC8gMiA8IE1BWCg5LCAvKiBEZWZh
dWx0IGVtdWwgc3R1YiAqLwogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA1ICsgSU9FTVVMX1FVSVJLX1NUVUJfQllURVMpKTsK
IAorICAgIGJsb2NrX3NwZWN1bGF0aW9uKCk7IC8qIFNDU0IgKi8KKwogICAg
IC8qIEhhbmR5IGZ1bmN0aW9uLXR5cGVkIHBvaW50ZXIgdG8gdGhlIHN0dWIu
ICovCiAgICAgcmV0dXJuICh2b2lkICopc3R1Yl92YTsKIH0KZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jIGIv
eGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKaW5kZXgg
YmJhNmRkMDE4Ny4uY2QxMjM0OTJhNiAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKKysrIGIveGVuL2FyY2gv
eDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKQEAgLTExNzIsNiArMTE3
Miw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IG1rZWModWludDhfdCBlLCBpbnQz
Ml90IGVjLCAuLi4pCiAjIGRlZmluZSBpbnZva2Vfc3R1YihwcmUsIHBvc3Qs
IGNvbnN0cmFpbnRzLi4uKSBkbyB7ICAgICAgICAgICAgICAgICAgICBcCiAg
ICAgc3R1Yl9leG4uaW5mbyA9ICh1bmlvbiBzdHViX2V4Y2VwdGlvbl90b2tl
bikgeyAucmF3ID0gfjAgfTsgICAgICAgICBcCiAgICAgc3R1Yl9leG4ubGlu
ZSA9IF9fTElORV9fOyAvKiBVdGlsaXR5IG91dHdlaWdocyBsaXZlcGF0Y2hp
bmcgY29zdCAqLyBcCisgICAgYmxvY2tfc3BlY3VsYXRpb24oKTsgLyogU0NT
QiAqLyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAg
ICAgYXNtIHZvbGF0aWxlICggcHJlICJcblx0SU5ESVJFQ1RfQ0FMTCAlW3N0
dWJdXG5cdCIgcG9zdCAiXG4iICAgICAgICBcCiAgICAgICAgICAgICAgICAg
ICAgIi5McmV0JT06XG5cdCIgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCiAgICAgICAgICAgICAgICAgICAgIi5wdXNoc2VjdGlv
biAuZml4dXAsXCJheFwiXG4iICAgICAgICAgICAgICAgICAgICAgICBcCg==

--=separator--

