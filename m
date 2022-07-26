Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9E4581A42
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 21:25:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375711.608200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGQAV-0006Nc-6D; Tue, 26 Jul 2022 19:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375711.608200; Tue, 26 Jul 2022 19:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGQAV-0006Gv-20; Tue, 26 Jul 2022 19:24:35 +0000
Received: by outflank-mailman (input) for mailman id 375711;
 Tue, 26 Jul 2022 19:24:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kw/h=X7=xenbits.xen.org=julieng@srs-se1.protection.inumbo.net>)
 id 1oGQAT-0006Ce-8C
 for xen-devel@lists.xen.org; Tue, 26 Jul 2022 19:24:33 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90de2a88-0d18-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 21:24:31 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1oGQAC-0008C5-HI; Tue, 26 Jul 2022 19:24:16 +0000
Received: from julieng by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1oGQAC-0002wB-Fy; Tue, 26 Jul 2022 19:24:16 +0000
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
X-Inumbo-ID: 90de2a88-0d18-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=NKD2gL2NTr6m9WCIt6RoJNR++SWs8pJVg7FANzTK5Ag=; b=gVFgv/Msh3fcXBjUlzEP9lbRSS
	OeJeZ8gDwjyQYlASqiZjYuzlAESrobslthLViPB5fb61H1nAEkOuNmORlhcGCLaFS89SPyd6Bejw6
	boirKfmQ/RHNs9TPcrkjhuWaoEc4jxqs6szqgbntW3+Dms7mp76qa5sHvC2xcfE2LiKk=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 408 v3 (CVE-2022-33745) - insufficient TLB
 flush for x86 PV guests in shadow mode
Message-Id: <E1oGQAC-0002wB-Fy@xenbits.xenproject.org>
Date: Tue, 26 Jul 2022 19:24:16 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2022-33745 / XSA-408
                               version 3

        insufficient TLB flush for x86 PV guests in shadow mode

UPDATES IN VERSION 3
====================

Update hash for metadata file.

ISSUE DESCRIPTION
=================

For migration as well as to work around kernels unaware of L1TF (see
XSA-273), PV guests may be run in shadow paging mode.  To address
XSA-401, code was moved inside a function in Xen.  This code movement
missed a variable changing meaning / value between old and new code
positions.  The now wrong use of the variable did lead to a wrong TLB
flush condition, omitting flushes where such are necessary.

IMPACT
======

The known (observed) impact would be a Denial of Service (DoS) affecting
the entire host, due to running out of memory.  Privilege escalation and
information leaks cannot be ruled out.

VULNERABLE SYSTEMS
==================

All versions of Xen with the XSA-401 fixes applied are vulnerable.

Only x86 PV guests can trigger this vulnerability, and only when running
in shadow mode.  Shadow mode would be in use when migrating guests or as
a workaround for XSA-273 (L1TF).

MITIGATION
==========

Not running x86 PV guests will avoid the vulnerability.

CREDITS
=======

This issue was discovered by Charles Arnold of SUSE.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa408.patch           xen-unstable - Xen 4.14.x
xsa408-4.13.patch      Xen 4.13.x

