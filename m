Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0D5BFB432
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 11:58:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147811.1479961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVc9-0001WO-Se; Wed, 22 Oct 2025 09:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147811.1479961; Wed, 22 Oct 2025 09:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVc9-0001UL-Pu; Wed, 22 Oct 2025 09:58:41 +0000
Received: by outflank-mailman (input) for mailman id 1147811;
 Wed, 22 Oct 2025 09:58:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+n4a=47=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vBVc8-0001UF-Be
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 09:58:40 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae598f82-af2d-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 11:58:39 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 CH3PR03MB7409.namprd03.prod.outlook.com (2603:10b6:610:195::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 09:58:33 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 09:58:33 +0000
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
X-Inumbo-ID: ae598f82-af2d-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QctVF2UHCNiq6UYkZ6Z03FgWTKojTZOSMx19v32rVq0cng88MDrcWFaKJ2vLuMTnAPXWaXNzVdN9QDo0b/9CZvPRMG4dKFbM1nm5+mVK4oN4/Ze/uWgPfKwdaUQQhHbutG6kc1gl+vd6SoJRDHZuAMBR34VsnGxUypVdl2fJZc2XDVA3Ziq+91dhRM9AfLp3tSlG27jLHARi/yKiXnwplzAR/Oh/mkPxq9YaStXItDL1ThDfcIABJYYoCpS4nH4ub9wCnxOw68wes0OJHdZtbIoQXk7jLlAM+LHys0cHYlQCirOFqycarzloS0LmunG6uteB/qm5IdDoabKp+SBYbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOHXihEUwjHwoXMW6yWGv9PJBf8ma/WW1N3dIzUNNaQ=;
 b=oAWnFwkWL/lckR78ULDH8UvzMpbf/VbayhTa29fqGjx8f/Q1e29BUdzPom8zCQcZr9gRHZ1ly9a3IR1zZr3s0lNWsJW2ZrHJT32LF9TKe8Z2lZb4w+Sc8/5nTl4uOePncBJ4mbYs+2laZN/DNosYBHKoIw17hSdFvRvBoq0mOWsz2xIUs1ETT7m/ltS4k2YR1jfGSHsnxoORdg+/m7HvXviPgTBkokeU92q6WeKX2cOQz88sf37dRjYY3icn0YROYtpn3EGXw4bBTKyrjhfpdpG9Q7aHYPKL7wDrt2SPfF5Ei8ht/cbUXwVWVj4T8NZZy6zFsvM+1zqEFkP6Avt+IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOHXihEUwjHwoXMW6yWGv9PJBf8ma/WW1N3dIzUNNaQ=;
 b=MrwTMcVGexCphlcfYxAv/E4ZF713UNmaLs9YdxTyW2GGoiBlv5ELWxSJpptrudiMQJPQQILFIbSiLnwHvmrNZIx4/oK47hukN5XoQsgLwo199v/GYDdvaEFfBCn6VD2J1FcQEj8KQAZf4OTwq8NcRUWkiy/qOkj07gq1BJQK9wI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <dcefb3b7-3640-4131-93b8-727ccaead991@citrix.com>
Date: Wed, 22 Oct 2025 10:58:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] vtd: Move (un)map_vtd_domain_page to extern.h
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1761124632.git.teddy.astie@vates.tech>
 <74ff3496afcc0a0b747f9ea203d10f51e6b4d00c.1761124632.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <74ff3496afcc0a0b747f9ea203d10f51e6b4d00c.1761124632.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0041.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::17) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|CH3PR03MB7409:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e9346f0-c070-4adb-18dc-08de11518f91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmllU0YxWCtXUU0zcDhjWmJLc2ZrSEZPRkpYclhkV1c2ZTFHMWN5YVZVQVlx?=
 =?utf-8?B?VVFkT2pidk50NUZmMW4yb3dnSFk3MjdXbVc2Tk93WHpZS3hzaFA3VTVFWVlQ?=
 =?utf-8?B?c0d4UUt6QU9KVlczVlUwRjNMclRXWWsxanJtUFkwcDB3Vnhtc2YvWS9hMnZ1?=
 =?utf-8?B?K1hDclN4c0Z0eVh6bjI5UTVabUNSSVNhSEsvNUkxT2ZvV2w0V3B6WTdHZE1D?=
 =?utf-8?B?SUZkL0d1T0RoVlVBVDNxUjdEbUc2c2hackFKSXgzNTh2Y2htRU5jaEZaWU96?=
 =?utf-8?B?MEdKRTZReDBvUTdXRmVGYWw5Y1BYT1NWK1FsNWR0c0ZteUs4RHoybk5DL3h3?=
 =?utf-8?B?Y25FNEVhQzE4aFlKZEp4d2c0SkR0QUkvRUxhU0lpZXdnV1pGQVY0Z2lwNFFE?=
 =?utf-8?B?allXRVZoU21uQit1QllnWWE4ZFZvVFo5dDcvdkw4M3pDQ0ZOYThqSitoQzJH?=
 =?utf-8?B?OTlnMHhrekh5TVdhV0F2TWRobmpSbnpnQ21aZW1SS2pmbjJIMEJpRjczYnpB?=
 =?utf-8?B?VStXUEVXTTB6SlFnT1NqWkpGVWJPQ3I2R0xSV0dFQ1QzbVVkUTBnbnRWTUNk?=
 =?utf-8?B?QzAwdmNoRG9HcnRYbzE2VGdoT1M5UklaV0RPaCtjaFFBV1VnYjIweTRUekhM?=
 =?utf-8?B?ZktoemZSaHNWZGpIc293ckJzSjBvT3E4cjVkYm1rSFhUMmxVd3Q1aFRqN09a?=
 =?utf-8?B?eEIvUDllL01OVEFmU3pzN1N0elBoL0pkVlZJZm9uSkRQaTlNZ1p3Qjg1bHBQ?=
 =?utf-8?B?Q2FaQ2w0ejNHMEZvK0Z6THEyQTlHTUd1eStQVkl2QlF2YnZMcmtwRnQ5VHFJ?=
 =?utf-8?B?d3JnZm9nS3VPR2dXS0k1bEJHRFN1ZkFFWkVpRXVKMGhvK3M1VzN5M212Y1o3?=
 =?utf-8?B?R2NRUDhjNnBIa1o1RjROWmJnT0Uwd2tkdDNNK3cyTkRYdEdFS2gxUm0ycW9Z?=
 =?utf-8?B?aHE0eGhmaEp2Nk14bzI1K0c4NVZETk51TmZ3UUFlY3RsMTRsQmVJYkNhSzQ3?=
 =?utf-8?B?cnBBREJWa09ZT3ZyRk0rTjhpN0RwR0JDcWhsbklkekQvdkNVRjdxLzFaS3A1?=
 =?utf-8?B?OVBaR1BEbHpTNnU0UGR5SGZhc05SWTVPbjVoUTAvRVBRZUZIbEhZVjZoMXQy?=
 =?utf-8?B?REhCOVNFQzJYdU9hOG9zcmREL3VkV2dvRXhNS0ZscUFILzlIMEtudUJhUzJH?=
 =?utf-8?B?aEg4SXNLait4bk5NSDQvanVyNzFubTY1VG5qbTdITkY1T2p5eU1EVnBPc3B1?=
 =?utf-8?B?ZC8vNkNRc0pZNHpRc0g0MjZXYmJPeXFjV0J3SmU2VG13ZFp2UHdwN3MvaXpv?=
 =?utf-8?B?NDQwNEFMTjdvQzVFVG9NUjM2LytOc3hXci94T0lOR0VTSnYwMXBFc3hZZGgy?=
 =?utf-8?B?UmJPK3ErcWgzSWVNMnJVcWswN3pLeHN2bnVjSG5BL1duYVdzb0NIZnVQYTdk?=
 =?utf-8?B?WmNZTk41U2plWXBiTU9zd2p2VFQ0ZXJCVGptUGdOWjQ2QWx1dUp1REplYys5?=
 =?utf-8?B?VDVjMVg2MDFRSFh6ZXdPOEdrYXNNY1VJUUUyZW5RamRMUkt4WW4wTHpkNGkv?=
 =?utf-8?B?eHYxZmNlS2dLbzgrS3NnemdXQ1ZqL0NnYnJTQVcwNGdXTzlVZE5rSUJJRVh3?=
 =?utf-8?B?ZlZlUElOalZZcWM0a3NJNVZqejNNOU82bXU1VytSK2xDMkRSckNrOGNvTnp5?=
 =?utf-8?B?dU1CSFlPZ3VHUlk3QitrKzY5MzdqZHdTRGk4RUJ0Y2Q4dTFvcURuREg4WG12?=
 =?utf-8?B?Rnk2aUR0SHdoa0llOFYyOFdXak9oV01BbGttajhaRFRYcUs3Q0taMjJtaXJL?=
 =?utf-8?B?RDNkRHp2bGRQd2FWZWVZNWJJMVRpaE1PMmFCSzdzQ05tOWdMNVhtVmdCN3NK?=
 =?utf-8?B?RTZIbnRha2VDb1ZjZjEzdVhWME8rR0lBT2tSTTFYUUY0SmV5WURKWHcrRExj?=
 =?utf-8?Q?nagw9fCO0JA6yJV/Dk8w9S0YsNC2DUOI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajYwRWY0MU9qMFFPWHhlZFRhZnlBUnB5ZzQ0WGt3aVFBUW5Qc1hOSVUyc0xN?=
 =?utf-8?B?YUpwclBEcTc5UldxS1JkVWFxczBrUWcvcG1tcjlVK1pmMzdxWjYxenk1SXVz?=
 =?utf-8?B?SUdDeERLeWN2Zm1BNkhuQmp1OVNMVFpMYkI3NlhUS2JpQTYwdkhzSHI3ZXo2?=
 =?utf-8?B?QVJ5bHZGekZEWWtuVUZPZXdSUTMxdmlqUzFJdUZWK3RNaFRXaHRmMEowWE0x?=
 =?utf-8?B?eGFTMmNXdk45VS9XUFcrYUNPYzR0U0xRcW1pdWhOUzlBZVNaN09oREtQNWR5?=
 =?utf-8?B?WDBVcW9WeFZob1krSHhISnpzR3BnVnVTTkE5NFdjZnVGVzZiY0FBcGJNRTVu?=
 =?utf-8?B?WktnWGN0cjNzTTdTcmNITnZZSi9nZENveDlpOHRwS3hJNE9IM25aYk9tMjRz?=
 =?utf-8?B?c1BSZU1sMTNsNnBvQnVjdVRQWWttVEpYZ0ZMVWIyR3BaOFdKZ2RaYnIwQWRC?=
 =?utf-8?B?aEZZaitrL29yd043eU5HRlNuSzA5emFDMzVqQzZ2VWYwNkhTSTB0ejBnM0ZL?=
 =?utf-8?B?dGp2dnZRWjJqcTdKbjdNSXN3SWJ6TmFGTzJabEkxNExEeEs5MmdGZXhGSFFp?=
 =?utf-8?B?NkJPdzdqSUdKdkhpcjJYaFErYVVDTEkwTlEzWk9ja0M3a3BUbytIZk83MUwv?=
 =?utf-8?B?QUFPV21idHhFQStNS3JBWUx4MGpyTzlWcjdLUk5yb0w5QUd3dlZGSXYvVW9h?=
 =?utf-8?B?TlpxWTlCeG1FMFd2M0g4Znk0MEJ4OWJESTVJa0FlOVI0T1Q0dHZyYmZpQU9a?=
 =?utf-8?B?Z1EwZ3hVbzM1aWs1Z3dtK1F6OWdwa0pUaTZYbUppV21hMHlldzJNV2VUZmY4?=
 =?utf-8?B?VHh6SkptQ1IrbVdramYxeSt3a1lGbnY0eVlHQjhMQnd1dzBQMXlXTjdXNUMv?=
 =?utf-8?B?aEVQaWsxMUJBYUJhT3FyNUVOejQrWkZWTjhqdlBEL2tvZjNheDFJNkcrYmhW?=
 =?utf-8?B?Y3lPcEExVkM4d0Yrb0xISjMrZURvZURTZ2dMWVJaMlVFZUp1S0k5dWhuRmpw?=
 =?utf-8?B?cmFWdVg2czRaUU5RenQ4Zk42RGlNYzMyU1BHQ0JielBhdGlqam90S0EvVUVl?=
 =?utf-8?B?NlVpS2h0bU4zYllqWWwvUndrQVNLa1BvdnNRSnZrQjMzRTE0VlhORExxWTlY?=
 =?utf-8?B?d0J5cDdsVnVhcG5PRkJ1SjJPQ3RXM215Nnl2bVc2UENVOEpNWG5vc0dzWW0y?=
 =?utf-8?B?M2tuK0hvYU9UMk9ZVTg2S2F0em9oQ21kRHZmUEdkNWx3THJLaUY5bGJzZGd4?=
 =?utf-8?B?VjZUZVNuNWN5MmFyV3VQRWNpd3BLMGJyaEVENncwQXZDKytJeDBQUW0waHZN?=
 =?utf-8?B?NisvUDVNcDR2STVQdE9VNUlBbWdWdmFHYnAvRjZsRS9sSmo0S25ZVnN5cno0?=
 =?utf-8?B?clBXSk81UWlmTDl1SFU4bVRiWXk3S1NydmZ1c2NxeGJWUzMya2w2QmhvK0dz?=
 =?utf-8?B?NXVYdGVjcEJ6WlBTUEQ2eHFIM0V4bE5yc1FFcCtuV01ZWmJUQlU4ejg0N25X?=
 =?utf-8?B?dU9PcE1ZaHNmcy9RNUdkVGZaWERBQXJHUERVbVJxU0MwbHFzZmxuNllPOGZ5?=
 =?utf-8?B?cWpjei82Z294Wi9XZ1RCVFFYdjNsSG15c2dxOGZUeFByTEIya21jWHhYcWNu?=
 =?utf-8?B?NzB1Y0tnanRsdGVnLzAxMkxhMm8waGVEWWIrMllXUmtWZDd1N1V6TEZxUGNG?=
 =?utf-8?B?dkJuZitZdzgxQkdCejJjUWtpcVJNWGJkNHdocXFpK3JzdXUzdk9XY2xoZWIz?=
 =?utf-8?B?MlZiQTRwQUZLOVUxZGU2TGxiRTM2dTZHdWdUT0FQUmxDMzlwa1NieXp6YTIz?=
 =?utf-8?B?eU13WDlJTFNBNm5BOC9Vc2czM3VWY3lWK3pxbzNybnNndFB6L2M5bGFvb3NS?=
 =?utf-8?B?ZTliQzZ5ci91SFZNc2tJaFBJQXNrMG9ad3VOdi9jRGtFN0xxSnpxWEE4d3E1?=
 =?utf-8?B?a201cmNIR09oMlpvanBYY0N2U3ZHSVpraGU4OEZ1dFB2QzlyOTZoMlJIbVd5?=
 =?utf-8?B?Qk1FTjliT1BzU3BlQjFSeDJSM3Z3TmQrbU1UV2VyVDAzdkZ6bk13ZWhFWjcr?=
 =?utf-8?B?WXNlZlZMTHJ4d2k5UXJ0blZ6YTQ4OVJLMlRyQjdDdGZsa3dzbVNSa1hZdWtj?=
 =?utf-8?B?d1pieGJsa3JvZFRCMnZnUUtoR2c3aUI4bDQvdjNMOFB6dGJiZzN6Q2tPcWZw?=
 =?utf-8?B?cFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e9346f0-c070-4adb-18dc-08de11518f91
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 09:58:33.5060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sjFMGZQO2L04JczirtcmvGpWBHMs0vhD2OHgyhbHxgswl0PkxYFPQNwkVe1Udh0iZP6j3hDTHSp3fQ6G71A9F8zDMtTeJmfnGPjP05vpxnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7409

On 22/10/2025 10:51 am, Teddy Astie wrote:
> These functions are basically wrappers of map_domain_page; move

We tend to write map_domain_page() with brackets, to make it clearer
that we're talking about a function.

> diff --git a/xen/drivers/passthrough/vtd/extern.h b/xen/drivers/passthrough/vtd/extern.h
> index c16583c951..a62310b3e7 100644
> --- a/xen/drivers/passthrough/vtd/extern.h
> +++ b/xen/drivers/passthrough/vtd/extern.h
> @@ -114,4 +113,14 @@ void quirk_iommu_caps(struct vtd_iommu *iommu);
>  bool platform_supports_intremap(void);
>  bool platform_supports_x2apic(void);
>  
> +static inline void *map_vtd_domain_page(u64 maddr)
> +{
> +    return map_domain_page(_mfn(paddr_to_pfn(maddr)));

maddr_to_mfn() drops the _mfn() wrapper.  u64 wants to become paddr_t.

Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>.  I can
fix up when queueing.

~Andrew

