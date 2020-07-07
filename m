Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88146216CAC
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 14:19:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsmYl-0005Tn-MC; Tue, 07 Jul 2020 12:18:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1g3R=AS=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1jsmYk-0005Sp-9n
 for xen-devel@lists.xen.org; Tue, 07 Jul 2020 12:18:50 +0000
X-Inumbo-ID: fd2469cc-c04b-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd2469cc-c04b-11ea-bca7-bc764e2007e4;
 Tue, 07 Jul 2020 12:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mFmAfu+l9Qnx7Y9fQVSM/XKGmQ57MHrxuyQCgm25OCQ=; b=qFrRGnrO5DPb5kurUU6le/eUUD
 CRXilbVw+GyIW2LF4yoHF83eJv2Lo6OS1FSAteKRby6ngUBfP4WTQTQXEktq/crTkHrQadF43OC/W
 jnoB7/SzpRDfk438u0t5y97zmw9NIc8cVs3vSjL3cKLFhTa2gwzhQ1Z/cOKGfBuF064Q=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1jsmYT-0002mn-TH; Tue, 07 Jul 2020 12:18:33 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1jsmYT-0000Wl-Q7; Tue, 07 Jul 2020 12:18:33 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
Subject: Xen Security Advisory 317 v3 (CVE-2020-15566) - Incorrect error
 handling in event channel port allocation
Message-Id: <E1jsmYT-0000Wl-Q7@xenbits.xenproject.org>
Date: Tue, 07 Jul 2020 12:18:33 +0000
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
Cc: "Xen.org security team" <security-team-members@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2020-15566 / XSA-317
                               version 3

       Incorrect error handling in event channel port allocation

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

The allocation of an event channel port may fail for multiple reasons:
    1) Port is already in use
    2) The memory allocation failed
    3) The port we try to allocate is higher than what is supported by
       the ABI (e.g 2L or FIFO) used by the guest or the limit set by an
       administrator ('max_event_channels' in xl cfg).

Due to the missing error checks, only 1) will be considered as an error.  All
the other cases will provide a "valid" port and will result to a crash when
trying to access the event channel.

IMPACT
======

When the administrator configured a guest to allow more than 1023
event channels, that guest may be able to crash the host.

When Xen is out-of-memory, allocation of new event channels will
result in crashing the host rather than reporting an error.

VULNERABLE SYSTEMS
==================

Xen versions 4.10 and later are affected.  (The special Xen 4.8
"Comet" branch for XSA-254 contains changes similar to those which led
to this vulnerability; so it is likely to be affected, but - like
mainline Xen 4.8 - that branch is longer security-supported.)

Older Xen versions are unaffected.

All architectures are affected.

The default configuration, when guests are created with xl/libxl, is
not vulnerable, because of the default event channel limit (see
Mitigation, below).

MITIGATION
==========

The problem can be avoided by reducing the number of event channels
available to the guest no more than 1023.  For example, setting
"max_event_channels=1023" in the xl domain configuration, or deleting
any existing setting (since 1023 is the default for xl/libxl).

For ARM systems, any limit no more than 4095 is safe.

For 64-bit x86 PV guests, any limit no more than 4095 is likewise safe
if the host configuration prevents the guest administrator from
substituting and running a 32-bit kernel (and thereby putting the
guest into 32-bit PV mode).

CREDITS
=======

This issue was discovered by Amazon.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa317.patch           Xen 4.10 - xen-unstable

