Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCED771C0F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 10:11:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577802.904833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSvKs-0005hW-AD; Mon, 07 Aug 2023 08:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577802.904833; Mon, 07 Aug 2023 08:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSvKs-0005em-7T; Mon, 07 Aug 2023 08:11:30 +0000
Received: by outflank-mailman (input) for mailman id 577802;
 Mon, 07 Aug 2023 08:11:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSvKr-0005ee-9W
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 08:11:29 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20607.outbound.protection.outlook.com
 [2a01:111:f400:fe13::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01cd54f1-34fa-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 10:11:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8955.eurprd04.prod.outlook.com (2603:10a6:20b:40a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.22; Mon, 7 Aug
 2023 08:11:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 08:11:25 +0000
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
X-Inumbo-ID: 01cd54f1-34fa-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQJ/RJ7IU6Wvx3gsyoy9QrvCqaXMOW9sCPT0LU3ZjVXJsQuGANNz2zS91Q4VNg+xoL4rJHRgJCk+aNb2vlzDrSe9+zhB6jn0mJ7lD0PptTPZsjmFwMpjpa/WvYzEyLn1dnw+GeeRXKhMKKftdRQ+stFIpnrCPND7MJqdAQ4hVPu/QioGBxTRuNAVjJ1sBp6NCmR2hB+WvdPitD0kDLEjnzJQZMgbpGWy3Mdpa3O3RFrOa7gb8e3dDpmVQKOUIA696zhQCoX8dMm2TwcIL5yJ0AlEpFDa5OmUt98nMysk79K1uodVTU+o72+xfNT2aHo8DKrIdPDDS6rbZK6/qTqdAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cS4p0fmMuNYoG9ZS2V8EHvpZLTx0RCAzwjtOr9xWwjA=;
 b=SVUgdZTi7APWsCMCjDtSGevxxUNRcrFy6BGvd94++PddUKl8INkX8UKN1L8MG9E2o/d5vqnP3r7UxoBmdlddRSLHmnXGFn/q076P6aWNCs+QyOErvO56Jt7J3pyfh0T10N+vBfEq/+0rurHoIq65AqFYIQaSHq46+6wJBFa49OJ4SNkC6VXj00OAo15EmUDTUURRSApFy/fkp5GGA19O/foTITRyOODuth7K+93s8w0VBvLQa8Beo9cohVP1v6s8ZAHTsdAmwrxHBAES34vRqW1/WfZ76d/zDsgCh3ls/977ygM6aeubDj5wLm57wgPne9qt4IMBETVbHLAw4BvOlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cS4p0fmMuNYoG9ZS2V8EHvpZLTx0RCAzwjtOr9xWwjA=;
 b=RoRLc/sidzBEb/ubq9t5Yb0pC1QjL4JShfJsO4iScgnkGA6QvedGlBjBaIbDLftoNtsGFcCkJj2PDqWwagMe0XgoLwa7UMfSfL3wKtbMugnEE2sdlUSl6Fm0O86grI9iT4z9I8u/UB5oPYMITekeF488gNFDqTYgy27L8o3hdqmBYYR5k4iMZH2q4ESkoVVnMlIvcwAJ5LMni3hvENW+cxMapcnTBmORDmsSnslFzO2WN7TZQlZxkHjfGZJlmjZSNh2lcRcegxY9m+kllkfvU9VBz6g4zkhxDcSaLyt//KpkYUitLtzFN28paoRVF++HlM8n6zzQZWhP1Brg37Eu6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ce6c569f-d474-0e55-e3d4-6a3519be362c@suse.com>
Date: Mon, 7 Aug 2023 10:11:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 2/6] libelf: address MISRA C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
 <55624244c42297da7da954009ba0559c47fc245e.1691162261.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <55624244c42297da7da954009ba0559c47fc245e.1691162261.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d83ed1-abc2-4790-2afe-08db971de4d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q00twlkIWTH9VJD+Qrr7nH2KzOTEpzzMZiE9BJKfkdq2F10wtnw2a66fxp6I1Orohgic3ZT3BFXRVt4xMw2ff0xcFgc6R290NmVJaYzAaVBEHqBktRi6QdptN5LxDbJMyTKBrEpmgV3+owROB4fuy/XwCmU+BW8Zc++JtKNdnvPflJUR5vxis5Cn48HghgU68uD8L67qnRHZFf3O8lKXsCpNVwEqyS6hLdQrxA4/wq3cusXBRejLNFHT6UuWjVXwoFSHdX62ntsNR1Yk58Gx9kX1GpSWyRAceutanvmwEdTE+tUxMxNLRbEVA0djgiR+t+YYX+kIq8LXpPjRDC9VIrrLPA3/qeYzdmWxuBSmICZELma+SCEQ8JhUyKpHoqrhcdJw1Gv+zkrG/LOnoh6n5Ma/raBslDcj5Zp2JhFzZarwxPi0MyJCUwbGBZMJGxIlIaXZ3gHx4VUCvl8hdNziSGwSFtbuG9dZIQ08cXY9gMQppWwOxs9A/PlkASSLeH2Q4eZUoc/EPaVnO5B2GparICJXT1Q6Z42UPTdtRyKyaRPvS21bTSUaiOht/ehXX7yO/p+qp0ges7rEHwobpzt6x7RCBLVpUmB1Bvm3gx5b08nMQ/ubkI3TCZ5EPtigR0P4050k730fdur8uSmkmSPqmw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(396003)(376002)(346002)(39860400002)(186006)(451199021)(1800799003)(6486002)(6512007)(31696002)(86362001)(26005)(6506007)(36756003)(2616005)(83380400001)(53546011)(38100700002)(66946007)(66556008)(66476007)(6916009)(4326008)(2906002)(316002)(5660300002)(7416002)(41300700001)(31686004)(8936002)(8676002)(478600001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk05dkpaVWxtQUd6Q0RTb0VEZmc2YUUxMllPajBDVlJXQkY2ZzArSzhQQ3Uz?=
 =?utf-8?B?eXJYb29mMW5XMXFuVG5NWXl5VzB4bmIwT2lMcTFEZytvNzRBYk5GYkhiVmdL?=
 =?utf-8?B?SXZvM0ZiUHlZNUlkN1kxL3VUcnJ5NjVqUkJqOWhzL1B1VlJGclQ0bzNzRVpB?=
 =?utf-8?B?U01WcnBCS1RtRnRySmExYTZZS3E2U0Nocjk2L0dzVUQyaURZdm5ya0Z4Szll?=
 =?utf-8?B?SVJzQ21HVGd3L3VxREpqWGl5Umppcm85cFhEV25PTjEzSnY3T2JhSEljK0V5?=
 =?utf-8?B?T2ZiaEUvZHB0M1RaUHk2eGNBckIvZENlWEdYTEliNXJydjRKUzBlck8wWG9s?=
 =?utf-8?B?ejhUdndUZFJXMmt0WThUdSsrSVBCdVlWdGFyKzc4TThvd0NKSGxxb0JLaU5V?=
 =?utf-8?B?OGtYdU9Uc1VaTWowT0l6aTRFajl2Z0xQeHI1V01idHJrSHpEcFVYT0pzdlF6?=
 =?utf-8?B?WTFWTXJpZDFhZGxWN0x5TzFjS3VTRGVoSG5maGJrV1d6OEloODhEOHBFRTFJ?=
 =?utf-8?B?VTNqSjJ1OHgvWWEvUW1TdnB1MlQySWU2a2ZtaFltM2pNdFNmWDc3NXEzMGEx?=
 =?utf-8?B?QnJmNVMxUCtNODNiNUoyYnB6RTA4c0N6MitFclUrN1lWaEtXRHNHbEVQMmVE?=
 =?utf-8?B?OGl3V3hXQ2czKzEyOFE4dDQ0TzNJZk1TOWZEa29pRkM0blFzWU15Z0JtS3l1?=
 =?utf-8?B?K09CSWIvd1BIWndRczY0ZzBHL3NoNmx5aDNVQjJkUmRUeUt6VW1IZXA1azhy?=
 =?utf-8?B?eWdQQm10OERBRGJJYllqVkd2MGtlc1k3YnY4UVpWc01nVldQNUJaWHErVlBO?=
 =?utf-8?B?Y2p0L3ZqWExDUFVJZmlvREFiaG5vWDRYWVZpdVZJNS92eWlRNy8vR1E0TkVy?=
 =?utf-8?B?c2lNU0ZFRGdIY1FITzArVWR2STZlM21LWDRTaHEvblgxSnl4L2ZCM1JuZElv?=
 =?utf-8?B?aFRROUNLempqampLVHJoVk4xVWF3Q3MyV1Y0eXlUYXUrZWoyanhWM2dLbHJs?=
 =?utf-8?B?NUxWSEwzeUdPZzFvZE1tMVc5SWgrK0JnUzhLaGlyc3NwZU8za0tneDBqT2Y2?=
 =?utf-8?B?UDJUZFJEN0FXZ28wT3h6bnFrb2l2cTdjQlFaVHRXSHhxUVNZdHJCNGRENTBQ?=
 =?utf-8?B?d1lRRGFuWE15OTg4T2lTd0ZhQTdvZE9aTG9mdk1sREFZdFI1MU1zeXI3ODZv?=
 =?utf-8?B?Vk1oNllwd3d6ejhIeFN6OFk0M2M0bTN3bTVZUG9kbEQ3REpVdS90SzBQNnZI?=
 =?utf-8?B?citEWXpmQTBQNTkzRVYwNVFTallyTTMrMlJhTTl4TklZRVlnRkFla3RRd1Br?=
 =?utf-8?B?Nm9lQmJ6ZUFrYXdUZDdlN29wa0tsTGtWNnJBc1g4ZFRLNEtkT0dXQnVQL0Vh?=
 =?utf-8?B?cGdHQitzRmhoQko0OUR5MWplcmFhWFU3UmJwODI3VFNnUnpMUGloajZoU1VS?=
 =?utf-8?B?YVFKV3F5NzNxd0tSOEhha3MyNVU4OGNRUU9tTU1JSFl0WHRrQjVVeDZRSTVY?=
 =?utf-8?B?d2FLYm5jeGhRRzlWVG1ZNnRycnk2RWZlb3RXN3VBTFZvNGk0aDAxM3U3d2pu?=
 =?utf-8?B?c0xrQTVIMmw5YTdCTWtYbm5kYWk4T3d1MnN6eWJCK1RxUmNETmFlNkx0Vy83?=
 =?utf-8?B?b2RBRU9XMUdCMnVsbVVSL3c1Q2h1bzJaYjZFaHdBeXRpUTdmZUgyQlJsWXRa?=
 =?utf-8?B?OUx1OVh1QmdHeXNRZTNJR0tiK3BhNXBpaWRaaXJLZFJ0eDFtMHVrcDNmNkJn?=
 =?utf-8?B?ZDg1OU5pYklDUlRjVHh4UHdNK3pKZkdIVHI3MUNUZE1aYWdLV0FHc3MvQjB4?=
 =?utf-8?B?cWpZTTNoR3AyTGVrMjBVOG1uMmM0RXFLb1lyN05rdW9tdm5KcFp2THhRUkJU?=
 =?utf-8?B?NlpKb1AydVY2ZFFJK2JTdG8zMmFZZDJVSytORHVoZFZsRU1tWVl5Yk4xNHRZ?=
 =?utf-8?B?dUY3ZGV3Z1l6Q0J3NjFod3lxY0NtSHdvNjY3MzNBNDlsRVNRalc3U0IyVzhm?=
 =?utf-8?B?YWEwUjJjeENjNjFITmM4V2kyOW4wam5YN3JtdW9EN2VCdGRDeFAxK1pvZjhJ?=
 =?utf-8?B?Qm5mV0t2K1hOV0QwMTF3NkREQUVUYWltWlgwd1ZOOTZvTCtUSWRsdU1jOUhD?=
 =?utf-8?Q?1lfCJme+184yO1QGeCLTHTl5D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d83ed1-abc2-4790-2afe-08db971de4d5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 08:11:25.3309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spgOrMO/WPe+GQbSb54JMjgIWXEmGyOo2KPoheFyT2u2cfqzTZWcUiwmQ+/d/v5u/9Thi18IeZIF1Fm/1PVwlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8955

On 04.08.2023 17:27, Nicola Vetrini wrote:
> The types u{8,16,32,64} defined in 'xen/arch/x86/include/asm/types.h'
> shadow the variables in the modified function, hence violating Rule 5.3.
> Therefore, the rename takes care of the shadowing.
> 
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/common/libelf/libelf-tools.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/common/libelf/libelf-tools.c b/xen/common/libelf/libelf-tools.c
> index a9edb6a8dc..f0d5da1abf 100644
> --- a/xen/common/libelf/libelf-tools.c
> +++ b/xen/common/libelf/libelf-tools.c
> @@ -91,10 +91,10 @@ uint64_t elf_access_unsigned(struct elf_binary * elf, elf_ptrval base,
>  {
>      elf_ptrval ptrval = base + moreoffset;
>      bool need_swap = elf_swap(elf);
> -    const uint8_t *u8;
> -    const uint16_t *u16;
> -    const uint32_t *u32;
> -    const uint64_t *u64;
> +    const uint8_t *uint8;
> +    const uint16_t *uint16;
> +    const uint32_t *uint32;
> +    const uint64_t *uint64;

While the chosen names won't collide with stdint.h's, I still consider
them odd. These all being pointers, why not simply pu<N> as names?

Jan

