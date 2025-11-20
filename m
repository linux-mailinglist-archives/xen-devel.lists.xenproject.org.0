Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA4BC74869
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 15:21:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167466.1493772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5Wm-0006GJ-Hy; Thu, 20 Nov 2025 14:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167466.1493772; Thu, 20 Nov 2025 14:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5Wm-0006E8-FB; Thu, 20 Nov 2025 14:20:52 +0000
Received: by outflank-mailman (input) for mailman id 1167466;
 Thu, 20 Nov 2025 14:20:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ChS/=54=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vM5Wk-0006E2-Ma
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 14:20:50 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c373d44-c61c-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 15:20:49 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV8PR03MB7517.namprd03.prod.outlook.com (2603:10b6:408:185::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 14:20:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 14:20:44 +0000
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
X-Inumbo-ID: 1c373d44-c61c-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AC+UB0WzNoaEaTjM6KnD0qzK+F+e2FVUlk63pVHRmXXh1cIGHXX8s2s5fxYx0TWxsWLAtWa5yEsfbwrNqfqJEKrNG+Tntkh67mgd+4CgHV/OIo2sfY/7ra0aQ5DwqLC9AhS93EiuYLbge7SWFCa3WnykVeIr9r27e7aPpjOhS9q/NvrH94CNxlFw9CrCQsAqaooEFZsYzVu2dSJmnKyZKF+6OmQWPrTNl7OpR0EG/DDngfFfg5YYlsEk3DRtKyFlmUXjk2zWUucKrsirsZ3oHsGihF4ZMMOykTk+H3hfxmb+hATM1+tXYTo0ka5fLYBnHWakbYTwXqABRWpoob74Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+qh2xslrHdg0M0wG/+ANjBRe8V5SUecuxtms024kKk=;
 b=ZJW8UudCRrpX0YhKx1GduCV8kXWWTiRU5N5nNgD8q+H12pPSoQOU5RPFITmRpiJPtkwB1MBFszUHEsYEzvzcNttfDLe4+0ck04ZjSTO3F2UiCP3a9+7YAsfCGi/h1zlQp0fryvvZFzQeKXRSTum4VAz8xr/NzOu05mrNnhvNLFTXMFid+jeVWQmAngvQs+imbei/QYepqRpv16tIMW63B+pSh2naoH68+ektxH4cX2iTOWz3mCRxqQ3vrEuuoYhaJmRIWhIgq3miXknR2Je0GASaJ/3hevberT5zcbVqfKo8piRBAKyvvMMVqx7vmMIj2Eg/I9HCJngQ4SFB+mU26Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+qh2xslrHdg0M0wG/+ANjBRe8V5SUecuxtms024kKk=;
 b=CTldnKklvDRpufjgPFVqvdOj2UROXb7LDrAGLCVC04ObhKdb/Fkmq6rJad4jwsvvVMGZpPjgDblkeuadRc11VuX2+SxoZ6QCpH3zYw1BhwYybnok+WYYKVkqlIrhS2aRN8VE+xBJIyERX7viavSIHfalL8je9Dg6h04KMVDMcAE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4fbffadf-f27a-48da-8c31-af7ce2243225@citrix.com>
Date: Thu, 20 Nov 2025 14:20:41 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Fix EFI buildid alignment
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20251119191235.863187-1-marmarek@invisiblethingslab.com>
 <ded843d3-465b-419a-9342-cb3a35a2d880@citrix.com> <aR5wA-9cdEO6gG3x@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aR5wA-9cdEO6gG3x@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0401.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV8PR03MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: e6a475bd-a337-444c-33e0-08de283ffe30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTNmQmtvOEE5STZjNUF3WGxRQ1hxWmpLMXljWE9vTlViT2I1MzR6SHF4cnRB?=
 =?utf-8?B?NytTNzV5N3VZWFJkV1JhMDhCeXZ1Rkc5end3dHg0Tm5Idk9pSVU5OEdJRlo2?=
 =?utf-8?B?VlhaV1RaZFM0dmRPVDMvN2VhTzFaaDVIOTRsZEdnZWx4VUp2V1JaQkg3MlJh?=
 =?utf-8?B?cmd5bEJxbW1YRStrVzhwa2JHS3dyRDAzQTNTdTgzQmtXN1ZHQjk1N3JBUlAz?=
 =?utf-8?B?aVdHRnc1YVM4RnBMU0FHcUVIVUV1bTRZM25FZ0Y1ZjBLelVpWERZeStFS0Na?=
 =?utf-8?B?Nno1UWFDalptRHN0bE5pb2ZlLzRzQzJOTGg1V1pJOEY4U3JoZGc1dUpVYmpT?=
 =?utf-8?B?aXZWY1VGRjBUTHNmVi9KLzViQWF3TTBnek9sVGwwQ1pVOVJzODNFZHJjOVp5?=
 =?utf-8?B?M2VWUldtbDNheG82bkVPMkhZYmF1cG9zWkF0NGZNOTFUME9JNXhUYVdydEox?=
 =?utf-8?B?dmJTT0hJRmpQbjRFK2E3Yy9MQkFMNk4zcEJ3MkhqOWRhK1JnUHhYUUc4R3p4?=
 =?utf-8?B?bUtkbDJXczZ4M2V5RDQ4aXdocGM1VG9ISXJQSElSMWlHemVzU2NGZk1ZOUpD?=
 =?utf-8?B?Qng1NlQrNUt3TlZuNmk2RkgwUWNBUW1MK0haZm5GRnNTK2ZOL25OZE4yUWEv?=
 =?utf-8?B?Qm9nVHVoSHJIZHNUUlNreUYzb05wUSt2TW9PVDdTNnFaYS9kS21lMnQ2TllQ?=
 =?utf-8?B?OVY5Z01IN1ZiL1diMWhFZjJ2ZzRhVEJLd1RjODI5RzNpM3BPU210a2VYdFNO?=
 =?utf-8?B?TlRJUVB2WXlEeVkyOWxPZTM2dUhMSXFibVltZFcvSkQyZitoQ1JjZjFSQkJz?=
 =?utf-8?B?bHVPd05tcUU3cStiSWRkMENpdnJDcVBrWUVSQzR4ZWZlOHJPMVVuUEVPMHZE?=
 =?utf-8?B?N1QwRmxZbjVJM0lvdGJHNC9ZUTJEQi9uUW1Rb3NPZkpmbVVhYlFBNG1iYlNq?=
 =?utf-8?B?dFNGYUN2eWNJYVFIaVcwdVlPWFBmK3NyK0YzVk9hMi9BTFBDNVZkdmxZbUdU?=
 =?utf-8?B?TERVV0hEdHZxYk9OWFV2T0J1dmpxR1E0eTBGRTR0bEZ4VWI4S3VCS0ZGb0Zq?=
 =?utf-8?B?UURNU3FTKzhxcWd0eERmdlVIbGZhWXNOb0l4a0ltTWJoWHR4ZTIzL3Vra3Bv?=
 =?utf-8?B?K1BoV3BFQmxwM2d1L3FKNUVLVzRyajhEaGVXRE5pcm05b1BlQmdSTFdocnBF?=
 =?utf-8?B?Wkp2NkVMbkQ3TVRpTWRWTmpMRXZTc29zbjZxWVNmRk0xUkZHTm5ha3hzYW4v?=
 =?utf-8?B?NG5xMGJMUktvT3VDeURjQTIyY1o4REpZTlAwYWRIRTBqNHhpRGttVUZabjQr?=
 =?utf-8?B?MXFybHVyamt6UFhUem5sa01JQ3dEWCtaWktJWmlkN2U4U2FKbTJsMzV4M3p1?=
 =?utf-8?B?TXc1T0xIZDN1c2tGcUU3ZkxTUmQ1VCtnc2xYQWtBTlJadlJaYSs0a0tWdXk1?=
 =?utf-8?B?S3VBZmoveGVKZk9uWTA1U2FkYlgyanlLTUdiaW1kYU9mZWpoR1VQOERNVmM3?=
 =?utf-8?B?bUdCeVgzb2NHN2UxT3FLd0lGWHBwcjlQL2RZbzN2OStHbHYybnQ3SFJianlp?=
 =?utf-8?B?SkQ5TlpzY08vUlJiMW5DRmpKL1hVRFQrRFp4QTMvYkREVGVBNVFROVc0cnJY?=
 =?utf-8?B?QVROYWRNbDN2RUF6MWY4TEg1S3d2UjdPSStCYjZyWGFIME81WE1uazE2Qk0v?=
 =?utf-8?B?SUJDSGpneU1OUHFZNGhOTTlCWExoMDdDQXh3VEtXMlZzT1lwUWNjWTVIOFc0?=
 =?utf-8?B?ekJwK0pHNzRWdXlvT29KbzZpWkdDOVZER01LNFVnbElCekNPYklCbmNWQUdS?=
 =?utf-8?B?N1hVcnhPMzNLRzVGaHJqR3BMWEdRVFdOV2F2dENMMUNkTHZKNFdUcURmZEVJ?=
 =?utf-8?B?ZHQxdHBobndkOHVzWmlBVmp2U3U2WGdxclBqemkrUTRoZGcwcUFVbWNCR1pi?=
 =?utf-8?Q?4zdPM4ssy56MetiI9XMy8WiG5oETvB0P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEF2bGl1cDRxREpDM3NUME9VeUNtTXQxZXpSbUZ1ZFVGVThGSzZCREZxekYw?=
 =?utf-8?B?RnAwZmRUWWpXZlFiVHY4K0tROWwwWGhPRlB5d2czcDZHVnhEbG5UR01tTEJv?=
 =?utf-8?B?T1ZPTk8wempFMTNWc21yb1U4R2Ezd1JlV21nQUpZSi8rUkkzZkkxY0liOGp0?=
 =?utf-8?B?anc3bHpYZU1FR1hBaDVIMjBBa2F3Mkx1dEFnL3p0djFxenNHTU5BdmliZ09M?=
 =?utf-8?B?Um04cktIV29mU0NWK29ReFFIakJqay9qVmwwaklQbHZvMHhjZ2hQUEVxT3lw?=
 =?utf-8?B?UDRCMVptNXV1Kzl0RG5vcHFDczhPSWJLcVRuUHdJS0w2dEtVTFNtU213eUgx?=
 =?utf-8?B?N1hHZlVUeWk2TmNLL3FsL2wzT3N1VlBnZytZQUVSTFlHMzFHMWZoVk5kVjJU?=
 =?utf-8?B?aU9idlkza01iNUErQjZKNyt5dkdMQ1NveGE1MDc4anBNZmYraWVzWFMwbkR3?=
 =?utf-8?B?SytaQlZ3NlMwa2g0KzVMQTdaditVWFJ4aXU2YUYwenEwUWd6ZVVvVFYvWW1h?=
 =?utf-8?B?YjdRaWdOSlZHeHZHV08xRWc5WFdQY3kyaTYrZk9hY1k3KzIyMHN2ZWd5K243?=
 =?utf-8?B?Zk1EYUdGUHY1Y1BvMk5ZQ1hMekNHT0VwL1JWTkNndzZyU0Q1Tks4S2FLVGJj?=
 =?utf-8?B?LzZRWDRIcHBpNDdYUjc3WUYvUG8zVThsRFUyTlFUZGtYR3IrVndtUlRpaHpt?=
 =?utf-8?B?U1dEV2VhTTQwa1M3WGdMT0FjanhOR2w2U2RINEVvRHRGZlptdWJiZWV0K1dL?=
 =?utf-8?B?SkhOUmtGV0x4dUhoWG1TQUJmVVNOSmVTVjBrRVlqSmNJVE1kSG0zTGZNVU8r?=
 =?utf-8?B?WEd3K3ZqM05lNTBtTENJYUdVVXhONDZoNno0TDFVb1QzMXdiL3JPeFBadCtr?=
 =?utf-8?B?RXN4REdtK1U3VEVuRk1jaU1nZHR0NVFEbXJFRXAxeExLb3lRNGtKZmtRYzVE?=
 =?utf-8?B?SldSVDIwRm9RejhKNTFxVk9BZXNzSG1XSlBzcHF4TlRzcG5HTnFBN2pYSWdn?=
 =?utf-8?B?Q2w0SzI5V3MvMEVUN3VXTmNFdmdiSU5TcGsxSHNhR25haEpBbGpua2dvSTZM?=
 =?utf-8?B?ME1kWE1DNzFUQnBvejR5dFJjWDVtUEc5WllDNC9CYitGalVFOU10TTB4a0J5?=
 =?utf-8?B?aW1yNkx0b0lCTlZ0ZmtHc2UvYVcvSk1nL1lna1hPM0pHeUxPNHB5NU5lTGcy?=
 =?utf-8?B?dHR0Q1NVSE5ZdGhiMDRRcVdFeG9QUEw4bHRSRmthNDdvUEwxRDRKUzhZL2du?=
 =?utf-8?B?VWl5MGJIMXBSYUFMTi9VS1ovR0liRmpGeGRTU3pxb1hTdDJYOEVNcmx4ejdC?=
 =?utf-8?B?TFJhNHVsY3h5Z3hoa0NtdDBEVzhCY1JiY29lWCsyV3M3cjZzSk5mUWI3NG1M?=
 =?utf-8?B?RG0wMEkrUFAwV3ArdkN4d3R0MWNGV095ejFiZjNUZmdPdk56Uk9MYlpzUVZ0?=
 =?utf-8?B?cjdHZ1pZYWRMRVB4Tm9wZjJ6QXB6R2RJbnE1bmlHNVFGS2FwZHZYbzB1NVpy?=
 =?utf-8?B?QVU4eEQ2NVJZT1VDcTMyQlZXaGd2L1IybVV2QmY3c25mVFNSK2xRbjFjcTZi?=
 =?utf-8?B?bDE3NHVSWEVUN2RmRFg4U1MzZTRrRzlnSjV5VlhkSWNOQndLNHU5T2hMaDlh?=
 =?utf-8?B?VEJVSnkyK3QyM3NsSFdCay9LY2RDVTUyNFRiajNsMnNTOUZ3KzgxSFZMRkNk?=
 =?utf-8?B?RmpxMlB4ZEpLemJCTHBKUFNUeWtQb3dtVmdiUFhSZWhtWHlncStPbFQ1WXNy?=
 =?utf-8?B?S2hKVkhzTHJHNThpSlFMemZNQ2VXcnRYZ3dWNVNYejhsMkh5RytqelZQTnRa?=
 =?utf-8?B?VlpmTFlMc2ZZUmNMbGFPOGtnRVVxM1RRdUNuZzFIZ0FUSXk3amQ5Uk5YOWJT?=
 =?utf-8?B?ZVd4OEQwSnVMcU1CVndzWGw1WUVlZGFLQ1JnaXA2a2RZd1oyMUozN25XYTRo?=
 =?utf-8?B?aGtBWStNQW9NQS9wdXNwT3dWWEFMWGMwZ05SWTVURFdrM09TRWxCVHY5aXhV?=
 =?utf-8?B?QmVDdm1iRnJWL0VIMm5vaVZ1dXd0aEV4UHQ0aXlENlFIVkpFWXFQa2JPd2ll?=
 =?utf-8?B?ejRpZ3NNRmZrL2RpT2Q3RHk2NGVUK3JSK2lXWU9lRldaLzdqUExDTFdBRWdB?=
 =?utf-8?B?dGdxelZjRERhQnhyVjg1bDc2YWttNW9IeTQrS3hsMGdlQ0dCYzZva3k0bUFt?=
 =?utf-8?B?bEE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a475bd-a337-444c-33e0-08de283ffe30
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 14:20:44.7476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5mQGrfsRTGK5NCYRnUoBUI6WdGpmhV1xyMxuOjig85tmKhE+0TqSCIwRVCrlJRTbpNEqUijdsLjSVNoKtztL4O9ZEWYSvswUTqgGiqUuyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7517

On 20/11/2025 1:33 am, Marek Marczykowski-Górecki wrote:
> On Thu, Nov 20, 2025 at 12:43:57AM +0000, Andrew Cooper wrote:
>> On 19/11/2025 7:12 pm, Marek Marczykowski-Górecki wrote:
>>> Old binutils get confused about .buildid overlapping (in VA space) with
>>> earlier section. That confusion results in weird errors down the road,
>>> like this one:
>>>
>>>     objcopy: xen.efi: Data Directory size (1c) exceeds space left in section (8)
>>>
>>> While the bug is fixed in later binutils version, force alignment of the
>>> buildid to avoid overlapping and make it work with older versions too.
>>> This can be reverted once toolchain base is raised at or above binutils
>>> 2.36.
>>>
>>> Details at:
>>> https://lore.kernel.org/all/3TMd7J2u5gCA8ouIG_Xfcw7s5JKMG06XsDIesEB3Fi9htUJ43Lfl057wXohlpCHcszqoCmicpIlneEDO26ZqT8QfC2Y39VxBuqD3nS1j5Q4=@trmm.net/
>>>
>>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>> Fixes: eee5909e9d1e ("x86/EFI: use less crude a way of generating the build ID")
>> We typically put these tags in the other order.  I can fix on commit.
>>
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...
>>
>>> ---
>>> While the actual bug apparently is in binutils, the commit mentioned in
>>> Fixes: tag introduced part that triggers that bug.
>>> ---
>>>  xen/arch/x86/xen.lds.S | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
>>> index 5d02f83a409c..967f9167f757 100644
>>> --- a/xen/arch/x86/xen.lds.S
>>> +++ b/xen/arch/x86/xen.lds.S
>>> @@ -171,6 +171,8 @@ SECTIONS
>>>         __note_gnu_build_id_end = .;
>>>    } PHDR(note) PHDR(text)
>>>  #elif defined(BUILD_ID_EFI)
>>> +  /* Workaround bug in binutils < 2.38 */
>> ... this says 2.38, but the commit message says 2.36.  Which one is it?
> 2.36

Thanks.  I'll adjust on commit.

~Andrew

