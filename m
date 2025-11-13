Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB55C577D5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 13:53:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161322.1489295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWpD-0004Dw-4E; Thu, 13 Nov 2025 12:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161322.1489295; Thu, 13 Nov 2025 12:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWpD-0004C8-1N; Thu, 13 Nov 2025 12:53:19 +0000
Received: by outflank-mailman (input) for mailman id 1161322;
 Thu, 13 Nov 2025 12:53:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xbc0=5V=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vJWpB-0004C2-DM
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 12:53:17 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6594139-c08f-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 13:53:12 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU0PR03MB8718.eurprd03.prod.outlook.com (2603:10a6:10:3ed::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 12:53:09 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 12:53:09 +0000
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
X-Inumbo-ID: b6594139-c08f-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/TWAmDqgXXefraG6wIEeH4DJdGs2MWCjP7thQUTg38ekV9+mmEK7m27DsClPTF3m6zTrz8di1zkBnefYFLwYIwj+FXSDmwEn196uCRqwYH0Vz7uiaU1vhOEdL35+fBG6Rs5jUknsG/QItadZd0oOSblRYWEChFMd+evH2Hjr6c37t8IiM9tyDhaPz1hdO3VjWCEugLtf7H+NdcIIscCP9efzk0WWzt4dxVQra45w08KNO15oFS2l0cMTohIvvBHzEGYlZIKE1t/CmZNiBd4GlvWdTRFs8exRfNWVggDPhXWK9k+yvEaNxelyperlQshk52QDk0MpWSYoZJ3OpKhrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NaW1HKQgwNic+cKlIkM4mdmMd+WscODmbqTMl4SeFk=;
 b=L3iCsMAbbc1oD9fjFGptkC6FAZmlcvJ67U9w0ebG/OY5vJBQsu0QFGxDI6jD7Tn4uctOe8dKCERJW7MptfxjTojUBgc4J3oyYFB4ZK2N57VytgliPeZRt99vWGNJaLCT8TNsQGMUDCt0ZSIXN/oyKLJa3tO5anIJ9xUW5bcJvB6HRto7D+kvIfq8v/mfH75EzXUf7PHnFVc/cnofCTEcKZrjT29qCGMnFHEGMPZRcyy2jv1ZmYtv601hLTeBJpuBv9F11AisQxNgz2JJBhVt/05AQtI4OUPz5zmnaSXN5LB3YF1CfXWMYNi/AcDaRWyB/DleK6/Duph4DI+mvXjy0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NaW1HKQgwNic+cKlIkM4mdmMd+WscODmbqTMl4SeFk=;
 b=FygKNF0NJfabp07VgGsYu8nNRDcMF1H/432yJGPEunBl6UjETymLxOtoz05UpCIFCHgzHRQUfleU+9Y94zFe61YNZEmx0Act6s/Da6sKsEzMR+12CJSOvCVwuREisRuhZ+vPbs4E/xYHzlYLy/q2OugAOb1bJXLXt3GES4uciRo2djqqRvAK34DzsDK8UOHgOrM9N+P3vEMW8XbJtmRdfp6Y0lcGy0FC0pl/YD+/k/PF8LrMuL2KlZ/l9jiA3YEc1eZ3N1AmEPruPV+ZC+VbHQborbAAU4gVo8ZFqE3uK+4B+QdTtgqDmj897Qd9GTLQn9EQCo5k0P7lud7oZ4H2ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <9c4294ec-906d-4607-8f7d-b5b1bb7e74f2@epam.com>
Date: Thu, 13 Nov 2025 14:53:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2] xen: make VMTRACE support optional
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Teddy Astie <teddy.astie@vates.tech>, Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251112202442.3879997-1-grygorii_strashko@epam.com>
 <a634c192-9ea3-46d9-a087-f0f48a5c2494@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <a634c192-9ea3-46d9-a087-f0f48a5c2494@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0009.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::20) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU0PR03MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: b7cb4dd0-0c56-4a3c-8cc2-08de22b398c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXo0MWU4Zy8yTytobVB6Mm1URkZReVQrTXg5aUxTVWpRV0hpQkZ0cnM4UVAv?=
 =?utf-8?B?enRYQkYwd0tTNm50T0JMMW81SDg1YjUySjdHR1c0L2k3T0dzdXRkSW52TW5v?=
 =?utf-8?B?TlR3bHFWbFEwTHFRbHN3V0w1djFPU0lBL1lDMXB3NktuUXlVUDNCT2tRaWl0?=
 =?utf-8?B?Q21ybmJzSjNkeXN3c1hGVldGM0VMc0Z3UUllNEdpKzR2bTFjeVUxeStxa1NI?=
 =?utf-8?B?Nmpka085c1U1M3ZER2M3TEpwWE9keC9ZWkpTWWR5TG5OY01SdDR0TTE3dHIy?=
 =?utf-8?B?UGh4UEdWOURZQzhCSURiSmg1SWVnMkprRVpWdjhGenFyZVF1L0dkVUVkNWFk?=
 =?utf-8?B?UEFUWnR6cUE1OXJkdTR5NEtRWjFZVm4xTVRaSGEwRDJDTW55TlhadlJES05p?=
 =?utf-8?B?Q3R0OEY1M28yaTFQU2JDbDZGejI3NFhmRnBlUEVTKzBCeXF6MGh3YXRMRXc1?=
 =?utf-8?B?Wmo5bHVWNlh6dzF2eUIrdEMyTnhyS3BmbFlFWTM5dzZqbEMrQkF2dVplQjIz?=
 =?utf-8?B?VWhJUjF5d1dPRmJVZTk2RWlkNkRPRG1VN01HSGt6cEJTeU13VkJaaU5rcWFR?=
 =?utf-8?B?YS94OXFLdStIaEpBWmdpdG9DT2IwZ1ovT2tkYWhBZ2hnTStBYWNuSDFJaTQ5?=
 =?utf-8?B?V2dzQ1ZKU1R0cmMwRENmNjhBbGt4eDRSZHlUa0tmdEN6cnF2S0dVckFGVFYy?=
 =?utf-8?B?VkplY0RadkZNT1EwTnNuSlJLOEVzME1FY3NMUld4bDBqNkVzWTlqQmVZcTM5?=
 =?utf-8?B?TmtpbnNpQXc1eUVaZzZYWDRZOWg1cTlNQ1lKMDN0bERyamUvN1NBYnc1UUQv?=
 =?utf-8?B?SkxpVi8xbG9yZWQzNmYwVHZjckI2TUxxcllNN0dmZ2h5ZGRteUFrS1hycFI5?=
 =?utf-8?B?SGc1NGF0UXRpQ2RFcXQ3ZXFoSC9kaXpHL1ZCWTAyQnBPOHA1aW5iU0JOek05?=
 =?utf-8?B?cHJxRXliV3FEbUhmODdybVJicFFaR2NaczJMRzNNUkFHT2w0WWdyc0htalVv?=
 =?utf-8?B?eW5VTzV6L05jZUVJRFRaZFZBeVh6YmJLcTBZRENWeE84aWhTZ25DY1FrZEVL?=
 =?utf-8?B?clhFWnVacStJRmlpSUFKQmtjNmFtd2hweTkzd25SK05lVXBoYXJaN1kvMEJK?=
 =?utf-8?B?U0h6ZGc5aEVCcWs3QUFNL1UvSFZhd2hMRG9lL0k0cDFvUVhxaDRxUXEyd25W?=
 =?utf-8?B?bDB6TGVLczdNNURneER0czRWSHNWQzNKMVZSMW8xaG43Rnc5YkV4YXVmRzRh?=
 =?utf-8?B?Slp3eXpqR045VGptVkZpWk9aUCtvaE1PakFXcHY0Z0ZYdTJVRFEzQVJHSm5X?=
 =?utf-8?B?dGk3VExvVytaZ2lmaVZHNkZSUVJyTldlNGR5RDVrNWJQVzJaN1NmUEZzVnRF?=
 =?utf-8?B?TjlqN25TSDRqRFprTzV5U0l4Z2NLblJnS1lrcCttZ2dmejBKc0tFWG5FeDlQ?=
 =?utf-8?B?WGdMbE5iYnR6ZEFrMDZwK3A0bXljVW4rZFZMdlU0clRwMmh0L0ZqckdVTzNr?=
 =?utf-8?B?cDBMWjNHL2VpeHgzeG8vdE1MVmxHVDFWbnIyNmUzbTdWdXlFYjJ6SUw3SmUy?=
 =?utf-8?B?SUhvY21nVThJeFZYUm9PZngzZVFaeHg3Mi92bjNyRVRiaVFaalZSOEc3ZXo2?=
 =?utf-8?B?QVlKNmxLbk44VlN1aXhvT2Nqd3NrangxcVlld05PcVFQck1MSjJHcXhQYklS?=
 =?utf-8?B?L1lqWm5sYUhLVUpXTkFTRXVQNGQwa1pZdVVKUlhObVVlZFdGUFNUb29zSXdX?=
 =?utf-8?B?VHJtamRuTjZqeDdzbGVPMHA5OEtFcmxManRvNEtlNjMwQUpyc1g4ZzNDMENx?=
 =?utf-8?B?aDlWZDVEMjhYMCsyL29GZXZZcHBMWTI0TFVCdk00N3BWejNtSFJJbjZxWXRP?=
 =?utf-8?B?QTE4aXZEMGpheEFRdllxbHUvLzhYRldMbUZkZzZ1b0RmejE3bitjN1ViR25s?=
 =?utf-8?Q?kqwp0+PRR1BtdSb8V6WUgKKdRD+9fPHL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2Vxbzh5MmJXU0F1ajc2S0t3UHRCQk1pRHFjSVc4SmNsOW5HYlBGZVdxcHFJ?=
 =?utf-8?B?bnFGQ2xyM3E0UFpUZEliV0Q3TlNjZEhQemxJaUVxZXNnTFVGSzlvL2ljVWJh?=
 =?utf-8?B?TStVejBXL0kvWjlUbVV3WDdCUmdwQTIwNDN1OHhuK2lwU1RsT3NpV0NLWnc5?=
 =?utf-8?B?OTlrRkJpS2lreVlDUm9TNnRWeVdKazdIWk91Nk1mOEZmSWR3Q3NKUThGNm5z?=
 =?utf-8?B?NlZpZ1BPYmxpQWdRUGtGY2FTcGg3YjZsc3FIbHNEeURIY1VhK0YwV0RaaWtT?=
 =?utf-8?B?eG9zK0NwNW5PSFdXN1hCbExGREJ0WVVNYW41bnVVVVUwLy9rbW1iaElUWEZu?=
 =?utf-8?B?MFpvS0xrcHArSUVzdHJSWFNBM1d3UjgwYnNEblNmVWJ0Zy9qbGpjeFFFSTBm?=
 =?utf-8?B?dDRuSFVCS0hIUlZVUUhFbnlMb1RyaUFXNU91SUlRLzQvMjVvVlo0VW1vVzVi?=
 =?utf-8?B?MmFIejdiRVFjaVJIUkQxc3FLQ2xPZCtSYm9BcUxCMEloZk8yYWxKZ3lnT05r?=
 =?utf-8?B?QlloNXRGcmpWRXpJOWNGNDRsWmVranRKNUdTdXRBUWNLUVdLS3NrYkZWY2tK?=
 =?utf-8?B?bElzTEs1RWdQdERvL3JsZUdEbzRaWWcvM0F0Um5zQlhYNFBwcTUvZGs2eWto?=
 =?utf-8?B?WXlNN2c1dWJRL0Y5YzR6M1JienV2N3I1UUMzVyt1bnRGcVdhWjdmYTJhb3BQ?=
 =?utf-8?B?T2V3Q1Z1UFI2UThoWDVSNGhDS0cyYUdIbXlrcUdHSDY3NysrR1FWTWFZQ2xz?=
 =?utf-8?B?empQdThMeGlvaHBvRGVNZklNM2ZrejZ4bU1Ta3F0bXovblEyT3Jick1hUWxF?=
 =?utf-8?B?enRSK01Mekl3RDlLWkpkTjdmeG5hRzVrMksrV1FpMXZPU2kyaVRQOXpPRmVk?=
 =?utf-8?B?RERVSDBkanFONHpBS1dMQTZ3b2tqQ0hSRllXR3JrK1o3WFVKYXY2d0M4SnV1?=
 =?utf-8?B?VHVVSzNuakY0NExsQ0FGd3BkNFUzWGd0RGpEaGhwcmsxWGpxM1lKeXo1b1NF?=
 =?utf-8?B?NHBDSEJpK2VlL3MvbU94VWNodWZrV0xGRE90S052RmxsTi9nMVhPZTBsejEy?=
 =?utf-8?B?QTBlcHhPUEIyR25ZenkrZDhyRlUrWmNLZG1tUSswWjdIQkwxWVlZL2hzSjZu?=
 =?utf-8?B?elNiL3lRWmlMb2d4bHJMeWtUN3BtOTBFN3F3Rythb2Rrb3E4RzBPS2tYaHFH?=
 =?utf-8?B?N05WSWs0SGk3dk5WYmFBdFBRcFprZzZYaWhZQ0huYS9hdllaSzN0cUZYV3FK?=
 =?utf-8?B?QkFQbTNFblZDTkJYOVdac0piTGVacGJOOHpkSnIwSE5uemJNY1BaK1JqS3FF?=
 =?utf-8?B?NFFZNmtmSFpnWS9ONUFoTEhpcHpRWXVrejczUmpVOVc4b1U0L0FYc05OS3V0?=
 =?utf-8?B?VWhtN1hJcG1zZGcrNXFNalJaU2JXR3k4S3IzamdxclVUWit0TFhKOTdLdk4y?=
 =?utf-8?B?OWxNODJ5TWlFNnRRZkRvaytFSTg2UEx0T1czYVBoV2xpcmlWcUNUaEFaUlZu?=
 =?utf-8?B?Y3BpV3lic2ZMcWdjcjNPbEt3MSt3cElQb3hPWHpFb045SFNCcVlUSjEyL0t2?=
 =?utf-8?B?NDczem5rc3VjMTJxMmpEcTFYQ0RFRkdZdG83VkVRdCtDTHBWaTY2eXNLSG9E?=
 =?utf-8?B?aFZsb1hlNDZtUnhKenVkSis5aWp4SVNYdUNKWXJscVRkV2Q5cmNiVUkyR3pU?=
 =?utf-8?B?YzJyYU5iK2lHUGVjRWxWUjA0K0QzZmx3azdSVWNHSzJ6eS9uL1g5WjF3TkJx?=
 =?utf-8?B?TGU5OUhCeFNmQVN6ZXZhelo4bFdkVHJJRHU3OWFtODk1SkhmaXpzdFQ0ZUpp?=
 =?utf-8?B?TFhscEdoM2RmZVlMOU5TT2VlTmtoa1QzSW51cmUxWVRnWUtPbUtadnFJLyta?=
 =?utf-8?B?SUo5Y1R0dk5KQm5SZXc0SkE2S2RuV2J0Wlo3TFkzdlpyS1AveFArV1VFNDhk?=
 =?utf-8?B?VDIyYXhISVJucldZWE9wL2s0TWMxdU1acGVSWUFubXdySFRndGJZWWZ5UVJw?=
 =?utf-8?B?blJwTFhrOURCazIwY3pDT2xDSjBtZHhxVmlnSU5yODRBNFBTUmdyNmFmamx1?=
 =?utf-8?B?R1h2emZTVnpSZmF0YkovYWMwTDBCamRrTldZNG41TUV0NXBoTUlhUkFpQWxI?=
 =?utf-8?B?UmxTWFR5czVleXJaUWFyL1BlRDRjMVo4V1BJWEF1bGdRazRiOVRkNGVyalBJ?=
 =?utf-8?B?bVE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7cb4dd0-0c56-4a3c-8cc2-08de22b398c7
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 12:53:09.4213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckeBAYYuZPHl8uaZpAjnuHr9kTMTC+lUkPhIWu+JygfO6qm0kDmmE+b6W7ruSfLSfMePgoCpWV411FyR7iUxPc6m+fcw0BVKhdmtuhfk0s8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8718

