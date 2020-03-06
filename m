Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A9C17BC65
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 13:11:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jABlj-0002kp-KD; Fri, 06 Mar 2020 12:07:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FvQx=4X=amazon.co.uk=prvs=32702b987=pdurrant@srs-us1.protection.inumbo.net>)
 id 1jABlh-0002kk-O8
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 12:07:53 +0000
X-Inumbo-ID: 1a40b83d-5fa3-11ea-a7ba-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a40b83d-5fa3-11ea-a7ba-12813bfff9fa;
 Fri, 06 Mar 2020 12:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583496473; x=1615032473;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AGi+P55zulT9+2a8qmJlAdx/W7swD0rNA7EgnNuoz14=;
 b=JT2EpTbjkJXwmNgjisDjlGGAIQRRNjKeFgaSxGq7TUX4KQ20oyXwCKrl
 7BnE4RUqQOzukgpORncfNPdweIJdQNmF+BMaHUDSxbA8Qt1MAOGOA4UlF
 yHZe1tSqdY+y6PiNCAtM7ag0ZdG8/HvQlpKthFMMlUYzj9Nvwnf5Xdakh A=;
IronPort-SDR: 5dcudmNpkIhDYbtIwa42rH4SRdwPxB3LQl0c9ETG+BbyqOY/2xw5mkcbTMDjCMmrPu9QIdrcDB
 LHo2K25fdpKQ==
X-IronPort-AV: E=Sophos;i="5.70,522,1574121600"; d="scan'208";a="20351101"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 06 Mar 2020 12:07:40 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id B9822C59D5; Fri,  6 Mar 2020 12:07:39 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 6 Mar 2020 12:07:39 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 6 Mar 2020 12:07:38 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 6 Mar 2020 12:07:38 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, "pdurrant@amzn.com" <pdurrant@amzn.com>
Thread-Topic: [PATCH v3 2/6] x86 / p2m: remove page_list check in
 p2m_alloc_table
Thread-Index: AQHV86zPcz0SNzMCl02V4cFdHsApB6g7dx1A
Date: Fri, 6 Mar 2020 12:07:38 +0000
Message-ID: <a135e3321e9941a9b25055e858fc5313@EX13D32EUC003.ant.amazon.com>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-3-pdurrant@amzn.com>
 <5c8e1d01-74e8-ed77-5900-9419c010b407@suse.com>
In-Reply-To: <5c8e1d01-74e8-ed77-5900-9419c010b407@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.82]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 2/6] x86 / p2m: remove page_list check in
 p2m_alloc_table
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDA2IE1hcmNoIDIwMjAgMTE6NDYNCj4gVG86IHBkdXJyYW50
QGFtem4uY29tDQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IER1cnJhbnQs
IFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5j
b20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1DQo+IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMi82XSB4ODYgLyBwMm06IHJl
bW92ZSBwYWdlX2xpc3QgY2hlY2sgaW4gcDJtX2FsbG9jX3RhYmxlDQo+IA0KPiBPbiAwNS4wMy4y
MDIwIDEzOjQ1LCBwZHVycmFudEBhbXpuLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBQYXVsIER1cnJh
bnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+ID4NCj4gPiBUaGVyZSBkb2VzIG5vdCBzZWVtIHRv
IGJlIGFueSBqdXN0aWZpY2F0aW9uIGZvciByZWZ1c2luZyB0byBjcmVhdGUgdGhlDQo+ID4gZG9t
YWluJ3MgcDJtIHRhYmxlIHNpbXBseSBiZWNhdXNlIGl0IG1heSBoYXZlIGFzc2lnbmVkIHBhZ2Vz
Lg0KPiANCj4gSSB0aGluayB0aGVyZSBpczogSWYgYW55IHN1Y2ggYWxsb2NhdGlvbiBoYWQgaGFw
cGVuZWQgYmVmb3JlLCBob3cNCj4gd291bGQgaXQgYmUgcmVwcmVzZW50ZWQgaW4gdGhlIGRvbWFp
bidzIHAybT8NCg0KSW5zZXJ0aW9uIGludG8gdGhlIHAybSBpcyBhIHNlcGFyYXRlIGFjdGlvbiBm
cm9tIHBhZ2UgYWxsb2NhdGlvbi4gV2h5IHNob3VsZCB0aGV5IGJlIGxpbmtlZD8NCg0KPiANCj4g
PiBQYXJ0aWN1bGFybHkNCj4gPiBpdCBwcmV2ZW50cyB0aGUgcHJpb3IgYWxsb2NhdGlvbiBvZiBQ
R0NfZXh0cmEgcGFnZXMuDQo+IA0KPiBUaGF0J3MgdW5mb3J0dW5hdGUsIGJ1dCB3aWxsIG5lZWQg
dGFraW5nIGNhcmUgb2YgZGlmZmVyZW50bHkgdGhlbjoNCj4gDQo+ID4gLS0tIGEveGVuL2FyY2gv
eDg2L21tL3AybS5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jDQo+ID4gQEAgLTY5
NSwxNCArNjk1LDYgQEAgaW50IHAybV9hbGxvY190YWJsZShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJt
KQ0KPiA+DQo+ID4gICAgICBwMm1fbG9jayhwMm0pOw0KPiA+DQo+ID4gLSAgICBpZiAoIHAybV9p
c19ob3N0cDJtKHAybSkNCj4gPiAtICAgICAgICAgJiYgIXBhZ2VfbGlzdF9lbXB0eSgmZC0+cGFn
ZV9saXN0KSApDQo+ID4gLSAgICB7DQo+ID4gLSAgICAgICAgUDJNX0VSUk9SKCJkb20gJWQgYWxy
ZWFkeSBoYXMgbWVtb3J5IGFsbG9jYXRlZFxuIiwgZC0+ZG9tYWluX2lkKTsNCj4gPiAtICAgICAg
ICBwMm1fdW5sb2NrKHAybSk7DQo+ID4gLSAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gLSAg
ICB9DQo+IA0KPiBJbnN0ZWFkIG9mIGNoZWNraW5nIHRoZSBsaXN0IHRvIGJlIGVtcHR5LCBob3cg
YWJvdXQgY2hlY2tpbmcNCj4gZG9tYWluX3RvdF9wYWdlcygpIHRvIHJldHVybiB6ZXJvPw0KDQpJ
IGNvdWxkIGRvIHRoYXQsIGFuZCBpbiBmYWN0IG15IG9yaWdpbmFsIGNvZGUgZGlkLCBidXQgd2l0
aCBtb3JlIGNvbnNpZGVyYXRpb24gdGhlIHdob2xlIHRlc3QganVzdCBkaWRuJ3QgbWFrZSBzZW5z
ZSB0byBtZS4gWWVzLCBjbGVhcmx5IHRoZSBwMm0gaGFzIHRvIGJlIHRoZXJlIGJlZm9yZSBwYWdl
cyBjYW4gYmUgYWRkZWQgaW50byBpdCwgYnV0IEkgY2FuJ3Qgc2VlIGFueSByZWFzb24gd2h5IHlv
dSBjb3VsZG4ndCBldmVuIGFsbG9jYXRlIHRoZSBlbnRpcmUgZ3Vlc3QgUkFNLCB0aGVuIGNyZWF0
ZSB0aGUgcDJtIGFuZCB0aGVuIGFkZCB0aGUgcGFnZXMgaW50byBpdC4NCg0KICBQYXVsDQoNCj4g
DQo+IEphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
