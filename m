Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC5BC565BD
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 09:51:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160732.1488773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJT2P-0003AN-F9; Thu, 13 Nov 2025 08:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160732.1488773; Thu, 13 Nov 2025 08:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJT2P-00038b-CM; Thu, 13 Nov 2025 08:50:41 +0000
Received: by outflank-mailman (input) for mailman id 1160732;
 Thu, 13 Nov 2025 08:50:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X5Bi=5V=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vJT2N-00038V-E1
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 08:50:39 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d12f65a5-c06d-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 09:50:34 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV9PR03MB8414.namprd03.prod.outlook.com (2603:10b6:408:367::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 08:50:31 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 08:50:31 +0000
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
X-Inumbo-ID: d12f65a5-c06d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eidLP5OUCO2z6Bin8XyR6kFb9QupWz+0GFVQ8183m8+5E/VHSD69PoW9RvgjOB/mkY5QCo1Q/zu2HnCG5iMUmLpzbE6IgFlvO88Zu53OSxSeV9cG+UDiXiNcRc/NH+weDpenOoXBFq/Q+DiRmgwRSEIqTXz2ZbiV2WRtlSoODB/uQ0AKrGcqon8RlOXOED5ViYLhojbwpruwkJGTThL+S8X7xPboxH6oAEsg9E3IHZAxyV3M5P1qI6EKE1MsS2TwAQzPk47DxbSTMLaM4l8pISYYp6+GRYEFwU9Y0oG2+dRQy86wHLJNjzmSwFKbTXMZqlbXfRWLyes5yC/wq1SCNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5CE7BskFbAShkzoatBTPAQRq9eltihu2CpVsPkTlC4=;
 b=WGZKHyBfjnH76r51/ZM7doMLoLMD/Rw7qtV0aYBXnwo8V3rVODclrGF2P4uGTMW9Ey7W82UhpiqD4wmDGSDYwtxxrLt0tPvYXXtUqbkEdizzwW0PPkJVWomcuFnBc32Xd1KMp3HUn6nswebNW8s5wSQswDO8SgpNMVy0lAut/ZSY+yr6bCclvCIFq/KD3Odslioc15nyZ+JC/ISDORvsy2GY9Nj+7Ht2hVMcW+anC6+W7QEPlBkxMotTPZU5oh+DiH1Uz5aHlz5U01ISe6jtXRk1hy2H2Im2y+E1vr5W1F8bdAY8FZkN68qDotXuUxVVvH++6r4l8X/CHNNv4El2tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5CE7BskFbAShkzoatBTPAQRq9eltihu2CpVsPkTlC4=;
 b=GivA5U7BZvnWg4zMRdRVegoji1iXfSqtMxRjUAYHHxA8ufc6ipbvfvFJH/nVk+6BMkWv8spfwyTVqZ/yziPxzptsDrYBf4uVgqxI5ByoSQ9TMPad1GASuDFOp+FL7EDrwDidB/pwEgAtizRWB+BqAxf9zJOmfi1JeaOCl0o1Hmg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <61df49ba-4aab-42e3-b945-700a8f20c739@citrix.com>
Date: Thu, 13 Nov 2025 08:50:27 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add Kconfig option to remove microcode loading
 support
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20251112162219.226075-1-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251112162219.226075-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0506.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV9PR03MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: a278bb84-5d8f-45c5-96e9-08de2291b371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZG5aR3I4bmFLQ2Y2bTVES0lVc01MYXZSK3RRUStvQTdRTHlmUldwZXAvT3V6?=
 =?utf-8?B?bG5scWoyWENmcGlGSzVuYmZmVk9HS2s2czlnVitLSFArRTFIWjVOUlhRMGh1?=
 =?utf-8?B?Zi8veGFVNFdCQyt5eVk1ekRlQkY5bzRQUGc5Y0h3NWxZd2tjSVpkUTNNK0dw?=
 =?utf-8?B?OGlZUXgzdnlDRzI1ZHlzRTBXd0pIbERBV3pVYUJqQ05pa2YyVDlCdWR4ckFz?=
 =?utf-8?B?S1QvQkM0M3V3Z1EvWmxiSEtTS0h0WVBjZXg4Rzd5NnJKN3dHSitjRG50dHhE?=
 =?utf-8?B?cUZjR09jb1VPRFVXMHZTWThvck1kMXcvaHl3N1lNUjhDQ0FyMU45UGtyUisx?=
 =?utf-8?B?TmpHNldNb1ZLUG15NzV0QXRXamFTeFo2RHJjZlB1N1VQU0xQM2pvZzlEOHFH?=
 =?utf-8?B?SFc1a0VrT3JKN2d5Rm1mazdLMEFheXdEUDhmWjZiMjdONWxxSW0rdE5GTURT?=
 =?utf-8?B?YU9nbVhYQzdJLzdWRVl5STRwN3FZK1ZJYzZnb2syclNyTW9QclI3N1dqc1B6?=
 =?utf-8?B?eTRxd25NSmc5V1BHVXZUN3VVQm9pTDFaY1ZTQUlhSjcyMkVnRTE4TEpkbktB?=
 =?utf-8?B?MjVhR1ZRU3pYaWFQeTFCS2JZS3BENjllSGtUWHVBOSt2NEhwdWRxSnZML0Y1?=
 =?utf-8?B?ak1pTmQrbUROUFJ0NitOblNWZ2ZWTVZyQXpYVWVJWWtOL0lvZG9zYks3QWFQ?=
 =?utf-8?B?N0ZSYlN4bDlyWWl4b0txaGtYMTgySTdFMnhXMS9VTlZBYTlPaXFiMW5nSzVt?=
 =?utf-8?B?L1VyRE96VVVKakZnU21EL01odWNmbyt6enRoVU80Q043QllFbU41ZGhoaGxk?=
 =?utf-8?B?UGI1dTRacjAzUmp5eXk0T2czVHJ1cnFDR2V4Y1o3bU9TMHhsTWszQUovUUtR?=
 =?utf-8?B?QXZPOWxyYkt3NTJ6WTB2ejJadm5tdnJPK3lyVmpaQmRxS2ZPZnQwajdZU0hZ?=
 =?utf-8?B?SWJjMy9JKzMzZU84aWlTVXJDUGIvRHgxam0zK0VGVXMzdVphWmVjZWFaZDBo?=
 =?utf-8?B?TDlkYnV5cTBwUEtQL281N3VRMHljY0lLY2k3WS85OXdNZ2RHaVV5YlVjWHYv?=
 =?utf-8?B?czcyTDZCVnBucDR3L01aUUxtRVNlbklNNFRFQ0FZQ0R4SlNyNGQ0bkFmYjY4?=
 =?utf-8?B?bU9rdDVQYmltWHl6T2RHTDVuRlF5aUQyZ3dUZjNydTVCRzkydXJSK2hJaWZo?=
 =?utf-8?B?U3JSVGFEcFRCY1RyN1N3L250WVRzZGVxTjlzSkZrdit2UVAzWC9wcWlnZHpm?=
 =?utf-8?B?VTN0SG5kYWliTFlTYWwySlNrMTUzUmlkeDdSY29zbVZMODB2MHhBRWFaaVpm?=
 =?utf-8?B?UXFCMXhleGdiVXBYdGVqdTYvNU5GSFNIWTA5TXduaW56RkZJdlQ0T1FMVGxj?=
 =?utf-8?B?ai9vQ2RpamtqVEYxQURTZkVVUHJrYW9IYVNBSzgzaFpadGhYcnZKVHowN0FC?=
 =?utf-8?B?WnM3YXRjaUpIY2xqd3VIdlZHWnlOb2NCVHhHMHZzUGJiaWJubTJ0bk5XZThK?=
 =?utf-8?B?bWR3MkRnTkZIb1VTZWt5QlhLQ0ljYldpRlQrWWFkYXA3Sk9iQzZsUGxNbVJn?=
 =?utf-8?B?V1hFOStnaTQ3ZXBzWC90VXFacUhUbTg3TmN1aVNPUjNvUnlwa1JqWTA0VldO?=
 =?utf-8?B?dU5RT1A1SnlVZGd3UHczeW13akpvL1UyRzFMcGEzWnZPNTZra3JpYnBQT0ZX?=
 =?utf-8?B?d25rRkR1UUw4OUtpOXlIM0tWSXlqSURpSXFTL3d3THFxK3o1Rld3SmZXYzgw?=
 =?utf-8?B?NjQ3VUoyMzM3T3lvZlpqWU5SR2ZucGVpYUxlTzlFSkUxWmpWa0hSNlA3N2F6?=
 =?utf-8?B?dysrTmNnKzI2WDNaV2NudTBZSTdraWZmWU5DeWFzcGFpMXNESDRPUXRsUTQ0?=
 =?utf-8?B?OTZNTjNoVG5oNWgwcDVWUll1bUNtTHBXM2p1ak1Eb0dKTUcvMzNINEk4eHZv?=
 =?utf-8?Q?8Kl/Ym8JUfR4bpP6R3aCX1q3SN4E8iM9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWtqemlJaGVDVy9VTWIyUUdsS2xtUlh5eVB3RldDRWthNnRiczI0TlcwQTFN?=
 =?utf-8?B?aUJpMnJ4ZUozbk1IMnpPMy9VZHY3cVNSSkcrdHRVa1hMODU1SXJicTQrbjMw?=
 =?utf-8?B?bDlZN1hMcFNBUDBjUUQxK005b1pURXU1MWM1ZldXLzZNQ3FxVkEwRlAwWjVr?=
 =?utf-8?B?YlZwRi9uM1RpZ1ZXM2JjK2lQL3c4Uk9uVURRTlIwYXZNTUl4NTRaNmZIV2VB?=
 =?utf-8?B?VUg3V1JzYUlWV1cxckNOK1V4MFkreHJqR2RraVVOQnZDeWtoT2EzRDc4dkJN?=
 =?utf-8?B?UUYwQ1RtWUNTemVyMmJsTGxZQXVIOHNmT3dYR2M0c01wNUFvNnAyaFVKTklz?=
 =?utf-8?B?VksvY3IwWXBMWUZUU1BEbEFacS9HWHhtVXFITHJJaFdsYU9xbTYwTnoycFVy?=
 =?utf-8?B?eWl0cTNPSWxxcjV5c3V2YkRldXY3dXFuU3pHc20ydHN0cTdLWnp0ZE0zVUly?=
 =?utf-8?B?QXF0d3hpSDRiTmFvME1hTVdpZ1JXRDNVcG1YSmlGQXdVeVlCVDZOa2kzMjE3?=
 =?utf-8?B?UmRCY1JVdEtrWDJyc3dOZmpQY2Njb1IzS3RLejJEeXNYOUNrQXExMTJ4Y1Rn?=
 =?utf-8?B?c21OZDEreDJPVHFZNFNDRjQ3K1ZaZjUvR0dXSy9JSnQ0RlFXS3MrMHBMSW5o?=
 =?utf-8?B?dWo1NDRkV3p4QjVNYnE3NGZETXhDcnVnVEZ3dTcwL1k2cEhBS2lta1Fvbjh2?=
 =?utf-8?B?Q1J2T21VOHpoMzFzUkszZnMwNkdQVmQ4V21wWkhGS2p0UGkyU1psdHZiaVNR?=
 =?utf-8?B?RmhCc0YvelFTRnBhTlJGdmZkK2RmaHhVeXVMU1ZKa1Jhd2ZRQ29NVGNwV2cr?=
 =?utf-8?B?UEVLWHl5b0xpNHBUTzZQRFFtN0puWVYyMjRxaHRVcUVFTnRPK0s1dmJ5SnFq?=
 =?utf-8?B?b3BrMWxac0cxQ0hiLzBESU11QmF2eWk1N3NjRS8wRFo3ajBHczgrdTB3WFQ3?=
 =?utf-8?B?TG8wTS9IQjc2RUFwNGZqWVBJZzc1VDBzV0J3UDJFTVBJVjkyQ1puS2NGMTE3?=
 =?utf-8?B?Y1B4V3VSeGJabXB6eXdON1R2UENBVVNOWVJvY0I4SHFGRmQwNEowUHIxVmVD?=
 =?utf-8?B?YnVNUGdiVW83cmF4UGduRTBjRjlkRFRzR1VtSUJvbURsQzRKaDBkdGgvWkZj?=
 =?utf-8?B?bnd1N0VNSnYyWFlXenFiTUdZSlJxUGZKU2RxVHpvUFpvcG5SQWp4d0tpdUlY?=
 =?utf-8?B?OFAwbmRzeXVSWTNuWWlRaTBGb1Q2THdSTlgyY1RtQWorak5IblFDSWE2WTla?=
 =?utf-8?B?U29qYjJFcjJNZ1BkSWdQYmpQQzdYcE94VmIvQ1JUb0I2ZkRZalp1UlJ0R2pv?=
 =?utf-8?B?L1Y1TFo1VnUybkEwbmZQckdOQzl4YjNISG91RDRGRzN4dG1FU2tMSDhaYWEz?=
 =?utf-8?B?bWNDUXNaQ0JZQkRmYWhlNVo3VENqWWZmSlZadWhWUlkyWnNCSnc5bmxMSWE3?=
 =?utf-8?B?dDZoKzduaVY0bnNNQjRQdklHNE8yVWtvR1pmZHNEaDVFak1TYlplTHg3M2dV?=
 =?utf-8?B?WVNRd05rYkh6N0lER1BHSFpkOTFIZDluaWlteHhrRC9YSzY2c2IxUnNEa3hW?=
 =?utf-8?B?MUR0MTJqU0Q0dnZCalNxY0FiTWplK1k0RWxCZWhkeWphQjNXMGdUUXBPQ2lD?=
 =?utf-8?B?VGM0SC9lMHRRWXVleHROYytGS0pWVzdWanJSZC92OW9wNnkwejczMFkvMGMy?=
 =?utf-8?B?M29tNHhDbmNYb2szQWRmY0hhRlorNCtZSXJYOWV4VUloN3ZUV3JmNjBkd1dN?=
 =?utf-8?B?VCtKODVMVnZkUlZWd3lVTE9jZERacUs4ZkdOVTBFRVN1QjQ1VGQrNGJZSVV4?=
 =?utf-8?B?NnZpV2FWdUxLSTRrd3VxeWFqdVBGV1pmU3MxcDdMeGFzd1VZc3paMUU4QWRC?=
 =?utf-8?B?VS9LSC9qRnIvY05rYkVPYldqckJHYjh2NU1wSno1Q0Z2bllyMEhVU1Z5Rnc2?=
 =?utf-8?B?SFNTMVJjc09teDEvU3dZK2UvNlVPK2tpL3pDTnNOM01FS21uSWpXdUFhb3Mz?=
 =?utf-8?B?RllpbzlTSU5tWFFiRllGRFo4ME9YVmo1cjNBbEtsMCsvRkc2a1pxTUtObTly?=
 =?utf-8?B?em9HZTd4d1VZL01oMUlpczlOMHppQklBNDl5aDl4bkxaa2JKMzBQM1F5Tmgx?=
 =?utf-8?B?TTNLeUxVTnBPckFkUmZyTGZudGRsUTZmaXErSWhlSzlWYVlTU3dGM0I1UGxH?=
 =?utf-8?B?TXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a278bb84-5d8f-45c5-96e9-08de2291b371
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 08:50:31.1942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKxeMbTiU1tIki37u/vaka1fe66O+mmFhvGHVXXTXtZZG4uZIGVF3xb/MvMWQ3an3uC0gj9+nTlSjjjMnW8OJGmTdnTp4bEYYabA3mEeUyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR03MB8414

On 12/11/2025 4:22 pm, Alejandro Vallejo wrote:
>  xen/arch/x86/Kconfig                    | 12 ++++
>  xen/arch/x86/cpu/microcode/Makefile     |  9 ++-
>  xen/arch/x86/cpu/microcode/amd-base.c   | 55 +++++++++++++++++++
>  xen/arch/x86/cpu/microcode/amd.c        | 55 ++-----------------
>  xen/arch/x86/cpu/microcode/amd.h        | 15 +++++
>  xen/arch/x86/cpu/microcode/base.c       | 73 +++++++++++++++++++++++++
>  xen/arch/x86/cpu/microcode/core.c       | 58 +-------------------
>  xen/arch/x86/cpu/microcode/intel-base.c | 50 +++++++++++++++++
>  xen/arch/x86/cpu/microcode/intel.c      | 56 +++----------------
>  xen/arch/x86/cpu/microcode/intel.h      | 16 ++++++
>  xen/arch/x86/cpu/microcode/private.h    | 14 +++++
>  xen/arch/x86/efi/efi-boot.h             |  2 +-
>  xen/arch/x86/platform_hypercall.c       |  2 +
>  13 files changed, 259 insertions(+), 158 deletions(-)
>  create mode 100644 xen/arch/x86/cpu/microcode/amd-base.c
>  create mode 100644 xen/arch/x86/cpu/microcode/amd.h
>  create mode 100644 xen/arch/x86/cpu/microcode/base.c
>  create mode 100644 xen/arch/x86/cpu/microcode/intel-base.c
>  create mode 100644 xen/arch/x86/cpu/microcode/intel.h

This is awfully invasive for something that ultimately drops only a
handful of lines of code.

First, it should be CONFIG_MICROCODE_LOADING.  We're not getting rid of
all microcode capabilities.  Also, of all the places where UCODE needs
expanding properly, it's Kconfig.

Next, annotate the functions that you conditionally don't reference in
{amd,intel}_ucode_ops with __maybe_unused, and dead code elimination
should do the rest.

~Andrew

