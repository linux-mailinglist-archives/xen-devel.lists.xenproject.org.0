Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111C99A9F0
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 10:15:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i14fd-0008WR-QB; Fri, 23 Aug 2019 08:11:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SWQP=WT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i14fc-0008WM-Lw
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 08:11:40 +0000
X-Inumbo-ID: a0b1bfa8-c57d-11e9-ade3-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0b1bfa8-c57d-11e9-ade3-12813bfff9fa;
 Fri, 23 Aug 2019 08:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566547898;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uswOgtpF0KNSSzEAYU3wo8dU0/krKx0oMqTju7t+qKk=;
 b=OxyugKjU9QvsHhYg14og46UcuN8OS7eJAAlZUzKE99mI5qbUY1W3w5+p
 u8HsAMdDiUyDgtgtYZ2xB7T083o5ZHyRLtBxKbI2OkGyOobIU/WQoO/mt
 KWw0rmzssC2QIhOZM8GFpzDy+tpUZHWLa/aZMw6mQnw23sn3cmIQOCayG 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sI4UQnWu9t726TmH0aWGqv7zS3i+Ubvp4aM1wFFMMxp5gTnvmrSmY2erId/uOAZKju56OoFLpV
 9oFH9IEBZ35KsNXgkQ9u98ZCtUqZjJHysmKkW4x7M25xpPSAmg4gt24Knm4OwyY+Kvnq3GBQp0
 SQHBpOPwoZd8/cK1fvkvLTLwywz3fI+QLoCngsRNREp9ku40clL6r3QcERdrwPvMsKcpmnxwQE
 TsJt2t1i+yPGkqFVAKXMgQUfCt2MjcsszIgJBRuydJ0rMVHgwDmH3YPBRtjAc2FA5ww1/boyX1
 718=
X-SBRS: 2.7
X-MesageID: 4669535
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,420,1559534400"; 
   d="scan'208";a="4669535"
