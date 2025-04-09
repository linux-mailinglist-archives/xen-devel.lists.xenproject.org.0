Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC84A821B4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 12:07:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943746.1342393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2SLF-0008Tj-E7; Wed, 09 Apr 2025 10:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943746.1342393; Wed, 09 Apr 2025 10:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2SLF-0008Qv-B7; Wed, 09 Apr 2025 10:07:33 +0000
Received: by outflank-mailman (input) for mailman id 943746;
 Wed, 09 Apr 2025 10:07:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IAcD=W3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u2SLD-0008Qm-P1
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 10:07:32 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2414::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 719dffee-152a-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 12:07:29 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SJ2PR12MB9113.namprd12.prod.outlook.com (2603:10b6:a03:560::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Wed, 9 Apr
 2025 10:07:25 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 10:07:25 +0000
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
X-Inumbo-ID: 719dffee-152a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAnEnEuKHBifvZpxk0oDIV1V42eIFTvSme3whSjWqGLRBqT2Cbf7PgqeaE2NSZRyyuLOFmAWjsJqxT1Skvbq7iWKIurr59+jW6zg/WpsrbDONJFFGrA5IMkM46xMxmkTxl5Id6KJjhFIfp7xRb2KmSpuz3jU2gyi2PoIwExcGaSskx6Tl0E8ShORwdvTOOSUo7tH3uQQrT3K+oAI+GjDe/y9+lWq3ranXSPusmZ2IjIIuPvWHSORf7DBNc4R6EwN0cWr2ah4kf8baQ3Whtg8xDHS733NI1SqadzIuMpBoI/LlSt7k42QXQr89rSStBD/EIvqBpspk7XMGbeDVyHrag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itsvSOHDa/JofITWNJrqo7QvmHh5ZCvOhzeTlBr5pbM=;
 b=g3uMLeU9eDNuIz2v4Fkk36xkZvcejU1/I+WzIzU6vV0ysZOrdKzkv55ybuiwTR/82AykDALkX4dnEGnCMffFJhKZSUSg1VlvKt/2Tgfn3aojPQFBrDUNPjMuZEFgTFJ9byzWOI+bKnYxGN6aRELs07xK6zvSEB0UHNg4hFeFt4yTNcIoNyiaxfkSTbf5PK8QJTUGjmLrhb6xHSgX0Jb1MEiN16HKT5dSalQyaf/dPNF7jCOERZ3ZantYqR67Yam6y9it3pjznWSXMLiA3PILKsILYFhmRkKJ/Rnc9xG0YXUjjqDWZCCr7MU1InAOCzNvaHsv084HeaKyhCcJwqfx1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itsvSOHDa/JofITWNJrqo7QvmHh5ZCvOhzeTlBr5pbM=;
 b=IdG3Ru9k7Uhr2ID7+zByuiMZFxrxVyjawZ8SlQ9aWcaAnv242Fcv/JTuwQMV6YxKefiXTdi8n3aKkOpMvRdO3h9/Hc264mBVh5I5mTaEAZHEjN0+Qk98Z1cyTIQAokKNcg1wk2+ukBr/Qd84+w9Hpqpllt9okhin5MZHL/h6mB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <aded1d6f-0e6f-4903-a5a3-127e06e3803f@amd.com>
Date: Wed, 9 Apr 2025 11:07:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] arm/mpu: Provide access to the MPU region from the
 C code
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250407091430.2342709-1-luca.fancellu@arm.com>
 <20250407091430.2342709-3-luca.fancellu@arm.com>
 <0acf63c0-267e-44c0-b629-fa576307497c@amd.com>
 <1AC85CBD-02B1-4AA4-B9A3-68DFC06137AA@arm.com>
 <4f860a56-5536-455b-9490-196bfc220556@amd.com>
 <40C7A4DC-0216-4981-A501-AFDA0E8671DD@arm.com>
 <9f637d98-c8f8-49e0-9f0a-002cdfefc296@amd.com>
 <EABA5C5E-4FE3-4E7A-8E29-B37A4CFCC18D@arm.com>
 <F2C6FC52-386A-4417-B592-151ECE079E52@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <F2C6FC52-386A-4417-B592-151ECE079E52@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0463.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::18) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SJ2PR12MB9113:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb84d9a-746b-477e-9027-08dd774e53bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHl5ajBBRU5jR0tLNk5BUDdPTkNIaUp4KzdicFE5YmplWHBpeUIyWUJTc3By?=
 =?utf-8?B?SXp2aGc1YUFmMTlJb3p6UGY1dHJHV1FPcnRYdDZPL0oxSzRsU0lCVFlsTnU2?=
 =?utf-8?B?d0lsd0h2WkVOTmdiSi9UZ09qdnVZTjZyRTdNOU9Dc0JZc1NXekx6eEpmSXBW?=
 =?utf-8?B?bXo3NkpDSnBSdk44UzFDVGZ2bC8xc3pia09lUUNKNXZ6a25XL0dia0hyNU8z?=
 =?utf-8?B?S3JPNHFJeEpiSS8zUmNSbjhUc0UxU3FWWFpTT3VBVmFzd28yTlZCN2w1cEFS?=
 =?utf-8?B?KzVnc2V4U1RhbVZucnIrZG1vWHpGM1ArZHhKZzk3TmRaUkdWc2xUS2w0dEpz?=
 =?utf-8?B?VVJiZHNkeElIOGgyNGFLNnQ2MGpOT3pvZE42eExoaFRWb2lzL2dXZGFMbUFl?=
 =?utf-8?B?YS9MQnIzZHhpZ21iYU5DaFFWRXFveVJUSHJpRSs3R21tcktYMXdFcGRtMmtC?=
 =?utf-8?B?ejRxaVlJcW9qTlh4Q29vbHpJSTZ3RTZ3QVBRbVd5bWNQMmFEcWxPZjlrOVlZ?=
 =?utf-8?B?WlZYNFQvc1AzWjJmWDJLdFU5U0FPTHpKR0dMOFVSMG1qOEkzMTJvT21kcjJW?=
 =?utf-8?B?N01sYjA3ajZIRVRKckdod3lWbmxhYWxKSXlVWHZLM0xJbnZvd3VHR1dmUm82?=
 =?utf-8?B?TWZnYUx5WHBmcUoyaHVIR3BmajZteGF2cE9qd1ZnVEZmMlBhSzQ2Smc3WHNt?=
 =?utf-8?B?Zm1ld2grR2V1RVRJRkNqUUg3REJnTm5nTEdEaHp6RFVsSGh0T3I5dldYOXJ6?=
 =?utf-8?B?YjFZYS9YOTdjZTVQdVB5Tjk4MkdUOC9NM0JQa25xWXlWZEJvMnRLMVJweWx2?=
 =?utf-8?B?SHBTdU5iVHBTR0M3WlprdUFRNVRNaVZBR3FwNU1wK0ZvK0ErTTB2N3I4N0Jo?=
 =?utf-8?B?RmpIa0xDZUpUWTV5NEVMT2FRR1A1MFl3RXM4V3JXaHlkeW0zWUQxZmIwdnlH?=
 =?utf-8?B?endpWldMRlI0aUJ1YVI0R1RtdHhxQ1pjTENQcWEyU3J4V0R6TWc3M3dDT1Qz?=
 =?utf-8?B?dWZnbENEejRkbzVOeHROdE5vZ3lHVVVFQVVNclA4aXBRaDNjNXRqUEJYc3Jv?=
 =?utf-8?B?NDhqck5iMWRjaFBOam4rN3NhSkVSR0VpYkZoR082R1RLbzhBY2hLU0Zwakgy?=
 =?utf-8?B?L1NvQlFLanc4NUlPM2RJb2FtTDdOWU5OS1lEbzVzWDVKNU1QQlkxcmV2Qktv?=
 =?utf-8?B?dERVRE5jcDJISTVLRDRWVGptcis0TXhGZURzT2FxNS9hMUFUMjhBUmY5YU9a?=
 =?utf-8?B?RGlBcDRHb2RoRDFCOCtYMlorSy9rWnpjcXFnaUhUdm9iK0FmZW9EaVNIaDRl?=
 =?utf-8?B?MlZzbTFFbXFHRS9WYUVtNGNjZ0w0NUdPWkV4Rlh4ZGh4cFN6TUhocGsrUFov?=
 =?utf-8?B?UnpzR3RhV0JjMGVtcVA1NWt0aWJaUE92UmhyN3pxUm8wRnVqNWZtemIyTjdl?=
 =?utf-8?B?b0tWUW9kSVNtRGVMbm93R0RNTG9iVmtPa25mWVprNDljV0JCZ2JELzFBbXIv?=
 =?utf-8?B?YVNDeHF6QUtXd29OYnFmc2wxdE5CTVhBU1Rzb3JFWTdPNW45bC9kOUZwSEF1?=
 =?utf-8?B?bnVtdGwvbTd3dHlqUURQSkZaNkhpdU1KTVd2Q2IwelFoMVpGNkltVXJ2ZTM2?=
 =?utf-8?B?Sll2WlFtc2tYenRhalJjWTVPelhZdHI4MU9iaWRVdFc5bGdjdHBhNjNjT2U5?=
 =?utf-8?B?REJKc1hwMElNa3I5MVFtOVZIN2xCZVI2NTRsVlFUZUtCL3Vvd0V5NVNvb2F0?=
 =?utf-8?B?SjQ2SXJabXJGdTkwTTlXY3pKMFR5Rlo1M09JdzRZU3pwVW4xV2c3Q3JvNXc1?=
 =?utf-8?B?Z290UWd1ZFdHSHc3aHdyMXRhcUFVSmRaSGtvNWgySjA4TzJxTGZPN1FINWxX?=
 =?utf-8?Q?ztNhEeX+7wOiG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUVwMHhlbUttaXRzSGJNTEtSRTlsZitlZFRrWUIzUnJiOU5sR2diV3lNcnhP?=
 =?utf-8?B?aEFJc2NNdkFoc0hoYUU4MlhFNkVHenExUnlkRHkxUHU2NU5hQldCYzF5S25E?=
 =?utf-8?B?cGRXYjlUbzdVWHVOYVhHVzY3MnYxb3B5cmtua1IzMllmazhWb0d3WlBHOUNL?=
 =?utf-8?B?UEh5UUJ5SjF6cXcvUDFOdnhjaWs2WTJFc0lrRklIUzhmeVEvR3RlcUdHbzJG?=
 =?utf-8?B?Wk5uL3BFdjVNZzFpWEEzRUN4bHA2WWZ4NmE2QlJ5SFJoNStodTJYdTN2SDN0?=
 =?utf-8?B?TGtNT0MrVXY2WTdHbXFTL1RnUE9Zb2VxR3krNWY1RHJUUUU2NEU0RFFDMjAv?=
 =?utf-8?B?Y3NxeUdWUDJteUQ0MUVRajZnVzR1dnYvTHB5K3hnejhrcm84S2xrcWw3clE1?=
 =?utf-8?B?bnZFSXVuSTZpSzNzZm5aQm8wakJTZG0rOHB4bktTa1FhUkpYWU9IaFVTS2x2?=
 =?utf-8?B?Q2VqTlJPRXE1US95TjJ5OFhVWFJCL085SmZZZVZaNGR6dzJPbzd5Y3ljTUpl?=
 =?utf-8?B?enExSktSSXpUcEd5OEUyc3llZE5qNHZBWXAwcWJWUkY3c1Mrekl6czNPMXFl?=
 =?utf-8?B?aTRoUkFrSjZvMmJKc1NzYnR3cUZTNUluL3daSnJocFNaK1FGUktWTjQ1aVlD?=
 =?utf-8?B?c09SS3JIVHpNNUFtZWxyWWNRZG5nUFMwdzU0ZVp3ZjdiNks5cFd4dzJRV0Jq?=
 =?utf-8?B?NEovc2dCa3hmd0orS0hkVTI0aEtrK0s3eGNmdVFDUVJvNUd6cTdGRTB5UUZD?=
 =?utf-8?B?N3dLQ3lNdUZVTXFpeStpckVFa3F5Qzh0aWV2eTc1amk2Y2tjeVVha2dFQ2FR?=
 =?utf-8?B?ZGE3RWE1UWVQUE1GQ056ZTRSdUErYXYyWU1obElHallNQWduT3MyQ1FDVEJw?=
 =?utf-8?B?M3VEUWZIbjJLYkh1ODlaR0I0S2VITGJmUVFRdk1OYzJJeTZnWDlRTDU4MUY0?=
 =?utf-8?B?c1Jzbmd1S2NjajVVMnp6amtNMGxMTWQrdmt2V2dxaEZoTGpLVmlYekVtd3FP?=
 =?utf-8?B?b1VhRmNyU0RKUFR0aGFDVVFEMXdUeEE0Zzl4OWRmTWxTcERyY245dmhMSldZ?=
 =?utf-8?B?THZ0MXRtMXhBU3YzTlE1QnpMdzQ3Q1Q3d05sRkNZN3Z2WVNZUlFxVko0NjJK?=
 =?utf-8?B?RUNDa0pHdXE1ZDNSSmVGTTVBUHlES2tXQ3NvNlBHd1YwY2xOdmN3VGZIWW55?=
 =?utf-8?B?ZzlORjZHSW1aVkJOV3RMNm8wMkFReWJaRzByY25aMS8rRWZPQ3d0YVAyWUtJ?=
 =?utf-8?B?T3RET256bVUwVEFRT0xnamdDSE1vR094VEdNQVRwY2d6dDJnWFhCc1dpb243?=
 =?utf-8?B?SWtlUGF0ZGFDV2NwTm1JRkRpdlFSOXdoVWo0YzRWYjlaQWMzc1EwV3J2NnZo?=
 =?utf-8?B?MDNvaGFNa0FrcDdLT0pPdUl4L01Ra3VPSjhXWS96WlBGRG9BN1pHa3FlMFNC?=
 =?utf-8?B?bnFsemhscHZxK3NXc3ErcGhXSjRYbkRHTmdHRktqb0tYUEtVVmhZUzJuY1dY?=
 =?utf-8?B?RmVYdDNyNHNmSWU4czA1QjJ3ZlJlTzc5VllqRkR3RGdHY1p6NE9pUWJUc3I2?=
 =?utf-8?B?dUFqdU9HRmVjajN0TTVsbDc0UFpuS0V0Smt3ZlpwYjB6Q0FielZieFZoVGFS?=
 =?utf-8?B?dnRoN1RDTVZvT0xzd0VCc3NwdmkrNmp1WVNrZXFoY05hZkNhUkVCamNKdlNF?=
 =?utf-8?B?SUphZGtvK1V6UmNqa01xbDRNSTZ3ZS8va1NpdkxJckxqSkhOT213Snl1c1VM?=
 =?utf-8?B?ZnZzRGxROEhjM0VONkcxQXUwYmpBR3VTNTdxSmtvMUhGYXFGQmh5aUF2QzVy?=
 =?utf-8?B?TjZiclVQVlVzeU1NbEppYUNhU3R4S0NBWXpCN3hMaXNpMEZDeis0TzFob0dG?=
 =?utf-8?B?NHpBWGc2c2ZUTGhBVUxhZUxwc3VEWlZtU3BuNHhGbWJPOEk4ZlpoN0xNTkhS?=
 =?utf-8?B?T2VSMEFsR1p0V2JWdHEvZVJqTVRDZ3RDeTlzQWtqT2tFTG1TTytkWHlad0dr?=
 =?utf-8?B?MmlNNC80UENIa0w2bnNzVEFVZkZINkFKWnhSWE9DbDc4R0RkUW9pZ3Z1MnQ0?=
 =?utf-8?B?NzNVVmFZTTZHZEhZWGVoQWFWcjAyRk1rWHBVVTFBeVczdmtzZEdwNjM4L3Fp?=
 =?utf-8?Q?KlZqFiCfeZO8jV6PaqdM1EE4p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb84d9a-746b-477e-9027-08dd774e53bb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 10:07:25.4800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X12ne5eGNjx7MWemsxJR+5Lj7GFHtIpeqdKG9407Z+EDEfpFhJyX+bx3aiwt+TMOU1Iw6tUc/r/LHYkF8G7r3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9113


