Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC8EA3595C
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 09:50:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888615.1297962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tirOz-0005oC-0P; Fri, 14 Feb 2025 08:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888615.1297962; Fri, 14 Feb 2025 08:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tirOy-0005mS-TG; Fri, 14 Feb 2025 08:50:24 +0000
Received: by outflank-mailman (input) for mailman id 888615;
 Fri, 14 Feb 2025 08:50:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tsm2=VF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tirOy-0005mM-3Y
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 08:50:24 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20608.outbound.protection.outlook.com
 [2a01:111:f403:2412::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b855db9b-eab0-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 09:50:22 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CH2PR12MB4134.namprd12.prod.outlook.com (2603:10b6:610:a7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Fri, 14 Feb
 2025 08:50:17 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 08:50:17 +0000
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
X-Inumbo-ID: b855db9b-eab0-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QadfnEOBDwJzgzdqo3+WUxp7I6mXUSIFoUa+RuIR4fxEYPU4kH8hi36I1M3tm4YBoV8+p8I5PCAUhyuiWqC28zePkny5gfA5IiQMgQ6iaHQi8LcLmNi0O+zGbj1755U/fLKNFWPnoZVSStxanGAY8aj6mOD6cqEieKxWHrSAIKL6ZtKk1V7Ikt4K+i8h1lGZS3LkVqguU6GdYHerV+1/UklxrZi3NQzRDYifGw4kEywCKa1hWYmZWKB5no/EerJFtl68AcHLi1X9Lh1aRj6/igyUb0/TwSkIfKhcsHrPpfAeKY77RDfrwFwqsvFspipcRn15YX/DUOoGHO57SLpEDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NT9Az1/2T/UcS9uEllAkfv+ZhM6H/8lKAghc46lxkvc=;
 b=agNPxb/PFtgy6O4Mar+6Z5ESg+X4qnIlodn3S4nuvdaF75imbcx+erE0YBYjGbkvp46aAzobTrEZ2QNbDKF2kos2i8Y7KFAl/jKM9Ksw4LdtNpgfmIbEJKAswG/tyZtN74DBeBWgAB3OI0bUNGQqS/QS7KB+fMmIf9kRY50oiota4UTecZHPcrwug/MTxhXH7mY58oNEMrO6azi8HFeJ2jsiDBlZGUwTea9hxK8MIpgI8Mq9JTdiR6XYt/th+ijv44Pf7BXIigh/WhG4HlgVv23nYLTDjdotfkGyI63S75FhGJ2HSQoY+TCZefVM/HhADQNH88dyW0Q4BOx9HocS4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NT9Az1/2T/UcS9uEllAkfv+ZhM6H/8lKAghc46lxkvc=;
 b=pU0O3Wft+k2bPbkswyyrfE22CLCCyBVEXZxHqLiS3e3O2oAkcKCqrU5m08GzrZAnnaktwtMT88JLMJPyQQRcu3RCdR+0a2DK4GGm0GT0AFCpd4c7Hyr0P6tmc5oOYH9c7vGH3WrJyAjgYGwIhBt4SBO97aRxg0h2fwxXgjUjrU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <95f43aee-5d0f-437f-a240-a75f5e9ecddb@amd.com>
Date: Fri, 14 Feb 2025 09:50:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arch: arm64: always set IL=1 when injecting an
 abort exception
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250213153748.2869989-1-volodymyr_babchuk@epam.com>
 <20250213153748.2869989-3-volodymyr_babchuk@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250213153748.2869989-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::10) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CH2PR12MB4134:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c29e8bc-8b17-4684-fa33-08dd4cd49a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0YrSjl1Vk83ZGh6bjJoS1R1TEI4TXdkR2tLSnY0a2VjUkJFVG4wZzByRjVl?=
 =?utf-8?B?aHY1WGtjRDNGUWxOZllhTG9UZHNjM2lweE16QmthTzJEUmZIdzBTV3BuNTh4?=
 =?utf-8?B?eUZoWkt4VG56Q2NzS0F4UkZWSEpMb3ZYb0ZUekpBaVMyNThITkJCZURYMU4v?=
 =?utf-8?B?V3BYV1ZlUTMxVnc2MXFnODB6dS9FUklTRzBldmZldVdZTi9YSlhxdU05RWdt?=
 =?utf-8?B?ZDFNbzZUQ2ZlNzByWnlzaU9IR3FJZGJ1b2hybVd0VkpGMXNvK3JCZUI3Znlt?=
 =?utf-8?B?emE2ZEViTDlHblpnd3VKem9ILzlOemhaWVhGRUw1ZFBkU0lXWGdYSkduY29U?=
 =?utf-8?B?VUJMSTJFNm5tS2drODBNaWk5b2pBVEJmellvYm93aXdoWkJ1WUZ2WU1iaDN0?=
 =?utf-8?B?a0FXSUtEbEFmL2VjS0gxRTdyVlE0ZzFnN1ZYTG5lcEFJY1FEcTl6VmxyNzhK?=
 =?utf-8?B?ZUliWld4MkRQMGRtMHdpbXFVMVFGcGlrMnB0ZWRTSUJ2N0N2ejdxL3dBTmVZ?=
 =?utf-8?B?ejlFSm9ReUQ1YVZkK1o3M3BtcWJLQTZ0R0VHUFZXY2NtSUo5R2ZHNVUvTnI0?=
 =?utf-8?B?YXFqRFE5S2doSFlqNzNZWC94OXRpa2t4Yjc1QlJXOWVYb2hRb2p1YnhPUUN4?=
 =?utf-8?B?Zjk2OXlHNitwYkJPamFjQklHaUF4TUsyZkF4V0E0YkJaOTZQRHV3dHV5Wmhz?=
 =?utf-8?B?dzVXTnI4U0puS3NmZFAyY1ZOOXZRSCswUU1DM0RkUHQ0TUJqYkVncFZuU0Vu?=
 =?utf-8?B?NkxTQ1J2WW1oYk5FUTdGbDJmZitRUTFqQk1aRDF4L21ISUc3ME1kQUJKbnNO?=
 =?utf-8?B?VlFiSVRFRW1UbWtxTkxya2Z2Uk5rdmlMbTdVelNFbE9pOGd3RXdGLzFEcnBI?=
 =?utf-8?B?Rm1PZWN6cjBEeUhhdDZYYzVoM1BDaExkQmRKaXB1VDdJQW9LNmo2UDFHdktE?=
 =?utf-8?B?OFVDQWpvUENTay9GVWFKSTM4dHVYZWRmalc3ak9VWklHQTNEQzZNbWU4Wmpr?=
 =?utf-8?B?MW1ad2lKRWRjQi8yZWFmMXNsY3o5WS9RS0poNFYrV1JUbTh0RUUzUnNNRWhD?=
 =?utf-8?B?MWlzVjhBNUc0cFRwRVpNSStHM0N2UjlLaE1hVWppT2crNlY1STMvU0dZSG9w?=
 =?utf-8?B?dllwWFZWS2ZvYjVLZ1RmUktGL1VlazBOWWRTTTFPa1owZzR0WlR6Y1c5ZEZx?=
 =?utf-8?B?OUtJYjlpTDZhODhCWkJRTHhJR1c1eStiSkJBWGhqQW53UUZTVkpzOGgwRzlM?=
 =?utf-8?B?TmU3NVZHM2N4OSs0eWZXSVlzMGZGWUF3YzAzRHR1dHQzODduVkNrNi9MOEh1?=
 =?utf-8?B?NUhnaDlsQlpleDNuRUpLZ2dJUVdmUHVYZC9Uc2NuSjBuWHhqTzBQV2hKMFVX?=
 =?utf-8?B?Y0o1dndWMlJJSm1zd01lVkw0WVU0VkVtYnJ2VklXSENCUFFQU1Z4MDlrdDFE?=
 =?utf-8?B?amdvcTk0R2pLdXFrSjdmSVF5dVRpbFlqdUpPblg2UFpIczFnVUJHUjJVSnBQ?=
 =?utf-8?B?VFRMTCtxTXozV3QrNm9GRFJLYStyVjFzckU1a1FhVEdzQW00c0hWeHk1b1c1?=
 =?utf-8?B?eXdPN2Q0c2g2Y1JuZStpQ0R3WUJxNTFGa3RDb3lQczVTZUlvWlNQWjNGd0Fw?=
 =?utf-8?B?d3ZybGxxUjFXdC8xc3JmYis3SUZnK1I0Z2JMZEV1UEs4cGV2bW9ZdXA1Vm1M?=
 =?utf-8?B?dWdRM3pMd0xkU3Zjdm5yRzVoQmxMY1VxVzZQTDFMU01mSVo5MS94RWRhOXcr?=
 =?utf-8?B?Y2xkQ29NTXlERThDTnZINWliWHpSN1Fxa2t6MXJJdVN6Z3NRV2JSb3Q1SWVC?=
 =?utf-8?B?blpDVEIzbitMTkNtNFlmVVBzSUpydVRML0ZyeFZVcnlnZlozZ3JJZDZNVlBS?=
 =?utf-8?Q?ZhZUC7OzJqU+c?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3lBS3ZvL04yWVNjblJ0QWtVZ1pIc2tmVGx3N1F3T3MyTjlCbjFoKzgzYU5W?=
 =?utf-8?B?RW9KbEgvc1o0eE14NGIySlQ3ZXhvc0FIQlg4QzI4ZWE4OG1NdWlFNDYrOFpm?=
 =?utf-8?B?bkR2SDRXUjdHaVRLVkZ4akJMcWFJU1o0TFlDN1FqVlVPQW5vWmxOUkhNSTVP?=
 =?utf-8?B?aHQ3VnowSEhLOVNlaUV6Vzc3K2htZ21RRHRoQlRZVlR1TU9ML3k4V0ViT0dF?=
 =?utf-8?B?ejRBb1JtSUhDdVlrcDFjSXZ3VzN6ZS9HVnMzb2tEdXRNU1hXVUFTc3UwOVRH?=
 =?utf-8?B?eXF5dFByRmJkYlpIN3AzcklKQWZGNUM2dTBmWktsNVlLNjhFUkdXYWV1N3Rr?=
 =?utf-8?B?a24yWDZLQjhRWTh5dE5LWkdrbDQ2K3p4L2pxL2ZEWGkxTkEvNjBBTk50d1hk?=
 =?utf-8?B?Rk9OdTVnUGhvcWdRSWhmWGZOZmd0N1ZaL2dNejBWMUZBMjNJaVgrK1NtV3hk?=
 =?utf-8?B?KzZ5MkNlTlhGTk5seDVsZEhoWDQzTFh2R2pVemdQbTE2STF1aU1GYXE5VzFl?=
 =?utf-8?B?Wk9uWW9nSk56MUQ0MEluR1hFbWhOWXc2ZHdTTE5vSUN2YzNROGp1djZiaWhs?=
 =?utf-8?B?aDd1ODQ4V3pKMVlsUHZvMWsvYytvem1zSHcyVVN2Y20vRlg2SDFzYVpqZE9m?=
 =?utf-8?B?c252bnZvUVBmZVlTUXkyVlJ0NWVOS3B3SUFTVWtOekdNVkdsdVdkZE9nRlM2?=
 =?utf-8?B?MjNxWk1UTVRHdmNMSHphcy9vKzdVTmZZR3E0UVhMVWsvRzVraGJKUVc4Titv?=
 =?utf-8?B?bkFEVFZkamtZMFJMV3I3ek9NVUVUNTdFYlptUlFLR1E0VkFuZnNDSDB5d3Zq?=
 =?utf-8?B?dmVSQUpEWjl4VXlMSHUwNjdwWWRoLzhkUjR3dmhSYm5RcXdtbTMzY1RudkdC?=
 =?utf-8?B?TU1hd1U0Y3JKR0E1YUFxeE5xaEREK21NcTdGS2V1dEkrLzZweWZDNCt4S2Y5?=
 =?utf-8?B?b0xWY3hxYlpJTUpEczVIL2VNRWgxRGRMa1c2NHRFVjJ2S3NlRStCbTcxR2RH?=
 =?utf-8?B?Q0gxYjBuckxPdUpHTkhKOTIySmVNMEVjNXRUZ2hHVE5XQlcwWUxmeFY1K0pF?=
 =?utf-8?B?ck9UWk82TGpXN3NjUnBzMHlnNXFKY0UzNlJ2bHZFNXYvWDRQbS90bmlqMUxp?=
 =?utf-8?B?Q1pBSUVUMEtvRnhxTDR1NkxtV1VzcGpVMExzREV5RGsxTlZaNVp5LzBhaVVY?=
 =?utf-8?B?ai9Yd2k0L01JcDk0dnhKUE5nTUlCVFFSN3dlaFlaNlJKNjEyVEl4WTArTnov?=
 =?utf-8?B?UWtESlhLQ1g3US9VZkJpL1VhbHIvbTkvbUVKRFNoOFdmdVlnOTUrM3NiSGtF?=
 =?utf-8?B?UlhuMVVUVVhEanp1aERUVmErN2hWQUJ3bENjMXdjaUVnaldCSnI2RnExYTZ4?=
 =?utf-8?B?dUNVa2ZpcWFCalhGR21sdTNBcFNNVTJESWtoZmU5clVCMDNueng5ejlrMVZN?=
 =?utf-8?B?Y0RUWm5BdVMycVhJcnVIbkFTWU5hQVp4MlpBV3hWWFZodDRNVzBoZndrcEE4?=
 =?utf-8?B?Um93aHMxcGdXUTYvLzcxUnZPbGxGVDdObnNiVURxS3lYMXA3d0crbUVIZlBt?=
 =?utf-8?B?N1NLSmhMZkExME80NjFIMCtzemVSWlRMUURUOEQydDR3VlV1M3JmenpkRW5U?=
 =?utf-8?B?aEc0b0RKZDdUUTZBRE1LbmVVc1AvZlJUSzFoaG9DM28vQnU5ZGt0UWc2bnF4?=
 =?utf-8?B?OFN5YXRmS3BJcTV4SDJCL09uSHRhUFdzaUpxa1p1alVMWFdURUIxK2F6MHJU?=
 =?utf-8?B?cENWMjFIc0hKS2M0Y1FJdm14WndnbWh2SUoxNEd3dWdBSm5TZzMwaVlPSDAv?=
 =?utf-8?B?aFR2OXpsaWordlNkUENJNmIwWHJ5SjVoQmpVUmZnTGNqQTRPNnF3d2g1WDh4?=
 =?utf-8?B?R3d1RXlzU0RLc2J3ZGViNkVtd3k5L3BGL25QVjA4NVN3SSs0SVdoa2R6Uldl?=
 =?utf-8?B?RUh5blMvVnQxWUxEdkxxMmg3NjI2Y0JUZ1NWZDBQMjBOdENYY3JiQ0c0Vzcw?=
 =?utf-8?B?YVQ4bUxMVGIxNlBqVXJzVGo5cjk0bzhyc3dNd0xSQjhPVjFvQzB0SEZPVzR5?=
 =?utf-8?B?SDd0UmdxRGhKZ01VRldvSWNHMVVUbUVEbWUxdnJ5aVJhYUR3MkZIazNKMXVX?=
 =?utf-8?Q?Gkuk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c29e8bc-8b17-4684-fa33-08dd4cd49a6d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 08:50:17.2991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dVkiT7jAP/0Hn1BqjbBMbKbSEUrFj5vlC85ZE3EiVMrqWKNkK4VTo9KxXai8yoP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4134



On 13/02/2025 16:37, Volodymyr Babchuk wrote:
> 
> 
> ARM Architecture Reference Manual states that IL field of ESR_EL1
> register should be 1 in some cases, and all these cases are covered by
> inject_abt64_exception()
> 
> Section D24.2.40, page D24-7337 of ARM DDI 0487L:
> 
>   IL, bit [25]
>   Instruction Length for synchronous exceptions. Possible values of this bit are:
> 
>   [...]
> 
>   0b1 - 32-bit instruction trapped.
>   This value is also used when the exception is one of the following:
>   [...]
>    - An Instruction Abort exception.
>    - A Data Abort exception for which the value of the ISV bit is 0.
>   [...]
> 
> inject_abt64_exception() function injects either Instruction Abort or
> Data Abort exception. In both cases, ISS is 0, which means that ISV
> bit is 0 as well. Thus, IL must be set to 1 unconditionally.
> 
> To align code with the specification, set .len field to 1 in
> inject_abt64_exception() and remove unneeded third parameter.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


