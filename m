Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15069A6EBE8
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 09:47:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926134.1328997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twzvm-0002jx-VS; Tue, 25 Mar 2025 08:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926134.1328997; Tue, 25 Mar 2025 08:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twzvm-0002hU-SF; Tue, 25 Mar 2025 08:46:42 +0000
Received: by outflank-mailman (input) for mailman id 926134;
 Tue, 25 Mar 2025 08:46:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uDid=WM=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1twzvl-0002hO-Ar
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 08:46:41 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20630.outbound.protection.outlook.com
 [2a01:111:f403:2413::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3296685-0955-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 09:46:27 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by LV2PR12MB6015.namprd12.prod.outlook.com (2603:10b6:408:14f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 08:46:24 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 08:46:24 +0000
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
X-Inumbo-ID: a3296685-0955-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijJHnegDJrCy38FQsozp91tpdnq1xvTaLc7Tn+d0VDLw8FsTwABAk2UOTp4A+9HzQFpEKuYWzv7KHsEGwk7NjS2jWvsvDymc5bCwI6XxSb43i/aVZFkFgI8GkCUR/aRWVHaQboYo5JpSYj3AGKa8+dZljf6esqYMh93LVkXPJShnmP5yk7N0wzSs3ye/XHd9W5v8uloQS4Pfvc29GoQRv3X0A/Eh5ggME7bzv08yEa2Xm22dHACCwrsqbZTwgSqGd+rXUZzvXN4paq7K6fq7x4IC5ojazkVJzpoBkmcf5ak5G8WFzxbvB/mWbrQSYU4lWOYWnQCpe+MpcXIvODGyLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjOTkbkYTS02rJHZrk7Jta3DippgZFvHnLCM2yf7V3o=;
 b=sA4f+CGf3sNs1sViHmrcLdWwMUhNzzltKU41b3s2EbRvBZvFpJl5tLnXyoFtVaCaycIL/dGFivPkWwdimAJ+JVd/YISMpsN6pVfEAIRlN5uK/EO7b71eP4z93gbVyU1bUxsLNAKm2i5SX3OYuXhOTgKv/0RLJyYwk0IRnuIGYYWfIN87JxpMQlPa6o4CYaKZUz4Wtmpy7Zd5WEs6nv8gKfQpD7WQcya2Vq+XMOLKOhyeWEsctFKtrIizr7p/BIJqd5hMr64UCK/bwrCRzwl4RLPYXEpW7XzElkFyeR9NYTwm7RHw9pR8hVvOGr4cuziC1U3VUZq1lVE2xKbtJ2ViLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjOTkbkYTS02rJHZrk7Jta3DippgZFvHnLCM2yf7V3o=;
 b=e2w/MLLuN8lS4W/j4MDnKENWB3CNL7WJ+6m/Ool22z8n2kM+NTLUtGKvZ30N6AurGrBT6Ok5iaWD31YDT1b8XZpHNRQm8cE1mh3ZxpM5MCmxsYd6jM/xocPRfreCvhHpm3tHkdRMWm9RiOd1DNMGqXpexdlhreVWftCtVVkSB7g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c944a7b1-480d-4ef5-b489-be220792e3b8@amd.com>
Date: Tue, 25 Mar 2025 09:46:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/device-tree: Switch back to
 dt_unreserved_regions() in boot allocator
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250324212731.1702255-1-oleksandr_tyshchenko@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250324212731.1702255-1-oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::13) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|LV2PR12MB6015:EE_
X-MS-Office365-Filtering-Correlation-Id: 3703c1d4-631a-430a-4167-08dd6b7985ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c1B6Q0xNcjRHZHFadnRqRWV6aFgwMTNSamE0Q1pDV1Q4RHpEMHp0TUtIcVZV?=
 =?utf-8?B?bzBvQ2VUY3dMOXY1ZEJPYzJsMVMvQnJ5SDNqNHBMa245UjdwcGI2RXpOWDl1?=
 =?utf-8?B?Q0pranR6V3JTdG9BWm5jcWhFL0lieHZoeW9qQ3dJVXYzRGZuTEtKL2YzMkNT?=
 =?utf-8?B?RjVHdElkSEZZZUYxbGIwNjJieFBIN2dXcElxTXFkMVRSMSs3aDJveVBCL0tt?=
 =?utf-8?B?K1NXRW84cHFWVGl0cEhid2NHY0RoZDQ2ZldVUCs2MDJLK2FieHFORHJxVGZm?=
 =?utf-8?B?anRhM011TlpvaEQ4TEZJVDFhTXZiQ3ROZFduL3YrMW9sM29lWFk1UktVWW9E?=
 =?utf-8?B?Y0ZkaGxsLzM3QnYwQVlXUUs1eklJdllNYjZqWGV3clY5V3MzbmtTaFN3M1JI?=
 =?utf-8?B?Y2ZPcWd2dXhoRjB5NUJEVDZkRHZONXp0aEoyMnFLNExhLzlYalVzTFBLUjd5?=
 =?utf-8?B?R01GRkpIajFXd2R2QytwVDNlai8wdnpWMWRkRDl0Um14UGxGRmV5ODg1d0Ur?=
 =?utf-8?B?b0IrK1p3Zm54Y3M2ZUU2eW5XZTBrV3F4cEkyZlo2VEFtMk51dmpFWVJmSTNl?=
 =?utf-8?B?QmhwbFFhcUxFeUJTUnpaN29uTE0vc05MZEpLWlZkUnIrYkl1NVk0NXNrYXkr?=
 =?utf-8?B?RXhvU0R6UkdYMitub3V1WjN3Zkw3SG9hU1hKVWFSaFZ3SE42QjcxcjJPM2Q5?=
 =?utf-8?B?UHp1Qlh6SDdSdGVwZmtjbXgvakd3TVY1OFQyeVluUnlPcFNxVkVJZ3IwcVk2?=
 =?utf-8?B?aWZLNEdnbDJZMmJ6UWhaU0cxSnBsUjAxcVQxb3dRblc3bzNDTHQ4ekhrRzdq?=
 =?utf-8?B?ck5wMkNxUi9VV2dReUJER29CaG5GR2gxV1lLSG5zZC9xZUs0K0hTTFY0WW8y?=
 =?utf-8?B?emZYU2hrVG1yT2pXTXFzZmU0c3JsUmZIcndWbHZOVzVmeXFtcEZ6SGJRVFIw?=
 =?utf-8?B?WFpyRVlwUThmTkRZd081SlZIU05hbjdUQy8veDlQOXhDS2NhUHdUUFNhL1pz?=
 =?utf-8?B?M1N6Z3hxaHg3Q3lmTUVnV0NIREt6Uk5iak5DK09BZlZBWjZPSjE2aHQwdkQr?=
 =?utf-8?B?S1IrTk9VZEZkUU5qOG4zK3dudzJKU0Vrc2RPa1ZXWTBWdk9mcExyVGwwMmM0?=
 =?utf-8?B?SzJHZTJUeTI2LzUrVHB3UXl4K1VFYXRRTjY0eHN2eWVBN0VqR2hNTVVVaVRB?=
 =?utf-8?B?R1VuNzNucjIvOUNsaVVRVy9Da1lvb0ZUMmtUbjVIc2o0Q2hDUkV0TUtHSXFv?=
 =?utf-8?B?V2IvbFE2VzZVd29zTUt0enM5ODVRK1ZURGwzYjJZYk1TUCt1NFJjUW1aZ0Rq?=
 =?utf-8?B?ZCtBMU1weG1hL1BEVXkvRFVqWVUxVEVnVTIzem5GRkVzTkpTOVhPdUNWUXFp?=
 =?utf-8?B?aGR3b0hYNmxJVWQ4eVcyK3lyeDJDMmNINnNKUS9kUTdySzJnVkY1RTFqZjJo?=
 =?utf-8?B?RHR6ZStBMTdpQUNtczB1VEcxQko0N1lFZ21XRVkydjM1S3hPY2l5TUF3ZFZB?=
 =?utf-8?B?RUJYWGdacXNSc09reWl2eXphUEpTQXAvRTJSQWY1UXVFTnFqWExSandxV2ls?=
 =?utf-8?B?SnNsbUN2RDUwYWtuQnFpWDY1SXowYTJsQUNCcUJKNUw4NzVWVVpsNEN1SGs4?=
 =?utf-8?B?OGViUnlwOW9OTU1Bc2dhUWZUa0VZczZuYzVIUG9Rd3VmT295c2U4eWJ2blht?=
 =?utf-8?B?VzVKaXdBK29qMmZ1RVVrMmk2U1FmZjBvT1FaZTlLR2FsOFhCTUJyOE9DM0VJ?=
 =?utf-8?Q?oLf7xJQcV7Qma4MwXhTT0pBhYAcC9dyTkNSQzkX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDVHNTVFbnlhZXkvWHRid2xQVFJYaElZN3l3MXBYQWFCSFFqejNpNEdwaHVP?=
 =?utf-8?B?TkY1dDllTFlWaDFXZFdhRGZHZlJ2cFUxbUMrRTJ6SEpMblE3V2wzcnh6UEZZ?=
 =?utf-8?B?eEdQSjRHNEppYUpxY05INzJyNVFrUUEvdE9iVnFDdDR5STBoeFErd01UTDgw?=
 =?utf-8?B?TUJHdXprQ2ZyTm1jMThjSFVHV254TlpyVDYyMzlZY1hCc0twQXlWL2VveWFY?=
 =?utf-8?B?YjJhL3NEbGFmRzBNUWlrWHBtazdZN3lrUnZmalY4UFpZdElva0JpSXU5Tmt4?=
 =?utf-8?B?WVg0eXlKZmhoV0RZcWdCUU5qT0d4aGoza3VIM0FZYjFuNFRNUk1DWUpWK2hV?=
 =?utf-8?B?TjA2OXJtL3IzbFdCVlBVODdmeUh5endENzBNMlRpZVVxME84UlRyeUwxV0ND?=
 =?utf-8?B?KzVvV0FTWkYrMnhzaGZTbkEvTlVNT2FTM0N0S3hDMlJIQmtSU3d1eldWZkFU?=
 =?utf-8?B?clZCSXpzRnNvcENDUmYxZEJHTlYvZEZqakFaa0FXQTgwTjZtbXlWVDJ1b2dK?=
 =?utf-8?B?VFEvT09GNktRVnNKaVRFa0s2NmgrcWU3a2Z2RHMwUWlERUY0LzJBNWg5eHFL?=
 =?utf-8?B?SHQ4dlhFb0ZxMjhCK2NPR3dFQXA4MWJZVmRIR3YxMUFpQ2k0WUhSWklPYUts?=
 =?utf-8?B?RGc4VDVnSWhYUmEvUVZiczFJRm45VVhKa29wSDJPc21kdWNxczdIZWxENDVB?=
 =?utf-8?B?RStJZ2NlWWlaazRMN3ZBUEp4QmgwckhSSFpOMWtHb1VDc0RuSkhzNnBVUlhX?=
 =?utf-8?B?SHRtRGFRdjBFUGNNbzdJMlMwMkxQYjBjOWZ5Vm9nVTUyQXB4di9SSnNKUERy?=
 =?utf-8?B?T1dtclJIN0hQblVqVExlL3BvTHRnUEtLREtscFhhUWdCOUJ0SDk0bjdrT3FS?=
 =?utf-8?B?WUdJdjdKaHdXR3N6dWVHbU0rNG40VjlrRzc0bzlNVXlRRVJwWEE1d09tZi92?=
 =?utf-8?B?MHNDU1Fic25GWDNIZEV1bEF6VC96Sy96M3lNTUxJQ0o5dTlmajZKaVFLQlRH?=
 =?utf-8?B?MGhFSlpiK0xlbVIwTkpsc29ORDdocFliWDR4Tk1Lak5wVHAxR2x1dUg2MHEr?=
 =?utf-8?B?dUhMbjh2VHlFSkwrWVZoRGNuRUVheHR1Q0VtRlp0MDdmb3lUVGxXTG13RnZa?=
 =?utf-8?B?VVNreko2K1ZqWmxGc0xsMCsyWUJ5aWwyQVh2N09NNW5GNVRUR3hJck1uK2tK?=
 =?utf-8?B?VC9CY3BjZHNoWEx0dUVCR3hkeUNHQTFRVWVGdkNNWE1HTlJxdkdGRjRVbGZE?=
 =?utf-8?B?WUhMcVJMTUdHVFRBdlBXY3ppaGRUTnYxTWlEYlFvazlpeGkwcUo2YXFsZDI4?=
 =?utf-8?B?OElXSGhpWWVtc2dhcFZveUpZenVPZFNQTm9yRUVQY0ZabVIwMFFCQ1lSSlpa?=
 =?utf-8?B?aWluT0M4VEg4VTZSNnVyY25rWi9ZbDd4NjkxeUZKRlpvWUhoTmlSNTBlanRo?=
 =?utf-8?B?NCtEZzBWSzhzMHZDZkZJSXRZbmxUZHRia09LTlNKOGlPVGlxUUwzcW4yWHMr?=
 =?utf-8?B?ZGk3Y3pNTURXK05ETXQyLzBGNDN6L3hOVFIyRlV2TmQ1d2dveXgzWXhiQTF1?=
 =?utf-8?B?U3VFVFVlVzJHc1lDRGhubkRxLzc5N2VsWkYzR0t0bzV6UGJaN0pVRDRROWtY?=
 =?utf-8?B?MEp2TSsvcUpWYTF5VnltWXlKUm03R3Z0NldWTUgwa1FjejA3b1EvZTFQa2Ru?=
 =?utf-8?B?VzgxbkRFQVYvZU91M2NYRWZGTVVTZ3N0QWw5UVp6b1F3MmdSU0h2R2x6c1hj?=
 =?utf-8?B?cEhlRTNSOW5xUTBudHdFc01FeTBFR3ZRaVYzZkl2akFEK1BVR3NhRXVtVWp0?=
 =?utf-8?B?cUYzeWtnOU4vVGpqcXJ2SjZaOG9EaUFnL3V6VzBPaE9aOXR0SExMd25RNHRG?=
 =?utf-8?B?Y1owbTFheFVSMmFhUkxMUGs2dEJ2NmRaVkV6aTdaWjZaeXpqR3lBelRIK0lC?=
 =?utf-8?B?M0wrMWJSOGRoLzg3SDBHT1BsV3hxQ0E1RHpXMTc3NlgwSGVDUmIxSmNsUGor?=
 =?utf-8?B?eHRjNnlFQ3BKOFpPM0Q0cTE1aGs3SlhrRklJYXQvbnRNUkFiZThqWEdjRXZD?=
 =?utf-8?B?NmdhMDhPVkc5YnZCQjMvU0hZSmNOZWhKY1MrU1dWRkNWWWZMWFNRUkZMSGF2?=
 =?utf-8?Q?Vo5z5d6e7Q6VN7p1fOYSndVDs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3703c1d4-631a-430a-4167-08dd6b7985ff
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 08:46:24.2091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQpQ/lET1RMByszKkoCzoqy5ec9KkX5YT+CHeARO+IwYpfYnfGu69yixMlylwHnf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6015



On 24/03/2025 22:27, Oleksandr Tyshchenko wrote:
> 
> 
> On the device-tree-based Arm64 system, if Xen is built with
> CONFIG_ACPI=y, CONFIG_STATIC_MEMORY=y, and the static memory range
> is provided in the host device tree, the BUG is triggered in
> common/page_alloc.c during Xen's early boot. The BUG occurs when
> the first page from the static range is fed to the domain
> sub-allocator and finally ends up in mark_page_free().
> The pg->count_info & PGC_state is not in the state that
> the code expects to see there.
> 
> The problem is that the static range gets mistakenly unreserved
> in populate_boot_allocator() and reaches init_boot_pages().
> This happens since by the time the populate_boot_allocator()
> is executed, the evaluated in fw_unreserved_regions()
> an acpi_disabled variable is still false (CONFIG_ACPI=y) and
> dt_unreserved_regions() which should simply skip that static range
> does not get called. The acpi_disabled will be set to the actual
> value later on in acpi_boot_table_init().
> 
> To avoid unreserving the whole region (including potential reserved
> memory ranges such as static memory) open code fw_unreserved_regions()
> and add a comment.
> 
> Another solution could be to call acpi_boot_table_init() before
> setup_mm() in Arm64's start_xen().
Interesting issue. However IMO the problem is located somewhere else. At the
moment, with CONFIG_ACPI=n, acpi_disabled is set to true. With CONFIG_ACPI=y,
it's set to false even though entire acpi_boot_table_init() is written with
assumption that ACPI is off by default at the start. That's why
acpi_boot_table_init() calls e.g. disable_acpi() if it finds that user specified
acpi=off on cmdline. Why would it do that if the assumption was that
acpi_disabled is false? There's even a comment:
https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/acpi/boot.c;hb=HEAD#l257
that clearly says that "at this point ACPI is disabled".

Therefore, I think the fix should look as follows:
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index ffcae900d72e..9e94f1a8c761 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -57,7 +57,7 @@
 struct cpuinfo_arm __read_mostly system_cpuinfo;

 #ifdef CONFIG_ACPI
-bool __read_mostly acpi_disabled;
+bool __read_mostly acpi_disabled = true;
 #endif

 domid_t __read_mostly max_init_domid;

~Michal

