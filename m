Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 824DD15B3E3
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 23:36:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j20aP-0003X2-1l; Wed, 12 Feb 2020 22:34:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X/s5=4A=amazon.com=prvs=304f9ffca=anchalag@srs-us1.protection.inumbo.net>)
 id 1j20aN-0003Wg-42
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 22:34:23 +0000
X-Inumbo-ID: d0a94e98-4de7-11ea-b0fd-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0a94e98-4de7-11ea-b0fd-bc764e2007e4;
 Wed, 12 Feb 2020 22:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581546863; x=1613082863;
 h=date:from:to:subject:message-id:mime-version;
 bh=Eo18FuPqTI4s9/8b+RyMmqnZX5xJ4fL1BD2xZjVWSBE=;
 b=mY3E4OGEZvstavDfNfa2/qa6u4Twa7Cm2DszTXho4H/Smv/MmIcvH71I
 YtV0ZXFPG8akppBAcxMti1No2Og4b3Ti/SIH5J5WA+V+RX6W0idp0cE7C
 +l4txKlcrV3B159hvg2TZgqbMIskdE4/f2XHNjtynCWVM2RJgblyiko2M Y=;
IronPort-SDR: CAoTjaJQmXCSqypAs4vlySVkxQ/IlBFjWb07NalXRqztxgZBJy36fgeRw1UIfOlZSSKUHy7wPG
 GxFxRyu9NIIA==
X-IronPort-AV: E=Sophos;i="5.70,434,1574121600"; d="scan'208";a="16327964"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 12 Feb 2020 22:34:21 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS
 id 7E329A24DF; Wed, 12 Feb 2020 22:34:19 +0000 (UTC)
