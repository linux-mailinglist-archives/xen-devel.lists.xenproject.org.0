Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 512EA124ABE
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 16:10:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihauJ-0007Ev-Ff; Wed, 18 Dec 2019 15:06:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cNHo=2I=amazon.com=prvs=24851c453=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihauI-0007Eq-7z
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 15:06:34 +0000
X-Inumbo-ID: face43ac-21a7-11ea-90aa-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id face43ac-21a7-11ea-90aa-12813bfff9fa;
 Wed, 18 Dec 2019 15:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576681594; x=1608217594;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DCUThw40ip39Brfvv2+Br6muYtDJCgKYb/mXxyjVt5g=;
 b=viK4KvVaxIWQfeUX8oI/wccepAiN664F+S47C6e5g+MDLHfUm//TJxmx
 CxCD3nAlnkURk8jr6JQJhyPr1uVGGS2u3DpNDldVFt8ZvlVWMxhfHGZai
 Ja55GmqocspmTq12SNhDFF8RNDfRceDgEnInWB1PeicX4uK/uqbimDCUd U=;
IronPort-SDR: MbHAF2qOSu2vZ5ucbLJbBocnHqcZ7esF95Nzhs3YdyAykebpg4uZu/pZMEyvVbC+/81RqL82WW
 zY2PX841NQyA==
X-IronPort-AV: E=Sophos;i="5.69,329,1571702400"; 
   d="scan'208";a="9049471"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-81e76b79.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 18 Dec 2019 15:06:33 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-81e76b79.us-west-2.amazon.com (Postfix) with ESMTPS
 id 49973A1CF6; Wed, 18 Dec 2019 15:06:32 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 18 Dec 2019 15:06:32 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 15:06:31 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 18 Dec 2019 15:06:30 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 4/6] x86/viridian: drop private copy of
 HV_REFERENCE_TSC_PAGE in time.c
Thread-Index: AQHVtbGFumF5P5LEMk2gw4F3ZBerVqe//bxg
Date: Wed, 18 Dec 2019 15:06:30 +0000
Message-ID: <a19ffb59311943c1b78781612adf517f@EX13D32EUC003.ant.amazon.com>
References: <20191218144233.15372-1-liuwe@microsoft.com>
 <20191218144233.15372-5-liuwe@microsoft.com>
