Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE7E130A10
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jan 2020 23:01:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioDuP-0006yB-GR; Sun, 05 Jan 2020 21:58:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BhB7=22=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ioDuN-0006y6-Di
 for xen-devel@lists.xenproject.org; Sun, 05 Jan 2020 21:58:03 +0000
X-Inumbo-ID: 710dfdac-3006-11ea-aa7c-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 710dfdac-3006-11ea-aa7c-12813bfff9fa;
 Sun, 05 Jan 2020 21:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578261481;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=VEuq6/Rx0cb3zeYbqDpBoKzLlMIBxzwiY4s2gz5utdA=;
 b=cer7/01HtTiTsUeRY7dwU+vGL5OnukRLCnKkxb1AZjKnMunqqlOgEm9c
 rbSfXIRS8M4b7fxb9bRfotomijO9LJ1GN0qVcyqsGG1YR3FUr9DcOZDUR
 m1InyB6VVvdf2KiV7okMPEhHLyWcfNjuEgmqr2Emz54plttSTNvTMhsyv M=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nn/wD49Hr+O9qi6gfXEK0SB+eLL15qALBOWXje+E47oQqLTeqZ44G9l65AGUK0FwIbcDq7KW/y
 WLfWYzFMiDUSG7irmygckAVqXR3hAUWEqe+5hzhGCt+ZVp7H+P8g0KRKvFxFqer/1pSRsjMfiD
 eIL4BAmepoCR7/QXC8SSWivEKTVh1Qok3lvR9jR+tI60JDtegxp2GoDWXVgTiZqbPBVImj60S1
 0p8kuKbPDew7BSai9IxT5kOLiH1HRxBENIbhcJODdq0ev+pv430VlFnQokMvydlfTRxaHyKpud
 t54=
X-SBRS: 2.7
X-MesageID: 11064352
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,400,1571716800"; d="scan'208";a="11064352"
To: Wei Liu <wl@xen.org>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-2-liuwe@microsoft.com>
 <eae9980b-90dd-e747-9400-7bc044b06360@citrix.com>
 <20200105214541.5z5ibv2nlyebbypj@debian>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <c289d1bb-246a-6295-b8ff-e318789987e3@citrix.com>