$ sha256sum xsa408*
9411b563c71445d2c95e36aba9d71fa3b9341f0230e4b3e2549a63292df11669  xsa408.meta
f49cb67842c7576f1d59b965331956a9fa1f529a8e2da3531d7ebc4eb3f079b3  xsa408.patch
26871efbd3f834dd4af4fbab6f2cb09a83c509e49894f025ee656071419ed995  xsa408-4.13.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmLgPzsMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZT5cIAKtisZZvdcSolZ+RHFzAdVEP2lbEW2TyoG6oy0st
kMsV/ZSabthow9PiUp48DoZOXSIh/7hn2qyXqx5X0VYjiWOISVRCldm5g4p0+tA/
GN6FztbRR1GargLkvtuWj38K9E7HIqfBRFLbtJD6X97NFSAPeNNZg8nqQPqwkhK+
yeGBjPPO5pTjNwsRt91A1qEttTPjbBpipEcit/qjqqCBxX6NT/pYSE5Ltn2OHm38
eYM25X901rJl0rPsyOeUN312FAL0bEunKVKJbiNcHVBZoR37YoJ5HE5trDxoxPrz
XYJdR7gzcB028lbGU4jt9FVHdYCh0htWpdpdWci4A3DCH7U=
=C02g
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa408.meta"
Content-Disposition: attachment; filename="xsa408.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiA0MDgsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNiIsCiAgICAiNC4xNSIsCiAgICAiNC4xNCIs
CiAgICAiNC4xMyIKICBdLAogICJUcmVlcyI6IFsKICAgICJ4ZW4iCiAgXSwK
ICAiUmVjaXBlcyI6IHsKICAgICI0LjEzIjogewogICAgICAiUmVjaXBlcyI6
IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICJm
ODYxNGM3MTUzZjk1ZGNkMWExMzIwMTU2Nzg3ZGJjNTMyNWZkOTQ2IiwKICAg
ICAgICAgICJQcmVyZXFzIjogW10sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsK
ICAgICAgICAgICAgInhzYTQwOC00LjEzLnBhdGNoIgogICAgICAgICAgXQog
ICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICI0LjE0IjogewogICAgICAi
UmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJs
ZVJlZiI6ICI4N2Q5MGQ1MTFjODc0Nzc2MDljYzRiOGM4ODg2NmJmYmU5OTdk
YTQ2IiwKICAgICAgICAgICJQcmVyZXFzIjogW10sCiAgICAgICAgICAiUGF0
Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTQwOC5wYXRjaCIKICAgICAgICAg
IF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC4xNSI6IHsKICAg
ICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJT
dGFibGVSZWYiOiAiMzViZjkxZDMwZjFhNDgwZGNmNWJmZDk5Yjc5Mzg0YjJi
MjgzZGE3ZiIsCiAgICAgICAgICAiUHJlcmVxcyI6IFtdLAogICAgICAgICAg
IlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2E0MDgucGF0Y2giCiAgICAg
ICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQuMTYiOiB7
CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAg
ICAiU3RhYmxlUmVmIjogIjBhNTM4N2EwMTE2NWI0NmM4Yzg1ZTdmN2UyZGRi
ZTYwYTdmNWRiNDQiLAogICAgICAgICAgIlByZXJlcXMiOiBbXSwKICAgICAg
ICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhNDA4LnBhdGNoIgog
ICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICJtYXN0
ZXIiOiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAg
ICAgICAgICAiU3RhYmxlUmVmIjogIjM1NWNhYTllZjI5ZmQ0YmNkZjQ4YmMy
NjNlNmNhM2IyNDM5MjQ5MGIiLAogICAgICAgICAgIlByZXJlcXMiOiBbXSwK
ICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhNDA4LnBh
dGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfQogIH0K
fQ==

