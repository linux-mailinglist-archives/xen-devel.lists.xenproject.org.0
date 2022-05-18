Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB76952B251
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 08:36:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331666.555219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrDHx-000210-9X; Wed, 18 May 2022 06:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331666.555219; Wed, 18 May 2022 06:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrDHx-0001xp-6D; Wed, 18 May 2022 06:36:05 +0000
Received: by outflank-mailman (input) for mailman id 331666;
 Wed, 18 May 2022 06:36:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrDHv-0001xj-7m
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 06:36:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c917de64-d674-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 08:36:02 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-w0mG4C5cOU2OYJmnypHH4A-1; Wed, 18 May 2022 08:36:00 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4471.eurprd04.prod.outlook.com (2603:10a6:20b:1f::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Wed, 18 May
 2022 06:35:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 06:35:59 +0000
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
X-Inumbo-ID: c917de64-d674-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652855761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MUnxJlf70ABxdlGX1Cvqac8nk0xl2eQ6Y7R03gLXchY=;
	b=O7odZGd4SPuXEcxdmWwmDkZ6RBA77GGd9oFV8vjg10MNojdewDmpbCdoPlmpulCOghGzmw
	YTZSk+TIGTzhhIJ+5dhKa7OCaAOK9w3AVzDfsPErhtasynjO7msIr6jdzs94YCBQdvlhjk
	l8ATQJHQpgZxvTrA6ra76u8HUCaCc38=
X-MC-Unique: w0mG4C5cOU2OYJmnypHH4A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/nppf4wkvN+pCPLsWF+BIBYZ06K8XBksDNPruCVEUF+W8IP0X1RBZW3x46DVZ4oLrE5/j8VivMWapzm8Xwrz8mVaXm8J5xhDW80RSfOjBKFxu8lE/Hlnam943APukOQ9ffcVQT6Brme/wPUrjOyxHhMvikIa5VSEDzT1QF0vCNecWYTGUBxOELgDaHCQGKgtlMT8jpU6Nq94Y6idcMJ0pK3/TvZUIZghuvVK7fGeIdIgugbTdYOY0FeMPIv6tcZNvuaDycl5vJWVvBcTOsgWIHbKCUT38dGBGbr/SCxPsNwbwFHGQ8vFN3htZUy+fxbH/sWgQ+yCzcqMe2WvFXjVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUnxJlf70ABxdlGX1Cvqac8nk0xl2eQ6Y7R03gLXchY=;
 b=iZCSB28Cluddu/sBK9npjYwJksmHGSlwOMRSN7XxmM1FbF0mNuLb8U66EGqrEGNMzKYiMD4Ufosst2VhY2+Tn/VzMHCJkIjxlUZ28CA4iLYSzj8xNDJyZxFEDBgMI2ObYwSAZmszNdV2X30x1ouzajsMX1dp4pVv7iVmZrwAYlFmOt0XWT3vjXgkj/a960afpykrGCfJBlza8wyQziRCis/DvcZl8mo7RyULH5EbBxGFEkFbBgFpYbNtr+n3SsLiHU1bRLyLtNislX6/priFt5pXzdGX7aZrAyNEm/afQExmXTdKJrgV+ttcHnkqYE9CULdOwQXW/4Q+misrwIfQMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <385c964d-0d25-3967-5683-3731dc1eb0c2@suse.com>
Date: Wed, 18 May 2022 08:35:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 2/8] xen/arm: allocate static shared memory to the
 default owner dom_io
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220517090529.3140417-1-Penny.Zheng@arm.com>
 <20220517090529.3140417-3-Penny.Zheng@arm.com>
 <e587d965-819c-993f-f5fc-0d863d372507@suse.com>
 <DU2PR08MB7325ACBD82A63879F770F8BBF7D19@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU2PR08MB7325ACBD82A63879F770F8BBF7D19@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0028.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fca0b8b9-da77-4cca-1531-08da3898ab64
