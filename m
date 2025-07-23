Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0BAB0F072
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 12:55:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053755.1422558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueX7X-0003BV-LQ; Wed, 23 Jul 2025 10:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053755.1422558; Wed, 23 Jul 2025 10:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueX7X-00038g-IT; Wed, 23 Jul 2025 10:54:47 +0000
Received: by outflank-mailman (input) for mailman id 1053755;
 Wed, 23 Jul 2025 10:54:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9doN=2E=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ueX7W-00038a-P6
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 10:54:46 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20616.outbound.protection.outlook.com
 [2a01:111:f403:2415::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70c34bd4-67b3-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 12:54:44 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SJ0PR12MB6832.namprd12.prod.outlook.com (2603:10b6:a03:47e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Wed, 23 Jul
 2025 10:54:37 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Wed, 23 Jul 2025
 10:54:37 +0000
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
X-Inumbo-ID: 70c34bd4-67b3-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yxr+2jjcqDFFlEvm6qYC7Ub8SfQcsnRO317oZC6yW18SmY9bPwDxaXHfFgw+V+dixXmcog2jkPkrcNgD1DfLpHHFn/yKwvbBbBI0FIh8Ih5Z7n35aefVf7Mtg1G8zhrfaP7opw3ASX9UxJDodr6xMueO8AaBe4Jb9qGg3UkeFQIskMoQbS62EkKInpBvZb8MlsQfddUlo1utLR7c5pBBMBryVUCYUCJ2gn6ekjZ5OfUdETvPI+vnzZ1rzU56jY0RM1gm7yxmlFoOhD0W97W+NHrFhmy4hCvxItq8ESfSRwsiBncDCWriMgstKoW69OilvHNQIdO7r97w5wwcguxtKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+gNwO6H/vt17BBzvCaioGgmk6M9mlwCR7gOzbceoss=;
 b=JgI5nKe57B/pjiNJ1bbqwy/jw/TDDHuJChhG9skVzbJyj+5BjgGy0fDec/YYZnwfHOxNbBqdByzg60U9ltuBZ8qlQSLxMLF5trA9T+JjM2DT+Af86y2PGMOAR6d+wD2ufpDC9vteDuNEzlSMGxjZTNG9RZCE6rYRiVgUSab6da2IC8zD8kHbIq96t/ikYUoQHvWUIPuEzaPdG60CnKrcOVtD+xgzYYWdgPPhF4qaCGvG2wLOO1hYYc/EcGOk6WvZxYd6wDM5KbZPlVoUjvIKtYXieOeq1BxJ4O98K3qG1fGwcZjT9WWSaLf1xcJrrlEVScntVb/aAUVbIi2PY41YTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+gNwO6H/vt17BBzvCaioGgmk6M9mlwCR7gOzbceoss=;
 b=If5QeX3tCNr1A8IVvP5aUDV1G3MM1/wXGot6cWa29I3FLnFdcZywObDiX8UB6M193z8Gw2IWTdafheikaJsqVB9SP0hn9CKXPqScweG2WBcPg2NGV6S5Afq1cZweQKHGupPGzRhUxdCrpta2t20LdV7gU5Jcc1BNydxyRr7hRjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e35822cc-d8a0-49c1-a4b1-2765e0e6cb6c@amd.com>
Date: Wed, 23 Jul 2025 12:54:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 0/8] xen/arm64: make aarch32 support optional
To: Julien Grall <julien@xen.org>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
 <b968715b-20e5-4a63-8ad3-d4250e796c5d@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <b968715b-20e5-4a63-8ad3-d4250e796c5d@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::10) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SJ0PR12MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: a91d43d1-c630-47e7-a01b-08ddc9d75117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VktDbSsvUW1DeEsxZ1lxMW40Vlc0bjIzM0ZhQTQ4blJmSllTbDkzbDRCUFl4?=
 =?utf-8?B?TnBhNk9JSS9Va0kvRHhlaFBEc0J2QUF0UVUvZTliRGhsS3lUTHJRSlBKdHVW?=
 =?utf-8?B?Q3hhMU9OSEpNakRKTTNKaWpUbTc0RERUTHRqWVMyYVZIZ2JleldCekxaRzRU?=
 =?utf-8?B?YUxkUCtEeldVOWVpMFpoVkJTZmRiY2hMWk1qN2FQVmNmR2Y0WEpkY05jNHJi?=
 =?utf-8?B?cndFdjFKQUUzMWsrNDdHN2dPZUVIaWdpNDgwSHhlaDkrTUpOcWtYaFZrWW9j?=
 =?utf-8?B?U3h2aThZeTY0aDJrK1VvOUNiNU1yNEdVQzlFeUluMWpsaVJYRnorK0tSbW13?=
 =?utf-8?B?d2ZDY204UVJla0dnK0ordGFVMVBpQVVXNkRNZ3U1dXYzTERZeFEra2J3V2dj?=
 =?utf-8?B?UDNjbWJDNC82TjhGekxjU2FUckl1eVA4QTZKajkrTTVWQ2JRRk50WldHQ1I4?=
 =?utf-8?B?R0R2VnQ1ZDFuQzRSQjVnbTlMUWZSMW1kNmUva2x2R0hNelJ5UmRRaXVCK3pr?=
 =?utf-8?B?NXRQcUd3UzZ5b0tGRmtDbitHTXZVMzJjaDR6RHBnajJZR2luRTIwYXJMMG9R?=
 =?utf-8?B?RTFpYUp4Wm40M0FMM2pFZzVOcXNESUM1YTNkR291T0RqVW1TRlJzSHQ0b1ZR?=
 =?utf-8?B?WGEyL0VDMG12VjdMNVRCKzNKaUo2Q3NGVFpiQzZPOXVDb1Y0Q0ZRZEtUYXN5?=
 =?utf-8?B?T1E1dlVBWnpUbEVMbzhkWVo1b1ZOZDRjU3NvQ2tWOFU0UytYeE93TEZ4em9K?=
 =?utf-8?B?Q2ZtN0Z3dGhmRmttZDBUK0hjYldESnJxOE8weG5ZMWpQYVhzekNTWU1Ba1p4?=
 =?utf-8?B?TFZZT3V3K1Ixb2thWEdFOXF4WFZhMHBWcDlIN3dlRXZ5eHJMak5ycEtEMkRm?=
 =?utf-8?B?TmMvTDA3TnlYUTgvTFhwRW1sRjhIWGVpTHdvTU45bFRzR1NZazdKajhmTnk0?=
 =?utf-8?B?MUZTOHBCT002bk5PMHF5S2VyYVIyZWV6a2ZpdDlKY25MNWNvQkZKYWNBRnd0?=
 =?utf-8?B?blljNDg2VVVOKzdEY1JVOWMyYkZ5ekU0MFk4SC9PeFBFTG5BRXNSbVZNazNv?=
 =?utf-8?B?ZGVsNXJ4bGRiSHNkZWN2WldQY2dzb0ZaRkM0UnhMbmd4OGQyRkMxVE5peDNR?=
 =?utf-8?B?M3AwTnZyMG9ReVFoK3d3eGFOODNOaEVpeGErazVrUjlISUtTTjZVME5WNllC?=
 =?utf-8?B?L0l3U0xoa2dobis5QVNQT3JpM2MzTzArT3VhS1NOSGI0MERLNTJ6YVpJUExD?=
 =?utf-8?B?enRmb01kKzhLU1RIK21LWUlYNm9aQWZYOXJCV29jaFdKdHhoL1BiRlBkTm9S?=
 =?utf-8?B?QU5pVGZGQWlCNXlyTzFNQ1JLZDE4M3cvK2pOK3I4UkNBQnlvZmlTc2RUSVZa?=
 =?utf-8?B?N1pCWkFnOXk0Vk5YQk9hYTBoRUIyWTQvemZGZlhKdGdUYnNEMmsrY0ZJRzgw?=
 =?utf-8?B?NVE5eHc1NmJLTytYNUl1U2kxTlpnemgzZWpPV213NGRhV3dKeTBXaHRNWFRy?=
 =?utf-8?B?VHpJZ0NlVkw0RmpjYlJyc1libEMyMFNWZ2hOYlJIcGxYb2FueFJmOXdLV2Ny?=
 =?utf-8?B?MFdiTlFvUFkyMGYxTFc1bEgzMzhkMXRKRXdnYXkvWUJGblk2NFpqNjMvQVlm?=
 =?utf-8?B?Q0tiYnFWaVlaMjZPZlk1T3I4eXNKeXpGUFZDT09ZM05wTENqR0Uxd0pyNEVr?=
 =?utf-8?B?U0dqam03bkRKYU5JZFJiaGJIeVdlVGhCYmRTWXdRTHF5NDJFd0k0VnFLY3ZS?=
 =?utf-8?B?OGJHcTNEZkhzV3ptUkQxWWM1Y0N1aWJ2dElFcHhuektmdWhOK0N0ckJUYzhZ?=
 =?utf-8?B?ZmtKZTJJQUN1RXI4TWNjOUZEVCt1YzhWV1A1MjRiSHBjN3pHVEhBT1lWUnM1?=
 =?utf-8?B?VkVxRjZDZFBwU1MwbnY1VUFiVWVNZjBiT2EvZHhOZEo3cnhkVlJ4Q1J1UzdU?=
 =?utf-8?Q?s4JS8KHcgUU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVhqaWdIcytoYllFMmQ0Z3JmOGlzZU1HaSs3Rnk3LzdOczA5T2thRkdFRDFo?=
 =?utf-8?B?T2l6MCtMbWY2MTdsVzdhVndmRkFBL0JpayszUDlmWEFQZDlhVklPb2dXNEZT?=
 =?utf-8?B?QmYzdTFxMzJJRmtLdzNBYVVBZWVZL3BCOUwrMEo4dEhOZUhIbjFkWEtYUjRB?=
 =?utf-8?B?MnVnRXR6cFp3NWVqZUxObWtNOXIwOHJCdGQ4RDlEOXo4eDZkUFMrM3pqOXNF?=
 =?utf-8?B?QTRDSy9kUFQzRmU1UjMvREQ3bWlDVHN2T0cydEs0azFtM1Zmc2laOGU4Y3hM?=
 =?utf-8?B?aEFsZldnM0tOWDAyQ2xvcFJLUTJCNlFHMzR1eGw2QXJCYnEzVUJBVjZHVE9n?=
 =?utf-8?B?eUs0TVBKMGp3VXlsVFpkZlRGU3Mvc2xDV2JNLzU0UURtZEVyTzVlOGJBeGkr?=
 =?utf-8?B?MUoyWTNnSVIydFc2aFBqUTA1WjBqM0tLb3cvMEdodks2TzYvdEx5bUMxbjBv?=
 =?utf-8?B?Q2hiS25CVGQ0OGUwY0RxclFpRTNEMTI3NWdSODE5M1hwb3FPUU0wdmVDSFds?=
 =?utf-8?B?YnVMdWJuQ3psRnQ3cUd3ZHJubDcxSU1YVFh4VnlmdnZ2WWNYdG1wdXV4TkdE?=
 =?utf-8?B?SGZXM0lqdldmTCtjOVdRQXAwQXBjQllwVjlkSWNTMDNxWVNmMlJyVGtraDVu?=
 =?utf-8?B?NDRWS0tINm5zSU5Mak00NGZoVUdRMkVhb2VvaDRsNTk2dXNrOWNLZUx3dTdB?=
 =?utf-8?B?anNJcTdZZUhyRE81ck5kZHNtVlQ3bURlZlNtbUI4UWY3Z0NEbWhVTFFVcElN?=
 =?utf-8?B?VGFuT0hOTnMrN0xJRU51YU8zMVRuRVZVN01JVVBJZEkzRU8vRmY2YW4zOC9q?=
 =?utf-8?B?aWtock5qY0hTdVhIWHpzc0N2WmFmS2pMUDhRL3dPeWIrYUN0QTFkbGV6TGdZ?=
 =?utf-8?B?VEc0WnRVeHVFRkg1MUJMNGxBNm5NWFpZcGtOdEYwWWZ4QTVSRnlqTUpRNHp5?=
 =?utf-8?B?T09lQjBUaFZQbnlnMWNuZDl5dUlLMWp2WTgzcXpCZm15VGx2U2NkdjYycmo1?=
 =?utf-8?B?S0haV3drbkpwdUVMM2d1K3FTdnBxakJIeWxCeUd1eUQycG9maHdvVy9XZHJw?=
 =?utf-8?B?MmREZ3VlZkoyOXFUYWxYTGE5RnVRTnFqQ3B4My9YTVMxa0FLQWowd3VwMUVv?=
 =?utf-8?B?eXM2SSs3bzR4NVF6R1FmSnhXNjBuRG1KYi9keTl1YXE0U3BvZGtsQXV4SjEx?=
 =?utf-8?B?eU5zQ3VUa0JPNXZzZFpnSnR4YmRuVlZWZUlQMllzWnVyWDNKZnB1cGJpcU5Q?=
 =?utf-8?B?TDdvOXZJZENVUGpuOTRWWlNvSmZ3bGZXQzgvQVViMTNpZHZEbGczNEo2bEF4?=
 =?utf-8?B?cGUwcjJ5ZVJjUlltaFlBa3BBWHgxSmQ3b1dyM1ppYkYrOGp4eGUyVHBScXRs?=
 =?utf-8?B?U3oxRGcxZmVqWEFHYm5kc2l6ZUtnODVOUUxucUtJQkdhVU92L1U5dkZJYlh0?=
 =?utf-8?B?R0w4MGpuLzd0RFhaSDNBTlA4RlJ5Um9xUUg4b2xVUGhvYTdDeEdXRHp2ODYy?=
 =?utf-8?B?dE5qRGJTWFFsRFNZOG5CdDk0aER6M2kyWVhmZ0VkVXpmanN4L2FVWGI0S0dT?=
 =?utf-8?B?QU9mUkR1Zk5IR2hHUEQxWjBlSkdqSS9xcUlaREtURFdqUytNNWxVbnV6RE4z?=
 =?utf-8?B?VnRPWUpzdEllc1Mwamp5MVRqWXFDcWNxcEw4S0o1TTRrOEd2eFJ6amNyaHJk?=
 =?utf-8?B?NXFjVEhmUFJhK0c4Y250NnFWUmRLcUF3Snljcjd1THZNU2YzV2lUanBmakdL?=
 =?utf-8?B?MXlCajRzaXlEWEhxcTJpNWtJUEY2NVJ6cFFzZ0VGZEdiWUZCbXg0dk8vR3Y5?=
 =?utf-8?B?NEdtcnQ3U2lwV2NxM0krbVNHbkdmZ29wL2xhejZvTFAvUmtiN0pGWDVMOXRi?=
 =?utf-8?B?RFkrU1FBYWIrT2MvVExJTUNtYldwaUp4SGsxcnRVaXRYYlEveTM0K1l2Z2N4?=
 =?utf-8?B?YVpWY0QwWk5VY2FpNTNkdUZ6ZU1PamhVdDVhYmQ0OXYrbDBKWkQ5Y1FWVkh5?=
 =?utf-8?B?c1k1REpkaDFZRmF4ejE3L2NNVzhFVXlQRHgzV2pEZFliNW1aSm96b3pvbUhY?=
 =?utf-8?B?NnJNOUU4SmJScUNRbklRWHY1TkFReEN6Yk80d1U4YUcxVjFHNHBxTnBsOWMv?=
 =?utf-8?Q?8b7yVS/p2Bu5M7lnIIXxTzPMv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a91d43d1-c630-47e7-a01b-08ddc9d75117
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 10:54:37.3940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPfuqh4uAimNWb91JPr0EmUy4yN/e3k6LUSTFGukZtX5OUoFO+KIJj/+sa21brvQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6832



On 23/07/2025 10:06, Julien Grall wrote:
> 
> 
> On 23/07/2025 08:58, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Hi,
> 
> Hi Grygorii,
> 
>> Now Arm64 AArch32 guest support is always enabled and built-in while not
>> all Arm64 platforms supports AArch32 or this support might not be needed.
> 
> I am not entirely sure I like the proliferation of using CONFIG_* for 
> every single feature. This makes the testing a bit more complicated.
> 
> Can you clarify what the goal with this patch?
AArch32 is used quite rarely in embedded systems. Also, in Armv9A it might only
be implemented at EL0 if at all. When focusing on safety certification, AArch32
related code in Xen leaves a gap in terms of coverage that cannot really be
justified in words. This leaves us with two options: either support it (lots of
additional testing, requirements and documents would be needed) or compile it out.

~Michal


