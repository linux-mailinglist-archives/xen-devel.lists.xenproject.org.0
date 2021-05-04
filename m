Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA303729CD
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 14:02:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122182.230459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtkz-0000sK-7e; Tue, 04 May 2021 12:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122182.230459; Tue, 04 May 2021 12:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtkz-0000ru-49; Tue, 04 May 2021 12:02:29 +0000
Received: by outflank-mailman (input) for mailman id 122182;
 Tue, 04 May 2021 12:02:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2eVL=J7=xenbits.xen.org=julieng@srs-us1.protection.inumbo.net>)
 id 1ldtkw-0000q5-VQ
 for xen-devel@lists.xen.org; Tue, 04 May 2021 12:02:27 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80c90052-ae1b-416c-b221-1b0e36a3409d;
 Tue, 04 May 2021 12:02:16 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1ldtkc-0001gK-7N; Tue, 04 May 2021 12:02:06 +0000
Received: from julieng by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1ldtkc-0005td-56; Tue, 04 May 2021 12:02:06 +0000
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
X-Inumbo-ID: 80c90052-ae1b-416c-b221-1b0e36a3409d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=m+HDPtEAJGdPrWsIa+xOu+7ahCc1X7yMC3b4EdNbWb8=; b=wk9lTLXjwro3m4kUC8DGJNufDF
	dM2KaT24y4tgaFbYNdL0XQvJmK9pSYZCMch4JApsrsNVkJp7dmrrMocD4b1ZIANKDav4CtdmemR8I
	Xh8saZ2aI/ZbOkkUjZW5s2fSbJnuQjgFzHJiuV2o79/A9kiEWRfj0QL1IbiECMbgxSVw=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 370 v2 (CVE-2021-28689) - x86: Speculative
 vulnerabilities with bare (non-shim) 32-bit PV guests
Message-Id: <E1ldtkc-0005td-56@xenbits.xenproject.org>
Date: Tue, 04 May 2021 12:02:06 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2021-28689 / XSA-370
                               version 2

   x86: Speculative vulnerabilities with bare (non-shim) 32-bit PV guests

UPDATES IN VERSION 2
====================

Note that the patch is docs-only and the affected version ranges, in the
files summary of the Resolution section.

Public release.

ISSUE DESCRIPTION
=================

32-bit x86 PV guest kernels run in ring 1.  At the time when Xen was
developed, this area of the i386 architecture was rarely used, which is why
Xen was able to use it to implement paravirtualisation, Xen's novel
approach to virtualization.  In AMD64, Xen had to use a different
implementation approach, so Xen does not use ring 1 to support 64-bit
guests.  With the focus now being on 64-bit systems, and the availability
of explicit hardware support for virtualization, fixing speculation issues
in ring 1 is not a priority for processor companies.

Indirect Branch Restricted Speculation (IBRS) is an architectural x86
extension put together to combat speculative execution sidechannel attacks,
including Spectre v2.  It was retrofitted in microcode to existing CPUs.

For more details on Spectre v2, see:
  http://xenbits.xen.org/xsa/advisory-254.html

However, IBRS does not architecturally protect ring 0 from predictions
learnt in ring 1.

For more details, see:
  https://software.intel.com/security-software-guidance/deep-dives/deep-dive-indirect-branch-restricted-speculation

Similar situations may exist with other mitigations for other kinds of
speculative execution attacks.  The situation is quite likely to be similar
for speculative execution attacks which have yet to be discovered,
disclosed, or mitigated.

IMPACT
======

A malicious 32-bit guest kernel may be able to mount a Spectre v2 attack
against Xen, despite the presence hardware protections being active.

It therefore might be able to infer the contents of arbitrary host memory,
including memory assigned to other guests.

VULNERABLE SYSTEMS
==================

Systems running all versions of Xen are affected.

Only x86 systems are vulnerable, and only CPUs which are potentially
vulnerable to Spectre v2.  Consult your hardware manufacturer.

The vulnerability can only be exploited by 32-bit PV guests which are not
run in PV-Shim.

MITIGATION
==========

Running 32-bit PV guests under PV-Shim avoids the vulnerability when Spectre v2
protections are otherwise enabled on the system.

PV shim is available and fully security-supported in all
security-supported versions of Xen.  Using shim is the recommended
configuration.

