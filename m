Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A586C3124
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 13:01:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512397.792522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peafp-0000ll-AZ; Tue, 21 Mar 2023 12:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512397.792522; Tue, 21 Mar 2023 12:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peafo-0000h7-TO; Tue, 21 Mar 2023 12:01:04 +0000
Received: by outflank-mailman (input) for mailman id 512397;
 Tue, 21 Mar 2023 12:01:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hojv=7N=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1peafm-0006jQ-W3
 for xen-devel@lists.xen.org; Tue, 21 Mar 2023 12:01:03 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08a9e9d1-c7e0-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 13:00:56 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1peafW-00032f-Vc; Tue, 21 Mar 2023 12:00:46 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1peafW-0000G3-UU; Tue, 21 Mar 2023 12:00:46 +0000
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
X-Inumbo-ID: 08a9e9d1-c7e0-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=BNYP1Dv8uG/bHThSnhfkWPM3dVwF/6evTsYsRlnLLhM=; b=vvHTAhAUdf3ak/OfzwLNFEGKO5
	UJwMOHC8Ie34RPlIiUxyWPhJ8l0WCoAArCxlWmmP3gbNQ22fp1klqR+EX0ifTNWIlwtRQCfoWlrsc
	kcNA/FYi0eEzKA9quhRYI4JmxaZxAD7/pXDKj190x0Bu/ByYLK5OvoWFUnVfUpHcw2vw=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 429 v3 (CVE-2022-42331) - x86: speculative
 vulnerability in 32bit SYSCALL path
Message-Id: <E1peafW-0000G3-UU@xenbits.xenproject.org>
Date: Tue, 21 Mar 2023 12:00:46 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2022-42331 / XSA-429
                               version 3

          x86: speculative vulnerability in 32bit SYSCALL path

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

Due to an oversight in the very original Spectre/Meltdown security work
(XSA-254), one entrypath performs its speculation-safety actions too
late.

In some configurations, there is an unprotected RET instruction which
can be attacked with a variety of speculative attacks.

IMPACT
======

An attacker might be able to infer the contents of arbitrary host
memory, including memory assigned to other guests.

VULNERABLE SYSTEMS
==================

Xen versions 4.5 through 4.17 are vulnerable.  Older versions are not
vulnerable.

Only x86 CPUs are potentially vulnerable.  CPUs of other architectures
are not vulnerable.

The problematic codepath is only reachable on x86 CPUs which follow
AMD's behaviour with respect to SYSCALL instructions from compatibility
mode segments.  This means that AMD and Hygon CPUs are potentially
vulnerable, whereas Intel CPUs are not.  Other vendors have not been
checked.

Only PV guests can leverage the vulnerability.

On Xen 4.16 and later, the vulnerability is only present if 32bit PV
guest support is compiled in - i.e. CONFIG_PV32=y.  On Xen 4.15 and
older, all supported build configurations are vulnerable.

The vulnerability is only present when booting on hardware that supports
SMEP or SMAP (Supervisor Mode Execution/Access Prevention).  This is
believed to be some Family 0x16 models, and all later CPUs.

MITIGATION
==========

Not running untrusted PV guests will avoid the issue.

CREDITS
=======

This issue was discovered by Andrew Cooper of XenServer.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa429.patch           xen-unstable - Xen 4.16
xsa429-4.15.patch      Xen 4.15 - Xen 4.14

