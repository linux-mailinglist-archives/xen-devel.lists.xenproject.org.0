Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6355EF321
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 12:14:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413607.657359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odqYb-000317-HT; Thu, 29 Sep 2022 10:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413607.657359; Thu, 29 Sep 2022 10:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odqYb-0002y1-EH; Thu, 29 Sep 2022 10:14:17 +0000
Received: by outflank-mailman (input) for mailman id 413607;
 Thu, 29 Sep 2022 10:14:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odqYZ-0002xj-C5
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 10:14:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77a4c1e4-3fdf-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 12:14:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7895.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 10:14:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 10:14:12 +0000
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
X-Inumbo-ID: 77a4c1e4-3fdf-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUtNBzFtINmLDs9tDVFQ77g4tROKK5GEhHAHVINGd46ZX/NF+XFp0xlYRrxs+So8h2eLB1GuLwfwrz6wfUR22/LV1aZAcE4F6KULc+qORseaVzp8PX9gqsvYgtxwpgaMUXXuFWc2X6MfJCOCFSDw7qJmLKCMqgn7Qwo3W+IwQdOnyRmz8vHoSSoEGo/Yy4rHqawZgNiXza6okniPRV4/wyc743LGMsTcLxAP2oF7KalY8kW6I9Lbyg1kH+454XTzB2WaCtww2hXW1lSb5DEaQe71urCHS1wtS4qqXVK5SImoSVrmJO7ZaOMWKBuQTHnQQAeb2kb7DxhbeGOlyb9w7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5byEB4klimubibUmKd4ySR5qKSA6zBTcFHhQJgghXc=;
 b=HLnYGKP6YnhUddHidxrgxh4iHlk/exEZhhsjr+w4UM7u7PtID175TvNBeBHheARnKRDmCjaOIOVijjYRJxeAgvbkpOXRNuXH70CJAnrTperEeLHktBY5jdkbj2SUqyom0iLdhpuQiWZD8jvt3bnAkulBx+Iwr0ZbcAlI7eQkD7ZhY/e/+qGsgyOb8ySLi78r5vH3yeRX6XR6JC3hdKRVG+T8WUGCgsa2HQGRmirYSjqBGfaIJb8tKKvG+LSYtO31w5DxEw0O1oH/UGkDbepZUdVGwhf+4YKvtD+PirPWWDNDIHxZVFqv4E/5vRG2qQR/tSSKK82903kgM+o4SeeUfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5byEB4klimubibUmKd4ySR5qKSA6zBTcFHhQJgghXc=;
 b=SI01AiB3nOIp1YRUf1oTXi3CVN4g6t9kYX4aJtBieWN1EqWRCkq+yLNOCx2PKuPlft6BcFronifQRdVhX8SdM0xjQ8XIX6LwriPFtjA/y+JjHcZ4ziI1dcUvSWQjFNGRGlFueaPsYv2ID/ppB3rx43UPXCyHHnBoIkUGH90InMtk7uY3CmQ+A+BlnvJnswlHdHPgkSMBuzwWVdn9jR9fWFAT4TA0jZGkPoq7BGHS0SBBCcrKg3OTjJgOYVHrzzvwDF/avPD1dY/N8X5+mnC2T0wtLxlQrL09Nc/09S7zCpmejA2Q19McD4rqDJl46JE9nDPyCvrijUbKNX3upChcpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d7a14258-713b-6fc6-5da5-ce4fd56202c3@suse.com>
