Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F76947B31
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 14:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772118.1182558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sax5V-0008B2-HN; Mon, 05 Aug 2024 12:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772118.1182558; Mon, 05 Aug 2024 12:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sax5V-00089X-EY; Mon, 05 Aug 2024 12:45:21 +0000
Received: by outflank-mailman (input) for mailman id 772118;
 Mon, 05 Aug 2024 12:45:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3WU3=PE=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sax5U-00089R-A4
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 12:45:20 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2414::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f6d927c-5328-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 14:45:15 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DS0PR12MB7851.namprd12.prod.outlook.com (2603:10b6:8:14a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.30; Mon, 5 Aug
 2024 12:45:10 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7828.024; Mon, 5 Aug 2024
 12:45:10 +0000
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
X-Inumbo-ID: 8f6d927c-5328-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgkTyHWGu6jdU+OM7WDLF280TfVFdQo4ccJWGtaCje3ygQ4SCSs7D1bpGluMwnlThWUlRpjSdAVYnAZEa0dK0mRGTpkY6tnaGRGdy2zCJbDcyBz64KxuHgNZQJgP2Ll6l8m5tg+AhNvbvWcMU3u/t053BKX/UsC3Skl//TxPL3C+5+OMIHbmX7B0pyHO/q6p86RftXN7d47RVEj8AT1VCT570qVJqK9ideiuLEXKXIFZQ+D+MKVMvBWAKBK6V6aCzPdasA223GDYTbCWg1DFe1ZbVkQGCpS+PWFHHa/zeP700UrwyDucRvxCx4rVff1mmXlcNvdPP9fM4ZT6u9A53w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuYDlS++PiAA9vBQY2VEjNxlGypGJ0ia/jBjJGwwp/Q=;
 b=RV/jGDqYBd8YlRz64j6+rdezHqKUPNh0PZdwDycT3NpwmGNxDlQbwDG2rirXupF751IDJ3fVO/KTxUOGR1/4xUVKgg6k6PsSJH/RL8yseR0yobqvpOhfk9/DcuC41NmZJgXc5fpJDyvSVCBqrWz5ptbnJW8fXpIFUFlMhhgXe9Z2KTv0rDeTjO4ChB5D1iN+UAIdtAnhw8808RnT/e+3oEcX0RzbAa/vQB1hvoCftuggqi847vf2ckt8t5GQAmYrMiJRLohmQC6MakBwQy8EFwEAycs60XCE2kU4uMTYWxAKwLFgeR/RtUjLl5uYIfDTamdWRTPW9IlcFbDxIWr11Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuYDlS++PiAA9vBQY2VEjNxlGypGJ0ia/jBjJGwwp/Q=;
 b=gfOV79GHPZuFZucQXv49ycmdmvLpXQIGsKiS36s+62plWJB/W7t97/RkZVg6XCyjXbqhri3gaXa2D928WHeT24j7MO8i/Pxk+LoS3gnXwpD3sVemK/Hm08Uix6jNtS15IZi9jyNSHP3rdflPR+1mhmGT1k8mtWPu65LbPYC2sNI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <bb77afd1-3fed-47ab-b83b-ec3e06d0c5a1@amd.com>
Date: Mon, 5 Aug 2024 13:45:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] docs: Introduce Fusa Requirement and define
 maintainers
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, artem_mygaiev@epam.com, julien@xen.org
Cc: xen-devel@lists.xenproject.org
References: <20240802094614.1114227-1-ayan.kumar.halder@amd.com>
 <20240802094614.1114227-2-ayan.kumar.halder@amd.com>
 <15c5709f-a81c-4ca4-8851-89938a5a6141@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <15c5709f-a81c-4ca4-8851-89938a5a6141@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0079.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::12) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DS0PR12MB7851:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a0d452d-ac70-475e-0ac3-08dcb54c711b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVFyRERQR200RTJxcUQ5NjIxT09GM1RsZXhycWJWNTlXSVNiNko5VlFNeHV3?=
 =?utf-8?B?ZGRIcm9GUC9DdjdadC83eEVzOStiT2R1eFdhc3lwUUNJUG94NzRSY3dhdVlH?=
 =?utf-8?B?TVk1VytRNnUwbUtLZndaTE9mOVVUeFAyYkc5SG95WlhtUVFaSVMwT3diblZZ?=
 =?utf-8?B?Z3RlR0dxczRrVWh5MHRBek1LVW9jVDVJZURlTlJ5RmtsMHA2K08wREV5UUl0?=
 =?utf-8?B?Z3N4SWNpT0JtOG5LRlc2WWxwaGdxRzFZanA1dXdDVjc1anc2SlE3VmkxQmkx?=
 =?utf-8?B?Q2tmRklUNFhRbTJmSXZ0LzdrOUE5VHJXcXdFa1Q5OVlMSXlqWTZTU1JYNzBp?=
 =?utf-8?B?alZMTzRIMFRpZ092blFtSGRvS3l1OVljeWxtVUpvazdObTlKcTRUQksyYU1Q?=
 =?utf-8?B?Z3BTTUE1QWIzNnJmN3ZPTUIrNzROTEJhYkgrREJNdjF2NXhvUWhEdkhybi9T?=
 =?utf-8?B?YklETTRrd2E4TVhMdndhUXB3SDVPSjBtb2pxbXYwOUlwTW9LQkZLZkpRU3FK?=
 =?utf-8?B?YVh3OVlIeVNUaWtnVGxSY3I5dU5YcjVONW5sd0d3c09JNXBObkYrN1E1cEZj?=
 =?utf-8?B?anQxcHlFdkRqS3NrLzA3SlpJUWJydHdxazRsME8rclg3Z0hPc3c2NHV0OWI1?=
 =?utf-8?B?ZUYyL1I2c2xNeWlib1VycDJKZU1SdDFTOGhBN1E3ck9PV0lNUXFMM0JTaVRi?=
 =?utf-8?B?QmY0NFpjNDhXcFBDZFBhMFpLSjVCVUk5djBwL25uQmVqWWZmQXRBNTE2Z0FY?=
 =?utf-8?B?bE5qc0pYd1k5OElHdGp5OC9naU5QVWVkS2xaN0cvMWV2UVVDckdEckFRS2dq?=
 =?utf-8?B?YXcwQkM4MFEyMTkvSmtHZnpOamN3dWpSQm12d0Z1Q0JYYXp5am84MHpmRGov?=
 =?utf-8?B?ODc0ZkVGYTNuNkREOERvSTBhRXVsVW9WSm5ZQ3ppd3lYM1E1YzhZTTBrUFow?=
 =?utf-8?B?d0JEZUQvNUFLKy9haXVacklLbWdNTis4Wk9nbjRVUGtXNGcxQjN2dWp3Uk5J?=
 =?utf-8?B?TmszdUxEaEVGZUpRN2cvMHNTbXV5ZDNOdFRua2laN0hnMHl0V2IzTm53eEJP?=
 =?utf-8?B?L3BjeTNaSjQ2ZGNDRk5FMGtxNUNNYUJ4M21PaW1xSzE0UHFhK3B2SE05MW1Y?=
 =?utf-8?B?RytFOU1ZSnoyelhNKzI4Z2dQekRLQ0VCYU9yM2U3QXVQeUNROCtPaldxcEdY?=
 =?utf-8?B?Y0xkS0xwVTlKSHIvUTVJUTFMaytIUEgzSGJJeENzNk1Ob0dpeW5OMnUySVdD?=
 =?utf-8?B?cmJCSno4NUp5YzB4b25KejRxbHZSRHprZW9vTnZxSWdUcXBKdEgwNStHTEkw?=
 =?utf-8?B?K3VMY2E0Y0JNM3dhcW9ZSDRENDB2V3M1Qk9SS0s0aTJ6eWl6Q0FxUmJDNXNN?=
 =?utf-8?B?Q1lYOEJvd1BJWk82VG5GRHVQNTNmK2g2L3R4T28wL1p3TGdaY2lLVTRuOW9x?=
 =?utf-8?B?ZkVLdSsrSTBvMGFXdzlkL2wrLzA4Z1NKNHptWW50YjU0WXJic25iNmlrbEUw?=
 =?utf-8?B?bXJXQ2pxbnVwNjkwR0ZVaG83R0R5UkpCa3pCaklQblJpRzdzb2ZVTC8rbXVu?=
 =?utf-8?B?M0ZHSlRFR0JDUlFadksrMVVQMTExbFlQelZkb0wwTkpsRlRuNXhHSDc1eEM1?=
 =?utf-8?B?ckplZnllRFBwNlVWaGZ3TSt3MmNPNEx0NXhCZ2dCUU13MS93Zy9WL1c5Sk9o?=
 =?utf-8?B?SDdqNVBUeTdIWFR5YWhRMTRmcUJWQm00eDNVTUFRZW9ZbzdPelNNTUk5c2JV?=
 =?utf-8?B?MThPQXJFalE2d0xabG9IRzRBbExXZCtSUmpZUk5mMFYxZG1WWG41VjhDeGI3?=
 =?utf-8?B?a3RRUS9ndjFxZGt1K2lxZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTdzR1VaMFZlTGxLay9LVDBRakY3aUlZSDlyZjlPeFd2bTd5U2lGYkhNV0Vt?=
 =?utf-8?B?VU01UTUzWDQ1TFpsM0F3MXBFdFJ1TjVtSUxQS2RlM3FFN2FUakk4R3k2dkcx?=
 =?utf-8?B?bnQrZElZTTVsbGFOSWpEUFo4RjhsZ2JiVWdHYlRiMkUydjJjM0FZMzBydEhE?=
 =?utf-8?B?clNRcmRaNlA2d2hOU2hmaksyM01od3hCM1Q1Q3dXK1dUTzNTdi9SOXJOL1BZ?=
 =?utf-8?B?ZjJmT0tmNFBiSXNHUmRLNUVWWllKemtCWHFublpVSDltMlYxSCszZ1ZQUHUr?=
 =?utf-8?B?cFpmNVZUMFBpYkpqdC9EU0tLNnE5cEJCS0VvdEFnSkdwZTc2MXRkQ09xdEk0?=
 =?utf-8?B?TXA4ancrbHhaM3BwZnZaZTV0eWhWd2ZHWTBqSFQvV3RxSjBRRnVzcG5JYmw4?=
 =?utf-8?B?NFdvRWxFVHcrY3ROdC9OU08vM0ROYkpUMTlpYVF5OUVNQ3Yxc0Fvd3YzL3py?=
 =?utf-8?B?QjN3WC9SWE1BcEFZWGl4T3BFM1lDQmRWQm84Q2piTnl4V1VnaVdjK3BmemFF?=
 =?utf-8?B?eTNvQVZyNWJIMW45RUk0ZkdGZVZrWGlrWXRIK29DZ0dXQUlaMHB2aVFHMnp6?=
 =?utf-8?B?ZjQ2ZjEzN2RzR2JSdlFyUlNNbHpXSGdlVlVieXc5YkNIQ0dpRXlWTVI3ZDF3?=
 =?utf-8?B?bVdINXdlSS9lbjM3VGI3Snl0MG1oVzdNdnoycW53OEgwSFdFMkRrQy9KVVpX?=
 =?utf-8?B?U1kwOUNjNjUxZDU5QVA1dkVVMXRDa2ExaWhqRXJWVGdBY0pic2NDT1YvNUtN?=
 =?utf-8?B?blE5dWpsK0JOUzVBamIxOHhDV1R0WGVJVllZNThrTTJUbnNLZkEreHhZMkFL?=
 =?utf-8?B?YWVLdTdReGMwNHJtOUZGRk8wVDZnRU1iWGJ1UW5BcWs5UkE5aW5NdjFLdG9R?=
 =?utf-8?B?eHh6ZGhPU3ljWjlmQmp6NHFvTThGMHVROXlUbGpJQVVwU01BRncyZ2VKNEdH?=
 =?utf-8?B?TXlFT2QydU9ZazhIRnZVMHhMWnRVRWVGTW5VNElnZzNPME9uc0VVTGwxZlJt?=
 =?utf-8?B?TCtPY2l4ZWc3NDRCYmRSbkFnK0ZoakNMWm9jY05CUXFaM1ZoSjJ5MTUxdjAx?=
 =?utf-8?B?QjdmaXBmNVlpZis1VE0zU2xHNFV5YitGaHorTEpHOU5PSVFnNEZUNjVQRTZC?=
 =?utf-8?B?eUlqV2QxU3U2UkhzQjJ6Y3VHMnNQZlE0eEI0WHhrRGd3clo5SDY0OFdmSkQy?=
 =?utf-8?B?TWxjT3VWckF4Sk1ZZzhpMWJzeVpraGZadlg2R1NCU0liMGlhZ1RVdDcwV1NG?=
 =?utf-8?B?U052eWhSMy95VTJOZzBYRXI2dlA1YnRwVjBwZHFZTVBJYUM3QkROMTlVaCt3?=
 =?utf-8?B?YUVyc2tlYUtwNFB5SzYreDFxOTdDbGVqbFZoM0RPRTdORk9QamM1NmZuWVNE?=
 =?utf-8?B?cUNVTGVUdTBicTh2anZqNGhKSXJuRlZqbjBnSnpkY2ZqU21pbDVqNVY2MFZs?=
 =?utf-8?B?UVV5RkFIZ1pVUlA2YlBDWmxvd2RjbStRTG9STWhlRFp2OGxXU1hQV0lUKzFP?=
 =?utf-8?B?M1RmUFlDWTZQd2hwUDNWQnRnVnNGdWdUbW9xM0cySU42Smp5c3pZN3M5Zzlt?=
 =?utf-8?B?eFl1KzlZT0RpTFF4SHhxQTRic0ZRWngwRXhxWkNlVEczVVM1V3R3RFdXL3kw?=
 =?utf-8?B?QkRzR2tlQlJsOEVVS3BuQmNIMjRJU0FXQVJpK0pXQWlWVFMydmZyS01TL1hV?=
 =?utf-8?B?OUMxeFZscVRZUlYrUS9hQzhTSGxSU2tHUHpPTzA3cFZZbXdYdmFZc0I3WXh6?=
 =?utf-8?B?d0JjYkxaR2UzNW9jSnJLY0M2V2NHTEIyWkVPTXhoNmRpL3kyVUlqUmgrUFc0?=
 =?utf-8?B?dmQ2WDhXVWswU3NnZHVzak9kcnZMSnIrTm5xUmdJZW93Z3Zsbjg1Y1BncFhx?=
 =?utf-8?B?VXFRTXNoRWV0L0FoR3YvQ2oxWFViamlsVENVWjhnZXhXV0JlM0xtajl6RG9K?=
 =?utf-8?B?RzBTU0dFdEVScEpnSHhpVHlxQjI3Z3BSanlhbk5yODdKYjkyWk91VFdpZlhN?=
 =?utf-8?B?YnRzM1lPWDVZdlU0dXNCY1pvUnc5cldOb0pFT1htUVBvc2R2U3Zqc3d3Mm5R?=
 =?utf-8?B?ZGxvU1F5ZzYwNXBvVkRCZmgwRDYwVkFFclpzNlFtV1Jla0RKdjZVNmZjeUxL?=
 =?utf-8?Q?w6t0JMiYY1x794D2ROhDxYcdo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0d452d-ac70-475e-0ac3-08dcb54c711b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 12:45:10.0627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gciqf6AAIYrxWrsAUjDuJ0fTnEOLsFEMwkSHSlKqrFV/3BRoP0log2PNZtVvxrqu1Y7HHMfvivnaAZl6gw4Mbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7851


On 05/08/2024 10:46, Michal Orzel wrote:
> Hi Ayan,
Hi Michal,
>
> On 02/08/2024 11:46, Ayan Kumar Halder wrote:
>> The FUSA folder is expected to contain requirements and other documents
>> to enable safety certification of Xen hypervisor.
>> Added a README to explain how the requirements are categorized, written
>> and their supported status.
>>
>> Added maintainers for the same.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Changes from :-
>>
>> v1 - 1. Added a comment from Stefano.
>> 2. Added Ack.
>>
>>   MAINTAINERS              |  9 +++++
>>   docs/fusa/reqs/README.md | 78 ++++++++++++++++++++++++++++++++++++++++
> I have 2 questions:
> 1) Most of our docs are written in RST, same will be true for requirements docs. Any specific reason for using markdown?
No specific reason as such. I am happy for this filename to be renamed 
on commit.
> 2) In the current form of this patch, docs/fusa won't be part of the generated Xen docs. Is this intended? Don't we want to
> include it?
docs/fusa will become a part of the generated Xen docs when the 
requirements (see patch 2) are added.
>
> Apart from that:
> Acked-by: Michal Orzel <michal.orzel@amd.com>
- Ayan
>
> ~Michal

