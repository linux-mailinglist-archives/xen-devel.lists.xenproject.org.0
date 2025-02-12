Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E708FA3234F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 11:17:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886274.1295948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti9n4-0002MP-1q; Wed, 12 Feb 2025 10:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886274.1295948; Wed, 12 Feb 2025 10:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti9n3-0002Jb-Ut; Wed, 12 Feb 2025 10:16:21 +0000
Received: by outflank-mailman (input) for mailman id 886274;
 Wed, 12 Feb 2025 10:16:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UtzN=VD=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ti9n2-0002JV-Qk
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 10:16:21 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 620e2d89-e92a-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 11:16:11 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DB9PR03MB9664.eurprd03.prod.outlook.com (2603:10a6:10:45a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 12 Feb
 2025 10:16:08 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%7]) with mapi id 15.20.8445.011; Wed, 12 Feb 2025
 10:16:07 +0000
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
X-Inumbo-ID: 620e2d89-e92a-11ef-a075-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ysQ7IesBRpZqR0Ywm5HgfjJElE5d91pz9GH74x651MLu5dyaxdJmlZzpcnq3Rz1IpZTazC4Vy9gTjifOPBki8BcK6VFSdO7AkBe4L8q3TZyGCl/80EsGaowBfpAkS7s6e5uBoybA1Sx1HGsqgvMu6EdECS6GcBw9tPmWeakaUfE81Nd8bG6B9xnu/AXrtN2kCKgOwCViW+gaa95WdATnu5Qpcqg1OUpHUS+C3AKlQpGRH8AK+nRdZuDUg2U1XewL/N8FAMx4HOZjB5pUNHXN/mm+QLdu8JTXy+C9EGtPV6yPVXdjr7wbXsPWcy7+L46Ea2aXoA22LL0J1RlaahSAVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHy/JMCn/bf/bvBaFQ5KcynEv6NkeHeNrmVO5RhcjTw=;
 b=OG7cntWXkAkauLeYm1d2Gv6gWcOq4kZYU3b/UTAK1O5gDwTSt5Clt8AS2UWDQx1Ds/sP5V9UU2ZlM3lsuZL8rYebcC+iWp9QqAJb8fqyKwH9tOsR/8kVNexR+wCAegpEBjzU+sejbA46ea9a5UUFeYmqOR7QhlwiV+xiTHX2X0uvmCNifoYnpkoMw03qlOg9qWGkJXOGxuBd3exAnuAnKspLHvulIyyvo2zFiOtHwfXMGXrEpeC3YqL0EKRFxU/ZI86a8vc3SCJ11CNk3cWyTy4ZCCJpsDgp3nO1fE3+BqpW4t4/1pZ3ZmMAc7EEd2TepW9BC7t+2nIAbNOd61t4lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHy/JMCn/bf/bvBaFQ5KcynEv6NkeHeNrmVO5RhcjTw=;
 b=tY5gs7D0UQUCBIBkGU5J6PqCO+tJWxt5k29z4EOxqeUz4l73NXvAenDnUCQIYYmFoLvbqohjxFZRdmeeukNu2+l88l6kkNi6T71cpjHETNEgmCUS2toDsy/UmFsDszCoa1MCX/btu0gJZ4/6B105gi1vLtN3r1T8BckryhipkJ9IUaUr3y0YTHpDKbv1ZGZ2RpddPgClizfNkbR6jXBXhpBhvnfDvXUZdvaBac22BaOkJSvTVBjaBaifpc+TDeTubxk1RamCx/SUZqrD2Y9+5PasNGz6vbNrIy+/0/WjP2w9av0t/H1ITefdGP+GEj46Fmyerr7BS6w8rptwAPvoHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <d95e353c-7fdb-4331-ba7e-16e23b79182e@epam.com>
