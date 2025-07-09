Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B4DAFE2BD
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 10:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037880.1410378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZQGZ-0001Pz-17; Wed, 09 Jul 2025 08:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037880.1410378; Wed, 09 Jul 2025 08:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZQGY-0001Nr-U4; Wed, 09 Jul 2025 08:34:58 +0000
Received: by outflank-mailman (input) for mailman id 1037880;
 Wed, 09 Jul 2025 08:34:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=42hY=ZW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uZQGX-0000qu-6c
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 08:34:57 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2416::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9678230d-5c9f-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 10:34:55 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BL3PR12MB6593.namprd12.prod.outlook.com (2603:10b6:208:38c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Wed, 9 Jul
 2025 08:34:49 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 08:34:49 +0000
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
X-Inumbo-ID: 9678230d-5c9f-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgrmMK3qo2gtWRZ1mo5lRXxw1au1TelFLitD7PuEfjBCKPqMlQc2od10F52URiPebVdTxPRwL+ZcL2k1686pFTkl2LXmpi/Do44uDn2n/hOwGWn4yPIQhDv3pk+mtcCqLrcGzf3J075Iw0qptEWaBWET69POHezKZLnCUVWcTE/mAOl6J/1kVvhmgq5HW64jvapVitpJCGvq6oMb9j1OXIyQUASVFgT2s8vS6kSbSjYbvlZXQgF39k5yDxFKv09QWneGe7MS29zjKJMkC/I78DRc6KHW+OiKna6EglTJ+64SbYsOJ5Oc3bER3pVZBezUEeLNmPr6gQaj4F3rgxO94Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGncKrmgUbV+DB9x6uqUgzc8XmiPFtJ+bbZNXV/ECoo=;
 b=Y/mS7g74al0cTYMmBdU40T4h0OwzBf4Iw+UwiNX/B2ofb6OyLYwU73lDIC/j1uHr43xzJAKlbhWZePgVvP0nE8c2MiItOEdz3+1sREbvGwf51aOMotvbNRd/qTLW2+mFpd2phhLLjYHOZNb+tzF+8zxBabe9RJLXkGX+T42PbD0QTa8E6mPui7Uc2psPNlL0C9cOb2eKrko1fmJNM0TzII6LiHaaRF3hSv57gRMAh8nCs24/65A5ARR1Jy/gZjDKINld3D43TRBFBs8BBGACAf4KVi5PDcHqEKMEtqV5MwmUNGxj40vgHMCgqp0fYu2Ckud4ARTPmZdxAQ4BLA0ydA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGncKrmgUbV+DB9x6uqUgzc8XmiPFtJ+bbZNXV/ECoo=;
 b=DnqEADG9P9IS5J2AVpWd4h24r1SVHvaRnf9iUE0/awHAl8PD3y8HIrdA56/iVUdPGaiEq8leT1JAlvbWFLeAFbKqDeBPhNWdXZ61C/YTYAN4ll3dXFoVRBgiwCWdNkuhxJBqAybmOeizw+k7zygB3nmdggNORrjvZpiihHNw9qA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <10c17850-7e53-4547-9ce0-29d58e35ca7e@amd.com>
Date: Wed, 9 Jul 2025 10:34:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm/mpu: Implement early_fdt_map support in MPU
 systems
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1751464757.git.hari.limaye@arm.com>
 <100cc63353021067e3eae68d092ebd73f484f416.1751464757.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <100cc63353021067e3eae68d092ebd73f484f416.1751464757.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::9) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|BL3PR12MB6593:EE_
