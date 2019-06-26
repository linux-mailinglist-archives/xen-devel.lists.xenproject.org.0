Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E55D566D0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 12:32:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg5C7-0007cC-JG; Wed, 26 Jun 2019 10:30:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eZd/=UZ=gandi.net=nicolas.belouin@srs-us1.protection.inumbo.net>)
 id 1hg59b-00071Z-0l
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 10:27:51 +0000
X-Inumbo-ID: 0b4f39bb-97fd-11e9-8980-bc764e045a96
Received: from gandi.net (unknown [2001:4b98:dc4:5:ae1f:6bff:fe2d:9fdc])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0b4f39bb-97fd-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 10:27:49 +0000 (UTC)
Received: from diconico07.dev (unknown
 [IPv6:2001:4b98:beef:a:e7c:1fb4:ff55:f4a9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by gandi.net (Postfix) with ESMTPSA id E4AE216042D;
 Wed, 26 Jun 2019 10:27:47 +0000 (UTC)
From: Nicolas Belouin <nicolas.belouin@gandi.net>
To: xen-devel@lists.xenproject.org
Date: Wed, 26 Jun 2019 12:27:32 +0200
Message-Id: <20190626102732.27872-1-nicolas.belouin@gandi.net>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Jun 2019 10:30:26 +0000
Subject: [Xen-devel] [PATCH] golang/xenlight: Add libxl_utils support
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 Nicolas Belouin <nicolas.belouin@gandi.net>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIEdvIGJpbmRpbmdzIGZvciBsaWJ4bCBtaXNzIGZ1bmN0aW9ucyBmcm9tIGxpYnhsX3V0aWxz
LCBsZXRzIHN0YXJ0CndpdGggdGhlIHNpbXBsZSBsaWJ4bF9kb21pZF90b19uYW1lIGFuZCBpdHMg
Y291bnRlcnBhcnQKbGlieGxfbmFtZV90b19kb21pZC4KClNpZ25lZC1vZmYtYnk6IE5pY29sYXMg
QmVsb3VpbiA8bmljb2xhcy5iZWxvdWluQGdhbmRpLm5ldD4KLS0tCiB0b29scy9nb2xhbmcveGVu
bGlnaHQveGVubGlnaHRfdXRpbHMuZ28gfCA2MSArKysrKysrKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xz
L2dvbGFuZy94ZW5saWdodC94ZW5saWdodF91dGlscy5nbwoKZGlmZiAtLWdpdCBhL3Rvb2xzL2dv
bGFuZy94ZW5saWdodC94ZW5saWdodF91dGlscy5nbyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94
ZW5saWdodF91dGlscy5nbwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5h
YjdhNTg1ZWM3Ci0tLSAvZGV2L251bGwKKysrIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxp
Z2h0X3V0aWxzLmdvCkBAIC0wLDAgKzEsNjEgQEAKKy8qCisgKiBDb3B5cmlnaHQgKEMpIDIwMTkg
Tmljb2xhcyBCZWxvdWluLCBHYW5kaSBTQVMKKyAqCisgKiBUaGlzIGxpYnJhcnkgaXMgZnJlZSBz
b2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCisgKiBtb2RpZnkgaXQgdW5k
ZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljCisgKiBMaWNlbnNl
IGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOworICogdmVyc2lv
biAyLjEgb2YgdGhlIExpY2Vuc2UuCisgKgorICogVGhpcyBsaWJyYXJ5IGlzIGRpc3RyaWJ1dGVk
IGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisgKiBidXQgV0lUSE9VVCBBTlkg
V0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgorICogTUVSQ0hB
TlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBH
TlUKKyAqIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisg
KgorICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIExlc3NlciBH
ZW5lcmFsIFB1YmxpYworICogTGljZW5zZSBhbG9uZyB3aXRoIHRoaXMgbGlicmFyeTsgSWYgbm90
LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgorICovCitwYWNrYWdlIHhlbmxp
Z2h0CisKKy8qCisjY2dvIExERkxBR1M6IC1seGVubGlnaHQgLWx5YWpsIC1seGVudG9vbGxvZwor
I2luY2x1ZGUgPHN0ZGxpYi5oPgorI2luY2x1ZGUgPGxpYnhsX3V0aWxzLmg+CisqLworaW1wb3J0
ICJDIgorCisvKgorICogT3RoZXIgZmxhZ3MgdGhhdCBtYXkgYmUgbmVlZGVkIGF0IHNvbWUgcG9p
bnQ6CisgKiAgLWxubC1yb3V0ZS0zIC1sbmwtMworICoKKyAqIFRvIGdldCBiYWNrIHRvIHN0YXRp
YyBsaW5raW5nOgorICogI2NnbyBMREZMQUdTOiAtbHhlbmxpZ2h0IC1seWFqbF9zIC1seGVuZ250
dGFiIC1seGVuc3RvcmUgLWx4ZW5ndWVzdCAtbHhlbnRvb2xsb2cgLWx4ZW5ldnRjaG4gLWx4ZW5j
dHJsIC1seGVuZm9yZWlnbm1lbW9yeSAtbHhlbmNhbGwgLWx6IC1sdXVpZCAtbHV0aWwKKyAqLwor
CitpbXBvcnQgKAorCSJ1bnNhZmUiCispCisKKy8vY2hhciogbGlieGxfZG9taWRfdG9fbmFtZShs
aWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQpOworZnVuYyAoQ3R4ICpDb250ZXh0KSBEb21p
ZFRvTmFtZShpZCBEb21pZCkgKG5hbWUgc3RyaW5nKSB7CisJY0RvbU5hbWUgOj0gQy5saWJ4bF9k
b21pZF90b19uYW1lKEN0eC5jdHgsIEMudWludDMyX3QoaWQpKQorCW5hbWUgPSBDLkdvU3RyaW5n
KGNEb21OYW1lKQorCXJldHVybgorfQorCisvL2ludCBsaWJ4bF9uYW1lX3RvX2RvbWlkKGxpYnhs
X2N0ICpjdHgsIGNvbnN0IGNoYXIgKm5hbWUsIHVpbnQzMl90ICpkb21pZCkKK2Z1bmMgKEN0eCAq
Q29udGV4dCkgTmFtZVRvRG9taWQobmFtZSBzdHJpbmcpIChpZCBEb21pZCwgZXJyIGVycm9yKSB7
CisJY25hbWUgOj0gQy5DU3RyaW5nKG5hbWUpCisJZGVmZXIgQy5mcmVlKHVuc2FmZS5Qb2ludGVy
KGNuYW1lKSkKKworCXZhciBjRG9tSWQgQy51aW50MzJfdAorCisJcmV0IDo9IEMubGlieGxfbmFt
ZV90b19kb21pZChDdHguY3R4LCBjbmFtZSwgJmNEb21JZCkKKwlpZiByZXQgIT0gMCB7CisJCWVy
ciA9IEVycm9yKC1yZXQpCisJCXJldHVybgorCX0KKworCWlkID0gRG9taWQoY0RvbUlkKQorCisJ
cmV0dXJuCit9Ci0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