Not running 32-bit PV guests avoids the vulnerability.

CREDITS
=======

This issue was discovered by Jann Horn of Google Project Zero.

RESOLUTION
==========

There is no resolution available, and none is ever expected.

The patches provided only update the security support statement.

The first patch is an unavoidable consequence of the discussions
above; the support status described is in effect immediately.

The security team does not consider the support status listed in patch
1 to be particularly useful; however, we do not feel we have the
authority to completely de-support non-shim 32-bit PV guests without
community consultation.

The second patch is the long-term support status the security team
proposes to the community. It will not become effective until three
weeks after the XSA-370 embargo lifts, and only if there are no
objections raised before that point.

If you need security support for un-shimmed 32-bit PV guests, please
make your voice heard on xen-devel@lists.xenproject.org (or to
security@xenproject.org) as soon as possible after the embargo lifts.

xsa370/*.patch         Xen unstable (docs only)
<no fix available>     Xen (all versions)

$ sha256sum xsa370* xsa370*/*
ffb6e1be6a849b8e6930386d70817f53970f3d71a0a89980565c87070e85a7e2  xsa370.meta
45c11df550f1900663a388106d6625e84fa280881e613825c830b1984f87b3a9  xsa370/0001-SUPPORT.md-Document-speculative-attacks-status-of-no.patch
48dfe434bcdf4f08b623b639079fd1c9f9b1939b279200550dbae7736340cb53  xsa370/0002-SUPPORT.md-Un-shimmed-32-bit-PV-guests-are-no-longer.patch
$

BARE 32 BIT PV SECURITY SUPPORT STATUS
======================================

This advisory discloses only a (very serious) information disclosure
vulnerability exploitable by bare 32 bit PV guests, using speculative
execution.

We are considering further entirely withdrawing security support for
configurations with non-shim 32 bit PV guests.  Any such decision,
including the precise scope of the (de)support, will be made following
public community discussion.

The result of that public process will be a patch to the security support
statement, backported (as applicable) to the relevant trees.

NOTE REGARDING EMBARGO
======================

In principle, the fact that the new CPU facilities are not capable of
protecting ring 0 Xen from a ring 1 PV guest, might be gleaned from
the hardware vendor documentation.

Howver, in practice this docuemntation is so difficult to find and
interpret that the implications discussed in this advisory are not
recognised widely, if at all.

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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmCRH6YMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZNZIIAJiJsQvTRMfiBJ5+Yg4gyT7/T4vVkLZ4+j8FBlXL
1+SnIcOu5wgU0tmOADl58us9nZVZfo6X5xV4A+oJwrYvunI/1oGn27ylr3c0FYUH
PLSa8bGIw3BeeAGEpADL3rPIQtTeiokpGlkRSNaAz1N8kKypcY+4Ds4Pjtgz3Gd4
gk2y7U2wReV7OItk7Sp1lstyBdda1qClXedKJa+dENSzsf/6/o9Nad8sgCosMj+k
dx65CNgUWC2JRsMq+4fMTwhE2CtIh9IL4ylv7RyqI/ICW8UTMS2XOnALyjVIu1bI
96HCYrSCNclebmHI1385PV3CXUk6Goue0EDk3FxRTaBv7SM=
=YLXZ
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa370.meta"
Content-Disposition: attachment; filename="xsa370.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzNzAsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIKICBdLAogICJUcmVlcyI6IFsKICAgICJ4ZW4iCiAgXSwKICAi
UmVjaXBlcyI6IHsKICAgICJtYXN0ZXIiOiB7CiAgICAgICJSZWNpcGVzIjog
ewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogIjQ4
MzQ5MzY1NDlmNzg4Mzc4OTE4ZGE4ZTliYzk3ZGY3ZGQzZWUxNmQiLAogICAg
ICAgICAgIlByZXJlcXMiOiBbXSwKICAgICAgICAgICJQYXRjaGVzIjogWwog
ICAgICAgICAgICAieHNhMzcwLyoucGF0Y2giCiAgICAgICAgICBdCiAgICAg
ICAgfQogICAgICB9CiAgICB9CiAgfQp9

--=separator
Content-Type: application/octet-stream;
 name="xsa370/0001-SUPPORT.md-Document-speculative-attacks-status-of-no.patch"
