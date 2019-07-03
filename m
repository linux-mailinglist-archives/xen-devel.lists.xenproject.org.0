Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E03FC5E719
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 16:48:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1higWs-0005ku-SG; Wed, 03 Jul 2019 14:46:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2FDs=VA=amazon.de=prvs=080812bc2=vrd@srs-us1.protection.inumbo.net>)
 id 1higWr-0005kp-D2
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 14:46:37 +0000
X-Inumbo-ID: 5b32ffac-9da1-11e9-97f4-5f158e500e76
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b32ffac-9da1-11e9-97f4-5f158e500e76;
 Wed, 03 Jul 2019 14:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1562165196; x=1593701196;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Ln69/s8NSRPhwQRZBcMhq/68rXIZpwIKGbrRxJCQ65Q=;
 b=Lr825ynFohx1X5BVKj4ypynSH0pBMVrRN1uu+VBhXfrihB2zviY+Tblp
 FwE0us6/bB4Xp05hIQibALsLY6kSPmF4cPVtz5lp3Pu9/8BJuHPRGuyRC
 w35tbvGMpHMED4RuxJWMqDxqnUYD0rKkvAfaWY47e20ouulQFQO/AJXjw g=;
X-IronPort-AV: E=Sophos;i="5.62,446,1554768000"; d="scan'208";a="683543398"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 03 Jul 2019 14:46:33 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id 44F28A23CA; Wed,  3 Jul 2019 14:46:31 +0000 (UTC)
Received: from EX13D08UEE004.ant.amazon.com (10.43.62.182) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 3 Jul 2019 14:46:31 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D08UEE004.ant.amazon.com (10.43.62.182) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 3 Jul 2019 14:46:31 +0000
Received: from u908889d5e8f057.ant.amazon.com (10.28.86.21) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 3 Jul 2019 14:46:28 +0000
From: Varad Gautam <vrd@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 3 Jul 2019 16:46:13 +0200
Message-ID: <1562165173-31383-1-git-send-email-vrd@amazon.de>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] x86: irq: Do not BUG_ON multiple unbind calls
 for shared pirqs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Varad
 Gautam <vrd@amazon.de>, Jan Beulich <jbeulich@suse.com>,
 Amit Shah <aams@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgaXMgcG9zc2libGUgdG8gcmVjZWl2ZSBtdWx0aXBsZSBfX3BpcnFfZ3Vlc3RfdW5iaW5kIGNh
bGxzIGZvciB0aGUgc2FtZSBwaXJxCmlmIHRoZSBwaXJxIGhhcyBub3QgeWV0IGJlZW4gcmVtb3Zl
ZCBmcm9tIHRoZSBkb21haW4ncyBwaXJxX3RyZWUuIEZvciBhIHNoYXJlZApwaXJxIChucl9ndWVz
dHMgPiAxKSwgdGhlIGZpcnN0IGNhbGwgemFwcyB0aGUgY3VycmVudCBkb21haW4gZnJvbSB0aGUg
cGlycSdzCmd1ZXN0c1tdIGxpc3QsIGJ1dCB0aGUgYWN0aW9uIGhhbmRsZXIgaXMgbmV2ZXIgZnJl
ZWQgYXMgdGhlcmUgYXJlIG90aGVyIGd1ZXN0cwp1c2luZyB0aGlzIHBpcnEuIEFzIGEgcmVzdWx0
LCBvbiB0aGUgc2Vjb25kIGNhbGwsIF9fcGlycV9ndWVzdF91bmJpbmQgdHJpZXMKc2VhcmNoIGZv
ciB0aGUgY3VycmVudCBkb21haW4gd2hpY2ggaGFzIGJlZW4gcmVtb3ZlZCBmcm9tIHRoZSBndWVz
dHNbXSBsaXN0LAphbmQgaGl0cyBhIEJVR19PTi4KCkFsbG93IHhlbiB0byBjb250aW51ZSBpZiBh
IHNoYXJlZCBwaXJxIGhhcyBhbHJlYWR5IGJlZW4gdW5ib3VuZCBmcm9tIHRoaXMgZ3Vlc3QuCkl0
IHdpbGwgYmUgY2xlYW5lZCB1cCBmcm9tIHRoZSBkb21haW4ncyBwaXJxX3RyZWUgZHVyaW5nIHRo
ZSBkZXN0cnVjdGlvbiBpbgpjb21wbGV0ZV9kb21haW5fZGVzdHJveS4KClNpZ25lZC1vZmYtYnk6
IFZhcmFkIEdhdXRhbSA8dnJkQGFtYXpvbi5kZT4KCi0tLQoKVG8gYXBwbHkgc3RhYmxlLTQuMTEg
b253YXJkcy4KCiB4ZW4vYXJjaC94ODYvaXJxLmMgfCAxMCArKysrKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L2lycS5jIGIveGVuL2FyY2gveDg2L2lycS5jCmluZGV4IDA5NGMzYzUuLjI1NmY1MDMg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYworKysgYi94ZW4vYXJjaC94ODYvaXJxLmMK
QEAgLTE3MTEsNyArMTcxMSwxNSBAQCBzdGF0aWMgaXJxX2d1ZXN0X2FjdGlvbl90ICpfX3BpcnFf
Z3Vlc3RfdW5iaW5kKAogCiAgICAgZm9yICggaSA9IDA7IChpIDwgYWN0aW9uLT5ucl9ndWVzdHMp
ICYmIChhY3Rpb24tPmd1ZXN0W2ldICE9IGQpOyBpKysgKQogICAgICAgICBjb250aW51ZTsKLSAg
ICBCVUdfT04oaSA9PSBhY3Rpb24tPm5yX2d1ZXN0cyk7CisgICAgaWYgKCBpID09IGFjdGlvbi0+
bnJfZ3Vlc3RzICkgeworICAgICAgICAvKiBJbiBjYXNlIHRoZSBwaXJxIHdhcyBzaGFyZWQsIHVu
Ym91bmQgZm9yIHRoaXMgZG9tYWluIGluIGFuIGVhcmxpZXIgY2FsbCwgYnV0IHN0aWxsCisgICAg
ICAgICAqIGV4aXN0ZWQgb24gdGhlIGRvbWFpbidzIHBpcnFfdHJlZSwgd2Ugc3RpbGwgcmVhY2gg
aGVyZSBpZiB0aGVyZSBhcmUgYW55IGxhdGVyCisgICAgICAgICAqIHVuYmluZCBjYWxscyBvbiB0
aGUgc2FtZSBwaXJxLiBSZXR1cm4gaWYgc3VjaCBhbiB1bmJpbmQgaGFwcGVucy4gKi8KKyAgICAg
ICAgaWYgKCBhY3Rpb24tPm5yX2d1ZXN0cyA+IDAgJiYgYWN0aW9uLT5zaGFyZWFibGUgKQorICAg
ICAgICAgICAgcmV0dXJuIE5VTEw7CisgICAgICAgIEJVRygpOworICAgIH0KKwogICAgIG1lbW1v
dmUoJmFjdGlvbi0+Z3Vlc3RbaV0sICZhY3Rpb24tPmd1ZXN0W2krMV0sCiAgICAgICAgICAgICAo
YWN0aW9uLT5ucl9ndWVzdHMtaS0xKSAqIHNpemVvZihhY3Rpb24tPmd1ZXN0WzBdKSk7CiAgICAg
YWN0aW9uLT5ucl9ndWVzdHMtLTsKLS0gCjIuNy40CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2Vu
dGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1
ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJhZ2VuIGFt
IEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJs
aW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
