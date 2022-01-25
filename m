Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5540C49B37A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 13:05:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260140.449439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCKZ9-0006Kv-Io; Tue, 25 Jan 2022 12:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260140.449439; Tue, 25 Jan 2022 12:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCKZ9-0006H3-DR; Tue, 25 Jan 2022 12:04:51 +0000
Received: by outflank-mailman (input) for mailman id 260140;
 Tue, 25 Jan 2022 12:04:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jkQr=SJ=xenbits.xen.org=julieng@srs-se1.protection.inumbo.net>)
 id 1nCKZ8-0006BM-0s
 for xen-devel@lists.xen.org; Tue, 25 Jan 2022 12:04:50 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faf104b6-7dd6-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 13:04:47 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1nCKYs-0004kG-W8; Tue, 25 Jan 2022 12:04:34 +0000
Received: from julieng by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1nCKYs-0003Jt-US; Tue, 25 Jan 2022 12:04:34 +0000
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
X-Inumbo-ID: faf104b6-7dd6-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=qX2YEVkY7JqVsTpOdQxu4gk9Ky+TnCWQCxgaveBaVbY=; b=0CY4DhSgFtkiITkyx2fUQhJ6Dd
	aHObZiFOgYuufDM99Njrd6+gz5rKX49/WaGUPB10j1xSZJgVhcvj+1pTZCxzEu0fCD5Iahck30RRK
	3Z+WyDnSvqu7uvPDRZMLNLE+VarfbXOyxuQ5U01VXFqW8RpLDRIKHR56YKN7jMhALft0=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 393 v2 (CVE-2022-23033) - arm:
 guest_physmap_remove_page not removing the p2m mappings
Message-Id: <E1nCKYs-0003Jt-US@xenbits.xenproject.org>
Date: Tue, 25 Jan 2022 12:04:34 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2022-23033 / XSA-393
                               version 2

     arm: guest_physmap_remove_page not removing the p2m mappings

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

The functions to remove one or more entries from a guest p2m pagetable
on Arm (p2m_remove_mapping, guest_physmap_remove_page, and p2m_set_entry
with mfn set to INVALID_MFN) do not actually clear the pagetable entry
if the entry doesn't have the valid bit set.  It is possible to have a
valid pagetable entry without the valid bit set when a guest operating
system uses set/way cache maintenance instructions.  For instance, a
guest issuing a set/way cache maintenance instruction, then calling the
XENMEM_decrease_reservation hypercall to give back memory pages to Xen,
might be able to retain access to those pages even after Xen started
reusing them for other purposes.

IMPACT
======

A malicious guest may be able to access Xen and other domains' memory.
This could cause information leaks, host or domain Denial of Service
(DoS), and privilege escalations.

VULNERABLE SYSTEMS
==================

Xen version 4.12 and newer are vulnerable.  Only Arm systems are
vulnerable.

x86 systems are not vulnerable.

MITIGATION
==========

There is no known mitigation.

CREDITS
=======

This issue was discovered by Dmytro Firsov of EPAM.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa393.patch           xen-unstable - Xen 4.12.x

