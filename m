Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1D7CB296A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 10:43:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182729.1505573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTGit-0007Rc-2w; Wed, 10 Dec 2025 09:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182729.1505573; Wed, 10 Dec 2025 09:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTGis-0007Oe-W0; Wed, 10 Dec 2025 09:43:02 +0000
Received: by outflank-mailman (input) for mailman id 1182729;
 Wed, 10 Dec 2025 09:43:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c2u0=6Q=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vTGir-0007OY-FG
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 09:43:01 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cfe7a8b-d5ac-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 10:43:00 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by MW5PR03MB6908.namprd03.prod.outlook.com (2603:10b6:303:1c3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Wed, 10 Dec
 2025 09:42:56 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9388.013; Wed, 10 Dec 2025
 09:42:56 +0000
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
X-Inumbo-ID: 9cfe7a8b-d5ac-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/US6Fc0AV5g9m1MhwvT7VGpY11PG7NMRFvQ5i8pk86JKw1DCMjbjXwOChCQcRyu/xtH2UKocfRrp0Qr7EW+5BrNQ5aX37wkBVsaMQOC2N5p4qg2nGOZT9IMEmUfNpQj0LlQ7sXDLTWAaWHfDQkZaPO4OvyNWeSrkSsMwPSw8qdXkRyu4kK1FH+t1dsQzk6s/yFfuXn7Q/0QkGpMfN17qg8X9yWtStVpN2q4z6UFJ1mGYQeNIFPir2CGLzga8TNS73yDVLmsjTuaWyOMq37xB1OPU/7+GdLHpiqfaxWdzI5GPpTknFX9cxtXNDE2ZSseByni1ll4ESz5/DGO65pvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dieXlV8bwMjd0AXn64PR7Xdo8TAVHTZTmEXifoSNq2s=;
 b=HRY7tHLDRBhkR6WU5MJVV1uQt3Gw9LInWANEtnQNy6ntjalVdGuBMzHpCUVEszDqQE4KFAHp+mBFYyEQhM3NxShqGXCe/qYRWtxCgR/vs4jU3e09Uxo/C0P+az+nNbEP02kz6rihiPkI3SP3bMQ5LGHQDSz02UdGxyemcGmeB8MNANhFtt9aY8MC2MtKcDviHFyZoq7zFQ/kRA5Sd2JFzWjRd/PJvpkZ3qotDpFLvSNMya3fvEduAOkxI2F2G52LJ2Gg9BZnwJoK3++ggu2u8KtWTrrkxCm+Dd6taUiBZN3XE7HWPI2FspMkPTUbnVUKFgx1+J3by7kNKbagawCYZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dieXlV8bwMjd0AXn64PR7Xdo8TAVHTZTmEXifoSNq2s=;
 b=r00tQ9rsFLN2ghYYhZ6pZF05VXPxl4vTUWHjLt/Ws7a1PWLhhsq3wc2U4Iex1XQNGfPc4IIi3ayqJex54M/W546Z4RGz38+aXbhP7r4yOzULqBwhfeGNQv9AuCh+i1FNVWeZlKHyVQXjT8EmqAeKu38EAmSHLQTH7LdEQWds4QE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 10 Dec 2025 10:42:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 7/8] x86/mm: update log-dirty bitmap when manipulating
 P2M
Message-ID: <aTlAnH7bei04azol@Mac.lan>
References: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
 <d47d01dd-0289-370d-7b5e-bd80f9e0a911@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d47d01dd-0289-370d-7b5e-bd80f9e0a911@suse.com>