Content-Disposition: attachment;
 filename="xsa370/0001-SUPPORT.md-Document-speculative-attacks-status-of-no.patch"
Content-Transfer-Encoding: base64

RnJvbSA0ZTM3ZTIxZjZlNzE3NTJmYjY5YzI3YWI5ZjE0MTdhNWQxOWViZWRi
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KRGF0ZTogVHVlLCA5IE1hciAy
MDIxIDE1OjAwOjQ3ICswMDAwClN1YmplY3Q6IFtQQVRDSCAxLzJdIFNVUFBP
UlQubWQ6IERvY3VtZW50IHNwZWN1bGF0aXZlIGF0dGFja3Mgc3RhdHVzIG9m
CiBub24tc2hpbSAzMi1iaXQgUFYKClRoaXMgZG9jdW1lbnRzLCBidXQgZG9l
cyBub3QgZml4LCBYU0EtMzcwLgoKUmVwb3J0ZWQtYnk6IEphbm4gSG9ybiA8
amFubmhAZ29vZ2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IEdl
b3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KQWNrZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCgpOQiB0
aGF0IHRoZSBzZWN1cml0eSB0ZWFtIGRvZXMgbm90IGNvbnNpZGVyIHRoZSBz
ZWN1cml0eSBzdXBwb3J0CnN0YXR1cyBvZiB1bi1zaGltbWVkIDMyLWJpdCBQ
ViBndWVzdHMgaW4gdGhpcyBwYXRjaCB0byBiZSBwYXJ0aWN1bGFybHkKdXNl
ZnVsLiBIb3dldmVyLCB3ZSBkbyBub3QgY29uc2lkZXIgb3Vyc2VsdmVzIHRv
IGhhdmUgdGhlIGF1dGhvcml0eSB0byBkZWNpZGUKdG8gY29tcGxldGVseSBk
ZS1zdXBwb3J0IDMyLWJpdCBQViBndWVzdHMgd2l0aG91dCBjb21tdW5pdHkg
Y29uc3VsdGF0aW9uLgoKVGhlIHN1cHBvcnQgc3RhdHVzIGluIHRoaXMgcGF0
Y2ggc2hvdWxkIHRoZXJlZm9yZSBiZSBjb25zaWRlcmVkCnRyYW5zaXRpb25h
bC4gIEEgcGVybWFuZW50IHN1cHBvcnQgc3RhdHVzIGlzIHByb3Bvc2VkIGlu
IGEgc3Vic2VxdWVudApwYXRjaCBpbiB0aGlzIHNlcmllcy4KCnYyOgotIEZp
eCBkb3VibGUgJ2JlJwotIERvbid0IG1lbnRpb24gdXNlciAtPiBrZXJuZWwg
YXR0YWNrcywgd2hpY2ggaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggWGVuCi0t
LQogU1VQUE9SVC5tZCB8IDExICsrKysrKysrKystCiAxIGZpbGUgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL1NVUFBPUlQubWQgYi9TVVBQT1JULm1kCmluZGV4IDdkYjQ1NjhmMWEu
LjZkY2Q5M2UyMmYgMTAwNjQ0Ci0tLSBhL1NVUFBPUlQubWQKKysrIGIvU1VQ
UE9SVC5tZApAQCAtODQsNyArODQsMTYgQEAgVHJhZGl0aW9uYWwgWGVuIFBW
IGd1ZXN0CiAKIE5vIGhhcmR3YXJlIHJlcXVpcmVtZW50cwogCi0gICAgU3Rh
dHVzOiBTdXBwb3J0ZWQKKyAgICBTdGF0dXMsIHg4Nl82NDogU3VwcG9ydGVk
CisgICAgU3RhdHVzLCB4ODZfMzIsIHNoaW06IFN1cHBvcnRlZAorICAgIFN0
YXR1cywgeDg2XzMyLCB3aXRob3V0IHNoaW06IFN1cHBvcnRlZCwgd2l0aCBj
YXZlYXRzCisKK0R1ZSB0byBhcmNoaXRlY3R1cmFsIGxpbWl0YXRpb25zLAor
MzItYml0IFBWIGd1ZXN0cyBtdXN0IGJlIGFzc3VtZWQgdG8gYmUgYWJsZSB0
byByZWFkIGFyYml0cmFyeSBob3N0IG1lbW9yeQordXNpbmcgc3BlY3VsYXRp
dmUgZXhlY3V0aW9uIGF0dGFja3MuCitBZHZpc29yaWVzIHdpbGwgY29udGlu
dWUgdG8gYmUgaXNzdWVkCitmb3IgbmV3IHZ1bG5lcmFiaWxpdGllcyByZWxh
dGVkIHRvIHVuLXNoaW1tZWQgMzItYml0IFBWIGd1ZXN0cworZW5hYmxpbmcg
ZGVuaWFsLW9mLXNlcnZpY2UgYXR0YWNrcyBvciBwcml2aWxlZ2UgZXNjYWxh
dGlvbiBhdHRhY2tzLgogCiAjIyMgeDg2L0hWTQogCi0tIAoyLjMwLjIKCg==

