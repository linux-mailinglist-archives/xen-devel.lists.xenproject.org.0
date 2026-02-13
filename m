Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CL3EWDgjmluFgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 09:27:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA1E13404F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 09:27:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230325.1535825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqoVp-0004sn-2g; Fri, 13 Feb 2026 08:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230325.1535825; Fri, 13 Feb 2026 08:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqoVo-0004rN-UT; Fri, 13 Feb 2026 08:26:52 +0000
Received: by outflank-mailman (input) for mailman id 1230325;
 Fri, 13 Feb 2026 08:26:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/W2=AR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqoVo-0004rH-Be
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 08:26:52 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd5d2b23-08b5-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 09:26:49 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW5PR03MB6932.namprd03.prod.outlook.com (2603:10b6:303:1cd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 08:26:45 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 08:26:45 +0000
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
X-Inumbo-ID: bd5d2b23-08b5-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0bcAuQG/OWoLkOWBE8FIijTjnHBuKInDR9gVEpN9LMC3nNaS7sZzvBwt93GFPl+FjzF2UlynTiHjo8pNJRGBs8MFSBSwQJlP6qdwTey3C17Ir3UIkhKvKNfItgkMo7txxN6fdmf9gO4JvU6JyPBUcRI+pH1x0PiyMAfvpTywWF4VoFLmXdnSmOseUtu6CWetNQLcGN7ysT0SkpFfVxT8GvxHrrd2xLmdFWvPiRF0DfjGfF60UEVeih2ZzqEuG/EFUcYeUEES+VKzS4pHvQAHmErcQNlBrm1YQ4RI3CPoo4FKiMtSNt6GHuOxE1bcMw+a1/TKEGBlYXLq3NEFxQXaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeozffoWk4867hcMMzDJBYr4g9lxsgDRJMBwggXTYuo=;
 b=HzFrzQ4hIlNSF+CZL9NCyVpVEoMyqecHgMJSuruKAMzZe8VT3WBHia1GandAINHxOEcEx16oGB/LwzCyMKaeYw1ini+lHIfqTbMP2UkzqEdy/oG6tyF6sXj7izIkCEM6dVLUFSiXlH4oluaF6MvA0WY/5SuP26+1WvBTPalPa9NFMNxFTk5ZfC+OC9R1OJJISp7Hd5r9YgzwmvxaTl6rRmGNhKlRRGwApMpLOdGzoN0C7DUwhy/l4FunP3oxHctawWTkDbL8SbM2bQxnduPIe4n2G0Vz9kkYk14dGTP9NxH47pMgpnN3UKln+BSpNeolgZ2h0EKpmzu0b4wxC/cRuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeozffoWk4867hcMMzDJBYr4g9lxsgDRJMBwggXTYuo=;
 b=mmZHhZsaxN4B6p+1jgb5FNnDemrJimhfzghVBG5+i3mBjjSO03NEHv0q7zHF3KU2bWZO5fLUi7oDghsLCWEcahCyM/skLIk+Nb2VtxtNGnqhc+ZDqYDxLHuk4MEiKK2xRUGmIYJSBcLdcuWbmHGpyrgNZ5Q5IGcseKCMca7N3k4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 Feb 2026 09:26:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: Put wait.c behind CONFIG_WAIT
Message-ID: <aY7gP2x10JybVoA5@Mac.lan>
References: <20260211170118.109946-1-jason.andryuk@amd.com>
 <73bf621d-0795-4fbe-b926-71be3525b4c7@citrix.com>
 <cb5da09b-66c2-4dee-8cc1-f67f596a3c18@suse.com>
 <37fd63a2-786c-497e-9bf9-de9ea9708509@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37fd63a2-786c-497e-9bf9-de9ea9708509@amd.com>
X-ClientProxiedBy: MA2P292CA0018.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::8)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW5PR03MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: 1359ddfb-5a85-4634-4887-08de6ad99fa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N3h5dEZSRGpNK1dVa3JaMFhuOGs0RXlwNHlKNklXTVFudFIxSHhhZkJQQjZF?=
 =?utf-8?B?eE1ISFV5OUZFRkhnZHo1azNSbTc5a0FJd1FqK1pJSmxMNlJWMk1Ha09nK0VW?=
 =?utf-8?B?aVpVdEFuSHpGOXpzK0hiaEIvS0M0SzRxdEIyTkQxMm9Odjd2ZVp6d0RkbVFJ?=
 =?utf-8?B?MWFrTDJEVVpHVDUrSGpoLzlaZEFWZWRDTmNHTFdQZEFZWFFBdlBLNmpWSlp1?=
 =?utf-8?B?aFBQdnVJV2FPOFYydVRobGRoQXdCMFhaSGRLWUpXcEtkZHZKZFFDdHB6cFBV?=
 =?utf-8?B?emQreWFmb2FMV1NTTnhXeURpaFhsWGpwTzdYVUdEdUJmT01QYWpYVUdUa0xK?=
 =?utf-8?B?SkhQTXZoL3RuSHBBRE9TK0gvR1FMNkdRRUxjc0kxYTkwYTFvQ0Yyam8wNkkv?=
 =?utf-8?B?bVFWeVVaZzBrUkVoZ3ROOVJVa3FXVWNtcGNVODdvQzNVM0Y3ZmxDMjhqU2JC?=
 =?utf-8?B?YjVMUUwxd1JQam5VWWJpc0pwalk2ZHdJNWNvTFlZTEhscW54eXBhZVh5Zms1?=
 =?utf-8?B?dkdDUGdJUXEzYkxJelByU2RHOSt1Mmt3emFNOGk1TFhwazZlcWxtTC80bWVK?=
 =?utf-8?B?b3BzMzJJalJ3MW5Fc0dUTGJVODd6YXREZmd5WHlEd01BN0NRQnFrMGEwd1Rj?=
 =?utf-8?B?S1RVR1A3eUptM3UxSDNBeDFiYmdjM2FNbEpEeFllbHlSK2dycS9PS2huZEhB?=
 =?utf-8?B?ZUtXU1hCT0VtUzlQRFNVTUNLY2tuYytxeGc2V0laMUY5N3Y2d01USU9iaU05?=
 =?utf-8?B?WXQ4MUpjR2pzTTRoeS9rbWhNVGQ2R2ZlYmFxWm4rRWRwMlBwOG5rUlNRTDUz?=
 =?utf-8?B?bDBFV0d5Qi9KbzJvbGJvWnJOWGN0SHB1ajJmLzE5RWt0ZHl1SEQ4VkRYTlln?=
 =?utf-8?B?ZU9POCttbjBmY1h6Q20yM0VYQngwRlc4YVdTbDdwRGZLQ0R4RDhCc2lqZkNa?=
 =?utf-8?B?UE4xRjI1MHJ2eHNValBCOVlEbkpsYW1wV201d0xZQlI4WVA0OTJ4MTBrKy9I?=
 =?utf-8?B?ajZ2YXZRQU5KeDQ5dDVnR1ZVVG56VXVMaDFOc05pdnRGRHIzbXpCNGtyWld0?=
 =?utf-8?B?ZWhicEV4UFMrS29IeHdGYW1ONGxXazV6M3Ztc2pNWE5ZOG5BMTh3azkvaXVa?=
 =?utf-8?B?QXVZREpTbklqeDZEVm1YYWF2ZXUzVzlUWGlrYTc1SEQxWmk3K01ibXNaM1Bq?=
 =?utf-8?B?b093Zm9SK3A4U1hKS2xyNVhmS3BqdEhhdVhjQnRhNGNDbWVnUHU0TjVzR1J2?=
 =?utf-8?B?dThYREZaNUgvSCszanA2VzBlZTJoWXdTa3JSNG1Oa1lqVUNpV2pGVDJpeW5l?=
 =?utf-8?B?Q1NobzFqVFFKc1YyK0Ezd2lNbmw1eFhZOEc0VVJoLzlOQU14ZUZGaVRlTHEy?=
 =?utf-8?B?MVRHUlFIUW9zOUdlYzl2aXBmSndSQW9ScTdXMkpWRkZndXc1SWIzWjhsYzFF?=
 =?utf-8?B?d0dnd3MraE9kQUF0UXRJemVCQW9iTjRtaUNteks0U2NlUDcvYVBmbURzOGFM?=
 =?utf-8?B?NUhWb3ZKUzB2MXRYNnpMcUhLNUtxWEx2MHpibXFJOS82UTNtc21XczR4TnB0?=
 =?utf-8?B?LzJXMDdNNFc4NEZtWDVLT0kvbUxFblY3T2dUelV4K3RvTDRTWmdPdWUvSjU0?=
 =?utf-8?B?MnRQNFo2VUVrYjFiMVlXTlE4cW5iRy9zRTZUUkZuZGdWT3pCcEZZekdpZ1JK?=
 =?utf-8?B?VkNZNU5YSnQ5LzFNdjlYTWMwSk82RUl0R0hjR2NnMHg5Vk10K2dncUlOdVh6?=
 =?utf-8?B?WnlONFlVZ2J2MlhqZ0dKSmYwNnl1Z1VkNnNIaWgvMGZ1VW1ScVZPTmJzL1R5?=
 =?utf-8?B?S0loQ2dITXNxWFAwak5VVTFCSzVIM09aUlQ5aFVnTmlnVmUwNVZwZmt6QzMv?=
 =?utf-8?B?cHc2NmNuRS9mOW1vd2dTbWxCWUd2UWo0MUpMclJjNGVITUtEUERjS0M0VkR4?=
 =?utf-8?B?K2VIKzQ4c0FNK1MrNGdpcTQvK3B5UExMMVh0Y1M4dkY4aXlhMVNHRUFBMUp4?=
 =?utf-8?B?dzlkUXVYVFUzRWdYTTBCWlFBSlkxZnI2Nndaakptc2xFRTR6SzVSNGNtQ1BX?=
 =?utf-8?B?aHRxbXVPVkJxaktqVUJIdnl0dlNvUms3dGYxR2RaWk1pZDFjZzk0dkQ5QWxG?=
 =?utf-8?Q?1MZ0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGNoaWNIdjR2WFBpQWcwTzdKMjl1MG1UZ2NpMlY1WW9yR2V5VkhNY0VJZ05u?=
 =?utf-8?B?cWtxcERxOU9lU1ZReTZMRTNTNFZTeFVDOWhmR1FtazJtZjFEL3pmYlUzUHdJ?=
 =?utf-8?B?eTJINGptZU1WSG5hTmx5NlhzcTBIZWhNNmV0clVYazQxRi9ZQkpxRnlNdTFy?=
 =?utf-8?B?ZUlvcVUxdnNNKzBSNk5OR3Z5NXFheHVtVlowY1hsc0tKV3FhRWNEL2VjcHRu?=
 =?utf-8?B?MEszMmV3amtxRHUzR1JDSHprdFFTbUNuV016S1RIam9rK1g2RHNxbHJoa3Ri?=
 =?utf-8?B?VkpCL0RLN09WN2lreTViU2VOeW45Y1ZlcUhmVVQ3RWdKKzVjUzEzU2FwVnQr?=
 =?utf-8?B?cll3VzZ0NTh4S3R4NzFCOWE0MGFJMmZZRTQ1ZzgxbGRaQkxSb3B3eTNoTFRK?=
 =?utf-8?B?a1M5c21EVTl2T1h2RGZXM2gzZG9NVDJoS2dLQkg3d1A5SXBLZFVEaXpSNXZW?=
 =?utf-8?B?MTJjK05LeGRLa1pSc2kyRVY5ZU1sNFNvQmg5ekU3cjlGbC81bUNlVCtOSHJl?=
 =?utf-8?B?U2k1Zmwyc3RDMjZKOXNBQXlVMWZPSVgwcFFBUHlYeGV5UG1Eb1Axc3ZrQmR4?=
 =?utf-8?B?QW41b0Jzb05kWlJXOEhmTEwwd0NUS24zQm0zd0EyK2FoUGtrMFdWcHo3b3Za?=
 =?utf-8?B?L3k5RVBkQVZBRXNzVkNwS3FsVXFOc1pFRm1xSjY1UWJ1WXlDcGdPYUFkdENl?=
 =?utf-8?B?dmNJUVMwZFc0N1hFMDIyalY2NGVmdHRPY1I4Rzc0VG41TVRYOE1janZaNEFu?=
 =?utf-8?B?cUFBNUlEd0d5NXhtNHVxYWZ6U2dBbnIzblYxT0lKUVVDQ2VHbnppU09oZ1Nt?=
 =?utf-8?B?bkxoMFB6OTJxUWRXRzVnWStYZHQ1MlE5MEI3YTZHV0k4UGFKV1BaRWhsU0Fz?=
 =?utf-8?B?VE80Z1dJcmFoUTJFdTFxK2RGSXNac2w4WXhDbXVqTWNUSlR1VW1ZV1pyZDht?=
 =?utf-8?B?WUZlcGRLdkYxamF3NGZ4eHd5YXhWYWppTjhlMkpGRXdDbUJ0VThMRHJ1aDlR?=
 =?utf-8?B?U0hJc09LL29LWGc0S0hjRXVRbnErZWxWK1l1S2dZcFZ2eXJoOWZUcUdOV09U?=
 =?utf-8?B?OTgzdWlOZTVZZVRSRzBGR0J1ZkVGSjVhd0RMUitLRjRYYnc0VnJYUmNHTUpy?=
 =?utf-8?B?NE5xQ2NjZkgwYXNybXBJRjVidmM5QkRZRGJGQ0lPSW0vdVlPa2tvYzZIZG9j?=
 =?utf-8?B?bTNEWlcyb0RXTW1iNXBWaTA0RjNBZnFSeXJCbE9NYmtnVFAxR3VDdExnekIz?=
 =?utf-8?B?TkNLaFlQYkg3OFR3WElNb0NxOWc4OFNJTS9GNlFxT0YrWXdJekE2TnBmVjg2?=
 =?utf-8?B?d3N4ZGM3aFg0RER0QXlLWW1tVFIzK09RYjZ5eG1oUlluSWllYmk1MytOemVD?=
 =?utf-8?B?SnJndUFQTDZYbVdYZ1J3eXpXSUlISVlTemNaZE15REMzeDl1RGJkVjBycFJw?=
 =?utf-8?B?ZjFkMzE2aVlRcXgxKzhMRUxPWXBOR1VIM24yMnpZb244Z1dmSUc0OVBsWGFO?=
 =?utf-8?B?TEpsUFYvUjJkQ3M0Q3FuWGkwVk1DS1VPVDBXbHU5SjhSdk03dHF0WW5Dd1RS?=
 =?utf-8?B?RnNLMnBFYlcweU56dlJUdVR6cHZTdkx0SDV2T3ljcW9BbXRQWTdBVXp6M0Rs?=
 =?utf-8?B?OEFUb21vR1BKcm5CL250UkFkc2V3MDk1czNGcEhSbnhOdE1hbWtua1RnZWFP?=
 =?utf-8?B?eGVQV3pQeW55VGlKajRPU3NSMFZHNFNyYS9BbWNmTlVIdS9VUUpxZXlQRjJ3?=
 =?utf-8?B?STRydVAvK3FFVG0vOXVnVmJoaWYyQlVGUDExVndwREdHQ2piMzhlNllXMjRI?=
 =?utf-8?B?U1NLQWMxdW1IWEp6WFBuWW55WlhPR0puakF6aER0ZHJ6aEl4WVdrdlQ3bnNG?=
 =?utf-8?B?c0prNWt4Qnl3aDl5RS9leTBnakFvOTdBY0x4aFpLNlBnOEEvTmVmTGhEQWtS?=
 =?utf-8?B?MEczQ0dERU1Rbk1lVXRRVGl1R3hQLzM3Vlh1TlRDZnljeGhTOXlEaVBsNFFD?=
 =?utf-8?B?dW91V3hQY2tHQ0RHY21oVnB1bG9BbUtLWDR3SE9NWnRsN3pHNkdoRW1mZkpP?=
 =?utf-8?B?OCswMld1TnhhS0JqcWVvYkVEZC9uaEtuSG5zS1R2Wklsdy9EMHZOVmFyRVA3?=
 =?utf-8?B?S1FpazRCSW5oTS9QVkFjSXpmYmtXS2NlNVhKZTQ5Sk0wWU9HMkVuTjlYZk1T?=
 =?utf-8?B?cmtxSDZaNER5RHlxVlhtRlAxZDFjYlBPTHB6TVR5V2o0ank5MmZPMVNoVmRy?=
 =?utf-8?B?SWcyRmltNTVDL0VxNmkwZG93NlZZOGNhRXRGem1jbERtakk4MDliUk5vbzlk?=
 =?utf-8?B?TW5kMGg2YmVSN1U4SlZZbnI3N3huZ0psUEJZcUZ1T25ydUdvcDdXdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1359ddfb-5a85-4634-4887-08de6ad99fa9
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 08:26:45.5664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Az1/PFepZTVwM+S1lfQBV7hQXugG2VqLGd0PqXYQ+zQdPz7eRcBxI9aLIwC1SqDTUrQJ1gAdGy9boCsc/BFPfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6932
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7BA1E13404F
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 02:14:58PM -0500, Jason Andryuk wrote:
> On 2026-02-12 02:38, Jan Beulich wrote:
> > On 11.02.2026 18:30, Andrew Cooper wrote:
> > > On 11/02/2026 5:01 pm, Jason Andryuk wrote:
> > > > wait.c is only used by vm_event.c.  Make CONFIG_VM_EVENT select
> > > > CONFIG_WAIT, and use CONFIG_WAIT to control building it.
> > > > 
> > > > Provide stubs of functions called from common code.  entry.S needs an
> > > > ifdef to hide the symbol from the assembly.
> > > > 
> > > > Also conditionalize .waitqueue_vcpu in struct vcpu to save space.
> > > > 
> > > > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > > 
> > > I'd really rather see the API/ABI changes required to purge wait.c
> > > entirely, but I guess this will do in the short term.
> > > 
> > > Two things want further thought.
> > > 
> > > First, because ARM uses per-vCPU stacks not per-pCPU stacks, it doesn't
> > > need this infrastructure in the first place, but it looks like it's
> > > still compiled in and half wired up.  I suppose you don't notice because
> > > you compile out VM_EVENT on ARM too?
> > 
> > But if we want it compiled out altogether on Arm, ...
> > 
> > > Second CONFIG_WAIT isn't great name because there are many things it
> > > could be.  I'd be tempted to just reuse CONFIG_VM_EVENT and go without
> > > CONFIG_WAIT.  I do not want to see any new users of wait.c, and it will
> > > disappear at some point.
> > 
> > ... don't we need a separate kconfig control, for it to be selected only
> > on x86 (or for it to be dependent on x86, and then imply-ed)? Imo
> > CONFIG_WAITQUEUE would be okay, as long as it won't have a prompt. We'd
> > then simply want to prevent further select-s / imply-s to appear.
> 
> ARM VM_EVENT=y won't link without wait.o.  Undefined references to:
> wake_up_nr
> prepare_to_wait
> finish_wait
> destroy_waitqueue_head
> init_waitqueue_head
> 
> So I think that points to re-using my original patch, but with either
> CONFIG_WAITQUEUE or CONFIG_VM_EVENT.  Since CONFIG_VM_EVENT is the only
> user, and we don't want further uses, I would use that.  But I am open to
> either.

I think hiding behind CONFIG_VM_EVENT is better, we want to avoid new
instances of waitqueue (at least in it's current state), so not sure
it makes a lot of sense to add it under a different Kconfig option if
our intention is for waitqueue to only be used with VM events.

Thanks, Roger.

