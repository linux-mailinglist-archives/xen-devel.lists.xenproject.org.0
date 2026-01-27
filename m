Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIQdGg+peGl9rwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 13:01:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 009CD93F50
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 13:01:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214319.1524761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkhkh-0007qG-Tx; Tue, 27 Jan 2026 12:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214319.1524761; Tue, 27 Jan 2026 12:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkhkh-0007kD-OU; Tue, 27 Jan 2026 12:00:59 +0000
Received: by outflank-mailman (input) for mailman id 1214319;
 Tue, 27 Jan 2026 12:00:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SfPo=AA=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1vkhkg-0006UG-EM
 for xen-devel@lists.xen.org; Tue, 27 Jan 2026 12:00:58 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d24a3a2c-fb77-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 13:00:50 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1vkhkT-006B0B-2X;
 Tue, 27 Jan 2026 12:00:45 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1vkhkT-004FQb-1J;
 Tue, 27 Jan 2026 12:00:45 +0000
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
X-Inumbo-ID: d24a3a2c-fb77-11f0-9ccf-f158ae23cfc8
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.510 (Entity 5.510)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 478 v2 (CVE-2025-58151) - varstored: TOCTOU
 issues with mapped guest memory
Message-Id: <E1vkhkT-004FQb-1J@xenbits.xenproject.org>
Date: Tue, 27 Jan 2026 12:00:45 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.49 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenbits.xenproject.org:mid,xenproject.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	DMARC_NA(0.00)[xen.org];
	FORGED_RECIPIENTS(0.00)[m:xen-announce@lists.xen.org,m:xen-devel@lists.xen.org,m:xen-users@lists.xen.org,m:oss-security@lists.openwall.com,m:security-team-members@xen.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[security@xen.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 009CD93F50
X-Rspamd-Action: no action

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2025-58151 / XSA-478
                               version 2

           varstored: TOCTOU issues with mapped guest memory

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

varstored is a component of the Xapi toolstack handling UEFI Variables
for a VM.  It has a communication path with OVMF inside the VM involving
mapping a buffer prepared by OVMF.

Within varstored, there were insufficient compiler barriers, creating
TOCTOU issues with data in the shared buffer.

The exact vulnerable behaviour depends on the code generated by the
compiler.  In a build of varstored using default settings, the attacker
can control an index used in a jump table.

IMPACT
======

An attacker with kernel level access in a VM can escalate privilege via
gaining code execution within varstored.

VULNERABLE SYSTEMS
==================

Only systems using the Xapi toolstack are potentially affected.

Systems running all versions of varstored are potentially affected.

x86 HVM guests which have been configured as UEFI VMs can leverage the
vulnerability.  x86 PV guests cannot leverage the vulnerability.

A Xapi VM is configured for UEFI if the `HVM-boot-params` map contains
`firmware=uefi`.  e.g.:

  xe vm-param-list uuid=$UUID

  ...
  HVM-boot-params (MRW): firmware: uefi
  ...

If `firmware` is set to `bios`, or is absent entirely (PV guests), then
the guest cannot leverage the vulnerability.

MITIGATION
==========

There are no mitigations.

CREDITS
=======

This issue was discovered by Teddy Astie of Vates.

RESOLUTION
==========

Applying the attached patch resolves this issue.

xsa478.patch           varstored master

$ sha256sum xsa478*
401679429e22e202fecf418c5100144ea0ee1cca3643f09960107cf3d88821db  xsa478.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAml4qMEMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZp94IAKAafDWRsyB3vmmHsGG2cF3I1LFKQMzhtogNUu/w
7QrhNwmyI9tdIhtlPk4JC75L1Em+kDXHh+vNkQF97QeKq2IyuEYt+q2ko6sV/RTF
Ewv0BhJJIiJCfyI/x55dz+YANOwsSOo7bZrSy1l/VgUJOdVKK5L1VtcloD57ZX2D
A4r/rfZbJwx/vJ+Zp8R+W0on7SWS6h4am6M0+7f2swiJ2MpoEUwhSgFMmigOcdUc
xbUo/IKOiQVNX2A6j+J5tQT6JlrXC/K8bIUwe2oDKRPG1qSMYAr2lKZ4GvoflUra
ckCA0k520KHw+ZfuHhQq/TzIFaLVDnr1kfChYdPSX0jXtb0=
=B9ua
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa478.patch"
Content-Disposition: attachment; filename="xsa478.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogW1BBVENIXSBGaXggVE9DVE9VIGlzc3VlcyB3aXRoIG1h
cHBlZCBndWVzdCBtZW1vcnkKCm1lbWNweSgpIGNhbiBiZSBvcHRpbWlzZWQg
YnkgdGhlIGNvbXBpbGVyLCBsZWFkaW5nIHRvIFRPQ1RPVSBidWdzIHdpdGgg
ZGF0YSBpbgpndWVzdCBtZW1vcnkuICBXaXRob3V0IHRoZXNlIGJhcnJpZXJz
LCBkaXNwYXRjaF9jb21tYW5kKCkgY29tcGlsZXMgaW4gYSB3YXkKd2hpY2gg
aXMgdnVsbmVyYWJsZSB0byBjb2RlIGluamVjdGlvbi4KClRoaXMgaXMgWFNB
LTQ3OCAvIENWRS0yMDI1LTU4MTUxCgpSZXBvcnRlZC1ieTogVGVkZHkgQXN0
aWUgPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+ClNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClJldmll
d2VkLWJ5OiBGcmVkaWFubyBaaWdsaW8gPGZyZWRpYW5vLnppZ2xpb0BjaXRy
aXguY29tPgpSZXZpZXdlZC1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFn
ZXJ3YWxsQGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiBpbmNsdWRlL3Nlcmlh
bGl6ZS5oIHwgMTggKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMTggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2Vy
aWFsaXplLmggYi9pbmNsdWRlL3NlcmlhbGl6ZS5oCmluZGV4IDA0NDQxZWE4
YTM3Mi4uMTY2Nzg2OGZlYWI0IDEwMDY0NAotLS0gYS9pbmNsdWRlL3Nlcmlh
bGl6ZS5oCisrKyBiL2luY2x1ZGUvc2VyaWFsaXplLmgKQEAgLTM1LDEyICsz
NSwxNSBAQAogI2luY2x1ZGUgImVmaS5oIgogI2luY2x1ZGUgImhhbmRsZXIu
aCIKIAorI2RlZmluZSBiYXJyaWVyKCkgYXNtIHZvbGF0aWxlICgiIiA6Ojog
Im1lbW9yeSIpCisKIHN0YXRpYyBpbmxpbmUgZW51bSBjb21tYW5kX3QKIHVu
c2VyaWFsaXplX2NvbW1hbmQodWludDhfdCAqKnB0cikKIHsKICAgICBVSU5U
MzIgZGF0YTsKIAogICAgIG1lbWNweSgmZGF0YSwgKnB0ciwgc2l6ZW9mKGRh
dGEpKTsKKyAgICBiYXJyaWVyKCk7CiAgICAgKnB0ciArPSBzaXplb2YgZGF0
YTsKIAogICAgIHJldHVybiAoZW51bSBjb21tYW5kX3QpZGF0YTsKQEAgLTUw
LDkgKzUzLDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZAogc2VyaWFsaXplX2Rh
dGEodWludDhfdCAqKnB0ciwgY29uc3QgdWludDhfdCAqZGF0YSwgVUlOVE4g
ZGF0YV9sZW4pCiB7CiAgICAgbWVtY3B5KCpwdHIsICZkYXRhX2xlbiwgc2l6
ZW9mKGRhdGFfbGVuKSk7CisgICAgYmFycmllcigpOwogICAgICpwdHIgKz0g
c2l6ZW9mIGRhdGFfbGVuOwogICAgIGlmIChkYXRhX2xlbikgewogICAgICAg
ICBtZW1jcHkoKnB0ciwgZGF0YSwgZGF0YV9sZW4pOworICAgICAgICBiYXJy
aWVyKCk7CiAgICAgICAgICpwdHIgKz0gZGF0YV9sZW47CiAgICAgfQogfQpA
QCAtNjEsNiArNjYsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQKIHNlcmlhbGl6
ZV9yZXN1bHQodWludDhfdCAqKnB0ciwgRUZJX1NUQVRVUyBzdGF0dXMpCiB7
CiAgICAgbWVtY3B5KCpwdHIsICZzdGF0dXMsIHNpemVvZihzdGF0dXMpKTsK
KyAgICBiYXJyaWVyKCk7CiAgICAgKnB0ciArPSBzaXplb2Ygc3RhdHVzOwog
fQogCkBAIC02OCw2ICs3NCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZAogc2Vy
aWFsaXplX2d1aWQodWludDhfdCAqKnB0ciwgY29uc3QgRUZJX0dVSUQgKmd1
aWQpCiB7CiAgICAgbWVtY3B5KCpwdHIsIGd1aWQsIEdVSURfTEVOKTsKKyAg
ICBiYXJyaWVyKCk7CiAgICAgKnB0ciArPSBHVUlEX0xFTjsKIH0KIApAQCAt
NzUsNiArODIsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQKIHNlcmlhbGl6ZV90
aW1lc3RhbXAodWludDhfdCAqKnB0ciwgRUZJX1RJTUUgKnRpbWVzdGFtcCkK
IHsKICAgICBtZW1jcHkoKnB0ciwgdGltZXN0YW1wLCBzaXplb2YoKnRpbWVz
dGFtcCkpOworICAgIGJhcnJpZXIoKTsKICAgICAqcHRyICs9IHNpemVvZigq
dGltZXN0YW1wKTsKIH0KIApAQCAtODIsNiArOTAsNyBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQKIHNlcmlhbGl6ZV91aW50bih1aW50OF90ICoqcHRyLCBVSU5U
TiB2YXIpCiB7CiAgICAgbWVtY3B5KCpwdHIsICZ2YXIsIHNpemVvZih2YXIp
KTsKKyAgICBiYXJyaWVyKCk7CiAgICAgKnB0ciArPSBzaXplb2YgdmFyOwog
fQogCkBAIC04OSw2ICs5OCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZAogc2Vy
aWFsaXplX3VpbnQzMih1aW50OF90ICoqcHRyLCBVSU5UMzIgdmFyKQogewog
ICAgIG1lbWNweSgqcHRyLCAmdmFyLCBzaXplb2YodmFyKSk7CisgICAgYmFy
cmllcigpOwogICAgICpwdHIgKz0gc2l6ZW9mIHZhcjsKIH0KIApAQCAtOTYs
NiArMTA2LDcgQEAgc3RhdGljIGlubGluZSB2b2lkCiBzZXJpYWxpemVfdWlu
dDY0KHVpbnQ4X3QgKipwdHIsIFVJTlQ2NCB2YXIpCiB7CiAgICAgbWVtY3B5
KCpwdHIsICZ2YXIsIHNpemVvZih2YXIpKTsKKyAgICBiYXJyaWVyKCk7CiAg
ICAgKnB0ciArPSBzaXplb2YgdmFyOwogfQogCkBAIC0xMDUsNiArMTE2LDcg
QEAgdW5zZXJpYWxpemVfZGF0YSh1aW50OF90ICoqcHRyLCBVSU5UTiAqbGVu
LCBVSU5UTiBsaW1pdCkKICAgICB1aW50OF90ICpkYXRhOwogCiAgICAgbWVt
Y3B5KGxlbiwgKnB0ciwgc2l6ZW9mKCpsZW4pKTsKKyAgICBiYXJyaWVyKCk7
CiAgICAgKnB0ciArPSBzaXplb2YgKmxlbjsKIAogICAgIGlmICgqbGVuID4g
bGltaXQgfHwgKmxlbiA9PSAwKQpAQCAtMTE1LDYgKzEyNyw3IEBAIHVuc2Vy
aWFsaXplX2RhdGEodWludDhfdCAqKnB0ciwgVUlOVE4gKmxlbiwgVUlOVE4g
bGltaXQpCiAgICAgICAgIHJldHVybiBOVUxMOwogCiAgICAgbWVtY3B5KGRh
dGEsICpwdHIsICpsZW4pOworICAgIGJhcnJpZXIoKTsKICAgICAqcHRyICs9
ICpsZW47CiAKICAgICByZXR1cm4gZGF0YTsKQEAgLTEyNCw2ICsxMzcsNyBA
QCBzdGF0aWMgaW5saW5lIHZvaWQKIHVuc2VyaWFsaXplX2RhdGFfaW5wbGFj
ZSh1aW50OF90ICoqcHRyLCB1aW50OF90ICpidWYsIFVJTlROIGxlbikKIHsK
ICAgICBtZW1jcHkoYnVmLCAqcHRyLCBsZW4pOworICAgIGJhcnJpZXIoKTsK
ICAgICAqcHRyICs9IGxlbjsKIH0KIApAQCAtMTM3LDYgKzE1MSw3IEBAIHN0
YXRpYyBpbmxpbmUgdm9pZAogdW5zZXJpYWxpemVfdGltZXN0YW1wKHVpbnQ4
X3QgKipwdHIsIEVGSV9USU1FICp0aW1lc3RhbXApCiB7CiAgICAgbWVtY3B5
KHRpbWVzdGFtcCwgKnB0ciwgc2l6ZW9mKCp0aW1lc3RhbXApKTsKKyAgICBi
YXJyaWVyKCk7CiAgICAgKnB0ciArPSBzaXplb2YoKnRpbWVzdGFtcCk7CiB9
CiAKQEAgLTE0Niw2ICsxNjEsNyBAQCB1bnNlcmlhbGl6ZV91aW50bih1aW50
OF90ICoqcHRyKQogICAgIFVJTlROIHJldDsKIAogICAgIG1lbWNweSgmcmV0
LCAqcHRyLCBzaXplb2YocmV0KSk7CisgICAgYmFycmllcigpOwogICAgICpw
dHIgKz0gc2l6ZW9mIHJldDsKIAogICAgIHJldHVybiByZXQ7CkBAIC0xNTcs
NiArMTczLDcgQEAgdW5zZXJpYWxpemVfYm9vbGVhbih1aW50OF90ICoqcHRy
KQogICAgIEJPT0xFQU4gcmV0OwogCiAgICAgbWVtY3B5KCZyZXQsICpwdHIs
IHNpemVvZihyZXQpKTsKKyAgICBiYXJyaWVyKCk7CiAgICAgKnB0ciArPSBz
aXplb2YgcmV0OwogCiAgICAgcmV0dXJuIHJldDsKQEAgLTE2OCw2ICsxODUs
NyBAQCB1bnNlcmlhbGl6ZV91aW50MzIodWludDhfdCAqKnB0cikKICAgICBV
SU5UMzIgcmV0OwogCiAgICAgbWVtY3B5KCZyZXQsICpwdHIsIHNpemVvZihy
ZXQpKTsKKyAgICBiYXJyaWVyKCk7CiAgICAgKnB0ciArPSBzaXplb2YgcmV0
OwogCiAgICAgcmV0dXJuIHJldDsKLS0gCjIuMzkuNQoK

--=separator--