X-MS-Office365-Filtering-Correlation-Id: a5e3598f-60de-49ff-1014-08ddbec377a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q01rcmNlaEhDTW9qMVRVaEFZTEMyWWxXZEkxNThnaFA3dlJrb0JNVDl3cVpn?=
 =?utf-8?B?b1hqc1haWmxPTzErNlQvSjlIWWxydTRlblhNcFBJcXR0VmprUFk1SkdWWDE0?=
 =?utf-8?B?M2VuYWMzWGFUUUNTMEdkcG9WVUhybDZVZlZGRFZtcERCUHl0M3M3Tmd5ZFcr?=
 =?utf-8?B?V05kUzNTTmk2K1dyVUxDaFdjUnBoYng5aGZRczc2cENBUGc0MXZINWFuZXdu?=
 =?utf-8?B?a2p3MkNLT0JCSkpYbEdaOHlieE1XWnZOSWpoKzBzaERyRHIwOVhqZFNDSHhV?=
 =?utf-8?B?QUVTclVneUYrMGRjYkMzSFc3NXFPMGhNd20wOHo0TUdhdnMvSTl0ZkwxcitZ?=
 =?utf-8?B?VDBicEtZR2lzN0U4RWt1c2JxRjV4cGdieklFVE1TcmFONWZuUmFzcEVGUWRJ?=
 =?utf-8?B?K3JUNms3VWhZREJJSm5uUzNRV0psZ0dsUnVwbW56dGY0T29naC9kZGt3WWFl?=
 =?utf-8?B?MWNIVnlXcWVyUjg4dGxIYWtwSjNJcld2VHhiMkxDUWx0Y3RDWS9mMmVxY3li?=
 =?utf-8?B?L3Fkc01ML0R4TGNNUTlKeHZ2NVhaaGgxQWNPTnVIVjZXdERtNHgvZXpVSDRp?=
 =?utf-8?B?ZlpwcHR6WGlkWTBXVktaaXhrUUM5b2ptbEg1aUVSbDZoaGcwTkt3QlZmbzd1?=
 =?utf-8?B?WGtvQjl0RUQzOHlTVkhoUGEvQmx5RUlJNDQySzN2a2o5S3lRcXVUaXN2KzFI?=
 =?utf-8?B?RGpaTGhaM3AycEJ4eSt2OHVqYk9GNTMwZGNjZVdGYkpWYmtTYXZFVjlKQ2pk?=
 =?utf-8?B?TmtSWHZuOUdxV1NBaWFSVmRUNi80bkszaklmNUhKcnZ4N0hFSHRTMzBQR3ZR?=
 =?utf-8?B?TGZBNDB5UUJ5alVieEpOdmhvZDZwQjFkNVpFQm1hVmorRGt5a2x5Q1R3V29N?=
 =?utf-8?B?Q2ZBcXBRcldURzRPSG5ETVNnNmlXOFVsYUlJZEJidXIvaDZIOGhvdjFrWU5j?=
 =?utf-8?B?WDBDWXRKbStxMENzMzV3cnRzRlAwNTdyZHRoTERCa1RsNjNrbFppTHp0bHFp?=
 =?utf-8?B?OTNodUVITXM4dTA3bFJ2M01TekM5Unp1WVdnaVR1d1MwRnBlblZnOVJCMlFh?=
 =?utf-8?B?dHAxVXpzMjhWbkJlQkp2OC9SVTkzaW5CNHNiYlN3dGNFejhhdzh5WEdxajZU?=
 =?utf-8?B?NWphaU92R2xBOVlVdEV3L2xEQlBIZnNYWGNsdUdZcWx1UUVBOU53akxDL3l3?=
 =?utf-8?B?SzlDOVRQT2lENzdFM2VTeDdQT3hzWjBIbXFrbFJ5b0lHcGZSUHU5a3FNLzBh?=
 =?utf-8?B?SEgxNkRlZHlxaXJzeW10SCtZeGxSd3MzRi92aGNrL0k1bzRSYlBldjA4VGt0?=
 =?utf-8?B?S2FJVmNWL011K2JyN05LVkttTkN4MVhxMjU2bko3YWZuWVM0MEZxeURZWEJu?=
 =?utf-8?B?eTdteDIxSURMdGxrUG9oakMxcWllNUdQK3J0ZHA1NEZXaHE5SVJQRDE1MkJ0?=
 =?utf-8?B?bUZBSEIvVFovVmorYnBIZ0p4d0ZQRUV4SXRQc3puNDFtWnZxZDYzQUJqL1NR?=
 =?utf-8?B?aGNZTHBtdi9pQWNGNTZlSit3bFByTTZ3ay9uM0pqL0RBN0RYWDNoUU5hL1ZM?=
 =?utf-8?B?enB5LzVEekhySENzUzhRaUIwMnRHL0xQQzRpR2VkYlEzT0VOUzB2QmYyN0hh?=
 =?utf-8?B?N0tTcGVHYk9IR0E1eUs5d3hqRG5LSU1jdTJxK2FnbXZpcjRmQkVLY3hMa3lv?=
 =?utf-8?B?WXpadU4wYytYOU5TbEoycURreks3azNJd0JSRHJRMlZDbWFpMXpYbVdoT1Fl?=
 =?utf-8?B?cU9QZUd5bmVzc211anRodjYxeS9vb3A0MjZ5bGRiMGNmZklOT3JsSkpEZzFw?=
 =?utf-8?B?aVRIR0MwUWZQcnV4bEU3bnk4WFBBcGw3SXlBNXltdzJaSUNpdmhYaE9MVWJR?=
 =?utf-8?B?TytKNFQ2Z01ZT092N1Iva0tVRER1WW44YWUwQzFhYUNJSDJoc09Xc0c5blVt?=
 =?utf-8?Q?kEiHI9jYTMI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXlCc1lXOEg2NzlMb1k5YUwyeGdXS1ZlbWhsaE9FMkN4T2Nic1VCcjZWK1Qy?=
 =?utf-8?B?WnFSalNUYm1hTnY1YTBtWTdnQUpidHB1a3lqQ2dnVTk0dUdEVHJUSkdIeUd2?=
 =?utf-8?B?TFdLQ3ROMHJucW4zZEd2cnFVL2VkUGVsNGNPNWZwbWt5NDNpcWRtN2g4TjhJ?=
 =?utf-8?B?QkNMMGM0ZktWQXVOM3h6UC9nSVpxT2VJd1FaT0UzY0pRMWMrbGZieXBiVWxM?=
 =?utf-8?B?SVd0VXpJSjJBWU9GOFNOVW1wM0MzMkxlUVIwMFpRZzBPU2Z3eFNhTzAyN055?=
 =?utf-8?B?VGNKZ3VFZ2JLMlRKWHVlQ1pwTERYemozRUtuaGVNK3pGU3VxRkwrbVAvcnNr?=
 =?utf-8?B?S3hXZGtSbjNlT3VteHJTTVI1QU0yOWFsZG1FL09MZXQ2dFc2Wi9IVGtiVkJN?=
 =?utf-8?B?dEgyZFFuc0I4MnZaWkZDTWQ5L0s3WUVwUG1Vc3dyTnlaQ2FqVkJ5N2dWQWMr?=
 =?utf-8?B?R2tiYkh5MHRKNTJGVFo5R0ZWcGxJaEw1RzFRb2lCZ3hFdnZhcHpUOHdwbWV1?=
 =?utf-8?B?QkJWb0pzQTBETUEwa3dBbDlYai9GalVRSi9BanBkV1JWZlFOcW0vZnJsOGFB?=
 =?utf-8?B?bE8vd2JpdVN4OTQ2OFk5VEtlK0xTOE5LS0RXK1hVbmNBQ000dkNXcjQyVHVs?=
 =?utf-8?B?UFA3a2wyM0JJeDY0b1VDRS8wb0RLSWRSM2ZLUDgxelc5b0g5dTRZQXdGZjNM?=
 =?utf-8?B?b1h4T3VYWi9KZkliQlBDVncyWmxDMDFnTjlDL1dVcXRNZXVKM3ZRbU1xOG5H?=
 =?utf-8?B?cHJsY1NPNnExclZLWVptZW1URnpkcCtKdWh6V0lobVNMTHVLK0V4ekZuT0Vs?=
 =?utf-8?B?c3IyYXBBM2ZyK0V1d3g1MEwydXgyS3laN1FHS2ZIWXVwTVNBM3hYVmg1clVz?=
 =?utf-8?B?V3U4L1IzWXNBYVJkQ0txWGMvNXZkSWQ1RDZDc3BidG1zK29TY0pSK0lTbWVt?=
 =?utf-8?B?eko5bFRXaEN5QkhGZTF6aHdOYnBOWDN1MHFlRjNmN3Z2YlBFYWtHclRSa2Jy?=
 =?utf-8?B?amVrRzZFWW9nZU0zbHhuRE04YW9MTmc1QU1MVFdOUVpXUlI5dGdOTmtTQWtT?=
 =?utf-8?B?VjkrMlAyWVNvQzZ5OHBjUDRyWWlvSHhpb08zbFJhR3d2Rk10cnlPOGxXSU9C?=
 =?utf-8?B?elpsWmRxNkRFSU5jZW9sRHdYL3pEcjNmeGZ0MWhVMm9OaVZld201b05IQzlM?=
 =?utf-8?B?enB6ZmIzb1VwREhZdmJvZldzMGpsMWx0dzhqdjFiWHZndktQWGh6LzFRU2NJ?=
 =?utf-8?B?UFFxNm92SUk2LzhVNFpYdEJFTEZUOGxjVTBXREFscVZWS1hva3ZKLzRONmZJ?=
 =?utf-8?B?RWRkNjU4WWxRRDdhcUFja3dTSng5am9mVTg5c0pVcERmeUhQUzJCbnY5NnRV?=
 =?utf-8?B?Z1RaTktTRFlBZVVCekNwaWhUT2oyNnpBUlZZUVMyOG5EMnBjL0VmdHdRcWhS?=
 =?utf-8?B?MTA2ajgyUkFFeTZ6U1huZTRReFBmcThjTFJHanh6QmtWV2JtMnUrVlZDcXRY?=
 =?utf-8?B?b0FQekp4d01JNUlqeE12ZUdaWEE5TURRWW5uQzZvN1JQM1ZpYzNqcldxY1h0?=
 =?utf-8?B?YnpLK051OFE1dVhiUGQrWVExYmhzVUYxUTlodUZzZzVMOUJqY1Q4aFp6R0Z3?=
 =?utf-8?B?Y2xGRWFVT0tpTG1WWjB2RS9wU2tyWkt6dTZqZ2NzTEsxZ2R5cDV3aTlHYkpp?=
 =?utf-8?B?dVJLQXlnekRoR04rRms2NktIQjdJS1pQOEZkYW9Rb0o0QUFiNDhCTzRqWUtv?=
 =?utf-8?B?ZnlJZUVPZ3lWT2lUQTJmNG9MS1hzaUl2NitZNkdnZ3Nrc3VsbmhLV1BTdU5j?=
 =?utf-8?B?MmYvWGRwVldzc0F6aFZ5RW4rVWlPRlJ2NkYwVzE1ei93d1dCUjRJdkxxTk55?=
 =?utf-8?B?UW9xK2JzeFExRUNoTC8xemk0Y0tjVktabWp1Q0h6UU4vcUdORnpQaHRIdUFp?=
 =?utf-8?B?QTM5cjMyY2crbk9NaG9LUENoSllvTE5kemVQVnZ5djhienplUGszd2hWT0FM?=
 =?utf-8?B?K3htSzBHdmZUcGtnb3NhbjFBcmVUelI0WFZNVXJHWjhIRGhFK1p6NEFVdFZB?=
 =?utf-8?B?U0ZJNkhKd1ZGMExUNVF4UlRyRlZmandZclg5MjNLK3liVGlyUWdYQmpxYTQ5?=
 =?utf-8?Q?H6KyAstDA0oJfuEqNz0ZGcfGM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e3598f-60de-49ff-1014-08ddbec377a6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 08:34:49.3727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRfUEkvLEN/D/BkWFnmDh+UkQZQKd1KQOEyQ2tq/5ht05SLBSnuenP1mrr8aWxv1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6593



