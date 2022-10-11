Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A87525FB1F9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 14:05:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419689.664535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiE0v-0001Io-74; Tue, 11 Oct 2022 12:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419689.664535; Tue, 11 Oct 2022 12:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiE0v-0001Bp-0b; Tue, 11 Oct 2022 12:05:37 +0000
Received: by outflank-mailman (input) for mailman id 419689;
 Tue, 11 Oct 2022 12:05:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4MZe=2M=xenbits.xen.org=julieng@srs-se1.protection.inumbo.net>)
 id 1oiE0s-0000jT-S8
 for xen-devel@lists.xen.org; Tue, 11 Oct 2022 12:05:35 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id feebe960-495c-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 14:05:31 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1oiE0a-0000i9-BB; Tue, 11 Oct 2022 12:05:16 +0000
Received: from julieng by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1oiE0a-0001d2-A6; Tue, 11 Oct 2022 12:05:16 +0000
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
X-Inumbo-ID: feebe960-495c-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=dFQV4fOhLMkdX0k3VkiIWqiku+NkHYyvSTpf1rTiHUA=; b=3J84H67nyFcg13Y/Kjm+Kj8uB7
	RD3056F0ZucJIY7O5Vz60ewi4VUsUM7yKI9XjzvqHtMp246XSGXevP7F3vqIXVSH8OooApTrFm6Cl
	4mygkEIEKdeGMwYJW+aM9Qd60jddiVLYJ0ii3JQREVdlt4fta1Ib+7J4Fv2irzDsR6Q0=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 411 v3 (CVE-2022-33748) - lock order
 inversion in transitive grant copy handling
Message-Id: <E1oiE0a-0001d2-A6@xenbits.xenproject.org>
Date: Tue, 11 Oct 2022 12:05:16 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2022-33748 / XSA-411
                               version 3

        lock order inversion in transitive grant copy handling

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

As part of XSA-226 a missing cleanup call was inserted on an error
handling path.  While doing so, locking requirements were not paid
attention to.  As a result two cooperating guests granting each
other transitive grants can cause locks to be acquired nested within
one another, but in respectively opposite order.  With suitable
timing between the involved grant copy operations this may result in
the locking up of a CPU.

IMPACT
======

Malicious or buggy guest kernels may be able to mount a Denial of
Service (DoS) attack affecting the entire system.

VULNERABLE SYSTEMS
==================

Xen versions 4.0 and newer are vulnerable.  Xen versions 3.4 and older
are not vulnerable.

Only guests with access to transitive grants can exploit the
vulnerability.  In particular, this means that:

 * ARM systems which have taken the XSA-268 fix are not vulnerable, as
   Grant Table v2 was disabled for other security reasons.

 * All systems with the XSA-226 fixes, and booted with
   `gnttab=max-ver:1` or `gnttab=no-transitive` are not vulnerable.

 * From Xen 4.16, the maximum grant table version can be controlled on a
   per-domain basis.  For the xl toolstack, the vulnerability does not
   manifest if either:

   1) Every guest has `max_grant_version=1` in their configuration file,
      or

   2) The global xl.conf has `max_grant_version=1`, and no guests have
      the default overridden by selecting `max_grant_version=2`.

Only multiple cooperating guests can exploit the vulnerability.

MITIGATION
==========

Disallowing the use of transitive grants either via the
`gnttab=no-transitive` Xen command line option, or by disabling grant
interface version 2 altogether via the `gnttab=max-ver:1` Xen command
line option or the xl controls as mentioned above will avoid the
vulnerability.

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

xsa411.patch           xen-unstable - Xen 4.15.x
xsa411-4.14.patch      Xen 4.14.x - 4.13.x

$ sha256sum xsa411*
0802e2e4e9d03c82429a710bbb783cee2fded52d29b1d969b97c680d30c3ac57  xsa411.patch
8473f2ee34562298c5174f0a5b3c64c561a945333aab675845093ad23250d1cf  xsa411-4.14.patch
$

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

HOWEVER, deployment of the mitigations is NOT permitted (except where
all the affected systems and VMs are administered and used only by
organisations which are members of the Xen Project Security Issues
Predisclosure List).  Specifically, deployment on public cloud systems
is NOT permitted.

