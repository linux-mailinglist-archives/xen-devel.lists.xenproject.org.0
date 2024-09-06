Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E280B96F6B0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 16:29:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791878.1201894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smZxr-00053e-46; Fri, 06 Sep 2024 14:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791878.1201894; Fri, 06 Sep 2024 14:29:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smZxr-00051M-1T; Fri, 06 Sep 2024 14:29:31 +0000
Received: by outflank-mailman (input) for mailman id 791878;
 Fri, 06 Sep 2024 14:29:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MdYt=QE=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1smZxp-00051G-FM
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 14:29:29 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20602.outbound.protection.outlook.com
 [2a01:111:f403:2405::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b7483eb-6c5c-11ef-a0b4-8be0dac302b0;
 Fri, 06 Sep 2024 16:29:27 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by MW6PR12MB8899.namprd12.prod.outlook.com (2603:10b6:303:248::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Fri, 6 Sep
 2024 14:29:23 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 14:29:23 +0000
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
X-Inumbo-ID: 6b7483eb-6c5c-11ef-a0b4-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYorFe7AdSWnaoE+6aDhT+zBO9i1NF3IzPCBqpKWuyYQEI1qGDE0Ky0VZMcBeRkerVyU7xoND39qdbmnlnMVGz5YxypxEUHdcmHiu/0xpWMMImrH4h+2w8CwrKv8vYW5nOPS9S05DONQMLUa9NNWDeKWWQXN4hmAIwLgrsjOLvM3e8R0emtUzQlIROrvfapX0Bbm0kCFZS8AApPS8ZoaaHVDd1Hm0tEAieMhVFMLpB/YlyWvjQPdJ9Fm0PNoswrAvjpesNm5Lj8YxT2R3HrwuNh2/uFjpidglu8BAAc1dHvfdHMa2Wpo/DO8wsblBI+vaWq9ajCyPo4brXis6ZBpeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwcI3F3aj5JGKDfQdizb45sJ/RSF0Kon85Xde0Y8ZRY=;
 b=EPKXP1XiU+3UVeEeOisfiQVS7j9bzjdayQdLOLzGfGWCeY/OM2oyKgT9Vtbm+cUbcV2FWx7EoUj9R+Uv0Wjl/v4WNemIbfqk/c86EX0Ejq8RjFHLWzUZ3FdpbdaXLTuoSEJANgJkRmmGMKA4Gpk0nIC22ilk1vmja6Gbg0hlzc1BM+wxDl75RG0X+S+jJ7N8z9RU2KpkG7O39tN+LZMNN+qra8z7fldJeoFpUL/gcyAxBijElxX8QhYCV+EprprS4sJkwl7W7RqOA7dgQxL7EYyxF8o/EC6NYIL2M8d7/IcRqowEPO94sGcqeZWylpwKf7yRM+LG4Oy9FZyOOaKjIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwcI3F3aj5JGKDfQdizb45sJ/RSF0Kon85Xde0Y8ZRY=;
 b=SHJX6OYcmghHu7KRXSIgnwCJYB0QeekqhI0A/4JAFPmelamtX0M8EyfMPLGsB6GNaFBb7jsCFWwrSfsCrt/YpInnCSYEDcNlrShvib7e+YXuDIwFOJLn/Y8HmUdLpzIeK4zDOxzkr5nIWT4G2WZDtjWZpm31uW2vIVyl8tp8xP4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e0e7bf88-4425-4942-80bf-c38aca3603de@amd.com>
Date: Fri, 6 Sep 2024 15:29:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] xen/arm: mpu: Disable secondary cpu bringup
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
 <20240823163127.3443404-5-ayan.kumar.halder@amd.com>
 <c0146fd6-25cd-46fe-a1d8-428ff9c69b05@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <c0146fd6-25cd-46fe-a1d8-428ff9c69b05@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PEPF000001AC.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::12) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|MW6PR12MB8899:EE_
