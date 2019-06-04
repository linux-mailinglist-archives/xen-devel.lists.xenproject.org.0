Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 591F034D0B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 18:16:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYC4u-0008FQ-Ee; Tue, 04 Jun 2019 16:14:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KH14=UD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hYC4s-0008FK-HF
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 16:14:22 +0000
X-Inumbo-ID: cf4e14f4-86e3-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cf4e14f4-86e3-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 16:14:20 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: BZADW8kW85YFKpOyeWKNfK6q9YUtkFU4IBTkv1dE2/CXI9CNlnIZKd+8nVreEIEtaNr8UslgRe
 tWlKZawhOu6wqWH+W9UX7WKtc/gl9jJEwAQiRWyWcSpo1YwkKOJNh/nbISPKZ1PQSyxa0G1Nle
 UUTS99tfrbzjUaepO7Kj3zpzaKkVmilAhcbHFWredSrkrwfQ5K73FgVvvSWnf8dCX++sChNaAV
 AeeVjbODMSbyhq8PqCfE3pk3qQJ0wDcqna6ezdI5oVmG8q2VAAgOUv+yTAq8xjLMvjPaowoSr8
 /KM=
X-SBRS: 2.7
X-MesageID: 1275818
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1275818"
To: Chao Gao <chao.gao@intel.com>, <xen-devel@lists.xenproject.org>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-2-git-send-email-chao.gao@intel.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <e3507e72-00c4-0e00-b2d3-3d11b4a54a59@citrix.com>
Date: Tue, 4 Jun 2019 17:14:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1558945891-3015-2-git-send-email-chao.gao@intel.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v7 01/10] misc/xen-ucode: Upload a microcode
 blob to the hypervisor
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDUvMjAxOSAwOTozMSwgQ2hhbyBHYW8gd3JvdGU6Cj4gVGhpcyBwYXRjaCBwcm92aWRl
cyBhIHRvb2wgZm9yIGxhdGUgbWljcm9jb2RlIHVwZGF0ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEtv
bnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjc6
Cj4gIC0gaW50cm9kdWNlIHhjX21pY3JvY29kZV91cGRhdGUoKSByYXRoZXIgdGhhbiB4Y19wbGF0
Zm9ybV9vcCgpCj4gIC0gYXZvaWQgY3JlYXRpbmcgYm91bmNlIGJ1ZmZlciB0d2ljZQo+ICAtIHJl
bmFtZSB4ZW5taWNyb2NvZGUgdG8geGVuLXVjb2RlLCBmb2xsb3dpbmcgbmFtaW5nIHRyYWRpdGlv
bgo+ICBvZiBvdGhlciB0b29scyB0aGVyZS4KPgo+IC0tLQo+ICB0b29scy9saWJ4Yy9pbmNsdWRl
L3hlbmN0cmwuaCB8ICAxICsKPiAgdG9vbHMvbGlieGMveGNfbWlzYy5jICAgICAgICAgfCAyMyAr
KysrKysrKysrKysrCj4gIHRvb2xzL21pc2MvTWFrZWZpbGUgICAgICAgICAgIHwgIDQgKysrCj4g
IHRvb2xzL21pc2MveGVuLXVjb2RlLmMgICAgICAgIHwgNzggKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDEwNiBpbnNlcnRpb25z
KCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9taXNjL3hlbi11Y29kZS5jCj4KPiBkaWZm
IC0tZ2l0IGEvdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmggYi90b29scy9saWJ4Yy9pbmNs
dWRlL3hlbmN0cmwuaAo+IGluZGV4IDUzODAwN2EuLjZkODBhZTUgMTAwNjQ0Cj4gLS0tIGEvdG9v
bHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmgKPiArKysgYi90b29scy9saWJ4Yy9pbmNsdWRlL3hl
bmN0cmwuaAo+IEBAIC0xMjQ0LDYgKzEyNDQsNyBAQCB0eXBlZGVmIHVpbnQzMl90IHhjX25vZGVf
dG9fbm9kZV9kaXN0X3Q7Cj4gIGludCB4Y19waHlzaW5mbyh4Y19pbnRlcmZhY2UgKnhjaCwgeGNf
cGh5c2luZm9fdCAqaW5mbyk7Cj4gIGludCB4Y19jcHV0b3BvaW5mbyh4Y19pbnRlcmZhY2UgKnhj
aCwgdW5zaWduZWQgKm1heF9jcHVzLAo+ICAgICAgICAgICAgICAgICAgICAgeGNfY3B1dG9wb190
ICpjcHV0b3BvKTsKPiAraW50IHhjX21pY3JvY29kZV91cGRhdGUoeGNfaW50ZXJmYWNlICp4Y2gs
IGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IGxlbik7Cj4gIGludCB4Y19udW1haW5mbyh4Y19pbnRl
cmZhY2UgKnhjaCwgdW5zaWduZWQgKm1heF9ub2RlcywKPiAgICAgICAgICAgICAgICAgIHhjX21l
bWluZm9fdCAqbWVtaW5mbywgdWludDMyX3QgKmRpc3RhbmNlKTsKPiAgaW50IHhjX3BjaXRvcG9p
bmZvKHhjX2ludGVyZmFjZSAqeGNoLCB1bnNpZ25lZCBudW1fZGV2cywKPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvbGlieGMveGNfbWlzYy5jIGIvdG9vbHMvbGlieGMveGNfbWlzYy5jCj4gaW5kZXggNWU2
NzE0YS4uODU1MzhlMCAxMDA2NDQKPiAtLS0gYS90b29scy9saWJ4Yy94Y19taXNjLmMKPiArKysg
Yi90b29scy9saWJ4Yy94Y19taXNjLmMKPiBAQCAtMjI2LDYgKzIyNiwyOSBAQCBpbnQgeGNfcGh5
c2luZm8oeGNfaW50ZXJmYWNlICp4Y2gsCj4gICAgICByZXR1cm4gMDsKPiAgfQo+ICAKPiAraW50
IHhjX21pY3JvY29kZV91cGRhdGUoeGNfaW50ZXJmYWNlICp4Y2gsIGNvbnN0IHZvaWQgKmJ1Ziwg
c2l6ZV90IGxlbikKPiArewo+ICsgICAgaW50IHJldDsKPiArICAgIERFQ0xBUkVfUExBVEZPUk1f
T1A7Cj4gKyAgICBERUNMQVJFX0hZUEVSQ0FMTF9CVUZGRVIoc3RydWN0IHhlbnBmX21pY3JvY29k
ZV91cGRhdGUsIHVjKTsKPiArCj4gKyAgICB1YyA9IHhjX2h5cGVyY2FsbF9idWZmZXJfYWxsb2Mo
eGNoLCB1YywgbGVuKTsKPiArICAgIGlmICh1YyA9PSBOVUxMKQoKWGVuIHN0eWxlLsKgIEV4dHJh
IHNwYWNlIHBsZWFzZS4KCj4gKyAgICAgICAgcmV0dXJuIC0xOwo+ICsKPiArICAgIG1lbWNweSh1
YywgYnVmLCBsZW4pOwo+ICsKPiArICAgIHBsYXRmb3JtX29wLmNtZCA9IFhFTlBGX21pY3JvY29k
ZV91cGRhdGU7Cj4gKyAgICBwbGF0Zm9ybV9vcC51Lm1pY3JvY29kZS5sZW5ndGggPSBsZW47Cj4g
KyAgICBzZXRfeGVuX2d1ZXN0X2hhbmRsZShwbGF0Zm9ybV9vcC51Lm1pY3JvY29kZS5kYXRhLCB1
Yyk7Cj4gKwo+ICsgICAgcmV0ID0gZG9fcGxhdGZvcm1fb3AoeGNoLCAmcGxhdGZvcm1fb3ApOwo+
ICsKPiArICAgIHhjX2h5cGVyY2FsbF9idWZmZXJfZnJlZSh4Y2gsIHVjKTsKPiArCj4gKyAgICBy
ZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICBpbnQgeGNfY3B1dG9wb2luZm8oeGNfaW50ZXJmYWNlICp4
Y2gsIHVuc2lnbmVkICptYXhfY3B1cywKPiAgICAgICAgICAgICAgICAgICAgIHhjX2NwdXRvcG9f
dCAqY3B1dG9wbykKPiAgewo+IGRpZmYgLS1naXQgYS90b29scy9taXNjL01ha2VmaWxlIGIvdG9v
bHMvbWlzYy9NYWtlZmlsZQo+IGluZGV4IGQ0MzIwZGMuLjYzOTQ3YmYgMTAwNjQ0Cj4gLS0tIGEv
dG9vbHMvbWlzYy9NYWtlZmlsZQo+ICsrKyBiL3Rvb2xzL21pc2MvTWFrZWZpbGUKPiBAQCAtMjIs
NiArMjIsNyBAQCBJTlNUQUxMX1NCSU4tJChDT05GSUdfWDg2KSAgICAgKz0geGVuLWh2bWNyYXNo
Cj4gIElOU1RBTExfU0JJTi0kKENPTkZJR19YODYpICAgICArPSB4ZW4taHZtY3R4Cj4gIElOU1RB
TExfU0JJTi0kKENPTkZJR19YODYpICAgICArPSB4ZW4tbG93bWVtZAo+ICBJTlNUQUxMX1NCSU4t
JChDT05GSUdfWDg2KSAgICAgKz0geGVuLW1mbmR1bXAKPiArSU5TVEFMTF9TQklOLSQoQ09ORklH
X1g4NikgICAgICs9IHhlbi11Y29kZQo+ICBJTlNUQUxMX1NCSU4gICAgICAgICAgICAgICAgICAg
Kz0geGVuY292Cj4gIElOU1RBTExfU0JJTiAgICAgICAgICAgICAgICAgICArPSB4ZW5sb2NrcHJv
Zgo+ICBJTlNUQUxMX1NCSU4gICAgICAgICAgICAgICAgICAgKz0geGVucGVyZgo+IEBAIC0xMTMs
NCArMTE0LDcgQEAgeGVuLWxvd21lbWQ6IHhlbi1sb3dtZW1kLm8KPiAgeGVuY292OiB4ZW5jb3Yu
bwo+ICAJJChDQykgJChMREZMQUdTKSAtbyAkQCAkPCAkKExETElCU19saWJ4ZW5jdHJsKSAkKEFQ
UEVORF9MREZMQUdTKQo+ICAKPiAreGVuLXVjb2RlOiB4ZW4tdWNvZGUubwo+ICsJJChDQykgJChM
REZMQUdTKSAtbyAkQCAkPCAkKExETElCU19saWJ4ZW5jdHJsKSAkKEFQUEVORF9MREZMQUdTKQo+
ICsKPiAgLWluY2x1ZGUgJChERVBTX0lOQ0xVREUpCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL21pc2Mv
eGVuLXVjb2RlLmMgYi90b29scy9taXNjL3hlbi11Y29kZS5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwLi5kYTY2OGNhCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3Rvb2xz
L21pc2MveGVuLXVjb2RlLmMKPiBAQCAtMCwwICsxLDc4IEBACj4gKyNkZWZpbmUgX0dOVV9TT1VS
Q0UKPiArCj4gKyNpbmNsdWRlIDxzdGRpby5oPgo+ICsjaW5jbHVkZSA8c3RkbGliLmg+Cj4gKyNp
bmNsdWRlIDxzeXMvbW1hbi5oPgo+ICsjaW5jbHVkZSA8ZXJybm8uaD4KPiArI2luY2x1ZGUgPHN0
cmluZy5oPgo+ICsjaW5jbHVkZSA8aW50dHlwZXMuaD4KPiArI2luY2x1ZGUgPHVuaXN0ZC5oPgo+
ICsjaW5jbHVkZSA8c3lzL3R5cGVzLmg+Cj4gKyNpbmNsdWRlIDxzeXMvc3RhdC5oPgo+ICsjaW5j
bHVkZSA8ZmNudGwuaD4KPiArI2luY2x1ZGUgPHhlbmN0cmwuaD4KPiArCj4gK3ZvaWQgc2hvd19o
ZWxwKHZvaWQpCj4gK3sKPiArICAgIGZwcmludGYoc3RkZXJyLAo+ICsgICAgICAgICAgICAieGVu
bWljcm9jb2RlOiBYZW4gbWljcm9jb2RlIHVwZGF0aW5nIHRvb2xcbiIKPiArICAgICAgICAgICAg
IlVzYWdlOiB4ZW5taWNyb2NvZGUgPG1pY3JvY29kZSBibG9iPlxuIik7CgpzL3hlbm1pY3JvY29k
ZS94ZW4tdWNvZGUvCgpCb3RoIGNhbiBiZSBmaXhlZCBvbiBjb21taXQKCkFja2VkLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
