Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A8045B3BB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 06:08:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229971.397708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpkVV-0006nA-TZ; Wed, 24 Nov 2021 05:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229971.397708; Wed, 24 Nov 2021 05:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpkVV-0006dU-N5; Wed, 24 Nov 2021 05:07:45 +0000
Received: by outflank-mailman (input) for mailman id 229971;
 Tue, 23 Nov 2021 23:50:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SYLV=QK=huawei.com=longpeng2@srs-se1.protection.inumbo.net>)
 id 1mpfYk-000612-7n
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 23:50:46 +0000
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a1fbb4a-4cb8-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 00:50:43 +0100 (CET)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HzLVD0D1Sz9159;
 Wed, 24 Nov 2021 07:50:12 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 24 Nov 2021 07:50:38 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 24 Nov 2021 07:50:38 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.020;
 Wed, 24 Nov 2021 07:50:38 +0800
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2a1fbb4a-4cb8-11ec-9787-a32c541c8605
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
	<longpeng2@huawei.com>
To: Dongli Zhang <dongli.zhang@oracle.com>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Gonglei
 (Arei)" <arei.gonglei@huawei.com>, "x86@kernel.org" <x86@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Peter
 Zijlstra" <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, "Valentin
 Schneider" <valentin.schneider@arm.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: RE: [PATCH] cpu/hotplug: Allow the CPU in CPU_UP_PREPARE state to be
 brought up again.
Thread-Topic: [PATCH] cpu/hotplug: Allow the CPU in CPU_UP_PREPARE state to be
 brought up again.
Thread-Index: AQHX37hRU5zyn85RmkiAPYCSmtUPkawRGrIAgACu5kA=
Date: Tue, 23 Nov 2021 23:50:37 +0000
Message-ID: <46f7dbb8c0cb42228ed028ed89af1282@huawei.com>
References: <20211122154714.xaoxok3fpk5bgznz@linutronix.de>
 <d5f43af4-f91f-ef9f-9c33-8d349f59b23c@oracle.com>
