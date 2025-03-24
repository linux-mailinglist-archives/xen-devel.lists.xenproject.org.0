Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A879BA6DEB5
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 16:31:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925809.1328695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twjm3-0000qv-Fx; Mon, 24 Mar 2025 15:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925809.1328695; Mon, 24 Mar 2025 15:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twjm3-0000oL-Cv; Mon, 24 Mar 2025 15:31:35 +0000
Received: by outflank-mailman (input) for mailman id 925809;
 Mon, 24 Mar 2025 15:31:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t537=WL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1twjm2-0000jD-9S
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 15:31:34 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2413::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fab653d-08c5-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 16:31:32 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by LV8PR12MB9112.namprd12.prod.outlook.com (2603:10b6:408:184::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 15:31:29 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 15:31:29 +0000
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
X-Inumbo-ID: 0fab653d-08c5-11f0-9ea2-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hV6QJwaETjjRhHveuZd2WbO0hzgFizCbe7PihWPbvNBZ3BHhMncRc9xJxZ2Jn+nTvbAaw218j1xsgA0qId9p7W2sAWp9Ckal24hmasK57LjXPZkMAOLxT9iE1U1NV+spAk88bhU671FhT21e1SmqfmBzoy5GnhpmvR52o2a14wRfbpJ2u5C8s/qdK7nqHJRao4qM0AodhsOL5bkxrAkcDt/7kxURstrFZ12FlK+jjisseSlI/2Yvbz6JIxs+XqdToByEAfD393vXiovDcG3OkFApZ0tE3960bPPC26iKR4mpX+QDRmFav/S6TGJyF5pmMzwY/lVzw3XQ43rWSKi84A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORyfd1SSS5wMIDkMUcni5yE88UaDpRubRWVrd8A+pq8=;
 b=Sxx+JR8JTnhNvVUOsPE+IxJWWyjwb1ojK5MVUNcc5Z+GKQFtvdaAgnAFmusHb53Fj8DB3l/mbzNfsHLAhkhHYjawQr/cIvGr/h0EYkGElLfYAe8RlXVfYdfraC/jSEXlIe0X2sIBEOG9eJeBlRMA8JtgEwZf9ObwEIc1svm5+51qWISMvRIgLS3X4fS2cTsH22peH2Jj/xYAY5PvQfZmlQBF20ZQxsyYPRqKGAynVz+5Qr/XmXq3b5tn9FY+6eh0dHmT7KvFlbcstolwuW6yG6qAKtv8nG49BCHk6GTrPqxUXAwTuBqLqHjTP7CNVPhpCYuuhiRoN30qJLqWlNiNwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORyfd1SSS5wMIDkMUcni5yE88UaDpRubRWVrd8A+pq8=;
 b=Mzne9KONIwwOEJWgKEI8RBg3olXA1mZcR+D4M2op0zfms1P82ANROCFKlYROR6+/HTZVpujesTqxBpAqCCP4JqSsO2yg7vT5O2yaLFC5u8kGzjlAEW9GpR1J8T3w9tqzPCkj5BSdgBdOz1X0vh+Jn+RNErImzUyTbuc1fCBJUME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <66815d0d-9330-468e-b601-cb8aa6be1c36@amd.com>
Date: Mon, 24 Mar 2025 16:31:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/arm: Fix nr_spis handling v2
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Luca Fancellu <luca.fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250318090013.100823-1-michal.orzel@amd.com>
 <D8KAQ3MH52YA.1G12M32NDFRJW@cloud.com>
 <17608388-b900-45d2-bb74-8eec04ab1f76@amd.com>
 <D8OLLCXYKINR.3HD274I110XCF@cloud.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <D8OLLCXYKINR.3HD274I110XCF@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::6) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|LV8PR12MB9112:EE_
