Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B6EC0CA7
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 22:34:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDwtn-0002wJ-3Y; Fri, 27 Sep 2019 20:31:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tE9W=XW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDwtm-0002wE-6j
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 20:31:30 +0000
X-Inumbo-ID: c6d4da21-e165-11e9-9681-12813bfff9fa
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (unknown
 [40.107.9.50]) by localhost (Halon) with ESMTPS
 id c6d4da21-e165-11e9-9681-12813bfff9fa;
 Fri, 27 Sep 2019 20:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gfyEB9SrIJaWcT/38USqt8OF94Xu1zycedZ+zXh1C8=;
 b=0zzOnTMCSz+FneWPLc1M0sMz6yg9evulcwCBcyQZ+J4PEQP5vswVUT4fRAfEQ2YEBwVFz5rzr+W10ZhhZU615DPXxSBEkX0LP2fcgsuEvLWN/MhT7dzRGFm8IT+OvTeGzcTbp/7yIp1ZhIkinT3HDDIv/GKIyRegm7Pt5Hs8QA4=
Received: from DB7PR08CA0068.eurprd08.prod.outlook.com (2603:10a6:10:26::45)
 by PR2PR08MB4908.eurprd08.prod.outlook.com (2603:10a6:101:23::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.17; Fri, 27 Sep
 2019 20:31:22 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::204) by DB7PR08CA0068.outlook.office365.com
 (2603:10a6:10:26::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.20 via Frontend
 Transport; Fri, 27 Sep 2019 20:31:22 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=none
 action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 27 Sep 2019 20:31:21 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Fri, 27 Sep 2019 20:31:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 07d821d2c14be313
X-CR-MTA-TID: 64aa7808
Received: from b3345e818003.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1560EBE3-62C1-42D9-8E7A-8B9541521EC5.1; 
 Fri, 27 Sep 2019 20:31:11 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b3345e818003.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 27 Sep 2019 20:31:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqJKhatRyNQVqjiZPcIgmEKhT9Ju0anzigjXviqUaycTjVdQyCOptAr6AOOHByI2xkkL+C19Q9Gdva+pPjVEv+LwmIlR7skCJc9SAUx44nlmdvV+sunS3XYmB7km7w00j1pmNRWff57xsy4nGmqPqZspp9xInnxhFIcjUtksoBQgHmTc2tc5G2jeWv27E0K88knpqbXo3EAB+UiTbRrCP97GfE4Pk5re4osxKV3bFJHOwrsITZt/9zvV5qBb4m25nN5UxPLKCDBM8kPTgBVaJO5ZVKtA4XgI9UnIG+VU4mcHNiU7Q4k3xyZmTzk20/FSAF01vB/JRH5iawC4Eki5/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gfyEB9SrIJaWcT/38USqt8OF94Xu1zycedZ+zXh1C8=;
 b=a40Os6jtIcZPFOJxH8G2axwyJP6rgNLULOrKqeDrbOLnLmhN0sWHSYqx0D9DUBCTB2FAnRCYtBEL+2pJHRrWC/U9VZsfH244KEYKjj2ehQdmcpWfzawB3TsOHN+Y3oPGEMx16mdoFoNhQNFmYFJnvVQFMrDAg5d30hUi1BjgsPO/rlY0RHc3eA+fo+iS7r5o58MtK+3pGSPVhNFIxeY7bp1xsbFcI5JT7efIDA+46IG9lFbc9jMgjo2AyYTViVDsGhyseijes+MjXU8M7DtjTxHvZPs7psLiRfPQRu8aur2ulnZnCUoSossfiAbcnJNM2S5q6SWQ6b5p99TBHrY4jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gfyEB9SrIJaWcT/38USqt8OF94Xu1zycedZ+zXh1C8=;
 b=0zzOnTMCSz+FneWPLc1M0sMz6yg9evulcwCBcyQZ+J4PEQP5vswVUT4fRAfEQ2YEBwVFz5rzr+W10ZhhZU615DPXxSBEkX0LP2fcgsuEvLWN/MhT7dzRGFm8IT+OvTeGzcTbp/7yIp1ZhIkinT3HDDIv/GKIyRegm7Pt5Hs8QA4=
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com (10.175.20.10) by
 VI1PR0802MB2624.eurprd08.prod.outlook.com (10.172.255.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Fri, 27 Sep 2019 20:31:09 +0000
Received: from VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::90c8:81ed:114e:146d]) by VI1PR0802MB2431.eurprd08.prod.outlook.com
 ([fe80::90c8:81ed:114e:146d%12]) with mapi id 15.20.2284.023; Fri, 27 Sep
 2019 20:31:09 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Thread-Topic: [PATCH RFC for-4.13 04/10] xen/arm: Ensure the SSBD workaround
 is re-enabled right after exiting a guest
