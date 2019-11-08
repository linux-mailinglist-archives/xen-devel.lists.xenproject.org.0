Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D949F4BBC
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 13:36:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT3Rv-0007sx-Q2; Fri, 08 Nov 2019 12:33:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6MgQ=ZA=amazon.com=prvs=20800e630=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iT3Ru-0007ss-Hn
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 12:33:10 +0000
X-Inumbo-ID: eb310f73-0223-11ea-a1d5-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb310f73-0223-11ea-a1d5-12813bfff9fa;
 Fri, 08 Nov 2019 12:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1573216390; x=1604752390;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vc2FWudnxNFUY8qoPlMT90bHwA+BGZNALszH+/CNCLc=;
 b=A/0dg+vDv4qTbb59t3orsFcgOrpo3r2InVpHCUzPBeKPh1xvU3lF+f07
 KuUAM00wTn09/Etczj2VDFSwF/S8pw6pD+GjXMVSmSIDakjxtPA0FZ+mD
 HcRfjoW6dXkNTi0XfNsNqRfIuvgwKBupuAlMQSw9QekPJsAR+Lr9/ZdLU 8=;
IronPort-SDR: QN3z5ojwr09ufW7Wgz7aeiqUNlxyURwLpn4a12q7vaXsKDdMgw7MMVwKwoJXHUopBHm/zKhOVV
 8MD2WZG8SsRg==
X-IronPort-AV: E=Sophos;i="5.68,281,1569283200"; 
   d="scan'208";a="5536473"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-397e131e.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 08 Nov 2019 12:33:05 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-397e131e.us-west-2.amazon.com (Postfix) with ESMTPS
 id 75197A2923; Fri,  8 Nov 2019 12:33:04 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 8 Nov 2019 12:33:04 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 8 Nov 2019 12:33:03 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 8 Nov 2019 12:33:03 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] max_grant_frames/max_maptrack_frames
Thread-Index: AdWVkZiKYOkzy9UFQkGz/45sYHi0dwAl2OWAAAHNllA=
Date: Fri, 8 Nov 2019 12:33:02 +0000
Message-ID: <27b45462accc4ababbcbe5aa48ea670c@EX13D32EUC003.ant.amazon.com>
References: <f9e3fb8cadf44352851d865e850c6525@EX13D32EUC003.ant.amazon.com>
 <86d72e83-abf6-bef3-418f-49a69545fcb5@suse.com>