$ sha256sum xsa429*
2d7be90d917c475ab5217e657d2b44f5d8b107d9023dca034fcfb7feab07b2f0  xsa429.meta
36ed36dbfaad9e5df5fa87b9a3d9e9c531f476f97eeb2afe280aa238032a0540  xsa429.patch
7ac3d4182585e5d2d39231f10e7c0c9fcb972c82cf81cb884e95b628187de3a7  xsa429-4.15.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmQZlWMMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZil4H/2b1DkLLz4RQqAgvaB8+SBeVLPqoZ7QxGLl8QXWT
AMjFdy+M5T1OtbrMvEYCZNYhZnGOJgmVagERUvg/yZbPYx28NIHjG4+u90Ot6OId
AQPqdrJ0wjEzN/ppNpnu1ALofAGbjsnAypEouGPh12gh5fcpcLQdT0rvpl2ff5f6
Qi4ShtUXhBiduBQcJ0TSneSCf5s7cq1+sMenntenK5Nrsvg7gu51YR45FyKyXdZc
raonkGDny9kmDAjdKkywS2Au2763ph9nHbW5TbD17s65AKUDTupzk+QlFPhJLIP+
/gxDoUjKFiD/eY0AABWMAFGGvHFRNvdhTfUd6ImmWhqdEeE=
=HxUJ
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa429.meta"
Content-Disposition: attachment; filename="xsa429.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiA0MjksCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNyIsCiAgICAiNC4xNiIsCiAgICAiNC4xNSIs
CiAgICAiNC4xNCIKICBdLAogICJUcmVlcyI6IFsKICAgICJ4ZW4iCiAgXSwK
ICAiUmVjaXBlcyI6IHsKICAgICI0LjE0IjogewogICAgICAiUmVjaXBlcyI6
IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICJj
MjY3YWJmYWYyZDgxNzYzNzFlZGEwMzdmOWI5MTUyNDU4ZTA2NTZkIiwKICAg
ICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICA0MjcsCiAgICAgICAg
ICAgIDQyOAogICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwog
ICAgICAgICAgICAieHNhNDI5LTQuMTUucGF0Y2giCiAgICAgICAgICBdCiAg
ICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQuMTUiOiB7CiAgICAgICJS
ZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxl
UmVmIjogImZhODc1NTc0YjczNjE4ZGFmM2JjNzBlNmZmNGQzNDI0OTNmYTEx
ZDkiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAgICAgICAgIDQyNywK
ICAgICAgICAgICAgNDI4CiAgICAgICAgICBdLAogICAgICAgICAgIlBhdGNo
ZXMiOiBbCiAgICAgICAgICAgICJ4c2E0MjktNC4xNS5wYXRjaCIKICAgICAg
ICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC4xNiI6IHsK
ICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAg
ICJTdGFibGVSZWYiOiAiODRkZmU3YTU2ZjA0YTc0MTJmYTQ4NjliM2U3NTZj
NDllMWNmYmU3NSIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAg
ICAgNDI3LAogICAgICAgICAgICA0MjgKICAgICAgICAgIF0sCiAgICAgICAg
ICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTQyOS5wYXRjaCIKICAg
ICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC4xNyI6
IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAg
ICAgICJTdGFibGVSZWYiOiAiZWM1YjA1OGQyYTY0MzZhMmUxODAzMTU1MjJm
Y2YxNjQ1YTgxNTNiNCIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAgICAg
ICAgICAgNDI3LAogICAgICAgICAgICA0MjgKICAgICAgICAgIF0sCiAgICAg
ICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTQyOS5wYXRjaCIK
ICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAibWFz
dGVyIjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewog
ICAgICAgICAgIlN0YWJsZVJlZiI6ICIzMTI3MGYxMWE5NmViYjg3NWNkNzA2
NjFlMmRmOWU1YzZlZGQ3NTY0IiwKICAgICAgICAgICJQcmVyZXFzIjogWwog
ICAgICAgICAgICA0MjcsCiAgICAgICAgICAgIDQyOAogICAgICAgICAgXSwK
ICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhNDI5LnBh
dGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfQogIH0K
fQ==

