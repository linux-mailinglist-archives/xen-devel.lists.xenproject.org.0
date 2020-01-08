Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD6213460C
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 16:23:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipD91-0003lY-Mj; Wed, 08 Jan 2020 15:21:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cZrZ=25=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1ipD90-0003lN-8O
 for xen-devel@lists.xen.org; Wed, 08 Jan 2020 15:21:14 +0000
X-Inumbo-ID: 816b7bfe-322a-11ea-b82c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 816b7bfe-322a-11ea-b82c-12813bfff9fa;
 Wed, 08 Jan 2020 15:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578496873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=CBiNfqLK+RYJY53+Zy5oTUVCpIc9aHTTwEyGVMnpP8M=;
 b=abZ1Tgjsok+KGbCzGBow1Nv/BBtLMrMUkSozYJhJGtZL6qBzcEpgGzPl
 hz/3CMR4HAmAdf0HHMgXvy6vTYzw0bq9dKq9F22SGPk/31du2pwcBlu0k
 cBLpBa0HrkGG6pMtti9JFm7QzEX8mPyVLeedpS1Y2J/d4lmyQ7X30OtWH Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TqQkzmi9JuPNn7Gy/JzerQopbW+J7Eg/HSvyodqgKwy6liyt49GclLM2WQADT6NXTl/kZ1p9du
 CB4UFLD6ASxEzL/NopyZoPRTvUJtMdivzl3aoQZxabTiYizCWjwv79t8XuBMkzX7EwggzZ5f7f
 akop21WbU3fEBVEfVMqKZd4pJlcm3cFSfFwHD9lr0HEnFYtOObpdUw54kRdENEoSPEmA10/AUG
 I/1BaEq0Xz7pvyfyQ5KUeoqXtJZyfi9TrJLmDoPbTN07bw6Li+uwoY0bWydcCWLSGwnyQoo4SG
 iuU=
X-SBRS: 2.7
X-MesageID: 11004133
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,410,1571716800"; d="scan'208";a="11004133"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>, <kasan-dev@googlegroups.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 8 Jan 2020 15:20:59 +0000
Message-ID: <20200108152100.7630-4-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108152100.7630-1-sergey.dyasli@citrix.com>
References: <20200108152100.7630-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v1 3/4] xen: teach KASAN about grant tables
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
ZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+Ci0tLQpSRkMgLS0+IHYxOgotIFNsaWdodGx5IGNsYXJp
ZmllZCB0aGUgY29tbWl0IG1lc3NhZ2UKLS0tCiBkcml2ZXJzL3hlbi9ncmFudC10YWJsZS5jIHwg
NSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2dyYW50LXRhYmxlLmMgYi9kcml2ZXJzL3hlbi9ncmFu
dC10YWJsZS5jCmluZGV4IDdiMzZiNTFjZGI5Zi4uY2U5NWY3MjMyZGU2IDEwMDY0NAotLS0gYS9k
cml2ZXJzL3hlbi9ncmFudC10YWJsZS5jCisrKyBiL2RyaXZlcnMveGVuL2dyYW50LXRhYmxlLmMK
QEAgLTEwNDgsNiArMTA0OCw3IEBAIGludCBnbnR0YWJfbWFwX3JlZnMoc3RydWN0IGdudHRhYl9t
YXBfZ3JhbnRfcmVmICptYXBfb3BzLAogCQkJZm9yZWlnbiA9IHhlbl9wYWdlX2ZvcmVpZ24ocGFn
ZXNbaV0pOwogCQkJZm9yZWlnbi0+ZG9taWQgPSBtYXBfb3BzW2ldLmRvbTsKIAkJCWZvcmVpZ24t
PmdyZWYgPSBtYXBfb3BzW2ldLnJlZjsKKwkJCWthc2FuX2FsbG9jX3BhZ2VzKHBhZ2VzW2ldLCAw
KTsKIAkJCWJyZWFrOwogCQl9CiAKQEAgLTEwODQsOCArMTA4NSwxMCBAQCBpbnQgZ250dGFiX3Vu
bWFwX3JlZnMoc3RydWN0IGdudHRhYl91bm1hcF9ncmFudF9yZWYgKnVubWFwX29wcywKIAlpZiAo
cmV0KQogCQlyZXR1cm4gcmV0OwogCi0JZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspCisJZm9y
IChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsKIAkJQ2xlYXJQYWdlRm9yZWlnbihwYWdlc1tpXSk7
CisJCWthc2FuX2ZyZWVfcGFnZXMocGFnZXNbaV0sIDApOworCX0KIAogCXJldHVybiBjbGVhcl9m
b3JlaWduX3AybV9tYXBwaW5nKHVubWFwX29wcywga3VubWFwX29wcywgcGFnZXMsIGNvdW50KTsK
IH0KLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