X-MS-TrafficTypeDiagnostic: AM6PR04MB4471:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB447171A442422425C307A467B3D19@AM6PR04MB4471.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NycHPkO7ZEN4qxSYqJpt3CQQ27ogwdoAyw/Bhp14UH7NDSn/+wHrnLRx83+A5MU6PtldQ7NqgQe9WgATPL7ZFXCYVeSjJpLfTQILC4rzzhNMlpBrMBrrZWJnwj4Qnrr1abYqRkuHxUTP31M4y7+hQZ/Z46IoTdNYNGpqoZWTmUmYWXY+LAXSA3WVANUtGDLXmRJrM6v2BNWQ5nZL68fLLrmacYXLnSXfhozjnPjnEfo0TRXIIkHdtvHl3RxeNiNezwNwDL2GilOqg3cc6fN8RyamSP+mOqmcglvj+U4eAnXGvnokaWj1b9/5VzhCzwqw/ZOdk2W3mEO3zD1cMpwnBF82/TQuZoKcOnFKm+0W2p8U0Q0BCN6TuBpSsrKE9VXT0UWP53d53g3rg2yl6lK15GvnL+ODqa0GPCXHo8lTyqMs+Y7tjcff1GSLt/NsA7tuo+xVk6GqAVG0L1fwOiSm12EdMvVZJbNavouROCKWNikIS0zBVhzBX1FFZUzzhqMfDYiTGLs8ARYnG0FHme5+40f1vRj1mi5rcd1+LX8JKW6FOii2Der8a5Lo1WDd4k+RFS4GCxflN7jgCF9g9yoPy+E5XjKlZoHwN5m3Mw3RB8JQ48//nNEQTeXnOR0nfS6aj4qAstzQec4GWcHDOATb0+wxq2RB6rffIY9DwGvyfDbMY9L+mR9MhXyJaQNgBWWQ090r3yrS+rJyabIwwuOCPDR2nugTvpRwRWcdixIAEothPftMTlTIGfELHRZ4aY8Xs6bdZEC7ZB12S+4XSX1szg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(6486002)(508600001)(66556008)(6506007)(53546011)(6512007)(6666004)(7416002)(8936002)(2616005)(8676002)(2906002)(86362001)(83380400001)(31686004)(4326008)(54906003)(66476007)(316002)(6916009)(66946007)(36756003)(186003)(31696002)(26005)(38100700002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmxMWWVvcTNMYW0rempEek5Ick1wNXVvbzd4TUw2eHh2ZXc1M05hYUFXYjc0?=
 =?utf-8?B?V2p0am41WHF2MzYySFhUbWpkNWwybC9FYWhvODlZK0FuUml3a3U0OWQ5emNT?=
 =?utf-8?B?YzJzZFE4SWZnaE9XV0RXd0NuN1BseXJpcGJENGdMMFpxM3JFSzRaSnJoNElH?=
 =?utf-8?B?RDRscDNNNGpQWHROSlpLNnloWEJIOXpSb29lVEJuNlMvU0t6TTYreW9jY3NU?=
 =?utf-8?B?R2ZWNHZ3MHFmTEJWWDQzcEV2Vk9JcDRKOUh6K3VDLzE2Mzczb1BwYTBYUDdF?=
 =?utf-8?B?UzN2MHFtaDVlUFhtWk5PYmRGNThPZG42eUllSVpNa2Q3QWgvT1o3a0JFeCtn?=
 =?utf-8?B?aEp4MkttSkpBUE1hT1ZPOHNuZXl5bnFlYVV4V0IvL0l2U05ySVVqUXNVSSts?=
 =?utf-8?B?ZENwNUxWRS9yQ2NwamRIUE5DdHkxUC9QcHRTSjBxdzZEZktPY3k2YnJhMVFN?=
 =?utf-8?B?bkRQUU5RdUNHRWxpMnUweG5nMzdWUDVjS3hNSGp5THBDRTRpMyt1cjFwb2RP?=
 =?utf-8?B?MU5SckZ6R05sdFFzR05rUHdvTHExNmp2WS9TV05WMEpuaE01Tm14YTZIZ05j?=
 =?utf-8?B?aERpS1ZHWTM3QzVDOGNmTkVDQlZ0bm9RQlMwVWhRU05mcGdqYk9IaE9Gb3ha?=
 =?utf-8?B?TzU5WFNJaEdaNGFoc09YYjNNSDBRdUhRejZQeEpRNHNzSDBIZzBJNHF4MGdG?=
 =?utf-8?B?K3VKWG1RamEyK1Q5V0dveFBVOFlTQXBwckhHTDlpR25lR0xjTU02Nmk1RTYv?=
 =?utf-8?B?emlxciswdHZ0RVJMRGRRNFhRRzFtYzNNUmJrcjllMk56WXAzMGlac01FMFJk?=
 =?utf-8?B?ZmwrVUxpTHpJeUFnUWNJMDYyMFFSb3RUNzQ4T05zWFhMUjlxNzNncXpxNy9Y?=
 =?utf-8?B?Y2Z0emoyWHBBUmZvZUMvNXFBZEErZld6VmV2Q3h0ZG9RNlFxanFRRzIyRTVL?=
 =?utf-8?B?dU1NVXQ2NzZuamZDTGZaUEg2ajBLbW12RDI3U0dFdTlkQWV0VGFDY0MrZUpo?=
 =?utf-8?B?VDQ2US9zSlc2K3RldERHYUlmUGpVUFloZVA3SWtFd2hvQ29VNHAyUHJDUFRS?=
 =?utf-8?B?Y09ES0JSeHZQTWRmUUhqOHNRanhSRW04UXhoeUI3b2VyeXI0Y1ViWmhmRzRz?=
 =?utf-8?B?OW9aL0dmZ3AzWEw2cDYzdS9tV1pHYm1lOXpXOHpjMjZRUWdNa0ZCb3BCM1J5?=
 =?utf-8?B?SDBpVzZTNU9mNmJXbXhnU0ZEaU9SU0tlMWtSOHh3L1VGS0sxOGEyRE5BWDhU?=
 =?utf-8?B?SHN2aXlwSjhqeHV0clNqN0hpQkZOVGd4Y09zY1pLMHpZZ1ovL08vM1VnZmQ3?=
 =?utf-8?B?R0FJZ0pZSTlBZ1RwQkEzZlhnY21lc2VPVDAwbkd5RHQyZjFCaHdOdldwbHJQ?=
 =?utf-8?B?bDFpQ1dNWDRXU1RjR0pMby9HOU14ayt2T0pqaGljODJjUkFJMG1JSUJMZlN5?=
 =?utf-8?B?TytjbDVpY3Arb293MWVCVDAzNHI4VmR1cFpKWThJQkVJNW0ybDdzTjcvUEhq?=
 =?utf-8?B?cTdYbzZCbm1FK2VwSWo5dUJON09FbUNxNDNab1VuQW11T0QydjdpcU5hTklR?=
 =?utf-8?B?WmNjZnpPSW9tdlIyMDRGWWdjblpKMnRQQmhGNGxnakVhUHFGOGZ5TlZhQ2Zz?=
 =?utf-8?B?NEZUT0x5VXdtTlpWaDdJdXYvNEZpTzRGOUNjaDJrOXFCQU4xcnpmdW9OSkVp?=
 =?utf-8?B?UjVoT0w4ZzFjWkZDQU42WlJ6djlNa3MrckhWaFFXcFZKKzlhbHhTVlJKS092?=
 =?utf-8?B?NTE3YkN3dVhvR2tUeVdUU0NOdTh6RGxHR1dlazFkcHQvZjlDa3htLzRabytC?=
 =?utf-8?B?VjNUd1ZBU2dqRnJNRTEwS3dxWjB4c3c0akRWUXJSdkdXVm9WWGxLaktQRWVI?=
 =?utf-8?B?ei9kaDgvSnpDQVR4aHpkdVZGa3ZDTTBLaE1XT0FKZ3R6cWdQUlBhbnR6RjZW?=
 =?utf-8?B?MFlvM0ZxQkxTbU9rTjVwOVVKTUZzR1ZtMlRQc0RVYkFrTUViVjZTeGNMaE5X?=
 =?utf-8?B?RmpvRlVGRUpKaDZkb0ViVCtINnNQc1lLQ3VmRjdiVXZUZ05seGxnT3ZkcWkr?=
 =?utf-8?B?L3pYYWRadFV3aXhhMm9GM1VpSGREc3NZMWptcjR3VUdock9jVEp0bkdGZERG?=
 =?utf-8?B?S1c0ODVBZEVad2drSVBhMk5MYVlzajJOMWc4aTVwdVZJakl0b2RCWWJmOFhO?=
 =?utf-8?B?dy9yYzhBUlphaTU4d3d6NEZPVEllNlhaT09JOEJqSTN0bFFETHk0aGZWZE9J?=
 =?utf-8?B?TjJsR08wUitQQXczaURwUjhVRGVEL0VqRXhCQ21Sdk9KS2JldkJXSEU1RGNS?=
 =?utf-8?B?c3hLWmkrdTJ1TXAxL0ZLdkRXRVBWNGt3c1BvYmJ1U20vMGZhbFZhdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fca0b8b9-da77-4cca-1531-08da3898ab64
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 06:35:58.9400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pphn9Al22jo1yrirv1jp4HK+QaI81vB77ac1fsqIeyWg7u5tsYLHqzLg0CpklKJCJ0FSvWNfb9Zy1cYZfvsW8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4471

