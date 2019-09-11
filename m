Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4D9AFFFC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 17:27:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i84UF-0002Wr-1V; Wed, 11 Sep 2019 15:24:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/an7=XG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i84UD-0002Wj-Sm
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 15:24:49 +0000
X-Inumbo-ID: 4ab65988-d4a8-11e9-83d8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ab65988-d4a8-11e9-83d8-12813bfff9fa;
 Wed, 11 Sep 2019 15:24:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BBFA4B71C;
 Wed, 11 Sep 2019 15:24:47 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
Message-ID: <30619001-ca6c-0450-a0bb-4d71687b281a@suse.com>
Date: Wed, 11 Sep 2019 17:24:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
Content-Language: en-US
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hpbGUgYml0cyAxMSBhbmQgYmVsb3cgYXJlLCBpZiBub3QgdXNlZCBmb3Igb3RoZXIgcHVycG9z
ZXMsIHJlc2VydmVkCmJ1dCBpZ25vcmVkLCBiaXRzIGJleW9uZCBwaHlzaWNhbCBhZGRyZXNzIHdp
ZHRoIGFyZSBzdXBwb3NlZCB0byByYWlzZQpleGNlcHRpb25zIChhdCBsZWFzdCBpbiB0aGUgbm9u
LW5lc3RlZCBjYXNlOyBJJ20gbm90IGNvbnZpbmNlZCB0aGUKY3VycmVudCBuZXN0ZWQgU1ZNL1ZN
WCBiZWhhdmlvciBvZiByYWlzaW5nICNHUCgwKSBoZXJlIGlzIGNvcnJlY3QsIGJ1dAp0aGF0J3Mg
bm90IHRoZSBzdWJqZWN0IG9mIHRoaXMgY2hhbmdlKS4KCkludHJvZHVjZSBjdXJyZCBhcyBhIGxv
Y2FsIHZhcmlhYmxlLCBhbmQgcmVwbGFjZSBvdGhlciB2LT5kb21haW4KaW5zdGFuY2VzIGF0IHRo
ZSBzYW1lIHRpbWUuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgotLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0v
aHZtLmMKQEAgLTEwMDQsNiArMTAwNCwxMyBAQCBzdGF0aWMgaW50IGh2bV9sb2FkX2NwdV9jdHh0
KHN0cnVjdCBkb21hCiAgICAgICAgIHJldHVybiAtRUlOVkFMOwogICAgIH0KIAorICAgIGlmICgg
Y3R4dC5jcjMgJiB+KCgxVUwgPDwgZC0+YXJjaC5jcHVpZC0+ZXh0ZC5tYXhwaHlzYWRkcikgLSAx
KSApCisgICAgeworICAgICAgICBwcmludGsoWEVOTE9HX0dfRVJSICJIVk0lZCByZXN0b3JlOiBi
YWQgQ1IzICUjIiBQUkl4NjQgIlxuIiwKKyAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCwgY3R4
dC5jcjMpOworICAgICAgICByZXR1cm4gWDg2RU1VTF9FWENFUFRJT047CisgICAgfQorCiAgICAg
aWYgKCAoY3R4dC5mbGFncyAmIH5YRU5fWDg2X0ZQVV9JTklUSUFMSVNFRCkgIT0gMCApCiAgICAg
ewogICAgICAgICBncHJpbnRrKFhFTkxPR19FUlIsICJiYWQgZmxhZ3MgdmFsdWUgaW4gQ1BVIGNv
bnRleHQ6ICUjeFxuIiwKQEAgLTIyOTAsMTAgKzIyOTcsMTkgQEAgaW50IGh2bV9zZXRfY3IwKHVu
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
ICAgQVNTRVJUKHYtPmFyY2gudm1fZXZlbnQpOwpAQCAtMjMwOSwxMyArMjMyNSwxMiBAQCBpbnQg
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
LTIzMzEsNyArMjM0Niw3IEBAIGludCBodm1fc2V0X2NyMyh1bnNpZ25lZCBsb25nIHZhbHVlLCBi
b28KIAogIGJhZF9jcjM6CiAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwgIkludmFsaWQgQ1IzXG4i
KTsKLSAgICBkb21haW5fY3Jhc2godi0+ZG9tYWluKTsKKyAgICBkb21haW5fY3Jhc2goY3VycmQp
OwogICAgIHJldHVybiBYODZFTVVMX1VOSEFORExFQUJMRTsKIH0KIAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
