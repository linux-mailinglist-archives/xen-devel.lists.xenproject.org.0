Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CC7A4DCDA
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 12:45:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900990.1308977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpQiT-000085-GS; Tue, 04 Mar 2025 11:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900990.1308977; Tue, 04 Mar 2025 11:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpQiT-00006V-DS; Tue, 04 Mar 2025 11:45:41 +0000
Received: by outflank-mailman (input) for mailman id 900990;
 Tue, 04 Mar 2025 11:45:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6XUS=VX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tpQiR-00006P-Qr
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 11:45:39 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20623.outbound.protection.outlook.com
 [2a01:111:f403:2414::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ffb701c-f8ee-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 12:45:37 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SA1PR12MB6948.namprd12.prod.outlook.com (2603:10b6:806:24f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 11:45:32 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 11:45:32 +0000
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
X-Inumbo-ID: 2ffb701c-f8ee-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xh4yIaq2Z5w0MHlHdI67jJghbCzkH4GI7AyOIIHQOuEzmoIFmF30DGnHk+I+hSODYbBMCs/v8PudtB47Mn2YF460GnzVHwZA4o9ruESoSN3rHGmChsUrueLljqPK/G6t8Fh6DqX74NtPWebf4ovai0kYU/e+3sNmOJCoGiW6VzxJdcrJYbHrpHO4AyUSTCRzQHVnFz6O/CdwckfwkOJzJcyUTVvDmrQcuYOh+LM0/HlZbOwveG6vppCRGI/GRl3u544MHttltYIJrdWzkQZIN2LiObkWfyGaDnPZt37E/Bh7EDDAHv99V+eN5O7R/4qdL2f6LToDcPCmCB9ufK1Dvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBf5dfSNv4haGLrdFBz0CAO56vB1op5Fg1Ba6OiNZzA=;
 b=jyzod3DhIWPD+d+YJVTyKASXiYPZoM2FqSUu8NQqO41s5WP+ljVwPfCE8Fec7RTSPeLm/Artrl6mvgXGOhHNIDSmJw2/+T5dZayJJD/El8dFAp9eb+kUGindJDCh0LwNu6pG91vgYxBcflTWe7fTYBeNrT12YtwW9T+igDF/M9ISZOBwHsw7V8CU+iBLZfmAwGY/g78YFglPdSmali732qby+r2H9HW2vhStpt4d2BaAoQByZfqMj1SjH8shXarl7Qv5IFZmgWR/2u/pE02ZpDpml9mNHwO8q6ARqYoplnzRlxOFpVyh+saKMPiqW0Aq+Q4srRb9rHB8rdkmWPu+ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBf5dfSNv4haGLrdFBz0CAO56vB1op5Fg1Ba6OiNZzA=;
 b=XpSeCoLczMf396RiMwTskyTA82UAe/kntX2f5cupyEL23xJCDjKkCCce1eh8Ort36MeK59zbDsfn8cwwxCVp0zJUqvlP9tJq+cp1TA80GaDhAXYyp0eG5K2cmGvWGSaYXYcat8XW6E60JQ0vu7KN1V1pbsunRlM1uN9ibqtmkvI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <37f6cadf-005f-425e-8aa7-45a947dbbc5a@amd.com>
Date: Tue, 4 Mar 2025 11:45:27 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] arm/mpu: Provide a constructor for pr_t type
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250228161817.3342443-1-luca.fancellu@arm.com>
 <20250228161817.3342443-7-luca.fancellu@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20250228161817.3342443-7-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0022.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::27) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SA1PR12MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bedff34-b95d-4511-d30d-08dd5b121183
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QW9lSC84ZitNUWlPRzlMRG5GMTRad1ZFVTgvYnlVY3huVFlMSnp3SUFWR0tj?=
 =?utf-8?B?Y1BjejhaN2RjYXpxVG12RjFaV283VnRiUUZBL3FCT3Vhd3daK2FDMTh2ZVY1?=
 =?utf-8?B?V092QUNydkdTVjVxM0oxVmFnS0Q1Z1RWd2FPVHdqTUxubk01c1I3WGJSYTZl?=
 =?utf-8?B?WnhFeUo0eHhpanFPWmFjQlRndzRHVWJBdlRreFVDVE9XRUZMaURtZU1kQTVs?=
 =?utf-8?B?UHV2UkdxUUVobVVXZFBPV3RRNURCeFgrN0U5VWtheWRyb3Vrc0hsaFFKSVBS?=
 =?utf-8?B?YkNOMS9GSkJVNXRZYXJjRkJLY3NZWTdLWDBzdzBUZWFhZk4xckpML2JpcExq?=
 =?utf-8?B?bDhMdzRaSzVxQ0p6NkpsNXM3R2Z2RGhQVXZnMGVOY1c5bjVTSGlRaDl3UFpN?=
 =?utf-8?B?STZjV2ZWdTlCaWFzcEhEdXZSUHNyaTRPcEFXWkM5Nmw0eUxMTHd0SitkN0Nv?=
 =?utf-8?B?dG5KTTdYOUF1VmtOZTFTRlFKaEcvdU9lalJvOTJuOElFamh3ZHREZnFGNmpO?=
 =?utf-8?B?V1Z1aVgyY0xKUHQ5d09wQUs4eG5JZjRlcTgwazlVQU5JL0dHbDF6eEo1eEEy?=
 =?utf-8?B?WnhDd2NZNVhMRTh0VExVNXIrQmwxb0lqNFJQZmYwcC9sUk9jalczMzA0OGV2?=
 =?utf-8?B?RUpEckNBeVFrY09tbkowUjFHOVpUM1VCUnc2VVh6bE16VDB0VC9DUllNalN6?=
 =?utf-8?B?VDdtZkNXZTUzRlZjZTNIUE9zbHZUdjFYVzV1NU45endLYnJRWjdWdTBpWWN4?=
 =?utf-8?B?QnNyVzdqeGJuaTJ1V3VRem5zdW04ZmVyM0ZJRSsxVHI1T05QOWFXdS9jbzVS?=
 =?utf-8?B?MjZjbEhYSWl0OVQrREwzbFlpaXZiaEk3enE5QTJhWkFKUnpYc3BJTFZyRmdv?=
 =?utf-8?B?U1h5MFJEV1hZVFpPQStBc0hmZWowaDZZRmZGSHMwWkVCWDN4OGVqSUExUHZ0?=
 =?utf-8?B?QTdEMkFVWVJvNS8yY1NIQmZubjE5T2pFYlpZL0xWNFlNYmlXa3RTREJyYzBI?=
 =?utf-8?B?a2NiMXhIQlluOHB0WjU2d2NXNTE0VUI2Z0hxaXV2bTNNcEgraDRKMzhqaDlW?=
 =?utf-8?B?a2g2amtpTVBSUEJHWUU1MmVWL1VGVm1ibStNU2pJS1c2eWFiYmZrL01zZEdk?=
 =?utf-8?B?TnRtNWxlZm12d3pHUVNYMkFsN0hqaDlYcmcwQkZVMFJraU15NGdKVk1ibXRB?=
 =?utf-8?B?b3BQY1Foc2wvMm9hM2phTlB1S2FVbUYyZWZiS3dwN1pXZzZPTzZlUkJXeS93?=
 =?utf-8?B?dS84TzdQTGN0ZUtUQXFFalhkZVdyVFo2aXdlSTE2VnJrSTMvbmZsREh6VTN4?=
 =?utf-8?B?WDZpRnZJSWxMd2NaMjVCZkZWRFMxYjFhWFJSTzRFaHRVeE8rSUdDYW8rRnRS?=
 =?utf-8?B?UDczWUx1eUZkRWc2eXZMd2NzeDJ2MVNlYWhTdjlCRDI3QUtKd1VkaXJPTXJs?=
 =?utf-8?B?VlpmckFVeGxQZk1UWVpoNjB4RzlJbngyc2JLbFM4YUVReTc2VzdBSDZkdE0y?=
 =?utf-8?B?RlhiKzdWczZyL29FaXZlRnAvQkwrTEpPVkhONGdBN05EUHY3TmVObjEvVjdU?=
 =?utf-8?B?dnJXYnQ2VjIwcVRVTUFrNzlJNmlYYXBSbmV3dTlzNXpYc0NMMkZSb2JVSDJQ?=
 =?utf-8?B?WVJ3VzVZZGlZa3FmSUNCbU92M2NSc3pBZ1ljcElwQkhVUXFMYTBBK0lGa3dh?=
 =?utf-8?B?STEzVzhla3ZtLzNGSHZDQW0zNFNHRVBHU0RtK1JlT1R2bC9VeFF1RGY2dlgx?=
 =?utf-8?B?Y25OdkxDekpGZ2Nhbmt0enh3c3NlR3FobksyR2dzVmRJK1FpREJTSXlzN0hR?=
 =?utf-8?B?RmhuSjA1aDM1R3kxZCtKRmV3QkNmVnNWR1haeHRibGFTM3FOSlFBZTdZRUR3?=
 =?utf-8?Q?k9wqXxNFMPQGZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTNQTzBtWjdUdmQ4eitBNE9seXd5c29YUFRpcmN2Ukc3THMwSEkwWG5adzZC?=
 =?utf-8?B?by9ia0RhOHh6ZmNmak1qTUgwcjVPRkgzS1IxUExQYmh6QWNVUDd3c3lTZVpn?=
 =?utf-8?B?RWl2MDhsWHRBaWFqSEt6cmZHeTFLU2J2eW9aYmhaeVJlZlFFZE1EL3RDMXF3?=
 =?utf-8?B?RVBoTE5LcGF0N1h5SEJlYWVWSk9DUXduYmQ3azVJQlBMUi9sTmtuR1owcmZ6?=
 =?utf-8?B?NUx2eTJ1Vk1naStFYmZuQkdOTzcyamN0Mk1WNU5zK0YxRk1rUVpTNW1EQUFx?=
 =?utf-8?B?dEt3UkcxWHhKdHJ3cjk2TVBHN283cEc5VkVUejJoVG9qdXhOVXlacGk5OWdw?=
 =?utf-8?B?TzRvV1lHMm9adTIzTXFUSW9hV1NPcHVjRzU2YTNrVmJvOFpuMGpOakNRSmpB?=
 =?utf-8?B?YmZ5YkVZazBLbkxGd0VINmpJaDFnVVEzTTVXK2ZHOStuSDN3L2d2VW9ldG5k?=
 =?utf-8?B?SitvaGdSYnkwNE9QdnJIWm5IS3hUTmc2UDFQNThjdHkwaGFJSlpvTGkrTnh3?=
 =?utf-8?B?blVPOHdmMG1ydmlnVXpTS1ptLzFEakt1cGxNdllzSUJ1MS9OS3VMSENlN2Fy?=
 =?utf-8?B?SjhaWE9TcHErTXpsUGlGOTV6YTBveFo4RHk3WmlUVzdLWGovWGxLVUU3aFZm?=
 =?utf-8?B?K2pFZ1pFRVZsUmtlbUsrZXVBQTdFMWhiMVUxNE9Bdy9wVVBSTGtKQS9lR0Vl?=
 =?utf-8?B?dGg5RHhKRVAzTEhjMUV2cFJxTkFZdlg2R3ErczhmbjdUMElKdzZ2NzRlaXNx?=
 =?utf-8?B?Q2hoUjZJMXdmc082eDVRODRPZ0x6Q1FPV09TVitWcHBWcE9kL3JBUlZsUGs1?=
 =?utf-8?B?ZjBkUWdPckNTM3I3dzZpZi93NGZUQXFZRENHdHIzalh4eDNWTWl3SzByWTU5?=
 =?utf-8?B?RlJFdGVISDZBNDZucHVTNU9GT1FGT2xQK3RzZlVYUnRROFUrcEFGd2JDNHBV?=
 =?utf-8?B?aTdvZTUwZ2tBc3l5eUU4Nk14S2orcSsxaVA4MXk5Y08zVEFNWXBySUE0dFRn?=
 =?utf-8?B?cGJNNzdOR0krVEU1VURZTVRRWTNZUUMrdzZ2M2JYUXdhL0FocUlHRzZ5TitV?=
 =?utf-8?B?OEdaZS9BcjJTZWxQVGV0QXpCekFrRzYzbk1IQyt3UXB6OGhzelNxdW5JRGFP?=
 =?utf-8?B?bG5Dbng2SVdZR01MTTIzRnk3QWEyYjYvdlA4bnRiZ0xsTE90TmhpQTRDZlMv?=
 =?utf-8?B?di9qamcvMkp1T3BGYXdLUVhKTGs5VGloZXpUUUdNU1FCZlRZeVRSNzcwRFo1?=
 =?utf-8?B?d1JlQVhTYVczSlRNSmVYazd5SkNQekNwYkhXZWl0QjlmSjBuWmRCbjVFSm9C?=
 =?utf-8?B?TnhZcFg1RHErekdVZjVjZkFlTG5FWDZLQ3RoYUg4TkRGWG5Zejk5eFNOemJm?=
 =?utf-8?B?TyszdHhZdWg5SXoxMk1tKy9KdFk4eXlBNnk0ZWhRYlRsWFFkS0Q3aVJBVUY1?=
 =?utf-8?B?V2libnlQM0hrRG5aeDdHTHA3OWlUdGppd3RHTXo5VVZvN0lwNHgweEc2RlNn?=
 =?utf-8?B?cU90a1cwRzFpbTV3TnB2WHZyU3JLMnVDc1F0T0VVQW11MjZJaXNXYTJlaXhx?=
 =?utf-8?B?bUdwa0MyNG13N3ZVQmFWTGJBeUpuODVlQlF2MmxxM2VpSEV2dEtaS1BDbXdz?=
 =?utf-8?B?bmlFY1IwZWJ2L1RTKytxSjhVWDl6ZXhkNFArYU1zb3hJdEU5S0xSTkw0MmFY?=
 =?utf-8?B?MUpyUzJxZGQ2Ni8wWE1zOUxLbDZjam9XVTZDbHErdEd4MFozeUJIeTJVRnlw?=
 =?utf-8?B?ZHRTVGpkRy9oVEFONm1ZaWhSNllvTTk5U1JFTE01VzZqanNsZ1RBYTkyVEls?=
 =?utf-8?B?MFBJaldFVVJiK1dJWTdveitZZVBtSzI5QU9GeDROMW5xZTNvKzhoeThlcUcw?=
 =?utf-8?B?enYvZm95bHF4UmhPSld5S0lQVDNIMmMvWVFRQ0QyNmNGYnBiSUdsNFR6WDZp?=
 =?utf-8?B?WEJLdnNSL1VMOEdUNElHZVU5a2ZDVGhmaXRWODdySlpSTml4Y2dsd0tqelMr?=
 =?utf-8?B?OWdBMmRxQlYxTkNhcm8wNCsrUGx0ZmhzNUJqZVN2eW8xRnU1RlBWM1NtMGpI?=
 =?utf-8?B?SHB2K2FhQndpTndZaUsxWi9paVp3LzRtQzZaQ2Vrd0Vnd080U0FFR1p5eEpY?=
 =?utf-8?Q?2lQ6SO6mtY/z3zxWLOote88x2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bedff34-b95d-4511-d30d-08dd5b121183
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 11:45:32.0589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0lwXtwQ7gligQIR19DWYMDg0XjPGDikLkIdLNraQPt+E3A7Cer11czt7K/oJ2Ekxvq6y62Dcd9CQm7eDmL21w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6948

