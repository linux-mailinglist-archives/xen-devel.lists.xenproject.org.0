Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBDFBryh8GkQWgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 14:02:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BBD48476D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 14:02:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295647.1572338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHh8P-0005UE-Vz; Tue, 28 Apr 2026 12:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295647.1572338; Tue, 28 Apr 2026 12:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHh8P-0005QE-MD; Tue, 28 Apr 2026 12:01:49 +0000
Received: by outflank-mailman (input) for mailman id 1295647;
 Tue, 28 Apr 2026 12:01:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1wHh8N-0005KI-IA; Tue, 28 Apr 2026 12:01:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHh8M-001YJf-TU; Tue, 28 Apr 2026 14:01:46 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 69f0a1aa-2eae-0a2a0a5409dd-0a2a4502edb0-2
 for <multiple-recipients>; Tue, 28 Apr 2026 14:01:46 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 69f0a1a9-af86-0a2a45020019-6882d725a1ea-3
 for <multiple-recipients>; Tue, 28 Apr 2026 14:01:46 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wHh8D-0064Zp-2a;
 Tue, 28 Apr 2026 12:01:37 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wHh8D-006n15-2O;
 Tue, 28 Apr 2026 12:01:37 +0000
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
Subject: Xen Security Advisory 484 v2 (CVE-2026-23557) - Xenstored DoS via
 XS_RESET_WATCHES command
Message-Id: <E1wHh8D-006n15-2O@xenbits.xenproject.org>
Date: Tue, 28 Apr 2026 12:01:37 +0000
X-purgate-ID: tlsNG-720697/1777377706-8256B161-7610114D/0/0
X-purgate-type: clean
X-purgate-size: 11272
X-Rspamd-Queue-Id: B5BBD48476D
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
	MIME_TRACE(0.00)[0:+,1:+,2:~,3:~];
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
	NEURAL_SPAM(0.00)[0.615];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-23557 / XSA-484
                               version 2

              Xenstored DoS via XS_RESET_WATCHES command

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

Any guest can cause xenstored to crash by issuing a XS_RESET_WATCHES
command within a transaction due to an assert() triggering.

In case xenstored was built with NDEBUG #defined nothing bad will
happen, as assert() is doing nothing in this case. Note that the
default is not to define NDEBUG for xenstored builds even in release
builds of Xen.

IMPACT
======

Any unprivileged domain can cause xenstored to crash, causing a
DoS (denial of service) for any Xenstore action. This will result
in an inability to perform further domain administration on the host.

VULNERABLE SYSTEMS
==================

All Xen systems from Xen 4.2 onwards are vulnerable. Systems up to
Xen 4.1 are not vulnerable.

Systems using the C variant of xenstored or xenstore-stubdom built
without NDEBUG are vulnerable. Systems using the OCaml variant of
Xenstore (oxenstored), or the C variant (xenstored or xenstore-stubdom)
built with NDEBUG defined are not vulnerable.

MITIGATION
==========

There is no known mitigation available.

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

xsa484.patch           xen-unstable - Xen 4.18.x
xsa484-4.17.patch      Xen 4.17.x

$ sha256sum xsa484*
77c489191d40acd807eb19344a0e1bbb67a04551e89aff726fbb2006f235aacf  xsa484.patch
6c8d8146d136956c59ee77da6aa6340272d1ea670a6b0d9cf37fe759d4b96b19  xsa484-4.17.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmnwoQEMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZGVoIALBKECpaWxXD7ivkbFpFlmt9a2TOXxnD1LjbSnzI
VAdyFECK4ng0uRaUXHMcd0Dkzw+dOrm/SA7jI+brumyyxsO44eLz5fysAQYXDHca
qsn5h7To34Fow8ejQIt1E9DmqNlZP7Y261MhYSdWN6Z2lEa4cMPyJKA/xTpQ2uUq
Cy9Ss7jrl/v98MOZb2Tkn+H8XiNsPJb57sWeaOPoUMh+42y/5qMyRgqWa3/N3iHn
ZVZEhTbrNvGYKW+DUq5KswUjxw9FAmtQ1PA/w3ItWWdsb0Gd8AE02FzdIuoIt/xk
zB9BEchspV1Gfouz0alFV+d4gDyclQmmViYojNfXYfKdWp8=
=j/SA
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa484.patch"
Content-Disposition: attachment; filename="xsa484.patch"
Content-Transfer-Encoding: base64

