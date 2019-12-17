Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 824DF122BEE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 13:40:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihC7M-0001D9-Hs; Tue, 17 Dec 2019 12:38:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkcM=2H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ihC7L-0001D4-6d
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 12:38:23 +0000
X-Inumbo-ID: 1bad6578-20ca-11ea-8ebd-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bad6578-20ca-11ea-8ebd-12813bfff9fa;
 Tue, 17 Dec 2019 12:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576586301;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DzqQXmM7QHRppXzblZGx0xehm1dG6iF14fwJHxsQZXY=;
 b=GXO3jhwKZXIaJ2IgMO/YA5HPBvTgl4nOF1Q9uPqtQ9Nfjz6w19JAh03j
 tOMV1SOSZGwluB3XEK+hLsnRBf6T12oVUAwbI/3rmpAzWDLMcD3yEP25W
 z6NkSV9YZK2UMjbrxRLdi4k+WoCiiZwUkfZXK66Vo0ehAgZVCEu5KgGT6 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Yp1jf8P9jj6t0uzvg/XElgKviLCANsjIPRtSCAOFqcUjkaDeSbgHHcHQf5Hqca/z7yTavaSrvj
 5yH/mg35RCvIaThG2VTFbfOfjBnDEu6AWDl/b8RS3pecrGFZk7SWvVvuTMZBv9gtPuZczOsNv2
 MYpiIrnPOAn24anbW5IR/eSwqZa9P+7E/AdYx5fRTygW4JPfxdyVQxun5xjKU8N6CbJHIv57sF
 24s85jX0r9zRf64c7fUH4B0DdjO+tQPnxJSlp7HZTilOyt9OaFk11AwYVz3KYTEJmrgFse/QH0
 ZM8=