Date: Wed, 12 Feb 2025 12:16:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] device-tree: optimize dt_device_for_passthrough()
To: Julien Grall <julien@xen.org>, "Orzel, Michal" <michal.orzel@amd.com>,
 Grygorii Strashko <gragst.linux@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250211111853.2199764-1-grygorii_strashko@epam.com>
 <d5f00c3a-81a8-4221-acc2-de90fb92deee@amd.com>
 <e1c5fcb3-4647-483f-b600-deae9f68da78@xen.org>
 <dece6a9e-21c6-4f2e-ba53-337c5855f88d@epam.com>
 <0b4a9980-f49a-4eca-adf3-a896c0c7e1c1@xen.org>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <0b4a9980-f49a-4eca-adf3-a896c0c7e1c1@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0439.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::20) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DB9PR03MB9664:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d100bc3-e8c1-442e-e035-08dd4b4e43c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEVJa1d3c3hJTDUzb1lnZkZQSG5RdWlVUXJrYmM0a25kYi9JcEhrd2ZJeGUw?=
 =?utf-8?B?c0V2TDJ3S3FvM2MrUnhCZEQ5Z1dRN0NaYjVzVjY0OTZ1VlErUFpQRzZPMkgy?=
 =?utf-8?B?aDVaemdwZGRZQjl3QlE2UGdZSEJrVnNVOWVKSEgrcldOb3RGeTU5NG5QNkE4?=
 =?utf-8?B?cWpkb200RGM5VmdyYm8wQVRyVkczcVA0RUhuTFVsOXgvL08rdWNldm81MVI3?=
 =?utf-8?B?TmF0aDVCbmV0K1JQSWdSaXZUdlhLS0Q1QnJ6TGlxOUxwdDBWK2w2VWlHMG5S?=
 =?utf-8?B?anB3WlB1ZEVqbzY1OWhWQWh2TFVweHBOM1JhTktaSzhlZWY4clRKWTdQOEp2?=
 =?utf-8?B?VFRKR1BCYzVFS2hGKy95ODZGdjhqOVlGaFMvQ2FNS3hrS2RRRC8xVU9sUG1P?=
 =?utf-8?B?dEkrU2Vnc1J3cFdRZlN0K1BOTTErN1hldmJ3VU5FbXBoa0lJZXh4ZHZPeWRV?=
 =?utf-8?B?WFZJV1dDVWQzWmRKYTNpWGZpMGlNT2tTZTFSaHNzczl4U0pRbUNYQjh6OHhh?=
 =?utf-8?B?UmVnSU12TjFsTjRsRk9xbFR5NlFPcGpMK2Y4c2VPSjRUWnhhNlVkQ0FwcHI4?=
 =?utf-8?B?RkRxenpxWUxVMEFsSHBRS2NnVVNCd1lmRFNNd2xXemhmVVNmYm9uRit0TVhk?=
 =?utf-8?B?bTVaREtkcVFCMUxucSs5UTRqbWxqTHdZWFFtV0tkZEtjUHIvSm5aS2hidHNl?=
 =?utf-8?B?My9PM1hOS1V6WVJTcFg3eXVkcEg5dUVSdDZ2Z1ZIUU56ZUpkQVJmR2R4WWxB?=
 =?utf-8?B?MWIrU3pmTytzY1ZLanlNbXFzRFBiUEZhRlRsb093S2IwV3AzTE4yL3BtTW0y?=
 =?utf-8?B?dVdkKzh0VTIwWDVsWEhkRW9sc3Z3aUJ5SUNKUFN0R1VCdk0yQlZRbkZZbUMw?=
 =?utf-8?B?Y0hkM2lyLy9oM1U1S3RwS2ludG5QbXVTa0d3YVZDYzdtbXlyYU8rWFlLTkZK?=
 =?utf-8?B?K0NjT2w2cjJqcHVLUGdOWXZzYUc5YlJHMkM0V2lhLzhWRWlsQXhOZitzbHVN?=
 =?utf-8?B?bVpQN1pEMG1oRk1xSGErZC9MemtFei8wZmI4SnZISERIOFVmWG9YdGZVV0FE?=
 =?utf-8?B?cG5LMTRsTXpxaUdCbUY1V1hieDZLczVYaHRjQVZsSFdmSG1JMTJoYTljSzIy?=
 =?utf-8?B?UCtaUDI2anVZaE1oTkptS01Ca1NsTVRaSVUvTXl4VkNvNGlvSEpHWVRWNDJq?=
 =?utf-8?B?VTY4R2VPa0QrYVBPOWtxdmdraEZQd0xJYXVqSkhIRE9QL2dhM1o5QzhSeGNL?=
 =?utf-8?B?VDdGZGtQTit6bVl5dUVvTHVxWS83a21ib2JBWUZSMUlUNnFyUFkxU0E5SUR0?=
 =?utf-8?B?VTBsZVU3UUdXalhVck1vMlByU0I1d1RLY0ZNVnFyb1RhKzF2ckMvdTR1L0Fk?=
 =?utf-8?B?VFVpQWwyVllQU1JJZVpWalpvUmIwTEpNb1dSQmRoRCt6eU5namZIaW9zaWYx?=
 =?utf-8?B?UXFLbW5DbmlPd0dyMWc1ZkxlQlhFeGZoZzh2NlpIVGIrNVdtMzJLZkVSdk4w?=
 =?utf-8?B?VWNsU2tMMExsUWtMVktMNUdWNXhzRHhBbHpNZjhCWEhEaFh3enFIbDhpMWU2?=
 =?utf-8?B?ZFRQWmIxemZrSU50YTE4c2I0eUd3MkNjVDVybExTTnF2NmxKVjlSL2Z3aThE?=
 =?utf-8?B?NFN1V1NDbWU4US84MWRyN1RGVjJ4RXFKdlZFQmFIOUVzclhPSnZkWnlGaDNR?=
 =?utf-8?B?cG1rOTI3cU0yNlhUY0V1S1dDeGpjNm4rdFEyb08wb2FzSkhoY29MZFI4UWpX?=
 =?utf-8?B?VHpBR0ZBVitQT05UOUVXaUZjdlBhdjUrYnc1Rm1lUHFEbVJGRjFxMXZuMDRD?=
 =?utf-8?B?UytFS2I3Q2wzcis4U0FBanR5dldDQ3VNMi96ak5hOENWRzQ1UHVHTm5udmpm?=
 =?utf-8?Q?0SpYporJ6Slhc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em16TEd3byt0R2RVRjd6SmpGSFlTbFRDV2ltMmg1bWJ0UGdVeWhLRGRFdlNX?=
 =?utf-8?B?WUZHWWprNVJ6K01TUFU4dUd5YVRRSXZFRWxmV3hxWVFSRW1RVUlkNURqc3hw?=
 =?utf-8?B?UnJUd1NOVG9oM2YvbTVYVlUxeG8wTUsvQ1g5ZlB2RHgwYVE5c1lrTjdZM28w?=
 =?utf-8?B?SHZCUkl3dkwyTldCaVl4V2drRmxOK2hiTDhiV2FqdGZIZWhBMnoyeldya1Vn?=
 =?utf-8?B?RmJWNlA4R1J1SC8xaDEvTXFmcmNPdnNjZlJ2eHErdmUzWTNKTWx4ZzdtMmMx?=
 =?utf-8?B?Z1dDUU1FcE9GaUpmM2NRU2VYNk5NR1dCSC94UXRBaEJVR0kvVHRJbmZ2OWw4?=
 =?utf-8?B?dEQ3ZjRnTmZvUVJHblkvOTdvU0FuNlNFQzZDNVRWeTI4YXpLdDJtemxnb2Vr?=
 =?utf-8?B?bjM4RW42T3Ira3E4OWJrck1vRjdNcmtSYS9lWjlXR1NlUHBGNjd5ek5zT0gx?=
 =?utf-8?B?L2ZNZHovcXJEclJNM0Y2djBoNHJjZitYbmNPUFRRMzN6d25KcTg5UUtqRmJk?=
 =?utf-8?B?NW9YK2lNVURNYmR1K1FIQ0tuWjM0bndvQ25taDFtUjkvZFlNZW1qZDA5aTUx?=
 =?utf-8?B?cW9zcmtNeDZ5YmFHbXBERisxQXVXb0hXd3RQZjFxRmRsSE5HRDBVZksycFpr?=
 =?utf-8?B?NHdLZ2VYWXN0RmJEaDFJWXlVcVIvYzh5U3BZRmVEZ2dzb3E0WW42bm40RGxY?=
 =?utf-8?B?UEhHYno1aHNQUlgwUStSL0t6cURHaGhBS2xpcGVNdTJ2dHFHRStMZTk3bElW?=
 =?utf-8?B?NGZKQVM4dzNFU1JFTHU1YzJlT1ZOcjBWRElkOWZEWU5XMk9tQXJPMTRYT295?=
 =?utf-8?B?UFlDQTJsbDcwblV2R1BYSy8wdWowYzFENko3blFKb3lPLzBEYUM3NFMyaGNU?=
 =?utf-8?B?YUg1WUlJS0hYQjhWMUpzeTZpcU9OSmNCZTRQZ2o0cUV1MS9vU2hzaXdvQm9r?=
 =?utf-8?B?c0ZiUHdrUHFLMVZNTVRxNE1aNVZ3bjI1aWk1cTliVWxxODQ5MUhLT3U0b0RO?=
 =?utf-8?B?M1gyZG1rOFNKVjhQYTYzaGxTL1gvSWdUNlg1NmhpV20xWlJ5Ukh2bWQzRUVm?=
 =?utf-8?B?YkJlazBOVnFGTWp6dkdXZTdYa0FQVmxlL1FDOFkxNUdta2RVak00K1AvTFFJ?=
 =?utf-8?B?NXZvb2lKVmxRTjRmY3M4RUNKaTF3T29nZ0hqaVJVT3VVMURod1FsbE9zTWt2?=
 =?utf-8?B?SGtCZDZqcGlVa09XT3NNblhJY1dCb2xMT1FiUmdHSGMzQ0xFN2t2VE11ZjZK?=
 =?utf-8?B?RHFVUzZPSHlGdnRaWmNSVjBrSkJtcy9qc3VMYlY4V1RsbW9KVDFHT2ZTbWFM?=
 =?utf-8?B?Yk9CQVF0NzJLRlFLU1B2TGJ6UjNIVEhFMkFCSENOOHBNd0lWSTZNN3R6azNU?=
 =?utf-8?B?enJUNVFrc0dHQS9TbWdZOVdQWFJ0M1Bzeng2STNSQkR0ZjJKbXcxS0NhZVFH?=
 =?utf-8?B?ZjhXNDgvVTNJais4YkxWVytSZE9oaEIydkx6d281U0FmNFpLY0lsaHJXaGFo?=
 =?utf-8?B?YSsyK3lnb1RoNXk2K3lPY0hQcmJxbjZPT1lleGFnMWRBT0FUNWUrZnlVNTJD?=
 =?utf-8?B?V2hORlE1N01POGtYUEI5YmFZVVF1aWRCL0UyZndPUXhaN1E2YUYxejdtMlk1?=
 =?utf-8?B?cGdSQ1pHejQvb0xwaWtTSXVhNk5xbUtzdGNxalAwV0kyK2UxMGRycE1yMzBX?=
 =?utf-8?B?K3hMS3FRL0xqQnA2ejZiU3g3T2NrbC9SSDFRZUFTNVpEZ2I3VlN3WDZIZUJz?=
 =?utf-8?B?YzV6dFBNMmx5V1hsL0wwU2lTcHg2TlBnL2dnWTd3cDRIMG5vSkhBVmRpT1VX?=
 =?utf-8?B?d0tRQTltemdvOHdWNlBLK2hzZGpzNFFuMDF0bGtkbUYxNEo3RitvZkxacy81?=
 =?utf-8?B?dlNKa0laOFlyOG5vL3V6eUNKTzRnRTY3QUg4L1VONFRlck9kWWFzSUhaNTBP?=
 =?utf-8?B?YnRYUXg5K3c4VDlJeGNyK1NzOE1tQ0FMZC9WNmFIZGlJdUk4bFBjZGJHblEr?=
 =?utf-8?B?ZlRVNnpHeFRPVlVWbkhZdWx5dEFZMVIrc0MzMU1mc0Q2cnlKS0doNE5RdW1M?=
 =?utf-8?B?NjFQL2x6M3kzbFBYdDAyaGVnZFIzNFR4bld5SS9SdkZYYlQ4UDRnc1VtaUI3?=
 =?utf-8?B?UUh3T1FRTHhYVTdna3VsM25DNVd4QWxNTjRkSjYxK0lHMmx3VzZxTzh2L0dK?=
 =?utf-8?B?TkE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d100bc3-e8c1-442e-e035-08dd4b4e43c1
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 10:16:07.4162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Piis0cm9KgMy1qRXfMs2ipRK+yfn/kD3ShZ8FLTXBsZ2apEzT70/qC/R3y/ldKMgtFgwju3TlazBWD8dKpckpNfIHqUqwfiFgqTDF+Js91U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9664



