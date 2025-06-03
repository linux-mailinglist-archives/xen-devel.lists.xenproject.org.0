Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6F6ACC089
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 08:54:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004017.1383667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLXn-00047z-NW; Tue, 03 Jun 2025 06:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004017.1383667; Tue, 03 Jun 2025 06:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLXn-00045j-Jl; Tue, 03 Jun 2025 06:54:43 +0000
Received: by outflank-mailman (input) for mailman id 1004017;
 Tue, 03 Jun 2025 06:54:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Vtc=YS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uMLXl-00045K-Et
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 06:54:41 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2407::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dc3e729-4047-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 08:54:39 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BY5PR12MB4291.namprd12.prod.outlook.com (2603:10b6:a03:20c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Tue, 3 Jun
 2025 06:54:35 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 06:54:35 +0000
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
X-Inumbo-ID: 9dc3e729-4047-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDSpmaYI4UZEgvIfpDh89p8AVv+4WMAddlbO6LMq61APfFo6AyE37lF+QNP3R3O8HDa2bXyvxJGZ2G8R0fUkGRltdp1T+vqsM6q3kOF+bluGBf2T4vCkc2OtO4Yw2JbK958ePvO1nJ1Phwn75vmRZ/bwVXOEjna/Bs9DPP4VWtFWog7/tubmp4TqZLKUxsySq+b0C/DuLOUkGtzhrNUcfxhwYOh3eAo430uLWm0mS/NjLJKGdqDYc5t8hcWypsS6e3V6xYMr0jU2wUpfRSYBIfJbeqVGjVM82R/EUIWOPqxwl8Aqy5m6FXTQ4ISR0sDbLDCrx3hbFioprcI94Gw5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rehh2XqJS+vhfNjoqb5PhLq3EgCFsnfzArbiRlkYj2c=;
 b=bOS1FfrOyK8oyeG4t2ADaSsUNdjT6Wiue0WbyT60uh3sNucTuYenLA2XhwLcZJ7CnMNlxenv4w8ypCitooEVjOvNblPVXLDucwZRjfQgh/DoSE23ZQLmAxkV1ouEvN/4AvSOfmuFZ9fqNe5HlYRzPrV4Gft88nGVF6nfb5E38jDuWglke2+08YcAmTae6Shh9vMl9DxyKHwyUoBjEdXx7Suyd4d/kSF4wuOcPWfsz5T92gTlGI/Bl3gQxlkb86wna1AlTPI243dqOa7skvN7nRM8ELSuUnev4h7UQ2inzqc0Q4vbK7cGiZYgxZMbFNX/humdebKXYg1B14yDnU1V0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rehh2XqJS+vhfNjoqb5PhLq3EgCFsnfzArbiRlkYj2c=;
 b=CzhAEj/kbM9/U+7sd08VYcGdYaUzowIxVoX5jUM9K/Lr5/sVecrUwroCeu1rbk6ZgzZoOygt6UUuZ2yRfJWs2DungBsU3LZGjeP3jCFEuQuKESsxTZ9CCXtrcxZWJ0QVFYu8+G/4jRECKCku9dTRkI+uBIq6WqAnM2kkxS2UfcU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <28a9f398-d206-4e42-b627-bea71f038b4d@amd.com>
Date: Tue, 3 Jun 2025 08:54:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] device-tree: Move Arm's static-evtchn feature to common
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250527082117.120214-1-michal.orzel@amd.com>
 <344823d0-eb05-48e5-80c5-9598104f3a3b@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <344823d0-eb05-48e5-80c5-9598104f3a3b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0207.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::32) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|BY5PR12MB4291:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b7e70c5-0fd6-4148-9015-08dda26b8030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmszK0RPN3JUb3FpUmlyWjlKT3Vuai9tQkI2MnBHYktaTVRneDVycHg1RTNT?=
 =?utf-8?B?VXQ5NlFjbzFBbk9MWGx5UmtzWTBxQmlGdnhLUWNrQkliZ3BsWHU3dzYxR1Vi?=
 =?utf-8?B?N1RBWW1wREZRSEJmT2M1TjJISnJjdHoxUjJISGhDOHByZDd3ZjFkYk1rSHBB?=
 =?utf-8?B?KzkyU1o2RU1Ja3Y5bjBBdUl3bmluS01ZQlR5dlR5OTZ3UEU3WjY3Z1ZwbG8y?=
 =?utf-8?B?bDNnaTZVUWI2VU9qT1BsVnpMZDN6OFlwRzB5aDdmcWJEMW1TMDUzcFFuTlRC?=
 =?utf-8?B?bVFRTmhnOFlYUldCaGc0eHVPRGhZZFdFZllwK3ZwZk9nRFVsOUNtQzRjTmlk?=
 =?utf-8?B?LzJFYVJmaDNyZk9FTWFkYmtHZFZiKzlZZWRRcnNRditkY0liemxsZ2JKQk9U?=
 =?utf-8?B?VzdvMnk4ZisyRFR2YjVMUjFvczN4WmptSDdEYWZYVE1hRzJBeDM5QVdMVU1m?=
 =?utf-8?B?dlYrb1M0MHZKd2xIdXNaR3g0OU5QNHJQOVVoNXdtL1NpOS90UzJJNnV2ZkVV?=
 =?utf-8?B?NkxjWWpMd3BZRHhmUnNiMUNYamROZ3docEtQWVJSZ2ZNSFBRZmFCbVNLRVov?=
 =?utf-8?B?WURaN2EvbnkxZGRsSzl4Sm9VRmZKbmI5dFlabEloek1hWGRQemxuTGNEd01q?=
 =?utf-8?B?NFdYbk80RTluR1BEbmIwbXVhSDhQY0t0NXZlVGZhY1hwNFVNNWNaL3hqTHBl?=
 =?utf-8?B?VkN3OTg5SEFjaXJWVWo4RlBuNDdZSlZGVktBY09XeTI3eks5ci9YOXZtMlpw?=
 =?utf-8?B?OVJDV2d1RVZlT2dMcXpqa0lVekJuTjRDbDQzSVZXOTlsdGk2NWdhTzFQMG04?=
 =?utf-8?B?V09pOFQwNmRnSmxhVGwwaVZydUpodTMvY2ZOZDgxMjJ5T3pSOXNIUmd2SVlQ?=
 =?utf-8?B?RDRlQ0w3UmJaUWhwV2REZ2lwTmY2dzZ0Z2pDT1RjTUF0WDlTSlZ4VjBYY1Ba?=
 =?utf-8?B?QjhOeURjUnFua3ZTaFJlUzFRTE01QkVCTkh2eUxwVG9uLzEwL1VZTFVxMS9Q?=
 =?utf-8?B?WVREeTgzQk9IY3dLLzIwWElNbGZEVmR4N1RQN3I0dXpjK1ZBTXNLb1FXaktP?=
 =?utf-8?B?TE9rcWlWWENINjJWWFMxNWtuK3BmZlo2ODYrc2Q2c3ZhNmwyc2lhaExmRkZ4?=
 =?utf-8?B?dGprQ2lPZEUvWVVER2p0VGhoRjhTL3czTjg0emRjM09wbldoTUcxNEhTS3RF?=
 =?utf-8?B?YUxKdGlFRmU3MTVhSUJ6TUcvWXJlM0hzRktPdjVWQWFweU9mVEF6OFFrb3Nr?=
 =?utf-8?B?Lzg2Q2VoU0tDT0pWRnU3UXhMTHkrYTU0ZXBsUG53TXExK1M2b2dXOGJzWVNC?=
 =?utf-8?B?aTdLaC82RHY4Y2tIQ3ZjdnpZVFlpdWxzU015YTBKeE9OUnZZTnkvV3JDR1hi?=
 =?utf-8?B?SU1pWnNwdGVGMUMrTkRMWThJVVVsTnpweXI3T0puSU5WY3J0R2xrSGxoZVRU?=
 =?utf-8?B?cEZlZ0hOVVoxQmZ0T0E1dEdyVDdYaTBhajQwbWJCN2U1Uld1YUhzT1dibnpV?=
 =?utf-8?B?RHNmdWpaTXVvSTdabGFjZEVkanJMaTl1b1J4enc4ZE5heXl1OGFWY2VSVVV2?=
 =?utf-8?B?YXFJMFR0V3g2ajVjano3dWMrZ3NXQ3BadDROMnFSV3UvVjlGb0cxVVlaNjVj?=
 =?utf-8?B?andkV0NOUjdPWVczWjNmZnJML3VDc1JZdkFZMFJOZ0xadUFwbUk2Zy9sUlJI?=
 =?utf-8?B?WEYzaGRQcUlUMXJzRnZuc3VDYkN2Q1NiWkRPQklNTXV4cWJQU3F2ZjhwQWtC?=
 =?utf-8?B?b0w0bDVvaGhib0ZwdGNJeDdwVVowWlpFeVl4ajljVWpzcHM4UkNOR3N3bEVw?=
 =?utf-8?B?bHFqZGtOUWo1Ri8ySFNXbEx6dzZLenY5dk56OUhZd1BNVmJkL1NRTnFIb2t2?=
 =?utf-8?B?cDR6emhXak9JaHdsZ3l0ZGRyTndrcGRqdkd6bkI1Y3MwYmVxbDVBc285Znk4?=
 =?utf-8?Q?cjDbQV/EI3k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHRxYmV1OGw2dVZybW9CaGMvSTFWVm43c0JoUS9rNDZMTlNFRXZhL3FSeWtx?=
 =?utf-8?B?N3VJNzBaRE1Sc2dzeXo2aFFhaUVBZXY3bkZ4Tm5JYjhYTnVyVDZXMkpSWHZk?=
 =?utf-8?B?SkRoL1BTei9kQno0OWxXejNtZmR3ZnRvZFRta0ZYOHlXVndHMVVhUnF0S2la?=
 =?utf-8?B?OWlYTW91UEdpbG9KSTJTT3c5aysxWGpwTWsvbWNYa2ZpbkJTdllWUUdpNjJ6?=
 =?utf-8?B?MllMUFFKSjd3TWZKWXFEaks1U1B1dDBCZ1hKL3dGbHBhSFkyT2pPcUxBQU5S?=
 =?utf-8?B?elIyMWhBdkJEYzlGbDVVcUFlYVF5MndXQ1hIQU1NUFQzbU83dWhXZ3hCSUgr?=
 =?utf-8?B?djMrSWZsckh2c1JjeUZnS2RlcU5FUXVFK1ZWN3E1azJTRk8rOUZzbDQ2NFhw?=
 =?utf-8?B?OUVRRDVQSkJjU0ltb2h5OVBBVkxFMUJndHRSMUNlcFZqc1V2TUtUKzY2Rlpn?=
 =?utf-8?B?ZnFJTFNvempDZ3Z0R3lENnIvcnZXMlhpMlFrQ3llRlFYbHhxbGRHeG01SEJx?=
 =?utf-8?B?NHFpaDA3a1lpWkI3TUxORlJMVkxOaWgzd2xtOUpkd3RKSDdvaUo5YTkwMWVt?=
 =?utf-8?B?OUdzOFNwR2JudnJvUGgwQ1BjWG5YbG0yeHVVMHZiK2pDZ2twOVNGbUh1WThs?=
 =?utf-8?B?ZytEdGlWck82anF2KzRpTHpZMzJMK28weTlOUmVxYkxsYU5xVW9yUlpGbmRv?=
 =?utf-8?B?eXBmSnp5NzV0YW5TUEhiUG1YRFMzcjUrbGpoQ0I5VlJSQzFYTDhOem4wZXgw?=
 =?utf-8?B?QW15QURObEM1MkhPcXByODFlQzRsQy9uMlRiZjNpblgzajl0MnN1ZytBOGpN?=
 =?utf-8?B?WjRLaVc2ZzVRTFlTTWJBVlVYcVZlMFpwODRvdHhZSUo5YmQ5ZG1JajdTSHBM?=
 =?utf-8?B?bCtJbXFxY2JsMXRwYm1mSkRkWUFPTDdFd2hRRXM2eXdpUTk4Sks0SUloRVN5?=
 =?utf-8?B?alp1MlNYeXVoMVFoVVRLR1RUZ3dibGxDL01GcjJSQ3loT1hSb2RFVlM2SDhy?=
 =?utf-8?B?NUh0cXlqSWRmTUhualRaNmNuaVE3cWpiVEdVc3ZocDFLR09HWjJrSms4OC9l?=
 =?utf-8?B?OWtVQjR2RzVPbUptaGpsNTFoazZuQmtEQXZVV2JnSHJPQklnT1Y1bXJHRDJt?=
 =?utf-8?B?WVFEOGtaRE0raFkrWkI4UnQ1RnhQLzdURGJDSWpMcFA2SEJtNXQwWTBOeHJl?=
 =?utf-8?B?WDJKZDZ0SHNPYjVkcUhIRXdoWHp5UkxLclNtWDRPMEhNTGZINGdQaVd1QVBq?=
 =?utf-8?B?S1J4VEMrM08wSDA5NXo2TDROZ3VUdUdDVHFmdFE5WElvMUhPMVhoeGQrd28w?=
 =?utf-8?B?LzVzR1Z2MzBQRDRXV2lOWGJkUkg2cCs5eVYvYVpSZVI0eUJQWFpkejdWMkZr?=
 =?utf-8?B?c0VmZE1xYkI4UWpicEl5bEJUczlqYTBzYkNlQU9QVVRnS0RyeGprY0J4MXBo?=
 =?utf-8?B?M1ZVTGNhUUpSTFRCdHh5b2JYSDllUXpSeER5L3dhaTJyc1RtUFhVWnpwZWJj?=
 =?utf-8?B?d01pZXlEODErM0dOckRGdDJEZDg5M0paem1JNVB6Vi8wc01vUjhjMDR3RDVj?=
 =?utf-8?B?UFI4Wk03aFJrdWZocFNzckJjWmRrUXZRRXNpKzMyd0w4NWorK042QXcyaXRK?=
 =?utf-8?B?dmtnamxzKzFyZ2ZrMjIvNHV6Yy9wYVZZM2wrU2FxaUs1RG9HYndzc05mVm51?=
 =?utf-8?B?UGxqWDF1djkySE1hcUxDNlNIdlJYWGxOak9VbzQvTUtkODMvVjJMR2NsaDg2?=
 =?utf-8?B?ZFJ1cHZ5Z0p1MXgxczFzcXFYTVN2ZkJESWZMei90UGk1cGwzSTJkbEtFdEZU?=
 =?utf-8?B?NW8rS2JzQk5SSE5BQWR0V2FiK2VEMVArK1I1ekkwQU9MZjhwZ21tZDAzV3A4?=
 =?utf-8?B?eWs1amZIVDVlWFJzazVyUmVJNkdseFR4NUxKZUNDNzNEV0RPUUdkZmVZQWgx?=
 =?utf-8?B?M0hlWTJOU01iOEl6bzJIUlBjcDVyVS9FZjEzR1Frd1JGeEVIKzkxdVFRVVh4?=
 =?utf-8?B?SHRLdHI2YXZZNFJ5SEk5QlRWYnpZMWpheG5pWFV3blNEaFc3VDgycExoWkFU?=
 =?utf-8?B?d3RSa1VXTWN5MURweWhTTUMwRGtFNGJWTm83U1lpRnJQenczdkpHUldyYmNE?=
 =?utf-8?Q?XOaVMHOCWtANy8AQMKRswJnHR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b7e70c5-0fd6-4148-9015-08dda26b8030
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 06:54:35.3820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FkNC/dX8YRze6+UdxG0vB0nCAeGm8dvEm0P8YTlbv9LcVQdA69bRCnonvLgXO6m/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4291



On 02/06/2025 10:37, Jan Beulich wrote:
> On 27.05.2025 10:21, Michal Orzel wrote:
>> There's nothing Arm specific about this feature. Move it to common as
>> part of a larger activity to commonalize device tree related features.
>> For now, select it only for ARM until others (e.g. RISC-V) verify it
>> works for them too.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> I realize this was already committed, but ...
> 
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -162,6 +162,14 @@ config STATIC_MEMORY
>>  
>>  	  If unsure, say N.
>>  
>> +config STATIC_EVTCHN
>> +	bool "Static event channel support on a dom0less system"
>> +	depends on DOM0LESS_BOOT && ARM
> 
> ... I think we should strive to avoid such arch dependencies; they simply
> don't scale very well. Instead (if needed) HAS_* should be introduced, which
> each interested arch can select. In the case here, however, perhaps
> DOM0LESS_BOOT alone would have been sufficient as a dependency?
What if e.g. RISC-V wants to enable dom0less but not static evtchn/memory/shmem
because there are some functions to be implemented and they don't want to do it
now? Protecting with just DOM0LESS_BOOT would not be sufficient here. I
understand we could define HAS_*. I did not think about it.

~Michal