$ sha256sum xsa317*
11e77dd8644cee40cee609d02e27d70655f3999005cae8c24fb2801980ebb4f2  xsa317.meta
17908035e2da07f6070fa8de345db68c96ed9bd78f8b114e43ba0194c1be3f15  xsa317.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl8EZ/gMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZQUwIAK8W8bZ0xml2bzAu4vsXi8QqhDX4VrpkgADYZS+M
BD8hpllQ+O/CiM5ZMECj7zaWYTt7+VrGrqK4jtf2REBs/sOWcO+k7KdEury4XCKf
jIG4CzCBHC46RVEKftiqQNTX2ebVBDwoj+1fGeIvm7OhcZ7f6KdhYPHvE2bU8D45
ghr2jw33HZHoG7IsPQvJn8u6wqd6l+7h0BxhgzO5U8pI+w3ZXRM4XAno+ERzs8LO
N5ffv8UeaMIpkHoYEdsKOK/ItjhoCASoWTFvbE90u7f2WbimFnBG3oCPEVPt89kv
Y/o0+0jBk+WjXbPChMmMu5WuQuKVFDelMXLLE6mjfhGAvnI=
=vEgE
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa317.meta"
Content-Disposition: attachment; filename="xsa317.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzMTcsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xMyIsCiAgICAiNC4xMiIsCiAgICAiNC4xMSIs
CiAgICAiNC4xMCIKICBdLAogICJUcmVlcyI6IFsKICAgICJ4ZW4iCiAgXSwK
ICAiUmVjaXBlcyI6IHsKICAgICI0LjEwIjogewogICAgICAiUmVjaXBlcyI6
IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICJm
ZDZlNDllY2FlMDM4NDA2MTBmZGM2YTQxNmE2Mzg1OTBjMGI2NTM1IiwKICAg
ICAgICAgICJQcmVyZXFzIjogW10sCiAgICAgICAgICAiUGF0Y2hlcyI6IFtd
CiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQuMTEiOiB7CiAgICAg
ICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3Rh
YmxlUmVmIjogIjJiNzc3Mjk4ODhmYjg1MWFiOTZlN2Y3N2JjODU0MTIyNjI2
YjQ4NjEiLAogICAgICAgICAgIlByZXJlcXMiOiBbXSwKICAgICAgICAgICJQ
YXRjaGVzIjogW10KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC4x
MiI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAg
ICAgICAgICJTdGFibGVSZWYiOiAiMDUwZmU0OGRjOTgxZTA0ODhkZTFmNmM2
YzA3ZDgxMTBmM2I3NTIzYiIsCiAgICAgICAgICAiUHJlcmVxcyI6IFtdLAog
ICAgICAgICAgIlBhdGNoZXMiOiBbXQogICAgICAgIH0KICAgICAgfQogICAg
fSwKICAgICI0LjEzIjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAi
eGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICI5ZjdlOGJhYzRjYTI3
OWIzYmZjY2I1ZjM3MzBmYjJlNTM5OGM5NWFiIiwKICAgICAgICAgICJQcmVy
ZXFzIjogW10sCiAgICAgICAgICAiUGF0Y2hlcyI6IFtdCiAgICAgICAgfQog
ICAgICB9CiAgICB9LAogICAgIjQuOSI6IHsKICAgICAgIlJlY2lwZXMiOiB7
CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiNmU0
NzdjMmVhNGQ1YzI2YTdhN2IyZjg1MDE2NmFhNzllZGM1MjI1YyIsCiAgICAg
ICAgICAiUHJlcmVxcyI6IFtdLAogICAgICAgICAgIlBhdGNoZXMiOiBbXQog
ICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICJtYXN0ZXIiOiB7CiAgICAg
ICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3Rh
YmxlUmVmIjogImU0ZDIyMDcxNjViMzc5ZWMxM2M4YjUxMjkzNmY2Mzk4MmFm
NjJkMTMiLAogICAgICAgICAgIlByZXJlcXMiOiBbXSwKICAgICAgICAgICJQ
YXRjaGVzIjogW10KICAgICAgICB9CiAgICAgIH0KICAgIH0KICB9Cn0K

--=separator
Content-Type: application/octet-stream; name="xsa317.patch"
Content-Disposition: attachment; filename="xsa317.patch"
Content-Transfer-Encoding: base64

