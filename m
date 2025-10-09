Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 497E3BC7B16
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 09:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140323.1475245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6l0Z-0006Ak-1O; Thu, 09 Oct 2025 07:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140323.1475245; Thu, 09 Oct 2025 07:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6l0Y-00067d-UR; Thu, 09 Oct 2025 07:24:14 +0000
Received: by outflank-mailman (input) for mailman id 1140323;
 Thu, 09 Oct 2025 07:24:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i0mQ=4S=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v6l0X-00067V-8G
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 07:24:13 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec37787c-a4e0-11f0-9809-7dc792cee155;
 Thu, 09 Oct 2025 09:24:00 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DS7PR03MB5397.namprd03.prod.outlook.com (2603:10b6:5:2c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 07:23:53 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 07:23:53 +0000
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
X-Inumbo-ID: ec37787c-a4e0-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofV+5tQNAQgOuToML/y3Mf4vc7DDrxQtWG9hE8uzGsEKpJA/A8ixVFnYRifufVFZQzl+RXiMjKX+290V4zMbL8CUaVGPTOOu4ZoWhODb55kXpIAB2pz/eI48tC5KFKA/oF1j3xrLYqy7317EIWoUyWGzuayhYHGU0HF1uAPvHi/EXfds/7m+p3Gq6WH4Dr+hfhbZc6aVThSFqQQ1J5jLBYA5RohnNO7f3Cb5dlvYPkoWbAScS6Io64dWOcrffeuO5JFTVJGx9lE0U8fjACtP5+HI65i+MpXoJMZMAHrqdEujmrOAWcMLEYw6xw0xHA9d3ek6WOq41ssvGxhH16NURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diFD8va6CdLQp1aJYVLWwokx+QRU1WW65/Wyon+6pEs=;
 b=cT1ybvphtq2s+L3Pi5jT8PEG03veZZG1GklkPgh6djcsLlW78QlFd2LiEeZlXA9ksXv3Wn27LGqdP9omz1aw15d+9HKLaky1CRg94h9GDvbchQbAifSwon4cCPERqVHSXY7D92EeUDDYPoQK7COL4huhMGoFNOyJ3ZFMGVJkpxqB7YuL4AZJt9wWloPQBBFXdcu5lzbYEKwygGQ+FaHBtRu5tHzE//vtqZ30+kKHOR2t0r/slrPunXq5WzSPvoZGzTfasHuJhGyfL9IP2QhGCI0Lv9+8YqfzKVcOA1Gj5M5gIe5a8jAJbDQ1TLjLn4LZf+HL6vyIGU8U2dquT4/1zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diFD8va6CdLQp1aJYVLWwokx+QRU1WW65/Wyon+6pEs=;
 b=RZW3nc+Li/m2zuV4Vgl3BO0aGBh1jPLTuz2sqy1xV4XDe+P8ADTncnp1svXk+V3WWtL9Olb/7Ic00i56WXIugEmV+OCS7fC1hTTqSNjJKiVZ32igwIn2SYQdC1ZfZ28BZKR1dBiLqAVW6rS4KrbfbzgVEXTwt4wAdBuZZNh/yys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 9 Oct 2025 09:23:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, oleksii.kurochko@gmail.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.21 v2] vpci/msix: improve handling of bogus MSI-X
 capabilities
Message-ID: <aOdjBLaK1Tg2I51E@Mac.lan>
References: <20251008143923.2557-1-roger.pau@citrix.com>
 <7754ab37-4faa-476e-98e1-0417afca1e70@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7754ab37-4faa-476e-98e1-0417afca1e70@amd.com>
