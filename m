Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD61CD241F1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 12:19:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204854.1519398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgLNk-0003iI-GL; Thu, 15 Jan 2026 11:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204854.1519398; Thu, 15 Jan 2026 11:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgLNk-0003eO-Ct; Thu, 15 Jan 2026 11:19:16 +0000
Received: by outflank-mailman (input) for mailman id 1204854;
 Thu, 15 Jan 2026 11:19:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cICa=7U=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vgLNj-0003bC-5V
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 11:19:15 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05e868fa-f204-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 12:19:14 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7431.namprd03.prod.outlook.com (2603:10b6:408:194::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 11:19:11 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 11:19:11 +0000
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
X-Inumbo-ID: 05e868fa-f204-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOUt15YJB2aXEzpXq0D3dExLXpxTS0dWGWptTiLjTOzULkpBRXQYJ3nD5hdv4mg9vZtUDAEIszkcEwV3Ck8c3wcchArhow1Kv8LYAoE7zyM+mntVJswv1JRs9F6hvW9Nz9icnM1hvTRCztVb32MaAR+HzIhBvV9z62nzj3QEPBRgnEb/r+aBZVEtruPulHNWX4aIFXHLF/IAt3oSw6WPLoXsXhfMscFvWVZve+Ey2PVkh4pVeC04oKHqlsMnmJ/UyCgIoWzjdZ83hUF8b5AzyYhU5eOhZMqsw65FOXFbzc6LBdEBTNYCH2OrA6TSXg/sb4H4+mAgjLZqKW3mYFi1kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGFKVF0i2wWigbiwR7BNTdhzq53D/kNouGUmcPEvNic=;
 b=JdiHKVg/Q04yRKCBDGAg34F6fzWLdPryQoeNztm9IsEqstxHWHzxiKQAUJBzycHu59aOsxsB8Y55S+w3YoXZMKXz278f3RQDjRGp/DRg42kmGMn2tVng8cQ8YMn4DsF4J4cojPTKfvBVHlQilluLTSP7Elihwc9KZbWRlb7uFvdWDILmbfDFl35YoML/w+oRqduyTB7R3gJh3mmRKfUgOniDZHg6GHeoQrGG7Lbao1W1zdkLmw146kwfJ4kkxqvOYdfctMpQKY8I64wPcOn6IsL/PYg3y95ATCa9AR+8hoC+9CYCH9+wdWSgaT1sdNOjRF65oUnLG7r8fjfMmDuLPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGFKVF0i2wWigbiwR7BNTdhzq53D/kNouGUmcPEvNic=;
 b=cMn0fGOpUhbnml+IyMxP++T1XQmhV8/pklD2FXIr7Wkzft78VDu2gHlFql0yckWmFEbkwJUHTgREl9zo92FXaB+NflWkauWwrdj/s54L+Pzs5IfNoWshrrGMwwH4U1cEWQyDMWnnJM3xubg5slrUwEU7/XbizFO5TX7o2BBYnOA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/3] xen/mm: enforce SCRUB_DEBUG checks for MEMF_no_scrub allocations
