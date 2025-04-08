Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FA2A80C5F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 15:33:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942112.1341392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u294Q-0007OF-Pl; Tue, 08 Apr 2025 13:32:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942112.1341392; Tue, 08 Apr 2025 13:32:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u294Q-0007MW-Lj; Tue, 08 Apr 2025 13:32:54 +0000
Received: by outflank-mailman (input) for mailman id 942112;
 Tue, 08 Apr 2025 13:32:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=23Rw=W2=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u294O-0007MQ-KF
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 13:32:52 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20631.outbound.protection.outlook.com
 [2a01:111:f403:2009::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f50cc7b7-147d-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 15:32:47 +0200 (CEST)
Received: from MW4PR12MB7334.namprd12.prod.outlook.com (2603:10b6:303:219::21)
 by IA1PR12MB9465.namprd12.prod.outlook.com (2603:10b6:208:593::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Tue, 8 Apr
 2025 13:32:43 +0000
Received: from MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8]) by MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8%3]) with mapi id 15.20.8606.028; Tue, 8 Apr 2025
 13:32:43 +0000
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
X-Inumbo-ID: f50cc7b7-147d-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TImPp3t8GTzsmLF8vvGHziD2ZMdOlKeLcneRs2cyfjt99Zvbp/5dLes66pLfNmfaeFct5znaTxRYnSrl2FmeNzppkodSGBHqw+SGwWECLvH7YfX643oA76g7nlKLgmBsxrNkm6IkiHVdCQ2E+61jIxxj9RU8PhFBUPabbr+YBpC5VuHAGMTG3+X6xnJB+OwrMcSvOS5NHyNkMrVk1mOjbDP0lVaJM8V4av9pROrHtQjJSwSLOgMoQYp6criOiMR8ywvaDP5MdtLPM/2M6SOs2CKb3+HfCFNbKKlNuTBKqM0Iv4ncUelQ5R9NnI1F7donynDMnY13kPPS+ICDnNvEiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ovz1kL9uMFYdJIeklY8U5I6Lw46F+90lnw4iMlcW7JY=;
 b=LTWGTPbvIxrvoXYuoYL1+67Mi+lMeMKbBQA0bmKjky1P+wGshJqW/JWIiNch6y1vnwTWp8WC4aFgf/L654+/3ZYNdOQFTV3M0MAP3IUxq8yWSOr35xPRvFvRONaTs0XDyI08oQb7T5jw8m6aigAp5XCQL+whUpVK9DdUdXFKQyJQavCzUwiH0gMueG1DQiulm1j2YSSMQ/yI+HOps+sa3kAi1wX8AcQ+tIJ0Ad/22anrCgMzHA2s3Eliw/higCTL2CauBRWfOfY0+hlKCPxAWtoTjSbyyMW4OkTM0TS9TdDFyIdXkXJydvcd5P4Z9XfRtDE0I4VAcS/YAgbZSQDiQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ovz1kL9uMFYdJIeklY8U5I6Lw46F+90lnw4iMlcW7JY=;
 b=FtaWzGWxFMnZrfnqeQaH1p21Wm9XsgXulyDn2z2UWvT/FIzhw6c05oavK4UpmQT0SnzoIRwFbhWxBrYtEakOZPX4ovvqlc3xWPPmsoivxuBTv5bAgNvmXeX/arscUEbEng5v5Y2Fclf9NEzOlwZr8wXOl8itEoEj360PU4Gtpb4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d6c12013-235a-405f-a87f-529648d6f340@amd.com>
