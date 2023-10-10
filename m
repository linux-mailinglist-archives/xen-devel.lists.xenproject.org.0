Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE847BFAC5
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 14:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614715.956031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqBVE-0007WX-NV; Tue, 10 Oct 2023 12:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614715.956031; Tue, 10 Oct 2023 12:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqBVE-0007NF-Gl; Tue, 10 Oct 2023 12:06:20 +0000
Received: by outflank-mailman (input) for mailman id 614715;
 Tue, 10 Oct 2023 12:06:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8mmp=FY=xenbits.xen.org=julieng@srs-se1.protection.inumbo.net>)
 id 1qqBVC-0006hr-E5
 for xen-devel@lists.xen.org; Tue, 10 Oct 2023 12:06:18 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6523cda4-6765-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 14:06:11 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1qqBUr-0007te-DN; Tue, 10 Oct 2023 12:05:57 +0000
Received: from julieng by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1qqBUr-0002FK-BR; Tue, 10 Oct 2023 12:05:57 +0000
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
X-Inumbo-ID: 6523cda4-6765-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=D37PBAC+RolY3esUiWHAEVeU0TNDo2qa+fvFZqvFW40=; b=pW495gIoBCV6hyolajy4eEsnWF
	61JxceFiXPg3KLY3azjMnlyO3Y1u7KnjJ5VFHio7qHVtT/sWrvI/Yvx8TrJhWP3bTjnfdPjIRAp5z
	chDbep5J/BYnlR2oRJZp2xAQa3f/uVgKWFn3/sddGtVhMrMVyAFIuyhVjWJ/YBXMo7eM=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 440 v3 (CVE-2023-34323) - xenstored: A
 transaction conflict can crash C Xenstored
Message-Id: <E1qqBUr-0002FK-BR@xenbits.xenproject.org>
Date: Tue, 10 Oct 2023 12:05:57 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2023-34323 / XSA-440
                               version 3

        xenstored: A transaction conflict can crash C Xenstored

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

When a transaction is committed, C Xenstored will first check
the quota is correct before attempting to commit any nodes.  It would
be possible that accounting is temporarily negative if a node has
been removed outside of the transaction.

Unfortunately, some versions of C Xenstored are assuming that the
quota cannot be negative and are using assert() to confirm it.  This
will lead to C Xenstored crash when tools are built without -DNDEBUG
(this is the default).

IMPACT
======

A malicious guest could craft a transaction that will hit the C
Xenstored bug and crash it.  This will result to the inability to
perform any further domain administration like starting new guests,
or adding/removing resources to or from any existing guest.

VULNERABLE SYSTEMS
==================

All versions of Xen up to and including 4.17 are vulnerable if XSA-326
was ingested.

All Xen systems using C Xenstored are vulnerable.  C Xenstored built
using -DNDEBUG (can be specified via EXTRA_CFLAGS_XEN_TOOLS=-DNDEBUG)
are not vulnerable.  Systems using the OCaml variant of Xenstored are
not vulnerable.

MITIGATION
==========

The problem can be avoided by using OCaml Xenstored variant.

CREDITS
=======

This issue was discovered by Stanislav Uschakow and Julien Grall, all
from Amazon.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa440-4.17.patch      Xen 4.17.x - Xen 4.15.x.