On 12.02.25 11:04, Julien Grall wrote:
> Hi,
> 
> On 11/02/2025 15:14, Grygorii Strashko wrote:
>>
>>
>> On 11.02.25 14:32, Julien Grall wrote:
>>>
>>>
>>> On 11/02/2025 11:57, Orzel, Michal wrote:
>>>> On 11/02/2025 12:18, Grygorii Strashko wrote:
>>>>>
>>>>>
>>>>> The dt_device_for_passthrough() is called many times during Xen
>>>>> initialization and Dom0 creation. On every call it traverses struct
>>>>> dt_device_node properties list and compares compares properties name with
>>>> double "compares"
>>
>> 10x
>>
>>>>
>>>>> "xen,passthrough" which is runtime overhead. This can be optimized by
>>>> Are you sure? Looking at the calls, it's almost only used at boot except for dt
>>>> overlay.
>>>>
>>>>> marking dt_device_node as passthrough while unflattening DT.
>>>>>
>>>>> This patch introduced new struct dt_device_node property "is_passthrough"
>>>>> which is filled if "xen,passthrough" property is present while unflattening
>>>>> DT and dt_device_for_passthrough() just return it's value.
>>>> In the past we were skeptical about adding new fields to the dt_device_node
>>>> structure for use cases like this one. I would say this optimization is not
>>>> worth it. Also, why would you optimize dt_device_for_passthrough but not
>>>> e.g. dt_device_is_available.
>>>
>>> So we are trading speed with memory usage. It looks like we may be using a padding, although I didn't check whether the existing structure could be packed...
>>
>> Actually I see it consumes nothing due to alignments:
>> - before sizeof(dt_device_node)=144
>> - after sizeof(dt_device_node)=144
>>
>> But it could be made bool is_passthrough:1; together with other bools, and probably moved at the end of struct dt_device_node.
>>
>> By the way, below diff can save 8 bytes on arm64 per struct dt_device_node.
>>
>>>
>>>>
>>>> You can check with other Arm maintainers.
>>>
>>> Before forging an opinion, I'd like to see some numbers showing the performance improvement. Also, is this impacting only boot?
>>
>> Sry, indeed only boot, need to be more specific.
>>
>> My DT: ~700 nodes
>> Number of calls till the end of create_dom0():
>> (XEN) =============== dt_device_for_passthrough=2684 dt_device_is_available=1429.
>>
>> I've enabled console_timestamps=boot and did 5 boots and calculated average - it gives ~20 microseconds improvement.
> 
> This doesn't seem to be worth it. But I also don't know what's the normal boot time on your system... I guess we are still in seconds?

