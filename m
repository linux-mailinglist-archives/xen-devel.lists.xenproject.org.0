Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA8AA96ECF
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 16:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962682.1353841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Efj-0001GJ-7u; Tue, 22 Apr 2025 14:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962682.1353841; Tue, 22 Apr 2025 14:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Efj-0001E8-5H; Tue, 22 Apr 2025 14:32:27 +0000
Received: by outflank-mailman (input) for mailman id 962682;
 Tue, 22 Apr 2025 14:32:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1zWz=XI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u7Efh-00010Y-4d
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 14:32:25 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:2417::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99dd7f82-1f86-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 16:32:22 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CH3PR12MB7524.namprd12.prod.outlook.com (2603:10b6:610:146::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 14:32:18 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 14:32:18 +0000
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
X-Inumbo-ID: 99dd7f82-1f86-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mci1DKuVSeMxX2ukNQM7S73VKEHpXyXcxCS/1ETwgcwqccLDDhEnEgfKFhG7OvAt/o8U7GPt9Cik4blDbQMNWPUTeUwnyXJ02a8oDOPKs5bSJeMT+VjBltiaQSFAM62gJKRAkh8vaWyL0zAF8AEfrXqHefp2V4XeS+MAWzD8wymhNTmPrhIfgyFnl8+R1h/jnMny2BuU5AaFDaCYhuDKH9EAltE76xO94mcXVZIMBeJswOUJREePW2ReERyIXEC4RggqA+PM5lAMO+He4Y6irl0igwG9cuKpgjf8BDt7atNtzboauKaTn0qmFUsg5fp4YndRG5QX9YkTadNIxQGT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZwLw7lY6hQLgw9bsrxesqQ/4PM1E9WVEr6CrY8ffSY=;
 b=dVeAgm54UpupGdiAmhEZHRaPAGLKyvvWfIxhM1twxTmQgsR6NNl2iO+rr/ZfjhCODV8LE4jV2WcNvN/jJy4940XiwJIQzmfacz3VxwKRZ+x2RFuAbHWb1ioq6jLyIDHX2yES4kvYXLcVu7J0Vku/Ns3WaoCcF2bDqrVcoQRzN2n0P30jkenH43lHm6IpSmSAFU99dvjUfeS4g7zbUAvixes8oYePUD6bw62B6rqB9dJKc40MDK+gSnoKEF6mfHMkNJ1IY0QuSeCL1Qw+cANxVP4mLT7UHg9xX9juV0HKIorheHAMQFwvtwVRiAnW3JgC7MsDWwe3anJdz+Dg/W/TqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZwLw7lY6hQLgw9bsrxesqQ/4PM1E9WVEr6CrY8ffSY=;
 b=jZiUZro2HX5jmi+BcdyxKL8o7/3WtSJoZPpmH3tI7DO/2qqTgJA9DSVUf3pQZBNBx1zv/T3O3wPowOa0I4m8V6oExvsbXMsbNltjw4H1u3KAVmnhKjpYyEYVs8DIlP2+rLmYWycMraQ3xOJZA0zVMEBbHDpxN8Eou4z3bAwAO+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <50a1ea9d-f1da-410d-9129-967d8283b5b8@amd.com>
Date: Tue, 22 Apr 2025 16:32:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] xen/arm: drop declaration of
 handle_device_interrupts()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1744626032.git.oleksii.kurochko@gmail.com>
 <ec1bfe540b4588c749fcdc932bd93da96db1d8a2.1744626032.git.oleksii.kurochko@gmail.com>
 <b6bb9905-befd-4ebd-a50d-a5a1c82f53bc@amd.com>
 <7856ff9f-3cd8-4591-930e-9c9d43cedcd7@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <7856ff9f-3cd8-4591-930e-9c9d43cedcd7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::7) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CH3PR12MB7524:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b24e4ca-7226-4d59-b9d5-08dd81aa7c40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDVvVGhrSjliQllYbUpkVWdMTUpEMXp6encxTGNNU1VGVWpoR0NxZjNHcjhy?=
 =?utf-8?B?MTN3djg2NDdabXM2aW1ubFcvT3BVSXhTYmpZNUNVNFptNmtaTHY5WFVxV2Zr?=
 =?utf-8?B?akJqYW9QTFBVSTJVQ3pOczhVWFB1YXY3UENhbTlrdmZTRlRWeW80eXdqUWFW?=
 =?utf-8?B?Wmc1SW1sUnJuU2h4UWhIRlduL3ZGSE9oVm9lVTN0OFRBTWwwa0VHVzRhWWRu?=
 =?utf-8?B?Znp3YjJpOCt2SHNMdlVVVlV2Rmt5OVY1TVZKR2REZnJSWmUxUGNrRzZuT3pv?=
 =?utf-8?B?RTNPRkR6eWk0RkVkS3pqOUNpR2ZjcU9nMHBnMlVLaFVDdFJFL2dTcWpQVGo2?=
 =?utf-8?B?cHA1TDg0d3RiVTNpNDd5OUd2bmNSTUNaaERSZ254N1RYM0pqMG14cEJCWUkr?=
 =?utf-8?B?U29Cczl1YkxzcmxKYjlLSDg2QkRsOXdMUDlSUTJiblN0WXZXZm5HQTVyQS9D?=
 =?utf-8?B?MzhyWkJkbmlWZXpMVFpuWWZYb04vbll3cFdqWEl4amorNk1MOXVyenFheDZw?=
 =?utf-8?B?SldIRG5QSmJ4d1YrUTlhSzdNZ1lld3B5eFlZRXVQdnhOMFczZEVxK3Fkazl6?=
 =?utf-8?B?a2RZellRalRGNTQ1NVdCT3ROTDZlN2pMVzZTbHRjMUJack5ZTmJkMmpFSDhm?=
 =?utf-8?B?RExxQmlhSVJCWkJFUVIraWowbjJNVGhidmt0QnpwM0tSbzZmMmltQXgzWUdm?=
 =?utf-8?B?dkFzR0xyWjFVUnM4SkJEdjBReGJGQmMvSGdRWHEzZ0F1RVdFVndBSlNuSmhU?=
 =?utf-8?B?VFdUT2RVaDJBNkZBVWRJc2Z3bTdrdEtjd2xoUVdaY25mekNtNi8wN1VEK2ds?=
 =?utf-8?B?cmlyZ0VIL1FEOWM5U29tbTc5cmo4dWN2NVNET2hBS1JvZGNuV0t5M1NoaDVW?=
 =?utf-8?B?ZkVwTUdBZ21HaTVscmpQbkUzY2F6R21hQ0lvWGxnOGMrUUkrSG4xRXFXV3R5?=
 =?utf-8?B?N0VISHg1OTlvRkFyQ3N3NStGdnRCV1JidTI3QUNMOXI2ZDB2elZ0N2pGaVZR?=
 =?utf-8?B?K2JuSmdoWEtiZ0JTdzN3KzQyUWFQandQdTJmaXp3ZHZ6UksxekFBREIyS2NX?=
 =?utf-8?B?NG13YTFxRkpRWGUyclBtbXRad1Bnb3NhMURNNEN0UWhMUDhqN1p4ZElQM21z?=
 =?utf-8?B?UkhGczBzMlk0VnVTQkEyVm5TdzVLUDJZbVpIcHI3QjdJb3dCVWF3QkZMUm5H?=
 =?utf-8?B?VWZ3QzhTQkxvakVoZ25uYithTnJQNDRXa2ptajlKZHdVL25jQUVYRDgyRHlp?=
 =?utf-8?B?S1AwOS9BSTFrcTFSWFNwUVB1WUJFU2Zuc1lNZmlQTEhqZnVlZ1paWm5JTlpt?=
 =?utf-8?B?NDJBNVFkMDkyem1PMnFiM2dTdlJ5TW8wcks5ZC9VSWhvbTU3UkVMYU5MMXJD?=
 =?utf-8?B?emZRR2k0V1ZDU0lzeTk1Y3R2amtDYzQrdEJFM2M2b0RRU3ZhSGIxQjhnS1lZ?=
 =?utf-8?B?YXA2b3hZdEhYUXZ2K0xlUWM2WS9hYlR6M0toSmtvbGhOcGxEV29zckVLMlJr?=
 =?utf-8?B?Z0ZDT1I5bGkxWXJacHdyeVAza3ZONjZ6d1owVGFrRVVyamFWTUFZOXFxY2Q0?=
 =?utf-8?B?TGluTzg4L2JKcG9SMWZTQmpYU29lVzU1ZHZuQXFVNnF5blFRUThFNkRLc2Vn?=
 =?utf-8?B?emFjYXJqakVKd3JsanFVQ0xiVHVrYUJGVVlEeE5wRW5uQkNoY2s2OUgyOGYr?=
 =?utf-8?B?VG4xYzYwVTVnYnJRR3ZweXZNVHBWdzdQS2RXRCtTSm5Hb2xMYm5Xc3hHQ0dO?=
 =?utf-8?B?UmtKOWZ3bzdrZy93ZXpqSGhXNlFhL3Y1OVdtWGRJVzhqdjgvSFM4eU9Icklx?=
 =?utf-8?B?b2JTU2E1dmFHdW95UjlnWlNEcEtXd24vNlhFNEhwN0orUVV1aitMNnUvaFBu?=
 =?utf-8?B?K0huWDZjRlRLSmVxN1FDNGh6THJuUzZZN3dndUJrbW81c0ljeWZkT3dBcUQ3?=
 =?utf-8?Q?WXxkgpjUGL8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2ZPSDhaTW5yS1RMMmJPaVBkZGxTUEU3M05IRUhCTS9kTm81L21uS05sZUVq?=
 =?utf-8?B?cHAvbk0xWGViVlE2dU1qbFQ5VHBTb0o3ZGZuaytMRk1lbURKc3ptMVZqUU1R?=
 =?utf-8?B?cFpZejJNdGlSanZjYzdsUlpHdXU3RklyV0R3RjZQRmZnRXdVZVQxWTRZK00y?=
 =?utf-8?B?ZmhNMU50cXUvR3c5Rm01UDMwVnFJTDdTNGJCVGt2Y3YrdGswcHBLSjdLS2hF?=
 =?utf-8?B?bkhYaDdnTlA4OEYwNGpJdzBGOGZvS1QrQkozMmNkMXBWSUtYekdlMTBpaHZo?=
 =?utf-8?B?SWxDOC9pTXZIRDBCcC9YajBhZENEcXNETERkYXRLTTdwNHM3NVRhYjlwOWM2?=
 =?utf-8?B?S3pCa1FLNkNqbVFWYUFIcmxyOFRXcHRDajNSV0paOS9qcWdONWlMNUd6bllk?=
 =?utf-8?B?UEZVR2ZsSi9UU2NVaGR6WElHNVJvb09jcjIyUmxnZk5iTTdwT2JIRnljSjg0?=
 =?utf-8?B?NGF0VWxYVlRUZWhKYVFMSXBYcVVmcGo1c1pzQlZyZytaeTlib3ZYSklWcjQ0?=
 =?utf-8?B?UlVYb0ZzUUdtRHFMN1NlMitIWXRYc1JGcDJuZGlJbGdnK2xDaWYwNDhoTDE0?=
 =?utf-8?B?OGI2cVZiVm9NbU0wcXVMblYveTlsRG9kY0FPSGtlbWJiM2QyOVUrZDh4VERF?=
 =?utf-8?B?RXdjMnZ6WE5ZWlB1RllWYlcxL1FRN0Z1NzJUQ0RvbmU0WmhJbXFMY2ZVbmd6?=
 =?utf-8?B?MFg2ZS9QcXRiNkloUEtrdzB4ZmZqTWtjdlJFc09qeldJUDhrZ0NyQVBaa1hJ?=
 =?utf-8?B?TllYOWF4amhFYkdPQ1hFR3lLSnVzNzhEdzRVZDBsbCtlTXY0Y2M5SHFzWDE1?=
 =?utf-8?B?UloxY3BaRXlIN2R5emt3eUI4ZkFsN0F3ZFhCeExHT3FVdEx5eDc4cm9kNmxu?=
 =?utf-8?B?ajdKcHpYaVI2Wk16Rml1dmZrd01mMHNIb2VJd2dOUXVNY2d4YTlvazVxNkY1?=
 =?utf-8?B?eXZwSzVIWHVHdVhsRUNNMVd1VExiN3BnalNYSzc5UitScFkvN2U4bW96ekl0?=
 =?utf-8?B?czN0cVFkZkE2aUx3ZGxRMDJCZ21WbTNhNmcwWEZQSzc5RzNkd3krZzljUkFY?=
 =?utf-8?B?dVZCbGM4NUpwVWtkYVlSa0JPV0lBSmJOT2R3bHI0RXBocDMzb1VHUCsrSU1M?=
 =?utf-8?B?cVB5b2lUYmlwdjAwdVgvWFRPK281UHVrTERyZU50aXdBcW9DRWZsSTQwU2Nl?=
 =?utf-8?B?RnV2OGlEOUlrNVVpRFdoa2VmY1NRMW10RURWaEpKb0gwK2RzOXpHMlNmdm9P?=
 =?utf-8?B?Z2Y4dllnazZXT2xrUUk2RC9wN2IzWlNGYVVyRkhTYVdiVE9zdExpTGhteVky?=
 =?utf-8?B?MlBoc2o4Vmx1VS9NUWdocWtJdkJDYzhTTlp5cHNvQ0hscHNUUy94TEE2OENa?=
 =?utf-8?B?Zk82L2UzU3pINHk3NHBqWFAwbHZ6eVV2Znp2UDB6Qk9QVFN4ZExvZ0kzQzgz?=
 =?utf-8?B?aE5DUitXa09OZFp6THZmdTZEKzNwcEx3UXR5VVozYzNjYjdyUnN2aHdNMnha?=
 =?utf-8?B?NUJCc1MvOEFrSmhjRm9pU3R4ZFlIOG5sSVIrMXBsV2p0eTF6TlpnbDllZzhK?=
 =?utf-8?B?VDdwQ1NkR2k4c09nM0UyWVlsNWJjWktHbUFTOWNtWWlabXA0bVlDa1RVMHBW?=
 =?utf-8?B?c05xUW8wTElYaWd5Ulc0bGJObmFjck5GelptK0doSHVieG1RY0o0cXAxak1J?=
 =?utf-8?B?cmthQ3U1OEE3bWRCN1VDK0ZnRXFJVElURG5YaTk2aEd5WlR1RThkaG4xYmFJ?=
 =?utf-8?B?dGpFQm9oUmdTUjRvcytaZlhMc2lHeTFsTTNSL2tBWG4yQWdyOGkzRmEweG9y?=
 =?utf-8?B?bGxVSUdvdWFYMXovakVpdHdZNXl1T1V4aHBTdXpieEU5dndmaVAra2pKWURW?=
 =?utf-8?B?amxyT2x3clFRcEZrQVBBUXkrQnZobUdWVWZ5MUhrY0dwckdmQ05zWGI1a0tS?=
 =?utf-8?B?U05naFd3K09DcFFwUHFjU3IrK0dQVmVITHdReXdiT3ZIKy8wTEJrWnNjMlBv?=
 =?utf-8?B?OXVqZlB5VTRjMmFzM1NiT2Z6R0pPM2xZV1VLdURnSzB3OFRqWVRJUE5LdUsx?=
 =?utf-8?B?d1RaYmU5WXh2TUh6YzY0RWZkK2NTdmtGQlU5dWFBanlVVmRuNzF4cFoxejBt?=
 =?utf-8?Q?Ab38=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b24e4ca-7226-4d59-b9d5-08dd81aa7c40
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 14:32:18.7596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eidZ4CvrMmUiL9qRkcjTdDLN6EIASrUGh8xvAfgXDoX3vUBXJsshegl1K+Tvf7hM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7524



On 22/04/2025 16:31, Oleksii Kurochko wrote:
> 
> On 4/17/25 9:38 AM, Orzel, Michal wrote:
>> On 14/04/2025 17:56, Oleksii Kurochko wrote:
>>> There is no any users of handle_device_interrupts() thereby it
>>> could be dropped.
>> It reads as if you were dropping a definition. There is no definition, therefore
>> no users. Prototype was added by accident in:
>> 8d2c3ab18cc1fce46945bd3aa1819a7aea0c564e
> 
> I will reword it to:
>  There is no definition of handle_device_interrupts() thereby it could be dropped.
> 
> Should I add Fixes tag to mention that it was added by accident in 
> 8d2c3ab18cc1fce46945bd3aa1819a7aea0c564e? Or it will be enough just to mention that
> in the commit message?
No need for Fixes tag.

~Michal

> 
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> With the commit msg updated to be more meaningful:
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> Thanks.
> 
> ~ Oleksii
> 