On 18.05.2022 05:14, Penny Zheng wrote:
> Hi Jan 
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, May 18, 2022 12:01 AM
>> To: Penny Zheng <Penny.Zheng@arm.com>
>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Bertrand Marquis
>> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>> <Volodymyr_Babchuk@epam.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>;
>> Wei Liu <wl@xen.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v4 2/8] xen/arm: allocate static shared memory to the
>> default owner dom_io
>>
>> On 17.05.2022 11:05, Penny Zheng wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -780,6 +780,11 @@ void __init setup_system_domains(void)
>>>       * This domain owns I/O pages that are within the range of the page_info
>>>       * array. Mappings occur at the priv of the caller.
>>>       * Quarantined PCI devices will be associated with this domain.
>>> +     *
>>> +     * DOMID_IO could also be used for mapping memory when no explicit
>>> +     * domain is specified.
>>> +     * For instance, DOMID_IO is the owner of memory pre-shared among
>>> +     * multiple domains at boot time, when no explicit owner is specified.
>>>       */
>>>      dom_io = domain_create(DOMID_IO, NULL, 0);
>>>      if ( IS_ERR(dom_io) )
>>
>> I'm sorry: The comment change is definitely better now than it was, but it is
>> still written in a way requiring further knowledge to understand what it talks
>> about. Without further context, "when no explicit domain is specified" only
>> raises questions. I would have tried to make a suggestion, but I can't really
>> figure what it is that you want to get across here.
> 
> How about I only retain the "For instance, xxx" and make it more in details.
> "
> DOMID_IO is also the default owner of memory pre-shared among multiple domains at
> boot time, when no explicit owner is specified with "owner" property in static shared
> memory device node. See section docs/misc/arm/device-tree/booting.txt: Static Shared Memory
> for more details. 
> "

This reads quite a bit better. Yet I continue to be puzzled about the
apparent conflict of "pre-shared" and "no explicit owner": How can
memory be (pre-)shared when the owner isn't known? Shouldn't all
memory have an owner? Or alternatively if this sharing model doesn't
require ownership, shouldn't all shared memory be owned by DomIO? In
any event, to leave such details out of here, perhaps the comment
could consist of just the first part of what you wrote, ending at
where the first comma is?

Jan


