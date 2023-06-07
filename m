Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A541725B72
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 12:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544678.850618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6qGU-0004Bv-4c; Wed, 07 Jun 2023 10:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544678.850618; Wed, 07 Jun 2023 10:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6qGU-00048g-1X; Wed, 07 Jun 2023 10:19:42 +0000
Received: by outflank-mailman (input) for mailman id 544678;
 Wed, 07 Jun 2023 10:19:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6qGR-00048a-TQ
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 10:19:39 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce8c3a49-051c-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 12:19:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8152.eurprd04.prod.outlook.com (2603:10a6:20b:3fb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Wed, 7 Jun
 2023 10:19:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 10:19:08 +0000
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
X-Inumbo-ID: ce8c3a49-051c-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RX5xisyb7K4RUWfBTnrO2bNd5t+Bhkvn4k7H6NnUNSjLzIoy+juCnwlZBPhOHRbnQaoP8T+ACxB4CnxNL/CialWsDGvy4ua2YGAOhDfLTxK3OjbbgRDEh+6lznHntVmYiNVHabzATlopzQpyHfpWrLgZl+m9gfGL7Mj25T/+4rLfTgy8t4f/5O7qBsz2ThN4B7i3tEScSTqcNSy9J/M7y6GHeIROGDY01+8mvT4qS5qx7KEmw+OD6uJ0CMlzGoL7dZD+ITonESYNqciT1sVBVUDlK60mx7tqeJj895Mx52LA5irRLNi5LNT4681V+HJC2HYKIZFcQfeFNh6sPZn+jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzAetTIwQXdC7Zhwn9GtVFyz+TsaxBc7lbOayXvekiI=;
 b=bEhdDMvAv+67PYttWXUeBGRUEzwwzkWyaZnYw0P5Sa6rfLSohk485hiwOXdqrS7F1yEpsNNU64p7I3EwZD65oxYsEGAnfzf0Pt6hMYfsZbGfHridPiRQDMz8A2txfd7g2snnSiIKKwPmDL0xgGaMOG2WdKLrfPRoCengU2dliwZ6oe5YTRUpR0QbGtTFIC8d5y+Uikg4tVqxig75+GJ2egYTqTZ2IYVBn1h0MaoH81ZFp2n+oL+H3pMoKJFxTDb95GR0d7gx+ECw7cR16yErtInDq1U8woPevhPwyR5G/jdJVVjzIgpOjrKF4/nTNs8BRtxzpymGggzmIkU9IOSLCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzAetTIwQXdC7Zhwn9GtVFyz+TsaxBc7lbOayXvekiI=;
 b=CN9jw7xOYzD1xi2dyWgGvULtmsqAEfUIDLLZoAdRgJMQWeFlAdV/OVS5kHYE1U8nOfAaf1Q3Ubk8efk5YxQnYVVJ9fBzkRV2ZUULwAPtznpfT1HLrBcFvhc3xtP8NJWDOySFFRH0gCk8ev+XhkpFbJVl1UF+hWS7pVq6lCl/xwoXt7McQY2twT9tCNyLurCV1T68LzCT5hIhC1L7jUqxSmm+M4i5Rjk15bk+yUQpuTU89IJ/Hrn28c3h9PPSd96MuK3MRREedhry/LywehbMdaWUD45P5ZQe3Rgr3P4B0kZ1j9Ks2RRcAhxwcr4Dec3gnpM+OYMm8vIdnud4UHV8sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d6bc24eb-8418-fefd-b247-5d945ea0e396@suse.com>
Date: Wed, 7 Jun 2023 12:19:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2] livepatch: apply_alternatives() is only used for
 livepatch
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20230607090120.49597-1-roger.pau@citrix.com>
 <d8048c61-4b81-0527-444e-fdf6f38ccb3b@suse.com>
 <ZIBLOYiAFE8gqUY0@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZIBLOYiAFE8gqUY0@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: 43dc08e8-426d-44da-0ede-08db6740a152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HIMZs0O+3vGv2UKqd7cm2zu8VD+SIBaLkRZjTPyrZU1pL9z6PqNrV076wHIeJ1gshcZmopuXwJ2evv5yPPV5sQpMHUBZHQ5wP8IAyS2ybEliBdzkkrlfMBGAveis+uDgpQZZ7vtEsqh+faNG+pV0I5ZGSLMKp7QT5/OKL8WMWUS7Zx4RIKyYyBpt5e24RL68gaS8BIsLxSrUzF+SosiFMY3kZ4ZKvHDCC+Z7n6mJJg+A+Q2KapdLh74/Zg7yjskfYNotZFhwqVpff913iWFUzAtzwadPfr9xgowSQBA/66PsD+IdPFWilMM/wGcasdU59WVr1lofrQuk/NLEG8ji6ieHrx5ikf4XtV2ciIKGio1e0VhxtOjJ0azR6mrJ6g/gxDM8+lUo2CEOWxirWk+1yfDbErLvfBuG3nKI12xCDfu7aHy2jQj0NChz+SfEzcuJs4Z7dQfLlov7n+ggI2CYRQnhxOT5dKRL3BEMhkv/MocMIkkms+p8ATQxePobEE6OeRyvdIB8Vl5e3trrsmeo/mzlxdbmlHctSE4TUTYgm2Ihj/PVod3OKllzBJ2YHa7d6C90z0eZ3tANDxV7YmeIur7n/Hvn3yHYWnx0q1syQwh4ovEWgIrxiJmJZ1uRSceRYA8vY/Fkv0rkv7N9B7LnYA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(136003)(396003)(346002)(376002)(451199021)(316002)(6486002)(41300700001)(2616005)(86362001)(31696002)(6506007)(53546011)(6512007)(186003)(26005)(2906002)(38100700002)(36756003)(5660300002)(8936002)(8676002)(66946007)(31686004)(54906003)(478600001)(6916009)(4326008)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTYySkw3S20rUzJTL3RvYzA2V3NuVjJLOE15djRHSGRoeW90YmkyODRTY0R6?=
 =?utf-8?B?NStEbXd1KzJ1VUdFVThLTUs4c29tSms5UUlIOEJDaXR2V0RzMVp4T2dsR1ZT?=
 =?utf-8?B?Z0M2amdranEzZlk5YnFhZVRpeFQxTEYxMHM4a1VDdzloZTdMQkV0a1VFRWxZ?=
 =?utf-8?B?U2tLcHRHZlhBd0RwZFRNem90bDB6dmo0b0RYT0wyQktuRHhnby8wODFxUWND?=
 =?utf-8?B?cldkWWFaMG5DMi9PVktaa2JOYTZKY2V3MnBWQ1hrR0hreVRpa3VwQzFYSW9B?=
 =?utf-8?B?K0NZNGh4VzFRQ2ZqQURLMk8xMmltYThYaFBKY3ZBMUNPNDdaQVYyZVBoRGdO?=
 =?utf-8?B?Nk5XaWoxUk1keTlpREdzUnRLYUVoSmI0blkzTDNLZENJRWNia2pkd2VDVUVk?=
 =?utf-8?B?bjBqRlAzQ0M3VldSZUdoajdWMlQ0OVpTaEplVjlqSGx2Z05qcHBYY1JqOFZ3?=
 =?utf-8?B?TDFsbS9qWUNZb25NWXJYeEhNNzhsSjMweEZxSGZ5eUZDdTl4TEhNKzNDUFpQ?=
 =?utf-8?B?YTVTV3FIM2VNaDc4ZExmYVFabkJJOTcrMS9DR3IzaHhxeXVUdWZDOEh2SFls?=
 =?utf-8?B?TU44bmhod1ZpR3FsWFVSYWtVMHNQdWJGbUl2MThWcEhZMVZqRlhRSmxGMlF4?=
 =?utf-8?B?WDRkbzAreFdPYUVJTXd4bGlhbDZJWCtiUG1KSUhXbmpwRUprOG1MNEdrc1lp?=
 =?utf-8?B?QzdzMCt3UUhDR3RoNS9jTS9DV3h3dnY4Vk03MHJ4c0ZCNUdaRnR3d1dWQkRm?=
 =?utf-8?B?ZHExaDZxZFhHQTBJYzJZWVZPNUtNek1HT2UwT204RWJoMUltUmJMQVRubnZn?=
 =?utf-8?B?d0hmNFdlejNJamdGVUFIaXlpeEFWZkxkM1VSdC9QOWVmaUI0bDY5dnZZM2xZ?=
 =?utf-8?B?TkVNcTRJL2JvYUhDK0pzTit3V3QrRmI0VHlRQTlmeTkxWk1qNS9OTHQ0dk41?=
 =?utf-8?B?UHM2K0hmZVdqYkx6RU40bFBPYi8rblI0ZXkvQ1dXUWxiVWxwRFVrUTFpUDQ1?=
 =?utf-8?B?Y1Npb0sxSVlkMTZmNlZlWmJiYndUbFg3a1V2cHVldnAxS3JZTEJHeWNLUEdF?=
 =?utf-8?B?WW8yY1VoRDdKZmtTemtmQXlCcXBtTFA4MWJraVpkdWdmTW1xcUFpaWZOZmlR?=
 =?utf-8?B?dEJadFoyRG84dzZKOEx0OUhXUHhrMlhhL2hkZHUzUDFwMDNLc3U5c296RmZW?=
 =?utf-8?B?ckRWaE9LZURYVW5kYThtUWNsV2o2cURVMjZ2dDlaU1FHWnd0Umc3bk8raUYx?=
 =?utf-8?B?akdobGNlaWZ6Kzg1d2ZJQTFvemlEZUxyWUtldjlLYWpDeENmaW0rRit4NVdw?=
 =?utf-8?B?UHdJMFp3YWpJcVVxN3p4Nlh1YlF1WFMvaUdRa3EzUlJpdWtycTNWSklWRkxr?=
 =?utf-8?B?ZWpJNm1naFJPanFlYnNEN3FNZVFkQlJxMWVVRE5ZOFRCVTQ4Ym5aOGFUbjdM?=
 =?utf-8?B?anVCcXJJMnlWT0xvOGVBRjVGR0Z1Wkw2emRmeDN3dkZ2RnZCRFJvUlN6TXBw?=
 =?utf-8?B?U3BRSXc2enBkeUFyUTBkZGFoVzRyU0tlVUNnVUc4Z2gzTG11dmJOU2c5N2VR?=
 =?utf-8?B?UXdyZEhVT2dSSTluSTVYYXh0OVd1Y1FIcHJoSVgyL0JGQmNJdW52WGs0dURz?=
 =?utf-8?B?ckowMk5VNmRBSnBTQ0dHMGNjRmo5QU1rLy9uVnhnUWlHbDNLOXg1MllsZURs?=
 =?utf-8?B?eVY2RGY4SFEyMTNaOUtPMjRjVTBtYzBSWW9RVmFzbUY5S0hFWTh1ZHBTeGxv?=
 =?utf-8?B?cjg1M0VOQzdBT1NwbTdyRmtHdm90NVRmNUdHSFZlTUE5OVJvOTFFUzVFZGxt?=
 =?utf-8?B?eThjOXRYbXk2OGRTSTkvTlp2TWxma2hhcDE3YjBFZGFvNGcrOHRBd1NYSkJX?=
 =?utf-8?B?Zm5Vd2lYRUYwTThwOVdnM0FFaGoyVjdha1pBWnZaZEVvZW5sSnlHaVJrblFZ?=
 =?utf-8?B?ZXk3RkE2RDJBQnlvTTlrajAwODN3bDdySEtFR05NVCsya3hid1BmQnpZR0xD?=
 =?utf-8?B?dERjLzRzWXY1Yzk5V0tJZnRYQnBOdnJiTWh1RDQreXJ3WjRBNHByaSszNGFP?=
 =?utf-8?B?TEVGd1g0VGtsZDRzVm0rRDQzdW1MRkEyc0FmOVBldXpOTUdhWGhDazVncmsw?=
 =?utf-8?Q?PWvByyLkHYWZe1IIYUtJPbBNe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43dc08e8-426d-44da-0ede-08db6740a152
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 10:19:08.6181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rmZQ7OKBNmwKqnBHn6+/4ieQ5dnnDdT/8F6gwvYzbbOZsrY8aakTFK17L2l8eKlRko2/a05pI+OI1PjmRWtjYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8152

