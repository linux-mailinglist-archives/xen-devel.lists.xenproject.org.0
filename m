Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A57124BB2
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 16:28:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihbBc-0000eJ-Co; Wed, 18 Dec 2019 15:24:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cNHo=2I=amazon.com=prvs=24851c453=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihbBa-0000eE-SP
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 15:24:26 +0000
X-Inumbo-ID: 7524bac6-21aa-11ea-88e7-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7524bac6-21aa-11ea-88e7-bc764e2007e4;
 Wed, 18 Dec 2019 15:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576682659; x=1608218659;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k84YCbMSLNqLs2A2xGFqlifzVvCbX4Ti2Xpxjx7rBuk=;
 b=Wkn079EkXiyL6jU5xzhxQaqVWxDLjF9sE9LLV2q3bH/5zddzdgSEnRS5
 K+QEw9KQDOM4ZOFAF7dhyDOv2fHpx9JA5ubvoht7Hva2y1JY1P13RN3GI
 RuIuixeqDS/bTw+vI57lhq39o/1UKjiyM6+l7Jo0mD497jjZipuzCQN4z Q=;
IronPort-SDR: 4UdVMS1ZYJtSQSYN13zK0NneidDkB0bzwZ+rLLMneAyflwK4XQBp2/hclLq9sm+tJhEQYOcZSj
 7Drm90Y9SWsQ==
X-IronPort-AV: E=Sophos;i="5.69,329,1571702400"; 
   d="scan'208";a="9641033"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 18 Dec 2019 15:24:18 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS
 id CDD83A27AF; Wed, 18 Dec 2019 15:24:15 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 18 Dec 2019 15:24:15 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 15:24:14 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 18 Dec 2019 15:24:14 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 6/6] x86: implement Hyper-V clock source
Thread-Index: AQHVtbGIcPOyV0Vq0U60/IJ15FXn3qe//uhA
Date: Wed, 18 Dec 2019 15:24:14 +0000
Message-ID: <dcd1dc1a6e99484bbabb6c994c6506ce@EX13D32EUC003.ant.amazon.com>
References: <20191218144233.15372-1-liuwe@microsoft.com>
 <20191218144233.15372-7-liuwe@microsoft.com>
