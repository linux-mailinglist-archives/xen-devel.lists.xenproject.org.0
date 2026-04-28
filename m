Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPtSGrih8GkQWgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 14:02:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D82E5484766
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 14:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295643.1572304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHh8L-0004kw-QI; Tue, 28 Apr 2026 12:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295643.1572304; Tue, 28 Apr 2026 12:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHh8L-0004iv-Lm; Tue, 28 Apr 2026 12:01:45 +0000
Received: by outflank-mailman (input) for mailman id 1295643;
 Tue, 28 Apr 2026 12:01:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1wHh8J-0004QY-5G; Tue, 28 Apr 2026 12:01:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHh8I-004jWr-H2; Tue, 28 Apr 2026 14:01:42 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 69f0a1a5-e002-0a2a0a5209dd-0a2a4501852e-6
 for <multiple-recipients>; Tue, 28 Apr 2026 14:01:42 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 69f0a1a5-c1f2-0a2a45010019-6882d725b590-3
 for <multiple-recipients>; Tue, 28 Apr 2026 14:01:42 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wHh88-0064Zb-09;
 Tue, 28 Apr 2026 12:01:32 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wHh87-006n03-3A;
 Tue, 28 Apr 2026 12:01:31 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.510 (Entity 5.510)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 483 v2 (CVE-2026-23556) - oxenstored keeps
 quota related use counts across domain destruction
