Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5BE140A63
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 14:02:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isRDM-0000Zg-9N; Fri, 17 Jan 2020 12:59:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DzQF=3G=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1isRDK-0000ZY-LH
 for xen-devel@lists.xen.org; Fri, 17 Jan 2020 12:59:02 +0000
X-Inumbo-ID: 1cca0980-3929-11ea-b50e-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1cca0980-3929-11ea-b50e-12813bfff9fa;
 Fri, 17 Jan 2020 12:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579265933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ywAvLbKeKQp6PcfZNKxLqWjMzTVb67I6xCcacZ5Wc18=;
 b=RdqtF1aC8J1ECtTpEzAIUSmeZnA+7lR9qM0LqguhyWG1npphA5T2HAAb
 F7hoEtaNoHvjb6rRXTsKjUADaBDzmJsS0m31otRzALyVHTMOW4bsqaIP5
 DQWlaQqtY7r+Uzlu/rB5u1QrMDEqjYBKCGQbmt3QqZNfwSkrKc5zdSCHD k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4K2b8rhSn6Bty/2FeakfJIIEi9epWLUPjincSgeuRAu5pyL+OY4PJyunZoqDVPeYO09GJ/VK4K
 narFurd17xBXf16uWXwA7fBa1ckrXq1fVu9EkdKeYrgeo5RCSdbtBsOkBpYi8BCq2CfnOi1egZ
 ib7LB64xnr0247GhQMXkV270Qsn70bxOaLGssXupnyoK4PdmGod153bQyC6h8gHO0+rb/fwvXT
 6QIHgC+JsxI9y4yOi9lBCh5sI0AkUSuFtz55BMHzP7MuI8Ihy2HqETn/QJzleCS5hP5D3Ybis9
 aJ4=
X-SBRS: 2.7
X-MesageID: 11502056
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11502056"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>, <kasan-dev@googlegroups.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 17 Jan 2020 12:58:33 +0000
Message-ID: <20200117125834.14552-4-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200117125834.14552-1-sergey.dyasli@citrix.com>
References: <20200117125834.14552-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 3/4] xen: teach KASAN about grant tables
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano
 Stabellini <sstabellini@kernel.org>, George Dunlap <george.dunlap@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpPdGhlcndp
c2UgaXQgcHJvZHVjZXMgbG90cyBvZiBmYWxzZSBwb3NpdGl2ZXMgd2hlbiBhIGd1ZXN0IHN0YXJ0
cyB1c2luZwpQViBJL08gZGV2aWNlcy4KClNpZ25lZC1vZmYtYnk6IFJvc3MgTGFnZXJ3YWxsIDxy
b3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgRHlhc2xpIDxz
ZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+Ci0tLQp2MSAtLT4gdjI6Ci0gbm8gY2hhbmdlcwoKUkZD
IC0tPiB2MToKLSBTbGlnaHRseSBjbGFyaWZpZWQgdGhlIGNvbW1pdCBtZXNzYWdlCi0tLQogZHJp
dmVycy94ZW4vZ3JhbnQtdGFibGUuYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9ncmFudC10
YWJsZS5jIGIvZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYwppbmRleCA3YjM2YjUxY2RiOWYuLmNl
OTVmNzIzMmRlNiAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYworKysgYi9k
cml2ZXJzL3hlbi9ncmFudC10YWJsZS5jCkBAIC0xMDQ4LDYgKzEwNDgsNyBAQCBpbnQgZ250dGFi
X21hcF9yZWZzKHN0cnVjdCBnbnR0YWJfbWFwX2dyYW50X3JlZiAqbWFwX29wcywKIAkJCWZvcmVp
Z24gPSB4ZW5fcGFnZV9mb3JlaWduKHBhZ2VzW2ldKTsKIAkJCWZvcmVpZ24tPmRvbWlkID0gbWFw
X29wc1tpXS5kb207CiAJCQlmb3JlaWduLT5ncmVmID0gbWFwX29wc1tpXS5yZWY7CisJCQlrYXNh
bl9hbGxvY19wYWdlcyhwYWdlc1tpXSwgMCk7CiAJCQlicmVhazsKIAkJfQogCkBAIC0xMDg0LDgg
KzEwODUsMTAgQEAgaW50IGdudHRhYl91bm1hcF9yZWZzKHN0cnVjdCBnbnR0YWJfdW5tYXBfZ3Jh
bnRfcmVmICp1bm1hcF9vcHMsCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCWZvciAoaSA9
IDA7IGkgPCBjb3VudDsgaSsrKQorCWZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7CiAJCUNs
ZWFyUGFnZUZvcmVpZ24ocGFnZXNbaV0pOworCQlrYXNhbl9mcmVlX3BhZ2VzKHBhZ2VzW2ldLCAw
KTsKKwl9CiAKIAlyZXR1cm4gY2xlYXJfZm9yZWlnbl9wMm1fbWFwcGluZyh1bm1hcF9vcHMsIGt1
bm1hcF9vcHMsIHBhZ2VzLCBjb3VudCk7CiB9Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
