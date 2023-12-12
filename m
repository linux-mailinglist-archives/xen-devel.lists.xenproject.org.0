Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B35A80E491
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 07:55:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652677.1018695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCwff-0002B5-R5; Tue, 12 Dec 2023 06:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652677.1018695; Tue, 12 Dec 2023 06:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCwff-00029F-OD; Tue, 12 Dec 2023 06:55:11 +0000
Received: by outflank-mailman (input) for mailman id 652677;
 Tue, 12 Dec 2023 06:55:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aifi=HX=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rCwfe-000299-Ln
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 06:55:10 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6295e557-98bb-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 07:55:09 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by BY5PR12MB4998.namprd12.prod.outlook.com (2603:10b6:a03:1d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 06:55:04 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 06:55:02 +0000
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
X-Inumbo-ID: 6295e557-98bb-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHHFSMlBnYjyIEPvW89KjKWmstKiH2/dYzu7DymQvZ0vN53RYQd4E3tRM2lbNCNNESSWN9N7WPFl/9D8qKtpoA1UjWHCi3IP4eSb7dLj5b9JBsJ3xWi0A6m3fLGjr7aEvdXCdFV5lrg/BA41/bTR7abW00yVukxlwYLHj4/b7WalGtelrQ9trEnmQ2QcPIcDoFUvfdwchwU/F6WSVX7x51ubcZAsP2OHpAYICAa8o1Th0QbR601Gbh1SAT2Y0K4jvq0myhEIAmptglOba8oobnC1P6C0MMx9wtCxl5KMEEV1Pq3NXnBtrRnse04ItzwS4Ub1O7ESTob1sNbAbvgMRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xhub4pGIBu+Gf0Os2dvF3Ce35UcIgyx631hZF4gXrp8=;
 b=Dm+k8TEPAWTc9s7iqD3+zXagftpnahudvaS70dkfnz2QCvkb4k6EZDqVfACl8mlqjM00spBC00DuT2f9KHgX0jyNBKS9QNCugRS4fNzf3i9zWjgvkKzegRPtAfaF6HmG1nwm8ttWxfDIuv9xZVkQxKCB921rUqmcltxWH7p3tDyLuFyM4PxH0Cbkhdm6lEO6YmBYRVWHQCNW7DDOtYgmX6+tjBDIquUZJGv0F881wKiVUn+3ZlKWStiZNmKfceGHEDg62KyXzsQEZTpnZWI4FeHKeSrrt8jmwH6mhO6uIpUA7gruOVmQRmV5NmjNVJ8kS1xcfQazN2LqZn9CdjzB8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xhub4pGIBu+Gf0Os2dvF3Ce35UcIgyx631hZF4gXrp8=;
 b=J/qa219B/QCXBL/VVbsGLv65EW8lQ65yV8N5F9mNHo9O5Z2rSoj5JoP91MRYUBg/RbnOkA/EPEhQAWXGBXiCKJwi30A3TnaFLxQIFiEZR53DbY1BDzKtg3YDNGkYSy52rVWdeCy2LxNRPfPKISk5FvpnyOU97eePbzd69JJlCns=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang,
 Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v3 3/3] libxl: Use gsi instead of irq for mapping
 pirq
Thread-Topic: [RFC XEN PATCH v3 3/3] libxl: Use gsi instead of irq for mapping
 pirq
Thread-Index: AQHaK4efi9v9r/9A7ES/pcP+ty7EpLCkPA2AgAGBxYA=
Date: Tue, 12 Dec 2023 06:55:02 +0000
Message-ID:
 <BL1PR12MB5849382C8B181F38C56E63BCE78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20231210164009.1551147-1-Jiqian.Chen@amd.com>
 <20231210164009.1551147-4-Jiqian.Chen@amd.com> <ZXcvazeJlsfPsq0h@macbook>
