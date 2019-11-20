Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E1E103898
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 12:21:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXO08-0000Ss-Sh; Wed, 20 Nov 2019 11:18:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rUCm=ZM=amazon.com=prvs=220eb40af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iXO07-0000Sn-CI
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 11:18:23 +0000
X-Inumbo-ID: 76aec5a0-0b87-11ea-a310-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76aec5a0-0b87-11ea-a310-12813bfff9fa;
 Wed, 20 Nov 2019 11:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574248703; x=1605784703;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PqbxykbWueRU5J5lneUK2Y5emBxaMq+R2YcsKmRuqTk=;
 b=Vjp5DlVKju9ZCJpMNQLIJF1AWAqeesv2dfzLf2sCOX8cl7nn4XBHLBMN
 eSUD9ICoCrTchygpyMdgEjUN+3/WX36EJUn6ZFymXhOWY1oWJQvDRcUx+
 qOPIp59pKnsgASYtI60EdUAtFLEaQuktn0UOBjZjJOVn+IyeX9fsqhKyq c=;
IronPort-SDR: eJNnfWf24kQkFxvpXXFUdfzFxU6hx5uLOJ9TLH53gD8Hyr92B2i4wjLxg692l4abx5FG3k11LK
 JLNczM2zPwRg==
X-IronPort-AV: E=Sophos;i="5.69,221,1571702400"; 
   d="scan'208";a="5424109"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 20 Nov 2019 11:18:23 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9D4C1A2773; Wed, 20 Nov 2019 11:18:21 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 20 Nov 2019 11:18:21 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 20 Nov 2019 11:18:20 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 20 Nov 2019 11:18:19 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] grant table size
Thread-Index: AdWfhQwGXUKIxbF7Q62ckygVPo3ZWwABR/+AAAFd68AAAM6kAAAACm4A
Date: Wed, 20 Nov 2019 11:18:19 +0000
Message-ID: <a78709323d7b429c97cdeb652375d601@EX13D32EUC003.ant.amazon.com>
References: <08f386b1d300432384c27ba9a97be697@EX13D32EUC003.ant.amazon.com>
 <20191120100627.GP72134@Air-de-Roger>
 <c823656633fc4cde9fb232809c31c8a2@EX13D32EUC003.ant.amazon.com>
 <a821dd08-3afb-350d-dded-26b7e07df4b1@suse.com>
