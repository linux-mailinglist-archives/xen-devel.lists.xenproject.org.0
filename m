Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGTZHBs/vGn6vgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 19:23:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D79F82D0C23
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 19:23:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257499.1551883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3I1D-0004zJ-IK; Thu, 19 Mar 2026 18:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257499.1551883; Thu, 19 Mar 2026 18:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3I1D-0004xF-Fh; Thu, 19 Mar 2026 18:22:51 +0000
Received: by outflank-mailman (input) for mailman id 1257499;
 Thu, 19 Mar 2026 18:22:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAdu=BT=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w3I1B-0004x9-Qw
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 18:22:49 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a16fc5a2-23c0-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 19:22:48 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH7PR03MB7836.namprd03.prod.outlook.com (2603:10b6:610:24d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 18:22:40 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 18:22:41 +0000
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
X-Inumbo-ID: a16fc5a2-23c0-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pRqtG/wFvhK74Ju9qC2DB1maaA8ev5xyEnntAyrE6CXPO6IwHX3l5c5U8pcLddNRuu6mGoyG8LxTNvV1rbv7s4hHyVh8u9aFyWJCODNRxPo89ysqoOUxEGUIhFsaL3EPL4Qsx8KnujMU097zPrQMZqvfEGt0hZTY6N1ymh6T2UJilHDlynNYD4AgIIwgtU/kCAHRYiBLR+C/4o1gg4JYIUMZtNg2gBK42cxmCF7V4m6zUY2IUjxthv25rD9QVFmlTTWj8zmZTx3FNrZ1QCKNMRmwkTaPgv9KJhFuctlxa7UqUYGjrn9UvNQmU68U7NU7k2VCOvgIVghMetf7Wog2lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPPIzCjxW1GDjXGHKB+kaFx36wOT27dml5ySYJnRBYs=;
 b=vqbKoCSmqY56fcCYZ5569J4CGWwP1sgfqGPLaSMlwSE2B9URgDkGSKXAYyuR2KVEegtQEpO7LOm+PS5LICukLeiVE1Wk7wsgrsWWpBdSKMw5OUWARbOW4GP30W9hHesTomicvtuUCas5YBPzQpN88lwVcKBFvXCvCki136M0SIZfa02eLV8QZFY5iMP8sq94iCeCA7YOSybJV8c4f3jscd5WppsulbCy0H7qyVnSIF+pBNhHwCQcCA9oF/K6S2ySsU3V1fKCFwqx3arpSkn14UIG4JBp7YBDEjhiAx1q3WTvoAx+XonPDlzcy/HIJtqPaSv9sWgupuN34rs68vz5NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPPIzCjxW1GDjXGHKB+kaFx36wOT27dml5ySYJnRBYs=;
 b=aUff3OQv0zkUp1DN5p8F+MetSu8YNco/kuNmHIZGwEbqLDFh1wYbFHvLI35aeSHydhjX5liks2g7uIGlhTr5x4JRvAAsIBRlFHSdcjdxPvboaCJdYo4rVK3MLnj+ZVN4Mj1Bwcm8Kh7JZKCnK6ZjkGxcksJRVcsQu3KTJngbQRQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2e49be28-ea70-4a81-b3ca-6c944ba37145@citrix.com>
Date: Thu, 19 Mar 2026 18:22:38 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v1 4/8] x86/traps: Remove lazy FPU support
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
 <20260319132924.1469809-5-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260319132924.1469809-5-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0186.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:376::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH7PR03MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f65fe4-1e28-4fa4-a002-08de85e48228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	CH7zcIMhHYofeDzcQFgy4AJf+Y4OVRM7+IB06gUmbi7+wuv49J8AlTMYgE/kFdPDIMH6rAW24lOPr3mCoZeDMy5xz0jBj4rlv8WCpgD2avFxdlSCQsupkLhuwxU9RsNJpCjTkSQTl/Ao69oo6YSl9S64rrITx4muc105lde6ifPK6z7QrVXnQaaPshwzCM/0m/EH2BbUYVghoG6DUCVgmD72MoRWsbpCyPKDUx5cliFFhbNZa03YR4qCjvQQUT4Ybv5xs/57GZRVsAhdMk/xdqHrBE5xkHaTaALfMkfJjX+QOMkfr4uBI3eQrwlQBa92B2U5fVO5knOHkeTD5Z2gU8QwEEdPqmPJCjqnmpa0cgxov8NYf268sXrpPA9dwT8a5+yVsz7Seo0hHKJBUu+ll8Oqrz/t33JUxQMmML7VqfL6ivGSlkNHYanC1/frZm3605CUBOCKzdgkc5plm1OwH4ed1ElTHFDakZ+i0hfPqeG/Akd/NlzOnqKYBwhKGyYgcGX5eV5+RUX5+PEpV8CgtARV8qSmbMAg4wg2VbUABMMLaXXjceRVr28bDMaQpppPwVcJx4XxFbCQ6LUqzkRHWdzslBH54go+zTjc9kZJxwJH7utWoQKd1NvteXGX29qLY9UMb0c//AfULgWVar3IYT+osnSfR1C7kg/n5FDVS0p81mkGFWCcNyLjQ/8bUcWUpooTu6/M5U4coN7yqQAM+DyAl4O5vMsjO1KNe8yCsYQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3JldGU1dmFlT3hlZE9WNVlTY2RUWFNxbXpYL3F4RzlhN2c1cGxaVGtOa1RN?=
 =?utf-8?B?UTViR2Z4Z0V6Q3g1Q0IyTCtHMHRDbmJ2ekphbEZIYU9DOHE3RWd5czNJbzFt?=
 =?utf-8?B?dlRPc3pVa09HVUdmVm5DZ2xjZVpFMThpVExQM3VmWEtHdDZNSkkvYnJBbG9v?=
 =?utf-8?B?N0RIeTdndVRKWWNIZGtNR3pweDk5eWVpemh5MW9lcGhJSC9iUEttWWo3aXRB?=
 =?utf-8?B?R1VWTnJHL1ZybFRnNUhwSVdiWndnOEwweDh3Z2Yvd3Z6SFNUeTJubkFlTnAz?=
 =?utf-8?B?VmxsV3dRY0s2UVFaTFRYNlo5MDB3YUt3WUQ0T0kxZll6VmkxZzN5cHpIMkVW?=
 =?utf-8?B?OUZMelFnR29rcElLZEJFNFUrS1JsR3JXRDlEUzFmRTZQc0ZJRUVHU0x5VEox?=
 =?utf-8?B?bE9MUFM5enhKeEg5NTRoVUM4WjdoL0dGeXY1T1BiVDJEd2NWYUZ6azd3ekRO?=
 =?utf-8?B?OS9NOHY3ZjRrOVQ4ZTNTd1lVbjJONlRNV3dFQVQveGwwMm9VSjhlS1NzcVVW?=
 =?utf-8?B?WFZqTUJiWWQ3MjNiRHJiQW1EOTR6Ny94Mi9sWkpOd3JzL0s0TmRBSTV3NFcw?=
 =?utf-8?B?N3psdnNvMEhaUExQeHB3ajBLaUxZb3JXMGZoVU5KbFY5YldkcXh2T3RYUDJ3?=
 =?utf-8?B?ekozaFlsZjFtcnJZaTV1dWJSYTNDQnlmcy83Y0YrU2U3RTFlU1liQ1FCL3Zs?=
 =?utf-8?B?MmRoMGtON2VndzBpZzdEenRtTjNmTktseEVhK2NnYVRtOXp3VWhuSThkQ2lz?=
 =?utf-8?B?Ums4QXdWY0NHRUMvSENoN1JiV05mdnlUanhJZ1EyQmp3TEUxeExZQVhsYWYz?=
 =?utf-8?B?RVc0Vzd6c29RaStDUGJvVmNMaHZldk54eEE0TWZlUG9qc1pDWVh4azdSdnVO?=
 =?utf-8?B?WStwZHYrbk5XY2pFb2U3anlicm5HNVgvSXZsbUs4SHNCODQvL1FBWW82NHdl?=
 =?utf-8?B?NFNYaWk0SFlmTFRocDljV21XOHVkVXYxNkhPc2wvTFlrTTJZdldxa1U2TlN4?=
 =?utf-8?B?M2VWcldud3lCV2Iwd2orTUJqMjZmdVJKcTIvOFNGa093K004ZDM5a3VTTVVF?=
 =?utf-8?B?ck5SdHZkOWhycFBJWm0vQUpCOWpSQ3g5ZE1kdmh6OTFxS1QxbWE3MUZLV3Uy?=
 =?utf-8?B?NTJwNCtycDVpMUxyczNlT3V5K0s5YnFJYlNoVnpQdzdMRGRHdVNzZVArUmc5?=
 =?utf-8?B?TnVjYjc0NTVQL1J6VGhOcVdkb1FyQ3piWHlvcVRSKzBnUDMxOGZKL2lZK1pG?=
 =?utf-8?B?cThsVWZzNDNWaFA1RFFSU2p3VzZHZjRVamxsWHRnb0Y3d2JEWStpd2FEZU1H?=
 =?utf-8?B?dTNXK3JTQTQ2cDdueVZwWWdBM0IzNTlaclJkaGVzSWl3dHZPZUpob1Q0M3ZB?=
 =?utf-8?B?S1dVUjJOalRHUHdtMytNWmZsSzRhZFFacndoVTZRT0lHVi9mSjhLUVlDclB0?=
 =?utf-8?B?NWtYSm50UFdKR1hGNlhTdXNxb3lpS3l4cmNZWmVhVWVtdWMzaWFjWGU0OXVl?=
 =?utf-8?B?Z0FlZzkrQTZPdmY3RExBWHkrZTZUZ3VoTWJlUmtiMm9Mb1NZdlJrVEI5a0FB?=
 =?utf-8?B?cXlFQ1VhSmtGNFk1WUY1bUxzMmp0ZURBNWRyYm9qWDlRZEpmUFh0dWJqeU1M?=
 =?utf-8?B?QkZENHk2VklCdVdoRHlJWFgzM2k3a1ZQMWc3dWM4TW5uUnJYNWdMekVVdDVU?=
 =?utf-8?B?WVg2Y2krdmhoR1J3Y1JIK2RYeUtkUndWSmRGWUdjWXkrRGhBK1R2Wlp2ZStr?=
 =?utf-8?B?NnVWVjlmNm81TEhEdmlYcEtJS3FxY0NGMDFLeDZNNUY3cEpoNHVpVk5UQlZM?=
 =?utf-8?B?c1RmeUszeFp0OStxanpDUTB6MmFMeUxJcHVKRE1xTi9nbVZkaHUyM1JQcjVn?=
 =?utf-8?B?aUkwK0dyYnlxbkRVeWp4Z0NRVTFjQW45WHBqckp3eW1kSzd5TkJ0VHlPaDFo?=
 =?utf-8?B?TVVQZFVLZ0g2VGg1dFRkOC9OVTI0dkhsRkw3K3pzeHNXY0RaajZZMm54bFRv?=
 =?utf-8?B?elorRjZseTFRRTAzMldpeGtZZTVqYkxKcU5UZkx1Vkh3WURBeU5yOTJKU0tw?=
 =?utf-8?B?Q0RqaXBnWFlOeFNGdGR3S1g1UE1SWHhEeHpkaDFJUUtqY2hMWkh5dEI4VVdK?=
 =?utf-8?B?YnlFNmNteTB6Zi9FRXU3NSt2endXMytqL0toVVY3SXZzaUpvYy91V2N2eEtV?=
 =?utf-8?B?V1YwOU1mUElEYk8wVHJ5Y3o0NzJYeTVBeHcwMXBnMU5mRkRzSlNVUm80OGVX?=
 =?utf-8?B?SnFRSFlmamNaMzVxVldPT2ZvWWl0ZDJFMXdlVkY4aHZ1SjZkMTl1WGxiNUgy?=
 =?utf-8?B?VERxNmxac0ZHa0tPaVVVWjdpaHhLdGNDNVRVQU5yeC9kSVQ5VDdzSG1vWnc5?=
 =?utf-8?Q?W4289NS/flzIQ8nU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f65fe4-1e28-4fa4-a002-08de85e48228
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 18:22:41.6937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oF7htlI+jZ7d3jsPFQT9OG8csdU3Bbnex58iqBtSng8hugCTY+uN6jHkcM/MVmyX5s4b0Ty86YVC+8AqtfNIwG+yUkAG4otcSjx3HUSiwC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7836
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D79F82D0C23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/03/2026 1:29 pm, Ross Lagerwall wrote:
> From: Wei Liu <wei.liu2@citrix.com>
>
> Remove lazy FPU support from the #DNA exception handler used by PV

