Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 134931A7A3C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 14:01:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOKFo-0007n1-Vs; Tue, 14 Apr 2020 12:01:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/bN9=56=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1jOKFo-0007mZ-3H
 for xen-devel@lists.xen.org; Tue, 14 Apr 2020 12:01:24 +0000
X-Inumbo-ID: 997cd0da-7e47-11ea-8927-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 997cd0da-7e47-11ea-8927-12813bfff9fa;
 Tue, 14 Apr 2020 12:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aRHmPYnG67uS0Qn4gfeD/shmRqkCxEqOSp7XObEeC28=; b=jrMr+KPRHX8NIRltmsAyItgJSK
 qWlGLhLanN1y/HTP1Hv1D90vUK653NrQxUWbQMUi0TmUw0FTfGSupqxOZaUm2TDQLvHGqqqhOBQTA
 Bw2S4LXTF6MJWhUDejaUoHpfKuPM09JhOgAYs7dc5ZWvQhuPyvr24UX5LpsdBLuwD5k4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1jOKFH-0000Zg-K7; Tue, 14 Apr 2020 12:00:51 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1jOKFH-00075Y-Iw; Tue, 14 Apr 2020 12:00:51 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.508 (Entity 5.508)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
Subject: Xen Security Advisory 318 v3 (CVE-2020-11742) - Bad continuation
 handling in GNTTABOP_copy
Message-Id: <E1jOKFH-00075Y-Iw@xenbits.xenproject.org>
Date: Tue, 14 Apr 2020 12:00:51 +0000
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

            Xen Security Advisory CVE-2020-11742 / XSA-318
                               version 3

              Bad continuation handling in GNTTABOP_copy

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

Grant table operations are expected to return 0 for success, and a
negative number for errors.  The fix for CVE-2017-12135 / XSA-226
introduced a path through grant copy handling where success may be
returned to the caller without any action taken.

In particular the status fields of individual operations are left
uninitialised, and may result in errant behaviour in the caller of
GNTTABOP_copy.

IMPACT
======

A buggy or malicious guest can construct its grant table in such a way
that, when a backend domain tries to copy a grant, it hits the incorrect
exit path.

This returns success to the caller without doing anything, which may
cause in crashes or other incorrect behaviour.

VULNERABLE SYSTEMS
==================

Systems running any version of Xen are vulnerable.

MITIGATION
==========

Only guests with access to transitive grants can exploit the
vulnerability.  In particular, this means that:

 * ARM systems which have taken the XSA-268 fix are not vulnerable, as
   Grant Table v2 was disabled for other security reasons.

 * All systems with the XSA-226 fixes, and booted with
   `gnttab=max-ver:1` or `gnttab=no-transitive` are not vulnerable.

CREDITS
=======

This issue was discovered by Pawel Wieczorkiewicz of Amazon and Jürgen
Groß of SUSE.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa318.patch       Xen 4.9 - xen-unstable

$ sha256sum xsa318*
4618c2609ab08178977c2b2a3d13f380ccfddd0168caca5ced708dd76a8e547c  xsa318.patch
$

NOTE CONCERNING SHORT EMBARGO
=============================

This issue was discovered in response to the XSA-316 predisclosure.

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches described above (or others which are
substantially similar) is permitted during the embargo, even on
public-facing systems with untrusted guest users and administrators.

But: Distribution of updated software is prohibited (except to other
members of the predisclosure list).

Predisclosure list members who wish to deploy significantly different
patches and/or mitigations, please contact the Xen Project Security
Team.

However, deployment of the mitigations is NOT permitted (except where
all the affected systems and VMs are administered and used only by
organisations which are members of the Xen Project Security Issues
Predisclosure List).  Specifically, deployment on public cloud systems
is NOT permitted.

