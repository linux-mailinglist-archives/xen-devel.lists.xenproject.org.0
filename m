Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DE47D2A7B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 08:32:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620980.966891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quoUB-0003Wy-KI; Mon, 23 Oct 2023 06:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620980.966891; Mon, 23 Oct 2023 06:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quoUB-0003UW-Fn; Mon, 23 Oct 2023 06:32:23 +0000
Received: by outflank-mailman (input) for mailman id 620980;
 Mon, 23 Oct 2023 06:32:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quoU9-0003UJ-R1
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 06:32:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2058.outbound.protection.outlook.com [40.107.7.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea1d5062-716d-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 08:32:19 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8852.eurprd04.prod.outlook.com (2603:10a6:20b:42f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 06:31:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 06:31:49 +0000
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
X-Inumbo-ID: ea1d5062-716d-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Os15VfVs2iA1i7q9Xwh2d+rWv1r01/lpw54cnxJtT/rM4/DG0kqTbTQvA7VNpu2Q6qCqj0b+CrRkMy2nBfwBVC9ClY0K+2WvXU4CTazZ1IalW3hrkf0GeLK/SREmNgMfwPvydklQHm46U4dFy988VRV1s2B87FZY4ohmMMJPofKGTev38O7nTVbkJkyiPqdZsa65DN2nyYvQPkJrfjkXyFR0UM1tCFNc7BnX40k6hyv3E/SHib28TJLlQeCc345prnoeKBW/zOTS3PUohaG7OxGItd+ltiq+6U70QuXfkR16QFd1ydXeGvB8QvjSKgmMZkOwLwXA+e/4xqsij9HvcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/ITUx92bYGTk2BROQ8KItH10vIzvSEokoXlX1fSj9A=;
 b=d1HWVE4UlqR8MTyJ3B4BJdsR5BoT+SM8GAcYmE4x6fqz46zoUIPWCb5NoUdfZLa9/0BE4I/dxS68SPGd2xdEdzmtl6k8ubbnp/I5npa4cMyiwieUksQVGvFUA5UmoYBXlpE7HsPeaAM7SHdKP8QZunon1lLSi81RbJyGRqAZ2Bz4kgniCbFjO34j/DAlMfitGbJahL2vx5tVEIs3kv6L+NmLkswoO4M9JgaDkCrcdQq70ojkDVidYltpqfPC84SXU3B77BzL2HLGuFFiYOj6jXUMaZhd47uiQQc6nGeylGT22e5WOmYYtCeCPOWw8HAGsStWPEsHUxhkvwALGJehUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/ITUx92bYGTk2BROQ8KItH10vIzvSEokoXlX1fSj9A=;
 b=ZvlP3s9cl0pHWi5I5NlkzXwdEm73Ta6GnSQmG/w/LjX6ht9QesJ/B0zxx7FFA1hvZlBYwYNxd83eCDHIu3kei2ZZQbrDoF6JNd+5g1E7ynjLdPqr90NQWTTv7UebdreI43jswf2kqJaI0I3ta8/CPMe1X6G8M9cdz40nJQMJCngWR5KY4HekTFMYGOIiGE7Ica3k0SIwxR1QpbDgm7qRwsZby0OZTit47RLnoUvAxpj9UDgIo3dlNqQnBQ9cYA0gG6lmZND8V6qGanErMqqZDGYpIdaJWC248nkEQS3g/0G5v3J8M1cbqXSOz+mAQ2V57z4pRdWZXA8jylwNBJbWtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <36e6dd08-918c-9791-0dab-ca75d4b98d7e@suse.com>
Date: Mon, 23 Oct 2023 08:31:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2 00/10] address violations of MISRA C:2012 Directive
 4.10
Content-Language: en-US
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
 <b62205a1-885b-ea4e-3ce2-7ad58cfc938d@suse.com>
 <f1759081-eb18-4597-82b6-d7d9ee1754ab@bugseng.com>
 <e0ff3307-99ee-7740-bc5f-52dd7f589057@suse.com>
 <c2b10554-673c-4452-a35c-0d2f314e8ad2@bugseng.com>
 <f0cd8400-5e37-6704-75ce-d965540bc2b7@suse.com>
 <alpine.DEB.2.22.394.2309281515570.1996340@ubuntu-linux-20-04-desktop>
 <725f5193-c8d3-1bc8-cd62-2a2b1b5ecc01@suse.com>
 <alpine.DEB.2.22.394.2310171709310.965337@ubuntu-linux-20-04-desktop>
 <ead797ed-84cc-fb70-5259-7e11211d049e@suse.com>
 <alpine.DEB.2.22.394.2310181739270.965337@ubuntu-linux-20-04-desktop>
 <e642bc2a-cefa-4ee4-6394-3c10102e8164@suse.com>
 <alpine.DEB.2.22.394.2310190915590.1945130@ubuntu-linux-20-04-desktop>
 <6374f0f4-d58f-83ca-6eb3-d5a9fcbac525@suse.com>
 <alpine.DEB.2.22.394.2310201622160.2356865@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310201622160.2356865@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8852:EE_
X-MS-Office365-Filtering-Correlation-Id: 95317770-790c-40cf-b05b-08dbd391bcba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zttuhv6rzENjCctDUAtJQVYfPK4QCFYcpnSU41atnO5R8zwQmiHUulMQaU/UfL9pBwmuGyT2rrP4k7lE9HQLnPio8ihD1Y5wEcuvcc9nzuzNWZgjH1Po5dCo/g/CEWaFmqKaPGueRzJob+RTspCnIckz8XhoaSSs63jhyUQCmZJWYksj5Dj+1DOP5wd2v22FpUaWnfWXZrZ2U8TrHi99IIETtYjhd8Lh7nsYFJVD3G0JeUx+sbvnWhTYBf8JBVCvJDIx9YPciwN3fHqyVjY7DhrozmTGFeYsphbbOrJ9XtQAGlPTDdBLHxWBrkn9lInxFttf5WDBxH+2zLZmTjfactS/P7z86NLe0v9FGlr3xZapM4iRrfAptcc+B9syIP/WLuMD0jkONN/oWOvTvlBQyEyLcU0zkey4oTHBgoQEZY7ISjn85K3x9TY0gPgVbvrkywb/gXCuo4n6z6fIJ+rDXdpXqw6HkyKI7iaFebUZSiGn9xRSXtiqAqe2LbgLOc+hgU2ojIbBQk+vkQQyNpnDUoNQtHcIiFzHaaPvOyy9uj5WVWBhd0Dr+5ojAQN92oIAVdPQHZBqPODtxnFj2gLST5uaBIzA5tovZL+R+yaxyb3bGsqFkXwU2OBR3kkmjG/GOwSpChDK9zdfpU48qAwJDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(366004)(346002)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(31686004)(36756003)(66899024)(6916009)(316002)(66946007)(54906003)(66556008)(66476007)(31696002)(86362001)(38100700002)(53546011)(83380400001)(26005)(2616005)(6512007)(6506007)(8936002)(2906002)(478600001)(6486002)(41300700001)(5660300002)(7416002)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K29qWXV4RjA3QnBSazFMR0tsSWhvV0tUaHlQU3V3Q2c1RExQdGFMZnFJeU5m?=
 =?utf-8?B?Njk4bHNONEFrSlZWbE5XOERiUWc1VkdGL1BKOERFbWxCcEZhV1dDZkduQUtT?=
 =?utf-8?B?OTZHK0YrK1h6RGk2QTNxS0llanVEOFFsdWhNVTFjeHZFVWZVN1o0TE0zVy9N?=
 =?utf-8?B?UEZCdlRWOG1GRk90SStFR2d4L2Z3a0duZ2JBOGpoM2NiNnZSZXczV3ZIWStx?=
 =?utf-8?B?Rm9BaVh5L2I4WXVvamwwS2hYVTVtV0N1dTFETzNMSnhwUDNoN0Q5a2ZRV0lp?=
 =?utf-8?B?SkpISG44NXprNWRSMkFzRGUxMEhCYmdIMnEvT0JVblA4ellJUE9veEFkdzdr?=
 =?utf-8?B?ZTBPQWRiRlZWRi94T2Y0QzFpQWs5SnlUdUs3LzYyS0Z0aFRLK1cvWURLNDZ2?=
 =?utf-8?B?dUNZS0NLaWJySVlIUVRkS28rai9MSzBOaHp4R3BzNXFrdkV0MUttS040cmRO?=
 =?utf-8?B?b2s3K2JJRnRRRThZOUNiSWdQd3RQTlNYVEtsWFg2L2ZSMFhnRUg3SHp5Y0NP?=
 =?utf-8?B?Yk5vTWdxNy9LVjhqN0hBdm0zUXRjREtpanVuKzFISTM0cjFEdTZJdUU4ZzlO?=
 =?utf-8?B?OEFxcWE5SWQwdi94MWRTMXMwakxvNGJmb2xGVGxzRDQwSGRJY0l1WlN1MDdV?=
 =?utf-8?B?YXFTSlFzeTl1MkNRQVVJNGNBNDVSakFDWUMxUkVmeUJMRWpnaXJ6NFRXVFEr?=
 =?utf-8?B?aENQV3N2V201ZjBNYU5iemJuMjVvLzVFZTNtMVFMbUJObW8vMEUyWWhtbWNN?=
 =?utf-8?B?QkFtdVhMUzZHS3RUWUV4SG4zc1RjdnN4TUcwSUsvaFNOQ055eUFYUXdLczVU?=
 =?utf-8?B?cWtqZFovR0dkczk4MTlNSTd5dkdETWRzdVFlNmJFZTVJalNwRCtRZGdjcnYw?=
 =?utf-8?B?Ni8vcTRIVEdZZ0tzVVE3cFFPT1IzQ0JJaW5Zc2xNNVJNMnBxbE1ZcEZqMFVY?=
 =?utf-8?B?M2R4OWdCZUNuQ3FUK1dPeXg4aE92dnA3ZkRvVEdtZUUwVDBWcDY3Uy9LWEdl?=
 =?utf-8?B?elo1Q3JwNUtaYWcrcE1ETE1rMEJ5YjFjSmhHODdUVFFWM3dmQUpoemcra2Zs?=
 =?utf-8?B?L3ozczJPV0N5T2lGaXI5MndIZGhybGdUWW43RWNxQTQ3QVlMcHR0Y3V6WU1B?=
 =?utf-8?B?NWlWQ0JNUktDa2hIYzNpcGMzWFZnWCtTbHJxU2wrRUtXeTlwdEtUOU56S1dY?=
 =?utf-8?B?YjdDRGQvZ2lxbUxDaFhtOGJHQmxzWjZid2ZiRmZnNjMwNTdjdWwwcVpQMVkx?=
 =?utf-8?B?R2lmZ2tDcXgrU29sZmhSQkx3UlU3Y3NIdytIMVNuWVU3aEdzb2tuV3o3aHlr?=
 =?utf-8?B?UkloU1FjdWhVRDJSMHhNMExwU1VLRTN0Mmc0OWxKQ0VIV09xaUljNmd2NWNW?=
 =?utf-8?B?eVJyektBNng3RFNMWTNualVIblNzOEd6RHUzTXZxYS9oSC8vWVk3eGpteEVl?=
 =?utf-8?B?T1MyaENsYzlZcGNiUEY3YjdrbGJ1M1ZMaXYxS2ZIaFNBbjc3STk0MlJRNmhU?=
 =?utf-8?B?RnhMdXdKY2U4V3Q3YmZBSDFxUXJOVnc3TDNKNzZHdXNZeGNqcDZDS3FXVDY0?=
 =?utf-8?B?cDBBTEJUOFk3bVRvL2tkYkI0MDFJTDI0bGYyaXRlNW12MEI4aFZEV0l0NUVI?=
 =?utf-8?B?QThOc21ucWNyTHFkMWJiSkNDQ0ZvQUxVUHE1RzgyOGFFTUlmTnVLUjNLYW1S?=
 =?utf-8?B?UVlYNjJBZjg4eHlHMzJ0eXUyWjdFL0wvYThMTkVZS1RPWUdMOUMrNVpxOXc1?=
 =?utf-8?B?cTlvanlCK2NqSTYrbUpOUEs2azZaU1NzQkZ2QllENm1wREJPM3JDQVg3TUx5?=
 =?utf-8?B?b2F3TnN1eDJYbEU3empaRzhBSU1OZGcxYTFITXo0SDQwWG4yRTFHSVVHSFJO?=
 =?utf-8?B?bjNlRVFZUXh1SjFWN1pkR04wQlQzVzc0UU9ibTNPSFQ3VFlUVUZSYVVNcXpV?=
 =?utf-8?B?ZFVkcndUM01reHo2TFFyUjFnSldCVnFSUDRwc1k4Rk01Z3I4NkRtcGRGVU5F?=
 =?utf-8?B?MDF0UkFteHBmS21NZzQrUjhMajVJbWVqcUc1YjMyak52cmJCeVFpN2FsUE5y?=
 =?utf-8?B?a1hIWVllY0pHQTU2NEV2K2J1SDR5K25HVnY2VTdTWXhVcmpJWmdiSDZGM3Zq?=
 =?utf-8?Q?aUXiI3R36ACwplNj7ScJa3QrR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95317770-790c-40cf-b05b-08dbd391bcba
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 06:31:49.4380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IA6dt9DCwemhckvluMXPet/S2Y5ugIBT21RN9ifpjoj+ee7GLs/gH5Kael4b5eNNktVbwKyIzOjLy70maML57A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8852

On 21.10.2023 01:26, Stefano Stabellini wrote:
> On Fri, 20 Oct 2023, Jan Beulich wrote:
>> On 19.10.2023 18:19, Stefano Stabellini wrote:
>>> On Thu, 19 Oct 2023, Jan Beulich wrote:
>>>> On 19.10.2023 02:44, Stefano Stabellini wrote:
>>>>> On Wed, 18 Oct 2023, Jan Beulich wrote:
>>>>>> On 18.10.2023 02:48, Stefano Stabellini wrote:
>>>>>>> On Mon, 16 Oct 2023, Jan Beulich wrote:
>>>>>>>> On 29.09.2023 00:24, Stefano Stabellini wrote:
>>>>>>>>> If it is not a MISRA requirement, then I think we should go for the path
>>>>>>>>> of least resistance and try to make the smallest amount of changes
>>>>>>>>> overall, which seems to be:
>>>>>>>>
>>>>>>>> ... "least resistance" won't gain us much, as hardly any guards don't
>>>>>>>> start with an underscore.
>>>>>>>>
>>>>>>>>> - for xen/include/blah.h, __BLAH_H__
>>>>>>>>> - for xen/arch/arm/asm/include/blah.h, __ASM_ARM_BLAH_H__
>>>>>>>>> - for xen/arch/x86/asm/include/blah.h, it is far less consistent, maybe __ASM_X86_BLAH_H__ ?
>>>>>>>>
>>>>>>>> There are no headers in xen/include/. For (e.g.) xen/include/xen/ we
>>>>>>>> may go with XEN_BLAH_H; whether ASM prefixes are needed I'm not sure;
>>>>>>>> we could go with just ARM_BLAH_H and X86_BLAH_H?
>>>>>>>>
>>>>>>>> The primary question though is (imo) how to deal with private headers,
>>>>>>>> such that the risk of name collisions is as small as possible.
>>>>>>>
>>>>>>> Looking at concrete examples under xen/include/xen:
>>>>>>> xen/include/xen/mm.h __XEN_MM_H__
>>>>>>> xen/include/xen/dm.h __XEN_DM_H__
>>>>>>> xen/include/xen/hypfs.h __XEN_HYPFS_H__
>>>>>>>
>>>>>>> So I think we should do for consistency:
>>>>>>> xen/include/xen/blah.h __XEN_BLAH_H__
>>>>>>>
>>>>>>> Even if we know the leading underscore are undesirable, in this case I
>>>>>>> would prefer consistency.
>>>>>>
>>>>>> I'm kind of okay with that. FTAOD - here and below you mean to make this
>>>>>> one explicit first exception from the "no new leading underscores" goal,
>>>>>> for newly added headers?
>>>>>
>>>>> Yes. The reason is for consistency with the existing header files.
>>>>>
>>>>>
>>>>>>> On the other hand looking at ARM examples:
>>>>>>> xen/arch/arm/include/asm/traps.h __ASM_ARM_TRAPS__
>>>>>>> xen/arch/arm/include/asm/time.h __ARM_TIME_H__
>>>>>>> xen/arch/arm/include/asm/sysregs.h __ASM_ARM_SYSREGS_H
>>>>>>> xen/arch/arm/include/asm/io.h _ASM_IO_H
>>>>>>>
>>>>>>> And also looking at x86 examples:
>>>>>>> xen/arch/x86/include/asm/paging.h _XEN_PAGING_H
>>>>>>> xen/arch/x86/include/asm/p2m.h _XEN_ASM_X86_P2M_H
>>>>>>> xen/arch/x86/include/asm/io.h _ASM_IO_H
>>>>>>>
>>>>>>> Thet are very inconsistent.
>>>>>>>
>>>>>>>
>>>>>>> So for ARM and X86 headers I think we are free to pick anything we want,
>>>>>>> including your suggested ARM_BLAH_H and X86_BLAH_H. Those are fine by
>>>>>>> me.
>>>>>>
>>>>>> To be honest, I'd prefer a global underlying pattern, i.e. if common
>>>>>> headers are "fine" to use leading underscores for guards, arch header
>>>>>> should, too.
>>>>>
>>>>> I am OK with that too. We could go with:
>>>>> __ASM_ARM_BLAH_H__
>>>>> __ASM_X86_BLAH_H__
>>>>>
>>>>> I used "ASM" to make it easier to differentiate with the private headers
>>>>> below. Also the version without "ASM" would work but it would only
>>>>> differ with the private headers in terms of leading underscores. I
>>>>> thought that also having "ASM" would help readability and help avoid
>>>>> confusion.
>>>>>
>>>>>
>>>>>>> For private headers such as:
>>>>>>> xen/arch/arm/vuart.h __ARCH_ARM_VUART_H__
>>>>>>> xen/arch/arm/decode.h __ARCH_ARM_DECODE_H_
>>>>>>> xen/arch/x86/mm/p2m.h __ARCH_MM_P2M_H__
>>>>>>> xen/arch/x86/hvm/viridian/private.h X86_HVM_VIRIDIAN_PRIVATE_H
>>>>>>>
>>>>>>> More similar but still inconsistent. I would go with ARCH_ARM_BLAH_H and
>>>>>>> ARCH_X86_BLAH_H for new headers.
>>>>>>
>>>>>> I'm afraid I don't like this, as deeper paths would lead to unwieldy
>>>>>> guard names. If we continue to use double-underscore prefixed names
>>>>>> in common and arch headers, why don't we demand no leading underscores
>>>>>> and no path-derived prefixes in private headers? That'll avoid any
>>>>>> collisions between the two groups.
>>>>>
>>>>> OK, so for private headers:
>>>>>
>>>>> ARM_BLAH_H
>>>>> X86_BLAH_H
>>>>>
>>>>> What that work for you?
>>>>
>>>> What are the ARM_ and X86_ prefixes supposed to indicate here? Or to ask
>>>> differently, how would you see e.g. common/decompress.h's guard named?
>>>
>>> I meant that:
>>>
>>> xen/arch/arm/blah.h would use ARM_BLAH_H
>>> xen/arch/x86/blah.h would use X86_BLAH_H
>>>
>>> You have a good question on something like xen/common/decompress.h and
>>> xen/common/event_channel.h.  What do you think about:
>>>
>>> COMMON_BLAH_H, so specifically COMMON_DECOMPRESS_H
>>>
>>> otherwise:
>>>
>>> XEN_BLAH_H, so specifically XEN_DECOMPRESS_H
>>>
>>> I prefer COMMON_BLAH_H but I think both versions are OK.
>>
>> IOW you disagree with my earlier "... and no path-derived prefixes",
>> and you prefer e.g. DRIVERS_PASSTHROUGH_VTD_DMAR_H as a consequence?
>> FTAOD my earlier suggestion was simply based on the observation that
>> the deeper the location of a header in the tree, the more unwieldy
>> its guard name would end up being if path prefixes were to be used.
> 
> I don't have a strong opinion on "path-derived prefixes". I prefer
> consistency and easy-to-figure-out guidelines over shortness.
> 
> The advantage of a path-derived prefix is that it is trivial to figure
> out at first glance. If we can come up with another system that is also
> easy then fine. Do you have a suggestion? If so, sorry I missed it.

Well, I kind of implicitly suggested "no path derived prefixes for private
headers", albeit realizing that there's a chance then of guards colliding.
I can't think of a good scheme which would fit all goals (no collisions,
uniformity, and not unduly long).

Jan

