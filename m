Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F47F140A61
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 14:02:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isRDG-0000ZS-Vt; Fri, 17 Jan 2020 12:58:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DzQF=3G=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1isRDF-0000ZN-Nr
 for xen-devel@lists.xen.org; Fri, 17 Jan 2020 12:58:57 +0000
X-Inumbo-ID: 1c1a9784-3929-11ea-b50e-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c1a9784-3929-11ea-b50e-12813bfff9fa;
 Fri, 17 Jan 2020 12:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579265932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=4o9RJx4StHoB6G/jxqKKoPDaZjJC3Q3+qMbkHErq6tg=;
 b=DJ2UebC23ulFqCWrWFy7lopLru5unv2smwT3KcCQIsO5XMdm+eOXaKTh
 8skgxQ/64qsRXCDx7VlOgP7gzsb9GsL3I/VSAbdRsBRqUyWXg0HOH8lqC
 OqGnXGDlQvcYROgvmXDcj0WKZetmEXDG714jpy0mvinwIdPLpKQG/4v88 E=;
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
IronPort-SDR: zD3guFlkH9JhD+uSChmLcxdihehn1gAY55V0yNOLmfd5xHNkkyjQkaG1rNe8JDLriMbXtqsdj0
 81dpZI705lNPF60X/LSI9Zed8Ipu/jX3FdGD0/VCa2xZQHYWL1ajeD5dMTEwtRTi9r2yF6xi9U
 BWpJr6wpKSm7udaVNwywU2OV5nt7AoxiT6BZueqhYAr6rFhXtL4h856U0/kqypBQmHvOBz7pSc
 dndcgglECoHTuRJtrokHRkSL/prOB0icVkoTw4UuoGG6SOWAn45h1sm75ZIutyTQgiKCbBK8cc
 FgM=
X-SBRS: 2.7
X-MesageID: 11502055
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11502055"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>, <kasan-dev@googlegroups.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 17 Jan 2020 12:58:31 +0000
Message-ID: <20200117125834.14552-2-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200117125834.14552-1-sergey.dyasli@citrix.com>
References: <20200117125834.14552-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/4] kasan: introduce set_pmd_early_shadow()
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