X-ClientProxiedBy: BN9P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::21) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DS7PR03MB5397:EE_
X-MS-Office365-Filtering-Correlation-Id: 19133768-445a-4254-66be-08de0704ccac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejNjRnVtUU5vc0NJdGorYjRPUFd5Q1BLWmFrVXN2dTNhOFNYeEFSMnAydmE1?=
 =?utf-8?B?NDByWGNncCs0R0RuODUxZ1hlK1RtZXVqNGpLcmhnMHhtUDNHc3loNTBCdXFo?=
 =?utf-8?B?K2MyQmxlcS93RE5vU2FoZmgzbUlmVEVsNm9HbnlWbDl4akMvWlFOZ1V0bjdy?=
 =?utf-8?B?bi8vZlB2M29UdU90UUp3WTR0OUlNdVQwUG9GblFhVkFvM3A4ejNUQlRGcDRo?=
 =?utf-8?B?VE93emtwQ3Q0aERnOVVlQ0VROW5Kd09xMmZEZkJhcjNTT1EvTG1SQS9HcDUv?=
 =?utf-8?B?TDErdE56QmxNL3A0aDRyeU1LWXZkUW9nTEx5b1NkdEdRaWozVHJ1MEtqaTV3?=
 =?utf-8?B?a29nZ090d2dEOVhONmFZQ0UyMmFDSmZ5VzBRYnpXRkJKRWxTZzZEalpXZXVZ?=
 =?utf-8?B?Y2FtMzl2d2JTM0szVXRtR29jM05HK0UwY0dpUjV0VlByaitDK1VBTlFsKy92?=
 =?utf-8?B?N1ZrcjgxMkp3V283a2ErdXV0UWFnUWtpV0gxd0hUbXZ2WndZQ2Z0c3lKZjlP?=
 =?utf-8?B?Zmxpa0p5QzBLTldBNkdhUWpKTU4wbEMrc0VVdVN3OEh0UzVKV1NlU0pKTktv?=
 =?utf-8?B?NWJZS2QzRkp1djlGVG1oVkFVWC9WZmhMb0pqdkdJMlMrZms4WVN6N0pTN3Ex?=
 =?utf-8?B?bCtVMWtmMFFHRFlGN1IwZTVZSlk5dk9PeXBrVzQ4aytmZVcxK1lBak9KUDBQ?=
 =?utf-8?B?T05ZOEdRb1RJd0lIaTkvNjd3emtuRjArTXVRbXpLNHMvS1NoKzBabXBOcTdw?=
 =?utf-8?B?SzJxdDFIVzlVMzdBMDFDckpIOTJXcytLY1VpeDJVbUwxYmdnUSt1d2xLS2Q3?=
 =?utf-8?B?WkRTUW5GeHp6YnYrZUpXS2VJL25rZXF0eHBGbE4rdk1kVG0xYzkrRHdhcTI3?=
 =?utf-8?B?d2pHc3Y0cWZxbjNxM1lIai9zejBoTTZESVAzd0lIZjQxQ05waTJ2WFBXQitk?=
 =?utf-8?B?NGtXdmxCa2FodXFac3czMSthTEFNTmJkRjdRZnlGdnZLMFJJWm9uYnhvdzN6?=
 =?utf-8?B?Z1ZEcXYwOFRCUHhCMkhiQThYWnFWaFRVdXJYQ0Z2RUJqOGMrMTRnSGp5Q01o?=
 =?utf-8?B?RlgxeDJDakhmWmFLektwNlQ0c3JkNXVKVHJsRkdrbjNWSjNmUWxER1I2akl6?=
 =?utf-8?B?OU96VUJqR1BVcVByQWRsem9sVXlKOG96T3NFM0hjcUtqMkx5NmlDSnR6dTE4?=
 =?utf-8?B?MkdWS1RGS3JTMEpvbW4zVStZWFZkUWtrWFJqNkkxaVdBWGYxcFI5L1E4WHBm?=
 =?utf-8?B?UFRoRjJaUTNHMUhSN0FyZFNxeTc0d0kwTnZVRTdSYUI4eWI1RElhcG1UNC9y?=
 =?utf-8?B?UWlLKytRbDdaaEZSZ2RyU2U3WWN5S3RPbDY0QWU3K1pad3dFM0dRQVVZblg4?=
 =?utf-8?B?WForZXlzVStzL1EyUDdIQlVpMGdldWVxV2hybmpKOEFwb25tdGVSOGV2YjE3?=
 =?utf-8?B?QzdSWGl2aUQ1elBBemZZT3RNdG84dTdPNUlybWJoaUZ1WE5oL2syOWVKRldh?=
 =?utf-8?B?b2xEUC9mcjVwVk9BcUhyZ2IzeU84YmZQajFreGwzQjNhbk1SRVpWOFZsRjls?=
 =?utf-8?B?aWE3Y1liMkdEd1I0QlNpN0w2eC9XeEY5d0hSdTZxSUhsdmwzbFc3ZWYwUk1U?=
 =?utf-8?B?U1NvdXpibEtDYzR2REVYdk1VeXJmaENjR2c2eXZXT1htTGxvbDlpSjdkNjM1?=
 =?utf-8?B?eHdHRDVCUUY3NlkvQ1FHY3Jld2ZPbERwVEIwY3pCSlIyNCs2ZTRCenlZZnN2?=
 =?utf-8?B?elIvekt0YjJRRW5MZ0xRcUd1dVk5RC9KTHUrSGJSOXVJMG5sZ093bXoyc2RP?=
 =?utf-8?B?UGh1K2hBdmV6THlxcm9RR2dFdXl4VlRaeXNSblJCQ1JmT3NpQXVtekJUcnN5?=
 =?utf-8?B?Tko5aHh0VjY4NXFBSy9sdWFKdlQxckY5a0F2RXZDaWlYWWE2cGs2NkJHREZO?=
 =?utf-8?Q?PngzbltPO46tupIfI/jYdR+ogR6xF13/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEh1ZGJGVnRxcWRhU1B5c0ZTdDdaaUpTZ05XODlkdm00VzVlKzdyOGtXb1pC?=
 =?utf-8?B?VlliVmVGeFFLSEN5Vk5ERDZmV1JuaDdkQ2tlWFBaZWJsUVAvVE96eVkvSmRm?=
 =?utf-8?B?ekN0MzFMQXRjNnJjc2NiQmtybjdOVnl3dXJvZVI0eWpVOUl5TWRkc2RJRzla?=
 =?utf-8?B?TWlWd1FnV1dUZWNwak5LVDZmamEvdGdQMGRzQ2JEMVd3RUdRNlFaQ0QzdlZC?=
 =?utf-8?B?Vm5Bdmd2NDdFcWdBY3BYcmw3WGFOQ0laRktPSDltSUNqWk1MalpvWExmR1BN?=
 =?utf-8?B?T3M3dDVkWFQxVnlRSVpON2ZmcXdOb3oycDd4RWtKYnFWRStlZ2w4ajlTSFQ4?=
 =?utf-8?B?QkhRczBpZnFDN1RZN01qbTV0MzQyenNNSGxHWGhvUEhOeUM0UTRrdkxVaDZN?=
 =?utf-8?B?djlPbDhpNWlKUzE5UXFqVUhTNy9YT3NQL3hielJxWHI1ZVA2VnpZZUNKOFh5?=
 =?utf-8?B?TWV0VER0UUpPVXMzQ2NuZElXMFRiK1ZuYnpRWEs5R0xDUHhsdldMVnhFQkg0?=
 =?utf-8?B?Wm1PRC9DYnl6eWMxRmt1L0JIL3h5cWpyejgwVURQamp6bkltVUNNaERrVFk3?=
 =?utf-8?B?M1FpajluMUYyaGw0OURxcHQyMnVDbm9hNitKY0RiR0NWZFAyYmNUM1MrR1BF?=
 =?utf-8?B?akJWVDcwdFVHUjJaNEtmT1p5ODBneVVzOHl3THA3bkRIQlZ2S1hiWnRYQmFi?=
 =?utf-8?B?UlNaR0NDbHo0K2VXZFNDOTJRSzQ5YkVHL1lId0FHOElKR3d0Yk1WY0srOUhK?=
 =?utf-8?B?UlhoZlQ2bEIzcFBRSldqM1hGeE1UK0x0UUtCR2tIVjFDUUVGNnBGZUR5MnhO?=
 =?utf-8?B?czRSb3Q4V2xYdzlWRkZSbjdLOThmcmo4Z3dKQlFHNEVSZ1hXK051NG1iazFa?=
 =?utf-8?B?RnkveU0wYkp6UUoxZE4yRmt6VThEVlE4YWxUb0hUNGtlZ2hlMkdjRld4RkZj?=
 =?utf-8?B?MjI0STJzSWhSMndXSkE0THNpL1FETTVZMkI2WjhiZFkyOW9uVjB3NkZteTZ6?=
 =?utf-8?B?L1VUWkdIK3c2NGEyKzViUWN1OE02R3ZrU3ovcnZQM2hFNnNtMkM1VXlNNUcz?=
 =?utf-8?B?VVZKOW1QVGRaQmJzaEVLeEQ0U0plOWo3WTdQRmFmeHJWWGR2L3c3a3puTVFl?=
 =?utf-8?B?dWs0SGZ0dUlDektvLzRPRmJkTXFhbHM4c3lRenhxWklRSjhkTzBucjBwN1Nv?=
 =?utf-8?B?UUd1NjF4NHNmdE4vUmI3VVRwL0ljbVNSM0xWRHorR29CWW14NGd1S1ZhYitL?=
 =?utf-8?B?OURrUzB3amFDYWUxT2M1QkZkeCsrQS9oZVkxWEhKbklNV2NuU2hJd0JBelE1?=
 =?utf-8?B?dmljWC91Zi9mQjY5QmYxSTNwR1NLaGFVL0lqbU1UZ08rZk9pSVFIT0g4MkJW?=
 =?utf-8?B?dlRCeTMwSjlvbnhwRzM1RWs0ZVZBY3dRbFpZZy90ZzBMQStyekdhaER5aXIv?=
 =?utf-8?B?Ky9YY3pqU1dYVUVMOURSRE9XcHY0MkVBdG40TWxXOExocmV3K0tsMUpKZjlE?=
 =?utf-8?B?NzdEU09OQWZhRk5EYkQ1VWU4bkZjRzhMSVNtVnV0NjlMWmFyZ1JRWDBGQ3pY?=
 =?utf-8?B?VTIrSUd4YTdodVhjQ2JwVlFNd2hidlVXZUo3eldUT3M3Vy83cHluNHdyMk0r?=
 =?utf-8?B?Z2pDK0JIeHREdUtnbUYzYkRmalU5ZDd5c0J2WW5yY1hCbnhrMzdhMGF6OFAy?=
 =?utf-8?B?L09VdzU0bjlVbUY3ZXQwbHROVWhBUG5USjZjdlhsTHBPVmcvYmVraXlzZUpR?=
 =?utf-8?B?bU9zSmtwUUcxcVdtMjZ1Rk85T1NxM2ZjV1dyZ08zWVZuRnJXeEFROTVNcDdi?=
 =?utf-8?B?VS9tV0J0Vk82NFloQk9XR3hHZFBOcWJ3VThEWWpMck4wN0tSeFZYb2o0RE9v?=
 =?utf-8?B?QThsZGFpcUZBN0JMTkVZcVAxY2RpSVliQ1NEWjlOd2FXZFc1Rmp6U29JTTJF?=
 =?utf-8?B?YnJxWG9QQzVLN1BKV0xZN3ExVCtpL3JNdzVxM1YvRlI3a0ZMKzJEaVYrcWlv?=
 =?utf-8?B?MDdvVUpsRnN3QWF5ZEtmdWNKVFdiVU9GVE5ydU9KbENsSDZYQUc1VmlqTy85?=
 =?utf-8?B?bTBqNnkwdllpM0QrNXJwaTBnZDFuT21RMkRFT3JkR2czSWhKdFQ1KzFraDVF?=
 =?utf-8?Q?LXCPkIm0W54H0zgVeVZckJe5h?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19133768-445a-4254-66be-08de0704ccac
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 07:23:53.1756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0i0zJ2KkQSlpHvcjhvv1y4Kw525ZXBqCpNQnH8NGxr1LGWJYPBa1Ia5fhNCUucIDYy1N+HS+v4dRbMcMWzLPfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5397

