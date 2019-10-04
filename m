Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E880CBB94
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 15:22:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGNU5-0006eb-AB; Fri, 04 Oct 2019 13:19:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihSl=X5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iGNU3-0006eW-Rz
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 13:18:59 +0000
X-Inumbo-ID: 844320d8-e6a9-11e9-9755-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 844320d8-e6a9-11e9-9755-12813bfff9fa;
 Fri, 04 Oct 2019 13:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570195135;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9p53IT3jxaSfnAXRh8WpYev3jvciC87wmYGcF5cs9DY=;
 b=XLUb9EnHCfZO6SnpKRvpPLnN3UXixUuMGI6aHDamCW8ZW7LZ2qmkVBvj
 kgA9tMcLjBx5v5P5k5Z/ZgTnwoceVcYP1bhOuL7O49ZergIAr3C8tNJ/l
 7Yczmm/MjxzvnizcXzbiGebC/1RyuDpwsRi0ctws/fpT4I3wafw9ImG4u w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ABMem7KKDzD2iaGEWFOUYJM2fdpvWo5h+Lfo05hW/F3PPsUk+7jp25fJ+T1gLrskxtKBH4G6bh
 YjieZexL2qXYhqfz1HnDUuwI2cirrSwUrPJnEAstS1yvKy7Mfz+WcJ8AxNCdirTXjZMIGD6gvz
 4MsAgPHSws/YTE9IgFkZzfwjsByKJtfugEqW5fRKymxdoednlp45htK+jpuX8u0tOK/8lxESeO
 LncmIlEV2w5qVcwFGA83hQp4H27Po9kW4YHvHz5PvKKtJQMI8QrMdzHZyQ+SbsTCuF8UPJc6sq
 7xA=
X-SBRS: 2.7
X-MesageID: 6839509
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6839509"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <ba0fd598-9102-e765-e7f5-61e91d47b124@suse.com>
 <dc7d25e5-11f8-b6c3-7137-ceb0814e836a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <c694e8f7-fd64-f2be-fadb-edc1478d07ae@citrix.com>
