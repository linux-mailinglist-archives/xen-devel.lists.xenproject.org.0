Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D03D3AD0742
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 19:14:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008715.1387935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNadp-0002M5-5n; Fri, 06 Jun 2025 17:14:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008715.1387935; Fri, 06 Jun 2025 17:14:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNadp-0002Jw-2w; Fri, 06 Jun 2025 17:14:05 +0000
Received: by outflank-mailman (input) for mailman id 1008715;
 Fri, 06 Jun 2025 17:14:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=La23=YV=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uNadn-0002Jq-OK
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 17:14:03 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20604.outbound.protection.outlook.com
 [2a01:111:f403:2406::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3a46a42-42f9-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 19:14:01 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SA5PPFCAFD069B8.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Fri, 6 Jun
 2025 17:13:55 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8792.035; Fri, 6 Jun 2025
 17:13:55 +0000
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
X-Inumbo-ID: a3a46a42-42f9-11f0-a301-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rx73MiSuAcx+unc/Iox1kZsbO7JQLC5geQ2FebKTLHna2YRqPi0ULAj92lf1M9gp0b9VJf1bDHgwwFSbNGQ0bj6B5Rpff2+2t2y7pnYBLblC0kZr8e3WJuI5Pd3if88JRo+iEEZMPIh2ov6lkZ0iQO1CEUg7uOocQyljTNKR0IzqfHtTI3QzuvHSo46SpqBR4dU1qVRaL4D0NarcKsdk2NxsR9CvT9AtM046WBeagV/tsDslCgviTNG8hWF7tMC9BpJ/LALIHE2HJnHDqdShbadgvBopE0/ZLk1fFPTe0fpWnaKfQU8H1saM1eEzkRVol18hetfiHvnmI25rY6TYDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCMWIPiPqhgHfQNQvgOTeK6iIwwzGiacbh9de7UPWPQ=;
 b=HGJ5vFBl2JtvyAaAAeAMZEPx7RrX4EgFgZdLBmM3PXGytkH71VPV/tknheWldEHf8W0nHTKZZm+Q6cj7Liv71rgI71GPVLnApCMQIjwSCz4PIpkSkKVDxHfFz/WBJ0/vY5imDROvVBNwXeLDtDPezBAsyFOuqzqI3r6u/JHR4nVA8CuJOiNW9cf6egvdZ+TiJ+eOm4q2CYDU7gZ3Wd8xj8sZ4yycjLVhvhmB4T7htL8CTrUn5RfZAkqLTrEeEfYTQIwmEo54qzAUtkes1Dl04vMWC4oVqjALKg0qPA8GCCo4yKm1oKrBeAvH0m8TRmNADTPMUTIDMbj4XTHyMeaI1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCMWIPiPqhgHfQNQvgOTeK6iIwwzGiacbh9de7UPWPQ=;
 b=5nDHkuAUeWsNC5mu3t6YhSNT3N4o3DijZcuczaJHaFfkqNqEawzfaHUyUpCtnpitrg9NMpWoQ+H2a7iutaHKF8tQaS0tIkbwd3n1frCze/S0nASWtusqHj+0Pja+25FtKziSS+L+7CZN1t7Cso/ry5ZyrO0oDFffBIHuUnvFeqE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <fa1bbbd3-6a6b-49ac-8bdc-0f2b0bb95a17@amd.com>
Date: Fri, 6 Jun 2025 18:13:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] Enable R52 support for the first chunk of MPU
 support
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0105.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::21) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SA5PPFCAFD069B8:EE_
X-MS-Office365-Filtering-Correlation-Id: ab9f3cf3-7e26-4ee3-275c-08dda51d846d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RkpTZ3VxRGNNeElYeU1RK0h4MHVtaVpGbWFrVmNsYkJXcFprLzhLRTR6QVRk?=
 =?utf-8?B?eDJqSlBlTXhlblVuK0FOMDI2UXBUY1pKTGhoemtaM1g1azNXWHYyK1RwUnpU?=
 =?utf-8?B?NFBmR0hRYTVoTENlQWlJMVYwNWhveGc3TXIyd2RBZlViU3BDclJWL3ExM04r?=
 =?utf-8?B?QU9XNWhTTWw0OC8wbmdJWjVCNENqQjFUVFNZYWtFVG1UYlh5bjNJWGlCa1dN?=
 =?utf-8?B?OU5ObWhTZGR4T3o5ZUJhWFByNEtReit1UkZuVmxqZGpjUWVHMldWQTJ5V085?=
 =?utf-8?B?b1pXK3p5dUlQWmRyOUFNOExIZVdYL3FsMG9GTnUrQlA5VENjVENtVUJtUlFo?=
 =?utf-8?B?dXlFYmxsU0xVeXM2MkxTNjlsUG02T2dXclJLemNOdFUvcFIvcElJeFRscWRs?=
 =?utf-8?B?S3R1bkNaYW5vMGc2YXFEOXhGRlQzUWFLWXpMb1RyM2ZwNmFmNHd4MmR2WXVN?=
 =?utf-8?B?dEhWdlhxaW5HYWJwcWRET2tBSWFoZVhhK0UvMDRrMHIxYWliSnQyRUhOclRx?=
 =?utf-8?B?WUFPRHkzTStZRWw1S2I2RFZGZGJONGVEd1JVYU9QQ0syUXBmQ1ZBVm9tV1Fx?=
 =?utf-8?B?MGVxdEptK2FsVlFYNmQyanFEWk51aVc4WlBWMFFnTkVKR3dTQ3RhNDlqSG80?=
 =?utf-8?B?VDg0ZTRONHNpUjltREd0eE5MTXVjU2RtV05OQnRZVDB0QUh2VzE0dWI1SURq?=
 =?utf-8?B?TWFyNXBYNklKU2wrc0RrYmUyQTJMdmQ5MkVTTzBVMmdIUzhsTEM2OFFoK25h?=
 =?utf-8?B?cExTRUpOZ3R2RzlhdU1TdjdjbG94UGtUZGVQclVvOTNNMkh2UDZxdWFnc2pD?=
 =?utf-8?B?L1hTWkY1YjlGRHZWUHNwK2tXTzI5Ynp0d0tqS0p0b1dhM2lzN2JMU0w4S2xQ?=
 =?utf-8?B?SHdIVzVxTHFHaWwzQjlESWJsaHBMdGkrZy92NWowc29rb3FBeEhGWDFpUWlI?=
 =?utf-8?B?cUVCUmtmblhGc1F2Qi9NZS9WdmZUS0xXL2NFZFRaaGtma3QxNWd0ZkdyVWFT?=
 =?utf-8?B?OE9ZQnJ1QWlXVk44YjVpY2ZydXBMU1JtQWpEdWIzQUJuSnlha1kwMmhvYzBm?=
 =?utf-8?B?STVVdW1VSjE5dS9IU3FDRnNheUFPMitqbklMM3VKM24wdkx6Y0RqRC9BblU3?=
 =?utf-8?B?NnI3ZjRwMTJzL3ByaDl6b1hXbGp1dVVVUERrNE5qSzl6bU9HR1kvemtTbmRi?=
 =?utf-8?B?b1dISHN2dDZMaEthaG1GY3Z1WXRwbmZLOXc3WnRLeHhLMWtiN3g4OGVvUzlX?=
 =?utf-8?B?UnlFUG5nVHlMUy9yMWVwd0lQN0tzMmVpQmJ5MDU3Zlg3N1c4ZFV4cWRiN2Jr?=
 =?utf-8?B?VWNoalpqTDBKWEd3aG9xbWcyenZyYzlIUUlueW1wWGJOYm9Lc1BPaDhBVnp2?=
 =?utf-8?B?MURrMGszdnk5amJ5YXloWFJucEloZWFMeHZDbG1yNGdYVGdWdytEVEdqQUJi?=
 =?utf-8?B?eThCc21mWW9MMXJDTDgwMHdmY0hVQk80V2NWV3VIVFJ2WjVuWUU0bU03NGJX?=
 =?utf-8?B?NWtDMDFDejlLVlJlNGcvSnJWRGdQTGJlSTVxdUFKTEJTOWxYMm8zbFR3Ny9r?=
 =?utf-8?B?cTJYS3BSLzVjV1l6cEVMaW5lTmE0VWhKN21nNDF3cHhHMjVvcXA2RkNpTWk3?=
 =?utf-8?B?RjVJS0xoeDRYYzlFSEVaNFJNajFWcUw0Q0lJWkNvT3hoQnRUeXNsdURVdm5v?=
 =?utf-8?B?c0dvTkVWK1phWTlqVXhUbUJjMWlXSVlicUxQS0hGSTJuMHdvNG1UT25XSEJu?=
 =?utf-8?B?a09BRTIycW5SZzJaM3IyZ2pTV0lHNTZVNkR2SHZpNGZ4bi8zdnkwQjRBMnYy?=
 =?utf-8?B?VDJHOXg3Q29uUGhBOXA0Mk13Snp3K2tLMXFMbHNDRkVFWDNMU3hlSDNhQmtO?=
 =?utf-8?B?bzVmSUJHNGkxUHVzUzNRNlV0Tk9UcDAvTVd5djZRU051elE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ujl1YjBOTEtDL1RYTmJBcEVaZzBkaEJJTXlob096RjBmUFhOSTFJNkFiR1oy?=
 =?utf-8?B?WW5WNG1vQ0h1UTQ5ZHJwelkwekhrVVNNZnUwaGU3bjBlNm1HcFQzWnRFRjcz?=
 =?utf-8?B?YkZrMWFTRE5WYlVEcGY1TTB2c3dIM3VIbkFUV3dmRDg2ZGY4TkJvVmxPdzdv?=
 =?utf-8?B?U3FaTURWQzZGRUZZR0UzcmdGSkhrdkpmSnVSRUVlMm40c0t5dEJlbFlQMCt4?=
 =?utf-8?B?NDdFMTVwWlV5OE1wQTVkbnNjcUUxUUpmWGlIc0NUQVhoTE9pTSs3QmFyN3Rn?=
 =?utf-8?B?NmtJU05JWVBnWTIzaUZWUHlLRlg5ZHlMdkJPOGJ0b3RlMUxyT0NheXRybXFM?=
 =?utf-8?B?SElUMmdQSk1lN09iMDdFZ1Z2SWhpK1pqcmE1M05Ba2RObDNsd3BpTW1hc2Fm?=
 =?utf-8?B?NjIvMWNtd3NNWXRDbVNGanBGRWxvWTZsajA1RFZram5OZ3NGdW52Ym5ZOThx?=
 =?utf-8?B?OTkyUWhkckpTZzV6Zk53VGhkV0x4dUFXcEpPRVBVcFVUQWlaR1JCZjZCck5s?=
 =?utf-8?B?bTZIK1ZFVzIxODliRWJFWnQ0ZVFqNnc2OE9XVTlGVU9TTVdLK01UMDZ3VWZE?=
 =?utf-8?B?eTZPZzJ3Z2JvUis5MUtzbHlIM1JTRkhEUW9hS1A1SVgzbklDSDJvcHptbExz?=
 =?utf-8?B?YVVkdmE2R3R0MWpPck9BbmZKaWQ5dlY0RytyK3BCRnVkbklqbGxSNFRTV21i?=
 =?utf-8?B?aklGSEtRZmdYVGM3ZUhuZWc5TXM0T00zcmhmVk9pVCtNZzBVcDcxakpPeTdB?=
 =?utf-8?B?OWczaHo3bWRYL0d4bWliZndyQXFGdG1Ma3ZsZ2dUaGFwUUFRSzM4Q2tkaFA5?=
 =?utf-8?B?RmZocnZkSWJiRWZxZk52NmhVbW9kOXgzT1JkSWE5STZFbHpHdFR4VStHNEl0?=
 =?utf-8?B?b1ArbjhBMzZnRnNIcFJYTm5UWk1zb0FJb3Z4VDVxZWZNWGFQU1duRkRqVE9P?=
 =?utf-8?B?UzB4aVNuWldDUlBqWkNJS2RUNWI3NmM3RmJ2RXFSc2gwejNBdE5sakhCdjh2?=
 =?utf-8?B?TXROam5SMm5MRVF2YkhQS2VJbkRIVExwayttdXYzUHJwMDVtZDVnMjNkTmdX?=
 =?utf-8?B?elFsOVZKd29sd2lGaVBIY0xiQk1NdEpUREtQWUZzOE9kSmNObnN0YjJ2ekpZ?=
 =?utf-8?B?blp5Nyt1aWhYZUdkK2xzTGhUdERRZTA1c0lKMVVPa3M0VDFMTEttOG91Nnoy?=
 =?utf-8?B?SmNWcG9SeVRxd3hhQk1jZFpFM0pIc3BuVExkcU1ETm85SUJjbkFXaVlpR2Mx?=
 =?utf-8?B?YW5XL0VuWTdrOVl2Mk1WM0lkYUZMV2MzWnhVTkZuVS9qVFpaekc1amJUMlNG?=
 =?utf-8?B?L3hZQ3M5OU4wZU96bFRtdVJjZFBaSVZjeFVEQVZZc2FhdmZCM2UvRmlpNDBW?=
 =?utf-8?B?RUdxT2Ria3RkcXhidmZsUHNaSytpZHhoa1pJV0tSQWFPVnVrR3h1RU9kemVv?=
 =?utf-8?B?ZUVsQXhuVnRaL1hpS3JpVTcxYmI2K0krSmxUam81eGpHWSs0d0dQZlJXaUhN?=
 =?utf-8?B?RUFTLzdrQURJWTl2WXhHVTloL3VXdTJrK0VrUzRBVVpRNndjUzAxZ1BjVTdi?=
 =?utf-8?B?THlpZzRlUzAyajRIRDNadERtL1BEeXJNOXZwZFlCbFV6UzhCbWZVNlFXU21V?=
 =?utf-8?B?VWJ4dHNyRnltU0M3N3pzK2NCRjBYbDViQlc1UTJ4RWkvOXdiWEMvdndHT3N0?=
 =?utf-8?B?N2hSeUJtNm94djRmWVg0TkdPakV2V09RYTlkTXlHRmt0TmFuUnp4OHdFcFVP?=
 =?utf-8?B?NDc0Nm1NTFlJdWp5TEZoK3E2NmpxM1FhNnBENHBDQ1p1L2RrSUVxSUg1OEF2?=
 =?utf-8?B?K2laditqVk9zaUZoWllJemlBMGpsUndieGpKb2Q0d096OHUxSDMxbkpSejJm?=
 =?utf-8?B?OHJ6czB4Ym55a3NhbjA3OUdjT0U2enpYdUR3bjBVcWxJQitpS2pJUFpWZ3g4?=
 =?utf-8?B?VmpHZHhVcDhtcE1nVHcwMzNYQUs5RE1ZZmsyRmhJbWFNV2swY1p3TjU5SnAx?=
 =?utf-8?B?eXd5bXNVNDNUczUxRGxrM1lZK2ZjTitWMVVRaWFYVWgwN0JJcytYN2w4N3d6?=
 =?utf-8?B?aWFqV2xzQlZrQTlIb09SZlNWUkpKY29nVEN0RXBPcHhYWHVUbXJKdStNZ0xS?=
 =?utf-8?Q?koVTtDDx5vIL7akn7rIB1pGRP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9f3cf3-7e26-4ee3-275c-08dda51d846d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 17:13:55.5114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IgFvasjs80cGFYgPId+Sbymk7pT77kmy53oNVkGSbfy08cw3PC2e5OkHFLGYAU+7pQ64yYMRlDjkKntploSb2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFCAFD069B8

Hi,

On 04/06/2025 18:43, Ayan Kumar Halder wrote:
> Hi all,
>
> This patch serie enables R52 support based on Luca's series.
> "[PATCH v6 0/6] First chunk for Arm R82 and MPU support".

I have submitted a v2 "[PATCH v2 0/3] Enable R52 support for the first 
chunk of MPU support" with all the comments addressed.

- Ayan


