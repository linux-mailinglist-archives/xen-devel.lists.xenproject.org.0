Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A89C49B381
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 13:07:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260209.449555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCKbK-0002v4-T5; Tue, 25 Jan 2022 12:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260209.449555; Tue, 25 Jan 2022 12:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCKbK-0002rR-Oq; Tue, 25 Jan 2022 12:07:06 +0000
Received: by outflank-mailman (input) for mailman id 260209;
 Tue, 25 Jan 2022 12:07:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jkQr=SJ=xenbits.xen.org=julieng@srs-se1.protection.inumbo.net>)
 id 1nCKZh-0006BM-D7
 for xen-devel@lists.xen.org; Tue, 25 Jan 2022 12:05:25 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ed23ef4-7dd7-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 13:05:16 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1nCKZP-0004m4-8d; Tue, 25 Jan 2022 12:05:07 +0000
Received: from julieng by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1nCKZP-0003vf-6C; Tue, 25 Jan 2022 12:05:07 +0000
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
X-Inumbo-ID: 0ed23ef4-7dd7-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=XjImBY627dzjE6CAOBihcwCbC0zmFDELfKNBy+FyDb4=; b=INuodAE6zxiLlqwttASajLYK9T
	qBZwj+RmvDQIE/tzkDOJEKvi1R/iFoIcXUWmIN4bi35HLHu7BlUWjbdjTaapoi+Opmuymv+UxTEc9
	IXQu5ZinWM4Y7JHzkreaT9HKzrwwQ7atGF7Qc319S3zri6tTG8WafDvr9Xti29KiikaU=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 395 v2 (CVE-2022-23035) - Insufficient
 cleanup of passed-through device IRQs
Message-Id: <E1nCKZP-0003vf-6C@xenbits.xenproject.org>
Date: Tue, 25 Jan 2022 12:05:07 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2022-23035 / XSA-395
                               version 2

          Insufficient cleanup of passed-through device IRQs

UPDATES IN VERSION 2
====================

Adjust patch subject.

Public release.

ISSUE DESCRIPTION
=================

The management of IRQs associated with physical devices exposed to x86
HVM guests involves an iterative operation in particular when cleaning
up after the guest's use of the device.  In the case where an interrupt
is not quiescent yet at the time this cleanup gets invoked, the cleanup
attempt may be scheduled to be retried.  When multiple interrupts are
involved, this scheduling of a retry may get erroneously skipped.  At
the same time pointers may get cleared (resulting in a de-reference of
NULL) and freed (resulting in a use-after-free), while other code would
continue to assume them to be valid.

IMPACT
======

The precise impact is system specific, but would typically be a Denial
of Service (DoS) affecting the entire host.  Privilege escalation and
information leaks cannot be ruled out.

VULNERABLE SYSTEMS
==================

Xen versions 4.6 and later are vulnerable.  Xen versions 4.5 and earlier
are not vulnerable.

Only x86 HVM guests with one or more passed-through physical devices
using (together) multiple physical interupts can leverage the
vulnerability.  x86 PV guests cannot leverage the vulnerability.  x86
HVM guests without passed-through devices or with a passed-through
device using just a single physical interrupt also cannot leverage the
vulnerability.  Device pass-through is unsupported for x86 PVH guests
and all Arm guests.

MITIGATION
==========

There is no mitigation (other than not passing through to x86 HVM guests
PCI devices with, overall, more than a single physical interrupt).

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

xsa395.patch           xen-unstable - Xen 4.15.x
xsa395-4.14.patch      Xen 4.14.x - Xen 4.12.x

