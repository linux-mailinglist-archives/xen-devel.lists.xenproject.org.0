Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFE3C8F6B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 19:08:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFi4a-0006YV-Ri; Wed, 02 Oct 2019 17:05:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0qpV=X3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iFi4Z-0006YH-FU
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 17:05:55 +0000
X-Inumbo-ID: e497ff68-e536-11e9-8628-bc764e2007e4
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::9])
 by localhost (Halon) with ESMTPS
 id e497ff68-e536-11e9-8628-bc764e2007e4;
 Wed, 02 Oct 2019 17:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570035953;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=4DYp51Vc9ztkdEHMvY1HqDsmG8RHkVlIlHFvANw7/Sw=;
 b=sFXgiJvG19mceTyuq1g40w0suxrVbwWHMsaQDz/BPa2w6HkbWDcNpgM1w2UvCgBc2Q
 GmElUxlkKvVr8WZtPaGeDIhjlM4xfq6Ug26cyynyJrXNfib2rOHQv2/0PFxfvscWSPNM
 2PRNV+8WX3NmDJ+aEEodk2tA5Kjwh2wxgtjpaSOFhzbwqKvmE4i6BKmCmWyjjFWGLd13
 7CezK3VRqQr9OeqMavzVtsbzs6TENhVYTqIo+dHJOTloSiVStGv99uABOl5Yl2SfQZ1M
 YvhgfBh2ihmphMQ1D1YYGgr4j4yXQ4J0DyOcx5aYahPYf3AG0r5nwpMJeRx31oIPrt1/
 V24Q==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2Gkg"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.28.0 SBL|AUTH)
 with ESMTPSA id j06a90v92H5lUVd
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 2 Oct 2019 19:05:47 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Date: Wed,  2 Oct 2019 19:05:37 +0200
Message-Id: <20191002170543.26571-3-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191002170543.26571-1-olaf@aepfle.de>
References: <20191002170543.26571-1-olaf@aepfle.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/8] tools: add with-xen-scriptdir configure
 option
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
Cc: Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gdGhlIG5lYXIgZnV0dXJlIGFsbCBmcmVzaCBpbnN0YWxsYXRpb25zIHdpbGwgaGF2ZSBhbiBl
bXB0eSAvZXRjLgpUaGUgY29udGVudCBvZiB0aGlzIGRpcmVjdG9yeSB3aWxsIG5vdCBiZSBjb250
cm9sbGVkIGJ5IHRoZSBwYWNrYWdlCm1hbmFnZXIgYW55bW9yZS4gT25lIG9mIHRoZSByZWFzb25z
IGZvciB0aGlzIG1vdmUgaXMgdG8gbWFrZSBzbmFwc2hvdHMKbW9yZSByb2J1c3QuCgpBcyBhIGZp
cnN0IHN0ZXAgaW50byB0aGlzIGRpcmVjdGlvbiwgYWRkIGEga25vYiB0byBjb25maWd1cmUgdG8g
YWxsb3cKc3RvcmluZyB0aGUgaG90cGx1ZyBzY3JpcHRzIHRvIGxpYmV4ZWMgYmVjYXVzZSB0aGV5
IGFyZSBub3QgZXhhY3RseQpjb25maWd1cmF0aW9uLiBUaGUgY3VycmVudCBkZWZhdWx0IGlzIHVu
Y2hhbmdlZCwgd2hpY2ggaXMKL2V0Yy94ZW4vc2NyaXB0cy4KClNpZ25lZC1vZmYtYnk6IE9sYWYg
SGVyaW5nIDxvbGFmQGFlcGZsZS5kZT4KLS0tCiBtNC9wYXRocy5tNCB8IDggKysrKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9tNC9wYXRocy5tNCBiL200L3BhdGhzLm00CmluZGV4IDg5ZDNiYjgzMTIuLjBjZWMyYmIxOTAg
MTAwNjQ0Ci0tLSBhL200L3BhdGhzLm00CisrKyBiL200L3BhdGhzLm00CkBAIC03MCw2ICs3MCwx
MiBAQCBBQ19BUkdfV0lUSChbbGliZXhlYy1sZWFmLWRpcl0sCiAgICAgW2xpYmV4ZWNfc3ViZGly
PSR3aXRodmFsXSwKICAgICBbbGliZXhlY19zdWJkaXI9JFBBQ0tBR0VfVEFSTkFNRV0pCiAKK0FD
X0FSR19XSVRIKFt4ZW4tc2NyaXB0ZGlyXSwKKyAgICBBU19IRUxQX1NUUklORyhbLS13aXRoLXhl
bi1zY3JpcHRkaXI9RElSXSwKKyAgICBbUGF0aCB0byBkaXJlY3RvcnkgZm9yIGRvbTAgaG90cGx1
ZyBzY3JpcHRzLiBbU1lTQ09ORkRJUi94ZW4vc2NyaXB0c11dKSwKKyAgICBbeGVuX3NjcmlwdGRp
cl9wYXRoPSR3aXRodmFsXSwKKyAgICBbeGVuX3NjcmlwdGRpcl9wYXRoPSRzeXNjb25mZGlyL3hl
bi9zY3JpcHRzXSkKKwogQUNfQVJHX1dJVEgoW3hlbi1kdW1wZGlyXSwKICAgICBBU19IRUxQX1NU
UklORyhbLS13aXRoLXhlbi1kdW1wZGlyPURJUl0sCiAgICAgW1BhdGggdG8gZGlyZWN0b3J5IGZv
ciBkb21VIGNyYXNoIGR1bXBzLiBbTE9DQUxTVEFURURJUi9saWIveGVuL2R1bXBdXSksCkBAIC0x
MzcsNyArMTQzLDcgQEAgQUNfU1VCU1QoSU5JVERfRElSKQogWEVOX0NPTkZJR19ESVI9JENPTkZJ
R19ESVIveGVuCiBBQ19TVUJTVChYRU5fQ09ORklHX0RJUikKIAotWEVOX1NDUklQVF9ESVI9JFhF
Tl9DT05GSUdfRElSL3NjcmlwdHMKK1hFTl9TQ1JJUFRfRElSPSR4ZW5fc2NyaXB0ZGlyX3BhdGgK
IEFDX1NVQlNUKFhFTl9TQ1JJUFRfRElSKQogCiBjYXNlICIkaG9zdF9vcyIgaW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
