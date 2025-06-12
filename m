Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5690AD6BA7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 11:06:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012591.1391079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPdtS-0002TS-89; Thu, 12 Jun 2025 09:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012591.1391079; Thu, 12 Jun 2025 09:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPdtS-0002S1-4k; Thu, 12 Jun 2025 09:06:42 +0000
Received: by outflank-mailman (input) for mailman id 1012591;
 Thu, 12 Jun 2025 09:06:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/QT=Y3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uPdtQ-0002Rv-7b
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 09:06:40 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2414::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8adbacb1-476c-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 11:06:37 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH7PR12MB5949.namprd12.prod.outlook.com (2603:10b6:510:1d8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.42; Thu, 12 Jun
 2025 09:06:32 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Thu, 12 Jun 2025
 09:06:32 +0000
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
X-Inumbo-ID: 8adbacb1-476c-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJx5EnO4YbaK5EIXyUFo+yu5FbFPS1B+CMVmZW59MAZWQdX9zWSSTouFzt9yv1rlVV5yIcreJRT5FGOYtRlzMb5bvd+nuo18Lo9jIUnwib1sQW+Ew27yltR9qmwbH1+VZtNpWO7qLUsrvd4yl0LSXOKKy1ebDn5zeUgbtsimjk/iKWELvn9D8WH/dEx6daUZE/RGdoq/3OKVoFWJ4veEoyLAO0MGU8CNdlVoQbwlzCErCY/zK3FbUfLFfI69pvHBzeMrNsutpk8H6/Q49Cfc4tc+L45uCiHplPKLGrsUiKrOAVsair6xOGes9OQPci0XsjR23XfTe+9SpPnIKJgYQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TGS4lHhpEc/BMtLxVoXgH3Z68i7cjs4rWlWSQT5DT8=;
 b=jsWk+LG/ulz8Y/Slo8K7iJFf8pjt0iRF6TQq6I3ulk52bSMETdVKHOLigfJJ3PQko0ys7zmMIhdNDSNa2kvhZL5W07Wo4qD7aWhCL/wel/JrqmtVQL4ntCa06rV4No95ZHDOV8/Of7NZrZYgQgWPhuYTtUbrw5zGHhsSl2E/3YtuP7Qc8TIff877/dcBPyaKdeUnodYyZueIblgixZjzlTDNRGxU4W8x4JAbVC5EApfmEYldZCcd3f5xR0ttgQDGl6FtE0WClj1yVV6sonbDsXR5oFNGnLmrq3Ep/66JLFLVXBe5l/X83lEKo6ndylxWLh41q/5coSztIwJXBNJLWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TGS4lHhpEc/BMtLxVoXgH3Z68i7cjs4rWlWSQT5DT8=;
 b=oOu/2PbxSI56OOZ1CQlkL4xMOPBzHlI2HliFI234OjF2931psmD1WKu9v83LGjUcN2lwdcMm71zw3hwoBa+yq751jgQMPZckcZXorq3IuPJAJtcglCiWe8LIZh3PEcNu8obps2AHYMiyc4NaQkZ+N9jatNeSo+lg1meou4MeruY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <bb0002f9-4577-4809-8950-95b78ed88142@amd.com>
Date: Thu, 12 Jun 2025 11:06:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] xen/arm: exclude xen,reg from direct-map domU
 extended regions
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250611175106.269829-1-stewart.hildebrand@amd.com>
 <20250611175106.269829-2-stewart.hildebrand@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250611175106.269829-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::6) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH7PR12MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ba3ec2e-126e-4b09-33a3-08dda9906ccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dC9aeFVFRHR5QTQ1a1NpUFpWUVl0MG1MbEV4cHY5SW1oaE9qeHZheFYvalhj?=
 =?utf-8?B?Sk5MblZNN3lrcGhMcnF6WTc4NjVLQkFSM1VhYXFYdWJQQm12SUphUjhNejZ5?=
 =?utf-8?B?akp6eHl4eGFvalhKMVhkYitYRkRsb2VxN3ExWU8zeDZMaldQcFBiUUswUVdU?=
 =?utf-8?B?WWpSYWxsak9IOTIxbEhCbjIvTElVZTg1bW44SndDNFM0OGlGMGRJeEtxVVpR?=
 =?utf-8?B?TFFBbTh2VDE2bjI1ZmVWTXJmK0FSdnFZV2RiY0ZobGplSWVkcnVqZEViWGxu?=
 =?utf-8?B?eWRpd2hTTHNldm1SNm5scmJjN1dpcjBWSitCRUlLd0hmMnAzVUQrR2htbWpU?=
 =?utf-8?B?dDFVN3ozTHF6TTJtN2s1NnJSdTZoZXROOU82R1M5ZGdHbGJMMDNLVWdGbDR6?=
 =?utf-8?B?WFlSaE9xZXdSaE4zcmdVT3M0UklVZktWRTBqNHYwVGNEQiswbFB2bjYwZStu?=
 =?utf-8?B?enhXZWt3UU81eVJ1SXBlQ3YrY3VkMi8rVDk3cldkTlhma25ualF6UWpqdVhH?=
 =?utf-8?B?OVZUaGdSVGMxN3owdGsrKzRLNk16Mm0rNVV0WTFBbzJJQmFFZlFSNlROWDZ2?=
 =?utf-8?B?TXo2VkhnaThyY0ZDaHBqZTJUdFNhS3IrZWdKNU1hU1pUUmRnem9iVlVKTVVp?=
 =?utf-8?B?b0FSSVNDci9zOWY2dUdEeFRka3dKRGhaZzlNWTlLWWM5SmVESnAzREJwUURC?=
 =?utf-8?B?SlY5WXo1czJESnRCdXVmQ1hRNXhzcUhadDR5UlRLNXhoYVBjeXdEQXJMVHBL?=
 =?utf-8?B?UjAzTXFiUzFPUjNkakRUb2l1MWIvLzVzbHozMVhyZnFKUWlWR0RZVGJaQWtq?=
 =?utf-8?B?dVdlUEJ5Q1ZGdmRSUUJnaUdZWDhlempiSTY5UWo1S0VrNzV4bG91MzI2RHda?=
 =?utf-8?B?aUd4eDBRZE5vZ0tnaTBvVHJCUHR2NFB1dkE3dmYwNXIzNmZ3TjBqdkhxVURh?=
 =?utf-8?B?VGZFQmhRUVd4U0xldkhyUVVtY21MZFlkVmRlcHNjNWxKQU9PNTdKM1cvYkpX?=
 =?utf-8?B?ZEdxSzBaRU1mZ3U1VWFDSUZlU0htSVArT25RcWNRdE1JUGhmM28zU3Bma1Q5?=
 =?utf-8?B?YkxLR0NiTGdRL0liN0tYU1RZMnM3QzFXUFRrVG5vbEpmL3NSTkM4L2l5WERy?=
 =?utf-8?B?UGUrcHlLTmR3ZndFQnovcXlYaGo4MzlUWFR5aGRrWjJuQTNNSWtiL2RaTG5X?=
 =?utf-8?B?b0lkbTdUSnl4NythSHZBczYwN2JkbUlBejFNQW5yMlVJYURiS3pPajBMR096?=
 =?utf-8?B?YmZJa2VuMzZGTkhWVElNeWFteWxCV2dxME1oZzJCRVpTSnR1MWJMVU9kamdx?=
 =?utf-8?B?T2REV3JoWUtBSi91Q1VzTW5jWHFLUzBsUXdsKzE1a1AybDNLbE9XQkF6V09W?=
 =?utf-8?B?RTI0NXRxRGFZMnl2b25qUjRIcnJJQ2I5ZkJUa0FyNDRqOFBobkRwYkM4RFE1?=
 =?utf-8?B?ZUhIYjVYOXFrQnZ0LzAyQkJ6QmtkdHozYUdzaWZjNEJkTC9TRFpRTWEvbWNV?=
 =?utf-8?B?TmNnek9Kd1pFV1FYLytyOVRJV2tPRENVU3g3ZlJvbXB4TjNYZml1bktEbGZm?=
 =?utf-8?B?MDF6RlNoQm5CZmg0MlNPaUFYL0habHpCVFpsTHk1SlBKR0VXdWJYVUZDUnpI?=
 =?utf-8?B?SGtvNGo2eVEzRGdaT2JPOGpBdC9NMk9HNnVvRE5HM2Q4RTFTWFBaMEZrOVNh?=
 =?utf-8?B?dFhyR1hXMGhxdmM4U3NIMzJHeXZnRHBMYWtaYkd4alUyTlVqVlRMRVdDTExM?=
 =?utf-8?B?dEwyYmZlRXV0WDJCUXlQcVYxOUlVditKU2p1MERoMXdDQ2hKYnhRQzQ0SUV4?=
 =?utf-8?B?V21HMHBYeFZjR3dmK3lOd29vYlR4UXpydm51aFNLNFBRaUtpSk11N255Ymtl?=
 =?utf-8?B?T0h2Z0NSWXJ3TTVQWkUvaDh4SnhVZktndnZtalZIditLNlY2VU90c1YrRGtZ?=
 =?utf-8?Q?oN8uRpC+5ug=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEMwajdqQWtiSzFuNWtNZVlZUWxqMDhMVml2WW56VnpJa1NrZmNuM2hTQWM3?=
 =?utf-8?B?bDh0c3F0MTZGNEEzcDVFKzVQaExvek5jSWVsdHBjWkRxdUNrdk1BeEZiTEtS?=
 =?utf-8?B?SGorZnFlNEhISi9JVDdZeHhjbWQ5SnJyeEYzWlFxb25OZmhPTmRsRE9TcTBt?=
 =?utf-8?B?WDRxR0dkbk9vYVZ0bEdSRlJJb3A5ZzdSeEhmSUdBYVV4aDZkejFSU1JPR01v?=
 =?utf-8?B?eDdoVU1YZWFWeXlaSmJkTEorL3BBTTQxYThScnVGZXVCLzRKY3g0UEhabE5J?=
 =?utf-8?B?ZWRkY0YwWE0yaFZpdGNIdzdnN1h3dHcyTm1Gb0Q2NWpmb0VqK0lpUjNtSzdP?=
 =?utf-8?B?YjMwOFUrU0NIV0pCUzMxc1F2Q1RwQXpPRlR5NU13NUtNRnQ5NkV0eGN1RWNU?=
 =?utf-8?B?YWtpYmc5bFdZWUtEL3hyajVRSll2aU1hTUErU1VoVlVsNTErbnlUZzNhS2dT?=
 =?utf-8?B?cmd6WGovcGp3S3VkV1lxR3J6ZWt4WkpZbVJhQ0NFVitVSkRxUW1ldk5ZUERk?=
 =?utf-8?B?TVpNVmRnQTJDSzRLNGxvckFTN3VGakh0ZkQ0S0lpbjNrSkhML0ZkQmx5b1A3?=
 =?utf-8?B?MUFsekg3MmVTTGFFektzQ2RLWHhtNW90TGtTRDVPdVJhbjBvajN3aEh5Rlds?=
 =?utf-8?B?ZVVlVzVKdmxOdGhkdU0wQU5FSGhsR3RWM21SRm82b3hudlB2R1JjdlRlSUZW?=
 =?utf-8?B?U2l4TUp5b2FvZnJnb094VkJ6cTV0MXBSZG80aVNySjMxM2xCaE9SM0JUTk5p?=
 =?utf-8?B?Skl4Yi9wNWtENU4waGdXVmk1bEZEOEZEaHl5MXhTSjVrN3daY2p5YktqQURa?=
 =?utf-8?B?NENZemtoRUxGVXhVWWZLdm1razdFSmxJUmFFeVQ4cmpIdTZJcHhQNDNjeGJX?=
 =?utf-8?B?d1UvWVJZTk5Sb05xSW9GMEF5ejNScUpmcWM4U0U4MDFkakFRMHV1Znd2ZlhM?=
 =?utf-8?B?WU1xNTlYbmpJZVl0Y2F3cU9XU0NDeWtXcXNhZ2FYbG5STmdHS2c5Tm9EZlNl?=
 =?utf-8?B?MXl1WmZsYk93SXNhZEFhTnk0eDFrQVpLTjhuQjBMZjVyYndtZmpVSWRRVEhJ?=
 =?utf-8?B?ZjNXM3lBQ2s3VWVYZ2F5YVFQNnBiTEtnRktnUStlV0tsdHFlaG1tWmIxTW9r?=
 =?utf-8?B?WVlvUW5lMVd5cWhEemEyK3kyeTRKdWVVU3ArZzFFWGd1V1FpVzN1cU4zRTVK?=
 =?utf-8?B?SzMrNGdnYktraVJUbndmemFqKzJqMXRFT2ZkbC9VM0FIZTBxOUtPcHgxaU9j?=
 =?utf-8?B?cHZBczA5QU5paFY4djlwVExvZzJya3dXRlZnTEorckl6RjlOWkpscklPTS8v?=
 =?utf-8?B?aUtQSmRXZjNQbHJGNnlwL1VMaVd5NEthS21JMitLQnJFOTBHUCt4Nkl3aXhi?=
 =?utf-8?B?VXBRMUhuRWZTNmpCQXNYd09CVkZvTllON08vRFBkYVg1TmRObkltZ0t5SGJv?=
 =?utf-8?B?OGI2bFpjZDY4K1NMbVFFQy9RUlI0VWFMQ2Y0aE51R3ZMV2RtNEQ4dlNDb2k2?=
 =?utf-8?B?WmNHcklvV2liNkxFNnZDaU5uMCtaZTZTWXlvMVh6c3BKbDQ1bnlIZ2pWU3Ru?=
 =?utf-8?B?bkJVTTg1VUJzbmZ6ZE10VVREaXNIbWN5SnNwQWlTVllMWFloUXIxYnh5QUo0?=
 =?utf-8?B?NmZncWU0VE9LN3YwaE9kU0luMGs2b2R1WXNETUF2aHpvV3IwUzdlRDlxWm4r?=
 =?utf-8?B?VnZoR0xqTVMwOHhWUEFFZDc2enNJaml1KytXNVhIR0hYbm4xSGpUaDFFNm5k?=
 =?utf-8?B?Q3ViaE93Vy8yQ0JuSjVLOEtPSlRnRTZVd0dBQUptRkp5NmxmcG1RZWkzRENu?=
 =?utf-8?B?c1hTSSsxWE1ad2R6NXVhMU1nMDIzM3NWdUpSMDFnRWFtZ2JkbWN0dnZmU01u?=
 =?utf-8?B?cWVQSWhpYWhlQWhwSFk5ZHdZbCtBOTlxMXkvV3RseUJOVnlGZ1l3RDZibGs1?=
 =?utf-8?B?dUovZXQ1aEVQTGpvS2VEQ0pzYlFlaGhQWGhBb2NkMkxNcEFsc1VPUlQ4S2Fn?=
 =?utf-8?B?V0FLaTZRY1FhSnpnN0VGQTFxZTdBcmZVK2RnZkNHOXFNazByV09hRFRvb0xi?=
 =?utf-8?B?K2psVzBGTWlQNzFpM21EU0x4cXVzRkFwWlFrQktXNS9MaFR6cm8rNE56MDRy?=
 =?utf-8?Q?tPIg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba3ec2e-126e-4b09-33a3-08dda9906ccb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:06:32.4528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23S2OmJA7jZ2PsWTxeyqvq9zecSYL8iQZEIGr5J0rLXfMr/ObTZ+WZD1sqtoUwFt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5949



