Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A4A6F5675
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 12:43:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529101.823119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu9xM-0003Pt-2v; Wed, 03 May 2023 10:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529101.823119; Wed, 03 May 2023 10:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu9xL-0003NA-WC; Wed, 03 May 2023 10:43:32 +0000
Received: by outflank-mailman (input) for mailman id 529101;
 Wed, 03 May 2023 10:43:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pu9xK-0003N4-KB
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 10:43:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56998652-e99f-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 12:43:28 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PA4PR04MB7711.eurprd04.prod.outlook.com (2603:10a6:102:e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 10:43:25 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 10:43:25 +0000
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
X-Inumbo-ID: 56998652-e99f-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btIpTBakCJSSCiuxUHE3FTP+qS5cGuyPWFYaoqDxenWoWTA60zqkJcy8u7OeWu0AIiLfos9TGcMlp40IwsXHaRntt6s4BsnjrZRA3tnfV9IYX4iivVnd/AhaIGbf7/xnPT4djGrA+pxMAmau2eHND0hG10chn/bojj4Zzr9V1QyPe27hyG84GcZSEeIwg1hQeNEVi+2B+yPoytYDIr558910D2sRYgyBPPfPzwItwbdAbhMzKw1Vwg7nMkT+wV5g9pn7tn8SeF5ZVN19iKgEYo28MKQ7BlTQgTV29SugVLsxU4NWDFCKo6/6e8RsYiIZMnl72JJQQgbR3G1axyR1iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tw0s9+B+lOUlPzGuqqHZc+BliG9zWYxRoLru8awX5BU=;
 b=dEYtG6yHF8kJH14ULqSWjrr99kgp27zP+hYWqB8vwUCWVq6IJv6kM3BT9Lv9GQmXzZGBmD5Kuz+giezgclhLfErhlvcxV/LtaYC09GqzcvQ2B2kWlEy6YWPaWF+ZV3Z4avdB/oiFnn5FZK+wSlCoiF1DWxd6TW+0CIk0T7fYTqBt3nDGJw3Zb7tTzKaC5xKCK8x89GoIxo6WpHv6JbTjMgSAtX3G9id15lNJDsEaIhwfnh4FXNX4qX87leIoXnPXorIXO3oy9sGROFCfOWd2W5+oYz9jysrsfEB7PqGCPAcjGpJf6+sOd6RCC4MaKvkMHzGocl3anR/ji9hmTXJchA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tw0s9+B+lOUlPzGuqqHZc+BliG9zWYxRoLru8awX5BU=;
 b=FG2fZlsjlijToQ45xGQgw00XhGVsgCvfSz7rJgVd7nnj7DiToQf+Es7ULHf9JZBf4AG04+FR5ScQ2LToYvZaYdEIEmQVTFnBw0zg4R8nuDwBjp8mW4OJkSnQ5uBgaf4PU181djhd9MOGgFsV3gPmHvpPFVYDEyipa9s+/z3j0CgU/ZDUtYaahRcPY1B4qN2MeO392m4yo/PXt5ub+QyDfJayrY0DgVbgviD4nURxcjBJOm6rFQH1QSJDDn+O+W3ary061OIOEiAfQNZ2f47mDEFDTCl8fEugerzC4EqyWqL8rnw9tbXfb59LhVp8JqVolF0K3NHJ7FirrIlYgYI8Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f319f7b-5080-2802-09e0-2793d9dad1a7@suse.com>
Date: Wed, 3 May 2023 12:43:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] cmdline: document and enforce "extra_guest_irqs" upper
 bounds
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <54e126fc-484b-92fa-ce66-f901f92ec19c@suse.com>
 <6c5cdffa-f3fb-8f40-c44f-ad7431451929@citrix.com>
 <f3a11fa7-6e39-f7a9-7705-17c3af34273e@suse.com>
