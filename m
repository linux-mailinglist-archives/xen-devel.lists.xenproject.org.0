Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C346A4BD87
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 12:10:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900188.1308109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp3gE-00082G-Gs; Mon, 03 Mar 2025 11:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900188.1308109; Mon, 03 Mar 2025 11:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp3gE-0007z8-Dz; Mon, 03 Mar 2025 11:09:50 +0000
Received: by outflank-mailman (input) for mailman id 900188;
 Mon, 03 Mar 2025 11:09:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kv9T=VW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tp3gC-0007z1-U9
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 11:09:49 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20618.outbound.protection.outlook.com
 [2a01:111:f403:2413::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 035e2765-f820-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 12:09:46 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by IA1PR12MB7640.namprd12.prod.outlook.com (2603:10b6:208:424::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Mon, 3 Mar
 2025 11:09:43 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 11:09:42 +0000
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
X-Inumbo-ID: 035e2765-f820-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/uOhq5fl7rovbqB9Atu8GD3WJtc27aDh8P4SSEmGgR39DtRAGfr2xFxcv3Y+dZ3U99uOLYJp4ppAJNiIMblQX23Tnu24nquAhHjPabUGTPiiWD0I4KmPFeRIk1zuBVBzmO0JK558EOLU/aR4chvsDZ74Dd1SQQJimJtOqdLzubJI+XMbzK+GIk5n0glGBjoNbwEBE9g3A00YCppf7j3BENXLvJIKK74e0E1i5hfprn0BWTtMZKftO8TPygSzWhTwlsP8x8S3dkn8tAq9yz/sOX18c01zusdQBSyfQAj6Vj6SShiOn2n9FyFEqI+GwPW2p9wBg9CJz3KsTeohxj/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tELp48y7I2WF/EA0s5/dixBCPrMdkcHOHgRLnCnOEk=;
 b=FDVUdwuzhKnFOSKB+AnA/iKt9iFeZZIRf+ZROOwmmB3DkbW5TfEbHK25O+H2hGp8hKph/7YJuo8yYjtUhv+1v8gMO6MkvPtJdSMh83KWbItYYwv1bPv+6jxgLQOKDEVfrSxvLpzGcHFA5B4HLQHcH59cqb/aHzJFddpIQTguLgaUiucC6RRlTPXVNLhSHZ9C3YqD8pA1uzX1gdQh65oURLKglCCw2XDeKOe8zR4sNkU391lBR9sbjkWQmD/zx+3lMSWaQp4J+zbb9cur0zhRNO8mfQtOQ28HQfx+pRvxGK16c4hAkDCIBbnFaxrRGqdFWFUHaqyWV0SED6ir+Linpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tELp48y7I2WF/EA0s5/dixBCPrMdkcHOHgRLnCnOEk=;
 b=WmhqOG8XVA6AptPW2mGAULAi3/T0RUaEqXDQ2saFMon1oe8JFTRubyyrlYFr9ZDglMSoYWPGV1fENqS3vpZwfgsAg9XLfchEzHfGe6TzV0ivO6AatFHDcdhsT0ZLD1fY51zfL95Xka9WUPU0fm6MjssdH2NbWWWEshbK+5IiWEk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <4b80eef4-52a0-4ffe-877d-6b4af781141a@amd.com>
Date: Mon, 3 Mar 2025 12:09:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Fix platforms Kconfig indent
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <fdf893f3d685ad48340ae8c11ecf0723523c35ad.1740997574.git.bertrand.marquis@arm.com>
 <8a557cb8-7640-4c67-b59e-d62accb56293@amd.com>
 <07C70CAD-EDFA-4E40-9957-5B1469C2B094@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <07C70CAD-EDFA-4E40-9957-5B1469C2B094@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0248.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::7) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|IA1PR12MB7640:EE_
X-MS-Office365-Filtering-Correlation-Id: 2154c0b6-2f57-4c95-95d0-08dd5a43e624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UklGY0RVYmxSY2VMYUsxL1FITkg0KzFnNG8zemlsRmgrRWwydklDajFMMVRH?=
 =?utf-8?B?T21SUEdDblNLQytQc0k3dDMwZGdNWXZxeDA0bHlhL2VrNFZCKzc3M2lxVGJx?=
 =?utf-8?B?NU9ISEE5RFVONkZSbFVjYXNrWWdURnV6djNKUnhab2JjbGFZT3hndWNrTTJu?=
 =?utf-8?B?T0tZRy9GdWYwQzRON3huZFZtTDdQMm82aXlBS3hkdFdmRjlhckJPY0tHTG5h?=
 =?utf-8?B?R0pxVk9RWXJZc1lzV3lwSnRQVmY1RFdGbm9FdXdyUXhJcElaM2Z5eHZOL2pm?=
 =?utf-8?B?Rmg5RkJlWDBXZFpqZTAyb0xLTktrbFB0Kyt0ZGtGNnRpMFdrdUZZMWhlbmdG?=
 =?utf-8?B?RWplQ0lnY013ZkR3a3k4eU9YV2pKaDMxd2NMRXFjdGo2S2lMWjhQVXdVUXVl?=
 =?utf-8?B?aXMwWXl0MHRxYkdyY3VFbGREellEa3dIdHEwUG5OZm1NTWcreHRQcWU2d1Jj?=
 =?utf-8?B?TnhkVDZFRFdlTEE4WENZa2ZVRmtPYk1hb1F2Vkd3KzE5WmI5SXl6emxaWlZp?=
 =?utf-8?B?d2pacHM4cFB4eE1jZ2srV09oRnIvdktiRGxSQklYVXRCNW5CRzZ0L2Y0cURu?=
 =?utf-8?B?YTZpWEk0M3NTQW5VUGZHNDE3YW1COWNwVVREZ0Q3Y3JNTkVUV1FrcjkxYkIx?=
 =?utf-8?B?NGFYbjcxUFRCVGhoNFBIUS9FTFBTTC9xdTZCTmVXQW9vTW1kMUx6RTlmQ0xh?=
 =?utf-8?B?YkM2bnJEaElwVk1TNDNoVlMxeXRSVzFNeUVwekVOMlVBVVZGcWpCSW1rNVRk?=
 =?utf-8?B?bWVWKzhqZitxNExxNmRmU2ZjMGhibGhsYVA1cjZ2VUovQmRrOHhvUjE0a3Js?=
 =?utf-8?B?eUw5WGcxQTEvUDMzaFU5ZDRYWjRBUjNCbnNBUytkaCtXSWR5N1dtVmZJbGVW?=
 =?utf-8?B?dStBNUhOaVJMTzgzRlVhSDQ0TjBSVnRKa3IybjRDeXRJZEoxOWgzbjJ3UjUr?=
 =?utf-8?B?c0wwWGJPZVBTaHJwYVlkemplemJTbEpoSzhlL3RNY1BETTFUcjFjb2NvSVdt?=
 =?utf-8?B?UWEvaTFndEpFUGQ4Q2hzZ2lOWkloWG05VUVYV2VTS1Y4NnQyQTNiWk1ZMk9m?=
 =?utf-8?B?TVZsMjdTa1ZPMnRwSXUwN1lrMWQ5TkUxY1RpWTZWelNPOTNsQm14aXhvcm40?=
 =?utf-8?B?ZTErTzJSazRFZmluMXRvdHpJbFhLTHFqNnpINis3L1kvREc1R0VXaW1mNm54?=
 =?utf-8?B?YVNULzY3WForbVpBbUZlbEFSWSs1NTNzS0ZTVE5hY2ZqRjlFRVhEb1d5VFh5?=
 =?utf-8?B?K1Y4UnljeldYSUd3K0dJRzJsNXRCbS84bXdNczhkZUlpWTJiNmdIWEFGUzd5?=
 =?utf-8?B?dnhrb2twa0JiVzhGWEtjaXA5RlNFbE1nNmpSNTR4TVBjL2VubitSRXlROHoz?=
 =?utf-8?B?RXJYQVRhWVpOREtvWVlNYzhjRFJHakV6dVd0WHNNODBPUXhpRXRudzdLMXJQ?=
 =?utf-8?B?Z2JUSmtGL0NPdVNkc1kwWDN3aUs0ODB5MWdDTEY4bWpBNGJXaXU2bEpZR3hF?=
 =?utf-8?B?YWtKK3BrMlhxSUltWmRKbVlaOG9oNXZvcTJhZEFVLy9XMzF5RzI2QWNpa0hL?=
 =?utf-8?B?UG1RMXNHQUdaaDA3aG1CSzZkWTh6UlRoY0k2L09GMktrQUlqa3pGcHNzMXBW?=
 =?utf-8?B?dlZjbzNWbWVQSUd2OTJtcXB1aFJXMi9yM09tcyt5WnZMVFZXa1k2YkhhUHlJ?=
 =?utf-8?B?Y1NINTJ0TkhnNHhGblJTbTRVMi9LNFBHSU1ZeEhUY1cvUGlBc2FMdE1Zblh5?=
 =?utf-8?B?TEJONVVmaStNdmlleHdQRXhDbkNqYVpRb2s1MCsxMjlqZ3A3dFc3c242ZCtZ?=
 =?utf-8?B?aWlUb3UrSDBBT1EvMjQyZEN5eHNiZzJmVGtoT2wreXRXTmlQbkJLVkpuR3ZF?=
 =?utf-8?Q?2AY6sBFAqYmwr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2RGM3lqSm4yT2RMYXF4c0FWakt3cEdBRmNmWGZOQ3pSWEdVdVUxRlJEVHlY?=
 =?utf-8?B?S3gzOHpqeGZYa1Rmd0MvNXFxVnNJNW83TC8yeHhOYUswS1dlTFVyZ0U0WXV0?=
 =?utf-8?B?NWcxazd2QjB3WThaM0hCZk43bENhYS9yczFhRXlrT2wxMlNhbjErTnk3bk8v?=
 =?utf-8?B?R0F5YnRhSS91ZlpDL3M0ZE1Oam1BTWpKMFZBV1VsUG96V3NCcDYrMDNpaWZF?=
 =?utf-8?B?dzBLdjZCbVAvQlZobWQ0bmVYdjhvUjIvMFFQVExmanVkRkVPRVNqNlVpN0tv?=
 =?utf-8?B?NE9RemhSV0lkbjZ6SmdIUStkdDA2OFZnRGlQNWdIbjlMbk42VEtDTWJUOVdV?=
 =?utf-8?B?R3lkUDF2V0dhU3F6K293dkR0K2dKMVBneHZxME1UMEFHY3NFdWMyUnpHVU5Z?=
 =?utf-8?B?U3Q5cFRKSkpiMDFnUTBCVUhGaEpoYnlxMnBaWDFLOEdDaVJxWFFaNEdmb2Nh?=
 =?utf-8?B?V3NsdmdKTmlVb1I0OEY5ODY4YjZkcWZRYTRyLzhnUWYzNkxBVVdtV1c0RTM1?=
 =?utf-8?B?SUVvbi9EOVJMa1hJakZLOW02R3FJS0RReUJsbVlyZkFnUHhzSVRabzBycGRI?=
 =?utf-8?B?ekFtb3huQUZTQzR3S1djakNxa1hCeGFMS250OFJGNEFTM0pnWDJZUC9JM1hV?=
 =?utf-8?B?Nk0yVTZia3ZKR01BSDRzMTNuYklUZVMwc2RkbS9YTzUvRFAyd2NTR3g3Q1dC?=
 =?utf-8?B?b3BsV3UycWZTQzRuSXVvTHlqSkwrWXEzeWJoOWM2S3kwamh1UFIxdU5RcFg3?=
 =?utf-8?B?NVMyVGZua2FSZ1FJdXhsQ21hN2g0RXRNNkUzRTBmeXVrak50ak1rSi9wMmdT?=
 =?utf-8?B?L1dmZFFVS3hqcGU0cFo1cml0amRsRzVqcmVEVmNDalM1N1Foc3Vya3E5Z3o3?=
 =?utf-8?B?K0dRUmhWMmRWUC9RY0gvSlpyQ2xqemZjdTNDaGxkZ2xWT1ZzYldpWWgwNnBy?=
 =?utf-8?B?UFVacENFZDhPQ2p6RVNudE4zNWRURXZoQ2hnbUxsQUdEYWRGMHJ3SEpybHNm?=
 =?utf-8?B?dHZ4Z1hRYTFpdWJpT3VBQlNPdCtlYXl6eFN2NGE5RFZibFdhL0F6enRzQzI3?=
 =?utf-8?B?eFNFY1N1WFBWVkZXT1RMZE9wMFZlWFZuVDBFZE80Ym1ybFhOd0duellYZEsx?=
 =?utf-8?B?aTRaQ3lCa0FLTUd2Q1BJN3hMcHNuSHBwTm9tajJ5c1lyRXFhbzRvdENHbzJ6?=
 =?utf-8?B?OWF4N0VyalBTNjZwVVd3MExQM1hLZTBkL215QjgzSlV0b1VDN1pGNnd5Y2ZQ?=
 =?utf-8?B?MjVkcEJaMXVseHpWSW9vN2dnZThBYmpreE1lMElpYSt4aWxoTlJwN0RKMStY?=
 =?utf-8?B?V0VTR1ZQVWs3SWJMNm93bnNxS1l1dml2Nm9vUmtMd0NnZTFxRnQySWs0TDRM?=
 =?utf-8?B?bGZQT2lFYmlTdVcwN3d1UlFCcU1taHB6cjJZSGlhU21VSUdBenBObkZucUIv?=
 =?utf-8?B?Ulh4eWVndGNnTjJEdWpndXo4RENrVXlmVlkwNWowV0g5OGlpYXFISUxoVThP?=
 =?utf-8?B?TTZWSFNFWDlRb1IyanNNU0Y2RzNQcHkxc0d2V0tXMXJFc3hRZUxheCtOSm5J?=
 =?utf-8?B?MkFaY3FZSDZRRUFBdXdtbCtTTkZ4YzlzR3hsYi9OMmhjbWFlUjFsTmRzSGtQ?=
 =?utf-8?B?R0trNUJ4U0JGak03eEhyOHdQUU9PU1I4aFFjaC9DRFBZZHZIL3RHWlVTMTZE?=
 =?utf-8?B?dlErVEFMTUtTSGJGbElJdDZTUVdXOTdyVlN4eTZyYk9hZHVISlFDdUFWY3Uw?=
 =?utf-8?B?UXp3ZWdGK1NTNXBHd1lyZTJqYnlKNHl0M2loQ043MW5UYTVhbVhEckR6dGs4?=
 =?utf-8?B?cEo0NmNnZWswZWdwOTFTUEF1UjA2NExsaGY0MWhRdDJsaFp5cllYUEg4QWpv?=
 =?utf-8?B?MkZhSWJMcC9ENnhOaGVrZ2ZNb1djNUg1d3hCajV5dHlZVzAvUlZzdmtVdkVV?=
 =?utf-8?B?QWF2MjVaNlJMV2l4cjZ4MXY0aWtqbUFwUk9MR25yR3luNHA0dy9lTVpvZnZX?=
 =?utf-8?B?T2lONlYyVWNLYjlXMldaalhQVU11VWRJYno2Y0s0ZEk4MXR5N0EvNjFNMlpE?=
 =?utf-8?B?MlpyaFJobUZOZXp1d3ZlbGpBZFlPZys1T1hNS2lSaUtZaHFtb0dONTRkZmhp?=
 =?utf-8?Q?DNvc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2154c0b6-2f57-4c95-95d0-08dd5a43e624
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 11:09:42.9564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dUE8ZriHkKorNrNBsi21zZk+GVrDJRuOAxDWKdCn01o8O6JDb3FEbV1BaXw5c/BS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7640



On 03/03/2025 11:55, Bertrand Marquis wrote:
> 
> 
>> On 3 Mar 2025, at 11:37, Orzel, Michal <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 03/03/2025 11:27, Bertrand Marquis wrote:
>>>
>>>
>>> Fix platforms/Kconfig and Kconfig.debug help ident to respect the
>> NIT: s/ident/indent
> 
> Right sorry for that.
> Can it be fixed on commit ?
Of course. As for committing Arm patches I'd like to first wait for Stefano
to commit patches acked during freeze window that he apparently added to his list.

~Michal


