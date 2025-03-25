Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FED1A6FABE
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 13:08:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926437.1329280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx34I-0001Gc-5L; Tue, 25 Mar 2025 12:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926437.1329280; Tue, 25 Mar 2025 12:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx34I-0001E8-2b; Tue, 25 Mar 2025 12:07:42 +0000
Received: by outflank-mailman (input) for mailman id 926437;
 Tue, 25 Mar 2025 12:07:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFHn=WM=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1tx34G-0001E0-1y
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 12:07:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [2a01:111:f403:2613::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7b5b9d2-0971-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 13:07:27 +0100 (CET)
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com (2603:10a6:102:7d::8)
 by DB9PR03MB7372.eurprd03.prod.outlook.com (2603:10a6:10:1fc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 12:07:24 +0000
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340]) by PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340%7]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 12:07:24 +0000
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
X-Inumbo-ID: b7b5b9d2-0971-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=px2Qn646IxiFdCNX78zcadfzP8vHeYmka44OqfwonBJXtq9GpZa3T1tH0arCKQbKhyg3naaNDsfhvHurPAQxC7fTdsiyA7xqUGdJehyQjgg6EiSZ6BycvtUNUqR8NOYxad0pc0ezvD+lR1lPHb0zA9y3qG7zIsk/Llf2p/DKjW2oae31VTCfFgr23nfMGGWpYCIBlRevl+bp+BnBW/xBTKtPWIz9euTr07M124GeAhykmJ/CXxPDTeKf3b2AqkETjVWIPt6lmXA5i8qZgaarWYoQnvzw2cODP8SbM8E1ybNEjf0ktHWC3UorKHQpHDphv1Zs8lgVV85HEP9hRfKD+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyvVXZWcLNkbO4bIvTecDvpIxMLcLUetak3PCG2Vt/s=;
 b=GJ3aTiqyPKe+PP56rHYPI4L6uXyV12zAgQL3brxdKUj+0hy0NIMDewCRk1Ckcf1gsvAO0ziKV1JcBtekit0IRWoQk/QcsqnjAUclDM6nKFp/mDtoS3gBe4pK4R2WjUwnNNIB3sGy6+TUCQNN1MOvsswyNwMn6KNA1rTfiFjdDhoACeSxpo0UHUVHOxdfftqbUMbj4RxUALzOSM+h67FgW7RK/afhvdsn9YM4mLtInPkWzQaRXcg1H8vfC4l3Z0vxKtq+vemI/C3Q5GlRJBpL5mFyUn08QyHZaJyTiiY34z3x7RpgOBqVue3NwYAROARt7JXEseujmyLQJGfN/5u5Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyvVXZWcLNkbO4bIvTecDvpIxMLcLUetak3PCG2Vt/s=;
 b=PTv8jf49JjRMuALhobcFTo0LUp6IkuVnEyhiLHd9YiYoHggnTizEj4OygRq7XVFkddTBp8QEk/aKSToRLxKWAe+ypmrfS8l7p6MhC9b3ulC4Ok6XY3H3MkH3feEyzm7Bgw1aRAMqiGIn4tFwapMtjjMCUSsA0Qdz4Fitut9BJKvE4U5X0q8aq9kOsQl02RMMfHTl+RzhnWcmtfGbzRxus2nToV4kR4NhCWza8jRMgsG34dMwa7JjbhsEJ6veEr6o/GxQCSKR+PWZa2n/0mZH2wZNUiJRuC3ajLpZ1wxiVClNek7bat3kkMfaZq/xHdaYARCwqa79FY+log5Tmgu2qQ==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC PATCH] xen/device-tree: Switch back to
 dt_unreserved_regions() in boot allocator
Thread-Topic: [RFC PATCH] xen/device-tree: Switch back to
 dt_unreserved_regions() in boot allocator
Thread-Index: AQHbnQONSMLBGwvKMUWMY6fOky1K0LODirsAgAA4J4A=
Date: Tue, 25 Mar 2025 12:07:24 +0000
Message-ID: <d84a3a5a-b501-4ac2-8422-7d573444684f@epam.com>
References: <20250324212731.1702255-1-oleksandr_tyshchenko@epam.com>
 <c944a7b1-480d-4ef5-b489-be220792e3b8@amd.com>