Date: Fri, 4 Oct 2019 14:18:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <dc7d25e5-11f8-b6c3-7137-ceb0814e836a@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v7 1/3] AMD/IOMMU: allocate one device table
 per PCI segment
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
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMDkvMjAxOSAxNToyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQEAgLTEwNjgsOCArMTA2
NywyOSBAQCBzdGF0aWMgdm9pZCAqIF9faW5pdCBhbGxvY2F0ZV9wcHJfbG9nKHN0Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgSU9NTVVfUFBSX0xPR19ERUZBVUxUX0VOVFJJRVMs
ICJQUFIgTG9nIik7Cj4gIH0KPiAgCj4gKy8qCj4gKyAqIFdpdGhpbiBpdnJzX21hcHBpbmdzW10g
d2UgYWxsb2NhdGUgYW4gZXh0cmEgYXJyYXkgZWxlbWVudCB0byBzdG9yZQo+ICsgKiAtIHNlZ21l
bnQgbnVtYmVyLAo+ICsgKiAtIGRldmljZSB0YWJsZS4KPiArICovCj4gKyNkZWZpbmUgSVZSU19N
QVBQSU5HU19TRUcobSkgKG0pW2l2cnNfYmRmX2VudHJpZXNdLmR0ZV9yZXF1ZXN0b3JfaWQKPiAr
I2RlZmluZSBJVlJTX01BUFBJTkdTX0RFVlRBQihtKSAobSlbaXZyc19iZGZfZW50cmllc10uaW50
cmVtYXBfdGFibGUKPiArCj4gK3N0YXRpYyB2b2lkIF9faW5pdCBmcmVlX2l2cnNfbWFwcGluZyh2
b2lkICpwdHIpCj4gK3sKPiArICAgIGNvbnN0IHN0cnVjdCBpdnJzX21hcHBpbmdzICppdnJzX21h
cHBpbmdzID0gcHRyOwoKSG93IGFic29sdXRlbHkgY2VydGFpbiBhcmUgd2UgdGhhdCBwdHIgd2ls
bCBuZXZlciBiZSBOVUxMPwoKSXQgbWlnaHQgYmUgYmV0dGVyIHRvIHJlbmFtZSB0aGlzIHRvIHJh
ZGl4X3RyZWVfZnJlZV9pdnJzX21hcHBpbmdzKCkgdG8KbWFrZSBpdCBjbGVhciB3aG8gY2FsbHMg
aXQsIGFuZCBhbHNvIHByb3ZpZGUgYSBoaW50IGFzIHRvIHdoeSB0aGUKcGFyYW1ldGVyIGlzIHZv
aWQuCgo+ICsKPiArICAgIGlmICggSVZSU19NQVBQSU5HU19ERVZUQUIoaXZyc19tYXBwaW5ncykg
KQo+ICsgICAgICAgIGRlYWxsb2NhdGVfYnVmZmVyKElWUlNfTUFQUElOR1NfREVWVEFCKGl2cnNf
bWFwcGluZ3MpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIGR0X2FsbG9jX3NpemUoKSk7
Cj4gKwo+ICsgICAgeGZyZWUocHRyKTsKPiArfQo+ICsKPiAgc3RhdGljIGludCBfX2luaXQgYW1k
X2lvbW11X2luaXRfb25lKHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11LCBib29sIGludHIpCj4gIHsK
PiArICAgIGNvbnN0IHN0cnVjdCBpdnJzX21hcHBpbmdzICppdnJzX21hcHBpbmdzOwo+ICsKPiAg
ICAgIGlmICggYWxsb2NhdGVfY21kX2J1ZmZlcihpb21tdSkgPT0gTlVMTCApCj4gICAgICAgICAg
Z290byBlcnJvcl9vdXQ7Cj4gIAo+IEBAIC0xMDgyLDEzICsxMTAyLDE1IEBAIHN0YXRpYyBpbnQg
X19pbml0IGFtZF9pb21tdV9pbml0X29uZShzdHIKPiAgICAgIGlmICggaW50ciAmJiAhc2V0X2lv
bW11X2ludGVycnVwdF9oYW5kbGVyKGlvbW11KSApCj4gICAgICAgICAgZ290byBlcnJvcl9vdXQ7
Cj4gIAo+IC0gICAgLyogVG8gbWFrZSBzdXJlIHRoYXQgZGV2aWNlX3RhYmxlLmJ1ZmZlciBoYXMg
YmVlbiBzdWNjZXNzZnVsbHkgYWxsb2NhdGVkICovCj4gLSAgICBpZiAoIGRldmljZV90YWJsZS5i
dWZmZXIgPT0gTlVMTCApCj4gKyAgICAvKiBNYWtlIHN1cmUgdGhhdCB0aGUgZGV2aWNlIHRhYmxl
IGhhcyBiZWVuIHN1Y2Nlc3NmdWxseSBhbGxvY2F0ZWQuICovCj4gKyAgICBpdnJzX21hcHBpbmdz
ID0gZ2V0X2l2cnNfbWFwcGluZ3MoaW9tbXUtPnNlZyk7Cj4gKyAgICBpZiAoICFJVlJTX01BUFBJ
TkdTX0RFVlRBQihpdnJzX21hcHBpbmdzKSApCgpUaGlzIGlzIHN0aWxsIGdvaW5nIHRvIGNyYXNo
IHdpdGggYSBOVUxMIHBvaW50ZXIgZGVmZXJlbmNlIGluIHRoZSBjYXNlCmRlc2NyaWJlZCBieSB0
aGUgY29tbWVudC7CoCAoVGhlbiBhZ2FpbiwgaXQgbWF5IG5vdCBjcmFzaCwgYW5kIGhpdAp1c2Vy
c3BhY2UgYXQgdGhlIDY0TSBtYXJrLikKCllvdSBhYnNvbHV0ZWx5IG5lZWQgdG8gY2hlY2sgaXZy
c19tYXBwaW5ncyBiZWluZyBub24gTlVMTCBiZWZvcmUgdXNpbmcKSVZSU19NQVBQSU5HU19ERVZU
QUIoKSwgb3IgcGVyaGFwcyByb2xsIHRoZSBjaGVjayBpbnRvIHRoZSBtYWNyby4KCn5BbmRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
