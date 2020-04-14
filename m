Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF07F1A7A38
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 14:01:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOKFL-0007ZI-5h; Tue, 14 Apr 2020 12:00:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/bN9=56=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1jOKFK-0007ZD-2D
 for xen-devel@lists.xen.org; Tue, 14 Apr 2020 12:00:54 +0000
X-Inumbo-ID: 93684b7b-7e47-11ea-8927-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93684b7b-7e47-11ea-8927-12813bfff9fa;
 Tue, 14 Apr 2020 12:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eucW+RPaT0GEI8HFOjDiEnXO1niYC5IiWEbkmd5hCwo=; b=wd+55sFB06fPR6QnSYvEDjApz+
 h05YF9ODQI1QrQkCzcuuYJ4rkxB3X0ogYiS0KU8821+I6oERensZlARt66Ybe+vbq1OlNJFyRyMn8
 AblUNWcESKqLJIZyFlC2SCbys9DDdWQolc4AQ2bbBdQtSdPoDBZufHknXkFVMCFkMNDc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1jOKF8-0000YA-5T; Tue, 14 Apr 2020 12:00:42 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1jOKF8-00072Q-3i; Tue, 14 Apr 2020 12:00:42 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.508 (Entity 5.508)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
Subject: Xen Security Advisory 313 v3 (CVE-2020-11740,CVE-2020-11741) -
 multiple xenoprof issues
Message-Id: <E1jOKF8-00072Q-3i@xenbits.xenproject.org>
Date: Tue, 14 Apr 2020 12:00:42 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Xen.org security team" <security-team-members@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

    Xen Security Advisory CVE-2020-11740,CVE-2020-11741 / XSA-313
                              version 3

                       multiple xenoprof issues

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

Unprivileged guests can request to map xenoprof buffers, even if
profiling has not been enabled for those guests.  These buffers were
not scrubbed.  This is CVE-2020-11740.

Furthermore, for guests for which "active" profiling was enabled by
the administrator, the xenoprof code uses the standard Xen shared ring
structure.  Unfortunately, this code did not treat the guest as a
potential adversary: it trusts the guest not to modify buffer size
information or modify head / tail pointers in unexpected ways.  This is
CVE-2020-11741.

IMPACT
======

A malicious guest may be able to access sensitive information
pertaining to other guests.  Guests with "active profiling" enabled
can crash the host (DoS).  Privilege escalation cannot be ruled out.

VULNERABLE SYSTEMS
==================

Only x86 PV guests can leverage the vulnerabilities.  Arm guests and
x86 HVM and PVH guests cannot leverage the vulnerabilities.

All Xen versions back to at least 3.2 are vulnerable.

Any x86 PV guest can leverage the information leak.  Only x86 PV guests
whose host administrator has explicitly enabled "active profiling" for an
untrusted guest can exploit the DoS / potential privilege escalation.

Only builds of Xen with the Xenoprof functionality enabled at build
time are vulnerable.  The option to disable the functionality at build
time was been introduced in Xen 4.7.

MITIGATION
==========

Never making any untrusted guests "active" will avoid all but the info
leak part of the vulnerabilities.  There's no known mitigation for the
information leak (lack of scrubbing).

CREDITS
=======

This issue was discovered by Ilja Van Sprundel of IOActive.

RESOLUTION
==========

Applying the attached set of patches resolves these issues.

The first patch fixes the information leak issue, and should be
applied to all x86 systems running untrusted PV guests.

The second patch fixes the "active profiling" issue.  Systems which do
not enable active profiling can safely skip patch 2.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa313-?.patch         xen-unstable, Xen 4.9.x - 4.13.x