On 02/07/2025 16:14, Hari Limaye wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> Implement the function early_fdt_map(), which is responsible for mapping
> the Device Tree Blob in the early stages of the boot process, for MPU
> systems.
> 
> We make use of the map_pages_to_xen() and destroy_xen_mappings() APIs.
> In particular the latter function is necessary in the case that the
> initial mapping of the fdt_header is insufficient to cover the entire
> DTB, as we must destroy and then remap the region due to the APIs no
> providing support for extending the size of an existing region.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from v1:
> - Add Ayan's R-b
> ---
>  xen/arch/arm/mpu/setup.c | 74 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 72 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
> index b4da77003f..ab00cb944b 100644
> --- a/xen/arch/arm/mpu/setup.c
> +++ b/xen/arch/arm/mpu/setup.c
> @@ -1,17 +1,87 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
> +#include <xen/bootfdt.h>
>  #include <xen/bug.h>
>  #include <xen/init.h>
> +#include <xen/libfdt/libfdt.h>
>  #include <xen/mm.h>
> +#include <xen/pfn.h>
>  #include <xen/types.h>
>  #include <asm/setup.h>
>  
> +static paddr_t __initdata mapped_fdt_paddr = INVALID_PADDR;
I think it would be better to name it mapped_fdt_base, given that in MPU
everything refers to base,limit.

