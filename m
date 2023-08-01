Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 780AA76B60A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 15:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574203.899445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQpbd-0006Lm-Gc; Tue, 01 Aug 2023 13:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574203.899445; Tue, 01 Aug 2023 13:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQpbd-0006Ix-Cj; Tue, 01 Aug 2023 13:40:09 +0000
Received: by outflank-mailman (input) for mailman id 574203;
 Tue, 01 Aug 2023 13:40:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQpbb-00054d-Uj
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 13:40:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecc55504-3070-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 15:40:06 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8458.eurprd04.prod.outlook.com (2603:10a6:102:1d9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 13:40:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 13:40:04 +0000
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
X-Inumbo-ID: ecc55504-3070-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzJH4stPdSJdHl5TKNx9FsJqI3iXm3IPRgWayWnG2S//Izws3QuvuNAnxM9znd3u5p/fFDfNry7RwCG5KRViq+MKa1vQFSJAxDXOf+c9oO337yvGuikBP5BNiE0RFeRkW13ChwlQtmJiGSVrUNG2Fu5jShE0L6GAdTR4IQvTEEBfCorwmUIA2aiCtQK0M7Xugmm7uuJWhKKzHertC58oK5s8FBFcQg/nFbt5AhpZ/sEAO0b6mMYlHRAmP38vlAfePoTmLiMnZmOnRyJR2MmSajgwVpKygCz9RMAu6iedfNfC3cLs3usxW0JsecGddCQSDuBxgNrKtbZhfWnkAhwGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=How/S47Xv9emA9E1mw2tT1xwEq8x3RCZXP65VyZuHWk=;
 b=Spvh6rqIkVbHXKmxS/+ZRV26NNu8wYvX8h7nyoEdIyMFPoH5AgZ+WDjAHUeSEtMTfoyWlkUhNUfgAty1UJcU9LG6jUTDs6jdJjqDYbmRIDMQTQ3anOW0g2Fy7BgUBYKmodbXY5rJfvTqfPITQCJcdXaZ5QVCMvtas3ysuiNFJM1bEhXJFVMqH65Ef1gNR/FXa1bm0ejAhvV6Oiv1p0HumxpljHgxUZvpB/C4wU8FbqGduQ9JolEceNmVxgzZC7xMil/wfBlN6lNpsEt8OsLCFk9MmDP/QEzH8u0ltJO5A23p6irus6m8OU9CulopLvlcXHUCnksG2cgxCfvDX4dsXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=How/S47Xv9emA9E1mw2tT1xwEq8x3RCZXP65VyZuHWk=;
 b=A7edsJ4PmVNhNGvlbnVDlPqBCGuuaAAEpKZIFzGMaeIRkPAtP/wjKqMszAOzpI/e6GfUBOLwL+3sUkQrhf4NFEhcfJJ2Z63zIIT1UfX+8f7O5p3hmgWweBwfG5cHTCvmyZZnJcvZQNPXwn2s89W0MaqLRuNNU6tr/IZJr1MLDmtbHk54b2lD3TrgxSuuWOMjGM341Ve34Oct29v/6zgwfUfPM5Or6QoWT61eOX/OsZQe8X3AV9vQZIKM0B2HHxXdZd9EaxYHe1W1AZ6NECvT/Z44V0RdAiuUbJqSp3rEh1t4MiIgBxa32lLGaluq27yNtAYsPRANhoUq3C3lS0amsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e2d88673-c4dc-1151-182b-07cbd40e924f@suse.com>
Date: Tue, 1 Aug 2023 15:40:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH] x86/cpu-policy: justify a violation of MISRA C:2012
 Rule 1.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <9ec42e01258968d2dc71d59c5ad41da448a7112e.1690895099.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9ec42e01258968d2dc71d59c5ad41da448a7112e.1690895099.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: be19f6f3-9325-4ff6-2380-08db9294cfc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E4+krsXXqBRwETfSY3knfBPPNPhAJ0ekQzqgAwoz5rtb4Utj8v7O3kmVqOEY9/7s6u8sSaHPPx6aw2Q8SQS1h0sL9Rjoy4tRlt0sfmEAwMIi5798RUxLyX9yegmqyvGHa6RdLTsMikeXqq1xzlTQ2P93H1nNO4H30wq5YeW+pXRWW/dqY27yunIPpfiGWzfn4Vqaa08uLuORC2Pg7y90om1zJsRG5o8oqNTrclAGGslkU7YA+B8ROJqBXpajde50x+WR01xXgq3a2waBatYqx7K0RcVDFyoCa5jth3PrS92Fsimivz4VLIjY1sCkab9KgGQQw8eRtrjVVKP8JxBvuE25wAdS25gOd4QMFc5DhTHkP8YzfCHfgELWYDblat2Uxt5Lv81DnmtPIcLegmZFdHr5SeLyp3fBU54hk/AapmGTjF7mM6XWEZhAd687+oo+j3leksI1FTYKIpeXpHUHR511oxXeDEayt01AO1rC9D8fuTALAkXn99rSIJINXAVrJXKpNGWoXt1BW6vIrXhJtv1DtJn2FSQT7JWmi+KB7pxUvs1SAWsfp8/TpyJMDTdoETx+kMNaunhO+WuAcV4cE2qRBxgne1jJIVNTQCjO1iIXMf75ZCL6H8nwiJPqp5qDPuYN17O1EdAmeFPQPMP5Hg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(39860400002)(346002)(136003)(451199021)(6512007)(31686004)(6666004)(5660300002)(7416002)(186003)(66946007)(66556008)(66476007)(4326008)(6916009)(66899021)(478600001)(54906003)(6486002)(316002)(41300700001)(8936002)(8676002)(26005)(38100700002)(31696002)(86362001)(53546011)(6506007)(36756003)(2906002)(83380400001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z09obTZvNFE2NjlsWC9MbkVOV0RpZGRNOG1Qc1MvQ3pNZUJUUVVVRnlqaTdz?=
 =?utf-8?B?SlpDK1VKbjR0ODZqN3hRcEEvR2RXeGpnbHZNdndUdm0vSTl2NStURjhtRCtI?=
 =?utf-8?B?RmdYSFlIK0tTRUZaY251ZlVkckswTjhhejkwcStyZDBTYlYyME04VzFXOW9Q?=
 =?utf-8?B?aEhLRFRMWS9tOENYeFZONC9iODZRNW0zNmJxZDBaU3hwQis4b3JpV3FCQmVV?=
 =?utf-8?B?WE9GN2pEc2kwRUVhakVyZ1NYNm51TUY5SmdiM0F0a2hyL1E3QWhWYlpWT0sw?=
 =?utf-8?B?UEY0b1ErN3BUQVVYTW1tYk85NmtLcFRQY1RhYURUemtSZzRTYlNxVlVkcGds?=
 =?utf-8?B?NThUUG1YNmovVUxwWHB4WGd0cVJ2S3FJRnNmK1hLY2FEYlZ1d3JCTHV4dklo?=
 =?utf-8?B?dnQ5a3VBWm0rRXRXZjdJWkFYQ0NiQUdrQWZVcCtTaUs2MHJKSCtVV1dzaGRL?=
 =?utf-8?B?TE1kaWFSektzSTZ1Z2ZCU2lBTnZBWXRROGhJMkhYMno0TnJMME1TN0pGUWg3?=
 =?utf-8?B?TXNkUmFRc0xsMTcwL1hRdHpsWHB6Q1FrelBWdjhjVHRBVTZCVHhhODdlZU5a?=
 =?utf-8?B?YStKZUpyNHJTQVE2S2lZbytGendXRFlxb25lRHFhT1Z2d25qMUM2MGc3TjJu?=
 =?utf-8?B?WWdkd3p6R1l6MHJlWjR5ZFJrU3dEOGNScnN6TElnd3laUEJrUGpBRUpyU3Jh?=
 =?utf-8?B?cEhiWkdBKzVCbXd5WE9TWTJLcUVoR2F5RGRRQUE1WjUwWXBobFZ5NGtPaEVa?=
 =?utf-8?B?cHNlWUN6ZXkyN3VUVkVOL3ZWbndpNzF2b1NJL3RoaHRJQmdPbE1lb2paSjBG?=
 =?utf-8?B?THVnUG41VHpWdEFWU3ltL3JGVitxWGs0ZzN3WmhWSVJYNUhWd1RtUXlybGJl?=
 =?utf-8?B?RTJNM2F4c3Exay9YU3kxUkRvWDZJTFhqallvZjYvMWtWNXhrWjduS3ZOeXRG?=
 =?utf-8?B?RHY2ZjNtYVVqYWZvWDBqSUNMN0dpSWdZQ2RrVS84clp2cHJNQTI4clBTdUU0?=
 =?utf-8?B?a0h1NE1wYWcvUzZMT3VmUWZVSHVjRmxPRXozR1FLTUFUdTZuckRhUHNqTUlz?=
 =?utf-8?B?T3FKQlpueU55SlZ4YmZsV1BnajIyajFRNEM5NmRsMVZPVGFqeSt3MGdDSWdT?=
 =?utf-8?B?VWoxYTdmU0VwVVJ0T0ZveFZvWW0yL3dITndWTGlNQ2crZnVGOUMyekFZUFM5?=
 =?utf-8?B?ajZsMWl4cklqT3l3TVVpMW0rMDhxZHZJMXF5QUEvYU4xZzhvTW9vZHcyaHEx?=
 =?utf-8?B?d2RXWjY5TWJrWml2bG5LSTRFTThocTFHaEVpeCttTzcrQ3VEVTI4MlZ6WXFa?=
 =?utf-8?B?Q3NDOE4xSVhTUkduMVkzT1BDN1hpNEIxMDFKNytPVVdhSkIyem5xQzRSd0hR?=
 =?utf-8?B?MXNBYWZ5aUk5MjhBb0ppQ3R2REdZdFVPU29HeDhDdmdkaHcwRkhrN2FTZU4r?=
 =?utf-8?B?eGQvTE5ramFFajBOZVJwelpjZi9wMTNzUHhNaGoyMEtsc1N5czFiSUJYTmhH?=
 =?utf-8?B?V0RtNVlWOHZhdXhHK1lnZkZyclorTXRuemRRZ0d0WjF3M3RxZDdqODhNc3NV?=
 =?utf-8?B?Q0dTYjhmdW1XR3BpL201MWNpQTVoK3FyQ01CSDV5NXV4dmIwamc2SmNIUzdi?=
 =?utf-8?B?OTB5ZzRBL3lwcWhWa1JWck1nSFQyVG4rajc2SkpqeDdTTVBGK2dLUU1OZ01x?=
 =?utf-8?B?VGJFTXg3WktXRm1MRjBPUG91Wmt1Zm1WbWwrSDFiWGY5YzZ4RlhzaGN4bDNP?=
 =?utf-8?B?bXcxYU9GbGpINWRFTHA4RmUwRkI2MjlVN1FCZ2ExVHRjQ01EUTlrOWd1SFox?=
 =?utf-8?B?MDRYZnlPZStMc25EWGkyekVhTnE2T29ocmw0YjdyQVNGUExNaFdncW00NkpF?=
 =?utf-8?B?WDU3MlhPVkQ5UTRnQzBBUWI0bVNKS1VtUkZtcjhodmNWeXZnVjRGdEppMGNp?=
 =?utf-8?B?cWo1L2hhWGE1bHR6R09zNk1zQUtrZS9SNSt0TXZ6OFdXcWFSS1VxTW9mc0Zp?=
 =?utf-8?B?UDFpUVdjM2l0V0hpL3pQZDJBT3l2NmZGWTRXaWY4dGdrMEE1YWw1RkpSREZi?=
 =?utf-8?B?T1kwcmdNYUZCTG1GdzNNY1ludXgwV0ZHUTViTXFsdUR2TFZXSG84MjJsRWVS?=
 =?utf-8?Q?2tcDxrp6JA++gl6WdpD+FalXY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be19f6f3-9325-4ff6-2380-08db9294cfc7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 13:40:04.3035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSODcTpKqLyTtQebq8Cd7EYwbHDKMAx3475i6Isrdtesgp4om80/aO1KUHM6DOu7wkVnaDTC02aCtLzgxN8gUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8458

On 01.08.2023 15:06, Nicola Vetrini wrote:
> The empty feature set 'str_7c1' in 'tools/misc/xen-cpuid.c' causes the
> struct declaration to have no named members, hence violating
> Rule 1.3:
> "There shall be no occurrence of undefined or critical unspecified behaviour"
> because it is forbidden by ISO/IEC 9899:1999(E), Section 6.7.2.1.7:
> "If the struct-declaration-list contains no named
> members, the behavior is undefined."
> 
> It has been assessed that the feature set declaration is intentionally empty,
> and that no risk of undesired behaviour stems from it, hence the struct
> declaration is marked safe.
> 
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> As agreed during the MISRA C group meetings, this violation is dealt
> with by means of a comment deviation, as future changes may eliminate the
> root cause, which is the empty feature set.
> My justification for the claim and the commit message may need some adjusting.

A reference to the compiler extension would be nice; the use of extensions
(which generally are well-defined, even if not always well-documented)
should eliminate the UB that the standard specifies.

Jan

