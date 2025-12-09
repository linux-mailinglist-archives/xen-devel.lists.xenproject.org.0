Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D232CB0EB7
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 20:21:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182140.1505067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT3HJ-0001Or-4f; Tue, 09 Dec 2025 19:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182140.1505067; Tue, 09 Dec 2025 19:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT3HJ-0001MH-1G; Tue, 09 Dec 2025 19:21:41 +0000
Received: by outflank-mailman (input) for mailman id 1182140;
 Tue, 09 Dec 2025 19:21:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I/6M=6P=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vT3HI-0001MB-96
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 19:21:40 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 483e881e-d534-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 20:21:37 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by DU4PR03MB10910.eurprd03.prod.outlook.com (2603:10a6:10:593::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 19:21:36 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 19:21:36 +0000
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
X-Inumbo-ID: 483e881e-d534-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2foqDLb9AE6ayX2pIl4l0+PV3twC/cOl6sgfiLGmWq0H+GzTXabiOmEoIR3LZp2rwgrgYopFt1ZL7AXNzaoZNZ+dtpBtBkv11niNlIXbHIWDsjFr24Qfd6JubhahLiwosBRpjHxLBYZsspt4SkXEHVjcOzskyIpGs+FHB2WRG73Qcgaa5+V8TfQ6l1xfOWnEhHgVmGkQyMYN7fUkAkh7YGIkvDPB2RHxQiVwSkEeWoBYfJbjYLs+LvaAcE3HFCbfU3O4dkojVdWE7BDABa2S9MZLwrAlf4FTo0uZM5EUq7/k7UxEDvm/EhE2xZqOiGKaWh5JI3OP/VSpX70TpowuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03oTRy/dkZDah/ZFEIu4TRnRO5tGIu7nOfhtozrDRAQ=;
 b=LcNjZq56Qclrc2PylkkaoLz2sHZg5Mt/s76AhKWy3Ypoc6A5/6EFzzV+pcV2UAjZfma9YX2sAku9AB5A3qHmkUJy/SN2HiQoT+ru0WiX/QP+iu58s4nhKIl2ZIB+ojz98oly8dNrhfBHJBX1K89SrnPAsHN+KlahBIRorFnxPtEcKwFnJBugmPm3zqpNRsAxOxsfadRHMPQfAxyRPrLMYwlxFJwrkZWAVodZqnXemtz/nc0lNPzitKzzVtV7lrSA1a54Gx1lY4WIe1oFRKRaK3NkEWK5JWaQdpH8UjMapQGVH9/oift7N0W2xmANK9rp29Fqmyu6iG3YC/Ul81dLxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03oTRy/dkZDah/ZFEIu4TRnRO5tGIu7nOfhtozrDRAQ=;
 b=RbI+M4opuyx5ZS/2TLhUTH3GFkxvtoy0xZuUhHJEvqxRgKwyMrA3qQCsjMmbaQ79gR8Wy3EOLRMEWW+zoSqv6D64v3ZnzUbFIy+sQongoyVKh/U3sfYov+JiqeW/X7Ov0063MNoEmCNEqN9RLU9DB8IKWJoJ7MUrg/cN8u7fhqEeEUiwDrSzq1J5F5PbJVA+Q7rz7Cd0JvRZlNVvzkQxFSKUpApMFs7f7PFjaSV0KIg+byJgo/pSQdB9UuC2XAShgI7SmJe7AVcvth2ZouGwoJpdryT8GIxbQQ3nwVQzn3H/5uJEeM2IxwvDY3as1Cye3OOOFi1eANowfZyz5bOXPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <83c524ed-dec0-4792-9129-0bfc7498ac97@epam.com>
Date: Tue, 9 Dec 2025 21:21:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: Inline domain_set_alloc_bitsize() into it's
 single caller
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20251209180750.2145364-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20251209180750.2145364-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::9) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|DU4PR03MB10910:EE_
X-MS-Office365-Filtering-Correlation-Id: 0baf0942-f695-49b9-bdcd-08de37582b89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2l2MTZHZ29zd0N0T0RiamRIaHVDcnlzbEJIRThIN3VGUERENFZQZE45Wk1P?=
 =?utf-8?B?c1Q3a3I2UlF2MEE0ZUMxcVpSZlduZmlxcFZNRmZFNWo5ZVFSL3BvUklScnFh?=
 =?utf-8?B?dmRLV015Z21JcDZTUzBjajZjNEpkU3R0Q1ZIOVllZmFTUklIaFVuaWJybXcw?=
 =?utf-8?B?dXB4T09CSURnWVRyQm5Ha0E3NldkRTJ2Y0xpaWI5LzZhL3hMcUZvakJtMGlx?=
 =?utf-8?B?REFrWkR0YUJWeFFQL1AxQnk4cDBYd1d0a3dFU2dpeG56SXhENFcybFgyVysy?=
 =?utf-8?B?L1JTaGdCSWZOSktXb2U5YjJSYUZ5VVA4NnZmZWpQOTM2b3hoS2lLcFRKeEll?=
 =?utf-8?B?UU00UGtyN3hWcUl3d3RSWmlvY1EwTXpqc0J0TEZSNVFTRFRQV0UvVHBDL1ZT?=
 =?utf-8?B?eHlXWkRRV2NWS0RhNlVDRTVDTEhmR1VCUU5VN1cwQ3UwUDFyYWEvdzNQWUJK?=
 =?utf-8?B?UXUyTlRySVIxQURUcm1XSTV2QlI4SWczM2xHaXRGQ3lKRGJFWWtZaXdDTGxF?=
 =?utf-8?B?SjZLUzFGcjd5dExzMUxVU010STlJS3B1ODJjQ2dyQll2YmxRYUdZejRwcW5u?=
 =?utf-8?B?S0pYQUhWeDBGR2dwYnU3MjY2bmxjUWF4dWVrdVNzbmRyWEZ4L1BaMVdBZExj?=
 =?utf-8?B?VW1DTTIyc3d5Y0VyY1ZkZUZkbFBOOFNETXVtc3ozUldscERScVJtVEIraUh0?=
 =?utf-8?B?am9pdnJzY1BYRnVGUTd6bTIvNUQrY1NReGRwenJpSm5kdHRkSGpaN0hBZnNI?=
 =?utf-8?B?YldVN3VLczFkQjVzbTVQR2RNZEZwU2Z5ZE9TNUJ3Z0g1TTBDSHJPaEFCZFJk?=
 =?utf-8?B?bndpYm9rbDZSbVhHSDNCNkcyRS9CTitHT01BdGRzakQ4S3g4TTluZSs0Njkz?=
 =?utf-8?B?OWU5M2VtUDRuZzVBUWlucEpqS1A5SjNHSTloOWFnZjN1VlA0M0pDb2gvU21o?=
 =?utf-8?B?Vlk2ZENmYm82K3Q1VG1wYWVrdFpKT3I4T0lPWCsrQkduNlVDOUd3TnFBditL?=
 =?utf-8?B?WTNkQlRiMnFGdFVqWTF3WmJWbks2SFcybnpDV1RnNXduSEprS2R1N0VSK0RR?=
 =?utf-8?B?a1J3aEczd1JYRFN0TU5HVWFtZ3lzdDdBK2s4WVRZYllHZzlXUGJBbWo4bmV3?=
 =?utf-8?B?Z1dpQW44U2M1SHAwYUZ6QjlsM3dkd0JvNERhWUo3azFqN1BhS0Nmd0lidldj?=
 =?utf-8?B?RjNjcDJCdE9DZ1ZFWWc4QnhtcVIyL20rSVBzS2t3bnlhVnREbGlTa1E5SE9V?=
 =?utf-8?B?dVQ5OHQzd2c1V1ZaV2YwL3kvTloxZW85LzladzlFMXNNKzlkVmdLbzZVU3Vi?=
 =?utf-8?B?b1RaSEk5N0NLYWdPSThOaHorSlJacFd0WkxFYnNmSEQzUmpvK1hnZUJ5MzQ5?=
 =?utf-8?B?Mm42RXJPcVFxa3lOY2Z2SUlYeWRaRnZjMGZNZnlZc2UwNTRJSGxvRCtQbzQ4?=
 =?utf-8?B?K0YzblhEbXRXYXNmRTBhUThBNDlGTUR6cERSby8zeWc5K1c3d0NBYmtTVDF1?=
 =?utf-8?B?dWFoOWtZd2psNktaOGJSajFwNEZLZzlZZC9WS3dwc0xLM0ZoYlJ1c1ZVVlI0?=
 =?utf-8?B?aldKTFRPN2VvbVVwNGVGbGpXMFY0VzBLR3FhUWZXNGNSUlBtZFVhVVlRM1dh?=
 =?utf-8?B?dWVQVUphdklFWGg0ODc4OTA2TGhtejY0MDlVWVFNZVFGSzBHVWpWMTZRMlhS?=
 =?utf-8?B?VHdwT3NQdC9neDBMSTdyNm5pa2FkaFRXR2tNVEtWUTBpdWdINzZBQ2xnbHNT?=
 =?utf-8?B?RHZpV1ovbG51dXFTbUprRXpFOFE3dTA3YUxlUWxRLzhHVm9QdkVEY09WTDQz?=
 =?utf-8?B?VkltcHozakMrZTYzaDBUL3VOOVpSRnRJczhicWZuSXFmMlVDSld6azFNUW5P?=
 =?utf-8?B?NmFGZVRPNGQwRWhIZTlqZnIySWJsU0JrdE0xYWlKRmw4NnB2cTMwV2RYUlU1?=
 =?utf-8?Q?P1qJRKnYFifgJGhoFa+ppASCyRfsGKRR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmN4dEpqN0MwN2NZRTlDUVdZY01JUkVmeTBrUXNCMmQxR2F3SG45aVdQYkFW?=
 =?utf-8?B?Z29BMVhKbUJBMjFMWUVtRnBzdnZlcjNJbUxwMmIzMjJoY3EwMUY2MUdBNU9H?=
 =?utf-8?B?M0NIUHF3Qzd5aWpmaVRjRjBCUFhRN2NQUGppMUZQOHVmVThSQzVMbnMySDVx?=
 =?utf-8?B?SmU3ZTBGcTdPMVBmUDRSeDQ0SG52aEF4dUZ1a0YrWmVmL293U3FPVUdSSTNk?=
 =?utf-8?B?WW5kS1ZGR1RrNEsybktKeW1tY2dHUmNKK1pSU0svNk5qRzB0bXBxM1FFc05r?=
 =?utf-8?B?NGdZTjljeXc5eEtibUhJd0tkaWc2WFJTeUtxVG1zWFVFc1FXbHVjOFJyTk9q?=
 =?utf-8?B?aTBFa2JNVlpoU2dlNkk5ejR1MDFha3l2bjN1L2pVUlRLeFc2UjcyT1VTZU4w?=
 =?utf-8?B?Y3c5MmpoUzBsYzRFN2srSjJBNDVObGd0UUNpOU1hdEhXYk54WFVyc2FOSTkz?=
 =?utf-8?B?NzRHNzJHNXNNMzIxejIvNHRXd2wrVklEeURhWGoyQXBqUk4rV2tWU2MvajY3?=
 =?utf-8?B?UThTRC9qZWswSUd0S25pMEhHdEptZ1QvT1FhY0hlZ2RTSTFtanhUa2FBaVhQ?=
 =?utf-8?B?ekx6c0hJWWVURlVIa2xxZ1lFQ3pjZlNqV1JaQVorcVh0NE1RcVprZkNZZmtn?=
 =?utf-8?B?SnppTmVudWhTM0ZGWDJiRkRHNEsyNzduSWlyb3NkNFhGb21Qc0U4dDFkamYv?=
 =?utf-8?B?eWIwQlIxS2FycGN6Q2hmYVdBVmlNM3EwM1pabkYwNkc4dG01cWFMSUJ0WGNV?=
 =?utf-8?B?WkUxTmxZcW4rUWwyQUxwcmxEUGVGa0FDeEd2bHZ5dHhDVGRJaHJISlhURTRF?=
 =?utf-8?B?eFM5YXY0bFdMVHhmVy9MbFRjOTR0SThGZ0UydjlZejJhK3hLck1GTFRnelZj?=
 =?utf-8?B?dkphWWVsTVB4TlJtV1RFN3BIeGtYL015NDNOT0NOOVQ0Z3hBK1BLRnJ4U1VG?=
 =?utf-8?B?bGNtd2g3dVNzNXNwSVA5WUEzRklCNjdUYWNlaEx0SHdPN1d1dXQ0Ulh4YTdl?=
 =?utf-8?B?TEk1OVNyaERSbFZidmFyamNxdVJyUUdLZk9sU2ZYbVBqb05yYTUxVGZIMEIz?=
 =?utf-8?B?WElVMTdQSThRZmlTNkxmY2FmVDR1M0dSQThadGdUbng0RXhxYmNRVUZDVjg3?=
 =?utf-8?B?V2pLK1pGSXNxNFg0WVRHVElKWXRuaVNsc0ttMDlITk1RZDZOM3gxb1RSbkI2?=
 =?utf-8?B?bFJQamg4NGNuRDU4L1loa0pRWFhMZWU4UGtKRjMvTExseWpZTlBNSVVUdlN6?=
 =?utf-8?B?ZDg3KzhNTjJCLzUzV3l1UmZkWndWdkNQcmdRYkxHODhVWitPV1dyRTJhVVY4?=
 =?utf-8?B?OE9TTkhDaDVtSnpZdTVJdFBGYmkzajM4bWJQTE5LYkdEVng3K2JZRW10VXBx?=
 =?utf-8?B?K0RVT0drNmRaOTl2TUVBK3ZrNjErRTErY0lXOXBBdm54YnlSSllIMXFwYkZR?=
 =?utf-8?B?L250ZWpZSFdMUFErVHBaWEF2MmcvUmNpV0VRbG5LVEtPUE5yZlNpWnQ4MXpQ?=
 =?utf-8?B?QUtWVzZycFdDZEJZR2RWZGJhemJtejcrSWI3SWhyVG43YVdXV1RySDI2R2Fj?=
 =?utf-8?B?Y01kRm0xUlNyYkYzV2VFTElJVytlaHg3Z3hOQWlWTEtOY1VJV215NmxmNEN4?=
 =?utf-8?B?WHd4RzhTUUcvWkp4NmhraEVOZHJjUG00UXprR0wyeThPMlQ1ZGkzREI4aHNp?=
 =?utf-8?B?b2oxN21RRG8yUTFwOVpoWEphOWpzOGcwM21CY255SmF5MmFEOXk0Z253eTIv?=
 =?utf-8?B?VVp3djFpZGwxOXl1Z0cyRWZlQVd6UHlqZkxRYXJBUjBONDBBeHR2a0RwT1ZH?=
 =?utf-8?B?bkppd0MwUFV3ejlFU3hMVUplNjVRcVp1ZEFwSUVvendnbklRL0tzVVZ5MFVR?=
 =?utf-8?B?Y2NWNzA5OVpKdmJEWXlZcnYvNTJzeXpEa0xoc1BDcnZZaTNuZU9rODZwaG16?=
 =?utf-8?B?dFVBb0tXbU1abGtTVG90UkNJSGNPYmNLVUpoQS94TmpaekxCWnBkamRTQ0xD?=
 =?utf-8?B?eWhVc0FURG83K2NrU3dYWXdWRGxRVEF2WXhNMW1vb0pLK01oWEtXZXlqTm1z?=
 =?utf-8?B?TGc0MDJ1RGZXRS8wNlNEZ3pNUW5wQm5WZ1A4WmtHbzBFeWlRMFU5SmR5Nm5N?=
 =?utf-8?B?T3RNZEVONndHTmRYU0J2U3JHYUVxcHQ0QjE3aWZpU3k1cVZyY0YxQm5jeDNa?=
 =?utf-8?B?ZHc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0baf0942-f695-49b9-bdcd-08de37582b89
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 19:21:36.1581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNtUlUjhfCQppnmQHDmt6Q0LJBXtML9ddZIiw5+fI0MKLUV9UXF/bZBUX3KkgUi4RF2nMrBHsAkuSsM1glvKUEOhE/Zv5hr3F9AivZdiK3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10910