RnJvbSAzZDBkMTlhZDE3ZjI5YzY0ZGRlNGE3YmFmMzkyZGE0ZmQ1OGYzNjU0
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CkRhdGU6IE1vbiwgMTYgTWFyIDIwMjYgMTU6
MDY6MTEgKzAxMDAKU3ViamVjdDogW1BBVENIXSB0b29scy94ZW5zdG9yZWQ6
IG1ha2UgY29ubl9kZWxldGVfYWxsX3RyYW5zYWN0aW9ucygpCiBpZGVtcG90
ZW50Cgpjb25uX2RlbGV0ZV9hbGxfdHJhbnNhY3Rpb25zKCkgc2hvdWxkIGJl
IGNhbGxhYmxlIGluIGFueSBjb250ZXh0LApyZXNldHRpbmcgQUxMIHRyYW5z
YWN0aW9uIHJlbGF0ZWQgZGF0YS4KClRoaXMgaW5jbHVkZXMgbnVtYmVyIG9m
IGFjdGl2ZSB0cmFuc2FjdGlvbnMgYW5kIHRoZSB0cmFuc2FjdGlvbgpwb2lu
dGVyIGluIHN0cnVjdCBjb25uZWN0aW9uLgoKU28gcmVzZXQgY29ubi0+dHJh
bnMgdG8gTlVMTCBpbiBjb25uX2RlbGV0ZV9hbGxfdHJhbnNhY3Rpb25zKCkg
YW5kCmRvIHRoZSBjbGVhbnVwIGZvciBlYWNoIHRyYW5zYWN0aW9uIGluIGRl
c3Ryb3lfdHJhbnNhY3Rpb24oKS4KClRoaXMgYXZvaWRzIHRyaWdnZXJpbmcg
dGhlIGFzc2VydCgpIGluIGNvbm5fZGVsZXRlX2FsbF90cmFuc2FjdGlvbnMo
KQppbiBjYXNlIGUuZy4gaWdub3JlX2Nvbm5lY3Rpb24oKSB3YXMgY2FsbGVk
IHdoaWxlIGFuIG9wZXJhdGlvbiBpbnNpZGUKYSB0cmFuc2FjdGlvbiB3YXMg
cGVyZm9ybWVkLCBvciBYU19SRVNFVF9XQVRDSEVTIHdhcyBjYWxsZWQgaW4g
YQp0cmFuc2FjdGlvbi4KClRoaXMgaXMgWFNBLTQ4NCAvIENWRS0yMDI2LTIz
NTU3LgoKUmVwb3J0ZWQtYnk6IEFuZHJpaSBTdWx0YW5vdiA8YW5kcml5LnN1
bHRhbm92QHZhdGVzLnRlY2g+CkZpeGVzOiAxZjlkMDRmYjAyMWMgKCJ4ZW5z
dG9yZWQ6IGFsbG93IGd1ZXN0IHRvIHNodXRkb3duIGFsbCBpdHMgd2F0Y2hl
cy90cmFuc2FjdGlvbnMiKQpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogdG9vbHMveGVuc3RvcmVkL3RyYW5z
YWN0aW9uLmMgfCAyMCArKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvdG9vbHMveGVuc3RvcmVkL3RyYW5zYWN0aW9uLmMgYi90b29s
cy94ZW5zdG9yZWQvdHJhbnNhY3Rpb24uYwppbmRleCAxNjdjZDU5N2ZkLi4w
ODI1YzQ4ODU5IDEwMDY0NAotLS0gYS90b29scy94ZW5zdG9yZWQvdHJhbnNh
Y3Rpb24uYworKysgYi90b29scy94ZW5zdG9yZWQvdHJhbnNhY3Rpb24uYwpA
QCAtNDMyLDE3ICs0MzIsMjMgQEAgc3RhdGljIGludCBmaW5hbGl6ZV90cmFu
c2FjdGlvbihzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwKIHN0YXRpYyBpbnQg
ZGVzdHJveV90cmFuc2FjdGlvbih2b2lkICpfdHJhbnNhY3Rpb24pCiB7CiAJ
c3RydWN0IHRyYW5zYWN0aW9uICp0cmFucyA9IF90cmFuc2FjdGlvbjsKKwlz
dHJ1Y3QgY29ubmVjdGlvbiAqY29ubiA9IHRyYW5zLT5jb25uOwogCXN0cnVj
dCBhY2Nlc3NlZF9ub2RlICppOwogCiAJd3JsX250cmFuc2FjdGlvbnMtLTsK
IAl0cmFjZV9kZXN0cm95KHRyYW5zLCAidHJhbnNhY3Rpb24iKTsKIAl3aGls
ZSAoKGkgPSBsaXN0X3RvcCgmdHJhbnMtPmFjY2Vzc2VkLCBzdHJ1Y3QgYWNj
ZXNzZWRfbm9kZSwgbGlzdCkpKSB7CiAJCWlmIChpLT50YV9ub2RlKQotCQkJ
ZGJfZGVsZXRlKHRyYW5zLT5jb25uLCBpLT50cmFuc19uYW1lLCBOVUxMKTsK
KwkJCWRiX2RlbGV0ZShjb25uLCBpLT50cmFuc19uYW1lLCBOVUxMKTsKIAkJ
bGlzdF9kZWwoJmktPmxpc3QpOwogCQl0YWxsb2NfZnJlZShpKTsKIAl9CiAK
KwlsaXN0X2RlbCgmdHJhbnMtPmxpc3QpOworCWRvbWFpbl90cmFuc2FjdGlv
bl9kZWMoY29ubik7CisJaWYgKGxpc3RfZW1wdHkoJmNvbm4tPnRyYW5zYWN0
aW9uX2xpc3QpKQorCQljb25uLT50YV9zdGFydF90aW1lID0gMDsKKwogCXJl
dHVybiAwOwogfQogCkBAIC01MjMsMTAgKzUyOSw2IEBAIGludCBkb190cmFu
c2FjdGlvbl9lbmQoY29uc3Qgdm9pZCAqY3R4LCBzdHJ1Y3QgY29ubmVjdGlv
biAqY29ubiwKIAkJcmV0dXJuIEVOT0VOVDsKIAogCWNvbm4tPnRyYW5zYWN0
aW9uID0gTlVMTDsKLQlsaXN0X2RlbCgmdHJhbnMtPmxpc3QpOwotCWRvbWFp
bl90cmFuc2FjdGlvbl9kZWMoY29ubik7Ci0JaWYgKGxpc3RfZW1wdHkoJmNv
bm4tPnRyYW5zYWN0aW9uX2xpc3QpKQotCQljb25uLT50YV9zdGFydF90aW1l
ID0gMDsKIAogCWNoa19xdW90YSA9IHRyYW5zLT5ub2RlX2NyZWF0ZWQgJiYg
ZG9tYWluX2lzX3VucHJpdmlsZWdlZChjb25uKTsKIApAQCAtNTcyLDE0ICs1
NzQsMTAgQEAgdm9pZCBjb25uX2RlbGV0ZV9hbGxfdHJhbnNhY3Rpb25zKHN0
cnVjdCBjb25uZWN0aW9uICpjb25uKQogCXN0cnVjdCB0cmFuc2FjdGlvbiAq
dHJhbnM7CiAKIAl3aGlsZSAoKHRyYW5zID0gbGlzdF90b3AoJmNvbm4tPnRy
YW5zYWN0aW9uX2xpc3QsCi0JCQkJIHN0cnVjdCB0cmFuc2FjdGlvbiwgbGlz
dCkpKSB7Ci0JCWxpc3RfZGVsKCZ0cmFucy0+bGlzdCk7CisJCQkJIHN0cnVj
dCB0cmFuc2FjdGlvbiwgbGlzdCkpKQogCQl0YWxsb2NfZnJlZSh0cmFucyk7
Ci0JfQotCi0JYXNzZXJ0KGNvbm4tPnRyYW5zYWN0aW9uID09IE5VTEwpOwog
Ci0JY29ubi0+dGFfc3RhcnRfdGltZSA9IDA7CisJY29ubi0+dHJhbnNhY3Rp
b24gPSBOVUxMOwogfQogCiBpbnQgY2hlY2tfdHJhbnNhY3Rpb25zKHN0cnVj
dCBoYXNodGFibGUgKmhhc2gpCi0tIAoyLjUzLjAKCg==

