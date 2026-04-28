Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLzWAMqh8GkQWgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 14:02:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E92484782
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 14:02:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295660.1572440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHh8f-0008PV-Dp; Tue, 28 Apr 2026 12:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295660.1572440; Tue, 28 Apr 2026 12:02:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHh8e-0008DN-Ud; Tue, 28 Apr 2026 12:02:04 +0000
Received: by outflank-mailman (input) for mailman id 1295660;
 Tue, 28 Apr 2026 12:02:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1wHh8a-0007VO-1O; Tue, 28 Apr 2026 12:02:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHh8Z-00C4HC-Db; Tue, 28 Apr 2026 14:01:59 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 69f0a1b2-bab6-0a2a0a5309dd-0a2a450ae9a4-12
 for <multiple-recipients>; Tue, 28 Apr 2026 14:01:59 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 69f0a1b5-56b3-0a2a450a0019-6882d725ccba-3
 for <multiple-recipients>; Tue, 28 Apr 2026 14:01:59 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wHh8S-0064ap-1C;
 Tue, 28 Apr 2026 12:01:52 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wHh8S-006n4i-17;
 Tue, 28 Apr 2026 12:01:52 +0000
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
Subject: Xen Security Advisory 487 v2 (CVE-2026-31787) - Linux kernel
 double free in Xen privcmd driver
Message-Id: <E1wHh8S-006n4i-17@xenbits.xenproject.org>
Date: Tue, 28 Apr 2026 12:01:52 +0000
X-purgate-ID: tlsNG-4011c0/1777377719-46D708B7-2E2A13BD/0/0
X-purgate-type: clean
X-purgate-size: 6117
X-Rspamd-Queue-Id: B6E92484782
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.49 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.715];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-31787 / XSA-487
                               version 2

            Linux kernel double free in Xen privcmd driver

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

The Linux kernel's privcmd driver can be abused to circumvent kernel
lockdown (secure boot) by causing a double free of kernel memory.

Note that this operation can be performed by root only, so any
further impact on the system (like denial of service) is not security
relevant.

IMPACT
======

An administrator of a domain booted in secure mode is able to perform
actions on the kernel which should not be possible in secure mode.

VULNERABLE SYSTEMS
==================

Linux PVH or HVM domains (x86 or Arm) from kernel 3.8 onwards are
vulnerable.

PV domains or non-Linux domains are not vulnerable.

MITIGATION
==========

There is no mitigation available.

CREDITS
=======

This issue was discovered by Atharva Vartak (@0xAth4rv).

RESOLUTION
==========

Applying the attached patch resolves this issue.

xsa487-linux.patch           Linux

$ sha256sum xsa487*
fc7ccf9697203c14ced4364d70175b463b08a17a7559fd8654a12b623b54e5bb  xsa487-linux.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of patches or mitigations is NOT permitted (except where
all the affected systems and VMs are administered and used only by
organisations which are members of the Xen Project Security Issues
Predisclosure List).  Specifically, deployment on public cloud systems
is NOT permitted.

This is because the patch needs to be applied to the guest.

Deployment is permitted only AFTER the embargo ends.


