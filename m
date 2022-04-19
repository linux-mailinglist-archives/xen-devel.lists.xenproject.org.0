Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC62506792
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 11:19:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307921.523315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngk0Z-0003gz-SF; Tue, 19 Apr 2022 09:18:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307921.523315; Tue, 19 Apr 2022 09:18:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngk0Z-0003e7-PG; Tue, 19 Apr 2022 09:18:51 +0000
Received: by outflank-mailman (input) for mailman id 307921;
 Tue, 19 Apr 2022 09:18:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ngk0X-0003e1-KZ
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 09:18:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b86b425b-bfc1-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 11:18:48 +0200 (CEST)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2050.outbound.protection.outlook.com [104.47.10.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-PlKU9Jg_Mf6-bsKTenwDOg-1; Tue, 19 Apr 2022 11:18:44 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5311.eurprd04.prod.outlook.com (2603:10a6:803:60::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 09:18:41 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 09:18:41 +0000
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
X-Inumbo-ID: b86b425b-bfc1-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650359928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9/eKHA1VPKRbfAN23U1roDzl2rc0BI/5cpXLR7sEMkQ=;
	b=WHniqNuN09SzB9Gd1aztpiba0uT54nxOLyFVJ6R+A5AB6kcSnwq3UV6rxDTE8QxDnaCbW0
	mjYdKOlQXYX6pewYcBPkqTMZyIDbjVf5tibzJTFz5NXDf+rypxr0Fwh6YIqr52/jqAaAkt
	yQ80YGMASH1oTj3L2C/5ngpEo+knSCY=
X-MC-Unique: PlKU9Jg_Mf6-bsKTenwDOg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMX4NSzUrTv4AS9k0NUga5wrzsI7iCJRWlw9EsHv+7SDIBCwd2FqwpeQy/OwczFrCMa9NHvch1nPkwA1vztF47a4+ceNvF4JLiPLlsmHPPRRdIoINcPPRqr9In5NXx8YNr4NHuBTj6KCEQ7nsIi5EpXWQ5R4nHMYlxRGj0mm49Tx8q6tt1qDbX9Lq6365RNNZiYSxowr/8XeZd0sgALhqNMk+fUPIwqzO7MhSxCXdsyMKumXi71oZTuCF6CmpxqO3HlPI2P/3jdSehY0FbpNjlI8oS4q6Mj21MHmM5HxT+9MJ0NiubfLqJV8tWgmZpY5A065xJsHRTXlp38zIb9xLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/eKHA1VPKRbfAN23U1roDzl2rc0BI/5cpXLR7sEMkQ=;
 b=SX2wGUIyTs0nTcQTTSLW9De3zSZfjgUPlXuD2XF+fMTm0AtjtA3FC3McFyjPIQ79A3YtHv0eyJjyXjajVQ35oPtX/kclT5We2fp8l7OpYbsI90Wamd/vtdMi5XBtd7u5LzDpBZj/9IENMf79epGMDKtH4XxgKDhBrXh5tRneWRvkyWs0O1vtKbEZeHGglBdi4bThPd4sGTGgDjK2d8WI2Gvuf0d+gfEIRUjmg1lmpQnoawAIKmmCAfJ4CMHEQwUdO5+dO1YVGrcfLEyECETxeazywlhyrLJ+E+I0u+G7gllTgYopn+0Oj4V5GRfSjGHrF3ehxjtq4BaM+nGdTuKbkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9ab21bd5-7208-0000-5274-3c970ec6768e@suse.com>
Date: Tue, 19 Apr 2022 11:18:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 06/10] xen: introduce an arch helper for default dma
 zone status
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220418090735.3940393-1-wei.chen@arm.com>
 <20220418090735.3940393-7-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220418090735.3940393-7-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0125.eurprd04.prod.outlook.com
 (2603:10a6:20b:531::16) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39bd9465-afe2-44a1-91fe-08da21e5985b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5311:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5311A377E67C635C441B8897B3F29@VI1PR04MB5311.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gSFaDlijHFktjLUzdUxPsAj1IxYHTsFiEoKUjAkPmxu16BS2wEp5XPW0MSQjf2PCrk6IatnKoHrwjblKAQqWEfLXsRas6bZ6H7bN+mJCZOmBeF2s2RhVuWJLbV+Eq61DpHo6G4C4zlJTQQ4AI4TEagSTUnQd3stueJukU0/VezdD/b+a/3m4Sv8QNZUzEhFhE+NcbMkiZbBWN9H/FnnYOR7cZeeKJyWFLwasH+oBrheDnU5Jqp0W4Oex1XXJEp/S7c1iBjnl/+LhVrJg7TBh/OIHj+cG10R0/lMlioYESTcOIGsV2JTvXczHFXQGtkJsfnQz40jbQ2yqjhTCMeCP5Xpl8cN0aKffZdlP9KnNp1yA8d6DV2MSB5O/VKrQyQ7hsMBY0y3sXOdzlowsdWkndQJUSWxCj9KlnpeffipOEmN6V5coGoHK3QL5Do/N6ntJLTU9mtOsGX/wbHMVVKgQFJc5JGZHTALDQoeKImBsjFmUzWY4esqTqM49wHt5Ww4XmngwOTRyABhwk1v61389M/fzYrDW0lSMj4FvrpwgatvQXZmaDBDRLLei+dNzQzazNnvnZVMBGVCaCNxciPKbV/uRgR/yGoaae9mgF7t5JgtjxWy3IUWq4mKbkG9piKk9WWpDFeOLReEPQcGgYqGRLO4LCaxxH4iNHQ/3xUGons5QxnvuK1gTaAXWIax9C+EzslQfYzCVvdmKiGh07/tQTq+wMcHEas+6pU0WMI9Nygs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(4744005)(2616005)(6916009)(6506007)(53546011)(38100700002)(6512007)(26005)(186003)(316002)(83380400001)(86362001)(31696002)(36756003)(2906002)(66476007)(66946007)(31686004)(8676002)(4326008)(66556008)(508600001)(6486002)(7416002)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEJQWHkrK3ZaVXNFQjVQR2oxbi91a2xhSTBBV2lJVFYxTWlnNkdoOThzYXpE?=
 =?utf-8?B?YldMUkJBZHdZSEtpc3pmNHhVdndhVlNpbm9rUVQzN3FoODE4OWZ3dFVQQVd6?=
 =?utf-8?B?bmUvS01ybDhLV1pFdVJodDJiV3NUUThQSm1wdEFwWFhtZ2RDbVQ4UXRBblpi?=
 =?utf-8?B?Qno3U1JYcWtLZ3VoZHd6NmUzSisyQ0tyUkQ1VWdqRHI2TUFzanZXaDFNNlQ0?=
 =?utf-8?B?R2w4dlVyQ1ZxZjVWVFZ0UENPdnRqamt5OEdTY2I1Mlkvdml4VFVhd1JwTFJ0?=
 =?utf-8?B?K2FTd1JUMzdMUmMyVVRuenB6cFY3QnFjNFNnZmRtMjA0TjhURGJSVUg1VnlV?=
 =?utf-8?B?UWU2Rmw4YnJWcGxHN2xPbnVDdTA0K096MEZ6djhaeHRaNGxqYWpjVnZaNEZG?=
 =?utf-8?B?QTRUbm5Nbm9lQXlqczErZmJjVWJtcDVhMEY4bXdFSHROb21TcVMydFJsMmJD?=
 =?utf-8?B?bWlhRGlENUoxaW9sdzl2b1I4bjEzN0hkTVY2OHFBNmlmZEwrbzN2QWIrY2cv?=
 =?utf-8?B?RWJNeWhZcWRPS2J5V21rTHZqL0dad0xZNTkxL05GK2MxMFk3TWF1ZmNTYXlT?=
 =?utf-8?B?ZC9rYWR1V3hYMWJxbElJZ09aSnU3RVpqM0p4WmsxOXRkeWFRdm9pUEpjUCtk?=
 =?utf-8?B?NkliYlh5ZFlzZ0NhRnpHK2hpN3ZOakdvYnlpYXhqUWFNSjJ2QURIelZpUlAy?=
 =?utf-8?B?REdSeTJoRjdOSVRUWE05cUt3ZXVjbGVNSGc0TURjaW1zeDNUMi9zUTRyREtZ?=
 =?utf-8?B?NDc2OE5XOW1hczNGeDhnSEpQdEswRHJhSGtHOHdvNWl1RkpwZTA2dnhYdmZ4?=
 =?utf-8?B?OERWSStFZUpGQ1NYNE5nejd5KzYyVzBhNzYwY2daZE5hRWVzaXdxYXl5OUxF?=
 =?utf-8?B?YkFMQ3pudDZiMk1DeWxDNEVMNlJrcDFkRFBGYVVBMDFsSmdKemhtdENTbm1q?=
 =?utf-8?B?cURGMENnbTZGRU1jTXk5N2VLeGtBa1lpeGt5R3M5NVBUS1JmNktmbTVqZEZK?=
 =?utf-8?B?Y1lrb0RMSjVVYXU4VXozanFIOXFuTHhtVHk1VXdmWDZlbFBjbVZZYjRyVkRi?=
 =?utf-8?B?TEd2QVhveUV1WmV6UjY3MTdnWVI4YU1SODVVcjBhekhCemVKeWhZN0g1YjBr?=
 =?utf-8?B?aURKK1V0S0JTVFpwd1A2azNjTWJ3eFBOdFFFZFBwYjhJRnd1TUxodWFVbG40?=
 =?utf-8?B?SWlRb0hMSGRYS3UrSWtmaTdZaWhWYlBEQy94M0R4MjRFcGNOenhhOGxQaFZi?=
 =?utf-8?B?eldleFhHTVBPSTNURUFaWlNaaDlmMmFmUEJuN3hITy93S1g1cHRsY0xDRkdp?=
 =?utf-8?B?dEt4Mk1WeDVmVXRYSkx1UW1JRXl1VUlKdkd0NThtMnZSa1BqRWFOVGg2OW9h?=
 =?utf-8?B?UFVhLzd1K0pRQVYzbHpnY1dNb0VhaVZIdDl5Y3F0bnA3dy90bEptOVJOb1Za?=
 =?utf-8?B?WWUyS3I5anBTOEVWR1BEV0NUcmVLVk5TVktQQ2M2djliQXRVR1BXZUEvYmt3?=
 =?utf-8?B?Vnk0R01IckQvOW53VXlKaUtheFhXWTZ2QlNzLzBOdlRFem9aN3J0eUlWdmtm?=
 =?utf-8?B?RkpLWGZqQTA3MXZqYmtkVERRVm9jOWVwZTZISXdSbzNmWkVCdkV2elp5SXlI?=
 =?utf-8?B?TUhSQTVweXNKdEpraDhLSGtZbG42NTE3bWNOVGRwN1h1VkNuMGZqTUNWcU1U?=
 =?utf-8?B?VE15Ty9ic1kyL3B4aW9OL0JUNVBRUGhzbmo0U1FhL0R0M01lYlQ3WC9adld1?=
 =?utf-8?B?ajFEbHo5elFrRm9IbjdpMFFEazlSZnh1Uk5Tb2cvYUFEbzNxRUhmQmFRbm5N?=
 =?utf-8?B?YjNKbkFjVVRmbk5tQzNXa2JIUVBJU0Y3MTlteGZLTitwbkRaYTdXbEIwbWJ6?=
 =?utf-8?B?WmVuQm9UbXlibHJDc25ZSG5jc0w3YmZJTnMzRWl0UWM1NDRHVUNaamZQWjJs?=
 =?utf-8?B?bkhJY2FxcG1BOFBoYTIxb3FLem9ldnEwaUllS1lWWUhVdWN3cTg3N2hlb3Zi?=
 =?utf-8?B?NHhYWjRYVytpeXhMQWZIbTQxVzhsckcrS0VZUkZQRDJBVFQ3dlh5NWVYVjFW?=
 =?utf-8?B?MHRBbVdqU3FvaFMrVk5RQzd2VjZJZ0xEMTNtbC96TUNJcE85MnUwWHNZNzdn?=
 =?utf-8?B?WEVUQ0U5NHBjbElUeCswT296K2xRSG5USDFlK0pDdDRyQndQbDlveGxwdzRr?=
 =?utf-8?B?aCt6MUw4cDVnREVUSDkrUmRJZS9YTW1wYmgyQ3Q2TUhkYjFGTUk3ZUY1YkZw?=
 =?utf-8?B?dUpXdURuN2QxdkQ1eW5Rek1qcldTMkMzVlBiaGF4bWQwNGF1bTVBc3dOZHAx?=
 =?utf-8?B?dCtmb3VEcVpPZFB5Tk1Fdldudm0zNHB1TXVhUy9oMGhLNmFOa0xhUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39bd9465-afe2-44a1-91fe-08da21e5985b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 09:18:41.4805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zDL+iSWGKU+Mo6FkDIM40qFmwX8Qzhb4w5cHa0Q2v5YbJz1WPXitnE06EzD8fyya3UCJFyQ/QyOOBpV82Bdiqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5311

On 18.04.2022 11:07, Wei Chen wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1889,7 +1889,7 @@ void __init end_boot_allocator(void)
>      }
>      nr_bootmem_regions = 0;
>  
> -    if ( !dma_bitsize && (num_online_nodes() > 1) )
> +    if ( !dma_bitsize && arch_have_default_dmazone() )
>          dma_bitsize = arch_get_dma_bitsize();

Considering its purpose, may I suggest "want" instead of "have" in the
hook name?

Jan