Hi Andrew,

On 09.12.25 20:07, Andrew Cooper wrote:
> Prior to commit 02e78311cdc6 ("x86/domctl: Make XEN_DOMCTL_set_address_size
> singleshot") (Xen 4.9, 2016), it was possible for domains to switch to being
> compat, and back again.  Since then however, becoming compat is a singleton
> action that can't be undone.
> 
>  From the context it's clear to see the is_pv_32bit_domain() check is
> redundant, and from the singleton nature being the only place setting
> physaddr_bitsize, there's no need to check it for being 0.
> 
> No functional change.
> 
> Co-developed-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Split out of series to simplify things.
> 
> bloat-o-meter reports:
> 
>    add/remove: 0/1 grow/shrink: 1/0 up/down: 25/-96 (-71)
>    Function                                     old     new   delta
>    switch_compat                                447     472     +25
>    domain_set_alloc_bitsize                      96       -     -96
> 
> which will mostly be the LFENCEs embedded in is_pv_32bit_domain().

Thank you for doing this.
Not sure if it's needed, any way.
Reviewed-by: Grygorii Strashko <grygorii_strashko@epam.com>

> ---
>   xen/arch/x86/include/asm/mm.h |  1 -
>   xen/arch/x86/pv/domain.c      |  6 +++++-
>   xen/arch/x86/x86_64/mm.c      | 13 -------------
>   3 files changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
> index 17ca6666a34e..9438f5ea0119 100644
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -619,7 +619,6 @@ void __iomem *ioremap_wc(paddr_t pa, size_t len);
>   
>   extern int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm);
>   
> -void domain_set_alloc_bitsize(struct domain *d);
>   unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bits);
>   #define domain_clamp_alloc_bitsize(d, bits) domain_clamp_alloc_bitsize(d, bits)
>   
> diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
> index 9c4785c187dd..11db6a6d8396 100644
> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -254,7 +254,11 @@ int switch_compat(struct domain *d)
>               goto undo_and_fail;
>       }
>   
> -    domain_set_alloc_bitsize(d);
> +    if ( MACH2PHYS_COMPAT_NR_ENTRIES(d) < max_page )
> +        d->arch.physaddr_bitsize =
> +            /* 2^n entries can be contained in guest's p2m mapping space */
> +            fls(MACH2PHYS_COMPAT_NR_ENTRIES(d)) - 1 + PAGE_SHIFT;
> +
>       recalculate_cpuid_policy(d);
>   
>       d->arch.x87_fip_width = 4;
> diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
> index d4e6a9c0a2e0..42fd4fe4e9b5 100644
> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -1119,19 +1119,6 @@ int handle_memadd_fault(unsigned long addr, struct cpu_user_regs *regs)
>       return ret;
>   }
>   
> -void domain_set_alloc_bitsize(struct domain *d)
> -{
> -    if ( !is_pv_32bit_domain(d) ||
> -         (MACH2PHYS_COMPAT_NR_ENTRIES(d) >= max_page) ||
> -         d->arch.physaddr_bitsize > 0 )
> -        return;
> -    d->arch.physaddr_bitsize =
> -        /* 2^n entries can be contained in guest's p2m mapping space */
> -        fls(MACH2PHYS_COMPAT_NR_ENTRIES(d)) - 1
> -        /* 2^n pages -> 2^(n+PAGE_SHIFT) bits */
> -        + PAGE_SHIFT;
> -}
> -
>   unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bits)
>   {
>       if ( (d == NULL) || (d->arch.physaddr_bitsize == 0) )

-- 
Best regards,
-grygorii


