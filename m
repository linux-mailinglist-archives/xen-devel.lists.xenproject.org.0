Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3038DD0523B
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 18:44:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197916.1515260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdu3e-0007vA-2L; Thu, 08 Jan 2026 17:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197916.1515260; Thu, 08 Jan 2026 17:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdu3d-0007sT-Vp; Thu, 08 Jan 2026 17:44:25 +0000
Received: by outflank-mailman (input) for mailman id 1197916;
 Thu, 08 Jan 2026 17:44:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AIqS=7N=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vdu3c-0007sN-CV
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 17:44:24 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9b7de87-ecb9-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 18:44:21 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN9PR03MB6202.namprd03.prod.outlook.com (2603:10b6:408:11f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 17:44:15 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 17:44:15 +0000
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
X-Inumbo-ID: a9b7de87-ecb9-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFDNwVjsTGpOTwlWWRnEK7npt6y/Sl0ImWG71YIRjJHmSPFyj6nhnH+q0ToAFBIoDPbBrxZOyRklFuux85S6pFuCW6xzKcedsMTMGNWKwQRKiPa2RBw7JqNS2lmK7Enfg5GJYRddFW2sCauEkzmdI1fx3CSMy9q35FmnKDWo3aAP8mNJ238d4VoEcY5RReoQRPNWLE51fmIAoM4oCSZBJ8Xl8RpHjqu8NP31kLgeTkERNzTucm/Ick4thQM2/3+AldaIU+/t7Bk7k7ZedvWRdII4RiSwRMq8jcc+Pspz2D9W51ub2TwljeH7pqgEJmEWeFu2swGooQEUZhstEDRaLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJcyTYY54PKC5kcMbnAZ52VQGc1qgvdmB5zg6R1ivj0=;
 b=DytjvfsVoXb8GP0tozYs6WaaNPgb/8UBFqEbjFGo+pMwxbeKHgzjUs5bvj7e9rwJFlAOeffB+tbXEcODKlj0aCpmO2l5MJeujjgSexMRB6YlpJAhphpgCQyjQUvx9X2D1RsfHO/cfweolqVXwwbTY8VqrHlrqHNuZWtb/Tg3xJRYt4TNygal9P5JS1XTTPfucvdU53pt8XlLIAxm5aVE1e1Gv1xbv0ZR0MPKiF6H7xZNdZnUD6PjoGsxweEdj190tftOe/MYOsu6sKWCrtbGVwtrKZyWRY/2MsxPxGaJxZJKPUE0idhjmwsYI8f0jGxbbzSyxGU2CBonvAjxlSZIFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJcyTYY54PKC5kcMbnAZ52VQGc1qgvdmB5zg6R1ivj0=;
 b=fcjWImnicnpnRfnBlLGJZ9E1N6MpLs9YGm7jDXsjchNGd0kZLOLG/LUdUE8NOdrdHs872cvZfK6/7NlKUYorQga5KdMtFiu1bWgHq+FAQPNTx/hxWpYHLQBFJZAVs7TqaB5yzXPQp3gM/skYmNhLPplSXK8esq1k7T2XQswGKVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 8 Jan 2026 18:44:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH] pvh: Introduce SIF_HVM_GHCB for SEV-ES/SNP guests
Message-ID: <aV_s6ySoXU-G7Gno@Mac.lan>
References: <3b6f5146287d3402a09836b7cf876d4f8dc9eee1.1766889890.git.teddy.astie@vates.tech>
 <0c9c1dbb-28e1-479b-a680-e99150b3f0da@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c9c1dbb-28e1-479b-a680-e99150b3f0da@vates.tech>
