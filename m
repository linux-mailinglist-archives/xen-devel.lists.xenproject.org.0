Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD3140F28F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 08:41:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188941.338365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR7Y9-0005nc-RC; Fri, 17 Sep 2021 06:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188941.338365; Fri, 17 Sep 2021 06:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR7Y9-0005lU-Nu; Fri, 17 Sep 2021 06:40:41 +0000
Received: by outflank-mailman (input) for mailman id 188941;
 Fri, 17 Sep 2021 06:40:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fBbp=OH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mR7Y8-0005lO-56
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 06:40:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b4cda76-1782-11ec-b66e-12813bfff9fa;
 Fri, 17 Sep 2021 06:40:38 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-iHAqES0YPuGfJ-JzOAbWJw-1; Fri, 17 Sep 2021 08:40:36 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 17 Sep
 2021 06:40:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 06:40:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0213.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 06:40:34 +0000
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
X-Inumbo-ID: 2b4cda76-1782-11ec-b66e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631860837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s7rb3jCSHExyz8eZmcspOvf3jieEjAd49nmXFnNZWiI=;
	b=FFAsL6jNdKXmAR4I69OWeyE8gGtasq/sHhkMIPYdv+ak1BRv2nw7s9p534XBOZ+zUMa6I6
	bdhFuLkwAJIozXO1IaePXEVFpoSTQjiwTNXjy5Tdu3auvc44aAumZnATWmwuvgHhNylsQ7
	wwrllOdK/tlrStA04bLVGgIM1nZpupM=
X-MC-Unique: iHAqES0YPuGfJ-JzOAbWJw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9MEn6BXNPg0dHOJiSHIFGZ6Zp/95X7OwOOWzub2Y1AASax+HACJYw1UpnoJNfVzqjNaPXy2zYrCZ5iwR+bwYDWo3N2hsaYWKRghF8waUoOVPa8LFfNeQTOy05CBtjYveiVBe6rUJ/BdENF7gwXmVQoo/AW183h/yiMQOUxrEbtUoH74NcbFsmFMxOYUF0Ww+I3G8otBQLyUShyaBfGkLTHkWdzw+HN7ANymctMnbErx/hzCz8t2266H1FDa3KxXOMwqzXp4eaCmKjoIJxClJeNaNpC0u0n/nCGplkw+ph7NETbVlt08D6zgEz+RUCxUwNL+WzmR0uwM5Xj/W5zmLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=s7rb3jCSHExyz8eZmcspOvf3jieEjAd49nmXFnNZWiI=;
 b=QEX9HbF03oh+HOukV4kISAbliJUKu/hTkxOhT9LIf8CTPWnreDjMtC9rJ/Z81RQuntfEX6e7GIYjJGw7PKBD8NBdDcaQzMPT6Iwq/fzjdtCitgIVZpxRhMi1EhW7W+35JM6EwRkMDxKFFYwyBaH7L9Gj35Mz5+BxJEJRkEIiEfvzCox6pUX/BdI2mJqrh6P4VUgePj7+ABf5FdhJ6uh2JoW81HsYum7cSFrEi4POemgVPBSvdVEmxIVsJ3rkzwyJbpgLtrPqvoRurhwr6bd2dmzP5fTXQc2j4Cc8KUoowNW6rIBTM0kYEbdgMS/GdFlaPBWuPMwIVGnnE4hs+F3WPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] xen/x86: fix PV trap handling on secondary processors
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>
References: <34898e9c-5883-a978-98ee-b81b22d8caed@suse.com>
 <823f4ef4-f9e5-68cb-d6e9-d079483c1e21@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0afce6e8-3c8a-e5ae-cd54-0fd598276506@suse.com>
