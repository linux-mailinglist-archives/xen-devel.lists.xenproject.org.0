Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFFDC40635
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 15:35:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157636.1486340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHNYB-00038U-5U; Fri, 07 Nov 2025 14:34:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157636.1486340; Fri, 07 Nov 2025 14:34:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHNYB-00035j-2h; Fri, 07 Nov 2025 14:34:51 +0000
Received: by outflank-mailman (input) for mailman id 1157636;
 Fri, 07 Nov 2025 14:34:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NFVh=5P=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vHNY9-00035d-8w
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 14:34:49 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e82635be-bbe6-11f0-980a-7dc792cee155;
 Fri, 07 Nov 2025 15:34:47 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 SA1PR03MB6563.namprd03.prod.outlook.com (2603:10b6:806:1cd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Fri, 7 Nov
 2025 14:34:43 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9298.012; Fri, 7 Nov 2025
 14:34:43 +0000
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
X-Inumbo-ID: e82635be-bbe6-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ka88NjU0Wy7rbRRCA8YgYWtwoi9uhqS1XcTSoUB3idxsKsMve1rGeifhCm1JzrlJ7/f1NaBjJPqbM6BBfW1HxuDEF3R8OfIFsn/PifToP+X8n/WsN6NK/gvRIoRe0w0OFwQZ4Ee5GE5QM1X005hgJCghf00BIn9byjkF1xKDYNOynSMHCBDLA/CtaA5awcLFdKp5uc3D8mpL9LvYKRISRXrflyU5q4iiT9rK3HmZ6zxRcJLsLhxsj9ukp/ar7J2ulEtJjyhyIDNoQrKPqR/HSqzSSTnpV0z2hqOPw/DA1ZfhVgHs8nAmh7SA97DYlhooJ3FQqmf9l6rYWrQtsQRJqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0X/b4sBX/lJbaTbDMvNc/341/5PkSl63GWQpYYsCeLo=;
 b=ySBBDp+CX5wj+Zcvl/6+aqSIM9W33+wd8+Dyn4Tjjehz/fZhp8r+7cYa7ITNNlCbK+NY90gzubsspdjyK/wZFL887qIIVFpeyl9n6fth6OWl18Zs3zAqjcc1dIiB6+zkzv/8+aqsHnay15htM/sOd5DNeTB0PwphcZFWNi3rTrDhdUrCg5KR3H7RheFfpA3wi6ma4Q1Jo2gFIhZeM60NfMHlypMYCAuAiMTskMmMF0XwUqgNoQOrTeoQPQ4OW7Nf2W1YjfCqJH2o4NEpH74mXpimaOEzvbG5Sv2vDNw9dMXVr/5Z0ONf+GPSwgLGXv3sUt0qBWXuz/392obH/QNtoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0X/b4sBX/lJbaTbDMvNc/341/5PkSl63GWQpYYsCeLo=;
 b=j91/+h/LpnM2/K2VuUpr7PTu65zbyIYdxC02/0kwDUZt4pCc72mLG9G17sq5bEcfFQ0sBGwqC9U78Mqvcsmjt0CApUoCUDN3p+cyGow+u1HQpMJI9yaBu0fQeJsflvuiAZCtvvpxXRj9pC7tOnn+GJmEaIeVqme6kbwmwLSJOt4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <36cdbd68-3285-4c96-b25e-9a0474a9a2ab@citrix.com>
Date: Fri, 7 Nov 2025 14:34:39 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Add extra rows to the entrysign model table
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20251107134729.20735-1-andrew.cooper3@citrix.com>
 <52dcf4d1-69b7-437d-a01a-eec33f4535dd@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <52dcf4d1-69b7-437d-a01a-eec33f4535dd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0174.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::19) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|SA1PR03MB6563:EE_
