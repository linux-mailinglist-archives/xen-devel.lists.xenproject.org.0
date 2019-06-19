Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DF14BE04
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 18:26:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hddMt-00006a-1X; Wed, 19 Jun 2019 16:23:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3it4=US=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hddMr-000064-6W
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 16:23:25 +0000
X-Inumbo-ID: 8f9742dc-92ae-11e9-8980-bc764e045a96
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe49::609])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8f9742dc-92ae-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 16:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86EH6rwIBWY7NSGjg6u0yjl0Yu1uz47f6A7d1FgXZXo=;
 b=OV/f9w7OazhsZSguWsLXX+xxxhkM2rKNiCZ8LUA/2bgkmDCwSP+uMKgYFYnDsgXNhvXWlS4zLZd0aXgGJpO6IaLbAiWZ8USfGL/VJzKo8y69fUl8Cau1TqvxOkQ6uzTxDeAdUjbVJqLNRt9RlOIZ6JIeuR/4sCtOo5ogNtMSr0s=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB3946.namprd12.prod.outlook.com (10.255.174.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 19 Jun 2019 16:23:21 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::9dea:57a2:93ff:57b0]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::9dea:57a2:93ff:57b0%3]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 16:23:21 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] x86/svm: Fix svm_vmcb_dump() when used in current context