In-Reply-To: <86d72e83-abf6-bef3-418f-49a69545fcb5@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.7]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] max_grant_frames/max_maptrack_frames
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDA4IE5vdmVtYmVyIDIwMTkgMTE6MzgNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIG1heF9ncmFudF9mcmFtZXMv
bWF4X21hcHRyYWNrX2ZyYW1lcw0KPiANCj4gT24gMDguMTEuMjAxOSAwOTo0NSwgIER1cnJhbnQs
IFBhdWwgIHdyb3RlOg0KPiA+IFdoZW4gcGVyLWRvbWFpbiBvcHRpb25zIGZvciBtYXhpbXVtIGdy
YW50IGFuZCBtYXB0cmFjayBmcmFtZXMgY2FtZSBpbg0KPiAoaW4gNC4xMD8pIFhlbidzIGJlaGF2
aW91ciB3LnIudC4gdG8gdGhlIGdsb2JhbCBjb21tYW5kIGxpbmUgdmFsdWVzDQo+IChnbnR0YWJf
bWF4X2ZyYW1lcyBhbmQgZ250dGFiX21heF9tYXB0cmFja19mcmFtZXMgcmVzcGVjdGl2ZWx5KSBy
ZWdyZXNzZWQNCj4gPg0KPiA+IEZvciBleGFtcGxlLCBhIGhvc3QgcnVubmluZyBhIHByaW9yIHZl
cnNpb24gb2YgWGVuIHdpdGggYSBjb21tYW5kIGxpbmUNCj4gc2V0dGluZyBnbnR0YWJfbWF4X2Zy
YW1lcz0xMjggd291bGQgaGF2ZSBhbGwgb2YgaXRzIGRvbVVzIHJ1bm5pbmcgd2l0aCAxMjgNCj4g
ZnJhbWVzLiBIb3dldmVyLCBhZnRlciB1cGRhdGUgdG8gYSBuZXdlciBYZW4sIHRoZXkgd2lsbCBv
bmx5IGdldCAzMiBmcmFtZXMNCj4gKHVubGVzcyB0aGUgaG9zdCBpcyBwYXJ0aWN1bGFybHkgbGFy
Z2UsIGluIHdoaWNoIGNhc2UgdGhleSB3aWxsIGdldCA2NCkuDQo+IFdoeSBpcyB0aGlzPyBJdCdz
IGJlY2F1c2UgbmVpdGhlciB4bC5jZmcgZmlsZXMsIG5vciB4bC5jb25mLCB3aWxsIHNwZWNpZnkN
Cj4gdmFsdWVzIChiZWNhdXNlIHRoZSBzY2VuYXJpbyBpcyBhbiB1cGRhdGUgZnJvbSBhbiBvbGRl
ciBpbnN0YWxsYXRpb24pIGFuZA0KPiBzbyB0aGUgaGFyZGNvZGVkIDMyLzY0IGRlZmF1bHQgYXBw
bGllcy4gSGVuY2Ugc29tZSBkb21VcyB3aXRoIGxhcmdlDQo+IG51bWJlcnMgb2YgUFYgZGV2aWNl
cyBzdGFydCBmYWlsaW5nIChvciBhdCBsZWFzdCBzdWJzdGFudGlhbGx5IHNsb3cgZG93bikNCj4g
YW5kIGFkbWlucyBzdGFydCB3b25kZXJpbmcgd2hhdCdzIGdvaW5nIG9uLg0KPiA+DQo+ID4gU28g
aG93IGJlc3QgdG8gZml4IHRoaXM/DQo+ID4NCj4gPiBGb3IgdGhlIHNha2Ugb2YgYSBxdWljayBm
aXggZm9yIHRoZSByZWdyZXNzaW9uLCBhbmQgZWFzZSBvZiBiYWNrLQ0KPiBwb3J0aW5nLCBJIHRo
aW5rIGl0IHdvdWxkIGJlIGJlc3QgdG8gYWRkIGEgY2hlY2sgaW4gZG9tYWluX2NyZWF0ZSgpIGFu
ZA0KPiBjcmVhdGUgdGhlIGdyYW50IHRhYmxlIHdpdGggcGFyYW1ldGVycyB3aGljaCBhcmUgdGhl
IGxhcmdlciBvZiB0aGUNCj4gdG9vbHN0YWNrIGNvbmZpZ3VyZWQgdmFsdWUgYW5kIHRoZSBjb3Jy
ZXNwb25kaW5nIGNvbW1hbmQgbGluZSB2YWx1ZS4NCj4gDQo+IEhvdyBhYm91dCBwZW9wbGUgc2lt
cGx5IHNldHRpbmcgdGhlIHZhbHVlIGluIHhsLmNvbmYsIGlmIGluZGVlZCBpbiBjYW4gYmUNCj4g
c2V0IHRoZXJlPw0KDQpJdCBjb3VsZCBiZSBzZXQgdGhlcmUsIGJ1dCB0aGF0J3MgcmVhbGx5IG5v
dCB0aGUgcmlnaHQgc29sdXRpb24uIEEgc2V0IG9mIGNvbW1hbmQgbGluZSBwYXJhbWV0ZXJzIHRo
YXQgYXBwcm9wcmlhdGVseSBjb25maWd1cmVkIHRoZSBob3N0IG9uIGFuIG9sZGVyIFhlbiByZWFs
bHkgb3VnaHQgdG8gY29udGludWUgdG8gZG8gdGhlIHNhbWUgYWZ0ZXIgaW5zdGFsbGF0aW9uIG9m
IHRoZSBuZXdlciBYZW4sIHdpdGhvdXQgYW55IGFkZGl0aW9uYWwgY29uZmlnIHJlcXVpcmVtZW50
cy4NCg0KPiANCj4gPiBUaGlzIGRvZXMsIGhvd2V2ZXIsIGdvIGFnYWluc3QgdGhlIHJlY2VudCBk
aXJlY3Rpb24gb2YgdGhlIHRvb2xzdGFjaw0KPiBnZXR0aW5nIGV4YWN0bHkgd2hhdCBpdCBhc2tl
ZCBmb3IuIFNvIGZvciB0aGUgbG9uZ2VyIHRlcm0gSSBhbSB3b25kZXJpbmcNCj4gd2hldGhlciB0
aGVyZSBvdWdodCB0byBiZSBhIHdheSBmb3IgdGhlIHRvb2xzdGFjayB0byBxdWVyeSB0aGUgZ2xv
YmFsbHkNCj4gY29uZmlndXJlZCBncmFudCB0YWJsZSBsaW1pdHMuIEEgR05UVEFCT1Agc2VlbXMg
dGhlIHdyb25nIGNhbmRpZGF0ZSBmb3INCj4gdGhpcywgc2luY2UgR05UVEFCT1BzIGFyZSBwZXIt
ZG9tYWluLCBzbyBJJ20gd29uZGVyaW5nIGFib3V0IGEgbmV3IHN5c2N0bA0KPiB0byByZXR1cm4g
dGhlIHZhbHVlIG9mIGEgbmFtZWQgY29tbWFuZCBsaW5lIHBhcmFtZXRlci4NCj4gDQo+IFN1Y2gg
YSBzZXJpZXMgd2FzIGFscmVhZHkgcG9zdGVkIChhbmQgZXZlbiBoYWQgc29tZSByZXZpZXcsIHNv
IGl0J3MNCj4gYWxyZWFkeSBhdCB2NCwgYnV0IGlpcmMgbm8gdXBkYXRlIGhhcyBiZWVuIHByb3Zp
ZGVkIHNpbmNlIE1heSk6DQo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMv
aHRtbC94ZW4tZGV2ZWwvMjAxOS0wNS9tc2cwMjIwNi5odG1sDQoNCk9rLCBJJ2xsIHRha2UgYSBs
b29rLiBUaGFua3MsDQoNCiAgUGF1bA0KDQo+IA0KPiBKYW4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
