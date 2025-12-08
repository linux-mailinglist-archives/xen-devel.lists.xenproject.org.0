Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF3ECAE05D
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 19:47:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181073.1504183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSgF7-0002x4-Nb; Mon, 08 Dec 2025 18:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181073.1504183; Mon, 08 Dec 2025 18:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSgF7-0002tx-Ke; Mon, 08 Dec 2025 18:45:53 +0000
Received: by outflank-mailman (input) for mailman id 1181073;
 Mon, 08 Dec 2025 18:45:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NKnm=6O=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vSgF5-0002tr-Su
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 18:45:52 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c497c9c-d466-11f0-9cce-f158ae23cfc8;
 Mon, 08 Dec 2025 19:45:47 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by FRWPR03MB11145.eurprd03.prod.outlook.com (2603:10a6:d10:1a2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 18:45:45 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 18:45:45 +0000
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
X-Inumbo-ID: 1c497c9c-d466-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nUw+8v+6YXvlOS18PX5zob4dS6fCnqhCg62F7uxWIz3ZOzaCTwc2bGgO1InhEz+j6bd0JrLiwa4hOXUXwi49PYeuILUiyQp2Pnm4ZiwKJifz3KxmmmZb8/zxCE3C3pNcm/Osv57ZgEc6zeujglPeuazWQqRHiqVsPl93BpZTDZ5rqYip6+a/uzZDlcNERTEutwjcFcS4MoT/M6DOEJhuuaTIvb3mtlikoJua8cnJudMV4yCLb+pcO/WPDDPAnvEPirTP/u02WuFBdPHMfC4XlwRpXewrXSS0dH9LdVT6UByflZHAH6vjHDVvTRjMncxDMdR1GqRgUmgbZqWAippm3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNPQH+QJ0ObaY4pAsuSpBbpYX+cx/PLdQrpfODRZxdM=;
 b=UwsX+U5/mGDUQJW4XlH+ZWltM/roR3UeffGtEo3XZtC4xMNIQhOZIwbZoNbqsOotazDX0QqktlbdDBX/eA98/46plf+Xvm17oU6eB4fVRhxB+x8cNSo7KLaIzmWa1ZJqUpjV1t07Wzki8l84fszlhwvLVm5dI9UpBJaFtQwM6QarRaGuNhiparFHLkM014cIoRWuCpfxsdlTc9HG1Kn5xwOXWYLNKUTPAlKAgCGweKrzfX5ipFVLHNFewZpIOvy21JV0XkkQ+95DSARlqsSkJ1UyKkaHwanlRr7kGGXIEDC4boc+wYXYkbRQu9fp2wegCdL+tBsBYChApvAy/OTDGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNPQH+QJ0ObaY4pAsuSpBbpYX+cx/PLdQrpfODRZxdM=;
 b=cyFwbD1SVCckcQ/PPgCxtKKWnHtTCHeEctBQ56XJJPObVBKHw6kM95vpMEQ3ecMhlBYXnS/+IEc+zG7gH2wxrMHi47QJM/VyxcqsRJ9kHvk9xZuctHPR54OwyTw+df9uCXRN6evLWPG+kyMTFU3k+VC9PFPjP+US5zSJpEShD1+IoH7NvgTniRuCXCKo8LKg36Kn+3wV8JvU0Y0+C4dIISPf+41i2JzXaJ1oO/vursojnApJtHu7oqmGJGJUFLABUOFlv4vwKdfHdsgesdzOLtUqL620YUBTpgzHy1PsrYsPmQM3a9OPuVgF3nNOWdWst6qgVPQlO64pJ/iYX2X9WA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <b358254c-1666-49a8-a7c0-c7bed9e9318d@epam.com>
Date: Mon, 8 Dec 2025 20:45:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RFC: xen/x86: Enable --gc-sections
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20251205222813.277164-1-jason.andryuk@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20251205222813.277164-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0028.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::23) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|FRWPR03MB11145:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aca367f-a68b-4ba5-f523-08de3689ff2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2JrT3ZsamI0UHhyTXplMC8yNXoxUnJCN2hjS0ZqVkhHZHZMMWl4UExLTG9l?=
 =?utf-8?B?R0hrYTJLZ01MaHBkUlV6MlNiRjdTZE9GNWtwUytNQS9BZm96WVlFSTR1ei9G?=
 =?utf-8?B?ZmdlQWRJUlBHckUzRDdKc2NLM2l6VU85RExBNGU1VVFrcFlpaDdYZGFPVThr?=
 =?utf-8?B?RXdoWFVLTWtvSXc4a0pMNWgwU3EwN1JFMzVpT0FKK1pZVXJFME5KMDV4am9Y?=
 =?utf-8?B?YkNKNmxkMVZSSnowYmRCU2xQOVhLYm9JckJ4K2pCOTdURFJPclBsN2lhdGVL?=
 =?utf-8?B?SkhpckVGSkJaR2c5MDFLMlRrR1BobGs3SUVQY2Z0c0g1TDVpYTlDV2ZHanNW?=
 =?utf-8?B?aUcralVxTHZ4U3VDd1FEa0g2SDVXNmtGa1doMW1MbHhQTUUxL2ljcEpmSi9j?=
 =?utf-8?B?TUMyaDRuMk1WbkVuaU1zTlBSSUNvUi85dGlRSE5LM2pZRlVVbmJTNUc1Wlhq?=
 =?utf-8?B?V1dsRVlpRzIyNjVWbGVnSGdRNHdmcE1CL2tCRERFem9sSmdVS3lMYjY2Z1Jo?=
 =?utf-8?B?cmFqaTM0dGxLaDEwTTZ1SUw2aW9pQytnSDlyWHdyYzY3UlQ4T3lucUc4alI4?=
 =?utf-8?B?K1V3OVZNc2MyNzZSbm50bjB4S3ZCcmZxcFN5aytTWkJxVnRxV01yMm1OVTZF?=
 =?utf-8?B?UndaRWh2TWtBTDJCTlZMejN0VnhQeVB4NzhGSVBYODlNcmFUUjVnTDFoM2Fz?=
 =?utf-8?B?dmV1UHp0MmYxa1dTUTk4NXg1Qi9yd0t6UzhRUSs4VlhjMmdmcmFRNDFxLzl0?=
 =?utf-8?B?dFJQdW1PNmJ1b1ZweE40bzU1MlVFcllPbzltbWRTQ0Zxbk40NVljSjJkU3Fx?=
 =?utf-8?B?d1FicXU4WUJsR3RTeE1yelRweWtCSGg5QndLTHdHMmg0QW5Ebk1xQVJCcjNO?=
 =?utf-8?B?UmhhQnVTVFJIN25WbVV6aFdlYk9Dbm16MmpmMnNMakJDRTljNFJJYkI1dlV3?=
 =?utf-8?B?SktmMlNCN2VVamYvY3daNW1MTXpqMXRZVnJqRkkrMTN2dkYxbGpaNmNWeTE5?=
 =?utf-8?B?R2JMOStha2tlbHMxd0x0ZlRaQ2F3R2F5RUo0NkFNMS94eGdTZy95d2U5eU8v?=
 =?utf-8?B?K08zM2Z5NFVZdlJrWmcvWjZuZjNpM01NWFFreTB0cEt1UklHdE9RM3VLck5u?=
 =?utf-8?B?V210Mjh0N3JvekFlRDlTdm1JVGVSb09HeWROdklNOC84SllQVkRYNnFNai9G?=
 =?utf-8?B?d3BGM2praXVtN3hxa0g5TW0vcUVBVFhlZk14aUR1bFVaK3lGbXJ6c0w4MHlW?=
 =?utf-8?B?V2lCYTMweXBXWU5wLzVFc1hRdU92b0ZwTU1aUTdHbzlRLzBlT08vbHcrWTJM?=
 =?utf-8?B?VXIvUDlld1FPY1NTSDRCWElvTlBvUUU4aVBseU5EMlhpMk04OVU3cDZtdC9N?=
 =?utf-8?B?N211NlVyTElHbUREZjdPV2loa2IrWFo4ZTRWc1k1ZWJMMFdIYnY1UFk4eGxZ?=
 =?utf-8?B?ODROVFFFNmZZbkloQXdQNnhwNm1yUnBGMllNWExzcW5MZ0JzL01XbGZIQ0Vk?=
 =?utf-8?B?UXBxWUtxNlN1WTZ2K2szWklzMzZIZ1VJRWJyam01Qnl3cXYralc5YjRTU095?=
 =?utf-8?B?QkVjZ0FoQUgrTFhMT2Z3YVAwcm1OaHlhY2J1d1NtQnBZZnlYWUszZnVsWkxn?=
 =?utf-8?B?U29nVlE3RU1vb1BaRjNyajBwb0FQMzNMbm9weEFIZ0VuRmN4ZzIzRnZGN2Ex?=
 =?utf-8?B?WW0xWFJzb00xa1Q0Umt5UCtMeFpjdEN3L2FlZmFlN3ZJVThEdko5UkFzRW1I?=
 =?utf-8?B?VE9LMml6cVE0MjlYalY4WHVPclZ3ZlM0RnhnWWcvTXcwdC91VHNiS2haUU1P?=
 =?utf-8?B?aUJmWndCMGhvbExZSDJmcHdKeTN5NFlVVWw4cWkvWmNGbEVQR2NvVWtUbzNM?=
 =?utf-8?B?UW5UeXZjUmlNV3pkL1VrTVQ2MTUyL2Q4cTY5WHBSQmFmUDNxREtPNVhNd1Nl?=
 =?utf-8?Q?2uDMMf4ZFjFSPJdJjDyFaU1X+YD73FfU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFhpZmtiekpmVkdRUGt3L3RnMllnL0QxRDZQQzNPOVJlbS81eCthV3VpeGpW?=
 =?utf-8?B?T0JEZXJ4TXZJSXllU2VHbjR2RFJOdURXTm5wRzJhQ1BrdEllS2dYYWl1UVlW?=
 =?utf-8?B?Lzd1U3B0OUs1NlRldjRMc2d5bVE0aFJRNDVsNVJidUNpWnh3SG1veXM0NGx1?=
 =?utf-8?B?L1U3blRnU1RVWHN3dDgvZnpvN1VZVUVoZXA2VENwSy9YcVg0Sk1DMjhFNmxG?=
 =?utf-8?B?cS9rMVdlcDMrRG93dzlHRmlvSitwU1ZTclhadDJWRHdBY2szN01ncExhM0xu?=
 =?utf-8?B?SnlibzVXR1laci9PNEEwS1l0eXFsU0xTUDViamZnQWZ0cHFqRW1wVTVlV2dV?=
 =?utf-8?B?dk04WHcrcEpCNFJJVWN1OHFwZVJZemxqRm1ZaHMwdjExbExiSmF1dUh4aFRj?=
 =?utf-8?B?Rnc5UU5TRUdXdmovV3FlUDdNL092aEVQd21PUXZEc0UzSDFuQ2hZRngzTDJQ?=
 =?utf-8?B?RUE2K3diWlNMY2JiblFVN2RHeVFrczI4T2xZeVIvU3dGdC8wL2xyUnA2djhY?=
 =?utf-8?B?ZHFkWnF3eUgxaVhkUEw2N2tZNFFBZmZRM3Rpbm50eFdGcHM4VzZGMFpsZm9o?=
 =?utf-8?B?U2tia0pkNFJSMzIyVFN4dU9MbzZwRmMyZm52S2lMNzB0Y2VkTXRURWN5Kzc2?=
 =?utf-8?B?R0FYZ0NmVDg4UXNEZTQ3cG5nYkFNcFZnNnYxajBsc3V0ZnczRGY2T2NVbVYr?=
 =?utf-8?B?YWM3V2tpRHNhWEdOYlZiZmtmSy90dTlsTkFvWUtjQkI5T2JNRTM4bCtpbHg0?=
 =?utf-8?B?cDdNR2h1eGdMMEgyblJKdnNxN0YrcWxLWFdtVHo5V0FWRUN6UW0xNWdLUmZl?=
 =?utf-8?B?eTlUV1RTdnNUNG56bUVOY2RDNGpwV1ZXeTdpVGJHNlpteVF1VHhjZkVYTmlI?=
 =?utf-8?B?SFVKcGx1bmhzZW1WZDlxWEx5eklMa2FxdWsyaXRabTBwOXh3aTJQV3Jhbkh3?=
 =?utf-8?B?cEhIRUd0MFZKTkVIcjhqSmkxL3oxS1p5MjE3aCsrQ0RaaXc4aGU3RStQdnJi?=
 =?utf-8?B?NldOZ2Y4TG1STk5NbDAvZ3R5SnYrZ0c0ZFBmeU50cXo4MWYyVW9SSTUxVkRP?=
 =?utf-8?B?akY1cjg2UG5qcnpsRENCMVFvUEdxc1VjQUxxWjVHZGt5VDRLZWRHWDlOaUNX?=
 =?utf-8?B?UzFwL1Z3NjV1eDhUSWQxTURLR2VZZHVlbFJJZlVuaXBmbU5uRFF5S05wOTNQ?=
 =?utf-8?B?WVdDOFh1R1R5TTVGaG1WbGtTaDAwUUx1N0x0TDhRN1ZHK1E1SXBKQzgySjcv?=
 =?utf-8?B?aU9INUNleGlNdEpqbHRndUt1RzZoQzNNR1ZkN1hRa1FxRGN2NkJ4Vk9CY01v?=
 =?utf-8?B?QlZBN01OaFU0THRDdkdHaDlYcXBXaG1GZkhTbG1BOUxvYjF5REJZNzZXMmdZ?=
 =?utf-8?B?bjk1R0lNM0pzbEtoYUxpK2FTUG1pSkU4Ynl3SVFvUHdlTWpiWENiQzByazZw?=
 =?utf-8?B?TVRCRUdhMEFMVUYvbjU5dUNod21PNzcwTmVsNENaciszSCtXNCt5WGgwVWhl?=
 =?utf-8?B?WTVtQmwrZ0JTTWZKWW1CYTVNWVpzSjVRbXlpanZVK040aG1JeE1wZUo3YVdp?=
 =?utf-8?B?WkhDRHVmb3VJYmdjNml0bkMvbWxKS2VtU2ZlV1R4R0NTZHJFNEJjTENzKzh4?=
 =?utf-8?B?WVAxSnJ5aTdIWnBZNzkxMk04Q3pBMTZVSVBOeWJiYWZSazd3clphS1BXZjcy?=
 =?utf-8?B?em0vcUE3NExqN2FEeGsxbDlJNGVVOXF5bm9NUlkzcTA0eEdvSWxDYVMvc2tr?=
 =?utf-8?B?dEVSUUJ2b1hORWZZa0tXZlI5THdLaVZLdXNCcVRxSzM4Tk5odE40K2wwK2dE?=
 =?utf-8?B?NjI2U2N2Qmg4T1JIRzVMNnd6NFRYM3BJTDlHUGRIU3lKQTZJczNuZUlHb1dC?=
 =?utf-8?B?RHpvU1dIL0FZQlFCMVJjM0dpNy9CMjdNeE9lQ2szNU81amttcHBtb1hJZHg4?=
 =?utf-8?B?TVFpN3VPMEFoMFJYK2ZwS09qVXNKamJERFZMTmtVUVFvY2FUU0ZqS0dTeWp6?=
 =?utf-8?B?MnkxS1hqNzRPRVVaUGRzNWJnK0w2VG5IYk84V3BySnQyOTc0UUtrc3pmQWxw?=
 =?utf-8?B?cDR3Yk9BVm1mVjdIQ004RGtiMGlVVE5hQnhreGhoN3U4b3ljeEZ0WkRLRU5W?=
 =?utf-8?B?Yk1FZHEvK2pmWjd3K1pwQ3lKSkdYU0FRV0k4QzFpbjVqL2h3WHU1OURKRjFu?=
 =?utf-8?B?b2c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aca367f-a68b-4ba5-f523-08de3689ff2b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 18:45:45.4928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7GU638lVryOLPMv0PuXeQCibeGbK0b6RklFEA6+bEP8AXhlXY6LG/RTAFyoMVA6ZhgmBtPmT1LssNOFvYAL7UnC5RfBSimeEnh8yIjvP7oE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR03MB11145