Received: from EX13D05UWC001.ant.amazon.com (10.43.162.82) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 12 Feb 2020 22:34:13 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05UWC001.ant.amazon.com (10.43.162.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 12 Feb 2020 22:34:13 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Wed, 12 Feb 2020 22:34:13 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 58D23400D1; Wed, 12 Feb 2020 22:34:13 +0000 (UTC)
Date: Wed, 12 Feb 2020 22:34:13 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>, 
 <x86@kernel.org>, <boris.ostrovsky@oracle.com>, <jgross@suse.com>,
 <linux-pm@vger.kernel.org>, <linux-mm@kvack.org>, <kamatam@amazon.com>,
 <sstabellini@kernel.org>, <konrad.wilk@oracle.com>, <roger.pau@citrix.com>,
 <axboe@kernel.dk>, <davem@davemloft.net>, <rjw@rjwysocki.net>,
 <len.brown@intel.com>, <pavel@ucw.cz>, <peterz@infradead.org>,
 <eduval@amazon.com>, <sblbir@amazon.com>, <anchalag@amazon.com>,
 <xen-devel@lists.xenproject.org>, <vkuznets@redhat.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dwmw@amazon.co.uk>, <fllinden@amaozn.com>, <benh@kernel.crashing.org>
Message-ID: <20200212223413.GA4354@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH v3 09/12] x86/xen: save and restore steal
 clock
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTXVuZWhpc2EgS2FtYXRhIDxrYW1hdGFtQGFtYXpvbi5jb20+CgpTYXZlIHN0ZWFsIGNs
b2NrIHZhbHVlcyBvZiBhbGwgcHJlc2VudCBDUFVzIGluIHRoZSBzeXN0ZW0gY29yZSBvcHMKc3Vz
cGVuZCBjYWxsYmFja3MuIEFsc28sIHJlc3RvcmUgYSBib290IENQVSdzIHN0ZWFsIGNsb2NrIGlu
IHRoZSBzeXN0ZW0KY29yZSByZXN1bWUgY2FsbGJhY2suIEZvciBub24tYm9vdCBDUFVzLCByZXN0
b3JlIGFmdGVyIHRoZXkncmUgYnJvdWdodAp1cCwgYmVjYXVzZSBydW5zdGF0ZSBpbmZvIGZvciBu
b24tYm9vdCBDUFVzIGFyZSBub3QgYWN0aXZlIHVudGlsIHRoZW4uCgpTaWduZWQtb2ZmLWJ5OiBN
dW5laGlzYSBLYW1hdGEgPGthbWF0YW1AYW1hem9uLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5jaGFs
IEFnYXJ3YWwgPGFuY2hhbGFnQGFtYXpvbi5jb20+CgotLS0KQ2hhbmdlcyBzaW5jZSBWMjoKICAg
ICogU2VwYXJhdGUgcGF0Y2ggdG8gYWRkIHNhdmUvcmVzdG9yZSBjYWxsIHRvIHN1c3BlbmQvcmVz
dW1lIGNvZGUKLS0tCiBhcmNoL3g4Ni94ZW4vc3VzcGVuZC5jIHwgMTMgKysrKysrKysrKysrLQog
YXJjaC94ODYveGVuL3RpbWUuYyAgICB8ICAzICsrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL3N1c3Bl
bmQuYyBiL2FyY2gveDg2L3hlbi9zdXNwZW5kLmMKaW5kZXggNzg0YzQ0ODQxMDBiLi5kYWUwZjc0
ZjUzOTAgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9zdXNwZW5kLmMKKysrIGIvYXJjaC94ODYv
eGVuL3N1c3BlbmQuYwpAQCAtOTEsMTIgKzkxLDIwIEBAIHZvaWQgeGVuX2FyY2hfc3VzcGVuZCh2
b2lkKQogc3RhdGljIGludCB4ZW5fc3lzY29yZV9zdXNwZW5kKHZvaWQpCiB7CiAJc3RydWN0IHhl
bl9yZW1vdmVfZnJvbV9waHlzbWFwIHhyZnA7Ci0JaW50IHJldDsKKwlpbnQgY3B1LCByZXQ7CiAK
IAkvKiBYZW4gc3VzcGVuZCBkb2VzIHNpbWlsYXIgc3R1ZmZzIGluIGl0cyBvd24gbG9naWMgKi8K
IAlpZiAoeGVuX3N1c3BlbmRfbW9kZV9pc194ZW5fc3VzcGVuZCgpKQogCQlyZXR1cm4gMDsKIAor
CWZvcl9lYWNoX3ByZXNlbnRfY3B1KGNwdSkgeworCQkvKgorCQkgKiBOb25ib290IENQVXMgYXJl
IGFscmVhZHkgb2ZmbGluZSwgYnV0IHRoZSBsYXN0IGNvcHkgb2YKKwkJICogcnVuc3RhdGUgaW5m
byBpcyBzdGlsbCBhY2Nlc3NpYmxlLgorCQkgKi8KKwkJeGVuX3NhdmVfc3RlYWxfY2xvY2soY3B1
KTsKKwl9CisKIAl4cmZwLmRvbWlkID0gRE9NSURfU0VMRjsKIAl4cmZwLmdwZm4gPSBfX3BhKEhZ
UEVSVklTT1Jfc2hhcmVkX2luZm8pID4+IFBBR0VfU0hJRlQ7CiAKQEAgLTExOCw2ICsxMjYsOSBA
QCBzdGF0aWMgdm9pZCB4ZW5fc3lzY29yZV9yZXN1bWUodm9pZCkKIAogCXB2Y2xvY2tfcmVzdW1l
KCk7CiAKKwkvKiBOb25ib290IENQVXMgd2lsbCBiZSByZXN1bWVkIHdoZW4gdGhleSdyZSBicm91
Z2h0IHVwICovCisJeGVuX3Jlc3RvcmVfc3RlYWxfY2xvY2soc21wX3Byb2Nlc3Nvcl9pZCgpKTsK
KwogCWdudHRhYl9yZXN1bWUoKTsKIH0KIApkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL3RpbWUu
YyBiL2FyY2gveDg2L3hlbi90aW1lLmMKaW5kZXggYmVmYmRkOGIxN2YwLi44Y2Y2MzJkZGE2MDUg
MTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi90aW1lLmMKKysrIGIvYXJjaC94ODYveGVuL3RpbWUu
YwpAQCAtNTM3LDYgKzUzNyw5IEBAIHN0YXRpYyB2b2lkIHhlbl9odm1fc2V0dXBfY3B1X2Nsb2Nr
ZXZlbnRzKHZvaWQpCiB7CiAJaW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKIAl4ZW5fc2V0
dXBfcnVuc3RhdGVfaW5mbyhjcHUpOworCWlmIChjcHUpCisJCXhlbl9yZXN0b3JlX3N0ZWFsX2Ns
b2NrKGNwdSk7CisKIAkvKgogCSAqIHhlbl9zZXR1cF90aW1lcihjcHUpIC0gc25wcmludGYgaXMg
YmFkIGluIGF0b21pYyBjb250ZXh0LiBIZW5jZQogCSAqIGRvaW5nIGl0IHhlbl9odm1fY3B1X25v
dGlmeSAod2hpY2ggZ2V0cyBjYWxsZWQgYnkgc21wX2luaXQgZHVyaW5nCi0tIAoyLjI0LjEuQU1a
TgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
