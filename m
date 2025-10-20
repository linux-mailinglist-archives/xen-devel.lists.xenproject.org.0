Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DC8BF1F7E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:01:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146435.1478860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vArNI-0002Ro-Ih; Mon, 20 Oct 2025 15:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146435.1478860; Mon, 20 Oct 2025 15:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vArNI-0002QN-G3; Mon, 20 Oct 2025 15:00:40 +0000
Received: by outflank-mailman (input) for mailman id 1146435;
 Mon, 20 Oct 2025 15:00:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BTWa=45=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vArNG-0002QG-Gl
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:00:38 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88c0c785-adc5-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 17:00:37 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 SA3PR03MB8352.namprd03.prod.outlook.com (2603:10b6:806:466::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 15:00:34 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 15:00:34 +0000
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
X-Inumbo-ID: 88c0c785-adc5-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hu4M0M61zwYfy/zxavxNnvq7BnLKfvFOPft/9QitiVpYOfEwchHTzJDcS7XFUkzokTYiqDux1egxmEGNaQK0dCVMdPZykimDgUDvwHKITRsVzL6bnA8sGxDJAZTAvCCZKMHc7eql/rgY9Hsp/6NPCSwnt/Ob0bCdOnn66wZaoXBa5ZNOXOx1yiKtukfP4nH+sFTUmt8DJT+nGIK+HHaJfx+Je1YmuRj4oiX5w9Tj4P5jxtPshhYLAWaVh4OUu16nbAG8Yee0LhHq6iOKhRn2APHNI9sNghcyRJoDY0ZyS/wRdLmoufA/LaP/OMebuwuWx0pnW6ozjZoosZQcFiQG6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWxbX23uEUq0kzfK3bsK6XYoDI6gIyQg6E+HUZfj9ao=;
 b=zQsMcDIv4FiiLrKHuuolVi/6qlEQ/70yQcEPba4Cui7GIAhsgSL/N99Av/D4v2hS1IFVee5FywQPjjXELQ88jOMZY5mFDDbpjtydeVnfig76kIibk8T+/p++ZBip40hXv/JGw+1VrXmOzDHvi9dMIDssRoGdTf0GxwXxE4L/3/JXBln+A57D/tdvQ0n/GmV6lt/g5Rm57tHwFY/mV4Nd8rSlE0iJii5fS7ycdkWBIqZ2QPEisYsCdNhFl4JvfSiB+yPT5m0c4Xssnyu2j41eqaDSCGZkzB/zN8l6X/DdRiuJJ8Xl9/dhC29i56bbtm0ekwiWGmc2sQj79YdQslb6iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWxbX23uEUq0kzfK3bsK6XYoDI6gIyQg6E+HUZfj9ao=;
 b=uEOUeXAZ/VX1bWvB58FBu/qYEM2SvkDZuTowvZEkPzShg5iMu8ygl/IQgIQjfCCrPSmgV2JRq4UOavymI7P3aX8kTHeTREcDtC2mE7EmrGbmAV2e0pzDBeI6HpQdum88sDXmifQXo0k7cXcTqd/WNhWJwMj4poqfHvIC0b1zf0w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ac702bb6-9cc1-4489-a427-943c16c95f89@citrix.com>
Date: Mon, 20 Oct 2025 16:00:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] tools/tests/domid: don't pass -E to sed
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Denis Mukhin <dmukhin@ford.com>
References: <d385addc-ada1-4a75-b210-38146a1fad2f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <d385addc-ada1-4a75-b210-38146a1fad2f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0063.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::27) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|SA3PR03MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: 716bcd1b-c7b8-4eae-7b91-08de0fe96b82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NHpkUG54SmNDOHZTQTBWVEIrang2UERlVzA3c0FhV1o4TFRlUXUyaUtEYmdF?=
 =?utf-8?B?TjZLQjVib2NTeWRIc0tEaS9xTnJteElxaEZ0bytzeEgyT21SaEZMTDJYc2pS?=
 =?utf-8?B?dnBYR0E5WWVkQ1NpeHBmMlNUZ3JVcndZdXQ3TUM4UnB4bWgvanNSTlVwdDhq?=
 =?utf-8?B?eXJiQUJmTE1nSmZocWdRSEpaV3R4cU11S01jNnVRMjlhOWZMbTRKNnZVcGVu?=
 =?utf-8?B?YVhzWVNZQzNGdklWRWdCTW5qV2pvUWVGdjRtWnJudzkyUTdmYllYVHpLeXZW?=
 =?utf-8?B?SHdzZWhPRVp3eHowSWcxWHFTbXhoTFZHVzlrQkIybHdycmVOdW5HdUszQ3pw?=
 =?utf-8?B?UTdDbUl1VTdzRHFOalZJbXZuR2o0NlBTZXR4L0N6dUMvaEhhaEdyZVV2bDBm?=
 =?utf-8?B?b2NiQVo1eU0ycEtGV0FXdmc3UVdiaHRpYmNMTFlKRG5EeEFHSXBpaTMyR0Zp?=
 =?utf-8?B?WmFLK1FsanR4aXhMS2hsS3NIcVlxcDZhNmYxZnE4ZEczQlJyNy9MVzd3VVV6?=
 =?utf-8?B?YzIybEU2Sk9nZ3llMVN1dk1QdVlwaFZmMmFOZ1RrZnVSNW9waUllOXp1V1Qx?=
 =?utf-8?B?SCtTQ1V0WGhESWkrZ3N0alY0UUhZZEE1VEs3S0REdVhwT05lYzJ6bUhIU0s2?=
 =?utf-8?B?MXJsUnFWblE0NnVCN0I3dUhkLzhQYk9lNkFoZ0JzS29ya2lsS2lkRDBwV04w?=
 =?utf-8?B?QTI2UWxTSGpqeFRzRnFJdGJkRjJTWlFWMlI1M20rbU9xM1MvOVp4enNqVDN0?=
 =?utf-8?B?Tm0xOGZQelFyZGduKytFZ1RzVlk4QWRvMDcwY1JERWExUFdIWDdQSUlORDZl?=
 =?utf-8?B?RWo1d05YMXBLTHp3ckVhcmdPTnlSUEw2ZEFDQXRCQ3dPUEFBazBZTGZIMXFs?=
 =?utf-8?B?dlBRQVdLQ3RVejVZeHpQcTVSS2Rib0NGWEtNQkZWTGZpL3NVd2xRSDM5YzZO?=
 =?utf-8?B?dmo3dk9ra2JrUUk1bmhDc1JPSmRuY0l1TFdJYWxaWTMySkZyMnVQY3pYRTh5?=
 =?utf-8?B?TVlVc25kK3o5TlRacDJJMGRkRVMwWHJYNTFrNnRjK3NrMlJmVCtQWVdGSUsw?=
 =?utf-8?B?YTZVNEw2S1gyYVdWZFNIUVkzQWpoMGIvNjRHNnpaSVlqTTN5QkpqTWxqdTk4?=
 =?utf-8?B?QjQxMWdUbkFqc0RXdGpLbS94WlNGZkVmbVY5SzAwMEV1Vng2UkswNWlER0dQ?=
 =?utf-8?B?OCt6T1d0cm5tLzJ5N050R2gxWHBjaUtYMXc0UnMveXZwVEF4Vk1rWmNSQVEv?=
 =?utf-8?B?bCtKdzl2NlhLV001VUphNXBCcUM2aUxEd3l2YkRlWUl6LzBXMnpHclp4S0Qz?=
 =?utf-8?B?WVljTnFDK2xtRzBDcDM0R2Fic3lTcnA2L0IwaTJLK054a1ZTbkZGZlhuNm5z?=
 =?utf-8?B?SmpYYmNMNDA3RmdCckR6MEx1NjF5VkU0ZXZONmR2eFdmV2ZpNXFQd0Z1VEl3?=
 =?utf-8?B?WUF2QStZSzVlNjRBMU1oMW5xem9uUUZweG5ZTWJzMERuTlhXaWVIY2c2NFEr?=
 =?utf-8?B?cGVyRnByUlBzekpoZXFCd2liWldJUHRqRnlrSktMVTM4TkRWVGd0Zis2cndN?=
 =?utf-8?B?Ylp3Vk9OUjN2MXZQeWxRWCs2NUhycnYrejVwVFBmR0pKMFNuc2VkNXpxMS9v?=
 =?utf-8?B?c21vSFFBb3J3WjhpVis0a2JVZjRUTTB2T1V1b1FXU2ZXRzk4Z2FvcitiVmMw?=
 =?utf-8?B?QWVZd1Z2MjM3VnJ3SHFQaXBRMDRIS0VpRkt5ditMKytYVkZnSW5WS2YrdDJT?=
 =?utf-8?B?NE5mMVpCM2MydlFabm81WW1wblJlbzEwVCtFQ0R2b2FBZ3NWZWFiRkNBQUVm?=
 =?utf-8?B?YmhqMHlSZVlobjZZb09YQjBTcTdGQkgrUlVycXZ1Vjlqd2ZXS2U2dWZrZGNW?=
 =?utf-8?B?SGxiWjlGMjVIL1ltWnF4MUF2bFRZZVM4RkNYN01MeUp6NThxOVVRelF6a0pH?=
 =?utf-8?B?UzRnT1FlUVcyQzlndU1HT3pEYmlGSzFzdzk3cHk3NTdmd2txYkJjYlkvR0Iw?=
 =?utf-8?B?Vk1yZW9JQzlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2g0d0VRWVRyNUU5VTM0K3ZXMEpmV3lrL0U4U2xscjdyd2VwRHAzb3N3ODhU?=
 =?utf-8?B?akpXc29CaWJlK21Ka0V3YzA3UWI1RFRCU0N5dlVZR0xIRmh4K1dxaXRlZjcx?=
 =?utf-8?B?SE94cEYvbVZGNTJIeWJhNjZCK1pURDNLdC80VzJRelJvcTZhOGVpc2c2NGxj?=
 =?utf-8?B?MUJpZ1c2WVZMLzJNUUttMFYrNExyZVFaeURsVldMSm1ma0NBYXlHV1BGY3o5?=
 =?utf-8?B?OXdoYVJEcG94U050QVpyQzF2cGNESENkcWdLMEl1Z1l2a3hmb29uVmxnaTZG?=
 =?utf-8?B?YUxTRERacEozakNJdzI0bkdYNGFMRFRweU1IVFBnM3dIU00wdXp0SUlzN0pC?=
 =?utf-8?B?QS9Pc0x3OFVWeEtLTnN3OVRPV2JBSEpIV094MzBiWmFjS29MdEdjampxSkpq?=
 =?utf-8?B?WGJBOExoTDhPcm9sSGpWOWRMN2lWVVFVK0J0K0ROZk1YWnNaOXNkQVl2Zkll?=
 =?utf-8?B?S2svYVo3YjJIaWh2WGpIa1BIUXovWFg5NVovQm1WU2pMUkhTQnFRR3I1S0xF?=
 =?utf-8?B?emwyb2s0RTM0dHRmamNSbVZMVnIyYUw0UlFUc3NGTXBaS0hpeEkyRERObDVX?=
 =?utf-8?B?Z2ZKMTN2SXdPSUpEQzllWjVkbHI4N1hwcFAwRHhDdEl0VGIyNXNvNVdjckg0?=
 =?utf-8?B?bzBYaERMT2dWbmVIU1FNc3MxOTQ1RnJIaFhUVjkxNHZ0c2NsRXFaNlhLU0Jj?=
 =?utf-8?B?VVd5dEFYOTNSS2x6NFJ3M1VGc3JHVW5Wbkg0YXJzRVQwRHNMdUZsQk1sODQ3?=
 =?utf-8?B?VlVrZTFaN0J3SmllQVUxQm1RU3NzSjJGZ2gzNU5hVk9rdDJHRGM1RnNtdGhm?=
 =?utf-8?B?bis1dHF2OE9VeStkcTIxUTZZWDRKdFVjMEZHR3k3UWJoY3lpS3NNMFVCRzYv?=
 =?utf-8?B?Y1dwRGlxVU84Qms5SlVicmpVRUlwNG9ua1BqTHQ2QXczMm9vOXNmMTRpMTFl?=
 =?utf-8?B?K3R3R0lWVXZ3YkszdVVCV2cxSlpHTkw4Qi80clVqUkI0V2xSdnBRMW5WV3oy?=
 =?utf-8?B?OXRxa3lXdldQWDJXbEl1dkEybDJqOU1ZUGRYK0NzSExGRHJmWlBITG9jMng3?=
 =?utf-8?B?N0FpWnlndE1EY0sySDRJT2hqYzJUSTFuenlKSXp2dDNENUI2U0RTTWJPR1po?=
 =?utf-8?B?UFlFcDVrM3FhYm0yQ2JYejMvOEFRVXdPeTd1UFJYSUhsWVVEblV3ZTF0SnQ4?=
 =?utf-8?B?dlk3bGJBQTlVZnorTncvb3FWcDNFTWtRVmdIMVF1UlBwcFhtVFZEVTdzeCs3?=
 =?utf-8?B?Smk4N1A1MkhZeEwyVW1lTUl3S0I3YVcySlRoSEZOUXlIMkFBeHVLRWgvdjg4?=
 =?utf-8?B?SGhqNXFYcTAxQkcwbW9uZTlwZU9CZFNOOStqMHNCTzFSL25DS21nV3dGWnJo?=
 =?utf-8?B?SFpWVUNsd2dIYXYrN09uQStjdjk2bC9tbnkzcGVsUC82VElSVlgwcXVVVzlG?=
 =?utf-8?B?UWZDZCtjbkVzaXhTblNlazNObExnMWlRVTdoZHcvSjhjTVg2emE5OVZYWXk2?=
 =?utf-8?B?ZnYwbzZZMlJab21GOENsMTdaMW9UaC9QUG5EbTEzbVRsM1JiOXhRL0ZLc01K?=
 =?utf-8?B?S3hqTTRpVU1vam5nZDJmL1FUb0hGUVluU3dQd2FHUWJKSTQyYlF2VnI1Vm9n?=
 =?utf-8?B?T0J2QlJHVWtKV1ZzYlRYUlNuUGM1SUxSREJ3RkNyWTU4K29aNEd4bWd5K0dH?=
 =?utf-8?B?OWkveXJVQWZGZzNndW5qNUZKRkxhT29Ea0huRWVucXE3KzlVZFNCbXZ3bkVV?=
 =?utf-8?B?cVlzVFhqR0x0Z0hDbkNWK3AvRDRBVzBoT0wvZlJBNW42b2owTlRCNDF0ZURv?=
 =?utf-8?B?MjNrYldXd0JkY3VZM28ySmh6SkMyK1QyZExud21UYTZBdENUbGdHeXVRVHdx?=
 =?utf-8?B?SFJlRFMrVzJvaFFybUJoOEZqR1FxYkJDeVRHUXhid1RXdHNDK3lVd1pSMk4v?=
 =?utf-8?B?dHhFdTJtbmNQLzRQREZtK2RtbFJyUlhldG5RdU1GcUNYVXRvYnRJaXRnc0c4?=
 =?utf-8?B?S2JPa056WW1adUtaZ0xFNjU3UTVoTS83b3hWSUR0MjcyYkhYR0syK2FHeFVy?=
 =?utf-8?B?cGlUcDdpL2QxVXF3bDhsb01Nb1pUdzVGeUVEckJhQTk4NEJFMTkyWUw0TFdp?=
 =?utf-8?B?b2VyR2xLakxFSTFhT2xDR0tFTVhFeURzNk9ML0xzQjRkaGxuWVRFckpiQVJE?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 716bcd1b-c7b8-4eae-7b91-08de0fe96b82
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:00:34.3868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwslCmPRG5jvDC16RllhgAOMTqY5xxSijrRNfOY956j/23QXu2752cYjIjyhHd1q2rEn2Exx1MQ9GZFlEHhudn7s/nqjNbCOm7ksKjqCAyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB8352

On 20/10/2025 2:40 pm, Jan Beulich wrote:
> Even the 2018 edition of The Open Group Base Specifications Issue 7 [1]
> doesn't name -E as a standard option; only Issue 8 [2] does. As we can
> easily avoid anything "extended" about the expression used, drop the -E,
> escape the parentheses, and replace the sole + by *.
>
> [1] https://pubs.opengroup.org/onlinepubs/9699919799/
> [2] https://pubs.opengroup.org/onlinepubs/9799919799/
>
> Fixes: b3d31533a047 ("tools/tests: introduce unit tests for domain ID allocator")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