Date: Thu, 29 Sep 2022 12:14:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 0/2] Move calls to memory_type_changed()
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20220928141117.51351-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220928141117.51351-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: db3fb867-8811-4045-c686-08daa2035b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4neij07Aaw3z2XSkwRUN0CTug8i9xh0lh1VJNKksxStJcMjehExWEHDPMr5PMYYSNuY4QezsvwbSAQNvkKRwk448lAwP5B3oX+JI1iZzezxjkHKId3W8zEbpwz/EtikgXmQ/hcqyxqekpPHfVNsInAdRd/g+kpwWnq40hwZUIDr729tGbZiIsLda7Tf1TLQ7iCNl5ynQWl5u6yebsZoEwvrVQigv5w1qq2olLTu/n7D69y4CObGiJEQWhrsP5gfbv/7U93p+gK/FfTIKMZtzqw5BRxXNVctEupMSZZx31wtP6uhVVlHfNBoLL0k6cJ1e0GiaqIsvktKSRNzq9jkM3kTuKIKLeyIbUsYU/NDJyQOYp4hHrqpPMAkn+DEawD+ZfEDrTRhxB8rhYXp/9IG4nrWFyUd/W5s0Qduwt5y46Loycvj3tGPUbRQjKHXuv+KR7aSvumICSxPuXidwVD7aJg1t5fw4vvsQ4vxH8uzKKAMnb57WuQYeoFt9DLbCgwvKysNzBqq504/s6ACyGtVF6XRJL9ovFAHY3cDp19seVxupIz2PAiVcBRhe2393aaUtsWgsx5g5HvzMXfLe5cZ/oQUj1ZHvoL3Qz3iZ1jPbHOkDE04bti4oMR0ZDxX3OObutZBDiImrfAq8Ue7ilPWa2WfFve5oM2Z4VTIcBoQaSMwzcjDhFQqvHOHrcMqixwIb7eoSjGu2QXgpx9/szWLtiVdcxk+PVcBzXwSijLrcB5uuCyRzca5nkQTLDrcKq6oM21qJ8KHaA/9m4OQ9XvMiIZJdsk2ZvyqRIGqwZXG1ebA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199015)(2616005)(186003)(2906002)(83380400001)(38100700002)(86362001)(31696002)(36756003)(31686004)(66556008)(66476007)(66946007)(316002)(6486002)(54906003)(478600001)(6916009)(41300700001)(6506007)(6512007)(4744005)(26005)(7416002)(53546011)(5660300002)(8936002)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFpyUm9hUGFQMld2QzZ3b1ZLNllVRjRBZE5oa3hUcUgvbHFMaExFMThZR0ph?=
 =?utf-8?B?NW9EbDVaNFk2c0Jsb1REVUFNaXJTSUtsVXRXR2h6LzhjVytEUEk4dUEzc2o4?=
 =?utf-8?B?a1kxNS9semw4cysya0N2dFphQStTWjgzd1lOYXVvU0M1SVlIanFnWjdwWDdF?=
 =?utf-8?B?YVczOGRTNWwvVzFiOFV6QjBQckZXWHQxRmhLMUJQWU8yQTcwSlgwV3lkbEtW?=
 =?utf-8?B?Ny8yVjNZUWNEbXNYRGw2b1Z2RW92NlBMRGE3QTJYWnMwY0xOaWhqeVlrRU5Q?=
 =?utf-8?B?RUlQTWIvL3BQcGJOMXlQTFQwSXdLbTZ2WWdJUm5za3FpT1lLcFhjUXBGU1VT?=
 =?utf-8?B?QzVON280OUpWSzd6aE5jR2UrZmhHZ2t2NXdFMU5DZDU3enpkRnUrc1lTWlFr?=
 =?utf-8?B?WDhucE9ibHdJR3F2NGQ0bFlOYnY2ZHpvclB2Z0l4QUVGOGc1WVc4Q2JkRzBJ?=
 =?utf-8?B?M1lGcEVJYWwybUZCMUw2RkxiR3BvLzVOY3JqRDI1YWZUbDJ5UGtPU0lxMHJ3?=
 =?utf-8?B?TjJaK21MZ1VvU3RwMmhMUlI0dnJRQUJJYytEdG5sb0V4UWlENFZ4bkEvOGZ1?=
 =?utf-8?B?TzdsUmcySityd0lCamhzL3FvQVhtaUtTYXlOSkE2TTdyNXBwVUFEOFVXUS9t?=
 =?utf-8?B?OWx1QUV5bGFiQllmS1hIVDJiTUx3R1o3VU1Fc0J4VGlSMG1vMjdxSFdqLzdR?=
 =?utf-8?B?K1NNdHliNEZpOGVaV1loaGUrUFpjWHJJMW1HN1hvdFdLUnNQR2VYbXFRdndU?=
 =?utf-8?B?d2Y0V3VvTEF0V2c2alZtM2d1b0xMOTErUWY0N0xaeFR4ZTllMy9zZEJOTk1o?=
 =?utf-8?B?WjZtOE5tLzdBREtYbDhvb1N2TEQwSVNIbkE3Vlp4WjBaMDdLRk83Vkw4bkFh?=
 =?utf-8?B?MmtESkJpa2pHK2x6ZU8xS2ZxRnQ1WnRraytvMFM3U0dybVlaMFU5empmMzZO?=
 =?utf-8?B?Wld5b3VoRVl6dFN1SWRHVC82U1R5RUVIdWg4UVRLT1JaZDVSNUl4QU1mcWc5?=
 =?utf-8?B?Uit1UDJlSTBUQ1BveXRTWmV1bFlpUnE5aHlVbWlEUlJGZUtNUDVLb3JrNTlB?=
 =?utf-8?B?WjRIVitHMDE5Ymk5ZHFqcTNhdkc1ZEZoOWw5K0xOV0t3R2xRMGQ0MGQvcldE?=
 =?utf-8?B?Y00yc3JzZzB6OElCZlV4OG52dldvRmdiOEUyMVd1b2lsSTF0VllWQ21veHl2?=
 =?utf-8?B?bHNOYmhiNGtBMlBPUUdlRXVGUStxS1l5d1NpUURicDg4YWRBbDVSRW9HbEtI?=
 =?utf-8?B?eVZmVWg3N0dMcDZPbENlMXNXMlVaN3ViaG9aclVPemMxdVBmdUt3TGdaZ3FW?=
 =?utf-8?B?NGNHWEp1cytsNHJQdHdYQ0tON1psdXNpQVZBeFJTVUlQUGNZaWp2YlNFdTda?=
 =?utf-8?B?bHhUVnNONFAvSDRpVHpXZ0FkYWduWGlqQ0twYzREVGVkRE5sQ2p3UjRGeXp0?=
 =?utf-8?B?SE9OQ29MV2pVeUZYd2xVb3hKeGhFL1AyRmNXSWY4RUpubmZMWlNqMzB3V1FM?=
 =?utf-8?B?RHA0cFhjR0ZWVUx3OWdLMVpWanZCazBKYU91VHV5V2pFNVU2aTE2ZlpKVWw1?=
 =?utf-8?B?WUVWSTBkZEMyNmJ6M250ZDhIQzhQN0wyR2puMnJrSzJjN050MjB5V2xISlhw?=
 =?utf-8?B?YmJld0RXNTlVWEhVRHI0dDhNcWVjWS85aFRHMnhkZjk3c1h1WEdVdWxTRVVI?=
 =?utf-8?B?aUFhNjhLT09WZGlUVksveVJIVHNQbjUrSlRJeS8ydjVjOEpaZVZwMEtWZ1Rn?=
 =?utf-8?B?Um96RVJnUzFNc2JHeEQyWTRRdXNOZTZza0ZxZUJWNzI4UUdCY2FEOHV1THdD?=
 =?utf-8?B?ay9ENzM0cURxbXcvYkdjQW1FTmJvSzRXZVVOVWFTSVJVT3pIV1lYUmlkVzFp?=
 =?utf-8?B?aDNjY0NMcXJKdXlGcjFDSWNFQTZ0a0VsMU01cjRHWjh4K3dGYktyUFQ2NVM2?=
 =?utf-8?B?Qk4wRkhLL21uNk5UaDcrQWt6QXR0Ykd2RXVaOEFNeitFeE9VanlVckxLNHdX?=
 =?utf-8?B?cXpySGFteVhQeFpXL0RuVjNZbHN0RTROcHJyeWhkZWh3dXBuRlN3MjJVNjBK?=
 =?utf-8?B?UmluNzhrQi8zS1FUUGlMVXJ6UktFdStvSy91QWlPNm5pMXMyL2xwQnB6SWpM?=
 =?utf-8?Q?/pdFmzPYjk+Mj3mFoECdeGlP6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db3fb867-8811-4045-c686-08daa2035b04
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 10:14:12.3237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ucRmLTxTuDOhC8G4hneoDEv3B1cnZKkVj8eQEEwU+Dd8IcBet6NAt7HhNi1u9yuvmgweHRQPi8K3PWpPlgr+Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7895

On 28.09.2022 16:11, Roger Pau Monne wrote:
> The current calls to memory_type_changed() are wider than strictly
> necessary.  Move them inside the iocap handlers and also limit to only
> issue them when required.
> 
> I would really like to get some feedback on the Arm change, since this
> is now a prereq for the actual fix.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (2):
>   arm/vgic: drop const attribute from gic_iomem_deny_access()
>   x86/ept: limit calls to memory_type_changed()

Are there intentions for having these on 4.17?

Jan