$ sha256sum xsa313*
63a11c5470a6c24f19d3a8a45042306256e7422d6556e3d76badaa515deb76d6  xsa313.meta
f186ad88b492b730aeae3bd01083dd6c13813ce08bcd4ffc608d7af500633a62  xsa313-1.patch
9fbcb5f11e5029e7d371ddb3520443c2780f240edc3d24436872935e34a85c37  xsa313-2.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl6VpdkMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZYZcH/0UHo2zmXGMDvZn1EF20ccKXNoZjvAE5TxSr/A/M
qkeASj4IMKlrPOrvs7aQSp97vECTz71Fxz2z7wpGwgIdiOYcRVg/t3b/+E1QSx5N
T7xYxxD9ULOLBQyPjYnXYwDC9+9yy+PZuWt3oPeXHrdtLI/5VY/gCzU+k+7bDABh
uljJ5KqxeQ5W8DOCR+XscQSZ9wiSkyh8MANjuJJ7uhtVDBo+ul94lrInJYEaBVpI
At5cU53B5nVGQ3RkNyWKjSW3VbL1TLgTdWAJNQOo+Z0OZJiKm6xQ6OYph2L4C4j4
e5A5c8UZAXLxVFWIMuiRW2GekOQEkGXtu+uJP00GuXm3+cQ=
=1C0J
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa313.meta"
Content-Disposition: attachment; filename="xsa313.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzMTMsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xMyIsCiAgICAiNC4xMiIsCiAgICAiNC4xMSIs
CiAgICAiNC4xMCIsCiAgICAiNC45IgogIF0sCiAgIlRyZWVzIjogWwogICAg
InhlbiIKICBdLAogICJSZWNpcGVzIjogewogICAgIjQuMTAiOiB7CiAgICAg
ICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3Rh
YmxlUmVmIjogIjQ5YTVkNmU5MjMxN2E3ZDlhY2JmMGJkYmQyNWIyODA5ZGZk
ODQyNjAiLAogICAgICAgICAgIlByZXJlcXMiOiBbXSwKICAgICAgICAgICJQ
YXRjaGVzIjogWwogICAgICAgICAgICAieHNhMzEzLT8ucGF0Y2giCiAgICAg
ICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQuMTEiOiB7
CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAg
ICAiU3RhYmxlUmVmIjogIjZiYzU0YzA2OTZjMGY2ZjYzOTU5ODM2M2QyODRj
NzE4OGE5ZTIwYWUiLAogICAgICAgICAgIlByZXJlcXMiOiBbXSwKICAgICAg
ICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMzEzLT8ucGF0Y2gi
CiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQu
MTIiOiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAg
ICAgICAgICAiU3RhYmxlUmVmIjogIjgyNGJkYjQzMmZjODgzMWVlNDY4NGU0
NTM2MWE3OGZhZWU0NTQ4ZWQiLAogICAgICAgICAgIlByZXJlcXMiOiBbXSwK
ICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMzEzLT8u
cGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAog
ICAgIjQuMTMiOiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4i
OiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogImQzZjNlNDQ3Njc2NjY3ZWYz
MGI0ODcwOGQzNTljOGY4YjEzYTlhMDMiLAogICAgICAgICAgIlByZXJlcXMi
OiBbXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNh
MzEzLT8ucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAg
ICB9LAogICAgIjQuOSI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAg
InhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiY2YyZTljYzBiYTA0
MzJmMDVjZGNhMzZkY2Q0NmJlNWZkZmQ3Y2EwYyIsCiAgICAgICAgICAiUHJl
cmVxcyI6IFtdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAg
ICJ4c2EzMTMtPy5wYXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAg
IH0KICAgIH0sCiAgICAibWFzdGVyIjogewogICAgICAiUmVjaXBlcyI6IHsK
ICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICJlMTli
NGIzYjU1Zjg0ZTBjZmNjMDJmZTVkNjY5NjU5NjlhODFjOTY1IiwKICAgICAg
ICAgICJQcmVyZXFzIjogW10sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAg
ICAgICAgICAgInhzYTMxMy0/LnBhdGNoIgogICAgICAgICAgXQogICAgICAg
IH0KICAgICAgfQogICAgfQogIH0KfQ==