X-MS-Office365-Filtering-Correlation-Id: 96718840-b510-479f-828f-08dd6ae8f255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RER5VFEwajBiUSs3VUJXNDRDOEwyZUJWQUpTWWwvTDh5MUxkSEwrc2hwYXNo?=
 =?utf-8?B?UElIRXZQekc2ZlBzUE1kblhvcVZUZXl0SWVqT3h1KzFwWE9mVnFnWHdyTjA4?=
 =?utf-8?B?UjUvcWhodHZwamhtUmJaSHZ4a2FLWHgxU29ST1BSVmFBb281Nk0zRTZaSW9k?=
 =?utf-8?B?S2xRaWN2OHVxWStYR0laRVo4bGNDbFd2d1B6UFJ5WmppVUxVZVR3RXhqeVpu?=
 =?utf-8?B?R0RHWFRUMXBORzdQclhtV3BJUmIrcFQ2aFBJREpNQThJaDd4Snd2UUJzQWtm?=
 =?utf-8?B?R2U0dDhlTkZWdkR0WE5xQXZIZk04czRMR3pjVkdWQXQvek5sL2lpR0VWYUpy?=
 =?utf-8?B?S2ZONFFzN010b2RwTEFVbmJYdDdLeVprYWg1VzU4VXByZGEyREcza1VaYnN5?=
 =?utf-8?B?cW1uUk42WngxVXVQMUNRZjNRbmNBcXg4a09jWDl5aXhvRjcrcWkzQ2Q2TFlX?=
 =?utf-8?B?R3gyYldXZE9wSkFtOXZlYzhWQmZ5R01sQUQ0MUxRK2VkTGpab3UwTWw4WkN6?=
 =?utf-8?B?Z0x2TlZ2VVoycFZMamM2blAzdUVSZ21TdGlnaGp2ekFlSkJScnI5UmcrZUZY?=
 =?utf-8?B?cXZsMU5UclB2NEtRTko2WlNLN1QxSkZxanVySmIvdEpRVFl6bUUxcThrYTVy?=
 =?utf-8?B?KzYyNFR0anFnbFQ2RVJvV1REOWYvOG9JcCtEZ1NsL3QzalpJbDkxRE0xUHhk?=
 =?utf-8?B?M0J1WlZKQXBrNHcvM21Qa1ZrdXBkVmsvNm9Ld0cvSlVNd2wxdTlxMnFHV0RS?=
 =?utf-8?B?aXZHR0tXaHl3TXA3MzIzTEZBd0ZCZ2dkVnZtLzNVZlFqY0t6WURiVDFQZE5J?=
 =?utf-8?B?SVVpNS96eXgyRzN6WngxNUxGaFFsRXQzSFJqNGU2ZjlCREowM3pvL3NQQVJY?=
 =?utf-8?B?YlZ2OUhuZVV6RUdheVdpYWd4ZGM4Tit6bGJ5WmVvbWJyYkY3ZFJONlRvK2R6?=
 =?utf-8?B?aXltcWR2QzJ6ckQwUjY4WURCOGhlbWpkaFhqRTRGOUwrU0p1aEkrMTNxK2tv?=
 =?utf-8?B?bGJ4TGxVd2E0MGlITm5hbXdJOG52SzErSlZBb1NIN0FnaUlvanFTNWJ6cGVy?=
 =?utf-8?B?NklWenY5VjVnbzVVYVdtRFlyUXRRbHpaQUdPZTk4YjYzWEhZc01MTEwyeUIy?=
 =?utf-8?B?NTBlNEFUemczYmNRekNpNTY0cWlnUXNIVUFaOUNkbDREREZpd1VjQnBzaEtr?=
 =?utf-8?B?ZHo5anJhdUtCcGQzSGVuVDdwZGxkanZxd2NxbzZjUVdMb2llUFNTVXVqVEZS?=
 =?utf-8?B?ZFFVSTJ2M0haaEMvclByVjNab01pVWpyVG0rYlZkMGprV25DWnBDdlBVejZM?=
 =?utf-8?B?bUI4VnhHWFZLS3owZk9EbjdQS0QzUHkzTGhsYiswV3k4MVV1OTJPa0E3YjZz?=
 =?utf-8?B?K0g4UG1FNWp1UE45Yk5UUW42MzNwYmRDbGNCc2o0bTdpaGFhZDlSODdQVXNX?=
 =?utf-8?B?OHYrN1IvZGpkM3RKVUZONTlGQ05xZlJFQzBMVlI1RDJlY1VVamJpdzY0ZDhk?=
 =?utf-8?B?bFloQjZUbTFyYTF4RnNGb29kSEQwTTE5M2ErNEpBTjh2eFBkQTJ1VURGVHNr?=
 =?utf-8?B?RkhYU1Q2dEswdmx4U3k5ZkM2REpUUzJKOHlPMkF4bXdtbnNqd2VJa3B6MFZV?=
 =?utf-8?B?K3UzYzJQZkhVRkJuemlUUjRiMks2dUxtbEdpRnhESzRmNDlYR2JOdjNjSkMv?=
 =?utf-8?B?SVhBZUJJcEJJV3VaOVgrajRlWDRRVGg2YUtidlExVXZhMmdQYmVsRTFDeXRZ?=
 =?utf-8?B?QVJTaEdRa1VVdjZnUnE3VVFtWHFiRFh4U3RaNFJmQXJQaEtFV2lVMWhabERZ?=
 =?utf-8?B?LzhFQ3Z0dGlSRkYxWVJiUzVXbkQyOWp1NVhqQ1lXSVlnRm9HOEsxbjB1TGhh?=
 =?utf-8?Q?RCJGtt884FIOu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlJrYVp1M2hSSVp1Skx6WnFldjVvR1BFcjZ6eVo3OGtnZXNXbmlZS2lDSGk4?=
 =?utf-8?B?MXVxSzM1K3o5bmJ3ZFlqTHR4T1cwVnpXM0pQdTR4Rzhxc0dkNTRScno1V0hP?=
 =?utf-8?B?TUZmNUl2WGZRL1lGYmo0OGR2MC9WbE9rK1lBU0F0dHVTSW50WStyTkMydEtq?=
 =?utf-8?B?d1hSQTlCLzgxeTNVWmFhaHluQkpIQ3F4a0JHdFF1S2lzZG9LK0tDRkpyTGE0?=
 =?utf-8?B?bC9za1NKWnRmNGZjSTJtTjgySmtlR20zTStpTXB0OTdjMmZEUnRXMHg3cGs5?=
 =?utf-8?B?cmNGK1RzMllDeldmbkYwZVdrM3JqRE1GQUFBZFVXUVM1bWRBWGxDYWlLS1RD?=
 =?utf-8?B?VnBaT2prOWtoQmZ4dG02R2RmQWd0bDkvcnkxd1lDWGdBSERtS0NXcnl3V09o?=
 =?utf-8?B?TnRLVVRjREVuZHh6bUYrUGFGajBnT3NFMGs1NGZqVm9xMVZKNElCcDNnQXpQ?=
 =?utf-8?B?VnJOSGhiWlliN0NzMlp4aHdZQjlvZ0cwNTNjVVVCZGdyejZDc1BNc3Z4SDd1?=
 =?utf-8?B?eFYzaUlBRHRqR1M4Y2RmUjRRQ0piVzZza3ZhMGV1S2QraWtjM0hwRVF3alBU?=
 =?utf-8?B?SUFGdlBNOHlMeHl2eW91QnRiaXlkVWtQdGU3VjhxWTZOejJ1MHJHdjBPc1hs?=
 =?utf-8?B?ZUFiei9aSXFZYnlOZDBUaklVZUdsV1hJamNJQzZZdk1YMCtuU3k3cSt2cDln?=
 =?utf-8?B?VnA4OXlFWlBxSVV4aFdxa1BBREY0SUx2UW1RaVZtZTBCbUtab0puY2FFRy9Z?=
 =?utf-8?B?bVN5SURiSnU4bUlhWWpyRkw1UExtTDR2RUZzT1UyMDNreDVSV09RZ2FrWEh6?=
 =?utf-8?B?QUtmbmhBLzRDSkdKNFJmNUpyQmlHN1dJZndjaVZpTnlpVm54MnlwaS9FT29R?=
 =?utf-8?B?V2E1LzZzLzF6WnlZTklHMUJjT24vUEJJWGRjS2tUb2oxeFpURVdsa2xsRlEr?=
 =?utf-8?B?MlA3VWh4QmljUXR0TkZvSFVGTVpqWko2cUxDQlY2WmZ3U1FaMGNseUduQy9a?=
 =?utf-8?B?TklsVTVQTTJOSGwyZVh3b2FQaFR6a3BEa0RsZjYybkNEUXFERWdSYVFqR0Vv?=
 =?utf-8?B?a0pJb3BhQTduWVpVZTJFalU4bStGVFYwVWhqUzJiZDdLeFVuSEZxQTBDNi9z?=
 =?utf-8?B?d1BiTm9SR2MrSWRzeTdvNXg0WFlma1FneGZ3QmsrajNyc0FtbmYzVWJseDh3?=
 =?utf-8?B?NVVwMWpHMWJKT2NCYjZXa0dYM21sV2N3ajQ0MWY1QlgrT0cySDgxWjVtVmlX?=
 =?utf-8?B?QWNHR0Y0ckF0SXpkVXZNRmtzcnB1Z1VkbllRcExadXEwc1IvMzIrWUVZNzZ3?=
 =?utf-8?B?YkFQd3JqUGdXYWt1SGhyeEhBR0c4VVlqYm55QS9OSUpoQXRxT0ZhZlJnbm1L?=
 =?utf-8?B?ODRtZmROeklucFFIVG0raVp3Z0hJZnlXQmZwMXVMSDRTaThhYmNQNy9XM2Jl?=
 =?utf-8?B?ei9JVU5tVmZkczJLS1d4WE5QWm0zMENNZDlUaStsalNLVUlqM29WK2RSc2Jw?=
 =?utf-8?B?elhBczZGN0VSbWhsQzV0NzdPOE1QZklXUEdKeXhxa3ZPN0Y2YXRTMnFJK2p5?=
 =?utf-8?B?dEJRYkhndXBnY3lFS21KUjR5U245REVoYUR4VWt4bXc1K0VRMXdNbUEyVGY1?=
 =?utf-8?B?NTR5NVN2OWtxd2I4QWFZdGxrTVFWYkVocFc3N0FYNmFiRmJHTTBJZ1VZMXhH?=
 =?utf-8?B?STkwYm5oT0UrZzhGUGo3OGVqR29WQ1hDcy9HVzFKblBlbnJYVmcrZlp3NGF5?=
 =?utf-8?B?TmFxand2UWpWbmJZb0x2b0lqQ1dEbFBuYnlRMWFrb09nK0ZGRWgxMGk0TGFw?=
 =?utf-8?B?ZGlIOXp4K0JvME1QWEE4TUpldWN1Q25tdVN6K0ErZDVSa2tRVnJmQ21tVlA1?=
 =?utf-8?B?dW9CYWhMMTgramdRNDNKbWVYQ2JIRDltaFN2NkJwdHM4LytROTlnNlFCWnJM?=
 =?utf-8?B?aUc1dERraGJhdUxLbXRqSmJrRCt3cTQ3MFNRc1pjNUNhaUhPUWZQNkZ0M0o2?=
 =?utf-8?B?cmI1emQvU0dpV1d0K2hHSmRrOU50cjhGUHRpenRXZm9FQTMyWHRuVlJhNFVX?=
 =?utf-8?B?WmRWVlpicVRtNTIwamFvcWJFeVEwRFJtY1V3RjAxNEZ2U3czRFdjL3pxL1Rs?=
 =?utf-8?Q?8oJo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96718840-b510-479f-828f-08dd6ae8f255
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 15:31:28.9970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qrZWKEH+cCg24IEAzKr61VPWP/XF526WQ9ddHPk1R4MqxpM4kD3+eYCbDoDWqY+l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9112



On 24/03/2025 16:22, Alejandro Vallejo wrote:
> 
> 
> On Mon Mar 24, 2025 at 1:08 PM GMT, Michal Orzel wrote:
>>
>>
>> On 19/03/2025 15:01, Alejandro Vallejo wrote:
>>>
>>> Doesn't this regenerate the golang bindings?
>> FYI, it does not. The bindings are already there for NrSpis and default value is
>> does not result in a change (for verification I checked max_grant_frames that
>> uses LIBXL_MAX_GRANT_DEFAULT).
>>
>> ~Michal
> 
> Oh, good then. Though it does raise the (completely separate) question of how
> correct those bindings might be if they ignore the IDL's default values... :/
Why ignore. AFAICS libxl_domain_build_info_init is called there to grab default
values.

~Michal


