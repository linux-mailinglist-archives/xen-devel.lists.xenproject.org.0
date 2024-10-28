Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 960EE9B33CA
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 15:39:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826619.1240941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Qtp-0001BL-9e; Mon, 28 Oct 2024 14:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826619.1240941; Mon, 28 Oct 2024 14:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Qtp-00019r-6f; Mon, 28 Oct 2024 14:39:17 +0000
Received: by outflank-mailman (input) for mailman id 826619;
 Mon, 28 Oct 2024 14:39:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TXyF=RY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t5Qtn-00011V-UY
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 14:39:16 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66dc6add-953a-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 15:39:14 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 14:39:10 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 14:39:09 +0000
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
X-Inumbo-ID: 66dc6add-953a-11ef-a0c2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qumykAGbyDkxgmvv7GPzNXhcTZj7z993Mw8i/II7D/ZQaYqWmq0vkGqHz1uSWUJwTlvanKX3KTXGt+jHrQ7wRPs+OhTI0SQxT7KZX5pOWqGI3JtGcNiPIzlF8VtU+Nq9g3zlu4n2TnHN5ubf7AproC1vKYuBkMuWn4LqA+hieX69FSuZeb3rgv4OBkv/Vo1x9neCMo64roaiXwl5xtLnLWDN+uAyl2zBc2WD0lMdaGCPQLgcjjnRKnNIs/+r5baFKr3Ng8IGyZ/Av1yy8szFfieM+49cMASdbx9tw8JQyZd6Q9lljoMFR3NZPh8px9+lKPjQ6ccmASTYenQ57FEpyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1Broc+isBHzmuy6XDBB8C0OzmMK81vvYiGkBqrFEHQ=;
 b=TsG8JNaUD/fsx7YzwD2ohuqmVg0UoyUCuMc2H7WApaovsMdLh6hZPW998k8To5cSL8PUrdt8QQ42jvxYu71GAPjxrzvI+TF2sR8rI7z2Nah67IJ7qYnyS3jGPQmgXwj6FE/ZX3Li0JOY1cMapSlvzKArwKQimqUnxo3wI9L9QP1SazIK7YaBK6JH8J/8lWXALG9p0K7iAyUB92+7E+KGiW+c/uPbwvE6F1sR2M75i5UEhpPvdXmozKH/Q8frlji/AwsHvO5hqDYb8SlLat/VrmuHsEW51M9ru937nkw/ay9e6j8adNKsxOIsF+7YTP/dqWEIdeR8FeaS3gEvWiK5Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1Broc+isBHzmuy6XDBB8C0OzmMK81vvYiGkBqrFEHQ=;
 b=wEdni2ApMrHNCOvE9g27+sBUPPgRAwIxPZTTdCQ9HoKIbUm1BeZ1W91/vuawRdjLWOahRhQTd3ZE+0udb7U5darIe6ut6Lcv4ClxhmV/S6fAOEudctCno70W+K0UaE6IQbYvupOpFSc53URfDxwM2vXTKAilmtQUD+KVDLr78oQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8fa530cb-4d70-4300-8d4e-1e7208f7c045@amd.com>
