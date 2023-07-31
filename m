Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3A4769949
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 16:19:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573108.897491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQTkG-000290-Ct; Mon, 31 Jul 2023 14:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573108.897491; Mon, 31 Jul 2023 14:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQTkG-00026r-9E; Mon, 31 Jul 2023 14:19:36 +0000
Received: by outflank-mailman (input) for mailman id 573108;
 Mon, 31 Jul 2023 14:19:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQTkE-00026l-HM
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 14:19:34 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2045.outbound.protection.outlook.com [40.107.7.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4408e7f4-2fad-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 16:19:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8305.eurprd04.prod.outlook.com (2603:10a6:20b:3ee::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 14:19:02 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 14:19:02 +0000
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
X-Inumbo-ID: 4408e7f4-2fad-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGNeovl3uSjWjjEaKUTD1227NR/KjA/Z6KNqLXIsZFA+MS0O831NUlCn6+dBVJwF/9teCsfHIfJq0fTjZ/gFJ2DjhlNhg2vbFD0dvE9MW/PcUnS8fHyae8UDCM79P1uwlqxcMgT0kugPBdIiAa7i7lujQsQZQ8MuM+5b7LliAfcpgYiUgAP8+VeyfQ5SLUjzwlxOPxbkGZFdQjOf1eRflVPiNb4SgsrDZte9PBHSoUZF3lc7x79Ti7Bhg9bWGskBRZP5qtCF3E8F9qSIWrUpN0wu39VHIbR5i0RRdlFuCsNI5beR11GzPtLxegbfDTqNvS9miDSGKzFXyHUUj15cPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUdFl4vZxDrPjsHTzYciQBMWxfrMsPxGSPY01MXXnlk=;
 b=g2AWUa5QBRCiqQDhW4rhRA9KO35TA2KhProm/on/c2Lm0R5SFlhaiMsNMdHe2+B/bJvNjZtlBIdvZe15ykeqX8LIn3rOQDaL55m4EnPxn3gZYb1upU/Y3GqIBBjBgRLQ8VIC7nkY8/oxL0Zp6SE2GAeQQ4e5KKd0Vd4+aqusjXEJHYbFO5fwR+fY3Doe12DgGvCu/Dd5HasEnR0q2edI3UPk1sJQiPW7T0ybx1D+aQ9Jypeg2IW6Pmz7mY/H805oiKYNBFVQ8COY7LL7lx8JuueHMUhOfWSWU8ATztJdPkylTn/YILQtcyV/ZV5KOPonrdvbICGCgAU68PWfTjYDqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUdFl4vZxDrPjsHTzYciQBMWxfrMsPxGSPY01MXXnlk=;
 b=dmpkl4ofLxW1IXF1PQF4OlsKCtJU37bjm3wc/qBx3YlCOuhyu4uPAIxA40yX6ElusZ2BCyuwiqYuB38QQXY/yPzBPTj2x/AiZYZp/Lgw//1e/+Vj1Rzld/KiEdtFJQxyfiWM/2QyCfqZH2oIb2FoI3mYBlmYRLAosaWZIYsTBGnhNFrXkT2zTyy6uaPgu+2AWesxYDvzF0w6t5Ml9neJihFHrOG7INfhcHmvhefIAFLrVHchq1kdf3/IFyKb4Qlxq97PnKSFBR8sSNuGPPMN5kzzhiU3FVbeTy4l8m/3/EMc3fNp8Cd4AyK8vET8WVWzQhgXv+8N6FdZPezcOaw6sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <340c96a7-02d7-7434-4de3-8d1b12213167@suse.com>
Date: Mon, 31 Jul 2023 16:19:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH 2/4] amd/iommu: rename functions to address MISRA
 C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690810346.git.nicola.vetrini@bugseng.com>
 <838e606bfe8b83578970ce73a1ac7d71ccefcd2b.1690810346.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <838e606bfe8b83578970ce73a1ac7d71ccefcd2b.1690810346.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: 73c209aa-6b73-4eef-b737-08db91d116cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7RReNyBEdp2w4b9PzvGOcESk1rJksgVZ+PRgiCtJSUxAomQWjPrSO8sVsiVCfcAv4caQpZwHpbgkGvTJwOdPkD1dYPkKHVRAXPyfWRuuowRIKg0ul+4T4pVMJNb33XUC49H+RxTqK9HczQbKgmYyff1zRniY/BDDY4N4DbyOtwNfHz5gpekXYzl/2+GwH8qPsBgAL/Jz+92l5nbtVZCe12byfA2iZ4rYnItfY2UP8SLLOvlM0+M0WN4gcsLu2n7JKLkui7UEEYwfPctu85DmTklvauyClj44O2y30jj/izsUnXehljk6BEzoBbMU01UApDCgQhMH340jQQ63BDLdrB4IFk52YxtIRXnZ5/wkuKKH02ojmk9ue0Pr3iIMMkY2x6ltb4OEfp8OTYyP+MeCUUuCxlElo8JK/z3jSJ188Dw1yW6CmMsYFRjvXreeHKNM/X9VuVE3Kwx22TNKtKybMPxHyDI/kNOY4nBMSfKbPXaRTJcw8dGaXYGV+f/6dNIG61VlPHkvWsyZPuf4C1TPSYnh8VE7qMNd5VO/q86VHndAv4kCSZ2PtChgEVlS68m8mxDbeJcaPddRUqpqhKFl+ik6bmnPsFKJqDf+L0EZea3MP86zavzsoN/ohdmF0UWjqOTo5FAI/ccY466o2iWGGQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(136003)(396003)(346002)(376002)(451199021)(6512007)(6486002)(36756003)(53546011)(2616005)(26005)(6506007)(186003)(66946007)(66556008)(41300700001)(31696002)(66476007)(86362001)(316002)(4326008)(5660300002)(6916009)(8676002)(8936002)(31686004)(2906002)(478600001)(38100700002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUFmRm90YkNTQ1M0bjFwdVBmWEllbUlFc1R0YjVDL0toc0puVFZTTTFSZ2Q2?=
 =?utf-8?B?KzJXQitLRTBvTG9jd2xoRXFmWlJiU1lHRzhidlF2N3RzS2ViQlduNC9DU0kw?=
 =?utf-8?B?Z09NNEJVRmJKdithWVp6UVRYTVNoWS9oTk4wTlFKd3Y3bWJFM25nQngyRWFD?=
 =?utf-8?B?cmtQWEpiT1pYMk04MThCYVBRaGJCQTR5QWZpRTdGNXdDeG5scGFOUi9OazBD?=
 =?utf-8?B?eFhRbWgzUlFVN2lxTTNTTFJNUWt1THlXRDJLdFZBYTB6NVUwN3dsYllCOEMy?=
 =?utf-8?B?dk1XcmZ3MXlpN09ZVEZHcUJqamxFL3JDTUdDMDBZTUlNUldycnc0WUpxa2JX?=
 =?utf-8?B?YmVRYzF3REVrYUY5SHM2OW1LR2U5YXp6cjFXNjNVbnlSbzFqQWkyb0FxamRP?=
 =?utf-8?B?NHVoTUQ5T0xRY3ZIT0YzbVo1NXQ5YmttRWF1aW9qamJTaU5jS3UvS2lNeTNW?=
 =?utf-8?B?SDYxV2hKTFRwR3JYNGRLN2oreG5NUmlUMmVDMG1yVUpYSC94UCtENVpyN0ow?=
 =?utf-8?B?alEvT05BeVpwTnN4K1RiU21TSGNGMTRDQWxoL2RNeHZTbWk2dHNrVW9UV3dl?=
 =?utf-8?B?RGFxUDJnQmJjNTczRTVlRzhvV3pENnRXN1Z5NXJDWjJZcU5sMWVDMXZtY084?=
 =?utf-8?B?ZW81RGpENUpaRkF4UWZvaUZYTDdvY2VrMExQS0x3cDd5QnBHRXY5aGxCaFJk?=
 =?utf-8?B?RkxiVFJSZnREbnZDTDNsSFVQOWREVC9yRkwrVmpuQUJGMnRiL2tYb2N1RTJT?=
 =?utf-8?B?UDg1b3hyeUhnNWNUaHVEQ3NoNmhzZFVZVkJRVkc3TUQ1V1ZkcFNPNk9FNFA1?=
 =?utf-8?B?YXcyZk5ESTc0NXNmQnBLMTlRN3MvTzAwVUVBSENGNG9ERFFSTGRKanVpZ2tT?=
 =?utf-8?B?enNWR1gvYkg5NHlWeTRVYS9CalJyeDIrU2xaUGI1T3VDbzR4TnIvSithQm9H?=
 =?utf-8?B?UXU2K0o4VUxuazBJWHh5Zy84cElEOHl1YU1SRyt1WC9BZXVjQjJEcEoxT2tv?=
 =?utf-8?B?ZG9GZm41djQzMnJTVmlIQlFJV09qLzBuS3BIaGZOSWNZZUhpa2NWL1pvQWlI?=
 =?utf-8?B?bEdWdG1JNVJUUk5XVDJnY2FxSDZucThsQXUybzk4dzFtOXFiT3RhaDhRZUpt?=
 =?utf-8?B?aldxcWw1bTI0SFZVd2JwNUF3ZExZU2Z1eW9qWHBVZm5XcnhUZFlTcTRmdUwv?=
 =?utf-8?B?MXJVL2VLdXdmWVFBSXJCaHRuNDR4d1NlS2Z6ZGoyczRrMnViMnBLdlZLVFJx?=
 =?utf-8?B?K0VxNmd6MnZBRFd2ZjRJNlZCMmIvR2VXTy92eEdMTisySG9zQ3ZtS2VkcnZC?=
 =?utf-8?B?VUJSU25pZDRnZko1Q1ZWMVNuNXRuOXhDSkxJa3R1aHNieFhFNGJlTURrSCtR?=
 =?utf-8?B?TVJUZDBvMDRWQmZHMFY1WlhGWXZNeUJYYmRybGJIbmFDMzBYNG9RSlRZK3hl?=
 =?utf-8?B?NlNLaVNsaDk1T2NSd1VsTHdBdTdZcWFWRkFneVJnc2NZa0lIRlhLYmk2WTVJ?=
 =?utf-8?B?K0J1dFg3bWhmTG5WMzcxVUQ1YUZZMUNHOThwNlZwWFB5emdaL1AzdFJGMGE2?=
 =?utf-8?B?bThvS1RlQnpSWnN2MCsyWVZDRUhtTm9oMVM4QUtGVXNmaGpDa0Q1Nmk0R3Rq?=
 =?utf-8?B?d1NYYmJlWlZMSmhGdU5kYWdLazNRcGM1czJlUC9ReTRiNEowYmFlZ2wxYVFi?=
 =?utf-8?B?Q3NLbElJNEt4VlBxVmYxOUd2OVpkdUlialhKNGV1bllQYWhrSDV2Z3pWcGxK?=
 =?utf-8?B?Rkk0YTlEb1NYekpnNzBOT2lXZ2lETWh1QUw2L1JsYXdGSUF3Q2R4N0dRVnRQ?=
 =?utf-8?B?ekJsZTFhQUMyVzhrN3pTWXJPYlZ3REdudmVsbUk4ejUvZHBtak9mQ0lNMDQw?=
 =?utf-8?B?eWhwa0JWalBJYmxGWmNLV0EvMElHOTJGSnA1cHEvOTZxN1NBUmZ6OGx2TE9o?=
 =?utf-8?B?eDBQaHI3ZDNsWnhLWXY2cVlDNzhvamp3YXEwZVppS2NOUFdDcElwcDhCMzhu?=
 =?utf-8?B?MjFVaXBzV0J6YzNZa0NLWS9Pai9MRE55ck5OUUh2ZXBRYWk3N1I5ZkNlM2tv?=
 =?utf-8?B?QWM1ZG5aWW5neUhKeEZHb0pUdDV6dzlNNlJicXFnZWgySUZTNHMxdzVub3BN?=
 =?utf-8?Q?/6TudVHqbh7rZ/oB0AtUkTMKL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c209aa-6b73-4eef-b737-08db91d116cd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 14:19:02.1146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5kUSp/nMhSVcV0bkK2Elw4UJza3CRk44fB71/v5y/44jeWmA+KEQ42UsA+pmvzgYwzsfvSI3XoHSeQQSv44Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8305

On 31.07.2023 15:35, Nicola Vetrini wrote:
> The functions 'machine_bfd' and 'guest_bfd' have gained the
> prefix 'get_' to avoid the mutual shadowing with the homonymous
> parameters in these functions.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Of course there are several other oddities, but in the end the entire file
in a single big one, I'm afraid.

Jan

