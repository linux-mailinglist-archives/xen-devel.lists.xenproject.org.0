Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 144B27DD7F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 16:10:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htBjY-0003Ke-RA; Thu, 01 Aug 2019 14:07:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LBr6=V5=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1htBjW-0003KZ-S7
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 14:07:06 +0000
X-Inumbo-ID: a42903c0-b465-11e9-8980-bc764e045a96
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::614])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a42903c0-b465-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 14:07:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=md7EES4y40fHjT/B4zVm0gDFPeOP2yohQgPBD2mY2RZUDa69EILmZfzWh1IS2u5jDRhyAYvVhkxKjBvyeVgQbSzYLk7xbul9REJwp8jYz8HrLhBbGpBpG+WooHNZCkPG9q22zVLWPszBcrs27TcxsKkz7YBk4kW8dmTlN2UPKIhY7gvknu1YMaMwg60WrLmonN+lydK53Z7vGNUvXJ5XWNGw9L27jypcpJRE/MFdJhI+ARSObglkqJ4etMeQfEc8tjwT4YrgRd16AfPtS7HazB82R/VYdPkDQYhvlM8a/4aZbKMnxfBC9lijFqdvHMGUgNwsIOvHET1qDmq3z0CySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqLJHEAjrGlQx/8vhdYWe4wAEZ3suzUx6Nm/FEXBhMI=;
 b=XJLzQzj2nwbakjiu4SY9JjzBpBsJQgpXiCoAnWXyclSWPcJ9jtbrfkMWiDBySRrBXeIqsOl4iGZN2eVqbWXsIsFiKG9MVMP03IAY7OWMUw5v591ABuWAClCpyq7f8aDVBb8TuQcyR9OVqNH/4vgpfgwNt5R8uJMFDsc46LVlF4L65868/laWXI1zgV+lSJv5/e4hwVNHZ3zfRxRAKsrCo6aeM2ML+L+NHoxhjmwuYvoQ2owCXvw6kPryTe+rS4Z9I/uUnHHK7L3brltCKH7PDBfzEcGTsCxWPTpgYePxfQ4plFnkIKlN+Jlv7cXUrdt1SzT06LeKZhXoswq0B9qkrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqLJHEAjrGlQx/8vhdYWe4wAEZ3suzUx6Nm/FEXBhMI=;
 b=f7Bupq10/s/eV7LdrtU/xtGwtm7ZS5MWCUEtfCd2ujG85NPzfisAoGF13QPVn/efH7UtazW7/JxVk0mZpI27ZFHgBm/LbSybrQsEON011pT5tm25PjlTjdS0K9RJUG4D45KbjLzlCp4J7JrGw/WK3LVGBDhmd86HYtFBolsbNdwLWqtfy4sRYRYPQIaiHEpT6Fo6HmR+MrIBYeY0yY8Q3gBDuGm08hKvirj3sxqnAd+g7LSS+aS/fUgRsrX5+NmiXCwrguqWhhFLAAqErugfukBELv8XLB/V4eci58xTRMKhn73ChCR28U+XK9SLCQkcOl1IBK+q4pXqNUTGYM1Fvw==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5602.eurprd03.prod.outlook.com (20.179.254.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Thu, 1 Aug 2019 14:07:03 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2115.005; Thu, 1 Aug 2019
 14:07:03 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v5 2/2] xen/arm: consolidate make_timer_node and
 make_timer_domU_node
Thread-Index: AQHVSGFtHm/XQtiLI0+V1CdTguQh+6bmTxUAgAACPoCAAAKyAA==
Date: Thu, 1 Aug 2019 14:07:03 +0000
Message-ID: <87y30dget5.fsf@epam.com>
References: <20190801120452.6814-1-viktor.mitin.19@gmail.com>
 <20190801120452.6814-3-viktor.mitin.19@gmail.com> <87zhktgfml.fsf@epam.com>
 <ffa8c4f2-8b49-b32a-8f4f-8931dead0c80@arm.com>
