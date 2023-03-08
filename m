Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4CD6B0CA3
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 16:27:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508084.782352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZvhP-00015F-Dr; Wed, 08 Mar 2023 15:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508084.782352; Wed, 08 Mar 2023 15:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZvhP-00012Q-AO; Wed, 08 Mar 2023 15:27:27 +0000
Received: by outflank-mailman (input) for mailman id 508084;
 Wed, 08 Mar 2023 15:27:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVld=7A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZvhN-00012K-9O
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 15:27:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9a2ce51-bdc5-11ed-87f5-c1b5be75604c;
 Wed, 08 Mar 2023 16:27:24 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAWPR04MB9815.eurprd04.prod.outlook.com (2603:10a6:102:381::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 15:27:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Wed, 8 Mar 2023
 15:27:21 +0000
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
X-Inumbo-ID: b9a2ce51-bdc5-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8GQF30Rfi6IDp1sRqGhqMhNNHnbar1thAYeCKaMkfTs0OBze8ajZrm/U2/SMQd/++3ZRZ57j5wKqdJDaSmKq12Y3AG+tlZqd9CXH65+jApHAG7j/xYTSSjzesReSyVSy7a9YciVpC8DbP8TOL1NOlYb5BwkGMvoT65DLSZqqt2HlSPltp6da3OFyLjFT4+SpEQ6R7zibXcp6XHpRZNc3Nto6FJro/h8bpdicEyH5UYX6PwqygGOj/YRoJzRbxPOUbTQOVcT1DO6ucz+52qwXHrF2nF+k3LZIdDqL/vVO/aj5olsSt7CWgSQ6qvIS37BrZwddCfn6DB3zCYodlVnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TM3Zv1SzQkBx0fR6jPQIbDNmcU4Ogxcs7V6Qd7eVixI=;
 b=gNzYg3akT/sNuJLKX8zF9Gmj0ZTp6AS4Z5Rw7DfPwjSDYh3IfxegYUC0u37Ifk7v6nSqZTJuhBKKZ4wQAEeqyyf5Mkr3YjP9QwsX73qafrzFn3jcHrcQqo6FVMWkVQrt8Lksrh2RlqckRieLK8j3HukgC6YrvgwtL3Lnb+//HvxZsLdaaIJfEvISQYocJ+uTpBF8r6Na/X9IRW39py88Dlh0A9xCajk1y5nIDsm0hF5dZj6iI8M+nbQchHpXL8GBUdZso1zLJUQMta9ytrmM1EikF1ezAq0C0f37h4t9F8C7SWldKwjdyQ6sc8LowHOonqH+tXqaR6KOH86dqPnAKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TM3Zv1SzQkBx0fR6jPQIbDNmcU4Ogxcs7V6Qd7eVixI=;
 b=iA417ULa5+D+VYFk1N1Mka0oZDRX3t3lyVtD+TOoo6UDpg8GlncYRosOx6RM1Wwnq2qYo0yZ8KgXYmchWipVBa/uFCxeETT6jZzLg2IMIteW2aoQbYM+4WyVXAAl4nXfHwF+/5Ryg2y6WkV+GMyF6jgFpRjgBqBWrJGNg1owDTfYShd6y7Vqhy9Ccf7OE0tubXJQ4SYaHliDOx6l87MyqtPcO6rpPn7ihD9E3pPu4sPt7Zqlk5Zk4tdd712BTDrYzN7VTRj9Or7g+fk/zoWT+uutQRy5hiU0D9OvURkKYI9eBbbN2lGrORFEMbCyQ+hSDEqQjoKkMeY52J9Sjrd/Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c7ca139-a77d-c5f1-e8ae-d819656725f1@suse.com>
Date: Wed, 8 Mar 2023 16:27:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 2/4] xen: change <asm/bug.h> to <xen/bug.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1678202233.git.oleksii.kurochko@gmail.com>
 <d8722046783462504d5396f7f880ff62b1ef9a90.1678202233.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d8722046783462504d5396f7f880ff62b1ef9a90.1678202233.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAWPR04MB9815:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cdc9830-eb48-489f-fbe7-08db1fe99c70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PSqImBBGyqNBYLRZVQVc3cwd9M6/9uxHUe/P02qwQsdux0iYiCVDb83P9ksoRkMPaNVJt4dXYr8JDIsDRbEEFC/JxmOncCtMN3oZjLIvWQSP+Wh45rbrngjRSuBvtLsyKyFYUC3/tUT4H3l/doJh2FSYv5XLeSaoT50e8lgxR+SAWXXEiBcnZAUfUQNxE50dqUV0CJ3YpaLd42lKLdEtd1GCY9StmrjWGI86lGqAO3q/it2u5jRAA3U6X1u4fhaKgrKtUsmIshpI905Mls1RgiuzWX2Yi+9Lb7bg/rCNB/ZAxmQeUlkbbNI82cznJkHgPsIoGfuaicbim4dsb0QZnfP4XWuAx417zdE2RCRT33bcwfTNQBniEY4cRROVMaQy8FwbPrwBMp3njQq5yFoBnmlL0Z3aGAO5m6P0B4/gqGys3UGaxLGfsSuLuY/XZBkP//o2bHfUArYZ5/rXmWfrsohpviccTsWjY4Huj04yUdV7IiaqHZuUXTS1VqZkERbJqMssQGP7Fn7onYtyKE1BmDa1bD9QfN7ih1iPsZsOOniF09zNjT9XZEKynmm0X29uwxSh9FvQd6ph5JfzMpYE6JNUICz8I1tSfsTZh207n/gnLVbIeIx4DlDEB/vp0iNFAN/zo6OrXbaRazUKYFU/nkwc4MuK65HyxM+JSc19SbVAY1p3b3dxTHLrQIg1ObIVsexWylXPmvHkMSK2FdMM/2XG8bUEwzAXK7fLa4nrU34=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(366004)(39860400002)(396003)(346002)(451199018)(54906003)(36756003)(478600001)(7416002)(2616005)(5660300002)(2906002)(186003)(6512007)(6506007)(6486002)(26005)(53546011)(31696002)(86362001)(8936002)(38100700002)(66476007)(66946007)(66556008)(8676002)(31686004)(4326008)(6916009)(41300700001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2hRY093eEx3U29TRzM3Mk1JWVQySm1pV3liNVVlU3RkS2VlM00wTkgvV3V5?=
 =?utf-8?B?QTFHWExobG1ZRjh3YmFRTmlvMGx0MnRSN1NCa1BpNjd2eTd1T2pxWEVUNWpk?=
 =?utf-8?B?cEVjNHlDVWw4TjlsMDRRRStaVnFVOVpNektJQ3VKZlRDZWZoTDVENlJXYi8r?=
 =?utf-8?B?ekhLYXFkVVFPcWdXWlBiOVVoNnJBcDJmcjI3TE4wSERPWlRoV0tjbXhGL2lL?=
 =?utf-8?B?OFhkL1F2dEFDdDd1MWxYTlRGVmVybjRLSitPVWpDUk95SXdpREdkM0VXTjgr?=
 =?utf-8?B?QThuUTFHaWxaOFJIVHp3TkN5amVlS3BIaXExTWVuMmpFelkzU2tTeEdxTEVn?=
 =?utf-8?B?cTZWbEl2NEVrNS9NUFM0SnZoZE1WTjNqTHRtRkcxcWxhcFpQT3gzSEppUHJX?=
 =?utf-8?B?WTBRbDRwcCtpVnJSMnV0OXViMVhDWTJqckdRTkNLNEg4UHJTWkpEUzdPUTB1?=
 =?utf-8?B?QlkrY1ZjRS9rL1pTVEx6U1NaRnRpL3pra2RFSDczMU42cHZpbmhyT1lna0Ru?=
 =?utf-8?B?b2c5RU1acmZTMFk0U2tUK2c5MVhvTEl3QUFlMURJbG5ka0hOcUhkV1lmM081?=
 =?utf-8?B?WmhDaFQzL2tiaVZoMjhUUEN4UkdVNGlmQjZvejEzVXVISVBQamVUdjk5c1I4?=
 =?utf-8?B?aERQNVJDSlRVZm9oNGpvTnhnVGhBcnhudFFNaUZtcHBxZ1FVZmhLanJxUXpz?=
 =?utf-8?B?ZW80cU9RMUcxdXBwMlFSUVRMUDNVK1VyL1NYN2ZwclA3azRhdkwwbjZNemw3?=
 =?utf-8?B?c1FhL0QzNm9QUGI4VUUzNjZXSEs3UjFFZ3g4YmlEeStneUZGb3NYM1NwUHNa?=
 =?utf-8?B?QW90RlkrdktKYmVZWHhsdm1PSDZWcXFqejRjSkIybGIvd2JWb3VxeVIyRTVY?=
 =?utf-8?B?UXFGMkdXVndsdVJkUDZTMW5INmJRd1RQOWtEdTRlWG16VVgzdFl4WHM1V2kz?=
 =?utf-8?B?VGR3WFIxZVRsVTZDc1oxOGJXMEtIM0h2bkNXeUNpaFJTOFNvUC8rdC9zODNn?=
 =?utf-8?B?MEgzVzFONmtTczE4UG9XNitnRnlVeUpVd3ExZlF2dCtBek40OVlYbmp3Skhs?=
 =?utf-8?B?c3M3aGtYTE1UQzZOdStTNzhnejA4QlljMW5TTFZkTU5EK1JEcFJkMVo1SlJK?=
 =?utf-8?B?VnFuTXpWSEJoeWM0RjdKb1lvejFJaFBjeCsrZm9GZmxXd0NHYnMrVHpTOEZv?=
 =?utf-8?B?Z2JMeTJiNU5hWithZFhsdnZNMU8zSzBrSzBMenhGcWJjdTd2UERLb2Z3RGgr?=
 =?utf-8?B?Q2gzSThGTkxPWlo0am0vWWF2Y1J1amVsNElWd3M2eTUxNVFicUFQSnBpVDBs?=
 =?utf-8?B?bFZTUTMrN0dWeG1NWmZZNmJ5dWxUZkJUNFBjM0cxTU1NenVzSFdjd21iYzQ3?=
 =?utf-8?B?a2cyRkNuSlo5WGJnWVYweUc3NjE5dTRKY1pJKy9aNmxtM0t4SC9Kc3lRSDVt?=
 =?utf-8?B?dkFETG1JMjdlM0JZenpRVVVjN1JNLzFFRWxnR0krSm95Tmg0ci9zVWlmZzlr?=
 =?utf-8?B?NlFTUUtyNWovMzJpUU4vdTdzWDI2VGN0dXBidS9Uc3ZjNUhqVE13N0VPMzZp?=
 =?utf-8?B?R2VlbmJ1Q0theHNtcFY3NG83RDlUV3ZJdEh4OG9qQWs0TXlPSjl1dEFmYWtV?=
 =?utf-8?B?VnQ3NU1OaXk4V3RqbzU2L1loYjJmbU9Qb2pmbituOC94MExZQVpsUUxmVTZB?=
 =?utf-8?B?VkVac01xWm5vQlFSeWdTU1FnSjNQNGhuaC9tY3ZZY1d2bUNTZkhGcGtRaUxX?=
 =?utf-8?B?NEFhbXJLdW1HNGQxUW9pczE4ZnV3ZHlrNzcwcnpqWFprQTEwb3N3eVNCdnJt?=
 =?utf-8?B?bmsySmxZS2x5bEhDMWlhRmt5UlFVQTFQL3BRaldCcW5NU2FNM3NnN2xjQ0xR?=
 =?utf-8?B?bE55ZzlYNSsvNXFuZzBCYUp5U1VrdFBDRFo1SndOTk5meFRtSHFrZmRLSnl2?=
 =?utf-8?B?WFg3TXhBMTdiRlJSRmYraUU0TDZGcGp2K0pnNmtOdkRFbXJhWnRteEladWdE?=
 =?utf-8?B?akg0eWpLeUFqQThXZldZMm5BK0UyRnd1QWFBdkJBREZSZmdEWU1sU2grSmpw?=
 =?utf-8?B?dklJekdjVWVKMTBDTHNNajdEejJWRkxPcDVYdUxNRytkUG5Rc1ErSjRFMW5U?=
 =?utf-8?Q?v2QdCyHh1L832hRUzwJvJLC7U?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cdc9830-eb48-489f-fbe7-08db1fe99c70
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 15:27:21.7110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jSfgurRd26hxT7m4zVvU1sb7mvVoClkfVziZkMuCQqnTQ1UvQHyILeQvJOg1b/rvnFYpJa5z+U5/nBpBAVoB+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9815