Date: Sun, 5 Jan 2020 21:57:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200105214541.5z5ibv2nlyebbypj@debian>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 1/5] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMDEvMjAyMCAyMTo0NSwgV2VpIExpdSB3cm90ZToKPiBPbiBTdW4sIEphbiAwNSwgMjAy
MCBhdCAwNTozNzo0NFBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAwNS8wMS8y
MDIwIDE2OjQ3LCBXZWkgTGl1IHdyb3RlOgo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvTWFrZWZpbGUgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxl
Cj4+PiBpbmRleCA2ODE3MDEwOWE5Li4xYTg4ODdkMmY0IDEwMDY0NAo+Pj4gLS0tIGEveGVuL2Fy
Y2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQo+Pj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0
L2h5cGVydi9NYWtlZmlsZQo+Pj4gQEAgLTEgKzEsMiBAQAo+Pj4gK29iai15ICs9IGh5cGVyY2Fs
bF9wYWdlLm8KPj4+ICBvYmoteSArPSBoeXBlcnYubwo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJjYWxsX3BhZ2UuUyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9o
eXBlcnYvaHlwZXJjYWxsX3BhZ2UuUwo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4
IDAwMDAwMDAwMDAuLjZkNmFiOTEzYmUKPj4+IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJjYWxsX3BhZ2UuUwo+Pj4gQEAgLTAsMCArMSwyMSBA
QAo+Pj4gKyNpbmNsdWRlIDxhc20vYXNtX2RlZm5zLmg+Cj4+PiArI2luY2x1ZGUgPGFzbS9wYWdl
Lmg+Cj4+PiArCj4+PiArICAgICAgICAuc2VjdGlvbiAiLnRleHQucGFnZV9hbGlnbmVkIiwgImF4
IiwgQHByb2diaXRzCj4+PiArICAgICAgICAucDJhbGlnbiBQQUdFX1NISUZUCj4+PiArR0xPQkFM
KGh2X2h5cGVyY2FsbF9wYWdlKQo+Pj4gKyAgICAgICAgLyogUmV0dXJuIC0xIGZvciAibm90IHll
dCByZWFkeSIgc3RhdGUgKi8KPj4+ICsgICAgICAgIG1vdiAtMSwgJXJheAo+Pj4gKyAgICAgICAg
cmV0Cj4+PiArMToKPj4+ICsgICAgICAgIC8qIEZpbGwgdGhlIHJlc3Qgd2l0aCBgcmV0YCAqLwo+
Pj4gKyAgICAgICAgLmZpbGwgUEFHRV9TSVpFIC0gKDFiIC0gaHZfaHlwZXJjYWxsX3BhZ2UpLCAx
LCAweGMzCj4+IElmIHlvdSB3YW50IHRvIGZpbGwgd2l0aCByZXRzLCB5b3UgY2FuIGRvIHRoaXMg
bW9yZSBzaW1wbHkgd2l0aDoKPj4KPj4gwqDCoMKgIC5wMmxpZ24gUEFHRV9TSElGVCwgMHhjMwo+
Pgo+PiB3aGljaCB3aWxsIGRvIHRoZSBzaXplIGNhbGN1bGF0aW9uIGZvciB5b3UuCj4+Cj4+IFRo
YXQgc2FpZCwgSSByZXRyYWN0IG15IHN0YXRlbWVudCBhYm91dCB3YW50aW5nIHRoaXMgaW4gdGhl
IG1pZGRsZSBvZgo+PiAudGV4dC7CoCAoU29ycnkuwqAgU2VlIGJlbG93LikKPj4KPj4+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jIGIveGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+Pj4gaW5kZXggOGQzODMxM2Q3YS4uMzgxYmUyYTY4YyAx
MDA2NDQKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPj4+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPj4+IEBAIC03Miw2ICs3Miwy
NyBAQCBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgKl9faW5pdCBoeXBlcnZfcHJvYmUodm9p
ZCkKPj4+ICAgICAgcmV0dXJuICZvcHM7Cj4+PiAgfQo+Pj4gIAo+Pj4gK3N0YXRpYyB2b2lkIF9f
aW5pdCBzZXR1cF9oeXBlcmNhbGxfcGFnZSh2b2lkKQo+Pj4gK3sKPj4+ICsgICAgdW5pb24gaHZf
eDY0X21zcl9oeXBlcmNhbGxfY29udGVudHMgaHlwZXJjYWxsX21zcjsKPj4+ICsKPj4+ICsgICAg
cmRtc3JsKEhWX1g2NF9NU1JfSFlQRVJDQUxMLCBoeXBlcmNhbGxfbXNyLmFzX3VpbnQ2NCk7Cj4+
PiArICAgIGh5cGVyY2FsbF9tc3IuZW5hYmxlID0gMTsKPj4+ICsgICAgaHlwZXJjYWxsX21zci5n
dWVzdF9waHlzaWNhbF9hZGRyZXNzID0KPj4+ICsgICAgICAgIF9fcGEoaHZfaHlwZXJjYWxsX3Bh
Z2UpID4+IEhWX0hZUF9QQUdFX1NISUZUOwo+Pj4gKyAgICB3cm1zcmwoSFZfWDY0X01TUl9IWVBF
UkNBTEwsIGh5cGVyY2FsbF9tc3IuYXNfdWludDY0KTsKPj4+ICt9Cj4+PiArCj4+PiArc3RhdGlj
IHZvaWQgX19pbml0IHNldHVwKHZvaWQpCj4+PiArewo+Pj4gKyAgICBzZXR1cF9oeXBlcmNhbGxf
cGFnZSgpOwo+Pj4gK30KPj4gVGhlIFRMRlMgc2F5cyB0aGF0IHdyaXRpbmcgZW5hYmxlIHdpbGwg
ZmFpbCB1bnRpbCB0aGUgT1MgaWRlbnRpdHkgaXMKPj4gc2V0LCB3aGljaCBBRkFDSVQsIGlzbid0
IGRvbmUgYW55d2hlcmUgaW4gdGhlIHNlcmllcy7CoCBUaGUgd2hvbGUKPj4gc2VxdWVuY2UgaXMg
ZGVzY3JpYmVkIGluICIzLjEzIEVzdGFibGlzaGluZyB0aGUgSHlwZXJjYWxsIEludGVyZmFjZSIK
PiBHb29kIGNhdGNoLiBJIHdpbGwgbWFrZSB1cCBhbiBpZGVudGl0eSBudW1iZXIgZm9yIFhlbi4g
SSB3aWxsIGFsc28KPiBmb2xsb3cgdGhlIHNlcXVlbmNlIHN0cmljdGx5Lgo+Cj4+IFRoZSBsb2Nr
ZWQgYml0IGlzIHByb2JhYmx5IGEgZ29vZCBpZGVhLCBidXQgb25lIGFzcGVjdCBtaXNzaW5nIGhl
cmUgaXMKPj4gdGhlIGNoZWNrIHRvIHNlZSB3aGV0aGVyIHRoZSBoeXBlcmNhbGwgcGFnZSBpcyBh
bHJlYWR5IGVuYWJsZWQsIHdoaWNoIEkKPj4gZXhwZWN0IGlzIGZvciBhIGtleGVjIGNyYXNoIHNj
ZW5hcmlvLgo+Pgo+PiBIb3dldmVyLCB0aGUgbW9zdCBpbXBvcnRhbnQgcG9pbnQgaXMgdGhlIG9u
ZSB3aGljaCBkZXNjcmliZXMgdGhlICNHUAo+PiBwcm9wZXJ0aWVzIG9mIHRoZSBndWVzdCB0cnlp
bmcgdG8gbW9kaWZ5IHRoZSBwYWdlLsKgIFRoaXMgY2FuIG9ubHkgYmUKPj4gYWNoaWV2ZWQgd2l0
aCBhbiBFUFQvTlBUIG1hcHBpbmcgbGFja2luZyB0aGUgVyBwZXJtaXNzaW9uLCB3aGljaCB3aWxs
Cj4+IHNoYXR0ZXIgaG9zdCBzdXBlcnBhZ2VzLsKgwqAgVGhlcmVmb3JlLCBwdXR0aW5nIGl0IGlu
IC50ZXh0IGlzIGdvaW5nIHRvIGJlCj4+IHJhdGhlciBwb29yLCBwZXJmIHdpc2UuCj4+Cj4+IEkg
YWxzbyBub3RlIHRoYXQgWGVuJ3MgaW1wbGVtZW50YXRpb24gb2YgdGhlIFZpcmlkaWFuIGh5cGVy
Y2FsbCBwYWdlCj4+IGRvZXNuJ3QgY29uZm9ybSB0byB0aGVzZSBwcm9wZXJ0aWVzLCBhbmQgd2Fu
dHMgZml4aW5nLsKgIEl0IGlzIGdvaW5nIHRvCj4+IG5lZWQgYSBuZXcga2luZCBpZGVudGlmaWNh
dGlvbiBvZiB0aGUgcGFnZSAocHJvYmFibHkgYSBuZXcgcDJtIHR5cGUpCj4+IHdoaWNoIGluamVj
dHMgI0dQIGlmIHdlIGV2ZXIgc2VlIGFuIEVQVF9WSU9MQVRJT04vTlBUX0ZBVUxUIGFnYWluc3Qg
aXQuCj4+Cj4+IEFzIGZvciBzdWdnZXN0aW9ucyBoZXJlLCBJJ20gc3RydWdnbGluZyB0byBmaW5k
IGFueSBtZW1vcnkgbWFwIGRldGFpbHMKPj4gZXhwb3NlZCBpbiB0aGUgVmlyaWRpYW4gaW50ZXJm
YWNlLCBhbmQgdGhlcmVmb3JlIHdoaWNoIGdmbiBpcyBiZXN0IHRvCj4+IGNob29zZS7CoCBJIGhh
dmUgYSBzaW5raW5nIGZlZWxpbmcgdGhhdCB0aGUgYW5zd2VyIGlzIEFDUEkuLi4KPiBUTEZTIG9u
bHkgc2F5cyAiZ28gZmluZCBvbmUgc3VpdGFibGUgcGFnZSB5b3Vyc2VsZiIgd2l0aG91dCBmdXJ0
aGVyCj4gaGludHMuCj4KPiBTaW5jZSB3ZSdyZSBzdGlsbCBxdWl0ZSBmYXIgYXdheSBmcm9tIGEg
ZnVuY3Rpb25pbmcgc3lzdGVtLCBmaW5kaW5nIGEKPiBtb3N0IHN1aXRhYmxlIHBhZ2UgaXNuJ3Qg
bXkgdG9wIHByaW9yaXR5IGF0IHRoaXMgcG9pbnQuIElmIHRoZXJlIGlzIGEKPiBzaW1wbGUgd2F5
IHRvIGV4dHJhcG9sYXRlIHN1aXRhYmxlIGluZm9ybWF0aW9uIGZyb20gQUNQSSwgdGhhdCB3b3Vs
ZCBiZQo+IGdyZWF0LiBJZiBpdCByZXF1aXJlcyB3cml0aW5nIGEgc2V0IG9mIGZ1bmN0aW9uYWxp
dGllcywgdGhhbiB0aGF0IHdpbGwKPiBuZWVkIHRvIHdhaXQgdGlsbCBsYXRlci4KClRvIGNvcGUg
d2l0aCB0aGUgIm9uZSBpcyBhbHJlYWR5IGVzdGFibGlzaGVkIGFuZCBpdCBpcyBhbHJlYWR5IGxv
Y2tlZCIKY2FzZSwgdGhlIG9ubHkgb3B0aW9uIGlzIHRvIGhhdmUgYSBmaXhtYXAgZW50cnkgd2hp
Y2ggY2FuIGJlIHNldApkeW5hbWljYWxseS7CoCBUaGUgcHJvYmxlbSBpcyB0aGF0IHRoZSBmaXht
YXAgcmVnaW9uIGlzIG1hcmtlZCBOWCBhbmQgNjRHCmF3YXkgZnJvbSAudGV4dC4KClBvc3NpYmx5
IHRoZSBsZWFzdCBiYWQgb3B0aW9uIGlzIHRvIGhhdmUgc29tZSBidWlsZC10aW1lIHNwYWNlIChz
byAwIG9yCjRrIGRlcGVuZGluZyBvbiBDT05GSUdfSFlQRVJWKSBiZXR3ZWVuIHRoZSBwZXItY3B1
IHN0dWJzIGFuZApYRU5fVklSVF9FTkQsIHdoaWNoIG9wZXJhdGVzIGxpa2UgdGhlIGZpeG1hcCwg
YnV0IGVuZHMgdXAgYXMgWC9STyBtYXBwaW5ncy4KClRoYXQgd2F5LCB0aGUgdmlydHVhbCBhZGRy
ZXNzIGVuZHMgdXAgaW4gYSB1c2VmdWwgcG9zaXRpb24gKHdydCB1c2luZwpkaXJlY3QgY2FsbCBp
bnN0cnVjdGlvbnMpIGlycmVzcGVjdGl2ZSBvZiB3aGVyZSB0aGUgZ2ZuIGlzL2VuZHMgdXAuwqAg
QXMKZm9yIGd1ZXNzaW5nLCBhIGdvb2Qgc3RhcnQgaXMgcHJvYmFibHkgTUFYUEhZU0FERFIuCgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