Date: Fri, 23 Aug 2019 10:11:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20190823081121.khm5622trozzhswe@Air-de-Roger>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-13-git-send-email-chao.gao@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1566177928-19114-13-git-send-email-chao.gao@intel.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v9 12/15] microcode: reduce memory
 allocation and copy when creating a patch
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
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMDk6MjU6MjVBTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gVG8gY3JlYXRlIGEgbWljcm9jb2RlIHBhdGNoIGZyb20gYSB2ZW5kb3Itc3BlY2lmaWMgdXBk
YXRlLAo+IGFsbG9jYXRlX21pY3JvY29kZV9wYXRjaCgpIGNvcGllZCBldmVyeXRoaW5nIGZyb20g
dGhlIHVwZGF0ZS4KPiBJdCBpcyBub3QgZWZmaWNpZW50LiBFc3NlbnRpYWxseSwgd2UganVzdCBu
ZWVkIHRvIGdvIHRocm91Z2gKPiB1Y29kZXMgaW4gdGhlIGJsb2IsIGZpbmQgdGhlIG9uZSB3aXRo
IHRoZSBuZXdlc3QgcmV2aXNpb24gYW5kCj4gaW5zdGFsbCBpdCBpbnRvIHRoZSBtaWNyb2NvZGVf
cGF0Y2guIEluIHRoZSBwcm9jZXNzLCBidWZmZXJzCj4gbGlrZSBtY19hbWQsIGVxdWl2X2NwdV90
YWJsZSAob24gQU1EIHNpZGUpLCBhbmQgbWMgKG9uIEludGVsCj4gc2lkZSkgY2FuIGJlIHJldXNl
ZC4gbWljcm9jb2RlX3BhdGNoIG5vdyBpcyBhbGxvY2F0ZWQgYWZ0ZXIKPiBpdCBpcyBzdXJlIHRo
YXQgdGhlcmUgaXMgYSBtYXRjaGluZyB1Y29kZS4KCk9oLCBJIHRoaW5rIHRoaXMgYW5zd2VycyBt
eSBxdWVzdGlvbiBvbiBhIHByZXZpb3VzIHBhdGNoLgoKRm9yIGZ1dHVyZSBzZXJpZXMgaXQgd291
bGQgYmUgbmljZSB0byBhdm9pZCBzbyBtYW55IHJld3JpdGVzIGluIHRoZQpzYW1lIHNlcmllcywg
YWxsb2NfbWljcm9jb2RlX3BhdGNoIGlzIGFscmVhZHkgbW9kaWZpZWQgaW4gYSBwcmV2aW91cwpw
YXRjaCwganVzdCB0byBiZSByZW1vdmVkIGhlcmUuIEl0IGFsc28gbWFrZXMgaXQgaGFyZGVyIHRv
IGZvbGxvdwp3aGF0J3MgZ29pbmcgb24uCgo+IAo+IFNpZ25lZC1vZmYtYnk6IENoYW8gR2FvIDxj
aGFvLmdhb0BpbnRlbC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2OToKPiAgLSBuZXcKPiAtLS0K
PiAgeGVuL2FyY2gveDg2L21pY3JvY29kZV9hbWQuYyAgIHwgOTkgKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHhlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwu
YyB8IDY1ICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDU4
IGluc2VydGlvbnMoKyksIDEwNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L21pY3JvY29kZV9hbWQuYyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfYW1kLmMKPiBp
bmRleCA2MzUzMzIzLi5lYzFjMmViIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9taWNyb2Nv
ZGVfYW1kLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2FtZC5jCj4gQEAgLTE5NCwz
NiArMTk0LDYgQEAgc3RhdGljIGJvb2wgbWF0Y2hfY3B1KGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVf
cGF0Y2ggKnBhdGNoKQo+ICAgICAgcmV0dXJuIHBhdGNoICYmIChtaWNyb2NvZGVfZml0cyhwYXRj
aC0+bWNfYW1kKSA9PSBORVdfVUNPREUpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgc3RydWN0IG1pY3Jv
Y29kZV9wYXRjaCAqYWxsb2NfbWljcm9jb2RlX3BhdGNoKAo+IC0gICAgY29uc3Qgc3RydWN0IG1p
Y3JvY29kZV9hbWQgKm1jX2FtZCkKPiAtewo+IC0gICAgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAq
bWljcm9jb2RlX3BhdGNoID0geG1hbGxvYyhzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoKTsKPiAtICAg
IHN0cnVjdCBtaWNyb2NvZGVfYW1kICpjYWNoZSA9IHhtYWxsb2Moc3RydWN0IG1pY3JvY29kZV9h
bWQpOwo+IC0gICAgdm9pZCAqbXBiID0geG1hbGxvY19ieXRlcyhtY19hbWQtPm1wYl9zaXplKTsK
PiAtICAgIHN0cnVjdCBlcXVpdl9jcHVfZW50cnkgKmVxdWl2X2NwdV90YWJsZSA9Cj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgeG1hbGxvY19ieXRlcyhtY19hbWQtPmVxdWl2X2Nw
dV90YWJsZV9zaXplKTsKPiAtCj4gLSAgICBpZiAoICFtaWNyb2NvZGVfcGF0Y2ggfHwgIWNhY2hl
IHx8ICFtcGIgfHwgIWVxdWl2X2NwdV90YWJsZSApCj4gLSAgICB7Cj4gLSAgICAgICAgeGZyZWUo
bWljcm9jb2RlX3BhdGNoKTsKPiAtICAgICAgICB4ZnJlZShjYWNoZSk7Cj4gLSAgICAgICAgeGZy
ZWUobXBiKTsKPiAtICAgICAgICB4ZnJlZShlcXVpdl9jcHVfdGFibGUpOwo+IC0gICAgICAgIHJl
dHVybiBFUlJfUFRSKC1FTk9NRU0pOwo+IC0gICAgfQo+IC0KPiAtICAgIG1lbWNweShtcGIsIG1j
X2FtZC0+bXBiLCBtY19hbWQtPm1wYl9zaXplKTsKPiAtICAgIGNhY2hlLT5tcGIgPSBtcGI7Cj4g
LSAgICBjYWNoZS0+bXBiX3NpemUgPSBtY19hbWQtPm1wYl9zaXplOwo+IC0gICAgbWVtY3B5KGVx
dWl2X2NwdV90YWJsZSwgbWNfYW1kLT5lcXVpdl9jcHVfdGFibGUsCj4gLSAgICAgICAgICAgbWNf
YW1kLT5lcXVpdl9jcHVfdGFibGVfc2l6ZSk7Cj4gLSAgICBjYWNoZS0+ZXF1aXZfY3B1X3RhYmxl
ID0gZXF1aXZfY3B1X3RhYmxlOwo+IC0gICAgY2FjaGUtPmVxdWl2X2NwdV90YWJsZV9zaXplID0g
bWNfYW1kLT5lcXVpdl9jcHVfdGFibGVfc2l6ZTsKPiAtICAgIG1pY3JvY29kZV9wYXRjaC0+bWNf
YW1kID0gY2FjaGU7Cj4gLQo+IC0gICAgcmV0dXJuIG1pY3JvY29kZV9wYXRjaDsKPiAtfQo+IC0K
PiAgc3RhdGljIHZvaWQgZnJlZV9wYXRjaCh2b2lkICptYykKPiAgewo+ICAgICAgc3RydWN0IG1p
Y3JvY29kZV9hbWQgKm1jX2FtZCA9IG1jOwo+IEBAIC0zMjAsMTggKzI5MCwxMCBAQCBzdGF0aWMg
aW50IGdldF91Y29kZV9mcm9tX2J1ZmZlcl9hbWQoCj4gICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
Cj4gICAgICB9Cj4gIAo+IC0gICAgaWYgKCBtY19hbWQtPm1wYl9zaXplIDwgbXBidWYtPmxlbiAp
Cj4gLSAgICB7Cj4gLSAgICAgICAgaWYgKCBtY19hbWQtPm1wYiApCj4gLSAgICAgICAgewo+IC0g
ICAgICAgICAgICB4ZnJlZShtY19hbWQtPm1wYik7Cj4gLSAgICAgICAgICAgIG1jX2FtZC0+bXBi
X3NpemUgPSAwOwo+IC0gICAgICAgIH0KPiAtICAgICAgICBtY19hbWQtPm1wYiA9IHhtYWxsb2Nf
Ynl0ZXMobXBidWYtPmxlbik7Cj4gLSAgICAgICAgaWYgKCBtY19hbWQtPm1wYiA9PSBOVUxMICkK
PiAtICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gLSAgICAgICAgbWNfYW1kLT5tcGJfc2l6
ZSA9IG1wYnVmLT5sZW47Cj4gLSAgICB9Cj4gKyAgICBtY19hbWQtPm1wYiA9IHhtYWxsb2NfYnl0
ZXMobXBidWYtPmxlbik7Cj4gKyAgICBpZiAoIG1jX2FtZC0+bXBiID09IE5VTEwgKQoKTml0OgoK
aWYgKCAhbWNfYW1kLT5tcGIgKQoKaXMgdGhlIHVzdWFsIGlkaW9tIHVzZWQgaW4gWGVuLgoKPiAr
ICAgICAgICByZXR1cm4gLUVOT01FTTsKPiArICAgIG1jX2FtZC0+bXBiX3NpemUgPSBtcGJ1Zi0+
bGVuOwo+ICAgICAgbWVtY3B5KG1jX2FtZC0+bXBiLCBtcGJ1Zi0+ZGF0YSwgbXBidWYtPmxlbik7
Cj4gIAo+ICAgICAgcHJfZGVidWcoIm1pY3JvY29kZTogQ1BVJWQgc2l6ZSAlenUsIGJsb2NrIHNp
emUgJXUgb2Zmc2V0ICV6dSBlcXVpdklEICUjeCByZXYgJSN4XG4iLAo+IEBAIC00NTEsOCArNDEz
LDkgQEAgc3RhdGljIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKmNwdV9yZXF1ZXN0X21pY3JvY29k
ZShjb25zdCB2b2lkICpidWYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc2l6ZV90IGJ1ZnNpemUpCj4gIHsKPiAgICAgIHN0cnVjdCBtaWNy
b2NvZGVfYW1kICptY19hbWQ7Cj4gKyAgICBzdHJ1Y3QgbWljcm9jb2RlX2hlYWRlcl9hbWQgKnNh
dmVkID0gTlVMTDsKPiAgICAgIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhdGNoID0gTlVMTDsK
PiAtICAgIHNpemVfdCBvZmZzZXQgPSAwOwo+ICsgICAgc2l6ZV90IG9mZnNldCA9IDAsIHNhdmVk
X3NpemUgPSAwOwo+ICAgICAgaW50IGVycm9yID0gMDsKPiAgICAgIHVuc2lnbmVkIGludCBjdXJy
ZW50X2NwdV9pZDsKPiAgICAgIHVuc2lnbmVkIGludCBlcXVpdl9jcHVfaWQ7Cj4gQEAgLTU0Miwy
OSArNTA1LDIxIEBAIHN0YXRpYyBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpjcHVfcmVxdWVzdF9t
aWNyb2NvZGUoY29uc3Qgdm9pZCAqYnVmLAo+ICAgICAgd2hpbGUgKCAoZXJyb3IgPSBnZXRfdWNv
ZGVfZnJvbV9idWZmZXJfYW1kKG1jX2FtZCwgYnVmLCBidWZzaXplLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZvZmZzZXQpKSA9PSAwICkKPiAgICAg
IHsKPiAtICAgICAgICBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpuZXdfcGF0Y2ggPSBhbGxvY19t
aWNyb2NvZGVfcGF0Y2gobWNfYW1kKTsKPiAtCj4gLSAgICAgICAgaWYgKCBJU19FUlIobmV3X3Bh
dGNoKSApCj4gLSAgICAgICAgewo+IC0gICAgICAgICAgICBlcnJvciA9IFBUUl9FUlIobmV3X3Bh
dGNoKTsKPiAtICAgICAgICAgICAgYnJlYWs7Cj4gLSAgICAgICAgfQo+IC0KPiAgICAgICAgICAv
Kgo+IC0gICAgICAgICAqIElmIHRoZSBuZXcgcGF0Y2ggY292ZXJzIGN1cnJlbnQgQ1BVLCBjb21w
YXJlIHBhdGNoZXMgYW5kIHN0b3JlIHRoZQo+ICsgICAgICAgICAqIElmIHRoZSBuZXcgdWNvZGUg
Y292ZXJzIGN1cnJlbnQgQ1BVLCBjb21wYXJlIHVjb2RlcyBhbmQgc3RvcmUgdGhlCj4gICAgICAg
ICAgICogb25lIHdpdGggaGlnaGVyIHJldmlzaW9uLgo+ICAgICAgICAgICAqLwo+IC0gICAgICAg
IGlmICggKG1pY3JvY29kZV9maXRzKG5ld19wYXRjaC0+bWNfYW1kKSAhPSBNSVNfVUNPREUpICYm
Cj4gLSAgICAgICAgICAgICAoIXBhdGNoIHx8IChjb21wYXJlX3BhdGNoKG5ld19wYXRjaCwgcGF0
Y2gpID09IE5FV19VQ09ERSkpICkKPiArI2RlZmluZSBSRVZfSUQobXBiKSAoKChzdHJ1Y3QgbWlj
cm9jb2RlX2hlYWRlcl9hbWQgKikobXBiKSktPnByb2Nlc3Nvcl9yZXZfaWQpCj4gKyAgICAgICAg
aWYgKCAobWljcm9jb2RlX2ZpdHMobWNfYW1kKSAhPSBNSVNfVUNPREUpICYmCj4gKyAgICAgICAg
ICAgICAoIXNhdmVkIHx8IChSRVZfSUQobWNfYW1kLT5tcGIpID4gUkVWX0lEKHNhdmVkKSkpICkK
PiArI3VuZGVmIFJFVl9JRAo+ICAgICAgICAgIHsKPiAtICAgICAgICAgICAgc3RydWN0IG1pY3Jv
Y29kZV9wYXRjaCAqdG1wID0gcGF0Y2g7Cj4gLQo+IC0gICAgICAgICAgICBwYXRjaCA9IG5ld19w
YXRjaDsKPiAtICAgICAgICAgICAgbmV3X3BhdGNoID0gdG1wOwo+ICsgICAgICAgICAgICB4ZnJl
ZShzYXZlZCk7Cj4gKyAgICAgICAgICAgIHNhdmVkID0gbWNfYW1kLT5tcGI7Cj4gKyAgICAgICAg
ICAgIHNhdmVkX3NpemUgPSBtY19hbWQtPm1wYl9zaXplOwo+ICAgICAgICAgIH0KPiAtCj4gLSAg
ICAgICAgaWYgKCBuZXdfcGF0Y2ggKQo+IC0gICAgICAgICAgICBtaWNyb2NvZGVfZnJlZV9wYXRj
aChuZXdfcGF0Y2gpOwo+ICsgICAgICAgIGVsc2UKPiArICAgICAgICAgICAgeGZyZWUobWNfYW1k
LT5tcGIpOwo+ICAKPiAgICAgICAgICBpZiAoIG9mZnNldCA+PSBidWZzaXplICkKPiAgICAgICAg
ICAgICAgYnJlYWs7Cj4gQEAgLTU5Myw5ICs1NDgsMjUgQEAgc3RhdGljIHN0cnVjdCBtaWNyb2Nv
ZGVfcGF0Y2ggKmNwdV9yZXF1ZXN0X21pY3JvY29kZShjb25zdCB2b2lkICpidWYsCj4gICAgICAg
ICAgICAgICAqKGNvbnN0IHVpbnQzMl90ICopKGJ1ZiArIG9mZnNldCkgPT0gVUNPREVfTUFHSUMg
KQo+ICAgICAgICAgICAgICBicmVhazsKPiAgICAgIH0KPiAtICAgIHhmcmVlKG1jX2FtZC0+bXBi
KTsKPiAtICAgIHhmcmVlKG1jX2FtZC0+ZXF1aXZfY3B1X3RhYmxlKTsKPiAtICAgIHhmcmVlKG1j
X2FtZCk7Cj4gKwo+ICsgICAgaWYgKCBzYXZlZCApCj4gKyAgICB7Cj4gKyAgICAgICAgbWNfYW1k
LT5tcGIgPSBzYXZlZDsKPiArICAgICAgICBtY19hbWQtPm1wYl9zaXplID0gc2F2ZWRfc2l6ZTsK
PiArICAgICAgICBwYXRjaCA9IHhtYWxsb2Moc3RydWN0IG1pY3JvY29kZV9wYXRjaCk7Cj4gKyAg
ICAgICAgaWYgKCBwYXRjaCApCj4gKyAgICAgICAgICAgIHBhdGNoLT5tY19hbWQgPSBtY19hbWQ7
Cj4gKyAgICAgICAgZWxzZQo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAgZnJlZV9wYXRjaCht
Y19hbWQpOwo+ICsgICAgICAgICAgICBlcnJvciA9IC1FTk9NRU07Cj4gKyAgICAgICAgfQo+ICsg
ICAgfQo+ICsgICAgZWxzZQo+ICsgICAgewo+ICsgICAgICAgIG1jX2FtZC0+bXBiID0gTlVMTDsK
CldoYXQncyB0aGUgcG9pbnQgaW4gc2V0dGluZyBtcGIgdG8gTlVMTCBpZiB5b3UgYXJlIGp1c3Qg
Z29pbmcgdG8gZnJlZQptY19hbWQgYmVsb3c/CgpBbHNvLCBJJ20gbm90IHN1cmUgSSB1bmRlcnN0
YW5kIHdoeSB5b3UgbmVlZCB0byBmcmVlIG1jX2FtZCwgaXNuJ3QKdGhpcyBidWZmIG1lbW9yeSB0
aGF0IHNob3VsZCBiZSBmcmVlZCBieSB0aGUgY2FsbGVyPwoKaWU6IGluIHRoZSBJbnRlbCBjb3Vu
dGVycGFydCBiZWxvdyB5b3UgZG9uJ3Qgc2VlbSB0byBmcmVlIHRoZSBtYwpjdXJzb3IgdXNlZCBm
b3IgdGhlIGdldF9uZXh0X3Vjb2RlX2Zyb21fYnVmZmVyIGxvb3AuCgo+ICsgICAgICAgIGZyZWVf
cGF0Y2gobWNfYW1kKTsKPiArICAgIH0KPiAgCj4gICAgb3V0Ogo+ICAgICAgaWYgKCBlcnJvciAm
JiAhcGF0Y2ggKQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2ludGVsLmMg
Yi94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2ludGVsLmMKPiBpbmRleCA5NmIzOGY4Li5hZTU3NTlm
IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwuYwo+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwuYwo+IEBAIC0yODIsMjUgKzI4Miw2IEBAIHN0YXRp
YyBlbnVtIG1pY3JvY29kZV9tYXRjaF9yZXN1bHQgY29tcGFyZV9wYXRjaCgKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE9M
RF9VQ09ERTsKPiAgfQo+ICAKPiAtc3RhdGljIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKmFsbG9j
X21pY3JvY29kZV9wYXRjaCgKPiAtICAgIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2lu
dGVsICptY19oZWFkZXIpCj4gLXsKPiAtICAgIHVuc2lnbmVkIGxvbmcgdG90YWxfc2l6ZSA9IGdl
dF90b3RhbHNpemUobWNfaGVhZGVyKTsKPiAtICAgIHZvaWQgKm5ld19tYyA9IHhtYWxsb2NfYnl0
ZXModG90YWxfc2l6ZSk7Cj4gLSAgICBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpuZXdfcGF0Y2gg
PSB4bWFsbG9jKHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2gpOwo+IC0KPiAtICAgIGlmICggIW5ld19w
YXRjaCB8fCAhbmV3X21jICkKPiAtICAgIHsKPiAtICAgICAgICB4ZnJlZShuZXdfcGF0Y2gpOwo+
IC0gICAgICAgIHhmcmVlKG5ld19tYyk7Cj4gLSAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVOT01F
TSk7Cj4gLSAgICB9Cj4gLSAgICBtZW1jcHkobmV3X21jLCBtY19oZWFkZXIsIHRvdGFsX3NpemUp
Owo+IC0gICAgbmV3X3BhdGNoLT5tY19pbnRlbCA9IG5ld19tYzsKPiAtCj4gLSAgICByZXR1cm4g
bmV3X3BhdGNoOwo+IC19Cj4gLQo+ICBzdGF0aWMgaW50IGFwcGx5X21pY3JvY29kZShjb25zdCBz
dHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCkKPiAgewo+ICAgICAgdW5zaWduZWQgbG9uZyBm
bGFnczsKPiBAQCAtMzc5LDQ3ICszNjAsNDcgQEAgc3RhdGljIHN0cnVjdCBtaWNyb2NvZGVfcGF0
Y2ggKmNwdV9yZXF1ZXN0X21pY3JvY29kZShjb25zdCB2b2lkICpidWYsCj4gIHsKPiAgICAgIGxv
bmcgb2Zmc2V0ID0gMDsKPiAgICAgIGludCBlcnJvciA9IDA7Cj4gLSAgICB2b2lkICptYzsKPiAr
ICAgIHN0cnVjdCBtaWNyb2NvZGVfaW50ZWwgKm1jLCAqc2F2ZWQgPSBOVUxMOwo+ICAgICAgc3Ry
dWN0IG1pY3JvY29kZV9wYXRjaCAqcGF0Y2ggPSBOVUxMOwo+ICAKPiAtICAgIHdoaWxlICggKG9m
ZnNldCA9IGdldF9uZXh0X3Vjb2RlX2Zyb21fYnVmZmVyKCZtYywgYnVmLCBzaXplLCBvZmZzZXQp
KSA+IDAgKQo+ICsgICAgd2hpbGUgKCAob2Zmc2V0ID0gZ2V0X25leHRfdWNvZGVfZnJvbV9idWZm
ZXIoKHZvaWQgKiopJm1jLCBidWYsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzaXplLCBvZmZzZXQpKSA+IDAgKQo+ICAgICAgewo+IC0gICAgICAg
IHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKm5ld19wYXRjaDsKPiAtCj4gICAgICAgICAgZXJyb3Ig
PSBtaWNyb2NvZGVfc2FuaXR5X2NoZWNrKG1jKTsKPiAgICAgICAgICBpZiAoIGVycm9yICkKPiAt
ICAgICAgICAgICAgYnJlYWs7Cj4gLQo+IC0gICAgICAgIG5ld19wYXRjaCA9IGFsbG9jX21pY3Jv
Y29kZV9wYXRjaChtYyk7Cj4gLSAgICAgICAgaWYgKCBJU19FUlIobmV3X3BhdGNoKSApCj4gICAg
ICAgICAgewo+IC0gICAgICAgICAgICBlcnJvciA9IFBUUl9FUlIobmV3X3BhdGNoKTsKPiArICAg
ICAgICAgICAgeGZyZWUobWMpOwo+ICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgICB9Cj4g
IAo+ICAgICAgICAgIC8qCj4gLSAgICAgICAgICogSWYgdGhlIG5ldyBwYXRjaCBjb3ZlcnMgY3Vy
cmVudCBDUFUsIGNvbXBhcmUgcGF0Y2hlcyBhbmQgc3RvcmUgdGhlCj4gKyAgICAgICAgICogSWYg
dGhlIG5ldyB1cGRhdGUgY292ZXJzIGN1cnJlbnQgQ1BVLCBjb21wYXJlIHVwZGF0ZXMgYW5kIHN0
b3JlIHRoZQo+ICAgICAgICAgICAqIG9uZSB3aXRoIGhpZ2hlciByZXZpc2lvbi4KPiAgICAgICAg
ICAgKi8KPiAtICAgICAgICBpZiAoIChtaWNyb2NvZGVfdXBkYXRlX21hdGNoKCZuZXdfcGF0Y2gt
Pm1jX2ludGVsLT5oZHIpICE9IE1JU19VQ09ERSkgJiYKPiAtICAgICAgICAgICAgICghcGF0Y2gg
fHwgKGNvbXBhcmVfcGF0Y2gobmV3X3BhdGNoLCBwYXRjaCkgPT0gTkVXX1VDT0RFKSkgKQo+ICsg
ICAgICAgIGlmICggKG1pY3JvY29kZV91cGRhdGVfbWF0Y2goJm1jLT5oZHIpICE9IE1JU19VQ09E
RSkgJiYKPiArICAgICAgICAgICAgICghc2F2ZWQgfHwgKG1jLT5oZHIucmV2ID4gc2F2ZWQtPmhk
ci5yZXYpKSApCj4gICAgICAgICAgewo+IC0gICAgICAgICAgICBzdHJ1Y3QgbWljcm9jb2RlX3Bh
dGNoICp0bXAgPSBwYXRjaDsKPiAtCj4gLSAgICAgICAgICAgIHBhdGNoID0gbmV3X3BhdGNoOwo+
IC0gICAgICAgICAgICBuZXdfcGF0Y2ggPSB0bXA7Cj4gKyAgICAgICAgICAgIHhmcmVlKHNhdmVk
KTsKPiArICAgICAgICAgICAgc2F2ZWQgPSBtYzsKPiAgICAgICAgICB9Cj4gLQo+IC0gICAgICAg
IGlmICggbmV3X3BhdGNoICkKPiAtICAgICAgICAgICAgbWljcm9jb2RlX2ZyZWVfcGF0Y2gobmV3
X3BhdGNoKTsKPiAtCj4gLSAgICAgICAgeGZyZWUobWMpOwo+ICsgICAgICAgIGVsc2UKPiArICAg
ICAgICAgICAgeGZyZWUobWMpOwo+ICAgICAgfQo+IC0gICAgaWYgKCBvZmZzZXQgPiAwICkKPiAt
ICAgICAgICB4ZnJlZShtYyk7Cj4gICAgICBpZiAoIG9mZnNldCA8IDAgKQo+ICAgICAgICAgIGVy
cm9yID0gb2Zmc2V0Owo+ICAKPiArICAgIGlmICggc2F2ZWQgKQo+ICsgICAgewo+ICsgICAgICAg
IHBhdGNoID0geG1hbGxvYyhzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoKTsKPiArICAgICAgICBpZiAo
IHBhdGNoICkKPiArICAgICAgICAgICAgcGF0Y2gtPm1jX2ludGVsID0gc2F2ZWQ7Cj4gKyAgICAg
ICAgZWxzZQo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAgeGZyZWUoc2F2ZWQpOwo+ICsgICAg
ICAgICAgICBlcnJvciA9IC1FTk9NRU07Cj4gKyAgICAgICAgfQo+ICsgICAgfQo+ICsKClRoZSBh
Ym92ZSBjb2RlIGxvb2tzIHN1c3BpY2lvdXNseSBzaW1pbGFyIHRvIHRoZSBBTUQKY3B1X3JlcXVl
c3RfbWljcm9jb2RlIGNvdW50ZXJwYXJ0LCB3aGljaCBtYWtlcyBtZSB0aGluayBpdCBjb3VsZCBi
ZQpmdXJ0aGVyIGFic3RyYWN0ZWQgaW4gb3JkZXIgdG8gcmVkdWNlIHRoaXMgZHVwbGljYXRpb24u
IEluIGFueSBjYXNlLAp0aGlzIGNhbiBiZSBkb25lIGluIGEgZm9sbG93IHVwIHBhdGNoLgoKVGhh
bmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
