Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C79C4962A9D
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 16:44:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784926.1194341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjJuM-0002H3-3J; Wed, 28 Aug 2024 14:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784926.1194341; Wed, 28 Aug 2024 14:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjJuM-0002Ei-0V; Wed, 28 Aug 2024 14:44:26 +0000
Received: by outflank-mailman (input) for mailman id 784926;
 Wed, 28 Aug 2024 14:44:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=28yR=P3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sjJuK-0002EZ-MI
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 14:44:24 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02fa4a33-654c-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 16:44:22 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CH2PR12MB4167.namprd12.prod.outlook.com (2603:10b6:610:7a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 28 Aug
 2024 14:44:18 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 14:44:18 +0000
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
X-Inumbo-ID: 02fa4a33-654c-11ef-99a0-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uO7ibVPqqnX2+cS37HiNxEnecc5sA9oWJtMGdhSUJAMbPHfUhF7k5HqCAbdc7E28ptWqDIoGBOa2QGV7lgnqk7J4SUAGEPJ9Ji1PBaDaBuOD4BzzUoGVxCCxNOlnTbvFe6AG0wtRo8MXh5u5UNvEu+X6/mok2S2RJnHae0aAi9f2NqZOCKnndzFoJVHp4Lmcv6h90DZXIq9XxdxSebNWYTm4o2LsA3t7C5qfYZ4dq2q1WRIiVZMs/WLYTLy+7Le9nD+8L7oNPr9j+jm4lBU1DpHjqNypmhCB4sXGFXD7f2+1XmvyKqaMPiSFfKgoMvs+BD3BqILZ1lPq1FRau4SZ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57kOUV1e3r30yTAw2PXgm+rGElW+7eDATI09QVN1qB4=;
 b=fOslr9mZVYRF4owRP6OwxdN4bg2ukKZjuMD6qCMJlzObaaxBxanqckB9i4WyLQrzicpqt8sNm5YNF0/uJUuM8f9F8gNl1D//wgL23jHEO3+QH9SfWHi8THrL/3y4aL2xzbAjqndS+d8+TKX+vKEUsbOjNpQzt5yMNLF1J08PngT0gSzSb6RiEXiAFqQhH5R9HoVwVnA96AeWihFob0axFXpxAYNnBJEng4m/3MHWN3a79YezFKTZQgxynjN3CURMX/KiDCmA0pPx4terwQwuoCnpU4GUHzECx5JpJB4jYbvOWMMDxE0DR6zQeXVbOoZGrm5PsX8fU0v0NiqHqiMeSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57kOUV1e3r30yTAw2PXgm+rGElW+7eDATI09QVN1qB4=;
 b=Wp5P3wFaJF2jswSjTT4+RSUmr+IwQ25PV4g6rkUkdvva/svnbdfdHo8sZxGYn/EyGwQoWHTZ3aikNRJ65FsmCWXKzF+gMbTW01rej7ERmTTSN2vDGgV1wD54Fy7PO7F78rl/IFlJSQIjiFVMoO7T6qQh5UzQlxUediMGK2/8iXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <afada706-86b5-4093-8574-bfdc06aed639@amd.com>
Date: Wed, 28 Aug 2024 15:44:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] xen/arm: mpu: Introduce choice between MMU and MPU
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
 <20240823163127.3443404-2-ayan.kumar.halder@amd.com>
 <fca5e0dd-5f71-4286-909b-db14551aa15a@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <fca5e0dd-5f71-4286-909b-db14551aa15a@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0601.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::21) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CH2PR12MB4167:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dc8d6c0-bd56-420a-0046-08dcc76fe53d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXhtV2pYSTNTM2Z2RDExMHFRd1kwbDY3UStXbFlKdGNES2JVUVNwTGlIZlNu?=
 =?utf-8?B?SWxsQ295MzlhNUIxL0JDMDFmZDNrVU92Mm95ZitCQXU5eTNmZkNOc0hnT3Jh?=
 =?utf-8?B?eWJpai9HNFhxVkpvQ0hiUmkvQndlbzVQYmU0QXdaeXVmdllxSUN0STg4YkxT?=
 =?utf-8?B?MEl1YURiRlc0SC9vajJzVjc4RWovWkdRMVoyNEdtZ01RQ2VocDQxMHNzcUdi?=
 =?utf-8?B?UDYxb1NrSEJVc3FhNStGMWxtRXc0eE40MEtGSytFREliZFJ5QkZWcHMvNk5I?=
 =?utf-8?B?R2NROFI1SE1EcW95YkJGMjd3YWdMRytwMXhXVnpZRU96RmNPZVQwOTJvVFdP?=
 =?utf-8?B?NjFwdmhBdlRBdGMyS0VCREhETWxzWmFvREhlb2dXZmg3M0lCckExVXZ0WmNQ?=
 =?utf-8?B?R1Q2SW93ZnY0b212bmVJTFlSYnMwa1ZBcUswaWE1TFRvQVhsb2RDVVU0NWRP?=
 =?utf-8?B?M0NrcVNkREdkZVNpM3c4OEtvWVZlUi8wbWFUTVFkL093Z3NZMkRnbGFuejJR?=
 =?utf-8?B?VCtqSExYd1k5ZVI5TGZnMTlPcnEveFUrdG0rdjgzY2NvdVh3UVUxZ2FPVTJE?=
 =?utf-8?B?YUFDNzRFSXJmM2FiZWhTV3dxL0FrcmJaa3RIdHA3ZnhoVjNtbVNpOWo3SWlK?=
 =?utf-8?B?cnhyb1cwaEF1UEV4RE5hWEp0VHhDdUV2eWx2NnY2YjhZTTF0UmlKOFd2UE4w?=
 =?utf-8?B?a3hUZ2pGYUd1SURiQlVkbzdZRG5ueS80WHFXTElCeTBrdTRkRDZlU3JGNE5O?=
 =?utf-8?B?dWdTU25sSjFYSmRQSVkvWVZUTnRJaWhyTmp3MXJmMWVtbHF6bHYrQkcwQ1lH?=
 =?utf-8?B?MWlIWnRpL2hmSXJhaVBURTUwdFkxblh4dFJBbEMvNk81dzNMbWtmbnArR1lJ?=
 =?utf-8?B?aEVETStaWlhoRGVQa0UyWDN1THJSaFNKMXJtRzVvbzVQVWl6a0VuanJkZVRW?=
 =?utf-8?B?dnZiZlBOUG5SRXZjSXpFSkZZOFNzalR2VkxwZjY3SmEyYklCeXdIck14RS9J?=
 =?utf-8?B?eVF2Ums5SDUxejM1by9tZGZXOWFaWjVuQUQ5cjZTdFdtQ2dTMmE5MzVOWHRa?=
 =?utf-8?B?QzFlQlRRTTk1QWl0YXBuRkN2anJzVGRBMzNpU2tDYytvS1luU3ZnbFMwS3pC?=
 =?utf-8?B?WVpKc1ZWb1Z1MFRCekh2QUFrUEt0SGNVdFRPWXlJbXJjNEdvT1llRHRlY3RS?=
 =?utf-8?B?Q3pVVXJYZnk1TzVvN3BScmZ1RUN0ejdyd2t6TU5IQzRmUk5SdkRLbWtlT3Ja?=
 =?utf-8?B?aUw2V2c5Yk56cjB3VGo3RVY4TjIvWm1mVTZ5NEhkQWZqcm5XWXkwalNuNllv?=
 =?utf-8?B?VXVLUkZJbENEdXlibWtjNTYySWV5QlNCY2JFeVpMRlZsaG5aT05ZWFRUMUtX?=
 =?utf-8?B?a0t1OHRRSEFTRXlUOE1kaE4vdnJ0TlcvZVhsMGhhNkJhZkhqY2RjZS8rUnFZ?=
 =?utf-8?B?VGtCZTBrRkwwRHNYb3VBYXJoRnBXVFdIMWkyVDNGak1SdkNWQUdlbk9kYy9F?=
 =?utf-8?B?MUl5VTdKV1NXMm16SG1tdy8zRjlRVExDeWVJZEZSWkVDbWREWmZ2UjlWaXVi?=
 =?utf-8?B?RFBQUXVTODA1aDE4a1lLdEIrb3dWTm5POXBUSWswZGRKVVpGK2k0TlA3Q3RZ?=
 =?utf-8?B?OXFOQkxrVVFGOWpLZXhTSmFEb2d3RXh5TkhZL3JjUFB0R2txOWZ3SDJSTHoz?=
 =?utf-8?B?MC81QzVka1RkMWtNa3dTaWFCQXAzS29teXA1c1llUjFoRlFRWnBma3R1TnV2?=
 =?utf-8?B?NFpaTnRKdnNqQnhsaFdZVTM2OUZHcWowYW1ZNzlXNEpKY2F3T1NwYWppMEtN?=
 =?utf-8?B?TDRwQ0NSTmxNS0x4UUJBQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Kzk1MWlsM0U1RFI3M2dVQWV5RWRXWDJKNlZTdjNGaXZxYnBRcnJldkJKMVJu?=
 =?utf-8?B?d1VYNCtWZkJOTld4UGdPc2lNQzBHK2JHM2xPdHJjSklBeWNheVhZWHFkRkRZ?=
 =?utf-8?B?N3dzclVqMWZSMGltZkVoMzhiREJDRk1uUURFUUZaMys3eE9BeERhdkNNYzBk?=
 =?utf-8?B?cUtEOGVQSUN6ZGY5NFY0WWFYWmliQ3BoMHpnN0xkc2dJZEdsSVNEYjFHUGZW?=
 =?utf-8?B?K2tmVytkakxTOHI2SVJGc2ZhUjYyTU1ETUFJT3pOWWtUZ0NydDFFVFRnRVdB?=
 =?utf-8?B?SlFkL0EvalNxOTB3R21XK1E4bk5XTkpwQllkUjF6YVp1b2FTQlVWVWpyK3Nv?=
 =?utf-8?B?TXNnV3ZSeTFiQzNVeVZXWVk5a0Nid3RWWXNTY1hpWFFSMjFab2VRZFdXaGZ5?=
 =?utf-8?B?OEFEZlhCU2h5OGpmQm9RYTlsZ1FsNkEvdVBRVTI4c0xiN3JCMFRZS1VMbHpE?=
 =?utf-8?B?SVpJMFA4VTk3T3hrQXZrWTgremhhM0I5cXVKcXZQb0RpSmdIQ2tEdk1MeStk?=
 =?utf-8?B?YjlUbG50R1A4a0NKTDAvV0FvdkxuWFZRVUUwZGRYV1RxSDI5aFc5TFlZWE50?=
 =?utf-8?B?S3M1TTA1TjB4WTlzdHhrZFh0ZWhQUnNZSEkrRlRlTWRSZmx1eUNsSlZ3a2Z6?=
 =?utf-8?B?Vk03SS9tYVJnOUdPS0RWY0xiU2V5Ym5QU002S3k4K3VQbDFOQ0FhUEFnZzQy?=
 =?utf-8?B?R3U3UWk4UHFkanFwT004TStqT252L0ZoV3p5QjlyUHNPblVaSVh4NHVMb0lq?=
 =?utf-8?B?SU56SDNabklOMTFGWldZZXZJU0dua21sUFRtL2ZiaVI0WFBBU25GMDNTQStG?=
 =?utf-8?B?V3pmaGJ6eGI4OTQ1NHpaV0kzaEl0SjRZZEdnb0NLaldIbE9KM0UxL0NRMkp4?=
 =?utf-8?B?dmtoQ0hsK044bzdORUwvcVFhVHVCQ0txZVUxSWVJUVlwcmlLYmNlbExtR25s?=
 =?utf-8?B?Q0g1OTk0Mzg1eDA2S0dkSzQvYkRlVk05UGVxR1p6c2ZLemtZYVEwTFdhL2t0?=
 =?utf-8?B?YTh5Ky9NbS9ZK29laTNqdW9Ya0NqOWx6d1BETjJNUmhneVN5bGR4djN2enNu?=
 =?utf-8?B?ZXVFS0FZN1BjUUxublZBTjlqSTJBbWV1R3BUYzdSc05BbFZNTDllMkZGaTVK?=
 =?utf-8?B?QXBkSmtqRHpERndNUStlOVFjOWdoOFRNY2ZnUWdSS1RUdmt1Nkxxd0JSdWlu?=
 =?utf-8?B?VERFYWFXYkpJc2MvK2FaNWJEQnFycDJPVjRtc2hNZ01aQUlGMTBYRyt0d2RK?=
 =?utf-8?B?U0l4K1ZzQ01WOHpxT09kYXN2UCs2S0l5RTFDRURJZktFcUtxdHA5OHZZeTgz?=
 =?utf-8?B?Yk1ES3VCdmIzWEJJNC9oWkJ6TkgwQU8wUzhBZ0MrOGllS2FEaUFNMXRlcHlD?=
 =?utf-8?B?RVR5QUd1eFZIejM4a3hud3NpelRtNVlBVmZKcm5saUx6Y3lJZDJFOExrck1B?=
 =?utf-8?B?M0FzQTMzVlE0MXBHSkNxMVNPMDlneUpUNEFqU0tkaEM2eXN4cVlEY29xZ3d1?=
 =?utf-8?B?eDJyeS95aFliaUxIYWZGYW93SjZjeEoxaTRUb2dGM0Jka2thU2JsQmVKZVFa?=
 =?utf-8?B?UWVMNkNscjdlQkNESkw0T2dXaW8reFZPQU82dXdLejNVdlp2cFh6b0RHM2gx?=
 =?utf-8?B?a0dKTXJLbkJsWm83OVh0cDM1TWV6MXlCWU9rZGl6cVZ6Ykt6eDdKSjdRUUxB?=
 =?utf-8?B?eXFDRWZCSC9EYTdhNUZCSnVLeGhxWmZoN1VUU2NEdTVvbEJFbmxJMWluMkgr?=
 =?utf-8?B?MlJyWEFiUFBwTEkrR2hGaEQ3aFhVNmJmUnVWTTh0cEFOdFh1cFQ1Mk1HNmtG?=
 =?utf-8?B?WVk3RTZuR0RvZ202b1hvc3JKU0trams3MGVURHdTeDhmM3JNMDUwRVBmK3dI?=
 =?utf-8?B?ZDlMckdpbUloT1d5cmVaOFRtTCsvak9sOWQ1eVlGc1NhYzBsQTJ5K2RvRXFo?=
 =?utf-8?B?MFpIOFZLbzI3NUk2UXdYNFZRMEF1OFlJT2ZnS1R2V3BtbkhvejdzV0pPZmpD?=
 =?utf-8?B?M0pjWlplK04wOVhRTi9SNGxCSENUNkMzNmFDeFNxRWhna3pmRDRvVDgwN2dF?=
 =?utf-8?B?WEx1TW90WitGMmxVTmF3RGp4Z1YwR3pYQ0tnSkRSNzF2V3huSHBvWGtLVTdl?=
 =?utf-8?Q?xESXSCqHsYV7pAAMhbgP/mDLF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc8d6c0-bd56-420a-0046-08dcc76fe53d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 14:44:18.4185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zr9OzXNkQ7pRlVCVfAdZz7zqNKdVY7I2Pk0Vg1FIUnq3S5z8HyRngnb9k1/A2SdtefB8Ke+B9tZp9FH2l7u0lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4167