--=separator
Content-Type: application/octet-stream; name="xsa429.patch"
Content-Disposition: attachment; filename="xsa429.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L3NwZWMtY3RybDogRGVmZXIgQ1I0X1BWMzJfUkVT
VE9SRSBvbiB0aGUgY3N0YXJfZW50ZXIgcGF0aAoKQXMgc3RhdGVkIChjb3Jy
ZWN0bHkpIGJ5IHRoZSBjb21tZW50IG5leHQgdG8gU1BFQ19DVFJMX0VOVFJZ
X0ZST01fUFYsIGJldHdlZW4KdGhlIHR3byBodW5rcyB2aXNpYmxlIGluIHRo
ZSBwYXRjaCwgUkVUJ3MgYXJlIG5vdCBzYWZlIHByaW9yIHRvIHRoaXMgcG9p
bnQuCgpDUjRfUFYzMl9SRVNUT1JFIGhpZGVzIGEgQ0FMTC9SRVQgcGFpciBp
biBjZXJ0YWluIGNvbmZpZ3VyYXRpb25zIChQVjMyCmNvbXBpbGVkIGluLCBT
TUVQIG9yIFNNQVAgYWN0aXZlKSwgYW5kIHRoZSBSRVQgY2FuIGJlIGF0dGFj
a2VkIHdpdGggb25lIG9mCnNldmVyYWwga25vd24gc3BlY3VsYXRpdmUgaXNz
dWVzLgoKRnVydGhlcm1vcmUsIENSNF9QVjMyX1JFU1RPUkUgYWxzbyBoaWRl
cyBhIHJlZmVyZW5jZSB0byB0aGUgY3I0X3B2MzJfbWFzawpnbG9iYWwgdmFy
aWFibGUsIHdoaWNoIGlzIG5vdCBzYWZlIHdoZW4gWFBUSSBpcyBhY3RpdmUg
YmVmb3JlIHJlc3RvcmluZyBYZW4ncwpmdWxsIHBhZ2V0YWJsZXMuCgpUaGlz
IGNyYXNoIGhhcyBnb25lIHVubm90aWNlZCBiZWNhdXNlIGl0IGlzIG9ubHkg
QU1EIENQVXMgd2hpY2ggcGVybWl0IHRoZQpTWVNDQUxMIGluc3RydWN0aW9u
IGluIGNvbXBhdGliaWxpdHkgbW9kZSwgYW5kIHRoZXNlIGFyZSBub3QgdnVs
bmVyYWJsZSB0bwpNZWx0ZG93biBzbyBkb24ndCBhY3RpdmF0ZSBYUFRJIGJ5
IGRlZmF1bHQuCgpUaGlzIGlzIFhTQS00MjkgLyBDVkUtMjAyMi00MjMzMQoK
Rml4ZXM6IDVlNzk2MjkwMTEzMSAoIng4Ni9lbnRyeTogT3JnYW5pc2UgdGhl
IHVzZSBvZiBNU1JfU1BFQ19DVFJMIGF0IGVhY2ggZW50cnkvZXhpdCBwb2lu
dCIpCkZpeGVzOiA1Nzg0ZGUzZTIwNjcgKCJ4ODY6IE1lbHRkb3duIGJhbmQt
YWlkIGFnYWluc3QgbWFsaWNpb3VzIDY0LWJpdCBQViBndWVzdHMiKQpTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvZW50
cnkuUyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvZW50cnkuUwppbmRleCBhZTAx
Mjg1MTgxOWEuLjc2NzVhNTlmZjA1NyAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L3g4Nl82NC9lbnRyeS5TCisrKyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQv
ZW50cnkuUwpAQCAtMjg4LDcgKzI4OCw2IEBAIEVOVFJZKGNzdGFyX2VudGVy
KQogICAgICAgICBBTFRFUk5BVElWRSAiIiwgInNldHNzYnN5IiwgWDg2X0ZF
QVRVUkVfWEVOX1NIU1RLCiAjZW5kaWYKICAgICAgICAgcHVzaCAgJXJheCAg
ICAgICAgICAvKiBHdWVzdCAlcnNwICovCi0gICAgICAgIENSNF9QVjMyX1JF
U1RPUkUKICAgICAgICAgbW92cSAgOCglcnNwKSwgJXJheCAvKiBSZXN0b3Jl
IGd1ZXN0ICVyYXguICovCiAgICAgICAgIG1vdnEgICRGTEFUX1VTRVJfU1Mz
MiwgOCglcnNwKSAvKiBBc3N1bWUgYSA2NGJpdCBkb21haW4uICBDb21wYXQg
aGFuZGxlZCBsb3dlci4gKi8KICAgICAgICAgcHVzaHEgJXIxMQpAQCAtMzEy
LDYgKzMxMSw4IEBAIEVOVFJZKGNzdGFyX2VudGVyKQogLkxjc3Rhcl9jcjNf
b2theToKICAgICAgICAgc3RpCiAKKyAgICAgICAgQ1I0X1BWMzJfUkVTVE9S
RQorCiAgICAgICAgIG1vdnEgIFNUQUNLX0NQVUlORk9fRklFTEQoY3VycmVu
dF92Y3B1KSglcmJ4KSwgJXJieAogCiAjaWZkZWYgQ09ORklHX1BWMzIK