--=separator
Content-Type: application/octet-stream; name="xsa408.patch"
Content-Disposition: attachment; filename="xsa408.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODYvbW06IGNvcnJlY3QgVExCIGZsdXNoIGNvbmRpdGlvbiBpbiBfZ2V0
X3BhZ2VfdHlwZSgpCgpXaGVuIHRoaXMgbG9naWMgd2FzIG1vdmVkLCBpdCB3
YXMgbW92ZWQgYWNyb3NzIHRoZSBwb2ludCB3aGVyZSBueCBpcwp1cGRhdGVk
IHRvIGhvbGQgdGhlIG5ldyB0eXBlIGZvciB0aGUgcGFnZS4gSU9XIG9yaWdp
bmFsbHkgaXQgd2FzCmVxdWl2YWxlbnQgdG8gdXNpbmcgeCAoYW5kIHBlcmhh
cHMgeCB3b3VsZCBiZXR0ZXIgaGF2ZSBiZWVuIHVzZWQpLCBidXQKbm93IGl0
IGlzbid0IGFueW1vcmUuIFN3aXRjaCB0byB1c2luZyB4LCB3aGljaCB0aGVu
IGJyaW5ncyB0aGluZ3MgaW4KbGluZSBhZ2FpbiB3aXRoIHRoZSBzbGlnaHRs
eSBlYXJsaWVyIGNvbW1lbnQgdGhlcmUgKG5vdykgdGFsa2luZyBhYm91dAp0
cmFuc2l0aW9ucyBfZnJvbV8gd3JpdGFibGUuCgpJIGhhdmUgdG8gY29uZmVz
cyB0aG91Z2ggdGhhdCBJIGNhbm5vdCBtYWtlIGEgZGlyZWN0IGNvbm5lY3Rp
b24gYmV0d2Vlbgp0aGUgcmVwb3J0ZWQgb2JzZXJ2ZWQgYmVoYXZpb3Igb2Yg
Z3Vlc3RzIGxlYXZpbmcgc2V2ZXJhbCBwYWdlcyBhcm91bmQKd2l0aCBwZW5k
aW5nIGdlbmVyYWwgcmVmZXJlbmNlcyBhbmQgdGhlIGNoYW5nZSBoZXJlLiBS
ZXBlYXRlZCB0ZXN0aW5nLApuZXZlcnRoZWxlc3MsIGNvbmZpcm1zIHRoZSBy
ZXBvcnRlZCBpc3N1ZSBpcyBubyBsb25nZXIgdGhlcmUuCgpUaGlzIGlzIENW
RS0yMDIyLTMzNzQ1IC8gWFNBLTQwOC4KClJlcG9ydGVkLWJ5OiBDaGFybGVz
IEFybm9sZCA8Y2Fybm9sZEBzdXNlLmNvbT4KRml4ZXM6IDhjYzUwMzZiYzM4
NSAoIng4Ni9wdjogRml4IEFCQUMgY21weGNoZygpIHJhY2UgaW4gX2dldF9w
YWdlX3R5cGUoKSIpClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpJJ2QgYmUgaGFwcHkgdG8g
dXBkYXRlIHRoZSBkZXNjcmlwdGlvbiB0byBhY3R1YWxseSBjb25uZWN0IHRo
aW5ncywgYXMKbG9uZyBhcyBzb21lb25lIGNhbiBnaXZlIHNvbWUgcGxhdXNp
YmxlIGV4cGxhbmF0aW9uLgoKLS0tIGEveGVuL2FyY2gveDg2L21tLmMKKysr
IGIveGVuL2FyY2gveDg2L21tLmMKQEAgLTMwMzgsNyArMzAzOCw3IEBAIHN0
YXRpYyBpbnQgX2dldF9wYWdlX3R5cGUoc3RydWN0IHBhZ2VfaW4KICAgICAg
ICAgICAgIGlmICggdW5saWtlbHkoIWNwdW1hc2tfZW1wdHkobWFzaykpICYm
CiAgICAgICAgICAgICAgICAgIC8qIFNoYWRvdyBtb2RlOiB0cmFjayBvbmx5
IHdyaXRhYmxlIHBhZ2VzLiAqLwogICAgICAgICAgICAgICAgICAoIXNoYWRv
d19tb2RlX2VuYWJsZWQoZCkgfHwKLSAgICAgICAgICAgICAgICAgICgobngg
JiBQR1RfdHlwZV9tYXNrKSA9PSBQR1Rfd3JpdGFibGVfcGFnZSkpICkKKyAg
ICAgICAgICAgICAgICAgICgoeCAmIFBHVF90eXBlX21hc2spID09IFBHVF93
cml0YWJsZV9wYWdlKSkgKQogICAgICAgICAgICAgewogICAgICAgICAgICAg
ICAgIHBlcmZjX2luY3IobmVlZF9mbHVzaF90bGJfZmx1c2gpOwogICAgICAg
ICAgICAgICAgIC8qCg==