In-Reply-To: <20191218144233.15372-5-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.29]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 4/6] x86/viridian: drop private copy of
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
QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIFdlaSBMaXUKPiBTZW50OiAxOCBEZWNlbWJlciAyMDE5
IDE0OjQzCj4gVG86IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc+Cj4gQ2M6IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsg
RHVycmFudCwgUGF1bAo+IDxwZHVycmFudEBhbWF6b24uY29tPjsgV2VpIExpdSA8bGl1d2VAbWlj
cm9zb2Z0LmNvbT47IFBhdWwgRHVycmFudAo+IDxwYXVsQHhlbi5vcmc+OyBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyCj4gPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqQo+IDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgNC82XSB4ODYvdmlyaWRpYW46IGRy
b3AgcHJpdmF0ZSBjb3B5IG9mCj4gSFZfUkVGRVJFTkNFX1RTQ19QQUdFIGluIHRpbWUuYwo+IAo+
IFVzZSB0aGUgb25lIGRlZmluZWQgaW4gaHlwZXJ2LXRsZnMuaCBpbnN0ZWFkLiBObyBmdW5jdGlv
bmFsIGNoYW5nZQo+IGludGVuZGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdl
QG1pY3Jvc29mdC5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdGltZS5j
IHwgMzAgKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
MSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L2h2bS92aXJpZGlhbi90aW1lLmMKPiBiL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4v
dGltZS5jCj4gaW5kZXggNmRkY2EyOWIyOS4uMzNjMTU3ODJlNCAxMDA2NDQKPiAtLS0gYS94ZW4v
YXJjaC94ODYvaHZtL3ZpcmlkaWFuL3RpbWUuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdmly
aWRpYW4vdGltZS5jCj4gQEAgLTEzLDE5ICsxMywxMSBAQAo+IAo+ICAjaW5jbHVkZSA8YXNtL2Fw
aWMuaD4KPiAgI2luY2x1ZGUgPGFzbS9ldmVudC5oPgo+ICsjaW5jbHVkZSA8YXNtL2d1ZXN0L2h5
cGVydi10bGZzLmg+Cj4gICNpbmNsdWRlIDxhc20vaHZtL3N1cHBvcnQuaD4KPiAKPiAgI2luY2x1
ZGUgInByaXZhdGUuaCIKPiAKPiAtdHlwZWRlZiBzdHJ1Y3QgX0hWX1JFRkVSRU5DRV9UU0NfUEFH
RQo+IC17Cj4gLSAgICB1aW50MzJfdCBUc2NTZXF1ZW5jZTsKPiAtICAgIHVpbnQzMl90IFJlc2Vy
dmVkMTsKPiAtICAgIHVpbnQ2NF90IFRzY1NjYWxlOwo+IC0gICAgaW50NjRfdCAgVHNjT2Zmc2V0
Owo+IC0gICAgdWludDY0X3QgUmVzZXJ2ZWQyWzUwOV07Cj4gLX0gSFZfUkVGRVJFTkNFX1RTQ19Q
QUdFLCAqUEhWX1JFRkVSRU5DRV9UU0NfUEFHRTsKPiAtCj4gIHN0YXRpYyB2b2lkIHVwZGF0ZV9y
ZWZlcmVuY2VfdHNjKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIGJvb2wgaW5pdGlhbGl6ZSkKPiAg
ewo+ICAgICAgc3RydWN0IHZpcmlkaWFuX2RvbWFpbiAqdmQgPSBkLT5hcmNoLmh2bS52aXJpZGlh
bjsKPiBAQCAtNDEsMTggKzMzLDE4IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9yZWZlcmVuY2VfdHNj
KGNvbnN0IHN0cnVjdCBkb21haW4KPiAqZCwgYm9vbCBpbml0aWFsaXplKQo+ICAgICAgICogVGhp
cyBlbmxpZ2h0ZW5tZW50IG11c3QgYmUgZGlzYWJsZWQgaXMgdGhlIGhvc3QgVFNDIGlzIG5vdAo+
IGludmFyaWFudC4KPiAgICAgICAqIEhvd2V2ZXIgaXQgaXMgYWxzbyBkaXNhYmxlZCBpZiB2dHNj
IGlzIHRydWUgKHdoaWNoIG1lYW5zIHJkdHNjIGlzCj4gICAgICAgKiBiZWluZyBlbXVsYXRlZCku
IFRoaXMgZ2VuZXJhbGx5IGhhcHBlbnMgd2hlbiBndWVzdCBUU0MgZnJlcSBhbmQKPiBob3N0Cj4g
LSAgICAgKiBUU0MgZnJlcSBkb24ndCBtYXRjaC4gVGhlIFRzY1NjYWxlIHZhbHVlIGNvdWxkIGJl
IGFkanVzdGVkIHRvIGNvcGUKPiArICAgICAqIFRTQyBmcmVxIGRvbid0IG1hdGNoLiBUaGUgdHNj
X3NjYWxlIHZhbHVlIGNvdWxkIGJlIGFkanVzdGVkIHRvCj4gY29wZQo+ICAgICAgICogd2l0aCB0
aGlzLCBhbGxvd2luZyB2dHNjIHRvIGJlIHR1cm5lZCBvZmYsIGJ1dCBzdXBwb3J0IGZvciB0aGlz
IGlzCj4gICAgICAgKiBub3QgeWV0IHByZXNlbnQgaW4gdGhlIGh5cGVydmlzb3IuIFRodXMgaXMg
aXQgaXMgcG9zc2libGUgdGhhdAo+ICAgICAgICogbWlncmF0aW5nIGEgV2luZG93cyBWTSBiZXR3
ZWVuIGhvc3RzIG9mIGRpZmZlcmluZyBUU0MgZnJlcXVlbmNpZXMKPiAgICAgICAqIG1heSByZXN1
bHQgaW4gbGFyZ2UgZGlmZmVyZW5jZXMgaW4gZ3Vlc3QgcGVyZm9ybWFuY2UuIEFueSBqdW1wIGlu
Cj4gICAgICAgKiBUU0MgZHVlIHRvIG1pZ3JhdGlvbiBkb3duLXRpbWUgY2FuLCBob3dldmVyLCBi
ZSBjb21wZW5zYXRlZCBmb3IgYnkKPiAtICAgICAqIHNldHRpbmcgdGhlIFRzY09mZnNldCB2YWx1
ZSAoc2VlIGJlbG93KS4KPiArICAgICAqIHNldHRpbmcgdGhlIHRzY19vZmZzZXQgdmFsdWUgKHNl
ZSBiZWxvdykuCj4gICAgICAgKi8KPiAgICAgIGlmICggIWhvc3RfdHNjX2lzX3NhZmUoKSB8fCBk
LT5hcmNoLnZ0c2MgKQo+ICAgICAgewo+ICAgICAgICAgIC8qCj4gLSAgICAgICAgICogVGhlIHNw
ZWNpZmljYXRpb24gc3RhdGVzIHRoYXQgdmFsaWQgdmFsdWVzIG9mIFRzY1NlcXVlbmNlCj4gcmFu
Z2UKPiArICAgICAgICAgKiBUaGUgc3BlY2lmaWNhdGlvbiBzdGF0ZXMgdGhhdCB2YWxpZCB2YWx1
ZXMgb2YgdHNjX3NlcXVlbmNlCj4gcmFuZ2UKPiAgICAgICAgICAgKiBmcm9tIDAgdG8gMHhGRkZG
RkZGRS4gVGhlIHZhbHVlIDB4RkZGRkZGRkYgaXMgdXNlZCB0byBpbmRpY2F0ZQo+ICAgICAgICAg
ICAqIHRoaXMgbWVjaGFuaXNtIGlzIG5vIGxvbmdlciBhIHJlbGlhYmxlIHNvdXJjZSBvZiB0aW1l
IGFuZCB0aGF0Cj4gICAgICAgICAgICogdGhlIFZNIHNob3VsZCBmYWxsIGJhY2sgdG8gYSBkaWZm
ZXJlbnQgc291cmNlLgo+IEBAIC02MSw3ICs1Myw3IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9yZWZl
cmVuY2VfdHNjKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsCj4gYm9vbCBpbml0aWFsaXplKQo+ICAg
ICAgICAgICAqIHZpb2xhdGUgdGhlIHNwZWMuIGFuZCByZWx5IG9uIGEgdmFsdWUgb2YgMCB0byBp
bmRpY2F0ZSB0aGF0Cj4gdGhpcwo+ICAgICAgICAgICAqIGVubGlnaHRlbm1lbnQgc2hvdWxkIG5v
IGxvbmdlciBiZSB1c2VkLgo+ICAgICAgICAgICAqLwo+IC0gICAgICAgIHAtPlRzY1NlcXVlbmNl
ID0gMDsKPiArICAgICAgICBwLT50c2Nfc2VxdWVuY2UgPSAwOwo+IAo+ICAgICAgICAgIHByaW50
ayhYRU5MT0dfR19JTkZPICJkJWQ6IFZJUklESUFOIFJFRkVSRU5DRV9UU0M6Cj4gaW52YWxpZGF0
ZWRcbiIsCj4gICAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCk7Cj4gQEAgLTcyLDI5ICs2NCwy
OSBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfcmVmZXJlbmNlX3RzYyhjb25zdCBzdHJ1Y3QgZG9tYWlu
Cj4gKmQsIGJvb2wgaW5pdGlhbGl6ZSkKPiAgICAgICAqIFRoZSBndWVzdCB3aWxsIGNhbGN1bGF0
ZSByZWZlcmVuY2UgdGltZSBhY2NvcmRpbmcgdG8gdGhlIGZvbGxvd2luZwo+ICAgICAgICogZm9y
bXVsYToKPiAgICAgICAqCj4gLSAgICAgKiBSZWZlcmVuY2VUaW1lID0gKChSRFRTQygpICogVHNj
U2NhbGUpID4+IDY0KSArIFRzY09mZnNldAo+ICsgICAgICogUmVmZXJlbmNlVGltZSA9ICgoUkRU
U0MoKSAqIHRzY19zY2FsZSkgPj4gNjQpICsgdHNjX29mZnNldAo+ICAgICAgICoKPiAgICAgICAq
IFdpbmRvd3MgdXNlcyBhIDEwMG5zIHRpY2ssIHNvIHdlIG5lZWQgYSBzY2FsZSB3aGljaCBpcyBj
cHUKPiAgICAgICAqIHRpY2tzIHBlciAxMDBucyBzaGlmdGVkIGxlZnQgYnkgNjQuCj4gICAgICAg
KiBUaGUgb2Zmc2V0IHZhbHVlIGlzIGNhbGN1bGF0ZWQgb24gcmVzdG9yZSBhZnRlciBtaWdyYXRp
b24gYW5kCj4gICAgICAgKiBlbnN1cmVzIHRoYXQgV2luZG93cyB3aWxsIG5vdCBzZWUgYSBsYXJn
ZSBqdW1wIGluIFJlZmVyZW5jZVRpbWUuCj4gICAgICAgKi8KPiAtICAgIHAtPlRzY1NjYWxlID0g
KCgxMDAwMHVsIDw8IDMyKSAvIGQtPmFyY2gudHNjX2toeikgPDwgMzI7Cj4gLSAgICBwLT5Uc2NP
ZmZzZXQgPSB0cmMtPm9mZjsKPiArICAgIHAtPnRzY19zY2FsZSA9ICgoMTAwMDB1bCA8PCAzMikg
LyBkLT5hcmNoLnRzY19raHopIDw8IDMyOwo+ICsgICAgcC0+dHNjX29mZnNldCA9IHRyYy0+b2Zm
Owo+ICAgICAgc21wX3dtYigpOwo+IAo+IC0gICAgc2VxID0gcC0+VHNjU2VxdWVuY2UgKyAxOwo+
ICsgICAgc2VxID0gcC0+dHNjX3NlcXVlbmNlICsgMTsKPiAgICAgIGlmICggc2VxID09IDB4RkZG
RkZGRkYgfHwgc2VxID09IDAgKSAvKiBBdm9pZCBib3RoICdpbnZhbGlkJyB2YWx1ZXMKPiAqLwo+
ICAgICAgICAgIHNlcSA9IDE7Cj4gCj4gLSAgICBwLT5Uc2NTZXF1ZW5jZSA9IHNlcTsKPiArICAg
IHAtPnRzY19zZXF1ZW5jZSA9IHNlcTsKPiAgfQo+IAo+ICAvKgo+ICAgKiBUaGUgc3BlY2lmaWNh
dGlvbiBzYXlzOiAiVGhlIHBhcnRpdGlvbiByZWZlcmVuY2UgdGltZSBpcyBjb21wdXRlZAo+ICAg
KiBieSB0aGUgZm9sbG93aW5nIGZvcm11bGE6Cj4gICAqCj4gLSAqIFJlZmVyZW5jZVRpbWUgPSAo
KFZpcnR1YWxUc2MgKiBUc2NTY2FsZSkgPj4gNjQpICsgVHNjT2Zmc2V0Cj4gKyAqIFJlZmVyZW5j
ZVRpbWUgPSAoKFZpcnR1YWxUc2MgKiB0c2Nfc2NhbGUpID4+IDY0KSArIHRzY19vZmZzZXQKCkkn
ZCBwcmVmZXIga2VlcGluZyB0aGUgQ2FtZWxDYXNlIGhlcmUgYXMgaXQncyB0ZXh0IGxpZnRlZCBm
cm9tIHRoZSBUTEZTIGFuZCBub3QgcmVsaWFudCBvbiB0aGUgaGVhZGVyIGRlZmluaXRpb25zLgoK
ICBQYXVsCgo+ICAgKgo+ICAgKiBUaGUgbXVsdGlwbGljYXRpb24gaXMgYSA2NCBiaXQgbXVsdGlw
bGljYXRpb24sIHdoaWNoIHJlc3VsdHMgaW4gYQo+ICAgKiAxMjggYml0IG51bWJlciB3aGljaCBp
cyB0aGVuIHNoaWZ0ZWQgNjQgdGltZXMgdG8gdGhlIHJpZ2h0IHRvIG9idGFpbgo+IC0tCj4gMi4y
MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