$ sha256sum xsa393*
ccd746687c6080ec00ba363477d8815bc648d957c21c47d3a5330be9251806a4  xsa393.meta
89e5d66c437bacbe344e72d15720c1dde98dd97fab7184c7a6ff32bb63d442dd  xsa393.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmHv38oMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZfAcH/iXwGyTpGU7AIOGNGH1VYnn3FBAVBvT4etuPXO8o
heX252xCZNh7M7qel/Db1aaAMpo2T2ypH02ZguKsojnoRAo4QrEjrnBGsCasfzqv
HFd3nMlmksNlKI9xGPxt+Q6eNuoEHgu7i/7r3J2DgiC/Pa5Hw4SMF2eat7Er5zDL
waDHFkiONa6LM/dtgZkkgps5d3B8cR4tXo3VDLzBC0pK3IysSLnacLy7FfvLg7c0
pc/qFvUXbsFjKVmG+EKu8VlCpkWONFP1FXC4pfM+rSjDdVhmc8FhFzOLzD6Tkptt
MJhgOCMrO1Z//F07l0B9C9sxVi7K5mUDSWhonUQVPCWgl2s=
=06Nb
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa393.meta"
Content-Disposition: attachment; filename="xsa393.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzOTMsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNiIsCiAgICAiNC4xNSIsCiAgICAiNC4xNCIs
CiAgICAiNC4xMyIsCiAgICAiNC4xMiIKICBdLAogICJUcmVlcyI6IFsKICAg
ICJ4ZW4iCiAgXSwKICAiUmVjaXBlcyI6IHsKICAgICI0LjEyIjogewogICAg
ICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0
YWJsZVJlZiI6ICJiOWFhMTYzNWIzOGE3YmMwOTJkNjAxMjNiODdjNTQ1ZjI1
ZGIzMWU0IiwKICAgICAgICAgICJQcmVyZXFzIjogW10sCiAgICAgICAgICAi
UGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTM5My5wYXRjaCIKICAgICAg
ICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC4xMyI6IHsK
ICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAg
ICJTdGFibGVSZWYiOiAiZDBlMmMyNzYyYjk4MWFiZDk4NGFmNjZhODQ0YWMx
MmQ4YmY4ZjgxMyIsCiAgICAgICAgICAiUHJlcmVxcyI6IFtdLAogICAgICAg
ICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EzOTMucGF0Y2giCiAg
ICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQuMTQi
OiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAg
ICAgICAiU3RhYmxlUmVmIjogImNiYWRmNjdiY2FiNGUyOWM4ODM0MTBkYjM5
M2Y0ZjVlZjM0ZGYwNGEiLAogICAgICAgICAgIlByZXJlcXMiOiBbXSwKICAg
ICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMzkzLnBhdGNo
IgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICI0
LjE1IjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewog
ICAgICAgICAgIlN0YWJsZVJlZiI6ICJhYmEyMmM2N2VmZTQ0MDRhMmE4NGUz
NzhiZmQ5OGRlZjVlYzhlNjQ3IiwKICAgICAgICAgICJQcmVyZXFzIjogW10s
CiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTM5My5w
YXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAg
ICAiNC4xNiI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6
IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiZDBkMGFmNjdlZWRlNTYwZmFh
YjU4ZjE2MWQ5NjA4YTY5Yzc3OWQ0MSIsCiAgICAgICAgICAiUHJlcmVxcyI6
IFtdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2Ez
OTMucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9
LAogICAgIm1hc3RlciI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAg
InhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiMzFmM2JjOTdmNDUw
ODY4NzIxNWU0NTlhNWUzNTY3NmVlY2YxNzcyYiIsCiAgICAgICAgICAiUHJl
cmVxcyI6IFtdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAg
ICJ4c2EzOTMucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9
CiAgICB9CiAgfQp9

--=separator
Content-Type: application/octet-stream; name="xsa393.patch"
Content-Disposition: attachment; filename="xsa393.patch"
Content-Transfer-Encoding: base64

