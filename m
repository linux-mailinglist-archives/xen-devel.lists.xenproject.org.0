Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CED6E4991
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 13:14:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNxV7-0002Cy-Ku; Fri, 25 Oct 2019 11:11:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PbB1=YS=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1iNxV5-0002A2-7q
 for xen-devel@lists.xen.org; Fri, 25 Oct 2019 11:11:23 +0000
X-Inumbo-ID: 1667b16c-f718-11e9-bbab-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1667b16c-f718-11e9-bbab-bc764e2007e4;
 Fri, 25 Oct 2019 11:10:44 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1iNxUM-0001Wi-Hm; Fri, 25 Oct 2019 11:10:38 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1iNxUM-0002l3-Ex; Fri, 25 Oct 2019 11:10:38 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.508 (Entity 5.508)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
Message-Id: <E1iNxUM-0002l3-Ex@xenbits.xenproject.org>
Date: Fri, 25 Oct 2019 11:10:38 +0000
Subject: [Xen-devel] Xen Security Advisory 292 v3 (CVE-2019-17346) - x86:
 insufficient TLB flushing when using PCID
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

            Xen Security Advisory CVE-2019-17346 / XSA-292
                              version 3

            x86: insufficient TLB flushing when using PCID

UPDATES IN VERSION 3
====================

CVE assigned.

ISSUE DESCRIPTION
=================

Use of Process Context Identifiers (PCID) was introduced into Xen in
order to improve performance after XSA-254 (and in particular its
Meltdown sub-issue).  This enablement implied changes to the TLB
flushing logic.  The particular case of context switch to a vCPU of a
PCID-enabled guest left open a time window between the full TLB flush,
and the actual address space switch, during which additional TLB
entries (from the address space about to be switched away from) can be
accumulated, which will not subsequently be purged.

IMPACT
======

Malicious PV guests may be able to cause a host crash (Denial of
Service) or to gain access to data pertaining to other guests.
Privilege escalation opportunities cannot be ruled out.

Additionally, vulnerable configurations are likely to be unstable even
in the absence of an attack.

VULNERABLE SYSTEMS
==================

Only x86 systems are vulnerable.  ARM systems are not vulnerable.

Only systems running x86 PV guests are vulnerable.  Systems running
only x86 HVM or PVH guests are not vulnerable.

Only systems with at least one PCID-enabled PV guest are vulnerable.

Systems where PCID or INVPCID are unavailable or entirely disabled are
not vulnerable.

Note that PCID is enabled by default for both 64-bit dom0 and 64-bit
domU when hardware supports it.  PCID acceleration has been backported
to the following versions:
 - Xen 4.11.x,
 - Xen 4.10.2 and onwards,
 - Xen 4.9.3 and onwards,
 - Xen 4.8.4 and onwards,
 - Xen 4.7.6.

To exploit this vulnerability, problematic TLB entries must be created
between the full TLB flush and the address space switch.  The NMI
watchdog handler (enabled via the "watchdog" command line option) is
known to create such entries; other vectors cannot be ruled out.

MITIGATION
==========

Running only HVM or PVH guests will avoid this vulnerability.

Running only 32-bit PV guests alongside the other two types mentioned
above will also avoid this vulnerability, provided Dom0 is also 32-bit
or is not using PCID.  Making a 64-bit Dom0 not use PCID can be achieved
by e.g. "xpti=no-dom0 pcid=xpti".

Disabling use of PCID entirely, by passing "pcid=0" or "invpcid=0" as a
command line option to the hypervisor, will also avoid this
vulnerability (albeit re-introducing the XPTI performance regression
use of PCID was intended to reduce).

Disabling the watchdog timer will remove the only known way of reliably
creating problematic TLB entries, potentially reducing the risk of a
successful attack.

CREDITS
=======

This issue was discovered by Sergey Dyasli and Andrew Cooper of Citrix.

RESOLUTION
==========

Applying the attached patch resolves this issue.

xsa292.patch           xen-unstable, Xen 4.11.x ... Xen 4.7.6

