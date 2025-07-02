Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F50AF5824
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 15:11:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031118.1404833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWxF5-0000L7-Jn; Wed, 02 Jul 2025 13:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031118.1404833; Wed, 02 Jul 2025 13:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWxF5-0000JM-Gt; Wed, 02 Jul 2025 13:11:15 +0000
Received: by outflank-mailman (input) for mailman id 1031118;
 Wed, 02 Jul 2025 13:11:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sUhb=ZP=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uWxF4-0000JG-7r
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 13:11:14 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20617.outbound.protection.outlook.com
 [2a01:111:f403:2413::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05c20904-5746-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 15:11:11 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by MW4PR12MB7482.namprd12.prod.outlook.com (2603:10b6:303:212::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 13:11:07 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.8880.021; Wed, 2 Jul 2025
 13:11:07 +0000
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
X-Inumbo-ID: 05c20904-5746-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=big7Xyibs9GoVcLuBDg7RakwnUnmqEyjO5kXRb9Tu/4p/VEyxr6K+npr5maVoAEkK5LLrzcjpSBytILkhJRzR4QrqGNM9pPUxdJrBKOtq9gEmlmv9oKOrVKfihb/N2hFCG+khkX7y807t/aDV10cANlmB7afsK57ZDxuQy6jvXex611XPv1wjTfYl+vHrhVlftF4ZXL2Lb97iCT9CiOXHEsecZlfrzpmkJb+u1a6g2hfsTCwkh/i4f93xq2YdJxl2xac6bzipOcUbwi0r6uUoLFi4IHkqWVE/5Tm2zytTa74lyEYG2vanneFFhJ1V+uV7cy5L8MpsO0AUGABGJ1teQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZO3kjlm1BXjOnAvp3dDS+we62CxdTpeWYM4xslke51g=;
 b=JfTWa7q4Bb4GUxAbHR1mwltKJ0tZfI2/g0TWN+iLKfboX12ymWidB51Vts0OdnrZQ4J0pemV1qsOjDKF0ujX7zGnvIWigKrGC/LcIXvm++kMZlbXXEHTO74N/H37xAoJS6DJn1qeDvL8gFwOCvmbTPcoZTVQof0HBtm/BnSPR4YTyv85+SDU/LV2NTVP9Szl+v/0mWqMfJV3cObwBbC06OYvq3aEbGgWZFkmsImK7jZ9LYaA9/vgxdaH8X19o9aIMV2FtW5sDcs0KbB0tQaWOZjDmb7kHyPmMQPMqi6eWauknepbumTuUMrvH2ZVE5KcworAGeDn9hZKsTWxjDWxDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZO3kjlm1BXjOnAvp3dDS+we62CxdTpeWYM4xslke51g=;
 b=vm7jV5+GB0mz5EZNGg7qNxHDix2zsgebqBNJOxIYPE5qsEilozOfLcDtZCuLkKB41cDHpD3RpSiuQnk0ugGbOq8LgaTJKOx64YWXkn7NOSj854QuYrEDgGpIdfMBmu2LDOsOPbbDGmkXCHKT4iGjnYiKob2W0zMVflflYdUYqew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e0b7e7ad-f7bd-48fc-81a8-739d49ae806e@amd.com>
Date: Wed, 2 Jul 2025 14:11:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm/mpu: Destroy an existing entry in Xen MPU memory
 mapping table
To: Hari Limaye <Hari.Limaye@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <cover.1750411205.git.hari.limaye@arm.com>
 <95cc28af74339ea617081f3935123e38a53cc657.1750411205.git.hari.limaye@arm.com>
 <e3d28537-b531-4cc5-b875-4afa0437ece5@amd.com>
 <AS2PR08MB874501E9A5853A529FE6BA11E241A@AS2PR08MB8745.eurprd08.prod.outlook.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <AS2PR08MB874501E9A5853A529FE6BA11E241A@AS2PR08MB8745.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0084.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::11) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|MW4PR12MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: 27659576-c8d0-47d3-3a1f-08ddb969e7d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2lBcGtMNlZSZElpNWhHSjNDWWVmYjc2ZXpZdm54RThCT2pJWUpXbWgwK29v?=
 =?utf-8?B?RyszNTRhUU1STTlmc1FrSld6Z1BtSy9rbHYrNUtuY2VtZjUzWjluSWg0ZmZK?=
 =?utf-8?B?QXlxS21ML3huZ2hYeEdDSUV6V1JPQVNPMWoxcUVjRE1PWW1QMC9jb1AzQ2pl?=
 =?utf-8?B?Zjc1YW9TdzVjNU5NL2MxczB0YjFZMHk5UWdHTFhKNzA0K1J3UVI3RzNiVm5J?=
 =?utf-8?B?MmFyeCtOQ0M0QW5aTVRpTmhhV0xEZnl1OGF2bDhVSmkvdmhFQzFQbTJwM1RO?=
 =?utf-8?B?UHFMekg4K3IycGRvZlF4dEJrcjZVYXRYQkQ4bzRhVS9iaUd4V2tjbldFcFpz?=
 =?utf-8?B?QW9NajkzMk9kTkN4bWpmbURTVnNHcE82bG5DUGh6VElyNW4rQXpocXRkaHNN?=
 =?utf-8?B?VzNLQmExbXU3VW1FdUFLc0dZMWtrS1E0a3E1Z3NMSzhkWkRDeXBqU0pVN09z?=
 =?utf-8?B?U0ttNTN4NUI3amZrQmd5M25sUDdQdERKekZmbXczdEQ5SUJqcG45dmh3bnlN?=
 =?utf-8?B?WFBrQ2tmRjJNeEZnbXRKeEswcEFRMXZWSEFiZmx2RWVBRGNYbzFpOEJVS1NT?=
 =?utf-8?B?M0NDR0x6RmFob3ZaR0Q0UU1xQzRiV2hzY1NjaG1ITmZGVDUwZkw5dnczWENF?=
 =?utf-8?B?a21CRlFXbkdNVExBSFpPd21tM1hwVy9QQmV2SXhEZ0pLYURPbHFBNWxNT2dM?=
 =?utf-8?B?NmFiMDJoVEhheURGMFNMaVhyaHl5S0ZoVFJQSVBPSEQ5NHhvRjNZK3V5YWs1?=
 =?utf-8?B?SXBJK2J5TG9WeDMyUEp2OTRFbHVJNG1qR29DQmxqKytGWm1HdWdvV3c2Unda?=
 =?utf-8?B?a0gzckowQ3JIUWU0VDdvMkhhMzZIUW1RN0pWdGZSUHZvemFCVkF1QzRIS010?=
 =?utf-8?B?Ryt0YkVGSTlVeVNpQUJaV01XeXM1WDlQZWw1RnJHVGFCbWxNV3NFa1k3ZEI0?=
 =?utf-8?B?eWxMUXVXODFkRlpQUmw0cUVhU2haMW8rTkZlMUxRK0JsTEo3cXJWNXN4Mmg3?=
 =?utf-8?B?cVBZVWdVbE1mRDdrUHlZNlMvajdKRUlOeThZQjJJZlc3OTE3bmRkZk9mRGFo?=
 =?utf-8?B?TytvcnJvWXNrOXhub2hBUHBnY0RIOVVRSUpaL2RCbldpM04zdFlOTGRIYlhT?=
 =?utf-8?B?ekJnNnF0Y2xkUGltNVZGd2xML01qZDk3cERDMHNVN1NleU1xakxyYit4dXF2?=
 =?utf-8?B?TTBISVRYNWxveUZvWUlKL1h6Ry9oSTNDYWNUaFc0eEZCc0d3Q3NCWUFFbld4?=
 =?utf-8?B?V2RVUUhLV0tJcGJPUjdSUjhHRmwzSk9EbUZRR0pOZ1pUdlM0RzYyaDRkQTQv?=
 =?utf-8?B?UzQzMHgvWEZsZEJXRDBycFZXM2YyUUZHWStZUkZBV0hXcW9iZnB5NmxxcFVx?=
 =?utf-8?B?MXF6cjlnaGN4YTJXTmR3dVlCOUN6K1FEcUF6QTM5bW0wV2ZhNFFDckxTVkVq?=
 =?utf-8?B?LzZhZS9JRDBheHhPMXArTEFUaHFPSU9xYlo3d25YZmI1bXZ6enVSeERVbFQv?=
 =?utf-8?B?Q0ZpWTh6TG5jTDlDQmRib1JYdjRFK3VaS1FLenl0Ukdua0pITzN5ckw0d0tF?=
 =?utf-8?B?YlBiV0dmNHFRNTZGY0JJNVpCU1lxd3ZwRVRxei8zYmUxb20xeXFxWXJvMWkx?=
 =?utf-8?B?TThQM1Z4c3YyM2dDaGVEdnVVRHo4b0IwamJOcTU0QktmWXl0d1RpeVd6cmNH?=
 =?utf-8?B?MXNoOWVKRExueHN1UmE2RXhXNm1zQlROWnhZUEY1MTBuV3FnV0NhZzRNMVIy?=
 =?utf-8?B?OUlLa2RNeWwzdlhWRW9ERW15MS9YZmFZVHFibG1nVFpUd2RsemkrZUQwaXl4?=
 =?utf-8?B?cWJ5bEEwTVZJR0NWVXo2bk92UmdPQi9lZSt0Y0N3OElSd29hTnA5K1VucHpS?=
 =?utf-8?B?ellpMmdiWTIxRXlpcTU0RGN6cEcyZWpVbmlqZW5GOFp5L3ZLUk9NR1NxdjRT?=
 =?utf-8?Q?xqGWRWJHTcI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ni9YaFVIR2QvWHh1aktmekx4SkttVGtUcVhDQlVhR2t1ZlUwQnVrdFpHNFUy?=
 =?utf-8?B?THRZRC93OW90NlQ1RWRtQnI1TEYyTnZhbEFScFFwV2pWeXpLYU0xajlHbnhM?=
 =?utf-8?B?UUlhcGJvV0lxMm9IK3BPS0FLNHo3MUZGQ1FJZzFkQ21RRnlwcTFKalBjbjkw?=
 =?utf-8?B?ekNSVEhsRDZmczFwV2hmZlZEM2VBaERSclNlUU1wY0gzVDQzRjkyME5aWUVU?=
 =?utf-8?B?L05Qcnh4ZkdVTUJRb0hFQ0c2amFVRGpLakgyVUViRlg2K2hER2w3UEkrZnJ2?=
 =?utf-8?B?czVyb3E1NWJtM1R2S1dFUjN2NVhZODZialRBaWdaRkdRTjVGYlRCNEI2eWhz?=
 =?utf-8?B?bzNBSVdkSjBQOUdESXR0VGQwb3k5VlYvWmwvTmVPSTVKS3ZwU0FXRDhqN05S?=
 =?utf-8?B?V1VDK29DaXB4aXhsWHlnKzJib1U1TUNRellIbkJSY3dnaDUvT0hWRTRzaDMr?=
 =?utf-8?B?QTF1M3Ric1k1L3VBaU9rOGRlbU9TRzhIWFd4dUVjelg0VHU1elM0WlNwbEY1?=
 =?utf-8?B?ZEduMlpUZmlMN1ErOXBBZm9hajJCYnFiY1BmcUoxMFN1S25SUndnMktJZWdn?=
 =?utf-8?B?TEo0NUsweFdFam9POGJGaWFaQ1dtZUQ3TE9hemdZTTF0MFhsYytaVUx0WDF4?=
 =?utf-8?B?SVV2ZHI5enYwNERWUG1CN2lDRFJ5T2tacGtLOGhvUWxodnhNSENreC8vVDJr?=
 =?utf-8?B?ZkF0eEFhUVhxZTVOYjRlUFI1ZTlsUWg0V3V1c3NPSFhUSE9rQnAwL2gvTW9k?=
 =?utf-8?B?dkZtMjlETE94RzhUSzVlV3dDRTlIcExFR0p1SEJIL3ZPNXFyVmtVZUozZWda?=
 =?utf-8?B?VGVSUmZDOHVQNm1BaHNyb3AxSVB6TFdncVFtb2ZJQlptakRJYjlxTExRMDR4?=
 =?utf-8?B?WU1CREdBdFUwcG1ibjNWenpsT1NKemtzK0c5RXR6M3VTOHVpaUl3UUNUSmha?=
 =?utf-8?B?Z3JRMytWeTNabVBjMGEwSVJuRUJNT002N0w0cWRNbTZ3NHhLU2hZRXMvaHh1?=
 =?utf-8?B?T2FPRDQ0bnBiVmhYY3lyOW92S1M1VHlqNlo4S0hJcWtUdm4yTmNPVTg4WVNk?=
 =?utf-8?B?dHVOSGxmUmN5Nys2NTJSaXc2TXQydXdIUU1YVkZRcEwxSVBEc1ZIVDlMTW5U?=
 =?utf-8?B?TjlNeG5xaThkaTE4UzdDM1krYWREOEIvclQ2akxQVkdTZ2VLTjE2OWl6Rk9z?=
 =?utf-8?B?TWEzV0JwVXRNN3dqRUVhM055NTM1U3BVTUVzT1p6bSttZzQ4T3ArbkFTczlJ?=
 =?utf-8?B?WldmVXRpdmtYWlNGOERHdXdoV0JrYUVUeFJPQ2tEWGduc2wvZWF3eUlyaE9I?=
 =?utf-8?B?ZlZiRzdXcGtNUHhpeldYdjlrTWphWkl0RVBQZXFlWkROb002RjZud1l2UkUy?=
 =?utf-8?B?S2xqM20yc3VhcHFPQUREZXY5UjhUcnRMaFFDNGpsenVHU0NTVEV6VTZaVTR1?=
 =?utf-8?B?Y3B2QklDa05BT3hMRUE5LzdrOUE0ZkdMTnY2ei9veGtEVHlhYWhlK3l4Rm9D?=
 =?utf-8?B?eUthWGh6bktBZm9EbVJEeXpYdXBBOWM4RE1ETXN0b0MyL1ZrNElaT1grT1Mx?=
 =?utf-8?B?MytwaFpUdlZMRHg3RjMrdnY5aEVicitneHFnemhPcmZJY1VqOStJMTd1S1kv?=
 =?utf-8?B?Nlg0TDIzVUhzV3JOS1IxeUhvR3JiZ2RDR0c3c3N0dXo3M0hucjhSSkgxbHU0?=
 =?utf-8?B?UFJEb3FYWVBNT2pyKzFnZFZ1MEtYek9yclNVaTlUUGFsOXVkNU45dlFNR2Rr?=
 =?utf-8?B?UUVOQ3NieEF3K2g1UlpSaFhtbGxPbjIyT1BxWnJrWmwyNDFRMzh2ZHFsL2Iv?=
 =?utf-8?B?U3JBZ0xNRk1tREhML0RROTBESEdwTEtHcXZtUjRpUWpqaXZPeWp3LzZUcW4r?=
 =?utf-8?B?dHZTM1E0OG9nRGlyNjI2U0MrK1ZVQTl1RUZickVmQTF5UTRnRUYrUWh0RkJ2?=
 =?utf-8?B?ekRWUnR4Rzhpb0lQekRqUEpQQmttblp3QUxIM1pFb2Q4M2tlS09XTTBreUVX?=
 =?utf-8?B?WGdlcVo4TUZ0bUpidDYvcTV1OG5CVHA4OXpLcU1mVk5YaThYSVVTc3pmS0dT?=
 =?utf-8?B?dmxNck9Ob096eTF0c0Zzem1PREZwL0pqaXdaai9XT3BTN29tM1FZUDREUjVO?=
 =?utf-8?Q?v7WZEPdTLiu3ieaMebzntkDrY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27659576-c8d0-47d3-3a1f-08ddb969e7d1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 13:11:07.2082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mdojfzZ+v+JpoDu5gvv/hmYRzJUegmimPzplTWCG97v79yuirjFKuL2MQc7PZFxuTuO+D59ByqV+3DagzpvraA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7482


On 01/07/2025 15:56, Hari Limaye wrote:
>
> Hi Ayan,
>
Hi Hari,
>
> Thank you for the review. I have just a couple of clarifications before I
>
> re-spin the series to address all the comments:
>
> > > -    if ( flags & _PAGE_PRESENT )
>
> > > +    if ( (flags & _PAGE_PRESENT) && (MPUMAP_REGION_NOTFOUND == rc) )
>
> >
>
> > Same question in this patch , why do we need to check for _PAGE_PRESENT.
>
> > Can't we just rely on MPUMAP_REGION_XXX ?
>
> The _PAGE_PRESENTflag indicates intent - whether the caller intends to 
> create
>
> or remove a region.
>
If so, then I misunderstood the code. However, looking at 
xen_pt_check_entry(), it seems _PAGE_PRESENTindicates if the page table 
entry exists. If so, using _PAGE_PRESENTis not making sense  to me 
atleast. May be others can chime in.
>
> The MPUMAP_REGION_XXX values only describe the current state
>
> of the MPU map - whether the region already exists - not the caller's 
> purpose.
>
> For example, if the function is called to remove a region and it turns 
> out to be
>
> MPUMAP_REGION_NOTFOUND, we don't want to accidentally create it.
>
> The flag is passed via the `flags` argument in calls to 
> `map_pages_to_xen()`.
>
> In this patch:
>
> https://patchwork.kernel.org/project/xen-devel/patch/deccb1566ced5fa64f6de5c988ab968b76dc945a.1750411205.git.hari.limaye@arm.com/
>
> `flags` is set to PAGE_HYPERVISOR_RO, and as defined in
>
> xen/arch/arm/include/asm/page.h, this includes _PAGE_PRESENT.
>
> It is also used in a similar way in `xen_pt_update_entry()` in
>
> xen/arch/arm/mmu/pt.c.
>
> > > +static void disable_mpu_region_from_index(uint8_t index)
>
> > > +{
>
> > > + ASSERT(spin_is_locked(&xen_mpumap_lock));
>
> > > +    ASSERT(index != INVALID_REGION_IDX);
>
> > > +
>
> > > +    if ( !region_is_valid(&xen_mpumap[index]) )
>
> > > +    {
>
> > > +        printk(XENLOG_WARNING
>
> > > +               "mpu: MPU memory region[%u] is already disabled\n", 
> index);
>
> > > +        return;
>
> > > +    }
>
> > > +
>
> > > +    /* Zeroing the region will also zero the region enable */
>
> > > +    memset(&xen_mpumap[index], 0, sizeof(pr_t));
>
> > > +    clear_bit(index, xen_mpumap_mask);
>
> >
>
> > NIT.
>
> >
>
> > These 2 lines we can move before the if { ..}. So that the region is
>
> > zeroed even if the region is disabled. This will add a small overhead,
>
> > but we will be sure that the region is zeroed whenever it is disabled.
>
> Thank you for the suggestion - just to clarify, unless I am missing 
> something
>
> I think that moving those lines above the if block would actually 
> break the
>
> logic.
>
Ah my mistake. I meant these two lines should be moved *inside* the if 
{...} condition.

This is a minor suggestion so feel free to ignore.

> The memset() call zeroes the region in the xen_mpumap data structure, 
> and this
>
> is what region_is_valid() inspects. So if we zero the region before 
> calling
>
> region_is_valid(), that check will always fail, and we would exit 
> early without
>
> updating the hardware.
>
> It’s the subsequent lines that actually write the region to the MPU 
> register. So
>
> if we exit early, the hardware MPU state remains unchanged.
>
All good.

- Ayan