(Note: this during-embargo deployment notice is retained in
post-embargo publicly released Xen Project advisories, even though it
is then no longer applicable.  This is to enable the community to have
oversight of the Xen Project Security Team's decisionmaking.)

For more information about permissible uses of embargoed information,
consult the Xen Project community's agreed Security Policy:
  http://www.xenproject.org/security-policy.html
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmnwoQUMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZKRkH/A2DLI9IzMFrmuzksitp7G+MD/AWq3jJe93IAeU1
/QguHV7pQXFyhb1zWR/+DB4zt5tAcGIs75enob8njm3HZ/e5Ht6aSlYq+Rl5ZO6w
kK4aUljpRUxPTOg/PHPKn2sTkZccQxXGxmara5PwhZf0uXb0BBB33dhWbkxQoAR/
FzHSFNHvJKZct/fmmavE38R4AVel0GC3Ufi1jQ44l85xBWtmWN4+ioEno4tDqKkk
d9fmRfCoPta2zCL8DezC3y/LC7x8bbLeL1CMFchnVW+JjJOON22K2R/12dvBFUOF
If+HuBOHviA02fDW86H+sKTn/KnCI1jNjgUto9tCIkdyvSI=
=NY86
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa487-linux.patch"
Content-Disposition: attachment; filename="xsa487-linux.patch"
Content-Transfer-Encoding: base64

RnJvbSA1NTc3YzAwMzAxOGFiYjFhZDkyZGM0MDMyY2M3MWIxNzE4YTgzZGZh
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CkRhdGU6IEZyaSwgMTAgQXByIDIwMjYgMDk6
MjA6MDQgKzAyMDAKU3ViamVjdDogW1BBVENIXSB4ZW4vcHJpdmNtZDogZml4
IGRvdWJsZSBmcmVlIHZpYSBWTUEgc3BsaXR0aW5nCgpwcml2Y21kX3ZtX29w
cyBkZWZpbmVzIC5jbG9zZSAocHJpdmNtZF9jbG9zZSksIGJ1dCBuZWl0aGVy
IC5tYXlfc3BsaXQKbm9yIC5vcGVuLiBXaGVuIHVzZXJzcGFjZSBkb2VzIGEg
cGFydGlhbCBtdW5tYXAoKSBvbiBhIHByaXZjbWQgbWFwcGluZywKdGhlIGtl
cm5lbCBzcGxpdHMgdGhlIFZNQSB2aWEgX19zcGxpdF92bWEoKS4gU2luY2Ug
bWF5X3NwbGl0IGlzIE5VTEwsCnRoZSBzcGxpdCBpcyBhbGxvd2VkLiB2bV9h
cmVhX2R1cCgpIGNvcGllcyB2bV9wcml2YXRlX2RhdGEgKGEgcGFnZXMKYXJy
YXkgYWxsb2NhdGVkIGluIGFsbG9jX2VtcHR5X3BhZ2VzKCkpIGludG8gdGhl
IG5ldyBWTUEgd2l0aG91dCBhbnkKZml4dXAsIGJlY2F1c2UgdGhlcmUgaXMg
bm8gLm9wZW4gY2FsbGJhY2suCgpCb3RoIFZNQXMgbm93IHBvaW50IHRvIHRo
ZSBzYW1lIHBhZ2VzIGFycmF5LiBXaGVuIHRoZSB1bm1hcHBlZCBwb3J0aW9u
CmlzIGNsb3NlZCwgcHJpdmNtZF9jbG9zZSgpIGNhbGxzOgogICAgLSB4ZW5f
dW5tYXBfZG9tYWluX2dmbl9yYW5nZSgpCiAgICAtIHhlbl9mcmVlX3VucG9w
dWxhdGVkX3BhZ2VzKCkKICAgIC0ga3ZmcmVlKHBhZ2VzKQoKVGhlIHN1cnZp
dmluZyBWTUEgc3RpbGwgaG9sZHMgdGhlIGRhbmdsaW5nIHBvaW50ZXIuIFdo
ZW4gaXQgaXMgbGF0ZXIKZGVzdHJveWVkLCB0aGUgc2FtZSBzZXF1ZW5jZSBy
dW5zIGFnYWluLCB3aGljaCBsZWFkcyB0byBhIGRvdWJsZSBmcmVlLgoKRml4
IHRoaXMgaXNzdWUgYnkgYWRkaW5nIGEgLm1heV9zcGxpdCBjYWxsYmFjayBk
ZW55aW5nIHRoZSBWTUEgc3BsaXQuCgpUaGlzIGlzIFhTQS00ODcgLyBDVkUt
MjAyNi0zMTc4NwoKRml4ZXM6IGQ3MWY1MTM5ODVjMiAoInhlbjogcHJpdmNt
ZDogc3VwcG9ydCBhdXRvdHJhbnNsYXRlZCBwaHlzbWFwIGd1ZXN0cy4iKQpS
ZXBvcnRlZC1ieTogQXRoYXJ2YSBWYXJ0YWsgPGF0aGFydmEuYS52YXJ0YWtA
Z21haWwuY29tPgpTdWdnZXN0ZWQtYnk6IEF0aGFydmEgVmFydGFrIDxhdGhh
cnZhLmEudmFydGFrQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KIGRyaXZlcnMveGVuL3By
aXZjbWQuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3ByaXZjbWQuYyBi
L2RyaXZlcnMveGVuL3ByaXZjbWQuYwppbmRleCAxNWJhNTkyMjM2ZTguLjcy
NWE0OWEwZWVlNyAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vcHJpdmNtZC5j
CisrKyBiL2RyaXZlcnMveGVuL3ByaXZjbWQuYwpAQCAtMTYyMCw2ICsxNjIw
LDEyIEBAIHN0YXRpYyB2b2lkIHByaXZjbWRfY2xvc2Uoc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEpCiAJa3ZmcmVlKHBhZ2VzKTsKIH0KIAorc3RhdGlj
IGludCBwcml2Y21kX21heV9zcGxpdChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KmFyZWEsIHVuc2lnbmVkIGxvbmcgYWRkcikKK3sKKwkvKiBGb3JiaWQgc3Bs
aXR0aW5nLCBhdm9pZHMgZG91YmxlIGZyZWUgdmlhIHByaXZjbWRfY2xvc2Uo
KS4gKi8KKwlyZXR1cm4gLUVJTlZBTDsKK30KKwogc3RhdGljIHZtX2ZhdWx0
X3QgcHJpdmNtZF9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKIHsKIAlw
cmludGsoS0VSTl9ERUJVRyAicHJpdmNtZF9mYXVsdDogdm1hPSVwICVseC0l
bHgsIHBnb2ZmPSVseCwgdXY9JXBcbiIsCkBAIC0xNjMxLDYgKzE2MzcsNyBA
QCBzdGF0aWMgdm1fZmF1bHRfdCBwcml2Y21kX2ZhdWx0KHN0cnVjdCB2bV9m
YXVsdCAqdm1mKQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHZtX29wZXJhdGlv
bnNfc3RydWN0IHByaXZjbWRfdm1fb3BzID0gewogCS5jbG9zZSA9IHByaXZj
bWRfY2xvc2UsCisJLm1heV9zcGxpdCA9IHByaXZjbWRfbWF5X3NwbGl0LAog
CS5mYXVsdCA9IHByaXZjbWRfZmF1bHQKIH07CiAKLS0gCjIuNTMuMAoK

--=separator--