$ sha256sum xsa292*
c515e98e5ae8a16bc5c894741eea5523a7e568f81ee8a570626dcc0f58f40b40  xsa292.meta
f42cb5e1eae5a5c6f0fd84e38df4db9f09a4e1176905c37f292fef9855c82fea  xsa292.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl2y1+cMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZV48H/i1Wi6DV90quHvewv0j792crdJojnHgq/8V3+hfT
lXWcmfW5IQLi02o4aG7XjUYwRTQ6clRgF4AZDZyrAY15QyVCz9diusvWOUzaq7Pd
hrvuIMeaB3+ba2OY7bB3P0sCekhhj6MwqKEhGVlbLEB8A0vGq9XjZBuTmws6QA2J
6Il8fxEVupdtETsf3KlYfxvJOubN/B+tByaIpdWU0C2M66EVa4pcijSLcvoylGxi
YS7jJrSMcqg4Sx/e/HnzCJ7jrvzhxSDHeyhPy1/NrwlQz2NQjd+FoFownsH48LuH
6LA6GGTIk5v+a/GtNVpb8Wwfg0UleabF+8S30C6QasUO70E=
=Pk5K
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa292.meta"
Content-Disposition: attachment; filename="xsa292.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAyOTIsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xMSIsCiAgICAiNC4xMCIsCiAgICAiNC45IiwK
ICAgICI0LjgiLAogICAgIjQuNyIKICBdLAogICJUcmVlcyI6IFsKICAgICJ4
ZW4iCiAgXSwKICAiUmVjaXBlcyI6IHsKICAgICI0LjEwIjogewogICAgICAi
UmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJs
ZVJlZiI6ICJhMDE2YjhmMjA3YzdhM2ZlOGJkZDJiNmY3YzA4MDAyMGUzZTFj
ODIzIiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAyODQs
CiAgICAgICAgICAgIDI4NSwKICAgICAgICAgICAgMjg3LAogICAgICAgICAg
ICAyODgsCiAgICAgICAgICAgIDI5MCwKICAgICAgICAgICAgMjkxCiAgICAg
ICAgICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4
c2EyOTIucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAg
ICB9LAogICAgIjQuMTEiOiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAg
ICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogIjg3ZjUxYmYzNjZj
YTc5Yjk4ZTFlMjAxYmY5YmQ3YTljMTY0NjMxZTIiLAogICAgICAgICAgIlBy
ZXJlcXMiOiBbCiAgICAgICAgICAgIDI4NCwKICAgICAgICAgICAgMjg1LAog
ICAgICAgICAgICAyODcsCiAgICAgICAgICAgIDI4OCwKICAgICAgICAgICAg
MjkwLAogICAgICAgICAgICAyOTEKICAgICAgICAgIF0sCiAgICAgICAgICAi
UGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTI5Mi5wYXRjaCIKICAgICAg
ICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC43Ijogewog
ICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAg
IlN0YWJsZVJlZiI6ICI3MTBjYzA5Njk3MTAxOWJjMmU1YTlhYWJiOWFmMWFj
Y2EwYjViOWU3IiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAg
ICAyODQsCiAgICAgICAgICAgIDI4NSwKICAgICAgICAgICAgMjg3LAogICAg
ICAgICAgICAyODgsCiAgICAgICAgICAgIDI5MAogICAgICAgICAgXSwKICAg
ICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMjkyLnBhdGNo
IgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICI0
LjgiOiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAg
ICAgICAgICAiU3RhYmxlUmVmIjogIjkwOGU3NjhmYWU0OWE4ZGIwMDg5ZTY4
MTg4NjUyMDc5ZTNiZmFhNjYiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAg
ICAgICAgICAgIDI4NCwKICAgICAgICAgICAgMjg1LAogICAgICAgICAgICAy
ODcsCiAgICAgICAgICAgIDI4OCwKICAgICAgICAgICAgMjkwLAogICAgICAg
ICAgICAyOTEKICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsK
ICAgICAgICAgICAgInhzYTI5Mi5wYXRjaCIKICAgICAgICAgIF0KICAgICAg
ICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC45IjogewogICAgICAiUmVjaXBl
cyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6
ICJmNWFjZjk3ZjY2OWM2YmM5NjkxZTAzNzcxYWQwNjcwM2RhNzdlMGQ1IiwK
ICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAyODQsCiAgICAg
ICAgICAgIDI4NSwKICAgICAgICAgICAgMjg3LAogICAgICAgICAgICAyODgs
CiAgICAgICAgICAgIDI5MCwKICAgICAgICAgICAgMjkxCiAgICAgICAgICBd
LAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EyOTIu
cGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAog
ICAgIm1hc3RlciI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhl
biI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiMjRkNTI4MjUyN2Y0NjQ3
OTA3YjM1NzI4MjBiNTMzNWMxNWNkMDM1NiIsCiAgICAgICAgICAiUHJlcmVx
cyI6IFsKICAgICAgICAgICAgMjg0LAogICAgICAgICAgICAyODUsCiAgICAg
ICAgICAgIDI4NywKICAgICAgICAgICAgMjg4LAogICAgICAgICAgICAyOTAs
CiAgICAgICAgICAgIDI5MQogICAgICAgICAgXSwKICAgICAgICAgICJQYXRj
aGVzIjogWwogICAgICAgICAgICAieHNhMjkyLnBhdGNoIgogICAgICAgICAg
XQogICAgICAgIH0KICAgICAgfQogICAgfQogIH0KfQ==