On 06.12.25 00:28, Jason Andryuk wrote:
> When linking to create xen-syms, add --gc-sections to garbage collect
> unused stuff.  Relies on CONFIG_CC_SPLIT_SECTIONS
> 
> We need to add KEEP() to the linker script in assorted places to retain
> appropriate data - especially the arrays created therein.
> 
> Something is off though.  In a test where memory_add() is unreachable,
> it is still included.  I'm not sure, but I am wondering if it's the
> alternatives somehow keeping a reference to it.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> With --print-gc-sections on defconfig:
> ld: removing unused section '.text.__bitmap_full' in file 'prelink.o'
> ld: removing unused section '.text.__bitmap_xor' in file 'prelink.o'
> ld: removing unused section '.text.__bitmap_set' in file 'prelink.o'
> ld: removing unused section '.text.__bitmap_clear' in file 'prelink.o'
> ld: removing unused section '.text.bitmap_find_free_region' in file 'prelink.o'
> ld: removing unused section '.text.bitmap_release_region' in file 'prelink.o'
> ld: removing unused section '.text.domain_has_ioreq_server' in file 'prelink.o'
> ld: removing unused section '.text.compat_kexec_op' in file 'prelink.o'
> ld: removing unused section '.text.in_atomic' in file 'prelink.o'
> ld: removing unused section '.text.radix_tree_next_hole' in file 'prelink.o'
> ld: removing unused section '.text.radix_tree_prev_hole' in file 'prelink.o'
> ld: removing unused section '.text.radix_tree_gang_lookup_slot' in file 'prelink.o'
> ld: removing unused section '.text._nrspin_trylock' in file 'prelink.o'
> ld: removing unused section '.text.xen_compile_host' in file 'prelink.o'
> ld: removing unused section '.text.vscnprintf' in file 'prelink.o'
> ld: removing unused section '.text.wake_up_one' in file 'prelink.o'
> ld: removing unused section '.text.xmem_pool_get_used_size' in file 'prelink.o'
> ld: removing unused section '.text.xmem_pool_get_total_size' in file 'prelink.o'
> ld: removing unused section '.text.xmem_pool_maxalloc' in file 'prelink.o'
> ld: removing unused section '.text.xlat_start_info' in file 'prelink.o'
> ld: removing unused section '.text.elf_sym_by_name' in file 'prelink.o'
> ld: removing unused section '.text.elf_sym_by_index' in file 'prelink.o'
> ld: removing unused section '.text.elf_get_ptr' in file 'prelink.o'
> ld: removing unused section '.text.elf_lookup_addr' in file 'prelink.o'
> ld: removing unused section '.text.serial_vuart_info' in file 'prelink.o'
> ld: removing unused section '.text.pci_find_next_cap' in file 'prelink.o'
> ld: removing unused section '.text.free_hvm_irq_dpci' in file 'prelink.o'
> ld: removing unused section '.text.mce_barrier_init' in file 'prelink.o'
> ld: removing unused section '.text.mce_barrier_dec' in file 'prelink.o'
> ld: removing unused section '.text.mce_barrier' in file 'prelink.o'
> ld: removing unused section '.text.apei_read_mce' in file 'prelink.o'
> ld: removing unused section '.text.apei_check_mce' in file 'prelink.o'
> ld: removing unused section '.text.apei_clear_mce' in file 'prelink.o'
> ld: removing unused section '.text.efi_halt_system' in file 'prelink.o'
> ld: removing unused section '.text.get_vvmcs_virtual_safe' in file 'prelink.o'
> ld: removing unused section '.text.get_vvmcs_real_safe' in file 'prelink.o'
> ld: removing unused section '.text.set_vvmcs_real' in file 'prelink.o'
> ld: removing unused section '.text.set_vvmcs_virtual_safe' in file 'prelink.o'
> ld: removing unused section '.text.set_vvmcs_real_safe' in file 'prelink.o'
> ld: removing unused section '.text.domain_set_alloc_bitsize' in file 'prelink.o'
> ld: removing unused section '.text.watchdog_enabled' in file 'prelink.o'
> ld: removing unused section '.text.unset_nmi_callback' in file 'prelink.o'
> ld: removing unused section '.text.sha2_256_init' in file 'prelink.o'
> ld: removing unused section '.text.xxh64_copy_state' in file 'prelink.o'
> ld: removing unused section '.text.xxh64' in file 'prelink.o'
> ld: removing unused section '.discard' in file 'prelink.o'
> ld: removing unused section '.rodata.xen_compile_host.str1.1' in file 'prelink.o'
> ld: removing unused section '.rodata.elf_lookup_addr.str1.1' in file 'prelink.o'
> ld: removing unused section '.rodata.apei_read_mce.str1.8' in file 'prelink.o'
> ld: removing unused section '.rodata.efi_halt_system.str1.8' in file 'prelink.o'
> ld: removing unused section '.rodata.play_dead.str1.1' in file 'prelink.o'
> ld: removing unused section '.data.rel.ro.local.fetch_type_names' in file 'prelink.o'
> ---
>   xen/arch/x86/Makefile     |  3 +++
>   xen/arch/x86/xen.lds.S    | 38 +++++++++++++++++++-------------------
>   xen/include/xen/xen.lds.h | 18 +++++++++---------
>   3 files changed, 31 insertions(+), 28 deletions(-)
> 
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index 300cc67407..934c79411a 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -137,18 +137,21 @@ $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
>   	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
>   	$(MAKE) $(build)=$(@D) $(dot-target).0.o
>   	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
> +	      --gc-sections \
>   	      $(dot-target).0.o -o $(dot-target).0
>   	$(NM) -pa --format=sysv $(dot-target).0 \
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>   		> $(dot-target).1.S
>   	$(MAKE) $(build)=$(@D) $(dot-target).1.o
>   	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
> +	      --gc-sections \
>   	    $(dot-target).1.o -o $(dot-target).1
>   	$(NM) -pa --format=sysv $(dot-target).1 \
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
>   		> $(dot-target).2.S
>   	$(MAKE) $(build)=$(@D) $(dot-target).2.o
>   	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
> +	      --gc-sections \

It should work if --gc-sections is used only here - last LD statement.

>   	    $(orphan-handling-y) $(dot-target).2.o -o $@
>   	$(NM) -pa --format=sysv $@ \
>   		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \


-- 
Best regards,
-grygorii


