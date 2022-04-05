Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9ED4F2E96
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 14:01:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298778.509128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbhrf-0007ms-DG; Tue, 05 Apr 2022 12:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298778.509128; Tue, 05 Apr 2022 12:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbhrf-0007hZ-60; Tue, 05 Apr 2022 12:00:51 +0000
Received: by outflank-mailman (input) for mailman id 298778;
 Tue, 05 Apr 2022 12:00:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c4fh=UP=xenbits.xen.org=julieng@srs-se1.protection.inumbo.net>)
 id 1nbhrc-0006zD-SG
 for xen-devel@lists.xen.org; Tue, 05 Apr 2022 12:00:48 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 052222c9-b4d8-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 14:00:45 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1nbhrJ-00089f-9D; Tue, 05 Apr 2022 12:00:29 +0000
Received: from julieng by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1nbhrJ-0003ND-7u; Tue, 05 Apr 2022 12:00:29 +0000
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
X-Inumbo-ID: 052222c9-b4d8-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=uAa4rt+WlrdIm7/s7V4hHRZWj/juwIshO15Nn5O7OWY=; b=1tM9nLL9+P4paAyk2PLIOjeHPv
	pcgVik8axwq3MfUtphe4MyFkd3vBGjkrAeZR/Gzrz729lXhJcQjo3Lk5wD8Atjt2sgNjlj0e2LbMW
	eIVv9XJ9PwPzcUYFxsh4YJ12HG+YnjCXvF3Pj8DkHU1qq+3eIRivrzSXhhCetaqix9c0=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 399 v2 (CVE-2022-26357) - race in VT-d
 domain ID cleanup
Message-Id: <E1nbhrJ-0003ND-7u@xenbits.xenproject.org>
Date: Tue, 05 Apr 2022 12:00:29 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2022-26357 / XSA-399
                               version 2

                    race in VT-d domain ID cleanup

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

Xen domain IDs are up to 15 bits wide.  VT-d hardware may allow for only
less than 15 bits to hold a domain ID associating a physical device with
a particular domain.  Therefore internally Xen domain IDs are mapped to
the smaller value range.  The cleaning up of the housekeeping structures
has a race, allowing for VT-d domain IDs to be leaked and flushes to be
bypassed.

IMPACT
======

The precise impact is system specific, but would typically be a Denial
of Service (DoS) affecting the entire host.  Privilege escalation and
information leaks cannot be ruled out.

VULNERABLE SYSTEMS
==================

Xen versions 4.11 through 4.16 are vulnerable.  Xen versions 4.10 and
earlier are not vulnerable.

Only x86 systems with VT-d IOMMU hardware are vulnerable.  Arm systems
as well as x86 systems without VT-d hardware or without any IOMMUs in
use are not vulnerable.

Only x86 guests which have physical devices passed through to them can
leverage the vulnerability.

MITIGATION
==========

Not passing through physical devices to untrusted guests will avoid
the vulnerability.

CREDITS
=======

This issue was discovered by Jan Beulich of SUSE.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa399.patch           xen-unstable
xsa399-4.16.patch      Xen 4.16.x - Xen 4.13.x
xsa399-4.12.patch      Xen 4.12.x

$ sha256sum xsa399*
53b9745564eb21f70dbb7bd7194ff3518f29cd9715c68e9dd7eff25812968019  xsa399.patch
16c3327a60d8ab6c3524f10f57d63efaf2e3e54b807bc285a749cd1a94392a30  xsa399-4.12.patch
79d0f5a0442dec0a806d77a722a1d2c04793572fe0b564bf86dcd1c6d992a679  xsa399-4.16.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches described above (or others which are
substantially similar) is permitted during the embargo, even on
public-facing systems with untrusted guest users and administrators.

HOWEVER, deployment of the mitigation is NOT permitted (except where
all the affected systems and VMs are administered and used only by
organisations which are members of the Xen Project Security Issues
Predisclosure List).  Specifically, deployment on public cloud systems
is NOT permitted.

This is because removal of pass-through devices or their replacement by
emulated devices is a guest visible configuration change, which may lead
to re-discovery of the issue.