X-ClientProxiedBy: PAZP264CA0226.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:238::17) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|MW5PR03MB6908:EE_
X-MS-Office365-Filtering-Correlation-Id: 82424824-ea7d-4eb2-be0c-08de37d07f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHV3eEp0a1h2VDkrUnVjMnFrN01nb1JFTzNCRUVHemdiT1A4dERFeWxoeHg4?=
 =?utf-8?B?K2VCOUJCdHBPc3dTcjFicW9FcnU4cFFRczJBVzNhQTBweG1GU1hJb084U1pQ?=
 =?utf-8?B?M2pxZy9lUGRvbUhBckY0NC8xc2FEUW4vYjdvYUliaWlmcVU4Snd0Y3VmRjdB?=
 =?utf-8?B?U1dzQ1F0L2VZMXo0M3RyRUJUVVdHWXFrRSszajdNaDhNQXVUS2hpckR2ellP?=
 =?utf-8?B?TVlVUHJRTGt0dm5LWmZPb0FRanNPLzVnazk2T3ZYRC9TaW5FOHdYbWRlQ01W?=
 =?utf-8?B?ZFVtQVFnU205YmluN29ybVdaVkJDSGY0Nk1zRmQyUTJDdmZxUDUxY1hEZEJz?=
 =?utf-8?B?ZWFOMzFTUGYwRm45M3ZSMnIrUmZuSUMwQzk1a2pZdkJtUjlyNkdZMUV5M0xM?=
 =?utf-8?B?eTczblRSUjRiNWppZmR6UjVOK2o4RFRGZGo1aDRCUlF0VVlNYU94Mm5SNFBa?=
 =?utf-8?B?TVZOVmI1MlYzYnhMSTF4TTVZZzJQNEVOa2gxdFpQZEptMWFwSEFHMUMvK1N4?=
 =?utf-8?B?VS9uc1VFTkZVWjdDRDRiYWE5YWQxL01FMG9iRnh2bXFTNVpwMVNJc3dFME8w?=
 =?utf-8?B?YnFxWWkydTlmNXdQNUN1d1o2MkQ2cE1pR3YrVm9hNG8yODJXWGE1YmhOd2tU?=
 =?utf-8?B?S3BkZ1hHQkFZUkhESTQxV0kvNHJwa3dtTGh1ODFzMjk5RjBzMWZ0eGxhd3RT?=
 =?utf-8?B?YWZUQ2FSZ1RkWUNyUG0xYTBCS1hCSUlsVjZGbzFvVHJLWTNpN2tYUmc5Q01s?=
 =?utf-8?B?WlpZdWNQanVxcC8yYTlnbXB4c1lJVUdGa2JQUXlzSnNTS0d5K2FkdXUzZDZ4?=
 =?utf-8?B?STErMUpJVzJObmUyVFp5bDJJNSszK2g0STJrSWRQdnh6d0ZwN01MOTFYZSta?=
 =?utf-8?B?K2oxOXdEejArWWRKVGs4Si9Gcko5RW0raTVsRXpVdFBJV0dIWjhnQ2tCcXo3?=
 =?utf-8?B?YnFJWlNKcnpnT3ZxZG15T1RrN21PMlNyQ0NGTFRJakZkUDdmUno5cThBU0FY?=
 =?utf-8?B?cStnMklMaExYcDBVL0RUK0p6U2E0KzdzKzZxSXQwcmtSQVphczNuZUtENGVY?=
 =?utf-8?B?QlR1MkdMQWJYZmVoY0NyeElLMURjM0RSYmxYMzlsMSttT2FXWFNVTThGTFlJ?=
 =?utf-8?B?a0Y2ckJaelBIQU5CN3o5dXhiNS9GMXZqdXRHa1RVaVRkSkExVE9mQ3R1eGU1?=
 =?utf-8?B?US9SQTh0b0F2NzFySk1BaGJJaFYyOVNLYTJXMGVzN1dHWjM5bzZrS3I3YnEy?=
 =?utf-8?B?cWd3YmU1SXYrb3hXYzVNNGoxMFFGRm9BT0xrU1ZJbWRnc1JGQnhDWHJoNUdJ?=
 =?utf-8?B?bDVjZ1Q4SkZxdUVjdHJZcVpSRTJUdkVaQ0lEb2tBRThYVEcxejMvY0ZWbkk5?=
 =?utf-8?B?MjlpK29EclMyY0c4UXphbWVjSVdaZW9hSkt1Y1pxTGdRMkdQVG1pVmlkNi9H?=
 =?utf-8?B?OHlPclpDOVI5U1N4bXpkY2x6d09sVENjYU5iZEVkNTFZSGxMQjNYeXM5QjBn?=
 =?utf-8?B?TXdRcU9VVktGVy80RmIwQ1VVMTdUNWFjSGNnWXVIUzhVeFU4aTdPMU5LWXE4?=
 =?utf-8?B?azhRaUllUVZTbW5PNWpVVE9lY21CcmQwZmJMRWtRbllRNVE0NkdWbVFYSS9B?=
 =?utf-8?B?bVM5SlgrcENkUFdYQkN5UHdlRGtPTzVtMUIxZzVaTVk5ZjA4NXdLV2hrK2xJ?=
 =?utf-8?B?Y3NNQmVIdTNlY0hYcTJ1NVRZVXNhUXhLRGN1SHYzN0F4MFY4V3U1RGEwT0hJ?=
 =?utf-8?B?TGJEVGFSUGIrcXpLaUdMbk1QTE93NVY2Z0c2WTZWbHhKTFNHc01Qclp4L3VM?=
 =?utf-8?B?TklwNU5MYXByK2JSeEdFd3NZV2wwVzFZTEI3Z2VoM01PRmI1YUJLUE9wZnd6?=
 =?utf-8?B?dExmRDltbTBnelpFYUdHVnczM0h2Tm4wcS8vQkFvZTV4b0UwVHlKeHRIZVE0?=
 =?utf-8?Q?hd7CvnvayDcW4DUwGuKF6/kBED+u1aV9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjBSckdWZmUzd3dQWmdxck1YSG9VVkNXUlFXc1ZDZks1Wm9QMmpUOWxzUHhG?=
 =?utf-8?B?b0NaOHNJNGo5ZEVPYUVkcklneXpMblc0QXNoT1RCUk1reE53M2hNSGZTTjlo?=
 =?utf-8?B?bE4zUU4wanErVzE5VFBqMnh6UnNkdDBZSTd4SlluWFo1cHdjdnQ1emNhUlJq?=
 =?utf-8?B?VVovWTA4MnZEVld1THUwYWJUOFVGUGtLWGRsOHM1V0JxSm1hYzIzdVdJbkR0?=
 =?utf-8?B?VmdCT1R3TU5RT2UvWWNoa2dtSklJTmlnZ1d6TkRiWFlqTjE5cEVTSldiNTh4?=
 =?utf-8?B?bVVqVy9jL25IQnNPbFN5cGo0ZTRjcTJZQ0lHVG1JSkxQZ1AwUVJLWG52ci9K?=
 =?utf-8?B?YWswNXRTUzdoZktEc1hJemVabGFhWnpacysyRGxWejd1TEUvaS8xQnhOYjNo?=
 =?utf-8?B?SFdqOVFLYVNTZHVZSUhnZmxoOXBhbW1DQ2dTaGtwd1BsM2U0WmFMU3R5MWVv?=
 =?utf-8?B?ZGlPN2xiMmo5OE5yOVp0VTc0TlhWTHNpNGg0SDZkaWZrVGJMaEp0WmE2bmg4?=
 =?utf-8?B?eVByOXRhVjk0TFRrRXZVakoxelBoOWtrMTR3RVNhZFpCd2dpQ2xUdkxZN2cv?=
 =?utf-8?B?Smx3RndJVzNsSUhhcnJPY2xLMEhoeXpvLzBteStIOVVhRlFKb3EzcHh0ZzFF?=
 =?utf-8?B?WEJJVEVLRktMVVlrMHhtR2M1UmtDQ2hlcXVMTjhwY3JJbmEwY0VISk5ONEd6?=
 =?utf-8?B?VmxnNXdxMXVaYjZUS1BoWXprd2tyMTVRMEI0N3RnQjV6Y29IRXZna1RaUmc0?=
 =?utf-8?B?MGlBc0JxdGo4ditadkk5UE9oQXQ0Nyt0enE2MDhEL000b2NnWHdFRldVa2lz?=
 =?utf-8?B?TjhaRmRJTkdWc0QvZnZETURsUi9TK3ZIWWhWTlVGRzl2ZXowSXpHSi9Wbk9B?=
 =?utf-8?B?eERsTW0zSlVybUZ5SlJxWUFMdURSeCs5UHhrNmhyekJtOElBaW4vN3I5VWlt?=
 =?utf-8?B?MzlKTStDbDY0YmVDU3VWdmMrRU16VElVdVppaHI0aHMzSkVkdTdRSktSaTFk?=
 =?utf-8?B?dDA1eTdxMEx2M1ppelF4RlFmMy92azR1ZTNBZnlzM3lnMVJIektacGlNTGcv?=
 =?utf-8?B?ZXkyUHFwbC9BWnF2QS9GUjNaaE45c2xXT2k2dFpNYVhrWEtqNHJrcEExQ3I0?=
 =?utf-8?B?cXlKdEhZUGljUFkxeVNqM3h1aHFJb2puUXJLazVSc0VpWXdxWWJtVW1uTWZq?=
 =?utf-8?B?NmhrZzBXTno0TW54cWlheWtRZ0NhbnBQdlF0RnFzNmNHV0hHVWRoN1lrd043?=
 =?utf-8?B?Y3grTVpPVG1DVzJBSVA0dmxLWkhsMFFoTFkyalNKWkQzUUZJWkRUTFlCVWg5?=
 =?utf-8?B?elc1TVJsajByM2NHOWpUZ3RFUUIrbjB4Njl3SGgwZnJEYTFkLzZsZ1FDeHVJ?=
 =?utf-8?B?UUJ0NU03K1hsVkZlcFFSTGtMNXRZQXlrWDYvdzY3SWd3NVhPaEdySmpWS29Z?=
 =?utf-8?B?dEdjcmlIVm5WMlNOK2tCZTAvL1B6YjNhaW1aazVzSVFKWGMzTk9pWFZ2VnRZ?=
 =?utf-8?B?c3dQTjVRdS8yTzBaNjBJV0xTSzdKYnh4S0dnV3p4cVltUnd6bXRJeERSWlVu?=
 =?utf-8?B?VTgrWXgzZWt1MmFYNHhtU2RmZnhOSCtBcHIxcXFLZXRvUjd4NUFjaFB3eW9C?=
 =?utf-8?B?Z3BUNG5BQVNYNkIwaEp3emxsTlArUlhXclZXZkxQb0tudjRoaE5uam5DdjEw?=
 =?utf-8?B?N2d6dzgrMlNEWVZ2V2VxdGlFZjBTM1RaU3BkRE85NTYxYmhuZldtN1orcFRX?=
 =?utf-8?B?U21ZdFFKdHlOWmIrMlIwOEZXRWh4c3BPYWZQK2ZxZTNGNDRaTWFqYU5uTitD?=
 =?utf-8?B?QzRQOFVzeVFmczdwM3ZCZS8rcCsxZ1d5Y1J1L1BZZXBXcEMwdENMOE1vb3Jj?=
 =?utf-8?B?dUc0am0zTHBtR1NXWWNHMnptakg3YjltNnN6ekY3MnFlSld4ZUN4NUxsSGEz?=
 =?utf-8?B?Tk4ySWkzU28wa1FTWG9PVDUwR2J1RzNBUENZZUZ0K2wrU1Y0N2FqbklaMElF?=
 =?utf-8?B?RW9qb3hNd3FKWU82SlpxNEk3bEJjeE1vZlJLc0paaUZsVTZNUHArdGhFWnJH?=
 =?utf-8?B?bS9kY0tOVk41SzlvOEhYUWlJV2VRalVUNUFkQ0ljVUdndjlxRWV3M3lBRGJy?=
 =?utf-8?Q?UI0GoKegb4+UIsAP77+nmrkmT?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82424824-ea7d-4eb2-be0c-08de37d07f51
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 09:42:56.4131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vv3/lzBFc7hKnwMEcTTPH2b4qucol7jQbqb6yy+By7ypMWuYSIIRzl5PRKTbNZcGwsQZydtTfz5V/fKPNNKz2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6908

