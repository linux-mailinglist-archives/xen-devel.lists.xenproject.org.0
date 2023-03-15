Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5F46BBF42
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 22:42:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510253.787568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcYsb-0004vI-Nj; Wed, 15 Mar 2023 21:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510253.787568; Wed, 15 Mar 2023 21:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcYsb-0004sO-Ki; Wed, 15 Mar 2023 21:41:53 +0000
Received: by outflank-mailman (input) for mailman id 510253;
 Wed, 15 Mar 2023 21:41:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P4g8=7H=cs.rochester.edu=ejohns48@srs-se1.protection.inumbo.net>)
 id 1pcYsZ-0004sI-9w
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 21:41:51 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20722.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::722])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ee69ba1-c37a-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 22:41:47 +0100 (CET)
Received: from MN2PR07MB6045.namprd07.prod.outlook.com (2603:10b6:208:103::14)
 by SJ0PR07MB9275.namprd07.prod.outlook.com (2603:10b6:a03:40a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 21:41:43 +0000
Received: from MN2PR07MB6045.namprd07.prod.outlook.com
 ([fe80::615e:312b:3b80:5ac2]) by MN2PR07MB6045.namprd07.prod.outlook.com
 ([fe80::615e:312b:3b80:5ac2%4]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 21:41:43 +0000
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
X-Inumbo-ID: 2ee69ba1-c37a-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ft3OSj55p7KWr8NmbNQZZUXkJwuxmZYMELZBeD9po0YI0vrcOskl05rpt7TEvYmnZJFG3MY7NT9Bhie/qR62ulVfhAsCcAuGwXZLBUc/m0Ddoy1o/Sh1gFoEL6qUpSi13NQGoJINBjkA19vVKzvMsBdL1hUQWyVXYG2OHtZDoRwqeize0zEf3exyRQRfiWl0jNt20UoPMkLQkeiPU4aHatWsKDisnIjVGWf1m6OiMD3/xIb1GiSMOyQRRCKIDo5tQGaUvCA3guK3Jbkcgd6a4rU8p5/3KJCo/EtnTI7YP5GyJJxlwdvhIHfoNoCxyjYN5aNQZfcRfrm0l/9kyHaHMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwUj+B2uDn7ybrWDZp9zZgaiP/nJ+1VPLzdKoXzIFfc=;
 b=VLX6lLRWkXhELc23k6fTI2FS4O6NydM+NgNfOEdPQxVeOO1X7poTZobWQL9jCldIyW8hC1j4gB26Uq18B/P9zC/0jzkk+tyTap07X7S7oDvkm4eDd5NCY5js2TsePytuPOPaRSTcJd9xskBhD+Yhpa9mQ5RVFewdyZRFtQQHzsmxR81YSirCXNsGbRMsn4nCSBm3tNRjbue13mPX9m8i8l/c+71dnTsJKVvZ0qNEeASebKDu8lCplAJwlLby2RR3TlpTmCeBXUrIMQtY/ZSNCYl+7/cWUraoPlQXXAYnRSPJjLfWUBY5H/3ohVnA1ugigel43e8Vj7N86SVbVDYDRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs.rochester.edu; dmarc=pass action=none
 header.from=cs.rochester.edu; dkim=pass header.d=cs.rochester.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.rochester.edu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwUj+B2uDn7ybrWDZp9zZgaiP/nJ+1VPLzdKoXzIFfc=;
 b=UiSeCmjwdRVfNziKBY61jJIgsW/e2yd0JlScjH+hlRAqrcdWxT0IqgCFbYIQJT6x7zhJvUA5veLwb6Kcd8buTFCjpKQlJjswNcLVcCbjR54GbkYj4hq46mX6kbklWHGlHE73CbUdjrjb2O1MJLJtmnLCkreDbyi5a91vtSRbJdk=
From: "Johnson, Ethan" <ejohns48@cs.rochester.edu>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: Best way to use altp2m to support VMFUNC EPT-switching?
Thread-Topic: Best way to use altp2m to support VMFUNC EPT-switching?
Thread-Index: AQHZV4bvojgkCOLOvE2fIxIuAOXfrw==
Date: Wed, 15 Mar 2023 21:41:43 +0000
Message-ID:
 <MN2PR07MB6045B965DD2DA308C55905F9E4BF9@MN2PR07MB6045.namprd07.prod.outlook.com>
References:
 <MN2PR07MB6045100322F58085DD6B1488E4BF9@MN2PR07MB6045.namprd07.prod.outlook.com>
 <c12ff321-e1ad-1377-2158-195594fdbe04@citrix.com>
In-Reply-To: <c12ff321-e1ad-1377-2158-195594fdbe04@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs.rochester.edu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR07MB6045:EE_|SJ0PR07MB9275:EE_
x-ms-office365-filtering-correlation-id: afd35ab7-9cf2-4860-eb4e-08db259e11c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VeJofWFgoofSYMb1d0dVfQTzs2txx9hzjExHq6KPQY/2Dc7cqQjXwYc2MHDz0KjyvkxqcG+uU9GwzxYAJ6WGvpxowKjkPu+5AO7s4y0Yi/Pa+AOMVIlt9khOec82w7kPhkIr4nVYvlO5+JE6IvE1dvVqbB3LZZ692qyM8QRNK26QrW5NOQtilT3bVZiJ/6P6mqnLt8WmV7ngvqKT01wleywxE7zKuSlsrtmwzX44bq2HdMK0WOsUFcTlixTvZWavltnmPhEMYhFvtgAe707XgU3XGtZuoleEOxIalzXiQWSApRPe9oTOf/9UMC20/lSSOLD+SmYmUg+XMDgWzPFxE7WCRt+cIWFAjqKrFRUJ3mLoq3x9YukAwU0NhTMz+QBsrNDEKBEOwAReyaOM73qZWb54beDnb8ksFqVuLiTNxDlAJj2j4laT/Mqkn2Kp7Xq7Z0cJPjFdTx916ArPHv8AIxq6Z6bR57u/tND0vfcuLKtw1jG3KZZB2KJQCuiY6nqROihHRiN8POck+sHott7KeBlaWTAY8zy85J9Emmh23pTE5VnaBJfQHdVDfQoHDTGJNErzxSv35eQNVqOc70wfHd3BTYuOvnVnhFb8ZkEdffrOfG87wyLVMOGFnWgmcoOrNdIMiJqdf+iArjh7/l0YlXCVOZnT97VCrl5ZJXQ62ybxQygCvCtSPhi+JF/wHLQIe5fNOf1j4qvHF2jF9oBlijcNY/JTa3prcSrDbrLWKL8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR07MB6045.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199018)(66899018)(71200400001)(5660300002)(52536014)(8936002)(41300700001)(2906002)(33656002)(38100700002)(38070700005)(86362001)(122000001)(7696005)(478600001)(76116006)(66946007)(66476007)(8676002)(66446008)(66556008)(64756008)(55016003)(110136005)(75432002)(41320700001)(9686003)(83380400001)(786003)(316002)(6506007)(186003)(53546011)(43043002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Mmc4RFRnT1hjaVhwRUN2SHAyOHJaYUd5Q0dwZTBDSGVoS3JLdzdVekIvMUN2?=
 =?utf-8?B?WTRTWjBjYkNpaDRVTzNBYmhGc1hROUJidXNVdlJKQ1U1Q2RmeURrZkMrWnln?=
 =?utf-8?B?YVBsVFlCUm8yVGNsSytjSTRPNlkyOVA5YzJGc1hjTy8wejFXK2MzbjBXWHhL?=
 =?utf-8?B?dzA5K1daODhjTDRmalNLRnBGY2R0S2lrbXNTbjVFM0duY1djY05RcGtieWt5?=
 =?utf-8?B?MnR2STdRaVNtaHZRekZBSUNINWhZZVdCTUlRR3dyZ0ZXL1pqTkJOZkpjWmd6?=
 =?utf-8?B?Tmw0VXpFVUJUVndHZEZYTkFPai9peWtNM09ZQ0IwdzArcGNTbTVlRTE0T3p6?=
 =?utf-8?B?MnB5ZEhkOVFrNWN6TUVScVZybi9KOWZwd295aUpBNnBDUDlocjhFL3I1TjMx?=
 =?utf-8?B?a05NTk5rRm41UyswOTQ1UVhIQ0Z3MWpiTUNDRlBWNkdOTlA5MS9qUis4OXBs?=
 =?utf-8?B?YXhUUnI2bGc0NFRJNXZicjFrek9jbERaNEdhRUhXOSt0d1J4Ync0bGZnMjVQ?=
 =?utf-8?B?OVZtU0N4K1cyQTYzSUFXUEQ2T1hsY21HTjg1b2JPaDQyeURnd3pyZi9pWkJS?=
 =?utf-8?B?Zk1jRFJ1WElyTW9vODdUVjJVUkhhcjd4ajRxM2ViZUVoYk1WNGNUOFdFaDg4?=
 =?utf-8?B?RDB2aVNYVDZOdWVPb2ZjUlU0Zy9WVEdFbmFDaVMyTmo4OE5aMWJLZWZneVNr?=
 =?utf-8?B?dm90bXY1MVRMMVp0SS9qLytENHpOelhuZDZzT1RvbTZmbURkZ05ObkIxNGF2?=
 =?utf-8?B?YmhJQndqZ1d4TnoxQ25ZRk9JdVJaYmN6eU1VMTVuRjRYaHAzZE94dkNKZXBa?=
 =?utf-8?B?NXpBVUg4SG1Oc1Zqb2FRUExCU1A0bzJ4b2VPV0M1c21aNWpOVC9LQVlBd0Ni?=
 =?utf-8?B?MERYOWZKdFdXQkYwQ0FVbDkwWGtYSTlKWmFkUjZnVXNiWEFvMnZGWEpsK0c4?=
 =?utf-8?B?ejBMVTdKS1FYQ3M0UTVQZm1laERHZGlPaXpCcVlTUzRNYmtWazhrSXBTN00z?=
 =?utf-8?B?U3FFWjV0dG4vU09Kb3pVVmJvZzJBS25ja3B2TWxNRTZ4bVphZUJGMjJjeUtF?=
 =?utf-8?B?ZW1kMXllWUFGWjRLdXJZRzFpUlQ2dmtMazRGOUlBWWdBVXBlY0FpMElvY3l5?=
 =?utf-8?B?MTFFcEhaYlBUS3YwZnRFT2NhbG9FN04wQkoyYXFlejhrNFJ6VWJ2MjF0a1dO?=
 =?utf-8?B?MEUzRnBtSDVDc2oxNnVKVjF2TVVZdncvZjgzSGRxRFJPZG5pQTltVkVWK0Zo?=
 =?utf-8?B?TU1sRmVmY09Pb3FsM3VLUC9LMEkwNCtCMy8wa2tyKzljWFg5Zmg4cHlFUWhY?=
 =?utf-8?B?cncxZmlaWW96M2FRWHJRWWxValhMU3UrSDh6QUVESVV2RThOYVpXV05zY2d6?=
 =?utf-8?B?QmNtN3lwSlRmdEtiN1ZFN0RESzY0VDdYS3Qzcm5qN2ppL0ZRcWZVUC9FZ0ZT?=
 =?utf-8?B?dDNwUEdXU2tSM21rKzlRa0RIYXh3SzQzeklONUFHUkJRMzNZS3YrZHZLTmUx?=
 =?utf-8?B?bU4wR0NtYmxkcjRsSnJwazk4MHZudEFQMmVzMkd0c0lZRUZKMGNFeGNPUEd3?=
 =?utf-8?B?NWNvTmlCQXlYc2tSSnJSekdiVWdHMElXZ1pXWk5FQThJOTZXSWNIbXU5N3lW?=
 =?utf-8?B?RGpPSTA2SjJycjZDUWdEdHJaTmhhNEwrUWF3ZUNMM09BM1JNRlphdUZVQ01T?=
 =?utf-8?B?Y0dGdGd6bTFSMUkzOGFyODcrb3RLdjVRSHI4ZnF4Tlhaa3RLL0FRaFIyd2t0?=
 =?utf-8?B?aDhTNTBaZ04xNU1QUm1uRm9sUjdHUkxpQWpYL25NZkdVSndlSzdOK2RaZHM2?=
 =?utf-8?B?bFNxbWZiM05xYW5GQVovSDlaNVRPSFRjdk9Ma0V2RjVrQktDaFFHS3NBNzFT?=
 =?utf-8?B?emZra2Y2OG1OdkRCVmF3SVd0Rzk5NEEvdmJwTjlsK0F5MHlBU3B4cVQ0OCtC?=
 =?utf-8?B?VklUSi9QeUxhUWYxcDBMZWVXNGQwVzJPM1cyWmlLQUdFTTZZZE5uYktlaEtF?=
 =?utf-8?B?eEFNSmY0c3luYXVMdUpuTjd0cllFNjlFTlR2T0RUdDZSRkd2OS92aWRlbi9B?=
 =?utf-8?B?ZExReVhQSy8wYmZoWUdnbzhCVnhuNElCUzcvNGh0dzEzQUdNRDloUVk3elpJ?=
 =?utf-8?B?cDhRa2pPcXBvVUw1TjU4WURZSklwUGxEdGpWWlJ0RmFpZXNnMnUwRHBvYU5s?=
 =?utf-8?Q?zGLuMJPlJTUl4iBYb2s3x7in5/JNgRXFGHWhhJhM6dGJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cs.rochester.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR07MB6045.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afd35ab7-9cf2-4860-eb4e-08db259e11c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2023 21:41:43.6185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 374e17f4-cf11-4ce2-b3ef-5de76bf4ce41
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VgzUANatukEI6Z78eMyPTmVXUPb2nFGlvbJHM7FcUK1jSYBIrf/XyaZR9ADrIEJWF0QcPvhwsaD56GBLQwwJPvS+ypzu9XDzyZV1WdwcZ7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR07MB9275

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+IA0KU2VudDogV2VkbmVzZGF5LCBNYXJjaCAxNSwgMjAyMyA1OjIy
IEFNDQpUbzogSm9obnNvbiwgRXRoYW4gPGVqb2huczQ4QGNzLnJvY2hlc3Rlci5lZHU+Ow0KeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQpTdWJqZWN0OiBbRVhUXSBSZTogQmVzdCB3YXkg
dG8gdXNlIGFsdHAybSB0byBzdXBwb3J0IFZNRlVOQyBFUFQtc3dpdGNoaW5nPw0KDQo+IE9uIDE1
LzAzLzIwMjMgMjowMSBhbSwgSm9obnNvbiwgRXRoYW4gd3JvdGU6DQo+PiBIaSBhbGwsDQo+Pg0K
Pj4gSSdtIGxvb2tpbmcgZm9yIHNvbWUgcG9pbnRlcnMgb24gaG93IFhlbidzIGFsdHAybSBzeXN0
ZW0gd29ya3MgYW5kIGhvdyBpdCdzDQo+PiBtZWFudCB0byBiZSB1c2VkIHdpdGggSW50ZWwncyBW
TUZVTkMgRVBULXN3aXRjaGluZyBmb3Igc2VjdXJlIGlzb2xhdGlvbg0KPj4gd2l0aGluIGFuIEhW
TS9QVkggZ3Vlc3QncyBrZXJuZWxzcGFjZS4NCj4+DQo+PiBTcGVjaWZpY2FsbHksIEkgYW0gYXR0
ZW1wdGluZyB0byBtb2RpZnkgWGVuIHRvIGNyZWF0ZSAob24gcmVxdWVzdCBieSBhbg0KPj4gYWxy
ZWFkeS1ib290ZWQsIGNvb3BlcmF0aXZlIGd1ZXN0IHdpdGggYSBkdWx5IG1vZGlmaWVkIExpbnV4
IGtlcm5lbCkgYQ0KPj4gc2Vjb25kIHNldCBvZiBleHRlbmRlZCBwYWdlIHRhYmxlcyB0aGF0IGhh
dmUgYWNjZXNzIHRvIGFkZGl0aW9uYWwNCj4+IHByaXZpbGVnZWQgcmVnaW9ucyBvZiBob3N0LXBo
eXNpY2FsIG1lbW9yeSAoc3BlY2lmaWNhbGx5LCBhIHBhZ2Ugb3IgdHdvIHRvDQo+PiBzdG9yZSBz
b21lIHNlbnNpdGl2ZSBkYXRhIHRoYXQgd2UgZG9uJ3Qgd2FudCB0aGUgZ3Vlc3Qga2VybmVsIHRv
IGJlIGFibGUgdG8NCj4+IG92ZXJ3cml0ZSwgcGx1cyBzb21lIGhvc3QtcGh5c2ljYWwgTU1JTyBy
YW5nZXMsIHNwZWNpZmljYWxseSB0aGUgeEFQSUMNCj4+IHJlZ2lvbikuIFRoZSBpZGVhIGlzIHRo
YXQgdGhlIGd1ZXN0IGtlcm5lbCB3aWxsIHVzZSBWTUZVTkMgdG8gc3dpdGNoIHRvIHRoZQ0KPj4g
YWx0ZXJuYXRlIEVQVHMgYW5kIGNhbGwgInNlY3VyZSBmdW5jdGlvbnMiIHByb3ZpZGVkIChieSB0
aGUgaHlwZXJ2aXNvcikgYXMNCj4+IHJlYWQtb25seSBjb2RlIHRvIGJlIGV4ZWN1dGVkIGluIG5v
bi1yb290IG1vZGUgb24gdGhlIGFsdGVybmF0ZSBFUFQsDQo+PiBhbGxvd2luZyBjZXJ0YWluIFZN
LWV4aXQgc2NlbmFyaW9zIChuYW1lbHksIHNlbmRpbmcgYW4gSVBJIHRvIGFub3RoZXIgdkNQVQ0K
Pj4gb2YgdGhlIHNhbWUgZG9tYWluKSB0byBiZSBoYW5kbGVkIHdpdGhvdXQgZXhpdGluZyBub24t
cm9vdCBtb2RlLiBIZW5jZSwNCj4+IHRoZXNlIGV4dHJhIHByaXZpbGVnZWQgcGFnZXMgc2hvdWxk
IG9ubHkgYmUgdmlzaWJsZSB0byB0aGUgYWx0ZXJuYXRpdmUgcDJtDQo+PiB0aGF0IHRoZSAic2Vj
dXJlIHJlYWxtIiBmdW5jdGlvbnMgbGl2ZSBpbi4gKFRyYW5zaXRpb25zIGJldHdlZW4gdGhlIHNl
Y3VyZS0NCj4+IGFuZCBpbnNlY3VyZS1yZWFsbSBFUFRzIHdpbGwgYmUgdGhyb3VnaCBzcGVjaWFs
IHJlYWQtb25seSAidHJhbXBvbGluZSIgY29kZQ0KPj4gcGFnZXMgdGhhdCBlbnN1cmUgdGhlIHVu
dHJ1c3RlZCBndWVzdCBrZXJuZWwgY2FuIG9ubHkgZW50ZXIgdGhlIHNlY3VyZQ0KPj4gcmVhbG0g
YXQgZGVzaWduYXRlZCBlbnRyeSBwb2ludHMuKQ0KPj4NCj4+IExvb2tpbmcgYXQgWGVuJ3MgZXhp
c3RpbmcgYWx0cDJtIGNvZGUsIEkgZ2V0IHRoZSBzZW5zZSB0aGF0IFhlbiBpcyBhbHJlYWR5DQo+
PiBkZXNpZ25lZCB0byBzdXBwb3J0IHNvbWV0aGluZyBhdCBsZWFzdCB2YWd1ZWx5IGxpa2UgdGhp
cy4gSSBoYXZlIG5vdCwNCj4+IGhvd2V2ZXIsIGJlZW4gYWJsZSB0byBmaW5kIG11Y2ggaW4gdGhl
IHdheSBvZiBkb2N1bWVudGF0aW9uIG9uIGFsdHAybSwgc28gSQ0KPj4gYW0gcmVhY2hpbmcgb3V0
IHRvIHNlZSBpZiBhbnlvbmUgY2FuIG9mZmVyIHBvaW50ZXJzIG9uIGhvdyB0byBiZXN0IHVzZSBp
dC4NCj4+DQo+PiBXaGF0IGlzIHRoZSBpbnRlbmRlZCB3b3JrZmxvdyAoZWl0aGVyIGluIHRoZSB0
b29sc3RhY2sgb3Igd2l0aGluIHRoZQ0KPj4gaHlwZXJ2aXNvciBpdHNlbGYpIGZvciBjcmVhdGlu
ZyBhbmQgY29uZmlndXJpbmcgYW4gYWx0cDJtIHRoYXQgc2hvdWxkIGhhdmUNCj4+IGFjY2VzcyB0
byBhZGRpdGlvbmFsIGhvc3QtcGh5c2ljYWwgZnJhbWVzIHRoYXQgYXJlIG5vdCBwcmVzZW50IGlu
IHRoZQ0KPj4gZ3Vlc3QncyBtYWluIHAybT8NCj4+DQo+PiBGV0lXLCBvbmNlIHRoZSBhbHRwMm0g
aGFzIGJlZW4gc2V0IHVwIGluIHRoaXMgZmFzaGlvbiwgd2UgZG9uJ3QgYW50aWNpcGF0ZQ0KPj4g
bmVlZGluZyB0byBmaWRkbGUgd2l0aCBpdHMgbWFwcGluZ3MgYW55IGZ1cnRoZXIgYXMgbG9uZyBh
cyB0aGUgZ3Vlc3QgaXMNCj4+IHJ1bm5pbmcgKHNvIEknbSB0aGlua2luZyAqbWF5YmUqIHRoZSAi
ZXh0ZXJuYWwiIGFsdHAybSBtb2RlIHdpbGwgc3VmZmljZQ0KPj4gZm9yIHRoaXMpLiBJbiBmYWN0
LCB3ZSBtYXkgbm90IGV2ZW4gbmVlZCB0byBoYXZlIGFueSAib3ZlcmxhcCIgYmV0d2VlbiB0aGUN
Cj4+IHByaW1hcnkgYW5kIGFsdGVybmF0aXZlIHAybSBleGNlcHQgdGhlIHRyYW1wb2xpbmUgcGFn
ZXMgdGhlbXNlbHZlcw0KPj4gKGFsdGhvdWdoIHRoaXMgYXNwZWN0IG9mIG91ciBkZXNpZ24gaXMg
c3RpbGwgc29tZXdoYXQgaW4gZmx1eCkuDQo+Pg0KPj4gSSd2ZSBub3RpY2VkIGEgZnVuY3Rpb24s
IGRvX2FsdHAybV9vcCgpLCBpbiB0aGUgaHlwZXJ2aXNvcg0KPj4gKHhlbi9hcmNoL3g4Ni9odm0v
aHZtLmMpIHRoYXQgc2VlbXMgdG8gaW1wbGVtZW50IGEgbnVtYmVyIG9mIGFsdHAybS1yZWxhdGVk
DQo+PiBoeXBlcmNhbGxzIGludGVuZGVkIHRvIGJlIGNhbGxlZCBmcm9tIHRoZSBkb20wLiBEbyB0
aGVzZSBoeXBlcmNhbGxzIGFscmVhZHkNCj4+IHByb3ZpZGUgYSBzdHJhaWdodGZvcndhcmQgd2F5
IHRvIGFjaGlldmUgbXkgZ29hbHMgZGVzY3JpYmVkIGFib3ZlIGVudGlyZWx5DQo+PiB2aWEgKGEg
cG90ZW50aWFsbHkgbW9kaWZpZWQgdmVyc2lvbiBvZikgdGhlIGRvbTAgdG9vbHN0YWNrPyBPciB3
b3VsZCBJIGJlDQo+PiBiZXR0ZXIgb2ZmIGNyZWF0aW5nIGFuZCBjb25maWd1cmluZyB0aGUgYWx0
cDJtIGZyb20gd2l0aGluIHRoZSBoeXBlcnZpc29yDQo+PiBpdHNlbGYsIHNpbmNlIEkgd2FudCB0
byBtYXAgbG93LWxldmVsIHN0dWZmIGxpa2UgeEFQSUMgTU1JTyByYW5nZXMgaW50byB0aGUNCj4+
IGFsdHAybT8NCj4+DQo+PiBUaGFuayB5b3UgaW4gYWR2YW5jZSBmb3IgeW91ciB0aW1lIGFuZCBh
c3Npc3RhbmNlIQ0KPg0KPiBIZWxsbywNCj4gDQo+IFRoZXJlJ3MgYSBsb3QgdG8gdW5wYWNrIGhl
cmUsIGJ1dCBiZWZvcmUgSSBkbyBzbywgb25lIHF1ZXN0aW9uLiAgSW4geW91cg0KPiB1c2VjYXNl
LCBhcmUgeW91IHdhbnRpbmcgdG8gbWFwIGFueSBmcmFtZXMgd2l0aCByZWR1Y2VkIHBlcm1pc3Np
b25zDQo+IChpLmUuIHN1Y2ggdGhhdCB5b3UnZCBnZXQgYSAjVkUgZXhjZXB0aW9uKSwgb3IgYXJl
IHlvdSBqdXN0IGxvb2tpbmcgdG8NCj4gYWRkIG5ldyBmcmFtZXMgd2l0aCBSV1ggcGVybXMgaW50
byBhbiBhbHRlcm5hdGl2ZSB2aWV3Pw0KPiANCj4gSSBzdXNwZWN0IHRoZSBsYXR0ZXIsIGJ1dCBp
dCdzIG5vdCBjb21wbGV0ZWx5IGNsZWFyLCBhbmQgY2hhbmdlcyB0aGUgYW5zd2VyLg0KPiANCj4g
fkFuZHJldw0KDQpZZXMsIHRoZSBsYXR0ZXIgaXMgY29ycmVjdDogSSBhbSBsb29raW5nIHRvIGFk
ZCBuZXcgZnJhbWVzIHdpdGggUldYIHBlcm1zDQppbnRvIGFuIGFsdGVybmF0aXZlIHZpZXcuIEkg
ZG9uJ3QgY3VycmVudGx5IGVudmlzaW9uIG5lZWRpbmcgI1ZFIGluIGFueSBmb3JtDQpmb3IgdGhp
cyB3b3JrLg0KDQooV2UncmUgdXNpbmcgYSBtb2RpZmllZCBQVkggTGludXggZ3Vlc3QgZm9yIHRo
aXMsIHNvIHJhdGhlciB0aGFuIG5lZWRpbmcgdG8NCmludGVyY2VwdCBhbmQgcmVhY3QgdG8gRVBU
IGZhdWx0cyB2aWEgI1ZFLCB3ZSBjYW4gZXhwZWN0IHRoZSBndWVzdCBrZXJuZWwgdG8NCmV4cGxp
Y2l0bHkgY2FsbCBvdXIgc2VjdXJlLXJlYWxtIGZ1bmN0aW9ucyB2aWEgVk1GVU5DLCByZXBsYWNp
bmcgd2hhdCB3b3VsZA0Kb3RoZXJ3aXNlIGJlIHNvbWUgaHlwZXJjYWxscyBvdXQgdG8gWGVuIGlu
IHJvb3QgbW9kZS4gSSBzdXBwb3NlIHN1cHBvcnRpbmcNCnVubW9kaWZpZWQga2VybmVscyBieSBp
bnRlcmNlcHRpbmcgI1ZFIGNvdWxkIGJlIGFuIGludGVyZXN0aW5nIGVuaGFuY2VtZW50DQpmb3Ig
ZnV0dXJlIHdvcmssIGJ1dCBmb3Igbm93IHdlJ3JlIGNvbnRlbnQgdG8gd29yayB3aXRoIGEgY29v
cGVyYXRpdmUNCm1vZGlmaWVkIFBWSCBndWVzdCBhcyBhIHByb29mIG9mIGNvbmNlcHQuIDotKSkN
Cg0KQmFzaWNhbGx5LCB0aGUgcHJpbWFyeSBwMm0gd2lsbCBiZSAobGFyZ2VseSkgYXMgaXQgaXMg
bm9ybWFsbHksIGFuZCB0aGUNCnVudHJ1c3RlZCBndWVzdCBrZXJuZWwgYW5kIHVzZXJzcGFjZSB3
aWxsIHJ1biBvbiBpdCBhcyBhbiBIVk0vUFZIIGd1ZXN0DQpub3JtYWxseSB3b3VsZC4gVGhlIGFs
dGVybmF0ZSBwMm0gd2lsbCBoYXZlIHNvbWUgYWRkaXRpb25hbCBwcml2YXRlIGNvZGUgYW5kDQpk
YXRhIHBhZ2VzIG1hcHBlZCBpbiAoUldYIGluIHRoZSBhbHRwMm0sIGJ1dCBlaXRoZXIgcmVhZC1v
bmx5IG9yIGNvbXBsZXRlbHkNCnVubWFwcGVkIGluIHRoZSBwcmltYXJ5IHAybSksIGFzIHdlbGwg
YXMgdGhlIGhvc3QncyB4QVBJQyBNTUlPIHJhbmdlIHNvIGl0DQpjYW4gc2VuZCBJUElzIHRvIG90
aGVyIHZDUFVzIHdpdGhvdXQgaGF2aW5nIHRvIFZNLWV4aXQuIFRvIGZhY2lsaXRhdGUgc2FmZQ0K
dHJhbnNpdGlvbnMgYmV0d2VlbiB0aGVzZSB0d28gInJlYWxtcyIsIHdlJ2xsIGJlIGFkZGluZyBh
IGNvdXBsZSBvZg0KUi9YLXBlcm1pc3Npb25lZCAidHJhbXBvbGluZSBwYWdlcyIgdGhhdCB3aWxs
IGNvbnRhaW4gdGhlIFZNRlVOQyBpbnN0cnVjdGlvbnMNCnRoZW1zZWx2ZXMgYW5kIHdpbGwgYmUg
cHJlc2VudCBpbiBib3RoIHAybXMuDQoNClRoYW5rcywNCg0KRXRoYW4gSm9obnNvbg0KQ29tcHV0
ZXIgU2NpZW5jZSBQaEQgY2FuZGlkYXRlLCBTeXN0ZW1zIGdyb3VwLCBVbml2ZXJzaXR5IG9mIFJv
Y2hlc3Rlcg0KZWpvaG5zNDhAY3Mucm9jaGVzdGVyLmVkdQ0K

