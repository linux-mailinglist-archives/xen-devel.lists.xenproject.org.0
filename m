Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE70A3D2B2
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 09:01:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893567.1302437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl1UK-0007BD-CD; Thu, 20 Feb 2025 08:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893567.1302437; Thu, 20 Feb 2025 08:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl1UK-00079i-7w; Thu, 20 Feb 2025 08:00:52 +0000
Received: by outflank-mailman (input) for mailman id 893567;
 Thu, 20 Feb 2025 08:00:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=msSo=VL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tl1UJ-000785-Cj
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 08:00:51 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20607.outbound.protection.outlook.com
 [2a01:111:f403:2412::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca90fd46-ef60-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 09:00:46 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by MN0PR12MB6151.namprd12.prod.outlook.com (2603:10b6:208:3c5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Thu, 20 Feb
 2025 08:00:41 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 08:00:40 +0000
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
X-Inumbo-ID: ca90fd46-ef60-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EV/7MFr6YF1RnshgM4XT6xAPkpB2jVN7W3MgoCOVxGSg9VYekyahWzacye/ta3nJFDCsNWqBSCjrRoDh5YT1NdoZRCXtevYb8dBlnTZ6eODNeM/6IpsWDveMkpO5CvJzXMGBS8H9n/R0XfCbfKHElsO29pmeFOEJIIpAXRZR+giu+/tbLXW6VUZxlPC+ewtJEPUY0eVYpJhVxK9ce8d/RG4PPUAxMhvJFeOKPaZ+SQccWd1WnGEfPwWtnYW+FM6c6Osc+QTM1zBqPfustRSoYuzPkVT9tYg6MyW4oh5PvrCUOlvnD3TpGSkZbJPLkQTcei9zXSGuLzgYka5xysA80g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyqjZcytGHRcaTzNpm4Mi5xbBpTcDL9YyWzno2hcNwA=;
 b=CC9xW+MWkswMcbW31Vg0uYLRX07se3Elp86wMVamFd2X3jtLw09+qEHiGDnDsAdWbFPrdN5LjSSqDAQOqzMIXiNIVINcTD8Q5cbfRLFp5BP3nz9Beb3J3661wY6a/eF1JS93503Xpyco7h8RDqpjoyz1GDDipwcs7lMMYPm7qP9SWhsgpkjcUA2tCZG5I/k8SuCGbGm0WF9Dsgb95YsMXrw/0+/9BODtueypKrC0EWrHfljk41eGKSCDs3qE4J6uWhlQAomnb01h+jrWaIqUzTASbVIMH8AIMz0yXOwRupyxyZcL+rpYHQdYcatO3jIRY7IsTwoypZv8P97E0fYllg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VyqjZcytGHRcaTzNpm4Mi5xbBpTcDL9YyWzno2hcNwA=;
 b=FDpOxbbghPsriXYLHTMGe5uDPtmHyjEgLppNPrpzwY/nwjcbOu/KgiF2oDwqm+niacxaID8dR3QuCu1XpDfeNutP9ITqfOc4xcq/cYWR3DZcnjpqFgs4KlXtl3P0vjP2l0158Ff4sJ1lqFv5Kqxpdy0/FA/LNNNHFT9ZYMPg2nE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <18e030b4-8268-497e-b42c-f0d920fcb9c7@amd.com>
Date: Thu, 20 Feb 2025 09:00:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Create GIC node using the node name from host dt
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, oleksii.kurochko@gmail.com
References: <20250219172946.359234-1-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2502191825060.1791669@ubuntu-linux-20-04-desktop>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <alpine.DEB.2.22.394.2502191825060.1791669@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::8) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|MN0PR12MB6151:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fda2f2b-1eff-45bc-a379-08dd5184ab2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dEozNWI1YkFxS3F1dFowUVk3ZXByeDFROUYxUHNDQ1gvVDZUWE5WNUkyY1RJ?=
 =?utf-8?B?WU5zd2FoY3F0UTBXa1VYMlJwY2tOS1BJc1NXbjBPRUwyOHhGR2ZOYU5KWDda?=
 =?utf-8?B?MGJ0M2NSU1ptZjBMWHE0UjZSd2RhUzYvVE83SXdHTmtXUWNmSmZtV081d3dS?=
 =?utf-8?B?T1NJRDdRTjI4OEl1cDhQN240YXRXQ0xhMGRhb2NHeHpUMC9RWlpmWG5tV1FO?=
 =?utf-8?B?QXczMGZCR0crTmdTQlZlVUowWVp5SzIxUGlrZFp3eHA2czlvV1RGQjNOalJS?=
 =?utf-8?B?NEUxak5yaHd1ZnJFb29sMTA0RXJkT2xWUVIwRHJSTG4rOG5UYmlTQkdSWG9V?=
 =?utf-8?B?dE5RaUU4SU9saUFMZkk2cXVTVjUyRVFuZ05lRU1qR2MxcTVSb2VINDdoeThm?=
 =?utf-8?B?clRQQkJPV0l4d0kzNG50Q09UU1dKbjZETkk2ZFFucUpyUFJPN2NIbWhqRVUx?=
 =?utf-8?B?VWhNRmhnc1lCWlJ2R1lTNHVZTEx5bzRRUHR0aDluZXFxSUtjMmp3YWpaNzM4?=
 =?utf-8?B?L1cxYzhvaWtuZTlrVmRyc0FkdWM3bHJ5aDBpV3RucDdGdWpCQW51T0puT0gv?=
 =?utf-8?B?KzlHWCtoZVgrODdUWmFLdjA3K3dYTGpYWlBuclFXa1FubnhqdCtSb1VsZ2F2?=
 =?utf-8?B?dkJSUWh2OVZKK2QxbC9hSzdHZ3h2R1p0WWlrME9rUzNyVUE1d0hFdE5wajR3?=
 =?utf-8?B?SEk0UlkyRmk0TURNS09FWGJTTE9uNnhLc3JDZkJxNEJncTdBWFVGZ0pJOU5a?=
 =?utf-8?B?VHRENXVOKyttRFZtOWNwMjlQQkNDSVBTMm1vckhKQVpLbnVld3NFZlRaWEhB?=
 =?utf-8?B?TVRQb2NZMmpid3diSnFhUGxTdml1Wk10QkNXTlBMZk1YSXpFYk9YK0RVWEFx?=
 =?utf-8?B?VUREbENkcXZYZ05SUk1PREdxeUVzOHJxVE5JdWtGVUZtOTJVWFFMQW96MkRu?=
 =?utf-8?B?YVNDZS9sclBkbEkzK2U4SlRvQW1aUkFUNk9ubFdRaVNKNkw0K29PZzcvdXRT?=
 =?utf-8?B?bWxPNWxKUXNldnBwemNHZzdsQXBUTmFpQ1cxLzRGMDg4UlNYNmk2OVdJc2Ro?=
 =?utf-8?B?OFlWM3d5SEV1emZTZFNISWF5eGJkZWFxWEhvR3BuRFBXODFTOVZHUUNQRTZM?=
 =?utf-8?B?d3IvZXVpeVRTbUJtSFRiTXBhY1BVbzRFa3VEblZZYWlnZ1habTdqTWJyOWJX?=
 =?utf-8?B?b0dxdzNVa3p0UytZUUdkQ3ptREdUZWxGaXlVS09ialBQeTdLdGpmNkZIYmM4?=
 =?utf-8?B?ekRPRFR0QlpwU2puSy9jcWhoRi94QW9jMkt1dDcwaFBIZmtqeWZjTkRJZWRI?=
 =?utf-8?B?anpNb3VjUG5JNVJCSW0zamNIZS9ERkMyRlpUdk93TU53YWhIakY1M1JjbG5I?=
 =?utf-8?B?ZkN2UTQ4cDhwZ3VXelBLL3d6a1VUMUwwdFRBMjRFbWtSWkVOVkI4YUdqbUt6?=
 =?utf-8?B?MUJ5OTlDdlg2aEt6TFFBR01rcXpkdm1TWWs2RnpsUE9RaU5QU29vT0Y3WU1i?=
 =?utf-8?B?L3RxRnNkTXpValNzajlIMFhZQUIwZ3FiUWxNWmxwQVZCOE53djRxTTI0Q0JS?=
 =?utf-8?B?eWxqUEZldGZ2RHg2Z1g3c1poYjRaZHVNbGFwRVZkTWhtRXZCQTZONGtsQVA1?=
 =?utf-8?B?SmRRSnBZNktIWDYyMk9RTnV3bm0vL0RlZFUvVFhOM25SVGVJSjRTU2xVdThl?=
 =?utf-8?B?M2NiSlFuVGs1REpOREJEOUUrbmczTk9ZWWE3eW9ucW1mc1NRS3c2T245Umti?=
 =?utf-8?B?NThTbnBMcHVQQS9rVlRYcm5GUUxHWkNqTUx2VXJTVHZHNlVkWkV1T3kwQTJE?=
 =?utf-8?B?K1dCd2x5NzJ2ZlJRaUV1dUZTWE5jenJvUmUzeFFiSFdWZVl4MXlUNGd6L2JP?=
 =?utf-8?Q?wnpkjC4LhR0St?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U01SQmFNRU1WNXRhYks1WEU5ZVppT0tBU2hyZm5aam5KWWJFT1QycktheVUv?=
 =?utf-8?B?ZDZ6a05sVE85QkpYakhrTkx6eWxJSjdOTVVqWk51c3NFak9jNWYvSUdHSGpk?=
 =?utf-8?B?b2dld1cwYTZTUXBjclZpSWE4a2VxY0ltZnR3YUF6eWhXS01UQ3picnB4a0dZ?=
 =?utf-8?B?VE4zOEJMbGVGSFY1K2dpZlJ6dEt6K1Z6QU9TTDBhVnFZdnF0Z0VRaW12RDlt?=
 =?utf-8?B?empTdkxxQ21nZWNGeWFhaC9TNVFmWmQ0ZHErWHJQdUJVK2R0L1RMN203YmZo?=
 =?utf-8?B?WlNpNUZKSG9UcHc2dkE1SWFyVFQ1b1Q1QWRmUkxGRHNOQ2lsOG8yc2hFcFNM?=
 =?utf-8?B?bmwrdDBIVmRWQ3lwazNjVHgzMmUyd0Q3QVBjVWhJMlo3czhrYjRzaGFoQjJx?=
 =?utf-8?B?a0FPdnZnY0p2ZnB4eFNrTjhvSkR3Ujd6M3dvZ1g2Z2dlT0ZvLzJ3aHVNWDZC?=
 =?utf-8?B?M3ZGckI3MEJ0ZFAwaXdncmk0ODFINFN6eHRWamJaN0I2S1NZMXc3UUVxN1h4?=
 =?utf-8?B?MnJVY3VtejdKVXRDV0haVnpxSDFUOEVCaUtHUTNEc1NpajBheElzTGY5YzlK?=
 =?utf-8?B?ZGxxeGRpR0ZWZURyMkZnSjhLOWFmT3c5VEZsMWlwcEdhRHl5S01pRkhzOUxp?=
 =?utf-8?B?N3lNTGZQRXJnZ3NpOXRBN1p1d1JjYkRvUTB2eUVvS0pmMWRmZTZRS3p0Sk5V?=
 =?utf-8?B?QWVKM2gwOGs3RkNaZXpDMzRwVGkxcHgwSHRaM1FNMlo0VkJvWkd5UGNIVFQ2?=
 =?utf-8?B?ZWFzZ1N2Rkk1UG9uZXltTjMvS1VFcFpzekZmV2lIRnhhR1hMWHRIKzZmV2w3?=
 =?utf-8?B?SU95YUovUTJnN2tnRGVldERUaGdQKys0T1djcnBYRUlzbURwcXVOVnVjSjhI?=
 =?utf-8?B?ZW16dnorUWorT2JBekl0dXFxYTRLZFdBaktscmZGWFFBUURTUVJNNHNIV3E5?=
 =?utf-8?B?Wmc3OU10SDhKRXNTeHBNYjhRSk4rTXYxaEt4WGhsS0t0L1RCd3lxL1RNQWhz?=
 =?utf-8?B?aDYyKzk3ZVZBVVRKS1VmRTlWMmFUNUZmSTl5SVNsTWJMOHcySjhmZU9BcjNi?=
 =?utf-8?B?YzRBQmhuTmpZWU1xa2dSU2xxd1dPMjFsV29yNXZCVURoY2xuZUg1QXZUTEQv?=
 =?utf-8?B?NnY4MFJ4NTdCNk4raDlrbXpWTjU0dEVWTENRb1BKSjZsYXBQKzlzTHk3WXNP?=
 =?utf-8?B?bGZTVWVvSXJsYVRCTm16RFlnR1htTnlVclNaVUxkRFNqRkZSdXFTVlJVT0VO?=
 =?utf-8?B?R2VBTlJSUlNRQ2tQS1kzaTlxN3RaOVFQTzhwSXZrMmlyMGZRNVdUUVVNREl0?=
 =?utf-8?B?VEVoWnFWeFJDL2QxZ1owa0JqQ1dJbmNPNzlOSnd3NTVKNERsdCtEV1BRZ2dk?=
 =?utf-8?B?T1dtSTFOZFZUd1V5aXBGT3FXcGE2VkI4MXVtU084UzNUdXNKTVdNTXR1RjUw?=
 =?utf-8?B?WkU4dTFEY1pQYXRzM0wveGt0d1hvamF1MXFGQnhWRWQ2WFB6UzhlRXh2cHRx?=
 =?utf-8?B?U0srNVVOcE5XNDFDMnBRK01oWHpxL0pRRFQ0L2VkbFRYQ2VsUFNsRTBveHZ1?=
 =?utf-8?B?aHVSV2hpU1pNNHBsc2lFVjhOMGpvd1hsS1RSWFVkTnpYSmxxZWVNck5iZG02?=
 =?utf-8?B?ODUwNkZEU2RjYUFDQnQ3LzZlTmw5YWlNZHRWUWp4NzVkK3h2L2hlYWhHT3Nt?=
 =?utf-8?B?QmlOSDlOWURQclZaWGU1TXdZMnNKeUJkcEp2aGRWQUxGL09rc0ZOUEIraXcv?=
 =?utf-8?B?OWp6dXJ5WlFTbmN5VWJqMC82M1pnNzZoRy9zblB0Q3JWWVpPa0ZNaWk1OHVu?=
 =?utf-8?B?RXk0TDRHZTlZZ1JMeDNqVU5Ua2MvRXhhb0JhNjFDQTB1NnNNRVRxVFlRWjdU?=
 =?utf-8?B?WUROaXFSMVYxbkdYUVk1NXVhOVlhdHNQNDI5ZU84Q0l4N2NCc0t2TXBBZDZ4?=
 =?utf-8?B?V3lWVDRVRWRaV0tPdDd6TmozSUNxL3JkdUNSS0Jwc2ZMS3Zva0hWakVOazRX?=
 =?utf-8?B?WFM1d0MwMkhWSXh2Z3Z6OThlNHFEYmVYd3BWcmtJWExGZ2RMdEQ3TjZPRWw3?=
 =?utf-8?B?MnBLNkh4bmFEQmhsR09kTTg1R0YwOGFaMWxhcUptUFRucXVuU2dMKzliVDUx?=
 =?utf-8?Q?aVGI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fda2f2b-1eff-45bc-a379-08dd5184ab2e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 08:00:40.8380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKOdnG5vlTaf+cNgNHi8gCJtp6oWlFoQf4fK4VVoYM1ws61XvqQW58Z1cK1qPdl5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6151



On 20/02/2025 03:26, Stefano Stabellini wrote:
> 
> 
> On Wed, 19 Feb 2025, Michal Orzel wrote:
>> At the moment the GIC node we create for hwdom has a name
>> "interrupt-controller". Change it so that we use the same name as the
>> GIC node from host device tree. This is done for at least 2 purposes:
>> 1) The convention in DT spec is that a node name with "reg" property
>> is formed "node-name@unit-address".
>> 2) With DT overlay feature, many overlays refer to the GIC node using
>> the symbol under __symbols__ that we copy to hwdom 1:1. With the name
>> changed, the symbol is no longer valid and requires error prone manual
>> change by the user.
>>
>> The unit-address part of the node name always refers to the first
>> address in the "reg" property which in case of GIC, always refers to
>> GICD and hwdom uses host memory layout.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> While this fix changes behavior for everyone, so it is risky at RC5, it
> also fixes bugs with DT overlays, but that is an experimental feature. I
> am in two minds whether it should go in right now or not. Maybe I would
> wait until 4.20 is out and commit when the tree reopens.
Technically this is not a bug, hence no Fixes tag. I'm fine with this patch not
landing in 4.20. That said, I don't agree with what you wrote about a change in
behavior. There is no functional change at all. Only the node name change. It
could impact only those OSes that parse by the exact name which would be super
irrational and wrong. The only way one should parse intc is by searching for
"interrupt-controller" property as written in DT spec.

~Michal

> 
> 
>> ---
>>  xen/arch/arm/domain_build.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 7b47abade196..e760198d8609 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1615,6 +1615,7 @@ static int __init make_gic_node(const struct domain *d, void *fdt,
>>      int res = 0;
>>      const void *addrcells, *sizecells;
>>      u32 addrcells_len, sizecells_len;
>> +    const char *name;
>>
>>      /*
>>       * Xen currently supports only a single GIC. Discard any secondary
>> @@ -1628,7 +1629,11 @@ static int __init make_gic_node(const struct domain *d, void *fdt,
>>
>>      dt_dprintk("Create gic node\n");
>>
>> -    res = fdt_begin_node(fdt, "interrupt-controller");
>> +    /* Use the same name as the GIC node in host device tree */
>> +    name = strrchr(gic->full_name, '/');
>> +    name = name ? name + 1 : gic->full_name;
>> +
>> +    res = fdt_begin_node(fdt, name);
>>      if ( res )
>>          return res;
>>
>> --
>> 2.25.1
>>