This is because it is a guest visible change which will draw attention
to the issue.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmNFTAAMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZPsQH/1JCqscbx49QygGVEnq43C97HQpcoZcUNJGwGjBJ
Li0SXejxd3iWsYsFlMAgmacHIjevEGv318JJLSM21hBULGe85cc6QatpWS0VWrBc
tQVbDIgqNRv42gJCtf1dLF0TnlTZ6p3wiqfsxEYBn1zlEhe2ZEMpY8an4707O32d
nQ90JFh44QJXx6HMZD3pEw2g1+4pMDu9yDUp/Yc3YmxYnXmPW6KE7iMmGkLLGigI
GfiTI4FA/BDVIZkjPErwG7pyXmp2sdtVkv5o/cg7YTOrLzeBmegdyUvzuXkizJ2F
PQnc1rgS/vXPkC62cy6fmLkeAf0dQhq6KBuxW3N8s2fXRXk=
=/bRo
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa411.patch"
Content-Disposition: attachment; filename="xsa411.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBnbnR0YWI6IGNvcnJlY3QgbG9ja2luZyBvbiB0cmFuc2l0aXZlIGdyYW50
IGNvcHkgZXJyb3IgcGF0aAoKV2hpbGUgdGhlIGNvbW1lbnQgbmV4dCB0byB0
aGUgbG9jayBkcm9wcGluZyBpbiBwcmVwYXJhdGlvbiBvZgpyZWN1cnNpdmVs
eSBjYWxsaW5nIGFjcXVpcmVfZ3JhbnRfZm9yX2NvcHkoKSBtaXN0YWtlbmx5
IHRhbGtzIGFib3V0IHRoZQpyZCA9PSB0ZCBjYXNlIChleGNsdWRlZCBhIGZl
dyBsaW5lcyBmdXJ0aGVyIHVwKSwgdGhlIHNhbWUgY29uY2VybnMgYXBwbHkK
dG8gdGhlIGNhbGxpbmcgb2YgcmVsZWFzZV9ncmFudF9mb3JfY29weSgpIG9u
IGEgc3Vic2VxdWVudCBlcnJvciBwYXRoLgoKVGhpcyBpcyBDVkUtMjAyMi0z
Mzc0OCAvIFhTQS00MTEuCgpGaXhlczogYWQ0OGZiOTYzZGJmICgiZ250dGFi
OiBmaXggdHJhbnNpdGl2ZSBncmFudCBoYW5kbGluZyIpClNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnYyOiBF
eHRlbmQgY29kZSBjb21tZW50LgoKLS0tIGEveGVuL2NvbW1vbi9ncmFudF90
YWJsZS5jCisrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwpAQCAtMjYy
Miw5ICsyNjIyLDggQEAgYWNxdWlyZV9ncmFudF9mb3JfY29weSgKICAgICAg
ICAgICAgICAgICAgICAgIHRyYW5zX2RvbWlkKTsKIAogICAgICAgICAvKgot
ICAgICAgICAgKiBhY3F1aXJlX2dyYW50X2Zvcl9jb3B5KCkgY291bGQgdGFr
ZSB0aGUgbG9jayBvbiB0aGUKLSAgICAgICAgICogcmVtb3RlIHRhYmxlIChp
ZiByZCA9PSB0ZCksIHNvIHdlIGhhdmUgdG8gZHJvcCB0aGUgbG9jawotICAg
ICAgICAgKiBoZXJlIGFuZCByZWFjcXVpcmUuCisgICAgICAgICAqIGFjcXVp
cmVfZ3JhbnRfZm9yX2NvcHkoKSB3aWxsIHRha2UgdGhlIGxvY2sgb24gdGhl
IHJlbW90ZSB0YWJsZSwKKyAgICAgICAgICogc28gd2UgaGF2ZSB0byBkcm9w
IHRoZSBsb2NrIGhlcmUgYW5kIHJlYWNxdWlyZS4KICAgICAgICAgICovCiAg
ICAgICAgIGFjdGl2ZV9lbnRyeV9yZWxlYXNlKGFjdCk7CiAgICAgICAgIGdy
YW50X3JlYWRfdW5sb2NrKHJndCk7CkBAIC0yNjYxLDExICsyNjYwLDI1IEBA
IGFjcXVpcmVfZ3JhbnRfZm9yX2NvcHkoCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGFjdC0+dHJhbnNfZ3JlZiAhPSB0cmFuc19ncmVmIHx8CiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICFhY3QtPmlzX3N1Yl9wYWdlKSkgKQog
ICAgICAgICB7CisgICAgICAgICAgICAvKgorICAgICAgICAgICAgICogTGlr
ZSBhYm92ZSBmb3IgYWNxdWlyZV9ncmFudF9mb3JfY29weSgpIHdlIG5lZWQg
dG8gZHJvcCBhbmQgdGhlbgorICAgICAgICAgICAgICogcmUtYWNxdWlyZSB0
aGUgbG9ja3MgaGVyZSB0byBwcmV2ZW50IGxvY2sgb3JkZXIgaW52ZXJzaW9u
IGlzc3Vlcy4KKyAgICAgICAgICAgICAqIFVubGlrZSBmb3IgYWNxdWlyZV9n
cmFudF9mb3JfY29weSgpIHdlIGRvbid0IG5lZWQgdG8gcmUtY2hlY2sKKyAg
ICAgICAgICAgICAqIGFueXRoaW5nLCBhcyByZWxlYXNlX2dyYW50X2Zvcl9j
b3B5KCkgZG9lc24ndCBkZXBlbmQgb24gdGhlIGdyYW50CisgICAgICAgICAg
ICAgKiB0YWJsZSBlbnRyeTogSXQgb25seSB1cGRhdGVzIGludGVybmFsIHN0
YXRlIGFuZCB0aGUgc3RhdHVzIGZsYWdzLgorICAgICAgICAgICAgICovCisg
ICAgICAgICAgICBhY3RpdmVfZW50cnlfcmVsZWFzZShhY3QpOworICAgICAg
ICAgICAgZ3JhbnRfcmVhZF91bmxvY2socmd0KTsKKwogICAgICAgICAgICAg
cmVsZWFzZV9ncmFudF9mb3JfY29weSh0ZCwgdHJhbnNfZ3JlZiwgcmVhZG9u
bHkpOwogICAgICAgICAgICAgcmN1X3VubG9ja19kb21haW4odGQpOworCisg
ICAgICAgICAgICBncmFudF9yZWFkX2xvY2socmd0KTsKKyAgICAgICAgICAg
IGFjdCA9IGFjdGl2ZV9lbnRyeV9hY3F1aXJlKHJndCwgZ3JlZik7CiAgICAg
ICAgICAgICByZWR1Y2Vfc3RhdHVzX2Zvcl9waW4ocmQsIGFjdCwgc3RhdHVz
LCByZWFkb25seSk7CiAgICAgICAgICAgICBhY3RpdmVfZW50cnlfcmVsZWFz
ZShhY3QpOwogICAgICAgICAgICAgZ3JhbnRfcmVhZF91bmxvY2socmd0KTsK
KwogICAgICAgICAgICAgcHV0X3BhZ2UoKnBhZ2UpOwogICAgICAgICAgICAg
KnBhZ2UgPSBOVUxMOwogICAgICAgICAgICAgcmV0dXJuIEVSRVNUQVJUOwo=