X-MS-Office365-Filtering-Correlation-Id: 99fbe3c2-ceb6-4604-71e0-08de1e0aca8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OE5YOHJ4NXU4WkJGa0RycUcrbTVIY0Rob2ZFeGdISlEwQ3JGVlh1OFVCU3ZX?=
 =?utf-8?B?dXQ3WVAzdHY0MVppNTEzY1dYNThEUlRnWlAyOEd6UzlGSnA0Y0J0WW4rWU9V?=
 =?utf-8?B?aTYxejE5ZVJwTXNEWEtYOE95MVBCU1Z5Z3J6WFppVk4wSEJrc2tpYVA1bGM4?=
 =?utf-8?B?OVRPeXU5eVExR3lQYnFLRENTU3lDTUtFenRrUU5uUTAwOVVLNUsxcjBVeHc2?=
 =?utf-8?B?TmJkTDJFL3AyTS9oVHRMVUhqUVJ4SVRETnY3RmFWU0V0ZmtGckw3NnNmSXdY?=
 =?utf-8?B?WnE3czlpd2xwa2dHM0JhY0REODJMK2JuVVBjWStPc1VFeEMvd3ZZTDkxaXE3?=
 =?utf-8?B?UDU0aDFVWGhRNkNZQ1lDWGhFbmFxZUk3am9TYTBDcGhvd3hXLzRLRk1xYS9z?=
 =?utf-8?B?VmJXRFNqQ0tDSFVTVFJYQXJ5U0YzUHQ3dk51MXdDZjU0YnprTVJ4SWlQMU54?=
 =?utf-8?B?cmhkdHhJUk9pZUNxU2dTVGk0NXI3UFFPOEREOXQ3Q1BxN0V5M3RYeldrWlZo?=
 =?utf-8?B?ZXNXTEQ4dEpLaGw4NTlQRHQ3ZnUreDlYdnJ3bCsxSDhEU0VzOWVqMFVMVCsv?=
 =?utf-8?B?ZVBmbVVqYVFpem1zeWVwbHR0TG1xamxuNlNCQU9Ocm9xVHdaRUFyN0dkOXl3?=
 =?utf-8?B?VURUVHB5aElRTHlPYkRDWkZOTjVFZ3ZsM281a3U0c1RiS05QZjZnN3Z1ckU5?=
 =?utf-8?B?dTVzNHJTR0gzU1BaN3RIbDU0azVibnU3YjZQeUNrSmhRaGJyYUpSNEFsV2tj?=
 =?utf-8?B?MW9YVGJHYW53SkRGY1dNQ3dOWFh0TXJzQjRpSStESllKVUFNZlhvWm9TNXZU?=
 =?utf-8?B?WXJnQnNIN2VwTjQ4Wk5EZ3NaWXdXdXhVcnQ3cUNQU25MMytNVW5McUZHdzNX?=
 =?utf-8?B?dGRITXhHdlpJUGlVZU1Wck9oYkcyWHNPSFVKckY4Z2NyeGh0c3R6bWtjTjJS?=
 =?utf-8?B?b3NRcFNvMTlQSmVMY3hCV0cxUW9OMmtTeG5CeWo2RUtSR1YyUFRCNVJnRmdV?=
 =?utf-8?B?TE1ZMjR5ekdJVElmakZVTWMyMDNCdkFYU0htVFl0MDdwV1RuaTUrOFhUbzRz?=
 =?utf-8?B?Nk1kQ05PeVJPMDRhMGFZN1paS3N2aHlET1hOOVZuYlZRSS9rQS85NjZxZkt0?=
 =?utf-8?B?NUJnQlErNjAyTWtSL1ZkS3J6Sk9Uay8wclpKZjV2N3A2Z3FBa2dUN1BGSTRW?=
 =?utf-8?B?M2p3TCtzNFVnR0EwYUtMK1hZOU15cjhoVWZXYngrQWZRWDYrbHhEcnpRS0F0?=
 =?utf-8?B?b0FwTnBqQmVsdVRieXBZT2xULytSdGsyUUUxTS8vQ0FjbTR6clkvUFdyeTVL?=
 =?utf-8?B?dTFaZVpvVGNObG9HWmtsTGo2Vk14OEJKTXlzRmRkWDVLREhWVXNYWDVwNjA2?=
 =?utf-8?B?VGc1anRGL3lHL2F5RkxlK2tkSlBtTGkxUVowS3ZrbkdxL0RMd2piV3RQMXF5?=
 =?utf-8?B?YktNMUdRYVl5QkF5c25RVmpIempZSTZRcWZ5VVZZakFDbWZyZUF2c0tKQ3pF?=
 =?utf-8?B?NEJ5cHJQRnhaSGEwM3B0QXN1WUpDMVdGYkk4NUtXRUp0TUFIWEFaWXJpenZs?=
 =?utf-8?B?elNudzlCODJ2NEpic2VqKytTSFIyTG83c044VnErWEFZRytTN3I2OUZQeXQ2?=
 =?utf-8?B?U0xwaTdFWmhKVm0rYU94VTI1azhSZk1lSGRZTExwTHlyZmRWM3NiNE13Z2VY?=
 =?utf-8?B?SWZSZ05XV1lsZjROcm15NjdPRE92RGxsWkREQ0tVbTFVN2RGdW9OUHZDZ1JV?=
 =?utf-8?B?QkJpSDBrVFE1MUJKZzBZT2JyQlJleDU2WkU0TGIvTU1ZNCs3bm45eEE0dDZU?=
 =?utf-8?B?YURrQ05zNSttQ21DVnJ0QjVhcUVxeUhVdWtwWHgyZ24zWDVGaTdKMVhkQmxr?=
 =?utf-8?B?alFFSFEzbU5XZ0dDZFVFTjNweXkwMktuSTRjQWU1dmNZMUY2VjFjVFRrYSt2?=
 =?utf-8?B?aGJ5VFRhS0lWeHZqREoyMmZTdmE2L1lLbGRqZFIzb05uaU5tN09UNEc0aDNh?=
 =?utf-8?B?NjZlNzN1OXJRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnNiMGxTbnVDSmQyM0RYaEE2eTBRVDltK2dDMy9KTngrd1hKcEVpdHRXc1pF?=
 =?utf-8?B?NFp1dlFRMnVacGxlZE9xT285eGpzL2FHMmhscEVPTkdDaWZ0Q1crOGprcUgy?=
 =?utf-8?B?K3djeVJZRUd3bU1UalZxdW54amV2cXlKY0FqcDE5WWpjMjlxa1JOclZ3SkNx?=
 =?utf-8?B?RTdmUm1XOCtFNHRoejdLdXhIWjdsZkJ1cHRxL0tmbUhyckxGeklBZVppQWcv?=
 =?utf-8?B?QWd1Z3pBOW9nR3NmVVExNDFPVENPbE5ObEN6bmNBYjNoR3M0QmZNN1NXSWd1?=
 =?utf-8?B?SnVQcTRISGIvTUplSUZHdmhlK3NlSXB3K0NCOUdyT2hnQzY2TGVOYk9SRHlX?=
 =?utf-8?B?bUNNUG00bHVRdkJKSHo4dE14RitiRHZsTUlHMWJ5RnNBejJLL3hoMHlJd1RB?=
 =?utf-8?B?cUtkTlJ2ZmhWQ3JBUUxlSElPbWR5RG9xbVFNZWxsNlU1Y2FVaEtGaUQ0czY3?=
 =?utf-8?B?eVhSU3ZtRnoyMzVrMzRpUmVyN1FVcDVNZHF3VkoxY0ZvdllKU2hQVnVmMTRP?=
 =?utf-8?B?NEhxakJUK2JaWDFydHZnQ1AxZ2xFalFqRmhORDF0MFN3WGpDNURwQThCYTA3?=
 =?utf-8?B?MjUveXFHK3FrVG1qRU1VbGF3M3RjUzRxZTRkTlFXcWM3MkErSUlHcGFpN2xU?=
 =?utf-8?B?ZlhyM1FrRjNLZnZuZ25qRUUvcVB2S1hSNjFMS0wyeTQzNC9qd0M2STdVM1py?=
 =?utf-8?B?MC9XUUtjaVRtUXNuZXBsNjRqdVZFZnJsOXFQMVZITEZBRzl0UXFaOVhUUS9Q?=
 =?utf-8?B?NzRjVGpEM25HSWwyT3QyZERjTFkvN2srZXB1OHllNVJZRGJtNWtWVXVmdFhG?=
 =?utf-8?B?M2tZeGFCM0N6RVNYdUVGRWE5UTJrZWdoY2VwMVFwWld2ODBWY2psWXZUQ2xL?=
 =?utf-8?B?R3NhNU4rYkFyMkh3ZnNjU2VLZGRMQVJFMEN0RnM5TS9UbmIzZjY1MjlEeGJG?=
 =?utf-8?B?SGFrWms0ZThaVm9hOURKUjVBNTcyaEZTUWRwNHpCbmRuL0pPcjZwSjVuSGhM?=
 =?utf-8?B?RXZpa280SDNFZzE4WEFOWFYxVXBvOTZSNDZqS1BvRyt6NEtxdUQ0TWtDVG1x?=
 =?utf-8?B?ZEREb0JwbEkxalY3QjZvY0czRFdNTi9rNm44eGkyOWlOVTl2UFl3Uk0xNEcz?=
 =?utf-8?B?TFVFdmxoekxlWkV1N1cvT0g4bjE2SG9FUW5CemQyam4yZ2JZVDdyY0ZvMlFr?=
 =?utf-8?B?ZGNYTmxCQ2NiUGdQUFFjcU9YTkczZzBtOWR5QkFwTTMwRFpYS0ZaMi8vaVdU?=
 =?utf-8?B?UmxKNW9zY2h0eWtLOGV0bnBMRGs3RUZDSjhmS0RwajZ3dGNMMnNGMkVMUEhi?=
 =?utf-8?B?bk96V0RQWk4wa1ZZMlhUTC9zWXJETkJlTmJLdnhXVmFWajN0QnFYMVlnbWVH?=
 =?utf-8?B?N1FheVZHTkw0amZwN2Q4R3VSelJaR2tNTHl0TnllMU9oMDkvbDZPZEtJU0hl?=
 =?utf-8?B?YXVuY2R5d0NFalZSVTg3akVCM0F1aCtBcnNvWXVFWWJkcEpzeUZqOWh5Yzhk?=
 =?utf-8?B?TVhHd3padDk5Q240SU1PcXFNOW5xR0pLUFdXeUNxMjVZWUdSdVl3SHUrT3RK?=
 =?utf-8?B?SmZrTHpFa3VoeVVlOWFLMXFsTVBaWXByak5qME40bS9EWlUxdXR0R1JEa3VH?=
 =?utf-8?B?bXJ0Vk1IcUlkVDBlYkVVMzZBbFpOeGlxMXNGb2QyWCtWbk0rSm5YMlgzOGFQ?=
 =?utf-8?B?cTNUdWZOK09NOUI4c0RrZHlLY3JPR2psbjNxQll0TFB5Z2hGVVh2MDl3TFFa?=
 =?utf-8?B?eHFxeTlzMEdtZVNkVXlHV2gwck9wY0hQSFVablBNcUdtM29vS2N3RE4vaE91?=
 =?utf-8?B?aTBCQ21CRXNta3I1dUtlYUxMMEdrc09BdUI3VlIycTczQldtYlZlaWhzc0F1?=
 =?utf-8?B?UGtObXFGcHNMcXRpMGx3TEVhVjVsR3FnSm9GSWlpQ2ZFcnVuSnZoM1Z4alY0?=
 =?utf-8?B?czhWUVpvWDlCYjJnbnZFUU8zVzQ3ejk0YXRTTXMwTlZOQ1Q1RFg3bXlqREtj?=
 =?utf-8?B?OVZTRXlYRk00dE01WHJaMy9MQ1F6SW9Nd3hDMDBrd1FZbS9HeFh0MitWd3Nu?=
 =?utf-8?B?WVBLd0x1V1g4QWd4Q08xNFN1UTh0V21BdE9DSEkzMGRPQlY2Z1NIQ0h4TGdW?=
 =?utf-8?B?cnJ4bHhhcjlZRE51dmV1MTM3RWREWDdIWk84Vk0yaTRjSm44VE9jTEZadVNC?=
 =?utf-8?B?dnc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fbe3c2-ceb6-4604-71e0-08de1e0aca8f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 14:34:43.4789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/xRuRUQeIlEgw+HhuQyuCW3V/r7EvjDvEAQh+XZNqLRRxvvhBlsRMe3gReIpJ23eB5EJNIrGGwdU9yKktZx12/JuwDdFzD+3YKmO9sX7ZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6563

On 07/11/2025 2:30 pm, Jan Beulich wrote:
> On 07.11.2025 14:47, Andrew Cooper wrote:
>> Link: https://git.kernel.org/tip/d23550efc6800841b4d1639784afaebdea946ae0
>> Fixes: ff8228ab4658 ("x86/ucode: Relax digest check when Entrysign is fixed in firmware")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> Pretty likely wants to go into 4.21? Cc-ing Oleksii, for him to judge.

Yes, and backporting, but I've got more ucode bugfixes I'm working on.

One in particular was always broken, but exasperated by one of my recent
changes, but I'm not sure if the result is going to be comfortable for
4.21 at this juncture.

~Andrew