Date: Thu, 15 Jan 2026 12:18:02 +0100
Message-ID: <20260115111804.40199-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260115111804.40199-1-roger.pau@citrix.com>
References: <20260115111804.40199-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR06CA0012.namprd06.prod.outlook.com
 (2603:10b6:208:23d::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 711dc458-f203-4445-de7b-08de5427e88c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Um5WeTI3MnNzbjMxRFJJR2RiWDlDVUNUeUt1aUN4YU0ycTRzTGswSnhmZUNv?=
 =?utf-8?B?UHc4blZVTUc4ZlI5U0hPRTVtOFlnUStXU3BmVXdqY2RlckN0WldybTVaSFBw?=
 =?utf-8?B?QnZJdkJGZW9OcVovaHJNemFDQlg0dUdXWWNlWXlvSTdqaDMxYU5UQXBLMGxQ?=
 =?utf-8?B?UWZtN3h6RkhjNkVrVllHaFF4cFdKa3A0WGtoWWV5VEMvdkdUVXF1TmpzWllB?=
 =?utf-8?B?V0RNL3JwUytXVmF1QktSVkRZRmRmSUlyMzJySWJRMzBrZWpRZzhPT1MxM3FO?=
 =?utf-8?B?THU5MUNjaEhYMVNSbW8xeGcxVmZ2YStiUWlUUVVpVjBhS29zVGFhdnJuMjhC?=
 =?utf-8?B?cVVqYXAvQVA2eGQ3R09jS29EUFlqTCs0TUtKS3dpMFZPb0NEcHVMSWFGZEty?=
 =?utf-8?B?Rlg3enpBNDhDT2QvQ0JlaE9yRnVzV2dlR25xU3JqbVVyMjBabGNMeGJ4YlQz?=
 =?utf-8?B?eWhidWF2ZlRmL3BoZnQyVVVtWXpVTjUraFRqWE5IVFJkSlJGeCt6K0xzazZ6?=
 =?utf-8?B?TFBmMlFxaVhxc214d24rcFRySVVsTXB5VFNISVV4SUpXM0tKdjNnZWthdk5G?=
 =?utf-8?B?NGFmMGNoVzZodFc5djJtL25reTZ4ZEYrRTlLdUNoMHR2elJnZDYxaDZBb1RO?=
 =?utf-8?B?RGJicEdyZTJGOGRtK0Q3bHllT1lyUXhmdGxJOFgrbU1xekRYaVFlK1F6LzI1?=
 =?utf-8?B?YzdvcGlsR3o3YnFnNFo2QnFuL0R0T2Z2WjN6Z09QbUltQTduUG1xeFRtZE14?=
 =?utf-8?B?RTFoOFN0TlpHNWt2RkFUZXV6SEdTSit4Q2ZwclZJSStZZUhvTHRQK01tcFhz?=
 =?utf-8?B?bHdKKzJnWTVyb0p3TVFJN09tSythYzZWYjRrcVVTL3MyK1oxUFc0U3hxbzJm?=
 =?utf-8?B?OVY2M1dSVDNSanpha3lMMllIenZSUlZrV2Z4OHhCTUhiaWIvWUtFRk9KbnNW?=
 =?utf-8?B?djJ6NXBuRzRsL2hWYkdxb1kyZk9TanFDMEpmUS90SVJza1BhUnZmSkl2L3JG?=
 =?utf-8?B?RjB5VnB1ekpxRWpEQi81S1h0c3FVbnVJejkyUDE5T202VFo3U2JIUGNzVlh4?=
 =?utf-8?B?ck54OGJicGZOcS85ckdLQjFOTERITVBnUHEySnVSRDZUVlliNW4yZ0RtYmI1?=
 =?utf-8?B?U3BrN0dCcThDaFhGTGdUZmFMWktiYkNHZG9wKzJPMng0ZzUvZUllSTlacjVG?=
 =?utf-8?B?WGpGZ1ZwRkdqTFpieFhOSEJVZEordnFnK1Vxb1FxTXdVYzVHTi9yVjB5eStL?=
 =?utf-8?B?NGQ0SkJveEJmRm9CclJidkxHUWRrRkRYUHRiQ1lOejRiazhCcjlSYVk1dFYx?=
 =?utf-8?B?N3I4SlhHd0hZZ284c1MyU2JxZ05yMTVJcEdaUTdyaytoOTlGNGJmWDllTWFr?=
 =?utf-8?B?L2ZHTDUvRzV1QjdOOVFVaDByb3p1VkM0Y1l3dGpIUG9kVnB2WnUzL01tU1Zu?=
 =?utf-8?B?SFQ1N0FwUFhQSUY3UjdrcUk1SmRtTU9TMHV3ckswOW4vN2o5SDMxd2pES1hT?=
 =?utf-8?B?RTlIcXN6LytTbUVNRWpjeXNtaGRBT2dIZHNDcUFFOU11QkJNMFc1VUQrOEdq?=
 =?utf-8?B?cXoxbit5aVRIVWRlNmxGSW1vL0c2aXpBL0tmMDE4QVlEeENGZjkwL0hDZTVV?=
 =?utf-8?B?Mk9RVUNOeGZwODNENjRnM01YdEZMd20wU3ZhRHQxN3gwcHNPYXJ6aTVVNUhu?=
 =?utf-8?B?WGdkR2xvdGhLYnRiTFAvSG5rczhQWDVUWnpSTXJ0dzBuaTIxTElzUHhvUVdo?=
 =?utf-8?B?ZWpqK2VWTlIxY1pFT01qd3RLcWRYSmwvUy95Q3dLRlowZG4xcFJMQUtOL1da?=
 =?utf-8?B?cTM4UXZoekRYZFBFNW5BdmlSOERLa240cXIrRUx3WDZSNjZ3cVFEMkZiQzNL?=
 =?utf-8?B?aGw4ZjhDQURQQ0xFN0tJVTB2VzdxOFQvOEdRZUhxcTdDdUVZYkp5T0cwZ2Nq?=
 =?utf-8?B?ZG9YZkQ3VlljR2tXUUcyT0g1TGt0VlFLZ2FEbkJ3c05lbFRmVXpUOGZWMTBF?=
 =?utf-8?B?T3RlUTJpUzU3alZoK0tmbCtKRkIrc0tDOFduYXNHNFJhKzY2eHBMTXlVamNU?=
 =?utf-8?B?NmYrZ28yNUdldHRlMXZRT1VZMjJOTUR4MDZtYlZsdXptelIzRjc1V3krU2NW?=
 =?utf-8?Q?5TlQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2laTHU2Ukd4RWhtTjZKUkNBMmVQbDkzZUEyQlM2RklHVExLOFdvK2d6NldI?=
 =?utf-8?B?VEt5ckZmelEwcjBoUUN4ckdwR21IbE9JQS9YaVhLNXcyZUNITHRzdGtFMkhD?=
 =?utf-8?B?ZHpUZUFoM2czK1c3VXo0WEFjNnNVYXBBUUljTGlERFpEZitxMUcvc2liVTJr?=
 =?utf-8?B?RkxOUVc0ZnU5TVBpQVRqUS9aa3k3akk2N0xmWXY5RTVLZHlDd2phRGNJSWdX?=
 =?utf-8?B?cHZXYzgrYlpvdHVqTmpHV3BvZzNGVUNLTU0yZXhNTFBTeFNIUytjemR0YWRI?=
 =?utf-8?B?Z2NTMG1LWmliZ2x4Vnpva2VqdmpjeG1ZcUhVYUU0Q3pXQ3JpLzdjb29uOW1z?=
 =?utf-8?B?d2YvRjRoOGhsaUo1SGdJMStVbnlXQkE3UjV6aUxnalBqTE92OVQwWUVGbDRj?=
 =?utf-8?B?UUxwVUtNNUhJMktyUi9OR2xieTBQOUtlaElvZEtUVytFK1J4dWtmS1Z1Mk1M?=
 =?utf-8?B?Y0FOamNUTUxEeDZhSFV5TDNFRC9lc0h2MkdLZmk1ZGdrTjE2blloclJRUU5h?=
 =?utf-8?B?QndHWHVZMk1ERS92UjNNbjFidkZSUTFDTGNESThlL2svYmwwd0hmUkZYV1d4?=
 =?utf-8?B?a1pNQkI0b2x2OFhqS3FON0tJSEcwc29LZUlWeVMxUzU5TldiUjlZL2VBTW1H?=
 =?utf-8?B?akg0NHBpcGxndHo4T0xEV0w2ODNHcllVSGM4ZFBQRzVqbmY2M1pXbEJXZlpB?=
 =?utf-8?B?bDM2TE5BQlJYV0hYOWlXcDRtWXkxdWpSQTJGVWdFOWtZUStnVEhVT2xVWnZs?=
 =?utf-8?B?M2lJUm9VTVVRZ2p6Q2NSZVhwSHhMVmxWM3BRL0lFUEYwTkVFcDZzcXEwME5t?=
 =?utf-8?B?aTcvbE84azFoWXVTOGhZZ1dTNVF4b3Yvb3U1NzBxbVNkK1pESW1zbGRFenRV?=
 =?utf-8?B?eVkyVEgxWExxZGRYVTVNRytReDZrODgyWUxDSzVXUjdGOVk3dTRNSk40d0dU?=
 =?utf-8?B?QjFQNzFKcERqWjcvUTBDN2ZkNms5MUpQbFdPV3AzQmN3SFIvM1Zvd2RFcDJ3?=
 =?utf-8?B?RmEzMUpTSmxub3dRV01OTnozZXMzMUMrYVVNdDFlN3Y4dncvTjZDUjR3SVQ2?=
 =?utf-8?B?b204bjc0ZitqbU9ESVFmb0JYWTdhOStXQ0RKTkZXK1UzVjQzNHJJOE81SDFi?=
 =?utf-8?B?d3RTb0pydFFOZmZpdWZVUlg1a3JHYXVuUGZYNkVMcmRnMTI1TmNTU1FBZ0s5?=
 =?utf-8?B?OStvMDJMTGhLSTdDUXdzckYxelVQQ3orY1Z6NEhlWENJZ1VVdHVUZExMZGxO?=
 =?utf-8?B?LytDaHVkblMyQjBlNWZ2elUveXFvd2E1TTgrOEdGQlkxTlAxWWpQT2hvUStB?=
 =?utf-8?B?V1YrOWEvdjd1THBVU3RFcVhjYVlTRGh6dnVSczdWTjNZMDlVOFRzeHg2ZExk?=
 =?utf-8?B?RnFYYjRlSVVvOFREYkdqTXF6V3EyaUd2eEtZK0NaUlZlbjlMUEcrZDNCN3l5?=
 =?utf-8?B?dGVSTGwrTFBhL2UyenlNbmV0MUgySy9PbDN3a0lscEhXYjhOQU1kblJRZ1Zt?=
 =?utf-8?B?L2tSOFdjRkY3RjAzM2VoQmtmRjRhL0plNWlHYm1lOTd1L1AxTHY5WlJkR1gy?=
 =?utf-8?B?d0hJeWxQR2trbWw0bTdlUGl6K2ExYWpPaDlRbFRLWUU2b2tqR2RDS0JURkdq?=
 =?utf-8?B?QkpUTkc1NU5LOFA1S053ZUp6d3pTeHEvQ3h3elpjdlBBYndCZWFWR3Nmb2Vv?=
 =?utf-8?B?dVd0eGZzZ1JwVVg0NmE1WWJ5MmxyNXA5VDQrbDZyVk8xdVkyMTFhcGFlODd1?=
 =?utf-8?B?cjNqSjZ5OEozeU9iQ2E2c2lYWDZ5cFB1c0Q1M3VVUlJKaTQxa0pKMXJMQjVT?=
 =?utf-8?B?b3V3VHIzYytxZllWT2pkLy8rbW1tTTVvU2NJNkJwb1EyeHBiWnBaQVpweUR4?=
 =?utf-8?B?REdYM3M4NTBmM0RPczdrWDRBQmlhdWJra1N0bVVNLytLc0xLU2JNQkZCeGE3?=
 =?utf-8?B?WE0vL0tsL2pTdXByRVA1S3F4VnI2ait1QjNTelJXdUVPYU10ZzNaYURTMEg5?=
 =?utf-8?B?UktvcnlMblNLVFNqbkVEa01Jd2lBa0cwQ2lLaGdZWFBqeDZuOVA2ODg4TUEz?=
 =?utf-8?B?M0R4NGZwdTZwZ2lVUXAyOFZ3ME44aWY1TWpHWStLZGhod1FONWszaTd6aGhp?=
 =?utf-8?B?MUZXSHl3dCtwa1hXR2x0R2srYTV4YkhGSHJjd3d2OHc2N2dkdEhaOVhsSEJh?=
 =?utf-8?B?VUdPV3c0U2M4WndETUV3MUlFZkhrS0pCQmNvTytOang5ajJCOXRwNlgzdDFo?=
 =?utf-8?B?d0N1OGpnVGdHa0JJRnVNZTNIMWZlQTk5OFV5cTBEL0h1L01FcURFRmxjbWhG?=
 =?utf-8?B?d1RLN1BJQW1hdXNmVnoxdDJJZDJBQ2tPK1l3Q2lNZEJPbFJqdURXZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 711dc458-f203-4445-de7b-08de5427e88c
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 11:19:11.6964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QY2DH6neAatWyF0VweI5fMVs6nggu1MLMKibZOVtTP8SqYG7mlay09Doz0z14Ff+jwSoIVxj0FOP2I0Z7MwT2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7431

The logic in alloc_heap_pages() only checks for scrubbing pattern
correctness when the caller doesn't pass MEMF_no_scrub in memflags.
However already scrubbed pages can be checked for correctness, regardless
of the caller having requested MEMF_no_scrub.

Relax the checking around the check_one_page() call, to allow for calls
with MEMF_no_scrub to also check the correctness of pages marked as already
scrubbed when allocated.  This widens the checking of scrubbing
correctness, so it would also check the scrubbing correctness of
MEMF_no_scrub allocations.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
After discussing with Jan I've deliberately omitted the tag:

Fixes: 0c5f2f9cefac ("mm: Make sure pages are scrubbed")

The intended approach might have been to ensure the caller of
alloc_heap_pages() gets properly scrubbed pages, rather than asserting the
internal state of free pages is as expected.
---
 xen/common/page_alloc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 2efc11ce095f..de1480316f05 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1105,8 +1105,7 @@ static struct page_info *alloc_heap_pages(
 
     spin_unlock(&heap_lock);
 
-    if ( first_dirty != INVALID_DIRTY_IDX ||
-         (scrub_debug && !(memflags & MEMF_no_scrub)) )
+    if ( first_dirty != INVALID_DIRTY_IDX || scrub_debug )
     {
         bool cold = d && d != current->domain;
 
@@ -1119,7 +1118,7 @@ static struct page_info *alloc_heap_pages(
 
                 dirty_cnt++;
             }
-            else if ( !(memflags & MEMF_no_scrub) )
+            else
                 check_one_page(&pg[i]);
         }
 
-- 
2.51.0


