Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E11992DAD42
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 13:31:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.53421.93171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp9TU-0002KL-B7; Tue, 15 Dec 2020 12:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 53421.93171; Tue, 15 Dec 2020 12:30:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp9TU-0002Jb-3g; Tue, 15 Dec 2020 12:30:40 +0000
Received: by outflank-mailman (input) for mailman id 53421;
 Tue, 15 Dec 2020 12:30:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tdgx=FT=xenbits.xen.org=gdunlap@srs-us1.protection.inumbo.net>)
 id 1kp9LA-0004tM-4b
 for xen-devel@lists.xen.org; Tue, 15 Dec 2020 12:22:04 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e67aa02f-9b8c-4dd9-a4d0-60106c7525b1;
 Tue, 15 Dec 2020 12:20:31 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gdunlap@xenbits.xen.org>)
 id 1kp9Jb-0005kJ-Cm; Tue, 15 Dec 2020 12:20:27 +0000
Received: from gdunlap by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <gdunlap@xenbits.xen.org>)
 id 1kp9Jb-0007Au-Bq; Tue, 15 Dec 2020 12:20:27 +0000
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
X-Inumbo-ID: e67aa02f-9b8c-4dd9-a4d0-60106c7525b1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=LY96pn3vSH/hD6YioZ1DWoLiSBci+jA7YDmltUbIXqE=; b=TYAyDH+o2yI6kX9ThFdwxQc+jU
	vlKEqaIzAzIqYJo1VGh2hUOgS/ja/oSEx0cocBeR4k+AWSONaEggQhvNqCnz5bELmIHn5xV5GX005
	xsW4embEE4tSzhg6mzRqQuR7LeAPtrmSN+NIT941L1u+x2nvnHMPENMYH1eFG60uODM4=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 356 v3 (CVE-2020-29567) - infinite loop
 when cleaning up IRQ vectors
Message-Id: <E1kp9Jb-0007Au-Bq@xenbits.xenproject.org>
Date: Tue, 15 Dec 2020 12:20:27 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2020-29567 / XSA-356
                               version 3

              infinite loop when cleaning up IRQ vectors

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

When moving IRQs between CPUs to distribute the load of IRQ handling,
IRQ vectors are dynamically allocated and de-allocated on the relevant
CPUs.  De-allocation has to happen when certain constraints are met.
If these conditions are not met when first checked, the checking CPU
may send an interrupt to itself, in the expectation that this IRQ will
be delivered only after the condition preventing the cleanup has
cleared.  For two specific IRQ vectors this expectation was violated,
resulting in a continuous stream of self-interrupts, which renders the
CPU effectively unusable.

IMPACT
======

A domain with a passed through PCI device can cause lockup of a
physical CPU, resulting in a Denial of Service (DoS) to the entire
host.

VULNERABLE SYSTEMS
==================

Only Xen 4.14 is affected.  Xen versions 4.13 and older are not
affected.

Only x86 systems are vulnerable.  Arm systems are not vulnerable.

Only guests with physical PCI devices passed through to them can exploit
the vulnerability.

MITIGATION
==========

There is no known mitigation.

CREDITS
=======

This issue was discovered by Roger Pau Monné of Citrix.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa356.patch           xen-unstable - Xen 4.14.x