On Wed, Oct 08, 2025 at 09:17:30AM -0400, Stewart Hildebrand wrote:
> On 10/8/25 10:39, Roger Pau Monne wrote:
> > I've had the luck to come across a PCI card that exposes a MSI-X capability
> > where the BIR of the vector and PBA tables points at a BAR that has 0 size.
> > 
> > This doesn't play nice with the code in vpci_make_msix_hole(), as it would
> > still use the address of such empty BAR (0) and attempt to carve a hole in
> > the p2m.  This leads to errors like the one below being reported by Xen:
> > 
> > d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 clobbers MSIX MMIO area
> > 
> > And the device left unable to enable memory decoding due to the failure
> > reported by vpci_make_msix_hole().
> > 
> > Introduce checking in init_msix() to ensure the BARs containing the MSI-X
> > tables are usable.  This requires checking that the BIR points to a
> > non-empty BAR, and the offset and size of the MSI-X tables can fit in the
> > target BAR.
> > 
> > This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with AMD
> > EPYC 9965 processors.  The broken device is:
> > 
> > 22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] (rev 93)
> > 
> > There are multiple of those integrated controllers in the system, all
> > broken in the same way.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > Released-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> > ---
> > Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes since v1:
> >  - Introduce a DEVICE BUG prefix.
> >  - Remove extra newline.
> >  - Fix typo in commit message.
> > ---
> >  xen/drivers/vpci/msix.c | 50 ++++++++++++++++++++++++++++++++++++-----
> >  xen/include/xen/lib.h   |  3 +++
> >  2 files changed, 48 insertions(+), 5 deletions(-)
> > 
> > diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> > index 54a5070733aa..4ddcefbcb274 100644
> > --- a/xen/drivers/vpci/msix.c
> > +++ b/xen/drivers/vpci/msix.c
> 
> Do we need to #include <xen/lib.h>?

Can do, it's the same header that has the declarations for the printk
functions that we already use in msix.c, so if it wasn't indirectly
included the file won't build already.

Thanks, Roger.

