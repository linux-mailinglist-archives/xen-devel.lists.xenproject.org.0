Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E5D86455
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 16:28:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvjNO-0005vQ-Vq; Thu, 08 Aug 2019 14:26:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nHR3=WE=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hvjNN-0005vL-JA
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 14:26:45 +0000
X-Inumbo-ID: 8bf139dd-b9e8-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8bf139dd-b9e8-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 14:26:44 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: W0DYVxJNf8HDX7Okeq7NEOS5sXmyk6RkWp9WLKVFabjz6jmb5/ygogesvB1T6qFgIuNUWyKn8g
 6C0S7jVmJk02/xjm4c+c/sNHdKE3PnZjOXMVnSJQBs5vnXrjrp/ndKTD7illCO/EsIwPa/sjeZ
 GrwTwRNn3dky3NcLN+10q9JApN1D1lQKMX+ayC6O48DxdPO9U2fmMw9zRulLx5ObInGQmXWdgq
 0nesPclJtBtsZQ14pI32fPrOodU2YBiS/8MGPwtkRnDfMvk1pSd51hLu7x97EFk6wNus6el906
 dC4=
X-SBRS: 2.7
X-MesageID: 4216544
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,361,1559534400"; 
   d="scan'208";a="4216544"
Date: Thu, 8 Aug 2019 15:26:41 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190808142641.GX1242@perard.uk.xensource.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-30-anthony.perard@citrix.com>
 <20190807155451.pkld6zhcxljzx6d7@Air-de-Roger>
 <20190808132832.GU1242@perard.uk.xensource.com>
 <20190808134423.ybqg3qkpw5ucfzk4@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808134423.ybqg3qkpw5ucfzk4@Air-de-Roger>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 29/35] OvmfPkg/OvmfXen:
 Override PcdFSBClock to Xen vLAPIC timer frequency
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDM6NDQ6MjNQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIEF1ZyAwOCwgMjAxOSBhdCAwMjoyODozMlBNICswMTAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+IE9uIFdlZCwgQXVnIDA3LCAyMDE5IGF0IDA1OjU0OjUxUE0g
KzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgSnVsIDI5LCAyMDE5
IGF0IDA0OjM5OjM4UE0gKzAxMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiA+IFBjZEZT
QkNsb2NrIGlzIHVzZWQgYnkgU2VjUGVpRHhlVGltZXJMaWJDcHUsIHRoZSBUaW1lckxpYgo+ID4g
PiA+IGltcGxlbWVudGF0aW9uLiBJdCB3aWxsIGFsc28gYmUgdXNlZCBieSBYZW5UaW1lckR4ZS4g
T3ZlcnJpZGUKPiA+ID4gPiBQY2RGU0JDbG9jayB0byBtYXRjaCBYZW4gdkxBUElDIHRpbWVyIGZy
ZXF1ZW5jeS4KPiA+ID4gCj4gPiA+IEknbSBraW5kIG9mIHN1cnByaXNlZCB0aGF0IGhpcyBpcyBu
b3QgYXV0b21hdGljYWxseSBkZXRlY3RlZD8KPiA+ID4gCj4gPiA+IElzIGl0IGEgYnVnIGluIFhl
biBvciBqdXN0IGFsd2F5cyBoYXJkY29kZWQgb24gT1ZNRj8KPiA+IAo+ID4gSXQncyBoYXJkY29k
ZWQuIFdoeSB3b3VsZCB5b3UgbmVlZCBhdXRvIGRldGVjdGlvbiB3aGVuIHlvdSBhbHdheXMgcnVu
IG9uCj4gPiB0aGUgc2FtZSBtYWNoaW5lIDstKS4KPiAKPiBJIGRvbid0IHRoaW5rIHRoYXQncyBw
YXJ0IG9mIHRoZSBIVk0vUFZIIEFCSSBpbiBhbnkgd2F5LCBhbmQgaWYgeW91Cj4gaGFyZGNvZGUg
aXQgaW4gT1ZNRiBpdCB3b3VsZCBwcmV2ZW50IFhlbiBmcm9tIGNoYW5naW5nIHRoZSBmcmVxdWVu
Y3kKPiBpbiB0aGUgZnV0dXJlIGlmIHN1Y2ggbmVjZXNzaXR5IGFyaXNlcy4gV2Ugc2hvdWxkIHRy
eSB0byBhdm9pZCBwYWludGluZwo+IG91cnNlbHZlcyBpbnRvIGEgY29ybmVyIHdoZW4gcG9zc2li
bGUuCj4gCj4gRG9lc24ndCBPVk1GIGhhdmUgYSB3YXkgdG8gZ2V0IHRoaXMgZnJvbSB0aGUgaGFy
ZHdhcmUgaXRzZWxmPwoKU28gRURLSUkgZG9lc24ndCBoYXZlIHRoYXQgY2FwYWJpbGl0eSwgRlNC
Q2xvY2sgaXMgYSBidWlsZCB0aW1lIHZhbHVlCmFuZCBjYW4ndCBiZSBjaGFuZ2VkIGF0IHJ1biB0
aW1lLiBCdXQgT1ZNRiAob24gS1ZNIG9yIEhWTSkgZG9lc24ndCB1c2UKdGhhdCB2YWx1ZSBhdCBh
bGwsIGl0IHVzZXMgdGhlIEFDUEkgdGltZXIgaW5zdGVhZC4KCldlIGNvdWxkIHRyeSB0byBmaW5k
IGEgYmV0dGVyIHdheSB0byBnZXQgdGltZSBpbiBPdm1mWGVuIHdpdGhvdXQKaGFyZGNvZGluZyBG
U0JDbG9jaywgYnV0IG1heWJlIGluIGEgZm9sbG93LXVwLgoKVGhhbmtzLAoKLS0gCkFudGhvbnkg
UEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
