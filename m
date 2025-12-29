Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0007CE65CE
	for <lists+xen-devel@lfdr.de>; Mon, 29 Dec 2025 11:20:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193948.1512459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaALu-0001X3-QI; Mon, 29 Dec 2025 10:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193948.1512459; Mon, 29 Dec 2025 10:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaALu-0001VD-Me; Mon, 29 Dec 2025 10:19:50 +0000
Received: by outflank-mailman (input) for mailman id 1193948;
 Mon, 29 Dec 2025 10:19:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DabL=7D=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vaALs-0001V5-Ui
 for xen-devel@lists.xenproject.org; Mon, 29 Dec 2025 10:19:48 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5b9909a-e49f-11f0-b15c-2bf370ae4941;
 Mon, 29 Dec 2025 11:19:47 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH4PR03MB7651.namprd03.prod.outlook.com (2603:10b6:610:244::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 10:19:43 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 10:19:43 +0000
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
X-Inumbo-ID: e5b9909a-e49f-11f0-b15c-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igpOnhk1DDE0XA2Ce3dq+tpNlJWVSEiaYlyHUZT54oZqbRHLbfVNLgdqVeQsXfJuXsk4Fub56cVXf4LFg5rsXQKoGSLvrNya5eCn43mBiRZQ2gN01xNyoaWJhKqxfAZi3u3wEpg3EaU5aaER2fk2cHpEEhR7ktXo7V1phhWlM+lc57RBn8WHv48hT2yFnKnSVzNELZxUzIJWYUinT/QwKMkMiaJLSj4Espq56mSnzm95XLrM0zN6ezFwHn4NFwdRfi1sASK1t9emSN84rLxjh2dmfwQqOLqslBkZVgN6cQApVoicx7iosDobcSe3DUckfKurqL5/RDts8buHM85xxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRflnwKw33HiN5K40h7jowoFDa0CqVfe9WwaEVyaqh8=;
 b=Hr0twQlulRK0QHPV57L2Rl5OTkqy+rQ3YnKxG+hyVanoRgwKrLeGk67rqEiC0UGWUyH+vBwD88cB3gYCt/Rrfi4zt3jJ6cG81x36h6KIyW5q3VQHpyr2MNlSQXhJpvbigJcFdzeYng/sa8k/inUWIwAY/05m6TgyTVXZLt7jJuZ9b5AOqieFQa8hTyPdf548JJkPcgwNJwqj13mprXEdLvgYxfmZy7IJTMYM0sU+I5iy9AU0LTintecnKe9MsRVusqs22H8A5LVRJCMq8YwTj2hqMNQn+Giyh0epFdcUEG/DzPoNbSz3nKRaIbL+aHdyE1kH6HlMxS+Rj65LAAY5ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRflnwKw33HiN5K40h7jowoFDa0CqVfe9WwaEVyaqh8=;
 b=hLUFMoziEjL/iWE1O4lugbdp33Tvgbm0k6gDMGkqdvSYsSQUYkXMx/ACeI1WJGuuP33xlZ3ilOae6Bxoa7DZXQmtlN+j/VZ5cQ3xsQ6nuLMUBvcPTcd3bOchUghR8IAtn7YDiXbaGuw34058uUpoErndRKBth87JsRtIFYIqxn8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <96a84785-ae2a-4080-84ec-d1dd1ef89896@citrix.com>
Date: Mon, 29 Dec 2025 10:19:39 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 1/2] x86/cpu-policy: enable build of fuzzing harness by
 default
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4a8f06b9-8210-487f-9dd7-e0221e2df9db@suse.com>
 <c3fcc1a5-6479-400b-b65d-35d7d7233b4a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c3fcc1a5-6479-400b-b65d-35d7d7233b4a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0430.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::34) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH4PR03MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: ce3ce37c-10fa-4395-3901-08de46c3c882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVl1M1dwRStoVld2UUp1a01EZTF1OXpNR2JOaFdBRHlaZENhMEdFengzSG9G?=
 =?utf-8?B?WU8rSFNLWlRlNnZWSVIwV0N1QjlvdVlIWjJnVktHYUIyclM5RkJDMEx3RFM0?=
 =?utf-8?B?QTd0MU4xTnB1Rm1KTUdZcy9wREtmays2NU9ydllUelBjalBOTTRUMlFvZWZZ?=
 =?utf-8?B?VHNDelphcTZLS1BDYlNvbWtHUU10U0k5RmFySFdmR1loSzZ5U2NxQjczdlIr?=
 =?utf-8?B?c0ZUT3NZNDJLVUV0RC9EVlVVbDl5L0dNRmtVR0tVT3RQUnJubG1QejFZY3I4?=
 =?utf-8?B?OTdxbjdodUpacEFNZ243TkZPbVRRbm1MRmJlL2ZBZHkzbGt4R3dJcDFaT1l4?=
 =?utf-8?B?ZEwwdGFLZ3RWRkJ1dzU0QUh6U1ZNYTFDTVVjTXEzTWdDZ3AvbElkSCt4cDdj?=
 =?utf-8?B?TjF5UmU2OXVhUGRLaWx2SWMveURjUzVJNEhwNmVSTDJNakl6c1hQVG5YYzRP?=
 =?utf-8?B?WXcyejdyQjNOM2FjOS9aWUpDdlRlUUZ4WHA1RlhYcm1nOGVBVGNORGVyOUNx?=
 =?utf-8?B?VzYzSDFyVzgvQ1NCSWVFbGhXS0pXM0huYXhmMGRHNDNpaGprZXBPRFlaU3NI?=
 =?utf-8?B?amsyT2kxdlo0bEsydnFpUFFYdUVVUFh5YmF3RTlpeHh2VFcycUVYYUpDcWRX?=
 =?utf-8?B?UFV0eGZBb0hEcTdQMXFHQnF0SzBhZXhZVnJUd2EzbVhCUUpiV3V4UmlzdXBV?=
 =?utf-8?B?QkF0dkF3L3RwaThTWHpBalN1TkpOVGdSVzBaSEFQellpT0ZpMy9iR29kSFlL?=
 =?utf-8?B?V3FBdDNqaEdPOTcxb2Fpbi9zdTVpY3VCUzVXNVU0ZjZlbE9Na0VkSDRCVjUy?=
 =?utf-8?B?TUFWSW5uclU3MVJvUTJYT1ZjMjUzZGZYZ1Btb2htM3JQRkNpRTB3Y2dwZDhS?=
 =?utf-8?B?OFB0R09DR0JrTGR0L0ozSEpvOCtwNmt1Z2RpK1A5Z3pOVUNkdTNQMnlQS3Z6?=
 =?utf-8?B?WFlVbG0yaGFzQUY3MUJDczE2UFIrdlFWdTZSSFRBUjBVbTZwSUxQM1hVcldz?=
 =?utf-8?B?elRPUWVKcGIxQWEvZWV0T2s4bVFYUjllc1hFcGFSY0hIUkQ1S0FrSUlQN3hn?=
 =?utf-8?B?MDhvcVpISWtkc1JuckdYVUhSTENyMmtsbjVUSWJqNjZQTEIvbjZleHV1S3lZ?=
 =?utf-8?B?UHVEMUJEdStORko4YmU1azd2eFFWb21tbDF3Tzl3aXhNbitQN3VReCt4Um0w?=
 =?utf-8?B?QXBSZGgyVEJ6eC9RUGI2a1RZU1lnMUROUkxpMjZPa3gyLzlnYUIrTHE1TStJ?=
 =?utf-8?B?ZFM4bVpxTDlNNjcwa0RhWnp0Vmg2U3djalVkRjR1ZjQ5akdrTkxnNThPY1JL?=
 =?utf-8?B?elQ5d2hrSWdQTEFaKytzUDc5R2Yyck5XZElLYjBUckZlSnREYzRtVWw2ZGZs?=
 =?utf-8?B?MjVoRmhvMVV0ZVFpajZJV0RROGh0V2d6S2g5UmNOQUo2UUJDSlBTUmxlRGJy?=
 =?utf-8?B?K1owN2R6REJhQkpuM1FTMmJSekRmOTN2TnMwL0NBRUdiYSt3T0NXTFpiMkVH?=
 =?utf-8?B?RU13ZjdMaFJvdlZnaWRvcXVGMStYZDdmWmppUEdueDJMUmljajlqUWRrdVZ1?=
 =?utf-8?B?TzV5K09ieVpNc1M4RWk1bUc5OUFSZnZjbTdTbDZpa3RRUWozcWJDVnlBYUFi?=
 =?utf-8?B?OE1aZWRQcDJkWDY4aUJNbzBUaVR1N3I5WXE0T2IrWW5DaTFzVjNCbkF3VGN0?=
 =?utf-8?B?WnJDN3VCRjVHcEVkc2VpR0duTFlHVXVsN0R3b1hqbWMyNDB0Y3ZJdm1DRWlS?=
 =?utf-8?B?OXFnTWtsVFpTY1RKWVBCeWFHdHF2L2k2dEhJS3oxTlN0RmdFTm5XaUlUdHVz?=
 =?utf-8?B?V3FzUTFrUnFVclBGSEcwZVBQV29td1JHNXcvOGhLQkY0NG9OTDAzNHRBdklL?=
 =?utf-8?B?ZEVVNGdPbkYyUS9sYVJROXBiRk80STJTMWFQNE42U05DZkJRQzhPYjF3SVBM?=
 =?utf-8?Q?4qTIRFvDN99MNIQrBja1wtMY8pl0s3Ax?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NU5taExBY1p2Y0RLVUY1K3kybmtuazNjT2NHOWFLTXNnbmdScGhpMDBIUS9R?=
 =?utf-8?B?UHFrcU5UaTViSDZHeFhwbEpNOGhtM0hVdW12THd6NjBOREdKRnBGNTNQQWZ4?=
 =?utf-8?B?WnhXWnB2czJ5WXpoTmwrdDFORGMzemQrZTdHd0gybmc5eGFnOURMRWtPNkZv?=
 =?utf-8?B?VnovcVd3ai9tZTh2SmgyakY1ODNIaXE3b3FhZ2hESlgzeGo1Qy9pWkJGSVA5?=
 =?utf-8?B?bmtXNVFmSENZb2pka0F5bUZNSjgzMFRMQXU2aEhHQWZKYTBpem9xSEV6TmtY?=
 =?utf-8?B?citqTUVPMkNDZmNOQzN6ZVc3NjFiRDlzUEdCMFFLRTcxemlKNVFDTlV4c3or?=
 =?utf-8?B?aU1YL3ljL1ZSUHlHUWdZbHJXeHQ4QWJhV3VSZjc2N0VuQXJBTFE5Ni9oY3pW?=
 =?utf-8?B?Ri9zMXEybTNqb3M4UEEyblNheUFUdDhNVzI0ZHd5OUNzeHN4c255ZmJ3cVQ0?=
 =?utf-8?B?alRscnBNZk1ZRC90bml3Y2c3aWVYYmgrVVZ0b1YvTDVTQ0w1VDRoa0tzTStF?=
 =?utf-8?B?Y2dvK21XNWRuT3RCWnVvb3hraEVEaWVQOFpIQUFCQXUzY1F3Z2hSSGw2S3dR?=
 =?utf-8?B?Y2p3WW5oYjZEQUlzeUhENUdCbnRTRkMyR0FsYjEya3VyL2JGb0tlS04yQ2l2?=
 =?utf-8?B?bEVaN1c3STdIQ1U5aC80d1NjZ2NSS050M0xCeTE4eExKb2RhQnNaOWkwcTFY?=
 =?utf-8?B?aDJFamdlK1ZYcU1QaEJEY3JHdjNYNEdiS2tiVWU5M3Rqdy96TmRFenB4ZUlo?=
 =?utf-8?B?b2VqcDBlcjRKcFk0SC9DNzBFdDdFeW1YaHNHZ2RqYTM0dVNOeHRkL2E1VUVk?=
 =?utf-8?B?b3Z2SkEzYzlmK242WnJWMHE3cGxFMGN3aFRqekxkdjREeFNaTnhZNjNKb0Ix?=
 =?utf-8?B?bEdYSlIwd1JBalBEaDU3SmxBS0VZL3NZUzBWSDl1RHZXYm5xQnBVUngyNndQ?=
 =?utf-8?B?MjREekI5dko2WXZrSGtkdFhxaTRtZE14Zy80T3YvZUVMeHYvY0Q1RlhLT1Ey?=
 =?utf-8?B?bk9DZjRISTYxN3NqWDQwTDl5Wk9NRWI1bzFCVGZCYnJEQ2ZXNGFOMjlmVzA4?=
 =?utf-8?B?Zm1VeGhXMHVRcmo3OGxsU3psRW9xUC80UjVkUkl1TkVYK0h3UEc3U0RXNmN0?=
 =?utf-8?B?a09JUDltSnFmOHRrTm1pc1pFcXRGbk9qMlBlWmZhUE9tdWdpVHVKdDVmQ3hl?=
 =?utf-8?B?QXBYQUVXYkZKYzlaVTRDMlJaa2VtUWJ6NUpCcHNWSSt5S0NWZlVVSHdhNzIv?=
 =?utf-8?B?WXZseUc0TWNxT3lTcXdmanVZWXk3YTRqVVNuUzhTUnI1RnkrUWFyMytQZ1RY?=
 =?utf-8?B?OUhreE9ESElycjR5dUFGN25hV3hCWFBOeS91ZXpxcm9Pbk44dkM4OTNudnlZ?=
 =?utf-8?B?cFc4NVd6TXNQVHZ0bklKTGFwMWlXMCs1cCtKb0xBRXgyS1pQMXZmSTUzZ0du?=
 =?utf-8?B?THRNVnh3MjRDcDF1dS9udTA3clI4RjE2Y1l2ejVKMGIyRmVwck12NFdnY094?=
 =?utf-8?B?NlFtOHYwNTVqMTN0Nm9IcTcyS3dNU2E3RkVjRjhiN3hpVlJYbFFwREIrV2dQ?=
 =?utf-8?B?Z1lablJ1bEMvN0FUY21NVDZiV2tiL2dCZUZxaHlSQW1aL1VBTHlrM3dwMXB2?=
 =?utf-8?B?cHN3RzNyaCtobWFyOVBrdzd2SWhhTzdVbXlEejcxQ3g0YmFJcGVEVmJVNWlh?=
 =?utf-8?B?VzVMMGtxbDBwd3pYalBjdUZnS1VtUkRUanBhdEdHYlRaVytIZGR1R3YzMys1?=
 =?utf-8?B?L2cxc0VEeTNIZ0g5TldndHN4TWxIZ2tBYTBUWk54a2VaK0lwNHZhZTFtQVZa?=
 =?utf-8?B?cG1BbVdFcE01ZjNLNC9UWENKVlJKVlZkT2xsaWpTTXJxS3Vab3NYREtaR0JM?=
 =?utf-8?B?M3FnMVp0NUZtZytRdTJ6dzdRVGVMMWlVTm9iNXovYUk1SG9wUVlXZ1BRY1Vr?=
 =?utf-8?B?N2RnS2dYaytKenByVE1FTU9DVk80dUc1cTZPQngzejBkNFd1cHdYbnJKZVJk?=
 =?utf-8?B?dVJWcE4zZGMwSjVyMUJtZ0h2ZkUwa2p3bHNnUEpnSlpLeS9CN2pTU0lEa0dZ?=
 =?utf-8?B?aWJNZTVsQ3FObWRQdmpVNkpZOTU3WEd2bHA3UitncTFrQW1qdkMxS2VEVG5N?=
 =?utf-8?B?ZDhDN214a3F6STBLQ25pZGhzNTIxc0F1TmprSFdsNEtWN0J4SDFMRzY3dVdT?=
 =?utf-8?B?ZkxPRllabHNZcTU1Wm1qdEJpSnNNZHJxTXhCcUlMTktURXdFRmFSU29KTXc3?=
 =?utf-8?B?RHc1VkRKdk5SdTlVYVgxM3dYR2V2QTIzaDkzcEp2Zk95WmFNNWtmUFR1ancz?=
 =?utf-8?B?NEVxS3RyaUxDUGc4Q0JDYW1Ob3RPU0R2SlBPN3ZONWlIM3lFSFlOUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3ce37c-10fa-4395-3901-08de46c3c882
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 10:19:43.1424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7eVE3t0TYAqGpdfTYBxDzDnxHtH95NF92yopgDLm1P0H6ozOJ5vq2rTFN1c0LoM1BFQ63TIr1AdqVAAvm+IAFp+niFCRXpfUq+ST1nAc48I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7651

On 22/12/2025 4:53 pm, Jan Beulich wrote:
> ... on x86, to make sure its bit-rotting can be limited at least a little.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/tools/fuzz/Makefile
> +++ b/tools/fuzz/Makefile
> @@ -4,6 +4,7 @@ include $(XEN_ROOT)/tools/Rules.mk
>  SUBDIRS-y :=
>  SUBDIRS-y += libelf
>  SUBDIRS-y += x86_instruction_emulator

Blank line here please.  Or it's going to get messy with extra additions.

Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> +SUBDIRS-$(CONFIG_X86_64) += cpu-policy
>  
>  .PHONY: all clean distclean install uninstall
>  all clean distclean install uninstall: %: subdirs-%
>


