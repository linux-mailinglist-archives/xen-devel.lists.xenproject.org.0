Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF7E11AA7F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 13:12:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if0o8-0005QH-E8; Wed, 11 Dec 2019 12:09:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+9Em=2B=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1if0o6-0005Q0-Az
 for xen-devel@lists.xen.org; Wed, 11 Dec 2019 12:09:30 +0000
X-Inumbo-ID: 11dbc626-1c0f-11ea-a1e1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11dbc626-1c0f-11ea-a1e1-bc764e2007e4;
 Wed, 11 Dec 2019 12:09:23 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1if0nu-0008Qx-Ka; Wed, 11 Dec 2019 12:09:18 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1if0nu-0001Zr-J5; Wed, 11 Dec 2019 12:09:18 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.508 (Entity 5.508)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
Message-Id: <E1if0nu-0001Zr-J5@xenbits.xenproject.org>
Date: Wed, 11 Dec 2019 12:09:18 +0000
Subject: [Xen-devel] Xen Security Advisory 309 v3 (CVE-2019-19578) - Linear
 pagetable use / entry miscounts
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

            Xen Security Advisory CVE-2019-19578 / XSA-309
                               version 3

                Linear pagetable use / entry miscounts

UPDATES IN VERSION 3
====================

Public release.

Updated metadata to add 4.13, update StableRef's

ISSUE DESCRIPTION
=================

"Linear pagetables" is a technique which involves either pointing a
pagetable at itself, or to another pagetable of the same or higher
level.  Xen has limited support for linear pagetables: A page may
either point to itself, or point to another pagetable of the same
level (i.e., L2 to L2, L3 to L3, and so on).

XSA-240 introduced an additional restriction that limited the "depth"
of such chains by allowing pages to either *point to* other pages of
the same level, or *be pointed to* by other pages of the same level,
but not both.  To implement this, we keep track of the number of
outstanding times a page points to or is pointed to another page
table, to prevent both from happening at the same time.

Unfortunately, the original commit introducing this reset this count
when resuming validation of a partially-validated pagetable,
incorrectly dropping some "linear_pt_entry" counts.

If an attacker could engineer such a situation to occur, they might be
able to make loops or other arbitrary chains of linear pagetables, as
described in XSA-240.

IMPACT
======

A malicious or buggy PV guest may cause the hypervisor to crash,
resulting in Denial of Service (DoS) affecting the entire host.
Privilege escalation and information leaks cannot be excluded.

VULNERABLE SYSTEMS
==================

All versions of Xen are vulnerable.

Only x86 systems are affected.  Arm systems are not affected.

Only x86 PV guests can leverage the vulnerability.  x86 HVM and PVH
guests cannot leverage the vulnerability.

Only systems which have enabled linear pagetables are vulnerable.
Systems which have disabled linear pagetables, either by selecting
CONFIG_PV_LINEAR_PT=n when building the hypervisor, or adding
pv-linear-pt=false on the command-line, are not vulnerable.

MITIGATION
==========

If you don't have any guests which need linear pagetables, you can
disable the feature by adding pv-linear-pt=false to your Xen
command-line.  NetBSD is known to use linear pagetables; Linux and
MiniOS are known not to use linear pagetables.

CREDITS
=======

This issue was discovered by Manuel Bouyer and diagnosed as a security
issue by Jan Beulich of SUSE.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

xsa309.patch           xen-unstable, Xen 4.13 - Xen 4.8

$ sha256sum xsa309*
ddd00dfbc85bada4e4cee8a51b989e3138cc47c58992657054246bc95c8ae34d  xsa309.meta
0e4b75f4416624de698f3ed619c28418917ab0a5c9663c1641804e1d0a0dec1b  xsa309.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches described above (or others which are
substantially similar) is permitted during the embargo, even on
public-facing systems with untrusted guest users and administrators.

But: Distribution of updated software is prohibited (except to other
members of the predisclosure list).

Deployment of the `pv-linear-pt=false` mitigation is NOT permitted
(except where all the affected systems and VMs are administered and
used only by organisations which are members of the Xen Project
Security Issues Predisclosure List).  Specifically, deployment on
public cloud systems is NOT permitted.

This is because someone may notice the feature going away, and armed
with the knowledge of where the issue is, re-discover it.