Thread-Index: AQHVdJmYABA0fOm04kWfmZ+YKNBeiac/a/SAgAAYCoD///QCAIAAGwoA///0AICAABtYgP//8h2AAAZkUwAAATQoAAAFUKCA
Date: Fri, 27 Sep 2019 20:31:09 +0000
Message-ID: <0f5506e7-d25a-e1ca-41a0-8815e60c7191@arm.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-5-julien.grall@arm.com> <87v9te7y1m.fsf@epam.com>
 <bbb73576-a2ae-16d8-5147-34a584721e7c@arm.com> <87r2419am7.fsf@epam.com>
 <df6b891c-2670-47d9-ae0d-223161edc225@arm.com> <87muep984i.fsf@epam.com>
 <8bc36926-a00f-d20b-c3b2-12491ed576de@arm.com> <87lfu995w9.fsf@epam.com>
 <4c8524cc-7186-c4f4-d09d-20c7a534c900@arm.com> <87sgoh4o4f.fsf@epam.com>
In-Reply-To: <87sgoh4o4f.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0220.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::16) To VI1PR0802MB2431.eurprd08.prod.outlook.com
 (2603:10a6:800:af::10)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c4663014-98be-469a-1d7b-08d74389a877
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR0802MB2624; 
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2624:|VI1PR0802MB2624:|PR2PR08MB4908:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PR2PR08MB4908CA1F3184295B8B017D1680810@PR2PR08MB4908.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 0173C6D4D5
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(199004)(189003)(54906003)(6246003)(31686004)(99286004)(26005)(11346002)(8676002)(81166006)(229853002)(52116002)(4326008)(6436002)(36756003)(44832011)(486006)(14454004)(446003)(102836004)(2616005)(476003)(66066001)(478600001)(31696002)(186003)(386003)(6512007)(53546011)(6506007)(256004)(81156014)(76176011)(71200400001)(6116002)(5660300002)(3846002)(86362001)(6486002)(14444005)(66946007)(7736002)(71190400001)(6916009)(66556008)(305945005)(2906002)(66446008)(8936002)(25786009)(316002)(64756008)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2624;
 H:VI1PR0802MB2431.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 3osyBVfkf4bYGR0oYUAftoyTJIEj913KFNFeux1w1uel/qt1FVxeafSV1OOzmf23Rutxy5GLWz6azKiEWayfphLEbfUt4OJ/O4QVkEswA4hfT1Ld9psXPzpzXcaeUWeyQc2JXG641gJoFJleTwIU/qBXFdc3CQgXbvG2Mets4ra0L82U6bFGuF9NH/aixAnl5t6sjezGkShiDlfcPa8rDcgjv1MQn0etaJIjfAJn1kZH69eX8smdFBFy3mAQH+6lUGdSMbPn9RUKSh2CwaSWslnILWcx+/mRzUMR4D7QfS7InWgdtQ9ybi/QKeJxo4BgEYNdkfUBxPAqQ9PVi1XXydcTVTd6CxfglLmhowk95Z/ZY+RvgeMptVQbZXMV2jf3BNVu9h073tDWyr0Nt/YX9J/RlU8MMVCPBsYdU/lBrsI=