In-Reply-To: <c944a7b1-480d-4ef5-b489-be220792e3b8@amd.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR03MB6412:EE_|DB9PR03MB7372:EE_
x-ms-office365-filtering-correlation-id: 0c249d6b-37aa-459d-88b6-08dd6b959ab8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OTlyY1lvYkZCTU1Cc2J4SGZBaEpINTBNVmUrbFdxSWpKaGVteXUzZm51Ykhr?=
 =?utf-8?B?R0pIajE5OHB6S1BUZ0JJWERmRDBuai9HUCtQUFZybUlhRTVhNmRlaldlNDZQ?=
 =?utf-8?B?VzBUSmFvUS9JeFc3SUJocFEwb3VSampWQlJndi9iZmRrSFh0UTlCZS9EOFIz?=
 =?utf-8?B?c3lmRFFObDNVM3JYS1g3ei9mWC9mSE1iNlkzRTgxSUYyN0VaTENZNEZKT1cr?=
 =?utf-8?B?YjdRNjJaYUJsb043Ky92dkhRMkF2UTZzOGl3d2l5ZnVFaHZjVFV5VXFJVUdv?=
 =?utf-8?B?ZlBjUXhmaEZxbjg4QU4vREhoMWRLMVRUYnhneFc1YXdZeXFVaCtST1c2MXMr?=
 =?utf-8?B?UlM5U2xNM2ZCUGJEdFpnaDZ4TXUvcUtXejUySi82c3ZQNkY5cGtuQmQ2RWxG?=
 =?utf-8?B?dy9BdE5ibDAxV2hkZGJCME1uY1MxYjRPeFI0OWlnSEQyNXJZc1dHcWFyQzh6?=
 =?utf-8?B?d1dQM2IycnBzeEkvaEkyS1Rrb1Y3UkhtMWRKRFdFUG9uNURRYW5iaWhzeHpI?=
 =?utf-8?B?TUVaSk1jVFZTYnBXRi9maE80amNiRnpQZEZNS1p3UituRnFOS2xKWTFuemtO?=
 =?utf-8?B?Q3BrN0d5clJEK0p0YU9nMFoycE9WU2VhbWhOVEZqdEVjOWM1dCtERjZiNG9a?=
 =?utf-8?B?UWpwalpoSHlsRmFGVnNEcGVVZzR0bXlwck5oN0xKV1NNUGMzQzhtazZxRHph?=
 =?utf-8?B?TWlVTUp4NUJMbldiUHNrVk5xNjBJNDVGN0p3akxpT2grOENETzk3V0tNSkha?=
 =?utf-8?B?OE9WR3NKVnh5RVZxZ1YrZmZOT2R6VDlyTDVyL1VCdGpBaEkvS0MxMFNGdFdS?=
 =?utf-8?B?Q2F2b1hsNnBtcGNBdUpSTmF6YUh0eTFhenZHcHY0N2l5U284aUtUa1FrS3Vk?=
 =?utf-8?B?K09GV1N1Z0R3dDI5a1lVbmxPNmExbmltdjF5UXJ0eEovOG51a3lmM1VxSVBp?=
 =?utf-8?B?V3VhZjNxL00zSWJKRUJkV2E5UUdLWmg3cSsrTnRNQVdRcCtQWnJrN3lJQXlM?=
 =?utf-8?B?TWxDS1Y2QXE0aVdPckdQWmxGTlpHMUZ6cm9wNkg5dGRBSVBFbFM3em1uaUUx?=
 =?utf-8?B?Qk5lRStDdVpzSzNjMUtjelN1Mm9LdXJ4TzJEWSt4RnRRVFZSa2tmYU9oMjQv?=
 =?utf-8?B?dmtDWXpvaWNUbFhoZDlqTGZFSnU3UVY0RXozbURmWXZXZVNxT2lIcFdMeDh2?=
 =?utf-8?B?UldrOTZTY0hRQ0FSdzgvL0xRUHZ5TkJDL2RSY3ZhQTc0dWp2ekJYNVFrVkRa?=
 =?utf-8?B?SjdWWTV6N0lnUFpseE5hR0hrSWZBcnVQVnlUQk1hVXRUWEYxWFJyaCttRWcy?=
 =?utf-8?B?dk5KdmF2WkdsVVBVVVdNdEwyZzJKeWpISytyTFVTclZ5NGpjckdjb1hYMXZo?=
 =?utf-8?B?S2wrcitjSmNmRnhEd3ZTbWlPWlhBbTdCRmNhaldkLytQenVsM1pPUTJiRzBC?=
 =?utf-8?B?ZXZjcWhOZ2ZVWUpPM3RDRDF0TlVOOHNQTjh1VERvY2pDWm1yZzF2VDVhMWFD?=
 =?utf-8?B?aFFWMGtWS1R6WHliYkpnNEtlSGU5ZktKSnk1R2piRjdUM2NwS08rcTNYSDZz?=
 =?utf-8?B?YmJ6RmVrcU9pc1N0RkFsMDBIYWpBak1RV1RwS2Q4TzlqWU42bytRSzVEb3dw?=
 =?utf-8?B?ZXk2NDVXM0ozUnMvNm9RZDkzNW1RaEIvS1ovWk55UTlqQnZXZ3pnRDVjazFu?=
 =?utf-8?B?eU8vNUN1bi9jb3hUZGhRclhqZlhpbVN5ZnZETloyTnd2dEZ3dkM1UVdaQi9p?=
 =?utf-8?B?Q1pCOVZjaHl1d1hmTTVvT2Uza2FPMmpuREF5YjBCbHRZK3RacTJmODZGUzl6?=
 =?utf-8?B?azgxcmd3b1JMeFUyMHIxMnZGNTRNMWZqaFlESjdVUjN6OW1xY01UdmtiaU5Q?=
 =?utf-8?B?SW5jMEEvQjJ5S3VaY05KRE1ybWpoZVVaanJqM1dCaVEreVE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR03MB6412.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eVhqSThnekRIK0ZMWW5xSGxLbTQ4OHpnUFNqOUt4cUhQWnZyajhWWURpWHR0?=
 =?utf-8?B?cnhLL3YxWnBQMWhoaHVRTE9Nd21NWk4xbnM1ZFVRT3FrL2xLYVBpcExxUnRE?=
 =?utf-8?B?aEhBOTlYWjk5YWs5WHRMMVlwNlhHWUpxc2NZcDd0bHBpdm43MXRhOHl5R3VY?=
 =?utf-8?B?SGVxbFk2aTNudE1GdU1qSjJtRjh2Z2t5M2xZZkF4Smppbm9Jei9oaFNyT1dr?=
 =?utf-8?B?aG11MWJUY3lEOTArd0s4NVRoZWZQYlIvWkppK1RjRzRWaG95TjkyZXgxczZK?=
 =?utf-8?B?MEpXMjU5bHNOV1JQdC9rMUo5UmtPSGxNd3BWUmVLVXJEY2dvb1JzZ3k5b3hB?=
 =?utf-8?B?cHh2T2xZT3BFZUFYb1U5RW9aN1ErcmJNRHlFWXRLZlhGTmNQWjcvT0Mzcm1C?=
 =?utf-8?B?dnFOcFpxdDNvUU9oVGtUdTI5VlBETjRMWFJJbSt6Mzd6amIyL2ZqKzF2M214?=
 =?utf-8?B?MWFXeHRVbkNHNzlXRm9wUTd5NTBZYW1tQ3pWU0VKTWt4ZUY2bnF3alZDNWw5?=
 =?utf-8?B?bkcweVprTFVkM0psY3c5V1MvSllYSENBK3p6akt6NFdteVlFbHhXMHlDL2Ju?=
 =?utf-8?B?Qkk3aGxUZFdEVm5rNm9EeFdZejRhQk1TTnRLck9sMEZQd0pML0kwNFc0UGdk?=
 =?utf-8?B?bTQyRSsxS0xYVE9GYmtIcTRJWkV5RUhzTmxjZjRpOGovQXhCckk2MkV3STEv?=
 =?utf-8?B?N2pjZWZzWnd2T0NZbWNQRTRvOWtjYTQ2YnRLYWtJNVM1WHhhU1MwWUxSbXdP?=
 =?utf-8?B?RG9zVEh0dWREM0docDQyTVlSRU1WaEFha1NTcGM4SnBuUkVidnhNREhjNTVv?=
 =?utf-8?B?WG9GQ1Y5VGdSSm5RYXhycUxPZFQyWHZvRjZxd2o5QVk0K0ZrQWllL1lWMmh2?=
 =?utf-8?B?ZzhzR1VEejVhRVh5Yk44enBUT3NHRWZ0TUZqV292b09xN01qb1JCQUhKOE03?=
 =?utf-8?B?ZkxoTlIySFJQSzVjeGxxYWZEa3JGRnlBSTE0ODM3SWczdUMwc2JBT2NQZkl2?=
 =?utf-8?B?cnp5VU5NTmx2cHM2Z1A2eEl5dWJtdytWZitiWE0xR3hXejdxamFLTGpXaTdP?=
 =?utf-8?B?MzIyNkdFc2J5VmtHYlVWUDhWVGtHME1YTmlnNVJ4TDgzeWgrb0VGTUZ6SjF1?=
 =?utf-8?B?MzFrNU1NY1ZEVkU3Z01qS3crOE9ad0RYNUZNV1dBaVhwNzB0VlBjSEpwOThY?=
 =?utf-8?B?ZCt6cXFueGV4eHRzNTRuYWJsZDdVbEF4dW1lckdTUE9FWVhsUW1tZmFiUE1v?=
 =?utf-8?B?R1h0MUJiZndEUTVGR29iTVZNZnMyU24ySHBXWlUzOEZuOTVWeS96UC9HZlZQ?=
 =?utf-8?B?NFBxaWFwT1Vyd1M2SUFROXdCN0tTVUNEd1JLZG9SNE11a0pFNGpONkJDSHQz?=
 =?utf-8?B?dkQ2SDZkdWJLS3dMN29HaFFjNHJKaWwyekM1YTdJVVVNZWxBT2M4aCtPMVR4?=
 =?utf-8?B?emxSZHFwYXNnQ1VmbkhwMWhKVWhYT0Q3aFc3aEc5M2dlV0RHMmNQYUx3L2RX?=
 =?utf-8?B?NjhtQ2o4T3lrdExVYWdqb3VCYTZaWlpURkJKSVRCZ1o2azAxVWx5bVVmOFpw?=
 =?utf-8?B?bHpMa05JVTJxWTFwZENXY082MzV4WDV3SmxIQUV5V0IxRDhFMzhYVUxRRlhB?=
 =?utf-8?B?UDRUcmRkK1dsSEp2cEc0b3d5R0RVdEJUU1k3L3VTcEJaVjBDK1kxa0tOOEsr?=
 =?utf-8?B?dmdocE00TnJFN3p0QnJuNHVhd0dkZ2FCOXlqVUJJZ09BNEVLVzBYTjAyMU1h?=
 =?utf-8?B?Z2p0N2NkOGtsYmhhV1c1Y3o5eUF4MmN0aFAyclFIVE82SlFia2Izc20zRHNv?=
 =?utf-8?B?Ymh1bDB1QnF0dFFvVVA1MEZmRDNKRDBPZkxCSjJFMHdKeU9NNm9kc084Smw1?=
 =?utf-8?B?T24xTEFKS0k1aW9IeW9QZlBvdjcrcER2cG1JaHdwV1NVQVZGQ1BjQzIrWTlX?=
 =?utf-8?B?SmZBU3VFOGkrc0QxNHp5ejM5RFpXU2xNTVdWTHlTNVB1RWwxWm1MeE8zWS9x?=
 =?utf-8?B?ZjRXZk1TbU5GTStKZk9UNW1VWVI2TlB3eUowWXBpS0N3MlExZ1pKN3RCdHR1?=
 =?utf-8?B?UVpkQ1AwZytEa2xTbVM1YVJqSytiaTNJaEtTTy9lOE1zTy8yTkM1MC9CTmxQ?=
 =?utf-8?B?NzNQTjRIOVpvcFFjN3pJV2FBdWswVjRzRENMNTFkbWlsbDUrM2hWOU5Fc01h?=
 =?utf-8?Q?R5GdJO7tr9k+CpUs020n1BM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <02E17FB6470CB042A9ABDBCF25853D51@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR03MB6412.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c249d6b-37aa-459d-88b6-08dd6b959ab8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 12:07:24.6182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m1jC1JLejHYLHRfeWeAQ96mvbyxk2tK92yO+8J/1e7W6BDLcn/Am2RVpIkkBiiWYgZiu+cjV9B8h2BiVknZ2jZNdUoCfmpjN0FsbJ/Sqd6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7372