On 07.03.2023 16:50, Oleksii Kurochko wrote:
> --- a/xen/arch/arm/include/asm/bug.h
> +++ b/xen/arch/arm/include/asm/bug.h
> @@ -1,6 +1,8 @@
>  #ifndef __ARM_BUG_H__
>  #define __ARM_BUG_H__
>  
> +#include <xen/types.h>
> +
>  #if defined(CONFIG_ARM_32)
>  # include <asm/arm32/bug.h>
>  #elif defined(CONFIG_ARM_64)
> @@ -9,10 +11,16 @@
>  # error "unknown ARM variant"
>  #endif
>  
> +#undef BUG_DISP_WIDTH
> +#undef BUG_LINE_LO_WIDTH
> +#undef BUG_LINE_HI_WIDTH

Why? For Arm ...

>  #define BUG_DISP_WIDTH    24
>  #define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
>  #define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)

... you could purge these as unused, even in a standalone prereq patch.
And on x86 ...

> --- a/xen/arch/x86/include/asm/bug.h
> +++ b/xen/arch/x86/include/asm/bug.h
> @@ -1,19 +1,18 @@
>  #ifndef __X86_BUG_H__
>  #define __X86_BUG_H__
>  
> +#undef BUG_DISP_WIDTH
> +#undef BUG_LINE_LO_WIDTH
> +#undef BUG_LINE_HI_WIDTH
> +
>  #define BUG_DISP_WIDTH    24
>  #define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
>  #define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)

... there's no reason to #undef just to the #define again to the same
values. All of this would be removed in a subsequent patch anyway, and
it's less code churn (with code nevertheless being correct) if you get
rid of the #define-s right away (as iirc you had it in an earlier
version). If you agree then with these adjustments
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