Hi Jan,

On 13.11.25 10:36, Jan Beulich wrote:
> On 12.11.2025 21:24, Grygorii Strashko wrote:
>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>> @@ -307,6 +307,7 @@ static int vmx_init_vmcs_config(bool bsp)
>>       rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
>>   
>>       /* Check whether IPT is supported in VMX operation. */
>> +#ifdef CONFIG_VMTRACE
>>       if ( bsp )
>>           vmtrace_available = cpu_has_proc_trace &&
>>                               (_vmx_misc_cap & VMX_MISC_PROC_TRACE);
>> @@ -317,6 +318,7 @@ static int vmx_init_vmcs_config(bool bsp)
>>                  smp_processor_id());
>>           return -EINVAL;
>>       }
>> +#endif
> 
> Initially I was inclined to ask for use of IS_ENABLED() here, but that wouldn't
> work since vmtrace_available isn't an lvalue when VMTRACE=n. Hence why generally
> I think it is better to check the particular identifier in such cases, rather
> than the original CONFIG_* (i.e. "#ifndef vmtrace_available" here). I'm not
> going to insist though, as I expect opinions may differ on this matter.

Yep. assignment required ifdef wrapping.

"#ifndef vmtrace_available" will not work out of the box as there are

"if (vmtrace_available)" in code. So, can't just "not define"/undef "vmtrace_available".

