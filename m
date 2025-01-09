Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0960A07256
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 11:01:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867966.1279505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpLA-00051t-JN; Thu, 09 Jan 2025 10:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867966.1279505; Thu, 09 Jan 2025 10:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpLA-0004zX-Ge; Thu, 09 Jan 2025 10:00:36 +0000
Received: by outflank-mailman (input) for mailman id 867966;
 Thu, 09 Jan 2025 10:00:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=raTQ=UB=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tVpL8-0004y9-GE
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 10:00:34 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20627.outbound.protection.outlook.com
 [2a01:111:f403:2417::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ff47270-ce70-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 11:00:33 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by PH7PR12MB6883.namprd12.prod.outlook.com (2603:10b6:510:1b9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Thu, 9 Jan
 2025 10:00:25 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 10:00:25 +0000
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
X-Inumbo-ID: 8ff47270-ce70-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rtpl/Ivp27mIzxQHQKGHi+vm06x7QG2t7odYnb/l75Kz0cW75kP9rlzkkPtbKPppwTy7pCio+BPGqKV+3lJlIkREKo8UvqdkYSMswMcMeh56k+/UXRISWBGly/qW+HwssY8Ek4p8NmHCytLoekFd0rBTKJ+TZ0pXG1awbyNZ8PHDTZv7W3XixFZn25KcP14Xde/0XADIWcOrJFrqKnpCfXSZgnWzBdZgtjGbLHn3UkW8w8GMSgJ/qhxekYY1CPpsq3KxbXOacn4PZ1RKiPRzEJAteR+i5hqDnbm4exgmEv7/os9TxVFjkNCRqamhe4cJwKGPYHd1DHJGOGnZ8Hgqrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSbqQ1bMAzEwYI+OjrqbC6kWfmyreb796wbnwwNLygA=;
 b=Ms/opKtk7BoEKyrAdm+yk5E9l1cWZuyGwyGXwUFLAFnV8JRCorP7YL+I+J/zLwjWyDToQ/1IfTBAEC3aqonJHy41D2z0x4ox+eDbMDpfUhFJgLjoguSeYJ8RsIVFuRUnEYzNbJf2rQQznLGLmje55fQ8KjB7TuVmjzllPtDda+HifsW32WVRVXHoHTGEk0G0+Vw6l272S5p7uVXe7NG33tqEv1CYMhOdt32QP1Fs9W+YUyOEG3b9T85wknFYJ2MUdkCWdzO4DoqEPlUFVebrE+WDrNqVzXQxcZ7kjhZVaIwJCl5kE74MUc+STMFE/2QOpYAPGiGMtj4G2xYIh+e0WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSbqQ1bMAzEwYI+OjrqbC6kWfmyreb796wbnwwNLygA=;
 b=Yo+39DB9KUk9a/x+gU/Xt3VBFVSPHad4wne+sh+0Cnx0utQBgzelj+cn9tai0TUiVwFRdx66K4E6dJncV6o0ur3fEoWyGdrRUYDP4WT9Z+4i4ozDSjXWi9osnU4DPOS9eZerxMLIzXF/YHMBXZOZ13/GsGUdN+rEI3laVSYcygM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <dac15016-b55f-4066-a8e6-b2eb8346655c@amd.com>
Date: Thu, 9 Jan 2025 10:00:20 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs: fusa: Add dom0less domain configuration
 requirements
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Artem Mygaiev <artem_mygaiev@epam.com>
References: <20250108170304.2250917-1-ayan.kumar.halder@amd.com>
 <E21BDDA5-F268-4127-82FA-1BD58DD6028D@arm.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <E21BDDA5-F268-4127-82FA-1BD58DD6028D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::21) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|PH7PR12MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: 488d1eec-f5b9-48c6-e084-08dd3094700a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Nkc0QXhLbkRlL2FzMlUzcVlxbWF5bzRyb1ZJZVREdGhFVWJFUGgxMVhHUDdP?=
 =?utf-8?B?VVlGdkV2UXJYcXAvQW1tSkN2OGs1R3NyUjI2Mm4wK3lRcUtTSWN3NWlqUmQ2?=
 =?utf-8?B?cUdkaGpGWDcxWldnZDlOMU9qaU84UUJlejl3a21NQkRTTFFnZk1BYWptbHpx?=
 =?utf-8?B?anFOekw1Uk5XUm9Lb0x6ejh3TkM4bHVORzVCV2J2K0ttYTF0emhMQ3RIemhi?=
 =?utf-8?B?Yk5RdWZ4S0wvOE04RVVOWWxyZldYd09XcFVBeVdVMU5JMSt0YnRzQ2NYbkkx?=
 =?utf-8?B?bGQxZC91Ny9rdEFJYzVmRTZHMlI4c0xkV0pCdVl0YWlaZ0xzVW9TV0h1b1ZN?=
 =?utf-8?B?UlpMcEQwNjdsVE5rNUZvcXVzVDV3UUtKQitlbExlZ0w1d2FIdkxKLzl1MWx2?=
 =?utf-8?B?K0YwNXlFZDExdlE3WlI1aHRRVDBEcStwMndxTnRZWDZXSXl6RythbkdqSDZi?=
 =?utf-8?B?UUFURmpmQzFYOW1jNXJXYXkrc2NFbjlQanREeVY2YmFvMkxYRnhLdW1xWHJw?=
 =?utf-8?B?b09VV3JwVkdibnU4QXJ4WDRtUXFlTzF5TUd3azJHWXh2MUUya294b1RQTlcr?=
 =?utf-8?B?QUVJbUFnSmY2M091Q3I0bVNuUDVKQjByQzNtbWJCRUlhL3M4YkhxQW1IczRT?=
 =?utf-8?B?RUZzeEwzdnZqRmluakhqZ0tSVVJTV1pDeW5LNlRwbXJiRjgyY09BSkE5MFBz?=
 =?utf-8?B?ZElMa0I4cDRRd05tcFRTUEpvNXRCdzI0U3g2Q1NmeUJxNVdoQ3dZL3k5QVhp?=
 =?utf-8?B?Y2F3a1pxNzdjbTY2NTk3bmhqRktHU3RYczFQNFoyN2JFaXczbUtPSzYrTVl4?=
 =?utf-8?B?NGdsaXpVUVRYcU5hVUx3WVJ3cjNZd3UzL0N1TE96eFZscDh5clFFYktXeUlJ?=
 =?utf-8?B?V0hIdWpQRTVwa1NpZUJUNXpZbzQvY3pqSTVYS3dIM2k2dGFOc0dndFNmejEz?=
 =?utf-8?B?OHZMWUN0aXRPWkdKdVN1MVBsQzBzL1ZRZkFXR0hoNGZoVjB0dlZrK2NOcm9q?=
 =?utf-8?B?YTg3SERpMkJublEvOXVwOFI3M0QxU09IQ0wwTzh5cUpRa1JpK2lnY213RGpV?=
 =?utf-8?B?aDhWaUtmVUlreGxseXNyaXlpTFhaZmZKVlJ6RjQzU0M3ZkFFUk5uSVpaRG1I?=
 =?utf-8?B?WHRNR0tBZU5sTzlScHZkb3F4NC9LN3ZxUjBURWRheHBZR2ZzaC96bk9kQ3lE?=
 =?utf-8?B?VUgzTy9NRjhtLzEzdlNPOS9lQWNEYW5KRldmOERFelBEd0lrUUpsVUFUOTFB?=
 =?utf-8?B?dXlTT3NxT1BwMUNEY1p5QXJBOTMvVmtUa1BrUTU5NEZkN1ZDQkZhYjJzNlI3?=
 =?utf-8?B?K0tlMk9INkZ5UDcvNjdzeTI1MnNWSU5IaXJPUTlBSW1oNCttanlpN0o3MU0w?=
 =?utf-8?B?U2tYR2swVzNQZlVsTXh6bTBpMmpYdCt2VGgybDZldVRyRndPemlCZGFNZWdS?=
 =?utf-8?B?N3lKejFETUhvTTV4TVVLOGhjMHBPUVpuYlRROHBXdGhMeVExRWQ5cDBYSGVC?=
 =?utf-8?B?ekE2YUpVK3F5VEJRa1FjbENOVnRTd1ZSZmJySWV1a3B6cEozK1VNVVNsZi9w?=
 =?utf-8?B?bFdZKzJ5a0p5SGkyWUY4Nnhhd3ZpdmwvUGxETGFYSGYyNTBJT05ERTdDeTNX?=
 =?utf-8?B?YjFZL0syMjQyaVVSWmhTQm5ReUt3QjV2SGpEOUUvNnM4T3BIRUtRZXZ5ek80?=
 =?utf-8?B?L0ZSSERBNEx2M00zQXN5S3RwYndCVSt3TzhwaVdEeHNMVHBtdGJDRGFLeG1X?=
 =?utf-8?B?MkJHenFhbzZYUkl6czJSMnFKUDNzNTV4NTd6RXNjZXA0ZVQ4VDcyR29wWWxE?=
 =?utf-8?B?cnBhay9OWjdiRFluVTVRenk5aDU0d1BhSUxZNTBvN3Rvck1sLzIvbkdOVjdo?=
 =?utf-8?Q?XwNzrF6eEWKwY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nkxld0hoQmdCN29ZckxrL1ZoYXV1MnBudTFMR3lOakdHVW85RktTU1ZpZWlt?=
 =?utf-8?B?MmdKZG5qMjdvRzRLUnp4RVpETUpMK2tqbWt6cVdQU0hLc3lvcEVBc0kxamc2?=
 =?utf-8?B?TjNmMmx1ZFduMjNaWE9uakxFU1U3T2dTcUFsWnZWWUUwazg4aSs0WE53TGlj?=
 =?utf-8?B?aGJKNStOakpzVUgxQmxwaGtIbFhpQ2NPdGRoemN1UTc2RHBzbnVBOVg5dFMw?=
 =?utf-8?B?RDNvRVRYUjhmNkh5NVZJZFhTQ1pMdlFNY1RzaElqMlkzVGxaSWZWYnd0ZlVy?=
 =?utf-8?B?TUZ4OG9ydlJxOFU0TTBheUxoMG9JYmlPUDN3ZFl6YVJVZCtPV1owVXdTMHZj?=
 =?utf-8?B?OXU3TXdCOWQ4YjBCdm41bzBJNlhyYlNjdnZjdlJlckxZd0VjM25sakQ2a2I4?=
 =?utf-8?B?aTlPTlNVRTNpTUZlUHNUT202ZE1zck9laXRlM2xyNGFidFBSSm1QSXozR1lm?=
 =?utf-8?B?U2Yzbkdma3lpVmFybjk3bU1MMktCSEhFZUErcUxlRWp4SEFmWXZndjY2VHdk?=
 =?utf-8?B?YVY5Y2pnVGtMVFdIQW9ETU1GcThuT1Z5RDVsMXM1NmJWQWowYTAraU5RTTFR?=
 =?utf-8?B?bGJtd3dJYTJpWkwzSkZKaDJKcTA2eHU3S1c3YU5USDNYdUdyNzhUS0xkNGJz?=
 =?utf-8?B?RW1WU2hjZlIrY1MrekNBWnZHSC9MZ2NPWlVHOUFRdFBsZ2wzWGtpRG9nT3JG?=
 =?utf-8?B?bFVhUmU3dm5ySHJFTWM4SWZmU1NLTmREUVNxaklFL1FqK2pqQmNMRUVRTnVp?=
 =?utf-8?B?ZEk1cnp4bnkrNHB1aE44N1JCYjR5MUp4SWUyczVjWmlySUZYZHZNRHg2WGo5?=
 =?utf-8?B?djBjVWRpcXphM2dPYWxoZVVUUjRNUkhvRUNDdUVRVjg1S09RSHl0NjNwN1Ex?=
 =?utf-8?B?ZUUwenVXclVCcDVjdU1yMEt2NFhZYjBrS1ZlTkhxVFBhMDNyNE9LYzUxYXVp?=
 =?utf-8?B?Z2hoK1Jma3JQeERwVFpnRXNVT1hiNzF2amQyVitpR3hzZVdRVHVmSGViZ3M1?=
 =?utf-8?B?emhYV3Z3RXFSb2hHVkVXV0FoOEhqVzVJYUVmQnJZSWNzWjlDS3Z0SlFSRTEz?=
 =?utf-8?B?b3FuT3BkUHBDVm9iVy9RUDQ3RFFtdEtSZzZJaVo3WkowdlZuMFFnZGJHYVMz?=
 =?utf-8?B?OGFxZGd2akNXcjJHSVBVemo4akF6dFJXcjNGZWhpWkxTd3dYbFdkSWFRVnpk?=
 =?utf-8?B?UUE4cjFZNkdRT1diTmNpOVhIUU9FYkdWUjc3K2F5ZklnbE43L1VBam85eWRs?=
 =?utf-8?B?c3pMMUhjZmVXd2JwOFpnTXozLzg2bGg5RlhxYm9IaStlWFRqY1JYR3JXUENT?=
 =?utf-8?B?eHBlckdlc3ZvaERpbkg0bWlrUWRxcFVrTi82MTRaRzZPOUZzWS8zNVVYMFpJ?=
 =?utf-8?B?OHBTcFk3ejJIeUJkWG1jdzdqOElnRWNGR0o4Ykk2ejNyRlV3T2tBS0xxSE1I?=
 =?utf-8?B?QWFJNWpsb0tGazB3RSt5V3VJNE5zZmQwTXdRbVpEaVZxTTArM2sySk5sWHB3?=
 =?utf-8?B?ZFpYc3dWWllEMDd0OElicHNVZFZRbm9SdU5melpkaFNRbmtEbXNkQWlJTzh1?=
 =?utf-8?B?Mi9KUXRUTGFaYnhSOCtiSU4xb3U3bm9lQi9ubHFrNjFnUFEvU2J4V01qaXdj?=
 =?utf-8?B?Q2gxY09mOG56WFRxRjI2MmxtRHdwN1NYV3EvNXRYWWZsYmpmRHRqcGNsWHVa?=
 =?utf-8?B?Rmh0eHMxNjBpRFlTVFQyUlhVZm9FbmhGZ0FXNXR3T2g4UXBhU2cyK3B1OHlQ?=
 =?utf-8?B?TEh5a3dFak9sS2FlZHoyOFFBVHo1dWJEeC9wVXovdmhIU2ZsOWFuU050RVpa?=
 =?utf-8?B?UGdPeXZvcGxOMWdiV1E5T0Izb1FqUHFGMmI3TWtMSGJBZmQrSVpQaVdrYUFN?=
 =?utf-8?B?NEN3N21FYXNKVTJCQmxSem1za2dCRWs2Q0NBWVlRVDZKOElGc09sNnNMaWZ1?=
 =?utf-8?B?WURNSlNucDhsdnd6ZExQZ0RsY0JIQmNpMEhFWDU2a1RlTWFsV1dXRXNvbkNJ?=
 =?utf-8?B?MTJLL05jWUVWRG0xdTM0bDZJYmo2WEc3d1ZQSDAzbVVCdXZSZExoRGg1Y1BO?=
 =?utf-8?B?TTFXZ1pVVEQrUzhLN3F1cjhJQk5qV3NIeldSemRBblpDQU1QdWZEQ1JTNFgr?=
 =?utf-8?Q?FuLxYnSOP63cFyc/BIMbthMn8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 488d1eec-f5b9-48c6-e084-08dd3094700a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 10:00:25.0735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: klVvATbgMMbpAtBH0IPUK42syXzPM/OMc95W5HMDivvBEMYeHQWE5lITYmsqDwaSNe3wKwM3TOZqtCGkGgwgGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6883


On 09/01/2025 07:53, Bertrand Marquis wrote:
> Hi Ayan,
Hi Bertrand,
>
> This is a lot better.
> I just have some minor phrasing comments after.
>
>> On 8 Jan 2025, at 18:03, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> From: Michal Orzel <michal.orzel@amd.com>
>>
>> Add requirements for dom0less domain creation.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from -
>>
>> v1 - 1. As the dom0less domain creation requirements specifies the dt properties
>> for creating domains, it has been moved to product requirements. Product
>> requirements define the interface Xen exposes to other domains.
>>
>> 2. For the requirements which introduces new terms (like grant table, etc), I
>> have provided the definition as part of the comments.
>>
>> 3. Introduced new market requirements to specify that Xen can assign iomem and
>> irqs to domains.
>>
>> 4. The design requirements will be added later.
>>
>> v2 - 1. Rephrased the requirements as suggested.
>>
>> 2. Split the product requirements into arm64 specific and common.
>>
>> 3. The arm64 specific requirements have arm64_ prefixed to their tag names.
>>
>> 4. Grant table requirements have been dropped for now.
>>
>> 5. Added a market requirement to denote that Xen can support multiple schedulers.
>>
>> 6. Updated index.rst as we have a new file ie product-reqs/reqs.rst.
>>
>> V3 - 1. Removed duplicate mention for 'Rationale'.
>>
>> 2. Fixed some of the descriptions as per the review comments.
>>
>> docs/fusa/reqs/index.rst                   |   1 +
>> docs/fusa/reqs/market-reqs/reqs.rst        |  31 ++++
>> docs/fusa/reqs/product-reqs/arm64/reqs.rst | 128 ++++++++++++++++-
>> docs/fusa/reqs/product-reqs/reqs.rst       | 160 +++++++++++++++++++++
>> 4 files changed, 318 insertions(+), 2 deletions(-)
>> create mode 100644 docs/fusa/reqs/product-reqs/reqs.rst
>>
>> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
>> index 8a4dae6fb2..1088a51d52 100644
>> --- a/docs/fusa/reqs/index.rst
>> +++ b/docs/fusa/reqs/index.rst
>> @@ -8,6 +8,7 @@ Requirements documentation
>>
>>     intro
>>     market-reqs/reqs
>> +   product-reqs/reqs
>>     product-reqs/arm64/reqs
>>     design-reqs/arm64/generic-timer
>>     design-reqs/arm64/sbsa-uart
>> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
>> index f456788d96..39b2714237 100644
>> --- a/docs/fusa/reqs/market-reqs/reqs.rst
>> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
>> @@ -47,3 +47,34 @@ Comments:
>>
>> Needs:
>>   - XenProd
>> +
>> +Static VM definition
>> +--------------------
>> +
>> +`XenMkt~static_vm_definition~1`
>> +
>> +Description:
>> +Xen shall support assigning peripherals to various domains.
> "various" here could be removed or replaced with "a domain" to be coherent with
> the phrasing after.
I agree
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Peripheral implies an iomem (input output memory) and/or interrupts.
>> +
>> +Needs:
>> + - XenProd
>> +
>> +Multiple schedulers
>> +-------------------
>> +
>> +`XenMkt~multiple_schedulers~1`
>> +
>> +Description:
>> +Xen shall provide different ways of scheduling virtual cpus onto physical cpus.
> different here is a bit imprecise.
> how about:
> Xen shall have configurable scheduling strategies of virtual cpus onto physical cpus.

looks fine to me.

Are you ok to give your R-b ? Then I can request Michal to fix them on 
commit.

- Ayan

>
> The rest looks good.
>
> Cheers
> Bertrand
>