$ sha256sum xsa395*
f460be598b936bb5cfb9276787f2f21d90b029d1fe10dabd572ae50f84a1124d  xsa395.meta
295b876c52cf5efe19150757275da3d154beb72ac2d7be267e16c9262e410de3  xsa395.patch
5697f3137e0a202744f31b1c6cbcfa459d8fa9b4b68be59561b78c40fe1233c5  xsa395-4.14.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmHv39QMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZhowIAIZYZq4efyEAP5rB3zX4yRel2GNz+2Dpjok4PExB
uSOrPaH5dDILhNdVJNG48MckDe0dMDsn3OGr1I6lbxcV1TWR1JFrBQoxeUnwdiEf
GjeTni0hhefan3IEEd5HUDInQgf9oI7fUcgEdVAoIV87BQdlK0ofjJ3TggSrr8jl
pL5dmIh4OICD6YttR11Of1vhPY2WhZQb2xgSxzEQbDeY8k3JaRWy8mYwwxPD0HXn
+hmLK59ZhkJd5Sk8AxttRUTEsl6nKESrUz3vv/vFInV5Go+35AElL//gQNgOOTAS
nljLLtJdfHSuRy459Sw/lm4mwQ9zkfOFH6B+M6efSkHMyoE=
=Iv+w
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa395.meta"
Content-Disposition: attachment; filename="xsa395.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzOTUsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNiIsCiAgICAiNC4xNSIsCiAgICAiNC4xNCIs
CiAgICAiNC4xMyIsCiAgICAiNC4xMiIKICBdLAogICJUcmVlcyI6IFsKICAg
ICJ4ZW4iCiAgXSwKICAiUmVjaXBlcyI6IHsKICAgICI0LjEyIjogewogICAg
ICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0
YWJsZVJlZiI6ICJiOWFhMTYzNWIzOGE3YmMwOTJkNjAxMjNiODdjNTQ1ZjI1
ZGIzMWU0IiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAz
OTMsCiAgICAgICAgICAgIDM5NAogICAgICAgICAgXSwKICAgICAgICAgICJQ
YXRjaGVzIjogWwogICAgICAgICAgICAieHNhMzk1LTQuMTQucGF0Y2giCiAg
ICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQuMTMi
OiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAg
ICAgICAiU3RhYmxlUmVmIjogImQwZTJjMjc2MmI5ODFhYmQ5ODRhZjY2YTg0
NGFjMTJkOGJmOGY4MTMiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAg
ICAgICAgIDM5MywKICAgICAgICAgICAgMzk0CiAgICAgICAgICBdLAogICAg
ICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EzOTUtNC4xNC5w
YXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAg
ICAiNC4xNCI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6
IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiY2JhZGY2N2JjYWI0ZTI5Yzg4
MzQxMGRiMzkzZjRmNWVmMzRkZjA0YSIsCiAgICAgICAgICAiUHJlcmVxcyI6
IFsKICAgICAgICAgICAgMzkzLAogICAgICAgICAgICAzOTQKICAgICAgICAg
IF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTM5
NS00LjE0LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQog
ICAgfSwKICAgICI0LjE1IjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAg
ICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICJhYmEyMmM2N2Vm
ZTQ0MDRhMmE4NGUzNzhiZmQ5OGRlZjVlYzhlNjQ3IiwKICAgICAgICAgICJQ
cmVyZXFzIjogWwogICAgICAgICAgICAzOTMsCiAgICAgICAgICAgIDM5NAog
ICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAg
ICAieHNhMzk1LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAg
fQogICAgfSwKICAgICI0LjE2IjogewogICAgICAiUmVjaXBlcyI6IHsKICAg
ICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICJkMGQwYWY2
N2VlZGU1NjBmYWFiNThmMTYxZDk2MDhhNjljNzc5ZDQxIiwKICAgICAgICAg
ICJQcmVyZXFzIjogWwogICAgICAgICAgICAzOTMsCiAgICAgICAgICAgIDM5
NAogICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAg
ICAgICAieHNhMzk1LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAg
ICAgfQogICAgfSwKICAgICJtYXN0ZXIiOiB7CiAgICAgICJSZWNpcGVzIjog
ewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogIjMx
ZjNiYzk3ZjQ1MDg2ODcyMTVlNDU5YTVlMzU2NzZlZWNmMTc3MmIiLAogICAg
ICAgICAgIlByZXJlcXMiOiBbCiAgICAgICAgICAgIDM5MywKICAgICAgICAg
ICAgMzk0CiAgICAgICAgICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAg
ICAgICAgICAgICJ4c2EzOTUucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAg
fQogICAgICB9CiAgICB9CiAgfQp9

