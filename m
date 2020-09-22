Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F43C274367
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 15:41:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKiXt-0004Mi-Ir; Tue, 22 Sep 2020 13:41:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pzSo=C7=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kKiUl-0001gf-8q
 for xen-devel@lists.xen.org; Tue, 22 Sep 2020 13:38:11 +0000
X-Inumbo-ID: 6b92994e-52f4-4d9e-8f31-d6171dba0445
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b92994e-52f4-4d9e-8f31-d6171dba0445;
 Tue, 22 Sep 2020 13:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 bh=+isba2oHNxAWLTpZElUcuF2o8dNqyf/0jqJsIMihQxY=; b=tsEwmKd10jaIOU41xIXoOT+L2c
 M9WfC9LIqco/Hd+RGv5X7Y6OV9Q2dhyEoI7elXcNbW/Zpm8Xcrz+PGQtc630Hb8REhaP7QW0XRjGO
 S3x/bW7vJUwzAQnrcBJiMxpNmYbC1Hes0XPkwYtqKzOnrbDA5w0s26qlxgKCylLY4JpU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1kKiTs-0006pV-VN; Tue, 22 Sep 2020 13:37:16 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1kKiTs-0002Kw-UN; Tue, 22 Sep 2020 13:37:16 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 338 v4 (CVE-2020-25597) - once valid event
 channels may not turn invalid
Message-Id: <E1kKiTs-0002Kw-UN@xenbits.xenproject.org>
Date: Tue, 22 Sep 2020 13:37:16 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2020-25597 / XSA-338
                               version 4

            once valid event channels may not turn invalid

UPDATES IN VERSION 4
====================

Public release.

ISSUE DESCRIPTION
=================

Logic in the handling of event channel operations in Xen assumes that an
event channel, once valid, will not become invalid over the life time of
a guest.  However, operations like the resetting of all event channels
may involve decreasing one of the bounds checked when determining
validity.  This may lead to bug checks triggering, crashing the host.

IMPACT
======

An unprivileged guest may be able to crash Xen, leading to a Denial of
Service (DoS) for the entire system.

VULNERABLE SYSTEMS
==================

All Xen versions from 4.4 onwards are vulnerable.  Xen versions 4.3 and
earlier are not vulnerable.

Only systems with untrusted guests permitted to create more than the
default number of event channels are vulnerable.  This number depends
on the architecture and type of guest.  For 32-bit x86 PV guests, this
is 1023; for 64-bit x86 PV guests, and for all ARM guests, this number
is 4095.  Systems where untrusted guests are limited to fewer than
this number are not vulnerable.

Note that xl and libxl limit max_event_channels to 1023 by default, so
systems using exlusively xl, libvirt+libxl, or their own toolstack
based on libxl, and not explicitly setting max_event_channels, are not
vulnerable.

MITIGATION
==========

The problem can be avoided by reducing the number of event channels
available to the guest to no more than 1023.  For example, setting
"max_event_channels=1023" in the xl domain configuration, or deleting
any existing setting (since 1023 is the default for xl/libxl).

For ARM systems, any limit no more than 4095 is safe.

For 64-bit x86 PV guests, any limit no more than 4095 is likewise safe
if the host configuration prevents the guest administrator from
substituting and running a 32-bit kernel (and thereby putting the
guest into 32-bit PV mode).

CREDITS
=======

This issue was discovered by Jan Beulich of SUSE.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa338.patch           Xen 4.10 - xen-unstable

$ sha256sum xsa338*
56c322b89a96db6be40cf15fdb9303e24ff692aa5a6274b2d7718bfc05acf309  xsa338.meta
7345eac1cbad23b082523e9cbd0331f8a9f16c6e459fb2a686606253f5514c9b  xsa338.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the *patch* described above (or others which are
substantially similar) is permitted during the embargo, even on
public-facing systems with untrusted guest users and administrators.

But: Distribution of updated software is prohibited (except to other
members of the predisclosure list).

And: deployment of the event channel limit reduction mitigation is NOT
permitted (except where all the affected systems and VMs are
administered and used only by organisations which are members of the
Xen Project Security Issues Predisclosure List).  Specifically,
deployment on public cloud systems is NOT permitted.

This is because such a change can be visible to the guest, so it would
leak the preconditions for the vulnerability and maybe lead to
rediscovery.

