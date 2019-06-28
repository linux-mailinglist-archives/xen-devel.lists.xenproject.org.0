Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E1A59635
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 10:34:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgmHN-0008Sn-86; Fri, 28 Jun 2019 08:30:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=droh=U3=gandi.net=nicolas.belouin@srs-us1.protection.inumbo.net>)
 id 1hgmHM-0008Si-2g
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 08:30:44 +0000
X-Inumbo-ID: 03ba0433-997f-11e9-8980-bc764e045a96
Received: from gandi.net (unknown [217.70.182.73])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 03ba0433-997f-11e9-8980-bc764e045a96;
 Fri, 28 Jun 2019 08:30:42 +0000 (UTC)
Received: from diconico07.dev (unknown
 [IPv6:2001:4b98:beef:a:e7c:1fb4:ff55:f4a9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by gandi.net (Postfix) with ESMTPSA id D8E991604AA;
 Fri, 28 Jun 2019 08:30:40 +0000 (UTC)
From: Nicolas Belouin <nicolas.belouin@gandi.net>
To: xen-devel@lists.xenproject.org
Date: Fri, 28 Jun 2019 10:25:08 +0200
Message-Id: <20190628082508.32509-1-nicolas.belouin@gandi.net>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] golang/xenlight: Add libxl_utils support
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

VGhlIEdvIGJpbmRpbmdzIGZvciBsaWJ4bCBtaXNzIGZ1bmN0aW9ucyBmcm9tIGxpYnhsX3V0aWxz
LCBsZXQncyBzdGFydAp3aXRoIHRoZSBzaW1wbGUgbGlieGxfZG9taWRfdG9fbmFtZSBhbmQgaXRz
IGNvdW50ZXJwYXJ0CmxpYnhsX25hbWVfdG9fZG9taWQuCgpTaWduZWQtb2ZmLWJ5OiBOaWNvbGFz
IEJlbG91aW4gPG5pY29sYXMuYmVsb3VpbkBnYW5kaS5uZXQ+Ci0tLQogdG9vbHMvZ29sYW5nL3hl
bmxpZ2h0L3hlbmxpZ2h0X3V0aWxzLmdvIHwgNTUgKysrKysrKysrKysrKysrKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29s
cy9nb2xhbmcveGVubGlnaHQveGVubGlnaHRfdXRpbHMuZ28KCmRpZmYgLS1naXQgYS90b29scy9n
b2xhbmcveGVubGlnaHQveGVubGlnaHRfdXRpbHMuZ28gYi90b29scy9nb2xhbmcveGVubGlnaHQv
eGVubGlnaHRfdXRpbHMuZ28KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4u
ZGExNjM2ODQyZAotLS0gL2Rldi9udWxsCisrKyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5s
aWdodF91dGlscy5nbwpAQCAtMCwwICsxLDU1IEBACisvKgorICogQ29weXJpZ2h0IChDKSAyMDE5
IE5pY29sYXMgQmVsb3VpbiwgR2FuZGkgU0FTCisgKgorICogVGhpcyBsaWJyYXJ5IGlzIGZyZWUg
c29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgorICogbW9kaWZ5IGl0IHVu
ZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYworICogTGljZW5z
ZSBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsKKyAqIHZlcnNp
b24gMi4xIG9mIHRoZSBMaWNlbnNlLgorICoKKyAqIFRoaXMgbGlicmFyeSBpcyBkaXN0cmlidXRl
ZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorICogYnV0IFdJVEhPVVQgQU5Z
IFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyAqIE1FUkNI
QU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUg
R05VCisgKiBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgor
ICoKKyAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBMZXNzZXIg
R2VuZXJhbCBQdWJsaWMKKyAqIExpY2Vuc2UgYWxvbmcgd2l0aCB0aGlzIGxpYnJhcnk7IElmIG5v
dCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyAqLworcGFja2FnZSB4ZW5s
aWdodAorCisvKgorI2NnbyBMREZMQUdTOiAtbHhlbmxpZ2h0IC1seWFqbCAtbHhlbnRvb2xsb2cK
KyNpbmNsdWRlIDxzdGRsaWIuaD4KKyNpbmNsdWRlIDxsaWJ4bF91dGlscy5oPgorKi8KK2ltcG9y
dCAiQyIKKworaW1wb3J0ICgKKwkidW5zYWZlIgorKQorCisvL2NoYXIqIGxpYnhsX2RvbWlkX3Rv
X25hbWUobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkKTsKK2Z1bmMgKEN0eCAqQ29udGV4
dCkgRG9taWRUb05hbWUoaWQgRG9taWQpIChuYW1lIHN0cmluZykgeworCWNEb21OYW1lIDo9IEMu
bGlieGxfZG9taWRfdG9fbmFtZShDdHguY3R4LCBDLnVpbnQzMl90KGlkKSkKKwlkZWZlciBDLmZy
ZWUodW5zYWZlLlBvaW50ZXIoY0RvbU5hbWUpKQorCisJbmFtZSA9IEMuR29TdHJpbmcoY0RvbU5h
bWUpCisJcmV0dXJuCit9CisKKy8vaW50IGxpYnhsX25hbWVfdG9fZG9taWQobGlieGxfY3QgKmN0
eCwgY29uc3QgY2hhciAqbmFtZSwgdWludDMyX3QgKmRvbWlkKQorZnVuYyAoQ3R4ICpDb250ZXh0
KSBOYW1lVG9Eb21pZChuYW1lIHN0cmluZykgKGlkIERvbWlkLCBlcnIgZXJyb3IpIHsKKwljbmFt
ZSA6PSBDLkNTdHJpbmcobmFtZSkKKwlkZWZlciBDLmZyZWUodW5zYWZlLlBvaW50ZXIoY25hbWUp
KQorCisJdmFyIGNEb21JZCBDLnVpbnQzMl90CisKKwlyZXQgOj0gQy5saWJ4bF9uYW1lX3RvX2Rv
bWlkKEN0eC5jdHgsIGNuYW1lLCAmY0RvbUlkKQorCWlmIHJldCAhPSAwIHsKKwkJZXJyID0gRXJy
b3IoLXJldCkKKwkJcmV0dXJuCisJfQorCisJaWQgPSBEb21pZChjRG9tSWQpCisKKwlyZXR1cm4K
K30KLS0gCjIuMjIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