X-SBRS: 2.7
X-MesageID: 10378258
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,325,1571716800"; d="scan'208";a="10378258"
Date: Tue, 17 Dec 2019 13:38:14 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191217123814.GZ11756@Air-de-Roger>
References: <20191213190436.24475-1-andrew.cooper3@citrix.com>
 <20191213190436.24475-7-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213190436.24475-7-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH 6/6] x86/suspend: Drop
 save_rest_processor_state() completely
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMTMsIDIwMTkgYXQgMDc6MDQ6MzZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBDb25zdHJ1Y3QgdGhlIHN5c3RlbSBsaW5rYWdlIE1TUnMgdXNpbmcgcGVyY3B1X3Ry
YXBzX2luaXQoKSwgYnJpbmluZyB0aGUgUzMKPiBwYXRoIGluIGxpbmUgd2l0aCB0aGUgQlNQL0FQ
IHBhdGguICBSZXN0b3JlIHhjcjAgZnJvbSB0aGUgcGVyLWNwdSBzaGFkb3cgY29weS4KPiAKPiBU
aGUgRlMvR1MgYmFzZSB2YWx1ZXMgYXJlIHVudXNlZCBpbiBYZW4gY29udGV4dCwgYW5kIHdpbGwg
YmUgbG9hZGVkCj4gYXBwcm9wcmlhdGVseSBieSB0aGUgbmV4dCB2Y3B1IGNvbnRleHQgc3dpdGNo
Lgo+IAo+IFRyaW0gdGhlIGluY2x1ZGUgbGlzdCBzdWJzdGFudGlhbGx5LCBhcyBtb3N0IGFyZSB1
bnVzZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KCj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiBD
QzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9hY3BpL3N1c3BlbmQuYyAgICAgfCA1
NCArKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICB4ZW4vYXJjaC94
ODYvYWNwaS93YWtldXBfcHJvdC5TIHwgIDIgLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDUzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
YWNwaS9zdXNwZW5kLmMgYi94ZW4vYXJjaC94ODYvYWNwaS9zdXNwZW5kLmMKPiBpbmRleCAzMmQw
ZjcxZmZkLi42MjlkMTE3OTY1IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9hY3BpL3N1c3Bl
bmQuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3N1c3BlbmQuYwo+IEBAIC00LDQwICs0LDgg
QEAKPiAgICogIENvcHlyaWdodCAoYykgMjAwMSBQYXRyaWNrIE1vY2hlbCA8bW9jaGVsQG9zZGwu
b3JnPgo+ICAgKi8KPiAgCj4gLSNpbmNsdWRlIDx4ZW4vYWNwaS5oPgo+IC0jaW5jbHVkZSA8eGVu
L3NtcC5oPgo+IC0jaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgo+IC0jaW5jbHVkZSA8YXNtL21z
ci5oPgo+IC0jaW5jbHVkZSA8YXNtL2RlYnVncmVnLmg+Cj4gLSNpbmNsdWRlIDxhc20vaHZtL2h2
bS5oPgo+IC0jaW5jbHVkZSA8YXNtL2h2bS9zdXBwb3J0Lmg+Cj4gLSNpbmNsdWRlIDxhc20vaTM4
Ny5oPgo+ICsjaW5jbHVkZSA8YXNtL3N5c3RlbS5oPgo+ICAjaW5jbHVkZSA8YXNtL3hzdGF0ZS5o
Pgo+IC0jaW5jbHVkZSA8eGVuL2h5cGVyY2FsbC5oPgo+IC0KPiAtc3RhdGljIHVuc2lnbmVkIGxv
bmcgc2F2ZWRfbHN0YXIsIHNhdmVkX2NzdGFyOwo+IC1zdGF0aWMgdW5zaWduZWQgbG9uZyBzYXZl
ZF9zeXNlbnRlcl9lc3AsIHNhdmVkX3N5c2VudGVyX2VpcDsKPiAtc3RhdGljIHVuc2lnbmVkIGxv
bmcgc2F2ZWRfZnNfYmFzZSwgc2F2ZWRfZ3NfYmFzZSwgc2F2ZWRfa2VybmVsX2dzX2Jhc2U7Cj4g
LXN0YXRpYyB1aW50NjRfdCBzYXZlZF94Y3IwOwo+IC0KPiAtdm9pZCBzYXZlX3Jlc3RfcHJvY2Vz
c29yX3N0YXRlKHZvaWQpCj4gLXsKPiAtICAgIHNhdmVkX2ZzX2Jhc2UgPSByZGZzYmFzZSgpOwo+
IC0gICAgc2F2ZWRfZ3NfYmFzZSA9IHJkZ3NiYXNlKCk7Cj4gLSAgICByZG1zcmwoTVNSX1NIQURP
V19HU19CQVNFLCBzYXZlZF9rZXJuZWxfZ3NfYmFzZSk7Cj4gLSAgICByZG1zcmwoTVNSX0NTVEFS
LCBzYXZlZF9jc3Rhcik7Cj4gLSAgICByZG1zcmwoTVNSX0xTVEFSLCBzYXZlZF9sc3Rhcik7Cj4g
LQo+IC0gICAgaWYgKCBjcHVfaGFzX3NlcCApCj4gLSAgICB7Cj4gLSAgICAgICAgcmRtc3JsKE1T
Ul9JQTMyX1NZU0VOVEVSX0VTUCwgc2F2ZWRfc3lzZW50ZXJfZXNwKTsKPiAtICAgICAgICByZG1z
cmwoTVNSX0lBMzJfU1lTRU5URVJfRUlQLCBzYXZlZF9zeXNlbnRlcl9laXApOwo+IC0gICAgfQo+
IC0KPiAtICAgIGlmICggY3B1X2hhc194c2F2ZSApCj4gLSAgICAgICAgc2F2ZWRfeGNyMCA9IGdl
dF94Y3IwKCk7Cj4gLX0KPiAtCj4gIAo+ICB2b2lkIHJlc3RvcmVfcmVzdF9wcm9jZXNzb3Jfc3Rh
dGUodm9pZCkKPiAgewo+IEBAIC00NiwyNSArMTQsOSBAQCB2b2lkIHJlc3RvcmVfcmVzdF9wcm9j
ZXNzb3Jfc3RhdGUodm9pZCkKPiAgICAgIC8qIFJlc3RvcmUgZnVsbCBDUjQgKGluYyBNQ0UpIG5v
dyB0aGF0IHRoZSBJRFQgaXMgaW4gcGxhY2UuICovCj4gICAgICB3cml0ZV9jcjQobW11X2NyNF9m
ZWF0dXJlcyk7Cj4gIAo+IC0gICAgLyogUmVjb3ZlciBzeXNjYWxsIE1TUnMgKi8KPiAtICAgIHdy
bXNybChNU1JfTFNUQVIsIHNhdmVkX2xzdGFyKTsKPiAtICAgIHdybXNybChNU1JfQ1NUQVIsIHNh
dmVkX2NzdGFyKTsKPiAtICAgIHdybXNybChNU1JfU1RBUiwgWEVOX01TUl9TVEFSKTsKPiAtICAg
IHdybXNybChNU1JfU1lTQ0FMTF9NQVNLLCBYRU5fU1lTQ0FMTF9NQVNLKTsKPiAtCj4gLSAgICB3
cmZzYmFzZShzYXZlZF9mc19iYXNlKTsKPiAtICAgIHdyZ3NiYXNlKHNhdmVkX2dzX2Jhc2UpOwo+
IC0gICAgd3Jtc3JsKE1TUl9TSEFET1dfR1NfQkFTRSwgc2F2ZWRfa2VybmVsX2dzX2Jhc2UpOwo+
IC0KPiAtICAgIGlmICggY3B1X2hhc19zZXAgKQo+IC0gICAgewo+IC0gICAgICAgIC8qIFJlY292
ZXIgc3lzZW50ZXIgTVNScyAqLwo+IC0gICAgICAgIHdybXNybChNU1JfSUEzMl9TWVNFTlRFUl9F
U1AsIHNhdmVkX3N5c2VudGVyX2VzcCk7Cj4gLSAgICAgICAgd3Jtc3JsKE1TUl9JQTMyX1NZU0VO
VEVSX0VJUCwgc2F2ZWRfc3lzZW50ZXJfZWlwKTsKPiAtICAgICAgICB3cm1zcihNU1JfSUEzMl9T
WVNFTlRFUl9DUywgX19IWVBFUlZJU09SX0NTLCAwKTsKPiAtICAgIH0KPiArICAgIHBlcmNwdV90
cmFwc19pbml0KCk7Cj4gIAo+IC0gICAgaWYgKCBjcHVfaGFzX3hzYXZlICYmICFzZXRfeGNyMChz
YXZlZF94Y3IwKSApCj4gKyAgICBpZiAoIGNwdV9oYXNfeHNhdmUgJiYgIXNldF94Y3IwKGdldF94
Y3IwKCkpICkKPiAgICAgICAgICBCVUcoKTsKPiAgCj4gICAgICB3cm1zcmwoTVNSX0lBMzJfQ1Jf
UEFULCBYRU5fTVNSX1BBVCk7CgpHaXZlbiB3aGF0IHRoaXMgZnVuY3Rpb25zIGRvZXMgYWZ0ZXIg
dGhpcyBjaGFuZ2UsIHdvdWxkIGl0IGJlIGZlYXNpYmxlCnRvIHBsYWNlIHN1Y2ggY2FsbHMgZGly
ZWN0bHkgaW4gZW50ZXJfc3RhdGU/CgpBRkFJQ1QgdGhlcmUncyBhbHJlYWR5IHNvbWUgcmVzdG9y
aW5nIGRvbmUgdGhlcmUgYW55d2F5LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