> 
>> --- a/xen/arch/x86/include/asm/hvm/hvm.h
>> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
>> @@ -234,12 +234,14 @@ struct hvm_function_table {
>>       int (*altp2m_vcpu_emulate_vmfunc)(const struct cpu_user_regs *regs);
>>   #endif
>>   
>> +#ifdef CONFIG_VMTRACE
>>       /* vmtrace */
>>       int (*vmtrace_control)(struct vcpu *v, bool enable, bool reset);
>>       int (*vmtrace_output_position)(struct vcpu *v, uint64_t *pos);
>>       int (*vmtrace_set_option)(struct vcpu *v, uint64_t key, uint64_t value);
>>       int (*vmtrace_get_option)(struct vcpu *v, uint64_t key, uint64_t *value);
>>       int (*vmtrace_reset)(struct vcpu *v);
>> +#endif
>>   
>>       uint64_t (*get_reg)(struct vcpu *v, unsigned int reg);
>>       void (*set_reg)(struct vcpu *v, unsigned int reg, uint64_t val);
>> @@ -735,6 +737,7 @@ static inline bool altp2m_vcpu_emulate_ve(struct vcpu *v)
>>   bool altp2m_vcpu_emulate_ve(struct vcpu *v);
>>   #endif /* CONFIG_ALTP2M */
>>   
>> +#ifdef CONFIG_VMTRACE
>>   static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool reset)
>>   {
>>       if ( hvm_funcs.vmtrace_control )
>> @@ -769,13 +772,20 @@ static inline int hvm_vmtrace_get_option(
>>   
>>       return -EOPNOTSUPP;
>>   }
>> +#else
>> +int hvm_vmtrace_output_position(struct vcpu *v, uint64_t *pos);
>> +#endif
> 
> There not being any definition for this declaration (regardless of configuration),
> a comment might have been warranted here. 

/* Function declaration(s) here are used without definition(s) to make compiler
    happy when VMTRACE=n while all call sites expected to be protected by ifdefs or
    IS_ENABLED() guards, so compiler DCE will eliminate unused code and overall
    build succeeds */

a little bit long :( ?


> Furthermore, can't the stub further down
> in the file now go away (addressing a Misra concern of it now being unused, as
> HVM=n implies VMTRACE=n)? Possibly this applies to a few other stubs there as
> well?

You are talking about HVM=n stubs here, right?
I'll check, most probably they all(most) can be dropped.

> 
>>   static inline int hvm_vmtrace_reset(struct vcpu *v)
>>   {
>> +#ifdef CONFIG_VMTRACE
>>       if ( hvm_funcs.vmtrace_reset )
>>           return alternative_call(hvm_funcs.vmtrace_reset, v);
>>   
>>       return -EOPNOTSUPP;
>> +#else
>> +    return 0;
>> +#endif
>>   }
> 
> This doesn't look right - if absence of a hook results in -EOPNOTSUPP, so should
> VMTRACE=n do. (There's no practical effect from this though, as - perhaps wrongly -
> neither caller checks the return value.)

It might be a time to make it void() - what do you think?

> 
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -1155,8 +1155,10 @@ static unsigned int resource_max_frames(const struct domain *d,
>>       case XENMEM_resource_ioreq_server:
>>           return ioreq_server_max_frames(d);
>>   
>> +#ifdef CONFIG_VMTRACE
>>       case XENMEM_resource_vmtrace_buf:
>>           return d->vmtrace_size >> PAGE_SHIFT;
>> +#endif
>>   
>>       default:
>>           return 0;
>> @@ -1198,6 +1200,7 @@ static int acquire_ioreq_server(struct domain *d,
>>   #endif
>>   }
>>   
>> +#ifdef CONFIG_VMTRACE
>>   static int acquire_vmtrace_buf(
>>       struct domain *d, unsigned int id, unsigned int frame,
>>       unsigned int nr_frames, xen_pfn_t mfn_list[])
>> @@ -1220,6 +1223,7 @@ static int acquire_vmtrace_buf(
>>   
>>       return nr_frames;
>>   }
>> +#endif
>>   
>>   /*
>>    * Returns -errno on error, or positive in the range [1, nr_frames] on
>> @@ -1238,8 +1242,10 @@ static int _acquire_resource(
>>       case XENMEM_resource_ioreq_server:
>>           return acquire_ioreq_server(d, id, frame, nr_frames, mfn_list);
>>   
>> +#ifdef CONFIG_VMTRACE
>>       case XENMEM_resource_vmtrace_buf:
>>           return acquire_vmtrace_buf(d, id, frame, nr_frames, mfn_list);
>> +#endif
>>   
>>       default:
>>           ASSERT_UNREACHABLE();
> 
> Without the intention to ask for a change right in this patch, this is a little
> awkward: resource_max_frames() returning 0 results in acquire_resource() to
> return -EINVAL, when with VMTRACE=n for XENMEM_resource_vmtrace_buf it imo
> better would be -EOPNOTSUPP.


-- 
Best regards,
-grygorii