> +static paddr_t __initdata mapped_fdt_limit = INVALID_PADDR;
> +
>  void __init setup_pagetables(void) {}
>  
>  void * __init early_fdt_map(paddr_t fdt_paddr)
>  {
> -    BUG_ON("unimplemented");
> -    return NULL;
> +    /* Map at least a page containing the DTB address, exclusive range */
> +    paddr_t base = round_pgdown(fdt_paddr);
> +    paddr_t limit = round_pgup(fdt_paddr + sizeof(struct fdt_header));
> +    unsigned int flags = PAGE_HYPERVISOR_RO;
> +    void *fdt_virt = (void *)fdt_paddr; /* virt == paddr for MPU */
> +    int rc;
> +    unsigned long nr_mfns;
> +
> +    /*
> +     * Check whether the physical FDT address is set and meets the minimum
> +     * alignment requirement. Since we are relying on MIN_FDT_ALIGN to be at
> +     * least 8 bytes so that we always access the magic and size fields
> +     * of the FDT header after mapping the first chunk, double check if
> +     * that is indeed the case.
> +     */
> +    BUILD_BUG_ON(MIN_FDT_ALIGN < 8);
> +    if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN )
> +        return NULL;
> +
> +    /* DTB starting at this address has already been mapped. */
When can this happen?

