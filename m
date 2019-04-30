Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3446FFA68
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 15:31:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLSoS-0001jW-2V; Tue, 30 Apr 2019 13:28:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GOyl=TA=amazon.de=prvs=0169a7198=wipawel@srs-us1.protection.inumbo.net>)
 id 1hLSoQ-0001jR-Jn
 for xen-devel@lists.xen.org; Tue, 30 Apr 2019 13:28:46 +0000
X-Inumbo-ID: dfea5200-6b4b-11e9-9f16-5bc299ac4be2
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfea5200-6b4b-11e9-9f16-5bc299ac4be2;
 Tue, 30 Apr 2019 13:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1556630923; x=1588166923;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=zQh00ZkNnWG+X9Fh56XJ3IwtHIEXqy8SwkD7U2NMTmM=;
 b=UB8ITAVLqOJ1TP3dtygznzSfQ/nsGKxvcIRWIilhkWLkxrvVJLYdcFhf
 pLUfdHW5BLhhBXC7ckT8ajJnIxLeKW023asavzz0Xr4tlMeTuP/yF0ibl
 tudSZLcsCHAWm1GzGBV/7A+/hHkJp0IFhnF4xnD1MSkPDR9EVC0yxKtih 0=;
X-IronPort-AV: E=Sophos;i="5.60,413,1549929600"; d="scan'208";a="400265840"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 30 Apr 2019 13:28:42 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (8.14.7/8.14.7) with
 ESMTP id x3UDSeB6080797
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 30 Apr 2019 13:28:42 GMT
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 30 Apr 2019 13:28:41 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 30 Apr 2019 13:28:40 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Tue, 30 Apr 2019 13:28:40 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Thread-Topic: [livepatch-build-tools part2 6/6] create-diff-object: Do not
 include all .rodata sections
Thread-Index: AQHU9E0CnaLaENJJJ0aaxnecfwnO6qZTY82AgAFk2AA=
Date: Tue, 30 Apr 2019 13:28:40 +0000
Message-ID: <FB849C9B-1B3F-4AF2-A3CF-16F640C528D0@amazon.com>
References: <20190416120716.26269-1-wipawel@amazon.de>
 <20190416120716.26269-6-wipawel@amazon.de>
 <ab261ac1-795d-687a-31b2-d7b29e39dde2@citrix.com>
