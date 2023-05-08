Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 189F46FA057
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 08:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531265.826838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvumP-0005pD-JD; Mon, 08 May 2023 06:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531265.826838; Mon, 08 May 2023 06:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvumP-0005n4-GE; Mon, 08 May 2023 06:55:29 +0000
Received: by outflank-mailman (input) for mailman id 531265;
 Mon, 08 May 2023 06:55:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pvumN-0005mx-Sq
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 06:55:27 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20620.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ff77995-ed6d-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 08:55:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7351.eurprd04.prod.outlook.com (2603:10a6:10:1b2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 06:55:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 06:55:25 +0000
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
X-Inumbo-ID: 4ff77995-ed6d-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEy0RALmbGAB2alOZ96cfOKjYLBmaJMbhZLd4zkShaRW7sx7YPzsa6UGPZfCgBV7yYn8PxaC/MiWVE8jWLv0YfKmlVau817fixqvwfw86tYf7d4pcJQ8iG4XYqxd0XGngoE3nZbwa9LEsTZteZ+ri2+AVT2aP6yihGBNnoLeH2wqrp6P0Eqk9vq/EdTOgT/kjk8vtgti4hX1me6grATIc7IBzQwBiM9peEnJF4WoCjzAtLUWErlJrA1m89WubbS7+ZVoJsO8oW1IGlSe8w224PkdEIepj4KKnRFV+b3RGIARnZ1v7BkET1yLWHTC4j4c/VecFv0/HqFineC9B2apbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdXLfsRIT6/1HTTPg8tyCJ0DN0VEt440lgmkVWRuqeU=;
 b=ErCFIrqiKqTl6RoSOYfx8ysqF+qynuoa/qwuda6IuT76rZyVK+trviGIhiyL5wVM9aJbflHVk1OxQv/ltSlSQc+mA78N37q0lbJMHo3/CZvnXb9DUanS65jzEGDh3jHSM7QeUJzXJuFVyElsRS4uu3AOZc1pt3PBjQlEym29PKunmudHkJBkcDlsODEHN5jKCPydcfZC1FuWZWhRaDsvGc+wzUdXq7UBu/146lCSWgNJFdKfbC05uBkK+Nrbf1ACctwNnNpdlbSdE+a+wwowLQHvSF5dCc/WypQ8EC6yIbcOJBTcw3Oqx5Pim9pYDHCWcZAynB0laBhkArL0EqMycw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdXLfsRIT6/1HTTPg8tyCJ0DN0VEt440lgmkVWRuqeU=;
 b=okHImzc9zT2A6zM+zRplEereDUDkpxUAhwLtu7AMoahBWPX9ZydzyVu9CfiPdo7XpjPD82/i5+CHTUPSETohacGJCNY5Caw8Lx+32ATIGwCGCltfYRFEeneyKXQioAF0Kvpvg/JszKJZfGcAAZUN9fTEAPRBAfVXwAqP3mA7bLhT4B43wLYwkTEZVPkSP+UrffizdtbPlWv8OwjT7YCInZOYSBcKOjfvxyTp3zpuminxu+J9IaakJEHkvIhh/k2PshUfMC0pg3ktWE+XWHl10LZZ3bAklxBZMl4r00Aw83EEGr2wE4pNeZ27TIZzOEQCXO+FBmmZYzV6G1uQxp3bWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <76d4b625-2864-4452-86fb-70a4413bb886@suse.com>
Date: Mon, 8 May 2023 08:55:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/6] x86/cpuid: Rename NCAPINTS to X86_NR_CAPS
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
 <20230504193924.3305496-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230504193924.3305496-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7351:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b106de3-d88b-457e-0256-08db4f91335c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DYBulBXXqqEQLqM5iRKPOzaNldxVL3ziuteYHkwU2GRL7NC63fvJs/pTkCcvTeoMP+BCajLMu9DzIJGjrXK9dkNOLdIIf1J6PE98Mt1t+ZXvhTnkk0U3ZbTWmTtLUYq4Xcpy/uZGnRwxeepdlw/+zOVqYPCbw7u+csVSRmbgTYZ9ZhTxEEdp/MM2AXNGFtMGKgzYZl4CHH9m3FSR8PgSS4d88YThEnOOk3CaU4HLfI93YODtuy4fbM1lBqBgN+yPwfJdJ8SormTqe1Kstuc0pqNwXFw2XUcWB/StlBMGdIMXAQdAxwuULJ/BY4HSp0jGDRzQewQkIkNnMXWnYbAVrZRgkF0N5ykKGiQe79WB9353OOxZ7/eGhdRDMoQUDVKHe+uC76AaIy/jlOR0n47nUGYf7eAM80jkdi1rbRMlfqXPwK4QbqH2yDunz6Ol6+E+pVrZBQwdKZXb35HiehFB6zhAFBnE1lgV6D4OOJ1k0s6w++Azi0pJz4Z2Y8sz07tYxZPwyF3iMNQJph7xgHsIIc5YoEs/vJlImW9qykkQsdmsMfkmYE+irMIWFjKyu50pr03A0Z9ZS2HpMmUbVmEDO1E6RaJQXfBWRTFu2YhSXUpYjn5BpyK7D0tS5wnsJwP6pafyKO/a7C4+jShh6OzKqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(366004)(39850400004)(136003)(451199021)(31686004)(6916009)(38100700002)(41300700001)(4326008)(36756003)(8676002)(8936002)(316002)(6512007)(6506007)(26005)(53546011)(6486002)(478600001)(66946007)(66476007)(66556008)(2616005)(31696002)(5660300002)(86362001)(186003)(54906003)(2906002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXBIU0pxbitrZmxCU3hUTVB2c3NkcmZ2QVZzTll1V0JsdDFCN3FFN2RneXJz?=
 =?utf-8?B?T3N5RFhFMXR6RXhyWTZHbkw4aGxrYUNaTktSVHZZd3o0dWdycFJkQUx6bm1k?=
 =?utf-8?B?SGdwU1NiYnhjd2hORDVmYy82UkVlYkNoeWFnUDVQaWFQRWZqVjBBQWNaUURJ?=
 =?utf-8?B?NjgrTkluSlk2SG1EZ3NLVVJHc1NQV3ZGVjN3LzZVaXFQSGdQc2hFTGRUR3d1?=
 =?utf-8?B?bUV2emQ0czRMTDFoaWRWZzF6a3hZZkdWdk1kUm52TnQ4bXg5dEh1WEU2ODdu?=
 =?utf-8?B?eWcwQytKYXZRUUNFOTNPTTlYd0VIektxOElGQVdWWGdidzBIVmRMZTNSQ0tL?=
 =?utf-8?B?RFIrTWpMbG9CYk53dEFyUnpmOFlEcmduT2RRSFdHZHpkTDBrd0VqWFc4WlNT?=
 =?utf-8?B?OXVNNnp3a2lHcnVLenJqMVVYdkhiaFVzME8vRWVCdVRnbmlERUhMNGV2MnZu?=
 =?utf-8?B?M2FLWU81WGpIRklDdUhMd2s4QkFzR1pQVE9GU3FQS1E4SmVhWGJtM2pZT242?=
 =?utf-8?B?Y29wYytVc0FMdEROY3FqY25vY0Z6dFkwaFBTZGhpTkRQQThoNW9XT1VvZTF3?=
 =?utf-8?B?eW9nNy9scW5kYUtJYzl5dWo2THFPTnc2MXZXWm0raFJrVEpGZ1NhNFY1Ym1K?=
 =?utf-8?B?ZEJhNDhTRDlCUHhKODZCbDlNSkRMcHZqWWU1MWI4cGM0SHF1cnhGdTl5bmQz?=
 =?utf-8?B?TFE4eDJIRk5CZTdmRVZqdkJvUnk2WXNha2ZPOThzcHU0SHlCRU5DVzNGc0pU?=
 =?utf-8?B?N1JwMElNeWFCSWgxTHd0Y3doNklscmRkTDYrd3hGSmZDYW5EMTRDZUtPTGZT?=
 =?utf-8?B?ZGZkQ1dMQ2wrYWdwYzlqTGlJd05kNTl4NFZFMVp1NUhmRXM0bTN6TVExRlB0?=
 =?utf-8?B?WElIekg4OXp4ZHVJNm82czh3cjcrbFlVUDZXY3lSZit2R0ZVanVlVGFqUkla?=
 =?utf-8?B?eEsyWUdPTGNoZ0dkQmhybDJTRkFVbElsblZScDd0K3oyeVNweE9wek5hRUV6?=
 =?utf-8?B?cWVvY0x6eC9zRnRvZk9paDRWUDVWSVdhSWtLcVhPM3dFeXA5Szg4QVJBV3Rh?=
 =?utf-8?B?aE8yTk1XdzZocUN2OTZia0hKK0hrbWFFMHoyWUsxQ2s4bmdiNkpTdmluU3h4?=
 =?utf-8?B?Ukg1Rk0rbDZLVnlvbHdOZkxyZG1jUjVkMVZFUWV6dHpiL2xlblRnVnR1R1kx?=
 =?utf-8?B?WUtFai9nbVlpQUY5SzhlSGhjSGNsZ3dhOHFuWFR6UVA5cGZsbnRxeHhjRGZn?=
 =?utf-8?B?N3pFbVFKcTJCVVM4RmF3TWh3WGt6bHloVTIvUDBrTFBTYk9yVTFUaElYWlpN?=
 =?utf-8?B?WGljZE0wcGwvZnFycEs0dzZWQ0g4TGl0QlJKTHhSdUxzdldUaW1kdkl1cHAw?=
 =?utf-8?B?WVUwNnZvOVo1MThtbDNucVhzOGp0QXJZeDZuSEwreG1sRGxKZEpueDh3S1dT?=
 =?utf-8?B?OWRKMDBaSzNqZVlaa09YMDE3ekptV25SMDg4SC91YzBHZ2tLTVFNeFFlTWdp?=
 =?utf-8?B?dFZFZFRhdENIRWJBUDlqNmFtS2Vwdm1pbFpBSHZtZUptNWF3TnhwNTd5VzhF?=
 =?utf-8?B?ZG8zOVZBWXdBamU5TDNqMmFWdUpLa2EveHFhdDNIYlR1L0t4NS92RDB1TE5O?=
 =?utf-8?B?bjJpUmx3N0tsd2QrR2h4bERjOFJEbUVySUNuWWVkUGZKWngxdzRYdHAySkZj?=
 =?utf-8?B?aStibWNObnpaZVp1dXNOaWZTazdkdUdrVDNHeVd3MGU1UCtFeWF1MkZMZkhi?=
 =?utf-8?B?eWtxRCtGdnUyTUhnWUl4b2QyTzJRZktHV0FEQ2JrUnc3aUYzSDRTcjhvaWtv?=
 =?utf-8?B?Si8zcUFHYU8yNHlSdUpnY0FtSVhVWm41QlRqZTQ2ZzQyV2tKREFpT1A0bXNG?=
 =?utf-8?B?UVB2bHdFZXpYbTZXZVF3bElpaEpPemFsZkRBNTJiYkRjVDFSTTRqRnEwN0lr?=
 =?utf-8?B?Z1IzQ1ZJSUZ1aG1BMEcvd1UzV3RwUmdwaHRwT0V4ZVBTMmlES3R4c2VvOXNK?=
 =?utf-8?B?SkQ1amlOOFN4a08rdzZCaFFMR0RsbmI5SjRLL2JyZjEvNkM1Ulk4RFJjZjUr?=
 =?utf-8?B?SlRoLzZNcVByY1QxRU5JZTJxK0JsRTdZb1oxRWgrWDJlMjFUcElLTm1sNG81?=
 =?utf-8?Q?gOkP2K/4Ojt4DpdBpJZCjbfvU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b106de3-d88b-457e-0256-08db4f91335c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 06:55:25.4509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFc8F1MXy/Lsl0Qs+eYnV7zqSnjhYXWfGgUk7mAIKMprrMTdCKO+vG50+JqtiFIZyUsw0yBvPYcLulPidVIuZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7351

On 04.05.2023 21:39, Andrew Cooper wrote:
> The latter is more legible, and consistent with X86_NR_{SYNTH,BUG} which
> already exist.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I can live with this as-is, so
Acked-by: Jan Beulich <jbeulich@suse.com>
yet ...

> --- a/xen/arch/x86/include/asm/cpufeatures.h
> +++ b/xen/arch/x86/include/asm/cpufeatures.h
> @@ -53,4 +53,4 @@ XEN_CPUFEATURE(IBPB_ENTRY_HVM,    X86_SYNTH(29)) /* MSR_PRED_CMD used by Xen for
>  #define X86_BUG_IBPB_NO_RET       X86_BUG( 3) /* IBPB doesn't flush the RSB/RAS */
>  
>  /* Total number of capability words, inc synth and bug words. */
> -#define NCAPINTS (FSCAPINTS + X86_NR_SYNTH + X86_NR_BUG) /* N 32-bit words worth of info */
> +#define X86_NR_CAPS (FSCAPINTS + X86_NR_SYNTH + X86_NR_BUG) /* N 32-bit words worth of info */

... the way the value is computed suggests to me that "CAPS" (i.e.
"capabilities") isn't quite the right term. "features" sadly isn't, either
(or else I'd have suggested that without hesitating), as neither of the
two really fits the inclusion of "bugs", but feels - to me as a non-native
English speaker - still slightly better.

Then again "CAPS" fits x86_capability[] best ...

Jan