--=separator
Content-Type: application/octet-stream; name="xsa429-4.15.patch"
Content-Disposition: attachment; filename="xsa429-4.15.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L3NwZWMtY3RybDogRGVmZXIgQ1I0X1BWMzJfUkVT
VE9SRSBvbiB0aGUgY3N0YXJfZW50ZXIgcGF0aAoKQXMgc3RhdGVkIChjb3Jy
ZWN0bHkpIGJ5IHRoZSBjb21tZW50IG5leHQgdG8gU1BFQ19DVFJMX0VOVFJZ
X0ZST01fUFYsIGJldHdlZW4KdGhlIHR3byBodW5rcyB2aXNpYmxlIGluIHRo
ZSBwYXRjaCwgUkVUJ3MgYXJlIG5vdCBzYWZlIHByaW9yIHRvIHRoaXMgcG9p
bnQuCgpDUjRfUFYzMl9SRVNUT1JFIGhpZGVzIGEgQ0FMTC9SRVQgcGFpciBp
biBjZXJ0YWluIGNvbmZpZ3VyYXRpb25zIChQVjMyCmNvbXBpbGVkIGluLCBT
TUVQIG9yIFNNQVAgYWN0aXZlKSwgYW5kIHRoZSBSRVQgY2FuIGJlIGF0dGFj
a2VkIHdpdGggb25lIG9mCnNldmVyYWwga25vd24gc3BlY3VsYXRpdmUgaXNz
dWVzLgoKRnVydGhlcm1vcmUsIENSNF9QVjMyX1JFU1RPUkUgYWxzbyBoaWRl
cyBhIHJlZmVyZW5jZSB0byB0aGUgY3I0X3B2MzJfbWFzawpnbG9iYWwgdmFy
aWFibGUsIHdoaWNoIGlzIG5vdCBzYWZlIHdoZW4gWFBUSSBpcyBhY3RpdmUg
YmVmb3JlIHJlc3RvcmluZyBYZW4ncwpmdWxsIHBhZ2V0YWJsZXMuCgpUaGlz
IGNyYXNoIGhhcyBnb25lIHVubm90aWNlZCBiZWNhdXNlIGl0IGlzIG9ubHkg
QU1EIENQVXMgd2hpY2ggcGVybWl0IHRoZQpTWVNDQUxMIGluc3RydWN0aW9u
IGluIGNvbXBhdGliaWxpdHkgbW9kZSwgYW5kIHRoZXNlIGFyZSBub3QgdnVs
bmVyYWJsZSB0bwpNZWx0ZG93biBzbyBkb24ndCBhY3RpdmF0ZSBYUFRJIGJ5
IGRlZmF1bHQuCgpUaGlzIGlzIFhTQS00MjkgLyBDVkUtMjAyMi00MjMzMQoK
Rml4ZXM6IDVlNzk2MjkwMTEzMSAoIng4Ni9lbnRyeTogT3JnYW5pc2UgdGhl
IHVzZSBvZiBNU1JfU1BFQ19DVFJMIGF0IGVhY2ggZW50cnkvZXhpdCBwb2lu
dCIpCkZpeGVzOiA1Nzg0ZGUzZTIwNjcgKCJ4ODY6IE1lbHRkb3duIGJhbmQt
YWlkIGFnYWluc3QgbWFsaWNpb3VzIDY0LWJpdCBQViBndWVzdHMiKQpTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvY29t
cGF0L2VudHJ5LlMgYi94ZW4vYXJjaC94ODYveDg2XzY0L2NvbXBhdC9lbnRy
eS5TCmluZGV4IDVjOTk5MjcxZTYxNy4uMDlhODY3NjhhYzAyIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L2NvbXBhdC9lbnRyeS5TCisrKyBi
L3hlbi9hcmNoL3g4Ni94ODZfNjQvY29tcGF0L2VudHJ5LlMKQEAgLTIwNiw3
ICsyMDYsNiBAQCBFTlRSWShjc3Rhcl9lbnRlcikKICAgICAgICAgQUxURVJO
QVRJVkUgIiIsICJzZXRzc2JzeSIsIFg4Nl9GRUFUVVJFX1hFTl9TSFNUSwog
I2VuZGlmCiAgICAgICAgIHB1c2ggICVyYXggICAgICAgICAgLyogR3Vlc3Qg
JXJzcCAqLwotICAgICAgICBDUjRfUFYzMl9SRVNUT1JFCiAgICAgICAgIG1v
dnEgIDgoJXJzcCksICVyYXggLyogUmVzdG9yZSBndWVzdCAlcmF4LiAqLwog
ICAgICAgICBtb3ZxICAkRkxBVF9VU0VSX1NTMzIsIDgoJXJzcCkgLyogQXNz
dW1lIGEgNjRiaXQgZG9tYWluLiAgQ29tcGF0IGhhbmRsZWQgbG93ZXIuICov
CiAgICAgICAgIHB1c2hxICVyMTEKQEAgLTIzMCw2ICsyMjksOCBAQCBFTlRS
WShjc3Rhcl9lbnRlcikKIC5MY3N0YXJfY3IzX29rYXk6CiAgICAgICAgIHN0
aQogCisgICAgICAgIENSNF9QVjMyX1JFU1RPUkUKKwogICAgICAgICBtb3Zx
ICBTVEFDS19DUFVJTkZPX0ZJRUxEKGN1cnJlbnRfdmNwdSkoJXJieCksICVy
YngKICAgICAgICAgbW92cSAgVkNQVV9kb21haW4oJXJieCksJXJjeAogICAg
ICAgICBjbXBiICAkMCxET01BSU5faXNfMzJiaXRfcHYoJXJjeCkK

--=separator--