RnJvbSA3ZmY1OGFiNzcwMTU3YTAzYzkyNjA0MTU1YTBjNzQ1YmNhYjgzNGMy
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWxpZW4gR3JhbGwg
PGpncmFsbEBhbWF6b24uY29tPgpEYXRlOiBUdWUsIDE0IERlYyAyMDIxIDA5
OjUzOjQ0ICswMDAwClN1YmplY3Q6IFtQQVRDSF0geGVuL2FybTogcDJtOiBB
bHdheXMgY2xlYXIgdGhlIFAyTSBlbnRyeSB3aGVuIHRoZSBtYXBwaW5nIGlz
CiByZW1vdmVkCgpDb21taXQgMjE0OGExMjViNzNiICgieGVuL2FybTogVHJh
Y2sgcGFnZSBhY2Nlc3NlZCBiZXR3ZWVuIGJhdGNoIG9mClNldC9XYXkgb3Bl
cmF0aW9ucyIpIGFsbG93ZWQgYW4gZW50cnkgdG8gYmUgaW52YWxpZCBmcm9t
IHRoZSBDUFUgUG9WCihscGFlX2lzX3ZhbGlkKCkpIGJ1dCB2YWxpZCBmb3Ig
WGVuIChwMm1faXNfdmFsaWQoKSkuIFRoaXMgaXMgdXNlZnVsCnRvIHRyYWNr
IHdoaWNoIHBhZ2UgaXMgYWNjZXNzZWQgYW5kIG9ubHkgcGVyZm9ybSBhbiBh
Y3Rpb24gb24gdGhlbQooZS5nLiBjbGVhbiAmIGludmFsaWRhdGUgdGhlIGNh
Y2hlIGFmdGVyIGEgc2V0L3dheSBpbnN0cnVjdGlvbikuCgpVbmZvcnR1bmF0
ZWx5LCBfX3AybV9zZXRfZW50cnkoKSBpcyBvbmx5IHplcm9pbmcgdGhlIFAy
TSBlbnRyeSB3aGVuCmxwYWVfaXNfdmFsaWQoKSByZXR1cm5zIHRydWUuIFRo
aXMgbWVhbnMgdGhlIGVudHJ5IHdpbGwgbm90IGJlIHplcm9lZAppZiB0aGUg
ZW50cnkgd2FzIHZhbGlkIGZyb20gWGVuIFBvViBidXQgaW52YWxpZCBmcm9t
IHRoZSBDUFUgUG9WIGZvcgp0cmFja2luZyBwdXJwb3NlLgoKQXMgYSBjb25z
ZXF1ZW5jZSwgdGhpcyB3aWxsIGFsbG93IGEgZG9tYWluIHRvIGNvbnRpbnVl
IHRvIGFjY2VzcyB0aGUKcGFnZSBhZnRlciBpdCB3YXMgcmVtb3ZlZC4KClJl
c29sdmUgdGhlIGlzc3VlIGJ5IGFsd2F5cyB6ZXJvaW5nIHRoZSBlbnRyeSBp
ZiBpdCB0aGUgTFBBRSBiaXQgaXMKc2V0IG9yIHRoZSBlbnRyeSBpcyBhYm91
dCB0byBiZSByZW1vdmVkLgoKVGhpcyBpcyBDVkUtMjAyMi0yMzAzMyAvIFhT
QS0zOTMuCgpSZXBvcnRlZC1ieTogRG15dHJvIEZpcnNvdiA8RG15dHJvX0Zp
cnNvdkBlcGFtLmNvbT4KRml4ZXM6IDIxNDhhMTI1YjczYiAoInhlbi9hcm06
IFRyYWNrIHBhZ2UgYWNjZXNzZWQgYmV0d2VlbiBiYXRjaCBvZiBTZXQvV2F5
IG9wZXJhdGlvbnMiKQpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgotLS0KIHhlbi9hcmNoL2Fy
bS9wMm0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9w
Mm0uYyBiL3hlbi9hcmNoL2FybS9wMm0uYwppbmRleCA4YjIwYjQzMDc3N2Uu
LmZiNzFmYTRjMWM5MCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3AybS5j
CisrKyBiL3hlbi9hcmNoL2FybS9wMm0uYwpAQCAtMTAxNiw3ICsxMDE2LDcg
QEAgc3RhdGljIGludCBfX3AybV9zZXRfZW50cnkoc3RydWN0IHAybV9kb21h
aW4gKnAybSwKICAgICAgKiBzZXF1ZW5jZSB3aGVuIHVwZGF0aW5nIHRoZSB0
cmFuc2xhdGlvbiB0YWJsZSAoRDQuNy4xIGluIEFSTSBEREkKICAgICAgKiAw
NDg3QS5qKS4KICAgICAgKi8KLSAgICBpZiAoIGxwYWVfaXNfdmFsaWQob3Jp
Z19wdGUpICkKKyAgICBpZiAoIGxwYWVfaXNfdmFsaWQob3JpZ19wdGUpIHx8
IHJlbW92aW5nX21hcHBpbmcgKQogICAgICAgICBwMm1fcmVtb3ZlX3B0ZShl
bnRyeSwgcDJtLT5jbGVhbl9wdGUpOwogCiAgICAgaWYgKCByZW1vdmluZ19t
YXBwaW5nICkKLS0gCjIuMzIuMAoK

--=separator--