--=separator
Content-Type: application/octet-stream; name="xsa408-4.13.patch"
Content-Disposition: attachment; filename="xsa408-4.13.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODYvbW06IGNvcnJlY3QgVExCIGZsdXNoIGNvbmRpdGlvbiBpbiBfZ2V0
X3BhZ2VfdHlwZSgpCgpXaGVuIHRoaXMgbG9naWMgd2FzIG1vdmVkLCBpdCB3
YXMgbW92ZWQgYWNyb3NzIHRoZSBwb2ludCB3aGVyZSBueCBpcwp1cGRhdGVk
IHRvIGhvbGQgdGhlIG5ldyB0eXBlIGZvciB0aGUgcGFnZS4gSU9XIG9yaWdp
bmFsbHkgaXQgd2FzCmVxdWl2YWxlbnQgdG8gdXNpbmcgeCAoYW5kIHBlcmhh
cHMgeCB3b3VsZCBiZXR0ZXIgaGF2ZSBiZWVuIHVzZWQpLCBidXQKbm93IGl0
IGlzbid0IGFueW1vcmUuIFN3aXRjaCB0byB1c2luZyB4LCB3aGljaCB0aGVu
IGJyaW5ncyB0aGluZ3MgaW4KbGluZSBhZ2FpbiB3aXRoIHRoZSBzbGlnaHRs
eSBlYXJsaWVyIGNvbW1lbnQgdGhlcmUgKG5vdykgdGFsa2luZyBhYm91dAp0
cmFuc2l0aW9ucyBfZnJvbV8gd3JpdGFibGUuCgpJIGhhdmUgdG8gY29uZmVz
cyB0aG91Z2ggdGhhdCBJIGNhbm5vdCBtYWtlIGEgZGlyZWN0IGNvbm5lY3Rp
b24gYmV0d2Vlbgp0aGUgcmVwb3J0ZWQgb2JzZXJ2ZWQgYmVoYXZpb3Igb2Yg
Z3Vlc3RzIGxlYXZpbmcgc2V2ZXJhbCBwYWdlcyBhcm91bmQKd2l0aCBwZW5k
aW5nIGdlbmVyYWwgcmVmZXJlbmNlcyBhbmQgdGhlIGNoYW5nZSBoZXJlLiBS
ZXBlYXRlZCB0ZXN0aW5nLApuZXZlcnRoZWxlc3MsIGNvbmZpcm1zIHRoZSBy
ZXBvcnRlZCBpc3N1ZSBpcyBubyBsb25nZXIgdGhlcmUuCgpUaGlzIGlzIENW
RS0yMDIyLTMzNzQ1IC8gWFNBLTQwOC4KClJlcG9ydGVkLWJ5OiBDaGFybGVz
IEFybm9sZCA8Y2Fybm9sZEBzdXNlLmNvbT4KRml4ZXM6IDhjYzUwMzZiYzM4
NSAoIng4Ni9wdjogRml4IEFCQUMgY21weGNoZygpIHJhY2UgaW4gX2dldF9w
YWdlX3R5cGUoKSIpClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYv
bW0uYworKysgYi94ZW4vYXJjaC94ODYvbW0uYwpAQCAtMzA4MCw3ICszMDgw
LDcgQEAgc3RhdGljIGludCBfZ2V0X3BhZ2VfdHlwZShzdHJ1Y3QgcGFnZV9p
bgogICAgICAgICAgICAgaWYgKCB1bmxpa2VseSghY3B1bWFza19lbXB0eSht
YXNrKSkgJiYKICAgICAgICAgICAgICAgICAgLyogU2hhZG93IG1vZGU6IHRy
YWNrIG9ubHkgd3JpdGFibGUgcGFnZXMuICovCiAgICAgICAgICAgICAgICAg
ICghc2hhZG93X21vZGVfZW5hYmxlZChkKSB8fAotICAgICAgICAgICAgICAg
ICAgKChueCAmIFBHVF90eXBlX21hc2spID09IFBHVF93cml0YWJsZV9wYWdl
KSkgKQorICAgICAgICAgICAgICAgICAgKCh4ICYgUEdUX3R5cGVfbWFzaykg
PT0gUEdUX3dyaXRhYmxlX3BhZ2UpKSApCiAgICAgICAgICAgICB7CiAgICAg
ICAgICAgICAgICAgcGVyZmNfaW5jcihuZWVkX2ZsdXNoX3RsYl9mbHVzaCk7
CiAgICAgICAgICAgICAgICAgZmx1c2hfdGxiX21hc2sobWFzayk7Cg==

--=separator--