Deployment of this, or similar mitigations, is permitted only AFTER
the embargo ends.

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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl9p/ecMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZlToIAMY5ZvKvqVmLzy/UEZrq3lgf8DA2+n9BFnec+XlI
gDz7ssJNgwnkrrt7BF/XGeaAwly/pRACLapYd7hP8KNM3qPz/DG++S2FS/O44AkQ
7yjYRoEJRxFK1RnG3UeVw9S8aDrUrsTIoh7WFsX7rvEw6zg6o4kii4YSjvUSV5ug
uYh0p3i56CWqjlKd94ZQlESfacrl1wZd/AemdDbAzj/FMF0ZyQujQ3PHBAcLjbPR
jzE/EJRjpEPe9kMWKDWX06VlWja6cUDFIlaqZM9nlgiyI643y2iRSuilQbansMPA
zG6SXQOqzSWc+OQ3wUaf972mjNfiKiBSFo/hB95HdS5I2Pk=
=EzUa
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa338.meta"
Content-Disposition: attachment; filename="xsa338.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzMzgsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNCIsCiAgICAiNC4xMyIsCiAgICAiNC4xMiIs
CiAgICAiNC4xMSIsCiAgICAiNC4xMCIKICBdLAogICJUcmVlcyI6IFsKICAg
ICJ4ZW4iCiAgXSwKICAiUmVjaXBlcyI6IHsKICAgICI0LjEwIjogewogICAg
ICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0
YWJsZVJlZiI6ICI5M2JlOTQzZTdkNzU5MDE1YmQ1ZGI0MWE0OGY2ZGNlNThl
NTgwZDVhIiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAz
MzYsCiAgICAgICAgICAgIDMzNwogICAgICAgICAgXSwKICAgICAgICAgICJQ
YXRjaGVzIjogWwogICAgICAgICAgICAieHNhMzM4LnBhdGNoIgogICAgICAg
ICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICI0LjExIjogewog
ICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAg
IlN0YWJsZVJlZiI6ICJkZGFhY2NiYmFiNmIxOWJmMjFlZDJjMDk3ZjMwNTVh
M2MyNTQ0YzhkIiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAg
ICAzMzMsCiAgICAgICAgICAgIDMzNiwKICAgICAgICAgICAgMzM3CiAgICAg
ICAgICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4
c2EzMzgucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAg
ICB9LAogICAgIjQuMTIiOiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAg
ICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogIjEzMzZjYTE3NzQy
NDcxZmM0YTU5ODc5YWUyZjYzN2E1OTUzMGE5MzMiLAogICAgICAgICAgIlBy
ZXJlcXMiOiBbCiAgICAgICAgICAgIDMzMywKICAgICAgICAgICAgMzM0LAog
ICAgICAgICAgICAzMzYsCiAgICAgICAgICAgIDMzNwogICAgICAgICAgXSwK
ICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMzM4LnBh
dGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAg
ICI0LjEzIjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjog
ewogICAgICAgICAgIlN0YWJsZVJlZiI6ICI5YjM2N2IyYjBiNzE0ZjNmZmI2
OWVkNmJlMGExMThlOGQzZWFjMDdmIiwKICAgICAgICAgICJQcmVyZXFzIjog
WwogICAgICAgICAgICAzMzMsCiAgICAgICAgICAgIDMzNCwKICAgICAgICAg
ICAgMzM2LAogICAgICAgICAgICAzMzcKICAgICAgICAgIF0sCiAgICAgICAg
ICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTMzOC5wYXRjaCIKICAg
ICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC4xNCI6
IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAg
ICAgICJTdGFibGVSZWYiOiAiYzNhMGZjMjJhZjkwZWYyOGU2OGIxMTZjNmE0
OWQ5Y2VjNTdmNzFjZiIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAgICAg
ICAgICAgMzMzLAogICAgICAgICAgICAzMzQsCiAgICAgICAgICAgIDMzNiwK
ICAgICAgICAgICAgMzM3CiAgICAgICAgICBdLAogICAgICAgICAgIlBhdGNo
ZXMiOiBbCiAgICAgICAgICAgICJ4c2EzMzgucGF0Y2giCiAgICAgICAgICBd
CiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAgIm1hc3RlciI6IHsKICAg
ICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJT
dGFibGVSZWYiOiAiYjExOTEwMDgyZDkwYmIxNTk3ZjY2Nzk1MjRlYjcyNmEz
MzMwNjY3MiIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAgICAg
MzMzLAogICAgICAgICAgICAzMzQsCiAgICAgICAgICAgIDMzNiwKICAgICAg
ICAgICAgMzM3CiAgICAgICAgICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBb
CiAgICAgICAgICAgICJ4c2EzMzgucGF0Y2giCiAgICAgICAgICBdCiAgICAg
ICAgfQogICAgICB9CiAgICB9CiAgfQp9

