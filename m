Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 141AA118EC
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 14:22:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMAi5-0005FB-Q2; Thu, 02 May 2019 12:21:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMAi4-0005Eu-7a
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 12:21:08 +0000
X-Inumbo-ID: bf6d4c96-6cd4-11e9-b7b7-6f1c86a0a9d2
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf6d4c96-6cd4-11e9-b7b7-6f1c86a0a9d2;
 Thu, 02 May 2019 12:21:01 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 06:21:00 -0600
Message-Id: <5CCAE0AA020000780022B30A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 06:20:58 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
In-Reply-To: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 5/9] x86/HVM: refuse CR3 loads with reserved
 (upper) bits set
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hpbGUgYml0cyAxMSBhbmQgYmVsb3cgYXJlLCBpdCBub3QgdXNlZCBmb3Igb3RoZXIgcHVycG9z
ZXMsIHJlc2VydmVkCmJ1dCBpZ25vcmVkLCBiaXRzIGJleW9uZCBwaHlzaWNhbCBhZGRyZXNzIHdp
ZHRoIGFyZSBzdXBwb3NlZCB0byByYWlzZQpleGNlcHRpb25zIChhdCBsZWFzdCBpbiB0aGUgbm9u
LW5lc3RlZCBjYXNlOyBJJ20gbm90IGNvbnZpbmNlZCB0aGUKY3VycmVudCBuZXN0ZWQgU1ZNL1ZN
WCBiZWhhdmlvciBvZiByYWlzaW5nICNHUCgwKSBoZXJlIGlzIGNvcnJlY3QsIGJ1dAp0aGF0J3Mg
bm90IHRoZSBzdWJqZWN0IG9mIHRoaXMgY2hhbmdlKS4KCkludHJvZHVjZSBjdXJyZCBhcyBhIGxv
Y2FsIHZhcmlhYmxlLCBhbmQgcmVwbGFjZSBvdGhlciB2LT5kb21haW4KaW5zdGFuY2VzIGF0IHRo
ZSBzYW1lIHRpbWUuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgotLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0v
aHZtLmMKQEAgLTEwMDMsNiArMTAwMywxMyBAQCBzdGF0aWMgaW50IGh2bV9sb2FkX2NwdV9jdHh0
KHN0cnVjdCBkb21hCiAgICAgICAgIHJldHVybiAtRUlOVkFMOwogICAgIH0KIAorICAgIGlmICgg
Y3R4dC5jcjMgJiB+KCgxVUwgPDwgZC0+YXJjaC5jcHVpZC0+ZXh0ZC5tYXhwaHlzYWRkcikgLSAx
KSApCisgICAgeworICAgICAgICBwcmludGsoWEVOTE9HX0dfRVJSICJIVk0lZCByZXN0b3JlOiBi
YWQgQ1IzICUjIiBQUkl4NjQgIlxuIiwKKyAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCwgY3R4
dC5jcjMpOworICAgICAgICByZXR1cm4gWDg2RU1VTF9FWENFUFRJT047CisgICAgfQorCiAgICAg
aWYgKCAoY3R4dC5mbGFncyAmIH5YRU5fWDg2X0ZQVV9JTklUSUFMSVNFRCkgIT0gMCApCiAgICAg
ewogICAgICAgICBncHJpbnRrKFhFTkxPR19FUlIsICJiYWQgZmxhZ3MgdmFsdWUgaW4gQ1BVIGNv
bnRleHQ6ICUjeFxuIiwKQEAgLTIyODQsMTAgKzIyOTEsMTkgQEAgaW50IGh2bV9zZXRfY3IwKHVu
c2lnbmVkIGxvbmcgdmFsdWUsIGJvbwogaW50IGh2bV9zZXRfY3IzKHVuc2lnbmVkIGxvbmcgdmFs
dWUsIGJvb2wgbm9mbHVzaCwgYm9vbCBtYXlfZGVmZXIpCiB7CiAgICAgc3RydWN0IHZjcHUgKnYg
PSBjdXJyZW50OworICAgIHN0cnVjdCBkb21haW4gKmN1cnJkID0gdi0+ZG9tYWluOwogICAgIHN0
cnVjdCBwYWdlX2luZm8gKnBhZ2U7CiAgICAgdW5zaWduZWQgbG9uZyBvbGQgPSB2LT5hcmNoLmh2
bS5ndWVzdF9jclszXTsKIAotICAgIGlmICggbWF5X2RlZmVyICYmIHVubGlrZWx5KHYtPmRvbWFp
bi0+YXJjaC5tb25pdG9yLndyaXRlX2N0cmxyZWdfZW5hYmxlZCAmCisgICAgaWYgKCB2YWx1ZSAm
IH4oKDFVTCA8PCBjdXJyZC0+YXJjaC5jcHVpZC0+ZXh0ZC5tYXhwaHlzYWRkcikgLSAxKSApCisg
ICAgeworICAgICAgICBIVk1fREJHX0xPRyhEQkdfTEVWRUxfMSwKKyAgICAgICAgICAgICAgICAg
ICAgIkF0dGVtcHQgdG8gc2V0IHJlc2VydmVkIENSMyBiaXQocyk6ICVseCIsCisgICAgICAgICAg
ICAgICAgICAgIHZhbHVlKTsKKyAgICAgICAgcmV0dXJuIFg4NkVNVUxfRVhDRVBUSU9OOworICAg
IH0KKworICAgIGlmICggbWF5X2RlZmVyICYmIHVubGlrZWx5KGN1cnJkLT5hcmNoLm1vbml0b3Iu
d3JpdGVfY3RybHJlZ19lbmFibGVkICYKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBt
b25pdG9yX2N0cmxyZWdfYml0bWFzayhWTV9FVkVOVF9YODZfQ1IzKSkgKQogICAgIHsKICAgICAg
ICAgQVNTRVJUKHYtPmFyY2gudm1fZXZlbnQpOwpAQCAtMjMwMywxMyArMjMxOSwxMiBAQCBpbnQg
aHZtX3NldF9jcjModW5zaWduZWQgbG9uZyB2YWx1ZSwgYm9vCiAgICAgICAgIH0KICAgICB9CiAK
LSAgICBpZiAoIGh2bV9wYWdpbmdfZW5hYmxlZCh2KSAmJiAhcGFnaW5nX21vZGVfaGFwKHYtPmRv
bWFpbikgJiYKKyAgICBpZiAoIGh2bV9wYWdpbmdfZW5hYmxlZCh2KSAmJiAhcGFnaW5nX21vZGVf
aGFwKGN1cnJkKSAmJgogICAgICAgICAgKHZhbHVlICE9IHYtPmFyY2guaHZtLmd1ZXN0X2NyWzNd
KSApCiAgICAgewogICAgICAgICAvKiBTaGFkb3ctbW9kZSBDUjMgY2hhbmdlLiBDaGVjayBQREJS
IGFuZCB1cGRhdGUgcmVmY291bnRzLiAqLwogICAgICAgICBIVk1fREJHX0xPRyhEQkdfTEVWRUxf
Vk1NVSwgIkNSMyB2YWx1ZSA9ICVseCIsIHZhbHVlKTsKLSAgICAgICAgcGFnZSA9IGdldF9wYWdl
X2Zyb21fZ2ZuKHYtPmRvbWFpbiwgdmFsdWUgPj4gUEFHRV9TSElGVCwKLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIE5VTEwsIFAyTV9BTExPQyk7CisgICAgICAgIHBhZ2UgPSBnZXRf
cGFnZV9mcm9tX2dmbihjdXJyZCwgdmFsdWUgPj4gUEFHRV9TSElGVCwgTlVMTCwgUDJNX0FMTE9D
KTsKICAgICAgICAgaWYgKCAhcGFnZSApCiAgICAgICAgICAgICBnb3RvIGJhZF9jcjM7CiAKQEAg
LTIzMjUsNyArMjM0MCw3IEBAIGludCBodm1fc2V0X2NyMyh1bnNpZ25lZCBsb25nIHZhbHVlLCBi
b28KIAogIGJhZF9jcjM6CiAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwgIkludmFsaWQgQ1IzXG4i
KTsKLSAgICBkb21haW5fY3Jhc2godi0+ZG9tYWluKTsKKyAgICBkb21haW5fY3Jhc2goY3VycmQp
OwogICAgIHJldHVybiBYODZFTVVMX1VOSEFORExFQUJMRTsKIH0KIAoKCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