On 09/04/2025 09:26, Luca Fancellu wrote:
> Hi Ayan,
Hi Luca,
>
>>>> The point of the code was to don’t issue an isb() every time we change the selector,
>>>> of course the code would be easier otherwise, but do we want to do that?
>>> Not sure if it is beneficial as you would need to use isb() from region16 onwards.
>> The isb() is issued only when changing the selector, so when you go from reading/writing regions
>> from 0-15 to 16-31 for example, of course there is a case that if you continuously write on region 15
>> and 16 you would have to always change the selector, but it’s the less impact we could have.
>>
>> armv8-R is even better since it’s able to address regions from 0 to 23 without flushing the pipeline,
>                   ^— aarch32 :)
Can you point me to the document where you got this info ?
>
>> so I would say we should exploit this big advantage.
>>
>> I’ll send shortly in this thread the code I would use and the code I was thinking you could use.
> Here the code I have in mind:
>
> static void prepare_selector(uint8_t *sel)
> {
>      uint8_t cur_sel = *sel;
>      /*
>       * {read,write}_protection_region works using the direct access to the 0..15
>       * regions, so in order to save the isb() overhead, change the PRSELR_EL2
>       * only when needed, so when the upper 4 bits of the selector will change.
>       */
>      cur_sel &= 0xF0U;
>      if ( READ_SYSREG(PRSELR_EL2) != cur_sel )
>      {
>          WRITE_SYSREG(cur_sel, PRSELR_EL2);
>          isb();
>      }
>      *sel = *sel & 0xFU;
> }
>
> void read_protection_region(pr_t *pr_read, uint8_t sel)
> {
>      /*
>       * Before accessing EL2 MPU region register PRBAR_EL2/PRLAR_EL2,
>       * make sure PRSELR_EL2 is set, as it determines which MPU region
>       * is selected.
>       */
>      prepare_selector(&sel);
>
>      switch ( sel )
>      {
>          GENERATE_READ_PR_REG_CASE(0, pr_read);
>          GENERATE_READ_PR_REG_CASE(1, pr_read);
>          GENERATE_READ_PR_REG_CASE(2, pr_read);
>          GENERATE_READ_PR_REG_CASE(3, pr_read);
>          GENERATE_READ_PR_REG_CASE(4, pr_read);
>          GENERATE_READ_PR_REG_CASE(5, pr_read);
>          GENERATE_READ_PR_REG_CASE(6, pr_read);
>          GENERATE_READ_PR_REG_CASE(7, pr_read);
>          GENERATE_READ_PR_REG_CASE(8, pr_read);
>          GENERATE_READ_PR_REG_CASE(9, pr_read);
>          GENERATE_READ_PR_REG_CASE(10, pr_read);
>          GENERATE_READ_PR_REG_CASE(11, pr_read);
>          GENERATE_READ_PR_REG_CASE(12, pr_read);
>          GENERATE_READ_PR_REG_CASE(13, pr_read);
>          GENERATE_READ_PR_REG_CASE(14, pr_read);
>          GENERATE_READ_PR_REG_CASE(15, pr_read);
>      default:
>          BUG(); /* Can't happen */
>      }
> }
>
> void write_protection_region(const pr_t *pr_write, uint8_t sel)
> {
>      /*
>       * Before accessing EL2 MPU region register PRBAR_EL2/PRLAR_EL2,
>       * make sure PRSELR_EL2 is set, as it determines which MPU region
>       * is selected.
>       */
>      prepare_selector(&sel);
>
>      switch ( sel )
>      {
>          GENERATE_WRITE_PR_REG_CASE(0, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(1, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(2, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(3, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(4, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(5, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(6, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(7, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(8, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(9, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(10, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(11, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(12, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(13, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(14, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(15, pr_write);
>      default:
>          BUG(); /* Can't happen */
>      }
> }
Till here I am fine if you think this is the correct approach for arm64.
>
> Here the code I thought you could add for arm32:
>
> static void prepare_selector(uint8_t *sel)
> {
>      uint8_t cur_sel = *sel;
>
> #ifdef CONFIG_ARM_64
>      /*
>       * {read,write}_protection_region works using the direct access to the 0..15
>       * regions, so in order to save the isb() overhead, change the PRSELR_EL2
>       * only when needed, so when the upper 4 bits of the selector will change.
>       */
>      cur_sel &= 0xF0U;
>      if ( READ_SYSREG(PRSELR_EL2) != cur_sel )
>      {
>          WRITE_SYSREG(cur_sel, PRSELR_EL2);
>          isb();
>      }
>      *sel = *sel & 0xFU;
> #else
>      if ( cur_sel > 23 )
>          panic("Armv8-R AArch32 region selector exceeds maximum allowed range!");
I am not sure about this. See my question before. However ...
> #endif
> }

 From ARM DDI 0568A.c ID110520

E2.2.3 HPRBAR<n> - Provides access to the base addresses for the first 
32 defined EL2 MPU regions.

E2.2.6 HPRLAR<n> - Provides access to the limit addresses for the first 
32 defined EL2 MPU regions.

I understand that HPRSELR is not used when directly accessing the above 
two registers. Thus, this function will be a nop for Arm32. Please let 
me know if I am mistaken.

>
> void read_protection_region(pr_t *pr_read, uint8_t sel)
> {
>      /*
>       * Before accessing EL2 MPU region register PRBAR_EL2/PRLAR_EL2,
>       * make sure PRSELR_EL2 is set, as it determines which MPU region
>       * is selected.
>       */
>      prepare_selector(&sel);
>
>      switch ( sel )
>      {
>          GENERATE_READ_PR_REG_CASE(0, pr_read);
>          GENERATE_READ_PR_REG_CASE(1, pr_read);
>          GENERATE_READ_PR_REG_CASE(2, pr_read);
>          GENERATE_READ_PR_REG_CASE(3, pr_read);
>          GENERATE_READ_PR_REG_CASE(4, pr_read);
>          GENERATE_READ_PR_REG_CASE(5, pr_read);
>          GENERATE_READ_PR_REG_CASE(6, pr_read);
>          GENERATE_READ_PR_REG_CASE(7, pr_read);
>          GENERATE_READ_PR_REG_CASE(8, pr_read);
>          GENERATE_READ_PR_REG_CASE(9, pr_read);
>          GENERATE_READ_PR_REG_CASE(10, pr_read);
>          GENERATE_READ_PR_REG_CASE(11, pr_read);
>          GENERATE_READ_PR_REG_CASE(12, pr_read);
>          GENERATE_READ_PR_REG_CASE(13, pr_read);
>          GENERATE_READ_PR_REG_CASE(14, pr_read);
>          GENERATE_READ_PR_REG_CASE(15, pr_read);
> #ifdef CONFIG_ARM_32
>          GENERATE_READ_PR_REG_CASE(16, pr_read);
>          GENERATE_READ_PR_REG_CASE(17, pr_read);
>          GENERATE_READ_PR_REG_CASE(18, pr_read);
>          GENERATE_READ_PR_REG_CASE(19, pr_read);
>          GENERATE_READ_PR_REG_CASE(20, pr_read);
>          GENERATE_READ_PR_REG_CASE(21, pr_read);
>          GENERATE_READ_PR_REG_CASE(22, pr_read);
>          GENERATE_READ_PR_REG_CASE(23, pr_read);
At least 32 regions are directly accessible, thus thisn should go till 
31 (0-31). Same ..
> #endif
>      default:
>          BUG(); /* Can't happen */
>      }
> }
>
> void write_protection_region(const pr_t *pr_write, uint8_t sel)
> {
>      /*
>       * Before accessing EL2 MPU region register PRBAR_EL2/PRLAR_EL2,
>       * make sure PRSELR_EL2 is set, as it determines which MPU region
>       * is selected.
>       */
>      prepare_selector(&sel);
>
>      switch ( sel )
>      {
>          GENERATE_WRITE_PR_REG_CASE(0, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(1, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(2, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(3, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(4, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(5, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(6, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(7, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(8, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(9, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(10, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(11, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(12, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(13, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(14, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(15, pr_write);
> #ifdef CONFIG_ARM_32
>          GENERATE_WRITE_PR_REG_CASE(16, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(17, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(18, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(19, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(20, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(21, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(22, pr_write);
>          GENERATE_WRITE_PR_REG_CASE(23, pr_write);
for here.
> #endif
>      default:
>          BUG(); /* Can't happen */
>      }
> }
>
> Please let me know your thoughts.
- Ayan
>
> Cheers,
> Luca
>
>
>