On 11/06/2025 19:51, Stewart Hildebrand wrote:
> Similarly to fba1b0974dd8, when a device is passed through to a
> direct-map dom0less domU, the xen,reg ranges may overlap with the
> extended regions. Remove xen,reg from direct-map domU extended regions.
> 
> Take the opportunity to update the comment ahead of find_memory_holes().
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v4->v5:
> * remove extranous -1 and +1
> * create local helper function to count ranges
> 
> v3->v4:
> * conditionally allocate xen_reg
> * use rangeset_report_ranges()
> * make find_unallocated_memory() cope with NULL entry
> 
> v2->v3:
> * new patch
> ---
>  xen/arch/arm/domain_build.c           | 80 +++++++++++++++++++++++++--
>  xen/common/device-tree/domain-build.c |  5 ++
>  2 files changed, 80 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 590f38e52053..cef6c85e22ec 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -792,15 +792,17 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
>  }
>  
>  /*
> - * Find the holes in the Host DT which can be exposed to Dom0 as extended
> - * regions for the special memory mappings. In order to calculate regions
> - * we exclude every addressable memory region described by "reg" and "ranges"
> - * properties from the maximum possible addressable physical memory range:
> + * Find the holes in the Host DT which can be exposed to Dom0 or a direct-map
If you took occasion to improve this comment, then I would replace Dom0 with hwdom.

> + * domU as extended regions for the special memory mappings. In order to
> + * calculate regions we exclude every addressable memory region described by
> + * "reg" and "ranges" properties from the maximum possible addressable physical
> + * memory range:
>   * - MMIO
>   * - Host RAM
>   * - PCI aperture
>   * - Static shared memory regions, which are described by special property
>   *   "xen,shared-mem"
> + * - xen,reg mappings
>   */
>  static int __init find_memory_holes(const struct kernel_info *kinfo,
>                                      struct membanks *ext_regions)
> @@ -882,6 +884,13 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>          }
>      }
>  
> +    if ( kinfo->xen_reg_assigned )
> +    {
> +        res = rangeset_subtract(mem_holes, kinfo->xen_reg_assigned);
> +        if ( res )
> +            goto out;
> +    }
> +
>      start = 0;
>      end = (1ULL << p2m_ipa_bits) - 1;
>      res = rangeset_report_ranges(mem_holes, PFN_DOWN(start), PFN_DOWN(end),
> @@ -962,11 +971,51 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
>      return res;
>  }
>  
> +static int __init count(unsigned long s, unsigned long e, void *data)
> +{
> +    unsigned int *cnt = data;
> +
> +    (*cnt)++;
> +
> +    return 0;
> +}
> +
> +static unsigned int __init count_ranges(struct rangeset *r)
> +{
> +    unsigned int cnt = 0;
> +
> +    rangeset_report_ranges(r, 0, PFN_DOWN((1ULL << p2m_ipa_bits) - 1), count,
I don't think it's ok with MISRA C to not check the return code, even though in
this case it's always 0. Either we should check or have (void).

> +                           &cnt);
> +
> +    return cnt;
> +}
> +
> +static int __init rangeset_to_membank(unsigned long s_gfn, unsigned long e_gfn,
Here you use s_gfn, e_gfn but for count() you used s,e. Even if unused, I would
prefer consistency.

> +                                      void *data)
> +{
> +    struct membanks *membank = data;
> +    paddr_t s = pfn_to_paddr(s_gfn);
> +    paddr_t e = pfn_to_paddr(e_gfn + 1);
> +
> +    if ( membank->nr_banks >= membank->max_banks )
> +        return 0;
> +
> +    membank->bank[membank->nr_banks].start = s;
> +    membank->bank[membank->nr_banks].size = e - s;
> +    membank->nr_banks++;
> +
> +    return 0;
> +}
> +
>  static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>                                               struct membanks *ext_regions)
>  {
>      int res;
>      struct membanks *gnttab = membanks_xzalloc(1, MEMORY);
> +    struct membanks *xen_reg =
> +        kinfo->xen_reg_assigned
> +        ? membanks_xzalloc(count_ranges(kinfo->xen_reg_assigned), MEMORY)
> +        : NULL;
>  
>      /*
>       * Exclude the following regions:
> @@ -974,6 +1023,7 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>       * 2) Remove reserved memory
>       * 3) Grant table assigned to domain
>       * 4) Remove static shared memory (when the feature is enabled)
> +     * 5) Remove xen,reg
>       */
>      const struct membanks *mem_banks[] = {
>          kernel_info_get_mem_const(kinfo),
> @@ -982,12 +1032,29 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>  #ifdef CONFIG_STATIC_SHM
>          bootinfo_get_shmem(),
>  #endif
> +        xen_reg,
>      };
>  
>      dt_dprintk("Find unallocated memory for extended regions\n");
>  
>      if ( !gnttab )
> -        return -ENOMEM;
> +    {
> +        res = -ENOMEM;
> +        goto out;
> +    }
> +
> +    if ( kinfo->xen_reg_assigned )
> +    {
> +        if ( !xen_reg )
> +        {
> +            res = -ENOMEM;
> +            goto out;
> +        }
> +
> +        rangeset_report_ranges(kinfo->xen_reg_assigned, 0,
> +                               PFN_DOWN((1ULL << p2m_ipa_bits) - 1),
> +                               rangeset_to_membank, xen_reg);
> +    }
>  
>      gnttab->nr_banks = 1;
>      gnttab->bank[0].start = kinfo->gnttab_start;
> @@ -995,6 +1062,9 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>  
>      res = find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
>                                    ext_regions, add_ext_regions);
> +
> + out:
> +    xfree(xen_reg);
>      xfree(gnttab);
>  
>      return res;
> diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
> index 6b8b8d7cacb6..99ea81198a76 100644
> --- a/xen/common/device-tree/domain-build.c
> +++ b/xen/common/device-tree/domain-build.c
> @@ -193,6 +193,10 @@ int __init find_unallocated_memory(const struct kernel_info *kinfo,
>  
>      /* Remove all regions listed in mem_banks */
>      for ( i = 0; i < nr_mem_banks; i++ )
> +    {
> +        if ( !mem_banks[i] )
> +            continue;
> +
>          for ( j = 0; j < mem_banks[i]->nr_banks; j++ )
>          {
>              start = mem_banks[i]->bank[j].start;
> @@ -212,6 +216,7 @@ int __init find_unallocated_memory(const struct kernel_info *kinfo,
>                  goto out;
>              }
>          }
> +    }
>  
>      start = 0;
>      end = (1ULL << p2m_ipa_bits) - 1;

Other than that, LGTM:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


