Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E87D914D8C8
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 11:17:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix6py-0001dz-Pm; Thu, 30 Jan 2020 10:14:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EN2q=3T=amazon.co.uk=prvs=29183970d=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ix6px-0001du-EF
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 10:14:13 +0000
X-Inumbo-ID: 43193bf4-4349-11ea-a933-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43193bf4-4349-11ea-a933-bc764e2007e4;
 Thu, 30 Jan 2020 10:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580379253; x=1611915253;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JOd81IbTQUHvaxrj4ni1tkAOf1st6EtcQutTbBAn/gM=;
 b=pIW2XBmVJ2O5yw+IhkDxKuHxl+pqQpyjBhxYWG0DhnYN86/yF5oIeBDK
 UxnXvm3cU42mR91xqhISjjv4ay1KZ5v5uJvadRwthUeJTJ2voFWx1BhDU
 vV1cGI5XgcO1xxbzys/WGHN7bb55vFfmDpRautZvupyk5gzHPnW5o5nrY w=;
IronPort-SDR: 7g3QB7Y0cbVhBmMlu6MPj9Sawlv3OIsKOSPKBApbMAV42yFz8aba7c+ULnVk2hTYIS38TY2i08
 Fa2Pg0Xl576Q==
X-IronPort-AV: E=Sophos;i="5.70,381,1574121600"; d="scan'208";a="21995730"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 30 Jan 2020 10:14:12 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 69169A2188; Thu, 30 Jan 2020 10:14:11 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 30 Jan 2020 10:14:11 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 30 Jan 2020 10:14:10 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 30 Jan 2020 10:14:09 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v5 10/12] x86/hyperv: provide percpu
 hypercall input page