Hi Luca,

On 28/02/2025 16:18, Luca Fancellu wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Provide a function that creates a pr_t object from a memory
> range and some attributes.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/include/asm/arm64/mpu.h | 15 ++++++
>   xen/arch/arm/include/asm/mpu/mm.h    |  3 ++
>   xen/arch/arm/mpu/mm.c                | 73 ++++++++++++++++++++++++++++
>   3 files changed, 91 insertions(+)
>
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index 3a09339818a0..dce77da60110 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -17,6 +17,21 @@
>
>   #define MAX_MPU_REGIONS         NUM_MPU_REGIONS_MASK
>
> +/* Access permission attributes. */
> +/* Read/Write at EL2, No Access at EL1/EL0. */
> +#define AP_RW_EL2 0x0
This is common as well between arm64 and arm32.
> +
> +/*
> + * Excute never.
> + * Stage 1 EL2 translation regime.
> + * XN[1] determines whether execution of the instruction fetched from the MPU
> + * memory region is permitted.
> + * Stage 2 EL1/EL0 translation regime.
> + * XN[0] determines whether execution of the instruction fetched from the MPU
> + * memory region is permitted.
> + */
> +#define XN_ENABLED     0x2

This seems incorrect.

As per ARM DDI 0600A.d ID120821, G1.3.19 PRBAR<n>_EL2 (armv8 R64 supplement)

