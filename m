Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEAC27592B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 15:52:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL5Bv-0003II-Qz; Wed, 23 Sep 2020 13:52:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u6iF=DA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kL5Bt-0003ID-S3
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 13:52:14 +0000
X-Inumbo-ID: 4bb22e9c-9461-423b-8426-fd0c7ca07ab2
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.45]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4bb22e9c-9461-423b-8426-fd0c7ca07ab2;
 Wed, 23 Sep 2020 13:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fh2UsWyHJu7X4q4SgAcaUfEdPDN8i0uSm/RLBQ3ZzXo=;
 b=MB0EJHeeiY7iXBnWOl7OfmRJt419Ikj6AHTk79iCYWhu4DzzjAjAGswkKeeV0Lkiycpy4inNOCUDHWR570k1WYmU+knKrhTdEpCBP4e5E8YLDkatsjuIzPQRMJWBNlYY9xtqwV7GqwYRNPAj8k+GEoGN5L1T/sZXPqIMMYpBih4=
Received: from DB7PR05CA0049.eurprd05.prod.outlook.com (2603:10a6:10:2e::26)
 by AM0PR08MB4418.eurprd08.prod.outlook.com (2603:10a6:208:146::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Wed, 23 Sep
 2020 13:52:09 +0000
Received: from DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::b4) by DB7PR05CA0049.outlook.office365.com
 (2603:10a6:10:2e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend
 Transport; Wed, 23 Sep 2020 13:52:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT063.mail.protection.outlook.com (10.152.20.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Wed, 23 Sep 2020 13:52:09 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64");
 Wed, 23 Sep 2020 13:52:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4946ebeeab1fe23f
X-CR-MTA-TID: 64aa7808
Received: from 1c15d54d125a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0FC3CAC4-1E8B-4C5E-A821-5DA9534DA320.1; 
 Wed, 23 Sep 2020 13:52:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1c15d54d125a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Sep 2020 13:52:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALz9m8I7NYKY7/8JokHIN8btF9/guz3j/CQz3xYOMw5wZuhM/iq2+NTDwyLSazWZwUFNM+yAlP6yGupBSTtBniS/jWXqtyQAZW30yWjoq2r7tAkboAUCErYWlApiwtoWsPUFErzTVnvpvfs6cViIOl9ugF1Dkhbi0u8tKjK6ncSdjXLh4R27sG9Byx36FVkKnmvxbRVHWXfqFCsymC6E760S7MtTv6x52FW+IaygWU616W85v+p9H6BnSb1XEF0Zbn5MafIcrIB0JcsOfXUZDH+oirHtJ2cMEW8/rm63atwq0nEEcEUkJoyAz9RyZOLqv3fRuAQlcPxZLJ0r0QcKrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fh2UsWyHJu7X4q4SgAcaUfEdPDN8i0uSm/RLBQ3ZzXo=;
 b=PRvX1TVGTD3bKEEcyOUvmwRMPNv9LdT28Ndcov0QLz0vyf7gKzniUUyKZ8K7Y2ATP9POIvm0gZ4HoL7NX6YmkqjDMgxmXuz0mHwSeCSF9Rd5aFffxwSatVNNomFyqzfDuL3SeA08HDbZu4sDU153ouxdmuZQpHk/0FeXL8Czkdx8hyfwMwjWhzBLFvz74R9/DITAswXtfKnb38Kvh9SLRktITBEocn3oaA6yaykbGDXdhA9+Q3+k6JmrxUyxCTtsCV9D/q4acBX0i5cY2+be+aTdh4Qm0WQhqpC69ipXY1Ytmyeeig4Tima+sit2K7s5fS7H/+UtqfmodGvKzpobDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fh2UsWyHJu7X4q4SgAcaUfEdPDN8i0uSm/RLBQ3ZzXo=;
 b=MB0EJHeeiY7iXBnWOl7OfmRJt419Ikj6AHTk79iCYWhu4DzzjAjAGswkKeeV0Lkiycpy4inNOCUDHWR570k1WYmU+knKrhTdEpCBP4e5E8YLDkatsjuIzPQRMJWBNlYY9xtqwV7GqwYRNPAj8k+GEoGN5L1T/sZXPqIMMYpBih4=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3162.eurprd08.prod.outlook.com (2603:10a6:5:23::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Wed, 23 Sep
 2020 13:52:02 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.020; Wed, 23 Sep 2020
 13:52:02 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, George Dunlap
 <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RESEND][PATCH] xen/arm: sched: Ensure the vCPU context is seen
 before vcpu_pause() returns
Thread-Topic: [RESEND][PATCH] xen/arm: sched: Ensure the vCPU context is seen
 before vcpu_pause() returns
Thread-Index: AQHWkRb3YbUANCat5069iZiL+rQxOal2EYaAgAAFd4CAAChBgA==
Date: Wed, 23 Sep 2020 13:52:02 +0000
Message-ID: <11297BDC-DCC9-4A40-944D-DD26706F6EDB@arm.com>
References: <20200922193104.20604-1-julien@xen.org>
 <582CD990-4D6B-4B93-BDB5-C16D5F69A9EB@arm.com>
 <87e6546b-8e3c-35cf-0e99-34575107b2ed@xen.org>
In-Reply-To: <87e6546b-8e3c-35cf-0e99-34575107b2ed@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 60a21baa-af21-4f6b-8a3c-08d85fc7dda7
x-ms-traffictypediagnostic: DB7PR08MB3162:|AM0PR08MB4418:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4418F2836A49D112685DE2C19D380@AM0PR08MB4418.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: pCiCRapetFbPttGr7FzsXlR4/ktY4wJC22gwzMJ9Hg42RDAtOyKmVR8wTumQ1JjTdA1E4URQn+q9vwqTZ5oQWL3327fPDJE8tzncaApeg0dlhFLEpAaHmnOueuFzXIAA3P5GITuiMVCB8fzIUn0BVoXX7i2dnC2QrRHv2k3nktBsTUIjOBN5dDYPdZRvLguGSjMymj5dE8YFIRnhJ4BunfLdIOhO/rdaeny9BYD+XaBNmadIwxr2EyptepUjSv4uws5ZYG5SB/g+5j0qM3aVSU14CqPfc8y5OXgJ9AcE2tbQvkjiLA3ljPW5OqkTXdVxyKNSKkZ6zluz1SvyaLvKmJUKRDN3osJuvOSmrOewn75K/rbYTTJcoQ7C3hwylQ64
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(6486002)(8936002)(91956017)(186003)(4326008)(53546011)(26005)(6506007)(54906003)(36756003)(2616005)(66946007)(66476007)(6512007)(66556008)(64756008)(316002)(5660300002)(6916009)(8676002)(2906002)(86362001)(66446008)(478600001)(76116006)(33656002)(71200400001)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: UBSn6gJfRQp5dd2xJ8luZftgnlA9GTZGXJPmKKzIR62xgoya5hYhI+GAbD27SkmvoQ6DQ2+91TSDRxkknEbllSz5E44yzzpUEIzoXDlPgRvlfC9LRfK6nlCYnaIRetJfxtGKxXik5zqFhQXbJ7If5U4KH2lTLzFSEup8yvjhhCLDicjNYNaIo+065T4bRgWCa1o7x30FSAwzjZgEPJ4wfabMDIH8IdmbqCaovBO4YZXZlIYqDqT2Jva4MQeAiVU1UHb7A4bVR63f9YK9TNf8jtdFTzZM6K/Z+EaAVgVQATAP/S1JBtN/QMX2+5T0jOFqnhftKNGpcAFTpnM0a+HvuxdtcRoKQha2sYxyuU0PmIAXGBGwVhbRcN+hmrjxIlzB2ePe7XllTy8IxLKoggy1mbxQ/aXjHW+MwpWlWXh+tKCkCZza7Mz+brec0i1qWInMtCcBP09hDUQfMcMoRvqu1FXkYfASUV6kw8KE5+8MkBhQtWEQx0eth8joG7eA0+Gg+EWadDrxtGC+TIcNFv/ciw5W70iQm60FFfbrfkEmSWofVmeEPG7WC0XmDFnLNTUEnFC+4vkmhnYCAjdNyvdYQkoUZX9+bGla0T6bGd18iKxb99dazkov7EBS3Nh0RYUdn7hcsMphusKslAdVztIOww==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <032EA83BB38C21439843BEB14802E6B8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3162
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: e15d2e1c-97c1-44cd-ec22-08d85fc7d97b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CYBiEBdAcmBDsy+hkpQkXKGqJxMIKk6n9ilsgx/lSPY1KEmyH6Qj4+OSNjOcaBYCJxJxK1w53xa9Wx1EqvRaHB//2uKVdVGtBvMqdkGF5J1uWb8Avz+Wnfjg1zRg6T+KXTMULNmcoQFbPsn/e3xv6n76tqEr1yeaJ6OednrvJHcfOu7nmMaYcUQDXzBVc1eEKI+ASCb85jjCufoMpRZFSyoz+UhLt2Z86aZuSNH6DNRP8C2KcsqYtmtkjEPRcw+Wy989sJRG+4lvOQ1YGVihNmkliGKOtkNEZSLC+l1vJm/1dVmjCyxf1qfTyGbV/EkT1zm4wLSWnfEZ4lLeydP6ypQzJ3mJ/qCnuYTXXIGRIb130kqjpBmp5UZy8ntv7WiZ3ImLEWlASMIlxevnx6qX5/LMli89JbauQXzF7PV6ZZXWVCJJnV8LgBTRhRQx6C9X
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966005)(81166007)(86362001)(336012)(5660300002)(83380400001)(33656002)(2906002)(8936002)(70206006)(70586007)(6512007)(356005)(82740400003)(53546011)(36756003)(47076004)(107886003)(26005)(6486002)(4326008)(82310400003)(6506007)(6862004)(316002)(2616005)(54906003)(8676002)(478600001)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 13:52:09.4720 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a21baa-af21-4f6b-8a3c-08d85fc7dda7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4418
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMjMgU2VwIDIwMjAsIGF0IDEyOjI3LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMjMvMDkvMjAyMCAxMjowOCwgQmVydHJhbmQg
TWFycXVpcyB3cm90ZToNCj4+IEhpIEp1bGllbiwNCj4+PiBPbiAyMiBTZXAgMjAyMCwgYXQgMjA6
MzEsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IEZyb206
IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+Pj4gDQo+Pj4gU29tZSBjYWxsZXJz
IG9mIHZjcHVfcGF1c2UoKSB3aWxsIGV4cGVjdCB0byBhY2Nlc3MgdGhlIGxhdGVzdCB2Y3B1DQo+
Pj4gY29udGV4dCB3aGVuIHRoZSBmdW5jdGlvbiByZXR1cm5zIChzZWUgWEVORE9NQ1RMX3tzZXQs
Z2V0fXZjcHVjb250ZXh0fS4NCj4+PiANCj4+PiBIb3dldmVyLCB0aGUgbGF0ZXN0IHZDUFUgY29u
dGV4dCBjYW4gb25seSBiZSBvYnNlcnZlZCBhZnRlcg0KPj4+IHYtPmlzX3J1bm5pbmcgaGFzIGJl
ZW4gb2JzZXJ2ZWQgdG8gYmUgZmFsc2UuDQo+Pj4gDQo+Pj4gQXMgdGhlcmUgaXMgbm8gbWVtb3J5
IGJhcnJpZXIgaW5zdHJ1Y3Rpb24gZ2VuZXJhdGVkLCBhIHByb2Nlc3NvciBjb3VsZA0KPj4+IHRy
eSB0byBzcGVjdWxhdGl2ZWx5IGFjY2VzcyB0aGUgdkNQVSBjb250ZXh0IGJlZm9yZSBpdCB3YXMg
b2JzZXJ2ZWQuDQo+PiBUaGUgZnVuY3Rpb24gdmNwdV9jb250ZXh0X3NhdmVkIGRvZXMgY29udGFp
biBhIG1lbW9yeSBiYXJyaWVyIGFscmVhZHkuDQo+IA0KPiBNZW1vcnkgYmFycmllcnMgdXN1YWxs
eSB3b3JrIGluIHBhaXIuIFdlIGhhdmUgYSB3cml0ZSBiYXJyaWVyIGluIHZjcHVfY29udGV4dF9z
YXZlZCgpIGJ1dCBubyByZWFkIGJhcnJpZXIgaW4gdGhlIGNvZGUgcmVseWluZyBvbiB0aGUgdi0+
aXNfcnVubmluZy4NCg0KT2suDQoNCj4gDQo+PiBTaG91bGRu4oCZdCB3ZSBtYWtlIHN1cmUgaW5z
dGVhZCB0aGF0IGFueSB0aW1lIGlzX3J1bm5pbmcgaXMgbW9kaWZpZWQgdG8NCj4+IGZhbHNlIHRo
ZXJlIGlzIGEgYmFycmllciBiZWZvcmUgKHdoaWNoIGlzIHRoZSBjYXNlIGluIHZjcHVfY29udGV4
dF9zYXZlZCkgPw0KPj4gSSB1bmRlcnN0YW5kIHRoZSBnb2FsIGhlcmUgYnV0IHRoZSBiYXJyaWVy
IHNlZW0gdmVyeSBmYXIgZnJvbSB0aGUgbW9kaWZpY2F0aW9uDQo+PiBvZiBpc19ydW5uaW5nLg0K
PiANCj4gVGhhdCdzIG5vdCB3aGF0IEkgYW0gdHJ5aW5nIHRvIGZpeCAoc2VlIGFib3ZlKS4gSW5z
dGVhZCwgdGhpcyBwYXRjaCB3aWxsIGVuc3VyZSB0aGF0IHdoZW4gYSBwQ1BVIG9ic2VydmUgdi0+
aXNfcnVubmluZyA9IGZhbHNlLCB0aGVuIGl0IGNhbiByZWx5IG9uIHRoZSBjb250ZXh0IG9mIHRo
ZSB2Q1BVIHRvIGJlIHZhbGlkLg0KDQpPayB5b3UgbmVlZCBhIG1lbW9yeSBiYXJyaWVyIGFmdGVy
IHNldHRpbmcgaXNfcnVubmluZyB0byBmYWxzZSwgZ290IGl0Lg0KDQpDaGVlcnMNCkJlcnRyYW5k
DQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

