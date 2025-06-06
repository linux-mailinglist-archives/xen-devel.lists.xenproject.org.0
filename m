Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE40AD0036
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 12:15:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008385.1387683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNU6a-0007dm-Gt; Fri, 06 Jun 2025 10:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008385.1387683; Fri, 06 Jun 2025 10:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNU6a-0007cK-DH; Fri, 06 Jun 2025 10:15:20 +0000
Received: by outflank-mailman (input) for mailman id 1008385;
 Fri, 06 Jun 2025 10:15:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Fse=YV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uNU6Y-0007c5-F5
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 10:15:18 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20627.outbound.protection.outlook.com
 [2a01:111:f403:2415::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22bfc8b0-42bf-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 12:15:15 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CY8PR12MB9035.namprd12.prod.outlook.com (2603:10b6:930:77::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Fri, 6 Jun
 2025 10:15:11 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Fri, 6 Jun 2025
 10:15:11 +0000
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
X-Inumbo-ID: 22bfc8b0-42bf-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ieH81qo0rIA3nxunL/+vjQ/nmMVNob3aJX2EoYy54MjOwQ9BtNZdwaiDThBah01/8ttFDYtsY2WCgAiKRSRKh2kyNhjqOMS2krmI0e2wSBw6RfndObXFDZIvbx6KLxlIEg4nNJ4leY1vkLTZWXUId0WlndivUSiEnZz/n5mTUt0XDF6qJHUWPpQ6kqK3o1emWwaDtGYW4kbTjQG6ZC7ur/zYkSOqAnLrHH7KzIRJ7cIpJXMHfDmKOswUsB5o8MoGjL70B8OOvRgPRypSa9ws4jRrGU3t/PixEOGhOATJ3mdQ+SclNcERSBmOqEnSZr44m/XEm87Qbsqq5b4pHA5IqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ufu3gGc+URal0FOVV605N524/8ns7uIDRLE5fGwWHg=;
 b=HZAIzmUMWo3qDafGxyNh02TaOff/Y4B4anOWRzQV1R35li6Od0X0vPDnvaQjG/U+WXdYWt3VlpMKXfooPxVCiRk7K7h7OIf2+KW77kJ+JwsLB98iQvyG1XTTfdUwEnCeSZz9oZIZN8jhiwPG9V2oo7TQawCLfgTodTVwvMNtAvRXtpGrNhMiEk0rRKLqPwxDE2TgWAoxOF6i3ag42uGimZtrAORRwxnAVGkOy7yvJw1Wl1LrMv7FY83A/6BXfin68QLp7CSItiUnCQf+aNSfacQhJAbI3bF9T0NM1Gu1psuQE+rYbohEjXp+4FSi+GUM70IxYuVNOl3RrxZNX5+C2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ufu3gGc+URal0FOVV605N524/8ns7uIDRLE5fGwWHg=;
 b=i1bXQP+oADRP1XwuZznFeU7QaU7i3DdP7TV6BKGWKOm1VgWM+gKTB4Eu6Q+tZfseMBXGtH1RhCOebbEBWZskFRc+DdaSmxX/M0q9QXcxcMnEpe8uL4pOZzokG3EvgaGPGd/9284o8BBiLYhkpcr4WlKTkyJqVPGSXlLs33TYYZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <bd96cdef-54a2-4e9f-bbc7-3c5653170f4f@amd.com>
Date: Fri, 6 Jun 2025 12:15:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] arm/mpu: Provide and populate MPU C data
 structures
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
 <20250604174311.754899-3-ayan.kumar.halder@amd.com>
 <50c8e74e-95f6-4cea-b979-8b81d7575a21@amd.com>
 <fbfc728a-0d31-4f28-9a06-5f6458b91a55@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <fbfc728a-0d31-4f28-9a06-5f6458b91a55@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0216.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::23) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CY8PR12MB9035:EE_
