Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FEE167DC6
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 13:55:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j57n7-0006M1-SH; Fri, 21 Feb 2020 12:52:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TqQj=4J=amazon.com=prvs=31305ddda=hongyxia@srs-us1.protection.inumbo.net>)
 id 1j57n6-0006Lw-7N
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 12:52:24 +0000
X-Inumbo-ID: 00cade4e-54a9-11ea-864d-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00cade4e-54a9-11ea-864d-12813bfff9fa;
 Fri, 21 Feb 2020 12:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582289543; x=1613825543;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fGIb9XFARaCunaTYMfXwZhwdV35k8pA35YTgfu24btk=;
 b=Ij5YtmVNtSG3a8XgYcO1l9qzYLe+yWOcyzMQcHwgaF7F2uop0/TiNOkE
 9HLw7LMEze8+6JKwHfVrZz9H/JGHUodWyp5rABISp2HbDwEe+TWEgePBm
 oftaYWQg3W+2LfyplNXOoGh5WQHhn9kQWEUxlMbHwdo+zOAQli4t6bgxb E=;
IronPort-SDR: tnIU+u9EuvyKrYT0+0f9xIle0C/34azKHRsGoV3+G9ODNKSNDKKlGDBguQeIVKS3/c3RZ6DUNM
 kEeYB4Yd26bg==
X-IronPort-AV: E=Sophos;i="5.70,468,1574121600"; d="scan'208";a="19039912"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 21 Feb 2020 12:52:11 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id DED66A2348; Fri, 21 Feb 2020 12:52:09 +0000 (UTC)
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 21 Feb 2020 12:52:09 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA003.ant.amazon.com (10.43.165.7) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 21 Feb 2020 12:52:08 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Fri, 21 Feb 2020 12:52:08 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "wl@xen.org" <wl@xen.org>
Thread-Topic: [PATCH v2] x86/domain_page: implement pure per-vCPU mapping
 infrastructure
Thread-Index: AQHV3R91Y+G0jACGEk2zD96+LQsgPqgln+yAgAARR4A=
Date: Fri, 21 Feb 2020 12:52:07 +0000
Message-ID: <2326943257e6f04bc9a858ef5667295651395c85.camel@amazon.com>
References: <4058e92ce21627731c49b588a95809dc0affd83a.1581015491.git.hongyxia@amazon.com>
 <20200221115017.tuo2i5db5mhd5yyt@debian>
In-Reply-To: <20200221115017.tuo2i5db5mhd5yyt@debian>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.226]
Content-ID: <B7ADFCBC6668D14298A7294DDDBA7DD0@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] x86/domain_page: implement pure per-vCPU
 mapping infrastructure
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Grall,
 Julien" <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMDIwLTAyLTIxIGF0IDExOjUwICswMDAwLCBXZWkgTGl1IHdyb3RlOg0KPiBPbiBU