Deployment of the mitigation is permitted only AFTER the embargo ends.
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl3w3FwMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZt+QIAL4wU2XUXRQZFk4uS9m4EYV3tlzOidJVcAOvr4pC
x9O0rCRrUTnXvaqDj/X7fqPC4e/uHy4yPgg2gnRqb4y/jXJexPBkY/fsZJ64JdWJ
Fo+0a9CK8IrlzhXFcxVff49kUC3Vv/X2FMa5mY07wfg3ww2qyh9rUiKSFEX4B8vV
6lfMbFZNyOiO2vm1RnQzUCRnUeHnLXmR22BIvwLX6496qoI/ubHDBOK8NX0RU81e
N1wdKlOlfmX1SuXfYzKPcdulmKLHnxiVgxG5FAsaQ5At3luA0+WEn5scoBXG99uB
e6EkbmDpLabceQufMPR7Bvad3uVSzg3qLe/NvW4bd4Fvzb0=
=Td+m
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa309.meta"
Content-Disposition: attachment; filename="xsa309.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzMDksCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xMyIsCiAgICAiNC4xMiIsCiAgICAiNC4xMSIs
CiAgICAiNC4xMCIsCiAgICAiNC45IiwKICAgICI0LjgiCiAgXSwKICAiVHJl
ZXMiOiBbCiAgICAieGVuIgogIF0sCiAgIlJlY2lwZXMiOiB7CiAgICAiNC4x
MCI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAg
ICAgICAgICJTdGFibGVSZWYiOiAiZTQ4OTk1NTBmZjc4MzRlMWVhNWRmYmJm
YjFjNjE4ZjY0ZTI0Nzc2MSIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAg
ICAgICAgICAgMzA3LAogICAgICAgICAgICAzMDgKICAgICAgICAgIF0sCiAg
ICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTMwOS5wYXRj
aCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAi
NC4xMSI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsK
ICAgICAgICAgICJTdGFibGVSZWYiOiAiMjM5ZDM3ZTUxNGM5M2UyOWQ1MGQ3
MWY3MzRiMWRjNDUzYjIyMzZhNiIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsK
ICAgICAgICAgICAgMzA3LAogICAgICAgICAgICAzMDgKICAgICAgICAgIF0s
CiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTMwOS5w
YXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAg
ICAiNC4xMiI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6
IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiMjEyYjg1MDBjYjM5NGIzYTY2
NDY1NWY3OWNhMGJkY2IzMTI0NmZmNyIsCiAgICAgICAgICAiUHJlcmVxcyI6
IFsKICAgICAgICAgICAgMzA3LAogICAgICAgICAgICAzMDgKICAgICAgICAg
IF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTMw
OS5wYXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0s
CiAgICAiNC4xMyI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhl
biI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiZmQ5YmZhYmY2OWVhNTlm
MjI4MGMxNzAzNTAwNzkzZmExNWU4MTk1NiIsCiAgICAgICAgICAiUHJlcmVx
cyI6IFtdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4
c2EzMDkucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAg
ICB9LAogICAgIjQuOCI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAg
InhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiYTI2MGU5M2RiNzk0
ZjU2MDUwMmU4OTg1OWFhZjExMWQxNzhlODBlNCIsCiAgICAgICAgICAiUHJl
cmVxcyI6IFsKICAgICAgICAgICAgMzA3LAogICAgICAgICAgICAzMDgKICAg
ICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAg
InhzYTMwOS5wYXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0K
ICAgIH0sCiAgICAiNC45IjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAg
ICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICI4ZDFlZTlmMmM0
NzNmZWM1NGI1MDE4YzAxYWQ1NTZkN2FmZDYyYzE3IiwKICAgICAgICAgICJQ
cmVyZXFzIjogWwogICAgICAgICAgICAzMDcsCiAgICAgICAgICAgIDMwOAog
ICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAg
ICAieHNhMzA5LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAg
fQogICAgfSwKICAgICJtYXN0ZXIiOiB7CiAgICAgICJSZWNpcGVzIjogewog
ICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogImI3M2Fh
ZDRjOGI2YTc2N2NlMTVjYzhjYjY1ZjllZWFiN2JmY2NkYWUiLAogICAgICAg
ICAgIlByZXJlcXMiOiBbCiAgICAgICAgICAgIDMwNywKICAgICAgICAgICAg
MzA4CiAgICAgICAgICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAg
ICAgICAgICJ4c2EzMDkucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQog
ICAgICB9CiAgICB9CiAgfQp9

--=separator
Content-Type: application/octet-stream; name="xsa309.patch"
Content-Disposition: attachment; filename="xsa309.patch"
Content-Transfer-Encoding: base64

