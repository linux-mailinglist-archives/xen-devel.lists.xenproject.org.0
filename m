Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFB56EA9F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 20:25:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoXWC-0004Y6-9n; Fri, 19 Jul 2019 18:22:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AH7D=VQ=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hoXWA-0004Y1-Fa
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 18:22:06 +0000
X-Inumbo-ID: 1c325149-aa52-11e9-8980-bc764e045a96
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe4e::600])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1c325149-aa52-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 18:22:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATVa5hFnWTXpZG1i0ch42PNEiwJrE3WpIKu+xzor3mfK6b5AZjJGDDum7IlpKOfMHjdNhRNfnp8MFF3m/jNXragjPTqu8sj5+DNtk2o66wEzv+rvK9c4/KyhGYWXQDPEczkgVnapK2gbgKQYEbLu/OpD5B3yP0Ua/xGTlHYvKqNRCQM2fWRE8DGPRwxeT2A+x68vNQB3qgHIa+5FVlOELgMN7u1OnKju6oCYIuogzkES+QymX1Z3zLQe8eUaUbhnm1eYmAxK0NuEuxfbpFhJHmAm0lpWai0bB/c6ZFRBDnspg7LTBX5CTu+gJa4g+AO9jw7X98zAMaorS3D5rEYN/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAM7k1qtITnuaNm8cBvqvzejAvFwLNCNMw8AeuHVzcM=;
 b=hF5ExR7df7wjUvpoETC1oc63YDcmGMc8b9AqDupfWWB/yMPCGSSik9S55cWibto80vvc5tYBftMuiF5mhY7rA5/KDwoH6X4VmMTjWaB7suM/jqiUmQzD7EjZouB++503KyZU5k5jtjh/O8h2Trnpo4rtnX0G325/iR5q77wdxPREE2tdQF9M5e4sZzE0gSfpxsjKBahtQtOhZ5fpcKULDBjY1k6fm7xlqR4HT8xSWcQBpE09JyQTWJXVD4aVg8pUUO4bHN4Yez9GSIDn9ColhTWY/aY3yeALU46O1LXqakrauo5CDIVoEIe1dGJPap3VBslQNXXAAYY4lXh29H9Xxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAM7k1qtITnuaNm8cBvqvzejAvFwLNCNMw8AeuHVzcM=;
 b=u3gl8dkNpDNTqxVsUPVZMATD1tmDni6Lk4JTg7GK6RzdKYlPKvVDx72D4l+kqu+QZD1ISRWZ8BVGqYf446cmHnZ0O1V9Hw7+ROTlg5epPLOJFFEoyQ0CKRe10Cixq1JEE9ecshpP5Havqe8mLw6iWhhgC0jgmVNdoM/nQ3UeOMk=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB2617.namprd12.prod.outlook.com (20.176.116.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Fri, 19 Jul 2019 18:22:03 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc%7]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 18:22:03 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v3 01/14] AMD/IOMMU: free more memory when cleaning up
 after error
Thread-Index: AQHVO/SOpnsmBAT+PkeYlMzXJLveFabSRc6A
Date: Fri, 19 Jul 2019 18:22:03 +0000
Message-ID: <20190719182200.GA4496@amd.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <78aa4de3-f955-850f-9e1b-8711f2aa906f@suse.com>
In-Reply-To: <78aa4de3-f955-850f-9e1b-8711f2aa906f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DM5PR04CA0051.namprd04.prod.outlook.com
 (2603:10b6:3:ef::13) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b668f4f0-f66e-410a-eeb8-08d70c75ff81
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2617; 
x-ms-traffictypediagnostic: DM6PR12MB2617:
x-microsoft-antispam-prvs: <DM6PR12MB261719DD6AC035EE39DAB2FBE5CB0@DM6PR12MB2617.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(189003)(199004)(14454004)(256004)(14444005)(3846002)(316002)(54906003)(305945005)(66066001)(7736002)(66946007)(66476007)(66446008)(64756008)(66556008)(1076003)(5660300002)(99286004)(8936002)(36756003)(6116002)(68736007)(25786009)(52116002)(76176011)(4326008)(86362001)(33656002)(2906002)(53936002)(6436002)(6512007)(229853002)(478600001)(26005)(486006)(102836004)(386003)(6506007)(81166006)(81156014)(186003)(6246003)(6916009)(6486002)(71190400001)(11346002)(476003)(8676002)(71200400001)(2616005)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2617;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NLIn+zxpMnPkdIepAu/mzWu+OzoETd4FRMMcPfbYWfiouMVaxqJRgelj0Lw2/gaUZsY4QksD37+vXq8HxJBGAdK8o5RcgZRr2GqmH/8zWWXtFAOv85hw8MOm5qX3sJk1gTfPoHJfULTXQGC4H9yqgt8RONsNtRyqI282gVud4pn83WAzHTy8oNWtDjFugtUJvndIIeDTv5mTRJInJgBxXRG1e39Ai8IRKgBD1PN9Ufgjb2FnqP1S5PNOtjGJJ2mSa0j/WXs/4APQJryYoJrZ6gQV6nzPvdMRpXurFGnwNugvmZ7jaYuDS7f+Izcha9kD3WjRtMYcJTjjML9Ibl2CRJxdyWAsIlQ87BDQnP4fe2DqaroqXAQf0ptYPL8q/8LzGHZF/eDcz8dxkBHhW7QxBoTnpUmbG3ahzlOhUjEVbcU=
Content-ID: <6818EDE37F858D479C36B925C769EFC0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b668f4f0-f66e-410a-eeb8-08d70c75ff81
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 18:22:03.5046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2617
Subject: Re: [Xen-devel] [PATCH v3 01/14] AMD/IOMMU: free more memory when
 cleaning up after error
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woods, 
 Brian" <Brian.Woods@amd.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMDQ6MzU6MDhQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIGludGVycnVwdCByZW1hcHBpbmcgaW4tdXNlIGJpdG1hcHMgd2VyZSBsZWFrZWQg
