Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F6A696964
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 17:24:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495314.765662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRy6h-0007uD-3B; Tue, 14 Feb 2023 16:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495314.765662; Tue, 14 Feb 2023 16:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRy6h-0007rj-0b; Tue, 14 Feb 2023 16:24:39 +0000
Received: by outflank-mailman (input) for mailman id 495314;
 Tue, 14 Feb 2023 16:24:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jX19=6K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRy6f-0007rZ-8E
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 16:24:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1205fd0c-ac84-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 17:24:36 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9500.eurprd04.prod.outlook.com (2603:10a6:10:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 16:24:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 16:24:34 +0000
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
X-Inumbo-ID: 1205fd0c-ac84-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bK8wO85vX3OiJcv8Y8H+K0Av0UelnTUzs4EM6t4kjh4/tcqnQP1++RgfQL8cltMCPUfIaq4WtmCmqMhCAOL+nbsrZq+0xnw4bMO+Q5/f2SSUqhhYn1oWg1lF+cgZyKLFS/aJMOfnxuZ9VJwr8XlREAZAXmWApiwYoctPmLupasWBftdUdiWaiwYUxtoVlykq9caeO4x1+Z5DaCjrl7fVyXiGBeuPEK8onmLP9SE5IdKXrObuZAr9i5eggaTDe8F3dIqY1Lr4RZu1ydbbFvZEeTUdCbmFZsMkFz8ibhsEV2tsLZ1guG64VZxBlv7W5Ulv+rO276eNl35wToA7QNWG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/VMByIgAGddLMYk9B61m9I9XeS8tV0u9U/ihcd92eI=;
 b=BGv3VEDtdvhfLNFqrgzivEGYMkHM/tpaC+fAZfXmaluNrKLbw0qMcbsQmZlFe0W7+lE7nZ1IP/BhZ3r3+WBs56GfRHiLPgG8BwspyQLuPJ1R3be5WhbvUCxSIV8kZkE08qdzVMqvFec0RL82DN7IEiFisvQqdFJwag9d4ooe/qRWFoFd1xtJiem/9dJvjk8vqpGsPvBuUshb9IRifpI2c8BDthcfIb+623oHSDZcoDShZXG4NWe2sFCdiPmle5ICjOa/vbn9aT64udi3pjvIcsxSnAt2dYzkEEGhOehpxi4t8Lsr/bQ4KetRM1QK4z8OjKvZMegY1gnMkXBfqo/UdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/VMByIgAGddLMYk9B61m9I9XeS8tV0u9U/ihcd92eI=;
 b=RQPn1dXKfFr3d+QDakUrQR/ccO3x1HujVZfE4g8PSpXx8mzlz5PB2vIoR7VY8NObI7SknWx9ZhBg7ketg8y3SZoBuUx89r79tflVK+SKRBui+vxOC31iWEyvusio6ErLXg6tHTM1RFhJiUDJtihARcx3Xdo7D6RPsEUZLi3oK6mH4Hzvb9C7zM2mWWPfvQ8z5sznvUYaeaIqT6MKLYpkd4YR/uNZtvfMOJUYCQPLxwWEH/sb1BsciUk1PBjwS+XO2mM3BCEyVedxiLbFd3f5oYeSMRbAgyLKHvdMzNsXELURLLx3xtLPechthukQ3cKwOeiKqHmt56fyEzvG1oVYPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3f8ef895-48ec-ca39-f197-a83b9cd46469@suse.com>
Date: Tue, 14 Feb 2023 17:24:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC 06/10] x86/domain: guard svm specific functions with AMD_SVM
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
 <20230213145751.1047236-7-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230213145751.1047236-7-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: 55505d1c-1eb5-4a4b-da9c-08db0ea7f566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kwG1lBOYeJubwjY/wAN5lXES3ADrTHzGKHDSNc1FsLM62/8uQHlJGumXzX4YmaytZUXFq9kz5eMsMaZtKTZR6KvbG1gGt6bjA00lXJ5x/sGdbuWcmLbe81EFdwdm3DYnMFT+JpGe1cqFf+Z3EJnGrYgso34e47ZHKbmxOewoxszGgCZiTy2YSn2PdfEMEPcC8GRsekPC+btI8FXI8v0eDxDPjHSJkPT4rll/2lykJIyPtqDTyADi8q+g6gCn6UZHzfPdEpfvvJDXe96Y+E9B0CrYUAgUwHLwuqdw/FazM0HaT0yrszQ4jcN5H53/jmpTH8cbWaN0iCwAKDt7ywAybsJ8/36zkddjJlxMtbFL6i+vzGvr0jOsn9E7B6fp1Zpj1d49sQc5p71tW2sh87eTlmk9lMliNijrWXniADaQqMq4rlf5SyuaXE6WPXDwp3dmYdd+3Q3jKgxD8GXe1gkwAkRR1xaixbijieM8FwfIRClcH2k2kIHqOC6YLyt3cvScTb4IXNebuH+ZF+S1YQ+8J/I++WBS4Nt2JrRlPMeMnZUoeEpoLJEgQrDeEhQZWm0Rx1Kp7ZgRRyf/Ys72doaffROeZ6HPz9QDGVtLeoBWTsMF9PHADXPJALS8piVYe+MVvKBBQ3ZtwmKCgvjqeN9rUzefHcVJ1+OIaygACtV1eiMQnLzlveyHE4I1fGZNw2jBGxE6j/FDna7mzIubIMm6apTVIdIBLmaUgu9kaeH2g4U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199018)(2906002)(86362001)(83380400001)(31696002)(2616005)(66946007)(26005)(38100700002)(66476007)(66556008)(54906003)(316002)(36756003)(4744005)(8936002)(8676002)(41300700001)(6916009)(5660300002)(4326008)(6506007)(53546011)(6486002)(186003)(6512007)(31686004)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDNMKzBUU2J4L3Y4U014TUpmZ3hQajRKaXd2RkFMalI4L1pVWFlnc0xyVDIw?=
 =?utf-8?B?dXNOWlBoanNWL3FIa0N0VTNHUlI0R2tJWFRESkdZNGlINkdmK2VRejE2Q3Rm?=
 =?utf-8?B?VlNwVkpBSVk2MWZZM0hLRnZWS0tFUlhpZ01Fcm0xWkdubytBNmtpRTY3ZTYr?=
 =?utf-8?B?TFNlcG13SzdpZmFtZmg1WlgxSjZVVUU0L2Fob2EyUXo0cmlIdEs3cFlXdmk1?=
 =?utf-8?B?TVRPZnp2OVcxL0JzU0Zmc0xkaU0rQmc0c3ZueHkyZnI3Smx0NEZQMXJLU2pQ?=
 =?utf-8?B?d3VOSFBjaGY1NUJFT3ZlSjhKL2JZZXlsdEZOZ1RQOERiSTRIQSsrYVNCbC90?=
 =?utf-8?B?WGw5N1lPTUtpUnAvRmZuRFl3a2NycVBqU3dCYlJNblNQUS82c3BpSnNIZjd3?=
 =?utf-8?B?SHNGYTA0RW53R0RnY0UyZGFzV3JvY3FNbm5XU00vNmgvNkc4bmk5VHdsV05w?=
 =?utf-8?B?Z1FoOFFrZTZ4NmJYTnhrQ2hhUmNFaTJlY1NoMlFEdmdFNS8xMmxKekd2aXAw?=
 =?utf-8?B?WGlic0VwUVprVTdRd0hNZlhEQS9IMy9kVlhURDJFRVZXN0xjUm5mK0xQMmVa?=
 =?utf-8?B?MndUSWJCUWZoa2dpdDlPVDBHQThRWCtQYnRSN1ZlQ0RIMlVJcUM4MFZoS0Vx?=
 =?utf-8?B?WkRIUitUZTBZaVlZRUc0Y2toL3VnNWpqckJlWWpIak9DdnJnMmJLNGRaSW03?=
 =?utf-8?B?Wk5jeXpFYlZvaFpkdmpkMk92T1d3b0FoUm5sZm5oZDROOXFER1V6VVl4dEJH?=
 =?utf-8?B?U3VOTXFwNVg5RFZheVZQeU9DdkZ0MUNta2EvMlNLVGNwbVNZbEg0UGtqN0pt?=
 =?utf-8?B?RlJpaHhHY0J1YXZIM09pcStQUzN6NWtBdDhVemlsQnNySjlTOGs5SG02RU42?=
 =?utf-8?B?eXNmOTNUNDBoL0U0bmpJbFcwa0pZKzJkYlROZlh2NThGdHV3cSttbnU4NVN4?=
 =?utf-8?B?UFdtbS9aakhKakVOUTlWejNxdmdCVHlMUVk3a0lUTzlEVHByTm00U3FkQTZV?=
 =?utf-8?B?Zy9JVnVVRzdmbzB6UHg4enBsNkdxZGdrVXFYL0w5Z3lPRWVKQ3JJbjRicUtG?=
 =?utf-8?B?alpwWGZZTVFWSzdobXlnb2ZSVlF1MlROVVdhNkpIeFZrVUo3K2FSd0hUZ0ta?=
 =?utf-8?B?Y0JCMWhpKzF1V081RHFNM3l5VTM4UkgrMmlReGRZYTVnWitCZzNYdnVqMU1k?=
 =?utf-8?B?cGtjdnFnckZCc2dJeWtlVGg0cEFhZ21mOVdoSnNKb0J3d285RVcyLy9QaTFS?=
 =?utf-8?B?ZExScFhnL2d2dFZOT2dsYWFvM2wySjNlalkzM1ViZFFPa2lIUGphajhZUFZC?=
 =?utf-8?B?RmxMNjZyUVZLZmNGQytFZk91RWg1cWVLdmpZVlN5T2hsa0pHRFR0aFlabDA2?=
 =?utf-8?B?bnNzR0VjaXkzcFhTbDQ0Y2QwcCs4aFVTSmpVcXFINzFRSWVDT285R0dCZFRL?=
 =?utf-8?B?dFdiVjl3QnlWWnFOUEV6R2lqT2FJR1lGTC9hN2o3UmRFZUdlcEJkajE2WkZV?=
 =?utf-8?B?ZDIrU0Y5dXo0YzZ4ZkRlL2phQ2FDQXBFMFIvcGxyZ0pNRjZmMnFMV0NVT1Av?=
 =?utf-8?B?NHk3aDNCaDZRcmhFTlF4ZytrQTlnbGFpK2JWQTdyeEIzbXNBamJDS29RcXRM?=
 =?utf-8?B?V20rUXhXRlV6U1gxRnphNXdyUVNIVHJTQksvaWcya09OZklGRlFLczFoa0Vh?=
 =?utf-8?B?a1Z4ZXp1U3ZGdlYyZ3YybHBGU2ZvRm0wcHN3Vys2eWxGVW1yb3NRV1pORUhM?=
 =?utf-8?B?dU1INnNON1krM3h6K0QzT1I2NjlrMkZGenJMeXh0dlpmdWRja0lpb0t1OXZW?=
 =?utf-8?B?aVRBYkI5MXNZd3d1UWpmb2pPbFFvOEdPSE5vNklDMTNPdUVHVXoxZjQ1QkFw?=
 =?utf-8?B?Tmw4bW85ZktFMks2UFhxdnRwRmZQdzRVcVN5NmxEVkJPYndPWGpMU3lpUndl?=
 =?utf-8?B?aXp4NkdjRDZmUGJGM2Z1SFQzVUVwaVA0RzF0S2YrY2VLcnVsMmpIY0hOUS9V?=
 =?utf-8?B?ODNLUnFBZWkxSXIzY2gvTkV0c2k1QUdyb1E3ZUVSZ1JodEZhWEtsVjQraG0x?=
 =?utf-8?B?Nm5XRFV6RVZndnlDV3diNFV3YVhmdG92aUZqUUsvSmlTalQzMGdaZnFEa2F4?=
 =?utf-8?Q?WCCWC0tTLHiY/S+/TG+Cp54jb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55505d1c-1eb5-4a4b-da9c-08db0ea7f566
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 16:24:34.6136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjEGhtJx1FmptnXR34aL3ATJ+I0rFnL0tvNEStV4kOBpiGLLYhMK+dKOpljYfxnPBMFpuSqKu/mIPUGw5gZRfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500

On 13.02.2023 15:57, Xenia Ragiadakou wrote:
> The functions svm_load_segs() and svm_load_segs_prefetch() are AMD-V specific
> so guard their calls in common code with AMD_SVM.
> 
> Since AMD_SVM depends on HVM, it can be used alone.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

With whatever the final name of the Kconfig control is going to be
Acked-by: Jan Beulich <jbeulich@suse.com>

Thinking about it, both here an in the earlier patch it may be worth
considering to switch to use of IS_ENABLED() while making these
adjustments.

Jan