In-Reply-To: <d5f43af4-f91f-ef9f-9c33-8d349f59b23c@oracle.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.174.148.223]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG9uZ2xpIFpoYW5nIFtt
YWlsdG86ZG9uZ2xpLnpoYW5nQG9yYWNsZS5jb21dDQo+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1i
ZXIgMjQsIDIwMjEgNToyMiBBTQ0KPiBUbzogU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciA8Ymln
ZWFzeUBsaW51dHJvbml4LmRlPjsgTG9uZ3BlbmcgKE1pa2UsIENsb3VkDQo+IEluZnJhc3RydWN0
dXJlIFNlcnZpY2UgUHJvZHVjdCBEZXB0LikgPGxvbmdwZW5nMkBodWF3ZWkuY29tPg0KPiBDYzog
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgR29uZ2xlaSAoQXJlaSkgPGFyZWkuZ29uZ2xl
aUBodWF3ZWkuY29tPjsNCj4geDg2QGtlcm5lbC5vcmc7IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZzsgUGV0ZXIgWmlqbHN0cmENCj4gPHBldGVyekBpbmZyYWRlYWQub3JnPjsgSW5nbyBN
b2xuYXIgPG1pbmdvQGtlcm5lbC5vcmc+OyBWYWxlbnRpbiBTY2huZWlkZXINCj4gPHZhbGVudGlu
LnNjaG5laWRlckBhcm0uY29tPjsgQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3Jh
Y2xlLmNvbT47DQo+IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47DQo+IFRob21hcyBHbGVpeG5lciA8dGds
eEBsaW51dHJvbml4LmRlPjsgSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+OyBCb3Jpc2xh
dg0KPiBQZXRrb3YgPGJwQGFsaWVuOC5kZT47IERhdmUgSGFuc2VuIDxkYXZlLmhhbnNlbkBsaW51
eC5pbnRlbC5jb20+OyBILiBQZXRlcg0KPiBBbnZpbiA8aHBhQHp5dG9yLmNvbT4NCj4gU3ViamVj
dDogUmU6IFtQQVRDSF0gY3B1L2hvdHBsdWc6IEFsbG93IHRoZSBDUFUgaW4gQ1BVX1VQX1BSRVBB
UkUgc3RhdGUgdG8gYmUNCj4gYnJvdWdodCB1cCBhZ2Fpbi4NCj4gDQo+IFRlc3RlZC1ieTogRG9u
Z2xpIFpoYW5nIDxkb25nbGkuemhhbmdAb3JhY2xlLmNvbT4NCj4gDQo+IA0KPiBUaGUgYnVnIGZp
eGVkIGJ5IGNvbW1pdCA1M2ZhZmRiYjhiMjEgKCJLVk06IHg4Njogc3dpdGNoIEtWTUNMT0NLIGJh
c2UgdG8NCj4gbW9ub3RvbmljIHJhdyBjbG9jayIpIG1heSBsZWF2ZSB0aGUgY3B1X2hvdHBsdWdf
c3RhdGUgYXQgQ1BVX1VQX1BSRVBBUkUuIEFzIGENCj4gcmVzdWx0LCB0byBvbmxpbmUgdGhpcyBD
UFUgYWdhaW4gKGV2ZW4gYWZ0ZXIgcmVtb3ZhbCkgaXMgYWx3YXlzIGZhaWxlZC4NCj4gDQo+IEkg
aGF2ZSB0ZXN0ZWQgdGhhdCB0aGlzIHBhdGNoIHdvcmtzIHdlbGwgdG8gd29ya2Fyb3VuZCB0aGUg
aXNzdWUsIGJ5IGludHJvZHVjaW5nDQo+IGVpdGhlciBhIG1kZWxleSgxMTAwMCkgb3Igd2hpbGUo
MSk7IHRvIHN0YXJ0X3NlY29uZGFyeSgpLiBUaGF0IGlzLCB0byBvbmxpbmUNCj4gdGhlDQo+IHNh
bWUgQ1BVIGFnYWluIGlzIHN1Y2Nlc3NmdWwgZXZlbiBhZnRlciBpbml0aWFsIGRvX2Jvb3RfY3B1
KCkgZmFpbHVyZS4NCj4gDQo+IDEuIGFkZCBtZGVsYXkoMTEwMDApIG9yIHdoaWxlKDEpOyB0byB0
aGUgc3RhcnRfc2Vjb25kYXJ5KCkuDQo+IA0KPiAyLiB0byBvbmxpbmUgQ1BVIGlzIGZhaWxlZCBh
dCBkb19ib290X2NwdSgpLg0KPiANCg0KVGhhbmtzIGZvciB5b3VyIHRlc3RpbmcgOikNCg0KRG9l
cyB0aGUgY3B1NCBzcGluIGluIHdhaXRfZm9yX21hc3Rlcl9jcHUoKSBpbiB5b3VyIGNhc2UgPw0K
DQo+IDMuIHRvIG9ubGluZSBDUFUgYWdhaW4gaXMgZmFpbGVkIHdpdGhvdXQgdGhpcyBwYXRjaC4N
Cj4gDQo+ICMgZWNobyAxID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NC9vbmxpbmUNCj4g
LXN1OiBlY2hvOiB3cml0ZSBlcnJvcjogSW5wdXQvb3V0cHV0IGVycm9yDQo+IA0KPiA0LiB0byBv
bmxpbmUgQ1BVIGFnYWluIGlzIHN1Y2Nlc3NmdWwgd2l0aCB0aGlzIHBhdGNoLg0KPiANCj4gVGhh
bmsgeW91IHZlcnkgbXVjaCENCj4gDQo+IERvbmdsaSBaaGFuZw0KPiANCj4gT24gMTEvMjIvMjEg
Nzo0NyBBTSwgU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciB3cm90ZToNCj4gPiBGcm9tOiAiTG9u
Z3BlbmcoTWlrZSkiIDxsb25ncGVuZzJAaHVhd2VpLmNvbT4NCj4gPg0KPiA+IEEgQ1BVIHdpbGwg
bm90IHNob3cgdXAgaW4gdmlydHVhbGl6ZWQgZW52aXJvbm1lbnQgd2hpY2ggaW5jbHVkZXMgYW4N
Cj4gPiBFbmNsYXZlLiBUaGUgVk0gc3BsaXRzIGl0cyByZXNvdXJjZXMgaW50byBhIHByaW1hcnkg
Vk0gYW5kIGEgRW5jbGF2ZQ0KPiA+IFZNLiBXaGlsZSB0aGUgRW5jbGF2ZSBpcyBhY3RpdmUsIHRo
ZSBoeXBlcnZpc29yIHdpbGwgaWdub3JlIGFsbCByZXF1ZXN0cw0KPiA+IHRvIGJyaW5nIHVwIGEg
Q1BVIGFuZCB0aGlzIENQVSB3aWxsIHJlbWFpbiBpbiBDUFVfVVBfUFJFUEFSRSBzdGF0ZS4NCj4g
PiBUaGUga2VybmVsIHdpbGwgd2FpdCB1cCB0byB0ZW4gc2Vjb25kcyBmb3IgQ1BVIHRvIHNob3cg
dXANCj4gPiAoZG9fYm9vdF9jcHUoKSkgYW5kIHRoZW4gcm9sbGJhY2sgdGhlIGhvdHBsdWcgc3Rh
dGUgYmFjayB0bw0KPiA+IENQVUhQX09GRkxJTkUgbGVhdmluZyB0aGUgQ1BVIHN0YXRlIGluIENQ
VV9VUF9QUkVQQVJFLiBUaGUgQ1BVIHN0YXRlIGlzDQo+ID4gc2V0IGJhY2sgdG8gQ1BVSFBfVEVB
UkRPV05fQ1BVIGR1cmluZyB0aGUgQ1BVX1BPU1RfREVBRCBzdGFnZS4NCj4gPg0KPiA+IEFmdGVy
IHRoZSBFbmNsYXZlIFZNIHRlcm1pbmF0ZXMsIHRoZSBwcmltYXJ5IFZNIGNhbiBicmluZyB1cCB0
aGUgQ1BVDQo+ID4gYWdhaW4uDQo+ID4NCj4gPiBBbGxvdyB0byBicmluZyB1cCB0aGUgQ1BVIGlm
IGl0IGlzIGluIHRoZSBDUFVfVVBfUFJFUEFSRSBzdGF0ZS4NCj4gPg0KPiA+IFtiaWdlYXN5OiBS
ZXdyaXRlIGNvbW1pdCBkZXNjcmlwdGlvbi5dDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMb25n
cGVuZyhNaWtlKSA8bG9uZ3BlbmcyQGh1YXdlaS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2Vi
YXN0aWFuIEFuZHJ6ZWogU2lld2lvciA8YmlnZWFzeUBsaW51dHJvbml4LmRlPg0KPiA+IExpbms6
DQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzIwMjEwOTAxMDUxMTQzLjI3NTItMQ0KPiAtbG9uZ3BlbmcyQGh1YXdlaS5jb21fXzshIUFDV1Y1
TjlNMlJWOTloUSFkNHNDQ1hNUVY3ZWtGd3BkMjF2bzFfOUstbTVoNFZaLWcNCj4gRThaNjJQTEw1
OERUNFZKNlN0SDU3VFJfS3BCZGJ3aEJFMCQNCj4gPiAtLS0NCj4gPg0KPiA+IEZvciBYRU46IHRo
aXMgY2hhbmdlcyB0aGUgYmVoYXZpb3VyIGFzIGl0IGFsbG93cyB0byBpbnZva2UNCj4gPiBjcHVf
aW5pdGlhbGl6ZV9jb250ZXh0KCkgYWdhaW4gc2hvdWxkIGl0IGhhdmUgaGF2ZSBlYXJsaWVyLiBJ
ICp0aGluayoNCj4gPiB0aGlzIGlzIG9rYXkgYW5kIHdvdWxkIHRvIGJyaW5nIHVwIHRoZSBDUFUg
YWdhaW4gc2hvdWxkIHRoZSBtZW1vcnkNCj4gPiBhbGxvY2F0aW9uIGluIGNwdV9pbml0aWFsaXpl
X2NvbnRleHQoKSBmYWlsLg0KPiA+DQo+ID4gIGtlcm5lbC9zbXBib290LmMgfCA3ICsrKysrKysN
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2tlcm5lbC9zbXBib290LmMgYi9rZXJuZWwvc21wYm9vdC5jDQo+ID4gaW5kZXggZjZiYzBi
YzhhMmFhYi4uMzQ5NThkN2ZlMmMxYyAxMDA2NDQNCj4gPiAtLS0gYS9rZXJuZWwvc21wYm9vdC5j
DQo+ID4gKysrIGIva2VybmVsL3NtcGJvb3QuYw0KPiA+IEBAIC0zOTIsNiArMzkyLDEzIEBAIGlu
dCBjcHVfY2hlY2tfdXBfcHJlcGFyZShpbnQgY3B1KQ0KPiA+ICAJCSAqLw0KPiA+ICAJCXJldHVy
biAtRUFHQUlOOw0KPiA+DQo+ID4gKwljYXNlIENQVV9VUF9QUkVQQVJFOg0KPiA+ICsJCS8qDQo+
ID4gKwkJICogVGltZW91dCB3aGlsZSB3YWl0aW5nIGZvciB0aGUgQ1BVIHRvIHNob3cgdXAuIEFs
bG93IHRvIHRyeQ0KPiA+ICsJCSAqIGFnYWluIGxhdGVyLg0KPiA+ICsJCSAqLw0KPiA+ICsJCXJl
dHVybiAwOw0KPiA+ICsNCj4gPiAgCWRlZmF1bHQ6DQo+ID4NCj4gPiAgCQkvKiBTaG91bGQgbm90
IGhhcHBlbi4gIEZhbW91cyBsYXN0IHdvcmRzLiAqLw0KPiA+DQo=