0b00 Execution of instructions fetched from the region is permitted.

0b01 Execution of instructions fetched from the region is not permitted.

This holds true for 32-bit as well (except for the fact that XN is 
denoted by 1-bit).

So the correct definition is

#define XN_ENABLED     0x0

And this is common between arm32/64 , thus it can be moved to common file as well.

> +
>   #ifndef __ASSEMBLY__
>
>   /* Protection Region Base Address Register */
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index 1287a0f625b5..e234f6c26193 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -44,6 +44,9 @@ extern void read_protection_region(pr_t *pr_read, uint8_t sel);
>   /* Writes the MPU region with index 'sel' to the HW */
>   extern void write_protection_region(const pr_t *pr_write, uint8_t sel);
>
> +/* Creates a pr_t entry for the MPU data structure */
> +extern pr_t pr_of_xenaddr(paddr_t base, paddr_t limit, unsigned attr);
> +
>   #endif /* __ARM_MPU_MM__ */
>
>   /*
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index bb8e0c546e7b..fb94f5d1d93d 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -9,6 +9,7 @@
>    */
>
>   #include <asm/mpu/mm.h>
> +#include <asm/page.h>
>   #include <asm/sysregs.h>
>
>   /* EL2 Xen MPU memory region mapping table. */
> @@ -141,6 +142,78 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel)
>       }
>   }
>
> +/*
> + * Standard entry for building up the structure of MPU memory region(pr_t).
> + * It is equivalent to mfn_to_xen_entry in MMU system.
> + * Base and limit refer to exclusive range [start, limit].
> + */
> +pr_t pr_of_xenaddr(paddr_t base, paddr_t limit, unsigned attr)
> +{
> +    prbar_t prbar;
> +    prlar_t prlar;
> +    pr_t region;
> +
> +    /* Build up value for PRBAR_EL2. */
> +    prbar = (prbar_t) {
> +        .reg = {
> +            .ap = AP_RW_EL2,  /* Read/Write at EL2, no access at EL1/EL0. */
> +            .xn = XN_ENABLED, /* No need to execute outside .text */
> +        }};
> +
> +    switch ( attr )
> +    {
> +    case MT_NORMAL_NC:
> +        /*
> +         * ARM ARM: Overlaying the shareability attribute (DDI
> +         * 0406C.b B3-1376 to 1377)
> +         *
> +         * A memory region with a resultant memory type attribute of normal,
> +         * and a resultant cacheability attribute of Inner non-cacheable,
> +         * outer non-cacheable, must have a resultant shareability attribute
> +         * of outer shareable, otherwise shareability is UNPREDICTABLE.
> +         *
> +         * On ARMv8 sharability is ignored and explicitly treated as outer
> +         * shareable for normal inner non-cacheable, outer non-cacheable.
> +         */
> +        prbar.reg.sh = LPAE_SH_OUTER;
> +        break;
> +    case MT_DEVICE_nGnRnE:
> +    case MT_DEVICE_nGnRE:
> +        /*
> +         * Shareability is ignored for non-normal memory, Outer is as
> +         * good as anything.
> +         *
> +         * On ARMv8 sharability is ignored and explicitly treated as outer
> +         * shareable for any device memory type.
> +         */
> +        prbar.reg.sh = LPAE_SH_OUTER;
> +        break;
> +    default:
> +        /* Xen mappings are SMP coherent */
> +        prbar.reg.sh = LPAE_SH_INNER;
> +    }
> +
> +    /* Build up value for PRLAR_EL2. */
> +    prlar = (prlar_t) {
> +        .reg = {
> +            .ns = 0,        /* Hyp mode is in secure world */
> +            .ai = attr,
> +            .en = 1,        /* Region enabled */
> +        }};
> +
> +    /* Build up MPU memory region. */
> +    region = (pr_t) {
> +        .prbar = prbar,
> +        .prlar = prlar,
> +    };
> +
> +    /* Set base address and limit address. */
> +    pr_set_base(&region, base);
> +    pr_set_limit(&region, limit);
> +
> +    return region;
> +}
> +
- Ayan
>   /*
>    * Local variables:
>    * mode: C
> --
> 2.34.1
>
>