Thread-Index: AQHVJQvYUN9IrNMXJESwiyhYMi5b6KajLIMA
Date: Wed, 19 Jun 2019 16:23:21 +0000
Message-ID: <20190619162318.GH20907@amd.com>
References: <1560776079-9866-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1560776079-9866-1-git-send-email-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DM5PR07CA0049.namprd07.prod.outlook.com
 (2603:10b6:4:ad::14) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6860c3ff-609b-4574-7fc8-08d6f4d27206
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3946; 
x-ms-traffictypediagnostic: DM6PR12MB3946:
x-microsoft-antispam-prvs: <DM6PR12MB3946A552733E1B4509B53646E5E50@DM6PR12MB3946.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(346002)(136003)(376002)(366004)(189003)(199004)(305945005)(7736002)(229853002)(4326008)(256004)(2616005)(73956011)(1076003)(76176011)(6436002)(316002)(66476007)(64756008)(66556008)(71190400001)(2906002)(66946007)(71200400001)(6486002)(6512007)(6246003)(186003)(14454004)(54906003)(3846002)(386003)(72206003)(68736007)(66446008)(8676002)(33656002)(53936002)(478600001)(36756003)(66066001)(476003)(446003)(52116002)(81156014)(81166006)(6116002)(8936002)(6506007)(11346002)(6916009)(25786009)(26005)(102836004)(99286004)(486006)(86362001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3946;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hwhQ66XQU0LF4xJRyIopxCxZINLFyOjK0k3aym/SYj6Z5uqDJsPb+X1vqjSzxU/WukRo3nFZ/Mq2EufTkcO3Bn5MZMD83zPI0javI7DZUvA+7dJQrThTWtbRmt4av4QJSFxf5Z3/Sa/6KGOgVe0Yy/l6t6t3pEBJQuROUY2p7d9986FpZxmJqa9Yo+CsVJgavBQejcTMCvpFTJgVh6N58Gz9nATXxuyB9WScx+JcY5zNh1P4mrCAUht2RuNZaeeGm44HBYbUld4NnrLdX92MgA/J6caxZcQNv5Zr605T9POGuf5RKia1lT8mJYHbRbjRyjZX4dElDR8RFQKg+Ee/eIihhU6MDVRSLhHncush13wU4S1HVbAoOBBx5Ix1h4MFfzIABAfx7pE+ETiALqDjLkdiO3NvJYcPx0jLm5rbQYo=
Content-ID: <73D6450499925E4EB91CA4B06D668834@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6860c3ff-609b-4574-7fc8-08d6f4d27206
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 16:23:21.4880 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3946
Subject: Re: [Xen-devel] [PATCH] x86/svm: Fix svm_vmcb_dump() when used in
 current context
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
Cc: Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Woods,
 Brian" <Brian.Woods@amd.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDE6NTQ6MzlQTSArMDEwMCwgQW5keSBDb29wZXIgd3Jv
dGU6Cj4gVk1FeGl0IGRvZXNuJ3Qgc3dpdGNoIGFsbCBzdGF0ZS4gIFRoZSBGUy9HUy9UUy9MRFRS
L0dTQkFTRSBzZWdtZW50Cj4gaW5mb3JtYXRpb24sIGFuZCBTWVNDQUxML1NZU0VOVEVSIE1TUnMg
bWF5IHN0aWxsIGJlIGNhY2hlZCBpbiBoYXJkd2FyZSwgcmF0aGVyCj4gdGhhbiB1cC10by1kYXRl
IGluIHRoZSBWTUNCLgo+IAo+IEV4cG9ydCBzdm1fc3luY192bWNiKCkgdmlhIHN2bWRlYnVnLmgg
c28gc3ZtX3ZtY2JfZHVtcCgpIGNhbiB1c2UgaXQsIGFuZCBicmluZwo+IHRoZSBWTUNCIGludG8g
c3luYyBpbiBjdXJyZW50IGNvbnRleHQuCj4gCj4gQXMgYSBtaW5vciBvcHRpbWlzYXRpb24sIHN3
aXRjaCBzdm1fc3luY192bWNiKCkgdG8gdXNlIHN2bV92bXtsb2FkLHNhdmV9X3BhKCksCj4gYXMg
c3ZtLT52bWNiX3BhIGlzIGFsd2F5cyBpbiBjb3JyZWN0LCBhbmQgdGhpcyBhdm9pZHMgYSByZWR1
bmRhbnQgX19wYSgpCj4gdHJhbnNsYXRpb24gYmVoaW5kIHRoZSBzY2VuZXMuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFja2Vk
LWJ5OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KCj4gLS0tCj4gQ0M6IEphbiBC
ZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiBD
QzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gQ0M6IEJvcmlzIE9z
dHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4gQ0M6IFN1cmF2ZWUgU3V0aGlr
dWxwYW5pdCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+Cj4gQ0M6IEJyaWFuIFdvb2Rz
IDxicmlhbi53b29kc0BhbWQuY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0u
YyAgICAgICAgICAgICB8IDYgKysrLS0tCj4gIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bWRlYnVn
LmMgICAgICAgIHwgOSArKysrKysrKysKPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL3N2
bWRlYnVnLmggfCAxICsKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYyBi
L3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jCj4gaW5kZXggY2Q2YTZiMy4uMGVhYzljZSAxMDA2
NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9odm0vc3ZtL3N2bS5jCj4gQEAgLTYyNywyMSArNjI3LDIxIEBAIHN0YXRpYyB2b2lkIHN2bV9j
cHVpZF9wb2xpY3lfY2hhbmdlZChzdHJ1Y3QgdmNwdSAqdikKPiAgICAgICAgICAgICAgICAgICAg
ICAgIGNwLT5leHRkLmlicGIgPyBNU1JfSU5URVJDRVBUX05PTkUgOiBNU1JfSU5URVJDRVBUX1JX
KTsKPiAgfQo+ICAKPiAtc3RhdGljIHZvaWQgc3ZtX3N5bmNfdm1jYihzdHJ1Y3QgdmNwdSAqdiwg
ZW51bSB2bWNiX3N5bmNfc3RhdGUgbmV3X3N0YXRlKQo+ICt2b2lkIHN2bV9zeW5jX3ZtY2Ioc3Ry
dWN0IHZjcHUgKnYsIGVudW0gdm1jYl9zeW5jX3N0YXRlIG5ld19zdGF0ZSkKPiAgewo+ICAgICAg
c3RydWN0IHN2bV92Y3B1ICpzdm0gPSAmdi0+YXJjaC5odm0uc3ZtOwo+ICAKPiAgICAgIGlmICgg
bmV3X3N0YXRlID09IHZtY2JfbmVlZHNfdm1zYXZlICkKPiAgICAgIHsKPiAgICAgICAgICBpZiAo
IHN2bS0+dm1jYl9zeW5jX3N0YXRlID09IHZtY2JfbmVlZHNfdm1sb2FkICkKPiAtICAgICAgICAg
ICAgc3ZtX3ZtbG9hZChzdm0tPnZtY2IpOwo+ICsgICAgICAgICAgICBzdm1fdm1sb2FkX3BhKHN2
bS0+dm1jYl9wYSk7Cj4gIAo+ICAgICAgICAgIHN2bS0+dm1jYl9zeW5jX3N0YXRlID0gbmV3X3N0
YXRlOwo+ICAgICAgfQo+ICAgICAgZWxzZQo+ICAgICAgewo+ICAgICAgICAgIGlmICggc3ZtLT52
bWNiX3N5bmNfc3RhdGUgPT0gdm1jYl9uZWVkc192bXNhdmUgKQo+IC0gICAgICAgICAgICBzdm1f
dm1zYXZlKHN2bS0+dm1jYik7Cj4gKyAgICAgICAgICAgIHN2bV92bXNhdmVfcGEoc3ZtLT52bWNi
X3BhKTsKPiAgCj4gICAgICAgICAgaWYgKCBzdm0tPnZtY2Jfc3luY19zdGF0ZSAhPSB2bWNiX25l
ZWRzX3ZtbG9hZCApCj4gICAgICAgICAgICAgIHN2bS0+dm1jYl9zeW5jX3N0YXRlID0gbmV3X3N0
YXRlOwo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm1kZWJ1Zy5jIGIveGVu
L2FyY2gveDg2L2h2bS9zdm0vc3ZtZGVidWcuYwo+IGluZGV4IGQzNWU0MDUuLjQyOTNkOGQgMTAw
NjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtZGVidWcuYwo+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9odm0vc3ZtL3N2bWRlYnVnLmMKPiBAQCAtMjksNiArMjksMTUgQEAgc3RhdGljIHZv
aWQgc3ZtX2R1bXBfc2VsKGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IHN0cnVjdCBzZWdtZW50X3Jl
Z2lzdGVyICpzKQo+ICAKPiAgdm9pZCBzdm1fdm1jYl9kdW1wKGNvbnN0IGNoYXIgKmZyb20sIGNv
bnN0IHN0cnVjdCB2bWNiX3N0cnVjdCAqdm1jYikKPiAgewo+ICsgICAgc3RydWN0IHZjcHUgKmN1
cnIgPSBjdXJyZW50Owo+ICsKPiArICAgIC8qCj4gKyAgICAgKiBJZiB3ZSBhcmUgZHVtcGluZyB0
aGUgVk1DQiBjdXJyZW50bHkgaW4gY29udGV4dCwgc29tZSBndWVzdCBzdGF0ZSBtYXkKPiArICAg
ICAqIHN0aWxsIGJlIGNhY2hlZCBpbiBoYXJkd2FyZS4gIFJldHJpZXZlIGl0Lgo+ICsgICAgICov
Cj4gKyAgICBpZiAoIHZtY2IgPT0gY3Vyci0+YXJjaC5odm0uc3ZtLnZtY2IgKQo+ICsgICAgICAg
IHN2bV9zeW5jX3ZtY2IoY3Vyciwgdm1jYl9pbl9zeW5jKTsKPiArCj4gICAgICBwcmludGsoIkR1
bXBpbmcgZ3Vlc3QncyBjdXJyZW50IHN0YXRlIGF0ICVzLi4uXG4iLCBmcm9tKTsKPiAgICAgIHBy
aW50aygiU2l6ZSBvZiBWTUNCID0gJXp1LCBwYWRkciA9ICUiUFJJcGFkZHIiLCB2YWRkciA9ICVw
XG4iLAo+ICAgICAgICAgICAgIHNpemVvZihzdHJ1Y3Qgdm1jYl9zdHJ1Y3QpLCB2aXJ0X3RvX21h
ZGRyKHZtY2IpLCB2bWNiKTsKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0v
c3ZtL3N2bWRlYnVnLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vc3ZtZGVidWcuaAo+
IGluZGV4IDY1OGNkZDMuLjMzMGMxZDkgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9odm0vc3ZtL3N2bWRlYnVnLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0v
c3ZtZGVidWcuaAo+IEBAIC0yMiw2ICsyMiw3IEBACj4gICNpbmNsdWRlIDxhc20vdHlwZXMuaD4K
PiAgI2luY2x1ZGUgPGFzbS9odm0vc3ZtL3ZtY2IuaD4KPiAgCj4gK3ZvaWQgc3ZtX3N5bmNfdm1j
YihzdHJ1Y3QgdmNwdSAqdiwgZW51bSB2bWNiX3N5bmNfc3RhdGUgbmV3X3N0YXRlKTsKPiAgdm9p
ZCBzdm1fdm1jYl9kdW1wKGNvbnN0IGNoYXIgKmZyb20sIGNvbnN0IHN0cnVjdCB2bWNiX3N0cnVj
dCAqdm1jYik7Cj4gIGJvb2wgc3ZtX3ZtY2JfaXN2YWxpZChjb25zdCBjaGFyICpmcm9tLCBjb25z
dCBzdHJ1Y3Qgdm1jYl9zdHJ1Y3QgKnZtY2IsCj4gICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCBzdHJ1Y3QgdmNwdSAqdiwgYm9vbCB2ZXJib3NlKTsKPiAtLSAKPiAyLjEuNAo+IAoKLS0gCkJy
aWFuIFdvb2RzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
