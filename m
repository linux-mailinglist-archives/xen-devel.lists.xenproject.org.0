Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B8FFFC26
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 00:13:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWTh4-0003DD-DR; Sun, 17 Nov 2019 23:10:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Iuzj=ZJ=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iWTh2-0003D1-Q4
 for xen-devel@lists.xenproject.org; Sun, 17 Nov 2019 23:10:56 +0000
X-Inumbo-ID: 82216630-098f-11ea-a2ce-12813bfff9fa
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 82216630-098f-11ea-a2ce-12813bfff9fa;
 Sun, 17 Nov 2019 23:10:56 +0000 (UTC)
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [XEN PATCH v3 09/11] xen: arm: gic: supporting
 routing a PPI to the current vcpu.
Thread-Index: AQHVm/D7E8E0G17WCESMnxCa7XL3N6eP/NOg
Date: Sun, 17 Nov 2019 23:11:57 +0000
Message-ID: <01ccff02494d4b7ba4a0699d7f953c41@dornerworks.com>
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115201037.44982-5-stewart.hildebrand@dornerworks.com>
In-Reply-To: <20191115201037.44982-5-stewart.hildebrand@dornerworks.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.58.139.198]
MIME-Version: 1.0
X-spam-status: No, score=2.8 required=3.5 tests=RCVD_IN_XBL, RCVD_IN_PBL,
 BAYES_00, MAILSHELL_SCORE_0_4, HELO_NO_DOMAIN, RDNS_NONE
X-Spam-Flag: NO
Subject: Re: [Xen-devel] [XEN PATCH v3 09/11] xen: arm: gic: supporting
 routing a PPI to the current vcpu.
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpZGF5LCBOb3ZlbWJlciAxNSwgMjAxOSAzOjExIFBNLCBTdGV3YXJ0IEhpbGRlYnJhbmQg
d3JvdGU6DQo+ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9naWMuYyBiL3hlbi9hcmNoL2FybS9n
aWMuYw0KPmluZGV4IDc1OTIxNzI0ZGQuLjk4MmFmYWFkYmQgMTAwNjQ0DQo+LS0tIGEveGVuL2Fy
Y2gvYXJtL2dpYy5jDQo+KysrIGIveGVuL2FyY2gvYXJtL2dpYy5jDQo+QEAgLTkyLDggKzkyLDcg
QEAgdm9pZCBnaWNfc2F2ZV9zdGF0ZShzdHJ1Y3QgdmNwdSAqdikNCj4gdm9pZCBnaWNfc2F2ZV9h
bmRfbWFza19od3BwaShzdHJ1Y3QgdmNwdSAqdiwgY29uc3QgdW5zaWduZWQgdmlycSwNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaHdwcGlfc3RhdGUgKnMpDQo+IHsNCj4t
ICAgIHN0cnVjdCBwZW5kaW5nX2lycSAqcCA9IGlycV90b19wZW5kaW5nKHYsIHZpcnEpOw0KPi0g
ICAgc3RydWN0IGlycV9kZXNjICpkZXNjID0gcC0+ZGVzYzsNCj4rICAgIHN0cnVjdCBpcnFfZGVz
YyAqZGVzYyA9IHZnaWNfZ2V0X2h3X2lycV9kZXNjKE5VTEwsIHYsIHZpcnEpOw0KPg0KPiAgICAg
c3Bpbl9sb2NrKCZkZXNjLT5sb2NrKTsNCj4NCj5AQCAtMTIzLDcgKzEyMiw2IEBAIHZvaWQgZ2lj
X3Jlc3RvcmVfaHdwcGkoc3RydWN0IHZjcHUgKnYsDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
Y29uc3QgdW5zaWduZWQgdmlycSwNCj4gICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1
Y3QgaHdwcGlfc3RhdGUgKnMpDQo+IHsNCj4tICAgIHN0cnVjdCBwZW5kaW5nX2lycSAqcCA9IGly
cV90b19wZW5kaW5nKHYsIHZpcnEpOw0KPiAgICAgc3RydWN0IGlycV9kZXNjICpkZXNjID0gaXJx
X3RvX2Rlc2Mocy0+aXJxKTsNCj4NCj4gICAgIHNwaW5fbG9jaygmZGVzYy0+bG9jayk7DQo+QEAg
LTEzMSw3ICsxMjksOCBAQCB2b2lkIGdpY19yZXN0b3JlX2h3cHBpKHN0cnVjdCB2Y3B1ICp2LA0K
PiAgICAgQVNTRVJUKHZpcnEgPj0gMTYgJiYgdmlycSA8IDMyKTsNCj4gICAgIEFTU0VSVCghaXNf
aWRsZV92Y3B1KHYpKTsNCj4NCj4tICAgIHAtPmRlc2MgPSBkZXNjOyAvKiBNaWdyYXRlIHRvIG5l
dyBwaHlzaWNhbCBwcm9jZXNzb3IgKi8NCj4rICAgIC8qIE1pZ3JhdGUgdG8gbmV3IHBoeXNpY2Fs
IHByb2Nlc3NvciAqLw0KPisgICAgdmdpY19jb25uZWN0X2h3X2lycSh2LT5kb21haW4sIHYsIHZp
cnEsIGRlc2MsIHRydWUpOw0KPg0KPiAgICAgaXJxX3NldF92aXJxKGRlc2MsIHZpcnEpOw0KPg0K
DQpUaGlzIHNuaXBwZXQgd2FzIGludGVuZGVkIHRvIGJlIHJvbGxlZCBpbnRvIFtYRU4gUEFUQ0gg
djMgMDUvMTFdIHhlbjoNCmFybTogYWRkIGludGVyZmFjZXMgdG8gc2F2ZS9yZXN0b3JlIHRoZSBz
dGF0ZSBvZiBhIFBQSS4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