--=separator
Content-Type: application/octet-stream; name="xsa313-1.patch"
Content-Disposition: attachment; filename="xsa313-1.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ZW5vcHJvZjogY2xlYXIgYnVmZmVyIGludGVuZGVkIHRvIGJlIHNoYXJl
ZCB3aXRoIGd1ZXN0cwoKYWxsb2NfeGVuaGVhcF9wYWdlcygpIG1ha2luZyB1
c2Ugb2YgTUVNRl9ub19zY3J1YiBpcyBmaW5lIGZvciBYZW4KaW50ZXJuYWxs
eSB1c2VkIGFsbG9jYXRpb25zLCBidXQgYnVmZmVycyBhbGxvY2F0ZWQgdG8g
YmUgc2hhcmVkIHdpdGgKKHVucHJpdmlsaWdlZCkgZ3Vlc3RzIG5lZWQgdG8g
YmUgemFwcGVkIG9mIHRoZWlyIHByaW9yIGNvbnRlbnQuCgpUaGlzIGlzIHBh
cnQgb2YgWFNBLTMxMy4KClJlcG9ydGVkLWJ5OiBJbGphIFZhbiBTcHJ1bmRl
bCA8aXZhbnNwcnVuZGVsQGlvYWN0aXZlLmNvbT4KU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpSZXZpZXdlZC1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KUmV2
aWV3ZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgotLS0gYS94ZW4vY29t
bW9uL3hlbm9wcm9mLmMKKysrIGIveGVuL2NvbW1vbi94ZW5vcHJvZi5jCkBA
IC0yNTMsNiArMjUzLDkgQEAgc3RhdGljIGludCBhbGxvY194ZW5vcHJvZl9z
dHJ1Y3QoCiAgICAgICAgIHJldHVybiAtRU5PTUVNOwogICAgIH0KIAorICAg
IGZvciAoIGkgPSAwOyBpIDwgbnBhZ2VzOyArK2kgKQorICAgICAgICBjbGVh
cl9wYWdlKGQtPnhlbm9wcm9mLT5yYXdidWYgKyBpICogUEFHRV9TSVpFKTsK
KwogICAgIGQtPnhlbm9wcm9mLT5ucGFnZXMgPSBucGFnZXM7CiAgICAgZC0+
eGVub3Byb2YtPm5idWYgPSBudmNwdTsKICAgICBkLT54ZW5vcHJvZi0+YnVm
c2l6ZSA9IGJ1ZnNpemU7Cg==

