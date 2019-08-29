Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C41A228D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 19:40:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3OLy-0001S8-M1; Thu, 29 Aug 2019 17:36:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fcYQ=WZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i3OLx-0001S3-Jt
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 17:36:57 +0000
X-Inumbo-ID: 9680157c-ca83-11e9-951b-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::61f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9680157c-ca83-11e9-951b-bc764e2007e4;
 Thu, 29 Aug 2019 17:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Do3N60GmlI3jwmi2sy2VksTcup1NiCKsoCiNx2UQGPU=;
 b=lREz7WfNwpqQEkxb9n+WPPSUD3EoKtqETz6xkmfl40xkeYjbHh3kckNnO1FfFm4/T6qKI/d4ffoLZDo9D1BEb4oz0SzbsNFr7fBCMTRvLxdy50fUHZuE95yAnsOWVvkJLfCT7KF+PPw81OHFkqKz7gi4EelxwRCIPCNVzpYSkQM=
Received: from VI1PR0801CA0068.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::12) by HE1PR0801MB1850.eurprd08.prod.outlook.com
 (2603:10a6:3:86::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Thu, 29 Aug
 2019 17:36:50 +0000
Received: from DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::204) by VI1PR0801CA0068.outlook.office365.com
 (2603:10a6:800:7d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.19 via Frontend
 Transport; Thu, 29 Aug 2019 17:36:49 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com; lists.xenproject.org; dmarc=temperror
 action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT038.mail.protection.outlook.com (10.152.21.84) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 17:36:48 +0000
Received: ("Tessian outbound aa6cb5c8f945:v27");
 Thu, 29 Aug 2019 17:36:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 608f31db2882ec72
X-CR-MTA-TID: 64aa7808
Received: from db8144acc58e.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1033CE49-1A90-4EA2-BD91-00904F8B1D50.1; 
 Thu, 29 Aug 2019 17:36:35 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id db8144acc58e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Aug 2019 17:36:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+OYmmqJDmG38Kpl6ZvPhiBNSQdTGBh2R+bFFFs8jTeaJEGOcBH5MW7YUVrMJboGKLKq9AY+p+jV3Bu3sjmP/x2RxQpoPqy5sI+cVYzvsRXEb2vxgxE9Zdvlje8jT0XIrycOIxxIelmjmfryZktLfgdayqhEXx6gW3UBeko6JfxLFRSqITHnmAnJ3rOtwZPpETkCMbLg6W673UA4m520ghDY+YdamHjUP9Jd4F8zU96iOkrqMXbkcHdphvxMNlESOyR5bD1to3epDjrO8vXCgqrR70FCYN5Bxyn1wqTcYndIqAQ1gC/qz6WsnS0l2zUm6mCxNsPDWgWU30JM2aKmmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Do3N60GmlI3jwmi2sy2VksTcup1NiCKsoCiNx2UQGPU=;
 b=eM8voCWrIJGPvcCI88mGDSns5PO2LIcnWolc3LWyJ3obpE1s2XSTMInYGEuSwurg6WttmTbDQtNCYqJrYWd5lJtdBKJ/8W3atBjbhvWNMmwRrMROS89Xl5VocoetI95lyCUmyEc2H2ZpqMyMdrPJwJv1DaUJVX4iaIMuv8JdaNJJy2g297fZJjx+Xauyjbr/oLOBlOlKFmBJydYU1Fdita+QWIDesINMO4hvpLrk45APqwwUC/pLzd7W9hFZ1A++E1IGs1XZaeOulviAdqY4cJdEw1x30/FGl5jkTnyHtQZhT8yZTG0a+BJ+dpF2rcLg0gJFXe23rZQSpAfFRpUXzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Do3N60GmlI3jwmi2sy2VksTcup1NiCKsoCiNx2UQGPU=;
 b=lREz7WfNwpqQEkxb9n+WPPSUD3EoKtqETz6xkmfl40xkeYjbHh3kckNnO1FfFm4/T6qKI/d4ffoLZDo9D1BEb4oz0SzbsNFr7fBCMTRvLxdy50fUHZuE95yAnsOWVvkJLfCT7KF+PPw81OHFkqKz7gi4EelxwRCIPCNVzpYSkQM=
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com (10.175.20.10) by
 VI1PR0802MB2381.eurprd08.prod.outlook.com (10.172.12.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Thu, 29 Aug 2019 17:36:32 +0000
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::a954:a45a:ed8e:75d2]) by VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::a954:a45a:ed8e:75d2%7]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 17:36:31 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v4 1/2] xen: Switch parameter in get_page_from_gfn to use
 typesafe gfn
