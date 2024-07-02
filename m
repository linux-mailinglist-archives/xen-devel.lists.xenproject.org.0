Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CCF91ED2F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 05:01:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751904.1160001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOTkT-0000RP-0i; Tue, 02 Jul 2024 03:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751904.1160001; Tue, 02 Jul 2024 03:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOTkS-0000OK-TJ; Tue, 02 Jul 2024 03:00:04 +0000
Received: by outflank-mailman (input) for mailman id 751904;
 Tue, 02 Jul 2024 03:00:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMB5=OC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sOTkS-0000Bm-1u
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 03:00:04 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b9897f0-381f-11ef-958a-bbd156597b9e;
 Tue, 02 Jul 2024 05:00:01 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MN0PR12MB6365.namprd12.prod.outlook.com (2603:10b6:208:3c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Tue, 2 Jul
 2024 02:59:56 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 02:59:56 +0000
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
X-Inumbo-ID: 2b9897f0-381f-11ef-958a-bbd156597b9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlknwJ6JWNNXvuZbqixGox4blGBnKHvaI0HBRYaUHkX8FWy4o1mBAxPPM3vQc8rk/BigeKaUtwyIIT04m5M5ov03Haov57tG5i15OMePoK21ARQOtUm6QsqfCjKVifYYmg54H1Hc9DYUDUBlje2s6wlwDBhxPAKbXjTneANVQv7IM1JSZvKwoLSjJoCtovucOyv3xbZYTboGuVDzjx37ECouuHa1A6uQatUHmfmeytal3nV3qtVMEos44wZvhkvIot6Jcgv+/zMbfh3mwtYnZpQzFJZtCl98GaJHCOhjZMQbH0If2+027im9/LwdpCx7loYk2vooDy6ZYs4SkMJYXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLwLI26ur7cPX2ydCSUD1i+m2BSAhtJIdDFALZOz1TA=;
 b=TndQDb9DQ094aQDYOD9WCIkiL/CkFH3zMg16xEFum6NauD/3PwqA1or0O475b8WPJIQz75Z3q1if32FSdv4zS9aWwWv0IIN5KXsXrvVI4gRyZAH86y0xljujibuMr15wMtVyeV9qRp9WXE8BoiGWzpaZWCpos5AvSXO4KGKJkqCTw0sJ0cW1ZXM+86G2EsS0XvXEbU5B5I2ASyLaAVpaszo+tAGWiwJhXY+g2yZ2O0Pem5zNKH08kKVt9icAdtfc94KQ5Bnfq5CEYq6lKliOozZOLGyYOfAJ85acBckD7uNTM0gNwIVQu+9Ubm2xXd2QVbDhBoOrZ36s/ELVgjKMyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLwLI26ur7cPX2ydCSUD1i+m2BSAhtJIdDFALZOz1TA=;
 b=2nYEo0N0g743tdmz7wdsrL997r02tV9qRg9eZ1iQkrboBW/5CuXnxiEAY8g0Pw81km+sA4T2zdaXDZLgb3q4cde14cPundBnaYjuXS+APneg4gxcjQ6JHjnaimwF+YWc5a9o0AvgVJOo37byqHDi82zJxnOZkI+vl67B3g9xhHg=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v11 1/8] xen/vpci: Clear all vpci status of device
Thread-Topic: [XEN PATCH v11 1/8] xen/vpci: Clear all vpci status of device
Thread-Index: AQHayunNcO2Cg2N4oU+RLFI6zlmQRbHhd/AAgAHKnwA=
Date: Tue, 2 Jul 2024 02:59:56 +0000
Message-ID:
 <BL1PR12MB58494BFDE98D3CDAEB157AC7E7DC2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
 <20240630123344.20623-2-Jiqian.Chen@amd.com>
 <d145f307-2c66-4a2b-8a1f-d969ed4f2e6d@suse.com>
