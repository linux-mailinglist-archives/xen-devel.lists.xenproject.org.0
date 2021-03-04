Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B206A32D145
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 11:59:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93158.175856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHlgf-0000KP-Nq; Thu, 04 Mar 2021 10:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93158.175856; Thu, 04 Mar 2021 10:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHlgf-0000Jv-Je; Thu, 04 Mar 2021 10:58:33 +0000
Received: by outflank-mailman (input) for mailman id 93158;
 Thu, 04 Mar 2021 10:58:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PH3V=IC=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1lHlge-0000EB-2x
 for xen-devel@lists.xen.org; Thu, 04 Mar 2021 10:58:32 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49a6fae3-d2a5-4eaf-90f4-e1164d2812c4;
 Thu, 04 Mar 2021 10:58:16 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1lHlgJ-0000v8-Qb; Thu, 04 Mar 2021 10:58:11 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1lHlgJ-0003KK-Ms; Thu, 04 Mar 2021 10:58:11 +0000
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
X-Inumbo-ID: 49a6fae3-d2a5-4eaf-90f4-e1164d2812c4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=9//W9NVX0OPw4RURgTZOd9DdR5TW685wHuUJYEASpTA=; b=boeON9A0IU4UYFlMt57H2R5tPx
	/zVYJKzXqEuKmYwn5g27xheTjrHiRO7YohfblG50cUIzgFMEWZuZ4C+TcI8gI7lVcyEgwEjqhABvD
	/i3jb/HKsIJhHyIEyJYOs2bq1fkwoXwgEb6yw5fsoWM45/VARHeN7FfucR//kiIZ5nTs=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 369 v1 - Linux: special config may crash
 when trying to map foreign pages
Message-Id: <E1lHlgJ-0003KK-Ms@xenbits.xenproject.org>
Date: Thu, 04 Mar 2021 10:58:11 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

                    Xen Security Advisory XSA-369

   Linux: special config may crash when trying to map foreign pages

ISSUE DESCRIPTION
=================

With CONFIG_XEN_BALLOON_MEMORY_HOTPLUG disabled and
CONFIG_XEN_UNPOPULATED_ALLOC enabled the Linux kernel will use guest
physical addresses allocated via the ZONE_DEVICE functionality for
mapping foreign guest's pages.

This will result in problems, as the p2m list will only cover the initial
memory size of the domain plus some padding at the end. Most ZONE_DEVICE
allocated addresses will be outside the p2m range and thus a mapping can't
be established with those memory addresses, resulting in a crash.

The attack involves doing I/O requiring large amounts of data to be
mapped by the Dom0 or driver domain.  The amount of data needed to
result in a crash can vary depending on the memory layout of the
affected Dom0 or driver domain.

IMPACT
======

A Dom0 or driver domain based on a Linux kernel (configured as
described above) can be crashed by a malicious guest administrator, or
possibly malicious unprivileged guest processes.

VULNERABLE SYSTEMS
==================

Only x86 paravirtualized (PV) Dom0 or driver domains are
affected.

Only Linux kernels configured *with* CONFIG_XEN_UNPOPULATED_ALLOC and
*without* CONFIG_XEN_BALLOON_MEMORY_HOTPLUG are vulnerable.  Only
kernels from kernel version 5.9 onwards are affected.

CONFIG_XEN_BALLOON_MEMORY_HOTPLUG is enabled by default in upstream
Linux when Xen support is enabled, so kernels using upstream default
Kconfig are not affected.  Most distribution kernels supporting Xen
dom0 use are likewise not vulnerable.

Arm systems or x86 PVH or x86 HVM driver domains are not affected.

MITIGATION
==========

There is no mitigation available.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

xsa369-linux.patch           Linux 5.9-stable - 5.12-rc

$ sha256sum xsa369*
937df4f078a070cf47bdd718c6b8a042ec6bee255eedc422d833c2ae3dd561c7  xsa369-linux.patch
$

CREDITS
=======

This issue was discovered by Marek Marczykowski-Górecki of Invisible
Things Lab.

For patch:
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