Date: Mon, 28 Oct 2024 14:39:04 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-7-ayan.kumar.halder@amd.com>
 <27be8d00-8260-460e-948d-81418b93662a@suse.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <27be8d00-8260-460e-948d-81418b93662a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P191CA0012.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::23) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DS7PR12MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d322f67-b23a-438e-9be0-08dcf75e488c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VzhBcWtBSWtpYWxnUW5jSXI3Y2hhRms0Nk1HcHIwbitIKzhXeGxOUjVNTzMw?=
 =?utf-8?B?VTB6YzJRMGIwTGxrN3EvdW8rdXl0MVhRN2J6T1Z6dlNpQ2p2QU1lVWxYdG9o?=
 =?utf-8?B?Ui9JNkppQ0t2V2NBbUhOVkV1SjNyMEwraGhRUndJRWhtYzN5R1QycDZLZVdu?=
 =?utf-8?B?eEdjanJPRXRFeXhQNFdHWjVtbUxTN3JxVHZqRWRhbVI1c0p5U0V2ZGw3OUc1?=
 =?utf-8?B?c0Fta3hpdGM3SUFNellkWk1sQUd1TVlNMS9nYVVIRVptZFNJcUZDOXRoeC92?=
 =?utf-8?B?Mk1CZkUvS1gzaWhKYUdoQnZMOUVyRDI3K0o4SUtRM0FlUTFUS1dIMTY0Q0pp?=
 =?utf-8?B?TXlPd09mbHBuQlEvQVpxamliYSs4a1pkbWF0TUhyZUp1U0tKSUhwKy9LMk1t?=
 =?utf-8?B?REYyTVF0MFkrT0FoSlozc0pkRFJMNXArOGJBNUJyTXByU1ZhWWpQMU5mUW9p?=
 =?utf-8?B?a1lMSFM5MUxOVkR4RW8zbFdFczQvOVNpS3RIb21QdE9ORkZpWGhwVEFIaHFC?=
 =?utf-8?B?eE1CZi9zK1MvMUdDY2pMcVpnUy9heDB2WUZzU0htc2s1VlA5R2xhYlhwdVhn?=
 =?utf-8?B?TmJPRDNwbmd2ODhydjlsSE5VVzhqTjJiamNMVUd3Z0JNRFBQT3dvSGVEL2M5?=
 =?utf-8?B?UEdPQXU2NGxuL251UEgzT1dVRjZ1dk54VXpNRnQ3NktNa0dPYXIyWXZEWlQ5?=
 =?utf-8?B?a0V6cmdDTks5KzJSQ0cxaDREZUdySzgxRDNEY1ZjR3ZSRzIwcTVkM3U2cXIv?=
 =?utf-8?B?bUdCL05WU3BVeG8ycW0rSDZSOGFVZlk2TFc1SkFEbXFQWHUxUFZNZkg3blZ5?=
 =?utf-8?B?aXc5dHowM2JJTmltVXZhU0s5N0Fmb01wZlJFMTJ0VDlRZXM4ZkJJR1duYUdS?=
 =?utf-8?B?REZsNmxYZ2syMDlGUlZQUTdSalVkSTJUMmtKcTM2VWFOOVh0SW5JTHJIYU8y?=
 =?utf-8?B?WkdjUGNUMEV4b0dxTU5pR0ZWTGtTT2pFWGtUdHFiS3cxNmU5dHI1Z3l1aCs1?=
 =?utf-8?B?UVVXYWFiMFBaTjg1TXBJOFI4eCsxc2RRTXNmUmtxdVNWREkxV25NdjZwdzVr?=
 =?utf-8?B?VWhkZytXbmo1S2lnajRITUV5SzZGcVhQdDEvWW5yWHd0Rk9PSDMrcldWbDE0?=
 =?utf-8?B?RHpWYkJ3cWx5TzNLZEhMb1lza25CSVV0NzdhL2RzUWZ5NURSNnhUWHJBOXk2?=
 =?utf-8?B?RnRZS2pXdzZzWmVkQjF0Z2dqRTIzU2grSURydENSUEdYc3lXc1VpS0JjS3B2?=
 =?utf-8?B?YlBTMEtydXkyUFN1WlQvNllEV2dzMmVzNzh6dmdCdUtRV1MrcVpnbVdCMjE2?=
 =?utf-8?B?WENJTGozd3RuM3BVVHJINU8vV1Q5UU13S21wamN1MWJiTkYzeXo0Q21vOEVz?=
 =?utf-8?B?TzBCcjlDZUp2blczL3hBczVoSzBQTDdJYmFWWTVXOGorTm5Ga1BIZDV0TlVr?=
 =?utf-8?B?WlJLZ3YrUy9ROElyOWM1SlRmaWpsUk56SXpuZndMTWVoSjJTR255Ylh1U1Qv?=
 =?utf-8?B?YXZ3Mm5SWWlhMXN0WFJJcUNzTlJnVXA4ck1DZ0hiSUVxWHJLamV4VE1rY3lN?=
 =?utf-8?B?R0l5TzdCaDlTQVVEUUFzZVIzZkl1TkJSMXFVTGJ6ZW9NOXJDNDNZNEovNWZN?=
 =?utf-8?B?Qkk2T2ZmZXFDZHJTeHpYd2lreXFFNG0vbFNxQStVVmtaRDA5RTJUZGFobU5N?=
 =?utf-8?B?cDc3K3VmV2xUbVoyRVZiU0FrNGxrZDN4Q1IzbG9ONHBaVGZybU5tdS96QVZj?=
 =?utf-8?Q?FXmEQQZjuZrXJxaN/BYwc9KsaGRAFc02BDiF1vJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGM3dDNsVVBpeDJRV2RHc0pTTlZmL0oxalA0blVJamloNEtMbmZnK091NVdY?=
 =?utf-8?B?L0UvZExra1lGblZ2YlI0KzNCVUdvV3Ewd1Y0bWdWZklCT0NaYldrSHI4MGYz?=
 =?utf-8?B?RlkzU3lidTFoUmkrZ2xUcVN5Z3FoYmd5SWpYNENUVWRicUt6cjFxdzh1cGFu?=
 =?utf-8?B?b0ZWdHVXaThkZ05iSHlnWU13Q3hGak04RC9YTk5SalBoSnU4UnRqazRLS1ph?=
 =?utf-8?B?NnNadlJEUDNndGR2VUI2cmZ6Sk9hTWU5c0x4YlI1RFd5ZzAvVGJCZTNFbFpZ?=
 =?utf-8?B?V1M1eWwveUFISStzdWJMQys3cHRjNExhamMreFpKVzNjV2xJS1gvZHZqNGdP?=
 =?utf-8?B?UnV1MVpvaHZNM2ZHdU5kOVZxYTBEY2I2em1NaG5WcmQvYnhSVmtVNXJNcUh5?=
 =?utf-8?B?T1g1M3VkMXZhd3ZlenhHdU4vUkZNem1DUnQvQTJIQzBFc0N5WGdhNTJuYWFF?=
 =?utf-8?B?NlZRN1g4dGZGRVhZbUowaW1NbGFJU0oxYWo4Z1hjSmsrRm9NR1FlSVlaeTQr?=
 =?utf-8?B?VFl3NmJVejBtdllkQ0Zua1poTGpCVWFqRmF2eHRReEpSUFpscHhqdFJKQi93?=
 =?utf-8?B?SGV2ODA1bFVIb2hiLzVrUWxLQnY4NFdlT0VtL2E5Rm9IU0hKaE5NWnVwMW83?=
 =?utf-8?B?UFVQNHB4cHljYWZPcTFtVE51VVZnYzFXSHAranRvSmt5UjJZK0oyWGwybEhw?=
 =?utf-8?B?ckh1WVZwUkpjRkpoUnR3ZDlCdTNFWk5sZ285RjFLTGE0eDQ1aGFoVS9JT1Ft?=
 =?utf-8?B?bmQ0SmlyU2tBaTZwZGZ4OGI2amVveURYRDcvRndENmV5QmMwUG5NbXgvandF?=
 =?utf-8?B?ZnRJYUt6L1FrWWx1VFVncjVYVU1UcjFaQTNZS2QrVjBiMVZncEk2UkpUaHRz?=
 =?utf-8?B?WW41SDJEOTRSMmhLM0RtcmhWN3RqcmgxSzZnRXpOVER2U28xdGp6b0p2bm93?=
 =?utf-8?B?cnNGcTVTZnVIOHh2enpZcGlCWkgySUpSL3ZSNjZUbVhlZWMxT3RzLzM5WnU3?=
 =?utf-8?B?MG9kR3hhSXRaL2s0MzlVMjZGbVFaMDJKdGsyWHRYb0I2aHgvVUxUYlFjS3VD?=
 =?utf-8?B?Q203amw4emV2MGdDNnRtNWhKNXhLUVRlT2JXS29nMUNOTXRYVm5lNnVpRFRu?=
 =?utf-8?B?M202WHY1L0V6UHpyQkZHME1ibXNRYVgzQzRCMWdSbWVPVlRZQjg4dlNBWUVI?=
 =?utf-8?B?c21aMmJqYmViT1ZIclZXKzY4L3R2OHpaOTd2cmM0Z3VGZ2VQNlI2SHRaM3lW?=
 =?utf-8?B?OXFRemhaM25qaFowbWZpdW9TSExGMU1tcDE5RmlrUkZVZHNvUmMvYzlnTUJ0?=
 =?utf-8?B?Y0FCRTEvWWIrcEdtb1pMdkREeTl1K1VzWnRORGVmZzNoSzFRNWtRTXM5bGJU?=
 =?utf-8?B?VU5jMTUxUWpUMlJKMkdLd0xua081aXF3VXRUL1VQTTNlKzNydTJmNjdVSE5Y?=
 =?utf-8?B?aDhTdnZxdFF4Y01jamZPaERjcWk0b2tHV2k0ekp5eTdmNnhmL1M1UzAyL21J?=
 =?utf-8?B?QVRvSktyMUlsWHcwWHhIekN4SkRGY1RZZldkMGFzNlhYSWViWTJ3SEhaTllz?=
 =?utf-8?B?RU8ybElNNXVScjVKVzlIVTZJaWJVNEZvS0MwUGdBSmdFK0ZsNDIwelVQdThU?=
 =?utf-8?B?QzUwVTl0RXNZUWUxblhSaFg2VFhyZ2d2YjhEUWJyanYxZVREaXJxcWFPSzY3?=
 =?utf-8?B?K3BYYUNsZElabVljSGlFb3FkUm5BOFV2VFdpbWxuQWUvazdaY1BFZGZIQzNj?=
 =?utf-8?B?VHhtZU1Da0Z3TVJVWWVhMVVxYWV6K0tLb3J0eTFGTnUwY2FtdGNGOVl1RFdJ?=
 =?utf-8?B?cklOcGRYWGYvRnNnZEtoMlhiK1BBUHZkNGpERnk4bUhDM0hIVjBtaWNVM0dS?=
 =?utf-8?B?eUp0SXBsdjd2N0QrSnlBUE5aWU9BSWRkSlUySFZaQ0pSZ3pxTDRuUDVpUEZP?=
 =?utf-8?B?ZGJNcFl2R1kzeXFSTVJZazlZbzdGeEgwazNvdGNOMHBtNzQyM2h6OE9RQjF6?=
 =?utf-8?B?VGtpc1lNOERIYkhtTVI0L0RQQnY1SnV1TXdZeGUrc3JVT2tjZzZCOVlQRkV3?=
 =?utf-8?B?cUNVZ1ZTK1Juc051Um85MkVxR1VCWHJjRFRBUFdleHJaM2NFZ3MwR3dqMkZQ?=
 =?utf-8?Q?Lq+9REeN6ney1gUBQz0WvyFc1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d322f67-b23a-438e-9be0-08dcf75e488c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 14:39:09.8532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ceSocD+N2W83Q3Ci+eISa8Lz+9DL73kdBHr+c7zsqzihqCcoW9IBMXC4WACs7q51dhWHx8HuXjzNnIc5EbXBDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5984

Hi Jan,

On 28/10/2024 12:55, Jan Beulich wrote:
> On 28.10.2024 13:45, Ayan Kumar Halder wrote:
>> --- a/xen/arch/Kconfig
>> +++ b/xen/arch/Kconfig
>> @@ -6,11 +6,13 @@ config PHYS_ADDR_T_32
>>   
>>   config NR_CPUS
>>   	int "Maximum number of CPUs"
>> +	range 1 1 if ARM && MPU
>>   	range 1 16383
>>   	default "256" if X86
>>   	default "8" if ARM && RCAR3
>>   	default "4" if ARM && QEMU
>>   	default "4" if ARM && MPSOC
>> +	default "1" if ARM && MPU
>>   	default "128" if ARM
>>   	help
>>   	  Controls the build-time size of various arrays and bitmaps
> I'm afraid I can't easily tell whether MPU can be used together with any of
> RCAR3, QEMU, or MPSOC. If it can, the new default line would need to move
> up, as it's the first one that has a match on its condition which is being
> used.

MPU cannot be used with any of the existing platforms.

There will be patch in the future series where we will introduce a 
platform specific for MPU. That can be FVP for R82 and R52.

- Ayan

>
> Jan