In-Reply-To: <d145f307-2c66-4a2b-8a1f-d969ed4f2e6d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7719.007)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MN0PR12MB6365:EE_
x-ms-office365-filtering-correlation-id: bf6b822d-df17-4848-2854-08dc9a430dba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RFphVEhOQVFIeUE4OTF0S2ZNQ09tVW5TTk1ZU1k0SG1FT2FoWWIyS0g3aDVG?=
 =?utf-8?B?a2RnV2JPdVBtZzV1N3RFcEZjMDFlVnJ6Z1A4RFhGRzRuZ2RheDZwZGJhc1ZM?=
 =?utf-8?B?MEZ2cHVJVkJvLzErNEx1aVd1aDdoaWJjVVV4dU5zbGs0S1BKNUp5dS9ibEkz?=
 =?utf-8?B?Mk9TR1pVVzhZMERueTFVeHJjOGZLNHUzeFVzWnFveVEyMVRwdDRWaU1FTkVR?=
 =?utf-8?B?SnlCeFArUlR3K3VRVHh3MDFiQ3ZoWUlnMDlabHg5OC9xa0UrelI4Q2ZwejQ1?=
 =?utf-8?B?TWxQM2ZXZExXa0puY0JMTlFYK0E5UTVvNFpTcVZ0RHNLQlJkYzZvOGs3c21u?=
 =?utf-8?B?U2xJNWZWbnoxYnN5RXFnV1dRRHBGM1Y4RkJTRVIzRDhxTkNsaUxQMkhleWJO?=
 =?utf-8?B?dEczbmZaVFpLUExLVkIwUkJSWmpwTGdHUTlIaDlRR3ZlTGFjWUZ4Mk5SRGlj?=
 =?utf-8?B?Ri9SdVRHeHhKcGpPaFpHSHFpUGNsRXZMTXp2NVpIV1hBK3ZXYUNla0VNYkpP?=
 =?utf-8?B?RG90bTl0aVZOVHAwREdaRk9ZWExFM1FIRU9NeFYxOGxneGQ3a2FjZDZzZFZ2?=
 =?utf-8?B?ZmUzcitEai9FR2o5VEtzUGxJdHhBQTVPUjJ2aTFxVnk1M2hnaGVSeXF1QXp1?=
 =?utf-8?B?UVFjMHlKSE1NVXNGMUVxbDZNVkIvaGtTdFBQTHZFTW1jUnhFTjRTc3h0N1ox?=
 =?utf-8?B?Y01HMUhYOU9xWFBsNEl2eHl4NEtjeVJKSGZVcUZUalNkemlKK1ZhY0JLRjF3?=
 =?utf-8?B?Sm9lQzVIRVIwbGZQUlQvSitLT3VPa1lqMWo5K0VDVmJ4ekszVUExOXdJK1RM?=
 =?utf-8?B?T0U2ODdTL3lGYUh6eW1TcFJFQVZjNkhOVDZXNjlxK094KzBhbTR5RTBMOXVX?=
 =?utf-8?B?cFhGcW80emZ4alRZayt2RHdNVlZra2xBa2dVU3lld1VoN0ozMGQ0Q3VNbkZr?=
 =?utf-8?B?UGtMTkE5Qk1ZSlVtS3NHZzAvNzVSR3NtL1VYbVg2U2xjU3FtRnNIK09NL21Q?=
 =?utf-8?B?TWxFQWh0SE5BaS9XK2Q4NE5sTmlodXRPT0cyMkl3Q1pFaGltYTRyT1NkS0Nk?=
 =?utf-8?B?aXdDS0NhVE0rbThzNHd0d3JTajJYZFBmNFB3SytGTjVUbVhKTGkwNFozalpE?=
 =?utf-8?B?Umoxa1JtWTBZVy80c2pPSkp4N0pid0JTUGdaKzNvWkNSUUlpaER3VFhlWnN4?=
 =?utf-8?B?VzZaVzJSSmJ3ekN1cEs0UDZsV3hqZlJ6L3U2ejUwZ0tKeHhOTjhCNlZLNzJH?=
 =?utf-8?B?MWxRajhVYVRlM2lxdFlMb2tSRmI1WDQ1TGNBY3I1OTJscjNPekVVQWUwbU1T?=
 =?utf-8?B?T2ZuaXJudkRPKzhrbXYySXZmUjNXdjU3Q2w0eTVFRjZjUHYwc05OS3lvbnZB?=
 =?utf-8?B?M2l5Ui92VkM3SUZGajJLN1NGZFM0MG42aEliRzVBSnFSa1k3T1pxNVJuVWZR?=
 =?utf-8?B?c3dMdk1ZY0RQKzJsaHdQWit3cGs5MU80My8wdjBPUU1vNWQvNjlhYm1Yd0Ju?=
 =?utf-8?B?OEIySFZ2OXh6MS8yeWdkYm5wcURsUnFHMnBCa1BZSGhlUG0rSExvYTFlNFE4?=
 =?utf-8?B?MkpteExOdWlJSXc5c21md0hEcmhlOWE0ekNmVmlOYWtocUUwZ3d5S2J3QW5U?=
 =?utf-8?B?eHo4YTdVcTZFTSttR2FzVS9aRnEySHhQcEk1N0dML2lhRExocGJCaHlKenFT?=
 =?utf-8?B?VjVKTnhnS0l4eXgyZU1aNE1GV0Z1RjMrQkE2bmVRS2F6aHJRaWFvbGxrc3FB?=
 =?utf-8?B?T2R2QjBpTEovS1cydzZJT3lXQ2FkV285VlArSWVoeC9oWmlBcUs5TnBYVlhj?=
 =?utf-8?B?dGY0a1cvU2dwN0JsTmdQRHYwdUJwcXZmVXo3eFF5eWRXYldQc3M5aDRsRGVY?=
 =?utf-8?B?ZXZOcU5qRWpOL3FpRUVBeURZWnJJcHd2R0RKdGJuWjdrWFE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WWRWbzBZWmVZOWsrNWZSS1BFRDJuNDhUdjFCcVlJZHpSZ3JaSjM3NmN2TDhu?=
 =?utf-8?B?bHVTazVJTkwxSmdzT2NKeVpWSmd4VjdKUWZsakxvOVFjRVkxYkFGNzBSb0Rh?=
 =?utf-8?B?aW9CbzM1dFdoRzhFak5Pc0FWNjVSZi9hbGl3c215Vms4OVVJSkhUS1l5RWRH?=
 =?utf-8?B?SEF5Wmp5MnBOaWhwSmt2VjhrQ1Vpd0k0L1JKSm4zakpnN0NDQ0VDRFNrZEZT?=
 =?utf-8?B?d1YvaXNOUERVQnFIdkY5NTl0YkFVLzVEOEtMaEd0R0dOSGJ3cktCZnJtWXpI?=
 =?utf-8?B?d1hkZXNQcWltWXFnZlVRc2lTZ1cxeGZDbTBybWZnMnJBMTJvcStDL1ZEcmdj?=
 =?utf-8?B?elFQZVQzZmtIMm1LSmVVT293SWZ6MHNjQU5nc09YSVN3RHVnQ3lxZU9WNnpr?=
 =?utf-8?B?Wlg3YlFXd3V3aVdEZEZaNUxsQTZqdk5UZ1RIOHVKMFFGK2RlNU90V3NTNWZK?=
 =?utf-8?B?b0puMDZXQTV2cXdoWkxBbXcrK3kvTzlLdnZJc0ZhQ0VMUFdJRWlQRUFVWDFG?=
 =?utf-8?B?MzlMcnBGMDFBUHM3eG9DTmlmbk9TUWphME1BVjdGQ2dERUNvYlJDRjdxY095?=
 =?utf-8?B?ekNSSkMydmdQL1o5aUg1RXAzbFVDNmdlSDhEbUF2QXVLdkJsQjhvUE9JRnJB?=
 =?utf-8?B?MWVwYmxvMEc5RXluTXp0T3VNWDgyY0N3RitDYlFjelpwYUJtUFpjRHlqelJo?=
 =?utf-8?B?VmZMYmdkQm41dVNQbXRQSzc1eXlKOWtYY21zekpkbmxnRWUxNU04dzArTnBu?=
 =?utf-8?B?U2lTWU01YXlIaCsvQ3VLTE5zTEJKRWhxYUVBUDFqWUN4d3h1ZnV5V0lyS2xo?=
 =?utf-8?B?d3pNKzB4UHZtZU5jNHh3Qy9uejZOMFcxS3BUTldXYmpIOXVCNWlWdk85S2Fx?=
 =?utf-8?B?WmpiOFV0OHo3ZExhRzZYY1lkQzh2bWFXNXhPYUZhQTRSQTFlYXlKdmhuRTFZ?=
 =?utf-8?B?TTN4TzRDK21kOU9xeGdsUzFJbXlvVkNGRU1IaUhqdmdZSUpnQTNwNXB5K1M4?=
 =?utf-8?B?aWtlUzNmUXBYb3R2YTVMZzJUc2lLK0x4UmJ2dXpCNWJieWV6M2x0OTJxQWNm?=
 =?utf-8?B?bmdmNlRKUWRvMDBHeWx6T1FFSmZjbzUwcFVpYWRzL0tCcWw2QnV1OTR1cmE1?=
 =?utf-8?B?TGtBQzV2TmVobEkzVnJZZGh1czhUdHhpU0hnQjBpdDhoSTE1Y0tsZTJXK2J0?=
 =?utf-8?B?ekxFeU9IOThISzdKNjd6c29JWSs5eitlQVYwMG9sWk1WU2p1RjRRQlROVkFX?=
 =?utf-8?B?QjVIcWpLQ3JSMkc3dlNuUk5pWkRJd2hpL0RrRUVVN2RpZU9LZ1ZYRTRZOTFh?=
 =?utf-8?B?WnJ3ZVlXeU11cUxuUTB6QUNNYmVsZ3VKQkkyM0dHRmd3SG45eHRnWnpXYmpE?=
 =?utf-8?B?NVgyR3o2dXZrMkQvc0E4UEVrM0RXVFVrRHNPWG4vb2doYUpDZ2NpdkhTYm9T?=
 =?utf-8?B?b3U1dGZZM1hUbktkSENXTXZYeEFiUGEvTUtDRnNpVzVHTUM4Vi9rVGpmZUE5?=
 =?utf-8?B?aWNUdXB3Yy9WM0djVWwzNlpMZTliK1RIeDZCK3BweWVOQUVlNzc3SWQ5TWpT?=
 =?utf-8?B?VUZ0R1R6RkZtWVdjUTNCd3k3d3NVZktTK2tVYWtzSXRKS3l1QXNEYTdFNWhI?=
 =?utf-8?B?d2pkQUJmMHhkbTVzcWc3bFBvTm5OZDBGS21Cam1GL291aGNCd3BneVpBTXdE?=
 =?utf-8?B?YTByOHgvRjJrT1VqYlNSYkhwWmg5dEU1UTJ5MHZsTkZibm9HZVozYlcwT1hU?=
 =?utf-8?B?WnVFRkZPanIyUmtjWnl4WDFzdXlQbFRIbWJpQ3FLY254aWRSNWRpanJHTCt4?=
 =?utf-8?B?L2pldFBvenRwZHhQQlovbnN3ZGx6U0RKbStxdkZwZGZyYkZYTDVHUnRuazAz?=
 =?utf-8?B?TjkrVHJXcjk0WjkvRmxCaW01TkR0R3pBb0huTG9tbmEzc2hyTzNaQzJWY0xP?=
 =?utf-8?B?L1A4OENBM2Y2UElialRkOFpnMktoSEJ4Vk5ZQUpncU1LMXFaTFc4ZHNJMUs5?=
 =?utf-8?B?L1FjaWlFa0pkajJBR24waW9ZWDdRejdYTTJ0eWwwV1AraUF1bTFDc3FQcjY3?=
 =?utf-8?B?MkZNcjkxTElsdDIzczlQYjlLcWtKVTU5YXNXT1JUalN2OWVKcGpNclA4d3dm?=
 =?utf-8?Q?iVOs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <803F06DF572266438842DB6AFA2CF205@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6b822d-df17-4848-2854-08dc9a430dba
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 02:59:56.3141
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oLQG1r4b1CJ0LVac6k8hn9Xf/WFtBz6MICryo6joK61j8mbyzehcwpEYuGziYjtapWVXKso/sbEkxiKdeAinPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6365