X-MS-Office365-Filtering-Correlation-Id: ef986078-a0ba-47d0-eaa8-08dda4e30599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnlQREpOYVc0NjBtVWdVbEpXTFN6S1ppdEVEUFlJUFZTMm9wR3B6SUxnTTJS?=
 =?utf-8?B?ZTBtV2w1SDQ4bXdmMlRrLzRKdlluYU1JOW0yQ0c4S0oxK2Z6V3VsTnBtNGIx?=
 =?utf-8?B?UjErSnpra0dBMHZ6VStZVXA0MUpIQWdZUi9MUC9SWHovbDREWFNNRXFyUGpJ?=
 =?utf-8?B?cTlBTE02ZEhMRnM5WWRSYkw1VnhrdUwxbnp1QXUxcEQ2RnJpVFFCaWhyNFVn?=
 =?utf-8?B?M2s4M3NKengwRjJKYXM3MmNEVnZFMWNMWkdXVW1aNVdWUm1GcHQ3eHpZRGFQ?=
 =?utf-8?B?L1pVUGNYcVB0WDZZMzc3NC9pYUVRUWxTeGNXQ0UyaWQ2Q0Q5b2VlT01scS9V?=
 =?utf-8?B?bzVpZUQ2SWZaVFdUZmU2TnE2b2lUbXhLVjJqUTl1ektQNzlFSUFnV1paZVRa?=
 =?utf-8?B?amRjcC9MSFFodFMvRzZ2N2VLNlA4dm1aMW5SNy9xd3Z0QXlNRjNTWmxKK2NQ?=
 =?utf-8?B?RjkzWWhPTHhmQ0Z0WVF3SUhoY05URVVwVXFyMkkzTmtNeWQ2MHhZL1Q3TGZ2?=
 =?utf-8?B?ZzgrYWo5NzZQcmxxL0JuTFcxR2NQdEJGcmZFb0llRk1obFV3NmRQS2l5UlVU?=
 =?utf-8?B?bjc2ZjNuYTY1clJ5UnI2a3ptLzgvdjFnNjBxUFRmbmxOTHgrTEwvd1MzbmR5?=
 =?utf-8?B?UnFNbDlpZEh6Yjd3Mjk0cVJaUTl1VkU4ZEVDMGZPZUxsYjNDSEhWYnZqaUR3?=
 =?utf-8?B?QlBwWWxkTk5RcmRCcy8xR3ltN3IyWUYzQzRtbGt1cnNaTzJTaGh0NEJJOTJ5?=
 =?utf-8?B?TFpzcE1rR25uNGZjUnJyRmdnYkZIL1VDNW1GMWcxVzc3anFTLzdkVkxIVElw?=
 =?utf-8?B?akxNUXhSUkpqbUxNZW5aUGdDQ1N5Z3lESC9pTnhFTUM4VFp6cnhnbUtkc2ZX?=
 =?utf-8?B?aWE0T1VWYkE2cTJtOVlBNklXbEI3RDEzL1A5dmtDdktSUmNVY01JSENLS05I?=
 =?utf-8?B?emN3bGxHdWdMTytaU3MvdTFyb1BORTlpdUQzTWhkUjBPNGtCZ3ltbFM5aWRt?=
 =?utf-8?B?MXo4blcyTmt4QmRXRndzR3lKR0pLSkJKOTJwRU9RTTIzUktkczJCclcyM3Ax?=
 =?utf-8?B?RFQzVDZJUzgzelg4T0daVHBvWFBPSnFSQSthNUtzTnBVVnpQMTMweGEzT2Jr?=
 =?utf-8?B?dzJRdlJ3TDdNMnlrU0J1NUgxMVZidjFHRmhpZ25zVjNXUHk0MmxmTG8xUG5Z?=
 =?utf-8?B?T01DZjZ3OGdlSXdBRy8vZWRxUlFNbng3ZlFUUm0rbnA2Q0VkdFpwa251QU9E?=
 =?utf-8?B?ZTRZOHlZTk4zYUxuVkJUcWZIWDBXK1I5U25hSlBEUEJ3Mi9OdDFZajRUaWo2?=
 =?utf-8?B?VVAxYU1EWlU1Y1lCdExqdHVUQkdVWXJFdW5rckwwMWxCTkVlUjBJNFR4UWFy?=
 =?utf-8?B?bmcxTzBIOFpxR2dPWGRPcTcwVDV0Z09Bckh6cHB1Ykh3NnhxNXlQclM2SStr?=
 =?utf-8?B?ZW0rTlFSMFg5OTcxN2dPL25jSXB6TkFmKzRhdzNEWVBLcWJ3SDhJSFIyUmhW?=
 =?utf-8?B?czhlYk5KTFl4OG5hdUFJNmRIbG02dWEvYkNqeUJGRGdhNHp2U0NtbVI3eEVi?=
 =?utf-8?B?bW9VcnBBUi9GTFZGM20zL3A0Zm4rMW9xMDRKaXkvdlZaU25ZODNmL3pJaUg4?=
 =?utf-8?B?ZGFwM3RJcVdKRVV5MDdtWGtLcjFOZUY0MlRZUDA5ZlVWWTFoOXJFRUJ5cTFq?=
 =?utf-8?B?MEUwajZhb1NBaWtkam5XKzdyTGVJUnc3NUc5cGpnVzd4WnJSbEQvaDZuallu?=
 =?utf-8?B?TTJXaWk4SEFXSnpzWG1NQ1JkVnhYaTZUUEVxcElQcVBYNHNJR1hEcDJMZDFn?=
 =?utf-8?B?V2xtNlJSOCs4MlNlMnIwMlVUKy9FMFlpZmZ3cXJXbWlMb0Mwb1RUTTZ3ZFRv?=
 =?utf-8?B?Y3pWU3g5OE4xWGpaYWFpNWdNUjdwNVJkbW12UTlyVnQwcVNkL2dtaERiRWxp?=
 =?utf-8?Q?4kuIYovb5ng=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFhkSldhYWtxL0UzMW14emdSS1duZVVhWUkzOU9zNGRrWkh3eVVyTGJ1cXV5?=
 =?utf-8?B?d0tEc1NYSm80UnhjbXovdWRyT2w1b0Y5UjdOZ3pRR3g5dytIb1Q3VjRpaTJl?=
 =?utf-8?B?NnN0aXNFSmUrczBpQ0JLRVJFNkgxbktPc0crd29UOWVBcllzUVhzNEZGcWhP?=
 =?utf-8?B?YzFacnVxNGJWQy9qSWRiKzhsRS9HUkxvR3JaTjlxMktJc1l6eklPTDhuZzVR?=
 =?utf-8?B?K0R1S2pHVVpyVWtGNVRtNFJxTHVtZVVhYkJweENKYW1oZHp4ZERLVUJsaVRa?=
 =?utf-8?B?dWp5UTlSYll1dkt1ZmRJcjhUR0c1eVAvcEpLM1Vhdm9Eb0F1U3M0dGEzWjN6?=
 =?utf-8?B?SSt1SkR2clY3U0U5UHFJdVNRQ3poNjJRNnBMN3JOeXJOaG5US25NVkxTeSs4?=
 =?utf-8?B?azY1cUpvTk1MbjlXSi9ZdVhjYVBtenYwajJ3YXd1bTVPUkdqOUQwSUJTWlI3?=
 =?utf-8?B?V1JFaUVXL3RGYlZpS3A4UTU4SjRlWnVKZHBGUjRpRHB3QnpmUm5uZ05pU1l4?=
 =?utf-8?B?cHY5M3MrRlFtakV4dUFNcHBlRFBDS0R4alR2Vm5IcmM2WmcwcWlXTys5TVpQ?=
 =?utf-8?B?aVpKUk9nR21iTUJKSU9GNjhweUJSdmxSYWJxTlhLa0xnZ3dBRGdDeDlteWVp?=
 =?utf-8?B?M3FoOFVDaHdrRmV6M0ZOV0tKSWZKWXBIcUM1UUw4UmJVNVZJOHRHSlc3TTJS?=
 =?utf-8?B?MEV1WlR5cE5Panc0OHlCR0Iwa3FOTW1XT1U3RnJQVlNLb1BqU2FkR3ltVE1k?=
 =?utf-8?B?Y05qNjdJcnpzWVJCd0RxaEQ0cUFnNGQxQVl1TlFFL3FwcXFNbnVsdjRteVBP?=
 =?utf-8?B?WVROOG9JbjNlQlNjVEE0bXMvRkF5QUJjSU5iL0ZjWW1KWmNEc2xJTktVdWo2?=
 =?utf-8?B?TkkyUmdxb3Vjc2pWcVFrWXFNblFXdm9OZFYvTXdoVGJGdXpoa01hNmkyMjdV?=
 =?utf-8?B?WUluelhmS0txNDV2ZmZ1bjNJNFhlRXBjVzJMcnVhOVBOdWNtQjNHTmh5R2ZG?=
 =?utf-8?B?UFdXM3dsb1lhV2VPR1FhS3dqMC9MNEt4NWp3ZVJLK1hEb3gvSzFoWDZCR1FZ?=
 =?utf-8?B?VTBBaGd3SVBDZEhzTmd2Q00wcGpYVHFOLzN2UXltdkVsR3FMSDBGczcwUWE0?=
 =?utf-8?B?RVlJY1h3clZCZ2YzRWRkcldid1ltcFpCempDQ0UwTUlQREhRVTdoek9NTGVm?=
 =?utf-8?B?SlNVUmpjWnRWTzZwSVB3S2g0SnhObHpad2drMkhOV1lGZjIrQzNOZ29ySndR?=
 =?utf-8?B?STRVOEI3YjJrN3VpcmpOa0VRZ2llYjBLcXA0elJ1VTY1YWc3MUdFdjZnL1N3?=
 =?utf-8?B?QlVrT2xVNnRHaXdsSTUzS1BOcUw5SWxIZFdTQ2JTb3IwcS9GanNVbmIxcGps?=
 =?utf-8?B?eFJUcW1jMEpDTkRLT09QWFJCRzBCWk9KdFdlTGt4MHB5YVN4ZWhkNGpia2xw?=
 =?utf-8?B?SEpIZXRxbTNSTFN4RWcvdEQxbzhLNWlrUGVjaDJ4VFJLRG1ib2IwK2ZkZ1Fm?=
 =?utf-8?B?d2lYRzZMNE8zTXF0a25JcVNReFBYRkdrU3hZZGp4MFJRRUZUbDhSU2dnemNt?=
 =?utf-8?B?dFMxUkh3YlYvc3lMUDlWT1hJaTB0czFENkRLSVhkR1Y1QTBHcFZMM1NsZVhO?=
 =?utf-8?B?MVAxT0FPbklxSnZzNDA3TkYvTjlXQXY5cWZpalQyM0NoMEx0emY4Ry8remh0?=
 =?utf-8?B?NENheVFUUVN2Z2QrSDZuTmJaL1Y5djFzTHlsRUEvMmdaemlyREtUS0RWT1Ax?=
 =?utf-8?B?N3JtZHg4RFlBVXNBcWtRQzMxOVFpeXdmcjhPMWVWbjllbS90QmxVOGp6blVr?=
 =?utf-8?B?YjdEYUNwdkwzajFLTWNIUm9uYWlYR25teW1Mejl0Q3hpbXFhVlcyTC9NVlZw?=
 =?utf-8?B?c2orcG1qT3Vib3VlcUVncUpkTXhRTExvbmZLTnZkRWZLTjJBQ1N0a3FaUlpQ?=
 =?utf-8?B?SHFoZkJlQVVyYTkvYWRCSldQVmo1czdpL0tqZkUxTFg0ZFJKR1BVVGhydmJt?=
 =?utf-8?B?emRzUGZGVXpveWNZbGxqbGdBUS9Bb3VkTGhuZDFtNFJYYmRMMndYWVVzL2Vy?=
 =?utf-8?B?c1ErNjVYTEdnNUp3cGZZZzVvUGc0b1d5akw2RkpjbnZRWWlpanZ3dnkvUmdE?=
 =?utf-8?Q?4vWX86RNdzqCd50f/QGqzlUe8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef986078-a0ba-47d0-eaa8-08dda4e30599
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 10:15:11.7156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZUVC9GwF6fiPEZliHq7snwA4sVXTuakYgw4IcAh754kvtlGY5tP+fRFQnLmB2Z2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9035