In-Reply-To: <f3a11fa7-6e39-f7a9-7705-17c3af34273e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::16) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|PA4PR04MB7711:EE_
X-MS-Office365-Filtering-Correlation-Id: 951cc484-a02b-4e10-b73a-08db4bc3391c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y6fUfyX3E65fJ9h9MgEwmrNp4Dhzzee2PB2VVFV43rmXG4xDCgXYfzMwkI2FpKO7jjw3LSgqBPefl0BPu/BTvM/l4mlUp4bZ6/5wV/ySGXSE5y5oBPRVln84ou8GGAweTfPLDmgAFNpU0HluHd5cd9h36LNVHpmZo8bRiWMLlxU15nJvo50gXi57M+MIsJWriUda7R+5D+96S3jpo7XtJwULUVUUwWWV+X/Y5qD4FYGdj8l2CeItbRxEqICjZZFAVyAO18JuLVfM9h3lmzqrYnc9ZeDZQXySNslE5fGtfts2NiTVBlYpdkbZZSFEBqPpTgY7JqZec91J+tuJsWfvZ9zq9IF6e6ReXKE1RRD/BXTYDUYsTY+vRWVgYOMugj/MKB9cVmgomU1IeJPcTlVBlq9Ox+ystcZlNJTJ/dR2pfjwWcVmiDiVZ3KkttyWc1RI7vCweNmkSs6XwBi5H6PO3KoNrkn1i3YukzqTkpzyqUsHVb3Hw65Ad5xbTjU24kxfLH+7yHX955Pje2ZvCRSw6cSNMal30OUAUsYf/O3nyXJIIBsqNt5yUO8LJdl6q6yUM9Odzvdk808vVL8+OgeFQWajZHMicFWP0284yf/IqSiwGK0vI5jzHDzMHRZU5HiKcanLAOyBuYIKaBbsPF+mkQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199021)(31686004)(2906002)(4744005)(5660300002)(36756003)(8676002)(8936002)(66476007)(66946007)(66556008)(110136005)(41300700001)(86362001)(31696002)(478600001)(316002)(4326008)(54906003)(6486002)(38100700002)(186003)(53546011)(2616005)(83380400001)(26005)(6506007)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S09DdkcyVTRaUy9aZk10K3YxWjhHVFVHRkZnZEp3cHFnRXJlQTdncWY0WTBx?=
 =?utf-8?B?dkVXZkJyMGlVOXZoZmRuQnAySTZXanNDZy9FSEduN25RR3dtNmQ0MldCN0Z1?=
 =?utf-8?B?NEtRdCtFSjQyQUtjUkFWU1M2aVp0Qld2OWhiZEFlSHYxYVZzejU1NDJSaFdP?=
 =?utf-8?B?VGI1QWlGMUdtM2c4aGcrRi9pTThTOUpkNEtad2ZoVnFrWFppZmRZVFd5V3RW?=
 =?utf-8?B?TVZDQmJReGYvN2dPcVZVaXlWT0dtQ3diV3BMbW0ycVdVRjJKQlNocWNIQ2tp?=
 =?utf-8?B?ZzhZL3ZsVURWRS9TTEpNb3VKMzJ1SWFPdXhDWXRTdEpzRStvQ3lFVU5sRFVG?=
 =?utf-8?B?OHdxNFpzb1F2V29la2RuOVc4Qm84dHk2ZDZubjkvUWpYQ0ljcXhoeE9SWDRl?=
 =?utf-8?B?TVRiRmFJN1NXcVFodGpWc2RLM1Nac084YWNRZVljYXh1NWtJZkZRYmJ5ZXlR?=
 =?utf-8?B?RmdkY0lIYlpOc2M1MFlDU1k1UXpkV0tXTmx6V1lITXpnSnIyQjN5TWY1R3hT?=
 =?utf-8?B?WUl4V2wzSW1IY3hPY1Q1aW9qQVZrWXorOWxWMW51TUh6OEM1Q1Uzakx3T0Fr?=
 =?utf-8?B?cm5KcjhCbVVUaEdjZitOS3Z5OWJQa2kvdE5qSlZ2RkRJS1BHdGp4RmZiMDR1?=
 =?utf-8?B?MW5EZENLREg2ZEQrWTAzeG9iTHY3ZW05U3NhRjRaTW9tOXNPUkVzMWtBRnp0?=
 =?utf-8?B?REI2S3NHTm5nZ3RpQURzZlJtTTNmbmY0Uzh2VlZqWXd6S25tdXVkQThVUitD?=
 =?utf-8?B?ZG82SVlrZlVzbUdHVlBWUFZzQnZUZDVBOXZ6aXFZS0NjZGF1REk3eHAwY1lP?=
 =?utf-8?B?clVJN2dWcWdnLzBXSlFOQy9rVUxuaU1ZR09RTWlydUVpd1pyLzZ6YWlvcVRP?=
 =?utf-8?B?dmhDOHFudFJMWUtnQTBvTU9xdXAxVTZmMllQQUdWRzBodHhTLzlBNk1CQ3hT?=
 =?utf-8?B?SFRLMFdjWGIxRHVyVTZtczRsbEVmVnlQaFgvajlxNlhXNmtVeFkzeVMyRWVT?=
 =?utf-8?B?aUhYWVdTKzgya3pSRHNtZ3VRTFJWWnFNUkZhUjJ1d05NNE5HSFpUVDhNRVlU?=
 =?utf-8?B?Rzl4MEdZb1FYYUwxZmJIV3M2b1h6ZWlyMG5PTzNieEJzRmpqM2JlR1dpRy9v?=
 =?utf-8?B?MithVFovQnVHdFZ3N0NKOFNkb3VVbjNwTm9lNHNxNlUvUVhnS3J3dlgrdktp?=
 =?utf-8?B?OThvV1RJcEJRRitaR1dqVTRnRENZZ3lpbXdZVDhjUzRzdTlRNHd1SHpXZkhT?=
 =?utf-8?B?QllSRDVZMmx1ZlJUdHFMSmU5bGV1ZGVVZ3FSbnA3bjY5Q0pGYXVyUEo1V2Jw?=
 =?utf-8?B?MFN4N213aElPZ3Y2bEFIc2hhdE9XdHRpQ2ppRksvWEUrblBTcHpoYW8xN2VX?=
 =?utf-8?B?aWFXYXRyb1RuODU1Y0tYSlI5SVpYYnJEL25pby96WC8yNHFIWnJhM3BORmcz?=
 =?utf-8?B?MTR4a21YamducVBiRVR6cmxZYm1xaTc4MlN1b1dORUo5NnF0ajJWWlR2ZE85?=
 =?utf-8?B?WTc5NTZDOGV2bHc2WUNUeTNKelFOblp6U2xQeVBlbHRVSWRCY2hRR2h0RExr?=
 =?utf-8?B?aGZydHdCRFhkdHJ2ZXhaYmdkVnZ3MS9rK0QzYnpXRmpwUldMdTFvaGJIdjhS?=
 =?utf-8?B?UnJJZTJFcWprNE5MNHVOYlo2aS9LOXc3M0crQjdzdWs2QysxdGQ5elRBdGk4?=
 =?utf-8?B?bTY2M3kwSVRDRDRNMXVYS0dLT1dVZ2FUSWFWaHhIWUhzN2N3QXliTVRLZms1?=
 =?utf-8?B?VnNqMU00b2YvU2hhSytHN3lZQzN4akx4aFhFSU9YNnkvU1gwUFVsZU1Zcmdl?=
 =?utf-8?B?QlB1TzBSY3hmdnJRczEvMWdMZVJBK1dkOEx1Tk1VUG56QnZBSk1UZm5GRU91?=
 =?utf-8?B?QVRmWFZDS3lxZUF6ZWl4aWErNEdHQlo3SjQycHhTOStGdmFZNmlZdG5lZ0dh?=
 =?utf-8?B?K2l6WUVxRUQ4UzdnUXhhOHVqajc1VTdaQ0k3T29nU0prMFlaTEJCZFRaQmZu?=
 =?utf-8?B?Y3dYT1FRY1dJT1paeDI3c3JUdXUzS2JFdHJuMGRNYm1jK09ORDZ2eXhJdjFB?=
 =?utf-8?B?NjkyYXBZYlFTL3EzQm5sN1hQUzE3TWlZOXQ1aHN0eG14WnhCOUxaSU5jcU5r?=
 =?utf-8?Q?XrDJTBo81YwH28DYC4Xepweyo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 951cc484-a02b-4e10-b73a-08db4bc3391c
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 10:43:25.3609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KvqwDhGlE/+m0dR9nGU34fMZktn8oNqgixCoGV0KM4tNbWzwx/4+6O855lrGoP6Q5qwMfEU/Ch7Nm3sRxaX9/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7711

On 04.04.2023 12:40, Jan Beulich wrote:
> On 04.04.2023 12:34, Andrew Cooper wrote:
>> On 04/04/2023 10:20 am, Jan Beulich wrote:
>>> --- a/xen/arch/arm/include/asm/irq.h
>>> +++ b/xen/arch/arm/include/asm/irq.h
>>> @@ -52,7 +52,7 @@ struct arch_irq_desc {
>>>  
>>>  extern const unsigned int nr_irqs;
>>>  #define nr_static_irqs NR_IRQS
>>> -#define arch_hwdom_irqs(domid) NR_IRQS
>>> +#define arch_hwdom_irqs(d) NR_IRQS
>>
>> I know it's not your bug, but this ought to be (d, NR_IRQS) as you're
>> changing it.
> 
> I can add this (with a cast to void), but I'll leave the final say to
> Arm maintainers.

Arm maintainers,

may I ask for some kind of statement here? I'd be happy to follow
Andrew's request, but I don't want to then end up with an "unrelated
change" objection.

Thanks, Jan