On 27/08/2024 11:37, Julien Grall wrote:
> Hi,
Hi Julien,
>
> On 23/08/2024 17:31, Ayan Kumar Halder wrote:
>> There are features in the forthcoming patches which are dependent on
>> MPU. For eg fixed start address.
>> Also, some of the Xen features (eg STATIC_MEMORY) will be selected
>> by the MPU configuration.
>>
>> Thus, this patch introduces a choice between MMU and MPU for the type
>> of memory management system. By default, MMU is selected.
>> All the current platforms are now made dependent on MMU.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>   xen/arch/arm/Kconfig           | 17 ++++++++++++++++-
>>   xen/arch/arm/platforms/Kconfig |  2 +-
>>   2 files changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 323c967361..686948cefd 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -58,10 +58,25 @@ config PADDR_BITS
>>       default 40 if ARM_PA_BITS_40
>>       default 48 if ARM_64
>>   +choice
>> +    prompt "Memory management system"
>> +    default MMU if ARM
>> +    help
>> +      User can choose between the different forms of memory 
>> management system.
>> +      Most of the Arm based systems support MMU.
>
> I feel this is quite subjective. So I would drop it.
Agreed.
>
>> +
>>   config MMU
>> -    def_bool y
>> +    bool "MMU"
>>       select HAS_PMAP
>>       select HAS_VMAP
>> +    help
>> +      Memory management unit is supported on most Arm based systems.
>
> For this case, I would write "Select it you are plan to run Xen on 
> Armv7-A or Armv8-A".
Ack.
>
>
>> +
>> +config MPU
>> +    bool "MPU"
>
> I think it should be gated by UNSUPPORTED. SUPPORT.md also needs to be 
> updated.
Ack.
>
>> +    help
>> +      Memory protection unit is supported on some Cortex-R systems.
>
> Why do you make this specific to Cortex-R? Shouldn't this instead be 
> Armv8-R?

Yes, you are correct. It should be Armv8-R. Otherwise, someone might 
think it is applicable for Cortex-R5, R7, etc.

- Ayan


