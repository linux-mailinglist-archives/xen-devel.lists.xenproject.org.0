Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D23D10FBD0
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 11:36:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic5VO-0004Zs-Gt; Tue, 03 Dec 2019 10:34:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pRqY=ZZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ic5VN-0004Zn-DA
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 10:34:05 +0000
X-Inumbo-ID: 6c63fa80-15b8-11ea-83b8-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c63fa80-15b8-11ea-83b8-bc764e2007e4;
 Tue, 03 Dec 2019 10:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575369243;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=33HSHnuFTyGhvZFcRY9MM7OYm3YI/2muldw5f58kxOE=;
 b=D2E5o4m9oOLQePH6KR1qbHQcYDxjWJwXxVJOAaRqzkdTzocIzC8VdO9/
 NRKMv76odJa5tKX9e1oQu07RDEfeeg1fqx83slZqLPL4Soq5vh/x6XhSy
 AWUtIb1uyXlLHQyYZn0K0KnB0cGnhZA3qnpae9z5QmAnfmLJZPPmOQjBg 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7TH6xrY99ct8bYpmflT/5Edwz43suFqpsp6dUN+ThUPk4+DHje2v59QbSYNgq6H4zP65h+ZfRn
 y7F9pk8AybJWy+LsjxUNr2tSMaH6gw5zLa4/sCyDER1x1FiquBhnlCBOp61QqgdWfp16G7j3PG
 ZD5XmPjiUNK9rbR3OK/Qa459iajGG1zCQbz3Hsi+Pk34lHLeh0Q65shZHNQFMMChCknQEw7k9m
 Ano6O7Osg1aPldhqpbz0KtVrBRGRwC/wy2LYI6LGQHmDmRfBeHRlev/1QIqwgRgTV8NS2xaAwL
 g3M=
X-SBRS: 2.7
X-MesageID: 9098518
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,272,1571716800"; 
   d="scan'208";a="9098518"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 3 Dec 2019 11:33:52 +0100
Message-ID: <20191203103352.29728-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191203103352.29728-1-roger.pau@citrix.com>
References: <20191203103352.29728-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] automation: increase tests maximum time
 from 10s to 30s
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Doug Goldstein <cardoe@cardoe.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MTBzIGlzIHRvbyBsb3cgZm9yIHRoZSBjbGFuZyB0ZXN0cywgdGhpcyBpcyB0aGUgb3V0cHV0IGZy
b20gYSBjbGFuZwp0ZXN0OgoKKFhFTikgWyAgICA2LjUxMjc0OF0gKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCihYRU4pIFsgICAgNi41MTMzMjNdIFNF
TEZURVNUIEZBSUxVUkU6IENPUlJFQ1QgQkVIQVZJT1IgQ0FOTk9UIEJFIEdVQVJBTlRFRUQKKFhF
TikgWyAgICA2LjUxMzg5MV0gKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqCihYRU4pIFsgICAgNi41MTQ0NjldIDMuLi4gMi4uLiAxLi4uCihYRU4pIFsg
ICAgOS41MjAwMTFdICoqKiBTZXJpYWwgaW5wdXQgdG8gRE9NMCAodHlwZSAnQ1RSTC1hJyB0aHJl
ZSB0aW1lcyB0byBzd2l0Y2ggaW5wdXQpCihYRU4pIFsgICAgOS41NDQzMTldIEZyZWVkIDQ4OGtC
IGluaXQgbWVtb3J5Ci0tLSBYZW4gVGVzdCBGcmFtZXdvcmsgLS0tCkVudmlyb25tZW50OiBIVk0g
MzJiaXQgKFBBRSAzIGxldmVscykKSGVsbG8gV29ybGQKVGVzdCByZXN1bHQ6IFNVQ0NFU1MKKFhF
TikgWyAgICA5LjYxMDk3N10gSGFyZHdhcmUgRG9tMCBoYWx0ZWQ6IGhhbHRpbmcgbWFjaGluZQoK
QXMgY2FuIGJlIHNlZW4gZnJvbSB0aGUgb3V0cHV0IGFib3ZlIGJvb3RpbmcgWGVuIGFuZCB0aGUg
WFRGIHRlc3QKdGFrZXMgfjEwcywgd2l0aG91dCBhY2NvdW50aW5nIGZvciB0aGUgdGltZSBpdCB0
YWtlcyBmb3IgUUVNVSB0bwppbml0aWFsaXplLgoKSW5jcmVhc2UgdGhlIHRpbWVvdXQgdG8gMzBz
IHRvIGJlIG9uIHRoZSBzYWZlIHNpZGUuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiBhdXRvbWF0aW9uL3NjcmlwdHMvcWVtdS1zbW9r
ZS14ODYtNjQuc2ggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL3NjcmlwdHMvcWVtdS1zbW9rZS14ODYt
NjQuc2ggYi9hdXRvbWF0aW9uL3NjcmlwdHMvcWVtdS1zbW9rZS14ODYtNjQuc2gKaW5kZXggZjM4
ZWFjZmQ5Zi4uMDkxNTJlM2U5YyAxMDA3NTUKLS0tIGEvYXV0b21hdGlvbi9zY3JpcHRzL3FlbXUt
c21va2UteDg2LTY0LnNoCisrKyBiL2F1dG9tYXRpb24vc2NyaXB0cy9xZW11LXNtb2tlLXg4Ni02
NC5zaApAQCAtMjEsNyArMjEsNyBAQCBlc2FjCiAKIHJtIC1mIHNtb2tlLnNlcmlhbAogc2V0ICtl
Ci10aW1lb3V0IC1rIDEgMTAgXAordGltZW91dCAtayAxIDMwIFwKIHFlbXUtc3lzdGVtLXg4Nl82
NCAtbm9ncmFwaGljIC1rZXJuZWwgYmluYXJpZXMveGVuIFwKICAgICAgICAgLWluaXRyZCB4dGYv
dGVzdHMvZXhhbXBsZS8kayBcCiAgICAgICAgIC1hcHBlbmQgImxvZ2x2bD1hbGwgY29tMT0xMTUy
MDAsLDhuMSBjb25zb2xlPWNvbTEgbm9yZWJvb3QgXAotLSAKMi4yNC4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
