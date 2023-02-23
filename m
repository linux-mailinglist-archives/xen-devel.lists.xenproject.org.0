Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD7D6A08B0
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 13:37:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500331.771660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVApx-0008VB-K1; Thu, 23 Feb 2023 12:36:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500331.771660; Thu, 23 Feb 2023 12:36:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVApx-0008Ss-Gk; Thu, 23 Feb 2023 12:36:37 +0000
Received: by outflank-mailman (input) for mailman id 500331;
 Thu, 23 Feb 2023 12:36:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pVApw-0008Sm-7i
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 12:36:36 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe16::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b45c7459-b376-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 13:36:34 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9294.eurprd04.prod.outlook.com (2603:10a6:102:2a5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.18; Thu, 23 Feb
 2023 12:36:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 12:36:31 +0000
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
X-Inumbo-ID: b45c7459-b376-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3hRyj/t39fS+VC8X2UxofthLFmyfj3+7a6meEx5O2UAc4k5nJ0qBCnVDQoshm+nbT2KPbxp8mRZnUKWBCoh/6xGn3194wMf5CjqI5tJRM1o6/BN9ZoNwNhdz8N7gMpAfIBlTjjcNvXBSj/yGG8j8ccxjiaidFwhhSG1YoZZ0w9uBn5Z8S5xFTb28PCgZxQHPFUnGgMwd1xNJFnk2t+ZRZuMO1am8GEr7hZpwQgozToD+ah7S7Hd1bum990+FnKEX+AQx8mt8YgN2OcAbZolCtXQt6R4T3UMXqMKYrA0QJ4BoyayGEJH0E3MwrqBLj/AHBocNB9lUg//WkYVaLpYOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLgsLmQtTZN2kToEkHZVHqlcygnCFH/JW/Ths5GoQqU=;
 b=gvb1GDtyLiWeiAlwBQqadY7mTzYCoSGj9TG0udy4IN30GqsaT/doxkTQBaLFu92A+58FHYm0hWrUzvWSc6tT6k/RQoleHh5167Idm3lSnSa8I9odu5BLrYBcVE6qz6D6K79kW9alzZJFsi71usLhc5A4OisyiiDfNoHRLVH+54RP/QdsiFIK/lmda61E+Pe8GSBWL5XyZl9d+zoZVo7INlpgM57C/588gc5NVf/V0w1xPZ7EetkLGFbufdx7GHIlSJdNcBwdR5JaIaeJTR1CZwFtbY5W59yWCIIvLzEXkC5xK/5eb3yk0MBJsKZ0qNbZCs7ZFWnNO2U+PDrXgIzPHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLgsLmQtTZN2kToEkHZVHqlcygnCFH/JW/Ths5GoQqU=;
 b=AZ3OCBNt5giRok/7lWkr/iDUBD0oqWNCf9qIVCoFsqvI3j7SNVCwZHrQwrKNilrBcj2isd45UG/2/J98BsYcYSKVdITsQ5pcl56bH5f0alzSh/YTaDxoAB3dBFMYRRptVSWHhOly4IHpbU2afuWURwI6Vvwo7aBtAva2BQ1bc6rg+7RgmFbOnyYrSjetcS6Efz/APOlKJ3Xf/y/KhpbiNWZY7KJc2U3gVRfDiq7hwMAftRUOom+1vjxU/cjE0HkJY9Hnm2L+AsFHTqQKqLGp+1Wksf4qjlocXCcS/R+oMUvoQK5utVeJNVSgIbmkDAlEWJwpu55oh6Q36hOZt3uddw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77e489c4-b6c5-2997-3107-34e61c72580b@suse.com>
Date: Thu, 23 Feb 2023 13:36:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] xen/compiler: Clang 14 and later understands
 attribute((error))
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230223122245.2557228-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230223122245.2557228-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9294:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a68a871-769e-4ea5-b1e2-08db159a9763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9Tx6N43QJkXihxTJOCWQLO0xkBC07FMsahujggRnCSDFDWKtWPOV/NAKKB/VM1SOrh4UPxUJZ0bWFb2eDJs+bYxzSHnKi7f8oa2HCqk2r/6FYUSuss0MK9/T2wRsz33oC1OT7R4qV1uzixstoBY7H2bIjG2NUBiIbMmmxiOhe0juXF1MNtj1m6ZgYU9Kzv7ILwmKm5lPP/2X4OYqAuYbTl3G0bS5znp85ttbxVFxJUvMYADWJBpuXaGGpK5E6It0Tq6/5OYdYrqZ4fDsPEArWEiopVoDG/qO5+aiyRsFbERAPQ8SfIbyOACYIiBsEqxXzkyQleC6zUQ9krzMrsJcaOyIu7KvJYJyD0XBgErr+7Du6kPna1fgcMRdpMQHuxi31rTGBIAUsBmKHdlYvePhl6O8dzTcyXJNp5SS2RBgBvNXXK76wy8jy1xAMrC9TAPwii3OlEk4Cdxz/7grWyz/KeoatZl8YWThxOx2Rat3QPU5om96IB/cvrfCYgQS8th8+CsCNVXZbMe9B6zwHSXo+xvDky2g/kheHqkSET8lZZe8ehgMN/HelAeQUBhBr81Lk3Uu2vfJEFXuDffltpfziZV+ZrK6kDoIsunOKcAfIB0YzQjUe5viwLuRPbGGiqTe1cqbuiKN5N24uS+0JtXHqB69qMLb46t+ChXJOgaMEKv8gPMiazUHA4YhBDpJZp69YQXoqExytGnIBB/xG4pgqT88sX6/aHRj7ZPeTGjeIYo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199018)(31686004)(31696002)(316002)(6486002)(86362001)(54906003)(66556008)(186003)(8676002)(66946007)(66476007)(6512007)(6506007)(478600001)(26005)(4326008)(6916009)(41300700001)(8936002)(5660300002)(53546011)(38100700002)(2906002)(2616005)(83380400001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDhHV0RSV3d5cTlwdWphU0VZdVg5djhzK3VMZUY1cTB2clpRbUoxelMzbkxH?=
 =?utf-8?B?YjRiU0FOT1BkVWZmeVZhbnYzZ0w1WnUwd0U5SXl1bllzeVJpemZKTGo3cnpS?=
 =?utf-8?B?NURjcURrUHFBWitlTnAvejZzcHRkajdrZmFaenNFWk1iVkZtWk95NGV6Y0M2?=
 =?utf-8?B?UG1ORk52NnBKbXpxZzc1amI0ekprRnd5aTQ3cFB3bC9TL0NJdzFjL3hwZ09C?=
 =?utf-8?B?RE9zWWNsbi9ENDVFYjVLSllDRG5CWDltQThsODU3dnlPdXVWa00xR09kTEhM?=
 =?utf-8?B?dVE4QUgyOEc1Y3ArSXEzRUxPTUZ1UGZrR3pqSVplSHh2Y015UFAwNlJZRzZI?=
 =?utf-8?B?UFFBNWZtb3ZOQnh6Z0FXVW96S1VtWXlZSWlzTVVLM2Q4U0QxWHlKRjFGQ3V6?=
 =?utf-8?B?bzVzZUM1UHV2U0hLZVB2VzJUUEZ0MXg5ckZteWhpUHo3cEpXOTJOR2dTZmdS?=
 =?utf-8?B?UnMyaGppYjJpV0ZuelFZaXZRcEx1VEVtZkdtaEdLS0ZmbjgzRWFicVRaemNP?=
 =?utf-8?B?SmpiZUlvdGR3eHJaV2JZRXlpc0k0RDdRZXg0aEk5YUw5bTkrZVlsYzNFL0VL?=
 =?utf-8?B?R0RuaXdSWXp5WmhCZmNzTGlUSDYxaDJycWNnSHh6YlhFbHAxQzU1Z2ZtS1NJ?=
 =?utf-8?B?dTl2WUxzMkk1dmJaYnVoMVFDRm8zM0hLbUVZWDZNUGxlTFZhWUt1cnpmVmFL?=
 =?utf-8?B?Sk1Wb01QYUZYdHY4dWJRM1NCL2F3VTFlSy93MzZJSThjQkx2dGdKblRZRTFQ?=
 =?utf-8?B?cGZlL1Y4SkR0NGYybGNCUkpJZytTUGdBQld2cEJQRjhwbW1wcVpBTEJzSmdi?=
 =?utf-8?B?REZ5T21JQ08vUDY3eEEreWJPc3laUWtjUHhXalpla3VTNnN2MzRhWVpXc3gy?=
 =?utf-8?B?WEtiS0pvd2xMbHd4aVpGdlhSb3ZjQ0RjY2FmbUM3Q203RmFvU2t6VVFhTVRU?=
 =?utf-8?B?NlkvcXJBTUFvaVlaYlk4bGFMRTYvYmJnMlYwWnNoWUtiZVN2MDZ5aDA4OU5R?=
 =?utf-8?B?cGVQcjdaMVI0SUZEVVJVZFIwZFRYeXg4Vlc4MUluT1NUSUFPcVlCc2U1NFh0?=
 =?utf-8?B?blhaZmpvek4vb1BpMHlyeXUxbU9mT2NnRXIrdnJscU5RRmQ0bFMydWZJS1BF?=
 =?utf-8?B?VGJ6V0FzS3dWaUJZeDNZQllEdk93NThzWmNldW8rNWU2QmY2STBMT1BlNVU3?=
 =?utf-8?B?U1ZRSngrYzVOSk5Ybm5sdmZYQmRJK3dUTzlQSVR2VzllZ3RwYVJlN1F4RW15?=
 =?utf-8?B?c1Z4Q2l3SFNWN3lJOGlzZ2djK1NBaTYwSmJYMkhQbktNck54YU1vUWtiNnY2?=
 =?utf-8?B?WGFSajNFalNOUmV2a291SVJIVWphb3RxYUxTaXVpR1pXbW1CZTFTZml4dDk0?=
 =?utf-8?B?eHoyUGtuOEliYlhMUHhIV2wybGdzK1Q4WWhkVmlieUorczV5OHlqQlROVGxq?=
 =?utf-8?B?OEt6eThhQWZrRUxSRTlSRzBKcDczcWpQN25Db0RYMGtwbUNJZy8yUTFmODRR?=
 =?utf-8?B?Rlg4NENZRTl6dDFTSklnT1FCRW5Xa1FrM2RNQVpzcG80cnVOYStzaVl1bjJB?=
 =?utf-8?B?QzRiaW1zQVZqM0pvQzN0c1ZSbDcyOFdKNmhoUWNHZnZyVVZXVFExVEpJbjFx?=
 =?utf-8?B?M1NKRUtWd0lzZ3VlVWZQZWlrc3VZaHlaNzNRZ1czWkVvOWZ4RmdSZEVRNEo0?=
 =?utf-8?B?NjR1V2QvM1haT3RHaG15QjJlMTk5Sjg3VjZyMWxid1BncjRkR0pMTUJkWGp0?=
 =?utf-8?B?SXBFRU9GOGljTVQ0NllvZ21lZ3p4b0RyWksreElIQS8wQmNHYmRnL0daTzdx?=
 =?utf-8?B?d3dMQlNkQUx6ZHZKSzFYRTR3a1dZUFFZcGRqdHQ3N3lRWldQZ0pXYVNEV1Bo?=
 =?utf-8?B?ZzJzR29CdlZDOS9yMkJYWURTNjhuUW5IQm45bTJ6TGorMFlMd2VFVytXUzJK?=
 =?utf-8?B?U1JVZ08yUi82VlZuRkg0RW91ZFBka1ZCQkw1dWtIQm0wc0MyaG10ZjkwdFd6?=
 =?utf-8?B?ZG8xN2gzcFpkeTRWQmEzcHFHRjhnbG15bmFUN1NpTGtkcWdQdzlkT2QreFE5?=
 =?utf-8?B?YWhzVjB4VUZ2TGVWOXd2K3FxNjBCVnloNnRVUEZuaTJET3NXSFpTNFB4RCtm?=
 =?utf-8?Q?GlpyT9gyiVrTK7waeMHtGz5c5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a68a871-769e-4ea5-b1e2-08db159a9763
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 12:36:31.5222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zulT4L3PaS12/geg+ikri0+T8fcv9vU9mfUVOc0JWu8QJjRbt+tcuVyjKItgCPgYA6gRcPITBl2a+v4sr/WaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9294

On 23.02.2023 13:22, Andrew Cooper wrote:
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -31,7 +31,7 @@
>  
>  #define __weak        __attribute__((__weak__))
>  
> -#if !defined(__clang__)
> +#if !CONFIG_CC_IS_CLANG || CONFIG_CLANG_VERSION >= 140000

Hmm, for the sake of getting the functional change in,
Reviewed-by: Jan Beulich <jbeulich@suse.com>
but this clearly is against the Kconfig usage proposal: Following that,
such conditionals should not reference CONFIG_*, as the .config may
have been generated not only with a different Clang version, but also
with gcc instead of Clang. While there were a couple of comments, no
counter proposal appeared so far, there was one explicit agreement
with the proposal, and the requested patch demonstrating the
intentions wasn't commented on either. One might conclude that as per
our lazy consensus approach the proposal holds, and no such new uses
violating its principles should be introduced. The more that the same
can easily be expressed differently.

Jan

