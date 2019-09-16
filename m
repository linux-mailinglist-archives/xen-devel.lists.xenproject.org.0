Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B88B396D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 13:33:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9pEV-0003GZ-IB; Mon, 16 Sep 2019 11:31:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GGTU=XL=amazon.de=prvs=1553567f6=wipawel@srs-us1.protection.inumbo.net>)
 id 1i9pEU-0003FR-3u
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 11:31:50 +0000
X-Inumbo-ID: 928945ba-d875-11e9-a337-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 928945ba-d875-11e9-a337-bc764e2007e4;
 Mon, 16 Sep 2019 11:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1568633509; x=1600169509;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=GmZtrssx6BOZIhZluRjhLFWKc5PRC+d2Xoj/L4xkyZ8=;
 b=OKuaSx2cdGedjffxwsy0sp6Q2HkSRYT2PMXdozFBFxMxHFknBf82nEND
 G4nmuKcSW0pynq9++E3ekN53Gz3paFo+9MP+JVUghxrC7XBthXkF+lMMI
 Va8VCex3pwgqdld7HWsXMCvjRJ/pgeJrS/GcA8SreJXY77udUWbFcU5UK s=;
X-IronPort-AV: E=Sophos;i="5.64,512,1559520000"; d="scan'208";a="415450125"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-af6a10df.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 16 Sep 2019 11:31:49 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-af6a10df.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2D9AEA2300; Mon, 16 Sep 2019 11:31:46 +0000 (UTC)
Received: from EX13D03EUC004.ant.amazon.com (10.43.164.33) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Sep 2019 11:31:31 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D03EUC004.ant.amazon.com (10.43.164.33) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Sep 2019 11:31:30 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Mon, 16 Sep 2019 11:31:26 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>, <xen-devel@lists.xenproject.org>
Date: Mon, 16 Sep 2019 11:30:54 +0000
Message-ID: <20190916113056.16592-6-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190916113056.16592-1-wipawel@amazon.de>
References: <20190916113056.16592-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 5/7] create-diff-object: Add support for
 expectations
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RXh0ZW5kIGxpdmVwYXRjaF9wYXRjaF9mdW5jIHRvIHN1cHBvcnQgYSBuZXcgZmllbGQ6IGV4cGVj
dC4gVGhpcyBuZXcKZmllbGQgZGVzY3JpYmVzIHRoZSBleHBlY3RlZCBkYXRhLCBpdHMgbGVuZ3Ro
IGFuZCB3aGV0aGVyIGV4cGVjdGF0aW9uCmlzIGVuYWJsZWQuIFRoZSBleHBlY3RhdGlvbidzIGRh
dGEgaXMgb2Ygb3BhcXVlIHBhZGRpbmcgc2l6ZS4KCkJ5IGRlZmF1bHQgdGhlIGV4cGVjdGF0aW9u
IGZpZWxkIGlzIHplcm8tb3V0IGFuZCB0aGUgZXhwZWN0YXRpb24gaXMKZGlzYWJsZWQgdW5sZXNz
IGV4cGxpY2l0bHkgc3BlY2lmaWVkIGluIHRoZSBwYXRjaC4KClNpZ25lZC1vZmYtYnk6IFBhd2Vs
IFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KLS0tCkNoYW5nZWQgc2luY2UgdjE6
CiAgKiBEbyBub3QgYnVtcCB0aGUgcGF5bG9hZCB2ZXJzaW9uIGFnYWluLgoKIGNvbW1vbi5oICAg
ICAgICAgICAgIHwgMTEgKysrKysrKysrKy0KIGNyZWF0ZS1kaWZmLW9iamVjdC5jIHwgIDEgKwog
MiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvY29tbW9uLmggYi9jb21tb24uaAppbmRleCBkOGNkZTM1Li43YzZmYjczIDEwMDY0NAot
LS0gYS9jb21tb24uaAorKysgYi9jb21tb24uaApAQCAtMTE1LDYgKzExNSwxNCBAQCBzdHJ1Y3Qg
a3BhdGNoX2VsZiB7CiB9OwogCiAjZGVmaW5lIFBBVENIX0lOU05fU0laRSA1CisjZGVmaW5lIE1B
WF9SRVBMQUNFTUVOVF9TSVpFIDMxCitzdHJ1Y3QgbGl2ZXBhdGNoX2V4cGVjdGF0aW9uIHsKKwl1
aW50OF90IGVuYWJsZWQgOiAxOworCXVpbnQ4X3QgbGVuIDogNTsKKwl1aW50OF90IHBhZCA6IDI7
CisJdWludDhfdCBkYXRhW01BWF9SRVBMQUNFTUVOVF9TSVpFXTsKK307Cit0eXBlZGVmIHN0cnVj
dCBsaXZlcGF0Y2hfZXhwZWN0YXRpb24gbGl2ZXBhdGNoX2V4cGVjdGF0aW9uX3Q7CiAKIHN0cnVj
dCBsaXZlcGF0Y2hfcGF0Y2hfZnVuYyB7CiAJY2hhciAqbmFtZTsKQEAgLTEyMyw5ICsxMzEsMTAg
QEAgc3RydWN0IGxpdmVwYXRjaF9wYXRjaF9mdW5jIHsKIAl1aW50MzJfdCBuZXdfc2l6ZTsKIAl1
aW50MzJfdCBvbGRfc2l6ZTsKIAl1aW50OF90IHZlcnNpb247Ci0JdW5zaWduZWQgY2hhciBwYWRb
MzFdOworCXVuc2lnbmVkIGNoYXIgcGFkW01BWF9SRVBMQUNFTUVOVF9TSVpFXTsKIAl1aW50OF90
IGFwcGxpZWQ7CiAJdWludDhfdCBfcGFkWzddOworCWxpdmVwYXRjaF9leHBlY3RhdGlvbl90IGV4
cGVjdDsKIH07CiAKIHN0cnVjdCBzcGVjaWFsX3NlY3Rpb24gewpkaWZmIC0tZ2l0IGEvY3JlYXRl
LWRpZmYtb2JqZWN0LmMgYi9jcmVhdGUtZGlmZi1vYmplY3QuYwppbmRleCBkNTE4NTAzLi5lNDU5
MmE2IDEwMDY0NAotLS0gYS9jcmVhdGUtZGlmZi1vYmplY3QuYworKysgYi9jcmVhdGUtZGlmZi1v
YmplY3QuYwpAQCAtMjAxOCw2ICsyMDE4LDcgQEAgc3RhdGljIHZvaWQgbGl2ZXBhdGNoX2NyZWF0
ZV9wYXRjaGVzX3NlY3Rpb25zKHN0cnVjdCBrcGF0Y2hfZWxmICprZWxmLAogCQkJbWVtc2V0KGZ1
bmNzW2luZGV4XS5wYWQsIDAsIHNpemVvZiBmdW5jc1tpbmRleF0ucGFkKTsKIAkJCWZ1bmNzW2lu
ZGV4XS5hcHBsaWVkID0gMDsKIAkJCW1lbXNldChmdW5jc1tpbmRleF0uX3BhZCwgMCwgc2l6ZW9m
IGZ1bmNzW2luZGV4XS5fcGFkKTsKKwkJCW1lbXNldCgmZnVuY3NbaW5kZXhdLmV4cGVjdCwgMCwg
c2l6ZW9mIGZ1bmNzW2luZGV4XS5leHBlY3QpOwogCiAJCQkvKgogCQkJICogQWRkIGEgcmVsb2Nh
dGlvbiB0aGF0IHdpbGwgcG9wdWxhdGUKLS0gCjIuMTYuNQoKCgoKQW1hem9uIERldmVsb3BtZW50
IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVm
dHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdl
biBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejog
QmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