It's the #NM exception handler.

The short name is "No Math[sic]", despite the long name being "Device
Not Available".

> guests since fully_eager_fpu is now always true.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>

These two tags need reversing.  Technically this says that Wei
reviewed/accepted the part of the patch that was your changes.

> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index b6b119769722..fb1b94245850 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -2045,15 +2045,17 @@ void asmlinkage do_device_not_available(struct cpu_user_regs *regs)
>      }
>  
>  #ifdef CONFIG_PV
> -    vcpu_restore_fpu_lazy(curr);
> +    BUG_ON(!(curr->arch.pv.ctrlreg[0] & X86_CR0_TS));

I'm not sure if this is safe.

Firstly, since Wei wrote the patch originally, a new source of #NM
exceptions has come into existence.  AMX shouldn't be enabled for VMs
yet, but this ought to be 

    if ( !... )
    {
        ASSERT_UNREACHABLE();
        domain_crash(...);
    }

to be less fatal.

Also, at this point in the series, cpu_init() still sets TS, as does
vcpu_save_fpu().  It's far from clear that TS is only set when the guest
wants it, although we have at least excluded the Xen paths by this point
in the handler.

> -    if ( curr->arch.pv.ctrlreg[0] & X86_CR0_TS )
> -    {
> -        pv_inject_hw_exception(X86_EXC_NM, X86_EVENT_NO_EC);
> -        curr->arch.pv.ctrlreg[0] &= ~X86_CR0_TS;
> -    }
> -    else
> -        TRACE_TIME(TRC_PV_MATH_STATE_RESTORE);
> +    /*
> +     * PV ABI QUIRK: Classic Xen kernels (2.6.18 and SLES 11 SP4's
> +     * 3.0) rely on Xen to clear TS. PVOPS kernels (3.0, 3.16 and 4.15
> +     * are checked) always clear TS themselves.
> +     */
> +    clts();

I think this wants wording differently.

"For better or worse, Xen's ABI with PV guests always clears TS on an
#NM exception.  Classic-xen Linux depends on this."

The behaviour of obsolete PVOps kernels isn't relevant to the ABI, and
now that Linux is strictly eager too, I doubt this statement is accurate
any more.

> +
> +    pv_inject_hw_exception(X86_EXC_NM, X86_EVENT_NO_EC);
> +    curr->arch.pv.ctrlreg[0] &= ~X86_CR0_TS;

Swap these two operations.  The optimiser will then be able to tailcall
pv_inject_hw_exception().

Clearing the guest TS ought to be tied to the clts() operation anyway.

~Andrew