--=separator
Content-Type: application/octet-stream; name="xsa292.patch"
Content-Disposition: attachment; filename="xsa292.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODYvbW06IHByb3Blcmx5IGZsdXNoIFRMQiBpbiBzd2l0Y2hfY3IzX2Ny
NCgpCgpUaGUgQ1IzIHZhbHVlcyB1c2VkIGZvciBjb250ZXh0cyBydW4gd2l0
aCBQQ0lEIGVuYWJsZWQgdW5pZm9ybWx5IGhhdmUKQ1IzLk5PRkxVU0ggc2V0
LCByZXN1bHRpbmcgaW4gdGhlIENSMyB3cml0ZSBpdHNlbGYgdG8gbm90IGNh
dXNlIGFueQpmbHVzaGluZyBhdCBhbGwuIFdoZW4gdGhlIHNlY29uZCBDUjQg
d3JpdGUgaXMgc2tpcHBlZCBvciBkb2Vzbid0IGRvIGFueQpmbHVzaGluZywg
dGhlcmUncyBub3RoaW5nIHNvIGZhciB3aGljaCB3b3VsZCBwdXJnZSBUTEIg
ZW50cmllcyB3aGljaCBtYXkKaGF2ZSBhY2N1bXVsYXRlZCBhZ2FpbiBpZiB0
aGUgUENJRCBkb2Vzbid0IGNoYW5nZTsgdGhlICJqdXN0IGluIGNhc2UiCmZs
dXNoIG9ubHkgYWZmZWN0cyB0aGUgY2FzZSB3aGVyZSB0aGUgUENJRCBhY3R1
YWxseSBjaGFuZ2VzLiAoVGhlcmUgbWF5CmJlIHBhcnRpY3VsYXJseSBtYW55
IFRMQiBlbnRyaWVzIHJlLWFjY3VtdWxhdGVkIGluIGNhc2Ugb2YgYSB3YXRj
aGRvZwpOTUkga2lja2luZyBpbiBkdXJpbmcgdGhlIGNyaXRpY2FsIHRpbWUg
d2luZG93LikKClN1cHByZXNzIHRoZSBuby1mbHVzaCBiZWhhdmlvciBvZiB0
aGUgQ1IzIHdyaXRlIGluIHRoaXMgcGFydGljdWxhciBjYXNlLgoKU2ltaWxh
cmx5IHRoZSBzZWNvbmQgQ1I0IHdyaXRlIG1heSBub3QgY2F1c2UgYW55IGZs
dXNoaW5nIG9mIFRMQiBlbnRyaWVzCmVzdGFibGlzaGVkIGFnYWluIHdoaWxl
IHRoZSBvcmlnaW5hbCBQQ0lEIHdhcyBzdGlsbCBpbiB1c2UgLSBpdCBtYXkg
Z2V0CnBlcmZvcm1lZCBiZWNhdXNlIG9mIHVucmVsYXRlZCBiaXRzIGNoYW5n
aW5nLiBUaGUgZmx1c2ggb2YgdGhlIG9sZCBQQ0lECm5lZWRzIHRvIGhhcHBl
biBuZXZlcnRoZWxlc3MuCgpBdCB0aGUgc2FtZSB0aW1lIGFsc28gZWxpbWlu
YXRlIGEgcG9zc2libGUgcmFjZSB3aXRoIGxhenkgY29udGV4dApzd2l0Y2g6
IEp1c3QgbGlrZSBmb3IgQ1I0LCBDUjMgbWF5IGNoYW5nZSBhdCBhbnkgdGlt
ZSB3aGlsZSBpbnRlcnJ1cHRzCmFyZSBlbmFibGVkLCBkdWUgdG8gdGhlIF9f
c3luY19sb2NhbF9leGVjc3RhdGUoKSBpbnZvY2F0aW9uIGZyb20gdGhlCmZs
dXNoIElQSSBoYW5kbGVyLiBJdCBpcyBmb3IgdGhhdCByZWFzb24gdGhhdCB0
aGUgQ1IzIHJlYWQsIGp1c3QgbGlrZQp0aGUgQ1I0IG9uZSwgbXVzdCBoYXBw
ZW4gb25seSBhZnRlciBpbnRlcnJ1cHRzIGhhdmUgYmVlbiB0dXJuZWQgb2Zm
LgoKVGhpcyBpcyBYU0EtMjkyLgoKUmVwb3J0ZWQtYnk6IFNlcmdleSBEeWFz
bGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KUmVwb3J0ZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClRlc3Rl
ZC1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29t
PgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+ClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgotLS0KdjM6IEFkanVzdCBjb21tZW50cy4gRHJvcCBv
bGRfY3I0IGZyb20gdGhlIFBHRSBjaGVjayBpbiB0aGUgZXhwcmVzc2lvbgog
ICAgY29udHJvbGxpbmcgdGhlIGludm9jYXRpb24gb2YgaW52cGNpZF9mbHVz
aF9zaW5nbGVfY29udGV4dCgpLCBhcyBQR0UKICAgIGlzIGFsd2F5cyBjbGVh
ciB0aGVyZS4KdjI6IERlY291cGxlIGludnBjaWRfZmx1c2hfc2luZ2xlX2Nv
bnRleHQoKSBmcm9tIDJuZCBDUjQgd3JpdGUuCgotLS0gYS94ZW4vYXJjaC94
ODYvZmx1c2h0bGIuYworKysgYi94ZW4vYXJjaC94ODYvZmx1c2h0bGIuYwpA
QCAtMTAzLDkgKzEwMyw4IEBAIHN0YXRpYyB2b2lkIGRvX3RsYl9mbHVzaCh2
b2lkKQogCiB2b2lkIHN3aXRjaF9jcjNfY3I0KHVuc2lnbmVkIGxvbmcgY3Iz
LCB1bnNpZ25lZCBsb25nIGNyNCkKIHsKLSAgICB1bnNpZ25lZCBsb25nIGZs
YWdzLCBvbGRfY3I0OworICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsIG9sZF9j
cjQsIG9sZF9wY2lkOwogICAgIHUzMiB0OwotICAgIHVuc2lnbmVkIGxvbmcg
b2xkX3BjaWQgPSBjcjNfcGNpZChyZWFkX2NyMygpKTsKIAogICAgIC8qIFRo
aXMgbm9uLXJlZW50cmFudCBmdW5jdGlvbiBpcyBzb21ldGltZXMgY2FsbGVk
IGluIGludGVycnVwdCBjb250ZXh0LiAqLwogICAgIGxvY2FsX2lycV9zYXZl
KGZsYWdzKTsKQEAgLTEzMywxNSArMTMyLDM4IEBAIHZvaWQgc3dpdGNoX2Ny
M19jcjQodW5zaWduZWQgbG9uZyBjcjMsIHUKICAgICAgICAgICovCiAgICAg
ICAgIGludnBjaWRfZmx1c2hfYWxsX25vbmdsb2JhbHMoKTsKIAorICAgIC8q
CisgICAgICogSWYgd2UgZG9uJ3QgY2hhbmdlIFBDSURzLCB0aGUgQ1IzIHdy
aXRlIGJlbG93IG5lZWRzIHRvIGZsdXNoIHRoaXMgdmVyeQorICAgICAqIFBD
SUQsIGV2ZW4gd2hlbiBhIGZ1bGwgZmx1c2ggd2FzIHBlcmZvcm1lZCBhYm92
ZSwgYXMgd2UgYXJlIGN1cnJlbnRseQorICAgICAqIGFjY3VtdWxhdGluZyBU
TEIgZW50cmllcyBhZ2FpbiBmcm9tIHRoZSBvbGQgYWRkcmVzcyBzcGFjZS4K
KyAgICAgKiBOQjogQ2xlYXJpbmcgdGhlIGJpdCB3aGVuIHdlIGRvbid0IHVz
ZSBQQ0lEIGlzIGJlbmlnbiAoYXMgaXQgaXMgY2xlYXIKKyAgICAgKiBhbHJl
YWR5IGluIHRoYXQgY2FzZSksIGJ1dCBhbGxvd3MgdGhlIGlmKCkgdG8gYmUg
bW9yZSBzaW1wbGUuCisgICAgICovCisgICAgb2xkX3BjaWQgPSBjcjNfcGNp
ZChyZWFkX2NyMygpKTsKKyAgICBpZiAoIG9sZF9wY2lkID09IGNyM19wY2lk
KGNyMykgKQorICAgICAgICBjcjMgJj0gflg4Nl9DUjNfTk9GTFVTSDsKKwog
ICAgIHdyaXRlX2NyMyhjcjMpOwogCiAgICAgaWYgKCBvbGRfY3I0ICE9IGNy
NCApCiAgICAgICAgIHdyaXRlX2NyNChjcjQpOwotICAgIGVsc2UgaWYgKCBv
bGRfcGNpZCAhPSBjcjNfcGNpZChjcjMpICkKLSAgICAgICAgLyoKLSAgICAg
ICAgICogTWFrZSBzdXJlIG5vIFRMQiBlbnRyaWVzIHJlbGF0ZWQgdG8gdGhl
IG9sZCBQQ0lEIGNyZWF0ZWQgYmV0d2VlbgotICAgICAgICAgKiBmbHVzaGlu
ZyB0aGUgVExCIGFuZCB3cml0aW5nIHRoZSBuZXcgJWNyMyB2YWx1ZSByZW1h
aW4gaW4gdGhlIFRMQi4KLSAgICAgICAgICovCisKKyAgICAvKgorICAgICAq
IE1ha2Ugc3VyZSBubyBUTEIgZW50cmllcyByZWxhdGVkIHRvIHRoZSBvbGQg
UENJRCBjcmVhdGVkIGJldHdlZW4KKyAgICAgKiBmbHVzaGluZyB0aGUgVExC
IGFuZCB3cml0aW5nIHRoZSBuZXcgJWNyMyB2YWx1ZSByZW1haW4gaW4gdGhl
IFRMQi4KKyAgICAgKgorICAgICAqIFRoZSB3cml0ZSB0byBDUjQganVzdCBh
Ym92ZSBoYXMgcGVyZm9ybWVkIGEgd2lkZXIgZmx1c2ggaW4gY2VydGFpbgor
ICAgICAqIGNhc2VzLCB3aGljaCB0aGVyZWZvcmUgZ2V0IGV4Y2x1ZGVkIGhl
cmUuIFNpbmNlIHRoYXQgd3JpdGUgaXMKKyAgICAgKiBjb25kaXRpb25hbCwg
bm90ZSBpbiBwYXJ0aWN1bGFyIHRoYXQgaXQgd29uJ3QgYmUgc2tpcHBlZCBp
ZiBQQ0lERQorICAgICAqIHRyYW5zaXRpb25zIGZyb20gMSB0byAwLiBUaGlz
IGlzIGJlY2F1c2UgdGhlIENSNCB3cml0ZSBmdXJ0aGVyIHVwIHdpbGwKKyAg
ICAgKiBoYXZlIGJlZW4gc2tpcHBlZCBpbiB0aGlzIGNhc2UsIGFzIFBDSURF
IGFuZCBQR0Ugd29uJ3QgYm90aCBiZSBzZXQgYXQKKyAgICAgKiB0aGUgc2Ft
ZSB0aW1lLgorICAgICAqCisgICAgICogTm90ZSBhbHNvIHRoYXQgUEdFIGlz
IGFsd2F5cyBjbGVhciBpbiBvbGRfY3I0LgorICAgICAqLworICAgIGlmICgg
b2xkX3BjaWQgIT0gY3IzX3BjaWQoY3IzKSAmJgorICAgICAgICAgIShjcjQg
JiBYODZfQ1I0X1BHRSkgJiYKKyAgICAgICAgIChvbGRfY3I0ICYgWDg2X0NS
NF9QQ0lERSkgPD0gKGNyNCAmIFg4Nl9DUjRfUENJREUpICkKICAgICAgICAg
aW52cGNpZF9mbHVzaF9zaW5nbGVfY29udGV4dChvbGRfcGNpZCk7CiAKICAg
ICBwb3N0X2ZsdXNoKHQpOwo=

--=separator
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=separator--

