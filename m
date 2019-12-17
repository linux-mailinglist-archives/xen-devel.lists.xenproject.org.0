Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4FB122E32
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 15:11:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihDWj-0000br-EK; Tue, 17 Dec 2019 14:08:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6FKB=2H=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1ihDWh-0000bf-Uk
 for xen-devel@lists.xen.org; Tue, 17 Dec 2019 14:08:39 +0000
X-Inumbo-ID: b5c60e93-20d6-11ea-8ed4-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5c60e93-20d6-11ea-8ed4-12813bfff9fa;
 Tue, 17 Dec 2019 14:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576591715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=BCebZje1JdGYax7/evCubLel44DqnREiV6HOFXN0mVg=;
 b=SUMKMBmHSVvPZAM1jfAFlH2gKTo/RDvvqqF/oopHETvZ00lrxOn44B8K
 qQpo4OhbGAZKA3yAvCtgGyKsosV31LVlCJrIR2irjcQP7foTsMOYAtrua
 vh6Px2H1fLD4QX1GqYrMCqvz4u6Xu58Cvvfe6Pq3I7M7lVl2CPt1YDCiM 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OnwOB8MZFY2HS+S16GgpO2BJod5tklhela04K9EMRgoIVuY+Bz+fAliKtL764jlR3H7RnoDJP5
 fTRq9lM3PDOKpdhp351Sx3ptSDf6L1I2NYsKWNenDJGdSeotvZGp0NsZRrnoPNJ5IxRWhRvnSi
 x+PQgPTxbwiBlbCJ1h7yiOikObwD2yYLF+VrinHQVCXiVJ9buTQh7F+F8yTJb02QNMymHBvwH9
 xIfi1VXB6pmA92ICsMD0NODPSViQqpwUzeGxlvOMCK+g4weQE2drcJL+lPJMlMuvIAOZaWdity
 8+w=
X-SBRS: 2.7
X-MesageID: 9817030
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,325,1571716800"; 
   d="scan'208";a="9817030"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>, <kasan-dev@googlegroups.com>,
 <linux-kernel@vger.kernel.org>
Date: Tue, 17 Dec 2019 14:08:03 +0000
Message-ID: <20191217140804.27364-3-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217140804.27364-1-sergey.dyasli@citrix.com>
References: <20191217140804.27364-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC PATCH 2/3] xen: teach KASAN about grant tables
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
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpPdGhlcndp
c2UgaXQgcHJvZHVjZXMgbG90cyBvZiBmYWxzZSBwb3NpdGl2ZXMuCgpTaWduZWQtb2ZmLWJ5OiBS
b3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTog
U2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgotLS0KIGRyaXZlcnMveGVu
L2dyYW50LXRhYmxlLmMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYyBi
L2RyaXZlcnMveGVuL2dyYW50LXRhYmxlLmMKaW5kZXggNDliMzgxZTEwNGVmLi4wZjg0NGMxNGQ1
YjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL2dyYW50LXRhYmxlLmMKKysrIGIvZHJpdmVycy94
ZW4vZ3JhbnQtdGFibGUuYwpAQCAtMTA0OSw2ICsxMDQ5LDcgQEAgaW50IGdudHRhYl9tYXBfcmVm
cyhzdHJ1Y3QgZ250dGFiX21hcF9ncmFudF9yZWYgKm1hcF9vcHMsCiAJCQlmb3JlaWduID0geGVu
X3BhZ2VfZm9yZWlnbihwYWdlc1tpXSk7CiAJCQlmb3JlaWduLT5kb21pZCA9IG1hcF9vcHNbaV0u
ZG9tOwogCQkJZm9yZWlnbi0+Z3JlZiA9IG1hcF9vcHNbaV0ucmVmOworCQkJa2FzYW5fYWxsb2Nf
cGFnZXMocGFnZXNbaV0sIDApOwogCQkJYnJlYWs7CiAJCX0KIApAQCAtMTA4NSw4ICsxMDg2LDEw
IEBAIGludCBnbnR0YWJfdW5tYXBfcmVmcyhzdHJ1Y3QgZ250dGFiX3VubWFwX2dyYW50X3JlZiAq
dW5tYXBfb3BzLAogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKLQlmb3IgKGkgPSAwOyBpIDwg
Y291bnQ7IGkrKykKKwlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykgewogCQlDbGVhclBhZ2VG
b3JlaWduKHBhZ2VzW2ldKTsKKwkJa2FzYW5fZnJlZV9wYWdlcyhwYWdlc1tpXSwgMCk7CisJfQog
CiAJcmV0dXJuIGNsZWFyX2ZvcmVpZ25fcDJtX21hcHBpbmcodW5tYXBfb3BzLCBrdW5tYXBfb3Bz
LCBwYWdlcywgY291bnQpOwogfQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