On 05/06/2025 16:27, Ayan Kumar Halder wrote:
> Hi Michal/Julien,
> 
> On 05/06/2025 08:44, Orzel, Michal wrote:
>>
>> On 04/06/2025 19:43, Ayan Kumar Halder wrote:
>>> Do the arm32 equivalent initialization for commit id ca5df936c4.
>> This is not a good commit msg.
>> Also, we somewhat require passing 12 char long IDs.
> 
> Modify Arm32 assembly boot code to reset any unused MPU region, 
> initialise 'max_mpu_regions' with the number of supported MPU regions 
> and set/clear the bitmap 'xen_mpumap_mask' used to track the enabled 
> regions.
> 
> Use the macro definition for "dcache_line_size" from linux.
> 
> Does ^^^ read fine ?
Yes, it certainly reads better.

~Michal

> 
>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>>   xen/arch/arm/arm32/asm-offsets.c         |  6 +++
>>>   xen/arch/arm/arm32/mpu/head.S            | 57 ++++++++++++++++++++++++
>>>   xen/arch/arm/include/asm/mpu/regions.inc |  8 +++-
>>>   3 files changed, 70 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/arm/arm32/asm-offsets.c b/xen/arch/arm/arm32/asm-offsets.c
>>> index 8bbb0f938e..c203ce269d 100644
>>> --- a/xen/arch/arm/arm32/asm-offsets.c
>>> +++ b/xen/arch/arm/arm32/asm-offsets.c
>>> @@ -75,6 +75,12 @@ void __dummy__(void)
>>>   
>>>      OFFSET(INITINFO_stack, struct init_info, stack);
>>>      BLANK();
>>> +
>>> +#ifdef CONFIG_MPU
>>> +   DEFINE(XEN_MPUMAP_MASK_sizeof, sizeof(xen_mpumap_mask));
>>> +   DEFINE(XEN_MPUMAP_sizeof, sizeof(xen_mpumap));
>>> +   BLANK();
>>> +#endif
>>>   }
>>>   
>>>   /*
>>> diff --git a/xen/arch/arm/arm32/mpu/head.S b/xen/arch/arm/arm32/mpu/head.S
>>> index b2c5245e51..1f9eec6e68 100644
>>> --- a/xen/arch/arm/arm32/mpu/head.S
>>> +++ b/xen/arch/arm/arm32/mpu/head.S
>>> @@ -10,6 +10,38 @@
>>>   #include <asm/mpu/regions.inc>
>>>   #include <asm/page.h>
>>>   
>>> +/*
>>> + * dcache_line_size - get the minimum D-cache line size from the CTR register.
>>> + */
>> I do think we should have a cache.S file to store cache related ops just like
>> for Arm64.
> ok, I will introduce a new file.
>> Also, no need for multiline comment.
> ack.
>>
>>> +    .macro  dcache_line_size, reg, tmp1, tmp2
>> I would prefer to use the macro from Linux that uses one temporary register
> /*
>   * dcache_line_size - get the minimum D-cache line size from the CTR 
> register
>   * on ARMv7.
>   */
>      .macro  dcache_line_size, reg, tmp
>      mrc p15, 0, \tmp, c0, c0, 1     /* read ctr */
>      lsr \tmp, \tmp, #16
>      and \tmp, \tmp, #0xf             /* cache line size encoding */
>      mov \reg, #4                          /* bytes per word */
>      mov \reg, \reg, lsl \tmp         /* actual cache line size */
>      .endm
> 
>>
>>> +    mrc CP32(\reg, CTR)           // read CTR
>> NIT: wrong comment style + wrong alignment
> yes, I should use /* ... */
>>
>>> +    ubfx   \tmp1, \reg, #16, #4   // Extract DminLine (bits 19:16) into tmp1
>>> +    mov    \tmp2, #1
>>> +    lsl    \tmp2, \tmp2, \tmp1    // tmp2 = 2^DminLine
>>> +    lsl    \tmp2, \tmp2, #2       // tmp2 = 4 * 2^DminLine = cache line size in bytes
>>> +    .endm
>>> +
>>> +/*
>>> + * __invalidate_dcache_area(addr, size)
>>> + *
>>> + * Ensure that the data held in the cache for the buffer is invalidated.
>>> + *
>>> + * - addr - start address of the buffer
>>> + * - size - size of the buffer
>>> + */
>>> +FUNC(__invalidate_dcache_area)
>>> +    dcache_line_size r2, r3, r4
>>> +    add   r1, r0, r1
>>> +    sub   r4, r2, #1
>>> +    bic   r0, r0, r4
>>> +1:  mcr   CP32(r0, DCIMVAC)     /* invalidate D line / unified line */
>>> +    add   r0, r0, r2
>>> +    cmp   r0, r1
>>> +    blo   1b
>>> +    dsb   sy
>>> +    ret
>>> +END(__invalidate_dcache_area)
>>> +
>>>   /*
>>>    * Set up the memory attribute type tables and enable EL2 MPU and data cache.
>>>    * If the Background region is enabled, then the MPU uses the default memory
>>> @@ -49,6 +81,10 @@ FUNC(enable_boot_cpu_mm)
>>>       mrc   CP32(r5, MPUIR_EL2)
>>>       and   r5, r5, #NUM_MPU_REGIONS_MASK
>>>   
>>> +    ldr   r0, =max_mpu_regions
>> Why ldr and not mov_w?
> mov_w   r0, max_mpu_regions
>>
>>> +    str   r5, [r0]
>>> +    mcr   CP32(r0, DCIMVAC) /* Invalidate cache for max_mpu_regions addr */
>>> +
>>>       /* x0: region sel */
>>>       mov   r0, #0
>>>       /* Xen text section. */
>>> @@ -83,6 +119,27 @@ FUNC(enable_boot_cpu_mm)
>>>       prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
>>>   #endif
>>>   
>>> +zero_mpu:
>>> +    /* Reset remaining MPU regions */
>>> +    cmp   r0, r5
>>> +    beq   out_zero_mpu
>>> +    mov   r1, #0
>>> +    mov   r2, #1
>>> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prlar=REGION_DISABLED_PRLAR
>>> +    b     zero_mpu
>>> +
>>> +out_zero_mpu:
>>> +    /* Invalidate data cache for MPU data structures */
>>> +    mov r5, lr
>>> +    ldr r0, =xen_mpumap_mask
>> Why not mov_w?
> mov_w r0, xen_mpumap_mask
>>
>>> +    mov r1, #XEN_MPUMAP_MASK_sizeof
>>> +    bl __invalidate_dcache_area
>>> +
>>> +    ldr r0, =xen_mpumap
>>> +    mov r1, #XEN_MPUMAP_sizeof
>>> +    bl __invalidate_dcache_area
>>> +    mov lr, r5
>>> +
>>>       b    enable_mpu
>>>   END(enable_boot_cpu_mm)
>>>   
>>> diff --git a/xen/arch/arm/include/asm/mpu/regions.inc b/xen/arch/arm/include/asm/mpu/regions.inc
>>> index 6b8c233e6c..943bcda346 100644
>>> --- a/xen/arch/arm/include/asm/mpu/regions.inc
>>> +++ b/xen/arch/arm/include/asm/mpu/regions.inc
>>> @@ -24,7 +24,13 @@
>>>   #define XEN_MPUMAP_ENTRY_SHIFT  0x3     /* 8 byte structure */
>>>   
>>>   .macro store_pair reg1, reg2, dst
>>> -    .word 0xe7f000f0                    /* unimplemented */
>>> +    str \reg1, [\dst]
>>> +    add \dst, \dst, #4
>>> +    str \reg2, [\dst]
>> AFAIR there is STM instruction to do the same
> strd \reg1, \reg2, [\dst]
>>
>>> +.endm
>>> +
>>> +.macro invalidate_dcache_one reg
>>> +    mcr CP32(\reg, DCIMVAC)
>> Why? You don't seem to use this macro
> 
> oh, this can be removed.
> 
> - Ayan
> 
>>
>>>   .endm
>>>   
>>>   #endif
>> ~Michal
>>