NOTE REGARDING LACK OF EMBARGO
==============================

This was reported publicly multiple times, before the XSA could be
issued.
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmBAvMQMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZ5PoH/2EY28X1Fe+2RW5SrnAo2dZWLXeIrXQIXbsDCdlI
GKhFChUhYHJP3wLhE4F7J5SAjl48ta/gtdpbpJWXsZSS+2KIdV/dDZ3ZA6cxWFAI
DuVvqqt5O0xpF02bgTZrL1GUL8975L0O7cwtGmsIbPjVSF5UktuLS0Q1zRAiYvG9
l5Xu32nekxz2fGebMYrJTIPYNc8LOg3d+MIAE4W1u3Wj46S8yRJhyNQmsPQXZTEk
nlTp0ed8ScAt7pIZn7dbnLz8zUAQ64h2yar0UBih51kd3Bss5E4PXsS0zlXlVNfk
046nBhbFfB3dgM49NlJ3oHhiZh6dN5LpMblmGK4Tb+FJqNE=
=QwG+
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa369-linux.patch"
Content-Disposition: attachment; filename="xsa369-linux.patch"
Content-Transfer-Encoding: base64

RnJvbTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpTdWJqZWN0
OiB4ZW46IGZpeCBwMm0gc2l6ZSBpbiBkb20wIGZvciBkaXNhYmxlZCBtZW1v
cnkgaG90cGx1ZyBjYXNlCgpTaW5jZSBjb21taXQgOWUyMzY5YzA2YzhhMTgg
KCJ4ZW46IGFkZCBoZWxwZXJzIHRvIGFsbG9jYXRlIHVucG9wdWxhdGVkCm1l
bW9yeSIpIGZvcmVpZ24gbWFwcGluZ3MgYXJlIHVzaW5nIGd1ZXN0IHBoeXNp
Y2FsIGFkZHJlc3NlcyBhbGxvY2F0ZWQKdmlhIFpPTkVfREVWSUNFIGZ1bmN0
aW9uYWxpdHkuCgpUaGlzIHdpbGwgcmVzdWx0IGluIHByb2JsZW1zIGZvciB0
aGUgY2FzZSBvZiBubyBiYWxsb29uIG1lbW9yeSBob3RwbHVnCmJlaW5nIGNv
bmZpZ3VyZWQsIGFzIHRoZSBwMm0gbGlzdCB3aWxsIG9ubHkgY292ZXIgdGhl
IGluaXRpYWwgbWVtb3J5CnNpemUgb2YgdGhlIGRvbWFpbi4gQW55IFpPTkVf
REVWSUNFIGFsbG9jYXRlZCBhZGRyZXNzIHdpbGwgYmUgb3V0c2lkZQp0aGUg
cDJtIHJhbmdlIGFuZCB0aHVzIGEgbWFwcGluZyBjYW4ndCBiZSBlc3RhYmxp
c2hlZCB3aXRoIHRoYXQgbWVtb3J5CmFkZHJlc3MuCgpGaXggdGhhdCBieSBl
eHRlbmRpbmcgdGhlIHAybSBzaXplIGZvciB0aGF0IGNhc2UuIEF0IHRoZSBz
YW1lIHRpbWUgYWRkCmEgY2hlY2sgZm9yIGEgdG8gYmUgY3JlYXRlZCBtYXBw
aW5nIHRvIGJlIHdpdGhpbiB0aGUgcDJtIGxpbWl0cyBpbgpvcmRlciB0byBk
ZXRlY3QgZXJyb3JzIGVhcmx5LgoKV2hpbGUgY2hhbmdpbmcgYSBjb21tZW50
LCByZW1vdmUgc29tZSAzMi1iaXQgbGVmdG92ZXJzLgoKVGhpcyBpcyBYU0Et
MzY5LgoKRml4ZXM6IDllMjM2OWMwNmM4YTE4ICgieGVuOiBhZGQgaGVscGVy
cyB0byBhbGxvY2F0ZSB1bnBvcHVsYXRlZCBtZW1vcnkiKQpDYzogPHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmc+ICMgNS45ClJlcG9ydGVkLWJ5OiBNYXJlayBN
YXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5n
c2xhYi5jb20+ClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9w
YWdlLmggfCAxMiArKysrKysrKysrKysKIGFyY2gveDg2L3hlbi9wMm0uYyAg
ICAgICAgICAgICAgfCAxMCArKysrKystLS0tCiBhcmNoL3g4Ni94ZW4vc2V0
dXAuYyAgICAgICAgICAgIHwgMjUgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogMyBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyNiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94
ZW4vcGFnZS5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20veGVuL3BhZ2UuaApp
bmRleCAxYTE2MmU1NTk3NTMuLjcwNjhlNGJiMDU3ZCAxMDA2NDQKLS0tIGEv
YXJjaC94ODYvaW5jbHVkZS9hc20veGVuL3BhZ2UuaAorKysgYi9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS94ZW4vcGFnZS5oCkBAIC04Niw2ICs4NiwxOCBAQCBj
bGVhcl9mb3JlaWduX3AybV9tYXBwaW5nKHN0cnVjdCBnbnR0YWJfdW5tYXBf
Z3JhbnRfcmVmICp1bm1hcF9vcHMsCiB9CiAjZW5kaWYKIAorLyoKKyAqIFRo
ZSBtYXhpbXVtIGFtb3VudCBvZiBleHRyYSBtZW1vcnkgY29tcGFyZWQgdG8g
dGhlIGJhc2Ugc2l6ZS4gIFRoZQorICogbWFpbiBzY2FsaW5nIGZhY3RvciBp
cyB0aGUgc2l6ZSBvZiBzdHJ1Y3QgcGFnZS4gIEF0IGV4dHJlbWUgcmF0aW9z
CisgKiBvZiBiYXNlOmV4dHJhLCBhbGwgdGhlIGJhc2UgbWVtb3J5IGNhbiBi
ZSBmaWxsZWQgd2l0aCBwYWdlCisgKiBzdHJ1Y3R1cmVzIGZvciB0aGUgZXh0
cmEgbWVtb3J5LCBsZWF2aW5nIG5vIHNwYWNlIGZvciBhbnl0aGluZworICog
ZWxzZS4KKyAqCisgKiAxMHggc2VlbXMgbGlrZSBhIHJlYXNvbmFibGUgYmFs
YW5jZSBiZXR3ZWVuIHNjYWxpbmcgZmxleGliaWxpdHkgYW5kCisgKiBsZWF2
aW5nIGEgcHJhY3RpY2FsbHkgdXNhYmxlIHN5c3RlbS4KKyAqLworI2RlZmlu
ZSBYRU5fRVhUUkFfTUVNX1JBVElPCSgxMCkKKwogLyoKICAqIEhlbHBlciBm
dW5jdGlvbnMgdG8gd3JpdGUgb3IgcmVhZCB1bnNpZ25lZCBsb25nIHZhbHVl
cyB0by9mcm9tCiAgKiBtZW1vcnksIHdoZW4gdGhlIGFjY2VzcyBtYXkgZmF1
bHQuCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vcDJtLmMgYi9hcmNoL3g4
Ni94ZW4vcDJtLmMKaW5kZXggOTU0NWI4ZGY1MzE1Li5lZDM1ODVlZWJjNGUg
MTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9wMm0uYworKysgYi9hcmNoL3g4
Ni94ZW4vcDJtLmMKQEAgLTQxNiw2ICs0MTYsOSBAQCB2b2lkIF9faW5pdCB4
ZW5fdm1hbGxvY19wMm1fdHJlZSh2b2lkKQogCXhlbl9wMm1fbGFzdF9wZm4g
PSB4ZW5fbWF4X3AybV9wZm47CiAKIAlwMm1fbGltaXQgPSAocGh5c19hZGRy
X3QpUDJNX0xJTUlUICogMTAyNCAqIDEwMjQgKiAxMDI0IC8gUEFHRV9TSVpF
OworCWlmICghcDJtX2xpbWl0ICYmIElTX0VOQUJMRUQoQ09ORklHX1hFTl9V
TlBPUFVMQVRFRF9BTExPQykpCisJCXAybV9saW1pdCA9IHhlbl9zdGFydF9p
bmZvLT5ucl9wYWdlcyAqIFhFTl9FWFRSQV9NRU1fUkFUSU87CisKIAl2bS5m
bGFncyA9IFZNX0FMTE9DOwogCXZtLnNpemUgPSBBTElHTihzaXplb2YodW5z
aWduZWQgbG9uZykgKiBtYXgoeGVuX21heF9wMm1fcGZuLCBwMm1fbGltaXQp
LAogCQkJUE1EX1NJWkUgKiBQTURTX1BFUl9NSURfUEFHRSk7CkBAIC02NTIs
MTAgKzY1NSw5IEBAIGJvb2wgX19zZXRfcGh5c190b19tYWNoaW5lKHVuc2ln
bmVkIGxvbmcgcGZuLCB1bnNpZ25lZCBsb25nIG1mbikKIAlwdGVfdCAqcHRl
cDsKIAl1bnNpZ25lZCBpbnQgbGV2ZWw7CiAKLQlpZiAodW5saWtlbHkocGZu
ID49IHhlbl9wMm1fc2l6ZSkpIHsKLQkJQlVHX09OKG1mbiAhPSBJTlZBTElE
X1AyTV9FTlRSWSk7Ci0JCXJldHVybiB0cnVlOwotCX0KKwkvKiBPbmx5IGlu
dmFsaWQgZW50cmllcyBhbGxvd2VkIGFib3ZlIHRoZSBoaWdoZXN0IHAybSBj
b3ZlcmVkIGZyYW1lLiAqLworCWlmICh1bmxpa2VseShwZm4gPj0geGVuX3Ay
bV9zaXplKSkKKwkJcmV0dXJuIG1mbiA9PSBJTlZBTElEX1AyTV9FTlRSWTsK
IAogCS8qCiAJICogVGhlIGludGVyZmFjZSByZXF1aXJlcyBhdG9taWMgdXBk
YXRlcyBvbiBwMm0gZWxlbWVudHMuCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni94
ZW4vc2V0dXAuYyBiL2FyY2gveDg2L3hlbi9zZXR1cC5jCmluZGV4IDdlYWIx
NGQ1NjM2OS4uMWEzYjc1NjUyZmE0IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni94
ZW4vc2V0dXAuYworKysgYi9hcmNoL3g4Ni94ZW4vc2V0dXAuYwpAQCAtNTks
MTggKzU5LDYgQEAgc3RhdGljIHN0cnVjdCB7CiB9IHhlbl9yZW1hcF9idWYg
X19pbml0ZGF0YSBfX2FsaWduZWQoUEFHRV9TSVpFKTsKIHN0YXRpYyB1bnNp
Z25lZCBsb25nIHhlbl9yZW1hcF9tZm4gX19pbml0ZGF0YSA9IElOVkFMSURf
UDJNX0VOVFJZOwogCi0vKiAKLSAqIFRoZSBtYXhpbXVtIGFtb3VudCBvZiBl
eHRyYSBtZW1vcnkgY29tcGFyZWQgdG8gdGhlIGJhc2Ugc2l6ZS4gIFRoZQot
ICogbWFpbiBzY2FsaW5nIGZhY3RvciBpcyB0aGUgc2l6ZSBvZiBzdHJ1Y3Qg
cGFnZS4gIEF0IGV4dHJlbWUgcmF0aW9zCi0gKiBvZiBiYXNlOmV4dHJhLCBh
bGwgdGhlIGJhc2UgbWVtb3J5IGNhbiBiZSBmaWxsZWQgd2l0aCBwYWdlCi0g
KiBzdHJ1Y3R1cmVzIGZvciB0aGUgZXh0cmEgbWVtb3J5LCBsZWF2aW5nIG5v
IHNwYWNlIGZvciBhbnl0aGluZwotICogZWxzZS4KLSAqIAotICogMTB4IHNl
ZW1zIGxpa2UgYSByZWFzb25hYmxlIGJhbGFuY2UgYmV0d2VlbiBzY2FsaW5n
IGZsZXhpYmlsaXR5IGFuZAotICogbGVhdmluZyBhIHByYWN0aWNhbGx5IHVz
YWJsZSBzeXN0ZW0uCi0gKi8KLSNkZWZpbmUgRVhUUkFfTUVNX1JBVElPCQko
MTApCi0KIHN0YXRpYyBib29sIHhlbl81MTJnYl9saW1pdCBfX2luaXRkYXRh
ID0gSVNfRU5BQkxFRChDT05GSUdfWEVOXzUxMkdCKTsKIAogc3RhdGljIHZv
aWQgX19pbml0IHhlbl9wYXJzZV81MTJnYih2b2lkKQpAQCAtNzkwLDIwICs3
NzgsMTMgQEAgY2hhciAqIF9faW5pdCB4ZW5fbWVtb3J5X3NldHVwKHZvaWQp
CiAJCWV4dHJhX3BhZ2VzICs9IG1heF9wYWdlcyAtIG1heF9wZm47CiAKIAkv
KgotCSAqIENsYW1wIHRoZSBhbW91bnQgb2YgZXh0cmEgbWVtb3J5IHRvIGEg
RVhUUkFfTUVNX1JBVElPCi0JICogZmFjdG9yIHRoZSBiYXNlIHNpemUuICBP
biBub24taGlnaG1lbSBzeXN0ZW1zLCB0aGUgYmFzZQotCSAqIHNpemUgaXMg
dGhlIGZ1bGwgaW5pdGlhbCBtZW1vcnkgYWxsb2NhdGlvbjsgb24gaGlnaG1l
bSBpdAotCSAqIGlzIGxpbWl0ZWQgdG8gdGhlIG1heCBzaXplIG9mIGxvd21l
bSwgc28gdGhhdCBpdCBkb2Vzbid0Ci0JICogZ2V0IGNvbXBsZXRlbHkgZmls
bGVkLgorCSAqIENsYW1wIHRoZSBhbW91bnQgb2YgZXh0cmEgbWVtb3J5IHRv
IGEgWEVOX0VYVFJBX01FTV9SQVRJTworCSAqIGZhY3RvciB0aGUgYmFzZSBz
aXplLgogCSAqCiAJICogTWFrZSBzdXJlIHdlIGhhdmUgbm8gbWVtb3J5IGFi
b3ZlIG1heF9wYWdlcywgYXMgdGhpcyBhcmVhCiAJICogaXNuJ3QgaGFuZGxl
ZCBieSB0aGUgcDJtIG1hbmFnZW1lbnQuCi0JICoKLQkgKiBJbiBwcmluY2lw
bGUgdGhlcmUgY291bGQgYmUgYSBwcm9ibGVtIGluIGxvd21lbSBzeXN0ZW1z
IGlmCi0JICogdGhlIGluaXRpYWwgbWVtb3J5IGlzIGFsc28gdmVyeSBsYXJn
ZSB3aXRoIHJlc3BlY3QgdG8KLQkgKiBsb3dtZW0sIGJ1dCB3ZSB3b24ndCB0
cnkgdG8gZGVhbCB3aXRoIHRoYXQgaGVyZS4KIAkgKi8KLQlleHRyYV9wYWdl
cyA9IG1pbjMoRVhUUkFfTUVNX1JBVElPICogbWluKG1heF9wZm4sIFBGTl9E
T1dOKE1BWE1FTSkpLAorCWV4dHJhX3BhZ2VzID0gbWluMyhYRU5fRVhUUkFf
TUVNX1JBVElPICogbWluKG1heF9wZm4sIFBGTl9ET1dOKE1BWE1FTSkpLAog
CQkJICAgZXh0cmFfcGFnZXMsIG1heF9wYWdlcyAtIG1heF9wZm4pOwogCWkg
PSAwOwogCWFkZHIgPSB4ZW5fZTgyMF90YWJsZS5lbnRyaWVzWzBdLmFkZHI7
Ci0tIAoyLjI2LjIKCg==

--=separator--

