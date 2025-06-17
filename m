Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1FFADC94D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 13:27:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018165.1395088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRUTV-0001W5-C3; Tue, 17 Jun 2025 11:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018165.1395088; Tue, 17 Jun 2025 11:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRUTV-0001T9-8v; Tue, 17 Jun 2025 11:27:33 +0000
Received: by outflank-mailman (input) for mailman id 1018165;
 Tue, 17 Jun 2025 11:27:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQMZ=ZA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uRUTT-0001T3-Vb
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 11:27:31 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062e.outbound.protection.outlook.com
 [2a01:111:f403:200a::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d5cd550-4b6e-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 13:27:30 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DM4PR12MB6012.namprd12.prod.outlook.com (2603:10b6:8:6c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Tue, 17 Jun 2025 11:27:24 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 11:27:24 +0000
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
X-Inumbo-ID: 0d5cd550-4b6e-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJi/7x31xdbTiaOT4SSC+h/SLTMl7tt+J+zmiu6I+KI3KdLoL2khhRXeE8MiACs7ZcObtyHnx6fT+NmLO7TbY85YmlFvm+gZbGeu/LGhsrMh0S9EPYQnYl+d8JWCuOxvqvlfmToe9vO1qAYpJ7pHd/KIG7j4pVzQ1FthhM9WbB5D18bLBbP/eO+7pnwGLV77FIFnbo/BDHrNbpW9tMZ17BwZkOSv/LL24MAS2W9zd0uvE8qghfoRIfmJkYpMYUPgLLxO/O5NzDCcGEMBDBvAXZKkRSIG1HfETkVbO2WprzDuHbOz+sc6TFsrVCEVN682WsaY/TfXbsZB5kWiQmrLYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sK9BICF0G35sXATrXxrFQ6Qn6ZiR7c6VekeQ/UCU0I8=;
 b=wCMktTu+Pe3/JPii+woT1TGaWdN8/cw3IX0Ri4HpUicT0DeP8RKEdR4F0FjPRt2mlOSakHbTz5PoOxrYTDYrDnGZXdrxovky/U2l15p7obxUG2jHxrZYJrpUYNSt5D4hjZAXAu/p371e3kb6+D9ZNaOXu0ypB5j+Ncfc9P8gg3M5UhYd7sBbFw/hvHOFoO2RiAqzobGn/rOcWagCSEW7FMGbm4xbdHZYiIPyvSL61ZYGoTT5l5f+8hPThAD/AuVsTo+fH7Rgju673tR1B8NlPFI9wW2zy0oABEICW/LdEXC6NZhJft66FqlfgVOPBHPvaNH5rFpbo2/JYDeckS8Viw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sK9BICF0G35sXATrXxrFQ6Qn6ZiR7c6VekeQ/UCU0I8=;
 b=SEk09z+vUrjjXCoqoQj8MDdJYs0zXNSy4FLH1FKLc+euxjpBkFxvM6JvgaD0M9fxf//MBoXWdGJcH2TFK3Ernb+72tFdTHkWmYvM7F3hJwaXfV2NlD5n3r4jwa4MZ2Xy96/+cmH1U8AFyaQwu0fIO400qrLaQC0jTa+LS9si+bs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <37865b70-e69d-455e-9bcc-98e9924c24c2@amd.com>
Date: Tue, 17 Jun 2025 13:27:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] arm/mpu: Move the functions to arm64 specific
 files
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>, Hari Limaye <hari.limaye@arm.com>
References: <20250617111251.1711553-1-ayan.kumar.halder@amd.com>
 <20250617111251.1711553-2-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250617111251.1711553-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::11) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DM4PR12MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: 47d8bec6-542d-44ca-4fb5-08ddad91ee8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1NuMld5WHBHaEhJZzkvRGlGdklFc3Y5UjhjcTRiZFMyWXNGVE01Y3NLbm16?=
 =?utf-8?B?bzZRaWdLWndnMWg2bEpYbElZUlRwdEpDZm1VRkx4TDFzNTBUYmpZN2xZTjAz?=
 =?utf-8?B?eEdoUEZMaDZXcGJVWDE4K2xKc0tqQVpwekwrZyszRVBMMmw0N0s4aHlPYWNm?=
 =?utf-8?B?MGowNW0yN3gzdlFhME1ESHB1WVNXRGkvSXZTNFNoRnZTVWFrbVphNHA5WUJz?=
 =?utf-8?B?VUxhSkpYM1ZYU1g1amJuckhQeUtYR1NFOE91OGFxWHczczlIN3NrbWROL3dl?=
 =?utf-8?B?MytESXlvWTVSRzJORUNwSW9ka2JMRjdDTzZ3OFkrVEdOUkdNMkQxc213TFFU?=
 =?utf-8?B?dUZNTVhyQUhKMFZPK2ZNaWdQcDY2dEJSQ1p3blM5UDBnb2dtck9wdVJZd25W?=
 =?utf-8?B?T3JKSzZsdVI4MC9iakk4NEN4ajFsbno2NE9ET3EyRk9nbzc5c2p4Z005NlEr?=
 =?utf-8?B?R2diOVM4MlM0OWM0eVFqUlFiMWlsaVRVL1pZa3dFclNOU3ROZ2c5NUJkL21H?=
 =?utf-8?B?QlF0bnVBVitOMUY1ejVxWUY1cUwwOVp6SE0rNmVCZVhQVnJGRTJrU3czUmtL?=
 =?utf-8?B?dTUvdlhOQnVSOUo1dkYvTzB4WUNRck5mTXAzT1JwN3FvK1lHaTFncTlvZDA0?=
 =?utf-8?B?L1NGRDhJQ3ZFdURQTDJIbHl2WDd5NkpGTWg1b1ZlYUhtem5CSkZYem9Pb3Nx?=
 =?utf-8?B?eEpVcWVLeUJ6VWNqS25iQU9FTXpNdUdtVElKb29NL2JDNXRjN3dmcXMrUEJ6?=
 =?utf-8?B?ZjFVdzkyNkY0dXh5VEo4Sm5Mdm4va0NRZHhNdmc2dmtiZDltWTRvdnFVaWda?=
 =?utf-8?B?cit5VzJHTGdyQmVmY3Y1cEdlLzdKa1I3SWtLVHRTNXlDUTJFd1pPOGY0M1BF?=
 =?utf-8?B?S29sbTFCQ3BYNHBOcVdLU1JPQUErUWx2Y3pJOFlKMlhjZnZIcDRaTTVabHpw?=
 =?utf-8?B?eEN0M2dZZjZwaDFINXJaOGtUSVBkTFNadnYyRENhMmo1eFo4ZkF3RzYwdm9C?=
 =?utf-8?B?dnlMUjRmTDd5UXdCVllnT29CcHNJblVZYnNRMTJIQW45R0k0QXZnQjJ1VDlM?=
 =?utf-8?B?eVlqbVpCQjNRdTBkZmxHWFZaWHV0Z0dWNTl1ejZPd1pIWGtwNW1sUEFoN2Nr?=
 =?utf-8?B?VFkwMWF2bk0zOFNsK2gwMDBRVWxNYUZUeXpyWDVGVWdrWkJEUDdOZFhWNkU1?=
 =?utf-8?B?dVRiMmc0M3Q4VmlvaW90MmFaTlBnaFo1OVRSTXJvM3F5V1o3NFgrRFJ1OWpF?=
 =?utf-8?B?SHU4WlpsYWNjQVV3KysvL0tyMkwxYUZ4WmlQdmc1dVR3WW04NkpmMnU5ZFRT?=
 =?utf-8?B?ckJMWmEzU2Q5K1dsUWFKenhYWllWZ2RBWWlWUU5vVkJ5cEVVcFM1RlRFdlB1?=
 =?utf-8?B?RDMvZ0ZhU1pGK1UyaGgvakxMRHlhUk91dGxORXRTVUJ1QzVvZkNPUHIwOERY?=
 =?utf-8?B?dVhEVFFQbG9GL3FVTHpObDRhSnkxY1ljb3Y3bmtXSXVjY1FGaFpoK3lUbFdO?=
 =?utf-8?B?RTRJdHovQ1BlR3JhUlJaaUhpbVd3S3hIa0dXbTB3YmczWmdySGh5bGJiZjhJ?=
 =?utf-8?B?czBXWFRkTG1XWFVSYkdHTGtrNFJLTUhGSTMwbEs5WnBHcjI0OUtta3FLWmZ0?=
 =?utf-8?B?YzQ0S1N1eVJRRG1PUXVtRGUvVEdFTEdXRTN0MmUyV3I2Q2FTYlZrYnk4NXpl?=
 =?utf-8?B?ZHNIa1ZycXpaTVB3bi8wc3NMeCs3NnpLS0VzL0Y0RjVNZ2IrUXB5RkdIa1BR?=
 =?utf-8?B?MzJaWHQwRDVqL2JrOW5ZdWpQVXVGY1ZvTnh6dkU3em54bzJKSW1ZRnZrS3hU?=
 =?utf-8?B?RVFWcVZITUNPSVk4WmxlaDJESW9MUVhGSFUrSEluRis1aU1rMzZiQk9odjli?=
 =?utf-8?B?S2ZiQWR1UFdBRUh1SXQzS25wKzhMNEFiYS95czZFdHB1aHlBOUp1T1lSVE9w?=
 =?utf-8?Q?p+pBltZH+qk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk9IMi84aytMVDBudWxOTnZaSDJqWnpONytSZGhmeVFRSWl5bkEweHlRa0tE?=
 =?utf-8?B?RVlQajNUWmYxWENCVkIxY0taOGJpb0xmdUhOZHdvR3ZudEVZc3RCQkh3Tmdz?=
 =?utf-8?B?OEUyc3Y4a3R5c3RyanNCdUxmalJGbGJzVk0zMHNRQ1cvQ2YrVnFHSlhEK2tX?=
 =?utf-8?B?ZHZRbjlTUjk1R3BDdk8zL1ArUUdNSUFCaVc0L0FQcDQxMVVsdzY0RnJDeE5B?=
 =?utf-8?B?cXgxUC9JcEp5NmRwVHNPeWtiKzRRaVlwTDFOTjdUQWNPQkdDelV5RmdvSnZP?=
 =?utf-8?B?QUhkREpXS1VJcjlsWVE1UnFOaVozL1ljWTNSMUIvekttYWpteWxGbHBUVjNn?=
 =?utf-8?B?NUVFR3FtNTR4RnM5Rkprbk9SM0cvaTNsZVkvMHJlWk1obFJzM0JpS081cmZh?=
 =?utf-8?B?eEdFSzhxR0xaNkdzUkpPRmNaTXFWV0MvV1ROSFAraEpMbEhta0FZcHY4YTZn?=
 =?utf-8?B?SXlnZmZZaWpuVmoxdFlmaEp2ODREM2RJdUZxanVBdithejNmaTFOWG1ZODY4?=
 =?utf-8?B?M2E4MUhXYnRPalQvM2RWcFZVcFREYU41cUR2bjVCelBNSno0a04vREwycUpH?=
 =?utf-8?B?RFllcEdOenAvdjR6bEVvWkxxVWw5NXgyb3dUaXNQTXpYempabWlvNlFQYkxZ?=
 =?utf-8?B?c3lQZUpFVlppeGlLcjQ2eHh2ZG5vV05weGE5bkhHc09ZMzlYT2JpRUZkWG56?=
 =?utf-8?B?M0I1ZUl1OFRpUlFpQjdpRWZyM2lJZThKMFNLQ25MUUdCSll1c0w1SDNwNmlB?=
 =?utf-8?B?OFVGOEg0UTI0OGcyVFpGdmJmZENMbVBIRGxLMyt6QTE5UmdzUmRyZG1Vcmtl?=
 =?utf-8?B?cllNeGx2MzN1UzB5anUyOFV1RUhvZm53RmRadTh6UzhnNnZ3dHV5UHRZanMw?=
 =?utf-8?B?dmJyRWZVak5YV2RHWWt6Q2J3TUIybWtEN1czb2tBc01OK1NndWE3RTFBd1Ni?=
 =?utf-8?B?dWcwT3hlUE9zb3A1dHQrZld0OHpiRkdWVkpxYWVUKzZnL2sxUzlyU2pDakJs?=
 =?utf-8?B?YnI5UTBVVGExb044K0hpanpzUUZmcmU5bG1QeU5zRTNGSnJpMkVZQ3F0RTBR?=
 =?utf-8?B?V1RUZHZ2VVhBWFFZMmU1VHZXdkk4SGYvNkx1ZGwyOWk0TEYzSmxpYlp6TEdC?=
 =?utf-8?B?UDJFc2xmcVZSbXd2dmhTU0RDT09LbnhKTkh2bzNjTmxraFdlSVc0bHc4RFll?=
 =?utf-8?B?bW0wa00vT2ozcTFTQlRJRE5hblY0Y3duL3czOWF4VEpBZVVZbnJyYnlhVzRr?=
 =?utf-8?B?L2tlazBjamtIakRKMnRUMnM3TDhZclVCMEZzdVU3VnZRbGk1N1JQRkozdk9n?=
 =?utf-8?B?elhNSW42ZXNpZjc1dWNraEovTVdnRkhaNTN0Qm01bDFYMFlkSTh0MXE0SEEy?=
 =?utf-8?B?VzduWlJDVDczemFxaXhEMElFQ1M5bk9aU2lscStiREs4RDc1VUdZbzNHMDgx?=
 =?utf-8?B?YzdWODBzYWNwVVFic2RmQ3FsWEg3clVwREZhTDhFL1d0aURkQ3BPazRwbXRa?=
 =?utf-8?B?ZUNYdmlUYzJKSE5XenpMMHJwbEJFVktGV283aTk1Yno2OTZRUmVoTk1oeEFz?=
 =?utf-8?B?ck43MmNTUVM3VDFrMzBSRC9qa1JmZTVMbnUwQ1p5NU1WaXZRT2Zzb0FyZ0Fi?=
 =?utf-8?B?elRiV2psanZXNFhZTVdRcmFBcCs5QW03L2VJOXRMSC9FWFJndk1peFpONVhm?=
 =?utf-8?B?RnNIMWFFMnhCdmlRQnV2TXpqZDBSZU4wNlFSSHZtUnJFcW5YTmxIdWw3OEZt?=
 =?utf-8?B?b2R4eWxGdkxjektQakJvaG1PZFFYUzlwZ1ZBTU1DNHFiMmExcEFaMnEvZ1Mr?=
 =?utf-8?B?NHZMYTRGUk5CenNESE10cUpQdUJYaWlUdzlkY3VreGJPT2FhK3gyUDRBSGFZ?=
 =?utf-8?B?NWdUK3JDVWpxTlBOdGRjUHhIeko3ZWRWcmp3WDEvS0J2NmwyQVlpa3d4cjVt?=
 =?utf-8?B?eC8rMVhGbUZ0TmNhMkdQWC80WXpjL0VnT3NrL09DdGhFNnU1QkUrY3ZKeUt2?=
 =?utf-8?B?eEpQV0FWSkxXZ1YvMTFZYzE5N2ZqVnN2V0JndHZnVThzaHhMcGp0MzVyRWt1?=
 =?utf-8?B?c0RNSzc0eHczN2c3a1g1YjFZRThLa3A0SHFJRytWUUpJNzBIWmJsNE1HdWZ5?=
 =?utf-8?Q?f6Z0O7801Tnp2o3+DGOZ/4P/q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d8bec6-542d-44ca-4fb5-08ddad91ee8a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 11:27:24.2275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PfFoa/N4za22eJ2UDVBqedyzT1NKDZufiKCOQhrscVvt6IXoCr7Tsmyq9nhTcnXP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6012