--=separator
Content-Type: application/octet-stream; name="xsa313-2.patch"
Content-Disposition: attachment; filename="xsa313-2.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ZW5vcHJvZjogbGltaXQgY29uc3VtcHRpb24gb2Ygc2hhcmVkIGJ1ZmZl
ciBkYXRhCgpTaW5jZSBhIHNoYXJlZCBidWZmZXIgY2FuIGJlIHdyaXR0ZW4g
dG8gYnkgdGhlIGd1ZXN0LCB3ZSBtYXkgb25seSByZWFkCnRoZSBoZWFkIGFu
ZCB0YWlsIHBvaW50ZXJzIGZyb20gdGhlcmUgKGFsbCBvdGhlciBmaWVsZHMg
c2hvdWxkIG9ubHkgZXZlcgpiZSB3cml0dGVuIHRvKS4gRnVydGhlcm1vcmUs
IGZvciBhbnkgcGFydGljdWxhciBvcGVyYXRpb24gdGhlIHR3byB2YWx1ZXMK
bXVzdCBiZSByZWFkIGV4YWN0bHkgb25jZSwgd2l0aCBib3RoIGNoZWNrcyBh
bmQgY29uc3VtcHRpb24gaGFwcGVuaW5nCndpdGggdGhlIHRodXMgcmVhZCB2
YWx1ZXMuIChUaGUgYmFja3RyYWNlIHJlbGF0ZWQgeGVub3Byb2ZfYnVmX3Nw
YWNlKCkKdXNlIGluIHhlbm9wcm9mX2xvZ19ldmVudCgpIGlzIGFuIGV4Y2Vw
dGlvbjogVGhlIHZhbHVlcyB1c2VkIHRoZXJlIGdldApyZS1jaGVja2VkIGJ5
IGV2ZXJ5IHN1YnNlcXVlbnQgeGVub3Byb2ZfYWRkX3NhbXBsZSgpLikKClNp
bmNlIHRoYXQgY29kZSBuZWVkZWQgdG91Y2hpbmcsIGFsc28gZml4IHRoZSBk
b3VibGUgaW5jcmVtZW50IG9mIHRoZQpsb3N0IHNhbXBsZXMgY291bnQgaW4g
Y2FzZSB0aGUgYmFja3RyYWNlIHJlbGF0ZWQgeGVub3Byb2ZfYWRkX3NhbXBs
ZSgpCmludm9jYXRpb24gaW4geGVub3Byb2ZfbG9nX2V2ZW50KCkgZmFpbHMu
CgpXaGVyZSBjb2RlIGlzIGJlaW5nIHRvdWNoZWQgYW55d2F5LCBhZGQgY29u
c3QgYXMgYXBwcm9wcmlhdGUsIGJ1dCB0YWtlCnRoZSBvcHBvcnR1bml0eSB0
byBlbnRpcmVseSBkcm9wIHRoZSBub3cgdW51c2VkIGRvbWFpbiBwYXJhbWV0
ZXIgb2YKeGVub3Byb2ZfYnVmX3NwYWNlKCkuCgpUaGlzIGlzIHBhcnQgb2Yg
WFNBLTMxMy4KClJlcG9ydGVkLWJ5OiBJbGphIFZhbiBTcHJ1bmRlbCA8aXZh
bnNwcnVuZGVsQGlvYWN0aXZlLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgpSZXZpZXdlZC1i
eTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCi0tLSBhL3hlbi9jb21tb24veGVu
b3Byb2YuYworKysgYi94ZW4vY29tbW9uL3hlbm9wcm9mLmMKQEAgLTQ3OSwy
NSArNDc5LDIyIEBAIHN0YXRpYyBpbnQgYWRkX3Bhc3NpdmVfbGlzdChYRU5f
R1VFU1RfSEEKIAogCiAvKiBHZXQgc3BhY2UgaW4gdGhlIGJ1ZmZlciAqLwot
c3RhdGljIGludCB4ZW5vcHJvZl9idWZfc3BhY2Uoc3RydWN0IGRvbWFpbiAq
ZCwgeGVub3Byb2ZfYnVmX3QgKiBidWYsIGludCBzaXplKQorc3RhdGljIGlu
dCB4ZW5vcHJvZl9idWZfc3BhY2UoaW50IGhlYWQsIGludCB0YWlsLCBpbnQg
c2l6ZSkKIHsKLSAgICBpbnQgaGVhZCwgdGFpbDsKLQotICAgIGhlYWQgPSB4
ZW5vcHJvZl9idWYoZCwgYnVmLCBldmVudF9oZWFkKTsKLSAgICB0YWlsID0g
eGVub3Byb2ZfYnVmKGQsIGJ1ZiwgZXZlbnRfdGFpbCk7Ci0KICAgICByZXR1
cm4gKCh0YWlsID4gaGVhZCkgPyAwIDogc2l6ZSkgKyB0YWlsIC0gaGVhZCAt
IDE7CiB9CiAKIC8qIENoZWNrIGZvciBzcGFjZSBhbmQgYWRkIGEgc2FtcGxl
LiBSZXR1cm4gMSBpZiBzdWNjZXNzZnVsLCAwIG90aGVyd2lzZS4gKi8KLXN0
YXRpYyBpbnQgeGVub3Byb2ZfYWRkX3NhbXBsZShzdHJ1Y3QgZG9tYWluICpk
LCB4ZW5vcHJvZl9idWZfdCAqYnVmLAorc3RhdGljIGludCB4ZW5vcHJvZl9h
ZGRfc2FtcGxlKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHhlbm9wcm9mX3Zj
cHUgKnYsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDY0
X3QgZWlwLCBpbnQgbW9kZSwgaW50IGV2ZW50KQogeworICAgIHhlbm9wcm9m
X2J1Zl90ICpidWYgPSB2LT5idWZmZXI7CiAgICAgaW50IGhlYWQsIHRhaWws
IHNpemU7CiAKICAgICBoZWFkID0geGVub3Byb2ZfYnVmKGQsIGJ1ZiwgZXZl
bnRfaGVhZCk7CiAgICAgdGFpbCA9IHhlbm9wcm9mX2J1ZihkLCBidWYsIGV2
ZW50X3RhaWwpOwotICAgIHNpemUgPSB4ZW5vcHJvZl9idWYoZCwgYnVmLCBl
dmVudF9zaXplKTsKKyAgICBzaXplID0gdi0+ZXZlbnRfc2l6ZTsKICAgICAK
ICAgICAvKiBtYWtlIHN1cmUgaW5kZXhlcyBpbiBzaGFyZWQgYnVmZmVyIGFy
ZSBzYW5lICovCiAgICAgaWYgKCAoaGVhZCA8IDApIHx8IChoZWFkID49IHNp
emUpIHx8ICh0YWlsIDwgMCkgfHwgKHRhaWwgPj0gc2l6ZSkgKQpAQCAtNTA2
LDcgKzUwMyw3IEBAIHN0YXRpYyBpbnQgeGVub3Byb2ZfYWRkX3NhbXBsZShz
dHJ1Y3QgZG8KICAgICAgICAgcmV0dXJuIDA7CiAgICAgfQogCi0gICAgaWYg
KCB4ZW5vcHJvZl9idWZfc3BhY2UoZCwgYnVmLCBzaXplKSA+IDAgKQorICAg
IGlmICggeGVub3Byb2ZfYnVmX3NwYWNlKGhlYWQsIHRhaWwsIHNpemUpID4g
MCApCiAgICAgewogICAgICAgICB4ZW5vcHJvZl9idWYoZCwgYnVmLCBldmVu
dF9sb2dbaGVhZF0uZWlwKSA9IGVpcDsKICAgICAgICAgeGVub3Byb2ZfYnVm
KGQsIGJ1ZiwgZXZlbnRfbG9nW2hlYWRdLm1vZGUpID0gbW9kZTsKQEAgLTUz
MCw3ICs1MjcsNiBAQCBzdGF0aWMgaW50IHhlbm9wcm9mX2FkZF9zYW1wbGUo
c3RydWN0IGRvCiBpbnQgeGVub3Byb2ZfYWRkX3RyYWNlKHN0cnVjdCB2Y3B1
ICp2Y3B1LCB1aW50NjRfdCBwYywgaW50IG1vZGUpCiB7CiAgICAgc3RydWN0
IGRvbWFpbiAqZCA9IHZjcHUtPmRvbWFpbjsKLSAgICB4ZW5vcHJvZl9idWZf
dCAqYnVmID0gZC0+eGVub3Byb2YtPnZjcHVbdmNwdS0+dmNwdV9pZF0uYnVm
ZmVyOwogCiAgICAgLyogRG8gbm90IGFjY2lkZW50YWxseSB3cml0ZSBhbiBl
c2NhcGUgY29kZSBkdWUgdG8gYSBicm9rZW4gZnJhbWUuICovCiAgICAgaWYg
KCBwYyA9PSBYRU5PUFJPRl9FU0NBUEVfQ09ERSApCkBAIC01MzksNyArNTM1
LDggQEAgaW50IHhlbm9wcm9mX2FkZF90cmFjZShzdHJ1Y3QgdmNwdSAqdmNw
dQogICAgICAgICByZXR1cm4gMDsKICAgICB9CiAKLSAgICByZXR1cm4geGVu
b3Byb2ZfYWRkX3NhbXBsZShkLCBidWYsIHBjLCBtb2RlLCAwKTsKKyAgICBy
ZXR1cm4geGVub3Byb2ZfYWRkX3NhbXBsZShkLCAmZC0+eGVub3Byb2YtPnZj
cHVbdmNwdS0+dmNwdV9pZF0sCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGMsIG1vZGUsIDApOwogfQogCiB2b2lkIHhlbm9wcm9mX2xvZ19l
dmVudChzdHJ1Y3QgdmNwdSAqdmNwdSwgY29uc3Qgc3RydWN0IGNwdV91c2Vy
X3JlZ3MgKnJlZ3MsCkBAIC01NzAsMTcgKzU2NywyMiBAQCB2b2lkIHhlbm9w
cm9mX2xvZ19ldmVudChzdHJ1Y3QgdmNwdSAqdmNwCiAgICAgLyogUHJvdmlk
ZSBiYWNrdHJhY2UgaWYgcmVxdWVzdGVkLiAqLwogICAgIGlmICggYmFja3Ry
YWNlX2RlcHRoID4gMCApCiAgICAgewotICAgICAgICBpZiAoICh4ZW5vcHJv
Zl9idWZfc3BhY2UoZCwgYnVmLCB2LT5ldmVudF9zaXplKSA8IDIpIHx8Ci0g
ICAgICAgICAgICAgIXhlbm9wcm9mX2FkZF9zYW1wbGUoZCwgYnVmLCBYRU5P
UFJPRl9FU0NBUEVfQ09ERSwgbW9kZSwgCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgWEVOT1BST0ZfVFJBQ0VfQkVHSU4pICkKKyAgICAg
ICAgaWYgKCB4ZW5vcHJvZl9idWZfc3BhY2UoeGVub3Byb2ZfYnVmKGQsIGJ1
ZiwgZXZlbnRfaGVhZCksCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHhlbm9wcm9mX2J1ZihkLCBidWYsIGV2ZW50X3RhaWwpLAorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB2LT5ldmVudF9zaXplKSA8IDIg
KQogICAgICAgICB7CiAgICAgICAgICAgICB4ZW5vcHJvZl9idWYoZCwgYnVm
LCBsb3N0X3NhbXBsZXMpKys7CiAgICAgICAgICAgICBsb3N0X3NhbXBsZXMr
KzsKICAgICAgICAgICAgIHJldHVybjsKICAgICAgICAgfQorCisgICAgICAg
IC8qIHhlbm9wcm9mX2FkZF9zYW1wbGUoKSB3aWxsIGluY3JlbWVudCBsb3N0
X3NhbXBsZXMgb24gZmFpbHVyZSAqLworICAgICAgICBpZiAoICF4ZW5vcHJv
Zl9hZGRfc2FtcGxlKGQsIHYsIFhFTk9QUk9GX0VTQ0FQRV9DT0RFLCBtb2Rl
LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFhFTk9QUk9G
X1RSQUNFX0JFR0lOKSApCisgICAgICAgICAgICByZXR1cm47CiAgICAgfQog
Ci0gICAgaWYgKCB4ZW5vcHJvZl9hZGRfc2FtcGxlKGQsIGJ1ZiwgcGMsIG1v
ZGUsIGV2ZW50KSApCisgICAgaWYgKCB4ZW5vcHJvZl9hZGRfc2FtcGxlKGQs
IHYsIHBjLCBtb2RlLCBldmVudCkgKQogICAgIHsKICAgICAgICAgaWYgKCBp
c19hY3RpdmUodmNwdS0+ZG9tYWluKSApCiAgICAgICAgICAgICBhY3RpdmVf
c2FtcGxlcysrOwotLS0gYS94ZW4vaW5jbHVkZS94ZW4veGVub3Byb2YuaAor
KysgYi94ZW4vaW5jbHVkZS94ZW4veGVub3Byb2YuaApAQCAtNjEsMTIgKzYx
LDEyIEBAIHN0cnVjdCB4ZW5vcHJvZiB7CiAKICNpZm5kZWYgQ09ORklHX0NP
TVBBVAogI2RlZmluZSBYRU5PUFJPRl9DT01QQVQoeCkgMAotI2RlZmluZSB4
ZW5vcHJvZl9idWYoZCwgYiwgZmllbGQpICgoYiktPmZpZWxkKQorI2RlZmlu
ZSB4ZW5vcHJvZl9idWYoZCwgYiwgZmllbGQpIEFDQ0VTU19PTkNFKChiKS0+
ZmllbGQpCiAjZWxzZQogI2RlZmluZSBYRU5PUFJPRl9DT01QQVQoeCkgKCh4
KS0+aXNfY29tcGF0KQotI2RlZmluZSB4ZW5vcHJvZl9idWYoZCwgYiwgZmll
bGQpICgqKCEoZCktPnhlbm9wcm9mLT5pc19jb21wYXQgPyBcCi0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmKGIpLT5uYXRpdmUu
ZmllbGQgOiBcCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAmKGIpLT5jb21wYXQuZmllbGQpKQorI2RlZmluZSB4ZW5vcHJvZl9i
dWYoZCwgYiwgZmllbGQpIEFDQ0VTU19PTkNFKCooIShkKS0+eGVub3Byb2Yt
PmlzX2NvbXBhdCBcCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA/ICYoYiktPm5hdGl2ZS5maWVsZCBcCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6
ICYoYiktPmNvbXBhdC5maWVsZCkpCiAjZW5kaWYKIAogc3RydWN0IGRvbWFp
bjsK

--=separator--

