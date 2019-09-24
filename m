Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844CCBC9C1
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:06:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iClPk-0004cm-7F; Tue, 24 Sep 2019 14:03:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IFUW=XT=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iClPi-0004cb-SV
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:03:34 +0000
X-Inumbo-ID: 18100ed0-ded4-11e9-97fb-bc764e2007e4
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::5])
 by localhost (Halon) with ESMTPS
 id 18100ed0-ded4-11e9-97fb-bc764e2007e4;
 Tue, 24 Sep 2019 14:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1569333812;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=0hVHlozr9dEC+CBD27LsgyQXc0TkCiGvixA/+21xxZQ=;
 b=PM0HL26bjezL8rVw2l6dHkgpuNf71FkRB+dRx2PqWIFiK4QUwb9MjJU5ztYU30pjrP
 nxPPkvoUh72mYXW3q4GJpxQZu94KXOYfm6BNpcYVqaUDC5fZG79nBrFMTIyH0kOliBzh
 czHIuf9oTy7lszGLxIZZaAvbdlU9emyg3NsCKKUHzAaoIxkBhDF08imi2lwiDaplfxCH
 iBvh70APozCg/dT2YlFf7ZZrWHX1sXEU/Q9fghRJ1xz2og0DkVrATJkZlf9lGYX8j7L7
 EBHEmbbx0KcosylK80EV/8kOUVbCTqgiwTFfZjts77j4E0PTgpmpU1zQYz9FGnCnB8BT
 WIgA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuz7MdiQehTvc3KJf+j/F"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.28.0 SBL|AUTH)
 with ESMTPSA id j06a90v8OE3Q1mi
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 24 Sep 2019 16:03:26 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2019 16:03:13 +0200
Message-Id: <20190924140319.11303-3-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190924140319.11303-1-olaf@aepfle.de>
References: <20190924140319.11303-1-olaf@aepfle.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH RESEND v1 2/8] tools: move scripts from etc to
 libexec
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
bmVkLW9mZi1ieTogT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgotLS0KIG00L3BhdGhzLm00
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvbTQvcGF0aHMubTQgYi9tNC9wYXRocy5tNAppbmRleCA4OWQzYmI4MzEyLi4w
Y2NjOTJkMGZmIDEwMDY0NAotLS0gYS9tNC9wYXRocy5tNAorKysgYi9tNC9wYXRocy5tNApAQCAt
MTM3LDcgKzEzNyw3IEBAIEFDX1NVQlNUKElOSVREX0RJUikKIFhFTl9DT05GSUdfRElSPSRDT05G
SUdfRElSL3hlbgogQUNfU1VCU1QoWEVOX0NPTkZJR19ESVIpCiAKLVhFTl9TQ1JJUFRfRElSPSRY
RU5fQ09ORklHX0RJUi9zY3JpcHRzCitYRU5fU0NSSVBUX0RJUj0ke0xJQkVYRUN9L3NjcmlwdHMK
IEFDX1NVQlNUKFhFTl9TQ1JJUFRfRElSKQogCiBjYXNlICIkaG9zdF9vcyIgaW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