--=separator
Content-Type: application/octet-stream; name="xsa395.patch"
Content-Disposition: attachment; filename="xsa395.patch"
Content-Transfer-Encoding: base64

RnJvbSA0Y2M5MjRjM2UzYTBkNTMzMDZkMDhiMDQ3MjBjNDI3ZDFjMjk4YmE4
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWxpZW4gR3JhbGwg
PGpncmFsbEBhbWF6b24uY29tPgpEYXRlOiBXZWQsIDUgSmFuIDIwMjIgMTg6
MDk6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBwYXNzdGhyb3VnaC94ODY6
IHN0b3AgcGlycSBpdGVyYXRpb24gaW1tZWRpYXRlbHkgaW4gY2FzZSBvZgog
ZXJyb3IKCnB0X3BpcnFfaXRlcmF0ZSgpIHdpbGwgaXRlcmF0ZSBpbiBiYXRj
aCBvdmVyIGFsbCB0aGUgUElSUXMuIFRoZSBvdXRlcgpsb29wIHdpbGwgYmFp
bCBvdXQgaWYgJ3JjJyBpcyBub24temVybyBidXQgdGhlIGlubmVyIGxvb3Ag
d2lsbCBjb250aW51ZS4KClRoaXMgbWVhbnMgJ3JjJyB3aWxsIGdldCBjbG9i
YmVyZWQgYW5kIHdlIG1heSBtaXNzIGFueSBlcnJvcnMgKHN1Y2ggYXMKLUVS
RVNUQVJUIGluIHRoZSBjYXNlIG9mIHRoZSBjYWxsYmFjayBwY2lfY2xlYW5f
ZHBjaV9pcnEoKSkuCgpUaGlzIGlzIENWRS0yMDIyLTIzMDM1IC8gWFNBLTM5
NS4KCkZpeGVzOiBjMjQ1MzZiNjM2ZjIgKCJyZXBsYWNlIGQtPm5yX3BpcnFz
IHNpemVkIGFycmF5cyB3aXRoIHJhZGl4IHRyZWUiKQpGaXhlczogZjZkZDI5
NTM4MWY0ICgiZHBjaTogcmVwbGFjZSB0YXNrbGV0IHdpdGggc29mdGlycSIp
ClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5j
b20+ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgotLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4
Ni9odm0uYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4
Ni9odm0uYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9odm0uYwpp
bmRleCAzNTFkYWFmZGM5YmYuLjBiMzdjZDE0NWI2MCAxMDA2NDQKLS0tIGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2h2bS5jCisrKyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9odm0uYwpAQCAtNzMyLDcgKzczMiwx
MSBAQCBpbnQgcHRfcGlycV9pdGVyYXRlKHN0cnVjdCBkb21haW4gKmQsCiAK
ICAgICAgICAgICAgIHBpcnEgPSBwaXJxc1tpXS0+cGlycTsKICAgICAgICAg
ICAgIGlmICggKHBpcnFfZHBjaS0+ZmxhZ3MgJiBIVk1fSVJRX0RQQ0lfTUFQ
UEVEKSApCisgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgcmMgPSBj
YihkLCBwaXJxX2RwY2ksIGFyZyk7CisgICAgICAgICAgICAgICAgaWYgKCBy
YyApCisgICAgICAgICAgICAgICAgICAgIGJyZWFrOworICAgICAgICAgICAg
fQogICAgICAgICB9CiAgICAgfSB3aGlsZSAoICFyYyAmJiArK3BpcnEgPCBk
LT5ucl9waXJxcyAmJiBuID09IEFSUkFZX1NJWkUocGlycXMpICk7CiAKLS0g
CjIuMzIuMAoK

