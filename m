Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A03673DC7
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 16:43:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481221.745977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIX4M-0004Ti-7Y; Thu, 19 Jan 2023 15:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481221.745977; Thu, 19 Jan 2023 15:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIX4M-0004Rx-4R; Thu, 19 Jan 2023 15:43:14 +0000
Received: by outflank-mailman (input) for mailman id 481221;
 Thu, 19 Jan 2023 15:43:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DP+J=5Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pIX4L-0004Rr-Hi
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 15:43:13 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2074.outbound.protection.outlook.com [40.107.105.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f78e0c31-980f-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 16:43:06 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9697.eurprd04.prod.outlook.com (2603:10a6:20b:480::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Thu, 19 Jan
 2023 15:43:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 15:43:09 +0000
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
X-Inumbo-ID: f78e0c31-980f-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xls2QcxJtViABrhpSwSIzTWxQe4833aOgEZ+q6Mq68AQRyPdh9PdeJfrDafIcbQOJSgc3UZvuETEP0odxJ6yuU4/7UcEcfUFjh7l7Aynh0isgN85eXLQL6R0am+fQqbxCEdUfKyRDRCKm4in3J/p3q1IJ4WW6j01x+2fLQDih3brpw0+iucA/aHoxEfyQRKu5lDOS1arL7n4IOXDEx3+5L9aIGRwFULV7egFw7iIhKIrIkQ3MtNGuNF8sypFD5rGwrv7yhhE189imjMz8gqsf63JLUtUd8NfEbcj7//cVR/D6DSS8i72gzPv+ZB33YE8weI87gTuvYlihAX9CkLwBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cE8PJXTR8azlFb4HPZRlTqqi/GSEat+IqwbKdSyrn/4=;
 b=hFlCuutq1kMGCK0U8+PICBCkd+exUwuHvd2aj31lmY/ioKO+gHsxearxCEPGqWz1ZxxI/m3VdKmqY4IgytIbAybuqD1T0NNIVgMJgU5RUofR+uLAiQH2+NrTaqrlhIeGfmnKw8mFzLEgA0gK7Pxt7D6u1hUuXqBS/vmKAaddhq7icdrndObze6r4tO0EZc2ro17M3v9qMbzOK1/0PPU4ais3Akp8juoUsvvk06gnADk7VpxaIJ9jJIj40h9EmhtkvlnamdplseAZw1rkPhQ/EDpH48YoBID3gkSDwbfZyzzlqFQ9baLpWEpmSY7hpwkVYa38jFUTArnW1s5cTHkt7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cE8PJXTR8azlFb4HPZRlTqqi/GSEat+IqwbKdSyrn/4=;
 b=K6Pze2ZLFTatW3jHtWYhU8AzmqO+EmTqW+QJ9LNJPyAerGrFglLGGeYmppBvmloOab/Wp0m8ntKow+9+WLSH1jevLhTkAcs42U4YbRi+JDPU/BxAOyIx3fxDpd+wrgZaMEQmxmO4Qhn9h6TwGmAn1zzcfVkjcNO1M6qoPHAg51vd2DJGm23thhkhnUr9FdlAGmxdWdSfhQ4jywpoJxX5kVbS4nKoVAQ4M4d0G0wKm3GnyWAl1MqLKJsSFspV3o7tYbhRkZ4jaO13qVOanvWa7cArXu0lFRYkzeF6oB2K9TbdKKjzMaaTz8jHjakHl+gKtA2orjEZQVu0TugXpHSPWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a2d262f8-77eb-44bb-d3c9-677ed73df22a@suse.com>
Date: Thu, 19 Jan 2023 16:43:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 1/5] xen/include: Change <asm/types.h> to <xen/types.h>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1674131459.git.oleksii.kurochko@gmail.com>
 <916d01663e76a3a0acad93f6c234834deaa2dd72.1674131459.git.oleksii.kurochko@gmail.com>
 <22992b47-bac6-d522-a8a6-c55c3c15e7a5@suse.com>
In-Reply-To: <22992b47-bac6-d522-a8a6-c55c3c15e7a5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9697:EE_
X-MS-Office365-Filtering-Correlation-Id: 807506aa-6c3f-42e1-65a0-08dafa33dd35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	otyfuBk1BxMyAdrN/bdYmtqpjJ0XaS9XsFz7zkPAl2aHoU6dbNrC21KaYlrsi9emReRbs3nx7EPmL/Y++SuIzU8v9o6ITZhKqP8n71P1xKd34bqljF+L+PPjwt7a/57LvY5w3o16D+XTdepICE6IR2JEqhsdL3YVzKfZJmBPkO4lAtyqDjAvuSXZkWTAsPsdKxE7L11YkeU/SyVXUoB+L0TgAaUe97JuKkko7se/GjbZ7Rtyt7Y3yCobVpNynHFGLeVFGwHpn3KNiJkZ7VlHU2nEWi6JBeMS28z5KBnTezQba3C31phQoj82qsMkBVYCY1EQzZqOcBM58TtEvHBFgXK06bESAyr6Nj8HtZPrRC8IoxywPlFjMBChSuZ+bTDK2zlz4GYVcz37A/fckTetfLcZNyN/mikSV+BKwvMRcsYdejyTUdjS+5aQkSO1WjiQWbfO+QmacTqkKXzXn0wY5KJOQfSfjE8MjHCEPPR1gGXCm6YpoOPXv6fMvNOek9NqUB3DQIXaMiIFYSnVo52uSSYdmt5Xwyr51QgmNLqSQDryWPCcTvLnPKeUnhU82mEZcOrqF7jaDJLIwYBIaCLz6X1ebxP1nLWxo2AoaepbXFNtZO75uuNEWM3qQOwFa+Icqu4A2d+mkzTy5vdrjK5qENMsZMYF3FDkA9SjO9HxsFKBjJf7OkCetaIR8aBhQz+NFLvdNaKyuodVw345Tt3lYt3hsN8UGVOLAHb0EpF+QryADVp0UpKFkbL0a8XFaj0gom/D0HKNN9t71Eub+MRfBA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199015)(6486002)(478600001)(966005)(36756003)(2906002)(38100700002)(6512007)(2616005)(83380400001)(6506007)(53546011)(31696002)(4744005)(26005)(186003)(66946007)(5660300002)(4326008)(66476007)(86362001)(8676002)(41300700001)(31686004)(66556008)(316002)(8936002)(6916009)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2hJei83d2VBVFpXWTM5ai82YWUzK0tmT0JEeGtMajYvVEZxeEZMMFlBdUtJ?=
 =?utf-8?B?cWpFbzQ4a3lucFpzZDFBa21MbldzTmlLSmtjNnpOc0JPR2lNQ0N0cWg1aEg3?=
 =?utf-8?B?ZTdvYWxiM3ZRV2ZoOVppOW5Ndm1ZdG9KcDJOV0E4Wm5XR2tBem1wZXFjMFJ1?=
 =?utf-8?B?MU5TMVk5V0NEcHRVdStHemFQRUEraEZqbnFuQ2ZuNjRuZ3JSMXVnV0I4c1lE?=
 =?utf-8?B?TDhUMnVTMURZNUtxdVByUy9sWDdveUdUS0MvTmo3RlVacWQzSE1tczBRSDVC?=
 =?utf-8?B?YmJjdFhpVjVzQTlLaFpuUzBSYzA2TlBKbW9uZndmZXpzcWJlSEFpcytrT1dG?=
 =?utf-8?B?eE4vQ0JBUmxLVGI2UGFXMzFmam1NNW9BTy9aZjZqRDdkVGFPVlI0cnFlSkFX?=
 =?utf-8?B?aUZvek9BSjJNYmpQakNLVjhWc3FsM3BlNm5NT0xIQWNhSmtQdUVya2hZaUtX?=
 =?utf-8?B?STQzM2xrNHROZEMxU283ME50WlRBUjFEd21yazA0bkx4ZzhENEpaNDBiKzhD?=
 =?utf-8?B?YVZTT0JEK3pxdXc0SC9IOXROZFVCaCtvTFY2Qld1bWRmd3hKV3d4MDhIZnNX?=
 =?utf-8?B?Y0x0amhBV0dldnBaQUE5aXluYkppQlY5YnQvWTY1RnEzSjRtVysySG5lN2tL?=
 =?utf-8?B?aDZLdXloa3JmQVpQSk9Lb3JOTHBaU3pRcG9kSGNaWmlCR21rOW9uVUhKbnlh?=
 =?utf-8?B?aDVoa3BaL2NvWCtCalVxTVRYT2c0NnFSZWRzenZJQXB3dnRVSG84b3YyREJF?=
 =?utf-8?B?SUJvamcvWWx6SlEvaU5XOXl3clZ5Sml0Y1BHVVJiZ043MFRTNUEzRVpHNURi?=
 =?utf-8?B?SkJFekc1bmZFSUN6MTkvb0hCeTd6VTBtc0RnUld1bFYrQkFjRDk5SWsraUpx?=
 =?utf-8?B?WW1MN2k4RDJSelVVelJRT3BqOGJzOTlWNnZxQzlYRGxCRUZ1ckU4cEFYOEJB?=
 =?utf-8?B?bkkvTlQ1TWg2eWJxQlJqN09zZVpZYjlrOHhWUy95UENRVDhjR2NtSUZVSGkz?=
 =?utf-8?B?aDZxbm5veWcxenJzQ01ycFNRalBvQ1dpdXpWOVNjWUVTa2x3blB2aWVVcG1k?=
 =?utf-8?B?d0Z0N3A2WDVvUkxYNXYwSFY4a2xvR3IyM00wd1psR3pHd21FMmV3QUxkYXNy?=
 =?utf-8?B?RkgvMFNMeWkwaUFjdmtYNGswb0M3OXVWRHdsV21qSEF6QWFTK3dIVzdXSlFB?=
 =?utf-8?B?dm82ZmNSOEppK1Y0djlFWkJJbGdpeVUzbFZYSnRxeGt6Vi8rR2d5QzFwRlZO?=
 =?utf-8?B?bTVYbFNIcE9kNlk4R1hVRkRnVkZxaU14NStQb21QcTZ6VHBuVXR4NmJ0TXVq?=
 =?utf-8?B?SUltS0YyR2plY012NDVoRlBEYitPVjk3NVh4cjJlWG80R2FzK2tiYitDNTdM?=
 =?utf-8?B?M1llemxHWW5uMWVQZ3BZYjh5VVM1UUxpZWs0ZzZXSkVMMitJQUJOaVpKTi9y?=
 =?utf-8?B?cXVsRnpBTzY4RXBNbE9BbHVUREczTWNuVGdLUjdocnFwelhjbHA3N2RpUDhE?=
 =?utf-8?B?N2N0b3JMWVVrUEI3UXgveTBkTG55T1JCVGVvM3NEWnhtRUVYY21kbVlHQTFu?=
 =?utf-8?B?ZlFZcUF2N1RNL2p2eWNwOEl3NlF5angrYUxRVTRhVFVmSXh1SUUvZTNWeXJn?=
 =?utf-8?B?R2xMUVc1anN4OG4xcDZMWGMrMUpLaUVCUHAwS3ZjQzlyZHZZd2JDRFpHbDlD?=
 =?utf-8?B?VzRmOTJoaTByc2xIdXZwbTArQitnbEJvWENkampDcnNGbGZpbnB3b2ZwV1lO?=
 =?utf-8?B?Y0QwMWVBTWpTSTRQWEpnV0J5cUh1WDNqWk5JM0Q3UDFGM3NQRVJNUkxPVWJs?=
 =?utf-8?B?dDRYMGRXMTlLaGxoVGZWNjBEWlI3RGNDblRiV0lXMVN5a1ZGKzdFVm56V0RZ?=
 =?utf-8?B?bzgxQVhEb0RtWDhhUURJYnpSM2YwVmpZYnlRS1E0ak03RThKL3BJRHpSMklG?=
 =?utf-8?B?SDdFSVVGVGczWXR1NXFYaW5xakEvNytRb3JCQ1BEYlhjYjJWVGR4QXhacGVu?=
 =?utf-8?B?WWxCc1RFSDNGcExONS9vMjg0Z0RnREJwSy9Zd0xVREUvdDlXQ0M4ZE90M3BO?=
 =?utf-8?B?WEtvSzQ4Q3FHVEhsL1lQd09malNWeEFxZVVneFhxUGU2T1UxTVFoeHpWc0dN?=
 =?utf-8?Q?HOkuzYlFBTbw+shbMcbgK2bvA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 807506aa-6c3f-42e1-65a0-08dafa33dd35
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 15:43:09.3042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wiSDNmAwGYnPC3BnTmenyxEJbkeKgFsrqIhDWnOQGOSjAFYOeeNtOn7MOlHYOba4CPlI0pIqL5587N2VcD/Yhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9697

On 19.01.2023 15:29, Jan Beulich wrote:
> On 19.01.2023 15:07, Oleksii Kurochko wrote:
>> In the patch "include/types: move stddef.h-kind types to common
>> header" [1] size_t was moved from <asm/types.h> to <xen/types.h>
>> so early_printk should be updated correspondingly.
> 
> Hmm, this reads a little like that patch would introduce a build
> issue (on Arm), but according to my testing it doesn't. If it did,
> the change here would need to be part of that (not yet committed)
> change. On the assumption that it really doesn't, ...
> 
>> [1] https://lore.kernel.org/xen-devel/5a0a9e2a-c116-21b5-8081-db75fe4178d7@suse.com/
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Actually I notice we have more explicit uses of asm/types.h, and
hence the title of this change isn't really correct (with this
title I would expect all uses to go away underneath xen/include/xen).
I'll try to remember to adjust the title when committing.

Jan