--=separator
Content-Type: application/octet-stream; name="xsa484-4.17.patch"
Content-Disposition: attachment; filename="xsa484-4.17.patch"
Content-Transfer-Encoding: base64

RnJvbTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpTdWJqZWN0
OiB0b29scy94ZW5zdG9yZWQ6IG1ha2UgY29ubl9kZWxldGVfYWxsX3RyYW5z
YWN0aW9ucygpIGlkZW1wb3RlbnQKCmNvbm5fZGVsZXRlX2FsbF90cmFuc2Fj
dGlvbnMoKSBzaG91bGQgYmUgY2FsbGFibGUgaW4gYW55IGNvbnRleHQsCnJl
c2V0dGluZyBBTEwgdHJhbnNhY3Rpb24gcmVsYXRlZCBkYXRhLgoKVGhpcyBp
bmNsdWRlcyBudW1iZXIgb2YgYWN0aXZlIHRyYW5zYWN0aW9ucyBhbmQgdGhl
IHRyYW5zYWN0aW9uCnBvaW50ZXIgaW4gc3RydWN0IGNvbm5lY3Rpb24uCgpT
byByZXNldCBjb25uLT50cmFucyB0byBOVUxMIGluIGNvbm5fZGVsZXRlX2Fs
bF90cmFuc2FjdGlvbnMoKSBhbmQKZG8gdGhlIGNsZWFudXAgZm9yIGVhY2gg
dHJhbnNhY3Rpb24gaW4gZGVzdHJveV90cmFuc2FjdGlvbigpLgoKVGhpcyBh
dm9pZHMgdHJpZ2dlcmluZyB0aGUgYXNzZXJ0KCkgaW4gY29ubl9kZWxldGVf
YWxsX3RyYW5zYWN0aW9ucygpCmluIGNhc2UgZS5nLiBpZ25vcmVfY29ubmVj
dGlvbigpIHdhcyBjYWxsZWQgd2hpbGUgYW4gb3BlcmF0aW9uIGluc2lkZQph
IHRyYW5zYWN0aW9uIHdhcyBwZXJmb3JtZWQsIG9yIFhTX1JFU0VUX1dBVENI
RVMgd2FzIGNhbGxlZCBpbiBhCnRyYW5zYWN0aW9uLgoKVGhpcyBpcyBYU0Et
NDg0IC8gQ1ZFLTIwMjYtMjM1NTcuCgpSZXBvcnRlZC1ieTogQW5kcmlpIFN1
bHRhbm92IDxhbmRyaXkuc3VsdGFub3ZAdmF0ZXMudGVjaD4KRml4ZXM6IDFm
OWQwNGZiMDIxYyAoInhlbnN0b3JlZDogYWxsb3cgZ3Vlc3QgdG8gc2h1dGRv
d24gYWxsIGl0cyB3YXRjaGVzL3RyYW5zYWN0aW9ucyIpClNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCi0tLSBhL3Rv
b2xzL3hlbnN0b3JlL3hlbnN0b3JlZF90cmFuc2FjdGlvbi5jCisrKyBiL3Rv
b2xzL3hlbnN0b3JlL3hlbnN0b3JlZF90cmFuc2FjdGlvbi5jCkBAIC00NDUs
NiArNDQ1LDcgQEAgc3RhdGljIGludCBmaW5hbGl6ZV90cmFuc2FjdGlvbihz
dHJ1Y3QgYwogc3RhdGljIGludCBkZXN0cm95X3RyYW5zYWN0aW9uKHZvaWQg
Kl90cmFuc2FjdGlvbikKIHsKIAlzdHJ1Y3QgdHJhbnNhY3Rpb24gKnRyYW5z
ID0gX3RyYW5zYWN0aW9uOworCXN0cnVjdCBjb25uZWN0aW9uICpjb25uID0g
dHJhbnMtPmNvbm47CiAJc3RydWN0IGFjY2Vzc2VkX25vZGUgKmk7CiAJVERC
X0RBVEEga2V5OwogCkBAIC00NTMsMTIgKzQ1NCwxNyBAQCBzdGF0aWMgaW50
IGRlc3Ryb3lfdHJhbnNhY3Rpb24odm9pZCAqX3RyCiAJd2hpbGUgKChpID0g
bGlzdF90b3AoJnRyYW5zLT5hY2Nlc3NlZCwgc3RydWN0IGFjY2Vzc2VkX25v
ZGUsIGxpc3QpKSkgewogCQlpZiAoaS0+dGFfbm9kZSkgewogCQkJc2V0X3Rk
Yl9rZXkoaS0+dHJhbnNfbmFtZSwgJmtleSk7Ci0JCQlkb190ZGJfZGVsZXRl
KHRyYW5zLT5jb25uLCAma2V5LCBOVUxMKTsKKwkJCWRvX3RkYl9kZWxldGUo
Y29ubiwgJmtleSwgTlVMTCk7CiAJCX0KIAkJbGlzdF9kZWwoJmktPmxpc3Qp
OwogCQl0YWxsb2NfZnJlZShpKTsKIAl9CiAKKwlsaXN0X2RlbCgmdHJhbnMt
Pmxpc3QpOworCWNvbm4tPnRyYW5zYWN0aW9uX3N0YXJ0ZWQtLTsKKwlpZiAo
IWNvbm4tPnRyYW5zYWN0aW9uX3N0YXJ0ZWQpCisJCWNvbm4tPnRhX3N0YXJ0
X3RpbWUgPSAwOworCiAJcmV0dXJuIDA7CiB9CiAKQEAgLTU2MSwxMCArNTY3
LDYgQEAgaW50IGRvX3RyYW5zYWN0aW9uX2VuZChjb25zdCB2b2lkICpjdHgs
CiAJCXJldHVybiBFTk9FTlQ7CiAKIAljb25uLT50cmFuc2FjdGlvbiA9IE5V
TEw7Ci0JbGlzdF9kZWwoJnRyYW5zLT5saXN0KTsKLQljb25uLT50cmFuc2Fj
dGlvbl9zdGFydGVkLS07Ci0JaWYgKCFjb25uLT50cmFuc2FjdGlvbl9zdGFy
dGVkKQotCQljb25uLT50YV9zdGFydF90aW1lID0gMDsKIAogCWNoa19xdW90
YSA9IHRyYW5zLT5ub2RlX2NyZWF0ZWQgJiYgZG9tYWluX2lzX3VucHJpdmls
ZWdlZChjb25uKTsKIApAQCAtNjQ2LDE1ICs2NDgsMTEgQEAgdm9pZCBjb25u
X2RlbGV0ZV9hbGxfdHJhbnNhY3Rpb25zKHN0cnVjdAogCXN0cnVjdCB0cmFu
c2FjdGlvbiAqdHJhbnM7CiAKIAl3aGlsZSAoKHRyYW5zID0gbGlzdF90b3Ao
JmNvbm4tPnRyYW5zYWN0aW9uX2xpc3QsCi0JCQkJIHN0cnVjdCB0cmFuc2Fj
dGlvbiwgbGlzdCkpKSB7Ci0JCWxpc3RfZGVsKCZ0cmFucy0+bGlzdCk7CisJ
CQkJIHN0cnVjdCB0cmFuc2FjdGlvbiwgbGlzdCkpKQogCQl0YWxsb2NfZnJl
ZSh0cmFucyk7Ci0JfQotCi0JYXNzZXJ0KGNvbm4tPnRyYW5zYWN0aW9uID09
IE5VTEwpOwogCiAJY29ubi0+dHJhbnNhY3Rpb25fc3RhcnRlZCA9IDA7Ci0J
Y29ubi0+dGFfc3RhcnRfdGltZSA9IDA7CisJY29ubi0+dHJhbnNhY3Rpb24g
PSBOVUxMOwogfQogCiBpbnQgY2hlY2tfdHJhbnNhY3Rpb25zKHN0cnVjdCBo
YXNodGFibGUgKmhhc2gpCg==

--=separator--