X-ClientProxiedBy: PAZP264CA0244.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:239::22) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN9PR03MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e79262a-bb38-4470-ce95-08de4edd8a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2FJcDkzQlBzWFVzL3h0VmhRb0psWGJualhyQlkzbnRtbTJTYWJwSjQ5b01m?=
 =?utf-8?B?YUFrUWZJOEpDZEJzSmRIeVhhNXByQ2h1ZUdRRTZlT2dJVHBhWWhnR2hLc0Ri?=
 =?utf-8?B?eXQ1L3Y3cnM2b0NOa09QTHI4ZnpjSmJpOElZSm00R2NNMm9rSTRVS3pMR2dU?=
 =?utf-8?B?SjlyQkdHNXVrcC84dlM1YTlQeUtObGRtZFNydld6dFNHM3piVTA5dW9zektn?=
 =?utf-8?B?UEdZSkYzOTdNczFHRFo2a3dLSVNPay9OdzB4UTc5SFFndWRwM0ZvNlJPSkpO?=
 =?utf-8?B?eExDMlFrdnJHaXZTbnlmWG9qQ0owMkJjQi9jK1lYR1huNjlMcTlzKzJKcEdp?=
 =?utf-8?B?OGw4bzNNeUZzdm5FYk1lcWNETC80bXF5NXBjZ3Q2WDZrbDZoZWkxeVpsR2c0?=
 =?utf-8?B?VnA4QTR1QVNmZ2RLTzc3OE5qN2QxN0FkUnpiWEZGUm96YmhwNWpSd3dHVTBY?=
 =?utf-8?B?NXM2LzR1WG9Od2J2dWp2REVMSVZQYS9sTDhSRlREZEhFUE5RT2VXcDhjR3Jk?=
 =?utf-8?B?U0V5UzFxdnVuNW9vMWpNZmozYmhHL25rOHpSeWdEUUQ2NGVZN1FzY3BMaUFm?=
 =?utf-8?B?T0FLc05FeTE5amt2dmJkOTNCTGVFSXRrQisxRWJNbHpEbDg3WG0xNHU5SFMy?=
 =?utf-8?B?T3JETWgvZUpNR3doYTV2VzFmbHZ1VjZIaGtGeEkvVFNsYXpQWUMyVTNQTXJR?=
 =?utf-8?B?YmxhcGVDQ3kvVUVwTlZ2b20wSkJ2bjAwRkRyQ0k0NWh2N2IvQTlNeGpVWVdu?=
 =?utf-8?B?UFJLVmhiK1l5T2VkRTd1Q253dTN6bjdFUG5WQkh1K3ZCRGpWV1grbzBHdXBx?=
 =?utf-8?B?OFVJUnh3Mk5BWkZEYTJ3ZVdCaVpDUzljUDVVSjF2WFUzdVZTRjFrUDlSVHVD?=
 =?utf-8?B?MUtmVkc2K0lBQWhHay8ralNkcVg0NmZ2bHE2UGVuK05MTmVkVkRRZUMyeVc1?=
 =?utf-8?B?Y1VlVEhUYjcwUSt5MEIvOWFzYWhZbnZ0anVkUWRQRjRHTWNRUkxSamtUS251?=
 =?utf-8?B?VlUwZCtFU2d0YnhrckZUc2ljYURoRUtwaGJyMmQ2b3A4bjM2S2orN093cEpT?=
 =?utf-8?B?cGthejcxNG5sWUhQY3gvVVU1QVpUckhtc2FiZnpIWWgvMmt6SjJEOGZrdkNu?=
 =?utf-8?B?NjNoQitZbUtRQ1ltRmlpSkYrYThtOHpmeVoxYTg0MlVlU3F0QThGdGw1d2Ns?=
 =?utf-8?B?RVhoeWtiYTVsYXNKYjBnOHYxR0ZVTldxd1lSeXBxZ1RhUWRxUUlkYVF6UHZl?=
 =?utf-8?B?QkdWZ2VUaXhoT3FuUVZtb2k5NnljRU16MWFrUnd5QlZoUWUyMkRUTnBvV2wx?=
 =?utf-8?B?c1hzcGFTdzBPU0VPdWUrUjVTZUM3UjZpeUpCc3BHaEdBVHp1WHl4K1kwcmpV?=
 =?utf-8?B?N0NmUExhZThoa2hMa3pTV1gxSUpKTkdBWGZpRk9TS255YndXRjJsR1pIN1pD?=
 =?utf-8?B?Nmt6TW1oQkVoNHlEYkJ3eVlKQWJxR1pqQVE5dHZaVXQ4VmtMQSt1V1JVSmV3?=
 =?utf-8?B?YVUrQnIybjEzcmNVelB6aDJZOHUvdVhzTjNEa1VwNG9VeXowYlBQbXdQdExw?=
 =?utf-8?B?RVp1V1pWNG9QV0FQSXdQS1k2ZTY5NkdHRlhna0V6ZmhnMVhqTHFyUFpOTm0r?=
 =?utf-8?B?eURWTytmaWsxbmNOYk85TzFNSWx3U2xyNzdockNiRCtRa1I5ZVcycEZBOXZC?=
 =?utf-8?B?UUVOM09TSjNteFFEQ3JxZWxyMmhFa0hlRnV3Wnl2aHpxcndQT0FJNHJUNFZ2?=
 =?utf-8?B?RWptQjJ5cmg5M2lIa0xlalFpVFVPdzhDZFB2NHJKb0x5RS9LSGpaM0Z2UFdx?=
 =?utf-8?B?WDdCSmh3MUhWb2YzeXk0amUzdVV4cDZsRnozaTgrRmR0QmJiRGpINUp5OWlQ?=
 =?utf-8?B?UkVuRXgyQlBTc0U0MmxGM0tKVDkwK2NlTWIwSVhuN3JOTHlwME9JYWFmSlMz?=
 =?utf-8?Q?TtIFMBZ5HvZe1zqE5c8rlMTmvkgIYxmB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlIvbjMvM1FFd0Z3RlFhYVZ2VkI5bGYxY2FVdjVIVk5RdDBjS0M1Nk1ud1Q5?=
 =?utf-8?B?aS90ZDFtcVNjMFhVQk9QQm5SNzViU0Y3WGhWRGJJQkZ0MytpNE5BZFZTbjFD?=
 =?utf-8?B?OGsvTk41RlBvZmsyVHdXTjA1VEtwTjFkUWR4Zksra1dZZVJuYWc4aFBkYi83?=
 =?utf-8?B?aVYvbUtOQTNjazIwRDBwenJUQ3IwWnp5TGtNTGJVS3dhRWlhbXhtMURrZEdE?=
 =?utf-8?B?SVZkRVdsdlRzQVVHSGxVUWZMOVVUdW1SZElEb1I1eVZ0ODVIb3VoU25ZRVR6?=
 =?utf-8?B?Z09pZUc3dkN2Z3d5ekVJaHh5VTE0cEdrNVJVRDVua1EzV1BRVWwxeFVGY1lh?=
 =?utf-8?B?WUZWa1Q5WTU0THZtUmpqb1BRQ3FOd2ZyOHp5bmtORFZaRkFDUWV3N2FrWlpo?=
 =?utf-8?B?dXJ2c2NneWhLcFFhK2szRFFoNnBPcDdMNnBaWHcrcVdSa2cvd0p6anNNN3ZO?=
 =?utf-8?B?RnlQTXhGMFNNSDVoRitON0VPM21MbWlhVjJwNHpkRHVHK2tMOEpTZVhKZC9m?=
 =?utf-8?B?K1BTMEVHWVJ3VVRGcDBCV0FjS2VrN2ZMRUpjUmlYWE9DM2EyVWNSUnYva1Za?=
 =?utf-8?B?emJNWDZFSFM1ZkFlcjJMQXFpS0paMVBSM1RNU3M1ODhJSkxocktyYWF4YVJu?=
 =?utf-8?B?VDZUMGQ0dlZNUTRGYnNFZk5DaFZPaXR0YURPWGo1M25xOFY2aWIyRVQwalZY?=
 =?utf-8?B?cHRlVkREOEM3dVBsdUNVVEZvNnVMRGNXVkJOUFRUcS9nNHVxNW9nQWpkMjgw?=
 =?utf-8?B?YW1JRTJyblV1YWk2dTNUakdBa3BFZ3VJeG1PNXV1M3ZUdVpFMy9wRlpnMUhM?=
 =?utf-8?B?bHJyZUNSdDNRZlZDenQ1RkFsd1ViZGxnY0xrb1JiNzhBMEE2MzlvZXRvaVdF?=
 =?utf-8?B?cUd1MlQ4NS9VTkU3eC9HUWNoNzd3QzZ1em8yYlAvVm5yME5qY2JnUG9RaUV4?=
 =?utf-8?B?Q2tmMDFkNmhhQlFMdHFrY2R3U1czcitZVlNpTm40ZWdaTXFoVWpDV0p1ZWF3?=
 =?utf-8?B?cDlaeVdZd3ozWjdaL0xqWm9Dd3pRY09qaTd1blNMT2JLRmFaSkNWOHcwQmtN?=
 =?utf-8?B?ZEdtZ2Jxa0FyRVUzL0JhcHZTVDMyeURhL0dLSXd3cnplM2lmVjRuTXFodytC?=
 =?utf-8?B?dCthN1V0V3ArV0VZUnZHUmd3a0FwZGplVGVqYXh1VXhRQjQ0OVoybTgxRVlX?=
 =?utf-8?B?a1lXZm9qTmZiRWtEQVRhUEZ5OGFMSXFzbDgwNWR3Qkdyd3QxRTRMYy84d0RS?=
 =?utf-8?B?eUI4dXdhUmdXOHNid1hPRE1HcEZ0bnp3UEpOZUp3Q3lubFYwdmdMdWlLQ3Fr?=
 =?utf-8?B?dmR1emxFaThoakt1STdqUEdheWNKSWJHQ1l5aHVVQ2I0ZFpoci9HczVBZEJU?=
 =?utf-8?B?OGZtNy9ubE9lc0F4Rlp5RVdqaTFWZHJNeGM5ckQ4bmZMNm9jbE9hVHFRV1dz?=
 =?utf-8?B?NW9HNGdQTitLS3dPWXBUY2xDVjA4ZkVpMDNVellYNHVFVElDQU5VRGNPL29u?=
 =?utf-8?B?ZjA0b0hySUJpQS8vdzBqQklaKzBjOVNDOThab2d4clRxMk1FUFlwK2s0VVF6?=
 =?utf-8?B?SnNXZFUrZ2IzMGE0am9pTzZUZ2Fudys2UzVBSE41Q29pOHJhUHlBUFlmaVZy?=
 =?utf-8?B?ams4WFRDZ2N2SUFxUVJ6U0QwUFRPUFlpM2ZFanRBVDBuVlNTY1ZCY1diWE43?=
 =?utf-8?B?M2RZU2FuRWNiZERDOW04RG50elRxdVg4ejNJcXgyMnBMRC82ckZ3Y1pOWHJq?=
 =?utf-8?B?elJyUFBKZmlEcCtvem9HQzN1OFpEa0tFL3JLNHFURzR2cnpHVGFDeE5TVi9Q?=
 =?utf-8?B?eC9aSzZaQWpXb3NPSTVXdW5MM2V6TEFvcGhDUjhVdlgybWNvSHA5dWV0ODVk?=
 =?utf-8?B?ekxkcElMVlh5c0htTjVQWG42MG9seGNwK0tLQWcyWWdYZ3JTNWJnMFVVM1VE?=
 =?utf-8?B?TmNDVDNFRCt3OStlMkNpa0ZCbGtubExKWGhhNll4NmRCTmI0dGs2Vmx0UkZw?=
 =?utf-8?B?cnh6b0Y5OUJySjFqdTJlbzc0bGZmRWJlNVVsZlNUTlVQci8xcWJVc3ppbWtK?=
 =?utf-8?B?WGxQNnloTkd6Zk5ncVcyRmQ5T1l6ZEZGU1R4RzZFYy9OL0JxN3cwQWMvVzNo?=
 =?utf-8?B?eHVucTh0MU1xbXVITHQ0YndHcHFwaG9yeGd2V1gya3ZlUlhiREFXaGdVSHJx?=
 =?utf-8?B?K1FkeVd4b2xjN1JWMkxobHRXWUQyS28rUVJWNmk5a2pNQnNhajg4NWl4M09R?=
 =?utf-8?B?Z25rbHlIS3lxaWRnMCtMNUJVYTZhakEzQ1pkcHppdzBweUZNWlRqNW1zcC9U?=
 =?utf-8?B?MmpFRTRmK09CYzg3TVpESUpHVjZIMFcrV3h5NTJzNmt4bUJFSlgyUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e79262a-bb38-4470-ce95-08de4edd8a5d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:44:15.1759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oN5C6Jq0J1Suj0Z/0GNERLT+Q1+tAMZsZ5Ul6tekvFQMuVvZU+h5PXqPQZYEW5ktQdqcitwU8q5ePfl/DxQSUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6202

