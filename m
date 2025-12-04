Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F34CA5AD6
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 00:17:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178332.1502190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRIZV-0001Re-4c; Thu, 04 Dec 2025 23:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178332.1502190; Thu, 04 Dec 2025 23:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRIZV-0001Pp-1q; Thu, 04 Dec 2025 23:17:13 +0000
Received: by outflank-mailman (input) for mailman id 1178332;
 Thu, 04 Dec 2025 23:17:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TdJQ=6K=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vRIZT-0001Pj-6g
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 23:17:11 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b2c881d-d167-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 00:17:09 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB6917.namprd03.prod.outlook.com (2603:10b6:510:12c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 23:17:06 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 23:17:06 +0000
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
X-Inumbo-ID: 5b2c881d-d167-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/gsbXxpHFx+7lGaWpz2BTzZxXK7Z8b89I4L4wcGQ65juQ+AtihkBXo2uFh/DhgknTO5lh2LrruFu89XwK5sHISKHVmH0NgURMPXFXSvhDHLsPvJIlhVIgKJPV3A0m0KU2DUg9Y6NHDG3qaL/hjeNBddYmlW1G0Ycj33ghfILLY5JcSxWWSoX6c+kyrqtA7B/n21G1cCRmMPJNRGvtR1p2IcsTMRxEfdsmenN3RJ4nHjnDAMb+IHr50KxrYnfFPGKW1hnIbwZ3zQbT0+9VCKuBrfePVBdeqtCGpaolAIwBx3IZa6sGr3i8Hz49NbQfo4Vbufu5QdM3sidIBrRRRoiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wncNBDQqHGIQ3mhKNWqEXQKbaCDeXmTRDypQ7/Bfvw=;
 b=rMoaiJDgfViMhKVqNp7AnFqQY/OCv3s623Si9FxNPA4fTVfudHUNRqPEfejd6fuxWtmgxGedsnwWtR17w7woCwchD3SrRDAxRnIN3r0cqu4qRKnxo7JP+PUYZ0LKNBLB5iauQLAjLdGIOX779C4Nbrijyt1EwHhT948+2VqwdsjLB2Xf4GfY7PTrrmOfuBqcZoNfZA0E50atVFI96ZwbvLyrFn/C2j6xn/qGbV+xce6EIjUpDf7G8CuGQqdKbjvFToYUR+3MvqQvMcu1lwH7lFWWW3XOj3sP+u0OwABrdNaKskfNrEg63Z2fXy6Lz3+uzHb/msTDtylmmQ7nDNZJxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wncNBDQqHGIQ3mhKNWqEXQKbaCDeXmTRDypQ7/Bfvw=;
 b=pvZeApv7Uj6qLkKgwkh6avd6jNBnqdr8KYq7fvYhZZknVITh9F9UDiwBYT/jqgABfnEDAieQl37jGihDeW1Wfut0h4ECRgpdEd1DLHA+GCitur7hMHU64sPX/Q3CxKIsunOsI6ECZT8bpJ0o/v8Rn/9MolviFdeYMRlRTA2bZ/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <72bab1bc-6549-4f5a-b521-a4b3c66f7030@citrix.com>
Date: Thu, 4 Dec 2025 23:17:03 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 3/4] CI: Add configure --enable-systemd for full build
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
References: <cover.1e7327573686b6fc1e161127e268e4042556d16e.1764867217.git-series.marmarek@invisiblethingslab.com>
 <ed2e7eda64da87351d6fd8590eee698598ef8e88.1764867217.git-series.marmarek@invisiblethingslab.com>
 <c9512f4f-7c68-4504-8492-237447586cc3@citrix.com> <aTIVBFMAaVj3Kh4G@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aTIVBFMAaVj3Kh4G@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0459.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 8172d9b4-f7ef-4ae0-1f0f-08de338b3daa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXZXb0Uwa05nMVJqQzZIOTFnSTZWQmpvUW5DMnk2elR4STRhSGQ4M0lPdWdX?=
 =?utf-8?B?MU1rZzRhSmdzOG5vS1kvN2ZGbkNxTHBxOW8xb1UzRDZTUUhHTnA4cmg4WWZS?=
 =?utf-8?B?YW5PdTZObUNKVUVTOEdUWnlQRVRuNEoybEVGeFdXS3RINzhmam12aG9iS2dJ?=
 =?utf-8?B?K1ZjRUtsam1sNHdQN1Z0SW9xcXQyanN0eUQ5WEtsME1rMU9UOERMUC8rSkt1?=
 =?utf-8?B?T1dpK0trNmRKTm1xbWRNRWs5WE53MytqSkxiaDdtNzl3WlVFTlNtNnBIZFZM?=
 =?utf-8?B?MEhTUWNodWt1b0lDTnE0cTdMZ3BQQjk4NUoya3FhUTd0Vi9aVWVQWnQrVVRG?=
 =?utf-8?B?NVJSM2RpaElkcGkvVzNwOTZoUWhPQWlybjkwWWdVbWZqT2tUWktnLzhFMUQ5?=
 =?utf-8?B?TU5TVnZSdHFrd2lsK3plaUVCVUpYNlBxUzJTeG9ZbmUxZDV6L2FTUTYxYy9u?=
 =?utf-8?B?a0NvaGtvR3VFRDdpV0hPb0owbWYzRWdmUE12OUtHNzQzWmF3Zm1jaXRNaVNV?=
 =?utf-8?B?MnJadDBtT0ZDTGN5dE0vMTZSMEM5YnAxVkl6WkVheVhUZGZGQjVadHBpVnRC?=
 =?utf-8?B?UkZ5dVUyWWxOeHBiWG9JektXNlVjY0FHclI2Uy9oUk1kc1F4amc5VE5wODdq?=
 =?utf-8?B?bDNiakYrdXlYRGVMWGgvV0hRTjE1S201VW5XaTRDQXgwVGpSZCtmcVdEV1Fm?=
 =?utf-8?B?RnptSDlNZk8wZlIyNStVbmVaVHNQckZubmZhYlFPakV5R0NzellSdlJiVk0y?=
 =?utf-8?B?eXM3a2ZUdzdWWkV0RW9OVjF2cWFxem53Rm5vbVBEM08xeC9MOStwQTJ1YnBi?=
 =?utf-8?B?aDhZTThBd1Z2RlRlQ1Z0aVNSblVkaUc2NWtKc3pGeWk5VU9EOXJ0em5hNm5t?=
 =?utf-8?B?NXhoWFA3M2hhaGRRSm9SbThJWjlhaGx0bDlwTTZsK0txRW0ycGZSb0pNMEZV?=
 =?utf-8?B?TXo0OWJReDBUejlJdGVQbHhKWHRVaVVnZElMMUhtb3IwbHRpV0hxcStoWGFK?=
 =?utf-8?B?VjhLeHNPN2kzOVhRbm9rK1lmYUk0WDNCU1MwanRhL0c4RWg3L2dGRjZBUlNo?=
 =?utf-8?B?ME9PTnBwSTRadmhNZWNWSkZESEhadThNVEs2SlBGWXBLalYwMWo3NlRSWGlw?=
 =?utf-8?B?U2V1ZFp6NkhCMU1sUlRid2JHajZmK3lpUTVLRDgvanc5SGMzcWp3Y0NkcWZp?=
 =?utf-8?B?K0lxem5ILzRneEx5MzIxUTgvbGxYVHhFa0pLY3R6WnRPUjdVZDdKbXl5Q2pl?=
 =?utf-8?B?NWwxVlJqYXBaS1dJRFMvclZidmFsNWIzWC9wNEdtUUROZyt3MXhBaTh2SzZ6?=
 =?utf-8?B?eWdBWVF6RSs0TXlRTExBSXlkc3hrWWxTWHhOS1NVWGhuOEVQN3hBUGZCZXc3?=
 =?utf-8?B?MFZlUmlhTlZKZFo2QldoaXNVem5hVWdVVkpaeWZRYmV1S1BHY1BYSEhvUG1E?=
 =?utf-8?B?Z1BQWExkdEVqcDJYZ1dwYXdmMjBQeFFkc001SGJsMG5kK0M2RCs1a1JnZFdT?=
 =?utf-8?B?TXI5VzcxczgzNmF4TzNOelVtZUJkRWpLV2FDSjZOcEwyN012KzM2aUFxTTdx?=
 =?utf-8?B?Z0l3eGR6d3owNzh2eVJibEd4V3AvdFVJZFVRVVRFLzB0RS9UaDRHcDJvNjVn?=
 =?utf-8?B?V3pmRTJPQS83ZkZ0cktlNmoxd3BhaVIweUhwc0x1bStMNUxmaUxNQSsrd2xt?=
 =?utf-8?B?clBwSVlSQjhVRlRsdS9hbFJ1N0J1SXFjMmNvbnQzZ3pDNzErdVFjYVhrTVpD?=
 =?utf-8?B?STgxQVZrbXUvSjI1TGVGbmIvVk5yNlo2dHNKWS9IWEZoMEVXRjdvQTJLVjk4?=
 =?utf-8?B?dWU1MmFpOXNWdmY4aWF4Y2ZIaWx0Qk00K2xKZ1p0bCtLU3BWTlhLVStheFZN?=
 =?utf-8?B?Zk5TeWYxMXlacmZvdVFDWHl0d2tROElicFNxWWZaK09qSE81ZmVxTEhNVHdD?=
 =?utf-8?B?RFdsaGRNZjFaSThlRUEvQzgxMDhSTTd6QVg4YnBFNjRPcUIzVDVMZlhvT1Rr?=
 =?utf-8?B?dEloZC9QV1F3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVpLYXJuMks5Zml3cnl2WUN4ZTdDN1lRMkdVRWVvOHQrb2ExenNZS1JlVzVp?=
 =?utf-8?B?R29zWlB0NXU0Ulp5ZUZSNjg1ZXI3bEFPQURSeFNQa1R6cTd3ejNyMnRxWVhG?=
 =?utf-8?B?ZEVpZU5FRjFhRXZRYmNVUFduVEVYZU51NUlERFZiZ01JK0VjUXhhRFdaZWZj?=
 =?utf-8?B?NUhhaDF6bC8zUURCV0VMTW5OSk81WDg5VHFlRkc2K0s4M1lKVmZDa2tldnFq?=
 =?utf-8?B?eVdSdlVLWmc1VWZiZnUwMitHU3lSdWVLQVE3V0VxOUo2Y3h0QitGNXRLbko3?=
 =?utf-8?B?NEE0TWpzYW5vTktXdFcxYXRBaXVQall0WGxmaENUOEJ4Mm40ZlVZSll5LzRO?=
 =?utf-8?B?UUx2cFREYXN3QVhQeWUzVlcxN2cyOS9GWVUvWWFrK1E1UVQzdXR2VXc5R1ZW?=
 =?utf-8?B?Ym5GdWRPMDBVbmdlMXVoUnB0bzZndWZqVm9sKzkvVjlZQUhMT3pEUDBlTGUw?=
 =?utf-8?B?K00xTjFlWTJoRnpiQ3RsSkVSdDMzQjRjc3RCYWl2cGpuWWJFRnhvSE1Nditq?=
 =?utf-8?B?UkEwSVFLZGFJSXc2c2dKejFXbGFQaWtPUkc5Ly9ZSnZ6bDJVS0NxeXpEY2I1?=
 =?utf-8?B?bjNLbnNwd081UHhvRExBUHhrU0tya2wvYlBOYy9jUlBSYzNFTWRTK3dSVU94?=
 =?utf-8?B?ZEtCUlhkUldodlRyR2NTc2p3Y2J0NHR3V0lDaWZsZENrV2pVTHV6R2c1dnRJ?=
 =?utf-8?B?ZTNTTTlCdGFhS3hSNGhSZTZsaWZuNzVWVlMyR1J4cnBTbi9TT2cycnJPdmpU?=
 =?utf-8?B?K25BNmQ3WUI3L2tiTWVwWWY2bEdrbFdUb3NFd2JOUmN1dVVrNGozM1dmUEhT?=
 =?utf-8?B?Y3hEeXljQjJVUEplYnRMOWduM1dqakl0eDV6YnJUeDg1Y0Zrc2g2eFFGb3ZK?=
 =?utf-8?B?TzRuWDFRU2tOMGtuS3ZrdVJxQ3ZsQmt2c25yOXgxZTVEMGsxcDVyRFJsQ3Rn?=
 =?utf-8?B?N3RjdTUzcG1nOEx3ZWZyQjg0TFpLVkpJZ2tZbHZDYmxSVHdSN1ZRYUE2Y1ZZ?=
 =?utf-8?B?S3ZrRzJSbGh0K0tQeHZsZ2FXTUEzVGNHUzBydDFWbXY0eE1nd2dkZ1BmMDl4?=
 =?utf-8?B?V1AzZ1BFUHdRaWFmVEpBTWp4MlFwVHM4b0JmNDUvM3Q1bWN0eUliWHljZ3l4?=
 =?utf-8?B?WWtsbllad25xYXVqUGF5WHZTYnBJK2xveFIyZjZucFA5NEkzdEs2VkJpSXdu?=
 =?utf-8?B?WGJhQUdGU3FSY0ZMaCtnNmhPb3FNRmlndmFSNUNpcllWUVo5U1g1bFYxS0da?=
 =?utf-8?B?NXRwMzM1cjF0YitFMUFGR1A3MFJ0OURjS0d0UFNiT0tlaDg0dnlPVnB2Slds?=
 =?utf-8?B?Tk53SUZ6VWI1TEMvaHNQWXpQaXpsRXo4TEpJaDZlSVRkbUwvTG41bHF1VFRs?=
 =?utf-8?B?OUJMSkliTVFnSEtDbHZLQktMdmpKazcvcEFxVkc1ZzkwdXBTUlY4bVk4a2h6?=
 =?utf-8?B?WjM1Q2FLTkNzS2l5a0RnUmtGUWdKcXA4VURacUVjTnY1RytseS9DcVFqSkQ4?=
 =?utf-8?B?K3dwWHZEcW96NS80MWQ4R0VmbEhHRnVhbVRMTUdTamxxMytVc1hNTDdTbXlh?=
 =?utf-8?B?K1BrNEIwMjNaM2dZZXZkZWZ5VGUwVUUzRTBaTUJMQWlVTDR4d3loOVNCblZv?=
 =?utf-8?B?dHZhanNEOSsrd3FwTzlwZlljU1NDYTZKRnBCT3dMckRicFY0SWVWQnNRMG9w?=
 =?utf-8?B?clBGeFYyS3k4WXFkZjBONFMzOUdnRlFscDZjdXpSVUpmVjdKaXhRRnE3YzVq?=
 =?utf-8?B?ZGwrelpsUkFUWFBFdmZtZE1vRlRybDdTak50NTRIc2ZLWGhvY25SK3RMdE02?=
 =?utf-8?B?WUxHMmxObi9tTlYxOCt6YTBXbU9aTUJ4c2FBMS9VL01rTmlZUFZsSHFKY0tk?=
 =?utf-8?B?MmNTWll3R1BpSXBaQ0pBWW51ODh3SDAzSkllWkFHSHl4S1BVakJNbmlzQlFQ?=
 =?utf-8?B?VGsyZWxJZnAxU05GS3RZd2QwQzRSem9aTVB5a0xLWkVZQTFXSU1GSWFsWXdK?=
 =?utf-8?B?cWtlRjVwelNjZTI3QUxsc0hBSE9DVzVMWUl1aThWZlNRSklsYm4yNXZqODFW?=
 =?utf-8?B?WElyUXdEMy8zRHZqSVJFdFczcTNNU3l2V1ZvZWRGaXZqWEhYc2x3ZzJoamQv?=
 =?utf-8?B?ei9ZYS85aHU1YWNOYi95MUU2VWpkbzNsaGczajM2eTNNNnh4ckhXRWV5UDFN?=
 =?utf-8?B?YlE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8172d9b4-f7ef-4ae0-1f0f-08de338b3daa
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 23:17:06.2870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYQ+fRTgwtNx5vcNxcOA2/iOmikeDi+VwHI+2sv+1lDFEps4OQHbectqL+2wDbuxqW+hQ0s1O93aTUQMCFJx4Qmfonx3r0DlBAnjEBDFP0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6917

On 04/12/2025 11:11 pm, Marek Marczykowski-Górecki wrote:
> On Thu, Dec 04, 2025 at 09:54:41PM +0000, Andrew Cooper wrote:
>> On 04/12/2025 4:53 pm, Marek Marczykowski-Górecki wrote:
>>> @@ -26,6 +26,7 @@ RUN <<EOF
>>>          cpio
>>>          git-core
>>>          pkg-config
>>> +        systemd-dev
>> Why is this needed?  Or rather, does this patch predate my breaking of
>> the dependency on system-dev?
> It's still needed, without it the build fails:
> https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10959608099
>
> Likely related to e54a6cd6a1f3802274cd3a58b07df5f012342192

Urgh.  Yeah, that breaks the build if systemd isn't installed.

We also need a build container that does not have systemd anywhere in
it, to block stuff like that getting in in the first place.

~Andrew

