Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E61A45C41
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 11:55:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896367.1305050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnF4G-00013B-JJ; Wed, 26 Feb 2025 10:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896367.1305050; Wed, 26 Feb 2025 10:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnF4G-000102-Fe; Wed, 26 Feb 2025 10:55:08 +0000
Received: by outflank-mailman (input) for mailman id 896367;
 Wed, 26 Feb 2025 10:55:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9aM=VR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tnF4E-0000zw-9y
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 10:55:06 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20617.outbound.protection.outlook.com
 [2a01:111:f403:2406::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f4f12d9-f430-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 11:55:00 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH7PR12MB9174.namprd12.prod.outlook.com (2603:10b6:510:2ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 10:54:57 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 10:54:56 +0000
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
X-Inumbo-ID: 1f4f12d9-f430-11ef-9aae-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vo9OpOsP/h17PVr0ZHVrXNQ78XwoCKOWrCob9msANKFMa2kI1Qkkp5cywcM1jMDGLNWeKosq1FxLTGLWkG/9FqD5gsa6pjwkFWjvAAO2pLSd0CleLrTVdVxdSiBZEw0wpPL3mYZbDRXtGhcIIg+iqy0GWORV9H8nGCgTog9YtqmB68Cod8J1HzmKyZuOZFcnSgWpmjLz4vvc64J4X/R93yv6y8osbAaCfB9l9hNkrapb5NnNtS+tXsPknLVq4HHAeGgYBSirBu5APtrfNM2q0PKpXQ/gP/uueeDwRh0mTiFJlBxsxJ/uV9qdqNoF9I0VQMVSvo3QruojYWNzz+S1og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2JAM85tqoX/MhVLkbHY8+/3hmXzN1btbbmTcfwchwA=;
 b=dDiRG2HTC65Oc6KldsVZ2sCm9+owA+DGa4WKafTRHLp+CAFYKLPE+lV5Mw2L6VfcLo5PhUXbtMGebPr5f/5Qa+HCfeqt+yT+4bgcqjlPe1VweKZP+sQxzj3noZUTieJIKTi/itVpCoTBhP+A0DDWCdmKEvF98doDy4x6Bz3SegNwjTXqlXnzMACb9Ie76X6K/6NavJfnpcY9rLBb8Olm4/j7o4Z1aWNK5rxIiZ8XfMw0Z7rep0QKVbfO4C/DOclcKpggEfUXO8lkXGcyYBS6sEXIDWEwoAPM7jyZgCUMoYHyNDyIq3aXIHuAWxA9aRIlvbJa3Mz8nv1BpVjTkhDbDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2JAM85tqoX/MhVLkbHY8+/3hmXzN1btbbmTcfwchwA=;
 b=XvRNkLnUwadl7KgaKP+YTvFiMp6tODJvpF2Ak27nifwQgxCH7norgr6iJEHlVePpoiOyzoD//FvWXN9ZU5rsZRh6zGU1g/Nl7HWKuabThzfwDHOHzWgG5Ik+6l0RxO1NzgXEjspaV+a82yhaJxQjNLpAEDR2aJA6eEB+sk7ENvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <47fb8c2e-a33f-43f9-93f8-fc09be754cfb@amd.com>
Date: Wed, 26 Feb 2025 11:54:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Don't use copy_from_paddr for DTB relocation
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250226083649.2063916-1-luca.fancellu@arm.com>
 <0ee45f03-c072-4552-b446-58fd9388dd0d@amd.com>
 <F32D92EA-D96B-4D5B-9770-B0D73832927D@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <F32D92EA-D96B-4D5B-9770-B0D73832927D@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::16) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH7PR12MB9174:EE_
X-MS-Office365-Filtering-Correlation-Id: b20be913-db75-48be-f775-08dd56540206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnVzQ0NWeFFObmplb2QvZHZMNTIvcmRWa1dFLzBYekdDRlNmOFNJdG1zc1kw?=
 =?utf-8?B?T3Raa3RwZTY1SkpUWmRBcGYwTDhIQVhhNE1YMlRRempSdWJnblE0NFdlNFAr?=
 =?utf-8?B?S3g0R1JCZ3RkOTN2c2MraTVzRGVyVTVHWHVUTkFEcnZLd01zcFY0emk5aldH?=
 =?utf-8?B?b3dNKzFudTdXVzVlTnd5bTBybW5ZVnRKaWN3N2ZmdnFyZnZpOWFwYUU0K054?=
 =?utf-8?B?QktNaEV1eFNaMHk1ald6UFFvWDFkKy9tV3NJZklPcUNwNGwySDZiMTh5ME4w?=
 =?utf-8?B?UWF2aVFvYUoyTWV5VWp4TllxS2V2TGRoSWVzTDJlNGErSTJGeCs0Q0VZc050?=
 =?utf-8?B?ZEFDRGJjenhTWUNIbnhlM0lpdlRJdnl2NnA2SWVBM0IvSzF5dHhBdC9yZUky?=
 =?utf-8?B?MUNET2Z4VmVOVVBvUXEyMlZJT0hubFV2VXYvTTZ1VGJMZ3Y0UVVNUGhtTTdX?=
 =?utf-8?B?SExEUHU0WnlsNVVKcVFNSkYzMFZLZ3k2ak5lRW52YW16OVYyMXpkN291UW9u?=
 =?utf-8?B?eERtMFplZC9OOUJMU2RRMkNzMTdjQ1g5Q2VpYS9UREdVRi8wcFdqZ3FoMHhX?=
 =?utf-8?B?RVQ4Kzc3Q0JnRldlYUtwWDhad3dsY1lobzJLWU8zZ1oyWEtMLzBtVE5US1FN?=
 =?utf-8?B?b0QzYjk3K0lXbStRZStTSy9nV01mTi9DZjRhb0NTMjVrZ3kzakFQRG52SW1k?=
 =?utf-8?B?TUN3L053MW5OVWhsbGl1REJPTmloSjVUdU1HY0p4UWdHaDZmSnR2aU4yK3lG?=
 =?utf-8?B?R29hSnpjQWEzV2NZbVJnWmkrenpqaGgza1BNOTFXQ2tCMGJXSUU2TnIrUFVl?=
 =?utf-8?B?NkpMLzYxbnBPTmJ4Vml3SHRhQXphbk53TGY0YlBZMW92dWczbWZaYjAxZjB0?=
 =?utf-8?B?dDMyek9MRlA1OGQ1bE1SQjRXb2NkNlNvN3ZtZVhpUnZtMlBZbmJ0Z0p2VE1I?=
 =?utf-8?B?MkZ5aUpydkRqSHppeTRsQ0dxT1BwUExaQzY3RFMwckU3a3oxa0Z4b3h0am5v?=
 =?utf-8?B?L2phcTdDYm9ZeGF1ZDVHMFJXdUJVUHAzWExFK0tzUGJVcmVXNlZzWElVa0lX?=
 =?utf-8?B?ZUJEWE1vakpudHY1b3RscUtTTlNmbXp6S3JmYmdQVlU3QWpaWTRsU3ZBdDNs?=
 =?utf-8?B?RDd0aXNDZEt2Zm13cTZXS2pYTlVMTlNzUmVkN1VuemFmZm12T1k5QURwK1Nq?=
 =?utf-8?B?Q2NIdXF3REhnRXhubHEyVU9rU0JDUDBNWWN5ZkFjdDJKMnB6Z0pOOHlScmpN?=
 =?utf-8?B?VFJiYlgwSk92VFNNaEw3aGRveXZCRG5ZMkhXTzNoSjFYNUNOODd4aWI2OW1a?=
 =?utf-8?B?TklkUlFvWEhUaEN5Qzh2aG5CQmVDUkliM0xLK3FQQjNYR0cwR0ordEpGbGdT?=
 =?utf-8?B?b203bGdWMjh2L0dnMzlHTjE2ZGJMREVUUENSLy9XY0tDc25tazdBNmI1dG42?=
 =?utf-8?B?bmZFVDIxazNrOFFHeEZlcjRIdldZUjlBck9ZUFdyTmYyUWUvYVVQbkdEKzR0?=
 =?utf-8?B?b3RSK0RlTG1CQys3MGNCcjduRis0VVhxaHlteU5mZmVHaUN6N0ZkcGN2NTV0?=
 =?utf-8?B?SE5uVWxHa3hRS2xkL0pZR3plZzlNditPM2oyRmt4ck90YlptbjFhOEVTWXN4?=
 =?utf-8?B?YU9TcVNwZmlta2ZNK2x0WVczaVR5NUdFRzFQakp6NlR2M0VlWm1aS1Y3V1pR?=
 =?utf-8?B?Y1ZKZlJBU3ozb3NDVzFoVGlYUHJNN0pYdEN5MldyMFRvVHkxeE5KTHN4RjNX?=
 =?utf-8?B?T0NKeXc4UVFHR0R4VXQzNTJGczZVa1pCaVRNbXVHUGNUZ2VFRGZhemNQaC8x?=
 =?utf-8?B?TXZ6cW5uTkRFZmw5L3JnNWxtLytxV2lUOThVeFZHSjJjVXgwbldPcUdzZ3M4?=
 =?utf-8?Q?l9wY3jP4T1fOi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGN6WDFzSnJObEpmRHFXTTRTQkZSeGxubE5Ub0wxVms2cjFmMnVicHJxSEFV?=
 =?utf-8?B?WWRaZTlFczBhdU9sZnBWQ3Z0Si92aE5kdlZ0d055UVFQdUNaYkFVTkdPb3JP?=
 =?utf-8?B?akxwaDRHNDZJOUNYTkxXcVR2ZksvclRaYmRsUERFMUlTQXAzUkhCMm1xVnpW?=
 =?utf-8?B?OXFVZWRZcHJwN3dLVTdLK0xUd2tNTXhzNUJoNVM0Y0xXZTJFZ3JaQmdRb25R?=
 =?utf-8?B?d01FOFoxNDBXVDdPTnRZQ0VMSlZsUnc1QU1NY1p6V2xjVlNsY0VadjN4VUVG?=
 =?utf-8?B?YjJjc0ZLZzNYU2k3M0FjRFpZN04xMFVHSGNsb0tGTEpUUmo0b3pNc1VySHUx?=
 =?utf-8?B?YTVsYnpnV3BEV0tIaXRRK1VraW1WeERoRHFqZEh0MjZsNU8ySnpYL2tqdzBv?=
 =?utf-8?B?Y0NHb2NWclRZZWlOaWNTVVM3RWlpOW8weFpYanpGYVg3NmxYSjAzNUxhckRm?=
 =?utf-8?B?a0oweUt0WTl4T1RCY3NBOXVsU29ZN1Q2SDcxb1RKTEZGZU4yQVZSTEo4MFgw?=
 =?utf-8?B?OU9zOTRkaGpteVM5eVpINHgyRk8zNVpRWUltWWh6QUNQQmlqbG9QWnZ3RDZW?=
 =?utf-8?B?dHdvRjlGdG5EY1Noa29RMWg0MlFjU3dpL0ZZY1ZReWVJT0EvYVZveFFFdFpF?=
 =?utf-8?B?K0UyUUlUOGtabmdNWVp4Z1dmeWJLNVduTVpURXZmTFhiTjZaWXBDWDZXWVRr?=
 =?utf-8?B?S3lhSks4VHcyeUQrem5UQXA2aDR3SDAvOW1ORUI4a3pheVh5L0lOU1JXc0tp?=
 =?utf-8?B?blNtM2pCQTM2UlBMVVo5dVZmOUtma3VrdlZPZkx4N044UEd1WFRYSytmamlh?=
 =?utf-8?B?ZGE3MWZsVUhiN0wzb0o5eG1BMjFQZFhiTUI0akNCVUJDb2N3TGpsdFhYbXh4?=
 =?utf-8?B?VVVJWS9YMm9qS3RXbktqQndOc2lKWG01T3UxNVpzZjhBbnlBVlpUTWhWK1Yx?=
 =?utf-8?B?a0VVNE1xTVpwaVEySWF2d09tQW9PeXBHSVB2N1g2Zld4cU1DaUFFdk9kK3pP?=
 =?utf-8?B?aTBFQWNMV05RTmNYOFJBUXQrb3Q2eCs0akdJdWRXY1cvR1F0dzFqdXM4dGFu?=
 =?utf-8?B?S0d3RWNjbW9KZjF4bXlLQW1tcUVSRmt1VFhqMllhOGJTcERIMHZGR1JjQ0Vk?=
 =?utf-8?B?RWIxOUdGSnJ4cmpITHpGNG1CWjhvVzNVc1EzLzJqUnowQzVnOTNjMW5QampT?=
 =?utf-8?B?WmtJWlhMZjlsb1poUHRkd0o1cTVFZ3FWWXphWHpXc1l3cHBaTHJBWit5dDEy?=
 =?utf-8?B?Mk9PS3FOM3FiWDFSMCtjelpzcm9NV2hQUGhaSXRaZnA4dDdTMHF1V1lSWlh5?=
 =?utf-8?B?SkFHaWJFbXhoMWk5MEM3QjZ0RFQySU54RjMxQW5Kai9uWWNGT21OYWdJU0Vi?=
 =?utf-8?B?Vm90YmRRSGR5STJqaGRmcU1Qem5nWU5GWEcrTHJUdnc2R0hRUzExWTBnTjBp?=
 =?utf-8?B?Y2E5TnpLemZpNk1QMkZ3NHk5VmtBUXdMSUkvSGNuaGh3Rk1uQTR3cFExYUFw?=
 =?utf-8?B?VExscW96YStGSXJXbkg5THdLdjgzV2pUK1d5aTZGVUM3MFRrRk9DTnFyNVpV?=
 =?utf-8?B?WE8xOXRlRlFPeVc1ekkwNWRyS1pHSDRaM3NJSml3RCtNVmQwYnVVUGlhelNE?=
 =?utf-8?B?bFJCY3VhUDZ5ajhVZmcrTnFXNGZnTUdnc2JoSyt1azgrM2U5ZmQ4K2dsOEhW?=
 =?utf-8?B?UWVDR3ZyWDBjL2dJTHlOaW4zWmxzdGJtblBlV0Z5MXhrbFNkT2w5aS9oYm9o?=
 =?utf-8?B?b0loVVMrOGlzNzJKdzV5Zzg4eXp4L3FIdDFiUU1WOFJieE0zMHVIeFRvTE01?=
 =?utf-8?B?ZE1WTzhCaXRUV2pnUlhnZW1FaEtWSi9aNE9Gb2doTU5nL2VTeFZrOFNkNjFm?=
 =?utf-8?B?VWFuMm5vRklkQzR1WlUwYjZnRU5uWkUxRnBaWTR2K2k4Wml6RTB3eFdUcGgv?=
 =?utf-8?B?SFE2TmZiNVJ4WVdZVFBxUHlOazcvNnBHSDdMWTcxM2RmeDVzM294Y2M3YTZs?=
 =?utf-8?B?VUcvdlNrZEVZeVlYak56SGZtL1V2RVFPR1VGREE1bHF2TkJRQ2o5T1ZnZzM5?=
 =?utf-8?B?L2FBcTdYTjZsL1RDbzNTWkZLeGZWRlBwdVI2TGVNRFlpT1k4a05VK3pwdUJB?=
 =?utf-8?Q?PeLR5OC0ev225S4cVc6H+laJx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b20be913-db75-48be-f775-08dd56540206
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 10:54:56.9082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDsh7Hnu1QJW4JyujcvbKRPR6gqbJgFEpnwA0OBE5M87IyC88Pc40uDRAMAcp8DL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9174



On 26/02/2025 11:45, Luca Fancellu wrote:
> 
> 
> Hi Michal,
> 
>> On 26 Feb 2025, at 10:38, Orzel, Michal <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 26/02/2025 09:36, Luca Fancellu wrote:
>>>
>>>
>>> Currently the early stage of the Arm boot maps the DTB using
>>> early_fdt_map() using PAGE_HYPERVISOR_RO which is cacheable
>>> read-only memory, later during DTB relocation the function
>>> copy_from_paddr() is used to map pages in the same range on
>>> the fixmap but using PAGE_HYPERVISOR_WC which is non-cacheable
>>> read-write memory.
>>>
>>> The Arm specifications, ARM DDI0487L.a, section B2.11 "Mismatched
>>> memory attributes" discourage using mismatched attributes for
>>> aliases of the same location.
>>>
>>> Given that there is nothing preventing the relocation since the region
>>> is already mapped, fix that by open-coding copy_from_paddr inside
>>> relocate_fdt, without mapping on the fixmap.
>>>
>>> Fixes: 1bdc81dac816 ("arm: setup MM using information from the device tree")
>> Why Fixes tag? I don't see it as a bug and something we need to backport...
> 
> ok I’ll remove it
> 
>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> xen/arch/arm/setup.c | 7 ++++---
>>> 1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>> index c1f2d1b89d43..b1fd4b44a2e1 100644
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -237,14 +237,15 @@ void __init discard_initial_modules(void)
>>> }
>>>
>>> /* Relocate the FDT in Xen heap */
>>> -static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
>>> +static void * __init relocate_fdt(const void *dtb_vaddr, size_t dtb_size)
>>> {
>>>     void *fdt = xmalloc_bytes(dtb_size);
>>>
>>>     if ( !fdt )
>>>         panic("Unable to allocate memory for relocating the Device-Tree.\n");
>>>
>>> -    copy_from_paddr(fdt, dtb_paddr, dtb_size);
>>> +    memcpy(fdt, dtb_vaddr, dtb_size);
>>> +    clean_dcache_va_range(dtb_vaddr, dtb_size);
>> The purpose of cleaning dcache after memcpy is to clean the new area i.e.
>> destination == fdt, not source region.
> 
> woops, my bad, I’ll fix
> 
>>
>>>
>>>     return fdt;
>>> }
>>> @@ -362,7 +363,7 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
>>>     if ( acpi_disabled )
>>>     {
>>>         printk("Booting using Device Tree\n");
>>> -        device_tree_flattened = relocate_fdt(fdt_paddr, fdt_size);
>>> +        device_tree_flattened = relocate_fdt(device_tree_flattened, fdt_size);
>> NIT: It can be just my PoV but it reads odd. Why can't relocate_fdt modify
>> device_tree_flattened pointer directly in the function?
> 
> you mean something like:
> 
> static void * __init relocate_fdt(size_t dtb_size)
> {
> void *fdt = xmalloc_bytes(dtb_size);
> 
> if ( !fdt )
> panic("Unable to allocate memory for relocating the Device-Tree.\n");
> 
> memcpy(fdt, device_tree_flattened, dtb_size);
You already make assumption about device_tree_flattened being global, so why
not assigning device_tree_flattened = fdt in the function as well?

~Michal