RnJvbSA1MjNlMzk3NGVkMjIxMzcxOWExOTIxOGY1YjI0NmUzODJjZWVmMThh
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBHZW9yZ2UgRHVubGFw
IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CkRhdGU6IFdlZCwgMzAgT2N0
IDIwMTkgMTc6MDU6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSB4ODYvbW06
IERvbid0IHJlc2V0IGxpbmVhcl9wdF9jb3VudCBvbiBwYXJ0aWFsIHZhbGlk
YXRpb24KCiJMaW5lYXIgcGFnZXRhYmxlcyIgaXMgYSB0ZWNobmlxdWUgd2hp
Y2ggaW52b2x2ZXMgZWl0aGVyIHBvaW50aW5nIGEKcGFnZXRhYmxlIGF0IGl0
c2VsZiwgb3IgdG8gYW5vdGhlciBwYWdldGFibGUgdGhlIHNhbWUgb3IgaGln
aGVyIGxldmVsLgpYZW4gaGFzIGxpbWl0ZWQgc3VwcG9ydCBmb3IgbGluZWFy
IHBhZ2V0YWJsZXM6IEEgcGFnZSBtYXkgZWl0aGVyIHBvaW50CnRvIGl0c2Vs
Ziwgb3IgcG9pbnQgdG8gYW5vdGhlciBwYWdlIG9mIHRoZSBzYW1lIGxldmVs
IChpLmUuLCBMMiB0byBMMiwKTDMgdG8gTDMsIGFuZCBzbyBvbikuCgpYU0Et
MjQwIGludHJvZHVjZWQgYW4gYWRkaXRpb25hbCByZXN0cmljdGlvbiB0aGF0
IGxpbWl0ZWQgdGhlICJkZXB0aCIKb2Ygc3VjaCBjaGFpbnMgYnkgYWxsb3dp
bmcgcGFnZXMgdG8gZWl0aGVyICpwb2ludCB0byogb3RoZXIgcGFnZXMgb2YK
dGhlIHNhbWUgbGV2ZWwsIG9yICpiZSBwb2ludGVkIHRvKiBieSBvdGhlciBw
YWdlcyBvZiB0aGUgc2FtZSBsZXZlbCwKYnV0IG5vdCBib3RoLiAgVG8gaW1w
bGVtZW50IHRoaXMsIHdlIGtlZXAgdHJhY2sgb2YgdGhlIG51bWJlciBvZgpv
dXRzdGFuZGluZyB0aW1lcyBhIHBhZ2UgcG9pbnRzIHRvIG9yIGlzIHBvaW50
ZWQgdG8gYW5vdGhlciBwYWdlCnRhYmxlLCB0byBwcmV2ZW50IGJvdGggZnJv
bSBoYXBwZW5pbmcgYXQgdGhlIHNhbWUgdGltZS4KClVuZm9ydHVuYXRlbHks
IHRoZSBvcmlnaW5hbCBjb21taXQgaW50cm9kdWNpbmcgdGhpcyByZXNldCB0
aGlzIGNvdW50CndoZW4gcmVzdW1pbmcgdmFsaWRhdGlvbiBvZiBhIHBhcnRp
YWxseS12YWxpZGF0ZWQgcGFnZXRhYmxlLCBkcm9wcGluZwpzb21lICJsaW5l
YXJfcHRfZW50cnkiIGNvdW50cy4KCk9uIGRlYnVnIGJ1aWxkcyBvbiBzeXN0
ZW1zIHdoZXJlIGd1ZXN0cyB1c2VkIHRoaXMgZmVhdHVyZSwgdGhpcyBtaWdo
dApsZWFkIHRvIGNyYXNoZXMgdGhhdCBsb29rIGxpa2UgdGhpczoKCiAgICBB
c3NlcnRpb24gJ29jID4gMCcgZmFpbGVkIGF0IG1tLmM6ODc0CgpXb3JzZSwg
aWYgYW4gYXR0YWNrZXIgY291bGQgZW5naW5lZXIgc3VjaCBhIHNpdHVhdGlv
biB0byBvY2N1ciwgdGhleQptaWdodCBiZSBhYmxlIHRvIG1ha2UgbG9vcHMg
b3Igb3RoZXIgYWJpdHJhcnkgY2hhaW5zIG9mIGxpbmVhcgpwYWdldGFibGVz
LCBsZWFkaW5nIHRvIHRoZSBkZW5pYWwtb2Ytc2VydmljZSBzaXR1YXRpb24g
b3V0bGluZWQgaW4KWFNBLTI0MC4KClRoaXMgaXMgWFNBLTMwOS4KClJlcG9y
dGVkLWJ5OiBNYW51ZWwgQm91eWVyIDxib3V5ZXJAYW50aW9jaGUuZXUub3Jn
PgpTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21tLmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4
Ni9tbS5jCmluZGV4IDdkNGRkODBhODUuLjAxMzkzZmIwZGEgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5j
CkBAIC0zMDU5LDggKzMwNTksOCBAQCBzdGF0aWMgaW50IF9nZXRfcGFnZV90
eXBlKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UsIHVuc2lnbmVkIGxvbmcgdHlw
ZSwKICAgICAgICAgewogICAgICAgICAgICAgcGFnZS0+bnJfdmFsaWRhdGVk
X3B0ZXMgPSAwOwogICAgICAgICAgICAgcGFnZS0+cGFydGlhbF9mbGFncyA9
IDA7CisgICAgICAgICAgICBwYWdlLT5saW5lYXJfcHRfY291bnQgPSAwOwog
ICAgICAgICB9Ci0gICAgICAgIHBhZ2UtPmxpbmVhcl9wdF9jb3VudCA9IDA7
CiAgICAgICAgIHJjID0gYWxsb2NfcGFnZV90eXBlKHBhZ2UsIHR5cGUsIHBy
ZWVtcHRpYmxlKTsKICAgICB9CiAKLS0gCjIuMjQuMAoK

--=separator
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=separator--