$ sha256sum xsa356*
77316e3b86e2482ee9741db7484d323a399028762af1c88734f8c83e78069fb3  xsa356.meta
21c217e41549bf74d5fcc26f1d23b6d902c5c72de5e2c8490842aea9f999b036  xsa356.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl/YqeAMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZv4cIAIdqAn7O/TicwVod/L1Lktuk94g73LQlhRxMFnQ2
CoFrIBJtvyFq0m0OqRcVav3hb8wa7EdbmbJXgvoC4emKUcIcUkMA/dyvUi9SKdGP
5iQDL0Vsasq7rQN5vjuUA6KIDp4qyT87mxNLUwMzwrXDORFHT9YZO/SZLY37WU7S
UX0qaDh9FpwtdB4nDULqNimAZcy1yonXkD8bb6jDmHIeTx33cfe4BNvYqApwTPD8
fxctAlsYHLuwfnEBdQ+cadfcjF/PqkRcsGtMk6hGRn2hEscEfHWMH9I/R9lZvyj5
CjfFKzb2WpDu3KUuJJJBTavkZ97Bs+flVNGLrQ/AgKoitQs=
=vDoA
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa356.meta"
Content-Disposition: attachment; filename="xsa356.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzNTYsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNCIKICBdLAogICJUcmVlcyI6IFsKICAgICJ4
ZW4iCiAgXSwKICAiUmVjaXBlcyI6IHsKICAgICI0LjE0IjogewogICAgICAi
UmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJs
ZVJlZiI6ICIxZDFkMWY1MzkxOTc2NDU2YTc5ZGFhYzBkY2ZlNzE1N2RhMWU1
NGY3IiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAzNTMs
CiAgICAgICAgICAgIDExNSwKICAgICAgICAgICAgMzIyLAogICAgICAgICAg
ICAzMjMsCiAgICAgICAgICAgIDMyNCwKICAgICAgICAgICAgMzI1LAogICAg
ICAgICAgICAzMzAsCiAgICAgICAgICAgIDM1MiwKICAgICAgICAgICAgMzQ4
CiAgICAgICAgICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAg
ICAgICJ4c2EzNTYucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAg
ICB9CiAgICB9LAogICAgIm1hc3RlciI6IHsKICAgICAgIlJlY2lwZXMiOiB7
CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiM2Fl
NDY5YWY4ZTY4MGRmMzFlZWNkMGEyYWM2YTgzYjU4YWQ3Y2U1MyIsCiAgICAg
ICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAgICAgMzUzLAogICAgICAgICAg
ICAxMTUsCiAgICAgICAgICAgIDMyMiwKICAgICAgICAgICAgMzIzLAogICAg
ICAgICAgICAzMjQsCiAgICAgICAgICAgIDMyNSwKICAgICAgICAgICAgMzMw
LAogICAgICAgICAgICAzNTIsCiAgICAgICAgICAgIDM0OAogICAgICAgICAg
XSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMzU2
LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfQog
IH0KfQ==

--=separator
Content-Type: application/octet-stream; name="xsa356.patch"
Content-Disposition: attachment; filename="xsa356.patch"
Content-Transfer-Encoding: base64

RnJvbTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
ClN1YmplY3Q6IHg4Ni9pcnE6IGZpeCBpbmZpbml0ZSBsb29wIGluIGlycV9t
b3ZlX2NsZWFudXBfaW50ZXJydXB0CgpJZiBYZW4gZW50ZXJzIGlycV9tb3Zl
X2NsZWFudXBfaW50ZXJydXB0IHdpdGggYSBkeW5hbWljIHZlY3RvciBiZWxv
dwpJUlFfTU9WRV9DTEVBTlVQX1ZFQ1RPUiBwZW5kaW5nIGluIElSUiAoMHgy
MCBvciAweDIxKSB0aGF0J3MgYWxzbwpkZXNpZ25hdGVkIGZvciBhIGNsZWFu
dXAgaXQgd2lsbCBlbnRlciBhIGxvb3Agd2hlcmUKaXJxX21vdmVfY2xlYW51
cF9pbnRlcnJ1cHQgY29udGludW91c2x5IHNlbmRzIGEgY2xlYW51cCBJUEkg
KHZlY3RvcgoweDIyKSB0byBpdHNlbGYgd2hpbGUgd2FpdGluZyBmb3IgdGhl
IHZlY3RvciB3aXRoIGxvd2VyIHByaW9yaXR5IHRvIGJlCmluamVjdGVkIC0g
d2hpY2ggd2lsbCBuZXZlciBoYXBwZW4gYmVjYXVzZSBJUlFfTU9WRV9DTEVB
TlVQX1ZFQ1RPUgp0YWtlcyBwcmVjZWRlbmNlIGFuZCBpdCdzIGFsd2F5cyBp
bmplY3RlZCBmaXJzdC4KCkZpeCB0aGlzIGJ5IG1ha2luZyBzdXJlIHZlY3Rv
cnMgYmVsb3cgSVJRX01PVkVfQ0xFQU5VUF9WRUNUT1IgYXJlCm1hcmtlZCBh
cyB1c2VkIGFuZCB0aHVzIG5vdCBhdmFpbGFibGUgZm9yIEFQcy4gQWxzbyBh
ZGQgc29tZSBsb2dpYyB0bwphc3NlcnQgYW5kIHByZXZlbnQgaXJxX21vdmVf
Y2xlYW51cF9pbnRlcnJ1cHQgZnJvbSBlbnRlcmluZyBzdWNoIGFuCmluZmlu
aXRlIGxvb3AsIGFsYmVpdCB0aGF0IHNob3VsZCBuZXZlciBoYXBwZW4gZ2l2
ZW4gdGhlIGN1cnJlbnQgY29kZS4KClRoaXMgaXMgWFNBLTM1NiAvIENWRS0y
MDIwLTI5NTY3LgoKRml4ZXM6IDNmYmEwNmJhOWY4ICgneDg2L0lSUTogcmUt
dXNlIGxlZ2FjeSB2ZWN0b3IgcmFuZ2VzIG9uIEFQcycpClNpZ25lZC1vZmYt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpS
ZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoK
LS0tIGEveGVuL2FyY2gveDg2L2lycS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9p
cnEuYwpAQCAtNDQxLDggKzQ0MSwxNSBAQCBpbnQgX19pbml0IGluaXRfaXJx
X2RhdGEodm9pZCkKICAgICBzZXRfYml0KEhZUEVSQ0FMTF9WRUNUT1IsIHVz
ZWRfdmVjdG9ycyk7CiAjZW5kaWYKICAgICAKLSAgICAvKiBJUlFfTU9WRV9D
TEVBTlVQX1ZFQ1RPUiB1c2VkIGZvciBjbGVhbiB1cCB2ZWN0b3JzICovCi0g
ICAgc2V0X2JpdChJUlFfTU9WRV9DTEVBTlVQX1ZFQ1RPUiwgdXNlZF92ZWN0
b3JzKTsKKyAgICAvKgorICAgICAqIE1hcmsgdmVjdG9ycyB1cCB0byB0aGUg
Y2xlYW51cCBvbmUgYXMgdXNlZCwgdG8gcHJldmVudCBhbiBpbmZpbml0ZSBs
b29wCisgICAgICogaW52b2tpbmcgaXJxX21vdmVfY2xlYW51cF9pbnRlcnJ1
cHQuCisgICAgICovCisgICAgQlVJTERfQlVHX09OKElSUV9NT1ZFX0NMRUFO
VVBfVkVDVE9SIDwgRklSU1RfRFlOQU1JQ19WRUNUT1IpOworICAgIGZvciAo
IHZlY3RvciA9IEZJUlNUX0RZTkFNSUNfVkVDVE9SOworICAgICAgICAgIHZl
Y3RvciA8PSBJUlFfTU9WRV9DTEVBTlVQX1ZFQ1RPUjsKKyAgICAgICAgICB2
ZWN0b3IrKyApCisgICAgICAgIF9fc2V0X2JpdCh2ZWN0b3IsIHVzZWRfdmVj
dG9ycyk7CiAKICAgICByZXR1cm4gMDsKIH0KQEAgLTcyNywxMCArNzM0LDYg
QEAgdm9pZCBpcnFfbW92ZV9jbGVhbnVwX2ludGVycnVwdChzdHJ1Y3QgY3B1
X3VzZXJfcmVncyAqcmVncykKIHsKICAgICB1bnNpZ25lZCB2ZWN0b3IsIG1l
OwogCi0gICAgLyogVGhpcyBpbnRlcnJ1cHQgc2hvdWxkIG5vdCBuZXN0IGlu
c2lkZSBvdGhlcnMuICovCi0gICAgQlVJTERfQlVHX09OKEFQSUNfUFJJT19D
TEFTUyhJUlFfTU9WRV9DTEVBTlVQX1ZFQ1RPUikgIT0KLSAgICAgICAgICAg
ICAgICAgQVBJQ19QUklPX0NMQVNTKEZJUlNUX0RZTkFNSUNfVkVDVE9SKSk7
Ci0KICAgICBhY2tfQVBJQ19pcnEoKTsKIAogICAgIG1lID0gc21wX3Byb2Nl
c3Nvcl9pZCgpOwpAQCAtNzc0LDYgKzc3NywxMSBAQCB2b2lkIGlycV9tb3Zl
X2NsZWFudXBfaW50ZXJydXB0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdz
KQogICAgICAgICAgKi8KICAgICAgICAgaWYgKCBpcnIgJiAoMXUgPDwgKHZl
Y3RvciAlIDMyKSkgKQogICAgICAgICB7CisgICAgICAgICAgICBpZiAoIHZl
Y3RvciA8IElSUV9NT1ZFX0NMRUFOVVBfVkVDVE9SICkKKyAgICAgICAgICAg
IHsKKyAgICAgICAgICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKKyAg
ICAgICAgICAgICAgICBnb3RvIHVubG9jazsKKyAgICAgICAgICAgIH0KICAg
ICAgICAgICAgIHNlbmRfSVBJX3NlbGYoSVJRX01PVkVfQ0xFQU5VUF9WRUNU
T1IpOwogICAgICAgICAgICAgVFJBQ0VfM0QoVFJDX0hXX0lSUV9NT1ZFX0NM
RUFOVVBfREVMQVksCiAgICAgICAgICAgICAgICAgICAgICBpcnEsIHZlY3Rv
ciwgc21wX3Byb2Nlc3Nvcl9pZCgpKTsK

--=separator--

