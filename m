Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO70GKhDuWmK+QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 13:06:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 412E22A97E8
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 13:06:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255911.1550687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2TAl-0008V9-6i; Tue, 17 Mar 2026 12:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255911.1550687; Tue, 17 Mar 2026 12:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2TAl-0008Te-35; Tue, 17 Mar 2026 12:05:19 +0000
Received: by outflank-mailman (input) for mailman id 1255911;
 Tue, 17 Mar 2026 12:05:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pa/0=BR=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1w2TAj-0008QI-0T
 for xen-devel@lists.xen.org; Tue, 17 Mar 2026 12:05:17 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b95c952-21f9-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Mar 2026 13:05:11 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1w2TAW-00D7eF-1U;
 Tue, 17 Mar 2026 12:05:04 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1w2TAW-00DbXG-0N;
 Tue, 17 Mar 2026 12:05:04 +0000
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
X-Inumbo-ID: 8b95c952-21f9-11f1-9ccf-f158ae23cfc8
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.510 (Entity 5.510)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 480 v3 (CVE-2026-23554) - Use after free of
 paging structures in EPT
Message-Id: <E1w2TAW-00DbXG-0N@xenbits.xenproject.org>
Date: Tue, 17 Mar 2026 12:05:04 +0000
X-Spamd-Result: default: False [0.56 / 15.00];
	R_BAD_CTE_7BIT(1.05)[7bit,utf8];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenbits.xenproject.org:mid,xenproject.org:url];
	DMARC_NA(0.00)[xen.org];
	FORGED_RECIPIENTS(0.00)[m:xen-announce@lists.xen.org,m:xen-devel@lists.xen.org,m:xen-users@lists.xen.org,m:oss-security@lists.openwall.com,m:security-team-members@xen.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[security@xen.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[security@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 412E22A97E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-23554 / XSA-480
                               version 3

              Use after free of paging structures in EPT

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

The Intel EPT paging code uses an optimization to defer flushing of any cached
EPT state until the p2m lock is dropped, so that multiple modifications done
under the same locked region only issue a single flush.

Freeing of paging structures however is not deferred until the flushing is
done, and can result in freed pages transiently being present in cached state.
Such stale entries can point to memory ranges not owned by the guest, thus
allowing access to unintended memory regions.

IMPACT
======

Privilege escalation, Denial of Service (DoS) affecting the entire host,
and information leaks.

VULNERABLE SYSTEMS
==================

Xen 4.17 and onwards are vulnerable.  Xen 4.16 and older are not vulnerable.

Only x86 Intel systems with EPT support are vulnerable.

Only x86 HVM/PVH guests using HAP can leverage the vulnerability on affected
systems.

MITIGATION
==========

There are no mitigations.

CREDITS
=======

This issue was discovered by Roger Pau Monné of XenServer.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa480.patch           xen-unstable - Xen 4.17.x

$ sha256sum xsa480*
578f8fec3f34656e085419f6376d43987ffd6ed32e067b4024d3c83ce03a5901  xsa480.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmm5Q1MMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZKDgH/jDFwjlPNV0IQor3c5j9D7L++i5dFugypaF5OI+Q
nboD7VEe6y1KexRsPa/a7UAvuabgGdudeS18IS3W34/9TZILZRITo9s3IgEnTfQR
qqFlCTxymFuCn8Iptq8SJh37fG3nc9OJ/v28s+0+X9ERnjjjVcjhwcbQ5gQSpKU0
7fAe+IpsO3YOMGb3fgpjhCWMjh9UTHnKOBmObNeDGZ3sXgh8+FYkt6snRs0bYwW4
IcGpmEEgK+Id6n/0sG07Ntntb02EcCz3Vl8G0OflNQj/XOxHBuXbkFc36K2vpUDp
dGrzGkIznA00Oz2UNlZrSrMWAQtKuHbB9+H2tU+7BNq+ag8=
=RFix
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa480.patch"
Content-Disposition: attachment; filename="xsa480.patch"
Content-Transfer-Encoding: base64

RnJvbSA0NWY2ODY2ZTM0YjdlOWVlOGI2YWMxNmQ2NDZhMmU5NTRjOTdlNDhl
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpEYXRlOiBUdWUsIDE3IEZlYiAy
MDI2IDA5OjMzOjQzICswMTAwClN1YmplY3Q6IFtQQVRDSF0geDg2L3AybTog
aXNzdWUgYSBzeW5jIGZsdXNoIGJlZm9yZSBmcmVlaW5nIHBhZ2luZyBwYWdl
cwpNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47
IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJp
dAoKSW4gdGhlIEVQVCBpbXBsZW1lbnRhdGlvbiwgdGhlIGRlZmVyIGZsdXNo
aW5nIGxvZ2ljIGlzIHVzZWQKdW5jb25kaXRpb25hbGx5LCBhbmQgdGhhdCB3
b3VsZCBsZWFkIHRvIHBhZ2luZyBtZW1vcnkgYmVpbmcgcmV0dXJuZWQgdG8g
dGhlCnBhZ2luZyBwb29sIGJlZm9yZSBpdHMgcmVmZXJlbmNlcyBoYWQgYmVl
biBmbHVzaGVkLgoKSXNzdWUgYW55IHBlbmRpbmcgZmx1c2hlcyBiZWZvcmUg
ZnJlZWluZyB0aGUgcGFnaW5nIG1lbW9yeSBiYWNrIHRvIHRoZQpwb29sLgoK
Tm90ZSBBTUQgKE5QVCkgYW5kIFNoYWRvdyBwYWdpbmcgYXJlIG5vdCBhZmZl
Y3RlZCwgYXMgdGhleSBkb24ndCBpbXBsZW1lbnQKdGhlIGRlZmVycmVkIGZs
dXNoaW5nIGxvZ2ljLgoKVGhpcyBpcyBYU0EtNDgwIC8gQ1ZFLTIwMjYtMjM1
NTQKCkZpeGVzOiA0YTU5ZTZiYjNhOTYgKCJ4ODYvRVBUOiBzcXVhc2ggbWVh
bmluZ2xlc3MgVExCIGZsdXNoIikKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQogeGVuL2FyY2gv
eDg2L21tL3AybS5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0u
YyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwppbmRleCBlOTE1ZGEyNmE4MzIu
LmZkZGVjZGY5NzhlYyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL3Ay
bS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwpAQCAtNDc5LDYgKzQ3
OSwxMSBAQCB2b2lkIHAybV9mcmVlX3B0cChzdHJ1Y3QgcDJtX2RvbWFpbiAq
cDJtLCBzdHJ1Y3QgcGFnZV9pbmZvICpwZykKICAgICBBU1NFUlQocDJtLT5k
b21haW4pOwogICAgIEFTU0VSVChwMm0tPmRvbWFpbi0+YXJjaC5wYWdpbmcu
ZnJlZV9wYWdlKTsKIAorICAgIC8qCisgICAgICogSXNzdWUgYW55IHBlbmRp
bmcgZmx1c2ggaGVyZSwgaW4gY2FzZSBpdCB3YXMgZGVmZXJyZWQgYmVmb3Jl
LiAgVGhlIHBhZ2UKKyAgICAgKiB3aWxsIGJlIHJldHVybmVkIHRvIHRoZSBw
YWdpbmcgcG9vbCBub3cuCisgICAgICovCisgICAgcDJtX3RsYl9mbHVzaF9z
eW5jKHAybSk7CiAgICAgcGFnZV9saXN0X2RlbChwZywgJnAybS0+cGFnZXMp
OwogICAgIHAybS0+ZG9tYWluLT5hcmNoLnBhZ2luZy5mcmVlX3BhZ2UocDJt
LT5kb21haW4sIHBnKTsKIAotLSAKMi41MS4wCgo=

--=separator--