X-MS-Office365-Filtering-Correlation-Id: 35bc373c-c4cf-4217-e5b9-08dcce804d70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NklEdjl5VUNsY2lEemlyTFZVT09maUNoVXRUTTBkd0crc0I2S3dZU0JMQUZ5?=
 =?utf-8?B?S21oY2h5WGhRaVBKVWtoenVMdkJPclJXMDhZT3hjbHlSbTMxZ3pGUWxFcWxz?=
 =?utf-8?B?c01FOGVmaDNpS0xNeElCeWJrbzNLTGcyRVUwY2FCVmNiRDNjK1d4TUw2T2tj?=
 =?utf-8?B?QmRJR09ZZzJOSnN5VEI2ZVpnbUlRRE5BS1Vla1gyZXlpSTlrRXdvbWNXYzMr?=
 =?utf-8?B?aFBGQjh0Ykd4eGErbmJLcjc5dUplbThhZWYzOTlZQzdYMkN4TmV3TFNWUHZx?=
 =?utf-8?B?QnZYNlhWUmJiaXlBV1c3a3dhaWkxMFFMZVB4UlNrR3dhYXo0OGM5VjVyV0s1?=
 =?utf-8?B?ZURyNkhKU21OL0VwdTNyMUdZbWgrZlJBM0xjZXpteHJLQ2s3VW10MnllNFRr?=
 =?utf-8?B?Wm5zcStsMitmUXROdFpsdlZnVXlXWWZCM0JHbmk5UVNGaU1Db1FhUDBJUzJ6?=
 =?utf-8?B?aHd1Nm1lcEkyQVg0cGc2WFhBdjhObGFFSzhSTTJJb2c5MW5RaEk4ZUxKa1J3?=
 =?utf-8?B?SGpMOW4yRHplNlZQb2l0b1hKOUFjN3V6MmxyZ2ZMbDI2RG1vcUhMaWtCSmZI?=
 =?utf-8?B?T1NxaGdyWDFkampOYmJTNzg2YlErMHc4MEhYN05NSlllVHE3RG9IQjNEeFd1?=
 =?utf-8?B?SkhBbUVVRmZDR3B4akR3UUsvRVdGNHorV2FKSmhiZFg2WjU0SmcyeHJpbC9Q?=
 =?utf-8?B?ZTEybnRocjN6RHcrOUZhWFRadlR2enlFTmtjNXJkeUZmUmF3RmRFV29rRGlY?=
 =?utf-8?B?QlRqQS8rQkFkU0ZUdzB1eTlNUnRvdlp0R1Z5Z3loS21naExPdVNmMmRXSDZH?=
 =?utf-8?B?N0pNUlY3WWJkaExISDkxSXBhMy91ZkJ4TVdhSnA3OXBXNVJNYks0bVlhVkhq?=
 =?utf-8?B?b3JoMmNqb2VzOXV6MFdITC9XS1J2QjVqdGMxOWsyM1ZmM0EwN0JKaFRwcm92?=
 =?utf-8?B?VDlVQ3hUNVhjK3k5cSs5QVdtUTRNNVRIaklBT2RQbW1HMXZIT2FGazhhc1N3?=
 =?utf-8?B?K01vTWhkNEpraHMxVkF0SEtyK21LRVdLY3Z2dXhnNUpmdENDUFZERERKZjU1?=
 =?utf-8?B?cG1FTllZR0hnd0s1NDhhM2laTG4zdU54NVZMMEtKQmdCbE5PK0FjeWNjSVB6?=
 =?utf-8?B?V3F4M2R2cUlpYmxzNkZwUlZYcHB0cEk2UnRZbWgxUEJ0WnIzN0JDQUcrdGR1?=
 =?utf-8?B?MzNWbUVMQjlCVlgyNG1rajZmSHNUeWl1S2VBR3RTMHFUc1ppOEl3NHR5WFlG?=
 =?utf-8?B?akNSaElOOE5uYlg2MjdMRTR0MHBQWmlUbHE3OXByb1J2aCtQM2FYRW4rMExH?=
 =?utf-8?B?Y0x6N0VmVXV0YmRLQXVCK1hydnhlVGVNL2I3RnhQSzhXWE90aFRJYlF4UENG?=
 =?utf-8?B?NkYrclRxUDZ3allLRGJYMWpXa2NPQmI3MHJuTlpyYTFZdUd5a0JoazZXaUtn?=
 =?utf-8?B?cUpQTW0wdEVXdWV5eFRQMk96Qm9iTkYydlUwc1Aza2FKSmJXMVdEaUlONGNa?=
 =?utf-8?B?RzRGckRwSDBRQ2kxb1EvbVJ0a2FQbmc5aEFiNWd0aTlnYTF3ci93V2FHTGZY?=
 =?utf-8?B?bWY0dGN0Zk9oYmZ6Y2pBZTVBTDFUVE9teURkZUI1TEZoZDFSa3pHVm9ETzMw?=
 =?utf-8?B?WE92L2JnWTF2aElvbTVvbEliVUZrN0pwWElWM28zanJkWGFIVWRZV1YxMnh6?=
 =?utf-8?B?d0l3dlcvYnVuUEFMdFhyejZHK0FLYmRLWTBTMzRnUExMTVJ6c2NqWlUrL0Va?=
 =?utf-8?B?dTY0dWVZNERHbDZIOHFHN044L1FBamovb0pNVzNuSkR0am80WnEyRmNaWnhx?=
 =?utf-8?B?QVk0NWg1ZVI0RlhabWcxdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UG9DZnRBWkpSTStOSnlvdUFXdHBMMncyd053TFZEUkNkVzFySThwcWlibGps?=
 =?utf-8?B?ZjhJaitWQjVSSnliVVZRNWU0blY1QVR1Vk1lVkpnSkVQcngzUDBsQ3NPZzhn?=
 =?utf-8?B?WTc2VlhoYm01bjhNQ01yYnBuUzZBVkZIRm03Nk5xRDVBUTBOOGYwcjBXMk9a?=
 =?utf-8?B?Rit2VTZWTnozQmVROXNNUzh2aXNlcDRlMlV3c0JsVUdBMEtQMklyYWVSNi9s?=
 =?utf-8?B?Z2hLUlR0dVNYRlpoZzl2VG5CRFBmWktJS3NyUUxoTDBjV1NSa01VbkhtRzlP?=
 =?utf-8?B?ZlhKN3YxdmRJVVVBdEw0MjJ3RjVyRFZIMlZTY0FwVklCdDRtV2hGTmc2YllK?=
 =?utf-8?B?TS9yQk9rQks2R01XNDNjNWplL3MzSXFMQUdmMGp5TGVYT0ptcjFzZll2SkVU?=
 =?utf-8?B?REdPU21QeWZjTWxmdTF3OWh3Y0lqNkVFZE1GT1JEcXBIUUsvVzZETGMyWGxQ?=
 =?utf-8?B?OGdaRW5MMUExRU5MNXY3WldFUzNISEU3Qk1KNzZOTlo4NUZWTXRwcVJkUFNh?=
 =?utf-8?B?V2dZT2tQdmdwRGlhL3ZNWURRRGgxMEZ0WUFaUExWM1ArVlBidG5CYW1MYWVo?=
 =?utf-8?B?c1d6U21WS20zZlkzWUFRQVBham5ndG14bDRNaXJJd2cycmM2dUFSM1pGQnd2?=
 =?utf-8?B?WXpsOVZQYUthZVN2VGc0Qld4VFNyVHIwYUExdnMzWUd1eDI3YUVtT0Fkcmd2?=
 =?utf-8?B?QmIxOXUxc0tKMTVIajdNYlMyd0hNVm8zeEN2MGtjdVhYWVJoQnQxQkZqQ0xE?=
 =?utf-8?B?c2J1WitIN0hQeW1tSklnSHVpUDI1T3NGTnlxakIxZTRDOHpadUF0SWZJV2pp?=
 =?utf-8?B?MFZGME80U2tuZmQyajB3VXFjZ2Zxa3d2VFRZN2NWcWRPMkhDUTc0ZWN2OCty?=
 =?utf-8?B?c3FwUys3eUkvekxLeUdIRDgrV0F3UjViWFdDZGtvWmxtM2R5SDFPbDdpb2dB?=
 =?utf-8?B?MkphK3NVUjRjdnphYzJ6MUZjbjdUcVo1Vnh5aVRqZ01lS0E5MVJZN21ldGpW?=
 =?utf-8?B?Z2R5Y3ZiWXdmRTA2d29CN05pbEdDelIvWVc3NG5LZmdWc1QwekxSZ2h4eHFz?=
 =?utf-8?B?SWhuSzQwSVA5bHZzMWNka28xa2habEhRdC9FazNQdFU0UmJmNGNVYUpXeEZs?=
 =?utf-8?B?NEZQVmlsZ2dNV3J3cUtmSkNNOG1rT1NxMDZkSWtCQ056SENXNGROOUVKeHFi?=
 =?utf-8?B?eHBrb0xLT0gyN05vRVdUeUZJNHZQSG5RZEtTTExmSHRyYTBuK3FCMjlqS3Nh?=
 =?utf-8?B?TVdDcWdNckZWUGs4Z0Ezc2NJdGp5WFliNXlQU1J4K1B0Z2ZYVWZYenJMSTZ5?=
 =?utf-8?B?MHVvdDFiVW5HcERMNWpjOS92RmhZaDNrUjlkbVA0ODhLeUUwWEJTdHF1Y1pW?=
 =?utf-8?B?Umx2WDFmbXI3eUpnTnRMUmVwUXhONmY4Y2w5VFY1RnV2d0RKOG5yV1hxbytF?=
 =?utf-8?B?bEhLMFVaRGpabGlsY2tqMmxHUG1SSnVNWDRLSmFvRmlmZEZQQmNVeXp2T3hy?=
 =?utf-8?B?YkUyUjRud0NIWGRSNXVKZlJrckhnMDJMMkQ5Mk9lQmlDSTFhMWNvb1BqdDN5?=
 =?utf-8?B?K3hhQWNoa1hnQjB5Nnh1aThvUHNKMlFxbFRzYjZMS0RDL2lma0Q0bUZsRTdl?=
 =?utf-8?B?cXRzRU8rWEJHVFVTOEtoU2RtNERSS0p5bmV0ZWxFQVV6ZnFaV05saVdaa2NR?=
 =?utf-8?B?eHVHV0FFOE1hU21pa05kZUsyMW1UNVlvVTlGZWR0V1FzZWhsSXZlUVIvek8w?=
 =?utf-8?B?bmgya1hXZHU3enhLMkhabkZ2SnRoNHMzMm1MdERkVmtqeFNkUUphRlExM3Zv?=
 =?utf-8?B?VFR2ekdiZ0ttSVVzMmRock9VQzBTSDhVb2dBVy9ZTU5JL0ppQWM5ZmpseUpO?=
 =?utf-8?B?Wm1IWGptai93ZVYwcENjaUhmWFJ4cStJT2k3b3pGZENoK2xuYnBGVk9xVmRM?=
 =?utf-8?B?Nkd5TS83Q1NwWGhodkJTQllJcTB6cTBpcUUrQjgxNXhZWG05WWxDZXkrTGJ2?=
 =?utf-8?B?elMrOHhRS3ZDdWNaTlN5NVU4a0VLWnp3VFg2c1NWRkNYckQ4Qk5uQ0tOd3lj?=
 =?utf-8?B?dUp2dWVnRjFYSGZUZGdqMENFRVZqTEU4aXN6dUFVcHVzdGFQYlcyd3lIc2Vu?=
 =?utf-8?Q?zE/kTEOfsWCV2DLgRg2GJnJ7f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35bc373c-c4cf-4217-e5b9-08dcce804d70
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 14:29:23.3657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XWgrPiDYoY/GXLKVCJ6rIwkd/mK3B5fviDvq4hQED09otfRZ4XQsw92/IKcmZ88sUs4feHqk2FeaNWDHvjgVrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8899