In-Reply-To: <ZXcvazeJlsfPsq0h@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5302.namprd12.prod.outlook.com
 (15.20.7091.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|BY5PR12MB4998:EE_
x-ms-office365-filtering-correlation-id: 67988404-181c-4cbb-4556-08dbfadf43ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 2L8NzuHb1WKUyb/N7rU7cZDz/gvW9P4ytnYTqFIY7b3oDZYJ10Z8hMn/3bUoUyNPXXvgzIh+9vvTrqtZIqxqXwjRqvm0mqxoeRxhPZxyAXKfmtylSF9uHQ4j7CSMKUw2MJqVS/MxG6lnWXbR/SOU9wsfig2hQIAb3yME/Rpmbg/n+dfdgZjy5gzUjUA/GU+rvNObVDJQ9yC9tbxUyiKfyTDR09DAsHb1l1QtHOJrkN+dVNWkXxuUzicAI6y2GChrbfIAZY1XmTe0arDRSiXBxwQUACkMMc7A2u4AXvJhj7S7aEWSBdewwncq+/WgqD7zxoF191o2V9thYsTgV1YDfcEtOyFj27zo117UwECKKiiYI0KWnvy0T56toiVhXlgb98IHKydQgJq6MJ3lXuLyz/79ThoIHpjlHSKtpqhKsfcwoxytOhdr86epJaZvp83wJrwz3IMJ4Pst/635GaZko0HHl+C8kXuQ4fjhLE8ThsJ4jNI9c3Cj4kkpdyJ1AgV6rv4nbt1FMDeVaF08dPrCrfk6XuJyQOouIpqwSEz5dsb0HhG2iHSgtKCzdDzY5hfmH9A5A9++hW671B0/nuG3n87HB+qCZ42QBr1AqIHjCPuPgdZ4MqquIiWngEDdUqVN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(376002)(136003)(396003)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(52536014)(9686003)(53546011)(6506007)(26005)(5660300002)(33656002)(38070700009)(64756008)(66946007)(66556008)(66446008)(55016003)(6916009)(54906003)(66476007)(76116006)(2906002)(83380400001)(478600001)(41300700001)(8936002)(8676002)(4326008)(7696005)(122000001)(316002)(38100700002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TVhXazFuYU15bU0xSXZRWTRsdHE5QXArditUOGxxTXZpUzhYQm5BUU12Q0Zj?=
 =?utf-8?B?VEhaWkxsUVpwY05ka0lZY3ZnQlhFWkgxRjIxRjB3ZkZSbFovMStYTFByNW4z?=
 =?utf-8?B?NGZPeko0TFk3RHJ1VjhjeGZzR3U3cEk0UmVndG1BTjVJdTkxU3MyS1YvdnlS?=
 =?utf-8?B?NHFDSWlpd28zd3BxQlZtQk9BTUU5RlFYRk9NaDg5QmFyYm05QUJZM0d2VWVi?=
 =?utf-8?B?bUFsZUlLQ2RsMi9Hd3h4NmhIOHlGK1gvMXZpQlRwZ3lDNEpFOGxBWTRNYXZJ?=
 =?utf-8?B?L0ZCY3FUSW91Q0dpYVNWZVJ1WU1TaENyWEhiZFpOYWpEQ05ZYmhiYmN4R2F3?=
 =?utf-8?B?emNtM3F3eUlIZGtWRTFQYjRBaTI2dndOdE9BSFhOUEtaTTlzNjNxeWdEeGtx?=
 =?utf-8?B?M0c1YzZHSmZOTHVSdGVvVFZ2dGo4SUp6RURXMS81dzlsL2hocTkwVms0TmpK?=
 =?utf-8?B?aDkxZDdmSThzZGcrQ3owZ2tacFl6K3lKY3Jxc0JYbFoxQ1JsQng4RkdYWnl5?=
 =?utf-8?B?MFJKUms1N3NCYnFHUzhZWWxsNVZ5cHUrNy9aS1VzTXl3cjBYbTRvWm5zTnRE?=
 =?utf-8?B?aUdMM3JIZXFqUjNwT3VDY2JXZzF2ektNMVhiemFkcG1HZ0lSOW9tQnJoMmlt?=
 =?utf-8?B?WU1CZmdEWjJLY1FLTjdRRnRQRFI5QThEZFBzaWJPNHRIZUZvY2JraGdKQ05Q?=
 =?utf-8?B?bFc3SnhtSWw2cUR6VFo1MHVHcmtDUHo3T3NOUTV4cTRvQmR6Y3BxbE1vdTFk?=
 =?utf-8?B?L0lWd2o5a1BsdFBYYWNWdHZ0b21wMjRjcjNCMk90bng2RlhMZklOTkJUSDg3?=
 =?utf-8?B?S1F2MEN1RTJCR1JRWVVGL2NxaVVsME5KZW0zU0crbkEwUkM1OXgrejdESnhk?=
 =?utf-8?B?aVF2QXMyaGtYVlhEZ3NJTVR3enUxQTc0ZmUzS0JESnMycnhoU3RWWlJyWHo1?=
 =?utf-8?B?SHlwVnZVUUcyWFNMYUFjVFhVYUlpT3l3ZXFZVkdOTytVb1hrRUx1c3lqQWda?=
 =?utf-8?B?ajN1WWs3VE9TdC81UVFVQ0FRYWJyUG1STEl3TUlXWmhJK3NBbm1nL3RlOVlD?=
 =?utf-8?B?OG9MYStlTm9TRWQ0ajNmUmJhSEJ6Ty90RmM4WEV5ajRRQ3kwV2xManJIRzZa?=
 =?utf-8?B?QTRYRHFCb3Y0TUxReDRPdTRTd3VpM1ZxYjJmN0lUN2pqWU42Wnp1aWY1NSts?=
 =?utf-8?B?NnM1azFlNEtVUW5LYzhxU0pZUVlVNVh3WDhZUVlCbGRmTDdyUEJxNEE4Q1Q3?=
 =?utf-8?B?YVBuZnQzTExNRHduNWl5UFRhYTV1QWlRUHRUVmw1aG1Ea2krdXFsbkdVMkx3?=
 =?utf-8?B?em96UnNYNkZaQ3FCK0N1ZDFkcVRrTU1JR2l3TTlydXRndGlTR0tic2YrZXJD?=
 =?utf-8?B?b3RpQ2pVWncwTSs4L0xtR2lJcUJSMHErRGwwbUNvRkNTRWhOc2xXYkZvTDhL?=
 =?utf-8?B?ckY3V0tHOWhCS05UeHZRM1VGa2tUY2E4WnFaOGx3RGVMWFpXZDlzdjN4NG1i?=
 =?utf-8?B?OE41WWQvWGdtTnZhZEI0Sno2VVNMY2RqMlR6Z3NnY3BHY0RBKzFTVVYwbUdz?=
 =?utf-8?B?MHFvT2V0WWRmci82MUVPTVY1ZE1rUHI2dnZVdHlLMnJDNHFRK1VwWFlXUHdE?=
 =?utf-8?B?WVQwNEI3VitINFE4Z2lJczlpMkc3eXJRdHdwZnpNZ2tqVmRzcmMxc1VpMEw5?=
 =?utf-8?B?TXJCV3hNRXBTdm5STEptdTZCWEVaZGhFTXVheUNPKzgxVEtPSkt3ck9YNU9M?=
 =?utf-8?B?c0pqZHN2WnV6eFNVNGg0MTNoVzlLNVI4eGlDRGlPUFFqcGpMbng5bHVRamha?=
 =?utf-8?B?Kzk2SHB2Y0g5OHZZSzRrYlc5cXpsUW15WjlGQVdWZjBuZFVpa2I1Z1p1NEZY?=
 =?utf-8?B?K1Y0cEpqdW1qZzViYXh4eDZXb2lUbklyQi9od2pQSXNBRnE5K1dXeDJEMm55?=
 =?utf-8?B?SWZrRk9FQnVpSmhNNCs5Y1RXNWIzaFFQL1cxMDZMZHRBM1hvMSsyMEVEenlU?=
 =?utf-8?B?VmdjRVJ0WDlUb2Z2NURBSURzQkkvTU83M1ZOVmRpUWVWWjhDbFJjQ0pXQmNP?=
 =?utf-8?B?Mjg2SUYzRWczbWpOc3NDV092YXRBZjB6YmFOMk5XL0YrMTBwem5kS3JNcHBu?=
 =?utf-8?Q?ewwk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <358C5E1475094C479EFA81DDFB240E02@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67988404-181c-4cbb-4556-08dbfadf43ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2023 06:55:02.6703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ywtoiMpjVsHTOGbqdokY1hGsTeU6bjX+ZOWDCj/fs6r3D1uS0JJ+kVVmGhddUddpUkobaHi5+2P8x52oKS0NxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4998

T24gMjAyMy8xMi8xMSAyMzo0OCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gTW9uLCBE
ZWMgMTEsIDIwMjMgYXQgMTI6NDA6MDlBTSArMDgwMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBJ
biBQVkggZG9tMCwgaXQgdXNlcyB0aGUgbGludXggbG9jYWwgaW50ZXJydXB0IG1lY2hhbmlzbSwN
Cj4+IHdoZW4gaXQgYWxsb2NzIGlycSBmb3IgYSBnc2ksIGl0IGlzIGR5bmFtaWMsIGFuZCBmb2xs
b3cNCj4+IHRoZSBwcmluY2lwbGUgb2YgYXBwbHlpbmcgZmlyc3QsIGRpc3RyaWJ1dGluZyBmaXJz
dC4gQW5kDQo+PiB0aGUgaXJxIG51bWJlciBpcyBhbGxvY2VkIGZyb20gc21hbGwgdG8gbGFyZ2Us
IGJ1dCB0aGUNCj4+IGFwcGx5aW5nIGdzaSBudW1iZXIgaXMgbm90LCBtYXkgZ3NpIDM4IGNvbWVz
IGJlZm9yZSBnc2kNCj4+IDI4LCB0aGF0IGNhdXNlcyB0aGUgaXJxIG51bWJlciBpcyBub3QgZXF1
YWwgd2l0aCB0aGUgZ3NpDQo+PiBudW1iZXIuIEFuZCB3aGVuIHBhc3N0aHJvdWdoIGEgZGV2aWNl
LCB4bCB3YW50cyB0byB1c2UNCj4+IGdzaSB0byBtYXAgcGlycSwgc2VlIHBjaV9hZGRfZG1fZG9u
ZS0+eGNfcGh5c2Rldl9tYXBfcGlycSwNCj4+IGJ1dCB0aGUgZ3NpIG51bWJlciBpcyBnb3QgZnJv
bSBmaWxlDQo+PiAvc3lzL2J1cy9wY2kvZGV2aWNlcy88c2JkZj4vaXJxIGluIGN1cnJlbnQgY29k
ZSwgc28gaXQNCj4+IHdpbGwgZmFpbCB3aGVuIG1hcHBpbmcuDQo+Pg0KPj4gU28sIHVzZSByZWFs
IGdzaSBudW1iZXIgcmVhZCBmcm9tIGdzaSBzeXNmcy4NCj4+DQo+PiBDby1kZXZlbG9wZWQtYnk6
IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4g
Q2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+IC0tLQ0KPj4gIHRvb2xzL2xpYnMvbGlnaHQv
bGlieGxfcGNpLmMgfCAxOCArKysrKysrKystLS0tLS0tLS0NCj4+ICAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS90b29s
cy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2kuYw0K
Pj4gaW5kZXggOTZjYjRkYTA3OS4uOWU3NWYwYzI2MyAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL2xp
YnMvbGlnaHQvbGlieGxfcGNpLmMNCj4+ICsrKyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNp
LmMNCj4+IEBAIC0xNDE2LDcgKzE0MTYsNyBAQCBzdGF0aWMgdm9pZCBwY2lfYWRkX2RtX2RvbmUo
bGlieGxfX2VnYyAqZWdjLA0KPj4gICAgICBjaGFyICpzeXNmc19wYXRoOw0KPj4gICAgICBGSUxF
ICpmOw0KPj4gICAgICB1bnNpZ25lZCBsb25nIGxvbmcgc3RhcnQsIGVuZCwgZmxhZ3MsIHNpemU7
DQo+PiAtICAgIGludCBpcnEsIGk7DQo+PiArICAgIGludCBnc2ksIGk7DQo+PiAgICAgIGludCBy
Ow0KPj4gICAgICB1aW50MzJfdCBmbGFnID0gWEVOX0RPTUNUTF9ERVZfUkRNX1JFTEFYRUQ7DQo+
PiAgICAgIHVpbnQzMl90IGRvbWFpbmlkID0gZG9taWQ7DQo+PiBAQCAtMTQzOSw3ICsxNDM5LDcg
QEAgc3RhdGljIHZvaWQgcGNpX2FkZF9kbV9kb25lKGxpYnhsX19lZ2MgKmVnYywNCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwY2ktPmJ1cywgcGNpLT5kZXYsIHBjaS0+ZnVuYyk7DQo+
PiAgICAgIGYgPSBmb3BlbihzeXNmc19wYXRoLCAiciIpOw0KPj4gICAgICBzdGFydCA9IGVuZCA9
IGZsYWdzID0gc2l6ZSA9IDA7DQo+PiAtICAgIGlycSA9IDA7DQo+PiArICAgIGdzaSA9IDA7DQo+
IA0KPiB1bnNpZ25lZCBpbnQgKHNvIGl0IG1hdGNoZXMgdGhlIGZzY2FuZiBmb3JtYXQpLCBhbmQg
aW5pdGlhbGl6ZWQgYXQNCj4gZGVmaW5pdGlvbi4NCkFzIHdoYXQgeW91IHNhaWQgYmVsb3csIEkg
bmVlZCB0byB1c2UgaXJxIGlmIHRoZXJlIGlzIG5vIGdzaSBzeXNmcy4gU28sIEkgdGhpbmsgaXQg
aXMgbm90IG5lY2Vzc2FyeSB0byBjaGFuZ2UgdGhlIG5hbWUgb2YgdGhpcyBsb2NhbCB2YXJpYWJs
ZS4NCg0KPiANCj4+ICANCj4+ICAgICAgaWYgKGYgPT0gTlVMTCkgew0KPj4gICAgICAgICAgTE9H
RUQoRVJST1IsIGRvbWFpbmlkLCAiQ291bGRuJ3Qgb3BlbiAlcyIsIHN5c2ZzX3BhdGgpOw0KPj4g
QEAgLTE0NzgsMjYgKzE0NzgsMjYgQEAgc3RhdGljIHZvaWQgcGNpX2FkZF9kbV9kb25lKGxpYnhs
X19lZ2MgKmVnYywNCj4+ICAgICAgZmNsb3NlKGYpOw0KPj4gICAgICBpZiAoIXBjaV9zdXBwX2xl
Z2FjeV9pcnEoKSkNCj4+ICAgICAgICAgIGdvdG8gb3V0X25vX2lycTsNCj4+IC0gICAgc3lzZnNf
cGF0aCA9IEdDU1BSSU5URihTWVNGU19QQ0lfREVWIi8iUENJX0JERiIvaXJxIiwgcGNpLT5kb21h
aW4sDQo+PiArICAgIHN5c2ZzX3BhdGggPSBHQ1NQUklOVEYoU1lTRlNfUENJX0RFViIvIlBDSV9C
REYiL2dzaSIsIHBjaS0+ZG9tYWluLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGNpLT5idXMsIHBjaS0+ZGV2LCBwY2ktPmZ1bmMpOw0KPiANCj4gWW91IG5lZWQgdG8ga2Vl
cCB0aGUgZmFsbGJhY2sgbWVjaGFuaXNtIG9mIHJlYWRpbmcgdGhlIGlycSBub2RlLCBvcg0KPiBl
bHNlIHhsIHdvdWxkIHN0b3Agd29ya2luZyBvbiBhbnkga2VybmVsIHRoYXQgZG9lc24ndCBleHBv
c2UgdGhpcw0KPiBzeXNmcyBub2RlLCB5b3Ugd291bGQgYnJlYWsgcGFzc3Rocm91Z2ggb24gYWxs
IGN1cnJlbnQgTGludXggdmVyc2lvbnMuDQpZZXMsIHlvdSBhcmUgcmlnaHQuIElmIHRoZXJlIGlz
IG5vIGdzaSBzeXNmcywgd2lsbCBzdGlsbCB1c2UgaXJxLCBpbiBuZXh0IHZlcnNpb24uIFRoYW5r
cy4NCg0KPiANCj4gVGhhbmtzLCBSb2dlci4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4g
Q2hlbi4NCg==

