Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B5FA71D08
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 18:23:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928171.1330922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txUSE-0000Cb-Sr; Wed, 26 Mar 2025 17:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928171.1330922; Wed, 26 Mar 2025 17:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txUSE-00009b-O1; Wed, 26 Mar 2025 17:22:14 +0000
Received: by outflank-mailman (input) for mailman id 928171;
 Wed, 26 Mar 2025 17:22:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a+/s=WN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1txUSC-00009V-TU
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 17:22:13 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20631.outbound.protection.outlook.com
 [2a01:111:f403:2418::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d756537c-0a66-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 18:22:06 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by IA0PR12MB8715.namprd12.prod.outlook.com (2603:10b6:208:487::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 17:22:02 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 17:22:02 +0000
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
X-Inumbo-ID: d756537c-0a66-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKB+oLhJsxP9YfqO1l/rI26cHgd9eZJXukVRis1xcaN8l6UJwIrcnj4xikl/1j33xCQtbfIoQJunTAi0fgHrthtMG/atWARsqUYQm/oBZhiKYMhEyeO9aXGvh0fSBwnGDP2MhCSnRhXdGfL9pieGWVCe18wn2byPS6RLVmlx/hWZPrMWTWu/JkLVW3hjyp7yxcKhy8v8Hp9p+Bp0j8qlmp/vZ/Mbhtj/iZyJJ2Xi5rqwpH6ILNTOC4+z56pPoELSjSfcLaKoEOQaqwpPToVI782g3Dp+GVYI5zKFmpcdstHWOGv/PyUPVEN9YMEGDN+MuIOX4Mx/NQAT/2fTRS2yUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJhDCHhPRS8X+2A4FBEb2pc9AoPmmYM36i3y9UETB8A=;
 b=o4IbYZWwcUKql/1qOzMblALneuvJLY4uDOysr+oEjTjBJHq4NnjvpUQUbPHsmynATM86ozxYoWBVNPK5eM5Mo1CX3mXwLYzKo9HoA5wuOPOnCWNfPivVVqQAGSYIDT0O1CpkqUYPVrUSB2ODKd+BwTerc0AnblnckV/hEmiM0d891SYmu3CU3dO4wM0Zrg7W+ccYTOiLrqSS5G1FldiKDpr8ERC86iFvVURULABThjsqRAgfFvasqBw+cA+JjhSTDa8YV9Hk48qV84YXwA4LVHB4fsOoJ84eGKGVPwS2dSdVQRciVOSX3ddjvN6IGgy1cdYZPVnx+6lEjScjtEpgWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJhDCHhPRS8X+2A4FBEb2pc9AoPmmYM36i3y9UETB8A=;
 b=FPSH8/uGgZis8S9MAc/V1VDi5SQd0bZOrFuQFOKlTiCpSzIuuQ3T5HiWIkNbKcIb7oZbs5v1DSYhp0DZEiD17gWuoEdEW61nio7UG0h1FBwrWTjoMtIVbIY/8afB+fvF+tyk/M3n5XoKj0+3e0NUa3QYJn8ls0QAxtrpYhbzrX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <5d4fa9eb-129a-4f52-ae4f-21b9a5e5a0d9@amd.com>
Date: Wed, 26 Mar 2025 18:21:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/arm: Fix nr_spis handling v2
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20250325110029.399838-1-michal.orzel@amd.com>
 <Z-QTg7pAam8jmVda@l14>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <Z-QTg7pAam8jmVda@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::7) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|IA0PR12MB8715:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c1154b9-9284-47c3-1996-08dd6c8ab92c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1V5TVBzTDJVV05uNDNYT29FTXU3TTdCai9hNUVyQTdpMDdONXM5VTNkeEJ1?=
 =?utf-8?B?bE5ZSXZJZXRkWFVQYjgwa2Z2anFjN0FGUFM3QlVYcjVrNjluWi9NOUtqWTha?=
 =?utf-8?B?K1RJNlEvenlwREFBaFlERitlMGh2TzhzbXFLWnVsNG5aSXBXU2NZaTlSbHJl?=
 =?utf-8?B?N3kwSWN5OEVIRWdWN1FBOWczUUVDRUV5N1dnUE9aQVAvM3lnWkVwaEYrWUtQ?=
 =?utf-8?B?ZCt3YUpqdHpyaFNvNW9hZ1Z4SmtsVVdoVEFKbmZuM28xRXN5Q2FDY2lMVm8y?=
 =?utf-8?B?VDZCbjRxT3duS3NIelB5bFJKRDJmeFdNMXQ2SjB3V2hhR242OFNKbUw1b2cr?=
 =?utf-8?B?c0tqS0swQitseWV2d2d3d244OTlMV0poSjFRT3FLNWlNSFBIMHo0OEZ6eVhq?=
 =?utf-8?B?SVZEZUZYQ0VOWTdPRVNudmZFWHZpR2J0eWRNUGxvSFg1TUpuOHd3UDNiMzkx?=
 =?utf-8?B?MjZsVzRTcTZGR3ZSdDYyS3c0NnJzYk9NUytRSndxcFhLck9GbUpPc2R4NDBU?=
 =?utf-8?B?SFhXZ1dzWTJGNmVEcmlpd3p5TkJkdmtlK1ZFNG95Q0xoMVh3MFpBdUUwbkRJ?=
 =?utf-8?B?R1JKeHFLRDVGYzA1ek9YLzZ1ODVRY0xZYlFTcHU0YmZyZ21DOFUvSzFmV2J5?=
 =?utf-8?B?N3lQdGhOUm9ycFlpM1JFdmY0dCtFYjB4ZjVmaTUvN0xnK0FncHRwd2dTS1Bh?=
 =?utf-8?B?a0c3L3RUemJScmt1a0o4NjJ3V3BDZGQxYTJOMUN4a1pQZi9OM0hVbTZDZHk0?=
 =?utf-8?B?RnFOTGxFMXNiemJzT29vZnNsN29HK1E5bU1PYlpVM2hlek04cjdQSFB5RFBp?=
 =?utf-8?B?alpldThDSFh5ZFpHNGRFbE5yQ0k0NzQzVU40Y2YwbFlNTDlraEVYenNGTlZC?=
 =?utf-8?B?VzNtY09NK2NRK2NFNE9vNXorY1JsdGR4SlZ3SnEzS3RhMUNoSTQxaFMwUU5T?=
 =?utf-8?B?UjNVQzZVTzkzYVlRWUltWlM1QzBBMkNMMitya1FGcU4yK0FRdzFQTDZZQ0hs?=
 =?utf-8?B?Umd5Mzg5Ny9Sb0NWa3ZqdzJQLzlLNG5UMWlnV04wc1JHZ3JqY2VTL1dYY0E1?=
 =?utf-8?B?UzI4VjZIc2o0RmJJTXc2UW1aaWNYTkIyN1ptcndyVi96UG5UQTIwbjhYRlVN?=
 =?utf-8?B?UDlXdFc3TVFvbHpYYTMrazBZemF4Z0RIMVU3aDN1bmg5NXplM3FyMnBuSC95?=
 =?utf-8?B?VHBOdWVxWlI2YlJFZEJ1bU52RnYrc2dna1lVbzkwYXdJWUpjVkNKd2FTeVFW?=
 =?utf-8?B?aUdnYy94OE1LU3JvaTR0QVZsVUwrU0Z4a0N3ejZONWVINXBLSmJzUnFSSW93?=
 =?utf-8?B?Y0xBODVPUmFma0hUK2hTZDBKQURiVWMrbjJKMTNVTS92ci9qTHZYTDAxR0pq?=
 =?utf-8?B?ZlVWZ0RZNnh5YURaanFFWUliK1JXN05HM24xVlNicjBMd3dPK3EzcEc4VjhY?=
 =?utf-8?B?aXpCaUM1VXhJR2FUbEVFRXkzRXNqWUtjeFFjSmEyYXRWbExqUWl0a3B6eG14?=
 =?utf-8?B?MGMzSzl0TzNMUk9xWGJJSHJLb0FmTmh4KzVSM0RrQi9Tdlg1NWsrbWdwZ1gz?=
 =?utf-8?B?TGtFajZKY2wrdUdPS1dHdEV6SXorNXNqOFAvTHZpZVJoUzJBaEI0ZklUTSsr?=
 =?utf-8?B?UTZUMXVNY2VwT2JUQnFsNGJuSUowa0UrZWtmeE5EMlFxZEhiZjlMc0t4ZkNk?=
 =?utf-8?B?T3dQUXlXS3hRM213Wm05eU54RlNUZEZ2NzRxOThmQ1ZRZk1YcHNIS05UY2x3?=
 =?utf-8?B?WDZjdnlRQWhPRVE0QVcvUGIzd3ZlQWJoL3Z3ekduOHphR0VhOEZONExaa0VE?=
 =?utf-8?B?Vys4WUZhYkdaWmJ1TjZiWU9HSUVrZHBWM1ZGU1hIcTdDVllWYjhheVczUUNk?=
 =?utf-8?B?bXZvT3BNbEcrWDBqU2lwbEp5dVA5ZkF5YWR1QlROYmJPVzJZYkU1cWdCL1BF?=
 =?utf-8?Q?CBNIVB59I3k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWJ3UExKVkkya0ZlcWVJcCtsRWJuM1NXMktkaFV6NngrdjNHSmdlb0lHbVhC?=
 =?utf-8?B?ZHpnWmI3VVgvc3h2dDV1MTh3K2RkT1RRY0tOOHRLak1VcHdwZ3RpWjVEWEhN?=
 =?utf-8?B?djZLNndjbTRVM1BvZ2tFU1BZUFRsU0xUOUpWYzRIaEliQkdJcjRJYU53WTAx?=
 =?utf-8?B?R1c4bXROTzVoVSs3dytNbkVsMXYyckhsR0lEdVdhbDIrSG1FYW9Sc3hpR0lN?=
 =?utf-8?B?K0VXNFZqZVpPRGlLVC9WNEZXRFNGYStUU1c5QTcxZWp0WUllWXZVeWhpMkJq?=
 =?utf-8?B?MXlNcWJMMVRBSkxpZmEycHo2d0kzT2pNaEU1NHhDa0NNT1U3ZEtEdUJKTEJv?=
 =?utf-8?B?cmcvVGw4MkRCUkdZMGN1MzlNWDZPYmoydTc3TmMzeXNTbmZiby9PUHI1dFVL?=
 =?utf-8?B?OGdxb1pCSkZ4S2pUK3JDRWRBRUw0QlRqUUFlejZyQlRqUldtQzJISTZOUm5B?=
 =?utf-8?B?V1ZabmJFN0U1cE5LL0JsdmhLUC9NZmN6MFZrcWNSSThua2dwYmJJQzdXUGh6?=
 =?utf-8?B?ZGVjOHZ4OGF3d0liSHhaQjJQZk5MdkgrS1RIUzMwbXk4QXJ2d052MldsNWl3?=
 =?utf-8?B?aXBNZ3ZiRG1sLzNIREo4QXMvOXZueUxPVkx0L0o5UDE5NWVjQ3R4TDFQL2xQ?=
 =?utf-8?B?NlpYc1FNVmdIbTJPdFBrSFFjYURXL05jblFoeUhIaXFBLzVSKzhPZVB2Yy93?=
 =?utf-8?B?UFlXUVZ0SFk3dVJwRmJ3bDRzTHUySWF2QXpha2FPZWsySDRBaVlQeC9aWHha?=
 =?utf-8?B?ZHBrK2lzYksrMTJ6Q2Qxc2hOTk92RFk3OGJsU3VhNUV4T0xyT1VzV0hGUEtw?=
 =?utf-8?B?V2ptMmVOZXJrbHZVdDI0Z3daMDJPbVB6Kzd4STI1RmpwdFluNzlCMndyeEI1?=
 =?utf-8?B?YTJjbWZkMVJ6Yjlyb2ZaWHYxcGI1RXBKbFlla1NHTGV3S1pKcEhKS3orb0xa?=
 =?utf-8?B?QmFFd1RLS3VmRE1WQTd1UEgzcjg0YXN5NVdYV1UzNnhHOVdCL0dJbkh2alNp?=
 =?utf-8?B?UTI1UnpTV0R2TkVsMFRGYitYbWJBSzkvY0EwcWRnazVrUGtDejRHRlloTlpx?=
 =?utf-8?B?MGdFcVF1QXpnYzdURGY3RGEzODFRUTlsSGowczNWdTRKcmFNaldkaFNYczF3?=
 =?utf-8?B?SjNjbGN1TUR2NEs0eEFQMG53ekF4V25RZUh0YXJRTjBwMjB2NHNBVmFSelpO?=
 =?utf-8?B?SVdqQ25aM3BXckhtajl0Tmx4R1J3WjRrZWp5MmwvbUxrY1FaTkF6YXNuQ3Jp?=
 =?utf-8?B?ejJSYitEVUNXZHVoclEyTFRkaDZkejhNVTh0TWx1NHNvOFpWR0Z5bTZzb2M1?=
 =?utf-8?B?eVRubUVNVXdQYUhPQzhFZHVhSWhFVytmT05oZ1RrNUMyV1FIR2VjMTBGOVg4?=
 =?utf-8?B?MjBPQ2Z3cG5naWtmZXZPUXpMTzhyb2dtVTJEazErSkJlZUZKbGpRd0xmQnFw?=
 =?utf-8?B?RDRzOHJUOENTNHNYVTZCbFVtOUo1VjRTdTRreExnS3REd2N0UDRDaFJpd2FQ?=
 =?utf-8?B?b2w2U1dPY0h4RzQ0dHJHenU5akIvWUEzamhhQU5vblVyeGw5VjJwMDRiVHhV?=
 =?utf-8?B?cmJqbGpMYnc1NHdQYlFKeVhONEYvVlRlMnlZWUNEazA5b2s1MlhBa0xHRktn?=
 =?utf-8?B?Q2tZbHIzbmVKb0Y1a3BlZFdpc21lZjNVbEQxNStHeEZKTE5FT05nY2tJOTBI?=
 =?utf-8?B?YmZOMGljWVBQS3RqT3FLM1BTamM2TnN4b2hXWnRRZWowNmExK0ljYUxWUURQ?=
 =?utf-8?B?MGIyM1hMUVFMUlQvSUFKM3o0L1gzQ0xRdmhGREFPVUdmNTRNSHA1TG4xZ0VH?=
 =?utf-8?B?RVcwM3R5aC9lWlNPa3c0eXRsNERpWU1leTBKRk9VYzltQ2NxRnI0ekVCNy9Z?=
 =?utf-8?B?S21JZWtPQkJhRVFRTFZRRnJPTGQzZ2JmSVRlVno1bk1PeHBpU2V1MDZONnpX?=
 =?utf-8?B?S1VnMjlXSmFSbU5GcjJ3ZEc3cEF0UkVQS21abzFtY3BZYlhhdHJqL1VpNE45?=
 =?utf-8?B?T0s3Z0EzUUVvNnhIU2ZNcVdlKzRTNGoxZTBNSjdTeS9VYllvL0RlYWxxY0pn?=
 =?utf-8?B?OUcvRC9TbEZRTXBJMDd2VEsvU3JqRFNmUEYvUlBud3JoVG9OcjBsYjA3b1NW?=
 =?utf-8?Q?yVYmutXSITd1tALPcGWkoBA1U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1154b9-9284-47c3-1996-08dd6c8ab92c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 17:22:02.6604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgZX0NZpTqFjE92n8NaWEdR00qW1doSaOko5nT9aKyetXilLQD7CsRxFFpdvQAep
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8715



On 26/03/2025 15:47, Anthony PERARD wrote:
> 
> 
> On Tue, Mar 25, 2025 at 12:00:29PM +0100, Michal Orzel wrote:
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index 2d895408cac3..0adcaa373b54 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -181,13 +181,18 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>
>>      LOG(DEBUG, "Configure the domain");
>>
>> -    if (nr_spis > d_config->b_info.arch_arm.nr_spis) {
>> -        LOG(ERROR, "Provided nr_spis value is too small (minimum required %u)\n",
>> -            nr_spis);
>> -        return ERROR_FAIL;
>> +    /* Check if a user provided a value or not */
>> +    if (cfg_nr_spis != LIBXL_NR_SPIS_DEFAULT) {
>> +        if (nr_spis > cfg_nr_spis) {
>> +            LOG(ERROR, "Provided nr_spis value is too small (minimum required %u)\n",
>> +                nr_spis);
>> +            return ERROR_FAIL;
>> +        }
>> +        config->arch.nr_spis = cfg_nr_spis;
>>      }
>> +    else
>> +        config->arch.nr_spis = nr_spis;
> 
> Just one small coding style issue: to avoid confusion, whenever one side
> a of an if..else is using a block, both side should use a block. But
Oh, I should have checked with tools/libs/light/CODING_STYLE.

> that can be fixed on commit:
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
Fixing on commit would be great.

~Michal


