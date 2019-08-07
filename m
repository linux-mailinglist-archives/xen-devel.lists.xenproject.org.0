Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7002984A60
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 13:13:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvJqF-0000Uo-EL; Wed, 07 Aug 2019 11:10:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4Flz=WD=amazon.de=prvs=115546d28=wipawel@srs-us1.protection.inumbo.net>)
 id 1hvJqC-0000Uj-VV
 for xen-devel@lists.xen.org; Wed, 07 Aug 2019 11:10:49 +0000
X-Inumbo-ID: 014d0062-b904-11e9-8980-bc764e045a96
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 014d0062-b904-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 11:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1565176246; x=1596712246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=70wvJNsYEt1AtY5SiHe3PVq6eN0xf28P0BOuTXB6954=;
 b=aVHRLTamNTBqDnRWSxX5lG/TF+qU9P8autdVO+JrNe/TLPbq0i0mKmcR
 /7BS/qhGwYfs/KlOiGPWYScrM6YzG1WFlw4UHmY9WbzRCHA+3LhbUGGgb
 QW8bpm6J4xACyJgmyI6EvYmvORQAtGwk7BDwRbQfEz4ILVdQwy3RXkYrn M=;
X-IronPort-AV: E=Sophos;i="5.64,357,1559520000"; d="scan'208";a="778143886"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 07 Aug 2019 11:10:44 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 29959A22B4; Wed,  7 Aug 2019 11:10:44 +0000 (UTC)
Received: from EX13D03EUC004.ant.amazon.com (10.43.164.33) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 7 Aug 2019 11:10:43 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D03EUC004.ant.amazon.com (10.43.164.33) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 7 Aug 2019 11:10:42 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server
 id 15.0.1367.3 via Frontend Transport; Wed, 7 Aug 2019 11:10:40 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 7 Aug 2019 11:10:29 +0000
Message-ID: <20190807111029.67766-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190408083224.104802-4-wipawel@amazon.de>
References: <20190408083224.104802-4-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [livepatch-build-tools v2 4/4] livepatch-build: Handle
 newly created object files
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: mpohlack@amazon.de, ross.lagerwall@citrix.com,
 Pawel Wieczorkiewicz <wipawel@amazon.de>, konrad.wilk@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXAgdG8gbm93IHRoZSBsaXZlcGF0Y2gtYnVpbGQgaWdub3JlcyBuZXdseSBjcmVhdGVkIG9iamVj
dCBmaWxlcy4KV2hlbiBwYXRjaCBhcHBsaWVzIG5ldyAuYyBmaWxlIGFuZCBhdWdtZW50cyBpdHMg
TWFrZWZpbGUgdG8gYnVpbGQgaXQKdGhlIHJlc3VsdGluZyBvYmplY3QgZmlsZSBpcyBub3QgdGFr
ZW4gaW50byBhY2NvdW50IGZvciBmaW5hbCBsaW5raW5nCnN0ZXAuCgpTdWNoIG5ld2x5IGNyZWF0
ZWQgb2JqZWN0IGZpbGVzIGNhbiBiZSBkZXRlY3RlZCBieSBjb21wYXJpbmcgcGF0Y2hlZC8KYW5k
IG9yaWdpbmFsLyBkaXJlY3RvcmllcyBhbmQgY29waWVkIG92ZXIgdG8gdGhlIG91dHB1dCBkaXJl
Y3RvcnkgZm9yCnRoZSBmaW5hbCBsaW5raW5nIHN0ZXAuCgpTaWduZWQtb2ZmLWJ5OiBQYXdlbCBX
aWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+ClJldmlld2VkLWJ5OiBBbmRyYS1Jcmlu
YSBQYXJhc2NoaXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+ClJldmlld2VkLWJ5OiBCam9lcm4gRG9l
YmVsIDxkb2ViZWxAYW1hem9uLmRlPgpSZXZpZXdlZC1ieTogTm9yYmVydCBNYW50aGV5IDxubWFu
dGhleUBhbWF6b24uZGU+Ci0tLQp2MjoKKiBGaXhlZCBwYXRocyB0byBwcm9jZXNzIG9ubHkgaHlw
ZXJ2aXNvciBjaGFuZ2VzCiogQ2hhbmdpbmcgZGlyZWN0b3J5IGluIHN1YnNoZWxscyB0byBzaW1w
bGlmaWVkIHRoZSBjb21tYW5kCi0tLQogbGl2ZXBhdGNoLWJ1aWxkIHwgNiArKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saXZlcGF0Y2gtYnVpbGQg
Yi9saXZlcGF0Y2gtYnVpbGQKaW5kZXggNzk2ODM4Yy4uM2M0YmYxMyAxMDA3NTUKLS0tIGEvbGl2
ZXBhdGNoLWJ1aWxkCisrKyBiL2xpdmVwYXRjaC1idWlsZApAQCAtMTQ2LDYgKzE0NiwxMiBAQCBm
dW5jdGlvbiBjcmVhdGVfcGF0Y2goKQogICAgICAgICBmaQogICAgIGRvbmUKIAorICAgIE5FV19G
SUxFUz0kKGNvbW0gLTIzIDwoY2QgcGF0Y2hlZC94ZW4gJiYgZmluZCAuIC10eXBlIGYgLW5hbWUg
JyoubycgfCBzb3J0KSA8KGNkIG9yaWdpbmFsL3hlbiAmJiBmaW5kIC4gLXR5cGUgZiAtbmFtZSAn
Ki5vJyB8IHNvcnQpKQorICAgIGZvciBpIGluICRORVdfRklMRVM7IGRvCisgICAgICAgIGNwICJw
YXRjaGVkLyRpIiAib3V0cHV0LyRpIgorICAgICAgICBDSEFOR0VEPTEKKyAgICBkb25lCisKICAg
ICBpZiBbWyAkRVJST1IgLW5lIDAgXV07IHRoZW4KICAgICAgICAgZGllICIkRVJST1IgZXJyb3Io
cykgZW5jb3VudGVyZWQiCiAgICAgZmkKLS0gCjIuMTYuNQoKCgoKQW1hem9uIERldmVsb3BtZW50
IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVm
dHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdl
biBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejog
QmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