Thread-Index: AQHVVpozFci0Qdq7TU6cBizMDmPrrKcSUx4AgAAgPgA=
Date: Thu, 29 Aug 2019 17:36:31 +0000
Message-ID: <42f90c15-0506-4853-5fd1-8abb0aaf6a11@arm.com>
References: <20190819142651.11058-1-julien.grall@arm.com>
 <20190819142651.11058-2-julien.grall@arm.com>
 <b6a7932f-69c3-334b-52d9-efbeb441156b@suse.com>
In-Reply-To: <b6a7932f-69c3-334b-52d9-efbeb441156b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0117.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::33) To VI1PR0802MB2431.eurprd08.prod.outlook.com
 (2603:10a6:800:af::10)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2a01:cb08:86b1:6600:a495:1709:d311:c9e8]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e4ded29a-5947-425b-9a24-08d72ca77800
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR0802MB2381; 
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2381:|HE1PR0801MB1850:
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
X-Microsoft-Antispam-PRVS: <HE1PR0801MB18506F3A96998A87A804B7D580A20@HE1PR0801MB1850.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0144B30E41
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(52314003)(199004)(189003)(25786009)(14454004)(76176011)(52116002)(6506007)(478600001)(54906003)(53546011)(66476007)(66556008)(66446008)(64756008)(66946007)(4326008)(386003)(102836004)(6116002)(99286004)(5660300002)(46003)(53936002)(11346002)(2906002)(8676002)(229853002)(36756003)(6246003)(305945005)(2616005)(316002)(486006)(6486002)(6436002)(186003)(7736002)(476003)(86362001)(8936002)(44832011)(31686004)(71200400001)(71190400001)(6512007)(6916009)(256004)(14444005)(446003)(31696002)(81156014)(81166006)(7416002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2381;
 H:VI1PR0802MB2431.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: VfSprU13bbxw6+Kl7ryBfJe+/XsfEVuqUHrr7IEmqUufamO1IuBcM+X2OADNmFmGoIYtBmFENnBWfbDJhNpIdPpNVk3LuD0vTivZJbIHqZMYtuuQXIqVfEIFH2DtrOtMwAuSn+xRve7FqfouMiZlHr+dfXzHzj5Qgq0PBqZSBbJH7+vRm46Gh7WYwvczetrKyXHhlUwntgrtzy0atfooul/86mKVEKSQ4swq1979b4+7HSk7LBHT6cdAj8RLwo8Gt2LFMCqTdPmARnfaYPCP8/K7mvh++yYby6btnBnAlnDfNfnimOO4RXO5/4YlX2VlyIwpjF1Qb6syO4EfPGuNyak7hKsjPBUSerVUHSsibWjBfRhvdRMrICFvVkNL0zC7YAc44OlpB96XdBZWk6wfxSJVxO4/PhxmqlayMskFmME=
x-ms-exchange-transport-forked: True
Content-ID: <AAE5B80E9566784FAFA23C2D50BCBD96@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2381
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(396003)(136003)(39860400002)(376002)(346002)(2980300002)(199004)(189003)(52314003)(47776003)(26005)(6506007)(336012)(386003)(53546011)(478600001)(186003)(6116002)(486006)(102836004)(26826003)(36756003)(2616005)(25786009)(50466002)(5660300002)(11346002)(436003)(316002)(2486003)(8676002)(81166006)(23676004)(63350400001)(81156014)(76130400001)(126002)(63370400001)(8936002)(54906003)(99286004)(6512007)(14444005)(70206006)(70586007)(6246003)(2906002)(76176011)(14454004)(6486002)(305945005)(22756006)(31696002)(446003)(229853002)(356004)(6862004)(476003)(31686004)(4326008)(86362001)(7736002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0801MB1850;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4c61202c-590b-461b-2d44-08d72ca76e03
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:HE1PR0801MB1850; 
NoDisclaimer: True
X-Forefront-PRVS: 0144B30E41
X-Microsoft-Antispam-Message-Info: fFAdchP45E85NoC3KNwPrvs0lwjyJtnRyQXRX5CMhbuqV01ZVzPFrjx+xaeujWHYBEplEwCSevBfQBYS3UHvi1PSsWpu+HW8i6MqNv53IgrmqJIxfdXBGnFsuSc0tABXb9AD9cWjctdPPybwbFrX09T2sDC4hn/eP3oQA2WTUpm/kzVWoi8L8qN1YcU9PLHBDIv3w+3HFOcUG2E3lx2jAC6KjE6p9JXrmK0tfoCEd/BWv8sn6UzzPgOC/WSvEinKDb2J6mFdnbT08LofWVIte7YauY4QcBpOcmj+zgIiuV5qXDNBYfR304dIMADkWEe+NALlVGHsTr4G3CeK2Vjdw2Cjkt2gv5Da828v825Zd1jU5uDti1BxJmhhxVG4pk1YqQ7D5GY1XlN+vYO+8gYHdv9pbIrJtvEfcJa8zHqvpFk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 17:36:48.0128 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ded29a-5947-425b-9a24-08d72ca77800
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1850
Subject: Re: [Xen-devel] [PATCH v4 1/2] xen: Switch parameter in
 get_page_from_gfn to use typesafe gfn
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Paul Durrant <paul.durrant@citrix.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDI5LzA4LzIwMTkgMTc6NDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxOS4w
OC4yMDE5IDE2OjI2LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBObyBmdW5jdGlvbmFsIGNoYW5n
ZSBpbnRlbmRlZC4NCj4+DQo+PiBPbmx5IHJlYXNvbmFibGUgY2xlYW4tdXBzIGFyZSBkb25lIGlu
IHRoaXMgcGF0Y2guIFRoZSByZXN0IHdpbGwgdXNlIF9nZm4NCj4+IGZvciB0aGUgdGltZSBiZWlu
Zy4NCj4+DQo+PiBUaGUgY29kZSBpbiBnZXRfcGFnZV9mcm9tX2dmbiBpcyBzbGlnaHRseSByZXdv
cmtlZCB0byBhbHNvIGhhbmRsZSBhIGJhZA0KPj4gYmVoYXZpb3IgYmVjYXVzZSBpdCBpcyBub3Qg
c2FmZSB0byB1c2UgbWZuX3RvX3BhZ2UoLi4uKSBiZWNhdXNlDQo+PiBtZm5fdmFsaWQoLi4uKSBz
dWNjZWVkcy4NCj4gDQo+IEkgZ3Vlc3MgdGhlIDJuZCAiYmVjYXVzZSIgaXMgbWVhbnQgdG8gYmUg
ImJlZm9yZSIsIGJ1dCBldmVuIHRoZW4gSQ0KPiBkb24ndCB0aGluayBJIGNhbiBlYXNpbHkgYWdy
ZWU6IG1mbl90b19wYWdlKCkgaXMganVzdCBjYWxjdWxhdGlvbnMsDQo+IG5vIGRlcmVmZXJlbmNl
Lg0KDQpSZWdhcmRsZXNzIHRoZSBzL2JlY2F1c2UvYmVmb3JlLy4gRG8geW91IGRpc2FncmVlIG9u
IHRoZSB3b3JkaW5nIG9yIHRoZSANCmNoYW5nZT8gSWYgdGhlIGZvcm1lciwgSSBqdXN0IHBhcmFw
aHJhc2VkIHdoYXQgQW5kcmV3IHdyb3RlIGluIHRoZSANCnByZXZpb3VzIHZlcnNpb246DQoNCiJU
aGlzIHVuZm9ydHVuYXRlbHkgcHJvcGFnYXRlcyBzb21lIGJhZCBiZWhhdmlvdXIsIGJlY2F1c2Ug
aXQgaXMgbm90IA0Kc2FmZSB0byB1c2UgbWZuX3RvX3BhZ2UobWZuKTsgYmVmb3JlIG1mbl92YWxp
ZChtZm4pIHN1Y2NlZWRzLiAgKEluIA0KcHJhY3RpY2UgaXQgd29ya3MgYmVjYXVzZSBtZm5fdG9f
cGFnZSgpIGlzIGp1c3QgcG9pbnRlciBhcml0aG1ldGljLikiDQoNClRoaXMgaXMgeDg2IGNvZGUs
IHNvIHBsZWFzZSBhZ3JlZSB3aXRoIEFuZHJldyBvbiB0aGUgYXBwcm9hY2gvd29yZGluZy4NCg0K
PiANCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tYWluLmMNCj4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9odm0vZG9tYWluLmMNCj4+IEBAIC0yOTYsOCArMjk2LDEwIEBAIGludCBhcmNoX3NldF9p
bmZvX2h2bV9ndWVzdChzdHJ1Y3QgdmNwdSAqdiwgY29uc3QgdmNwdV9odm1fY29udGV4dF90ICpj
dHgpDQo+PiAgICAgICBpZiAoIGh2bV9wYWdpbmdfZW5hYmxlZCh2KSAmJiAhcGFnaW5nX21vZGVf
aGFwKHYtPmRvbWFpbikgKQ0KPj4gICAgICAgew0KPj4gICAgICAgICAgIC8qIFNoYWRvdy1tb2Rl
IENSMyBjaGFuZ2UuIENoZWNrIFBEQlIgYW5kIHVwZGF0ZSByZWZjb3VudHMuICovDQo+PiAtICAg
ICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlID0gZ2V0X3BhZ2VfZnJvbV9nZm4odi0+ZG9tYWlu
LA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHYtPmFyY2guaHZtLmd1ZXN0
X2NyWzNdID4+IFBBR0VfU0hJRlQsDQo+PiArICAgICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdl
Ow0KPj4gKw0KPj4gKyAgICAgICAgcGFnZSA9IGdldF9wYWdlX2Zyb21fZ2ZuKHYtPmRvbWFpbiwN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnYWRkcl90b19nZm4odi0+YXJj
aC5odm0uZ3Vlc3RfY3JbM10pLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBOVUxMLCBQMk1fQUxMT0MpOw0KPiANCj4gSWlyYyBJJ3ZlIHNhaWQgc28gYmVmb3JlOiBJIGNv
bnNpZGVyIHVzZSBvZiBnYWRkcl90b19nZm4oKSBoZXJlIG1vcmUNCj4gbWlzbGVhZGluZyB0aGFu
IGEgcGxhaW4gc2hpZnQgYnkgUEFHRV9TSElGVC4gTmVpdGhlciBpcyByZWFsbHkgY29ycmVjdCwN
Cj4gYnV0IGluIG5vIGV2ZW50IGRvZXMgQ1IzIGFzIGEgd2hvbGUgaG9sZCBhbiBhZGRyZXNzLiAo
U2FtZSBlbHNld2hlcmUNCj4gdGhlbiwgYW5kIHNhZGx5IGluIHF1aXRlIGEgZmV3IHBsYWNlcy4p
DQoNCldlbGwsIHRoaXMgY29kZSBoYXMgbm90IGNoYW5nZWQgc2luY2UgdjMgYW5kIHlvdSBhY2tl
ZCBpdC4uLiBJIG9ubHkgDQpkcm9wcGVkIHRoZSBhY2sgaGVyZSBiZWNhdXNlIHRoZSBwcmV2aW91
cyB2ZXJzaW9uIHdhcyBzZW50IDkgbW9udGhzIGFnby4gDQpJIGFsc28gY2FuJ3Qgc2VlIHN1Y2gg
Y29tbWVudCBtYWRlIG9uIGFueSB2ZXJzaW9uIG9mIHRoaXMgc2VyaWVzLg0KDQpBbnl3YXksIEkg
YW0gbW9yZSB0aGFuIGhhcHB5IHRvIHN3aXRjaCB0byBfZ2ZuKCh2LT5hcmNoLmh2bS5ndWVzdF9j
clszXSANCiA+PiBQQUdFX1NISUZUKSkgaWYgeW91IHByZWZlciBpdC4NCg0KPiANCj4+IC0tLSBh
L3hlbi9jb21tb24vZXZlbnRfZmlmby5jDQo+PiArKysgYi94ZW4vY29tbW9uL2V2ZW50X2ZpZm8u
Yw0KPj4gQEAgLTM2MSw3ICszNjEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGV2dGNobl9wb3J0
X29wcyBldnRjaG5fcG9ydF9vcHNfZmlmbyA9DQo+PiAgICAgICAucHJpbnRfc3RhdGUgICA9IGV2
dGNobl9maWZvX3ByaW50X3N0YXRlLA0KPj4gICB9Ow0KPj4gICANCj4+IC1zdGF0aWMgaW50IG1h
cF9ndWVzdF9wYWdlKHN0cnVjdCBkb21haW4gKmQsIHVpbnQ2NF90IGdmbiwgdm9pZCAqKnZpcnQp
DQo+PiArc3RhdGljIGludCBtYXBfZ3Vlc3RfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBn
Zm4sIHZvaWQgKip2aXJ0KQ0KPj4gICB7DQo+PiAgICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwOw0K
Pj4gICANCj4+IEBAIC00MjIsNyArNDIyLDcgQEAgc3RhdGljIGludCBzZXR1cF9jb250cm9sX2Js
b2NrKHN0cnVjdCB2Y3B1ICp2KQ0KPj4gICAgICAgcmV0dXJuIDA7DQo+PiAgIH0NCj4+ICAgDQo+
PiAtc3RhdGljIGludCBtYXBfY29udHJvbF9ibG9jayhzdHJ1Y3QgdmNwdSAqdiwgdWludDY0X3Qg
Z2ZuLCB1aW50MzJfdCBvZmZzZXQpDQo+PiArc3RhdGljIGludCBtYXBfY29udHJvbF9ibG9jayhz
dHJ1Y3QgdmNwdSAqdiwgZ2ZuX3QgZ2ZuLCB1aW50MzJfdCBvZmZzZXQpDQo+PiAgIHsNCj4+ICAg
ICAgIHZvaWQgKnZpcnQ7DQo+PiAgICAgICB1bnNpZ25lZCBpbnQgaTsNCj4gDQo+IEp1c3QgYXMg
YSByZW1hcmsgKG5vIGFjdGlvbiBleHBlY3RlZCkgLSB0aGlzIG1ha2VzIGEgdHJ1bmNhdGlvbiBp
c3N1ZQ0KPiBwcmV0dHkgYXBwYXJlbnQ6IE9uIDMyLWJpdCBwbGF0Zm9ybXMgdGhlIHVwcGVyIDMy
IGJpdHMgb2YgYSBwYXNzZWQgaW4NCj4gR0ZOIGdldCBpZ25vcmVkLiBDb3JyZWN0IChpbW8pIGJl
aGF2aW9yIHdvdWxkIGJlIHRvIHJlamVjdCB0aGUgdXBwZXINCj4gYml0cyBiZWluZyBub24temVy
by4NCg0KVGhpcyBpcyBub3Qgb25seSBoZXJlIGJ1dCBvbiBwcmV0dHkgbXVjaCBhbGwgdGhlIGh5
cGVyY2FsbHMgdGFraW5nIGEgZ2ZuIA0KKG9uIEFybSBpdCBpcyA2NC1iaXQgcmVnYXJkbGVzcyB0
aGUgYml0bmVzcykuDQoNCkkgYWdyZWUgdGhpcyBpcyBub3QgbmljZSwgYnV0IEkgYW0gYWZyYWlk
IHRoaXMgaXMgbGlrZWx5IGFub3RoZXIgY2FuIG9mIA0Kd29ybSB0aGF0IEkgYW0gbm90IHRvIG9w
ZW4gaXQgeWV0Lg0KDQpDaGVlcnMsDQoNCi0tIA0KSnVsaWVuIEdyYWxsDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