aW4gYWxsIGNhc2VzLiBUaGUKPiByaW5nIGJ1ZmZlcnMgYW5kIHRoZSBtYXBwaW5nIG9mIHRoZSBN
TUlPIHNwYWNlIHdlcmUgbGVha2VkIGZvciBhbnkgSU9NTVUKPiB0aGF0IGhhZG4ndCBiZWVuIGVu
YWJsZWQgeWV0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCkFja2VkLWJ5OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KCj4gLS0t
Cj4gdjM6IE5ldy4KPiAKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVf
aW5pdC5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYwo+
IEBAIC0xMDcwLDEzICsxMDcwLDEyIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBhbWRfaW9tbXVfaW5p
dF9jbGVhbnUKPiAgICAgICB7Cj4gICAgICAgICAgIGxpc3RfZGVsKCZpb21tdS0+bGlzdCk7Cj4g
ICAgICAgICAgIGlmICggaW9tbXUtPmVuYWJsZWQgKQo+IC0gICAgICAgIHsKPiAgICAgICAgICAg
ICAgIGRpc2FibGVfaW9tbXUoaW9tbXUpOwo+IC0gICAgICAgICAgICBkZWFsbG9jYXRlX3Jpbmdf
YnVmZmVyKCZpb21tdS0+Y21kX2J1ZmZlcik7Cj4gLSAgICAgICAgICAgIGRlYWxsb2NhdGVfcmlu
Z19idWZmZXIoJmlvbW11LT5ldmVudF9sb2cpOwo+IC0gICAgICAgICAgICBkZWFsbG9jYXRlX3Jp
bmdfYnVmZmVyKCZpb21tdS0+cHByX2xvZyk7Cj4gLSAgICAgICAgICAgIHVubWFwX2lvbW11X21t
aW9fcmVnaW9uKGlvbW11KTsKPiAtICAgICAgICB9Cj4gKwo+ICsgICAgICAgIGRlYWxsb2NhdGVf
cmluZ19idWZmZXIoJmlvbW11LT5jbWRfYnVmZmVyKTsKPiArICAgICAgICBkZWFsbG9jYXRlX3Jp
bmdfYnVmZmVyKCZpb21tdS0+ZXZlbnRfbG9nKTsKPiArICAgICAgICBkZWFsbG9jYXRlX3Jpbmdf
YnVmZmVyKCZpb21tdS0+cHByX2xvZyk7Cj4gKyAgICAgICAgdW5tYXBfaW9tbXVfbW1pb19yZWdp
b24oaW9tbXUpOwo+ICAgICAgICAgICB4ZnJlZShpb21tdSk7Cj4gICAgICAgfQo+ICAgCj4gLS0t
IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYwo+ICsrKyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbnRyLmMKPiBAQCAtNjEwLDYgKzYxMCw4IEBA
IGludCBfX2luaXQgYW1kX2lvbW11X2ZyZWVfaW50cmVtYXBfdGFibGUKPiAgIHsKPiAgICAgICB2
b2lkICp0YiA9IGl2cnNfbWFwcGluZy0+aW50cmVtYXBfdGFibGU7Cj4gICAKPiArICAgIFhGUkVF
KGl2cnNfbWFwcGluZy0+aW50cmVtYXBfaW51c2UpOwo+ICsKPiAgICAgICBpZiAoIHRiICkKPiAg
ICAgICB7Cj4gICAgICAgICAgIF9fZnJlZV9hbWRfaW9tbXVfdGFibGVzKHRiLCBJTlRSRU1BUF9U
QUJMRV9PUkRFUik7Cj4gCgotLSAKQnJpYW4gV29vZHMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
