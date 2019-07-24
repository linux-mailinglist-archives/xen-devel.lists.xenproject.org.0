Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD0673A37
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 21:48:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqNCB-0008Lb-Fw; Wed, 24 Jul 2019 19:45:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z+U7=VV=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hqNCA-0008LS-6q
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 19:45:02 +0000
X-Inumbo-ID: 84cd5294-ae4b-11e9-baf2-fb0ac0bb9f7d
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (unknown
 [40.107.76.72]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84cd5294-ae4b-11e9-baf2-fb0ac0bb9f7d;
 Wed, 24 Jul 2019 19:44:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/VG1q0fm9QmVfV8foqSpXSrOPeRfW2YgfJzOItN6DRIp1b/F3S9x9o+D2JHhEhxV/krdlVdZlKR2+fnsPd6BM5M/JdgEMD0Nc87lZOMuzkkZ78K6o3vQNr6bCV7H6rYmjDKEiu0dzHlq7dZi5WD00stWLDxYEIqQnPslyg42eUBoS2aLnif9SQxpksqARZrYxBSbqr34t5kP7iYepv/xYTQK2OKfgaZS+LlDi9WbQtzOLE6vGNkcXhdTwmotjYa8s1HO2AcM5Mr0ceLV4Xv+WcrIVCC2mU1Q/DkwMKWYFFQxJRWZM4ZL9ZIONf2WEe+dLpN7U0qdsOF9eFGmjHQ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XuCKmVkYCjazp5i6sXrx03YZ3xnGtSGtMtlx0I9CjrI=;
 b=fjmx4jXc3TWPsshHCRZSHa5nmcUp0wnfIJTdxAM2ci+MXRPxYOC7wNn6EcPO4dKCX82q4C+aqMIpzlWkzANhCES1jJuGTRpuWU1CLm0oBpaZaaObZQemuRMLDuHac3qLWMrmq+J3nawCuOwjc13E7wAvlJ9gMeTo6i0DWBbggYTtvzHIS1dQZlZADYGoNI/co6tSApo7N3DJPnhF1QJCWf8cnkZYDH692SmyEW9vpImv0kqONS/7QCjyPhwURtNfjlBlCRTQAaeHyaSh3abQc44TsagDEZ4s6qrNfmHG5zSupLCCikm0OlFNLeWpz2CqKrGLrYF9tft1Wk9o0VLM3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XuCKmVkYCjazp5i6sXrx03YZ3xnGtSGtMtlx0I9CjrI=;
 b=HexNo1WOeKbHW6p4Y1b55HpOxCBakYDmEutmggfzQ3ZVi06GL77K1Dg5SGUCPIseZEsq1vonfGGGGsX5OxmyR/ina4L6gcknwXIpE6/arQznfQ2HgA0h7gOZtxG93KhRV+KEg7ciYvVlijhV2SJSdHyyUwE8pSiVOJGmh272QlI=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB2969.namprd12.prod.outlook.com (20.178.29.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 19:44:55 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc%7]) with mapi id 15.20.2115.005; Wed, 24 Jul 2019
 19:44:55 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Thread-Topic: [PATCH v3 2/2] passthrough/amd: Clean iommu_hap_pt_share enabled
 code
Thread-Index: AQHVO84tjhMoWUQFXEOxKeGsnQSbn6baOOgA
Date: Wed, 24 Jul 2019 19:44:54 +0000
Message-ID: <20190724194451.GB25253@amd.com>
References: <20190716120056.1723-1-aisaila@bitdefender.com>
 <20190716120056.1723-2-aisaila@bitdefender.com>