In-Reply-To: <a821dd08-3afb-350d-dded-26b7e07df4b1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.128]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] grant table size
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
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDIwIE5vdmVtYmVyIDIwMTkgMTI6MDkNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IENjOiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBT
dWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gZ3JhbnQgdGFibGUgc2l6ZQ0KPiANCj4gT24gMjAuMTEu
MjAxOSAxMTo0OSwgIER1cnJhbnQsIFBhdWwgIHdyb3RlOg0KPiA+PiBGcm9tOiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gPj4gU2VudDogMjAgTm92ZW1iZXIgMjAx
OSAxMTowNg0KPiA+Pg0KPiA+PiBEbyB5b3UgaGF2ZSBpbiBtaW5kIHRvIHNpZ25hbCB0aGlzIHNv
bWVob3cgdG8gZ3Vlc3RzLCBvciB0aGUNCj4gPj4gZXhwZWN0YXRpb24gaXMgdGhhdCB0aGUgZ3Vl
c3Qgd2lsbCBoYXZlIHRvIHBvbGwgR05UVEFCT1BfcXVlcnlfc2l6ZQ0KPiA+PiBhbmQgYXQgc29t
ZSBwb2ludCB0aGUgc2l6ZSB3aWxsIGluY3JlYXNlPw0KPiA+DQo+ID4gSSBkb24ndCB0aGluayB0
aGUgZ3Vlc3QgbmVlZCBjYXJlIHVudGlsIGl0cyBncmFudCB0YWJsZSBncm93cyB0byB0aGUNCj4g
PiBtYXguIEF0IHRoYXQgcG9pbnQsIHJhdGhlciB0aGFuIGdpdmluZyB1cCwgdGhlIGd1ZXN0IHdv
dWxkIHJlLXF1ZXJ5DQo+ID4gdGhlIG1heCB2YWx1ZSB0byBzZWUgaWYgdGhlcmUgaXMgbm93IG1v
cmUgaGVhZHJvb20gYW5kIHRoZW4gcmUtc2l6ZQ0KPiA+IGl0cyBpbnRlcm5hbCBkYXRhIHN0cnVj
dHVyZXMgYWNjb3JkaW5nbHkuDQo+IA0KPiBJZiB3ZSBjb25zaWRlciBkeW5hbWljIGFkanVzdG1l
bnRzLCB3aGF0IGFib3V0IHNocmlua2luZyBvZiB0aGUNCj4gdGFibGU/IFRoaXMgd291bGQgb2Yg
Y291cnNlIHJlcXVpcmUgc29tZSBmb3JtIG9mIGd1ZXN0IGNvbnNlbnQsDQo+IGJ1dCBpdCB3b3Vs
ZCBiZSBuaWNlIGlmIHRoZSBvcHRpb24gd291bGQgYXQgbGVhc3QgYmUgYWNjb3VudGVkDQo+IGZv
ciB3aGVuIHdvcmtpbmcgb3V0IGhvdyBhbGwgb2YgdGhpcyBzaG91bGQgYmVoYXZlLCBldmVuIGlm
IHRoZQ0KPiBjYXNlIG1heSBub3QgZ2V0IGhhbmRsZWQgcmlnaHQgbm93Lg0KPiANCg0KV2VsbCwg
cGVyaGFwcyB3ZSBjb3VsZCBoYXZlIGEgc2V0X3NpemUgZ250dGFiIG9wIHdoZXJlIGEgZ3Vlc3Qg
d291bGQgYmUgYWxsb3dlZCB0byBjYWxsIGl0IHdpdGggYSB2YWx1ZSBsZXNzIHRoYW4gKG9yIGVx
dWFsIHRvKSBpdHMgY3VycmVudCBtYXgsIHNvIHRoYXQgaXQgY2FuIHZvbHVudGFyaWx5IHlpZWxk
IGl0cyBoZWFkcm9vbSwgYnV0IG9ubHkgYSBwcml2aWxlZ2VkIGd1ZXN0IHdvdWxkIGJlIGFsbG93
ZWQgdG8gY2FsbCBpdCB3aXRoIGFuIGluY3JlYXNlZCBtYXggdmFsdWU/DQpJJ20gbm90IHN1cmUg
d2hhdCBtZWNoYW5pc20gd291bGQgYmUgYmVzdCBmb3IgcmVxdWVzdGluZyBhIGd1ZXN0IHJlZHVj
dGlvbiB0aG91Z2gsIEkgZ3Vlc3MgcHJvYmFibHkgeGVuc3RvcmUuLi4gc29tZXRoaW5nIGFraW4g
dG8gYmFsbG9vbiB0YXJnZXQgcGFnZXM/DQoNCkEgZ3Vlc3QgcmVkdWN0aW9uIG9mIG1heCBpcyBv
ZiBwcmV0dHkgbGltaXRlZCB2YWx1ZSB0aG91Z2ggQUZBSUNUIGFzIG9ubHkgaW4tdXNlIGZyYW1l
cyByZWFsbHkgdXNlIGFueSBtZW1vcnkuIFRoZSAoYWN0aXZlL3NoYXJlZC9zdGF0dXMpIGFycmF5
cyBjb3VsZCwgb2YgY291cnNlLCBiZSByZWR1Y2VkIGluIHNpemUgYnV0IHRoYXQgb25seSBnZXRz
IHlvdSBhIGZldyBieXRlcyBiYWNrLg0KDQogIFBhdWwNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