This is because it is a guest visible change which will draw attention
to the issue.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl6Vpd4MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZbC8IAIkpehqymi1+zrWN1OHdvIYIMv2TCzSSx3UtsoMk
J67FpgDzX8ZLfiE0x5FELs3KUdILOe5IkEmM2ssrvQRoIp+X3U4Ybm6eoIB+BzjD
bmJReqNYVY6dlJuAhO2i6L125uBITWdntlK/ZOOQAOd77hR2KueuGELV7KUoPbQa
SAiQ8jsCjqWCacYll6oq1c7jRlc1+RD/5JjkGveHlLmLOnIiS96PkDzqskM8Aniz
TLZ4WmIpfixDAHn3OYyHGoUyhNW3qlps3evDyj3Wela62LFsymDSHkcV8XFBLTGT
pueuSELzne5m85moAB2UqKVhHDV+PRCV7bLHYm/s7yeIHSg=
=hix9
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa318.patch"
Content-Disposition: attachment; filename="xsa318.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBnbnR0YWI6IGZpeCBHTlRUQUJPUF9jb3B5IGNvbnRpbnVhdGlvbiBoYW5k
bGluZwoKVGhlIFhTQS0yMjYgZml4IHdhcyBmbGF3ZWQgLSB0aGUgYmFja3dh
cmRzIHRyYW5zZm9ybWF0aW9uIG9uIHJjIHdhcyBkb25lCnRvbyBlYXJseSwg
Y2F1c2luZyBhIGNvbnRpbnVhdGlvbiB0byBub3QgZ2V0IGludm9rZWQgd2hl
biB0aGUgbmVlZCBmb3IKcHJlZW1wdGlvbiB3YXMgZGV0ZXJtaW5lZCBhdCB0
aGUgdmVyeSBmaXJzdCBpdGVyYXRpb24gb2YgdGhlIHJlcXVlc3QuClRoaXMg
aW4gcGFydGljdWxhciBtZWFucyB0aGF0IGFsbCBvZiB0aGUgc3RhdHVzIGZp
ZWxkcyBvZiB0aGUgaW5kaXZpZHVhbApvcGVyYXRpb25zIHdvdWxkIGJlIGxl
ZnQgdW50b3VjaGVkLCBpLmUuIHNldCB0byB3aGF0ZXZlciB0aGUgY2FsbGVy
IG1heQpvciBtYXkgbm90IGhhdmUgaW5pdGlhbGl6ZWQgdGhlbSB0by4KClRo
aXMgaXMgcGFydCBvZiBYU0EtMzE4LgoKUmVwb3J0ZWQtYnk6IFBhd2VsIFdp
ZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KVGVzdGVkLWJ5OiBQ
YXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+ClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2
aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCi0t
LSBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYworKysgYi94ZW4vY29tbW9u
L2dyYW50X3RhYmxlLmMKQEAgLTM1NzYsOCArMzU3Niw3IEBAIGRvX2dyYW50
X3RhYmxlX29wKAogICAgICAgICByYyA9IGdudHRhYl9jb3B5KGNvcHksIGNv
dW50KTsKICAgICAgICAgaWYgKCByYyA+IDAgKQogICAgICAgICB7Ci0gICAg
ICAgICAgICByYyA9IGNvdW50IC0gcmM7Ci0gICAgICAgICAgICBndWVzdF9o
YW5kbGVfYWRkX29mZnNldChjb3B5LCByYyk7CisgICAgICAgICAgICBndWVz
dF9oYW5kbGVfYWRkX29mZnNldChjb3B5LCBjb3VudCAtIHJjKTsKICAgICAg
ICAgICAgIHVvcCA9IGd1ZXN0X2hhbmRsZV9jYXN0KGNvcHksIHZvaWQpOwog
ICAgICAgICB9CiAgICAgICAgIGJyZWFrOwpAQCAtMzY0NCw2ICszNjQzLDkg
QEAgZG9fZ3JhbnRfdGFibGVfb3AoCiAgIG91dDoKICAgICBpZiAoIHJjID4g
MCB8fCBvcGFxdWVfb3V0ICE9IDAgKQogICAgIHsKKyAgICAgICAgLyogQWRq
dXN0IHJjLCBzZWUgZ250dGFiX2NvcHkoKSBmb3Igd2h5IHRoaXMgaXMgbmVl
ZGVkLiAqLworICAgICAgICBpZiAoIGNtZCA9PSBHTlRUQUJPUF9jb3B5ICkK
KyAgICAgICAgICAgIHJjID0gY291bnQgLSByYzsKICAgICAgICAgQVNTRVJU
KHJjIDwgY291bnQpOwogICAgICAgICBBU1NFUlQoKG9wYXF1ZV9vdXQgJiBH
TlRUQUJPUF9DTURfTUFTSykgPT0gMCk7CiAgICAgICAgIHJjID0gaHlwZXJj
YWxsX2NyZWF0ZV9jb250aW51YXRpb24oX19IWVBFUlZJU09SX2dyYW50X3Rh
YmxlX29wLCAiaWhpIiwK

--=separator--