aHUsIEZlYiAwNiwgMjAyMCBhdCAwNjo1ODoyM1BNICswMDAwLCBIb25neWFuIFhpYSB3cm90ZToN
Cj4gPiAuLi4NCj4gPiANCj4gPiBCZW5jaG1hcmtzDQo+ID4gKGJhc2VsaW5lIHVzZXMgZGlyZWN0
IG1hcCBpbnN0ZWFkIG9mIHRoZSBtYXBjYWNoZSBpbg0KPiA+IG1hcF9kb21haW5fcGFnZSwNCj4g
PiBvbGQgaXMgdGhlIGV4aXN0aW5nIG1hcGNhY2hlIGFuZCBuZXcgaXMgYWZ0ZXIgdGhpcyBwYXRj
aCk6DQo+ID4gDQo+ID4gR2Vla2JlbmNoIG9uIGEgMzItdkNQVSBndWVzdCwNCj4gPiANCj4gPiBw
ZXJmb3JtYW5jZSBkcm9wICAgICBvbGQgICAgICAgIG5ldw0KPiA+IHNpbmdsZSBjb3JlICAgICAg
ICAgMC4wNCUgICAgICAwLjE4JQ0KPiANCj4gRG8geW91IGtub3cgd2h5IHRoZSBuZXcgbWFwY2Fj
aGUgaGFzIG1vcmUgb3ZlcmhlYWQgdGhhbiB0aGUgb2xkIG9uZQ0KPiBpbg0KPiB0aGUgc2luZ2xl
IGNvcmUgY2FzZT8NCg0KVG8gYmUgaG9uZXN0IEkgdGhpbmsgdGhpcyBpcyB3aXRoaW4gbm9pc2Ug
dGVycml0b3J5LiBUaGUgYmVuY2htYXJrcw0Kd2VyZSBydW4gNSB0aW1lcywgSSBjYW4gYXZlcmFn
ZSBvdmVyIGV2ZW4gbW9yZSBydW5zIHRvIGNvbmZpcm0uDQoNCj4gWy4uLl0NCj4gDQo+ID4gIHZv
aWQgdW5tYXBfZG9tYWluX3BhZ2UoY29uc3Qgdm9pZCAqcHRyKQ0KPiA+ICB7DQo+ID4gLSAgICB1
bnNpZ25lZCBpbnQgaWR4Ow0KPiA+ICsgICAgdW5zaWduZWQgaW50IGlkeCwgZ2xiX2lkeDsNCj4g
PiAgICAgIHN0cnVjdCB2Y3B1ICp2Ow0KPiA+IC0gICAgc3RydWN0IG1hcGNhY2hlX2RvbWFpbiAq
ZGNhY2hlOw0KPiA+IC0gICAgdW5zaWduZWQgbG9uZyB2YSA9ICh1bnNpZ25lZCBsb25nKXB0ciwg
bWZuLCBmbGFnczsNCj4gPiAtICAgIHN0cnVjdCB2Y3B1X21hcGhhc2hfZW50cnkgKmhhc2hlbnQ7
DQo+ID4gKyAgICBzdHJ1Y3QgbWFwY2FjaGVfdmNwdSAqdmNhY2hlOw0KPiA+ICsgICAgdW5zaWdu
ZWQgbG9uZyB2YSA9ICh1bnNpZ25lZCBsb25nKXB0ciwgbWZuLCBoYXNobWZuLCBmbGFnczsNCj4g
PiAgDQo+ID4gICAgICBpZiAoIHZhID49IERJUkVDVE1BUF9WSVJUX1NUQVJUICkNCj4gPiAgICAg
ICAgICByZXR1cm47DQo+ID4gQEAgLTE4OSwxMTQgKzE0NCw3OCBAQCB2b2lkIHVubWFwX2RvbWFp
bl9wYWdlKGNvbnN0IHZvaWQgKnB0cikNCj4gPiAgICAgIHYgPSBtYXBjYWNoZV9jdXJyZW50X3Zj
cHUoKTsNCj4gPiAgICAgIEFTU0VSVCh2ICYmIGlzX3B2X3ZjcHUodikpOw0KPiA+ICANCj4gPiAt
ICAgIGRjYWNoZSA9ICZ2LT5kb21haW4tPmFyY2gucHYubWFwY2FjaGU7DQo+ID4gLSAgICBBU1NF
UlQoZGNhY2hlLT5pbnVzZSk7DQo+ID4gKyAgICB2Y2FjaGUgPSB2LT5hcmNoLnB2Lm1hcGNhY2hl
Ow0KPiA+ICsgICAgQVNTRVJUKHZjYWNoZSk7DQo+ID4gIA0KPiA+IC0gICAgaWR4ID0gUEZOX0RP
V04odmEgLSBNQVBDQUNIRV9WSVJUX1NUQVJUKTsNCj4gPiAtICAgIG1mbiA9IGwxZV9nZXRfcGZu
KE1BUENBQ0hFX0wxRU5UKGlkeCkpOw0KPiA+IC0gICAgaGFzaGVudCA9ICZ2LT5hcmNoLnB2Lm1h
cGNhY2hlLmhhc2hbTUFQSEFTSF9IQVNIRk4obWZuKV07DQo+IA0KPiBQbGVhc2UgYWxzbyBhc3Nl
cnQgdGhlIHZhIGluIHF1ZXN0aW9uIGlzIHdpdGhpbiB0aGUgcmFuZ2UgYWxsb2NhdGVkDQo+IHRv
DQo+IHRoaXMgdmNwdS4NCg0KU3VyZS4NCg0KPiA+ICsgICAgZ2xiX2lkeCA9IFBGTl9ET1dOKHZh
IC0gTUFQQ0FDSEVfVklSVF9TVEFSVCk7DQo+ID4gKyAgICBpZHggPSBnbGJfaWR4IC0gdi0+dmNw
dV9pZCAqIE1BUENBQ0hFX1ZDUFVfRU5UUklFUzsNCj4gPiAgDQo+ID4gICAgICBsb2NhbF9pcnFf
c2F2ZShmbGFncyk7DQo+ID4gIA0KPiA+IC0gICAgaWYgKCBoYXNoZW50LT5pZHggPT0gaWR4ICkN
Cj4gPiAtICAgIHsNCj4gPiAtICAgICAgICBBU1NFUlQoaGFzaGVudC0+bWZuID09IG1mbik7DQo+
ID4gLSAgICAgICAgQVNTRVJUKGhhc2hlbnQtPnJlZmNudCk7DQo+ID4gLSAgICAgICAgaGFzaGVu
dC0+cmVmY250LS07DQo+ID4gLSAgICB9DQo+ID4gLSAgICBlbHNlIGlmICggIWhhc2hlbnQtPnJl
ZmNudCApDQo+ID4gLSAgICB7DQo+ID4gLSAgICAgICAgaWYgKCBoYXNoZW50LT5pZHggIT0gTUFQ
SEFTSEVOVF9OT1RJTlVTRSApDQo+ID4gLSAgICAgICAgew0KPiA+IC0gICAgICAgICAgICAvKiAv
Rmlyc3QvLCB6YXAgdGhlIFBURS4gKi8NCj4gPiAtICAgICAgICAgICAgQVNTRVJUKGwxZV9nZXRf
cGZuKE1BUENBQ0hFX0wxRU5UKGhhc2hlbnQtPmlkeCkpID09DQo+ID4gLSAgICAgICAgICAgICAg
ICAgICBoYXNoZW50LT5tZm4pOw0KPiA+IC0gICAgICAgICAgICBsMWVfd3JpdGUoJk1BUENBQ0hF
X0wxRU5UKGhhc2hlbnQtPmlkeCksIGwxZV9lbXB0eSgpKTsNCj4gPiAtICAgICAgICAgICAgLyog
L1NlY29uZC8sIG1hcmsgYXMgZ2FyYmFnZS4gKi8NCj4gPiAtICAgICAgICAgICAgc2V0X2JpdCho
YXNoZW50LT5pZHgsIGRjYWNoZS0+Z2FyYmFnZSk7DQo+ID4gLSAgICAgICAgfQ0KPiA+IC0NCj4g
PiAtICAgICAgICAvKiBBZGQgbmV3bHktZnJlZWQgbWFwcGluZyB0byB0aGUgbWFwaGFzaC4gKi8N
Cj4gPiAtICAgICAgICBoYXNoZW50LT5tZm4gPSBtZm47DQo+ID4gLSAgICAgICAgaGFzaGVudC0+
aWR4ID0gaWR4Ow0KPiA+IC0gICAgfQ0KPiA+IC0gICAgZWxzZQ0KPiA+IC0gICAgew0KPiA+IC0g
ICAgICAgIC8qIC9GaXJzdC8sIHphcCB0aGUgUFRFLiAqLw0KPiA+IC0gICAgICAgIGwxZV93cml0
ZSgmTUFQQ0FDSEVfTDFFTlQoaWR4KSwgbDFlX2VtcHR5KCkpOw0KPiA+IC0gICAgICAgIC8qIC9T
ZWNvbmQvLCBtYXJrIGFzIGdhcmJhZ2UuICovDQo+ID4gLSAgICAgICAgc2V0X2JpdChpZHgsIGRj
YWNoZS0+Z2FyYmFnZSk7DQo+ID4gLSAgICB9DQo+ID4gKyAgICBtZm4gPSBsMWVfZ2V0X3BmbihN
QVBDQUNIRV9MMUVOVChnbGJfaWR4KSk7DQo+ID4gKyAgICBoYXNobWZuID0gdmNhY2hlLT5oYXNo
X21mbltNQVBIQVNIX0hBU0hGTihtZm4pXTsNCj4gPiArDQo+ID4gKyAgICB2Y2FjaGUtPnJlZmNu
dFtpZHhdLS07DQo+ID4gKyAgICAvKiBJZiByZWZjbnQgZHJvcHMgdG8gMCwgd2Ugb25seSBjbGVh
ciBpbnVzZSB3aGVuIGl0J3Mgbm90IGluDQo+ID4gdGhlIG1hcGhhc2guICovDQo+IA0KPiBJdCB3
b3VsZCBiZSBjbGVhcmVyIHRvICJ3aGVuIGl0IGhhcyBiZWVuIGV2aWN0ZWQgZnJvbSBtYXBoYXNo
IiB0bw0KPiBtYXRjaA0KPiB0aGUgdGVybWlub2xvZ3kgaW4gdGhlIG1hcCByb3V0aW5lLg0KDQpX
aWxsIHJld29yZCBpbiBuZXh0IHJldmlzaW9uLg0KDQo+ID4gKyAgICBpZiAoIGhhc2htZm4gIT0g
bWZuICYmICF2Y2FjaGUtPnJlZmNudFtpZHhdICkNCj4gPiArICAgICAgICBfX2NsZWFyX2JpdChp
ZHgsIHZjYWNoZS0+aW51c2UpOw0KPiANCj4gQWxzbywgcGxlYXNlIGZsdXNoIHRoZSBsaW5lYXIg
YWRkcmVzcyBoZXJlIGFuZCB0aGUgb3RoZXIgX19jbGVhcl9iaXQNCj4gbG9jYXRpb24uDQoNCkkg
Zmx1c2ggd2hlbiBhIG5ldyBlbnRyeSBpcyB0YWtpbmcgYSBzbG90LiBZZWFoLCBpdCdzIHByb2Jh
Ymx5IGJldHRlcg0KdG8gZmx1c2ggZWFybGllciB3aGVuZXZlciBhIHNsb3QgaXMgbm8gbG9uZ2Vy
IGluIHVzZS4NCg0KPiA+ICANCj4gPiAgICAgIGxvY2FsX2lycV9yZXN0b3JlKGZsYWdzKTsNCj4g
PiAgfQ0KPiA+ICANCj4gPiAtaW50IG1hcGNhY2hlX2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4g
KmQpDQo+ID4gK2ludCBtYXBjYWNoZV92Y3B1X2luaXQoc3RydWN0IHZjcHUgKnYpDQo+ID4gIHsN
Cj4gPiArICAgIHN0cnVjdCBkb21haW4gKmQgPSB2LT5kb21haW47DQo+ID4gICAgICBzdHJ1Y3Qg
bWFwY2FjaGVfZG9tYWluICpkY2FjaGUgPSAmZC0+YXJjaC5wdi5tYXBjYWNoZTsNCj4gPiAtICAg
IHVuc2lnbmVkIGludCBiaXRtYXBfcGFnZXM7DQo+ID4gLQ0KPiA+IC0gICAgQVNTRVJUKGlzX3B2
X2RvbWFpbihkKSk7DQo+ID4gKyAgICB1bnNpZ25lZCBsb25nIGk7DQo+IA0KPiBTaW5jZSB5b3Un
cmUgY2hhbmdpbmcgdGhpcyBhbnl3YXkgLS0gd2Ugbm9ybWFsbHkgdXNlIHVuc2lnbmVkIGludCBh
cw0KPiBpbmRleCB0eXBlLg0KPiANCj4gPiArICAgIHVuc2lnbmVkIGludCBlbnRzID0gZC0+bWF4
X3ZjcHVzICogTUFQQ0FDSEVfVkNQVV9FTlRSSUVTOw0KPiA+ICANCj4gPiAgI2lmZGVmIE5ERUJV
Rw0KPiA+ICAgICAgaWYgKCAhbWVtX2hvdHBsdWcgJiYgbWF4X3BhZ2UgPD0NCj4gPiBQRk5fRE9X
TihfX3BhKEhZUEVSVklTT1JfVklSVF9FTkQgLSAxKSkgKQ0KPiA+ICAgICAgICAgIHJldHVybiAw
Ow0KPiA+ICAjZW5kaWYNCj4gPiAgDQo+ID4gLSAgICBCVUlMRF9CVUdfT04oTUFQQ0FDSEVfVklS
VF9FTkQgKyBQQUdFX1NJWkUgKiAoMyArDQo+ID4gLSAgICAgICAgICAgICAgICAgMiAqIFBGTl9V
UChCSVRTX1RPX0xPTkdTKE1BUENBQ0hFX0VOVFJJRVMpICoNCj4gPiBzaXplb2YobG9uZykpKSA+
DQo+ID4gLSAgICAgICAgICAgICAgICAgTUFQQ0FDSEVfVklSVF9TVEFSVCArIChQRVJET01BSU5f
U0xPVF9NQllURVMgPDwNCj4gPiAyMCkpOw0KPiA+IC0gICAgYml0bWFwX3BhZ2VzID0gUEZOX1VQ
KEJJVFNfVE9fTE9OR1MoTUFQQ0FDSEVfRU5UUklFUykgKg0KPiA+IHNpemVvZihsb25nKSk7DQo+
ID4gLSAgICBkY2FjaGUtPmludXNlID0gKHZvaWQgKilNQVBDQUNIRV9WSVJUX0VORCArIFBBR0Vf
U0laRTsNCj4gPiAtICAgIGRjYWNoZS0+Z2FyYmFnZSA9IGRjYWNoZS0+aW51c2UgKw0KPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgKGJpdG1hcF9wYWdlcyArIDEpICogUEFHRV9TSVpFIC8NCj4g
PiBzaXplb2YobG9uZyk7DQo+ID4gLQ0KPiA+IC0gICAgc3Bpbl9sb2NrX2luaXQoJmRjYWNoZS0+
bG9jayk7DQo+ID4gLQ0KPiA+IC0gICAgcmV0dXJuIGNyZWF0ZV9wZXJkb21haW5fbWFwcGluZyhk
LCAodW5zaWduZWQgbG9uZylkY2FjaGUtDQo+ID4gPmludXNlLA0KPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAyICogYml0bWFwX3BhZ2VzICsgMSwNCj4gPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTklMKGwxX3BnZW50cnlfdCAqKSwgTlVMTCk7
DQo+ID4gLX0NCj4gPiAtDQo+ID4gLWludCBtYXBjYWNoZV92Y3B1X2luaXQoc3RydWN0IHZjcHUg
KnYpDQo+ID4gLXsNCj4gPiAtICAgIHN0cnVjdCBkb21haW4gKmQgPSB2LT5kb21haW47DQo+ID4g
LSAgICBzdHJ1Y3QgbWFwY2FjaGVfZG9tYWluICpkY2FjaGUgPSAmZC0+YXJjaC5wdi5tYXBjYWNo
ZTsNCj4gPiAtICAgIHVuc2lnbmVkIGxvbmcgaTsNCj4gPiAtICAgIHVuc2lnbmVkIGludCBlbnRz
ID0gZC0+bWF4X3ZjcHVzICogTUFQQ0FDSEVfVkNQVV9FTlRSSUVTOw0KPiA+IC0gICAgdW5zaWdu
ZWQgaW50IG5yID0gUEZOX1VQKEJJVFNfVE9fTE9OR1MoZW50cykgKiBzaXplb2YobG9uZykpOw0K
PiA+IC0NCj4gPiAtICAgIGlmICggIWlzX3B2X3ZjcHUodikgfHwgIWRjYWNoZS0+aW51c2UgKQ0K
PiA+ICsgICAgaWYgKCBpc19pZGxlX3ZjcHUodikgfHwgaXNfaHZtX3ZjcHUodikgKQ0KPiA+ICAg
ICAgICAgIHJldHVybiAwOw0KPiA+ICANCj4gPiArICAgIEJVSUxEX0JVR19PTihNQVBDQUNIRV9W
SVJUX0VORCA+IEFSR19YTEFUX1ZJUlRfU1RBUlQpOw0KPiA+ICsNCj4gPiAgICAgIGlmICggZW50
cyA+IGRjYWNoZS0+ZW50cmllcyApDQo+ID4gICAgICB7DQo+ID4gKyAgICAgICAgaW50IHJjOw0K
PiA+ICsNCj4gPiArICAgICAgICBBU1NFUlQoZW50cyAqIFBBR0VfU0laRSA8PSAoUEVSRE9NQUlO
X1NMT1RfTUJZVEVTIDw8IDIwKSk7DQo+ID4gKw0KPiA+ICAgICAgICAgIC8qIFBvcHVsYXRlIHBh
Z2UgdGFibGVzLiAqLw0KPiA+IC0gICAgICAgIGludCByYyA9IGNyZWF0ZV9wZXJkb21haW5fbWFw
cGluZyhkLCBNQVBDQUNIRV9WSVJUX1NUQVJULA0KPiA+IGVudHMsDQo+ID4gKyAgICAgICAgcmMg
PSBjcmVhdGVfcGVyZG9tYWluX21hcHBpbmcoZCwgTUFQQ0FDSEVfVklSVF9TVEFSVCwNCj4gPiBl
bnRzLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOSUwo
bDFfcGdlbnRyeV90ICopLA0KPiA+IE5VTEwpOw0KPiA+ICANCj4gPiAtICAgICAgICAvKiBQb3B1
bGF0ZSBiaXQgbWFwcy4gKi8NCj4gPiAtICAgICAgICBpZiAoICFyYyApDQo+ID4gLSAgICAgICAg
ICAgIHJjID0gY3JlYXRlX3BlcmRvbWFpbl9tYXBwaW5nKGQsICh1bnNpZ25lZA0KPiA+IGxvbmcp
ZGNhY2hlLT5pbnVzZSwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbnIsIE5VTEwsIE5JTChzdHJ1Y3QNCj4gPiBwYWdlX2luZm8gKikpOw0KPiA+IC0gICAg
ICAgIGlmICggIXJjICkNCj4gPiAtICAgICAgICAgICAgcmMgPSBjcmVhdGVfcGVyZG9tYWluX21h
cHBpbmcoZCwgKHVuc2lnbmVkDQo+ID4gbG9uZylkY2FjaGUtPmdhcmJhZ2UsDQo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5yLCBOVUxMLCBOSUwoc3RydWN0
DQo+ID4gcGFnZV9pbmZvICopKTsNCj4gPiAtDQo+ID4gICAgICAgICAgaWYgKCByYyApDQo+ID4g
ICAgICAgICAgICAgIHJldHVybiByYzsNCj4gPiAgDQo+ID4gICAgICAgICAgZGNhY2hlLT5lbnRy
aWVzID0gZW50czsNCj4gDQo+IEdpdmVuIHRoYXQ6DQo+IA0KPiAxLiBtYXBjYWNoZV9kb21haW4g
aXMgbm93IGEgc3RydWN0dXJlIHdpdGggb25seSBvbmUgbWVtYmVyLg0KPiAyLiBlbnRzIGlzIGEg
Y29uc3RhbnQgdGhyb3VnaG91dCBkb21haW4ncyBsaWZlY3ljbGUuDQo+IA0KPiBZb3UgY2FuIHJl
cGxhY2UgbWFwY2FjaGVfZG9tYWluIHdpdGggYSBib29sZWFuIC0tDQo+IG1hcGNhY2hlX21hcHBp
bmdfcG9wdWxhdGVkICg/KSBpbiBhcmNoLnB2Lg0KPiANCj4gSWYgSSdtIG5vdCBtaXN0YWtlbiwg
dGhlIHNpemUgb2YgdGhlIG1hcHBpbmcgaXMgZGVyaXZlZCBmcm9tIHRoZSB2Y3B1DQo+IGJlaW5n
IGluaXRpYWxpc2VkLCBzbyBhIGZ1cnRoZXIgaW1wcm92ZW1lbnQgaXMgdG8gbGlmdCB0aGUgbWFw
cGluZw0KPiBjcmVhdGlvbiBvdXQgb2YgbWFwY2FjaGVfdmNwdV9pbml0Lg0KDQpCdXQgeW91IGNh
biBqdXN0IFhFTl9ET01DVExfbWF4X3ZjcHVzIG9uIGEgcnVubmluZyBkb21haW4gdG8gaW5jcmVh
c2UNCml0cyBtYXhfdmNwdXMgY291bnQsIHNvIHRoYXQgZW50cyBpcyBub3QgY29uc3RhbnQ/DQoN
Cj4gPiAgICAgIH0NCj4gPiAgDQo+ID4gLSAgICAvKiBNYXJrIGFsbCBtYXBoYXNoIGVudHJpZXMg
YXMgbm90IGluIHVzZS4gKi8NCj4gPiAgICAgIEJVSUxEX0JVR19PTihNQVBIQVNIRU5UX05PVElO
VVNFIDwgTUFQQ0FDSEVfRU5UUklFUyk7DQo+ID4gKyAgICAvKiBNQVBIQVNIX0VOVFJJRVMgaGFz
IHRvIGJlIHBvd2VyLW9mLXR3byB0byBtYWtlIGhhc2hpbmcNCj4gPiB3b3JrLiAqLw0KPiA+ICsg
ICAgQlVJTERfQlVHX09OKE1BUEhBU0hfRU5UUklFUyAmIChNQVBIQVNIX0VOVFJJRVMgLSAxKSk7
DQo+ID4gKyAgICAvKg0KPiA+ICsgICAgICogU2luY2UgZW50cmllcyBpbiB0aGUgbWFwaGFzaCBh
bHNvIG9jY3VweSBpbnVzZSBzbG90cywgd2UNCj4gPiBoYXZlIHRvIG1ha2UNCj4gPiArICAgICAq
IHN1cmUgTUFQQ0FDSEVfVkNQVV9FTlRSSUVTIGlzIGxhcmdlIGVub3VnaCB0byBhY2NvbW1vZGF0
ZQ0KPiA+IGJvdGggdGhlDQo+ID4gKyAgICAgKiBtYXBoYXNoIGFuZCBhIG5lc3RlZCBwYWdlIHRh
YmxlIHdhbGsuDQo+ID4gKyAgICAgKi8NCj4gPiArICAgIEJVSUxEX0JVR19PTihNQVBDQUNIRV9W
Q1BVX0VOVFJJRVMgLSBNQVBIQVNIX0VOVFJJRVMgPA0KPiA+ICsgICAgICAgICAgICAgICAgIENP
TkZJR19QQUdJTkdfTEVWRUxTICogQ09ORklHX1BBR0lOR19MRVZFTFMpOw0KPiA+ICsNCj4gPiAr
ICAgIHYtPmFyY2gucHYubWFwY2FjaGUgPSB4emFsbG9jKHN0cnVjdCBtYXBjYWNoZV92Y3B1KTsN
Cj4gPiArICAgIGlmICggIXYtPmFyY2gucHYubWFwY2FjaGUgKQ0KPiA+ICsgICAgICAgIHJldHVy
biAtRU5PTUVNOw0KPiA+ICsNCj4gPiArICAgIC8qIE1hcmsgYWxsIG1hcGhhc2ggZW50cmllcyBh
cyBub3QgaW4gdXNlLiAqLw0KPiA+ICAgICAgZm9yICggaSA9IDA7IGkgPCBNQVBIQVNIX0VOVFJJ
RVM7IGkrKyApDQo+ID4gICAgICB7DQo+ID4gLSAgICAgICAgc3RydWN0IHZjcHVfbWFwaGFzaF9l
bnRyeSAqaGFzaGVudCA9ICZ2LQ0KPiA+ID5hcmNoLnB2Lm1hcGNhY2hlLmhhc2hbaV07DQo+ID4g
LQ0KPiA+IC0gICAgICAgIGhhc2hlbnQtPm1mbiA9IH4wVUw7IC8qIG5ldmVyIHZhbGlkIHRvIG1h
cCAqLw0KPiA+IC0gICAgICAgIGhhc2hlbnQtPmlkeCA9IE1BUEhBU0hFTlRfTk9USU5VU0U7DQo+
ID4gKyAgICAgICAgdi0+YXJjaC5wdi5tYXBjYWNoZS0+aGFzaF9tZm5baV0gPSB+MFVMOw0KPiAN
Cj4gbWZuX3goSU5WQUxJRF9NRk4pIGhlcmUuIE9yIHlvdSBjYW4gY2hhbmdlIHRoZSB0eXBlIG9m
IHRoZSBhcnJheSB0bw0KPiBtZm5fdC4NCg0KbWZuX3QgaXMgYSBiZXR0ZXIgaWRlYS4gVGhhbmtz
Lg0KDQpIb25neWFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