In-Reply-To: <ffa8c4f2-8b49-b32a-8f4f-8931dead0c80@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1f14076-2497-4472-9b7f-08d7168987a8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB5602; 
x-ms-traffictypediagnostic: AM0PR03MB5602:|AM0PR03MB5602:
x-microsoft-antispam-prvs: <AM0PR03MB56028EA23AB5883DFD1967BDE6DE0@AM0PR03MB5602.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(199004)(189003)(186003)(91956017)(76176011)(80792005)(2906002)(26005)(316002)(71200400001)(53936002)(6512007)(11346002)(256004)(6486002)(64756008)(54906003)(229853002)(6246003)(66946007)(102836004)(66446008)(6506007)(76116006)(446003)(6436002)(486006)(66556008)(66476007)(53546011)(55236004)(66066001)(476003)(81156014)(36756003)(478600001)(86362001)(81166006)(68736007)(8676002)(305945005)(2616005)(99286004)(6116002)(14454004)(3846002)(6916009)(7736002)(71190400001)(4326008)(5660300002)(25786009)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5602;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vSP9V/m2mXBklpljJkKidJmaZ7aTtCwPDGenyg4LxMJp6xbD+AcnnwICwQ8SyAXMUfXKMicrAbhESbUCca5aHR5n7BDgWHxYZcqYSdZL8jUXDQXkXJjBdhnu2myexrfnSxjHIL7uLIrYF8dtOQUikJWN5P+CfSUuClBYqHYCe4Q2avs6XNSzLAoo9f9x36aa23grstjABqLTRSdtAVK5PZfTLJX5tBDVtfVQJiwiHuM0ywwT0W/LlYeJoWz5PmDh7GVToovIjIqhSU7HS7zUo+VbV3bSBFCU+fqifYoOJzMj1V1Lv+7UzLdp7i74G35v+5vkCc4a/mIwjuYp/OUzkdyQ+AB0gHcBPLp+k1mXtA7w9NdzIx6+wA4rc3IU5iUQ0P5kBt7SQugIEBLX1CuoaYyQM4jdtmnzUnn2ed9sg8s=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f14076-2497-4472-9b7f-08d7168987a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 14:07:03.6920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5602
Subject: Re: [Xen-devel] [PATCH v5 2/2] xen/arm: consolidate make_timer_node
 and make_timer_domU_node
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Viktor Mitin <Viktor_Mitin@epam.com>, Viktor Mitin <viktor.mitin.19@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpLAo+Cj4gT24gMDEvMDgvMjAx
OSAxNDo0OSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Cj4+IFZpa3RvciBNaXRpbiB3cml0
ZXM6Cj4+Cj4+PiBGdW5jdGlvbnMgbWFrZV90aW1lcl9ub2RlIGFuZCBtYWtlX3RpbWVyX2RvbVVf
bm9kZSBhcmUgcXVpdGUgc2ltaWxhci4KPj4+IFNvIGl0IGlzIGJldHRlciB0byBjb25zb2xpZGF0
ZSB0aGVtIHRvIGF2b2lkIGRpc2NyZXBhbmN5Lgo+Pj4gVGhlIG1haW4gZGlmZmVyZW5jZSBiZXR3
ZWVuIHRoZSBmdW5jdGlvbnMgaXMgdGhlIHRpbWVyIGludGVycnVwdHMgdXNlZC4KPj4+Cj4+PiBL
ZWVwIHRoZSBkb21VIHZlcnNpb24gZm9yIHRoZSBjb21wYXRpYmxlIGFzIGl0IGlzIHNpbXBsZXIu
Cj4+PiBNZWFuIGRvIG5vdCBjb3B5IHBsYXRmb3JtJ3MgJ2NvbXBhdGlibGUnIHByb3BlcnR5IGlu
dG8gaHdkb20KPj4+IGRldmljZSB0cmVlLCBpbnN0ZWFkIHNldCBlaXRoZXIgYXJtLGFybXY3LXRp
bWVyIG9yIGFybSxhcm12OC10aW1lciwKPj4+IGRlcGVuZGluZyBvbiB0aGUgcGxhdGZvcm0gdHlw
ZS4KPj4gSXQgaXMgaGFyZCB0byBwYXJzZSB0aGUgbGFzdCBzZW50ZW5jZS4gV2hhdCBhYm91dCAi
S2VlcCB0aGUgZG9tVSB2ZXJzaW9uCj4+IGZvciB0aGUgY29tcGF0aWJsZSBhcyBpdCBpcyBzaW1w
bGVyOiBkbyBub3QgY29weSBwbGF0Zm9ybSdzCj4+ICdjb21wYXRpYmxlJyBwcm9wZXJ0eSBpbnRv
IGh3ZG9tIGRldmljZSB0cmVlLCBpbnN0ZWFkIHNldCBlaXRoZXIKPj4gYXJtLGFybXY3LXRpbWVy
IG9yIGFybSxhcm12OC10aW1lciwgZGVwZW5kaW5nIG9uIHRoZSBwbGF0Zm9ybSB0eXBlLiIgPwo+
Pgo+Pgo+Pj4gS2VlcCB0aGUgaHcgdmVyc2lvbiBmb3IgdGhlIGNsb2NrIGFzIGl0IGlzIHJlbGV2
YW50IGZvciB0aGUgYm90aCBjYXNlcy4KPj4+Cj4+PiBUaGUgbmV3IGZ1bmN0aW9uIGhhcyBjaGFu
Z2VkIHByb3RvdHlwZSBkdWUgdG8gZmR0X3Byb3BlcnR5X2ludGVycnVwdHMKPj4+ICAgIG1ha2Vf
dGltZXJfbm9kZShjb25zdCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvKQo+Pj4KPj4+IFN1Z2dl
c3RlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4+IFNpZ25lZC1v
ZmYtYnk6IFZpa3RvciBNaXRpbiA8dmlrdG9yX21pdGluQGVwYW0uY29tPgo+Pj4gLS0tCj4+PiB2
NCB1cGRhdGVzOgo+Pj4gICAgIHVwZGF0ZWQgIktlZXAgdGhlIGRvbVUgdmVyc2lvbiBmb3IgdGhl
IGNvbXBhdGlibGUgYXMgaXQgaXMgc2ltcGxlciIKPj4+Cj4+PiB2NSB1cGRhdGVzOgo+Pj4gICAg
ICAtIGNoYW5nZWQgJ2tlcHQnIHRvICdrZWVwJywgZXRjLgo+Pj4gICAgICAtIHJlbW92ZWQgZW1w
dHkgbGluZQo+Pj4gICAgICAtIHVwZGF0ZWQgaW5kZW50YXRpb24gb2YgcGFyYW1ldGVycyBpbiBm
dW5jdGlvbnMgY2FsbHMKPj4+ICAgICAgLSBmaXhlZCBOSVRzCj4+PiAgICAgIC0gdXBkYXRlZCBj
b21taXQgbWVzc2FnZQo+Pj4gLS0tCj4+PiAgIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8
IDEwNiArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+ICAgMSBmaWxlIGNo
YW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDY3IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMKPj4+IGluZGV4IGJjN2QxN2RkMmMuLjU4NTQyMTMwY2EgMTAwNjQ0Cj4+PiAtLS0gYS94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYwo+Pj4gQEAgLTk3MywxMCArOTczLDggQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV90
aW1lcl9ub2RlKGNvbnN0IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8pCj4+PiAgICAgICAgICAg
eyAvKiBzZW50aW5lbCAqLyB9LAo+Pj4gICAgICAgfTsKPj4+ICAgICAgIHN0cnVjdCBkdF9kZXZp
Y2Vfbm9kZSAqZGV2Owo+Pj4gLSAgICB1MzIgbGVuOwo+Pj4gLSAgICBjb25zdCB2b2lkICpjb21w
YXRpYmxlOwo+Pj4gICAgICAgaW50IHJlczsKPj4+IC0gICAgdW5zaWduZWQgaW50IGlycTsKPj4+
ICsgICAgdW5zaWduZWQgaW50IGlycVtNQVhfVElNRVJfUFBJXTsKPj4gQXMgSSBzYWlkIGluIHRo
ZSBwcmV2aW91cyB2ZXJzaW9uLCB5b3UgYXJlIHdhc3Rpbmcgc3RhY2sgc3BhY2UKPj4gdGhlcmUu
IEFsc28sIHRoaXMgaXMgbWlzbGVhZGluZy4gV2hlbiBJIHNlZSBhcnJheSBvZiA0IGl0ZW1zLCBJ
IGV4cGVjdAo+PiB0aGF0IGFsbCA0IGl0ZW1zIHdpbGwgYmUgdXNlZC4gQnV0IHlvdSBhcmUgdXNp
bmcgb25seSAzLCBzbyBpdCBsZWFkcyB0bwo+PiB0d28gY29uY2x1c2lvbnM6IGVpdGhlciB5b3Ug
bWFkZSBhIG1pc3Rha2UsIG9yIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0Cj4+IGl0IGhhcHBlbmlu
Zy4gRWl0aGVyIG9wdGlvbiBpcyBiYWQuCj4KPiA0IGJ5dGUgb24gYSBzdGFjayBvZiAxNktCLi4u
IHRoYXQncyBub3QgcmVhbGx5IGEgd2FzdGUgd29ydGggYW4KPiBhcmd1bWVudC4gVGhlIG1vcmUg
dGhlIHN0YWNrIGlzIHByZXR0eSBlbXB0eSBhcyB0aGlzIGlzIGJvb3QuIFNvIHllcywKPiB5b3Ug
d2lsbCBub3QgdXNlIHRoZSBsYXN0IGluZGV4IGJlY2F1c2UgeW91IGRvbid0IGV4cG9zZSBoeXBl
cnZpc29yCj4gdGltZXIgdG8gZ3Vlc3QgeWV0ISAoSW1hZ2luZSBuZXN0ZWQgdmlydCkuIEJ1dCBh
dCBsZWFzdCBpdCBhdm9pZHMKPiBoYXJkY29kaW5nIGEgbnVtYmVyIG9mIGluZGV4IGFuZCBtYXRj
aCB0aGUgZW51bS4KWWVzLCBidXQgdGhlbiBpdCBzaG91bGQgYmUgZG9jdW1lbnRlZCBhdCBsZWFz
dC4gQ29tbWVudCBhYm92ZSB3aWxsIGJlCmZpbmUuIEluIHRoaXMgY2FzZSB3ZSBhbHNvIGNhbiBk
ZWNsYXJlIGFuZCB1c2UgaW50cnNbXSBpbiB0aGUgc2FtZSB3YXkuCgotLSAKVm9sb2R5bXlyIEJh
YmNodWsgYXQgRVBBTQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