In-Reply-To: <20190716120056.1723-2-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN1PR12CA0095.namprd12.prod.outlook.com
 (2603:10b6:802:21::30) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76d48af7-f523-4aad-4bc2-08d7106f66ba
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2969; 
x-ms-traffictypediagnostic: DM6PR12MB2969:
x-microsoft-antispam-prvs: <DM6PR12MB29691A7F2F77E1F49D93DDF8E5C60@DM6PR12MB2969.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:215;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(199004)(189003)(8676002)(256004)(52116002)(54906003)(316002)(86362001)(6512007)(3846002)(14454004)(53936002)(4326008)(6246003)(36756003)(5660300002)(66556008)(64756008)(66476007)(25786009)(66946007)(68736007)(7736002)(6116002)(66446008)(14444005)(486006)(6486002)(305945005)(33656002)(81166006)(1076003)(2906002)(229853002)(6916009)(76176011)(11346002)(478600001)(2616005)(476003)(81156014)(8936002)(99286004)(186003)(71190400001)(71200400001)(102836004)(26005)(66066001)(6436002)(446003)(386003)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2969;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2UMNSDUmsT6OfT69qJhYA0OsuP60kz3Mf4CucjEPgshKbI2iDmP+WHrOmPMWPqT3mzTUkm3OLph8lLh83sYgHj3vFLjpjPIeDN/nfmR18inORko+sqxyYCIOEdFKNRgU9sDAkQm8QLW/2klkewTE13ff03od9/4rRi8BigswZRmo0Jubmrql/QOprTGd0kpNvwoTHARrQ7JTcbM/fJXHwig+u0n52m886VuJ/Xd2VZGKs9Rn/lylhw4q6phVf4oNF7CWQn/m9D+IhT/36DUymdldwaubKLvFrGUr7ewZS4Nm7yUij8qhyeUrXKuP/DnWAF3ndSbttScZG+pUuOmakN0K4kPrkx0rTLJYeAVbTROFzKM3KleaEAsDp//qE4/4SzEuVVpi/r+j90IEbXcC48B6AXtu5NWJR3ky3B4QEyc=
Content-ID: <7A275ED6D0313345AAEFA9C56006A11C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d48af7-f523-4aad-4bc2-08d7106f66ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 19:44:54.9142 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2969
Subject: Re: [Xen-devel] [PATCH v3 2/2] passthrough/amd: Clean
 iommu_hap_pt_share enabled code
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
Cc: "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>,
 "wl@xen.org" <wl@xen.org>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woods,
 Brian" <Brian.Woods@amd.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMTI6MDE6MTVQTSArMDAwMCwgQWxleGFuZHJ1IFN0ZWZh
