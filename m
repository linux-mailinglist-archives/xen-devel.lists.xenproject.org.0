Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F4564D802
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 09:50:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463185.721331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5jwE-0005g1-3r; Thu, 15 Dec 2022 08:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463185.721331; Thu, 15 Dec 2022 08:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5jwE-0005dX-11; Thu, 15 Dec 2022 08:49:58 +0000
Received: by outflank-mailman (input) for mailman id 463185;
 Thu, 15 Dec 2022 08:49:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g8Eh=4N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5jwC-0005dP-Fq
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 08:49:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2048.outbound.protection.outlook.com [40.107.22.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71215fe9-7c55-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 09:49:55 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7328.eurprd04.prod.outlook.com (2603:10a6:800:1a5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 08:49:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 08:49:51 +0000
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
X-Inumbo-ID: 71215fe9-7c55-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYAlu2jMIgkMmnonw+GuR8WDmNel/aNXNJYVC9xMzNheRstvpmDY/439r5RoQ62/lZDiizHZQeB/+SJ8q0pVQMQsLoKVjJIC3e79WkIMTzvt0SkzUwsb+7gjDrGkGivTlnDgpIMFU8l5OY3k9VuDnqYWbzYMYI3Yt5t+uaxxvEz27GVa1oTvUHSMXvVSZr000HvgNTf5NUT2alZI11voYY04Pi7gRCU3ox3t5kNfWr0mTVP4r0kSEs9SO0p/IwqVABQfB4TaoSAafaoaywuEyk5/osfDYp9T/uL3fHT5HETvMYta7sOLbshOfRpW5BM91Bt6Q0u1Me9xF8ERo8Ib0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlHe8xFggJqRRsM1weoTECRgK4E0qlYgV8VKRyxJB0E=;
 b=BeEBLp/gXdANPgkDgKzcQ+M2XKz96jwzHMxj9nTBqqTNiyhyIy3w7NXgPvEBQ1NdeVIcanykfBMZBIcq8tgGv6vKrsoNPedRTXmmtT2fpznAbV+pqJ/2OM4sl1devCXExh8waqLn3sCwS1F0g1I2JmXhaUhtigvxxBB5wajCY5LBL4d5UtF6/Xb08xCiPvfW8/O4WZ1zh3Z581+P6pZXLZ5w7p6g6zDIA+7T+YvTU9l3E0vfI9sEHs5Vx2NpfuP6y/lEkQWn5LOkrK8+c4EZ8aFt1lkZE8qYW+nHwHRzDyur5Kh2bzBvnWiGicSwOgR1m7pLR0q7jSqLURYm6VrONQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlHe8xFggJqRRsM1weoTECRgK4E0qlYgV8VKRyxJB0E=;
 b=HGum5YgP69kM0hgUv9SWCKxnwPaVDkwKLq5Ry3v+eVuf2UxmGUleGG3z9ELcVmGFxcBmXDJSh+MKaRNGIMfMn2PYEYuirqKh6q8cevWqZKYgDivZEp0UhYD4DX594Pj3sBgkl9nBzAJoSCeFtjz2+5dKSXh28somN/+098xBwPgnoMBLN9vXlYw2NmAmcPDtpiYAeYo9ZURU0qjprYWV365iWTXG+9iS+vN3jbAGqL786n5wbevjQPhIoxFRGro4/x4cl07ZPouWhtmsLhu+OblcuGnFjskIyLTpxSpW26wbACMC8Ernk5kUDRNFyvTnv/BNMNNtHYp2b15SjTxyLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a5e1508-b7fe-0bf3-6253-a7e546226ccb@suse.com>
Date: Thu, 15 Dec 2022 09:49:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 04/12] x86: Add memory type constants
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1671057808.git.demi@invisiblethingslab.com>
 <5e0dee8a2cc5076b677e813c9ee61fa08e8e4c1b.1671057808.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5e0dee8a2cc5076b677e813c9ee61fa08e8e4c1b.1671057808.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c00c571-4d2e-48bd-07cf-08dade795497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lmk7K053Osmbefv/5MCeTGK6ItCa6jYh0eMJb7Hxmo5E7ou4zKIfZU1LpKRFB9JkCEL1zB7LT8J++6379kMvU+2xOxbxlYOdk6d1uQ5GLiIeZ5vYBa5VFloiWXiSQ0r5jjahIv2mP/Y2LqfQvHS6P4fX5ci/mSIj49rbJ+Q96CPkP92542hqUbXheB4VWcVKIJIxELRqchSDYLze+K1EVGdvAsNJ3KJwB3pJlk4ZOzx+stTxdf7Y7egtwzQXDc+koUWiBF0Skmb+n4KOI1Fj8VQkrGREm5xp+5UuC19GtqYWnjY3V8n4Zd2CG5IMS/q8Yz5lsTPgiKQvZScTbLTyl4P2V7mqK+QLl85yMFAozw+muMDIcsFpECjRiXaRjCOZKFhsaFUYEjjppGVMVey21l8JlK2ZEYq894kMRA/ea1iRj1yrm1crUnwivvBgsV78I1jhakBBU4QFtjaSNjWUYXNYe2zJvZFrBOtNCFjLuhBkbflcIjwRcm8YMGLLh9uEFVYeYWrXgypSB9lvDKV9eOzlOlzhfw9whXsM+YJZIIIc4UO5AXNQAIxdB7cSqEBxvUgOx2jRmiVflySMD240bzXDw1yMKW8C8RWCZbb30EunBtuwCbjFV1eqjWMcj49ziedB/cpOrFgpT+qbTiY35SG6T5o53UYUcJWzcHhGUDK3HKzrvStbuQx1jHOzs6HoftsaJ7E6NkpDncFMlHDXMBnERxTgj77d3Mwv0F9Iny0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199015)(6512007)(6506007)(53546011)(26005)(2906002)(31686004)(478600001)(186003)(6486002)(316002)(38100700002)(54906003)(6916009)(4326008)(66476007)(8676002)(66946007)(2616005)(66556008)(8936002)(31696002)(41300700001)(36756003)(4744005)(86362001)(7416002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkNNVEppRmlwWUt0UHJFTE5zaXhUMzdHU0FFbEFXMUg1ZW5wS3ZKWWtoTW5J?=
 =?utf-8?B?ZTExVXFmMmhjYVB0dWhaMlJhNmh4bGZ4d2tHYUFZck55Y0pXRXNvR2tSQkNJ?=
 =?utf-8?B?OTdEV0lEOXJCZ2VidzlWQTFDY2xwM3BlZ1oxUTMxSGdTdFdYVS9GSndCZmkv?=
 =?utf-8?B?cW0xSnhId1gwbkVRU0duOWtlb1ZXMmJlZHlvMlpTbFdNSzhmNURTcU16S2dS?=
 =?utf-8?B?cThtaDZFTUVBTU9MSVZueFlFTmRmQjNkWEhrUm03VWgxK2kzcnRzMmJWejMx?=
 =?utf-8?B?T1hhdnJ6UXk0ZEs4Y083MndrZlNjR3NlSTg4Nzgrek1qdm1USkU2eEJjbUth?=
 =?utf-8?B?N2pkZUx4NHVYU0ZiYmZ5Z0djRGU0UFVQU082THoxNGRhMU9sTG55NlNFRGtz?=
 =?utf-8?B?TVBIaHQ2bVphbXdmN3l5NjkrbWc5VE02QTlHSXdYU3lHY3QwTm9CVlpkUTl3?=
 =?utf-8?B?SlZUTEc4d2hQYkdOSnF2TG9Zc2g4NUlZT2U3QWZ6R1lKRHZrcDlZbHUzaEY2?=
 =?utf-8?B?dG9qaFRJUFJMVGFNRWNOL25oOWorRy8rRXBIc0JWakxOK3c1RGRrWSt2SnZR?=
 =?utf-8?B?aXF3eGQvd0ZVLy9BNkg5QUl4Szl2dDExYWc1dUpOUk0rNjdDckZBRGd4ZnJR?=
 =?utf-8?B?UDZvRFJ3MDJlSDVPL1d5NHQ2WnJhdzNUaE5MVW9RM0hGSWRBbkt6Sk1SSlJG?=
 =?utf-8?B?RS91WXhVNXA5S1JWVjNFK2gyWjA3MUtNVDFuZWFFY0s1SDRBYUVVaDNHOFJJ?=
 =?utf-8?B?cm1SZWQ2RW9PbXRxL21wMEtwUzRRTDBOOTdkK2gxdGcwNzhCUDRxM1NFRnRw?=
 =?utf-8?B?b2JlWEYxWGE3WnlBZXZrS1U0UlZUazNsem9pOWhvVzZVN3Q5eFQraUtLcTR4?=
 =?utf-8?B?ODNjWS83V3E2VWp6U0o5SE1vTCswa0tLMDIyT3lmQXFvbzBZVmpRQ1hDVTRY?=
 =?utf-8?B?b3M2Z1JEajZ1b09SWi9HZ3Z5MG96QnhZZ3hvNFhqVzN4S3N3cHhOQ2w4czgr?=
 =?utf-8?B?d3ZkVlNKdnpvTWxxOEhUMjM3MURtUTZmV2hTQTJTRGkxSEY3SWNJUTBPN3BJ?=
 =?utf-8?B?aHpsOHdZWXQ0UXM3c1B6ZjdEOFdaZnhpVUt4SmhoaEs5Q21iMFc4bDJyTGlX?=
 =?utf-8?B?anIxbXFZdGhiUXF2STRESURiUjlyTVFTZ3VGL3Q1cTNHQ1U0b1kwYXFvTEVi?=
 =?utf-8?B?aDYwc05OU2tnUzg4UHpxcGNjZkxweUtLemF1dXY3Y0lWRmQvWHFxVTNDemhJ?=
 =?utf-8?B?S21UVzB4R0lQNTBxZXlwOStnM01CUU83cFNMaGtSSVRDT2IySXNKVm1uVDB4?=
 =?utf-8?B?akV0SG1sZVdpVHRXdmh6TEpMbTc0c2RjZlBhazZrTmVsbi9McnU0SVVDdmt4?=
 =?utf-8?B?UzR6bGwzbFIweTZQdHg3VnM2OWtMaEdkQVBvK0J2SDhLQVRWanhmQUdqYWtE?=
 =?utf-8?B?K08rdXo4U3c5U3gyZDJIWXlYZFkrTFBORnlZa2RHUjBaNy9JQUhXaGlLclQ0?=
 =?utf-8?B?NTRLV1ExQXRRam01TTdEbW1Za0ZmSTR0bXluQ2lXaHhxL3F5c2hHSmhDUlN2?=
 =?utf-8?B?KzA3NkJaR3I2c2NuNldsVDVYT201YU5aWjNDak01SlR1dTdjTGw4NHlRVjlK?=
 =?utf-8?B?YUVtQ0pYYWhYTytkWXVvayszL3prYWN6WEFUek9rZ3NvbVNqTkpRb1RhZk1U?=
 =?utf-8?B?M2JMSkFGTkxqenBNOCtxVzhWR2R2dEtYcWZia29aajNrVmlYakVybDlyejV1?=
 =?utf-8?B?WEZUaDhYdlZROHNPc0ozRDN5T1hBRFpLL0tWUGpyYXFKT243TU9kMzl1ckVP?=
 =?utf-8?B?cnR1MlE2VG8yQk1PSnFtdGVWZW9TdEw5RThuZW1tMHo1UkJ5REFWZkcyNlE3?=
 =?utf-8?B?L2d0YXlqSkJhbnM1OS9Xb3JjOEw2TXMzZzYrdGpJZWJlMUhHTlZ2ZlpNSEVX?=
 =?utf-8?B?QnRsalZuNk15NXJEWG8vLzFKc0R3NG9oamtBcVo2RjZEd3FmdWNyRXVPY0Qw?=
 =?utf-8?B?T1hzT0pJdFpFVDdVYzhUeHVRV1lKbnlSUGN6bUhmYjdHclNvS0djSnJENDM2?=
 =?utf-8?B?Q2NQcE81OVZudUFEUXljcFduZzFmOUdGQTdlaVpyS0lNUThCZ2gyT0s3V0li?=
 =?utf-8?Q?aFLR66+92JlEt2lSXk+7CL+oT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c00c571-4d2e-48bd-07cf-08dade795497
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 08:49:51.9033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EeTBbrLMA0bHiPhroW6i9XBh8lJeOfQ7hMjznQIY30FkPPPJ2rMaZM+3d5S0RrGC+QJDzS+OOWo2UUeAdWZ7aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7328

On 15.12.2022 00:11, Demi Marie Obenour wrote:
> --- a/xen/arch/x86/include/asm/x86-defns.h
> +++ b/xen/arch/x86/include/asm/x86-defns.h
> @@ -153,4 +153,15 @@
>       (1u << X86_EXC_AC) | (1u << X86_EXC_CP) |                      \
>       (1u << X86_EXC_VC) | (1u << X86_EXC_SX))
>  
> +/* Memory types */
> +#define X86_MT_UC         0x00 /* uncachable */
> +#define X86_MT_WC         0x01 /* write-combined */
> +#define X86_MT_RESERVED_1 0x02 /* reserved */
> +#define X86_MT_RESERVED_2 0x03 /* reserved */

As said, unless there's a good reason to use 1 and 2 (and not e.g.
0 and 1), I'd prefer these to be numbered 2 and 3 to match the
values they expand to (and the numbering then not being as arbitrary).

Jan

