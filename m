Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFB4A5F036
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 11:04:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911802.1318197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsfQQ-0007R8-N0; Thu, 13 Mar 2025 10:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911802.1318197; Thu, 13 Mar 2025 10:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsfQQ-0007PG-KE; Thu, 13 Mar 2025 10:04:26 +0000
Received: by outflank-mailman (input) for mailman id 911802;
 Thu, 13 Mar 2025 10:04:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a6QA=WA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tsfQO-0007PA-Ti
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 10:04:24 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20607.outbound.protection.outlook.com
 [2a01:111:f403:2406::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8976ec12-fff2-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 11:04:22 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BN7PPF8FCE094C0.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 10:04:17 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 10:04:17 +0000
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
X-Inumbo-ID: 8976ec12-fff2-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMWqMAoquWBu7eP/k0+R5T5Z8XzzjbqYs/qMcTE1udPbBXL4X9G4J8WUoDU6PLWRF79FYT7ngB90HRyTQmRIgyu/OAAsYvOn2kPfXukoe1/c5kL0kWL9ehS0ZLXNH7lvHdPmf2kINdVAWPC6GF5K5z8+1ZitBcZpQ20c2W/TiiXMHQ/ir/socIs9pDrfzOOLHpQp4YsPeOrshLhGx41CKM0lw7qDXo9HzJAyT/rKnsh8hYMMsjypFPiNpke6P4TqOi6s+UgKuBADEtyZexttIEErrMJHWwU/O0BKYU2kg7ShwbGaNHgbARTYHf2AwoPUrH1kLE+a4Tcp0VubNB9iMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bwfNq62fClrcctu2qzFN2pIWgGzk5osp6y6onnH/FA=;
 b=UeY/SpnKJX9VNCDq8297KybN89Y+J3Ad7Dt0caXwMrwgbyl585z6QJtcuE6tkHd04JrhS0yDeQylmRZzRlJAbrzC18IfMaTY5j0Co0T4d/wMXprQnmfIXPZsI8C4emI+2vRhrhayOSsa14/m5ADot7KtrLURQuJPBZermV351X2z1zeNpjb2rXeYB3bKPgXBP7rcDfgpcQUwNfkUVZUJM/sVqSOxJFMHNC+54nhvb/mFw73CHLltgwS6Wl4AUPy6+icyA8+v8oIC/t7I8+v/XURC0CZ4Zlw7GTUWeXbz1RVm3xc12Iq0QvRSLzYNX1v2UEnIXzW19wt5DZK5ACDLMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bwfNq62fClrcctu2qzFN2pIWgGzk5osp6y6onnH/FA=;
 b=Qqp6UIBiizciijSZ3rWQEhp1MAWDF33M2mdKIZW5+uF+1ad4HM4KFZBHVKdCkU/vCQGdP+wycYYsijrPC6N1TjIw+mc9fZg9FV5mqB0bgPJEs6JDJnfNbLsQem9JzeUCJjyES5e3cMMQoKtgXUgBcvJXkOTQ0bvFvjc54EnJv20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <db103ce9-091c-4bff-807f-38155ef1b3ca@amd.com>
Date: Thu, 13 Mar 2025 11:04:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] arm/mpu: Implement stubs for ioremap_attr on MPU
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-8-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250312135258.1815706-8-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|BN7PPF8FCE094C0:EE_
X-MS-Office365-Filtering-Correlation-Id: d052746a-0cac-4a4f-049b-08dd62166abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWpMN1Q4MloyelNkSUdsVVRvOUsra2VBb0dMQXQxTzI5ZWl2ZmdxT1VCT1BQ?=
 =?utf-8?B?WmZXZ2lIbm9uZDlmT2FNLzhtcEVpV3BQQjVzT0hTeElPVHZiOTZ5Qi9QQk9T?=
 =?utf-8?B?dkExbHNHZHNtZ2RTdVR1Lys3YUp0UUEwRDdGekQ3N1UrWG5Ta0RDcW5udjMy?=
 =?utf-8?B?RndxRmxpbk1RS0U2OXJlNHprNFdHbG5Ed3JISk1jQThDbjZKZkxwbk5PeGdR?=
 =?utf-8?B?VHdGSlJOeE93aWs4VWxVL1o5R1JyNHphdUc5RXFMSi9DZDVYcFh3YzNVV3lw?=
 =?utf-8?B?WE9aZW16UUYvelJJZXhweGsyZktHaEErOXNuTXlOeDY1RS84T0VwN3YrWTdF?=
 =?utf-8?B?S0hQYk9NaWdoMGgrRk8rcTlhRUlIc1F1WHQ0V0NCYlNyK1NNeFBKUjRtQVgv?=
 =?utf-8?B?TElrbjNtZUpLc1c3bUR6WksvTzdJTjFIWjM3WG9qRHBMSFBOWjBydnpUTmxK?=
 =?utf-8?B?azNwa0FnQzNscmtYNExOM3A0bjZCcGdDZHpUUFRadnlJdlF3N1E3ZHBJT1Vo?=
 =?utf-8?B?QWtuQm84MzBLNVlwbUdETDVJdngwZkJrK21IaUpVS0p2cDdXemxocWZtKzZu?=
 =?utf-8?B?NE5ZUlFCTXVaWElmL3V5LzM2Zy9YVXBTZ1VJYVZ5eHhpd3NqeUZrR05qd21m?=
 =?utf-8?B?L2ptc1haOWxsUkJNSTFqV3ZDVHpmTHZvTjIzRWpjd0FHb0R4YmRTYzhRZ0t6?=
 =?utf-8?B?WThxenIyUDJHMEZrSC90NXN5M1hCWFNxKyt3NEkvNDk1Mjk1Tk5neUd0dW5D?=
 =?utf-8?B?c3YyM3FJcmdRelhzY29rL08xaFZMQXBpTHdVdkdxeE1Eb1R3RHVtWHdoZ0ll?=
 =?utf-8?B?SlhJVFRLM1R2cUk3eTdRYnZINlhWUEFaNHVVclY2Y0pJNkpCOEZ3SENmTkN4?=
 =?utf-8?B?Z01QVHhBV1d6N05tc0JGZTIwaWhlSGw5Q2FiL3Q5V0V3QXMyblNtSUJlRzJx?=
 =?utf-8?B?OHJOY3pZa0lMVkc2dG1Tc01aZ2pDUjBlcnoyUjhmcFdrczdkRVhQRXRXbHdO?=
 =?utf-8?B?VUdydVAzWmNNVmpKMDYrODA5VUc4Q3JuUlNZb0RURzlyUlNuVWZyemdxWmVT?=
 =?utf-8?B?YWRiOTFKM01rMUgvRTlBRkdZSk9zVGl2T1ByS3IreEpOaU00cTRIVWc2NitD?=
 =?utf-8?B?alMxanMzR01FeGpwemFBYmpwWW1sQzkzWkFqNUorcmtwL1pVcjFtK0hBSEZx?=
 =?utf-8?B?bk41TFlIUUxURlI0RUhhdDdJTVJpU1ppMlpyMUxUd3N4YXExd1dOdWp3UEdq?=
 =?utf-8?B?RjFFVlROdlg1ZXdTbW1Mb25FUVEwa1NkN0VPTktjaDUyZW5JTStKMTNjbVF3?=
 =?utf-8?B?emxJcjdGcXVOQkErL3pCSTF3UGNOUFE2QTZCcU0rdVMyei9ITjVZemxxSDM2?=
 =?utf-8?B?Mm1SbUZMUStWVS80dDllMUdDdVVaT1lmQmc3RkVRMTFkaVBVa2JsazVTdUoz?=
 =?utf-8?B?bnF0RXg0NHhDU1hqYm92UnBJN0owWjhBRlNwdUlaNTBwdW0zbUNDbk9jZldI?=
 =?utf-8?B?T2dpU2xzYnh4UDNWZVBKOCtmVkZBZFEzMWY2bUV1T3VOenl5MlhlRmJSaDlY?=
 =?utf-8?B?b1NxTktLVlN5YzhKdGhWTWpxQWMzaHYzNFBZd2NYTCtuT253VU42QUxQd1RQ?=
 =?utf-8?B?dUF4TnpZRExqd3lTbUFuSGlqa3hKc0lLM3N4dWg3QW9NV0JuWFBSNWx3b2hh?=
 =?utf-8?B?V3ZocUR2MmJrL1M3TjJRVHFMSTJiQ0ZNcTFad2gvbHhkYjVFU3RweU5JSkxM?=
 =?utf-8?B?UG9uTStXeXh1ZGFrek9WU1ZYbHUwQUFMMTJyblhXczErcTVad05xdVp4RXRt?=
 =?utf-8?B?OWFyWVdHdHY0SkNkK0dGd1ovbWlyRzJ3RFpnbnd1ZnZ0eXVpN0l4Qm5tM0k3?=
 =?utf-8?Q?Qya01tiO8xd4U?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzUvZ3B1VkJHWE9WL3liZ3VPbUZCMUdUVTB2SkpBc1pSSmdndFUxUnM1SzRr?=
 =?utf-8?B?WXJDc1IzSU9yTjlGa1ZzK0h0OWNJdVR1dnY0WEtXUVUvWFd0U1cveDRrd0dk?=
 =?utf-8?B?SXJxOEMwc0JYbFkrNWV1b1RlODNRWGEyQ2dnNHBBNWdvb1ZzK1FKeXpkRDRn?=
 =?utf-8?B?cmhCNEIyL2lYeHFjbHpTQk9BcXZ4YjJRMFBaVWdLcmFHQ3B4REl6MU9ERzVr?=
 =?utf-8?B?UUY5MlQzbE9MSjJ4L3IwYTlpUThoWkVaSkFqL0NlNTh0eDJWUlBvbXBjRW1E?=
 =?utf-8?B?TnE4UDJFT3V5aGNkbzN4ek5FQWdyWXd4TS9mWjU4b0RNK09rVUtmQ2FGc3dx?=
 =?utf-8?B?YzBXTUlXc0ZxNEFad0svTEl4WDFrYXlESmpvTUZKVWQ2amZ0TU5QTEZvUTl3?=
 =?utf-8?B?dVZOYk9CckRIbFl4dXJMOVZuaGVKZHFVak5LWjBmSHQzOTBuQ3Y2c1VvK25L?=
 =?utf-8?B?TGJYeUNtckZYWWxJRTUzenhxREZOVmhoMzkzekw0SWs3K2ltZ2VNRlFkTHFY?=
 =?utf-8?B?ck1lTDcvUVBMZFo4aGF2TitSRCtMVE0wL0xaQUxxcXBQdGRQVmdBL2ZMei9z?=
 =?utf-8?B?a1Q0dWVUbmxqN1pXZ3VMVldiNGJ1dkZ2UGV0ajlzNVdHOTVjQmpqZXJlcWU0?=
 =?utf-8?B?SlViQzdma2xvSWV6Q1lMM01LaTkvYURmVEQwaHpuTXozV0V6bUdpYWFLNGRi?=
 =?utf-8?B?dzdFVkkzKytUT2dVUUtTNkpoQmtXYTZrbHBmUWtrdFlBS2ZKeHA4THZ4emlY?=
 =?utf-8?B?a2hHbFcvck1UUFFiVTZ5c3drU0FDS2NhdHNEYW44L3pLYmFHcnAxMmpsV1pt?=
 =?utf-8?B?bTJtSE9IbkR0TVpweU5kSVNBbm5pYUdNdUVEby9NMFVsK2FZK3pjUmlMdSsy?=
 =?utf-8?B?SnZ0MGVLYzZ5WmtJbXlUSnhRSVZjTkt6U2FFckhaV2V2VGV1R3hzMjNxZGJa?=
 =?utf-8?B?bTd1NEdOZ0sxYm12RUlhZlUvUVJiNGVORThYYWJERmx3eDVXMmZWL3FMQlRL?=
 =?utf-8?B?UmJZdGx5RnY5R3FIbnBhYlEzZXlZMUkyc1owR3BDdjRtYUJRRlk1ZVZOZDZw?=
 =?utf-8?B?TTBMRE11VVRXb3h4Mmk0OVNMNWdGbVE0RTdSTko3TmlFMjlQSUE0emVUYTN1?=
 =?utf-8?B?MHZ5cm01bno4YVpBR1c3QWdsVUphSU5iS09jMGFIbjVlMUlxLzhrZDBQU3Ex?=
 =?utf-8?B?M3psenJkQ0pnWFRabE1PQnowOW5XQ0IwTW5JRGlFZTBlWTAvNFV5MzBFMVFp?=
 =?utf-8?B?M01aWHZXYllYODh1cEZrZ2FGcXhhY0JSandBU2Z1UFgxanZxSzdxdW00TTNu?=
 =?utf-8?B?MGpRWmhRbWhjNjFxYmdwRFBITVRFRlJ3bzUxQ0VoM1doWit3UzFzNVdEeGZr?=
 =?utf-8?B?ajlnKzg1YzM4dllaZW82WSs4RVF1aXlPTkdTclFPM1pLWlQxVmo3V1R2dWRM?=
 =?utf-8?B?WWdzVzgrclNMYzFiclNTR0Erb3JUVEg5VnFJb0VYRlhxclVKdXFKL3c5aXRC?=
 =?utf-8?B?N0trNlJsLy9NQmxqSXBZQUFsM1ozazBnclVEMVlpNFh4SlBZZFpETUJZTXpu?=
 =?utf-8?B?cmFDUHZ0VW9lN01LOWdxYmZ3RjRIQTVGbjZrWG9aWjZJY2pFS1JHMGhNL2xL?=
 =?utf-8?B?bDlwS0ljemxia09tc0dwTnhLcnViUyt4TCtJcm5FM1FWeHVBRkR1Wnl2SGdu?=
 =?utf-8?B?VmpmRG1hcnFHbmx1emFOUXVIcHVVc3NIMUg1eG80UitXa0tYNlNyTExkdFhO?=
 =?utf-8?B?RWlLeGpTbExkSzA4Y2N5OXlvWjJVNjFacjBoUWlQYVAySVNjbFdJWjRpSFVx?=
 =?utf-8?B?WkI3S0RJcncwRThPdjVVTFF2ZTAvVERhRERQUUdTbFFxa1dUNUFtTWtzV0Rj?=
 =?utf-8?B?Uk0ySDFjNnl4MGx6dUFwbXQyblpTc2ZBNFROQ3Zib1QrSmF3azBLWkFsS2NG?=
 =?utf-8?B?T3QrZGJWQU85K29VMVl0dHZQVE1ON0kzN2tSN0dvSUJoRUJTWUt4SVNIbVFi?=
 =?utf-8?B?UHBBL2trMWYwdUJpeVVFRFZTenRlOGNNMkFTRlkzbERmZUNzTmd3YnZxeGgy?=
 =?utf-8?B?d2lIMmluYnU2Z1g1MStCeHkvTDA0WHAyL1JvMEhRZisvSHgyYVFZcVFjclBo?=
 =?utf-8?Q?77rc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d052746a-0cac-4a4f-049b-08dd62166abb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 10:04:17.8110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uo1mDymzd4ip1WdbFzg/MpNp7ILmVgiZY0NOlF05oebsm+FNmCSUIFNIHZKiEG79
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF8FCE094C0



On 12/03/2025 14:52, Luca Fancellu wrote:
> 
> 
> Implement ioremap_attr() stub for MPU system; the
> implementation of ioremap() is the same between MMU
> and MPU system, and it relies on ioremap_attr(), so
> move the definition from mmu/pt.c to arm/mm.c.
I could see this bundled with the last patch, but as you already split it.

> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