Thread-Index: AQHV1uHZqHP8uXa6Dkue/8UZs8woVqgC/gKQ
Date: Thu, 30 Jan 2020 10:14:09 +0000
Message-ID: <23661bc4722a4e2b96632a3eea761609@EX13D32EUC003.ant.amazon.com>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-11-liuwe@microsoft.com>
In-Reply-To: <20200129202034.15052-11-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 10/12] x86/hyperv: provide percpu
 hypercall input page
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
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgV2VpDQo+IExpdQ0K
PiBTZW50OiAyOSBKYW51YXJ5IDIwMjAgMjA6MjENCj4gVG86IFhlbiBEZXZlbG9wbWVudCBMaXN0
IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+DQo+IENjOiBXZWkgTGl1IDxsaXV3ZUBt
aWNyb3NvZnQuY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEFuZHJldyBDb29wZXINCj4gPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24u
Y28udWs+Ow0KPiBNaWNoYWVsIEtlbGxleSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT47IFJvZ2Vy
IFBhdSBNb25uw6kNCj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTdWJqZWN0OiBbWGVuLWRl
dmVsXSBbUEFUQ0ggdjUgMTAvMTJdIHg4Ni9oeXBlcnY6IHByb3ZpZGUgcGVyY3B1IGh5cGVyY2Fs
bA0KPiBpbnB1dCBwYWdlDQo+IA0KPiBIeXBlci1WJ3MgaW5wdXQgLyBvdXRwdXQgYXJndW1lbnQg
bXVzdCBiZSA4IGJ5dGVzIGFsaWduZWQgYW4gbm90IGNyb3NzDQo+IHBhZ2UgYm91bmRhcnkuIE9u
ZSB3YXkgdG8gc2F0aXNmeSB0aG9zZSByZXF1aXJlbWVudHMgaXMgdG8gdXNlIHBlcmNwdQ0KPiBw
YWdlLg0KPiANCj4gRm9yIHRoZSBmb3Jlc2VlYWJsZSBmdXR1cmUgd2Ugb25seSBuZWVkIHRvIHBy
b3ZpZGUgaW5wdXQgZm9yIFRMQg0KPiBhbmQgQVBJQyBoeXBlcmNhbGxzLCBzbyBza2lwIHNldHRp
bmcgdXAgYW4gb3V0cHV0IHBhZ2UuDQo+IA0KPiBXZSB3aWxsIGFsc28gbmVlZCB0byBwcm92aWRl
IGFuIGFwX3NldHVwIGhvb2sgZm9yIHNlY29uZGFyeSBjcHVzIHRvDQo+IHNldHVwIGl0cyBvd24g
aW5wdXQgcGFnZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29m
dC5jb20+DQoNClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+
DQoNCj4gLS0tDQo+IHY1Og0KPiAxLiBBZGp1c3QgdG8gbmV3IGFwX3NldHVwDQo+IDIuIENoYW5n
ZSB2YXJpYWJsZSBuYW1lIHRvIGh2X3BjcHVfaW5wdXRfcGFnZQ0KPiANCj4gdjQ6DQo+IDEuIENo
YW5nZSB3b3JkaW5nIGluIGNvbW1pdCBtZXNzYWdlDQo+IDIuIFByZXZlbnQgbGVhaw0KPiAzLiBJ
bnRyb2R1Y2UgYSBwcml2YXRlIGhlYWRlcg0KPiANCj4gdjM6DQo+IDEuIFVzZSB4ZW5oZWFwIHBh
Z2UgaW5zdGVhZA0KPiAyLiBEcm9wIHBhZ2UgdHJhY2tpbmcgc3RydWN0dXJlDQo+IDMuIERyb3Ag
UGF1bCdzIHJldmlldyB0YWcNCj4gLS0tDQo+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5
cGVydi5jICB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICB4ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaCB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA2MCBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmgNCj4gDQo+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jDQo+IGIveGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydi9oeXBlcnYuYw0KPiBpbmRleCA0Mzg3YjY1NDFlLi5mMGZhY2NjYmFkIDEw
MDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jDQo+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMNCj4gQEAgLTI3LDcgKzI3LDEwIEBA
DQo+ICAjaW5jbHVkZSA8YXNtL2d1ZXN0L2h5cGVydi10bGZzLmg+DQo+ICAjaW5jbHVkZSA8YXNt
L3Byb2Nlc3Nvci5oPg0KPiANCj4gKyNpbmNsdWRlICJwcml2YXRlLmgiDQo+ICsNCj4gIHN0cnVj
dCBtc19oeXBlcnZfaW5mbyBfX3JlYWRfbW9zdGx5IG1zX2h5cGVydjsNCj4gK0RFRklORV9QRVJf
Q1BVX1JFQURfTU9TVExZKHZvaWQgKiwgaHZfcGNwdV9pbnB1dF9wYWdlKTsNCj4gDQo+ICBzdGF0
aWMgdWludDY0X3QgZ2VuZXJhdGVfZ3Vlc3RfaWQodm9pZCkNCj4gIHsNCj4gQEAgLTEyNywxNCAr
MTMwLDQyIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9oeXBlcmNhbGxfcGFnZSh2b2lkKQ0K
PiAgICAgIH0NCj4gIH0NCj4gDQo+ICtzdGF0aWMgaW50IHNldHVwX2h5cGVyY2FsbF9wY3B1X2Fy
Zyh2b2lkKQ0KPiArew0KPiArICAgIHZvaWQgKm1hcHBpbmc7DQo+ICsNCj4gKyAgICBpZiAoIHRo
aXNfY3B1KGh2X3BjcHVfaW5wdXRfcGFnZSkgKQ0KPiArICAgICAgICByZXR1cm4gMDsNCj4gKw0K
PiArICAgIG1hcHBpbmcgPSBhbGxvY194ZW5oZWFwX3BhZ2UoKTsNCj4gKyAgICBpZiAoICFtYXBw
aW5nICkNCj4gKyAgICB7DQo+ICsgICAgICAgIHByaW50aygiRmFpbGVkIHRvIGFsbG9jYXRlIGh5
cGVyY2FsbCBpbnB1dCBwYWdlIGZvciBDUFUldVxuIiwNCj4gKyAgICAgICAgICAgICAgIHNtcF9w
cm9jZXNzb3JfaWQoKSk7DQo+ICsgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiArICAgIH0NCj4g
Kw0KPiArICAgIHRoaXNfY3B1KGh2X3BjcHVfaW5wdXRfcGFnZSkgPSBtYXBwaW5nOw0KPiArDQo+
ICsgICAgcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cCh2
b2lkKQ0KPiAgew0KPiAgICAgIHNldHVwX2h5cGVyY2FsbF9wYWdlKCk7DQo+ICsgICAgaWYgKCBz
ZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcoKSApDQo+ICsgICAgICAgIHBhbmljKCJIeXBlcmNhbGwg
cGVyY3B1IGFyZyBzZXR1cCBmYWlsZWRcbiIpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IGFw
X3NldHVwKHZvaWQpDQo+ICt7DQo+ICsgICAgcmV0dXJuIHNldHVwX2h5cGVyY2FsbF9wY3B1X2Fy
ZygpOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgb3Bz
ID0gew0KPiAgICAgIC5uYW1lID0gIkh5cGVyLVYiLA0KPiAgICAgIC5zZXR1cCA9IHNldHVwLA0K
PiArICAgIC5hcF9zZXR1cCA9IGFwX3NldHVwLA0KPiAgfTsNCj4gDQo+ICBzdGF0aWMgdm9pZCBf
X21heWJlX3VudXNlZCBidWlsZF9hc3NlcnRpb25zKHZvaWQpDQo+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaA0KPiBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9o
eXBlcnYvcHJpdmF0ZS5oDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAw
MDAuLmEzMzkyNzQ5ODUNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vl
c3QvaHlwZXJ2L3ByaXZhdGUuaA0KPiBAQCAtMCwwICsxLDI5IEBADQo+ICsvKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqDQo+ICoqKioqKg0KPiArICogYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaA0KPiAr
ICoNCj4gKyAqIERlZmluaXRpb25zIC8gZGVjbGFyYXRpb25zIG9ubHkgdXNlZnVsIHRvIEh5cGVy
LVYgY29kZS4NCj4gKyAqDQo+ICsgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91
IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQ0KPiArICogaXQgdW5kZXIgdGhlIHRl
cm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkNCj4g
KyAqIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhl
IExpY2Vuc2UsIG9yDQo+ICsgKiAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLg0K
PiArICoNCj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0
IGl0IHdpbGwgYmUgdXNlZnVsLA0KPiArICogYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRo
b3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YNCj4gKyAqIE1FUkNIQU5UQUJJTElUWSBv
ciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUNCj4gKyAqIEdOVSBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuDQo+ICsgKg0KPiArICogWW91
IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UNCj4gKyAqIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBJZiBub3QsIHNlZSA8aHR0cDov
L3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uDQo+ICsgKg0KPiArICogQ29weXJpZ2h0IChjKSAyMDIw
IE1pY3Jvc29mdC4NCj4gKyAqLw0KPiArDQo+ICsjaWZuZGVmIF9fWEVOX0hZUEVSVl9QUklWSUFU
RV9IX18NCj4gKyNkZWZpbmUgX19YRU5fSFlQRVJWX1BSSVZJQVRFX0hfXw0KPiArDQo+ICsjaW5j
bHVkZSA8eGVuL3BlcmNwdS5oPg0KPiArDQo+ICtERUNMQVJFX1BFUl9DUFUodm9pZCAqLCBodl9w
Y3B1X2lucHV0X3BhZ2UpOw0KPiArDQo+ICsjZW5kaWYgLyogX19YRU5fSFlQRVJWX1BSSVZJQVRF
X0hfXyAgKi8NCj4gLS0NCj4gMi4yMC4xDQo+IA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiBY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
