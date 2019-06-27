Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A18557DF0
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 10:12:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgPTH-00023V-0I; Thu, 27 Jun 2019 08:09:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+ZXn=U2=gandi.net=nicolas.belouin@srs-us1.protection.inumbo.net>)
 id 1hgPTF-00022l-FP
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 08:09:29 +0000
X-Inumbo-ID: e1cd6527-98b2-11e9-8980-bc764e045a96
Received: from gandi.net (unknown [2001:4b98:dc4:5:ae1f:6bff:fe2d:9fdc])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e1cd6527-98b2-11e9-8980-bc764e045a96;
 Thu, 27 Jun 2019 08:09:27 +0000 (UTC)
Received: from diconico07.dev (unknown
 [IPv6:2001:4b98:beef:a:e7c:1fb4:ff55:f4a9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by gandi.net (Postfix) with ESMTPSA id A57331602F2;
 Thu, 27 Jun 2019 08:09:26 +0000 (UTC)
From: Nicolas Belouin <nicolas.belouin@gandi.net>
To: xen-devel@lists.xenproject.org
Date: Thu, 27 Jun 2019 09:58:35 +0200
Message-Id: <20190627075834.14469-1-nicolas.belouin@gandi.net>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] golang/xenlight: Fix type issues with recent Go
 version
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
 Nicolas Belouin <nicolas.belouin@gandi.net>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R28gaXMgZG9pbmcgbW9yZSB0eXBlIGNoZWNrIChldmVuIHdoZW4gdXNpbmcgQ0dvKSwgc28gdGhl
c2UgaW5jb3JyZWN0CnVzZSBvZiBgdW5zYWZlLlBvaW50ZXJgIGFzIHdlbGwgYXMgdGhlIGxhY2sg
b2YgYHVuc2FmZS5Qb2ludGVyYCBmb3IKdGhlc2UgY2FsbHMgbm8gbG9uZ2VyIGNvbXBpbGUgd2l0
aCByZWNlbnQgR28gdmVyc2lvbnMuCgpUaGlzIGRvZXMgKm5vdCogYnJlYWsgY29tcGF0aWJpbGl0
eSB3aXRoIG9sZGVyIEdvIHZlcnNpb24uCi0tLQogdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxp
Z2h0LmdvIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQu
Z28gYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KaW5kZXggNTM1MzRkMDQ3ZS4u
ZTI4MTMyOGQ0MyAxMDA2NDQKLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0Lmdv
CisrKyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwpAQCAtODU0LDcgKzg1NCw3
IEBAIGZ1bmMgKEN0eCAqQ29udGV4dCkgT3BlbigpIChlcnIgZXJyb3IpIHsKIAl9CiAKIAlyZXQg
Oj0gQy5saWJ4bF9jdHhfYWxsb2MoJkN0eC5jdHgsIEMuTElCWExfVkVSU0lPTiwKLQkJMCwgdW5z
YWZlLlBvaW50ZXIoQ3R4LmxvZ2dlcikpCisJCTAsICgqQy5zdHJ1Y3RfeGVudG9vbGxvZ19sb2dn
ZXIpKHVuc2FmZS5Qb2ludGVyKEN0eC5sb2dnZXIpKSkKIAogCWlmIHJldCAhPSAwIHsKIAkJZXJy
ID0gRXJyb3IoLXJldCkKQEAgLTg2OSw3ICs4NjksNyBAQCBmdW5jIChDdHggKkNvbnRleHQpIENs
b3NlKCkgKGVyciBlcnJvcikgewogCWlmIHJldCAhPSAwIHsKIAkJZXJyID0gRXJyb3IoLXJldCkK
IAl9Ci0JQy54dGxfbG9nZ2VyX2Rlc3Ryb3kodW5zYWZlLlBvaW50ZXIoQ3R4LmxvZ2dlcikpCisJ
Qy54dGxfbG9nZ2VyX2Rlc3Ryb3koKCpDLnN0cnVjdF94ZW50b29sbG9nX2xvZ2dlcikodW5zYWZl
LlBvaW50ZXIoQ3R4LmxvZ2dlcikpKQogCXJldHVybgogfQogCkBAIC0xMTcwLDcgKzExNzAsNyBA
QCBmdW5jIChDdHggKkNvbnRleHQpIENvbnNvbGVHZXRUdHkoaWQgRG9taWQsIGNvbnNOdW0gaW50
LCBjb25UeXBlIENvbnNvbGVUeXBlKSAocAogCQllcnIgPSBFcnJvcigtcmV0KQogCQlyZXR1cm4K
IAl9Ci0JZGVmZXIgQy5mcmVlKGNwYXRoKQorCWRlZmVyIEMuZnJlZSh1bnNhZmUuUG9pbnRlcihj
cGF0aCkpCiAKIAlwYXRoID0gQy5Hb1N0cmluZyhjcGF0aCkKIAlyZXR1cm4KQEAgLTExOTAsNyAr
MTE5MCw3IEBAIGZ1bmMgKEN0eCAqQ29udGV4dCkgUHJpbWFyeUNvbnNvbGVHZXRUdHkoZG9taWQg
dWludDMyKSAocGF0aCBzdHJpbmcsIGVyciBlcnJvcikKIAkJZXJyID0gRXJyb3IoLXJldCkKIAkJ
cmV0dXJuCiAJfQotCWRlZmVyIEMuZnJlZShjcGF0aCkKKwlkZWZlciBDLmZyZWUodW5zYWZlLlBv
aW50ZXIoY3BhdGgpKQogCiAJcGF0aCA9IEMuR29TdHJpbmcoY3BhdGgpCiAJcmV0dXJuCi0tIAoy
LjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