RnJvbSBhZWI0NmU5MmY5MTVmMTlhNjFkNWE4YTFmNGI2OTY3OTNmNjRlNmZi
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWxpZW4gR3JhbGwg
PGpncmFsbEBhbWF6b24uY29tPgpEYXRlOiBUaHUsIDE5IE1hciAyMDIwIDEz
OjE3OjMxICswMDAwClN1YmplY3Q6IFtQQVRDSF0geGVuL2NvbW1vbjogZXZl
bnRfY2hhbm5lbDogRG9uJ3QgaWdub3JlIGVycm9yIGluCiBnZXRfZnJlZV9w
b3J0KCkKCkN1cnJlbnRseSwgZ2V0X2ZyZWVfcG9ydCgpIGlzIGFzc3VtaW5n
IHRoYXQgdGhlIHBvcnQgaGFzIGJlZW4gYWxsb2NhdGVkCndoZW4gZXZ0Y2hu
X2FsbG9jYXRlX3BvcnQoKSBpcyBub3QgcmV0dXJuIC1FQlVTWS4KCkhvd2V2
ZXIsIHRoZSBmdW5jdGlvbiBtYXkgcmV0dXJuIGFuIGVycm9yIHdoZW46CiAg
ICAtIFdlIGV4aGF1c3RlZCBhbGwgdGhlIGV2ZW50IGNoYW5uZWxzLiBUaGlz
IGNhbiBoYXBwZW4gaWYgdGhlIGxpbWl0CiAgICBjb25maWd1cmVkIGJ5IHRo
ZSBhZG1pbmlzdHJhdG9yIGZvciB0aGUgZ3Vlc3QgKCdtYXhfZXZlbnRfY2hh
bm5lbHMnCiAgICBpbiB4bCBjZmcpIGlzIGhpZ2hlciB0aGFuIHRoZSBBQkkg
dXNlZCBieSB0aGUgZ3Vlc3QuIEZvciBpbnN0YW5jZSwKICAgIGlmIHRoZSBn
dWVzdCBpcyB1c2luZyAyTCwgdGhlIGxpbWl0IHNob3VsZCBub3QgYmUgaGln
aGVyIHRoYW4gNDA5NS4KICAgIC0gV2UgY2Fubm90IGFsbG9jYXRlIG1lbW9y
eSAoZS5nIFhlbiBoYXMgbm90IG1vcmUgbWVtb3J5KS4KClVzZXJzIG9mIGdl
dF9mcmVlX3BvcnQoKSAoc3VjaCBhcyBFVlRDSE5PUF9hbGxvY191bmJvdW5k
KSB3aWxsIHZhbGlkbHkKYXNzdW1pbmcgdGhlIHBvcnQgd2FzIHZhbGlkIGFu
ZCB3aWxsIG5leHQgY2FsbCBldnRjaG5fZnJvbV9wb3J0KCkuIFRoaXMKd2ls
bCByZXN1bHQgdG8gYSBjcmFzaCBhcyB0aGUgbWVtb3J5IGJhY2tpbmcgdGhl
IGV2ZW50IGNoYW5uZWwgc3RydWN0dXJlCmlzIG5vdCBwcmVzZW50LgoKRml4
ZXM6IDM2OGFlOWEwNWZlICgieGVuL3B2c2hpbTogZm9yd2FyZCBldnRjaG4g
b3BzIGJldHdlZW4gTDAgWGVuIGFuZCBMMiBEb21VIikKU2lnbmVkLW9mZi1i
eTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KUmV2aWV3ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCiB4ZW4v
Y29tbW9uL2V2ZW50X2NoYW5uZWwuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2NvbW1vbi9ldmVudF9jaGFubmVsLmMgYi94ZW4vY29t
bW9uL2V2ZW50X2NoYW5uZWwuYwppbmRleCBlODZlMmJmYWIwLi5hOGQxODJi
NTg0IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2V2ZW50X2NoYW5uZWwuYwor
KysgYi94ZW4vY29tbW9uL2V2ZW50X2NoYW5uZWwuYwpAQCAtMTk1LDEwICsx
OTUsMTAgQEAgc3RhdGljIGludCBnZXRfZnJlZV9wb3J0KHN0cnVjdCBkb21h
aW4gKmQpCiAgICAgewogICAgICAgICBpbnQgcmMgPSBldnRjaG5fYWxsb2Nh
dGVfcG9ydChkLCBwb3J0KTsKIAotICAgICAgICBpZiAoIHJjID09IC1FQlVT
WSApCi0gICAgICAgICAgICBjb250aW51ZTsKLQotICAgICAgICByZXR1cm4g
cG9ydDsKKyAgICAgICAgaWYgKCByYyA9PSAwICkKKyAgICAgICAgICAgIHJl
dHVybiBwb3J0OworICAgICAgICBlbHNlIGlmICggcmMgIT0gLUVCVVNZICkK
KyAgICAgICAgICAgIHJldHVybiByYzsKICAgICB9CiAKICAgICByZXR1cm4g
LUVOT1NQQzsKLS0gCjIuMTcuMQoK

--=separator--