biBJU0FJTEEgd3JvdGU6Cj4gQXQgdGhpcyBtb21lbnQgSU9NTVUgcHQgc2hhcmluZyBpcyBkaXNh
YmxlZCBieSBjb21taXQgWzFdLgo+IAo+IFRoaXMgcGF0Y2ggY2xlYW5zIHRoZSB1bnJlYWNoYWJs
ZSBjb2RlIGdhcmRlZCBieSBpb21tdV9oYXBfcHRfc2hhcmUuCj4gCj4gWzFdIGMyYmEzZGIzMWVm
MmQ5ZjFlNDBlN2I2YzE2Y2YzYmUzZDY3MWQ1NTUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5k
cnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KCkFja2VkLWJ5OiBCcmlhbiBXb29k
cyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KCj4gLS0tCj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FtZC9pb21tdV9tYXAuYyAgICAgICB8IDI4IC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYyAgIHwgIDQgLS0tCj4gIHhlbi9p
bmNsdWRlL2FzbS14ODYvaHZtL3N2bS9hbWQtaW9tbXUtcHJvdG8uaCB8ICAzIC0tCj4gIDMgZmls
ZXMgY2hhbmdlZCwgMzUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9tYXAuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Ft
ZC9pb21tdV9tYXAuYwo+IGluZGV4IGNiZjAwZTllNzIuLjkwY2M3MDc1YzIgMTAwNjQ0Cj4gLS0t
IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X21hcC5jCj4gKysrIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X21hcC5jCj4gQEAgLTM2NCw5ICszNjQsNiBAQCBp
bnQgYW1kX2lvbW11X21hcF9wYWdlKHN0cnVjdCBkb21haW4gKmQsIGRmbl90IGRmbiwgbWZuX3Qg
bWZuLAo+ICAgICAgaW50IHJjOwo+ICAgICAgdW5zaWduZWQgbG9uZyBwdF9tZm5bN107Cj4gIAo+
IC0gICAgaWYgKCBpb21tdV91c2VfaGFwX3B0KGQpICkKPiAtICAgICAgICByZXR1cm4gMDsKPiAt
Cj4gICAgICBtZW1zZXQocHRfbWZuLCAwLCBzaXplb2YocHRfbWZuKSk7Cj4gIAo+ICAgICAgc3Bp
bl9sb2NrKCZoZC0+YXJjaC5tYXBwaW5nX2xvY2spOwo+IEBAIC00MjAsOSArNDE3LDYgQEAgaW50
IGFtZF9pb21tdV91bm1hcF9wYWdlKHN0cnVjdCBkb21haW4gKmQsIGRmbl90IGRmbiwKPiAgICAg
IHVuc2lnbmVkIGxvbmcgcHRfbWZuWzddOwo+ICAgICAgc3RydWN0IGRvbWFpbl9pb21tdSAqaGQg
PSBkb21faW9tbXUoZCk7Cj4gIAo+IC0gICAgaWYgKCBpb21tdV91c2VfaGFwX3B0KGQpICkKPiAt
ICAgICAgICByZXR1cm4gMDsKPiAtCj4gICAgICBtZW1zZXQocHRfbWZuLCAwLCBzaXplb2YocHRf
bWZuKSk7Cj4gIAo+ICAgICAgc3Bpbl9sb2NrKCZoZC0+YXJjaC5tYXBwaW5nX2xvY2spOwo+IEBA
IC01NTgsMjggKzU1Miw2IEBAIGludCBhbWRfaW9tbXVfcmVzZXJ2ZV9kb21haW5fdW5pdHlfbWFw
KHN0cnVjdCBkb21haW4gKmRvbWFpbiwKPiAgICAgIHJldHVybiBydDsKPiAgfQo+ICAKPiAtLyog
U2hhcmUgcDJtIHRhYmxlIHdpdGggaW9tbXUuICovCj4gLXZvaWQgYW1kX2lvbW11X3NoYXJlX3Ay
bShzdHJ1Y3QgZG9tYWluICpkKQo+IC17Cj4gLSAgICBzdHJ1Y3QgZG9tYWluX2lvbW11ICpoZCA9
IGRvbV9pb21tdShkKTsKPiAtICAgIHN0cnVjdCBwYWdlX2luZm8gKnAybV90YWJsZTsKPiAtICAg
IG1mbl90IHBnZF9tZm47Cj4gLQo+IC0gICAgcGdkX21mbiA9IHBhZ2V0YWJsZV9nZXRfbWZuKHAy
bV9nZXRfcGFnZXRhYmxlKHAybV9nZXRfaG9zdHAybShkKSkpOwo+IC0gICAgcDJtX3RhYmxlID0g
bWZuX3RvX3BhZ2UocGdkX21mbik7Cj4gLQo+IC0gICAgaWYgKCBoZC0+YXJjaC5yb290X3RhYmxl
ICE9IHAybV90YWJsZSApCj4gLSAgICB7Cj4gLSAgICAgICAgZnJlZV9hbWRfaW9tbXVfcGd0YWJs
ZShoZC0+YXJjaC5yb290X3RhYmxlKTsKPiAtICAgICAgICBoZC0+YXJjaC5yb290X3RhYmxlID0g
cDJtX3RhYmxlOwo+IC0KPiAtICAgICAgICAvKiBXaGVuIHNoYXJpbmcgcDJtIHdpdGggaW9tbXUs
IHBhZ2luZyBtb2RlID0gNCAqLwo+IC0gICAgICAgIGhkLT5hcmNoLnBhZ2luZ19tb2RlID0gNDsK
PiAtICAgICAgICBBTURfSU9NTVVfREVCVUcoIlNoYXJlIHAybSB0YWJsZSB3aXRoIGlvbW11OiBw
Mm0gdGFibGUgPSAlI2x4XG4iLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICBtZm5feChwZ2Rf
bWZuKSk7Cj4gLSAgICB9Cj4gLX0KPiAtCj4gIC8qCj4gICAqIExvY2FsIHZhcmlhYmxlczoKPiAg
ICogbW9kZTogQwo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNp
X2FtZF9pb21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUu
Ywo+IGluZGV4IDRhZmJjZDE2MDkuLmJlMDc2MjEwYjYgMTAwNjQ0Cj4gLS0tIGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMKPiBAQCAtMzk2LDkgKzM5Niw2IEBAIHN0YXRp
YyB2b2lkIGRlYWxsb2NhdGVfaW9tbXVfcGFnZV90YWJsZXMoc3RydWN0IGRvbWFpbiAqZCkKPiAg
ewo+ICAgICAgc3RydWN0IGRvbWFpbl9pb21tdSAqaGQgPSBkb21faW9tbXUoZCk7Cj4gIAo+IC0g
ICAgaWYgKCBpb21tdV91c2VfaGFwX3B0KGQpICkKPiAtICAgICAgICByZXR1cm47Cj4gLQo+ICAg
ICAgc3Bpbl9sb2NrKCZoZC0+YXJjaC5tYXBwaW5nX2xvY2spOwo+ICAgICAgaWYgKCBoZC0+YXJj
aC5yb290X3RhYmxlICkKPiAgICAgIHsKPiBAQCAtNTY2LDcgKzU2Myw2IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgaW9tbXVfb3BzIF9faW5pdGNvbnN0cmVsIF9pb21tdV9vcHMgPSB7Cj4gICAgICAu
c2V0dXBfaHBldF9tc2kgPSBhbWRfc2V0dXBfaHBldF9tc2ksCj4gICAgICAuc3VzcGVuZCA9IGFt
ZF9pb21tdV9zdXNwZW5kLAo+ICAgICAgLnJlc3VtZSA9IGFtZF9pb21tdV9yZXN1bWUsCj4gLSAg
ICAuc2hhcmVfcDJtID0gYW1kX2lvbW11X3NoYXJlX3AybSwKPiAgICAgIC5jcmFzaF9zaHV0ZG93
biA9IGFtZF9pb21tdV9jcmFzaF9zaHV0ZG93biwKPiAgICAgIC5kdW1wX3AybV90YWJsZSA9IGFt
ZF9kdW1wX3AybV90YWJsZSwKPiAgfTsKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9odm0vc3ZtL2FtZC1pb21tdS1wcm90by5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3Zt
L2FtZC1pb21tdS1wcm90by5oCj4gaW5kZXggZTBkNWQyMzk3OC4uYjgzMmY1NjRhNyAxMDA2NDQK
PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vYW1kLWlvbW11LXByb3RvLmgKPiAr
KysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vYW1kLWlvbW11LXByb3RvLmgKPiBAQCAt
NjYsOSArNjYsNiBAQCBpbnQgX19tdXN0X2NoZWNrIGFtZF9pb21tdV9mbHVzaF9pb3RsYl9wYWdl
cyhzdHJ1Y3QgZG9tYWluICpkLCBkZm5fdCBkZm4sCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbHVzaF9mbGFncyk7Cj4gIGludCBf
X211c3RfY2hlY2sgYW1kX2lvbW11X2ZsdXNoX2lvdGxiX2FsbChzdHJ1Y3QgZG9tYWluICpkKTsK
PiAgCj4gLS8qIFNoYXJlIHAybSB0YWJsZSB3aXRoIGlvbW11ICovCj4gLXZvaWQgYW1kX2lvbW11
X3NoYXJlX3AybShzdHJ1Y3QgZG9tYWluICpkKTsKPiAtCj4gIC8qIGRldmljZSB0YWJsZSBmdW5j
dGlvbnMgKi8KPiAgaW50IGdldF9kbWFfcmVxdWVzdG9yX2lkKHVpbnQxNl90IHNlZywgdWludDE2
X3QgYmRmKTsKPiAgdm9pZCBhbWRfaW9tbXVfc2V0X2ludHJlbWFwX3RhYmxlKHN0cnVjdCBhbWRf
aW9tbXVfZHRlICpkdGUsCj4gLS0gCj4gMi4xNy4xCj4gCgotLSAKQnJpYW4gV29vZHMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
