Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E86AD0034
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 12:14:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008380.1387673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNU5D-00076p-7G; Fri, 06 Jun 2025 10:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008380.1387673; Fri, 06 Jun 2025 10:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNU5D-00074U-47; Fri, 06 Jun 2025 10:13:55 +0000
Received: by outflank-mailman (input) for mailman id 1008380;
 Fri, 06 Jun 2025 10:13:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Fse=YV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uNU5B-00074L-Fa
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 10:13:53 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060e.outbound.protection.outlook.com
 [2a01:111:f403:240a::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0c76958-42be-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 12:13:51 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CY8PR12MB9035.namprd12.prod.outlook.com (2603:10b6:930:77::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Fri, 6 Jun
 2025 10:13:46 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Fri, 6 Jun 2025
 10:13:46 +0000
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
X-Inumbo-ID: f0c76958-42be-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NTbPGgJk7iRFbqOEqvMpEVpMcK2QQjIjO4wDn5e6KAXoQjVhsMLx4pNWOMsO1OOSqxninr4QWsgQ0ijdmOIxHNrZQDl+KkJP9PH2qyFZu9bYhsqgMMMbXA2Fw7vZZO6DfzwRDj+taGASHuPwmfLsxMTeirOswxyCLfNao3ilHqIG6/CtcMuKZV6gQF4SDOGJ04+LU5Xg1tUMnjMKK4xsISXYXP+5kmVqf6/CgTTqWAfT/VIYgH6k8w6IRl+9syLAol7mM3rvu+6ArkByFNSh4Iok178p0NEUm288R6S2C57/OTpj9K6FAAHvfp1gPaDa42VBPO3tCdDnW4xKnJs1IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ns4AgFo9XDRbp1s0mhDM41O9Qa5PyQc6OVVfa2WSwKI=;
 b=QLGjoolehJWQwLdmdN/TdVG2yF0ifo8P5ElQwCD+IcKjx6l2vtS3iz5sYonqFR7piFtriNYMvZ9suivJHDHOA29ZdSg0UcOJnTSAaH6C9yQlEtNXIObSSeO9iQmnTpGEpPyjUDIX8HQAdZ2Ah1iXnoIDuDCaUa59ludnB5/+VyQVltHj2cFyIDIIdvtlKnATQvCaLdtX8WuMfo1+c1PmesQM/ZP7U2q1ZUlsKK77gbXS2U4uT4aOvYKIMQuMBwnGxI60NVrgiCbP+btQ6nShfRjV5Jo4/E9p5eyvc7ITMGa8pXUXPazjw0nJaV7XMpgowBAt5JIly1y0wuqvnLdB0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ns4AgFo9XDRbp1s0mhDM41O9Qa5PyQc6OVVfa2WSwKI=;
 b=fQj6hnTZUvYbkfCxqn8En+8HItse46gvye8LhiRW5kMUNrrCpzLCvAw2axIVzSIwbWksWj6zLbsry8oUJmHuFsyW+fus4Rwq5bXrgg2DrXfi8BHxv6vSiSwlYv3aAf6PNsNXUm8AILyFwm4oTFJsKLIIoggjUNIg6xn+2hZa/hQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <dc8b0afb-aa0a-4ee5-93ef-ca6fa632b616@amd.com>
Date: Fri, 6 Jun 2025 12:13:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm/mpu: Introduce MPU memory region map structure
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
 <20250604174311.754899-2-ayan.kumar.halder@amd.com>
 <a2f337f2-1f34-41f1-9728-5f87ef2c7420@amd.com>
 <bb3ce203-de59-41b7-ad7d-3b1f3f1c9833@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <bb3ce203-de59-41b7-ad7d-3b1f3f1c9833@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AUXP273CA0011.AREP273.PROD.OUTLOOK.COM
 (2603:1086:200:2::23) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CY8PR12MB9035:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ef0a836-16ca-431f-8904-08dda4e2d2b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUc2T3QvZmhaMEl0RS93SUc3Z1JmNlc3RjRzakRwa3NNeFZGbTN6QkF2eGlY?=
 =?utf-8?B?WjREMVFhbis0ZzBySzdKaE5FSTlXOUE3bGVuWGRrZ0VJSFVlWkF6cTV5d3Jj?=
 =?utf-8?B?RVhjTjVrZE12dHBrTkltdzF4QjN1UWxOMjA0VVp3U1l0b0VQRWpuV283RWQr?=
 =?utf-8?B?blZiSlBaTWpFN3VzUTc3ZXVxaXJ6WEJuY2NOK01uZ2t4VEpjTnVxSWlqV1ls?=
 =?utf-8?B?WmxDcGw4K01JUVpYM1l6b3FrNWF2akVhSlBKcDhHNms3V05SVXBVOFZxRDFV?=
 =?utf-8?B?ZjhQeGJFV2J0SEdpOE4wa1ROVGk1dmVIVzFHZGFmQ1c2QVpzNXd0NDFhdkRI?=
 =?utf-8?B?N254OFpjckJFdzJWdEpoNUZUSmdCRHdlT1huQzZ3QldjVkx0d3V3NktkMmlK?=
 =?utf-8?B?VTBmb1Rma3VybDZDbklXaS9hcEJUK2M4TjJBVEVPd1dhMFJjTmxCcnJtcmZw?=
 =?utf-8?B?eVc5TzBVRGJMS3ZSMlRrVkpvbmZCTGtLNm5SRXNFWFlWSGpnT1FLUCtGNEIz?=
 =?utf-8?B?eDhtSUVSbVBycjdvek5UOTdETXpzK2hlMUh3ZnhFbjBKc25peXNvbFlKR3Va?=
 =?utf-8?B?UUxkOUthKzBiQ1lSU21ScnJiNWNDQ2l1UFUzUE81TW5LMW1ZV28yNHVabFJj?=
 =?utf-8?B?dDVxcHlBcExNT1hzWml4Wm9xb1N3cFYvY1IyV0RXeXRZajBKQnBhOFNUNlVE?=
 =?utf-8?B?cm9CMitpd0krWlJ2d0Y1eXltRzFPbVVrRkhiczNCbkFWNzRnWEFhWDJicmln?=
 =?utf-8?B?TWJ4eDhLYWROUUp0RlJxQkQ3VEtDa1BvTzMvMVU3amxyVDVLbUVpbG04UmxT?=
 =?utf-8?B?S2puY08wdjJwUzR5emk4WXlLZDRBbldydTg2N2JXYVBaUlVXU3BseFd5dWxp?=
 =?utf-8?B?dDBnTGFGdGpGeDNnU0ZDeFRUVXJIbGpGMGJDQlRPOU1KRmlZVlJLZUxVczdm?=
 =?utf-8?B?bXE5VjR5ejFpMlhDM1VVaUk2aGRsZmlON2JQLzBkYXk0aFZHV2Q0ajYrQWdt?=
 =?utf-8?B?RWVKbnQwWkVRVW90VWVBQmF6OXlaSWQ4SUZFQXpid2VSV2xaWm5EdUdsL0N1?=
 =?utf-8?B?RDRHZUdwWEluTk9XU1BjSTBKRUxYbnoydk4vYjdlalZsZW5salU0MmlIRzAx?=
 =?utf-8?B?K0xyZkdsWUcxZXlLMTBKSTcvVjVjSzRzbnVheXUyK1ltdlc4NEl1K2xKWnM0?=
 =?utf-8?B?SUorNlhQNE43QVZ5STZyR0VFT3RDSmdKU0R5VzZ5aWp2T2xicC91UmZidzFj?=
 =?utf-8?B?U3lnMy9GRk1GM0g0RmJaYU9XL0o3Nk5BZG10OVIwMi9JdU1peW9YK2VHOUdN?=
 =?utf-8?B?OTN0YzhNd0VORVNpaVphVkxsd1NGTkhFb1Y5RlFCZzFaRHVMQmdoLzkwWFlp?=
 =?utf-8?B?VUxzdmdaWll1ZVY5Q2VlWGNPNm5GZi9iMHVXbXhYWGZoRTdHdGNZd1JhR2pH?=
 =?utf-8?B?cHA4NW5wUXpQajlUaTAxRnR3NUVxUmlVUHFvMG13cmw1d2RYSGNzZ091SHVz?=
 =?utf-8?B?RkwvL2FEeEVrT05GSzNwaytVZW9wYlBzRDlNbEFvS0V6cmoxcjZJSzBlQ1hp?=
 =?utf-8?B?R0lLaDRkdnVPbWhJa3dPdzYyRlJ0N3ZsQ1dDODZZZ0drS0pPc25wd0JMUGxr?=
 =?utf-8?B?N1FBZHlsNGc4RG1MUE10NHlnWWJndXJWSEF3VzNlUVdWYktINjg0dkllZE5i?=
 =?utf-8?B?Y2VIeHJhOTdYVGZ4dXc5aC9Yd2p6ZnY4SmdYZmZrbkROL2kwczkvWDJJbVQw?=
 =?utf-8?B?RmI0elpQZ3lxeUJza0g2VkI4VlkycFZTOU1Vbm9RVStMbmVldUpKb295dDVv?=
 =?utf-8?B?azZsQmxHVjFIT01KTDE5YnlPSUI3TjkwektiOTJYK3cyc3NVTGpydjcvQkl4?=
 =?utf-8?B?QWlNWUk0SFFQYXJNVEltd2RSZkRPa1FXeWExTVVjT0Y4bVJISkcwVlc3ZG96?=
 =?utf-8?Q?PzdZXSYVUmw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3ZTb1Y3TVgrNmVrajhEYXBPZDN2b3pGM3ppaTk3RHpnVHA1SGNpV3JXTlB0?=
 =?utf-8?B?akNsVXZSMmlvdCtycnFtdFh6bnY2OElvVFNpekZnR2VFMVlnQzFRQzlkeFE5?=
 =?utf-8?B?QXpiM0RFc2Z6T09heCtLOUNVaCttLzlPbmJ6UzVvREdieXgwVWc5SUgrNmFW?=
 =?utf-8?B?SDJ5djd6MU5OTTRvQVBYL0VPTUNmYjJJSk1GMTlZRWJKcDgwaElSdFlPdStF?=
 =?utf-8?B?RHJnU01BaEl2akZwVW8wRnpvdVVsVUxjUVgrb0QvZitsME4zODhTdk5mMmpo?=
 =?utf-8?B?N09YOXpiaFZaRjgxQUVMOEpOeTMvbElMN1ZaN1c0bVZNVzQ1UmZLRzRVby81?=
 =?utf-8?B?eVNLUkNjZzNhMEFQdjE5YlNKMVQxak44MHY3bW9MajhHYndHNWJ5cUUwVjBp?=
 =?utf-8?B?ejZnem0rWVRDM2F1S1A2aTJKUVR4SnV4Z3UwcU1KcnFhR0ZEU0tQbUpRdmhJ?=
 =?utf-8?B?UjR0elA0WE9lUk9XS29mYi9HUnNZRkw1RE93bGpvQ05GNFdkUjJqbjVmTkZn?=
 =?utf-8?B?S2o4dHRhYkd0b2RkcStWeWNnbUc5YUJ0M1F6TTNCaVNyeUZhcnRPQ1NBRGU1?=
 =?utf-8?B?SXYxcWJ4NEJjOGJzN3FpeVV3UUJMTnZGbEFFbDBEQS9PeFFtOG1FTC9HOU5k?=
 =?utf-8?B?YTV0Q2V3MmhFdkVGeTJ3dDdqaEt1eGR3dkNkc1VmNHp4bE9vNUtOS3RFTnlm?=
 =?utf-8?B?cldwUFMyZ1Q1dURCdkR6ZERxeFlaUHBERHlsYlNYRldiUGljUWZKREhwOXov?=
 =?utf-8?B?aTdmRmlJTm9ZZm15c3hMc1dwWFdGQUNuZW5ZSmtjc1M3Sk9wOWJwZEorTUNp?=
 =?utf-8?B?T0l3cVh3YU5Ya1d0SlNGR0h6ZndoclRXbXBlRU45YmJiZmVVYUhqSDlxNVZn?=
 =?utf-8?B?L2pEanladWRzMmFIbFZBdFJCNGNVZHVkSjRaVnpUTURnMlFoZDRHbWZUc1Zy?=
 =?utf-8?B?TDBGSk1TMmxEQlhUVWUvdUhScFJ1T1g5VlF0TjlUakpub1NXVTRQTjhKbXlx?=
 =?utf-8?B?T2VCQTgvTm5RK2VLT05ScGQ2UGJPcGlXN3Y1SHlXUTVDZGJHaWRWb0hNZFhj?=
 =?utf-8?B?djM5V05jV0JlYVYrQjNVOVJvMnUwSnd4cGI3UW1RYXF5bHZ2UmNjbHJZN2lD?=
 =?utf-8?B?MUtkakF1KzBvcVRLbnZOKy9IektkSFl4L2JRVXpnd253S0RBQjZBaCs5RnIz?=
 =?utf-8?B?b2RCYU9JR29kcFd6aGtaN3I3NnVNR1N1MXFHMXc4cXl2SndXS0RKZ2FkaVpI?=
 =?utf-8?B?VVNlYVJqRkswRkJKSG5LZ29Ba1FjTEhSbWRZUGV2WVB5QnRFRmtkanhVd1pJ?=
 =?utf-8?B?M2lucERlWHN5VUxaTlMvVlk2YS9TQXZwOW1NYU56OW1nUHNONUsxNkZjMHdK?=
 =?utf-8?B?VGtLbVpOR2xsNFlaRGw1ZXlMSGNFd1J2cHFpU0UxbnZwN0lMZlJYUXYwaTFq?=
 =?utf-8?B?blA5YXJZTHl1WUlVREVMMHNtdHJxSmI1U1pRS2t6TldMZVhHdWZoSEtCcThZ?=
 =?utf-8?B?bWc0bzVGbzFRbVdDOVJLT1huTVBpRFJaSkladVkrTHZnT1lXbmd3bzhxOWtL?=
 =?utf-8?B?UWdlazBEWmtKU3BVbzVzSnhxTzk3azB5a2Zqd2d0WXI0ank4ZmNwSERjazVY?=
 =?utf-8?B?T1YxWWJFNHRQVG5HdDZMdDM0eVI3TjJzOTZnVUlsMzVRUE5LR2JtNHhqeTRu?=
 =?utf-8?B?V25veGtQWWdsT1JhUEx1eU5rS3IyWHg1aitMSDF1Q3hTZFVvc0U1QWF6YXQw?=
 =?utf-8?B?QjZSaWZxRHNyU1A5QzVlOVhQNUFRcG5JOHlTOFdnOFYxK1N4eHpEczRqcXc0?=
 =?utf-8?B?ZG95TGkyVDAvbHMrNjBVWkFVQUUxc3NLWTgyWDBQZWg5VklMeFFyejBUM043?=
 =?utf-8?B?Vjc5K2NZdXUvSHFqaitVOXhmVGI2ZUJSdDFGdzRBZGRwSVBqT2U3eXd1c053?=
 =?utf-8?B?MHJpM1Y1dDlaNWdZMW9qUUtDdUV5Q3lham1qTmE1T3J3SFBSWjk5NzY3aldN?=
 =?utf-8?B?bXZMbG9JV2NvMVlMUVRnSzRaZGw0a0pKbUp5MEp3UHQ5anR4UDdoQW1YZXlq?=
 =?utf-8?B?Zis0ZjZXS25CTTI2eW1PUllxclJMSzhneElxbGticHJDQ0RkSTJtMnhXa1My?=
 =?utf-8?Q?VguPW43QbiFTgue9gQ9v4KyhI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef0a836-16ca-431f-8904-08dda4e2d2b2
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 10:13:46.3892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DStJy91VYEWwMwPUkrnhCVlOmxMY/6ONyIzdVCgnR15lPSArvqKhrpMzJVLepV+E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9035



On 05/06/2025 15:39, Ayan Kumar Halder wrote:
> Hi Michal,
> 
> On 05/06/2025 08:06, Orzel, Michal wrote:
>>
>> On 04/06/2025 19:43, Ayan Kumar Halder wrote:
>>> Introduce pr_t typedef which is a structure having the prbar and prlar members,
>>> each being structured as the registers of the AArch32 Armv8-R architecture.
>>>
>>> Also, define MPU_REGION_RES0 to 0 as there are no reserved 0 bits beyond the
>>> BASE or LIMIT bitfields in prbar or prlar respectively.
>>>
>>> Move pr_t definition to common code.
>>> Also, enclose xn_0 within ARM64 as it is not present for ARM32.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>>   xen/arch/arm/include/asm/arm32/mpu.h | 30 +++++++++++++++++++++++-----
>>>   xen/arch/arm/include/asm/arm64/mpu.h |  6 ------
>>>   xen/arch/arm/include/asm/mpu.h       |  6 ++++++
>>>   xen/arch/arm/mpu/mm.c                |  2 ++
>>>   4 files changed, 33 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
>>> index f0d4d4055c..ae3b661fde 100644
>>> --- a/xen/arch/arm/include/asm/arm32/mpu.h
>>> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
>>> @@ -5,11 +5,31 @@
>>>   
>>>   #ifndef __ASSEMBLY__
>>>   
>>> -/* MPU Protection Region */
>>> -typedef struct {
>>> -    uint32_t prbar;
>>> -    uint32_t prlar;
>>> -} pr_t;
>>> +#define MPU_REGION_RES0       0x0
>> The name of the macro does not make a lot of sense in AArch32 context
>> and can create a confusion for the reader.
> 
> I know, but I want to avoid introducing ifdef or have separate 
> implementation (for arm32 and arm64) for the following
> 
> Refer xen/arch/arm/include/asm/mpu.h
> 
> static inline void pr_set_base(pr_t *pr, paddr_t base)
> {
>      pr->prbar.reg.base = ((base & ~MPU_REGION_RES0) >> MPU_REGION_SHIFT);
> }
> 
> Let me know your preference.
I did not mean #ifdef-ing. I was more like suggesting to use a different macro
name that would be more meaningful than this one.

> 
>>
>>> +
>>> +/* Hypervisor Protection Region Base Address Register */
>>> +typedef union {
>>> +    struct {
>>> +        unsigned int xn:1;       /* Execute-Never */
>>> +        unsigned int ap_0:1;     /* Acess Permission */
>> If you write AP[1] below, I would expect here AP[0]
> 
> Again same reason as before, let me know if you want to have additional 
> ifdef in pr_of_addr() or separate functions for arm32 and arm64
I don't understand. My comment was only about changing comment to say /* Access
Permission AP[0] */ because below you have a comment with AP[1].

~Michal


