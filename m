Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KQjXIQ+peGnJrwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 13:01:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DED93F4F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 13:01:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214316.1524732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkhkf-0007DW-Q5; Tue, 27 Jan 2026 12:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214316.1524732; Tue, 27 Jan 2026 12:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkhkf-0007C5-Jx; Tue, 27 Jan 2026 12:00:57 +0000
Received: by outflank-mailman (input) for mailman id 1214316;
 Tue, 27 Jan 2026 12:00:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SfPo=AA=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1vkhkd-0006UG-Dp
 for xen-devel@lists.xen.org; Tue, 27 Jan 2026 12:00:55 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d038a54a-fb77-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 13:00:49 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1vkhkP-006Azr-0a;
 Tue, 27 Jan 2026 12:00:40 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1vkhkO-004FP2-2a;
 Tue, 27 Jan 2026 12:00:40 +0000
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
X-Inumbo-ID: d038a54a-fb77-11f0-9ccf-f158ae23cfc8
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.510 (Entity 5.510)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 477 v2 (CVE-2025-58150) - x86: buffer
 overrun with shadow paging + tracing
Message-Id: <E1vkhkO-004FP2-2a@xenbits.xenproject.org>
Date: Tue, 27 Jan 2026 12:00:40 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.49 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenbits.xenproject.org:mid,xenproject.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-announce@lists.xen.org,m:xen-devel@lists.xen.org,m:xen-users@lists.xen.org,m:oss-security@lists.openwall.com,m:security-team-members@xen.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:~,3:~];
	DMARC_NA(0.00)[xen.org];
	FORGED_SENDER(0.00)[security@xen.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[security@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 27DED93F4F
X-Rspamd-Action: no action

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2025-58150 / XSA-477
                               version 2

           x86: buffer overrun with shadow paging + tracing

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

Shadow mode tracing code uses a set of per-CPU variables to avoid
cumbersome parameter passing.  Some of these variables are written to
with guest controlled data, of guest controllable size.  That size can
be larger than the variable, and bounding of the writes was missing.

IMPACT
======

The exact effects depend on what's adjacent to the variables in
question.  The most likely effects are bogus trace data, but none of
privilege escalation, information leaks, or Denial of Service (DoS) can
be excluded without detailed analysis of the particular build of Xen.

VULNERABLE SYSTEMS
==================

Only x86 systems are vulnerable.  Arm systems are not vulnerable.

Only HVM guests running in shadow paging mode and with tracing enabled
can leverage the vulnerability.

MITIGATION
==========

Running HVM guests in HAP mode only will avoid the vulnerability.

Not enabling tracing will also avoid the vulnerability.  Tracing is
enabled by the "tbuf_size=" command line option, or by running tools
like xentrace or xenbaked in Dom0.  Note that on a running system
stopping xentrace / xenbaked would disable tracing.  For xentrace,
however, this additionally requires that it wasn't started with the -x
option.  Stopping previously enabled tracing can of course only prevent
future damage; prior damage may have occurred and may manifest only
later.

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

xsa477.patch           xen-unstable - Xen 4.19.x
xsa477-4.18.patch      Xen 4.18.x

$ sha256sum xsa477*
025783441d7db846e717a1e48547b0db7a36fcc6af652b688524c684f0c3d2a7  xsa477.patch
194da830e15195873456b145a8df83af43aaae7a82fa6cb6852928d75c68909c  xsa477-4.18.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAml4qLYMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZ+IkH/jgVtAAifglnIrxstdAUXMritwnXvcrIJaKjG7yj
8980GavdbttObFRL+d2XvPXAQLRWCbgMNgNFA9s/6EhH2cCMF9mmeYxxU9zqG9qi
MQyfp1v/UpNrvD4hdHIXhohMELF6IdXQkrRvnB0hJwSPsDEzMZyofTOKppmSqSE1
tIdFXD1R845KTl9eG1lX4uwr2KhAjAgk4DrpIvxmtkiz3yF8kznjAGDSA7luKkTU
XBSlBe9u/9Yg5cspQrh7tVQ0K+6wDR6f4bCq26P/VCDUjwRIzHDhdP+RzKaumLGn
nTU0aAuIBlXYCa+8HB5c9vf/yLldKflYZ4Qmb3jGD4GYZrQ=
=nlvD
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa477.patch"
Content-Disposition: attachment; filename="xsa477.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODYvc2hhZG93OiBkb24ndCBvdmVycnVuIHRyYWNlX2VtdWxfd3JpdGVf
dmFsCgpHdWVzdHMgY2FuIGRvIHdpZGVyLXRoYW4tUFRFLXNpemUgd3JpdGVz
IG9uIHBhZ2UgdGFibGVzLiBUaGUgdHJhY2luZwpoZWxwZXIgdmFyaWFibGUs
IGhvd2V2ZXIsIG9ubHkgb2ZmZXJzIHNwYWNlIGZvciBhIHNpbmdsZSBQVEUg
KGFuZCBpdCBpcwpiZWluZyBzd2l0Y2hlZCB0byB0aGUgbW9yZSBjb3JyZWN0
IHR5cGUgcmlnaHQgaGVyZSkuIFRoZXJlZm9yZSBib3VuZAppbmNvbWluZyB3
cml0ZSBzaXplcyB0byB0aGUgYW1vdW50IG9mIHNwYWNlIGF2YWlsYWJsZS4K
ClRvIG5vdCBsZWF2ZSBkZWFkIGNvZGUgKHdoaWNoIGlzIGEgTWlzcmEgY29u
Y2VybiksIGRyb3AgdGhlIG5vdyB1bnVzZWQKZ3Vlc3RfcGFfdCBhcyB3ZWxs
LgoKQWxzbyBtb3ZlIGFuZCBhZGp1c3QgR1VFU1RfUFRFX1NJWkU6IERlcml2
ZSBpdCByYXRoZXIgdGhhbiB1c2luZyBoYXJkLQpjb2RlZCBudW1iZXJzLCBh
bmQgcHV0IGl0IGluIHRoZSBzb2xlIHNvdXJjZSBmaWxlIHdoZXJlIGl0J3Mg
YWN0dWFsbHkKbmVlZGVkLiBUaGlzIHRoZW4gYWxzbyBhZGRyZXNzZXMgYSBN
aXNyYSBydWxlIDIwLjkgKCJBbGwgaWRlbnRpZmllcnMKdXNlZCBpbiB0aGUg
Y29udHJvbGxpbmcgZXhwcmVzc2lvbiBvZiAjaWYgb3IgI2VsaWYgcHJlcHJv
Y2Vzc2luZwpkaXJlY3RpdmVzIHNoYWxsIGJlICNkZWZpbmUnZCBiZWZvcmUg
ZXZhbHVhdGlvbiIpIHZpb2xhdGlvbjoKR1VFU1RfUEFHSU5HX0xFVkVMUyBp
cyAjZGVmaW5lJ2Qgb25seSBpbiBtdWx0aS5jLgoKVGhpcyBpcyBYU0EtNDc3
IC8gQ1ZFLTIwMjUtNTgxNTAuCgpGaXhlczogOWE4NmFjMWFhM2QyICgieGVu
dHJhY2UgNS83OiBBZGRpdGlvbmFsIHRyYWNpbmcgZm9yIHRoZSBzaGFkb3cg
Y29kZSIpClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvbW0vc2hh
ZG93L211bHRpLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9tdWx0
aS5jCkBAIC0xOTcwLDE1ICsxOTcwLDE1IEBAIHN0YXRpYyB2b2lkIHNoX3By
ZWZldGNoKHN0cnVjdCB2Y3B1ICp2LAogCiAjaWYgR1VFU1RfUEFHSU5HX0xF
VkVMUyA9PSA0CiB0eXBlZGVmIHU2NCBndWVzdF92YV90OwotdHlwZWRlZiB1
NjQgZ3Vlc3RfcGFfdDsKICNlbGlmIEdVRVNUX1BBR0lOR19MRVZFTFMgPT0g
MwogdHlwZWRlZiB1MzIgZ3Vlc3RfdmFfdDsKLXR5cGVkZWYgdTY0IGd1ZXN0
X3BhX3Q7CiAjZWxzZQogdHlwZWRlZiB1MzIgZ3Vlc3RfdmFfdDsKLXR5cGVk
ZWYgdTMyIGd1ZXN0X3BhX3Q7CiAjZW5kaWYKIAorLyogU2l6ZSAoaW4gYnl0
ZXMpIG9mIGEgZ3Vlc3QgUFRFICovCisjZGVmaW5lIEdVRVNUX1BURV9TSVpF
IHNpemVvZihndWVzdF9sMWVfdCkKKwogLyogU2hhZG93IHRyYWNlIGV2ZW50
IHdpdGggR1VFU1RfUEFHSU5HX0xFVkVMUyBmb2xkZWQgaW50byB0aGUgZXZl
bnQgZmllbGQuICovCiBzdGF0aWMgdm9pZCBzaF90cmFjZSh1aW50MzJfdCBl
dmVudCwgdW5zaWduZWQgaW50IGV4dHJhLCBjb25zdCB2b2lkICpleHRyYV9k
YXRhKQogewpAQCAtMjA0OCwxMSArMjA0OCwxNCBAQCBzdGF0aWMgdm9pZCBf
X21heWJlX3VudXNlZCBzaF90cmFjZV9nZm5fCiBzdGF0aWMgREVGSU5FX1BF
Ul9DUFUoZ3Vlc3RfdmFfdCx0cmFjZV9lbXVsYXRlX2luaXRpYWxfdmEpOwog
c3RhdGljIERFRklORV9QRVJfQ1BVKGludCx0cmFjZV9leHRyYV9lbXVsYXRp
b25fY291bnQpOwogI2VuZGlmCi1zdGF0aWMgREVGSU5FX1BFUl9DUFUoZ3Vl
c3RfcGFfdCx0cmFjZV9lbXVsYXRlX3dyaXRlX3ZhbCk7CitzdGF0aWMgREVG
SU5FX1BFUl9DUFUoZ3Vlc3RfbDFlX3QsIHRyYWNlX2VtdWxhdGVfd3JpdGVf
dmFsKTsKIAogc3RhdGljIHZvaWQgY2ZfY2hlY2sgdHJhY2VfZW11bGF0ZV93
cml0ZV92YWwoCiAgICAgY29uc3Qgdm9pZCAqcHRyLCB1bnNpZ25lZCBsb25n
IHZhZGRyLCBjb25zdCB2b2lkICpzcmMsIHVuc2lnbmVkIGludCBieXRlcykK
IHsKKyAgICBpZiAoIGJ5dGVzID4gc2l6ZW9mKHRoaXNfY3B1KHRyYWNlX2Vt
dWxhdGVfd3JpdGVfdmFsKSkgKQorICAgICAgICBieXRlcyA9IHNpemVvZih0
aGlzX2NwdSh0cmFjZV9lbXVsYXRlX3dyaXRlX3ZhbCkpOworCiAjaWYgR1VF
U1RfUEFHSU5HX0xFVkVMUyA9PSAzCiAgICAgaWYgKCB2YWRkciA9PSB0aGlz
X2NwdSh0cmFjZV9lbXVsYXRlX2luaXRpYWxfdmEpICkKICAgICAgICAgbWVt
Y3B5KCZ0aGlzX2NwdSh0cmFjZV9lbXVsYXRlX3dyaXRlX3ZhbCksIHNyYywg
Ynl0ZXMpOwpAQCAtMjA3NywxMyArMjA4MCwxNiBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgc2hfdHJhY2VfZW11bGF0ZShndWVzCiAgICAgICAgICAgICAvKgog
ICAgICAgICAgICAgICogRm9yIEdVRVNUX1BBR0lOR19MRVZFTFM9MyAoUEFF
IHBhZ2luZyksIGd1ZXN0X2wxZSBpcyA2NCB3aGlsZQogICAgICAgICAgICAg
ICogZ3Vlc3RfdmEgaXMgMzIuICBQdXQgaXQgZmlyc3QgdG8gYXZvaWQgcGFk
ZGluZy4KKyAgICAgICAgICAgICAqCisgICAgICAgICAgICAgKiBOb3RlOiAu
d3JpdGVfdmFsIGlzIGFuIGFyYml0cmFyeSBzZXQgb2Ygd3JpdHRlbiBieXRl
cywgcG9zc2libHkKKyAgICAgICAgICAgICAqIG1pc2FsaWduZWQgYW5kIHBv
c3NpYmx5IHNwYW5uaW5nIHRoZSBuZXh0IGdsMWUuCiAgICAgICAgICAgICAg
Ki8KICAgICAgICAgICAgIGd1ZXN0X2wxZV90IGdsMWUsIHdyaXRlX3ZhbDsK
ICAgICAgICAgICAgIGd1ZXN0X3ZhX3QgdmE7CiAgICAgICAgICAgICB1aW50
MzJfdCBmbGFnczoyOSwgZW11bGF0aW9uX2NvdW50OjM7CiAgICAgICAgIH0g
ZCA9IHsKICAgICAgICAgICAgIC5nbDFlICAgICAgICAgICAgPSBnbDFlLAot
ICAgICAgICAgICAgLndyaXRlX3ZhbC5sMSAgICA9IHRoaXNfY3B1KHRyYWNl
X2VtdWxhdGVfd3JpdGVfdmFsKSwKKyAgICAgICAgICAgIC53cml0ZV92YWwg
ICAgICAgPSB0aGlzX2NwdSh0cmFjZV9lbXVsYXRlX3dyaXRlX3ZhbCksCiAg
ICAgICAgICAgICAudmEgICAgICAgICAgICAgID0gdmEsCiAjaWYgR1VFU1Rf
UEFHSU5HX0xFVkVMUyA9PSAzCiAgICAgICAgICAgICAuZW11bGF0aW9uX2Nv
dW50ID0gdGhpc19jcHUodHJhY2VfZXh0cmFfZW11bGF0aW9uX2NvdW50KSwK
QEAgLTI2NzIsNyArMjY3Nyw3IEBAIHN0YXRpYyBpbnQgY2ZfY2hlY2sgc2hf
cGFnZV9mYXVsdCgKICAgICBwYWdpbmdfdW5sb2NrKGQpOwogICAgIHB1dF9n
Zm4oZCwgZ2ZuX3goZ2ZuKSk7CiAKLSAgICB0aGlzX2NwdSh0cmFjZV9lbXVs
YXRlX3dyaXRlX3ZhbCkgPSAwOworICAgIHRoaXNfY3B1KHRyYWNlX2VtdWxh
dGVfd3JpdGVfdmFsKSA9IChndWVzdF9sMWVfdCl7fTsKIAogI2lmIFNIQURP
V19PUFRJTUlaQVRJT05TICYgU0hPUFRfRkFTVF9FTVVMQVRJT04KICBlYXJs
eV9lbXVsYXRpb246Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvcHJp
dmF0ZS5oCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvcHJpdmF0ZS5o
CkBAIC0xMjAsMTQgKzEyMCw2IEBAIGVudW0gewogICAgIFRSQ0VfU0ZMQUdf
T09TX0ZJWFVQX0VWSUNULAogfTsKIAotCi0vKiBTaXplIChpbiBieXRlcykg
b2YgYSBndWVzdCBQVEUgKi8KLSNpZiBHVUVTVF9QQUdJTkdfTEVWRUxTID49
IDMKLSMgZGVmaW5lIEdVRVNUX1BURV9TSVpFIDgKLSNlbHNlCi0jIGRlZmlu
ZSBHVUVTVF9QVEVfU0laRSA0Ci0jZW5kaWYKLQogLyoqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKgogICogQXVkaXRpbmcgcm91dGluZXMKICAq
Lwo=

--=separator
Content-Type: application/octet-stream; name="xsa477-4.18.patch"
Content-Disposition: attachment; filename="xsa477-4.18.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODYvc2hhZG93OiBkb24ndCBvdmVycnVuIHRyYWNlX2VtdWxfd3JpdGVf
dmFsCgpHdWVzdHMgY2FuIGRvIHdpZGVyLXRoYW4tUFRFLXNpemUgd3JpdGVz
IG9uIHBhZ2UgdGFibGVzLiBUaGUgdHJhY2luZwpoZWxwZXIgdmFyaWFibGUs
IGhvd2V2ZXIsIG9ubHkgb2ZmZXJzIHNwYWNlIGZvciBhIHNpbmdsZSBQVEUg
KGFuZCBpdCBpcwpiZWluZyBzd2l0Y2hlZCB0byB0aGUgbW9yZSBjb3JyZWN0
IHR5cGUgcmlnaHQgaGVyZSkuIFRoZXJlZm9yZSBib3VuZAppbmNvbWluZyB3
cml0ZSBzaXplcyB0byB0aGUgYW1vdW50IG9mIHNwYWNlIGF2YWlsYWJsZS4K
ClRvIG5vdCBsZWF2ZSBkZWFkIGNvZGUgKHdoaWNoIGlzIGEgTWlzcmEgY29u
Y2VybiksIGRyb3AgdGhlIG5vdyB1bnVzZWQKZ3Vlc3RfcGFfdCBhcyB3ZWxs
LgoKQWxzbyBtb3ZlIGFuZCBhZGp1c3QgR1VFU1RfUFRFX1NJWkU6IERlcml2
ZSBpdCByYXRoZXIgdGhhbiB1c2luZyBoYXJkLQpjb2RlZCBudW1iZXJzLCBh
bmQgcHV0IGl0IGluIHRoZSBzb2xlIHNvdXJjZSBmaWxlIHdoZXJlIGl0J3Mg
YWN0dWFsbHkKbmVlZGVkLiBUaGlzIHRoZW4gYWxzbyBhZGRyZXNzZXMgYSBN
aXNyYSBydWxlIDIwLjkgKCJBbGwgaWRlbnRpZmllcnMKdXNlZCBpbiB0aGUg
Y29udHJvbGxpbmcgZXhwcmVzc2lvbiBvZiAjaWYgb3IgI2VsaWYgcHJlcHJv
Y2Vzc2luZwpkaXJlY3RpdmVzIHNoYWxsIGJlICNkZWZpbmUnZCBiZWZvcmUg
ZXZhbHVhdGlvbiIpIHZpb2xhdGlvbjoKR1VFU1RfUEFHSU5HX0xFVkVMUyBp
cyAjZGVmaW5lJ2Qgb25seSBpbiBtdWx0aS5jLgoKVGhpcyBpcyBYU0EtNDc3
IC8gQ1ZFLTIwMjUtNTgxNTAuCgpGaXhlczogOWE4NmFjMWFhM2QyICgieGVu
dHJhY2UgNS83OiBBZGRpdGlvbmFsIHRyYWNpbmcgZm9yIHRoZSBzaGFkb3cg
Y29kZSIpClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvbW0vc2hh
ZG93L211bHRpLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9tdWx0
aS5jCkBAIC0xOTY1LDE1ICsxOTY1LDE1IEBAIHN0YXRpYyB2b2lkIHNoX3By
ZWZldGNoKHN0cnVjdCB2Y3B1ICp2LAogCiAjaWYgR1VFU1RfUEFHSU5HX0xF
VkVMUyA9PSA0CiB0eXBlZGVmIHU2NCBndWVzdF92YV90OwotdHlwZWRlZiB1
NjQgZ3Vlc3RfcGFfdDsKICNlbGlmIEdVRVNUX1BBR0lOR19MRVZFTFMgPT0g
MwogdHlwZWRlZiB1MzIgZ3Vlc3RfdmFfdDsKLXR5cGVkZWYgdTY0IGd1ZXN0
X3BhX3Q7CiAjZWxzZQogdHlwZWRlZiB1MzIgZ3Vlc3RfdmFfdDsKLXR5cGVk
ZWYgdTMyIGd1ZXN0X3BhX3Q7CiAjZW5kaWYKIAorLyogU2l6ZSAoaW4gYnl0
ZXMpIG9mIGEgZ3Vlc3QgUFRFICovCisjZGVmaW5lIEdVRVNUX1BURV9TSVpF
IHNpemVvZihndWVzdF9sMWVfdCkKKwogc3RhdGljIGlubGluZSB2b2lkIHRy
YWNlX3NoYWRvd19nZW4odTMyIGV2ZW50LCBndWVzdF92YV90IHZhKQogewog
ICAgIGlmICggdGJfaW5pdF9kb25lICkKQEAgLTIwNjIsMTEgKzIwNjIsMTQg
QEAgc3RhdGljIGlubGluZSB2b2lkIHRyYWNlX3NoYWRvd19lbXVsYXRlXwog
c3RhdGljIERFRklORV9QRVJfQ1BVKGd1ZXN0X3ZhX3QsdHJhY2VfZW11bGF0
ZV9pbml0aWFsX3ZhKTsKIHN0YXRpYyBERUZJTkVfUEVSX0NQVShpbnQsdHJh
Y2VfZXh0cmFfZW11bGF0aW9uX2NvdW50KTsKICNlbmRpZgotc3RhdGljIERF
RklORV9QRVJfQ1BVKGd1ZXN0X3BhX3QsdHJhY2VfZW11bGF0ZV93cml0ZV92
YWwpOworc3RhdGljIERFRklORV9QRVJfQ1BVKGd1ZXN0X2wxZV90LCB0cmFj
ZV9lbXVsYXRlX3dyaXRlX3ZhbCk7CiAKIHN0YXRpYyB2b2lkIGNmX2NoZWNr
IHRyYWNlX2VtdWxhdGVfd3JpdGVfdmFsKAogICAgIGNvbnN0IHZvaWQgKnB0
ciwgdW5zaWduZWQgbG9uZyB2YWRkciwgY29uc3Qgdm9pZCAqc3JjLCB1bnNp
Z25lZCBpbnQgYnl0ZXMpCiB7CisgICAgaWYgKCBieXRlcyA+IHNpemVvZih0
aGlzX2NwdSh0cmFjZV9lbXVsYXRlX3dyaXRlX3ZhbCkpICkKKyAgICAgICAg
Ynl0ZXMgPSBzaXplb2YodGhpc19jcHUodHJhY2VfZW11bGF0ZV93cml0ZV92
YWwpKTsKKwogI2lmIEdVRVNUX1BBR0lOR19MRVZFTFMgPT0gMwogICAgIGlm
ICggdmFkZHIgPT0gdGhpc19jcHUodHJhY2VfZW11bGF0ZV9pbml0aWFsX3Zh
KSApCiAgICAgICAgIG1lbWNweSgmdGhpc19jcHUodHJhY2VfZW11bGF0ZV93
cml0ZV92YWwpLCBzcmMsIGJ5dGVzKTsKQEAgLTIwODgsOCArMjA5MSwxMyBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgdHJhY2Vfc2hhZG93X2VtdWxhdGUoCiAg
ICAgaWYgKCB0Yl9pbml0X2RvbmUgKQogICAgIHsKICAgICAgICAgc3RydWN0
IF9fcGFja2VkIHsKLSAgICAgICAgICAgIC8qIGZvciBQQUUsIGd1ZXN0X2wx
ZSBtYXkgYmUgNjQgd2hpbGUgZ3Vlc3RfdmEgbWF5IGJlIDMyOwotICAgICAg
ICAgICAgICAgc28gcHV0IGl0IGZpcnN0IGZvciBhbGlnbm1lbnQgc2FrZS4g
Ki8KKyAgICAgICAgICAgIC8qCisgICAgICAgICAgICAgKiBGb3IgR1VFU1Rf
UEFHSU5HX0xFVkVMUz0zIChQQUUgcGFnaW5nKSwgZ3Vlc3RfbDFlIGlzIDY0
IHdoaWxlCisgICAgICAgICAgICAgKiBndWVzdF92YSBpcyAzMi4gIFB1dCBp
dCBmaXJzdCB0byBhdm9pZCBwYWRkaW5nLgorICAgICAgICAgICAgICoKKyAg
ICAgICAgICAgICAqIE5vdGU6IC53cml0ZV92YWwgaXMgYW4gYXJiaXRyYXJ5
IHNldCBvZiB3cml0dGVuIGJ5dGVzLCBwb3NzaWJseQorICAgICAgICAgICAg
ICogbWlzYWxpZ25lZCBhbmQgcG9zc2libHkgc3Bhbm5pbmcgdGhlIG5leHQg
Z2wxZS4KKyAgICAgICAgICAgICAqLwogICAgICAgICAgICAgZ3Vlc3RfbDFl
X3QgZ2wxZSwgd3JpdGVfdmFsOwogICAgICAgICAgICAgZ3Vlc3RfdmFfdCB2
YTsKICAgICAgICAgICAgIHVpbnQzMl90IGZsYWdzOjI5LCBlbXVsYXRpb25f
Y291bnQ6MzsKQEAgLTIwOTksNyArMjEwNyw3IEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCB0cmFjZV9zaGFkb3dfZW11bGF0ZSgKICAgICAgICAgZXZlbnQgPSBU
UkNfU0hBRE9XX0VNVUxBVEUgfCAoKEdVRVNUX1BBR0lOR19MRVZFTFMtMik8
PDgpOwogCiAgICAgICAgIGQuZ2wxZSA9IGdsMWU7Ci0gICAgICAgIGQud3Jp
dGVfdmFsLmwxID0gdGhpc19jcHUodHJhY2VfZW11bGF0ZV93cml0ZV92YWwp
OworICAgICAgICBkLndyaXRlX3ZhbCA9IHRoaXNfY3B1KHRyYWNlX2VtdWxh
dGVfd3JpdGVfdmFsKTsKICAgICAgICAgZC52YSA9IHZhOwogI2lmIEdVRVNU
X1BBR0lOR19MRVZFTFMgPT0gMwogICAgICAgICBkLmVtdWxhdGlvbl9jb3Vu
dCA9IHRoaXNfY3B1KHRyYWNlX2V4dHJhX2VtdWxhdGlvbl9jb3VudCk7CkBA
IC0yNjgwLDcgKzI2ODgsNyBAQCBzdGF0aWMgaW50IGNmX2NoZWNrIHNoX3Bh
Z2VfZmF1bHQoCiAgICAgcGFnaW5nX3VubG9jayhkKTsKICAgICBwdXRfZ2Zu
KGQsIGdmbl94KGdmbikpOwogCi0gICAgdGhpc19jcHUodHJhY2VfZW11bGF0
ZV93cml0ZV92YWwpID0gMDsKKyAgICB0aGlzX2NwdSh0cmFjZV9lbXVsYXRl
X3dyaXRlX3ZhbCkgPSAoZ3Vlc3RfbDFlX3Qpe307CiAKICNpZiBTSEFET1df
T1BUSU1JWkFUSU9OUyAmIFNIT1BUX0ZBU1RfRU1VTEFUSU9OCiAgZWFybHlf
ZW11bGF0aW9uOgotLS0gYS94ZW4vYXJjaC94ODYvbW0vc2hhZG93L3ByaXZh
dGUuaAorKysgYi94ZW4vYXJjaC94ODYvbW0vc2hhZG93L3ByaXZhdGUuaApA
QCAtMTIwLDE0ICsxMjAsNiBAQCBlbnVtIHsKICAgICBUUkNFX1NGTEFHX09P
U19GSVhVUF9FVklDVCwKIH07CiAKLQotLyogU2l6ZSAoaW4gYnl0ZXMpIG9m
IGEgZ3Vlc3QgUFRFICovCi0jaWYgR1VFU1RfUEFHSU5HX0xFVkVMUyA+PSAz
Ci0jIGRlZmluZSBHVUVTVF9QVEVfU0laRSA4Ci0jZWxzZQotIyBkZWZpbmUg
R1VFU1RfUFRFX1NJWkUgNAotI2VuZGlmCi0KIC8qKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioKICAqIEF1ZGl0aW5nIHJvdXRpbmVzCiAgKi8K

--=separator--

