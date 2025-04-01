Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8275AA780B9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 18:43:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934690.1336321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzeh8-00054h-Fh; Tue, 01 Apr 2025 16:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934690.1336321; Tue, 01 Apr 2025 16:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzeh8-00052H-C1; Tue, 01 Apr 2025 16:42:34 +0000
Received: by outflank-mailman (input) for mailman id 934690;
 Tue, 01 Apr 2025 16:42:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yHas=WT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tzeh6-000528-5p
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 16:42:32 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20623.outbound.protection.outlook.com
 [2a01:111:f403:2416::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b82b240-0f18-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 18:42:29 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SN7PR12MB7954.namprd12.prod.outlook.com (2603:10b6:806:344::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 16:42:24 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 16:42:24 +0000
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
X-Inumbo-ID: 4b82b240-0f18-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SkCF5N00/IdUXr21M6LylDLvBpEEh3hxMdr3hrBXhj49UejZoMQzciI48zumoENgOsYNUVWPfZEf1L59VHOvHx5wr0IuqbzJ5y0bTEmvilh/Vn0qC8hGBFIS6I48VtVfxME216ZPo8Ysjdzq1R1cVZ5NJhcUdO8GsLuXpLqn2YdOPrAOQMkfqlahFr+p+wo60O1PRSh2k8VLObEzxxkEbmLHGkRdhRT0i6jFlgGHBk/Sf9/6fahSekEF62iD+TEBL24Wo9gcyMXZPwfCKp4MwC/ryvj/O34fYOHZA043+8gHo9AvTDil8M66AmtfPEiE8WHyVSXSqjQv7hQ2P0oDZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aTHYGmgzcKfrE8NYEk1QVMZeXSE7B7B726AvkDoqKA=;
 b=jAp6yqag2bXP8qOAhrWzOZy/i3aYTkbqqw8OgeQHFBkgAmozjWYKNxHtQBx9Ngzo7l1ry0r2vXIAeGhyYBWmr3Uo1y96Ydj6L0IG6J6V8jZOn6l+ejPizKkXckAKqPgoEuzZfE85eAdS7DSMffCnYpaX6N1AbJSF3jkmRMZ/EaOac+rfUtoGqYnKHMJDWoBAJlko34U6ZQ8QuvXfPMvEBRKuCXooPL1E9Tx1Ox1gyFgVPtPWUQPU9n0QaYU7sNIZMSM5Dzm/5AQcp6TlreY3FAwSLgPgaL/TMTMZmT66ksmDPFvvCrNCkuFccTAupfUuSNRV9h7xvHsSTpZ7jjZZdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1aTHYGmgzcKfrE8NYEk1QVMZeXSE7B7B726AvkDoqKA=;
 b=vd849Vb3gm4bkhHzh7VC/em5+aGDSZcj/7Mgh51Ydclp0A/Ial1318EEgtTXadsvyViG6A5z8OxgA6R8ANnDC8x82WJVBcOF9qZaIefG1rCnhw54zgAjvLER3BKk19uOFN5Y9NutVctC2rdMCGvQbRP0BaPLktrl2PgqlP+swXA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f06abd4c-dcf3-4b95-ba37-82b72da1f783@amd.com>
Date: Tue, 1 Apr 2025 18:42:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Drop process_shm_chosen()
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250401090937.105187-1-michal.orzel@amd.com>
 <3D313BC0-75C9-4208-9067-C1F6153B3859@arm.com>
 <f7a6dd50-28d9-409b-8740-f4433f2fd72e@amd.com>
 <237153F4-56B2-40AD-A2D4-824B621D3477@arm.com>
 <25e30373-139f-4827-91e7-a2dd6e85c433@amd.com>
 <16D32474-F78A-4E50-AA96-BE96D76D95FE@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <16D32474-F78A-4E50-AA96-BE96D76D95FE@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::9) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SN7PR12MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: cc59317b-6f1f-4fe5-45f3-08dd713c2dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dy9sT3d3WCthcWN5ME0yV25TYjVJMWJqeDB5MlJEREZFWkpvUmVxUy9aSmJw?=
 =?utf-8?B?ZzIzc0JMUFF6QUhaVGZFMVRTWDJRU3p6TDFwRXhIQnFSd2l2MElqVDZGY0lm?=
 =?utf-8?B?ZmpvbnRvdFFoZEgyTmhvMVZtNUVXYVdDQ0VWc2t1RU1tRG8xZ1JjMUtXbnE5?=
 =?utf-8?B?NHRzeUsyZHVIY25jZUF0MXVBc2tFMWFYNU9HRGNkM2pqeWR0MUJUNmVKRC9T?=
 =?utf-8?B?UVVtM096MFBYajAvTHNFb3d3SFhnLzUyRjUzdTJ5NnprSlBnVzlzQ1NzNE8r?=
 =?utf-8?B?VVkvNVBrNmxzOWFDeFRxMXFtUmRaRHRraWxwbi9DNmkrN3p1ZHNGYTNTYnpY?=
 =?utf-8?B?SWQrM2xzRkFycVlia0NRL2hOdGlvdy9HeG52dXRWWC9uLzFzUnNSVUREQWpB?=
 =?utf-8?B?VUw3OHk0Z2o2cjlkdkdVYVEwUGdRRERoRHhDZmp2ZDVlT0tKazBRaGxKNjFz?=
 =?utf-8?B?dG9KTnRENVI5aHZTZ01Wbm0rTXVyMkxzMGNUZ0owcnlEbHVFMjBwUXUvZ2My?=
 =?utf-8?B?R2doSjlyS24rd3VJNGltc3lWcW1GWm14eGpYTFVFallGMldyTlJST2J3c2cy?=
 =?utf-8?B?eHdJTFh2UnFTbUxkVFdPeGNUUHFrellRdm96OXlWd0l6MEkzYjVxZ1p0ZUQ1?=
 =?utf-8?B?Q1ZDMWlMRDc3Y01scHQ0eFhHcjlCVEVKUHQwYW51MzFQd3NZbE5sUUVERE1H?=
 =?utf-8?B?YlBPNVk3V21jT3U5U01PUDFESyt6L1ZxTU5FV0ZzVWhZQWtYb0k5VFBOQ2VT?=
 =?utf-8?B?ZDRPOHV3QnZqRWRQTnY2OCtJRVBpN2p2RG1OZllQeGNZMWhVMXpWWW83YzRm?=
 =?utf-8?B?eC9ZcjFvZHZ6dzhkZGU5d01nSUdJYUVzSCtsZGVOdUo2K3c5YU84VEZQVmJV?=
 =?utf-8?B?Y2NLWmxUeDdaeFByQjVVZUJzWFMrNFlJaGlrSlQzclF1MldYR3AwSTBIUjlY?=
 =?utf-8?B?Q2dzRm9oNkZWdm9ZZXVia2RzSmx0RmJJZmR3dnRMTDJBVHNPSDlDN2IvZElB?=
 =?utf-8?B?a09ZQUpxZUlYbzd0OFJ5cUpDOVVZVUhwVDBsQ0VNTWtpWG5aeTJjQmJxR3J2?=
 =?utf-8?B?TWZndUU0RHBGdmI1U0NvMmpQWHZEVWV5NXNxa3lqU2JEUCsvcnIrWjg2RmVj?=
 =?utf-8?B?aVpyaVhweXpsZ21NcEN5emdYOWU2OE9Vb3ljNm9PeUVST2w2WEF1aER4dGJB?=
 =?utf-8?B?MHZtRy9ZSE5tajZqSi9SRENjNklzTnhaQXJFcDNGOU5GaVFVRUZpdUxXK1JU?=
 =?utf-8?B?djdCeStFQWRneXRNT1cvb2NWL0h1SGhWRVg3VmsyZThsZjd1Q09PK0I3YThu?=
 =?utf-8?B?N29CMklxaUc4bDFGOFEzU0U0Z2t6WU54ckM5aUFzM3lEbGFUY1NibENJOFpN?=
 =?utf-8?B?by9NWDZXallkaHVQeVREdG9GZ1hPRldNT1JXVVE1WnNoWW5OUkZUbTQxek1O?=
 =?utf-8?B?c3lEVFB3REo5UVFveStsK3dTcVpkRlBONUt6N1RRRGlleVRrS0luTFM3bG1j?=
 =?utf-8?B?anFuOXdqbGx2c29jcHBQMDUxeVh0M0g3QzFGbFl4R01qYkdHN1VnM1lVZ1hm?=
 =?utf-8?B?NXZQa0RPaUZCNVVQWU1CTkdtcHFpYnJIWEN3QUphS1prbHNPOUpiTTcyekds?=
 =?utf-8?B?dy9pZ1l1eS9LVjVoaWQvMTdHM1hDbko5dGdaWUhST0M3alJTNHpBWGRHdVZo?=
 =?utf-8?B?c0NmaU1oc3dYbURISUhXaXVmRXhwTHIwZkFreHZaYkFiTTNlcFZwZCtaWjlD?=
 =?utf-8?B?VXJINGVIRjNKYXhsMTZRUDRSREVaVzJXNS9pK21GVUZKS1YwbVdvUm1raHY2?=
 =?utf-8?B?VGNDM1BmdkltZzhybVE2aktDQWxpWDJMbVB3anE1eDdXaytWWTZCTmdhN3l4?=
 =?utf-8?Q?Bp1F08mCTfKF1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N282bStIeUUxWDQzMHhhM1N0T1BMOHRUalBGK29Sa1cwSzlTUkpVbG04YXZu?=
 =?utf-8?B?U3UyOEZuMGRDRVMrVjdyZHVXNlY3ZTRBbFFtdG1TSEVESzZxdThnQWdUaWhL?=
 =?utf-8?B?dXh1MWtnQ0IvbXBGOWZxOGU0RTJ0ZHR6b3dQdlU5RS9aTXRXZVFJOFFiSGU1?=
 =?utf-8?B?aWZLN3ZOaWk5UmU2aEdPMVpzSW5GS1ZjSlZHb0JvRGM5VGx3R0x0RDhnTG9M?=
 =?utf-8?B?UkU2STBORm15cEN1YlpxdFlKT0RYM3NWQWFlVjByL3NCWTVVT1FBU0FkampY?=
 =?utf-8?B?TWgydWIwNkxDZjJVZEdXUFh5eFBFeDQ0OTlDS0diK3ZDQ3MxYjlRNG1ldDk0?=
 =?utf-8?B?VVp0NS9NcityUXFRSjV1OWhKc0lyeWJpdWVSNmlvT3hXNkFKOTlJd2h4RHhx?=
 =?utf-8?B?R3Q0RnpmUDNtWHZXYmk3bmFScnB1L3JqSkJrRjN4N3dLamhSbVN3SStOZVh5?=
 =?utf-8?B?NGR4MDU4TjhITXNuQXU5Nk1pZ2tDZkJBQzZjOWxhNVlKcHRTNUZNSkVjMFJQ?=
 =?utf-8?B?NU1kZWVVSThsbk1PbVdXNjBlVzJBbE4zWi9ibzNvT00wTHllMmt6bzBsckRq?=
 =?utf-8?B?eXE3eEwvWlNDN05XMVBzMFBkZkNub3UxYm5hd1lQYmcyU0doOGtyOWc4SkxD?=
 =?utf-8?B?MUhmTStldURwOExuV201R0N3bnk2dmx1ci9TR2Fadmtva1BsSWJnSkN0TnlE?=
 =?utf-8?B?a0NKd3A1Z0dqQ2xrendFVzdobmhvbWZqTTJkMWE3OEI4aFB0dlgzQXNuTngr?=
 =?utf-8?B?Zy9sUzdwM0VGS3N0eGFYZWM1M3pPUTdVMDJtK2oxTnBKZGtPVTFJcGdTM0RY?=
 =?utf-8?B?MUVVYU51cFd1VUpOc1B4ZFZvajNGVnh6ajBNOEFzTjdWakdmeG15U2RldzRC?=
 =?utf-8?B?S25yR05tbW8zK3RNc2w0Y3B3WFEzanlRU0xoRC9MRWIwaWdBK1VtemgvOVRn?=
 =?utf-8?B?c3doSHJyVHVabk9ESjA0ZGwxdTJ3YklFZE1aZDlPTTZ2UVBVNlhlN1F4ck5T?=
 =?utf-8?B?YUozWXBUVWk0Z3lRNWxJTlkraFo0djlqV1lMdkRlRVp5V09pVDBOOHg4cWdF?=
 =?utf-8?B?VFB4MmxHM1Jad1ZUZ3RjVlQwZUVhM1F6aWJGMzYzRVA3QW81NjQ3WlJnYjV4?=
 =?utf-8?B?N1p2Q1liczVqOE83SCt4dEdjcElBVklvRE1Ec1JubitWc1o5ZGsyVG9BTWhh?=
 =?utf-8?B?K0ppbmFaUWZHZUl0YnVWTE1SODFNQkFyaHJQT3l6eEM3L3lDSXNKVzkrbHFX?=
 =?utf-8?B?SXVoTHY0aUdHODBsam5zOHUzbjUra2JqZzlibUEweFVhS2lodkhZUEJ4dGFh?=
 =?utf-8?B?NGdwaTdNRGErSlNEdWJKcENwUlhuZ0R5SUdSZXczV1F4Qjh2UHd3ZzNpcVpr?=
 =?utf-8?B?a2pXeHFxZHpocVAxNWVPZ1dzaGlTKzR4cEU1Q1VDQzVNZjVFSkVOdllXbm9k?=
 =?utf-8?B?QUs5azRGSVZUNUs0a1pxMnd5N2xoRThQeTIrMW5Fekx6MktVUGdKQXJUUGhU?=
 =?utf-8?B?S2wvNkZTclJyUlQvZVloUEwvTDhvNUVXeG51K0tSTkFsMzFnZlVhYzRiakFQ?=
 =?utf-8?B?ZzhlVlYwMlRWNTBJRTcvVnJIaGxsZ08ybEpqcWpTTTUyMTRFZ1lnaVZRWkhk?=
 =?utf-8?B?WmEvOXZPbkRkQlNZNVdYWE9yNGk3YWRIOGR6bGpWbURrWXB4SVlTM2VGM0lM?=
 =?utf-8?B?elQ4UFRDUENqSDNXTzQ3elFwdkV1NFBZdk5TcWNaRytRM1BzajI4Zmw4Q0M2?=
 =?utf-8?B?K2dZSUY1ODdha1FmQnNVU3VRZk8yNjVVTEl1NVd1Mzhzd0VoUzZ6YktFb2xH?=
 =?utf-8?B?dXFSc0dZWVZmeTNPM0FaTG5NYVlKSmtuNm5vMmlYRXlUU1NrZW1sQTJLdEhH?=
 =?utf-8?B?MUFXZWRCbTM1ZC9FbkMwOFUvNDRWdkJPRUI0SFk4bWlKcG5hVkZLeEJjWG1V?=
 =?utf-8?B?eFpqUk5EZGt2TWNqR1lGVFVVazE5cEZuTVlRWkJ2SnhsQm9QUHRsOUdwaFhh?=
 =?utf-8?B?bHJ0b0JIb1Q3KzFmN1RvNk4yM0RwMi95d2k2SElvZVJTQUkvVGl4VFJrS2xW?=
 =?utf-8?B?ZzZzYTcxb2FmOXY2MTRFWWQrcGR3dWhhazl4Z2dvUWxHZG5QaG8xaUsrZTVu?=
 =?utf-8?Q?4pg5VOojI643yRF+6CREOmd/n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc59317b-6f1f-4fe5-45f3-08dd713c2dfd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 16:42:24.2147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmS54A0FpRwjYWygZLasap8pw/G8SrABVwMzX6F4ADPkp1L2j65nD+oX6dsJ4HF7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7954



On 01/04/2025 17:53, Bertrand Marquis wrote:
> 
> 
> Hi Michal,
> 
>> On 1 Apr 2025, at 17:21, Orzel, Michal <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 01/04/2025 16:49, Bertrand Marquis wrote:
>>>
>>>
>>> Hi,
>>>
>>>> On 1 Apr 2025, at 16:22, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>>>>
>>>>
>>>>
>>>> On 01/04/2025 14:57, Bertrand Marquis wrote:
>>>>>
>>>>>
>>>>> Hi Michal,
>>>>>
>>>>>> On 1 Apr 2025, at 11:09, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>>
>>>>>> There's no benefit in having process_shm_chosen() next to process_shm().
>>>>>> The former is just a helper to pass "/chosen" node to the latter for
>>>>>> hwdom case. Drop process_shm_chosen() and instead use process_shm()
>>>>>> passing NULL as node parameter, which will result in searching for and
>>>>>> using /chosen to find shm node (the DT full path search is done in
>>>>>> process_shm() to avoid expensive lookup if !CONFIG_STATIC_SHM). This
>>>>>> will simplify future handling of hw/control domain separation.
>>>>>>
>>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>>> ---
>>>>>> xen/arch/arm/domain_build.c             |  2 +-
>>>>>> xen/arch/arm/include/asm/static-shmem.h | 14 --------------
>>>>>> xen/arch/arm/static-shmem.c             |  4 ++++
>>>>>> 3 files changed, 5 insertions(+), 15 deletions(-)
>>>>>>
>>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>>>> index 2b5b4331834f..7f9e17e1de4d 100644
>>>>>> --- a/xen/arch/arm/domain_build.c
>>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>>> @@ -2325,7 +2325,7 @@ int __init construct_hwdom(struct kernel_info *kinfo)
>>>>>>   else
>>>>>>       allocate_memory(d, kinfo);
>>>>>>
>>>>>> -    rc = process_shm_chosen(d, kinfo);
>>>>>> +    rc = process_shm(d, kinfo, NULL);
>>>>>>   if ( rc < 0 )
>>>>>>       return rc;
>>>>>>
>>>>>> diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
>>>>>> index fd0867c4f26b..94eaa9d500f9 100644
>>>>>> --- a/xen/arch/arm/include/asm/static-shmem.h
>>>>>> +++ b/xen/arch/arm/include/asm/static-shmem.h
>>>>>> @@ -18,14 +18,6 @@ int make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
>>>>>> int process_shm(struct domain *d, struct kernel_info *kinfo,
>>>>>>               const struct dt_device_node *node);
>>>>>>
>>>>>> -static inline int process_shm_chosen(struct domain *d,
>>>>>> -                                     struct kernel_info *kinfo)
>>>>>> -{
>>>>>> -    const struct dt_device_node *node = dt_find_node_by_path("/chosen");
>>>>>> -
>>>>>> -    return process_shm(d, kinfo, node);
>>>>>> -}
>>>>>> -
>>>>>> int process_shm_node(const void *fdt, int node, uint32_t address_cells,
>>>>>>                    uint32_t size_cells);
>>>>>>
>>>>>> @@ -74,12 +66,6 @@ static inline int process_shm(struct domain *d, struct kernel_info *kinfo,
>>>>>>   return 0;
>>>>>> }
>>>>>>
>>>>>> -static inline int process_shm_chosen(struct domain *d,
>>>>>> -                                     struct kernel_info *kinfo)
>>>>>> -{
>>>>>> -    return 0;
>>>>>> -}
>>>>>> -
>>>>>> static inline void init_sharedmem_pages(void) {};
>>>>>>
>>>>>> static inline int remove_shm_from_rangeset(const struct kernel_info *kinfo,
>>>>>> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
>>>>>> index c74fa13d4847..cda90105923d 100644
>>>>>> --- a/xen/arch/arm/static-shmem.c
>>>>>> +++ b/xen/arch/arm/static-shmem.c
>>>>>> @@ -297,6 +297,10 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>>>>>> {
>>>>>>   struct dt_device_node *shm_node;
>>>>>>
>>>>>> +    /* Hwdom case - shm node under /chosen */
>>>>>> +    if ( !node )
>>>>>> +        node = dt_find_node_by_path("/chosen");
>>>>>> +
>>>>>
>>>>> I would have 2 questions here:
>>>>> - what if a NULL pointer is passed, wouldn't you wrongly look in the main device tree ?
>>>> Do you mean from hwdom or domU path? In the former it is expected. In the latter
>>>> it would be a bug given that there are several dozens of things that operate on
>>>> this node being a /chosen/domU@X node before we pass node to process_shm().
>>>>
>>>>> - isn't there a NULL case to be handled if dt_find_node_by_path does not find a result ?
>>>> It wasn't validated before this change. It would be catched in early boot code
>>>> so no worries.
>>>
>>> Then an ASSERT on NULL would be good.
>> See below.
>>
>>>
>>>>
>>>>>
>>>>> Couldn't the condition also check for the domain to be the hwdom ?
>>>> I could although we have so many /chosen and hwdom asserts in the tree in the
>>>> dom0 creation that I find it not necessary.
>>>
>>> There are never to many asserts but ok :-)
>>>
>>> With an ASSERT added for the NULL case you can add my R-b.
>> :(
>> So you still want to put ASSERT for a case where host DT does not have /chosen
>> node. I'd like to talk you to drop this idea. Normally I'm in favor of using
>> ASSERTs but not for so obvious violations like missing /chosen.
> 
> I am not quite sure why you do not want an assert here.
> Reading the code the first that comes to mind is "what if this is still NULL after"
> which would be clearly something no expected if someone sees an assert.
> 
> Seeing the place where it is, that would not impact performance in any way.
> So why not adding it ?
> 
>>
>> /chosen node is so crucial for Xen on Arm functioning that a lot of things would
>> simply fail a lot  earlier than a point where we call process_shm() at the end
>> (almost) of hwdom creation. There would be no modules, so the first example that
>> comes to my head is panic due to no kernel which happens way before process_shm().
>>
> 
> Sure you might be right, what if something bypass this due to efi boot or acpi boot and the
> code comes down here ?
> 
> Even it might be true now, this would make sure that no change in the code is changing this.
> 
> Anyway i will not argue on that for to long as it is kind of a matter of taste.
> 
> So feel free to put my acked-by without the assert.
You gave me a reason to scan the code and I realized that in ACPI case, if
STATIC_SHM is enabled, it triggers a bug in process_shm_chosen. So, you were
right and we found a latent bug that is not related to this series. But maybe it
would want to be handled as separate fix before the process_shm_chosen drop?

~Michal