On Thu, Jan 08, 2026 at 04:50:51PM +0000, Teddy Astie wrote:
> Le 28/12/2025 à 13:54, Teddy Astie a écrit :
> > Under SEV, the pagetables needs to be post-processed to add the C-bit
> > (to make the mapping encrypted). The guest is expected to query the C-bit
> > through CPUID. However, under SEV-ES and SEV-SNP modes, this instruction
> > now triggers #VC instead. The guest would need to setup a IDT very early
> > and instead use the early-GHCB protocol to emulate CPUID, which is
> > complicated.

Possibly a stupid question, but how is this information expected to
be propagated to the guest when there's a guest firmware and
bootloader in use?

How is OVMF and/or grub propagating this information between
themselves and to Linux?

Are they relying on the CPUID discovery logic mentioned above, or
there's some shadow infra used by KVM for example to already convey
it?

Adding Xen side-channels when there's an architectural defined way to
obtain the information is a duplication of interfaces, and could lead
to issues in the long run.  We can not possibly be adding all vendor
SEV options to SIF_ flags just because they are cumbersome to fetch.
I know this is just one right now, but we don't know whether more of
those CPUID options would be needed at the start of day in the future.

> >   ## AP startup ##
> >   
> >   AP startup can be performed using hypercalls or the local APIC if present.
> > diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
> > index 7f15204c38..9b84df573b 100644
> > --- a/xen/include/public/xen.h
> > +++ b/xen/include/public/xen.h
> > @@ -890,6 +890,8 @@ typedef struct start_info start_info_t;
> >   #define SIF_MOD_START_PFN (1<<3)  /* Is mod_start a PFN? */
> >   #define SIF_VIRT_P2M_4TOOLS (1<<4) /* Do Xen tools understand a virt. mapped */
> >                                      /* P->M making the 3 level tree obsolete? */
> > +#define SIF_HVM_GHCB      (1<<5)   /* Domain is SEV-ES/SNP guest that requires */
> > +                                   /* use of GHCB. */

A concern I have with this is that we are adding vendor-specific
terminology to what should otherwise be a vendor-agnostic interface.

There's already a fair amount of arch-specific information encoded in
there, so maybe not that much of a big deal.

Thanks, Roger.