On 17/06/2025 13:12, Ayan Kumar Halder wrote:
> prepare_selector(), read_protection_region() and write_protection_region()
> differ significantly between arm32 and arm64. Thus, move these functions
> to their sub-arch specific folder.
> 
> Also the macro GENERATE_{WRITE/READ}_PR_REG_CASE are moved, in order to
> keep them in the same file of their usage and improve readability.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes from -
> 
> v2 - New patch introduced in v3.
> 
> v3 - 1. Add Luca's R-b.
> 
>  xen/arch/arm/mpu/Makefile       |   1 +
>  xen/arch/arm/mpu/arm64/Makefile |   1 +
>  xen/arch/arm/mpu/arm64/mm.c     | 130 ++++++++++++++++++++++++++++++++
>  xen/arch/arm/mpu/mm.c           | 117 ----------------------------
>  4 files changed, 132 insertions(+), 117 deletions(-)
>  create mode 100644 xen/arch/arm/mpu/arm64/Makefile
>  create mode 100644 xen/arch/arm/mpu/arm64/mm.c
> 
> diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
> index 808e3e2cb3..5ad15e93be 100644
> --- a/xen/arch/arm/mpu/Makefile
> +++ b/xen/arch/arm/mpu/Makefile
> @@ -1,4 +1,5 @@
>  obj-$(CONFIG_ARM_32) += domain-page.o
> +obj-$(CONFIG_ARM_64) += arm64/
I think this should be above domain-page given alphabetical sorting.

Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