--=separator
Content-Type: application/octet-stream; name="xsa395-4.14.patch"
Content-Disposition: attachment; filename="xsa395-4.14.patch"
Content-Transfer-Encoding: base64

RnJvbSA3NDMzNDhmNWQ1NDVjN2ZmZjljZGVhNzQ2ODQwYjc5NWY1YzI2ZDQz
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWxpZW4gR3JhbGwg
PGpncmFsbEBhbWF6b24uY29tPgpEYXRlOiBXZWQsIDUgSmFuIDIwMjIgMTg6
MDk6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBwYXNzdGhyb3VnaC94ODY6
IHN0b3AgcGlycSBpdGVyYXRpb24gaW1tZWRpYXRlbHkgaW4gY2FzZSBvZgog
ZXJyb3IKCnB0X3BpcnFfaXRlcmF0ZSgpIHdpbGwgaXRlcmF0ZSBpbiBiYXRj
aCBvdmVyIGFsbCB0aGUgUElSUXMuIFRoZSBvdXRlcgpsb29wIHdpbGwgYmFp
bCBvdXQgaWYgJ3JjJyBpcyBub24temVybyBidXQgdGhlIGlubmVyIGxvb3Ag
d2lsbCBjb250aW51ZS4KClRoaXMgbWVhbnMgJ3JjJyB3aWxsIGdldCBjbG9i
YmVyZWQgYW5kIHdlIG1heSBtaXNzIGFueSBlcnJvcnMgKHN1Y2ggYXMKLUVS
RVNUQVJUIGluIHRoZSBjYXNlIG9mIHRoZSBjYWxsYmFjayBwY2lfY2xlYW5f
ZHBjaV9pcnEoKSkuCgpUaGlzIGlzIENWRS0yMDIyLTIzMDM1IC8gWFNBLTM5
NS4KCkZpeGVzOiBjMjQ1MzZiNjM2ZjIgKCJyZXBsYWNlIGQtPm5yX3BpcnFz
IHNpemVkIGFycmF5cyB3aXRoIHJhZGl4IHRyZWUiKQpGaXhlczogZjZkZDI5
NTM4MWY0ICgiZHBjaTogcmVwbGFjZSB0YXNrbGV0IHdpdGggc29mdGlycSIp
ClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5j
b20+ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgotLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lv
LmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pby5jIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW8uYwppbmRleCA3MWVhZjJjMTdl
MjcuLmI2ZTg4ZWJjODY0NiAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvaW8uYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9p
by5jCkBAIC04MTAsNyArODEwLDExIEBAIGludCBwdF9waXJxX2l0ZXJhdGUo
c3RydWN0IGRvbWFpbiAqZCwKIAogICAgICAgICAgICAgcGlycSA9IHBpcnFz
W2ldLT5waXJxOwogICAgICAgICAgICAgaWYgKCAocGlycV9kcGNpLT5mbGFn
cyAmIEhWTV9JUlFfRFBDSV9NQVBQRUQpICkKKyAgICAgICAgICAgIHsKICAg
ICAgICAgICAgICAgICByYyA9IGNiKGQsIHBpcnFfZHBjaSwgYXJnKTsKKyAg
ICAgICAgICAgICAgICBpZiAoIHJjICkKKyAgICAgICAgICAgICAgICAgICAg
YnJlYWs7CisgICAgICAgICAgICB9CiAgICAgICAgIH0KICAgICB9IHdoaWxl
ICggIXJjICYmICsrcGlycSA8IGQtPm5yX3BpcnFzICYmIG4gPT0gQVJSQVlf
U0laRShwaXJxcykgKTsKIAotLSAKMi4zMi4wCgo=

--=separator--