In-Reply-To: <20191218144233.15372-7-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.29]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 6/6] x86: implement Hyper-V clock source
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdlaS5saXUueGVu
QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIFdlaSBMaXUKPiBTZW50OiAxOCBEZWNlbWJlciAyMDE5
IDE0OjQzCj4gVG86IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc+Cj4gQ2M6IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsg
RHVycmFudCwgUGF1bAo+IDxwZHVycmFudEBhbWF6b24uY29tPjsgV2VpIExpdSA8bGl1d2VAbWlj
cm9zb2Z0LmNvbT47IEphbiBCZXVsaWNoCj4gPGpiZXVsaWNoQHN1c2UuY29tPjsgQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUKPiA8d2xAeGVuLm9yZz47
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IFN1YmplY3Q6IFtQQVRD
SCB2MiA2LzZdIHg4NjogaW1wbGVtZW50IEh5cGVyLVYgY2xvY2sgc291cmNlCj4gCj4gSW1wbGVt
ZW50IGEgY2xvY2sgc291cmNlIHVzaW5nIEh5cGVyLVYncyByZWZlcmVuY2UgVFNDIHBhZ2UuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KPiAtLS0KPiB2
MjoKPiAxLiBBZGRyZXNzIEphbidzIGNvbW1lbnRzLgo+IAo+IFJlbGV2YW50IHNwZWM6Cj4gCj4g
aHR0cHM6Ly9naXRodWIuY29tL01pY3Jvc29mdERvY3MvVmlydHVhbGl6YXRpb24tCj4gRG9jdW1l
bnRhdGlvbi9yYXcvbGl2ZS90bGZzL0h5cGVydmlzb3IlMjBUb3AlMjBMZXZlbCUyMEZ1bmN0aW9u
YWwlMjBTcGVjaWYKPiBpY2F0aW9uJTIwdjUuMEMucGRmCj4gCj4gU2VjdGlvbiAxMi42Lgo+IC0t
LQo+ICB4ZW4vYXJjaC94ODYvdGltZS5jIHwgMTAxICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMDEgaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvdGltZS5jIGIveGVuL2FyY2gveDg2L3RpbWUu
Ywo+IGluZGV4IDIxNjE2OWEwMjUuLjhiOTZiMmU5YTUgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gv
eDg2L3RpbWUuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni90aW1lLmMKPiBAQCAtMzEsNiArMzEsNyBA
QAo+ICAjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgo+ICAjaW5jbHVkZSA8YXNtL2ZpeG1hcC5o
Pgo+ICAjaW5jbHVkZSA8YXNtL2d1ZXN0Lmg+Cj4gKyNpbmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJ2
LXRsZnMuaD4KPiAgI2luY2x1ZGUgPGFzbS9tYzE0NjgxOHJ0Yy5oPgo+ICAjaW5jbHVkZSA8YXNt
L2RpdjY0Lmg+Cj4gICNpbmNsdWRlIDxhc20vYWNwaS5oPgo+IEBAIC02NDQsNiArNjQ1LDEwMyBA
QCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX3RpbWVzb3VyY2UgX19pbml0ZGF0YQo+IHBsdF94ZW5f
dGltZXIgPQo+ICB9Owo+ICAjZW5kaWYKPiAKPiArI2lmZGVmIENPTkZJR19IWVBFUlZfR1VFU1QK
PiArLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKgo+ICsgKiBIWVBFUi1WIFJFRkVSRU5DRSBUU0MKPiArICovCj4gKwo+ICtzdGF0aWMg
c3RydWN0IG1zX2h5cGVydl90c2NfcGFnZSAqaHlwZXJ2X3RzYzsKPiArc3RhdGljIHN0cnVjdCBw
YWdlX2luZm8gKmh5cGVydl90c2NfcGFnZTsKPiArCj4gK3N0YXRpYyBpbnQ2NF90IF9faW5pdCBp
bml0X2h5cGVydl90aW1lcihzdHJ1Y3QgcGxhdGZvcm1fdGltZXNvdXJjZSAqcHRzKQo+ICt7Cj4g
KyAgICBwYWRkcl90IG1hZGRyOwo+ICsgICAgdWludDY0X3QgdHNjX21zciwgZnJlcTsKPiArCj4g
KyAgICBpZiAoICEobXNfaHlwZXJ2LmZlYXR1cmVzICYgSFZfTVNSX1JFRkVSRU5DRV9UU0NfQVZB
SUxBQkxFKSApCj4gKyAgICAgICAgcmV0dXJuIDA7Cj4gKwo+ICsgICAgaHlwZXJ2X3RzY19wYWdl
ID0gYWxsb2NfZG9taGVhcF9wYWdlKE5VTEwsIDApOwo+ICsgICAgaWYgKCAhaHlwZXJ2X3RzY19w
YWdlICkKPiArICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAgICBoeXBlcnZfdHNjID0gX19tYXBf
ZG9tYWluX3BhZ2VfZ2xvYmFsKGh5cGVydl90c2NfcGFnZSk7Cj4gKyAgICBpZiAoICFoeXBlcnZf
dHNjICkKPiArICAgIHsKPiArICAgICAgICBmcmVlX2RvbWhlYXBfcGFnZShoeXBlcnZfdHNjX3Bh
Z2UpOwo+ICsgICAgICAgIGh5cGVydl90c2NfcGFnZSA9IE5VTEw7Cj4gKyAgICAgICAgcmV0dXJu
IDA7Cj4gKyAgICB9Cj4gKwo+ICsgICAgbWFkZHIgPSBwYWdlX3RvX21hZGRyKGh5cGVydl90c2Nf
cGFnZSk7Cj4gKwo+ICsgICAgLyoKPiArICAgICAqIFBlciBIeXBlci1WIFRMRlM6Cj4gKyAgICAg
KiAgIDEuIFJlYWQgZXhpc3RpbmcgTVNSIHZhbHVlCj4gKyAgICAgKiAgIDIuIFByZXNlcnZlIGJp
dHMgWzExOjFdCj4gKyAgICAgKiAgIDMuIFNldCBiaXRzIFs2MzoxMl0gdG8gYmUgZ3Vlc3QgcGh5
c2ljYWwgYWRkcmVzcyBvZiB0c2MgcGFnZQo+ICsgICAgICogICA0LiBTZXQgZW5hYmxlZCBiaXQg
KDApCj4gKyAgICAgKiAgIDUuIFdyaXRlIGJhY2sgbmV3IE1TUiB2YWx1ZQo+ICsgICAgICovCj4g
KyAgICByZG1zcmwoSFZfWDY0X01TUl9SRUZFUkVOQ0VfVFNDLCB0c2NfbXNyKTsKPiArICAgIHRz
Y19tc3IgJj0gMHhmZmVVTEw7Cj4gKyAgICB0c2NfbXNyIHw9ICBtYWRkciB8IDEgLyogZW5hYmxl
ZCAqLzsKPiArICAgIHdybXNybChIVl9YNjRfTVNSX1JFRkVSRU5DRV9UU0MsIHRzY19tc3IpOwo+
ICsKCllvdSBuZWVkIHRvIGNoZWNrIGZvciB0aGUgSFZfWDY0X0FDQ0VTU19GUkVRVUVOQ1lfTVNS
UyBmZWF0dXJlIG9yIHlvdSByaXNrIGEgI0dQIGJlbG93IEkgdGhpbmsuCgo+ICsgICAgLyogR2V0
IFRTQyBmcmVxdWVuY3kgZnJvbSBIeXBlci1WICovCj4gKyAgICByZG1zcmwoSFZfWDY0X01TUl9U
U0NfRlJFUVVFTkNZLCBmcmVxKTsKPiArICAgIHB0cy0+ZnJlcXVlbmN5ID0gZnJlcTsKPiArCj4g
KyAgICByZXR1cm4gZnJlcTsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB1aW50NjRfdCByZWFk
X2h5cGVydl90aW1lcih2b2lkKQo+ICt7Cj4gKyAgICB1aW50NjRfdCBzY2FsZSwgb2Zmc2V0LCBy
ZXQsIHRzYzsKPiArICAgIHVpbnQzMl90IHNlcTsKPiArICAgIGNvbnN0IHN0cnVjdCBtc19oeXBl
cnZfdHNjX3BhZ2UgKnRzY19wYWdlID0gaHlwZXJ2X3RzYzsKPiArCj4gKyAgICBkbyB7Cj4gKyAg
ICAgICAgc2VxID0gdHNjX3BhZ2UtPnRzY19zZXF1ZW5jZTsKPiArCj4gKyAgICAgICAgLyogU2Vx
IDAgaXMgc3BlY2lhbC4gSXQgbWVhbnMgdGhlIFRTQyBlbmxpZ2h0ZW5tZW50IGlzIG5vdAo+ICsg
ICAgICAgICAqIGF2YWlsYWJsZSBhdCB0aGUgbW9tZW50LiBUaGUgcmVmZXJlbmNlIHRpbWUgY2Fu
IG9ubHkgYmUKPiArICAgICAgICAgKiBvYnRhaW5lZCBmcm9tIHRoZSBSZWZlcmVuY2UgQ291bnRl
ciBNU1IuCj4gKyAgICAgICAgICovCj4gKyAgICAgICAgaWYgKCBzZXEgPT0gMCApCgpPbGRlciB2
ZXJzaW9ucyBvZiB0aGUgc3BlYyB1c2VkIHRvIHVzZSAweEZGRkZGRkZGIEkgdGhpbmssIGFsdGhv
dWdoIHdoZW4gSSBsb29rIGFnYWluIHRoZXkgc2VlbSB0byBoYXZlIGJlZW4gcmV0cm8tYWN0aXZl
bHkgZml4ZWQuIEluIGFueSBjYXNlIEkgdGhpbmsgeW91IHNob3VsZCB0cmVhdCBib3RoIDB4RkZG
RkZGRkYgYW5kIDAgYXMgaW52YWxpZC4KCj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICByZG1z
cmwoSFZfWDY0X01TUl9USU1FX1JFRl9DT1VOVCwgcmV0KTsKPiArICAgICAgICAgICAgcmV0dXJu
IHJldDsKPiArICAgICAgICB9Cj4gKwo+ICsgICAgICAgIC8qIHJkdHNjX29yZGVyZWQgYWxyZWFk
eSBjb250YWlucyBhIGxvYWQgZmVuY2UgKi8KPiArICAgICAgICB0c2MgPSByZHRzY19vcmRlcmVk
KCk7Cj4gKyAgICAgICAgc2NhbGUgPSB0c2NfcGFnZS0+dHNjX3NjYWxlOwo+ICsgICAgICAgIG9m
ZnNldCA9IHRzY19wYWdlLT50c2Nfb2Zmc2V0Owo+ICsKPiArICAgICAgICBzbXBfcm1iKCk7Cj4g
Kwo+ICsgICAgfSB3aGlsZSAodHNjX3BhZ2UtPnRzY19zZXF1ZW5jZSAhPSBzZXEpOwo+ICsKPiAr
ICAgIC8qIHJldCA9ICgodHNjICogc2NhbGUpID4+IDY0KSArIG9mZnNldDsgKi8KPiArICAgIGFz
bSAoICJtdWwgJVtzY2FsZV07IGFkZCAlW29mZnNldF0sICVbcmV0XSIKPiArICAgICAgICAgIDog
IithIiAodHNjKSwgW3JldF0gIj1kIiAocmV0KQo+ICsgICAgICAgICAgOiBbc2NhbGVdICJybSIg
KHNjYWxlKSwgW29mZnNldF0gInJtIiAob2Zmc2V0KSApOwo+ICsKCkl0IHdvdWxkIGJlIG5pY2Ug
dG8gY29tbW9uIHRoaXMgdXAgd2l0aCBzY2FsZV90c2MoKSBpbiB2aXJpZGlhbi90aW1lLmMuCgog
IFBhdWwKCj4gKyAgICByZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICtzdGF0aWMgc3RydWN0IHBsYXRm
b3JtX3RpbWVzb3VyY2UgX19pbml0ZGF0YSBwbHRfaHlwZXJ2X3RpbWVyID0KPiArewo+ICsgICAg
LmlkID0gImh5cGVydiIsCj4gKyAgICAubmFtZSA9ICJIWVBFUi1WIFJFRkVSRU5DRSBUU0MiLAo+
ICsgICAgLnJlYWRfY291bnRlciA9IHJlYWRfaHlwZXJ2X3RpbWVyLAo+ICsgICAgLmluaXQgPSBp
bml0X2h5cGVydl90aW1lciwKPiArICAgIC8qIFNlZSBUU0MgdGltZSBzb3VyY2UgZm9yIHdoeSBj
b3VudGVyX2JpdHMgaXMgc2V0IHRvIDYzICovCj4gKyAgICAuY291bnRlcl9iaXRzID0gNjMsCj4g
K307Cj4gKyNlbmRpZgo+ICsKPiAgLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKgo+ICAgKiBHRU5FUklDIFBMQVRGT1JNIFRJTUVSIElO
RlJBU1RSVUNUVVJFCj4gICAqLwo+IEBAIC03OTMsNiArODkxLDkgQEAgc3RhdGljIHU2NCBfX2lu
aXQgaW5pdF9wbGF0Zm9ybV90aW1lcih2b2lkKQo+ICAgICAgc3RhdGljIHN0cnVjdCBwbGF0Zm9y
bV90aW1lc291cmNlICogX19pbml0ZGF0YSBwbHRfdGltZXJzW10gPSB7Cj4gICNpZmRlZiBDT05G
SUdfWEVOX0dVRVNUCj4gICAgICAgICAgJnBsdF94ZW5fdGltZXIsCj4gKyNlbmRpZgo+ICsjaWZk
ZWYgQ09ORklHX0hZUEVSVl9HVUVTVAo+ICsgICAgICAgICZwbHRfaHlwZXJ2X3RpbWVyLAo+ICAj
ZW5kaWYKPiAgICAgICAgICAmcGx0X2hwZXQsICZwbHRfcG10aW1lciwgJnBsdF9waXQKPiAgICAg
IH07Cj4gLS0KPiAyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
