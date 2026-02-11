Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPb5MLm8jGmisgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:30:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B521269D0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:30:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228109.1534479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqE2a-0005Ri-GB; Wed, 11 Feb 2026 17:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228109.1534479; Wed, 11 Feb 2026 17:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqE2a-0005On-D8; Wed, 11 Feb 2026 17:30:16 +0000
Received: by outflank-mailman (input) for mailman id 1228109;
 Wed, 11 Feb 2026 17:30:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Yav=AP=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vqE2Y-0004Qt-Mz
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 17:30:14 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fa98f40-076f-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 18:30:09 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ2PR03MB7110.namprd03.prod.outlook.com (2603:10b6:a03:4fd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 17:30:05 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 17:30:05 +0000
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
X-Inumbo-ID: 4fa98f40-076f-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6UTkI0D9ta533DQr0MbijxhH1QbeVV8i3TLvWwtSJpI0QjxsfR6LLwHkNLOYJFy/ClSWb3CE/xIQAHMczp6rX2rr0d8K2GWfdB8yqOZNL1D7VVfd0EeiV+KuRosY+GPggtxeQWeDFtp9tFfW7glGaOBMoSINPJ3w7iDb4hHX0kfeYKneWPzkI9AsyFPBrsOu1Z/SRmso95ljRJI1sJvgS2Fw5DdhgNZsPPWZ2Y5VWCRGjVK+xiRSwJEOvM5M9WsneAHIJxRPvb2Ye/p3X3RkV3brFKaq5uj0tP2OQ2FSbkEbSCYICbQLT2o0ryrld2p73DCAlUXNtSjcEUeF3us0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvRxHCINeB4XDe+8d5WxbCNOUpRrpeTIRs5E9YuaGlI=;
 b=ibN4zLMo50C2fMWNOOtWg3kyR6LAOLdKouCjJTaS2YiFewWg60n5q9kZ9L8ZULUg/PAG2ONrjXdDEar0VMTOsqFUoIu8dKFPnja3xcMOpaiKVVPa4aUk0atKrYfok/E8F+70AcbcS1fm4Scm1ghMqCP6KDy3I8O373OskXLft7Y0LsSh8Y+ckl/QSE4J4O6ozgkCfJ/I5YTvmPPrg0K27LA7z/pLGNCtAMxz1wQLLH90iW56AB6QWT5cIAkgIv9FXvpNESDO9oRDsDbUnzin2+k7ci/RmEo/PnjEbyzQDU8kTTwhB/MzRvLL0y30+aAdHQEuvQhk9QVKnt42gVcUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvRxHCINeB4XDe+8d5WxbCNOUpRrpeTIRs5E9YuaGlI=;
 b=DomNuV7O1QLHlXsRnVHrcB7QHMQuKr+X/ro2Uoi0SW8MjztlWeGlwx6Nwh5wfUcUMIqSou3j7Jo2/9BFFjK83tMiLbZ8c+gxsePfgssJMOPa1wkSf6GTp8gEkYDMYjhrD+476JY+mFFJIXBlEeFvr7YTQbVQLhw+vPTg4QNCnf8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <73bf621d-0795-4fbe-b926-71be3525b4c7@citrix.com>
Date: Wed, 11 Feb 2026 17:30:02 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: Put wait.c behind CONFIG_WAIT
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260211170118.109946-1-jason.andryuk@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260211170118.109946-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0351.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ2PR03MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: b8c93250-fb78-4d63-b36f-08de69933213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N09Kb01LMzh3OHNqajlCclhmNlNTdDAzdzJaN1RhSk1XYUlkeE8zVTB5Q0M0?=
 =?utf-8?B?U2JyNDFhNzlLVEFHZHRZMzVFRVhmRGtoNTRWNDEwNzBnc01iUFJZOFZQVThw?=
 =?utf-8?B?L0J6SUhIamgzNjBuLzhlb3Nnd1dtRXRvM3R2UDN4M1JYcnNsNlZnSlhyNXU0?=
 =?utf-8?B?UllPL1ZZR2trMGlhUkJwT0RRejcxUFdiL0dqNHA1aG1mU2QxVDE3WW1DbU1Q?=
 =?utf-8?B?MnhKdGJvTnhBRHpIcHNpYmVEbVNjeDlzbXQxeTVFVklhTGJXVis0ZFNTeXVy?=
 =?utf-8?B?WjAvZ1V1UFlyK2JWSG5Gck1MVGZhbXFLRTBSZU03bkRjakJDODl6cWZDM3hR?=
 =?utf-8?B?NHVmMWorYkFPWjVHS3lzUHF4QUhWeXZFc2lUL1VKUnFxa3VLSnp2VVRkamsr?=
 =?utf-8?B?Q1FyOEZ1WFhZeWdGV0VDbE9iZXJ5RE04aklBU0krT3l5RFNON0NHaCtaMGRI?=
 =?utf-8?B?QXdBeWIrdW8zSmZMUDlzb2xlQnhIV29zeFoxc0JRUUlpUTRkM2QwZDRwTDJY?=
 =?utf-8?B?MEM3eEE3N3lOMjFiN2FTRUgwdFVHNXVHbkFHMFdLbFdVdXJROWdvaXBmeGt4?=
 =?utf-8?B?RmplZ0p5MWF0dURmVVlLaCtjcDYyV1p2RytRMjMvU0NTR05sVjRYMUZSS3Js?=
 =?utf-8?B?REhPWURWMUpMa3NxZU1xUWxOL1BDTXRzUllMcDM2ako3YzhBTjZpUk5ib2pW?=
 =?utf-8?B?SUlyblJGUnA5dG0xR3dqZmppa1F4QlNmWUJFTlJjTEcxREpDdWJDc1ArblZ4?=
 =?utf-8?B?Um8zdGVISms1UTZiTFAzc0g2eE44NUM1TXlWZmV5NmtjS1NGMU5mdUJPVWhi?=
 =?utf-8?B?MWdjZk9xUllNUy9HY1p3Y29INndvL05pNU1aYjZmMGFBVVdLN1BVMzZBc08z?=
 =?utf-8?B?a0Y4WXkzR05WVlJXNlBoK1Y3ckJVd1daMitmRHpDNGpUS2taZnhneWYvWUcv?=
 =?utf-8?B?bWt0TnZaRlZmVkhPTFY4dHdaMG9LK2ZnYWE1NVVrNS9MUFJkOExjMVV1ZVJ1?=
 =?utf-8?B?MTAvYVA0VHNwRXp3UmVSU1ZmSlJuNVJoR2tEL3JSeFZydE94bDVYS1VlMUl4?=
 =?utf-8?B?TTA4U3EzTVZhVXNDM0pNeXRqNDlFdzFPNVdadHNZS2M3bENsVDJHakFIdHhJ?=
 =?utf-8?B?bGNsNzVPOFQxcEdQY3lIek9TY2NSYy9lNjRGd2QzWk9YblcvZUc5ZUF1K0xQ?=
 =?utf-8?B?YzBXd2xnU3BvNWlpZk1CTVlnaEVHK0ZhZk9yc0w2SkpOZzJTblJKb0hhSmxr?=
 =?utf-8?B?MjVRZm5kdDduSUo0bUc0SE1qMFVaT0NjdjhKdVVGSHVsdU9RUW14NDEyVWpm?=
 =?utf-8?B?RWtYWUNPOWdEV2pWZTNwVXlXMFA3WmJ4T20xejREV3YxS1lzd0tJUnZ3c3Rs?=
 =?utf-8?B?R2NhS1dNQXBBVGVLcVlIWk9YNDh6ODlEbm9IeVF2ZklNOGhZdGVLRUdiV0kx?=
 =?utf-8?B?Y2VDTnNtTjFPcWtCRFNzMFk3Q2hhU0Y1bTI4WWRXam5JZUltcDhXcmp5TmZI?=
 =?utf-8?B?OVFDUFBIYzkxc3drUVVLZ3NGU05LaUxxNm9kVmZPQmkzN0ZoVEdmcUtLQk5U?=
 =?utf-8?B?QjM0MDdhd2dnWFAvdDlGeEhkZHBNc2xZSndVdGMrR0lrSUcrT25oY0Yvc3dM?=
 =?utf-8?B?VTNXcFRudUFwVDZnQ1pHdVE3V0o2ZUpsK05JaEdJOTBueVlGS3ZCbHltWDFQ?=
 =?utf-8?B?Y2phUVVlY0lodnhpWVEyQ0pmK0FnRmZrMlE1OEhjVzF5ejJhM1p4Z0pqYXd5?=
 =?utf-8?B?cnEvZDBIbEZLTmpoR3B3cm51dWlVV2dsZUgvRzY1cG91bHNEMENaTEV3Nmcx?=
 =?utf-8?B?NUNySXhQWFQzb0VNSWNYL01QbitOb0FXbzU0amluTjdmUmF1RzJFaTc2VEkx?=
 =?utf-8?B?ekpUY2NubC9aOTIwd0dPRUVLNGxqVGNCc3FvSTAwTjFWaDY5UDRHYTIyYXFQ?=
 =?utf-8?B?T3hFN3F1SXExQVlhQUZSbzRoZCtDaGE0dnluTUJSUVFCTFk4VlpMT0k0UlNw?=
 =?utf-8?B?RlAyak0yWUJBSGRwaGlvQ0daY2NUYWQxVTFjSDA3U1l0N0xyV2VmMjFVT1R4?=
 =?utf-8?B?ZWpXbjJSRW5lMjJicHJDT1ZybFQ5VTVyM3hDc1piczNqVWZJRTZZM0drRlhW?=
 =?utf-8?Q?c5Gw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnU1RHZlclZjMDRkQkFmRURHaElQKzlaSGRtWWZrYitZK0xQUlRwQ2xsdWJD?=
 =?utf-8?B?b1c5OU1pMDRhN2puNTZDMWEwbkZvVXFMMU12VDBMVllXbzU4aXFNSzM1V2Ju?=
 =?utf-8?B?b29PUWdlSE1aeHBEeDVSbjdpS0t5V25vUExobzlDNk1VRzNYK2VKZHEvUDk4?=
 =?utf-8?B?eDlzY2RYK2hKZU9HVk5qZHJVSDNIdzdOeDdRNURnYU1RbGVGUEcwVWJZY3JS?=
 =?utf-8?B?VnB3eDhWM0IwMHc3QWovd3o3VG5ZYUFBY1Q4Zk4xUVcwUmU3YUppR0xXZkxj?=
 =?utf-8?B?b3d0T0hCakFNMlpFdDNxcUVpYktSTUR2UHFXaFMyV2U4cS80S0pzMDgxR01w?=
 =?utf-8?B?b09kang5U1JObHNpaE5CQkR1ODNlaGZTUTEyblJ2ZkVJd1NYUTE3QlZDOUJN?=
 =?utf-8?B?VmNJSnFKUnNsV0RFMm5rUTlvUkNucUxaVTBMRFNrc0F6OTQyOXhtODhXSjY4?=
 =?utf-8?B?cnE0b3F2bzZJdy91VDdtb0VTaUZsWWRrYWtBNCtHVVNxOHFDV0pIOG1XbUFG?=
 =?utf-8?B?b2xhOTFnMDFpVk0wdHlpcmRQUnBJcko2cDhsbDRzYjV5blp6SS9LUEJwOUly?=
 =?utf-8?B?dTJwZVFCTWpxeTNUM3l2eUV1RlphakNWTXBIWkRlNTYrb3ozb0RVLy9pbXk1?=
 =?utf-8?B?Y1hlWi91RmcveWQ5YityZFVGMUkwd2tnOGYwa1B4YUVxaWNndEZxSnNPUkFl?=
 =?utf-8?B?UW43c0lGa2lSYVIybHFHRmw3MUZpRXl2OXV5MzFYQ1IvNko5bnFFek1tQ3hC?=
 =?utf-8?B?Vjl6K0hER1I1bHk3eVd6TE1EVHEvQzhEelg2NFVWZzR4eE80anVScXBnSXFs?=
 =?utf-8?B?WFhEbmEvbE9HUXcwVFpod1loanhpdjFRUFJ6T1R5em4wV3Y0OHFQdTJlR2dM?=
 =?utf-8?B?QU5kTUg2VXZTTFZCZU5XM0lPeTM3dkhqVjZFYUhncTdyQjRUQjRNTTQ3azJ3?=
 =?utf-8?B?YytRM09hU2RYelRxN0dpdys0TjBST2RhbC92SzNRam1JUGZHTnNZU0o4Z3Nu?=
 =?utf-8?B?QllUU1JYZ21xZkplZkg3dXNqdDd4bmlNWnRaUmw3Y1hPNWpSTXNiREhFTnRD?=
 =?utf-8?B?a2V1Q0VaNTdjR1FqbmpZc1FUek5EWXJHUmFUYUZpcVRhM2tTZlU5NXJpSlVB?=
 =?utf-8?B?dDMxZDlBWi91eXN6TmZqQzJOL2FMWVdNRlhqSlU0NzNydlUveUtBWjRETERr?=
 =?utf-8?B?Sm4xeUp5Q0phb1JMN0ozUnZQTlFnZk9TYVBLZm5UMXJuYmdKVFIrMGgxR3Bm?=
 =?utf-8?B?VHRIazBCdW1zSU5FZDl0Y0VIU04wUDlta2tiVjBxcU95c2ZyS29oZXpyVThI?=
 =?utf-8?B?UERXaERsZkgwNGdNL1FSZG91b1lYOGFwaFNmUVNFSGlVK0U3TnVNWUl2aWFw?=
 =?utf-8?B?NFMwWDJSNDgzMGNpWGc3Q2lHQnVOYXFhVjJFRHBOK29FUEVDbzFRSE10RFQ5?=
 =?utf-8?B?amZkbElhQXQ2Rms4alBxZncyT1ZzRXdaa0t6NmVjKzBmUUFEY2tucUEvSTR1?=
 =?utf-8?B?ak5JS0VUWE9PWjcyeVdqRzliVmM0aDdsL1JFU1RCMzZINDNvVmxwTG1oVTBk?=
 =?utf-8?B?alJBUVFudHp3TzJhNEluRm9pWUtOZTZ1ZGl5SFUrUUE1ZlNzUGVUdFcwVGN5?=
 =?utf-8?B?ZS9nZEpXQ0trTFJSMXp1ZldSdmFsbTdrVjB3MVJUYy9rdEgySlk1TEpxeW5J?=
 =?utf-8?B?ZDFWUm14NEhrVlRXSDVKU1NSN1FNNDdXdGJRSzZVZk5hN1k4YmRoR3pERlBQ?=
 =?utf-8?B?QWNOVkFIZzVhdVZHZE50T1hvNzJxTTFCay81WldoTE5hT0JvbXJTYllVYkJS?=
 =?utf-8?B?SkdtR3AvbXlkR3cwMTNhUkJ5ank1R2toM2xTZWEwdHM0aDJYK2RuVXNXdkNl?=
 =?utf-8?B?NEhEYi9KNVpqMFgwajlOTG9VZzJWdWl5QnB3dzV1RFY5djNFTHBjWXlDbHRR?=
 =?utf-8?B?cjVkdmV6aUJaMy9IdWNXVTBqeTQ0c2hnU3A3eXVWUDEyZHN5bWNxUk9zQmRQ?=
 =?utf-8?B?ZkROSXRQcWxlNWVnSW1WRWdtZEx0c0NjT0d1MUNlL2lMTFRDa2FNQWx4VkRL?=
 =?utf-8?B?K05UTzV6bWw0QjBJMU8yOW5EaW80WktCeHJTUFV3WjR5a3l4K1d2MlAxWDhj?=
 =?utf-8?B?OWI2eXh6ZWR6STUxUURZQmY2MmFLcGdsZjB2cTlGVGJaSzgxRGd4SzdJbE5U?=
 =?utf-8?B?SVl6UFR0RWF5MVpId1pvRlFFazRVL1RrV1RJWjdZUzM3SkdEUVlwVmhSbDRL?=
 =?utf-8?B?ZjdsUkk3dk1qQW5LMjBVZ3JDSGZVdXJhbjJ5S2lkK2E1SFlLaHJ2TGxhM2tl?=
 =?utf-8?B?YmJGd2lxMTBBdi9Tc1ZOeWFjYTIzcUVZZDVNZW8zait5OURLcmtPZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c93250-fb78-4d63-b36f-08de69933213
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 17:30:05.5382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZLyZ08V7vIzFvGDBnZ4a45PcWH25wUGFpVTAop0B9dnVQYXwOhyxyPorK4nObqtfleRbcPMEE7ossbm1FzZKv9EVD6hK9ZuI+yRitVzaEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7110
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,citrix.com:mid,citrix.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 20B521269D0
X-Rspamd-Action: no action

On 11/02/2026 5:01 pm, Jason Andryuk wrote:
> wait.c is only used by vm_event.c.  Make CONFIG_VM_EVENT select
> CONFIG_WAIT, and use CONFIG_WAIT to control building it.
>
> Provide stubs of functions called from common code.  entry.S needs an
> ifdef to hide the symbol from the assembly.
>
> Also conditionalize .waitqueue_vcpu in struct vcpu to save space.
>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

I'd really rather see the API/ABI changes required to purge wait.c
entirely, but I guess this will do in the short term.

Two things want further thought.

First, because ARM uses per-vCPU stacks not per-pCPU stacks, it doesn't
need this infrastructure in the first place, but it looks like it's
still compiled in and half wired up.  I suppose you don't notice because
you compile out VM_EVENT on ARM too?

Second CONFIG_WAIT isn't great name because there are many things it
could be.  I'd be tempted to just reuse CONFIG_VM_EVENT and go without
CONFIG_WAIT.  I do not want to see any new users of wait.c, and it will
disappear at some point.

~Andrew

