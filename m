Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C24E12890E
	for <lists+xen-devel@lfdr.de>; Sat, 21 Dec 2019 13:23:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iidkZ-00005g-Cp; Sat, 21 Dec 2019 12:20:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hm2O=2L=amazon.com=prvs=251716dec=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iidkX-00005a-PQ
 for xen-devel@lists.xenproject.org; Sat, 21 Dec 2019 12:20:49 +0000
X-Inumbo-ID: 4db0f592-23ec-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4db0f592-23ec-11ea-b6f1-bc764e2007e4;
 Sat, 21 Dec 2019 12:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576930842; x=1608466842;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tRzgpPjoYiF3U/0udPRYy3UHZS2orT6YS8Baif8BQa4=;
 b=BkcpZlL2Mva0yitiWqCFCw8DI0/qXvjXhDrzbYsSrQfHepQEFb8OPvNt
 RQK01RPegBhnjemWS78WsPEL5ICVTZJ6vgREZoIS79d3/pDBWt/WaLXgc
 P39IMq3c18JTy6yJFPuKzc1LrZCMhOzc6R24Zs9Aq2vLxeB0oRyFixmad k=;
IronPort-SDR: gEPMmK1zpL07kMV43aV7wMOtSnLTi/sPLGHkd1A1KWgQe15vZRohy/SYFt4Cg+SQuuPPECDRVR
 QzQHLU+taSPw==
X-IronPort-AV: E=Sophos;i="5.69,338,1571702400"; d="scan'208";a="10142432"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 21 Dec 2019 12:20:41 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS
 id 736EDA2448; Sat, 21 Dec 2019 12:20:39 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Sat, 21 Dec 2019 12:20:39 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 21 Dec 2019 12:20:38 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Sat, 21 Dec 2019 12:20:37 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 2/4] x86/viridian: drop private copy of
 HV_REFERENCE_TSC_PAGE in time.c
Thread-Index: AQHVt278cSBSsMgov0iZbV7r6pPVT6fEgwxA
Date: Sat, 21 Dec 2019 12:20:37 +0000
Message-ID: <8a88a067526442649fa6658c1556117a@EX13D32EUC003.ant.amazon.com>
References: <20191220195135.20130-1-liuwe@microsoft.com>
 <20191220195135.20130-3-liuwe@microsoft.com>