Deployment of this mitigation is permitted only AFTER the embargo ends.

AND: Distribution of updated software is prohibited (except to other
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmJMJDcMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZpo8H/AqiAS0l5WJWl00bTQ4Q69REzd83m9Y3+UnUqRaf
JUFWo4R1m4V2zJlq0E3TR/2ZS1RkXFJxlmXQyzueFmDEvMV2oKB0ids5ta1oUO2E
eiQxdSFbTLrLnhI+4IxbTHHy+ovSHT/SKPeo1Zd1tXHfZ35g1OgGTYHHqj7RKJHp
SyZT4iuAKjIr61M4NBKJcycpfRidlXEDvAotDX3jBQ06t3vgs/12nwe5LzzeV2V4
sIDjpeDGNKzgT2NgLP2b+XMEUg1259iWb19tS3PPNJaLKSvQqTBOFjK+sqh7ACXV
v6ph2Yy0Q/ZP+N9DvCeBCPEU9A9RhmPYzobU+Lc/T85SrQ4=
=sp/Q
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa399.patch"
Content-Disposition: attachment; filename="xsa399.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBWVC1kOiBjb3JyZWN0IG9yZGVyaW5nIG9mIG9wZXJhdGlvbnMgaW4gY2xl
YW51cF9kb21pZF9tYXAoKQoKVGhlIGZ1bmN0aW9uIG1heSBiZSBjYWxsZWQg
d2l0aG91dCBhbnkgbG9ja3MgaGVsZCAobGVhdmluZyBhc2lkZSB0aGUKZG9t
Y3RsIG9uZSwgd2hpY2ggd2Ugc3VyZWx5IGRvbid0IHdhbnQgdG8gZGVwZW5k
IG9uIGhlcmUpLCBzbyBuZWVkcyB0bwpwbGF5IHNhZmUgd3J0IG90aGVyIGFj
Y2Vzc2VzIHRvIGRvbWlkX21hcFtdIGFuZCBkb21pZF9iaXRtYXBbXS4gVGhp
cyBpcwp0byBhdm9pZCBjb250ZXh0X3NldF9kb21haW5faWQoKSdzIHdyaXRp
bmcgb2YgZG9taWRfbWFwW10gdG8gYmUgcmVzZXQgdG8KemVybyByaWdodCBh
d2F5IGluIHRoZSBjYXNlIG9mIGl0IHJhY2luZyB0aGUgZnJlZWluZyBvZiBh
IERJRC4KCkZvciB0aGUgaW50ZXJhY3Rpb24gd2l0aCBjb250ZXh0X3NldF9k
b21haW5faWQoKSBhbmQgZGlkX3RvX2RvbWFpbl9pZCgpCnNlZSB0aGUgY29k
ZSBjb21tZW50LgoKe2NoZWNrXyx9Y2xlYW51cF9kb21pZF9tYXAoKSBhcmUg
Y2FsbGVkIHdpdGggcGNpZGV2c19sb2NrIGhlbGQgb3IgZHVyaW5nCmRvbWFp
biBjbGVhbnVwIG9ubHkgKGFuZCBwY2lkZXZzX2xvY2sgaXMgYWxzbyBoZWxk
IGFyb3VuZApjb250ZXh0X3NldF9kb21haW5faWQoKSksIGkuZS4gcmFjaW5n
IGNhbGxzIHdpdGggdGhlIHNhbWUgKGRvbSwgaW9tbXUpCnR1cGxlIGNhbm5v
dCBvY2N1ci4KCmRvbWFpbl9pb21tdV9kb21pZCgpLCBiZXNpZGVzIGl0cyB1
c2UgYnkgY2xlYW51cF9kb21pZF9tYXAoKSwgaGFzIGl0cwpyZXN1bHQgdXNl
ZCBvbmx5IHRvIGNvbnRyb2wgZmx1c2hpbmcsIGFuZCBoZW5jZSBhIHN0YWxl
IHJlc3VsdCB3b3VsZApvbmx5IGxlYWQgdG8gYSBzdHJheSBleHRyYSBmbHVz
aC4KClRoaXMgaXMgQ1ZFLTIwMjItMjYzNTcgLyBYU0EtMzk5LgoKRml4ZXM6
IGI5YzIwYzc4Nzg5ZiAoIlZULWQ6IHBlci1pb21tdSBkb21haW4taWQiKQpT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
ClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9p
b21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21t
dS5jCkBAIC0xNzUsOCArMTc1LDE0IEBAIHN0YXRpYyB2b2lkIGNsZWFudXBf
ZG9taWRfbWFwKHN0cnVjdCBkb20KIAogICAgIGlmICggaW9tbXVfZG9taWQg
Pj0gMCApCiAgICAgeworICAgICAgICAvKgorICAgICAgICAgKiBVcGRhdGUg
ZG9taWRfbWFwW10gL2JlZm9yZS8gZG9taWRfYml0bWFwW10gdG8gYXZvaWQg
YSByYWNlIHdpdGgKKyAgICAgICAgICogY29udGV4dF9zZXRfZG9tYWluX2lk
KCksIHNldHRpbmcgdGhlIHNsb3QgdG8gRE9NSURfSU5WQUxJRCBmb3IKKyAg
ICAgICAgICogZGlkX3RvX2RvbWFpbl9pZCgpIHRvIHJldHVybiBhIHN1aXRh
YmxlIHZhbHVlIHdoaWxlIHRoZSBiaXQgaXMKKyAgICAgICAgICogc3RpbGwg
c2V0LgorICAgICAgICAgKi8KKyAgICAgICAgaW9tbXUtPmRvbWlkX21hcFtp
b21tdV9kb21pZF0gPSBET01JRF9JTlZBTElEOwogICAgICAgICBjbGVhcl9i
aXQoaW9tbXVfZG9taWQsIGlvbW11LT5kb21pZF9iaXRtYXApOwotICAgICAg
ICBpb21tdS0+ZG9taWRfbWFwW2lvbW11X2RvbWlkXSA9IDA7CiAgICAgfQog
fQogCg==

--=separator
Content-Type: application/octet-stream; name="xsa399-4.12.patch"
Content-Disposition: attachment; filename="xsa399-4.12.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBWVC1kOiBjb3JyZWN0IG9yZGVyaW5nIG9mIG9wZXJhdGlvbnMgaW4gY2xl
YW51cF9kb21pZF9tYXAoKQoKVGhlIGZ1bmN0aW9uIG1heSBiZSBjYWxsZWQg
d2l0aG91dCBhbnkgbG9ja3MgaGVsZCAobGVhdmluZyBhc2lkZSB0aGUKZG9t
Y3RsIG9uZSwgd2hpY2ggd2Ugc3VyZWx5IGRvbid0IHdhbnQgdG8gZGVwZW5k
IG9uIGhlcmUpLCBzbyBuZWVkcyB0bwpwbGF5IHNhZmUgd3J0IG90aGVyIGFj
Y2Vzc2VzIHRvIGRvbWlkX21hcFtdIGFuZCBkb21pZF9iaXRtYXBbXS4gVGhp
cyBpcwp0byBhdm9pZCBjb250ZXh0X3NldF9kb21haW5faWQoKSdzIHdyaXRp
bmcgb2YgZG9taWRfbWFwW10gdG8gYmUgcmVzZXQgdG8KemVybyByaWdodCBh
d2F5IGluIHRoZSBjYXNlIG9mIGl0IHJhY2luZyB0aGUgZnJlZWluZyBvZiBh
IERJRC4KCkZvciB0aGUgaW50ZXJhY3Rpb24gd2l0aCBjb250ZXh0X3NldF9k
b21haW5faWQoKSBhbmQgLT5kb21pZF9tYXBbXSByZWFkcwpzZWUgdGhlIGNv
ZGUgY29tbWVudC4KCntjaGVja18sfWNsZWFudXBfZG9taWRfbWFwKCkgYXJl
IGNhbGxlZCB3aXRoIHBjaWRldnNfbG9jayBoZWxkIG9yIGR1cmluZwpkb21h
aW4gY2xlYW51cCBvbmx5IChhbmQgcGNpZGV2c19sb2NrIGlzIGFsc28gaGVs
ZCBhcm91bmQKY29udGV4dF9zZXRfZG9tYWluX2lkKCkpLCBpLmUuIHJhY2lu
ZyBjYWxscyB3aXRoIHRoZSBzYW1lIChkb20sIGlvbW11KQp0dXBsZSBjYW5u
b3Qgb2NjdXIuCgpkb21haW5faW9tbXVfZG9taWQoKSwgYmVzaWRlcyBpdHMg
dXNlIGJ5IGNsZWFudXBfZG9taWRfbWFwKCksIGhhcyBpdHMKcmVzdWx0IHVz
ZWQgb25seSB0byBjb250cm9sIGZsdXNoaW5nLCBhbmQgaGVuY2UgYSBzdGFs
ZSByZXN1bHQgd291bGQKb25seSBsZWFkIHRvIGEgc3RyYXkgZXh0cmEgZmx1
c2guCgpUaGlzIGlzIENWRS0yMDIyLTI2MzU3IC8gWFNBLTM5OS4KCkZpeGVz
OiBiOWMyMGM3ODc4OWYgKCJWVC1kOiBwZXItaW9tbXUgZG9tYWluLWlkIikK
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+CgotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQv
aW9tbXUuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9t
bXUuYwpAQCAtMTc3MCw4ICsxNzcwLDE0IEBAIHN0YXRpYyBpbnQgZG9tYWlu
X2NvbnRleHRfdW5tYXAoc3RydWN0IGQKICAgICAgICAgICAgIGdvdG8gb3V0
OwogICAgICAgICB9CiAKKyAgICAgICAgLyoKKyAgICAgICAgICogVXBkYXRl
IGRvbWlkX21hcFtdIC9iZWZvcmUvIGRvbWlkX2JpdG1hcFtdIHRvIGF2b2lk
IGEgcmFjZSB3aXRoCisgICAgICAgICAqIGNvbnRleHRfc2V0X2RvbWFpbl9p
ZCgpLCBzZXR0aW5nIHRoZSBzbG90IHRvIERPTUlEX0lOVkFMSUQgZm9yCisg
ICAgICAgICAqIC0+ZG9taWRfbWFwW10gcmVhZHMgdG8gcHJvZHVjZSBhIHN1
aXRhYmxlIHZhbHVlIHdoaWxlIHRoZSBiaXQgaXMKKyAgICAgICAgICogc3Rp
bGwgc2V0LgorICAgICAgICAgKi8KKyAgICAgICAgaW9tbXUtPmRvbWlkX21h
cFtpb21tdV9kb21pZF0gPSBET01JRF9JTlZBTElEOwogICAgICAgICBjbGVh
cl9iaXQoaW9tbXVfZG9taWQsIGlvbW11LT5kb21pZF9iaXRtYXApOwotICAg
ICAgICBpb21tdS0+ZG9taWRfbWFwW2lvbW11X2RvbWlkXSA9IDA7CiAgICAg
fQogCiBvdXQ6Cg==

--=separator
Content-Type: application/octet-stream; name="xsa399-4.16.patch"
Content-Disposition: attachment; filename="xsa399-4.16.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBWVC1kOiBjb3JyZWN0IG9yZGVyaW5nIG9mIG9wZXJhdGlvbnMgaW4gY2xl
YW51cF9kb21pZF9tYXAoKQoKVGhlIGZ1bmN0aW9uIG1heSBiZSBjYWxsZWQg
d2l0aG91dCBhbnkgbG9ja3MgaGVsZCAobGVhdmluZyBhc2lkZSB0aGUKZG9t
Y3RsIG9uZSwgd2hpY2ggd2Ugc3VyZWx5IGRvbid0IHdhbnQgdG8gZGVwZW5k
IG9uIGhlcmUpLCBzbyBuZWVkcyB0bwpwbGF5IHNhZmUgd3J0IG90aGVyIGFj
Y2Vzc2VzIHRvIGRvbWlkX21hcFtdIGFuZCBkb21pZF9iaXRtYXBbXS4gVGhp
cyBpcwp0byBhdm9pZCBjb250ZXh0X3NldF9kb21haW5faWQoKSdzIHdyaXRp
bmcgb2YgZG9taWRfbWFwW10gdG8gYmUgcmVzZXQgdG8KemVybyByaWdodCBh
d2F5IGluIHRoZSBjYXNlIG9mIGl0IHJhY2luZyB0aGUgZnJlZWluZyBvZiBh
IERJRC4KCkZvciB0aGUgaW50ZXJhY3Rpb24gd2l0aCBjb250ZXh0X3NldF9k
b21haW5faWQoKSBhbmQgLT5kb21pZF9tYXBbXSByZWFkcwpzZWUgdGhlIGNv
ZGUgY29tbWVudC4KCntjaGVja18sfWNsZWFudXBfZG9taWRfbWFwKCkgYXJl
IGNhbGxlZCB3aXRoIHBjaWRldnNfbG9jayBoZWxkIG9yIGR1cmluZwpkb21h
aW4gY2xlYW51cCBvbmx5IChhbmQgcGNpZGV2c19sb2NrIGlzIGFsc28gaGVs
ZCBhcm91bmQKY29udGV4dF9zZXRfZG9tYWluX2lkKCkpLCBpLmUuIHJhY2lu
ZyBjYWxscyB3aXRoIHRoZSBzYW1lIChkb20sIGlvbW11KQp0dXBsZSBjYW5u
b3Qgb2NjdXIuCgpkb21haW5faW9tbXVfZG9taWQoKSwgYmVzaWRlcyBpdHMg
dXNlIGJ5IGNsZWFudXBfZG9taWRfbWFwKCksIGhhcyBpdHMKcmVzdWx0IHVz
ZWQgb25seSB0byBjb250cm9sIGZsdXNoaW5nLCBhbmQgaGVuY2UgYSBzdGFs
ZSByZXN1bHQgd291bGQKb25seSBsZWFkIHRvIGEgc3RyYXkgZXh0cmEgZmx1
c2guCgpUaGlzIGlzIENWRS0yMDIyLTI2MzU3IC8gWFNBLTM5OS4KCkZpeGVz
OiBiOWMyMGM3ODc4OWYgKCJWVC1kOiBwZXItaW9tbXUgZG9tYWluLWlkIikK
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+CgotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQv
aW9tbXUuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9t
bXUuYwpAQCAtMTUyLDggKzE1MiwxNCBAQCBzdGF0aWMgdm9pZCBjbGVhbnVw
X2RvbWlkX21hcChzdHJ1Y3QgZG9tCiAKICAgICBpZiAoIGlvbW11X2RvbWlk
ID49IDAgKQogICAgIHsKKyAgICAgICAgLyoKKyAgICAgICAgICogVXBkYXRl
IGRvbWlkX21hcFtdIC9iZWZvcmUvIGRvbWlkX2JpdG1hcFtdIHRvIGF2b2lk
IGEgcmFjZSB3aXRoCisgICAgICAgICAqIGNvbnRleHRfc2V0X2RvbWFpbl9p
ZCgpLCBzZXR0aW5nIHRoZSBzbG90IHRvIERPTUlEX0lOVkFMSUQgZm9yCisg
ICAgICAgICAqIC0+ZG9taWRfbWFwW10gcmVhZHMgdG8gcHJvZHVjZSBhIHN1
aXRhYmxlIHZhbHVlIHdoaWxlIHRoZSBiaXQgaXMKKyAgICAgICAgICogc3Rp
bGwgc2V0LgorICAgICAgICAgKi8KKyAgICAgICAgaW9tbXUtPmRvbWlkX21h
cFtpb21tdV9kb21pZF0gPSBET01JRF9JTlZBTElEOwogICAgICAgICBjbGVh
cl9iaXQoaW9tbXVfZG9taWQsIGlvbW11LT5kb21pZF9iaXRtYXApOwotICAg
ICAgICBpb21tdS0+ZG9taWRfbWFwW2lvbW11X2RvbWlkXSA9IDA7CiAgICAg
fQogfQogCg==

--=separator--