Date: Tue, 8 Apr 2025 14:32:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm/mpu: Implement setup_mpu for MPU system
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250407091430.2342709-1-luca.fancellu@arm.com>
 <20250407091430.2342709-8-luca.fancellu@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20250407091430.2342709-8-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0085.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::25) To SN7PR12MB7322.namprd12.prod.outlook.com
 (2603:10b6:806:299::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB7334:EE_|IA1PR12MB9465:EE_
X-MS-Office365-Filtering-Correlation-Id: 58afeee5-b982-45a7-08f3-08dd76a1d6cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RThiL1Nmc3BhQzdGQWRBYlBmbXZYSDdOOWE4dGpZVEN3VUhZemF4SSttSzF3?=
 =?utf-8?B?ZXMvKzQvdFdpVkZ0Y1BqVWpQZDRUNzFtV29xZGVOQVFsRXNoOTZHV2dJTDNn?=
 =?utf-8?B?NTQ3SVVjb1BzbkZKWDFnc3J5YjhhQzNMK3Nvb2ltMjhzTzZ1RG0xY053cysr?=
 =?utf-8?B?dUpPMU44eE5NMkpBTHd0RFE3dVFTMW1ycHpPL090d1VKMEUwT2o1eXAvQzJz?=
 =?utf-8?B?aU1wdFJDWTdMYWNOTG5vMDhqZFRQcE5Sem5SdjBuZVRySEwxaXF2S1hJUmlL?=
 =?utf-8?B?K0RYWW9KRkZVSUJPZHJhL01pNU5vbjFXMkhnRDV6V0twcXQraUZlRGQ3Wnpp?=
 =?utf-8?B?ZTVUVnlFTHpmUVhjQlROSng1THd3N1VXSjBrbVJYNXNEVjhJaHRabFNhbnky?=
 =?utf-8?B?bGJiODJqaHVZYmNGazQ0bTN6VjVWQ0JEZVZkMDloVjk5b3RleGNSbHpiN2Vn?=
 =?utf-8?B?NkdkWXpmbnNLSkhxbDNzRGZqZDY4M0xQOEUzQjJQSXk0cUVTNks5UnFJSDZt?=
 =?utf-8?B?WlJjMjlleEhRNjdXclJwdXIvZzg3aVVmVHpvYWJUbXVmK2RMSktwc2FxSWhX?=
 =?utf-8?B?cDJjbUtzbDFZTUJXL1ozWU5xS2RDeEdSZGNqZjhiWFpyWDZ0UEtNL2djeWdK?=
 =?utf-8?B?NHhleCtSV3JCZlhqemxPMk5IMG83a1RkU0VrMlhDMGhQQXRUY1dWMzEwektz?=
 =?utf-8?B?Y3ZnbjFvanBJLzlBUFdSaEl3SVNKVmNzRmRCbVFwVmIxN3l2NWlVb1ArbU1Q?=
 =?utf-8?B?Q2MyUzV2UWhma3NTMHkzMzhpVXVTelZmQVlXWElJVjB6YmlBaDhQeUVXTXpF?=
 =?utf-8?B?dlBPU1BvckExbjF5Qm5pTW9iSXArUzIwSzEvSjBPdS8rdG0vc3dTZTZYTnBW?=
 =?utf-8?B?QXVUTC94R3BOb0pnaDJrcWNCckdIYWkyNTA1NU5xWGlpcmtZT1ZBSStZZnN1?=
 =?utf-8?B?c0RZekhGakU2UWZoeWJiME0wUE53NVFUaTVQMDFPSlZEU0xmam9vR29nbUNH?=
 =?utf-8?B?cm14Mk02cHNUTWZMRTBZNG91N0ZKSTR2dDFQOStYRzcza2VOYlVlZ2c1c0pr?=
 =?utf-8?B?bk1ONW1CQkxPUDJOSG9wU1lhWk1leDRxVEx0dWtBN2VKVDZTck93Y2hORm1P?=
 =?utf-8?B?Y2Roajl0Q1lQNjlncW1KaU1tYTF3WUlKT3h0UVg2OHIrazVJZWRsa0pPR2kr?=
 =?utf-8?B?UzdVY1VBdVZVL0xtY3ZuaGZUYjJiWS9PQzRSSzRUa3RNQzZIT0E1ZnBQUy9X?=
 =?utf-8?B?UldaQ01Ndjk4alk2dWRLZU9Hbm94NTZERmdIaFRady8zMU51c0EzVjNYakJR?=
 =?utf-8?B?SEZQZHU2UWVZdEhWR1FoWHo5SWJST1NQNkNJOFlFUzk5UVF4Ymp0SWVmUHFC?=
 =?utf-8?B?VkY5cVBWN2RiMXBvOTd6SjJOUmJNdGhOa2cxK0xWMnBSNVZIT281dUIzWHFu?=
 =?utf-8?B?UlZleFV0WWxxT2JsWmMzaEVNRHNJd0dzOWFpTTVLTURhZUJRRDJWeUFUYXQ4?=
 =?utf-8?B?VTFwa1NuZ3lZRlpJRlV1OEhSV00yUmkxTVRFV3dSaVJhWStYZzJSTUNWVUlI?=
 =?utf-8?B?c3ExckdkaUpBUXVGeWh1ekk5dEhQa2E4aHcvZ1QvYzROTFB1Ykt1cERqb0dF?=
 =?utf-8?B?OFFWeERBVjlLLzY1L2pEd0Rtdjg5VWE1enVzSzlIK2RCV242MEdFaytvcDlZ?=
 =?utf-8?B?TU1sWFk2Q0Z6UGpzOFpOSzZ6QVVsNlZueXdIdjkyMVVOODI2anRwSEFpYThB?=
 =?utf-8?B?MTk1dE1Mb25EdlVmeXNnaEFtaC91SjQ4c3o1TXdCWU56Q3A1ZGczRUpkOVNi?=
 =?utf-8?B?VjhhWU1mU2lWejhxN1l4OWNkOFdkRXhMck5hVmZKSndVVVJFT3BaVERZRHVu?=
 =?utf-8?Q?JiraGHL97epKc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB7334.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eStWSkM1WTNpdzhKSmw0OFpoalBFeWhKKzRxRTMwelNSUUpzbWxsb0x0WW5y?=
 =?utf-8?B?b3NldWgwMjZ3ZXJUbFlraitVais4dVBSWmRDQWFydFYza3FoUk9kaEU0Ui9j?=
 =?utf-8?B?Qzl1TkwrSTdPaTFNNXpzanljbjNwazBsOVdHbXN3bjVDV0tBaHRhVlBnazRN?=
 =?utf-8?B?UFNUMXRVcjBLNkkvTVozSkt1U2h0NlZMTzdDbldhWXRBZjRSUWVNTGhrMlBi?=
 =?utf-8?B?NUM0OWZtS3RFSGUvZVdIeUEvOSszSnduclpjSzZtcE9TTmIzclFna1J3eHJk?=
 =?utf-8?B?dndma05TMSt3VDFWRmJYS09WYXBkT1RBbjE1R0VYdDNSUDZKTmRLY3hNRWts?=
 =?utf-8?B?Yzd1a1lTWXFjK29DbzdpTm4zancwcmlheXlOdnBMNk1wQndGUnpXTmRNWGpX?=
 =?utf-8?B?UkEyeUc0aGpaM043aDcvd3FlWDFHeFh1RFluMDE5bXhCNkgrRlNsanR1QjdW?=
 =?utf-8?B?ZmtMZjhiSTlWbndDNDhUMFN6cU1lcEdVSE1iQkhlTUlnWTZHUHlieVJuc3NJ?=
 =?utf-8?B?QndmNFNpMkhBdHN1YmxMVXhTbWdiQnN5bjZuN01XZW1iVy8vNGlEb0FYTkhL?=
 =?utf-8?B?djl6NlFFakE5cVV3YXl6Z2U0TlU3bklTWXpCK3U5eTNta3ZhSmVrdTVVVGpy?=
 =?utf-8?B?d01yK01iTzMzTFRVU1dTTjVLT3FmeXlNL2xKeDg3d3JTVEhOdjVyOGlOYSt4?=
 =?utf-8?B?aStUMVpTS1MrbGF3TG41VUdjY1JCWU1SSmg3Q0t4Tyt5Wk5XU1FoM1BzWnJT?=
 =?utf-8?B?dDBPK09TSmtTTE9IbUhUTlZLZXNQQW9pT0pUdHNWangvM3JtY29MYzJFTm83?=
 =?utf-8?B?cDJtZ2dZOHdMbEo2eFQ0VGRLdk43TEtLNDJvTVhDajZ3dFpaYjZOVDlLZHRP?=
 =?utf-8?B?UXhsU2dmdDk1MUIxenAxS1RVL2Z4bFUvNlN1OG1aNFMxK25qc2JPMVZLaCtO?=
 =?utf-8?B?WS9OVzM1RDU1NkR0UTZQU2M0Q1pJNGUzekF4ajdoSkg2SEFRZXQxckw2QzZa?=
 =?utf-8?B?Y2hvMVBTVXlzZEVvZkRXYXpFQnIyUWhpaEdIZEpBU25MN0xmN29ZTkFpelFD?=
 =?utf-8?B?dXZsRGV1WVFpdzhhV0ZCQ01rSVlYSFVLNUdqM3FvSTVaUG0yaHA1WDRUakhU?=
 =?utf-8?B?bUI1b21QcDZmQy9rRDNNbjN6VEJpa3BFMTM4cFV0b2g3MlBnZk9wOXowMlZY?=
 =?utf-8?B?eUNOTGw5bXdWL0xsSGJ2cWFvNmNoNmgyQzFOd20wUWVGSXQwSzhOdVA0T25K?=
 =?utf-8?B?aDBKM1BIYld0Z0pEemd2SDEzaUVySzlRbGwwMUFpUjRwTWtST3lkMUJPb1RR?=
 =?utf-8?B?WlVMcWpOZnY1YitrdUh6N1BxNnZwL3EwZ2VoZnJjQ3FCTktmclk4cEhteGpI?=
 =?utf-8?B?L3NhZ3hHYUFWWDhXdDFwNEpYVmlWVWVaaDFZcnVRcEk5NFFCdVA5cVFuT2R5?=
 =?utf-8?B?YVFwalBVQXBkS1NoZG01NVpSKzgzVUFiMmlXSG5aSXVSNVVDdEo1VkZXeS91?=
 =?utf-8?B?OWk4V1B0RFhKK3FwK1ZEWWFlcjdJUWZqUVFrdmhQUlk1Um1yc2xzTk5LZWRJ?=
 =?utf-8?B?WE0raGZOaW5iSlJyeXpVcnZLWEZlazF4Wk1IK0xBUkpZWlEyTEFvdDNHcVVt?=
 =?utf-8?B?SG40cXY1WkJHZ29LWlFmVVNKQ1ZZTnVKNC9EcSs3UVdYZlFOcUxSNndTOU82?=
 =?utf-8?B?bW5Ba3A2UWUxZUI4K2NMenR2YnhZN2xFekgxYkRkZnI0ZE5yOHRlNk53VDRL?=
 =?utf-8?B?OHRzTEVMckFEaFNIMnJBb1JzRXZISmNNdDNEcHNlVUNnRS9OWjVDRWlDcWxG?=
 =?utf-8?B?cE4vRGZTNnlqMmNWejUrY1k2aE9vc3JOUEl4TGtwUDNPSWdnNGE2YlJtSTN6?=
 =?utf-8?B?Y1lObjNDZjhiYXNPRU1aNk8zcExKbzVUUnBWTkVhU0tEOTg5TGYzZGdjM1F2?=
 =?utf-8?B?WEFYK3h6dXhZZktNQWRmeWFoaW55QTdiK2NaVHlYN1VDaGg2YVNjOGRScVYx?=
 =?utf-8?B?OHhGVUhpUnBrc0k0NlJQU2dOYUt3OFIxeXB3Ull5N2VOdy9obUx2UU05RW1o?=
 =?utf-8?B?N2h2c25ERnZZVCtWTXJubW9NS2htVEJ3ejZEd3Z1Tjd6K3FqSGptejJPL0JI?=
 =?utf-8?Q?T3GLAl1tEhAaA/EQLpN2d8+5r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58afeee5-b982-45a7-08f3-08dd76a1d6cd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7322.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 13:32:43.5116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: byPaWa5rQL+cTjEhf4GsjP2YTo8B9iFwJvefAtclb9FXHvMhFnzsA/AWSiJfea5pRoQB5Bmm1KrlfZXncYbGmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9465

Hi Luca,

On 07/04/2025 10:14, Luca Fancellu wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Implement the function setup_mpu that will logically track the MPU
> regions defined by hardware registers, start introducing data
> structures and functions to track the status from the C world.
>
> The xen_mpumap_mask bitmap is used to track which MPU region are
> enabled at runtime.
>
> This function is called from setup_mm() which full implementation
> will be provided in a later stage.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/include/asm/arm64/mpu.h |  2 ++
>   xen/arch/arm/mpu/mm.c                | 49 +++++++++++++++++++++++++++-
>   2 files changed, 50 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index 7cf8d355a1af..ff5a957bf085 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -6,6 +6,8 @@
>   #ifndef __ARM_ARM64_MPU_H__
>   #define __ARM_ARM64_MPU_H__
>
> +#define PRENR_MASK  GENMASK(31, 0)
This can be moved to xen/arch/arm/include/asm/mpu.h
> +
>   /*
>    * Excute never.
>    * Stage 1 EL2 translation regime.
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 2c5820a44f13..fe05c8097155 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -14,6 +14,17 @@
>
>   struct page_info *frame_table;
>
> +/* Maximum number of supported MPU memory regions by the EL2 MPU. */
> +uint8_t __ro_after_init max_xen_mpumap;
> +
> +/*
> + * Bitmap xen_mpumap_mask is to record the usage of EL2 MPU memory regions.
> + * Bit 0 represents MPU memory region 0, bit 1 represents MPU memory
> + * region 1, ..., and so on.
> + * If a MPU memory region gets enabled, set the according bit to 1.
> + */
> +DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGIONS);
> +
>   /* EL2 Xen MPU memory region mapping table. */
>   pr_t xen_mpumap[MAX_MPU_REGIONS];
>
> @@ -224,9 +235,45 @@ pr_t pr_of_xenaddr(paddr_t base, paddr_t limit, unsigned attr)
>       return region;
>   }
>
> +/*
> + * The code in this function needs to track the regions programmed in
> + * arm64/mpu/head.S
> + */
> +static void __init setup_mpu(void)
> +{
> +    register_t prenr;
> +    unsigned int i = 0;
> +
> +    /*
> +     * MPUIR_EL2.Region[0:7] identifies the number of regions supported by
> +     * the EL2 MPU.
> +     */
> +    max_xen_mpumap = (uint8_t)(READ_SYSREG(MPUIR_EL2) & NUM_MPU_REGIONS_MASK);
> +
> +    /* PRENR_EL2 has the N bit set if the N region is enabled, N < 32 */
> +    prenr = (READ_SYSREG(PRENR_EL2) & PRENR_MASK);
> +
> +    /*
> +     * Set the bitfield for regions enabled in assembly boot-time.
> +     * This code works under the assumption that the code in head.S has
> +     * allocated and enabled regions below 32 (N < 32).
> +     */
> +    while ( prenr > 0 )
> +    {
> +        if (prenr & 0x1)
> +        {
> +            set_bit(i, xen_mpumap_mask);
> +            read_protection_region(&xen_mpumap[i], i);
> +        }
> +
> +        prenr >>= 1;
> +        i++;
> +    }
> +}
> +
>   void __init setup_mm(void)
>   {
> -    BUG_ON("unimplemented");
> +    setup_mpu();
>   }
>
>   int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
> --
> 2.34.1
- Ayan
>