In-Reply-To: <20191220195135.20130-3-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.67]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 2/4] x86/viridian: drop private copy of
 HV_REFERENCE_TSC_PAGE in time.c
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdlaS5saXUueGVu
QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIFdlaSBMaXUKPiBTZW50OiAyMCBEZWNlbWJlciAyMDE5
IDE5OjUyCj4gVG86IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc+Cj4gQ2M6IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsg
RHVycmFudCwgUGF1bAo+IDxwZHVycmFudEBhbWF6b24uY29tPjsgV2VpIExpdSA8bGl1d2VAbWlj
cm9zb2Z0LmNvbT47IFBhdWwgRHVycmFudAo+IDxwYXVsQHhlbi5vcmc+OyBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyCj4gPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqQo+IDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0ggMi80XSB4ODYvdmlyaWRpYW46IGRyb3Ag
cHJpdmF0ZSBjb3B5IG9mCj4gSFZfUkVGRVJFTkNFX1RTQ19QQUdFIGluIHRpbWUuYwo+IAo+IFVz
ZSB0aGUgb25lIGRlZmluZWQgaW4gaHlwZXJ2LXRsZnMuaCBpbnN0ZWFkLiBObyBmdW5jdGlvbmFs
IGNoYW5nZQo+IGludGVuZGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1p
Y3Jvc29mdC5jb20+CgpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+Cgo+
IC0tLQo+ICB4ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3RpbWUuYyB8IDIwICsrKysrKy0tLS0t
LS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3RpbWUuYwo+
IGIveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi90aW1lLmMKPiBpbmRleCA2ZGRjYTI5YjI5Li4z
MmU3OWJiY2M0IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdGltZS5j
Cj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi90aW1lLmMKPiBAQCAtMTMsMTkgKzEz
LDExIEBACj4gCj4gICNpbmNsdWRlIDxhc20vYXBpYy5oPgo+ICAjaW5jbHVkZSA8YXNtL2V2ZW50
Lmg+Cj4gKyNpbmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJ2LXRsZnMuaD4KPiAgI2luY2x1ZGUgPGFz
bS9odm0vc3VwcG9ydC5oPgo+IAo+ICAjaW5jbHVkZSAicHJpdmF0ZS5oIgo+IAo+IC10eXBlZGVm
IHN0cnVjdCBfSFZfUkVGRVJFTkNFX1RTQ19QQUdFCj4gLXsKPiAtICAgIHVpbnQzMl90IFRzY1Nl
cXVlbmNlOwo+IC0gICAgdWludDMyX3QgUmVzZXJ2ZWQxOwo+IC0gICAgdWludDY0X3QgVHNjU2Nh
bGU7Cj4gLSAgICBpbnQ2NF90ICBUc2NPZmZzZXQ7Cj4gLSAgICB1aW50NjRfdCBSZXNlcnZlZDJb
NTA5XTsKPiAtfSBIVl9SRUZFUkVOQ0VfVFNDX1BBR0UsICpQSFZfUkVGRVJFTkNFX1RTQ19QQUdF
Owo+IC0KPiAgc3RhdGljIHZvaWQgdXBkYXRlX3JlZmVyZW5jZV90c2MoY29uc3Qgc3RydWN0IGRv
bWFpbiAqZCwgYm9vbCBpbml0aWFsaXplKQo+ICB7Cj4gICAgICBzdHJ1Y3QgdmlyaWRpYW5fZG9t
YWluICp2ZCA9IGQtPmFyY2guaHZtLnZpcmlkaWFuOwo+IEBAIC02MSw3ICs1Myw3IEBAIHN0YXRp
YyB2b2lkIHVwZGF0ZV9yZWZlcmVuY2VfdHNjKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsCj4gYm9v
bCBpbml0aWFsaXplKQo+ICAgICAgICAgICAqIHZpb2xhdGUgdGhlIHNwZWMuIGFuZCByZWx5IG9u
IGEgdmFsdWUgb2YgMCB0byBpbmRpY2F0ZSB0aGF0Cj4gdGhpcwo+ICAgICAgICAgICAqIGVubGln
aHRlbm1lbnQgc2hvdWxkIG5vIGxvbmdlciBiZSB1c2VkLgo+ICAgICAgICAgICAqLwo+IC0gICAg
ICAgIHAtPlRzY1NlcXVlbmNlID0gMDsKPiArICAgICAgICBwLT50c2Nfc2VxdWVuY2UgPSAwOwo+
IAo+ICAgICAgICAgIHByaW50ayhYRU5MT0dfR19JTkZPICJkJWQ6IFZJUklESUFOIFJFRkVSRU5D
RV9UU0M6Cj4gaW52YWxpZGF0ZWRcbiIsCj4gICAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCk7
Cj4gQEAgLTc5LDE1ICs3MSwxNSBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfcmVmZXJlbmNlX3RzYyhj
b25zdCBzdHJ1Y3QgZG9tYWluCj4gKmQsIGJvb2wgaW5pdGlhbGl6ZSkKPiAgICAgICAqIFRoZSBv
ZmZzZXQgdmFsdWUgaXMgY2FsY3VsYXRlZCBvbiByZXN0b3JlIGFmdGVyIG1pZ3JhdGlvbiBhbmQK
PiAgICAgICAqIGVuc3VyZXMgdGhhdCBXaW5kb3dzIHdpbGwgbm90IHNlZSBhIGxhcmdlIGp1bXAg
aW4gUmVmZXJlbmNlVGltZS4KPiAgICAgICAqLwo+IC0gICAgcC0+VHNjU2NhbGUgPSAoKDEwMDAw
dWwgPDwgMzIpIC8gZC0+YXJjaC50c2Nfa2h6KSA8PCAzMjsKPiAtICAgIHAtPlRzY09mZnNldCA9
IHRyYy0+b2ZmOwo+ICsgICAgcC0+dHNjX3NjYWxlID0gKCgxMDAwMHVsIDw8IDMyKSAvIGQtPmFy
Y2gudHNjX2toeikgPDwgMzI7Cj4gKyAgICBwLT50c2Nfb2Zmc2V0ID0gdHJjLT5vZmY7Cj4gICAg
ICBzbXBfd21iKCk7Cj4gCj4gLSAgICBzZXEgPSBwLT5Uc2NTZXF1ZW5jZSArIDE7Cj4gKyAgICBz
ZXEgPSBwLT50c2Nfc2VxdWVuY2UgKyAxOwo+ICAgICAgaWYgKCBzZXEgPT0gMHhGRkZGRkZGRiB8
fCBzZXEgPT0gMCApIC8qIEF2b2lkIGJvdGggJ2ludmFsaWQnIHZhbHVlcwo+ICovCj4gICAgICAg
ICAgc2VxID0gMTsKPiAKPiAtICAgIHAtPlRzY1NlcXVlbmNlID0gc2VxOwo+ICsgICAgcC0+dHNj
X3NlcXVlbmNlID0gc2VxOwo+ICB9Cj4gCj4gIC8qCj4gLS0KPiAyLjIwLjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