On 07.06.2023 11:17, Roger Pau Monné wrote:
> On Wed, Jun 07, 2023 at 11:10:27AM +0200, Jan Beulich wrote:
>> On 07.06.2023 11:01, Roger Pau Monne wrote:
>>> Guard it with CONFIG_LIVEPATCH.  Note alternatives are applied at boot
>>> using _apply_alternatives().
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> albeit the implicit ack therein is only on the assumption that (apart
>> from me) it is generally deemed better ...
>>
>>> --- a/xen/arch/x86/alternative.c
>>> +++ b/xen/arch/x86/alternative.c
>>> @@ -358,11 +358,12 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>>>      }
>>>  }
>>>  
>>> -void init_or_livepatch apply_alternatives(struct alt_instr *start,
>>> -                                          struct alt_instr *end)
>>> +#ifdef CONFIG_LIVEPATCH
>>
>> ... to have the #ifdef than the init_or_livepatch attribute.
> 
> But the init_or_livepatch attribute doesn't remove the function when
> !CONFIG_LIVEPATCH,

Yes up to here.

> so it's not a replacement for the ifdef.

That depends how you look at it. We don't meaningfully care about a
few extra bytes in .init.text, I think. So it really is the Misra
requirement of not having unreferenced symbols which makes the
difference here.

Jan