Content-ID: <12CCB4F496E9414989B6A03FF51DAE29@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2624
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(396003)(376002)(189003)(199004)(50466002)(102836004)(229853002)(36906005)(70206006)(70586007)(6862004)(31696002)(6486002)(7736002)(47776003)(14454004)(2906002)(66066001)(54906003)(25786009)(305945005)(478600001)(356004)(86362001)(26826003)(316002)(36756003)(31686004)(22756006)(2486003)(6512007)(23676004)(476003)(436003)(11346002)(4326008)(126002)(336012)(99286004)(63350400001)(3846002)(76176011)(2616005)(6116002)(53546011)(26005)(14444005)(8676002)(386003)(81156014)(81166006)(6506007)(6246003)(446003)(186003)(76130400001)(486006)(8936002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:PR2PR08MB4908;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: dd045db9-b540-42ee-32ad-08d74389a168
NoDisclaimer: True
X-Forefront-PRVS: 0173C6D4D5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zvQP/BQW6xWi0ernrEXx33aqbyFgp+4Q1uJmHEXcMoxZya/SFYdd3M80A0HwSeqChbaokSUhEmM1hykcMlT/VGTqZCN0LKmXqcIxKGWYo/Hr7161RbNfPl2nke6VahaclqT2yX8HFwBFD2fkSvdVWCH12UNXUDvWen0tdHdoW7xbpH5J7q9yLMwjH93Yk9/Mce3+m3oZDywUMNpFg44bxbU0hESbwbDWWnQDNh1sI30pibhtGBh9+ZPZA9TltyZKdmGMPcQuZeb0ub+V9/dnyPenbooQemRgJkxNZebDiCb/aMwU5S/kQHFx9asMOeZLrFvlHl9U6qYkyZF98KgT2uf4KICLDDf3sXZZkeDOK+ejhWrJ8QD3XqCHIOqSk09qLX9/8o7q0vTQ9rrNzkyP83jAmI644lZR06dyrfFCpLg=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2019 20:31:21.1172 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4663014-98be-469a-1d7b-08d74389a877
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4908
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 04/10] xen/arm: Ensure the SSBD
 workaround is re-enabled right after exiting a guest
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 Andre Przywara <Andre.Przywara@arm.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDI3LzA5LzIwMTkgMTg6NTgsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0KPiAN
Cj4gSnVsaWVuIEdyYWxsIHdyaXRlczoNCj4gDQo+PiBIaSwNCj4+DQo+PiBPbiAyNy8wOS8yMDE5
IDE1OjIxLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+Pg0KPj4+IEp1bGllbiBHcmFsbCB3
cml0ZXM6DQo+Pj4NCj4+Pj4gT24gMjcvMDkvMjAxOSAxNDozMywgVm9sb2R5bXlyIEJhYmNodWsg
d3JvdGU6DQo+Pj4+PiBKdWxpZW4gR3JhbGwgd3JpdGVzOg0KPj4+Pj4+IE9uIDI3LzA5LzIwMTkg
MTM6MzksIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0KPj4+Pj4+PiBKdWxpZW4gR3JhbGwgd3Jp
dGVzOg0KPj4+Pj4+Pj4gT24gMjcvMDkvMjAxOSAxMjo1NiwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6DQo+Pj4+Pj4+Pj4gSnVsaWVuIEdyYWxsIHdyaXRlczoNCj4+Pj4+Pj4gT3IgbWF5YmUsIHdl
IHNob3VsZCBub3Qgc3BsaXQgdGhlIGZ1bmN0aW9uIGF0IGFsbD8gSW5zdGVhZCwgd2UgZW5hYmxl
DQo+Pj4+Pj4+IGludGVycnVwdHMgcmlnaHQgaW4gdGhlIG1pZGRsZSBvZiBpdC4NCj4+Pj4+Pg0K
Pj4+Pj4+IEkgdGhvdWdodCBhYm91dCB0aGlzIGJ1dCBJIGRpZG4ndCBtdWNoIGxpa2UgdGhlIHJl
c3VsdGluZyBjb2RlLg0KPj4+Pj4+DQo+Pj4+Pj4gVGhlIGluc3RydWN0aW9uIHRvIHVubWFzayBp
bnRlcnJ1cHRzIHJlcXVpcmVzIHRvIHRha2UgYW4gaW1tZWRpYXRlDQo+Pj4+Pj4gKGluZGljYXRl
cyB3aGljaCBpbnRlcnJ1cHRzIHRvIHVubWFzaykuIEFzIG5vdCBhbGwgdGhlIHRyYXBzIHJlcXVp
cmUNCj4+Pj4+PiB0byB1bm1hc2sgdGhlIHNhbWUgaW50ZXJydXB0cywgd2Ugd291bGQgZW5kIHVw
IHRvIGhhdmUgdG8gYSBidW5jaCBvZg0KPj4+Pj4+IGlmIGluIHRoZSBjb2RlIHRvIHNlbGVjdCB0
aGUgcmlnaHQgdW5tYXNraW5nLg0KPj4+Pj4gQWgsIHllcywgdGhpcyBpcyB0aGUgcHJvYmxlbS4g
V2UgY2FuIHByb3ZpZGUgY2FsbGJhY2sgdG8NCj4+Pj4+IGVudGVyX2h5cGVydmlzb3JfZnJvbV9n
dWVzdCgpLg0KPj4+Pg0KPj4+PiBJIGFtIG5vdCBzdXJlIHdoYXQgeW91IG1lYW4gYnkgdGhpcy4g
RG8geW91IG1lYW4gYSBjYWxsYmFjayB0aGF0IHdpbGwNCj4+Pj4gdW5tYXNrIHRoZSBpbnRlcnJ1
cHRzPw0KPj4+IFllcy4gWW91IGNhbiBwYXNzIGZ1bmN0aW9uIHBvaW50ZXIgdG8gZW50ZXJfaHlw
ZXJ2aXNvcl9mcm9tX2d1ZXN0KCkuIFRvDQo+Pj4gYSBmdW5jdGlvbiwgdGhhdCB3aWxsIHVubWFz
ayB0aGUgaW50ZXJydXB0cy4gSSdtIHN1cmUgdGhhdCBndWVzdF92ZWN0b3INCj4+PiBtYWNybyBj
YW4gZ2VuZXJhdGUgaXQgZm9yIHlvdS4gU29tZXRoaW5nIGxpa2UgdGhpczoNCj4+Pg0KPj4+ICAg
ICAgICAgICAubWFjcm8gIGd1ZXN0X3ZlY3RvciBjb21wYXQsIGlmbGFncywgdHJhcCwgc2F2ZV94
MF94MT0xDQo+Pj4gICAgICAgICAgIGVudHJ5ICAgaHlwPTAsIGNvbXBhdD1cY29tcGF0LCBzYXZl
X3gwX3gxPVxzYXZlX3gwX3gxDQo+Pj4gICAgICAgICAgIC8qDQo+Pj4gICAgICAgICAgICAqIFRo
ZSB2U0Vycm9yIHdpbGwgYmUgY2hlY2tlZCB3aGlsZSBTS0lQX1NZTkNIUk9OSVpFX1NFUlJPUl9F
TlRSWV9FWElUDQo+Pj4gICAgICAgICAgICAqIGlzIG5vdCBzZXQuIElmIGEgdlNFcnJvciB0b29r
IHBsYWNlLCB0aGUgaW5pdGlhbCBleGNlcHRpb24gd2lsbCBiZQ0KPj4+ICAgICAgICAgICAgKiBz
a2lwcGVkLiBFeGl0IEFTQVANCj4+PiAgICAgICAgICAgICovDQo+Pj4gICAgICAgICAgIEFMVEVS
TkFUSVZFKCJibCBjaGVja19wZW5kaW5nX3ZzZXJyb3I7IGNibnogeDAsIDFmIiwNCj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgIm5vcDsgbm9wIiwNCj4+PiAgICAgICAgICAgICAgICAgICAgICAg
U0tJUF9TWU5DSFJPTklaRV9TRVJST1JfRU5UUllfRVhJVCkNCj4+PiAgICAgICAgICAgbGRyICAg
ICB4MCwgPTFmDQo+Pj4gICAgICAgICAgIGJsICAgICAgZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1
ZXN0DQo+Pj4gICAgICAgICAgIG1vdiAgICAgeDAsIHNwDQo+Pj4gICAgICAgICAgIGJsICAgICAg
ZG9fdHJhcF9cdHJhcA0KPj4+ICAgICAgICAgICBiICAgICAgIDFmDQo+Pj4gMjoNCj4+PiAgICAg
ICAgICAgbXNyICAgICBkYWlmY2xyLCBcaWZsYWdzDQo+Pj4gICAgICAgICAgIHJldA0KPj4+IDE6
DQo+Pj4gICAgICAgICAgIGV4aXQgICAgaHlwPTAsIGNvbXBhdD1cY29tcGF0DQo+Pj4gICAgICAg
ICAgIC5lbmRtDQo+Pg0KPj4gVEJILCBJIGRvbid0IHNlZSB3aGF0J3MgdGhlIHBvaW50IHlvdSBh
cmUgdHJ5aW5nIHRvIG1ha2UgaGVyZS4gWWVzLA0KPj4gdGhlcmUgYXJlIG1hbnkgd2F5IHRvIHdy
aXRlIGEgY29kZSBhbmQgcG9zc2liaWxpdHkgdG8gbWFrZSBvbmUNCj4+IGZ1bmN0aW9uLiBZb3Ug
Y291bGQgYWxzbyBjcmVhdGUgYSBza2VsZXRvbiBtYWNybyBmb3INCj4+IGVudGVyX2h5cGVydmlz
b3JfZnJvbV9ndWVzdCBhbmQgZ2VuZXJhdGUgTiBvZiB0aGVtIChvbmUgcGVyIHNldCBvZg0KPj4g
dW5tYXNrIGludGVycnVwdHMpIGFuZCBjYWxsIHRoZW0uDQo+Pg0KPj4gQnV0IGFyZSB0aGV5IHJl
YWxseSB3b3J0aCBpdD8NCj4gVGhlIHBvaW50IGlzIHRoYXQgeW91IGFyZSB0cnlpbmcgdG8gc3Bs
aXQgb25lIGVudGl0eSBpbnRvIHR3by4NCj4gQXMgSSBzZWUgaXQ6IHNlbWFudGljYWxseSB3ZSBo
YXZlIG9uZSBmdW5jdGlvbjoNCj4gZW50ZXJfaHlwZXJ2aXNvcl9mcm9tX2d1ZXN0KCkuIFRoZSBw
dXJwb3NlIG9mIHRoaXMgZnVuY3Rpb24gaXMgY2xlYXI6DQo+IGZpbmlzaCB0cmFuc2l0aW9uIGZy
b20gZ3Vlc3QgbW9kZSB0byBoeXBlcnZpc29yIG1vZGUuDQo+IA0KPiBCdXQgYmVjYXVzZSBvZiBz
b21lIGFyY2hpdGVjdHVyYWwgbGltaXRhdGlvbiAoZGFpZmNsciByZXF1aXJlcyBvbmx5DQo+IGlt
bWVkaWF0ZSBhcmd1bWVudCkgeW91IGFyZSBmb3JjZWQgdG8gZGl2aWRlIHRoaXMgZnVuY3Rpb24g
aW4gdHdvLg0KPiBJIGRvbid0IGxpa2UgdGhpcywgYmVjYXVzZSBlbnRyeSBwYXRoIG5vdyBpcyBt
b3JlIGNvbXBsZXguIFRvIGZvbGxvdw0KPiB3aGF0IGlzIGdvaW5nIHlvdSBuZWVkIHRvIGJvdW5j
ZSBiZXR3ZWVuIGhlYWQuUyBhbmQgdHJhcHMuYyBvbmUgZXh0cmEgdGltZS4NCg0KT2suIElmIEkg
dW5kZXJzdGFuZCBjb3JyZWN0bHksIHRoaXMgaXMgbW9zdGx5IGEgbWF0dGVyIG9mIHRhc3RlLiBS
aWdodD8NCg0KSSBhbSBnb2luZyB0byBpZ25vcmUgdGhlICJtYXR0ZXIgb2YgdGFzdGUiIGFuZCBq
dXN0IGZvY3VzIG9uIHRoZSBjb2RlIA0KaXRzZWxmLiBXaGlsZSBJIHF1aXRlIGxpa2UgdGhlIGlk
ZWEgb2YgYSBzaW5nbGUgZnVuY3Rpb24sIEkgaGF2ZSB0d28gDQpjb25jZXJucyB3aXRoIHRoaXM6
DQogICAgMSkgQmVjYXVzZSB0aGlzIGlzIGEgY2FsbGJhY2ssIHlvdSB3aWxsIHVzZSBhbiBpbmRp
cmVjdCBicmFuY2guIFRoZSANCmFkZHJlc3MgdXNlZCBpcyBsb2FkZWQgZnJvbSB0aGUgbGl0ZXJh
bCBwb29sIChsZHIgeDAsID0uLi4pLCB0aGVyZWZvcmUgDQp5b3VyIGJyYW5jaCB3aWxsIGRlcGVu
ZCBvbiBhIGxvYWQuIFN1Y2ggY29uc3RydWN0aW9uIG1heSBzdGFsbCB0aGUgDQpwaXBlbGluZSBm
b3IgYSBsb25nIHRpbWUgYXMgbW9zdCBsaWtlbHkgeW91IHdpbGwgaGF2ZSB0byBmZXRjaCB0aGUg
DQphZGRyZXNzIGZyb20gbWVtb3J5IGFuZCBub3QgdGhlIGNhY2hlICh0aGUgY2FjaGUgaXMgbGlr
ZWx5IHRvIGJlIA0KcG9wdWxhdGVkIHdpdGggbW9zdGx5IGd1ZXN0IHN0dWZmKS4gRGVwZW5kaW5n
IG9uIHRoZSBjb3JlLCB0aGlzIG1heSBoYXZlIA0KcXVpdGUgYW4gaW1wYWN0LiBJIGFtIGF3YXJl
IHRoYXQgd2UgaGF2ZSBiZWVuIHVzaW5nIGluIHF1aXRlIGEgZmV3IA0KcGxhY2VzIHN1Y2ggcGF0
dGVybiB3aXRoaW4gWGVuIGJ1dCB3ZSBhcmUgdHJ5aW5nIHRvIGdldCBhd2F5LiBGb3IgDQppbnN0
YW5jZSwgb24geDg2IHRoZXkgcmVjZW50bHkgaW50cm9kdWNlZCBhIHdheSB0byBjb252ZXJ0aW5n
IGluZGlyZWN0IA0KYnJhbmNoIHRvIGRpcmVjdCBicmFuY2ggaWYgdGhlIGFkZHJlc3MgaXMgZml4
ZWQgYWZ0ZXIgYm9vdCAoc2VlIHRoZSANCmFsdGVybmF0aXZlX2NhbGwgbWFjcm8pLg0KDQogICAg
MikgV2l0aCB0aGUgc3BsaXQgZnVuY3Rpb25zLCBpdCBpcyBlYXNpZXIgdG8gc3BvdCBpbiBhIGRp
ZmYgaWYgDQpzb21lb25lIGlzIHRyeWluZyB0byBhZGQgY29kZSBiZWZvcmUgdGhlIGludGVycnVw
dHMgYXJlIHVubWFza2VkLiBTbyBJIA0KZmVlbCB0aGlzIGlzIG1vcmUgbWFpbnRhaW5hYmxlIGFz
IEkgaGF2ZSBvbmUgbGVzcyB0aGluZyB0byB3b3JyeSB3aGVuIA0KcmV2aWV3aW5nLg0KDQpUaGUg
c2Vjb25kIG9uZSBpcyBib3JkZXJsaW5lIG1hdHRlciBvZiB0YXN0ZSwgc28gaXQgaXMgbGVzcyBp
bXBvcnRhbnQuIA0KQnV0IHRoZSBmaXJzdCBvbmUgaXMgaW1wb3J0YW50IHRvIG1lLg0KDQpTbyBh
bnkgc29sdXRpb24gc2hvdWxkIGFkZHJlc3MgdGhpcy4NCg0KQ2hlZXJzLA0KDQotLSANCkp1bGll
biBHcmFsbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