DQoNCk9uIDI1LjAzLjI1IDEwOjQ2LCBPcnplbCwgTWljaGFsIHdyb3RlOg0KDQpIZWxsbyBNaWNo
YWwNCg0KDQo+DQo+DQo+IE9uIDI0LzAzLzIwMjUgMjI6MjcsIE9sZWtzYW5kciBUeXNoY2hlbmtv
IHdyb3RlOg0KPj4NCj4+DQo+PiBPbiB0aGUgZGV2aWNlLXRyZWUtYmFzZWQgQXJtNjQgc3lzdGVt
LCBpZiBYZW4gaXMgYnVpbHQgd2l0aA0KPj4gQ09ORklHX0FDUEk9eSwgQ09ORklHX1NUQVRJQ19N
RU1PUlk9eSwgYW5kIHRoZSBzdGF0aWMgbWVtb3J5IHJhbmdlDQo+PiBpcyBwcm92aWRlZCBpbiB0
aGUgaG9zdCBkZXZpY2UgdHJlZSwgdGhlIEJVRyBpcyB0cmlnZ2VyZWQgaW4NCj4+IGNvbW1vbi9w
YWdlX2FsbG9jLmMgZHVyaW5nIFhlbidzIGVhcmx5IGJvb3QuIFRoZSBCVUcgb2NjdXJzIHdoZW4N
Cj4+IHRoZSBmaXJzdCBwYWdlIGZyb20gdGhlIHN0YXRpYyByYW5nZSBpcyBmZWQgdG8gdGhlIGRv
bWFpbg0KPj4gc3ViLWFsbG9jYXRvciBhbmQgZmluYWxseSBlbmRzIHVwIGluIG1hcmtfcGFnZV9m
cmVlKCkuDQo+PiBUaGUgcGctPmNvdW50X2luZm8gJiBQR0Nfc3RhdGUgaXMgbm90IGluIHRoZSBz
dGF0ZSB0aGF0DQo+PiB0aGUgY29kZSBleHBlY3RzIHRvIHNlZSB0aGVyZS4NCj4+DQo+PiBUaGUg
cHJvYmxlbSBpcyB0aGF0IHRoZSBzdGF0aWMgcmFuZ2UgZ2V0cyBtaXN0YWtlbmx5IHVucmVzZXJ2
ZWQNCj4+IGluIHBvcHVsYXRlX2Jvb3RfYWxsb2NhdG9yKCkgYW5kIHJlYWNoZXMgaW5pdF9ib290
X3BhZ2VzKCkuDQo+PiBUaGlzIGhhcHBlbnMgc2luY2UgYnkgdGhlIHRpbWUgdGhlIHBvcHVsYXRl
X2Jvb3RfYWxsb2NhdG9yKCkNCj4+IGlzIGV4ZWN1dGVkLCB0aGUgZXZhbHVhdGVkIGluIGZ3X3Vu
cmVzZXJ2ZWRfcmVnaW9ucygpDQo+PiBhbiBhY3BpX2Rpc2FibGVkIHZhcmlhYmxlIGlzIHN0aWxs
IGZhbHNlIChDT05GSUdfQUNQST15KSBhbmQNCj4+IGR0X3VucmVzZXJ2ZWRfcmVnaW9ucygpIHdo
aWNoIHNob3VsZCBzaW1wbHkgc2tpcCB0aGF0IHN0YXRpYyByYW5nZQ0KPj4gZG9lcyBub3QgZ2V0
IGNhbGxlZC4gVGhlIGFjcGlfZGlzYWJsZWQgd2lsbCBiZSBzZXQgdG8gdGhlIGFjdHVhbA0KPj4g
dmFsdWUgbGF0ZXIgb24gaW4gYWNwaV9ib290X3RhYmxlX2luaXQoKS4NCj4+DQo+PiBUbyBhdm9p
ZCB1bnJlc2VydmluZyB0aGUgd2hvbGUgcmVnaW9uIChpbmNsdWRpbmcgcG90ZW50aWFsIHJlc2Vy
dmVkDQo+PiBtZW1vcnkgcmFuZ2VzIHN1Y2ggYXMgc3RhdGljIG1lbW9yeSkgb3BlbiBjb2RlIGZ3
X3VucmVzZXJ2ZWRfcmVnaW9ucygpDQo+PiBhbmQgYWRkIGEgY29tbWVudC4NCj4+DQo+PiBBbm90
aGVyIHNvbHV0aW9uIGNvdWxkIGJlIHRvIGNhbGwgYWNwaV9ib290X3RhYmxlX2luaXQoKSBiZWZv
cmUNCj4+IHNldHVwX21tKCkgaW4gQXJtNjQncyBzdGFydF94ZW4oKS4NCj4gSW50ZXJlc3Rpbmcg
aXNzdWUuIEhvd2V2ZXIgSU1PIHRoZSBwcm9ibGVtIGlzIGxvY2F0ZWQgc29tZXdoZXJlIGVsc2Uu
IEF0IHRoZQ0KPiBtb21lbnQsIHdpdGggQ09ORklHX0FDUEk9biwgYWNwaV9kaXNhYmxlZCBpcyBz
ZXQgdG8gdHJ1ZS4gV2l0aCBDT05GSUdfQUNQST15LA0KPiBpdCdzIHNldCB0byBmYWxzZSBldmVu
IHRob3VnaCBlbnRpcmUgYWNwaV9ib290X3RhYmxlX2luaXQoKSBpcyB3cml0dGVuIHdpdGgNCj4g
YXNzdW1wdGlvbiB0aGF0IEFDUEkgaXMgb2ZmIGJ5IGRlZmF1bHQgYXQgdGhlIHN0YXJ0LiBUaGF0
J3Mgd2h5DQo+IGFjcGlfYm9vdF90YWJsZV9pbml0KCkgY2FsbHMgZS5nLiBkaXNhYmxlX2FjcGko
KSBpZiBpdCBmaW5kcyB0aGF0IHVzZXIgc3BlY2lmaWVkDQo+IGFjcGk9b2ZmIG9uIGNtZGxpbmUu
IFdoeSB3b3VsZCBpdCBkbyB0aGF0IGlmIHRoZSBhc3N1bXB0aW9uIHdhcyB0aGF0DQo+IGFjcGlf
ZGlzYWJsZWQgaXMgZmFsc2U/IFRoZXJlJ3MgZXZlbiBhIGNvbW1lbnQ6DQo+IGh0dHBzOi8veGVu
Yml0cy54ZW5wcm9qZWN0Lm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWJsb2I7Zj14ZW4vYXJjaC9h
cm0vYWNwaS9ib290LmM7aGI9SEVBRCNsMjU3DQo+IHRoYXQgY2xlYXJseSBzYXlzIHRoYXQgImF0
IHRoaXMgcG9pbnQgQUNQSSBpcyBkaXNhYmxlZCIuDQo+DQo+IFRoZXJlZm9yZSwgSSB0aGluayB0
aGUgZml4IHNob3VsZCBsb29rIGFzIGZvbGxvd3M6DQoNCg0KVmVyeSBnb29kLCB0aGFua3MuIFRo
aXMgaXMgbXVjaCBiZXR0ZXIgZml4IGZvciB0aGUgaXNzdWUgd2l0aCBpbmNvcnJlY3QNCnVucmVz
ZXJ2aW5nIHRoYW4gYW55IG9mIHByb3Bvc2VkIGJ5IGN1cnJlbnQgcGF0Y2guIFdpbGwgdXNlIHlv
dXINCnN1Z2dlc3Rpb24gZm9yIFYyLg0KDQoNCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9z
ZXR1cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMNCj4gaW5kZXggZmZjYWU5MDBkNzJlLi45ZTk0
ZjFhOGM3NjEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+ICsrKyBiL3hl
bi9hcmNoL2FybS9zZXR1cC5jDQo+IEBAIC01Nyw3ICs1Nyw3IEBADQo+ICAgc3RydWN0IGNwdWlu
Zm9fYXJtIF9fcmVhZF9tb3N0bHkgc3lzdGVtX2NwdWluZm87DQo+DQo+ICAgI2lmZGVmIENPTkZJ
R19BQ1BJDQo+IC1ib29sIF9fcmVhZF9tb3N0bHkgYWNwaV9kaXNhYmxlZDsNCj4gK2Jvb2wgX19y
ZWFkX21vc3RseSBhY3BpX2Rpc2FibGVkID0gdHJ1ZTsNCj4gICAjZW5kaWYNCj4NCj4gICBkb21p
ZF90IF9fcmVhZF9tb3N0bHkgbWF4X2luaXRfZG9taWQ7DQo+DQo+IH5NaWNoYWwNCg==