Message-Id: <E1wHh87-006n03-3A@xenbits.xenproject.org>
Date: Tue, 28 Apr 2026 12:01:31 +0000
X-purgate-ID: tlsNG-d62444/1777377702-BDA69FF4-96C8E755/0/0
X-purgate-type: clean
X-purgate-size: 8700
X-Rspamd-Queue-Id: D82E5484766
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.49 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:url];
	DMARC_NA(0.00)[xen.org];
	FORGED_RECIPIENTS(0.00)[m:xen-announce@lists.xen.org,m:xen-devel@lists.xen.org,m:xen-users@lists.xen.org,m:oss-security@lists.openwall.com,m:security-team-members@xen.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:~,3:~,4:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[security@xen.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[security@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.519];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-23556 / XSA-483
                               version 2

  oxenstored keeps quota related use counts across domain destruction

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

When oxenstored is tearing a domain down, the node data is cleaned up
but the usage counts are leaked.

When the domain ID is eventually reused, the new domain can create fewer
nodes before beeing deemed to be over quota.

IMPACT
======

Over an extended period of time, new domains will be able to create
fewer and fewer nodes in xenstored, until they are eventually unable to
operate at all.

A buggy or malicious domain can speed this process up by deliberately
hitting it's quota, and then rebooting.

VULNERABLE SYSTEMS
==================

All versions of Xen containing the XSA-419 fixes are vulnerable.

Only systems configured to use oxenstored (Ocaml xenstored) are
vulnerable.  Systems configured to xenstored (C xenstored) are not
vulnerable.

MITIGATION
==========

Performing a xenstore live update mitigates the issue.

CREDITS
=======

This issue was discovered by Andrii Sultanov of Vates.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa483.patch           xen-unstable - Xen 4.18.x
xsa483-4.17.patch      Xen 4.17.x
xsa483-xapi.patch      XAPI oxenstored

$ sha256sum xsa483*
4be3acc57dcd5e2719cab165729879757a1915c33b848a37623dd4a5f1157746  xsa483.patch
389b0411d855894adff6f640dcbd3358adc6d4cb9ddeedbcb9cb2c345af67d51  xsa483-4.17.patch
ec191a1e158eddd22bfbd764f26f6b6a0b75b9fe0a223dc66da1c4a16ef73122  xsa483-xapi.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmnwoPIMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZM8EH/iXC6hLQHAVLeRCfUEZ1ncM7029KPyRxLIOlthCS
cAyMNjyVSckGMRgKvYWCpl/fN1v/2yv3olIIR9wtncaq8Q+iMkwOsw1P46fmsh3J
40pK6PnaP1/kRrua1ZANlUc8YUhWG8fE2ADPHCIo57qbO1fXVUEWARdgU5gYIkF4
Kz+dvkpEEiTdRe24zqfn9Bv4lDsihfq3B9zecEuqMj3L88FrMP9VfBJZMbx9N/Pb
TUE/FltETdWqMLeIyb7r3P5OPrLRYk6ebgrX96Pb3f0d1/OC8E4Me3RNvGoArmOI
f8R0M/zly0lmoJspJFtI2C7BdUIKB/59z/Sz2YC706AJBO0=
=mbDG
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa483.patch"
Content-Disposition: attachment; filename="xsa483.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmlpIFN1bHRhbm92IDxhbmRyaXkuc3VsdGFub3ZAdmF0ZXMu
dGVjaD4KU3ViamVjdDogdG9vbHMvb3hlbnN0b3JlZDogUmVzZXQgcXVvdGEg
d2hlbiByZXNldHRpbmcgcGVybWlzc2lvbnMKClRoZSBxdW90YSBvYmplY3Qg
Y29udGFpbnMgYm90aCBsaW1pdHMgYW5kIHRoZSBjdXJyZW50IG5vZGUgdXNh
Z2UgY291bnRzLgoKV2hlbiBhIGRvbWFpbiBpcyB0b3JuIGRvd24sIHRoZSBu
b2RlIGRhdGEgaXRzZWxmIGlzIGNsZWFuZWQgdXAgYnV0IHRoZSBub2RlCnVz
YWdlIGNvdW50cyBhcmUgbm90LiAgQSBsYXRlciBkb21haW4gcmV1c2luZyB0
aGUgc2FtZSBkb21pZCBjYW4gY3JlYXRlIGZld2VyCm5vZGVzIGJlZm9yZSBi
ZWluZyBkZWVtZWQgdG8gYmUgb3ZlciBxdW90YS4KClJlc2V0IHRoZSBjb3Vu
dCB3aGVuIHRoZSBub2RlIHBlcm1pc3Npb25zIGFyZSBjbGVhbmVkIHVwLgoK
VGhpcyBpcyBYU0EtNDgzIC8gQ1ZFLTIwMjYtMjM1NTYuCgpTaWduZWQtb2Zm
LWJ5OiBBbmRyaWkgU3VsdGFub3YgPGFuZHJpeS5zdWx0YW5vdkB2YXRlcy50
ZWNoPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgoKZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL3hl
bnN0b3JlZC9zdG9yZS5tbCBiL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9zdG9y
ZS5tbAppbmRleCA5YjhkZDI4MTJkZjAuLmFhOTIwNGVhZDNlYyAxMDA2NDQK
LS0tIGEvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3N0b3JlLm1sCisrKyBiL3Rv
b2xzL29jYW1sL3hlbnN0b3JlZC9zdG9yZS5tbApAQCAtNDY1LDcgKzQ2NSw4
IEBAIGxldCByZXNldF9wZXJtaXNzaW9ucyBzdG9yZSBkb21pZCA9CiAgICAg
ICAgIGlmIHBlcm1zIDw+IG5vZGUucGVybXMgdGhlbgogICAgICAgICAgIExv
Z2dpbmcuZGVidWcgInN0b3JlfG5vZGUiICJDaGFuZ2VkIHBlcm1pc3Npb25z
IGZvciBub2RlICVzIiAoTm9kZS5nZXRfbmFtZSBub2RlKTsKICAgICAgICAg
U29tZSB7IG5vZGUgd2l0aCBOb2RlLnBlcm1zIH0KLSAgICApIHN0b3JlLnJv
b3QKKyAgICApIHN0b3JlLnJvb3Q7CisgIHN0b3JlLnF1b3RhIDwtIFF1b3Rh
LmRlbCBzdG9yZS5xdW90YSBkb21pZAogCiB0eXBlIG9wcyA9IHsKICAgc3Rv
cmU6IHQ7Cg==

--=separator
Content-Type: application/octet-stream; name="xsa483-4.17.patch"
Content-Disposition: attachment; filename="xsa483-4.17.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmlpIFN1bHRhbm92IDxhbmRyaXkuc3VsdGFub3ZAdmF0ZXMu
dGVjaD4KU3ViamVjdDogdG9vbHMvb3hlbnN0b3JlZDogUmVzZXQgcXVvdGEg
d2hlbiByZXNldHRpbmcgcGVybWlzc2lvbnMKClRoZSBxdW90YSBvYmplY3Qg
Y29udGFpbnMgYm90aCBsaW1pdHMgYW5kIHRoZSBjdXJyZW50IG5vZGUgdXNh
Z2UgY291bnRzLgoKV2hlbiBhIGRvbWFpbiBpcyB0b3JuIGRvd24sIHRoZSBu
b2RlIGRhdGEgaXRzZWxmIGlzIGNsZWFuZWQgdXAgYnV0IHRoZSBub2RlCnVz
YWdlIGNvdW50cyBhcmUgbm90LiAgQSBsYXRlciBkb21haW4gcmV1c2luZyB0
aGUgc2FtZSBkb21pZCBjYW4gY3JlYXRlIGZld2VyCm5vZGVzIGJlZm9yZSBi
ZWluZyBkZWVtZWQgdG8gYmUgb3ZlciBxdW90YS4KClJlc2V0IHRoZSBjb3Vu
dCB3aGVuIHRoZSBub2RlIHBlcm1pc3Npb25zIGFyZSBjbGVhbmVkIHVwLgoK
VGhpcyBpcyBYU0EtNDgzIC8gQ1ZFLTIwMjYtMjM1NTYuCgpTaWduZWQtb2Zm
LWJ5OiBBbmRyaWkgU3VsdGFub3YgPGFuZHJpeS5zdWx0YW5vdkB2YXRlcy50
ZWNoPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgoKZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL3hl
bnN0b3JlZC9zdG9yZS5tbCBiL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9zdG9y
ZS5tbAppbmRleCA1ZGQ5NjVkYjE1MWYuLmMwOTlhMmVhZTY4YSAxMDA2NDQK
LS0tIGEvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3N0b3JlLm1sCisrKyBiL3Rv
b2xzL29jYW1sL3hlbnN0b3JlZC9zdG9yZS5tbApAQCAtNDY1LDcgKzQ2NSw4
IEBAIGxldCByZXNldF9wZXJtaXNzaW9ucyBzdG9yZSBkb21pZCA9CiAJCQlp
ZiBwZXJtcyA8PiBub2RlLnBlcm1zIHRoZW4KIAkJCQlMb2dnaW5nLmRlYnVn
ICJzdG9yZXxub2RlIiAiQ2hhbmdlZCBwZXJtaXNzaW9ucyBmb3Igbm9kZSAl
cyIgKE5vZGUuZ2V0X25hbWUgbm9kZSk7CiAJCQlTb21lIHsgbm9kZSB3aXRo
IE5vZGUucGVybXMgfQotCSkgc3RvcmUucm9vdAorCSkgc3RvcmUucm9vdDsK
KwlzdG9yZS5xdW90YSA8LSBRdW90YS5kZWwgc3RvcmUucXVvdGEgZG9taWQK
IAogdHlwZSBvcHMgPSB7CiAJc3RvcmU6IHQ7Cg==

--=separator
Content-Type: application/octet-stream; name="xsa483-xapi.patch"
Content-Disposition: attachment; filename="xsa483-xapi.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmlpIFN1bHRhbm92IDxhbmRyaXkuc3VsdGFub3ZAdmF0ZXMu
dGVjaD4KU3ViamVjdDogdG9vbHMvb3hlbnN0b3JlZDogUmVzZXQgcXVvdGEg
d2hlbiByZXNldHRpbmcgcGVybWlzc2lvbnMKClRoZSBxdW90YSBvYmplY3Qg
Y29udGFpbnMgYm90aCBsaW1pdHMgYW5kIHRoZSBjdXJyZW50IG5vZGUgdXNh
Z2UgY291bnRzLgoKV2hlbiBhIGRvbWFpbiBpcyB0b3JuIGRvd24sIHRoZSBu
b2RlIGRhdGEgaXRzZWxmIGlzIGNsZWFuZWQgdXAgYnV0IHRoZSBub2RlCnVz
YWdlIGNvdW50cyBhcmUgbm90LiAgQSBsYXRlciBkb21haW4gcmV1c2luZyB0
aGUgc2FtZSBkb21pZCBjYW4gY3JlYXRlIGZld2VyCm5vZGVzIGJlZm9yZSBi
ZWluZyBkZWVtZWQgdG8gYmUgb3ZlciBxdW90YS4KClJlc2V0IHRoZSBjb3Vu
dCB3aGVuIHRoZSBub2RlIHBlcm1pc3Npb25zIGFyZSBjbGVhbmVkIHVwLgoK
VGhpcyBpcyBYU0EtNDgzIC8gQ1ZFLTIwMjYtMjM1NTYuCgpTaWduZWQtb2Zm
LWJ5OiBBbmRyaWkgU3VsdGFub3YgPGFuZHJpeS5zdWx0YW5vdkB2YXRlcy50
ZWNoPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgoKZGlmZiAtLWdpdCBhL294ZW5zdG9yZWQvc3Rv
cmUubWwgYi9veGVuc3RvcmVkL3N0b3JlLm1sCmluZGV4IDNmMzkwMTU1YWJh
Yy4uNTFkZjgxZTI0ZDY1IDEwMDY0NAotLS0gYS9veGVuc3RvcmVkL3N0b3Jl
Lm1sCisrKyBiL294ZW5zdG9yZWQvc3RvcmUubWwKQEAgLTUxMCw3ICs1MTAs
OCBAQCBsZXQgcmVzZXRfcGVybWlzc2lvbnMgc3RvcmUgZG9taWQgPQogICAg
ICAgICAgICAgICAgIChOb2RlLmdldF9uYW1lIG5vZGUpIDsKICAgICAgICAg
ICAgIFNvbWUge25vZGUgd2l0aCBOb2RlLnBlcm1zfQogICAgICAgKQotICAg
ICAgc3RvcmUucm9vdAorICAgICAgc3RvcmUucm9vdCA7CisgIHN0b3JlLnF1
b3RhIDwtIFF1b3RhLmRlbCBzdG9yZS5xdW90YSBkb21pZAogCiB0eXBlIG9w
cyA9IHsKICAgICBzdG9yZTogdAo=

--=separator--