--=separator
Content-Type: application/octet-stream;
 name="xsa370/0002-SUPPORT.md-Un-shimmed-32-bit-PV-guests-are-no-longer.patch"
Content-Disposition: attachment;
 filename="xsa370/0002-SUPPORT.md-Un-shimmed-32-bit-PV-guests-are-no-longer.patch"
Content-Transfer-Encoding: base64

RnJvbTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29t
PgpTdWJqZWN0OiBTVVBQT1JULm1kOiBVbi1zaGltbWVkIDMyLWJpdCBQViBn
dWVzdHMgYXJlIG5vIGxvbmdlciBzdXBwb3J0ZWQKClRoZSBzdXBwb3J0IHN0
YXR1cyBvZiAzMi1iaXQgZ3Vlc3RzIGRvZXNuJ3Qgc2VlbSBwYXJ0aWN1bGFy
bHkgdXNlZnVsLgoKV2l0aCBpdCBjaGFuZ2VkIHRvIGZ1bGx5IHVuc3VwcG9y
dGVkIG91dHNpZGUgb2YgUFYtc2hpbSwgYWRqdXN0IHRoZSBQVjMyCktjb25m
aWcgZGVmYXVsdCBhY2NvcmRpbmdseS4KClJlcG9ydGVkLWJ5OiBKYW5uIEhv
cm4gPGphbm5oQGdvb2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IEdlb3JnZSBE
dW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KCk5CIHRo
aXMgcGF0Y2ggc2hvdWxkIGJlIGNvbnNpZGVyZWQgYSBwcm9wb3NhbCB0byB0
aGUgY29tbXVuaXR5LiAgSXQKd2lsbCBub3QgYmVjb21lIGVmZmVjdGl2ZSB1
bnRpbCB0aHJlZSB3ZWVrcyBhZnRlciB0aGUgWFNBLTM3MCBlbWJhcmdvCmxp
ZnRzLCBhbmQgb25seSBpZiB0aGVyZSBhcmUgbm8gb2JqZWN0aW9ucyByYWlz
ZWQgYmVmb3JlIHRoYXQgcG9pbnQuCgpUQkQ6IFNob3VsZCB3ZSBhbHNvIGRl
ZmF1bHQgb3B0X3B2MzIgdG8gZmFsc2Ugd2hlbiBub3QgcnVubmluZyBpbiBz
aGltCiAgICAgbW9kZT8KClRoZSAoZm9yd2FyZCkgZGVwZW5kZW5jeSBvbiBQ
Vl9TSElNIGlzbid0IHZlcnkgdXNlZnVsIGVzcGVjaWFsbHkgd2hlbgpjb25m
aWd1cmluZyBmcm9tIHNjcmF0Y2ggLSB3ZSBtYXkgd2FudCB0byByZS1vcmRl
ciBpdGVtcyBkb3duIHRoZSByb2FkLApzdWNoIHRoYXQgdGhlIHByb21wdCBm
b3IgUFZfU0hJTSBvY2N1cnMgYWhlYWQgb2YgdGhhdCBmb3IgUFYzMi4gWWV0
IHRoZW4KdGhpcyBjb25mbGljdHMgd2l0aCBQVl9TSElNIGFsc28gZGVwZW5k
aW5nIG9uIEdVRVNULgoKdjM6Ci0gQWRkIEtjb25maWcgYWRqdXN0bWVudC4K
CnYyOgotIFBvcnQgb3ZlciBjaGFuZ2VzIGluIHBhdGNoIDEKCi0tLSBhL1NV
UFBPUlQubWQKKysrIGIvU1VQUE9SVC5tZApAQCAtODYsMTQgKzg2LDcgQEAg
Tm8gaGFyZHdhcmUgcmVxdWlyZW1lbnRzCiAKICAgICBTdGF0dXMsIHg4Nl82
NDogU3VwcG9ydGVkCiAgICAgU3RhdHVzLCB4ODZfMzIsIHNoaW06IFN1cHBv
cnRlZAotICAgIFN0YXR1cywgeDg2XzMyLCB3aXRob3V0IHNoaW06IFN1cHBv
cnRlZCwgd2l0aCBjYXZlYXRzCi0KLUR1ZSB0byBhcmNoaXRlY3R1cmFsIGxp
bWl0YXRpb25zLAotMzItYml0IFBWIGd1ZXN0cyBtdXN0IGJlIGFzc3VtZWQg
dG8gYmUgYWJsZSB0byByZWFkIGFyYml0cmFyeSBob3N0IG1lbW9yeQotdXNp
bmcgc3BlY3VsYXRpdmUgZXhlY3V0aW9uIGF0dGFja3MuCi1BZHZpc29yaWVz
IHdpbGwgY29udGludWUgdG8gYmUgaXNzdWVkCi1mb3IgbmV3IHZ1bG5lcmFi
aWxpdGllcyByZWxhdGVkIHRvIHVuLXNoaW1tZWQgMzItYml0IFBWIGd1ZXN0
cwotZW5hYmxpbmcgZGVuaWFsLW9mLXNlcnZpY2UgYXR0YWNrcyBvciBwcml2
aWxlZ2UgZXNjYWxhdGlvbiBhdHRhY2tzLgorICAgIFN0YXR1cywgeDg2XzMy
LCB3aXRob3V0IHNoaW06IFN1cHBvcnRlZCwgbm90IHNlY3VyaXR5IHN1cHBv
cnRlZAogCiAjIyMgeDg2L0hWTQogCi0tLSBhL3hlbi9hcmNoL3g4Ni9LY29u
ZmlnCisrKyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCkBAIC01Niw3ICs1Niw3
IEBAIGNvbmZpZyBQVgogY29uZmlnIFBWMzIKIAlib29sICJTdXBwb3J0IGZv
ciAzMmJpdCBQViBndWVzdHMiCiAJZGVwZW5kcyBvbiBQVgotCWRlZmF1bHQg
eQorCWRlZmF1bHQgUFZfU0hJTQogCS0tLWhlbHAtLS0KIAkgIFRoZSAzMmJp
dCBQViBBQkkgdXNlcyBSaW5nMSwgYW4gYXJlYSBvZiB0aGUgeDg2IGFyY2hp
dGVjdHVyZSB3aGljaAogCSAgd2FzIGRlcHJlY2F0ZWQgYW5kIG1vc3RseSBy
ZW1vdmVkIGluIHRoZSBBTUQ2NCBzcGVjLiAgQXMgYSByZXN1bHQsCkBAIC02
Nyw3ICs2NywxMCBAQCBjb25maWcgUFYzMgogCSAgcmVkdWN0aW9uLCBvciBw
ZXJmb3JtYW5jZSByZWFzb25zLiAgQmFja3dhcmRzIGNvbXBhdGliaWxpdHkg
Y2FuIGJlCiAJICBwcm92aWRlZCB2aWEgdGhlIFBWIFNoaW0gbWVjaGFuaXNt
LgogCi0JICBJZiB1bnN1cmUsIHNheSBZLgorCSAgTm90ZSB0aGF0IG91dHNp
ZGUgb2YgUFYgU2hpbSwgMzItYml0IFBWIGd1ZXN0cyBhcmUgbm90IHNlY3Vy
aXR5CisJICBzdXBwb3J0ZWQgYW55bW9yZS4KKworCSAgSWYgdW5zdXJlLCB1
c2UgdGhlIGRlZmF1bHQgc2V0dGluZy4KIAogY29uZmlnIFBWX0xJTkVBUl9Q
VAogICAgICAgIGJvb2wgIlN1cHBvcnQgZm9yIFBWIGxpbmVhciBwYWdldGFi
bGVzIgo=

--=separator--