T24gMjAyNC83LzEgMTU6MTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAzMC4wNi4yMDI0IDE0
OjMzLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IFdoZW4gYSBkZXZpY2UgaGFzIGJlZW4gcmVzZXQg
b24gZG9tMCBzaWRlLCB0aGUgdnBjaSBvbiBYZW4NCj4+IHNpZGUgd29uJ3QgZ2V0IG5vdGlmaWNh
dGlvbiwgc28gdGhlIGNhY2hlZCBzdGF0ZSBpbiB2cGNpIGlzDQo+PiBhbGwgb3V0IG9mIGRhdGUg
Y29tcGFyZSB3aXRoIHRoZSByZWFsIGRldmljZSBzdGF0ZS4NCj4+IFRvIHNvbHZlIHRoYXQgcHJv
YmxlbSwgYWRkIGEgbmV3IGh5cGVyY2FsbCB0byBjbGVhciBhbGwgdnBjaQ0KPj4gZGV2aWNlIHN0
YXRlLiBXaGVuIHRoZSBzdGF0ZSBvZiBkZXZpY2UgaXMgcmVzZXQgb24gZG9tMCBzaWRlLA0KPj4g
ZG9tMCBjYW4gY2FsbCB0aGlzIGh5cGVyY2FsbCB0byBub3RpZnkgdnBjaS4NCj4gDQo+IFdoaWxl
IHRoZSBkZXNjcmlwdGlvbiBwcm9wZXJseSB0YWxrcyBhYm91dCBhbGwgb2YgdGhpcyBiZWluZyBh
Ym91dCBkZXZpY2UNCj4gcmVzZXQsIHRoZSB0aXRsZSBzdWdnZXN0cyBvdGhlcndpc2UgKGxlYXZp
bmcgb3BlbiB3aGF0IHRoZSBjb250ZXh0IGlzLCB0aHVzDQo+IC0gdG8gbWUgYXQgbGVhc3QgLSBz
dWdnZXN0aW5nIGl0J3MgZHVyaW5nIHZQQ0kgaW5pdCBmb3IgYSBwYXJ0aWN1bGFyDQo+IGRldmlj
ZSkuDQpDaGFuZ2UgdGl0bGUgdG8gInhlbi9wY2k6IEFkZCBoeXBlcmNhbGwgdG8gc3VwcG9ydCBy
ZXNldCBvZiBwY2lkZXYiID8NCg0KPiANCj4+IEBAIC02Nyw2ICs2OCw2MyBAQCByZXRfdCBwY2lf
cGh5c2Rldl9vcChpbnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykNCj4+
ICAgICAgICAgIGJyZWFrOw0KPj4gICAgICB9DQo+PiAgDQo+PiArICAgIGNhc2UgUEhZU0RFVk9Q
X3BjaV9kZXZpY2Vfc3RhdGVfcmVzZXQ6DQo+PiArICAgIHsNCj4+ICsgICAgICAgIHN0cnVjdCBw
Y2lfZGV2aWNlX3N0YXRlX3Jlc2V0IGRldl9yZXNldDsNCj4+ICsgICAgICAgIHN0cnVjdCBwY2lf
ZGV2ICpwZGV2Ow0KPj4gKyAgICAgICAgcGNpX3NiZGZfdCBzYmRmOw0KPj4gKw0KPj4gKyAgICAg
ICAgcmV0ID0gLUVPUE5PVFNVUFA7DQo+PiArICAgICAgICBpZiAoICFpc19wY2lfcGFzc3Rocm91
Z2hfZW5hYmxlZCgpICkNCj4+ICsgICAgICAgICAgICBicmVhazsNCj4+ICsNCj4+ICsgICAgICAg
IHJldCA9IC1FRkFVTFQ7DQo+PiArICAgICAgICBpZiAoIGNvcHlfZnJvbV9ndWVzdCgmZGV2X3Jl
c2V0LCBhcmcsIDEpICE9IDAgKQ0KPj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4gKw0KPj4gKyAg
ICAgICAgc2JkZiA9IFBDSV9TQkRGKGRldl9yZXNldC5kZXYuc2VnLA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgIGRldl9yZXNldC5kZXYuYnVzLA0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgIGRldl9yZXNldC5kZXYuZGV2Zm4pOw0KPj4gKw0KPj4gKyAgICAgICAgcmV0ID0geHNtX3Jl
c291cmNlX3NldHVwX3BjaShYU01fUFJJViwgc2JkZi5zYmRmKTsNCj4+ICsgICAgICAgIGlmICgg
cmV0ICkNCj4+ICsgICAgICAgICAgICBicmVhazsNCj4+ICsNCj4+ICsgICAgICAgIHBjaWRldnNf
bG9jaygpOw0KPj4gKyAgICAgICAgcGRldiA9IHBjaV9nZXRfcGRldihOVUxMLCBzYmRmKTsNCj4+
ICsgICAgICAgIGlmICggIXBkZXYgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgICAgIHBj
aWRldnNfdW5sb2NrKCk7DQo+PiArICAgICAgICAgICAgcmV0ID0gLUVOT0RFVjsNCj4+ICsgICAg
ICAgICAgICBicmVhazsNCj4+ICsgICAgICAgIH0NCj4+ICsNCj4+ICsgICAgICAgIHdyaXRlX2xv
Y2soJnBkZXYtPmRvbWFpbi0+cGNpX2xvY2spOw0KPj4gKyAgICAgICAgcGNpZGV2c191bmxvY2so
KTsNCj4+ICsgICAgICAgIC8qIEltcGxlbWVudCBGTFIsIG90aGVyIHJlc2V0IHR5cGVzIG1heSBi
ZSBpbXBsZW1lbnRlZCBpbiBmdXR1cmUgKi8NCj4gDQo+IFRoZSBjb21tZW50IGlzbid0IGluIHN5
bmMgd2l0aCB0aGUgY29kZSBhbnltb3JlLg0KQ2hhbmdlIHRvICIvKiB2cGNpX3Jlc2V0X2Rldmlj
ZV9zdGF0ZSBpcyBjYWxsZWQgYnkgZGVmYXVsdCBmb3IgYWxsIHJlc2V0IHR5cGVzLCBvdGhlciBz
cGVjaWZpYyBvcGVyYXRpb25zIGNhbiBiZSBhZGRlZCBsYXRlciBhcyBuZWVkZWQgKi8iID8NCg0K
PiANCj4+ICsgICAgICAgIHN3aXRjaCAoIGRldl9yZXNldC5yZXNldF90eXBlICkNCj4+ICsgICAg
ICAgIHsNCj4+ICsgICAgICAgIGNhc2UgUENJX0RFVklDRV9TVEFURV9SRVNFVF9DT0xEOg0KPj4g
KyAgICAgICAgY2FzZSBQQ0lfREVWSUNFX1NUQVRFX1JFU0VUX1dBUk06DQo+PiArICAgICAgICBj
YXNlIFBDSV9ERVZJQ0VfU1RBVEVfUkVTRVRfSE9UOg0KPj4gKyAgICAgICAgY2FzZSBQQ0lfREVW
SUNFX1NUQVRFX1JFU0VUX0ZMUjoNCj4+ICsgICAgICAgIHsNCj4gDQo+IFRoaXMgYnJhY2UgaXNu
J3QgbmVlZGVkIHdoaWxlIGF0IHRoZSBzYW1lIHRpbWUgaXQgaXMgY29uZnVzaW5nLg0KPiANCj4+
ICsgICAgICAgICAgICByZXQgPSB2cGNpX3Jlc2V0X2RldmljZV9zdGF0ZShwZGV2LCBkZXZfcmVz
ZXQucmVzZXRfdHlwZSk7DQo+PiArICAgICAgICAgICAgaWYgKCByZXQgKQ0KPj4gKyAgICAgICAg
ICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
IiVwcDogZmFpbGVkIHRvIHJlc2V0IHZQQ0kgZGV2aWNlIHN0YXRlXG4iLCAmc2JkZik7DQo+IA0K
PiBJIHF1ZXN0aW9uIHRoZSBuZWVkIGZvciBhIGxvZyBtZXNzYWdlIGhlcmUuDQpPSywgd2lsbCBk
ZWxldGUgaXQgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPj4gLS0tIGEveGVuL2luY2x1ZGUvcHVi
bGljL3BoeXNkZXYuaA0KPj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3BoeXNkZXYuaA0KPj4g
QEAgLTI5Niw2ICsyOTYsMTMgQEAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUocGh5c2Rldl9wY2lf
ZGV2aWNlX2FkZF90KTsNCj4+ICAgKi8NCj4+ICAjZGVmaW5lIFBIWVNERVZPUF9wcmVwYXJlX21z
aXggICAgICAgICAgMzANCj4+ICAjZGVmaW5lIFBIWVNERVZPUF9yZWxlYXNlX21zaXggICAgICAg
ICAgMzENCj4+ICsvKg0KPj4gKyAqIE5vdGlmeSB0aGUgaHlwZXJ2aXNvciB0aGF0IGEgUENJIGRl
dmljZSBoYXMgYmVlbiByZXNldCwgc28gdGhhdCBhbnkNCj4+ICsgKiBpbnRlcm5hbGx5IGNhY2hl
ZCBzdGF0ZSBpcyByZWdlbmVyYXRlZC4gIFNob3VsZCBiZSBjYWxsZWQgYWZ0ZXIgYW55DQo+PiAr
ICogZGV2aWNlIHJlc2V0IHBlcmZvcm1lZCBieSB0aGUgaGFyZHdhcmUgZG9tYWluLg0KPj4gKyAq
Lw0KPj4gKyNkZWZpbmUgUEhZU0RFVk9QX3BjaV9kZXZpY2Vfc3RhdGVfcmVzZXQgMzINCj4+ICsN
Cj4+ICBzdHJ1Y3QgcGh5c2Rldl9wY2lfZGV2aWNlIHsNCj4+ICAgICAgLyogSU4gKi8NCj4+ICAg
ICAgdWludDE2X3Qgc2VnOw0KPj4gQEAgLTMwNSw2ICszMTIsMTkgQEAgc3RydWN0IHBoeXNkZXZf
cGNpX2RldmljZSB7DQo+PiAgdHlwZWRlZiBzdHJ1Y3QgcGh5c2Rldl9wY2lfZGV2aWNlIHBoeXNk
ZXZfcGNpX2RldmljZV90Ow0KPj4gIERFRklORV9YRU5fR1VFU1RfSEFORExFKHBoeXNkZXZfcGNp
X2RldmljZV90KTsNCj4+ICANCj4+ICtzdHJ1Y3QgcGNpX2RldmljZV9zdGF0ZV9yZXNldCB7DQo+
PiArICAgIHBoeXNkZXZfcGNpX2RldmljZV90IGRldjsNCj4+ICsjZGVmaW5lIF9QQ0lfREVWSUNF
X1NUQVRFX1JFU0VUX0NPTEQgMA0KPj4gKyNkZWZpbmUgUENJX0RFVklDRV9TVEFURV9SRVNFVF9D
T0xEICAoMVU8PF9QQ0lfREVWSUNFX1NUQVRFX1JFU0VUX0NPTEQpDQo+PiArI2RlZmluZSBfUENJ
X0RFVklDRV9TVEFURV9SRVNFVF9XQVJNIDENCj4+ICsjZGVmaW5lIFBDSV9ERVZJQ0VfU1RBVEVf
UkVTRVRfV0FSTSAgKDFVPDxfUENJX0RFVklDRV9TVEFURV9SRVNFVF9XQVJNKQ0KPj4gKyNkZWZp
bmUgX1BDSV9ERVZJQ0VfU1RBVEVfUkVTRVRfSE9UICAyDQo+PiArI2RlZmluZSBQQ0lfREVWSUNF
X1NUQVRFX1JFU0VUX0hPVCAgICgxVTw8X1BDSV9ERVZJQ0VfU1RBVEVfUkVTRVRfSE9UKQ0KPj4g
KyNkZWZpbmUgX1BDSV9ERVZJQ0VfU1RBVEVfUkVTRVRfRkxSICAzDQo+PiArI2RlZmluZSBQQ0lf
REVWSUNFX1NUQVRFX1JFU0VUX0ZMUiAgICgxVTw8X1BDSV9ERVZJQ0VfU1RBVEVfUkVTRVRfRkxS
KQ0KPj4gKyAgICB1aW50MzJfdCByZXNldF90eXBlOw0KPj4gK307DQo+IA0KPiBEbyB3ZSByZWFs
bHkgbmVlZCB0aGUgX1BDSV9ERVZJQ0VfU1RBVEVfUkVTRVRfKiBiaXQgcG9zaXRpb25zIGFzIHNl
cGFyYXRlDQo+ICNkZWZpbmUtcz8gSSBjYW4ndCBzcG90IGFueSB1c2UgYW55d2hlcmUuDQpJIHRo
b3VnaHQgaXQgd2FzIGEgY29kaW5nIHN0eWxlLg0KSSB3aWxsIGRlbGV0ZSB0aGVtIGluIG5leHQg
dmVyc2lvbi4NCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4u
DQo=