> +    if ( mapped_fdt_paddr == fdt_paddr )
> +        return fdt_virt;
> +
> +    /*
> +     * DTB starting at a different address has been mapped, so destroy this
> +     * before continuing.
> +     */
> +    if ( mapped_fdt_paddr != INVALID_PADDR )
> +    {
> +        rc = destroy_xen_mappings(round_pgdown(mapped_fdt_paddr),
> +                                  mapped_fdt_limit);
> +        if ( rc )
> +            panic("Unable to unmap existing device-tree.\n");
NIT: no need for a dot at the end. It only takes space and is really not needed.

> +    }
> +
> +    nr_mfns = (limit - base) >> PAGE_SHIFT;
> +
> +    rc = map_pages_to_xen(base, maddr_to_mfn(base), nr_mfns, flags);
> +    if ( rc )
> +        panic("Unable to map the device-tree.\n");
> +
> +    mapped_fdt_paddr = fdt_paddr;
> +    mapped_fdt_limit = limit;
> +
> +    if ( fdt_magic(fdt_virt) != FDT_MAGIC )
> +        return NULL;
> +
> +    limit = round_pgup(fdt_paddr + fdt_totalsize(fdt_virt));
You're missing a sanity check for MAX_FDT_SIZE

> +
> +    /* If the mapped range is not enough, map the rest of the DTB. */
> +    if ( limit > mapped_fdt_limit )
> +    {
> +        rc = destroy_xen_mappings(base, mapped_fdt_limit);
> +        if ( rc )
> +            panic("Unable to unmap the device-tree header.\n");
> +
> +        nr_mfns = (limit - base) >> PAGE_SHIFT;
> +
> +        rc = map_pages_to_xen(base, maddr_to_mfn(base), nr_mfns, flags);
> +        if ( rc )
> +            panic("Unable to map the device-tree.\n");
> +
> +        mapped_fdt_limit = limit;
> +    }
> +
> +    return fdt_virt;
>  }
>  
>  /*

~Michal