On Tue, Apr 26, 2022 at 12:26:10PM +0200, Jan Beulich wrote:
> Just like for PV guests MMU_MACHPHYS_UPDATE implies marking of the
> respective page as dirty, additions to a HVM guest's P2M should do so.
> 
> For HVM the opposite is also true: Pages being removed from the P2M are
> no longer dirty at their prior GFN; there's no point in telling the tool
> stack to try and copy that page, when this will fail anyway (until
> perhaps a new page gets placed there). Introduce paging_mark_pfn_clean()
> (intentionally without a paging_mark_clean() counterpart) to handle
> this. Note that while there is an earlier call to set_gpfn_from_mfn() in
> guest_physmap_add_entry(), but there's little reason to mark the page
> clean there when later in the function it'll be marked dirty. This is
> even more so given that at this point it's only the M2P that gets
> updated, with the P2M still left unchanged.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> p2m_add_page()'s error handling looks bogus in this regard anyway: If an
> error occurs before an MFN actually is assciated with the new GFN, the
> M2P entry ought to be restored imo. But of course a guest is still hosed
> if the operation succeeds partially.
> 
> Note that I've not even checked mem-paging and mem-sharing code for
> whether they may need similar adjustment. At least the latters is, aiui,
> incompatible with log-dirty mode anyway.
> ---
> v3: Re-base.
> 
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -549,7 +549,10 @@ p2m_remove_entry(struct p2m_domain *p2m,
>          {
>              p2m->get_entry(p2m, gfn_add(gfn, i), &t, &a, 0, NULL, NULL);
>              if ( !p2m_is_special(t) && !p2m_is_shared(t) )
> +            {
>                  set_gpfn_from_mfn(mfn_x(mfn) + i, INVALID_M2P_ENTRY);
> +                paging_mark_pfn_clean(p2m->domain, _pfn(gfn_x(gfn) + i));
> +            }
>          }
>      }
>  
> @@ -737,8 +740,11 @@ p2m_add_page(struct domain *d, gfn_t gfn
>          if ( !p2m_is_grant(t) )
>          {
>              for ( i = 0; i < (1UL << page_order); i++ )
> +            {
>                  set_gpfn_from_mfn(mfn_x(mfn_add(mfn, i)),
>                                    gfn_x(gfn_add(gfn, i)));
> +                paging_mark_pfn_dirty(d, _pfn(gfn_x(gfn) + i));
> +            }
>          }
>      }
>      else
> @@ -1096,6 +1102,7 @@ static int set_typed_p2m_entry(struct do
>                  {
>                      ASSERT(mfn_valid(mfn_add(omfn, i)));
>                      set_gpfn_from_mfn(mfn_x(omfn) + i, INVALID_M2P_ENTRY);
> +                    paging_mark_pfn_clean(d, _pfn(gfn_x(gfn) + i));
>  
>                      ioreq_request_mapcache_invalidate(d);
>                  }
> @@ -1117,6 +1124,7 @@ static int set_typed_p2m_entry(struct do
>          {
>              ASSERT(mfn_valid(mfn_add(omfn, i)));
>              set_gpfn_from_mfn(mfn_x(omfn) + i, INVALID_M2P_ENTRY);
> +            paging_mark_pfn_clean(d, _pfn(gfn_x(gfn) + i));
>          }
>  
>          ioreq_request_mapcache_invalidate(d);
> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -657,7 +657,10 @@ decrease_reservation(struct domain *d, g
>              }
>              p2m_tlb_flush_sync(p2m);
>              for ( j = 0; j < n; ++j )
> +            {
>                  set_gpfn_from_mfn(mfn_x(mfn), INVALID_M2P_ENTRY);
> +                paging_mark_pfn_clean(d, _pfn(gfn_x(gfn) + i + j));
> +            }
>              p2m_pod_cache_add(p2m, page, cur_order);
>  
>              ioreq_request_mapcache_invalidate(d);
> --- a/xen/arch/x86/mm/paging.c
> +++ b/xen/arch/x86/mm/paging.c
> @@ -260,7 +260,7 @@ static int paging_log_dirty_disable(stru
>  }
>  
>  /* Mark a page as dirty, with taking guest pfn as parameter */
> -void paging_mark_pfn_dirty(struct domain *d, pfn_t pfn)
> +static void mark_pfn_dirty(struct domain *d, pfn_t pfn, bool dirty)

Nit: set_pfn_logdirty() or similar?  The function name makes it look like
it's marking the pfn as dirty (when it's also used to clear it).

No strong opinion, it just seems to me the name is slightly confusing.

Thanks, Roger.