$ sha256sum xsa440*
187b7edef4f509f3d7ec1662901fa638a900ab4213447438171fb2935f387014  xsa440.meta
431dab53baf2b57a299d1a151b330b62d9a007715d700e8515db71ff813d0037  xsa440-4.17.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmUlNOMMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZy64IAIZBqlKJAGVeGMzSpuJfkP2YXLe9JNeR46HRG90e
mV94MWmsf+4kMu2ZhnXQaR2+lafjNfAQVdh9nXV0tdJu//yzLRfXnLfFWrroqBTS
g69/9zvgGRYvobHe6X/WmLwXCV8N27q04zLK7R9nYwntw2mJBBCvUfRPVHk/6lpH
4Ke6o0XbjmOjForl2PA3ISRqXKD5nB0pWp1cEfPt3PzCUV02kI/N3veWDRN2wyPN
jclvwlVVASJdCrcs0+NlOalN5XhD9+K5RN+VVGu3dchXpaa3qEOiTc/V5T1U5cX8
pqNqUBlo4ECFLygE2aUTITIX+dpLaGYD8rmFq0CPnsB6E5U=
=6W84
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa440.meta"
Content-Disposition: attachment; filename="xsa440.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiA0NDAsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNyIsCiAgICAiNC4xNiIsCiAgICAiNC4xNSIK
ICBdLAogICJUcmVlcyI6IFsKICAgICJ4ZW4iCiAgXSwKICAiUmVjaXBlcyI6
IHsKICAgICI0LjE1IjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAi
eGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICIzYTlhMjkwMWNjOGIy
NGYyOGRiZGM2ZmI2M2Y1NzAwNmM3N2ExZjQ3IiwKICAgICAgICAgICJQcmVy
ZXFzIjogW10sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAg
InhzYTQ0MC00LjE3LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAg
ICAgfQogICAgfSwKICAgICI0LjE2IjogewogICAgICAiUmVjaXBlcyI6IHsK
ICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICJjNDUw
YTRiYzExZTk3ZWFiZTk3ZGNlZmUwNmY1MTBkN2FjZWE4ZDZkIiwKICAgICAg
ICAgICJQcmVyZXFzIjogW10sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAg
ICAgICAgICAgInhzYTQ0MC00LjE3LnBhdGNoIgogICAgICAgICAgXQogICAg
ICAgIH0KICAgICAgfQogICAgfSwKICAgICI0LjE3IjogewogICAgICAiUmVj
aXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJl
ZiI6ICI5MGM1NDBjNTg5ODVkYzc3NGNmMGExZDJkYzQyMzQ3M2QzZjM3MjY3
IiwKICAgICAgICAgICJQcmVyZXFzIjogW10sCiAgICAgICAgICAiUGF0Y2hl
cyI6IFsKICAgICAgICAgICAgInhzYTQ0MC00LjE3LnBhdGNoIgogICAgICAg
ICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICJtYXN0ZXIiOiB7
CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAg
ICAiU3RhYmxlUmVmIjogImQwOWU0NGU1ZDhmZGZlMGE4YjhhZjFlZjYwNGRi
YzY5OTQ5N2UxMWEiLAogICAgICAgICAgIlByZXJlcXMiOiBbXSwKICAgICAg
ICAgICJQYXRjaGVzIjogW10KICAgICAgICB9CiAgICAgIH0KICAgIH0KICB9
Cn0=

--=separator
Content-Type: application/octet-stream; name="xsa440-4.17.patch"
Content-Disposition: attachment; filename="xsa440-4.17.patch"
Content-Transfer-Encoding: base64