Date: Fri, 17 Sep 2021 08:40:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <823f4ef4-f9e5-68cb-d6e9-d079483c1e21@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0213.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf53f549-a884-41dc-6935-08d979a60d8f
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70379CEFFA1488D2CEB13742B3DD9@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fP073QF1ahvxF7ZiQOsWKUPfjxawEZFTb+2/2fJ6PuAIErBDyF2Fb16rNVhS7qZB+cP5mARfgjcL9RKcQMOP587IfhAy1NG0/X8FfVKC8yWBUHfYgJM0jgAjAMiw54UWEIRhms07/YlTlfYrYm4872xPvYZfPCikYT88OOKHEGBD/x4En+qjNbww+587PnbLk5urDNHyJBUOZ0GPlOdcfqg5a20GLKd9NGSsMWRlLJMf9bGNYd4VmZqtA3zKrGxiqSVVD0rCOyJeFpA6vsXI5TI6OtLpoHGBw8Jxw4KcxbTVj9pVUagMwWQz+YHURs8lsgvMYnmqtkoLP9AvlJTyEzCBXFeHtPexZzBxzNgVtz7GQFJVibMUW503HvAiuoFDQ21TlQoGvonNMDXeGca4GV5dXw8FlSuk4mNnmGNnCzM73vdfDAK/B4mfh2r2EYvRqDnMewOBUhcBwcDF7OijbYd0CMSGaQTa7udLchaT1m85BhlgSIVELIYFrt0qm3fW+bz1m17A3egSbF9FJ+RzTyKDoyy/dJuT3S9XcB6J4Gw+uJq6wYZVXFyj2sFsO2CCYBpf+3E+M94wp0zgmrDmvRYcivOgiqp2PtVQwvDcOUIyc/iG4fXtl0285M44kSEWmPHGZDAtKNAXQUGKCSbk6bdSm+dJnlQza9rU5vG/CKf+wefvzjkOHcRvN+IEQLYZ9v2LLlUTDNuatXCDyd997lDdLW7pifM63KQFT909NX0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(31686004)(8676002)(4326008)(86362001)(956004)(26005)(5660300002)(66946007)(2616005)(2906002)(38100700002)(107886003)(36756003)(16576012)(54906003)(316002)(66476007)(4744005)(6916009)(53546011)(66556008)(6486002)(8936002)(186003)(31696002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGh4RWREaHhQTldSMUZKZnVSQkpvM2hsSWkwMm5sN3ZjU0NtS2xCWjd1a2xn?=
 =?utf-8?B?Mk5QczlRQnJuMXh5RkQxSHBqV2ZNOVlDdGdPQXBWeDF2RXYvYUE3aWFnMHlJ?=
 =?utf-8?B?ZEpiNFlyRmNLQU0za09Ja2tnejdBaEtRWG0zUTh6aXJUU1FXTDdnYXJHVzJJ?=
 =?utf-8?B?VE5vZFJ4L0sxWGh1alc2MEQyTVhBdXlrNjRNRFNlT3ZIV1ZaVE9RZjJTYTZL?=
 =?utf-8?B?bDg3WjhrdW5nRnNkTlR0TkM2K1pJY1MybWVBSDRUajBDYk1GL3IrWEtGNWp5?=
 =?utf-8?B?R3lwdmZDbTNJSEE2SmR4S0dGRnlLVmJ3NkY3QURMaEswZHQwMy9Jb1JzRnJV?=
 =?utf-8?B?Y2JYd3R1MURUbmxYZXF6U0ZoOG5xNXR6YlpQMlZnZ0RTeVh6TnA3UTVUY1M2?=
 =?utf-8?B?ZTVtUkxJcGFSRTdHaG9hT3NLY3ZVc2w0WTJCYU5vaWNLUS9xL0RUS3ZTaDFi?=
 =?utf-8?B?T0VvTlAxMTFyL3ZKamxwUHlJL0FrQ1JuQU02SWxIYVdtQmZKRlBZUjRyTmd1?=
 =?utf-8?B?WFprTHlBdXRzNFBnK2FBTW1PckpNMW5Qa2pRN29OZTEvV2MzYndQUGhodzZT?=
 =?utf-8?B?RDBLS0NYVTJjMHpxUU5QNUdTUy95aTdqazhhTXdQTzJ4cjFIL0piQWxqMEVD?=
 =?utf-8?B?Szk1dFBHRDFmWUcyRFl0aUtzVkRKRmowK1hNVGlOY29EbHBxOFdjbUNKOStk?=
 =?utf-8?B?cHE2bFhpWHBuenh3SFUrSHhKKzQxbStZbWgzN2NSSnQ2eUVoeFU5WXh4dUJp?=
 =?utf-8?B?RjVPanhSd0pxd0M2U1BLNnV5K1RxYzlCZHNZVGtObWV6cDdjend1dmtpa0Jw?=
 =?utf-8?B?SHFjcUdldlRSMlEzZ2d5ZUNMTUV5V0c0Z1Vrb2Jzd3JJbWY4alAvckEvNmdM?=
 =?utf-8?B?MXJ4K0F3RWJJWDRXQ0t4ak92b00wZVh3QWU2S0h2ZHJMVUZHRWhiazgwVVpy?=
 =?utf-8?B?RUhuTVNNakVUQ2dtTTlsbndmRWM4dU55aXN0MHpqY01YZ1NZTDVhcTlKVHFD?=
 =?utf-8?B?bjlCbElnOWpVb21QNnRlUmh0N21lMWI1MHdqSUlvS0FIUHUrSm45RklxRVR5?=
 =?utf-8?B?QnMwUVhmUW5uVXF6bzNQdDdtaFMvTC94ck80WmRyOGFkcHhiQ3pSeWFFNUNX?=
 =?utf-8?B?bVlvNWtnY1VLL290Z2dULzh1bVBiZVM4THhmbWYxZjEySWJxMzA4ckxITkFG?=
 =?utf-8?B?R1NQV2hPSWhvZmNhVUdGV1UvcHVPQzg2NzlRVldJRWJvSWMyYmo4SjYwYlds?=
 =?utf-8?B?SEoxWi9zR3VxZXZlTnowbzFkNERxNXVsY3RFL1JjZ1IySmNtTnpTeVppMzI5?=
 =?utf-8?B?UmxzYXNtaWluT2xlTWErK2gwVi9YZXh6NkplVWdjYTRNQkVTNGVraU0yVDhJ?=
 =?utf-8?B?SXFCUEFWM1IzM3IxWjk1M3dsWEV2d0JKM2hRbWtIanlYNUl6akVKTkNyTEdn?=
 =?utf-8?B?Tm8xakRnTXF0cm9keXphdFZQajkwYm50RmFTcHR1NTE5eGJKYUpKMnpUNEJY?=
 =?utf-8?B?Q0kySzBKVVZISkU3Q0F5UUltS1ZCb0ovZEg5NVV1KzVsOTd4Z280NmgrdkJG?=
 =?utf-8?B?bHpjNHdRRUlKMWFxUkNDVjFxMGhlN09NNXpmWVZqZ1VNWnJYL1d4T0htUTl6?=
 =?utf-8?B?ck1rdkZVa0M4cjVzMk8vSHpWaGV2alJEUVl4clI3dHBTTG4xUS92S1dhdWVW?=
 =?utf-8?B?NzUwa3lFTUhzVlBQTExjZWlmNkdjY2ZPU210MjJTSFEvdVBMOEhCekQ4Y3k0?=
 =?utf-8?Q?G2kGFfvgYshGebxlstpfes6f6dx2P3E/+CKoVNb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf53f549-a884-41dc-6935-08d979a60d8f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 06:40:35.0219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GsSTe3j0pMUo6G5YDbnQ5ZS/J1KjhrZ7CearnoLOgFW8F7RwmbgVPz8aeEde63dOx32YV36gOIdkzUtsbpRe6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

On 17.09.2021 03:34, Boris Ostrovsky wrote:
> 
> On 9/16/21 11:04 AM, Jan Beulich wrote:
>>  {
>>  	const struct desc_ptr *desc = this_cpu_ptr(&idt_desc);
>> +	unsigned i, count = (desc->size + 1) / sizeof(gate_desc);
>>  
>> -	xen_convert_trap_info(desc, traps);
> 
> 
> Can you instead add a boolean parameter to xen_convert_trap_info() to indicate whether to skip empty entries? That will avoid (almost) duplicating the code.

I can, sure, but I specifically didn't, as the result is going to be less
readable imo. Instead I was considering to fold xen_convert_trap_info()
into its only remaining caller. Yet if you're convinced adding the
parameter is the way to do, I will go that route. But please confirm.

Jan