In-Reply-To: <ab261ac1-795d-687a-31b2-d7b29e39dde2@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.171]
Content-ID: <868A5B47EF161D4FB9D372E07B1ADF34@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [livepatch-build-tools part2 6/6]
 create-diff-object: Do not include all .rodata sections
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIDI5LiBBcHIgMjAxOSwgYXQgMTg6MTEsIFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vy
d2FsbEBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDQvMTYvMTkgMTowNyBQTSwgUGF3ZWwg
V2llY3pvcmtpZXdpY3ogd3JvdGU6DQo+PiBTdGFydGluZyB3aXRoIHRoZSAiMmFmNmYxYWE2MjMz
IEZpeCBwYXRjaCBjcmVhdGlvbiB3aXRoIEdDQyA2LjErIiBjb21taXQNCj4+IGFsbCAucm9kYXRh
IHNlY3Rpb25zIGFyZSBpbmNsdWRlZCBieSBkZWZhdWx0IChyZWdhcmRsZXNzIG9mIHdoZXRoZXIg
dGhleQ0KPj4gYXJlIG5lZWRlZCBvciBub3QpLg0KPj4gRHVyaW5nIHN0YWNrZWQgaG90cGF0Y2gg
YnVpbGRzIGl0IGxlYWRzIHRvIHVubmVjZXNzYXJ5IGR1cGxpY2F0aW9uIG9mDQo+PiB0aGUgLnJv
ZGF0YSBzZWN0aW9ucyBhcyBlYWNoIGFuZCBldmVyeSBjb25zZWN1dGl2ZSBob3RwYXRjaCBjb250
YWlucyBhbGwNCj4+IHRoZSAucm9kYXRhIHNlY3Rpb24gb2YgcHJldmlvdXMgaG90cGF0Y2hlcy4N
Cj4gDQo+IFRoaXMgY29tbWl0IG1lc3NhZ2UgaXMgYSBiaXQgY29uZnVzaW5nLg0KPiANCj4gMSkg
QWxsIG9mIHRoaXMgb25seSBhcHBsaWVzIHRvIC5yb2RhdGEuc3RyKiBzZWN0aW9ucy4gT3RoZXIg
LnJvZGF0YSBzZWN0aW9ucyBhcmUgaGFuZGxlZCBzZXBhcmF0ZWx5Lg0KDQpZZXMsIHRoYXTigJlz
IHJpZ2h0LiBJIHdpbGwgbWFrZSB0aGUgY29tbWl0IG1lc3NhZ2UgcHJlY2lzZS4NCg0KQUNLLiBX
aWxsIGZpeC4NCg0KPiANCj4gMikgVGhlIGFib3ZlIGNvbW1pdCBfZGlkIG5vdF8gaW50cm9kdWNl
IHRoZSBwcm9ibGVtLiBQcmV2aW91cyB2ZXJzaW9ucyBvZiBHQ0MgZGlkIG5vdCBzcGxpdCAucm9k
YXRhLnN0ciBzZWN0aW9ucyBieSBmdW5jdGlvbiB3aGljaCBtZWFudCB0aGF0IHRoZSBlbnRpcmUg
c2VjdGlvbiB3YXMgYWx3YXlzIGluY2x1ZGVkLiBUaGUgY29tbWl0IGZpeGVkIHBhdGNoIGNyZWF0
aW9uIGFuZCBfbWFpbnRhaW5lZF8gdGhlIGV4aXN0aW5nIGJlaGF2aW91ciBmb3IgR0NDIDYuMSsg
YnkgaW5jbHVkaW5nIGFsbCB0aGUNCg0KSSBzZWUsIHRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRp
b24uIEkgd2lsbCB1cGRhdGUgdGhlIHdvcmRpbmcgdG8gYXZvaWQgY29uZnVzaW9uIGFuZCBpbmNv
cnJlY3QgYXR0cmlidXRpb24gaGVyZS4NCg0KPiAucm9kYXRhLnN0ciogc2VjdGlvbnMuIFRoaXMg
cGF0Y2ggbm93IGluY2x1ZGVzIG9ubHkgd2hhdCBpcyBuZWVkZWQgKGJ1dCBpdCBzaG91bGQgYmUg
bm90ZWQgdGhhdCB0aGlzIHdvdWxkIGxpa2VseSBub3QgYmUgdXNlZnVsIG9uIG9sZGVyIHZlcnNp
b25zIG9mIEdDQyBzaW5jZSB0aGV5IGRvbid0IHNwbGl0IC5yb2RhdGEuc3RyIHByb3Blcmx5KS4N
Cg0KT0ssIEkgc3VwcG9zZSB1c2VycyBvZiBvbGRlciB2ZXJzaW9ucyBvZiBHQ0MgaGF2ZSB0byBh
Y2NlcHQgdGhlIGZhY3QuDQoNCj4gDQo+PiBUbyBwcmV2ZW50IHRoaXMgc2l0dWF0aW9uLCBtYXJr
IHRoZSAucm9kYXRhIHNlY3Rpb24gZm9yIGluY2x1c2lvbiBvbmx5DQo+PiBpZiB0aGV5IGFyZSBy
ZWZlcmVuY2VkIGJ5IGFueSBvZiB0aGUgY3VycmVudCBob3RwYXRjaCBzeW1ib2xzIChvciBhDQo+
PiBjb3JyZXNwb25kaW5nIFJFTEEgc2VjdGlvbikuDQo+PiBFeHRlbmQgcGF0Y2hhYmlsaXR5IHZl
cmlmaWNhdGlvbiB0byBkZXRlY3QgYWxsIG5vbi1zdGFuZGFyZCwgbm9uLXJlbGEsDQo+PiBub24t
ZGVidWcgYW5kIG5vbi1zcGVjaWFsIHNlY3Rpb25zIHRoYXQgYXJlIG5vdCByZWZlcmVuY2VkIGJ5
IGFueSBvZg0KPj4gdGhlIHN5bWJvbHMgb3IgUkVMQSBzZWN0aW9ucy4NCj4+IFNpZ25lZC1vZmYt
Ynk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4NCj4+IFJldmlld2Vk
LWJ5OiBBbmRyYS1JcmluYSBQYXJhc2NoaXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+DQo+PiBSZXZp
ZXdlZC1ieTogQmpvZXJuIERvZWJlbCA8ZG9lYmVsQGFtYXpvbi5kZT4NCj4+IFJldmlld2VkLWJ5
OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4NCj4+IC0tLQ0KPj4gIGNyZWF0
ZS1kaWZmLW9iamVjdC5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+PiAgMSBm
aWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+IGRpZmYgLS1n
aXQgYS9jcmVhdGUtZGlmZi1vYmplY3QuYyBiL2NyZWF0ZS1kaWZmLW9iamVjdC5jDQo+PiBpbmRl
eCBmNjA2MGNkLi5mN2ViNDIxIDEwMDY0NA0KPj4gLS0tIGEvY3JlYXRlLWRpZmYtb2JqZWN0LmMN
Cj4+ICsrKyBiL2NyZWF0ZS1kaWZmLW9iamVjdC5jDQo+PiBAQCAtMTM0MSw3ICsxMzQxLDcgQEAg
c3RhdGljIHZvaWQga3BhdGNoX2luY2x1ZGVfc3RhbmRhcmRfZWxlbWVudHMoc3RydWN0IGtwYXRj
aF9lbGYgKmtlbGYpDQo+PiAgICAJbGlzdF9mb3JfZWFjaF9lbnRyeShzZWMsICZrZWxmLT5zZWN0
aW9ucywgbGlzdCkgew0KPj4gIAkJLyogaW5jbHVkZSB0aGVzZSBzZWN0aW9ucyBldmVuIGlmIHRo
ZXkgaGF2ZW4ndCBjaGFuZ2VkICovDQo+PiAtCQlpZiAoaXNfc3RhbmRhcmRfc2VjdGlvbihzZWMp
IHx8IHNob3VsZF9pbmNsdWRlX3N0cl9zZWN0aW9uKHNlYy0+bmFtZSkpIHsNCj4+ICsJCWlmIChp
c19zdGFuZGFyZF9zZWN0aW9uKHNlYykpIHsNCj4+ICAJCQlzZWMtPmluY2x1ZGUgPSAxOw0KPj4g
IAkJCWlmIChzZWMtPnNlY3N5bSkNCj4+ICAJCQkJc2VjLT5zZWNzeW0tPmluY2x1ZGUgPSAxOw0K
Pj4gQEAgLTEzNTIsNiArMTM1MiwxOSBAQCBzdGF0aWMgdm9pZCBrcGF0Y2hfaW5jbHVkZV9zdGFu
ZGFyZF9lbGVtZW50cyhzdHJ1Y3Qga3BhdGNoX2VsZiAqa2VsZikNCj4+ICAJbGlzdF9lbnRyeShr
ZWxmLT5zeW1ib2xzLm5leHQsIHN0cnVjdCBzeW1ib2wsIGxpc3QpLT5pbmNsdWRlID0gMTsNCj4+
ICB9DQo+PiAgK3N0YXRpYyB2b2lkIGtwYXRjaF9pbmNsdWRlX3N0YW5kYXJkX3N0cmluZ19lbGVt
ZW50cyhzdHJ1Y3Qga3BhdGNoX2VsZiAqa2VsZikNCj4+ICt7DQo+PiArCXN0cnVjdCBzZWN0aW9u
ICpzZWM7DQo+PiArDQo+PiArCWxpc3RfZm9yX2VhY2hfZW50cnkoc2VjLCAma2VsZi0+c2VjdGlv
bnMsIGxpc3QpIHsNCj4+ICsJCWlmIChzaG91bGRfaW5jbHVkZV9zdHJfc2VjdGlvbihzZWMtPm5h
bWUpICYmIGlzX3JlZmVyZW5jZWRfc2VjdGlvbihzZWMsIGtlbGYpKSB7DQo+PiArCQkJc2VjLT5p
bmNsdWRlID0gMTsNCj4+ICsJCQlpZiAoc2VjLT5zZWNzeW0pDQo+PiArCQkJCXNlYy0+c2Vjc3lt
LT5pbmNsdWRlID0gMTsNCj4+ICsJCX0NCj4+ICsJfQ0KPj4gK30NCj4gDQo+IEkgdGhpbmsgaXQg
d291bGQgYmUgc2ltcGxlciB0byBqdXN0IGFtZW5kIHRoZSBwcmV2aW91cyBmdW5jdGlvbiByYXRo
ZXIgdGhhbiBpbnRyb2R1Y2luZyBhIG5ldyBvbmUuIEUuZy4NCj4gDQo+IC4uLiB8fCAoc2hvdWxk
X2luY2x1ZGVfc3RyX3NlY3Rpb24oc2VjLT5uYW1lKSAmJiBpc19yZWZlcmVuY2VkX3NlY3Rpb24o
c2VjLCBrZWxmKSkNCg0KSUlSQywgaXQgaXMgdW5mb3J0dW5hdGVseSB0b28gZWFybHkgdG8gZG8g
dGhhdCBmcm9tIHdpdGhpbiBrcGF0Y2hfaW5jbHVkZV9zdGFuZGFyZF9lbGVtZW50cygpLg0KSSB3
YW50IHRvIGNhbGwgdGhlIGtwYXRjaF9pbmNsdWRlX3N0YW5kYXJkX3N0cmluZ19lbGVtZW50cygp
IGFmdGVyIHRoZSBmb2xsb3dpbmcgZnVuY3Rpb25zIGFyZSBjYWxsZWQ6DQotIGtwYXRjaF9pbmNs
dWRlX2NoYW5nZWRfZnVuY3Rpb25zKCkNCi0ga3BhdGNoX2luY2x1ZGVfZGVidWdfc2VjdGlvbnMo
KQ0KLSBrcGF0Y2hfaW5jbHVkZV9ob29rX2VsZW1lbnRzKCkNCmJlY2F1c2UgdGhleSBtYXkgYWZm
ZWN0IGlzX3JlZmVyZW5jZWRfc2VjdGlvbigpIHJlc3VsdC4NCg0KPiANCj4gUmVnYXJkcywNCj4g
LS0gDQo+IFJvc3MgTGFnZXJ3YWxsDQoNCg0KQmVzdCBSZWdhcmRzLA0KUGF3ZWwgV2llY3pvcmtp
ZXdpY3oKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0
ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocmVyOiBDaHJpc3RpYW4gU2NobGFlZ2Vy
LCBSYWxmIEhlcmJyaWNoClVzdC1JRDogREUgMjg5IDIzNyA4NzkKRWluZ2V0cmFnZW4gYW0gQW10
c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBCCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
