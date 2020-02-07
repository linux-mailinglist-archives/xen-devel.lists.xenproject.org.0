Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 520F7155989
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 15:29:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j04b0-0001cQ-88; Fri, 07 Feb 2020 14:27:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=025r=33=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1j04ay-0001c6-Pt
 for xen-devel@lists.xen.org; Fri, 07 Feb 2020 14:27:00 +0000
X-Inumbo-ID: e68e49c4-49b5-11ea-a759-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e68e49c4-49b5-11ea-a759-bc764e2007e4;
 Fri, 07 Feb 2020 14:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581085619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=uXvsgNu6MmeKipdO1plI3DH/B0ELhbFMcurpPA0b8Ak=;
 b=MjT9lM4ZiseCH4swFZA+JURIMXLiNCZAedEgk4JE0LHcRYbGuTkSdtx0
 sNYclCCGgIGv1DEGNegCUyCDlQF+rSwDfDsWJoeUpF73259BjP0PU2mtC
 gY4RbAuQsSFTJdJw5+DiSRX1xYy4MiZRgADT7qt6BPeo1nvJg3YUFS5bj k=;
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
IronPort-SDR: kMMz1oyZramg5ckLxUaxLPT0jR449vrClgivhA3Gm8ZlVz5SUPPvSuwAPwqhJfmuBnoLUKlldo
 E+J7QlpDxutZ8TB8H+ybgc3fuUAHYrc0xcqNp+avLDJaZ2qnpb18hAzEQv4+OTQdbt/JjvDsj4
 ZSVShM3LgJf74tPuBoogRoUg0zc8a2K/oa4k1g1OX6EJulg+1+I7f94ytjWhEYWSDWKiheSTej
 4qyTHoOgsuA9cFUCoVK99dgYp/L2Yj9LBmIw62LAEemsgElBhmTzRPXuV1ZG0Km2IZK39HnLOM
 BzU=
X-SBRS: 2.7
X-MesageID: 12479584
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,413,1574139600"; d="scan'208";a="12479584"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>, <kasan-dev@googlegroups.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 7 Feb 2020 14:26:51 +0000
Message-ID: <20200207142652.670-4-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200207142652.670-1-sergey.dyasli@citrix.com>
References: <20200207142652.670-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 3/4] xen: teach KASAN about grant tables
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
ZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+Ci0tLQp2MiAtLT4gdjM6IG5vIGNoYW5nZXMKCnYxIC0t
PiB2Mjogbm8gY2hhbmdlcwoKUkZDIC0tPiB2MToKLSBTbGlnaHRseSBjbGFyaWZpZWQgdGhlIGNv
bW1pdCBtZXNzYWdlCi0tLQogZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYyB8IDUgKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3hlbi9ncmFudC10YWJsZS5jIGIvZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYwpp
bmRleCA3YjM2YjUxY2RiOWYuLmNlOTVmNzIzMmRlNiAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4v
Z3JhbnQtdGFibGUuYworKysgYi9kcml2ZXJzL3hlbi9ncmFudC10YWJsZS5jCkBAIC0xMDQ4LDYg
KzEwNDgsNyBAQCBpbnQgZ250dGFiX21hcF9yZWZzKHN0cnVjdCBnbnR0YWJfbWFwX2dyYW50X3Jl
ZiAqbWFwX29wcywKIAkJCWZvcmVpZ24gPSB4ZW5fcGFnZV9mb3JlaWduKHBhZ2VzW2ldKTsKIAkJ
CWZvcmVpZ24tPmRvbWlkID0gbWFwX29wc1tpXS5kb207CiAJCQlmb3JlaWduLT5ncmVmID0gbWFw
X29wc1tpXS5yZWY7CisJCQlrYXNhbl9hbGxvY19wYWdlcyhwYWdlc1tpXSwgMCk7CiAJCQlicmVh
azsKIAkJfQogCkBAIC0xMDg0LDggKzEwODUsMTAgQEAgaW50IGdudHRhYl91bm1hcF9yZWZzKHN0
cnVjdCBnbnR0YWJfdW5tYXBfZ3JhbnRfcmVmICp1bm1hcF9vcHMsCiAJaWYgKHJldCkKIAkJcmV0
dXJuIHJldDsKIAotCWZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKQorCWZvciAoaSA9IDA7IGkg
PCBjb3VudDsgaSsrKSB7CiAJCUNsZWFyUGFnZUZvcmVpZ24ocGFnZXNbaV0pOworCQlrYXNhbl9m
cmVlX3BhZ2VzKHBhZ2VzW2ldLCAwKTsKKwl9CiAKIAlyZXR1cm4gY2xlYXJfZm9yZWlnbl9wMm1f
bWFwcGluZyh1bm1hcF9vcHMsIGt1bm1hcF9vcHMsIHBhZ2VzLCBjb3VudCk7CiB9Ci0tIAoyLjE3
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
