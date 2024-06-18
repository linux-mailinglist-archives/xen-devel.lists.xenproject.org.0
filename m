Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 161F090C4DE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 10:24:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742809.1149680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJU8N-0000Av-P2; Tue, 18 Jun 2024 08:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742809.1149680; Tue, 18 Jun 2024 08:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJU8N-00008x-Jr; Tue, 18 Jun 2024 08:24:07 +0000
Received: by outflank-mailman (input) for mailman id 742809;
 Tue, 18 Jun 2024 08:24:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kZif=NU=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sJU8L-00008n-MJ
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 08:24:05 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2418::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f12d825-2d4c-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 10:24:04 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB6882.namprd12.prod.outlook.com (2603:10b6:510:1b8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 08:24:00 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 08:23:59 +0000
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
X-Inumbo-ID: 1f12d825-2d4c-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSyoMmP2r3KPC17OEPWykaZGn8BY5PlalkbQqnKmhGSbmtHNARxUfkbGrmsKy8NRE0u18fb9CggkfL+1RkkR/TRymO4G1eJWR9/H5/n+CaX3WuXSht3uOpHQ/z2cpWCh9p4yI0RN3Biz9Zn+ziDIDs1EWjZsOYMQYDIczT8bhOjGXT2PvlXMBQzEBpWO3Z+xNmoPGTN0twOmIFZtMpUj0g8EDnzGDcjJeNR3p6D3iZKJJe+uHd/gSzqEjWTdoegRyapdsncYkRgSE55XVQNf8V/RA53XByIqYMGF7LSezoupnblXmVgxHkIBUzMw++DbXoxutzZRYoR6HscTm3CqfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7miz8qTI9zr5xqRGBBgWCe6vq7t40Ed+vk14O0FXN6w=;
 b=FscOtnNXu1Dteyc9RYiPlrg58DGrnf8+KKjLIjr1oJ0tH06KClg6GT/NdtOAoWX37bD9aGYCwxrRPpW7yx8xG6uge4CjVOTZckw26nQr1dC6dR9sysAPPLGN9fUnOZQEEfLQu2BD9tq/EO6UxmgDkbjYSWTE/ncRfV+X62V/WSFYpM+jwKX5NazxJNVxlVYmWDOWEyfrnlqBnaIWt//y5vDi2/peYRNuIZrpVvSIR+gF9JU22AUB2y9V/iKsk5g4UJXaUp9m60Vxq+6+OKxgo0Z7QvVB9b/1SRZNLQgJ32z83gLECNiSQpD8/OdLz8B9YmOgSliXkh98IaSO8bun2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7miz8qTI9zr5xqRGBBgWCe6vq7t40Ed+vk14O0FXN6w=;
 b=xQIElMy/lB/SNg9wRRO2yTMBR6cXKOwwawwuy7/ljpZ7v5yvvz9H9IfLsWaPKWMDG9luXETAHmy7vxSlUqW/zOrgIMvZ6u2vHEQf1PrB6wID1OXca7vDKTG2omeJW1DSanXuXQVdOA32zWWU7Seya7hBHLQ0rVr9Is/B7xGHL/s=
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
Subject: Re: [XEN PATCH v10 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Topic: [XEN PATCH v10 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Index: AQHawJTqXyg3PMEiVUiLHPQ86aZkYrHMFeyAgAGdTwA=
Date: Tue, 18 Jun 2024 08:23:59 +0000
Message-ID:
 <BL1PR12MB584916579E2C16C6C9F86D1FE7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-6-Jiqian.Chen@amd.com>
 <b4b6cbcd-dd71-44da-aea8-6a4a170d73d5@suse.com>
In-Reply-To: <b4b6cbcd-dd71-44da-aea8-6a4a170d73d5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7677.026)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB6882:EE_
x-ms-office365-filtering-correlation-id: cda5de20-a29e-40dc-ed42-08dc8f7000e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|1800799021|7416011|376011|366013|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?bW1zaU43TFZueXNDYTlJdlFBZGx0bzBlclRsVE5pdkNNd1gySnNwazNZcTd1?=
 =?utf-8?B?Wi9NV2JYWXNTOFVNL1pKR3dHN0xYRWJ3VHlwS3UxMVNMV09Qb0dqRi9NdS90?=
 =?utf-8?B?T0plUE1pdjVQQXlWL0VNTXBhZDNzNmpOQ09mS3lndW5HQkFTYkI1Y0JLdVl4?=
 =?utf-8?B?TUpNdEZYOGk0MGJMamhnWlVPTzhFb2tCZ05saXAwNlcveE5jS0xMZlNDWnhj?=
 =?utf-8?B?VFFJRWd5K2ZiU2IvcFA3cHp6M09TcWNZSmdjVG1VdnhENXRpQ1ZXSWh1K3p2?=
 =?utf-8?B?TmFicFhBMnA5clNHLzNrcTlUYkxaZ0E4Sm4xdWw0VjFML0ZXaVlrZTJHdS9z?=
 =?utf-8?B?RlNGd2E4V3V0ZC96eHJ4VUR3N2J1cGYybHJRS2o3QnRtMUFhVWY4MmFlWlM2?=
 =?utf-8?B?RlpCVGxVRGpwMW5uWXpHQTR6aVNFRzVhVkFuOUNNS1ZGdHM3TzZCbmt0Rjlo?=
 =?utf-8?B?blVUMVNQa2dmamovcXREelJudTAycVMwbVIwNFV5VHhrb0xCQmZKclpnT0VX?=
 =?utf-8?B?ZGk5N2ZHRHlPZGFWNTRad1ZMcDZsRkR3MXhnbkhlT1U0cjV6UVN5d2d0Mm14?=
 =?utf-8?B?bEtSWi9yTUNPNGVwc1ZoazI1ZGdyaXVyYi8rSXM0bk8yQnhVa0xkWjdBNG13?=
 =?utf-8?B?eFhjdlE3ajB0WURVTkRSU3NBV3ExVEJ4OW5mbnRGdVoxNEtPZ0RHSHAvVlVp?=
 =?utf-8?B?YUVoRHhVL3laQVM4dGNHNFBiMlluN0RyZnhUYWZ5elEvREhRNzRnL1pVL3lO?=
 =?utf-8?B?eUFRaVZ3OXNHNTJRdCthKzlQcGJSTE83aHIwRzZSN2hmeFhzM2EvWVc2a2Vk?=
 =?utf-8?B?OGNMczdRQmQ1YU9HYVNHSmcyOEx6U1JnZmFRY3IvdVZmKzB5ZStBWXlURTlj?=
 =?utf-8?B?Y2dQenorWS9GeFlHRFBEbFJBMTlPdmNVQjRJOEtKUngreTYyOGpOSUE1RDhq?=
 =?utf-8?B?MFFsRnQ1V0p4UG9rT1NzcVJNWUc5L01WR1NTdzlBdDVCNGViNjh3c0dEb3c0?=
 =?utf-8?B?dVRULzRXMmpjK2RIWGJJVVVPL1IyR1Z4NTRmbmVRSGU2OXhteTNCS25BNVpN?=
 =?utf-8?B?RnRWcnRMczhwc0ozdi8ra01VdU1mQ2VLcUFaTVhSWlIxdm5SNWJpV1I0djR1?=
 =?utf-8?B?cUI2cFgvWTZQQ0UvK1E1Qy9jcnl0UGtVV1BvYzFTK2FVdC96WXpHOGxlQWJ6?=
 =?utf-8?B?VzhnaUxzSGVKVFcySE82UTh5UW5TcmttY2hjZ0FvOVVnWFY0bEhtWHlRcm9X?=
 =?utf-8?B?TFhmcDVzTmxsM01ZRkgrS3lOYkM2ZWZGVXBRNWdkS0duVkc4WWdOOU9ISkdo?=
 =?utf-8?B?Mm40Z1BNMnZmbWZHanl5Mm1ham5TazlCMHE2TFZFUEtldVFmOThoSFV1MW85?=
 =?utf-8?B?WDdTUTFaeFArWC90R0hmZEY2aGw4eGVZbFl6YmFpYnJtRGV1UDdROXF2dmVl?=
 =?utf-8?B?NVg4OEt6cFVaK1p4bTByK2JIM0RNYnNoRUM4cWpFdlM4T2VtRjBVRDhzVGNq?=
 =?utf-8?B?MTZqckZEYnhNS3k2aGhWeERBdkhHc0p1NnY2c0M2Q0QxeERhVG1adjUrZFow?=
 =?utf-8?B?bnduei8rdzAzcWkraC9ldGVMNTAvSkVha2ZpSmxtTC8wSXcrMGxRUjhHYTRs?=
 =?utf-8?B?TTZZVjFsSDZ5N0pWUmtjTDFORVZhMDRPUTUvVStCalFsK3I3akcydGhrT0w2?=
 =?utf-8?B?ZDRpZ2swdjZZMUJjZ2VzL2pQWE5DV0FySUo2MnV4cWtmdFRrQnJCSGx2WW9o?=
 =?utf-8?B?Tnc4NzcydnE0Um1oYTRXQWtqeHJTR2tleC9OMEQ2S1pubjlrN0gwMm9nUUs1?=
 =?utf-8?Q?NgXiARrChoosAIJdtTxe4ck/g5qiDK940wMF8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(7416011)(376011)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b25nYkdaWVhxek5FWTVzcmMvSjV2a0NiU3RWMlY3VTFvM2lQSDhMRHM1UGFT?=
 =?utf-8?B?S2JOQXVOdDBjaVIrRjR5a00xVjVtcFBvbzBkRjVDQVY2Y2Jnd2pSNE5qTzVu?=
 =?utf-8?B?MXpyVTZPT1JUdkFBbFA0NGRxWFVqekd1NGtKWEtrb1UrNld6bDRXdGRkMFNK?=
 =?utf-8?B?ZDYyWm0wc0Y0TW9KclpSbFhLcDdLc2ozalhDa0N3UGRkcUczNzgzR2tWWVR5?=
 =?utf-8?B?N3kvZE9aeXJSQ2Z0cm1jeStjaS9TTlRMcnY0UjJ5M0hBeCt4QnNWYjhCWTc5?=
 =?utf-8?B?L2xJZTU4Q1Y0bFR2UnZ5L25HcFVVdkNuL1YxbTJEcVV0bnozTllnKy83Z2tL?=
 =?utf-8?B?MW9wMXJ2Z010TjRnWFFLb1B6dHJCSVhCa2tEbEhZVDJ1YTNFenhpS1hOd2Fr?=
 =?utf-8?B?b01YTzZ6WldQakYvOEJjU0lpWU1NTW1ma2JnVEc3VFNLK1ZMcXI0ejlwcVpH?=
 =?utf-8?B?OVdqYnFXRFptTkFwNUdOR0hVSnRoN1g3Qmg3ckVZTjFLQkd3U3Bobm0xYkox?=
 =?utf-8?B?cjM1N2h1S1pDLzQ2V2dJQW45MkhkdEhtYUlMcGZDSjVyMWRKNldweUoweSti?=
 =?utf-8?B?MWhGczZyeUNjYlJzOUlJaFNwcENWc2VTdzJkajJ2TlBPYzBNOU9GOGJITUJu?=
 =?utf-8?B?L21oVzJseFVJRjE5RXJmOHo3L1JWWEo3eitKbUtRQmJFMDB2RTV0K1NFbUt3?=
 =?utf-8?B?QUExYlU3R3AySDBVbnpIUnY5bnR3UFJXd3hMc09hYmFqam56QnpsNjRwcDNE?=
 =?utf-8?B?VGJadU93ejErYmFaQXU2OUxZUGdyeUNrVG1Cd2p0QzJPUDk0NlhadVFmVWVn?=
 =?utf-8?B?K1hqRkpnMW5zYzVJeVQ0aXErZzBWZ3dCK1o2WWFPM0hJaVVKZEJhVk5ZVngx?=
 =?utf-8?B?eUVDQ01BeDZWUWE1QnVFNlByTFJMZ1VOeFRtSmJrL0laVjJ6azRCdG9HSTBR?=
 =?utf-8?B?NGlLbnRRNmpmYWx2TmRjc3dzaE9FaVpaZ0EwK2hzUW5teGxkcVNPMmVJOFV1?=
 =?utf-8?B?TFFLQVFWc3p4ZmRJd2hOSVk5TGZPRUJMb3IwN0FKbUMzTjZVRDZ4TWRwVk9z?=
 =?utf-8?B?blFOZTlGTkFKYyt3OWQreHFCcGdrTGNvWEJqMUUzNC9NRWR0ai9kcDBZdTdK?=
 =?utf-8?B?SnF1S3d6SFdiTnA2MWNVYnRXbnA5bUZTWlZrQ0lmY3lsenJONENGd1hvT0xD?=
 =?utf-8?B?cmhSM3YxKzhmNVhGcUV1NnlMSUZSZWtubGRUSmsxalo4RldhOGRobnlvdW4v?=
 =?utf-8?B?eWlRNllxZHh1MDArSzdHY2FvU2pIazZDU2JHcUZuai9OTHVRY2ljbXV2SklM?=
 =?utf-8?B?dDY0NnM1OU5Zb0ZsUzNwRXJWZXgwbVYreXUwUHhWWXFvNy80bThCZ3BUTGR3?=
 =?utf-8?B?TFVXMzNRUncwTTROSnhPVFl1eE0vZGwyL01iT1hRSkZBVUdFbkhUSUtBY29B?=
 =?utf-8?B?UmxKYlMxMTNtcnphajVuUXJCd1Q0S2VPaVZMYXRGaFJITGtDMkxyRFhDSEJv?=
 =?utf-8?B?U0V1Y0lsbXVVWkdPRGxGaTE2YTRNaTBxZHdRNmlkRTVad0h0WkNFdCswQU1i?=
 =?utf-8?B?ZXozUmlxWjBwdlQwUCtRVnA2QnF4dnZhbU5wK2VrQ0wyUURXZEk0QnFVbTFF?=
 =?utf-8?B?SGZMNFNHTzVqWXpxS3A3Vlc2WjBueU9FSmo4eVc2MzQrTm1UcG9QcU9tMFcx?=
 =?utf-8?B?RHJkYnRWUy9NcHN6SWFrU1JmVytrdFJIM3lOQitIL1BtcWNJWkpwSGw2aVc5?=
 =?utf-8?B?TkJWbis0SXJwcUtoNGdtK0xuOFRTT3k2YUxLUWRwOWNZQ3VXQnBFUi83UTdo?=
 =?utf-8?B?ejhtRTNxa3NySUc1NEsvcFhWdlFxVHFYdDE2SGhQSFpla2haRm5YS2hqRW0v?=
 =?utf-8?B?alYydHpPN1lMekpvSllac1d5Q29wL3g1VmlvVzYzR29za2plWGFDU0k5cTQw?=
 =?utf-8?B?UGlTczBveHgxUWMrVjF2S3d3dDcxdE9VVEs1cTM0QUNkMWptbGloREF3WDNz?=
 =?utf-8?B?dkthOUIyb000R1NEZ3NCVmJiNXNLQ0VWVjBCVE1TczdaK2dTV1NRUHpYbmc3?=
 =?utf-8?B?YTJ2Qkw0bUdKM3VDUm5MY0pJNnBGZ1RNYlluczZqNDRqcm1xZ3VURnJ4R0N0?=
 =?utf-8?Q?WGM0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <755B514EA0994F4BAA9E12A76F387F1A@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cda5de20-a29e-40dc-ed42-08dc8f7000e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 08:23:59.3417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uS/k5RF0EkPpfGur3sLIr0dlFpLNl9MQFj/DBaQT8CpgV3nG9pXn4Qjbqi/HbChnEZJ3WwZE06rbspaTBiD9gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6882

T24gMjAyNC82LzE3IDIzOjMyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTcuMDYuMjAyNCAx
MTowMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBTb21lIHR5cGUgb2YgZG9tYWluIGRvbid0IGhh
dmUgUElSUXMsIGxpa2UgUFZILCBpdCBkb2Vzbid0IGRvDQo+PiBQSFlTREVWT1BfbWFwX3BpcnEg
Zm9yIGVhY2ggZ3NpLiBXaGVuIHBhc3N0aHJvdWdoIGEgZGV2aWNlDQo+PiB0byBndWVzdCBiYXNl
IG9uIFBWSCBkb20wLCBjYWxsc3RhY2sNCj4+IHBjaV9hZGRfZG1fZG9uZS0+WEVOX0RPTUNUTF9p
cnFfcGVybWlzc2lvbiB3aWxsIGZhaWwgYXQgZnVuY3Rpb24NCj4+IGRvbWFpbl9waXJxX3RvX2ly
cSwgYmVjYXVzZSBQVkggaGFzIG5vIG1hcHBpbmcgb2YgZ3NpLCBwaXJxIGFuZA0KPj4gaXJxIG9u
IFhlbiBzaWRlLg0KPj4gV2hhdCdzIG1vcmUsIGN1cnJlbnQgaHlwZXJjYWxsIFhFTl9ET01DVExf
aXJxX3Blcm1pc3Npb24gcmVxdWlyZXMNCj4+IHBhc3NpbmcgaW4gcGlycSwgaXQgaXMgbm90IHN1
aXRhYmxlIGZvciBkb20wIHRoYXQgZG9lc24ndCBoYXZlDQo+PiBQSVJRcy4NCj4+DQo+PiBTbywg
YWRkIGEgbmV3IGh5cGVyY2FsbCBYRU5fRE9NQ1RMX2dzaV9wZXJtaXNzaW9uIHRvIGdyYW50IHRo
ZQ0KPj4gcGVybWlzc2lvbiBvZiBpcnEodHJhbnNsYXRlIGZyb20gZ3NpKSB0byBkdW1VIHdoZW4g
ZG9tMCBoYXMgbm8NCj4+IFBJUlFzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVu
IDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXku
aHVhbmdAYW1kLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hl
bkBhbWQuY29tPg0KPj4gLS0tDQo+PiBSRkM6IGl0IG5lZWRzIHJldmlldyBhbmQgbmVlZHMgdG8g
d2FpdCBmb3IgdGhlIGNvcnJlc3BvbmRpbmcgdGhpcmQgcGF0Y2ggb24gbGludXgga2VybmVsIHNp
ZGUgdG8gYmUgbWVyZ2VkLg0KPj4gLS0tDQo+PiAgdG9vbHMvaW5jbHVkZS94ZW5jdHJsLmggICAg
ICAgICAgICB8ICA1ICsrKw0KPj4gIHRvb2xzL2xpYnMvY3RybC94Y19kb21haW4uYyAgICAgICAg
fCAxNSArKysrKysrDQo+PiAgdG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2kuYyAgICAgICB8IDY3
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQ0KPj4gIHhlbi9hcmNoL3g4Ni9kb21jdGwu
YyAgICAgICAgICAgICAgfCA0MyArKysrKysrKysrKysrKysrKysrDQo+PiAgeGVuL2FyY2gveDg2
L2luY2x1ZGUvYXNtL2lvX2FwaWMuaCB8ICAyICsNCj4+ICB4ZW4vYXJjaC94ODYvaW9fYXBpYy5j
ICAgICAgICAgICAgIHwgMTcgKysrKysrKysNCj4+ICB4ZW4vYXJjaC94ODYvbXBwYXJzZS5jICAg
ICAgICAgICAgIHwgIDMgKy0NCj4+ICB4ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmggICAgICAg
IHwgIDggKysrKw0KPj4gIHhlbi94c20vZmxhc2svaG9va3MuYyAgICAgICAgICAgICAgfCAgMSAr
DQo+PiAgOSBmaWxlcyBjaGFuZ2VkLCAxNTMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvaW5jbHVkZS94ZW5jdHJsLmggYi90b29scy9pbmNs
dWRlL3hlbmN0cmwuaA0KPj4gaW5kZXggYTAzODFmNzRkMjRiLi5mM2ZlYjY4NDhlMjUgMTAwNjQ0
DQo+PiAtLS0gYS90b29scy9pbmNsdWRlL3hlbmN0cmwuaA0KPj4gKysrIGIvdG9vbHMvaW5jbHVk
ZS94ZW5jdHJsLmgNCj4+IEBAIC0xMzgyLDYgKzEzODIsMTEgQEAgaW50IHhjX2RvbWFpbl9pcnFf
cGVybWlzc2lvbih4Y19pbnRlcmZhY2UgKnhjaCwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVpbnQzMl90IHBpcnEsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBi
b29sIGFsbG93X2FjY2Vzcyk7DQo+PiAgDQo+PiAraW50IHhjX2RvbWFpbl9nc2lfcGVybWlzc2lv
bih4Y19pbnRlcmZhY2UgKnhjaCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVp
bnQzMl90IGRvbWlkLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3Qg
Z3NpLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBhbGxvd19hY2Nlc3Mp
Ow0KPj4gKw0KPj4gIGludCB4Y19kb21haW5faW9tZW1fcGVybWlzc2lvbih4Y19pbnRlcmZhY2Ug
KnhjaCwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgZG9taWQs
DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmlyc3Rf
bWZuLA0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvY3RybC94Y19kb21haW4uYyBiL3Rvb2xz
L2xpYnMvY3RybC94Y19kb21haW4uYw0KPj4gaW5kZXggZjJkOWQxNGI0ZDlmLi44NTQwZTg0ZmRh
OTMgMTAwNjQ0DQo+PiAtLS0gYS90b29scy9saWJzL2N0cmwveGNfZG9tYWluLmMNCj4+ICsrKyBi
L3Rvb2xzL2xpYnMvY3RybC94Y19kb21haW4uYw0KPj4gQEAgLTEzOTQsNiArMTM5NCwyMSBAQCBp
bnQgeGNfZG9tYWluX2lycV9wZXJtaXNzaW9uKHhjX2ludGVyZmFjZSAqeGNoLA0KPj4gICAgICBy
ZXR1cm4gZG9fZG9tY3RsKHhjaCwgJmRvbWN0bCk7DQo+PiAgfQ0KPj4gIA0KPj4gK2ludCB4Y19k
b21haW5fZ3NpX3Blcm1pc3Npb24oeGNfaW50ZXJmYWNlICp4Y2gsDQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1aW50MzJfdCBkb21pZCwNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVpbnQzMl90IGdzaSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGJvb2wgYWxsb3dfYWNjZXNzKQ0KPj4gK3sNCj4+ICsgICAgc3RydWN0IHhlbl9kb21jdGwgZG9t
Y3RsID0gew0KPj4gKyAgICAgICAgLmNtZCA9IFhFTl9ET01DVExfZ3NpX3Blcm1pc3Npb24sDQo+
PiArICAgICAgICAuZG9tYWluID0gZG9taWQsDQo+PiArICAgICAgICAudS5nc2lfcGVybWlzc2lv
bi5nc2kgPSBnc2ksDQo+PiArICAgICAgICAudS5nc2lfcGVybWlzc2lvbi5hbGxvd19hY2Nlc3Mg
PSBhbGxvd19hY2Nlc3MsDQo+PiArICAgIH07DQo+PiArDQo+PiArICAgIHJldHVybiBkb19kb21j
dGwoeGNoLCAmZG9tY3RsKTsNCj4+ICt9DQo+PiArDQo+PiAgaW50IHhjX2RvbWFpbl9pb21lbV9w
ZXJtaXNzaW9uKHhjX2ludGVyZmFjZSAqeGNoLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1aW50MzJfdCBkb21pZCwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgbG9uZyBmaXJzdF9tZm4sDQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9s
aWdodC9saWJ4bF9wY2kuYyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMNCj4+IGluZGV4
IDM3NmY5MTc1OWFjNi4uZjAyN2YyMmMwMDI4IDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMvbGlicy9s
aWdodC9saWJ4bF9wY2kuYw0KPj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2kuYw0K
Pj4gQEAgLTE0MzEsNiArMTQzMSw5IEBAIHN0YXRpYyB2b2lkIHBjaV9hZGRfZG1fZG9uZShsaWJ4
bF9fZWdjICplZ2MsDQo+PiAgICAgIHVpbnQzMl90IGZsYWcgPSBYRU5fRE9NQ1RMX0RFVl9SRE1f
UkVMQVhFRDsNCj4+ICAgICAgdWludDMyX3QgZG9tYWluaWQgPSBkb21pZDsNCj4+ICAgICAgYm9v
bCBpc3N0dWJkb20gPSBsaWJ4bF9pc19zdHViZG9tKGN0eCwgZG9taWQsICZkb21haW5pZCk7DQo+
PiArI2lmZGVmIENPTkZJR19YODYNCj4+ICsgICAgeGNfZG9tYWluaW5mb190IGluZm87DQo+PiAr
I2VuZGlmDQo+PiAgDQo+PiAgICAgIC8qIENvbnZlbmllbmNlIGFsaWFzZXMgKi8NCj4+ICAgICAg
Ym9vbCBzdGFydGluZyA9IHBhcy0+c3RhcnRpbmc7DQo+PiBAQCAtMTUxNiwxNCArMTUxOSwzOSBA
QCBzdGF0aWMgdm9pZCBwY2lfYWRkX2RtX2RvbmUobGlieGxfX2VnYyAqZWdjLA0KPj4gICAgICAg
ICAgICAgIHJjID0gRVJST1JfRkFJTDsNCj4+ICAgICAgICAgICAgICBnb3RvIG91dDsNCj4+ICAg
ICAgICAgIH0NCj4+IC0gICAgICAgIHIgPSB4Y19kb21haW5faXJxX3Blcm1pc3Npb24oY3R4LT54
Y2gsIGRvbWlkLCBpcnEsIDEpOw0KPj4gKyNpZmRlZiBDT05GSUdfWDg2DQo+PiArICAgICAgICAv
KiBJZiBkb20wIGRvZXNuJ3QgaGF2ZSBQSVJRcywgbmVlZCB0byB1c2UgeGNfZG9tYWluX2dzaV9w
ZXJtaXNzaW9uICovDQo+PiArICAgICAgICByID0geGNfZG9tYWluX2dldGluZm9fc2luZ2xlKGN0
eC0+eGNoLCAwLCAmaW5mbyk7DQo+IA0KPiBIYXJkLWNvZGVkIDAgaXMgaW1wb3NpbmcgbGltaXRh
dGlvbnMuIElkZWFsbHkgeW91IHdvdWxkIHVzZSBET01JRF9TRUxGLCBidXQNCj4gSSBkaWRuJ3Qg
Y2hlY2sgaWYgdGhhdCBjYW4gYmUgdXNlZCB3aXRoIHRoZSB1bmRlcmx5aW5nIGh5cGVyY2FsbChz
KS4gT3RoZXJ3aXNlDQo+IHlvdSB3YW50IHRvIHBhc3MgdGhlIGFjdHVhbCBkb21pZCBvZiB0aGUg
bG9jYWwgZG9tYWluIGhlcmUuDQpCdXQgdGhlIGFjdGlvbiBvZiBncmFudGluZyBwZXJtaXNzaW9u
IGlzIGZyb20gZG9tMCB0byBkb21VLCB3aGF0IEkgbmVlZCB0byBnZXQgaXMgdGhlIGluZm9tYXRp
b24gb2YgZG9tMCwNClRoZSBhY3R1YWwgZG9taWQgaGVyZSBpcyBkb21VJ3MgaWQgSSB0aGluaywg
aXQgaXMgbm90IHVzZWZ1bC4NCg0KPiANCj4+ICAgICAgICAgIGlmIChyIDwgMCkgew0KPj4gLSAg
ICAgICAgICAgIExPR0VEKEVSUk9SLCBkb21haW5pZCwNCj4+IC0gICAgICAgICAgICAgICAgICAi
eGNfZG9tYWluX2lycV9wZXJtaXNzaW9uIGlycT0lZCAoZXJyb3I9JWQpIiwgaXJxLCByKTsNCj4+
ICsgICAgICAgICAgICBMT0dFRChFUlJPUiwgZG9tYWluaWQsICJnZXRkb21haW5pbmZvIGZhaWxl
ZCAoZXJyb3I9JWQpIiwgZXJybm8pOw0KPj4gICAgICAgICAgICAgIGZjbG9zZShmKTsNCj4+ICAg
ICAgICAgICAgICByYyA9IEVSUk9SX0ZBSUw7DQo+PiAgICAgICAgICAgICAgZ290byBvdXQ7DQo+
PiAgICAgICAgICB9DQo+PiArICAgICAgICBpZiAoaW5mby5mbGFncyAmIFhFTl9ET01JTkZfaHZt
X2d1ZXN0ICYmDQo+IA0KPiBZb3Ugd2FudCB0byBwYXJlbnRoZXNpemUgdGhlICYgaGVyZS4NCldp
bGwgY2hhbmdlIGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4+ICsgICAgICAgICAgICAhKGluZm8u
YXJjaF9jb25maWcuZW11bGF0aW9uX2ZsYWdzICYgWEVOX1g4Nl9FTVVfVVNFX1BJUlEpICYmDQo+
PiArICAgICAgICAgICAgZ3NpID4gMCkgew0KPiANCj4gU28gaWYgZ3NpIDwgMCBmYWlsdXJlIG9m
IHhjX2RvbWFpbl9nZXRpbmZvX3NpbmdsZSgpIHdvdWxkIG5lZWRsZXNzbHkgcmVzdWx0DQo+IGlu
IGZhaWx1cmUgb2YgdGhpcyBmdW5jdGlvbj8NCkluIG5leHQgdmVyc2lvbiwgdGhlIGp1ZGdtZW50
IG9mIGdzaT4wIHdpbGwgYmUgcGxhY2VkIGluIHRoZSBuZXh0IGxheWVyIG9mIGlmLCBhbmQgdGhl
biB0aGUgZXJyb3Igd2lsbCBiZSBoYW5kbGVkLg0KDQo+IA0KPj4gLS0tIGEveGVuL2FyY2gveDg2
L2RvbWN0bC5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYvZG9tY3RsLmMNCj4+IEBAIC0zNiw2ICsz
Niw3IEBADQo+PiAgI2luY2x1ZGUgPGFzbS94c3RhdGUuaD4NCj4+ICAjaW5jbHVkZSA8YXNtL3Bz
ci5oPg0KPj4gICNpbmNsdWRlIDxhc20vY3B1LXBvbGljeS5oPg0KPj4gKyNpbmNsdWRlIDxhc20v
aW9fYXBpYy5oPg0KPj4gIA0KPj4gIHN0YXRpYyBpbnQgdXBkYXRlX2RvbWFpbl9jcHVfcG9saWN5
KHN0cnVjdCBkb21haW4gKmQsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgeGVuX2RvbWN0bF9jcHVfcG9saWN5X3QgKnhkcGMpDQo+PiBAQCAtMjM3LDYgKzIzOCw0OCBA
QCBsb25nIGFyY2hfZG9fZG9tY3RsKA0KPj4gICAgICAgICAgYnJlYWs7DQo+PiAgICAgIH0NCj4+
ICANCj4+ICsgICAgY2FzZSBYRU5fRE9NQ1RMX2dzaV9wZXJtaXNzaW9uOg0KPj4gKyAgICB7DQo+
PiArICAgICAgICB1bnNpZ25lZCBpbnQgZ3NpID0gZG9tY3RsLT51LmdzaV9wZXJtaXNzaW9uLmdz
aTsNCj4+ICsgICAgICAgIGludCBpcnE7DQo+PiArICAgICAgICBib29sIGFsbG93ID0gZG9tY3Rs
LT51LmdzaV9wZXJtaXNzaW9uLmFsbG93X2FjY2VzczsNCj4gDQo+IFNlZSBteSBlYXJsaWVyIGNv
bW1lbnRzIG9uIHRoaXMgY29udmVyc2lvbiBvZiA4IGJpdHMgaW50byBqdXN0IG9uZS4NCkRvIHlv
dSBtZWFuIHRoYXQgSSBuZWVkIHRvIGNoZWNrIGFsbG93X2FjY2VzcyBpcyA+PSAwPw0KQnV0IGFs
bG93X2FjY2VzcyBpcyB1OCwgaXQgY2FuJ3QgYmUgbmVnYXRpdmUuDQoNCj4gDQo+PiArICAgICAg
ICAvKiBDaGVjayBhbGwgcGFkcyBhcmUgemVybyAqLw0KPj4gKyAgICAgICAgcmV0ID0gLUVJTlZB
TDsNCj4+ICsgICAgICAgIGZvciAoIGkgPSAwOw0KPj4gKyAgICAgICAgICAgICAgaSA8IHNpemVv
Zihkb21jdGwtPnUuZ3NpX3Blcm1pc3Npb24ucGFkKSAvDQo+PiArICAgICAgICAgICAgICAgICAg
c2l6ZW9mKGRvbWN0bC0+dS5nc2lfcGVybWlzc2lvbi5wYWRbMF0pOw0KPiANCj4gUGxlYXNlIGRv
bid0IG9wZW4tY29kZSBBUlJBWV9TSVpFKCkuDQpXaWxsIGNoYW5nZSBpbiBuZXh0IHZlcnNpb24u
DQoNCj4gDQo+PiArICAgICAgICAgICAgICArK2kgKQ0KPj4gKyAgICAgICAgICAgIGlmICggZG9t
Y3RsLT51LmdzaV9wZXJtaXNzaW9uLnBhZFtpXSApDQo+PiArICAgICAgICAgICAgICAgIGdvdG8g
b3V0Ow0KPj4gKw0KPj4gKyAgICAgICAgLyoNCj4+ICsgICAgICAgICAqIElmIGN1cnJlbnQgZG9t
YWluIGlzIFBWIG9yIGl0IGhhcyBQSVJRIGZsYWcsIGl0IGhhcyBhIG1hcHBpbmcNCj4+ICsgICAg
ICAgICAqIG9mIGdzaSwgcGlycSBhbmQgaXJxLCBzbyBpdCBzaG91bGQgdXNlIFhFTl9ET01DVExf
aXJxX3Blcm1pc3Npb24NCj4+ICsgICAgICAgICAqIHRvIGdyYW50IGlycSBwZXJtaXNzaW9uLg0K
Pj4gKyAgICAgICAgICovDQo+PiArICAgICAgICByZXQgPSAtRU9QTk9UU1VQUDsNCj4+ICsgICAg
ICAgIGlmICggaXNfcHZfZG9tYWluKGN1cnJkKSB8fCBoYXNfcGlycShjdXJyZCkgKQ0KPj4gKyAg
ICAgICAgICAgIGdvdG8gb3V0Ow0KPiANCj4gSSdtIGN1cmlvdXMgd2hhdCBvdGhlciB4ODYgbWFp
bnRhaW5lcnMgdGhpbms6IEkgZm9yIG9uZSB3b3VsZCBub3QgaW1wb3NlIHN1Y2gNCj4gYW4gYXJ0
aWZpY2lhbCByZXN0cmljdGlvbi4NCkVtbW0sIHNvIEkgbmVlZCB0byByZW1vdmUgdGhpcyBjaGVj
ay4NCg0KPiANCj4+ICsgICAgICAgIHJldCA9IC1FSU5WQUw7DQo+PiArICAgICAgICBpZiAoIGdz
aSA+PSBucl9pcnFzX2dzaSB8fCAoaXJxID0gZ3NpXzJfaXJxKGdzaSkpIDwgMCApDQo+PiArICAg
ICAgICAgICAgZ290byBvdXQ7DQo+PiArDQo+PiArICAgICAgICByZXQgPSAtRVBFUk07DQo+PiAr
ICAgICAgICBpZiAoICFpcnFfYWNjZXNzX3Blcm1pdHRlZChjdXJyZCwgaXJxKSB8fA0KPj4gKyAg
ICAgICAgICAgICB4c21faXJxX3Blcm1pc3Npb24oWFNNX0hPT0ssIGQsIGlycSwgYWxsb3cpICkN
Cj4+ICsgICAgICAgICAgICBnb3RvIG91dDsNCj4+ICsNCj4+ICsgICAgICAgIGlmICggYWxsb3cg
KQ0KPj4gKyAgICAgICAgICAgIHJldCA9IGlycV9wZXJtaXRfYWNjZXNzKGQsIGlycSk7DQo+PiAr
ICAgICAgICBlbHNlDQo+PiArICAgICAgICAgICAgcmV0ID0gaXJxX2RlbnlfYWNjZXNzKGQsIGly
cSk7DQo+PiArDQo+PiArICAgIG91dDoNCj4gDQo+IFBsZWFzZSB1c2UgYSBsZXNzIGdlbmVyaWMg
bmFtZSBmb3Igc3VjaCBhIGxhYmVsIGxvY2FsIHRvIGp1c3Qgb25lIGNhc2UNCj4gYmxvY2suIEhv
d2V2ZXIsIHdpdGggLi4NCk9rLCB3aWxsIGNoYW5nZSBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+
PiArICAgICAgICBicmVhazsNCj4gDQo+IC4uIHRoaXMgYmVpbmcgYWxsIHRoYXQncyBkb25lIGhl
cmU6IFdoeSBoYXZlIGEgbGFiZWwgaW4gdGhlIGZpcnN0IHBsYWNlPw0KPiANCj4gSmFuDQoNCi0t
IA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

