Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 659DDB4743
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 08:17:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA6m6-00010s-KW; Tue, 17 Sep 2019 06:15:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+VJ/=XM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iA6m5-00010l-RJ
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 06:15:41 +0000
X-Inumbo-ID: 92dfac32-d912-11e9-9601-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92dfac32-d912-11e9-9601-12813bfff9fa;
 Tue, 17 Sep 2019 06:15:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9346CAE22;
 Tue, 17 Sep 2019 06:15:40 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
Message-ID: <46ce7d1a-2a04-726c-919b-2d8bb4844391@suse.com>
Date: Tue, 17 Sep 2019 08:15:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 5/9] x86/HVM: refuse CR3 loads with reserved
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
b20+ClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
LS0tCnYyOiBTaW1wbGlmeSB0aGUgZXhwcmVzc2lvbnMgdXNlZCBmb3IgdGhlIHJlc2VydmVkIGJp
dCBjaGVja3MuCgotLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9odm0vaHZtLmMKQEAgLTEwMDQsNiArMTAwNCwxMyBAQCBzdGF0aWMgaW50IGh2bV9sb2FkX2Nw
dV9jdHh0KHN0cnVjdCBkb21hCiAgICAgICAgIHJldHVybiAtRUlOVkFMOwogICAgIH0KIAorICAg
IGlmICggY3R4dC5jcjMgPj4gZC0+YXJjaC5jcHVpZC0+ZXh0ZC5tYXhwaHlzYWRkciApCisgICAg
eworICAgICAgICBwcmludGsoWEVOTE9HX0dfRVJSICJIVk0lZCByZXN0b3JlOiBiYWQgQ1IzICUj
IiBQUkl4NjQgIlxuIiwKKyAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCwgY3R4dC5jcjMpOwor
ICAgICAgICByZXR1cm4gWDg2RU1VTF9FWENFUFRJT047CisgICAgfQorCiAgICAgaWYgKCAoY3R4
dC5mbGFncyAmIH5YRU5fWDg2X0ZQVV9JTklUSUFMSVNFRCkgIT0gMCApCiAgICAgewogICAgICAg
ICBncHJpbnRrKFhFTkxPR19FUlIsICJiYWQgZmxhZ3MgdmFsdWUgaW4gQ1BVIGNvbnRleHQ6ICUj
eFxuIiwKQEAgLTIyOTAsMTAgKzIyOTcsMTggQEAgaW50IGh2bV9zZXRfY3IwKHVuc2lnbmVkIGxv
bmcgdmFsdWUsIGJvbwogaW50IGh2bV9zZXRfY3IzKHVuc2lnbmVkIGxvbmcgdmFsdWUsIGJvb2wg
bm9mbHVzaCwgYm9vbCBtYXlfZGVmZXIpCiB7CiAgICAgc3RydWN0IHZjcHUgKnYgPSBjdXJyZW50
OworICAgIHN0cnVjdCBkb21haW4gKmN1cnJkID0gdi0+ZG9tYWluOwogICAgIHN0cnVjdCBwYWdl
X2luZm8gKnBhZ2U7CiAgICAgdW5zaWduZWQgbG9uZyBvbGQgPSB2LT5hcmNoLmh2bS5ndWVzdF9j
clszXTsKIAotICAgIGlmICggbWF5X2RlZmVyICYmIHVubGlrZWx5KHYtPmRvbWFpbi0+YXJjaC5t
b25pdG9yLndyaXRlX2N0cmxyZWdfZW5hYmxlZCAmCisgICAgaWYgKCB2YWx1ZSA+PiBjdXJyZC0+
YXJjaC5jcHVpZC0+ZXh0ZC5tYXhwaHlzYWRkciApCisgICAgeworICAgICAgICBIVk1fREJHX0xP
RyhEQkdfTEVWRUxfMSwKKyAgICAgICAgICAgICAgICAgICAgIkF0dGVtcHQgdG8gc2V0IHJlc2Vy
dmVkIENSMyBiaXQocyk6ICVseCIsIHZhbHVlKTsKKyAgICAgICAgcmV0dXJuIFg4NkVNVUxfRVhD
RVBUSU9OOworICAgIH0KKworICAgIGlmICggbWF5X2RlZmVyICYmIHVubGlrZWx5KGN1cnJkLT5h
cmNoLm1vbml0b3Iud3JpdGVfY3RybHJlZ19lbmFibGVkICYKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBtb25pdG9yX2N0cmxyZWdfYml0bWFzayhWTV9FVkVOVF9YODZfQ1IzKSkgKQog
ICAgIHsKICAgICAgICAgQVNTRVJUKHYtPmFyY2gudm1fZXZlbnQpOwpAQCAtMjMwOSwxMyArMjMy
NCwxMiBAQCBpbnQgaHZtX3NldF9jcjModW5zaWduZWQgbG9uZyB2YWx1ZSwgYm9vCiAgICAgICAg
IH0KICAgICB9CiAKLSAgICBpZiAoIGh2bV9wYWdpbmdfZW5hYmxlZCh2KSAmJiAhcGFnaW5nX21v
ZGVfaGFwKHYtPmRvbWFpbikgJiYKKyAgICBpZiAoIGh2bV9wYWdpbmdfZW5hYmxlZCh2KSAmJiAh
cGFnaW5nX21vZGVfaGFwKGN1cnJkKSAmJgogICAgICAgICAgKHZhbHVlICE9IHYtPmFyY2guaHZt
Lmd1ZXN0X2NyWzNdKSApCiAgICAgewogICAgICAgICAvKiBTaGFkb3ctbW9kZSBDUjMgY2hhbmdl
LiBDaGVjayBQREJSIGFuZCB1cGRhdGUgcmVmY291bnRzLiAqLwogICAgICAgICBIVk1fREJHX0xP
RyhEQkdfTEVWRUxfVk1NVSwgIkNSMyB2YWx1ZSA9ICVseCIsIHZhbHVlKTsKLSAgICAgICAgcGFn
ZSA9IGdldF9wYWdlX2Zyb21fZ2ZuKHYtPmRvbWFpbiwgdmFsdWUgPj4gUEFHRV9TSElGVCwKLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwsIFAyTV9BTExPQyk7CisgICAgICAg
IHBhZ2UgPSBnZXRfcGFnZV9mcm9tX2dmbihjdXJyZCwgdmFsdWUgPj4gUEFHRV9TSElGVCwgTlVM
TCwgUDJNX0FMTE9DKTsKICAgICAgICAgaWYgKCAhcGFnZSApCiAgICAgICAgICAgICBnb3RvIGJh
ZF9jcjM7CiAKQEAgLTIzMzEsNyArMjM0NSw3IEBAIGludCBodm1fc2V0X2NyMyh1bnNpZ25lZCBs
b25nIHZhbHVlLCBib28KIAogIGJhZF9jcjM6CiAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwgIklu
dmFsaWQgQ1IzXG4iKTsKLSAgICBkb21haW5fY3Jhc2godi0+ZG9tYWluKTsKKyAgICBkb21haW5f
Y3Jhc2goY3VycmQpOwogICAgIHJldHVybiBYODZFTVVMX1VOSEFORExFQUJMRTsKIH0KIAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