--=separator
Content-Type: application/octet-stream; name="xsa338.patch"
Content-Disposition: attachment; filename="xsa338.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBldnRjaG46IHJlbGF4IHBvcnRfaXNfdmFsaWQoKQoKVG8gYXZvaWQgcG9y
dHMgcG90ZW50aWFsbHkgYmVjb21pbmcgaW52YWxpZCBiZWhpbmQgdGhlIGJh
Y2sgb2YgY2VydGFpbgpvdGhlciBmdW5jdGlvbnMgKGR1ZSB0byAtPm1heF9l
dnRjaG4gc2hyaW5raW5nKSBiZWNhdXNlIG9mCi0gYSBndWVzdCBpbnZva2lu
ZyBldnRjaG5fcmVzZXQoKSBhbmQgZnJvbSBhIDJuZCB2Q1BVIG9wZW5pbmcg
bmV3CiAgY2hhbm5lbHMgaW4gcGFyYWxsZWwgKHNlZSBhbHNvIFhTQS0zNDMp
LAotIGFsbG9jX3VuYm91bmRfeGVuX2V2ZW50X2NoYW5uZWwoKSBwcm9kdWNl
ZCBjaGFubmVscyBsaXZpbmcgYWJvdmUgdGhlCiAgMi1sZXZlbCByYW5nZSAo
c2VlIGFsc28gWFNBLTM0MiksCmRyb3AgdGhlIG1heF9ldnRjaG5zIGNoZWNr
IGZyb20gcG9ydF9pc192YWxpZCgpLiBGb3IgYSBwb3J0IGZvciB3aGljaAp0
aGUgZnVuY3Rpb24gb25jZSByZXR1cm5lZCAidHJ1ZSIsIHRoZSByZXR1cm5l
ZCB2YWx1ZSBtYXkgbm90IHR1cm4gaW50bwoiZmFsc2UiIGxhdGVyIG9uLiBU
aGUgZnVuY3Rpb24ncyByZXN1bHQgbWF5IG9ubHkgZGVwZW5kIG9uIGJvdW5k
cyB3aGljaApjYW4gb25seSBldmVyIGdyb3cgKHdoaWNoIGlzIHRoZSBjYXNl
IGZvciBkLT52YWxpZF9ldnRjaG5zKS4KClRoaXMgYWxzbyBlbGltaW5hdGVz
IGEgZmFsc2Ugc2Vuc2Ugb2Ygc2FmZXR5LCB1dGlsaXplZCBieSBzb21lIG9m
IHRoZQp1c2VycyAoc2VlIGFnYWluIFhTQS0zNDMpOiBXaXRob3V0IGEgc3Vp
dGFibGUgbG9jayBoZWxkLCBkLT5tYXhfZXZ0Y2hucwptYXkgY2hhbmdlIGF0
IGFueSB0aW1lLCBhbmQgaGVuY2UgZGVkdWNpbmcgdGhhdCBjZXJ0YWluIG90
aGVyIG9wZXJhdGlvbnMKYXJlIHNhZmUgd2hlbiBwb3J0X2lzX3ZhbGlkKCkg
cmV0dXJuZWQgdHJ1ZSBpcyBub3QgbGVnaXRpbWF0ZS4gVGhlCm9wcG9ydHVu
aXRpZXMgdG8gYWJ1c2UgdGhpcyBtYXkgZ2V0IHdpZGVuZWQgYnkgdGhlIGNo
YW5nZSBoZXJlCihkZXBlbmRpbmcgb24gZ3Vlc3QgYW5kIGhvc3QgY29uZmln
dXJhdGlvbiksIGJ1dCB3aWxsIGJlIHRha2VuIGNhcmUgb2YKYnkgdGhlIG90
aGVyIFhTQS4KClRoaXMgaXMgWFNBLTMzOC4KCkZpeGVzOiA0ODk3NGU2Y2U1
MmUgKCJldnRjaG46IHVzZSBhIHBlci1kb21haW4gdmFyaWFibGUgZm9yIHRo
ZSBtYXggbnVtYmVyIG9mIGV2ZW50IGNoYW5uZWxzIikKU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpSZXZpZXdlZC1i
eTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PgpSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNv
bT4KLS0tCnY1OiBOZXcsIHNwbGl0IGZyb20gbGFyZ2VyIHBhdGNoLgoKLS0t
IGEveGVuL2luY2x1ZGUveGVuL2V2ZW50LmgKKysrIGIveGVuL2luY2x1ZGUv
eGVuL2V2ZW50LmgKQEAgLTEwNyw4ICsxMDcsNiBAQCB2b2lkIG5vdGlmeV92
aWFfeGVuX2V2ZW50X2NoYW5uZWwoc3RydWN0CiAKIHN0YXRpYyBpbmxpbmUg
Ym9vbF90IHBvcnRfaXNfdmFsaWQoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWdu
ZWQgaW50IHApCiB7Ci0gICAgaWYgKCBwID49IGQtPm1heF9ldnRjaG5zICkK
LSAgICAgICAgcmV0dXJuIDA7CiAgICAgcmV0dXJuIHAgPCByZWFkX2F0b21p
YygmZC0+dmFsaWRfZXZ0Y2hucyk7CiB9CiAK

--=separator--