Yes. in general if exclude SILO timeout.

(XEN) [    0.433789] ***************************************************
(XEN) [    0.434588] WARNING: SILO mode is not enabled.
(XEN) [    0.435204] It has implications on the security of the system,
(XEN) [    0.435992] unless the communications have been forbidden between
(XEN) [    0.436813] untrusted domains.
(XEN) [    0.437256] ***************************************************
(XEN) [    0.438055] 3... 2... 1...
(XEN) [    3.438566] *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) [    3.439559] Freed 400kB init memory.


> 
>>> Also, I agree with Michal, if this is a concern for dt_device_device_for_passthrough(). Then it would be a concern for a few others calls using dt_find_property(). Are you going to modify all of them?
>>
>> I follow the rule one patch one functional change. Regarding further optimization - I think only generic properties can be optimized and personally I see now only "xen,passthrough" and may be "status".
>>
>> Ok. 20 microseconds. it's probably more like a measurement error margin.
>> Please advice if i should continue or drop?
> 
> See above. Regardless that, would you be able to provide a bit more information of your end goal?Are you intending to be able to boot Xen/dom0/dom0less guest in less than N milliseconds?
How far are you from that target? Are those numbers done on the latest Xen?

It's more like result of code studying from my side as Xen newbie.
I've considered it as kinda "obvious" change - calc some value once is better then do the same calculations many times.
Ok, it's not obvious. I'll drop it.

> 
> Asking because there are probably bigger place where optimization can be done first.

Thanks,
-grygorii