On 28/08/2024 20:24, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> The title is a bit confusing. It implies seconary CPU bringup used to 
> work on the MPU. However, you are adding a stub for 
> enable_secondary_cpu_mm.
>
> Also, I am not entirely this is really sufficient to disable CPU 
> bringup. There will be plenty of initialization done for secondary CPUs.
I agree. init_secondary() has already been invoked before this.
>
> I would suggest to update NR_CPUS to 1 for MPU so we will fail early.
Yes, I will do this.
>
> For the title, how about
>
> xen/arm: mpu: Implement a dummy enable_secondary_cpu_mm
>
> On 23/08/2024 17:31, Ayan Kumar Halder wrote:
>> Secondary cpus are put in WFE state. We do not support SMP at this time.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>   xen/arch/arm/arm64/mpu/head.S | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/xen/arch/arm/arm64/mpu/head.S 
>> b/xen/arch/arm/arm64/mpu/head.S
>> index 2b023c346a..1579ac0408 100644
>> --- a/xen/arch/arm/arm64/mpu/head.S
>> +++ b/xen/arch/arm/arm64/mpu/head.S
>> @@ -68,3 +68,12 @@ ENTRY(enable_boot_cpu_mm)
>>         ret
>>   ENDPROC(enable_boot_cpu_mm)
>> +
>> +/*
>> + * Secondary cpu has not yet been supported on MPU systems. We will 
>> block the
>> + * secondary cpu bringup at this stage.
>> + */
>> +ENTRY(enable_secondary_cpu_mm)
>
> Can we print a message so it is easier to spot that 
> enable_secondary_cpu_mm is not properly implemented?

yes, something like this

PRINT("- SMP NOT SUPPORTED -\r\n")

- Ayan


