Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB354B7A7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 14:08:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdZMW-0000kw-DU; Wed, 19 Jun 2019 12:06:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9okD=US=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hdZMU-0000km-3d
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 12:06:46 +0000
X-Inumbo-ID: b45fa2e9-928a-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::12])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b45fa2e9-928a-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 12:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1560946003;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=KeL0gshKboG7jX7s31G5O5hcV0Jz8zfPCPipk9AUMn0=;
 b=eDu50mCpEiKd3ROc4ov43sTfit4bJNLx/6fVEUAiCqVzl8UxAKXlUJs809a/vc6ZQJ
 eeSf04/PIxmY0IY1Q7XwhWE/I2qVA2PtVi2Ab28doGYRzId4YKHpWGawjFXrDmldTkVX
 oftWJOwnSb4DnK1GEUvJ14Xng98mvRGHlc/cudihrGhW5MdqAZMUKjkXhX1bPcJTClTH
 jFd15leXZWHrqtPEgNYaDkUX0UB+6BjUNVgP7jEdQGDtwfkgP4DBTfWSVUGUDXK0ulut
 +gKIpxcffyOwmaHunxJjm0rH2W6bNUkux7UAx32dUQLD97GdjdVsrKDp81jwNXVP3XgR
 pJxA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuznLRsvz6zGrN/JP2665"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.24 AUTH)
 with ESMTPSA id 60b3d8v5JC6a4fV
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 19 Jun 2019 14:06:36 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Date: Wed, 19 Jun 2019 14:06:33 +0200
Message-Id: <20190619120633.27466-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v1] tools: move scripts from etc to libexec
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
cnN0IHN0ZXAgaW50byB0aGlzIGRpcmVjdGlvbiwgbW92ZSB0aGUgaG90cGx1ZyBzY3JpcHRzIHRv
IGxpYmV4ZWMKYmVjYXVzZSB0aGV5IGFyZSBub3QgZXhhY3RseSBjb25maWd1cmF0aW9uLgoKU2ln
bmVkLW9mZi1ieTogT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgotLS0KClRoZXJlIHdpbGwg
YmUgc3RhbGUgYXV0b2dlbmVyYXRlZCBmaWxlIGFmdGVyIHRoaXMgY2hhbmdlLiBTdGlsbCEKCiBt
NC9wYXRocy5tNCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL200L3BhdGhzLm00IGIvbTQvcGF0aHMubTQKaW5kZXggODlk
M2JiODMxMi4uMGNjYzkyZDBmZiAxMDA2NDQKLS0tIGEvbTQvcGF0aHMubTQKKysrIGIvbTQvcGF0
aHMubTQKQEAgLTEzNyw3ICsxMzcsNyBAQCBBQ19TVUJTVChJTklURF9ESVIpCiBYRU5fQ09ORklH
X0RJUj0kQ09ORklHX0RJUi94ZW4KIEFDX1NVQlNUKFhFTl9DT05GSUdfRElSKQogCi1YRU5fU0NS
SVBUX0RJUj0kWEVOX0NPTkZJR19ESVIvc2NyaXB0cworWEVOX1NDUklQVF9ESVI9JHtMSUJFWEVD
fS9zY3JpcHRzCiBBQ19TVUJTVChYRU5fU0NSSVBUX0RJUikKIAogY2FzZSAiJGhvc3Rfb3MiIGlu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