--=separator
Content-Type: application/octet-stream; name="xsa411-4.14.patch"
Content-Disposition: attachment; filename="xsa411-4.14.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBnbnR0YWI6IGNvcnJlY3QgbG9ja2luZyBvbiB0cmFuc2l0aXZlIGdyYW50
IGNvcHkgZXJyb3IgcGF0aAoKV2hpbGUgdGhlIGNvbW1lbnQgbmV4dCB0byB0
aGUgbG9jayBkcm9wcGluZyBpbiBwcmVwYXJhdGlvbiBvZgpyZWN1cnNpdmVs
eSBjYWxsaW5nIGFjcXVpcmVfZ3JhbnRfZm9yX2NvcHkoKSBtaXN0YWtlbmx5
IHRhbGtzIGFib3V0IHRoZQpyZCA9PSB0ZCBjYXNlIChleGNsdWRlZCBhIGZl
dyBsaW5lcyBmdXJ0aGVyIHVwKSwgdGhlIHNhbWUgY29uY2VybnMgYXBwbHkK
dG8gdGhlIGNhbGxpbmcgb2YgcmVsZWFzZV9ncmFudF9mb3JfY29weSgpIG9u
IGEgc3Vic2VxdWVudCBlcnJvciBwYXRoLgoKVGhpcyBpcyBDVkUtMjAyMi0z
Mzc0OCAvIFhTQS00MTEuCgpGaXhlczogYWQ0OGZiOTYzZGJmICgiZ250dGFi
OiBmaXggdHJhbnNpdGl2ZSBncmFudCBoYW5kbGluZyIpClNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hl
bi9jb21tb24vZ3JhbnRfdGFibGUuYworKysgYi94ZW4vY29tbW9uL2dyYW50
X3RhYmxlLmMKQEAgLTI2MTcsOSArMjYxNyw4IEBAIGFjcXVpcmVfZ3JhbnRf
Zm9yX2NvcHkoCiAgICAgICAgICAgICAgICAgICAgICB0cmFuc19kb21pZCk7
CiAKICAgICAgICAgLyoKLSAgICAgICAgICogYWNxdWlyZV9ncmFudF9mb3Jf
Y29weSgpIGNvdWxkIHRha2UgdGhlIGxvY2sgb24gdGhlCi0gICAgICAgICAq
IHJlbW90ZSB0YWJsZSAoaWYgcmQgPT0gdGQpLCBzbyB3ZSBoYXZlIHRvIGRy
b3AgdGhlIGxvY2sKLSAgICAgICAgICogaGVyZSBhbmQgcmVhY3F1aXJlLgor
ICAgICAgICAgKiBhY3F1aXJlX2dyYW50X2Zvcl9jb3B5KCkgd2lsbCB0YWtl
IHRoZSBsb2NrIG9uIHRoZSByZW1vdGUgdGFibGUsCisgICAgICAgICAqIHNv
IHdlIGhhdmUgdG8gZHJvcCB0aGUgbG9jayBoZXJlIGFuZCByZWFjcXVpcmUu
CiAgICAgICAgICAqLwogICAgICAgICBhY3RpdmVfZW50cnlfcmVsZWFzZShh
Y3QpOwogICAgICAgICBncmFudF9yZWFkX3VubG9jayhyZ3QpOwpAQCAtMjY1
NiwxMSArMjY1NSwyNSBAQCBhY3F1aXJlX2dyYW50X2Zvcl9jb3B5KAogICAg
ICAgICAgICAgICAgICAgICAgICAgICBhY3QtPnRyYW5zX2dyZWYgIT0gdHJh
bnNfZ3JlZiB8fAogICAgICAgICAgICAgICAgICAgICAgICAgICAhYWN0LT5p
c19zdWJfcGFnZSkpICkKICAgICAgICAgeworICAgICAgICAgICAgLyoKKyAg
ICAgICAgICAgICAqIExpa2UgYWJvdmUgZm9yIGFjcXVpcmVfZ3JhbnRfZm9y
X2NvcHkoKSB3ZSBuZWVkIHRvIGRyb3AgYW5kIHRoZW4KKyAgICAgICAgICAg
ICAqIHJlLWFjcXVpcmUgdGhlIGxvY2tzIGhlcmUgdG8gcHJldmVudCBsb2Nr
IG9yZGVyIGludmVyc2lvbiBpc3N1ZXMuCisgICAgICAgICAgICAgKiBVbmxp
a2UgZm9yIGFjcXVpcmVfZ3JhbnRfZm9yX2NvcHkoKSB3ZSBkb24ndCBuZWVk
IHRvIHJlLWNoZWNrCisgICAgICAgICAgICAgKiBhbnl0aGluZywgYXMgcmVs
ZWFzZV9ncmFudF9mb3JfY29weSgpIGRvZXNuJ3QgZGVwZW5kIG9uIHRoZSBn
cmFudAorICAgICAgICAgICAgICogdGFibGUgZW50cnk6IEl0IG9ubHkgdXBk
YXRlcyBpbnRlcm5hbCBzdGF0ZSBhbmQgdGhlIHN0YXR1cyBmbGFncy4KKyAg
ICAgICAgICAgICAqLworICAgICAgICAgICAgYWN0aXZlX2VudHJ5X3JlbGVh
c2UoYWN0KTsKKyAgICAgICAgICAgIGdyYW50X3JlYWRfdW5sb2NrKHJndCk7
CisKICAgICAgICAgICAgIHJlbGVhc2VfZ3JhbnRfZm9yX2NvcHkodGQsIHRy
YW5zX2dyZWYsIHJlYWRvbmx5KTsKLSAgICAgICAgICAgIGZpeHVwX3N0YXR1
c19mb3JfY29weV9waW4ocmQsIGFjdCwgc3RhdHVzKTsKICAgICAgICAgICAg
IHJjdV91bmxvY2tfZG9tYWluKHRkKTsKKworICAgICAgICAgICAgZ3JhbnRf
cmVhZF9sb2NrKHJndCk7CisgICAgICAgICAgICBhY3QgPSBhY3RpdmVfZW50
cnlfYWNxdWlyZShyZ3QsIGdyZWYpOworICAgICAgICAgICAgZml4dXBfc3Rh
dHVzX2Zvcl9jb3B5X3BpbihyZCwgYWN0LCBzdGF0dXMpOwogICAgICAgICAg
ICAgYWN0aXZlX2VudHJ5X3JlbGVhc2UoYWN0KTsKICAgICAgICAgICAgIGdy
YW50X3JlYWRfdW5sb2NrKHJndCk7CisKICAgICAgICAgICAgIHB1dF9wYWdl
KCpwYWdlKTsKICAgICAgICAgICAgICpwYWdlID0gTlVMTDsKICAgICAgICAg
ICAgIHJldHVybiBFUkVTVEFSVDsK

--=separator--

