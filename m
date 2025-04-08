Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39157A7F65B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 09:34:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941510.1340970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u23Sl-00067b-3V; Tue, 08 Apr 2025 07:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941510.1340970; Tue, 08 Apr 2025 07:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u23Sl-00065c-0L; Tue, 08 Apr 2025 07:33:39 +0000
Received: by outflank-mailman (input) for mailman id 941510;
 Tue, 08 Apr 2025 07:33:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h40A=W2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u23Sj-00065W-Tu
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 07:33:38 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20625.outbound.protection.outlook.com
 [2a01:111:f403:2418::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5033d99-144b-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 09:33:32 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SJ0PR12MB7474.namprd12.prod.outlook.com (2603:10b6:a03:48d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 07:33:28 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 07:33:27 +0000
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
X-Inumbo-ID: c5033d99-144b-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4PiV91pxcCzD1IXc/wqAUcFimrA7jtvb/i7P1+LJBO4AR804Fz9qUY1NNR5u9AFMfXWNk7SfVQxUBJY4OlCvIvViODXDJJw7Tnsz3SPoynR2JqHqHWWxSqLWeW9TirzaLOb7J/jRlaBp1SzfpSCIvuonELXjU8z+F371BkMyzY0OrET23/h4uACIDBkRHPrWL7fyzLL6gq3c8sviBc/QreeqCVotA6EClJdOQl7/LIUPjL5npuvw3lASq9/3YJuyLSvNYhxCJUL5kNLSC2/h39jAUAKY1SJOP1RyOUOKzWT1mlvLj26X9B8gHI2ILVus6ZKkpOhm3UbCokaNDy1Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1ZrjxlzfKLAEId4yFO3QJ+CrKM7htkiP8IFzVGtPPQ=;
 b=mvLapJGTMj1imzgEr1vxaYmyPDVT70ZK5t7hB2rvcm0ZoS0drOyn9uzYl13cU2IR1ILKuBiD3AtUqzQtX8TETQtgmhavbB/34NCJn6SsPQb33KffqQ9cqWwL6skIEtn0SWROK1YfYhO4WciXTxCtWkTNnt0DsS/TK9LFayI8tgmmTBGkk5rkx7CkiLhRXvTywfcOnqy4Neyk86YOgYUi92P1mgtcSZ7M5gHzbyfFsG1imYWIIbt5k8boKY1Se40CSFebUuIySJf2RzBbZ8Z0f22GrQw81LbtHYAsOK5NOOkSPzqfDd1K0UhBrn+Q2+EedAZRq8Idoe0knz/A0GXfBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1ZrjxlzfKLAEId4yFO3QJ+CrKM7htkiP8IFzVGtPPQ=;
 b=wHfSbudlZOeSvy6RGaSvPyeG/bizZZ74etVOMRVYAJY7OtgfI9Mo8TefJhsI4FY4ermkCMcqc8gIA+iTByzNt9VaYEbH2kc1x1MECq8eVJiH83/1nGF21b4ASfTprks/6Xy0Sm5usgYehUlcnGRK7/Zmupxph31fSfIE+iIUBJM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d03fcf63-d946-48d6-b96a-a6b54d3dd840@amd.com>
Date: Tue, 8 Apr 2025 09:33:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/arm: Move some of the functions to common file
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250407184443.1790995-1-ayan.kumar.halder@amd.com>
 <20250407184443.1790995-2-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250407184443.1790995-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0334.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::10) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SJ0PR12MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e616e65-def5-48e9-763c-08dd766fa6e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0hFV04zSm5EVzVPU2RXRU9NT05JMEh4V3k3U3h3bDhFN3BTSnRvK3loR3B4?=
 =?utf-8?B?aUZUVnNwZktaakRvc1RHc1kyampUTlVlKytVSGpOVW4wYmdUUUx2TVlXWXk5?=
 =?utf-8?B?QkNKNXBJM2xWaFFJeHJXRzhNUlhMcld5by9EaFFPTDFneVZXTkozMEpoZFEy?=
 =?utf-8?B?blRSNnVnUTdTVlJVWU5kVHpHcUJ2bmw1Uzc0aFFuQThZdjc4RE5sYnp3bGx4?=
 =?utf-8?B?SnJWMGVZZkxoWnhESm01dFlXdDZhYnk4OGxTbGNGUWFOaE5wS0E4bWhNSXd2?=
 =?utf-8?B?L2Q5TEY2OGhDUEw4dlV4WmlUeEVjM1ZqNjJxRnZHRGd6N0ZJQ254cnYxVzhJ?=
 =?utf-8?B?ZXE4eThKQmJDemwreEFxeXRHYVpTM1BqUThaQnNkTWZWUmQ0R2hUYUxwSFhx?=
 =?utf-8?B?U0MyZCtGZC9WMXdiRTI1YU9pZFVKWVQyOWI0Q0g1MFlZOGNjSUIvYnFxSkpu?=
 =?utf-8?B?QUhmS1JlNFZHUVZDb1JhdmJUaEljYUVaMFF3QjBBODhJWjZMWDA3bmpGYjht?=
 =?utf-8?B?NUhIVnY5UXZzTUxYc1diY0xwbjdhUGwvVGtwTDE0OEJxU0xzenU5S25SaG1D?=
 =?utf-8?B?UkNBVkxLV1hjdzBRVjQvL0t6VzBCTUkxSlE3a1ZUREdWaW53ZlhBTFdTbHRs?=
 =?utf-8?B?Q3lOM2YvOXpOWkxKUDVGS2laYnpodFBtblJCbXA5TDdrSVBHN2g0L0ljcFdG?=
 =?utf-8?B?VTAxeURZN3lPTHRwNmhudDg0bFhXWVNybmt5RmtZYkQ4bzZiTEltQ3lsNUE2?=
 =?utf-8?B?eTRnd2ZHV0twZVFueVhEY2RsOGU1bnFEZ1UxZy9mQWxTcXk3THZkTUxHME03?=
 =?utf-8?B?MDJzSENkRmxlenFsYTV1T0M3TXpqWThSU2RseUpGVWJpUnQvR3d3cTYzcmdN?=
 =?utf-8?B?UEZlTlBxdE5EZ2VObU13YUlRNHJBVDFVaFhUNDRScnh4UWk3WlNja0JRc1M3?=
 =?utf-8?B?cFlOWXVHZnhudFNkNExLUWdmdHlHemxJUGk2S3c0OWNXYktBNHN6dHI5STUy?=
 =?utf-8?B?bmplNU0rQjdwcXVMZmdvSEQ2d040cGdLWkJ4dzVoTi9uS2ZKNkY0TTNzdVJw?=
 =?utf-8?B?RGNVYk9HcGZIM2pDamViMlM5NmFUb2hRLzJWZ0h6U2d4eWdmZkRsNmgveEw0?=
 =?utf-8?B?U2pZSjBxQUpiWFJGdnFnRjI5SHlaYU9renlIdXlnTFdqOGxaRjlKZEpPZXdT?=
 =?utf-8?B?RlptUTNlWFVJdnc2NXU2K3lRMzdBUHhSRTE0Q0NSemhmbkZlL2ZGcWMzMlM4?=
 =?utf-8?B?QkhLWVRYaGE3clNpY0FHVjRqbDB5NFVObXRnVy9RcDY4TG1OTkM5Ny92RXFE?=
 =?utf-8?B?eFVtcldYc3oweGdZYVFuU3BVSS9oMVZkeXFPZHRhclowUkR0YThnMjhmU3B5?=
 =?utf-8?B?VHZGVUVrSk1ldklKa2QybGtnU1dtUGZyOXp0bUgyYStXakJNNnFTWFhXMjF2?=
 =?utf-8?B?bnBnZi95eUQrVkFSNElSQVh3SFJra3RrcElhZEhYY1NsdUJmN3VOMCs4SFBB?=
 =?utf-8?B?UUNSbGJJM2ppUC8zQXdiOUIzMGJYQTdHcXJ2d2NOeUdpMVhDYzR5eFBYK3Bi?=
 =?utf-8?B?SmI0TnMweTJ0dml6VHhsYzl2OHNXMStoVFJJT2p0dURJSGFRdEJGaWF1VVls?=
 =?utf-8?B?eWlycmdSU1VuZzV5M1FNQjR0ajI3YVFqNkJUY3EySStXOUJBS3FZZ2s4MjhL?=
 =?utf-8?B?MTRhM21KK3pNSGs2WWJkK2xFTWF5bHlUUWFQVkpJeGxjZUltQlZBT3lhald3?=
 =?utf-8?B?bmhiOHYvOVJtd29ycGJ5cHh4aC9obDR3NEJZWlZwZWxLblMxdEtYT3pBcFE1?=
 =?utf-8?B?dXEvMlloQjRCdm1yWWgrQ2hSTnhMaGloWVk1Y0t3YVluQXBCbnovVDJxOVN0?=
 =?utf-8?Q?bZr7tkMMQ3icq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjROMFhDOXNkNXRidE05OGw2NWVLTXk3ckt2L1ZxMU4raGRtQ1lGUUVQUExa?=
 =?utf-8?B?Ukw5Q09ZcHY3QkRPZ254c1NvcDMxN1FDS3hWSjBQOVVwLzNnMTl2MUUwL1pL?=
 =?utf-8?B?NzY4WVUwMGsrZDFWbENwL0Fxb2luTzdwdi85eVJ0RUxaSWQwMy84eWtvRmRr?=
 =?utf-8?B?R3I1TXlQS2tiUXdhVVJSRkM1bDNtbGxmSDljV3k2K0pXZXNhWjJhZkhJcklT?=
 =?utf-8?B?ZnpZWEJzK2psb3JweTBaOVhHQThRNlFlbVM1eXNNbm5tT20rRzhLWjh5eXVW?=
 =?utf-8?B?dEx5S3NxRjJuY0tMbjR4TWQ0Z3pweE5TbkJ6bkM4dUpxUndmQS9JaGRaYTZO?=
 =?utf-8?B?U3JCb0U4MnA5bXhST3gyYS9KNnJjdG5seWlRNDJlTE56a1lHeWMwNXhZODdS?=
 =?utf-8?B?ZEdtV2tZZWdwMVRDMkxYZ0xvblVrTXZ5UndzaFhqUmhvRmN1UG5HRmpCVzlB?=
 =?utf-8?B?bnRqbVVLSWRwektLMktPank4cVROTTl0S2Y1UDVmaFZaRGpkbTZoZ2R1YWtn?=
 =?utf-8?B?TkZwbzhRVjZYRW1XZjlmc1Q5VXBPQndXQTBBSEZMb28yeC9QNFg3L0tPdlJ1?=
 =?utf-8?B?TlQ4RE4xeEg1MjdUM3hVWmtaeEtmV0FIMXVVbkdnSlBCYnJMV0w5WkliNy80?=
 =?utf-8?B?aU85U3JsQkQzRHExYk1Mak9zNmZ6N1pvRlhkaVA0TUxZcXUzREFkcXZPYkpj?=
 =?utf-8?B?c3RwdjNxS2ZobUlCeG02RUZjRDJnbHJLVzZ1dlFNSEpxWDRmN2pEUldCQmdt?=
 =?utf-8?B?ZUdKVXlBRG0wR21OY0dUQjJkUmhwSXRHUWZpbVRrNkp1Njg5QkVqazZlaEhB?=
 =?utf-8?B?RUdDUGFhTFovUTg3N3dILzAyWjFsTVpEcjJ2TTEwTlRienZtdW5xUTgxRTlU?=
 =?utf-8?B?L0Y5M00wQXUxb1F1WkJoQlErQ1M4dHBEU0UrK1F3Z0FTMElnV3FzUHlFMFp6?=
 =?utf-8?B?TUFnc2RzbVVPaWJKZXNDdHJGbW0rajBGU25qNDduMGovZ3VkS1d3c213TGpp?=
 =?utf-8?B?RjVrY3crVytlU2Y0YzJJRWNxVk5ML3ZQR3VneCtkS090aE5QbUpmZEFMZjBp?=
 =?utf-8?B?RjZDRHN5c2RoTlNTcFNycUo1TWp6MC9MdmtIVjVhRTRaSVBXSCtUWWF3bGJ1?=
 =?utf-8?B?ck1YU0VNNVJMRDN2RkxFc2hpMFV1bXA4NGs0eUlzY3pDb1lwWEgzaGkyUDJv?=
 =?utf-8?B?UlhWcUlkaEpQam1vcVhvRHFJQ3JGL0xCZHhVV0hkZ0YvNDNNVUU3OWU5WmR1?=
 =?utf-8?B?Um5zY3UvMXhmRTlwQ0wvQ3RsRjhkdVc1VW9Cb2xickQ1K3JjOFI5MGUrTTlw?=
 =?utf-8?B?YzFPcHVIYjloYXpqVWVLbzRJRmZUMkJLN3NBNnZEODArUnhVVmhpZVIxWjlr?=
 =?utf-8?B?QUZuZDFSaFA2UWR0UWt0SHRjeU1iRXZBcjByK2tVU0w4RE5QaFhXUGtvejFw?=
 =?utf-8?B?WXUvUGVKR1RwUW81RFhyODZVcjFCMWJONVVwelJMdTZDQkNMTGFOdGVpQVUx?=
 =?utf-8?B?NmxBOGROZWxnN21mS2tJRFV2M0RyVTAvSnpHemdENUo2RDZSSk9OVXJucXRy?=
 =?utf-8?B?NUM0OVdmcGtrVHk4QU83Und5Rk4vMENkR3VMTGFqZWlDUWJCdmo3MENOazBC?=
 =?utf-8?B?Sm5qRHl4a1NuNytndG5zR1piWURuY0ZlMkxVK1VWdjEyckc2bUdaZlRSZGox?=
 =?utf-8?B?dUVXL2dONWFjMGp1RkpOR05JczlrY3ZBR2N4dWxZNWhnQmFhYkttc2NoZ1pr?=
 =?utf-8?B?STFsL3RrSnJQVlBxRWpiM2dtTWFGcUdnNzZwdHVUUnZlM2Y1UUZJYWd3OEdr?=
 =?utf-8?B?TWliTHU2clJmQzlrZnZaMkNLWmE1d001eVJCMm4waWoxaDJmTWdrSUhtTWx6?=
 =?utf-8?B?aHpDa1NnWVJhMWQ5Mk1BdWpsTGE4dTNFYjdPNnRJeU5CUDBhUHZ6RjkxaTRp?=
 =?utf-8?B?TjVPdnV4S25KZ0JrTDN3dnJaSWM0a1BueWhqZXV3Z05vclZ5ZFQvWGY1T3dm?=
 =?utf-8?B?aTgzcC9RWHBJS1hZVDg4NXcxUllWb3lFTUE4ODFwR0F3Z3FUa3YwODV3L2Z5?=
 =?utf-8?B?MmNzUUw3S1VOcUVoNldtVEZpSG5VQWZKVUdHem5aT0lwekdaclNtOTVGcnFl?=
 =?utf-8?Q?niObjO+biCj0imgKGHyBKQZfL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e616e65-def5-48e9-763c-08dd766fa6e0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 07:33:27.2020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+vIDYJaKR9Eh/CsgISWmbB47N9M8K+WHlBY6q3uqgMVPFv40Jrp7WFlQ0bJGabe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7474



On 07/04/2025 20:44, Ayan Kumar Halder wrote:
> Added a new file common.inc to hold the common earlyboot MPU regions
NIT: Describe your changes in imperative mood

Also, my understanding was that this file will contain common constructs not
only regions related. If this is just for regions, then it's better to name it
regions.inc.

> configurations across arm64 and arm32.
> 
> prepare_xen_region, fail_insufficient_regions() will be used by both arm32 and
> arm64. Thus, they have been moved to common.inc.
> 
> *_PRBAR are moved to arm64/sysregs.h.
> *_PRLAR are moved to common.inc as they are common between arm32 and arm64.
> 
> Introduce WRITE_SYSREG_ASM to write to the system registers from the common asm
> file.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from
> 
> v1 -
> 
> 1. enable_mpu() now sets HMAIR{0,1} registers. This is similar to what is
> being done in enable_mmu(). All the mm related configurations happen in this
> function.
> 
> 2. Fixed some typos.
> 
> v2 -
> 1. Extracted the arm64 head.S functions/macros in a common file.
> 
> v3 -
> 1. Moved *_PRLAR are moved to prepare_xen_region.inc
> 
> 2. enable_boot_cpu_mm() is preserved in mpu/head.S.
> 
> 3. STORE_SYSREG is renamed as WRITE_SYSREG_ASM()
> 
> 4. LOAD_SYSREG is removed.
> 
> 5. No need to save/restore lr in enable_boot_cpu_mm(). IOW, keep it as it was
> in the original code.
> 
> v4 - 
> 1. Rename prepare_xen_region.inc to common.inc
> 
> 2. enable_secondary_cpu_mm() is moved back to mpu/head.S. 
> 
>  xen/arch/arm/arm64/mpu/head.S            | 78 +----------------------
>  xen/arch/arm/include/asm/arm64/sysregs.h | 11 ++++
>  xen/arch/arm/include/asm/mpu/common.inc  | 79 ++++++++++++++++++++++++
>  3 files changed, 91 insertions(+), 77 deletions(-)
>  create mode 100644 xen/arch/arm/include/asm/mpu/common.inc
> 
> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
> index ed01993d85..4d76a3166e 100644
> --- a/xen/arch/arm/arm64/mpu/head.S
> +++ b/xen/arch/arm/arm64/mpu/head.S
> @@ -3,83 +3,7 @@
>   * Start-of-day code for an Armv8-R MPU system.
>   */
>  
> -#include <asm/early_printk.h>
> -#include <asm/mpu.h>
> -
> -/* Backgroud region enable/disable */
> -#define SCTLR_ELx_BR    BIT(17, UL)
> -
> -#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
> -#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
> -#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
> -#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
> -
> -#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
> -#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
> -
> -/*
> - * Macro to prepare and set a EL2 MPU memory region.
> - * We will also create an according MPU memory region entry, which
> - * is a structure of pr_t,  in table \prmap.
> - *
> - * sel:         region selector
> - * base:        reg storing base address
> - * limit:       reg storing limit address
> - * prbar:       store computed PRBAR_EL2 value
> - * prlar:       store computed PRLAR_EL2 value
> - * maxcount:    maximum number of EL2 regions supported
> - * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be
> - *              REGION_DATA_PRBAR
> - * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be
> - *              REGION_NORMAL_PRLAR
> - *
> - * Preserves \maxcount
> - * Output:
> - *  \sel: Next available region selector index.
> - * Clobbers \base, \limit, \prbar, \prlar
> - *
> - * Note that all parameters using registers should be distinct.
> - */
> -.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
> -    /* Check if the region is empty */
> -    cmp   \base, \limit
> -    beq   1f
> -
> -    /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
> -    cmp   \sel, \maxcount
> -    bge   fail_insufficient_regions
> -
> -    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
> -    and   \base, \base, #MPU_REGION_MASK
> -    mov   \prbar, #\attr_prbar
> -    orr   \prbar, \prbar, \base
> -
> -    /* Limit address should be inclusive */
> -    sub   \limit, \limit, #1
> -    and   \limit, \limit, #MPU_REGION_MASK
> -    mov   \prlar, #\attr_prlar
> -    orr   \prlar, \prlar, \limit
> -
> -    msr   PRSELR_EL2, \sel
> -    isb
> -    msr   PRBAR_EL2, \prbar
> -    msr   PRLAR_EL2, \prlar
> -    dsb   sy
> -    isb
> -
> -    add   \sel, \sel, #1
> -
> -1:
> -.endm
> -
> -/*
> - * Failure caused due to insufficient MPU regions.
> - */
> -FUNC_LOCAL(fail_insufficient_regions)
> -    PRINT("- Selected MPU region is above the implemented number in MPUIR_EL2 -\r\n")
> -1:  wfe
> -    b   1b
> -END(fail_insufficient_regions)
> +#include <asm/mpu/common.inc>
>  
>  /*
>   * Enable EL2 MPU and data cache
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index b593e4028b..3ee3715430 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -462,6 +462,15 @@
>  #define ZCR_ELx_LEN_SIZE             9
>  #define ZCR_ELx_LEN_MASK             0x1ff
>  
> +#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
> +#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
> +#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
> +#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
> +
> +#define WRITE_SYSREG_ASM(v, name) "msr " __stringify(name,) #v;
1) This macro is ASM only and you don't protect it like the C macros below. Why?
2) Semicolon not needed at the end

~Michal


