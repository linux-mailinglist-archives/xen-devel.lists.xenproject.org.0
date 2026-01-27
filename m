Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBJuHQ+peGl9rwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 13:01:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E4593F51
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 13:01:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214320.1524781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkhkj-0008OT-H9; Tue, 27 Jan 2026 12:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214320.1524781; Tue, 27 Jan 2026 12:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkhkj-0008FY-74; Tue, 27 Jan 2026 12:01:01 +0000
Received: by outflank-mailman (input) for mailman id 1214320;
 Tue, 27 Jan 2026 12:00:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SfPo=AA=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1vkhkh-0006UG-ES
 for xen-devel@lists.xen.org; Tue, 27 Jan 2026 12:00:59 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d39415e7-fb77-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 13:00:52 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1vkhkW-006B0V-31;
 Tue, 27 Jan 2026 12:00:48 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1vkhkW-004FRp-1q;
 Tue, 27 Jan 2026 12:00:48 +0000
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
X-Inumbo-ID: d39415e7-fb77-11f0-9ccf-f158ae23cfc8
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.510 (Entity 5.510)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 479 v2 (CVE-2026-23553) - x86: incomplete
 IBPB for vCPU isolation
Message-Id: <E1vkhkW-004FRp-1q@xenbits.xenproject.org>
Date: Tue, 27 Jan 2026 12:00:48 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.49 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenbits.xenproject.org:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,xenproject.org:url];
	DMARC_NA(0.00)[xen.org];
	FORGED_RECIPIENTS(0.00)[m:xen-announce@lists.xen.org,m:xen-devel@lists.xen.org,m:xen-users@lists.xen.org,m:oss-security@lists.openwall.com,m:security-team-members@xen.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
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
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 46E4593F51
X-Rspamd-Action: no action

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-23553 / XSA-479
                               version 2

                x86: incomplete IBPB for vCPU isolation

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

In the context switch logic Xen attempts to skip an IBPB in the case of
a vCPU returning to a CPU on which it was the previous vCPU to run.
While safe for Xen's isolation between vCPUs, this prevents the guest
kernel correctly isolating between tasks.  Consider:

 1) vCPU runs on CPU A, running task 1.
 2) vCPU moves to CPU B, idle gets scheduled on A.  Xen skips IBPB.
 3) On CPU B, guest kernel switches from task 1 to 2, issuing IBPB.
 4) vCPU moves back to CPU A.  Xen skips IBPB again.

Now, task 2 is running on CPU A with task 1's training still in the BTB.

IMPACT
======

Guest processes may leverage information leaks to obtain information
intended to be private to other entities in a guest.

VULNERABLE SYSTEMS
==================

Xen versions which had the XSA-254 fixes backported are vulnerable.
Upstream, that is 4.6 and newer.

Only x86 systems are vulnerable.  Arm systems are not vulerable.

Systems vulnerable to SRSO (see XSA-434) with default settings use
IBPB-on-entry to protect against SRSO.  This is a rather more aggressive
form of flushing than only on context switch, and is believed to be
sufficient to avoid the vulnerability.

MITIGATION
==========

Using "spec-ctrl=ibpb-entry=hvm,ibpb-entry=pv" on the Xen command line
will activate the SRSO mitigation on non-SRSO-vulnerable hardware, but
it is a large overhead.

CREDITS
=======

This issue was discovered by David Kaplan of AMD.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa479.patch           xen-unstable - Xen 4.18.x

$ sha256sum xsa479*
82369898d0287e69272d0d65fb0e6be5fd0106bda19cedb3c9f6e75688f6fb4b  xsa479.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAml4qMMMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZ4TgIAIObkH7IN/btMzEbjNp2aknZ+u2hgP2zu1j00Fwa
dyEi7Bug9X73vmgzLUWjHDCmvF3uoPl01KIjfh12v7s8dERKaTTxD1fGPOKliziA
rdZQJSICVTnrNex15aLONHxkJI3oVwo2JAXChBx1a4Zx9k7M6+Kv7o9xYlnQh27N
he3fmMrxWMCtTjngDgz7YhRonIYvA92wpRVCNklUulx9+oLHXllS8IKyf1rZvNr2
k2suwC82YG/wG6/vVUxZp45BTt45UC6YtengVRcyq70o9h8y6deSof0MoSuAewj7
05Z9kXac7pvGJTMTz2dUnHeRelaVU2Ps736vQSGgyJdIJ/c=
=jCcD
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa479.patch"
Content-Disposition: attachment; filename="xsa479.patch"
Content-Transfer-Encoding: base64

RnJvbTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
ClN1YmplY3Q6IHg4Ni9zcGVjLWN0cmw6IEZpeCBpbmNvbXBsZXRlIElCUEIg
Zmx1c2hpbmcgZHVyaW5nIGNvbnRleHQgc3dpdGNoCgpUaGUgcHJldmlvdXMg
bG9naWMgYXR0ZW1wdGVkIHRvIHNraXAgYW4gSUJQQiBpbiB0aGUgY2FzZSBv
ZiB2Q1BVIHJldHVybmluZyB0bwphIENQVSBvbiB3aGljaCBpdCB3YXMgdGhl
IHByZXZpb3VzIHZDUFUgdG8gcnVuLiAgV2hpbGUgc2FmZSBmb3IgWGVuJ3MK
aXNvbGF0aW9uIGJldHdlZW4gdkNQVXMsIHRoaXMgcHJldmVudHMgdGhlIGd1
ZXN0IGtlcm5lbCBjb3JyZWN0bHkgaXNvbGF0aW9uCmJldHdlZW4gdGFza3Mu
ICBDb25zaWRlcjoKCiAxKSB2Q1BVIHJ1bnMgb24gQ1BVIEEsIHJ1bm5pbmcg
dGFzayAxLgogMikgdkNQVSBtb3ZlcyB0byBDUFUgQiwgaWRsZSBnZXRzIHNj
aGVkdWxlZCBvbiBBLiAgWGVuIHNraXBzIElCUEIuCiAzKSBPbiBDUFUgQiwg
Z3Vlc3Qga2VybmVsIHN3aXRjaGVzIGZyb20gdGFzayAxIHRvIDIsIGlzc3Vp
bmcgSUJQQi4KIDQpIHZDUFUgbW92ZXMgYmFjayB0byBDUFUgQS4gIFhlbiBz
a2lwcyBJQlBCIGFnYWluLgoKTm93LCB0YXNrIDIgaXMgcnVubmluZyBvbiBD
UFUgQSB3aXRoIHRhc2sgMSdzIHRyYWluaW5nIHN0aWxsIGluIHRoZSBCVEIu
CgpEbyB0aGUgZmx1c2ggdW5jb25kaXRpb25hbGx5IHdoZW4gc3dpdGNoaW5n
IHRvIGEgdkNQVSBkaWZmZXJlbnQgdGhhbiB0aGUKaWRsZSBvbmUuICBOb3Rl
IHRoZXJlJ3Mgbm8gbmVlZCB0byBleHBsaWNpdGx5IGdhdGUgdGhlIElCUEIg
dG8gbmV4dCBkb21haW4KIT0gaWRsZSwgYXMgdGhlIGNvbnRleHQgd2hlcmUg
dGhlIElCUEIgaXMgaXNzdWVkIGlzIHN1YmplY3QgdG8gdGhhdApjb25kaXRp
b24gYWxyZWFkeSB1bmxlc3MgdGhlIHBDUFUgaXMgZ29pbmcgb2ZmbGluZSwg
YXQgd2hpY2ggcG9pbnQgd2UgZG9uJ3QKcmVhbGx5IGNhcmUgdG8gaXNzdWUg
YW4gZXh0cmEgSUJQQi4KCkFsc28gYWRkIGEgY29tbWVudCB3aXRoIHRoZSBy
ZWFzb25pbmcgd2h5IHRoZSBJQlBCIG5lZWRzIHRvIGJlIGluCmNvbnRleHRf
c3dpdGNoKCkgcmF0aGVyIHRoYW4gX19jb250ZXh0X3N3aXRjaCgpLgoKVGhp
cyBpcyBYU0EtNDc5IC8gQ1ZFLTIwMjYtMjM1NTMuCgpGaXhlczogYTJlZDY0
M2VkNzgzICgieDg2L2N0eHQ6IElzc3VlIGEgc3BlY3VsYXRpb24gYmFycmll
ciBiZXR3ZWVuIHZjcHUgY29udGV4dHMiKQpSZXBvcnRlZC1ieTogRGF2aWQg
S2FwbGFuIDxkYXZpZC5rYXBsYW5AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+ClJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQog
eGVuL2FyY2gveDg2L2RvbWFpbi5jIHwgMzYgKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCAyNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvZG9tYWluLmMgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKaW5kZXgg
YzI5YTZiMGRlY2VlLi5jMWVkZWQzZWI2MDQgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9kb21haW4uYworKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMK
QEAgLTIxNzQsMzMgKzIxNzQsMTUgQEAgdm9pZCBjb250ZXh0X3N3aXRjaChz
dHJ1Y3QgdmNwdSAqcHJldiwgc3RydWN0IHZjcHUgKm5leHQpCiAKICAgICAg
ICAgY3R4dF9zd2l0Y2hfbGV2ZWxsaW5nKG5leHQpOwogCi0gICAgICAgIGlm
ICggb3B0X2licGJfY3R4dF9zd2l0Y2ggJiYgIWlzX2lkbGVfZG9tYWluKG5l
eHRkKSApCi0gICAgICAgIHsKLSAgICAgICAgICAgIHN0YXRpYyBERUZJTkVf
UEVSX0NQVSh1bnNpZ25lZCBpbnQsIGxhc3QpOwotICAgICAgICAgICAgdW5z
aWduZWQgaW50ICpsYXN0X2lkID0gJnRoaXNfY3B1KGxhc3QpOwotCi0gICAg
ICAgICAgICAvKgotICAgICAgICAgICAgICogU3F1YXNoIHRoZSBkb21pZCBh
bmQgdmNwdSBpZCB0b2dldGhlciBmb3IgY29tcGFyaXNvbgotICAgICAgICAg
ICAgICogZWZmaWNpZW5jeS4gIFdlIGNvdWxkIGluIHByaW5jaXBsZSBzdGFz
aCBhbmQgY29tcGFyZSB0aGUgc3RydWN0Ci0gICAgICAgICAgICAgKiB2Y3B1
IHBvaW50ZXIsIGJ1dCB0aGlzIHJpc2tzIGEgZmFsc2UgYWxpYXMgaWYgYSBk
b21haW4gaGFzIGRpZWQKLSAgICAgICAgICAgICAqIGFuZCB0aGUgc2FtZSA0
ayBwYWdlIGdldHMgcmV1c2VkIGZvciBhIG5ldyB2Y3B1LgotICAgICAgICAg
ICAgICovCi0gICAgICAgICAgICB1bnNpZ25lZCBpbnQgbmV4dF9pZCA9ICgo
KHVuc2lnbmVkIGludCluZXh0ZC0+ZG9tYWluX2lkIDw8IDE2KSB8Ci0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodWludDE2X3QpbmV4
dC0+dmNwdV9pZCk7Ci0gICAgICAgICAgICBCVUlMRF9CVUdfT04oTUFYX1ZJ
UlRfQ1BVUyA+IDB4ZmZmZik7Ci0KLSAgICAgICAgICAgIC8qCi0gICAgICAg
ICAgICAgKiBXaGVuIHNjaGVkdWxpbmcgZnJvbSBhIHZjcHUsIHRvIGlkbGUs
IGFuZCBiYWNrIHRvIHRoZSBzYW1lIHZjcHUKLSAgICAgICAgICAgICAqICh3
aGljaCBtaWdodCBiZSBjb21tb24gaW4gYSBsaWdodGx5IGxvYWRlZCBzeXN0
ZW0sIG9yIHdoZW4KLSAgICAgICAgICAgICAqIHVzaW5nIHZjcHUgcGlubmlu
ZyksIHRoZXJlIGlzIG5vIG5lZWQgdG8gaXNzdWUgSUJQQiwgYXMgd2UgYXJl
Ci0gICAgICAgICAgICAgKiByZXR1cm5pbmcgdG8gdGhlIHNhbWUgc2VjdXJp
dHkgY29udGV4dC4KLSAgICAgICAgICAgICAqLwotICAgICAgICAgICAgaWYg
KCAqbGFzdF9pZCAhPSBuZXh0X2lkICkKLSAgICAgICAgICAgIHsKLSAgICAg
ICAgICAgICAgICBzcGVjX2N0cmxfbmV3X2d1ZXN0X2NvbnRleHQoKTsKLSAg
ICAgICAgICAgICAgICAqbGFzdF9pZCA9IG5leHRfaWQ7Ci0gICAgICAgICAg
ICB9Ci0gICAgICAgIH0KKyAgICAgICAgLyoKKyAgICAgICAgICogSXNzdWUg
YW4gSUJQQiB3aGVuIHNjaGVkdWxpbmcgYSBkaWZmZXJlbnQgdkNQVSBpZiBy
ZXF1aXJlZC4KKyAgICAgICAgICoKKyAgICAgICAgICogSUJQQiBjbGVhcnMg
dGhlIFJTQi9SQVMvUkFQLCBidXQgdGhhdCdzIGZpbmUgYXMgd2UgbGVhdmUg
dGhpcworICAgICAgICAgKiBmdW5jdGlvbiB2aWEgcmVzZXRfc3RhY2tfYW5k
X2NhbGxfaW5kKCkgcmF0aGVyIHRoYW4gdmlhIGEgUkVUCisgICAgICAgICAq
IGluc3RydWN0aW9uLgorICAgICAgICAgKi8KKyAgICAgICAgaWYgKCBvcHRf
aWJwYl9jdHh0X3N3aXRjaCApCisgICAgICAgICAgICBzcGVjX2N0cmxfbmV3
X2d1ZXN0X2NvbnRleHQoKTsKIAogICAgICAgICAvKiBVcGRhdGUgdGhlIHRv
cC1vZi1zdGFjayBibG9jayB3aXRoIHRoZSBuZXcgc3BlY3VsYXRpb24gc2V0
dGluZ3MuICovCiAgICAgICAgIGluZm8tPnNjZiA9Cg==

--=separator--

