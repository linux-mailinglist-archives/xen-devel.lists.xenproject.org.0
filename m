Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E611F731284
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 10:43:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549481.858036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9iZg-00046V-OK; Thu, 15 Jun 2023 08:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549481.858036; Thu, 15 Jun 2023 08:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9iZg-00043A-Kx; Thu, 15 Jun 2023 08:43:24 +0000
Received: by outflank-mailman (input) for mailman id 549481;
 Thu, 15 Jun 2023 08:43:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9iZf-000434-C3
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 08:43:23 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae7abbab-0b58-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 10:43:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7226.eurprd04.prod.outlook.com (2603:10a6:102:8e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 08:43:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Thu, 15 Jun 2023
 08:43:18 +0000
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
X-Inumbo-ID: ae7abbab-0b58-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fee6CxXuG0ACh00oaSdFDOf46VCeI68POyvB1Pl9+6Ff4ACIZdfjCtsHHOIyF+8PIG6ZoB+aTRKh6sHOgMsGHeMkHQuTSbQ5a26oewB/6N7uxyjmJmIc0O03HThcdHusz9ASBnF6O65eemBZ07KNbkauWujkznrIuAYvj21W+9J05+hxG3etz8LkkfnTtJJ0yZfTjh1xLFUi7qHqXM0ndmmBlWQnY4sZ4fc0GlpxPNN2oElov/qtRbyb/TluDxvrf1MNs15Ko8px8kwQ5l4m4n7kKgJo0dVEGbOi74ZU+ta984bsRqlX9lkapwmMIsPXioUr/Uvd1lelK230tn1NfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TV5g7q92JENy3mRZHUo46btEJi5t856kzCuyg6iwtzM=;
 b=L8kDprOzSEl9nw5bo3Y5Wa0af4oI1FrWTEVI4l78oxvPIfYtFZfX8zp/l+mxYrcjkTWgvS/iOP2pQwfp5CU0i3fmsygMmx060sqPPniMvQ4fEJxwpufQ2JhfShhTSI06atp8W24Rj1Hobe/x/GS4BzSDQnt5zyd5+f7aLbjimRO9puEOnM8Us3dXnuoHcufyHjLbbT4XhPDgUGTcrvoAQ5NNQnkAanWWSy0gpg0YD70WmF/TPCCrrnfNJkHnDt+YqFOr5Jh2VbKZ9EILk6dvICHC0ZuqbdK3lk5yHeIhBSFZZi8M+lS8REh5sPBuyA4I8exKur8j10hvThiM3+zRQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TV5g7q92JENy3mRZHUo46btEJi5t856kzCuyg6iwtzM=;
 b=P9uIdbB7o45Vo+emDIdG6ZdfFKaLvlChAWelGsHukqtexTWJOyCSUNatFbn0drf9F1/oOa7XW1O2RTlPZbGis0JTtUuw02znTCkrMvDTiuoXT26R2bvhdcquJGYb1S9fjcqv34wjrcEeZ0CTFYFP+FQoe3l1p3ynncgdFIXnLck0JqhMZeFzFNAOvMXTLRrvAOqJLBFz3kRjwJySJhcb5Rd2ghsT7gnOw89DGoqN6lVGGPmN4KLWS8J1oFuJDH973+aXtyNVSzlPOhPi8SNCpGtHFyZH+6diBxh93qIkA7qh18HHvTyU7zSbmeaLca8gJF2iKHSISNYjI3cmccM4/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0a8a5eec-0d07-c1ba-21cc-a336a7f49ddb@suse.com>
Date: Thu, 15 Jun 2023 10:43:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/misra: add rules 1.4 and 2.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: julien@xen.org, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, roberto.bagnara@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230614230328.1060282-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230614230328.1060282-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7226:EE_
X-MS-Office365-Filtering-Correlation-Id: 34c137a4-1dac-4725-2e45-08db6d7c9142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w51jaWO6VplhDbNi08n976SXfrt5WzwY2A559BuYMG6XXSiu9IQkLQvyaLVWoVu39hnZTKGHvh2Qa47K1aJOoJHJp1mBoDzMyBcBwCwZ4XDwd5TFBXaduhD5+QXk81nOz/GBSwBIjnP0+yMYKNwSDml/7t/CENAx+x4HDTV89X6OKElC4sR4hcW8vvcbGLgIqxKu27vvFGTThJdmhg8DxY+EaHGuIpS4Z4/gxrubW2OavDCQwbA072XVly7PJZTEBr08fA9VKexrCHxwfWQw0kX4DYdgBpzDonQlstBQh/ylqIsWeoHzUCcOOpz0N9Z8SfoQ95vzJlIDpnU74pMxbztzWFSOT/RNLFza/89z1lAqCN0Ei/3jTeB6LMsrKKfwwEI02A5LMyOiJCXfuyacCKEvKjywb2fvsE17YDIf4nVg4XNgzJg8yVVQn/4E3m76Dk0/yFF1FBK1mXpT3bF0236sT9wdooPHrqnsm0ysYa464KVFi7+R7T6hputwfDsvAAa8DGp64s2v1kSmJk+yyJ8Hg+jTt84674nepPIB9uNEGCUxLlTpq7ka0H+//UEXRdNQdkwjQYoSG1KpBopJL9e4UJUrLcyf12yutHlKy+BQmrDs3ga/VVrqbwJ1X8jIrtwrAY7bL7zu6D6LXY0c1Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199021)(5660300002)(41300700001)(8676002)(6916009)(8936002)(6486002)(66556008)(66476007)(316002)(2906002)(186003)(4744005)(478600001)(4326008)(66946007)(38100700002)(86362001)(31696002)(36756003)(31686004)(6512007)(53546011)(6506007)(2616005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3oxYTU3SmRwUlNPWk1NdzVNSS95Zlc0bk9hd2lqckRsWVBYNXZFeFRCdDFz?=
 =?utf-8?B?cFBsdWZaUnNoaHBKd0trSXlFTkU4WTdSVTArbEtvcUxMOU9nVjQ0emI1TTlM?=
 =?utf-8?B?SHZ0aWtXOEUyUm8yUGdIMHlyMHBWUWh3MlBYYVhIeEV1ajBBUHAwbXJjSU1W?=
 =?utf-8?B?bjEwZklxMlJFWVlQT2ZRRlEvekc4c0lWekd5cHFqaHdSUVg0R0hBbVIyeHdn?=
 =?utf-8?B?cURnVWdVd3Q4NWxyQWNVNnREcnpFMW95NnNlaGpUUDIxSldKQzVKZEFnQWhL?=
 =?utf-8?B?ZGZZSS9CbU9tY1RiNjE3dWdsVFVnSUhHVWRPUTE5Y0ZwSkNwK0xLWVdDMS9D?=
 =?utf-8?B?QzZDeU9BY2d3UDZhNE9nV3BmRmhjZGMyOTluZEloTnRjNXNNODBFRDJxd3Rv?=
 =?utf-8?B?TG50TWRub1JycGRWRWhGVFVhVkcrVlFiWkFoWUI5aGRTNGxzQUdRSlQxa1dF?=
 =?utf-8?B?WEhTamQvMmFQNks4WFNnMnNRSVZuQUtKRGhRQitqdmpRZVY4Sm5MSVNoYlFz?=
 =?utf-8?B?M2YwaFRIT2NBZEZZRzFwbklLeUpISVZNMGhYYWNPamlQMXY1Z0tEWjRSMFhX?=
 =?utf-8?B?VWRBQnRRQmZSMk9PbmJQK2plMzlidUV0NlVadjJUOUFBMTZJSTJnWWU5RjZz?=
 =?utf-8?B?cVNwODJPOVQrQWdodnVlaUJmMWh2L1BhVXRtUmlxMEVJMmV1NEFlYnlIbkVN?=
 =?utf-8?B?QU53WUo1ZE1haitYRHIzSkJkZHlmZmlZbURSSTQ0Ty9LRjQ1dndVaDQ5NUFJ?=
 =?utf-8?B?L05Kb2FrU1lwdVJScUNpSkZ6MDVPVjBCTWp3VEtiK2hldTNUN0xqN0VJUjg3?=
 =?utf-8?B?Q0FzRzhvbE9UYVVmZUttY1ZKQ3N6OVNkajVxdk1jZ2ZvTnNYdlA1WHl6bVQ0?=
 =?utf-8?B?UEJGUy9oa3BHbTlLbEszamc0cy9kM0xXYkMzdGtrWngvNnMzUzIwaXFnK1lw?=
 =?utf-8?B?cnZNN3QvRmpCWnlZMVBxeTBmMVNNUEZxUFRMK3JpZm82eXBITnYzR2QydTFk?=
 =?utf-8?B?OGwwdDBxV2cxY2RHSG5nQThRcFd3S1BvT1NzZEdhMVJvWGtBaG9rOUhGMXpt?=
 =?utf-8?B?T3Z6M2ZMTDhVSWYwcHlWd3BaTytOeFBGRi82RDlCWUhuZTNmTTk0UlJKWWts?=
 =?utf-8?B?MThKSE9YMThHTTZGTCtPTFFNRVVYWnk5bmNZalM4aWJwNk1kTkpEazFhazJG?=
 =?utf-8?B?UVBlUmJTUjkvU2Y4N2lteWpNa1ZuYk1VVUFDMkNNYW9LaGw4Y1ZTRWwyWFR6?=
 =?utf-8?B?RTdRSlN0bnBBYzZ6K2tYckVETU1PdFAwc1R3UVg4VkZlV3ZPYzFSc1lxQTUx?=
 =?utf-8?B?ZU5GV0hUbi9Xa2Zzd0RLVnh1czZOWmFzR3NFdzd4YXRlM0cxMmdqUEdSVUdX?=
 =?utf-8?B?ZnAxaHV3Wlh6eUxuMmhBMzFmd1hGOEF3T3hHQ3h5UmlETE9qZWJWY3h6dTNV?=
 =?utf-8?B?UysyQlZGQmc5RnYxdmlJMEFMZUtjLzRPK1hJalc1Sm5DQ1ZRK0JadmtPMDJB?=
 =?utf-8?B?UmlVTzJiYWZBMGNVSVlyV1pDNTdaUDFxNHpLYnZLeHVkRmY3OUpMUGIxU0t4?=
 =?utf-8?B?SEtBSHkvT21iWUZhVzJKRDU3M1FKaDFLMnZ5Z2tRVnp5cVFmaGwvZTdCTmEy?=
 =?utf-8?B?N1F2bUV6ckZFMnlUZ1BPWngyNHZ3V2xkdzZ5dkp1anoyZkJHanJDakp2RUlL?=
 =?utf-8?B?eGQzeFdaakRmR1paeTFDcXlOeXJtUkZsVWgrd3NZYWJieHNjbzRYemZ3K2xU?=
 =?utf-8?B?aElmcHZHUFdnNTRsalZLZzRLOXlWOXVnNThxVEtFVHRKeWJ0dzZreGpEWlpX?=
 =?utf-8?B?UFFVbjdqcS9jOXVqN0xnYStKLzZWa1ptWE4zOWJreHZhUC8yMFppMzFtblNh?=
 =?utf-8?B?UXFVb1BxMFRPbkNmVGorajVOUlNKai9Bai9OU0xZT3Q5QVF0cWpRc0tZVkNa?=
 =?utf-8?B?U09tTlFNU0E4cytTeHd0M0JmaU1xWks5Z0xQS2FiTDl2eDBKWFljYzRJVkxj?=
 =?utf-8?B?c1ZGQitQTHk1UGlFVlFuT1I5WDFSZW1YV2tBc3ZSLzFXZVlrSVRFRCt4dEVW?=
 =?utf-8?B?dGgzU0llb2ViaTAxK2xyU3NxWHU3djZuRW9KOXdiUmhQMEJmYlEwSWpyNzJr?=
 =?utf-8?Q?ADZGpKblYKiLJ+mX823VcN+Zb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c137a4-1dac-4725-2e45-08db6d7c9142
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 08:43:18.5342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rDU0enoMhVHExtteIHOTfEmQrpkCFaxdVyQHkHHU6Ch5sR+TY74wSxef6X/gYyXAlxejtSBC+3QNi2JcvORnnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7226

On 15.06.2023 01:03, Stefano Stabellini wrote:
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -90,6 +90,17 @@ existing codebase are work-in-progress.
>         behaviour
>       -
>  
> +   * - Rule 1.4
> +     - Required
> +     - Emergent language features shall not be used
> +     - Emergent language features, such as C11 features, should not be
> +       confused with similar compiler extensions, which we use.

The plans to possibly use _Generic, as mentioned during the discussion,
are (I think) making this the first case where we accept a rule with
the expectation to later break (deviate) it. I don't think I'm aware of
provisions in this regard, so by accepting the rule in the form you
suggest may well lead to people later pointing here and say "no" to any
attempt to use _Generic. IOW I think it wants clarifying in the text at
the top of the file that there is flexibility to change in how far we
mean to comply to already accepted rules.

Jan