SXQgaXMgaW5jb3JyZWN0IHRvIGNhbGwgcG1kX3BvcHVsYXRlX2tlcm5lbCgpIG11bHRpcGxlIHRp
bWVzIGZvciB0aGUKc2FtZSBwYWdlIHRhYmxlIGZyb20gaW5zaWRlIFhlbiBQViBkb21haW5zLiBY
ZW4gbm90aWNlcyBpdCBkdXJpbmcKa2FzYW5fcG9wdWxhdGVfZWFybHlfc2hhZG93KCk6CgogICAg
KFhFTikgbW0uYzozMjIyOmQxNTV2MCBtZm4gMzcwNGIgYWxyZWFkeSBwaW5uZWQKClRoaXMgaGFw
cGVucyBmb3Iga2FzYW5fZWFybHlfc2hhZG93X3B0ZSB3aGVuIFVTRV9TUExJVF9QVEVfUFRMT0NL
UyBpcwplbmFibGVkLiBGaXggdGhpcyBieSBpbnRyb2R1Y2luZyBzZXRfcG1kX2Vhcmx5X3NoYWRv
dygpIHdoaWNoIGNhbGxzCnBtZF9wb3B1bGF0ZV9rZXJuZWwoKSBvbmx5IG9uY2UgYW5kIHVzZXMg
c2V0X3BtZCgpIGFmdGVyd2FyZHMuCgpTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJn
ZXkuZHlhc2xpQGNpdHJpeC5jb20+Ci0tLQp2MSAtLT4gdjI6Ci0gRml4IGNvbXBpbGF0aW9uIHdp
dGhvdXQgQ09ORklHX1hFTl9QVgotIFNsaWdodGx5IHVwZGF0ZWQgZGVzY3JpcHRpb24KClJGQyAt
LT4gdjE6Ci0gTmV3IHBhdGNoCi0tLQogbW0va2FzYW4vaW5pdC5jIHwgMzIgKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL2thc2FuL2luaXQuYyBiL21tL2thc2FuL2lu
aXQuYwppbmRleCBjZTQ1YzQ5MWViY2QuLjc3OTFmZTBhNzcwNCAxMDA2NDQKLS0tIGEvbW0va2Fz
YW4vaW5pdC5jCisrKyBiL21tL2thc2FuL2luaXQuYwpAQCAtODEsNiArODEsMjYgQEAgc3RhdGlj
IGlubGluZSBib29sIGthc2FuX2Vhcmx5X3NoYWRvd19wYWdlX2VudHJ5KHB0ZV90IHB0ZSkKIAly
ZXR1cm4gcHRlX3BhZ2UocHRlKSA9PSB2aXJ0X3RvX3BhZ2UobG1fYWxpYXMoa2FzYW5fZWFybHlf
c2hhZG93X3BhZ2UpKTsKIH0KIAorI2lmZGVmIENPTkZJR19YRU5fUFYKK3N0YXRpYyBpbmxpbmUg
dm9pZCBzZXRfcG1kX2Vhcmx5X3NoYWRvdyhwbWRfdCAqcG1kKQoreworCXN0YXRpYyBib29sIHBt
ZF9wb3B1bGF0ZWQgPSBmYWxzZTsKKwlwdGVfdCAqZWFybHlfc2hhZG93ID0gbG1fYWxpYXMoa2Fz
YW5fZWFybHlfc2hhZG93X3B0ZSk7CisKKwlpZiAobGlrZWx5KHBtZF9wb3B1bGF0ZWQpKSB7CisJ
CXNldF9wbWQocG1kLCBfX3BtZChfX3BhKGVhcmx5X3NoYWRvdykgfCBfUEFHRV9UQUJMRSkpOwor
CX0gZWxzZSB7CisJCXBtZF9wb3B1bGF0ZV9rZXJuZWwoJmluaXRfbW0sIHBtZCwgZWFybHlfc2hh
ZG93KTsKKwkJcG1kX3BvcHVsYXRlZCA9IHRydWU7CisJfQorfQorI2Vsc2UKK3N0YXRpYyBpbmxp
bmUgdm9pZCBzZXRfcG1kX2Vhcmx5X3NoYWRvdyhwbWRfdCAqcG1kKQoreworCXBtZF9wb3B1bGF0
ZV9rZXJuZWwoJmluaXRfbW0sIHBtZCwgbG1fYWxpYXMoa2FzYW5fZWFybHlfc2hhZG93X3B0ZSkp
OworfQorI2VuZGlmIC8qIGlmZGVmIENPTkZJR19YRU5fUFYgKi8KKwogc3RhdGljIF9faW5pdCB2
b2lkICplYXJseV9hbGxvYyhzaXplX3Qgc2l6ZSwgaW50IG5vZGUpCiB7CiAJdm9pZCAqcHRyID0g
bWVtYmxvY2tfYWxsb2NfdHJ5X25pZChzaXplLCBzaXplLCBfX3BhKE1BWF9ETUFfQUREUkVTUyks
CkBAIC0xMjAsOCArMTQwLDcgQEAgc3RhdGljIGludCBfX3JlZiB6ZXJvX3BtZF9wb3B1bGF0ZShw
dWRfdCAqcHVkLCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJCW5leHQgPSBwbWRfYWRkcl9lbmQoYWRk
ciwgZW5kKTsKIAogCQlpZiAoSVNfQUxJR05FRChhZGRyLCBQTURfU0laRSkgJiYgZW5kIC0gYWRk
ciA+PSBQTURfU0laRSkgewotCQkJcG1kX3BvcHVsYXRlX2tlcm5lbCgmaW5pdF9tbSwgcG1kLAot
CQkJCQlsbV9hbGlhcyhrYXNhbl9lYXJseV9zaGFkb3dfcHRlKSk7CisJCQlzZXRfcG1kX2Vhcmx5
X3NoYWRvdyhwbWQpOwogCQkJY29udGludWU7CiAJCX0KIApAQCAtMTU3LDggKzE3Niw3IEBAIHN0
YXRpYyBpbnQgX19yZWYgemVyb19wdWRfcG9wdWxhdGUocDRkX3QgKnA0ZCwgdW5zaWduZWQgbG9u
ZyBhZGRyLAogCQkJcHVkX3BvcHVsYXRlKCZpbml0X21tLCBwdWQsCiAJCQkJCWxtX2FsaWFzKGth
c2FuX2Vhcmx5X3NoYWRvd19wbWQpKTsKIAkJCXBtZCA9IHBtZF9vZmZzZXQocHVkLCBhZGRyKTsK
LQkJCXBtZF9wb3B1bGF0ZV9rZXJuZWwoJmluaXRfbW0sIHBtZCwKLQkJCQkJbG1fYWxpYXMoa2Fz
YW5fZWFybHlfc2hhZG93X3B0ZSkpOworCQkJc2V0X3BtZF9lYXJseV9zaGFkb3cocG1kKTsKIAkJ
CWNvbnRpbnVlOwogCQl9CiAKQEAgLTE5OCw4ICsyMTYsNyBAQCBzdGF0aWMgaW50IF9fcmVmIHpl
cm9fcDRkX3BvcHVsYXRlKHBnZF90ICpwZ2QsIHVuc2lnbmVkIGxvbmcgYWRkciwKIAkJCXB1ZF9w
b3B1bGF0ZSgmaW5pdF9tbSwgcHVkLAogCQkJCQlsbV9hbGlhcyhrYXNhbl9lYXJseV9zaGFkb3df
cG1kKSk7CiAJCQlwbWQgPSBwbWRfb2Zmc2V0KHB1ZCwgYWRkcik7Ci0JCQlwbWRfcG9wdWxhdGVf
a2VybmVsKCZpbml0X21tLCBwbWQsCi0JCQkJCWxtX2FsaWFzKGthc2FuX2Vhcmx5X3NoYWRvd19w
dGUpKTsKKwkJCXNldF9wbWRfZWFybHlfc2hhZG93KHBtZCk7CiAJCQljb250aW51ZTsKIAkJfQog
CkBAIC0yNzEsOCArMjg4LDcgQEAgaW50IF9fcmVmIGthc2FuX3BvcHVsYXRlX2Vhcmx5X3NoYWRv
dyhjb25zdCB2b2lkICpzaGFkb3dfc3RhcnQsCiAJCQlwdWRfcG9wdWxhdGUoJmluaXRfbW0sIHB1
ZCwKIAkJCQkJbG1fYWxpYXMoa2FzYW5fZWFybHlfc2hhZG93X3BtZCkpOwogCQkJcG1kID0gcG1k
X29mZnNldChwdWQsIGFkZHIpOwotCQkJcG1kX3BvcHVsYXRlX2tlcm5lbCgmaW5pdF9tbSwgcG1k
LAotCQkJCQlsbV9hbGlhcyhrYXNhbl9lYXJseV9zaGFkb3dfcHRlKSk7CisJCQlzZXRfcG1kX2Vh
cmx5X3NoYWRvdyhwbWQpOwogCQkJY29udGludWU7CiAJCX0KIAotLSAKMi4xNy4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