RnJvbSA1ZDhiM2QxZWM5OGU1NjE1NWQ5NjUwZDdmNGE3MGNkOGJhOWRjMjdk
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWxpZW4gR3JhbGwg
PGpncmFsbEBhbWF6b24uY29tPgpEYXRlOiBGcmksIDIyIFNlcCAyMDIzIDEx
OjMyOjE2ICswMTAwClN1YmplY3Q6IHRvb2xzL3hlbnN0b3JlZDogZG9tYWlu
X2VudHJ5X2ZpeCgpOiBIYW5kbGUgY29uZmxpY3RpbmcgdHJhbnNhY3Rpb24K
ClRoZSBmdW5jdGlvbiBkb21haW5fZW50cnlfZml4KCkgd2lsbCBiZSBpbml0
aWFsbHkgY2FsbGVkIHRvIGNoZWNrIGlmIHRoZQpxdW90YSBpcyBjb3JyZWN0
IGJlZm9yZSBhdHRlbXB0IHRvIGNvbW1pdCBhbnkgbm9kZXMuIFNvIGl0IHdv
dWxkIGJlCnBvc3NpYmxlIHRoYXQgYWNjb3VudGluZyBpcyB0ZW1wb3Jhcmls
eSBuZWdhdGl2ZS4gVGhpcyBpcyB0aGUgY2FzZQppbiB0aGUgZm9sbG93aW5n
IHNlcXVlbmNlOgoKICAxKSBDcmVhdGUgNTAgbm9kZXMKICAyKSBTdGFydCB0
d28gdHJhbnNhY3Rpb25zCiAgMykgRGVsZXRlIGFsbCB0aGUgbm9kZXMgaW4g
ZWFjaCB0cmFuc2FjdGlvbgogIDQpIENvbW1pdCB0aGUgdHdvIHRyYW5zYWN0
aW9ucwoKQmVjYXVzZSB0aGUgZmlyc3QgdHJhbnNhY3Rpb24gd2lsbCBoYXZl
IHN1Y2NlZWQgYW5kIHVwZGF0ZWQgdGhlCmFjY291bnRpbmcsIHRoZXJlIGlz
IG5vIGd1YXJhbnRlZSB0aGF0ICdkLT5uYmVudHJ5ICsgbnVtJyB3aWxsIHN0
aWxsCmJlIGFib3ZlIDAuIFNvIHRoZSBhc3NlcnQoKSB3b3VsZCBiZSB0cmln
Z2VyZWQuClRoZSBhc3NlcnQoKSB3YXMgaW50cm9kdWNlZCBpbiBkYmVmMWY3
NDgyODkgKCJ0b29scy94ZW5zdG9yZTogc2ltcGxpZnkKYW5kIGZpeCBwZXIg
ZG9tYWluIG5vZGUgYWNjb3VudGluZyIpIHdpdGggdGhlIGFzc3VtcHRpb24g
dGhhdCB0aGUKdmFsdWUgY2FuJ3QgYmUgbmVnYXRpdmUuIEFzIHRoaXMgaXMg
bm90IHRydWUgcmV2ZXJ0IHRvIHRoZSBvcmlnaW5hbApjaGVjayBidXQgcmVz
dHJpY3RlZCB0byB0aGUgcGF0aCB3aGVyZSB3ZSBkb24ndCB1cGRhdGUuIFRh
a2UgdGhlCm9wcG9ydHVuaXR5IHRvIGV4cGxhaW4gdGhlIHJhdGlvbmFsZSBi
ZWhpbmQgdGhlIGNoZWNrLgoKVGhpcyBDVkUtMjAyMy0zNDMyMyAvIFhTQS00
NDAuCgpSZXBvcnRlZC1ieTogU3RhbmlzbGF2IFVzY2hha293IDxzdXNjaGFr
b0BhbWF6b24uZGU+CkZpeGVzOiBkYmVmMWY3NDgyODkgKCJ0b29scy94ZW5z
dG9yZTogc2ltcGxpZnkgYW5kIGZpeCBwZXIgZG9tYWluIG5vZGUgYWNjb3Vu
dGluZyIpClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFt
YXpvbi5jb20+ClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+CgpkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUveGVuc3Rv
cmVkX2RvbWFpbi5jIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2RvbWFp
bi5jCmluZGV4IGFhODY4OTJmZWQ5ZS4uNjA3NGRmMjEwYzZlIDEwMDY0NAot
LS0gYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMKKysrIGIv
dG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2RvbWFpbi5jCkBAIC0xMDk0LDEw
ICsxMDk0LDIwIEBAIGludCBkb21haW5fZW50cnlfZml4KHVuc2lnbmVkIGlu
dCBkb21pZCwgaW50IG51bSwgYm9vbCB1cGRhdGUpCiAJfQogCiAJY250ID0g
ZC0+bmJlbnRyeSArIG51bTsKLQlhc3NlcnQoY250ID49IDApOwogCi0JaWYg
KHVwZGF0ZSkKKwlpZiAodXBkYXRlKSB7CisJCWFzc2VydChjbnQgPj0gMCk7
CiAJCWQtPm5iZW50cnkgPSBjbnQ7CisJfSBlbHNlIGlmIChjbnQgPCAwKSB7
CisJCS8qCisJCSAqIEluIGEgdHJhbnNhY3Rpb24gd2hlbiBhIG5vZGUgaXMg
YmVpbmcgYWRkZWQvcmVtb3ZlZCBBTkQKKwkJICogdGhlIHNhbWUgbm9kZSBo
YXMgYmVlbiBhZGRlZC9yZW1vdmVkIG91dHNpZGUgdGhlCisJCSAqIHRyYW5z
YWN0aW9uIGluIHBhcmFsbGVsLCB0aGUgcmVzdWx0IHZhbHVlIG1heSBiZSBu
ZWdhdGl2ZS4KKwkJICogVGhpcyBpcyBubyBwcm9ibGVtLCBhcyB0aGUgdHJh
bnNhY3Rpb24gd2lsbCBmYWlsIGR1ZSB0bworCQkgKiB0aGUgcmVzdWx0aW5n
IGNvbmZsaWN0LiBTbyBvdmVycmlkZSAnY250Jy4KKwkJICovCisJCWNudCA9
IDA7CisJfQogCiAJcmV0dXJuIGRvbWlkX2lzX3VucHJpdmlsZWdlZChkb21p
ZCkgPyBjbnQgOiAwOwogfQo=

--=separator--

