Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4F4539D6E
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 08:50:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340251.565235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwIB2-0004c2-60; Wed, 01 Jun 2022 06:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340251.565235; Wed, 01 Jun 2022 06:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwIB2-0004Zn-3E; Wed, 01 Jun 2022 06:49:56 +0000
Received: by outflank-mailman (input) for mailman id 340251;
 Wed, 01 Jun 2022 06:49:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwIB0-0004Zc-AV
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 06:49:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09e6cee5-e177-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 08:49:52 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-55JdQOwnPq2RJzo7xzuXow-1; Wed, 01 Jun 2022 08:49:51 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (20.179.234.89) by
 AM0PR04MB5490.eurprd04.prod.outlook.com (20.178.115.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.19; Wed, 1 Jun 2022 06:49:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 06:49:48 +0000
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
X-Inumbo-ID: 09e6cee5-e177-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654066192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=flItGDFpmQXNLeZ5YZ5v5mwNooKUQqcZOJe2gt7SM4U=;
	b=ZJAaUbswxo/no8B9uc8LTqNIHL7oemGNTzqrdwqLpjgi24UhnLzoJR6lPSeO3LxzyKIdGR
	uCIHkkouEdmXWPUF1Jdvu9IZfj+aUSPEJGerGxcQtx43dWFpRZwEMw70XlYjru7ezG0Ql3
	kPRqXJwF1niDdSJkw8Ys0ZLLEWhfWYM=
X-MC-Unique: 55JdQOwnPq2RJzo7xzuXow-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnYnlEWP8puhZm3pRWROLwOx7pOviYIU9yDUMYRp9Km5j2kVEBG0EbEDImh6r3aqBwBqp76bGBZn/MK/kY86B1ZYKAhzbNuvm/J+74v/XIl9dDZ2sYtBQIkInP9mcH56n9F/DEe/J3GezawlZeXXUB117tbw03MMteZ4FXDGsKpZV16YOUrq8crwnvxdf+H/HstMI8EmmZSgejId+haYzzkRYnDoB3DGDWeEqi2AmUJsKfuKZKtQ2OlD6rw62uUaTd3YFFPGGaavZeRcVRl9S01YvTvHrDSoYf0x1/dj1VlaC/QQ2zLN9iHjQD48Sk/8T6qvwNECmnVM7YLUoFjj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flItGDFpmQXNLeZ5YZ5v5mwNooKUQqcZOJe2gt7SM4U=;
 b=Ni6QvXDyP4lkBho0EsNvyXsK+NjYf67PaZ5j20BkPL5LSZf8B8ZeQa7GjXoQ2XL3qRe56a556DY6LWaumD2srdN2c+2BNR1fJYCz913UVS7365W3hWdxrjVZD9UFH4XU0BR+49EXHSn5PEKC4TFz3shrDpVmDhPPt8LktN/c6QHP5Vb6LQhl2uwD/P/ubrrSMJYxZFiMO/j0ZmqK1JaxODD70TBNEVZDNsoLE2jkoq/vdPhmqApAAKCHWWJi2VzqMWm+osMBJSSgBKt/muqIMokELrcInDeP1ludfZSFH3X3DrEWN36yafVMEejqGTAvpZ8Jjlv3QA6wbtW7mukH0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <40db300c-4d20-8339-599f-bcf6521442fa@suse.com>
Date: Wed, 1 Jun 2022 08:49:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 3/3] xsm: properly handle error from XSM init
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: "scott.davis@starlab.io" <scott.davis@starlab.io>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 "jandryuk@gmail.com" <jandryuk@gmail.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
References: <20220531182041.10640-1-dpsmith@apertussolutions.com>
 <20220531182041.10640-4-dpsmith@apertussolutions.com>
 <c206a20b-ee5f-aa5b-64ba-fe06469f0f2f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c206a20b-ee5f-aa5b-64ba-fe06469f0f2f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0210.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::35) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f6a5dd0-081b-417b-194d-08da439aebd2
X-MS-TrafficTypeDiagnostic: AM0PR04MB5490:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB549098D96EE9BFBC32B339C9B3DF9@AM0PR04MB5490.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JRFX3zRibGyt4DMLsU4R0x44AE7I/4GdKth/LQ8vpf7FRbYhhB6+eviRQhbcS0LSs1aY0EHJlEyRKDKXWZmfTUhfkC3dF5neiLG7J7vdkAsL4Fzs/tWDB5jEzbjePagayx9fNCN9i4asINrMQVTf4gJ+RVGws0Av8HPHw9fidNcK6DA4cktkuOKRTwDkt94aTVMbWjLKWCwVRdINOHG6tUzf2xeSWOj+/Zo4Tv5edeY3Cx5a1gkM1ru1O9j4dXXids9gQgzipN1lmGUffMsK4Ifk1qTdF0b9CI9FQISdh57knlfvgHdVCygnBv12QfN2MWDliU0H33tD5o+R70tDrdrKa0kD/LgSUYdu49olvaf8NcacFzyK3FRTTZ3VVzJkmkaCfVwMtEdZhyFOjV/Wl3uk3+vWssAdZrj8CYWzEizST9xzKsG1bZwoHWC4AQlZOrFLdH7wTgvtlZ6rNz+8WpdFEh3kVFhtonkA5ozXwdxHIV08cg0ODpjd0tc63mfnwSPlrG4t8/iVIeHgMYINQIU7a+KIPB9HOvc7Tx9OVwumWFiixsA+9WniiccAGaLlSa0pLqiFzK44EdeCpYzELWR0RB8zcNIXTQOrT+w+v95lhj/CPpVIk0EeCKy0pcrnpbDcTDZ0HpOD1QA9D7FRu8T2wvu2NE4GjtrwdN+xXZQ6uSVu10GRB4P4mnj6Qpl+OlJgIiO0lzSV8zAVAXSr8dr2qKsqP/dDZYbm0RyqkcyL7XPBe30oWDpRqXx3a/sy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(86362001)(38100700002)(31686004)(316002)(36756003)(54906003)(110136005)(6486002)(66556008)(2906002)(66946007)(8676002)(4326008)(66476007)(5660300002)(508600001)(7416002)(8936002)(2616005)(83380400001)(26005)(6506007)(6512007)(186003)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUtVUXdsZ28zaTR3MU9WV3VBekJRL3hpSENUU0JpSHZJNGRXYVNTS2IrVThp?=
 =?utf-8?B?RnBoVjZrK3ZsZUVMS0xxb0dLR1lLbGMxMU5senZ3WEg5L3hWUEk5dGVrM2hp?=
 =?utf-8?B?RTc1eW1penhxUFFJbHhqOWVVV3lpbmE1cG5uN0ZUbmhYV0R3cWh2bVFua2Ny?=
 =?utf-8?B?dXpiZ3RxR0s4OUYyd2VVRy83aUZCSVN4RldpUy8zaXJ4VFJ5SUdDMFZlZ21M?=
 =?utf-8?B?bVhrTWhsWjdVaEhHNHFXUHYvUDM4LzhJYkdQTk9LQmtlRmUwUkJlQU9ZTTdX?=
 =?utf-8?B?OGxnQm55WHplem5sSUxJeDJ5enR3KzUweEg3OHJnYWU2MVJ6elgxUEJsUEJW?=
 =?utf-8?B?YnZZeUh4NEhveDlDQ3RBWVlJc3lZT0s5clZqUXE2aVlRVlgwbi9xckE0WU9z?=
 =?utf-8?B?cGRNZFFuQ3RQSFdINC82MXB5bzJRSEl3NW00cEJCRHJLZk15WVUva2w5a3k1?=
 =?utf-8?B?UnVlUWpDYzE1a2h3ZXB4c0xyeTRqWWlJMkx0cWVwQ0ZlQ1NWclRSc2Fyb1B3?=
 =?utf-8?B?N0lXMGQwRTJKcnp4VmdDSFJuM29FQzQ0MjdxbHdUYWJNU3BicDdpTHNCUGx2?=
 =?utf-8?B?N2lQcDE3SnBoOFhxczA4WGVqaVMxZ21FNU5YNk1LTWcrc3AzRnMzRVhNUHFa?=
 =?utf-8?B?eTI4cE0zek45Ti80aklwTk1qbXdNQTgzRUVFRzlCUFkxWnVLMk1HQU1ybndo?=
 =?utf-8?B?ZmZaWEhxeGUwRk5hRERPVjFTeFhzcHVmY1YwM0dMTDJNTWF2Q1FUbTdWOE9Q?=
 =?utf-8?B?NXdEQThTYm5xYitJWmRrOXhGM1BYMEg3dFAwWVZwejA2aGRyYmhJTXordmgv?=
 =?utf-8?B?ZGMwNVJRb2ovTEtEaXhZcGg4aHBiUVFZV0h5aHJXdXpOYkQ3OXFubmNuWXNB?=
 =?utf-8?B?T0xSZU90V1RJMnc4bkJZVGtsZndNZzl3dG1hNjJxdE56SDNJYVM4TFFxWGZN?=
 =?utf-8?B?WlVpUHZlK3hRMnRwVFlOWGdDQTlUVitGZytnRVI1Y3NjeVJDbm4ycUI4c1N6?=
 =?utf-8?B?czhVNG1ESmw4WDloeWhwREZ6TnFvZXRhckdSUmlTN1R6Y2t5MFBsMDVKYzFC?=
 =?utf-8?B?K1EybFJnc2toTmZMT3ZhcmhJenZ4RGFVRFJlT3FnNjhlVlljVnhjRW9pb0VS?=
 =?utf-8?B?UUxoVjNIVkFLbjd0YWdHMnplTEVpd2pwK0tUR01NdnBjeHRiUWVEcWlDTFZy?=
 =?utf-8?B?bGpRelMzTTJKYUxPeUpvbFVkUzNHVlExVk9qYjNYcjd0UnRSZE1MWUthcllB?=
 =?utf-8?B?Y3hHZHpKbCtMN0tUWVYyUVpzblNTcHRjNGtWeXY0YWhYQ09PVGlld25tcTRH?=
 =?utf-8?B?T0dweW1mNjAyOWpqZ0NzVCs0OWpHdmdsbzE3ODRUN3V1YWpGeTVGQ2hCQTBW?=
 =?utf-8?B?ZTdUMjYweDh4V1ZBZ3ZDOUh2NEFWT1ErN3V5TDBIZllRRlpFOURjQkt1bE04?=
 =?utf-8?B?YW9LdWdLS2V6MTM1dEdNMnBaN3dmUUtlTCs0WTk0cWdDVzhvd2J3czFCR0F6?=
 =?utf-8?B?V1c4d2ZjNmtteTJBemY3M3oxSXd6ZFVnWGxsOURrdjl6dUFISWNmV0NaMFd6?=
 =?utf-8?B?UktLdFk0YWJWMStQYVFzL2VWZWo4NkRBeGpYV0ZKVXd0RUo5ZGl6UUV3MTgz?=
 =?utf-8?B?czgrVUdmc2FQNnVXa09BR2U2YTlWZkRnbDFIOWhyMHAvY1hMWlo2RnIzS3Bz?=
 =?utf-8?B?ZFVMQTc2RlNXZzB2MWxGSGFXT0RQS0Fhbjd4SXdGVVRlTGx1L1hYY2ZTcy8w?=
 =?utf-8?B?Q3RkaVI0TERrd05HaUQ1SjY2YWduKzMyWnoxNTN5MWExRHhDQitKL0RyaWNF?=
 =?utf-8?B?QUVGTWJsUTJCem9sbnZVbDhVSksrOXRNTlB6Y1dVTVpZZDRzZmNGaEdtM29D?=
 =?utf-8?B?ODUzUEhYT3FORnBueFBTdGd4ejR6UVlQT2NPM3FZZTBvdzcxMFZPWEJZeUVq?=
 =?utf-8?B?MHNTYUhGSVo3WWowZWtWK09RQjdsY2VHRkNwbGU2R0pSTUhwTm5oYTJjcEM1?=
 =?utf-8?B?eCtubFBqQ251SFVHNE9yNGhLNWk5TkYvM0I1RnlKSXplUHQxZVRYdCtXeFlO?=
 =?utf-8?B?ekhhMC9VRmJZSklCaS9GeGhCaGk0dWhQWUErM29NQXVKV1B2Ym1jejR6WjJL?=
 =?utf-8?B?MmZWOU5ZbkV6U01ObDlNZXhCMlpmR1oraHNGZWs3Z2pPOUE4WHBYdk05Y0FD?=
 =?utf-8?B?RjczcmJUVFJvVEkydHRDaTNBQm1wRGM0N1I5bXpjZ2p5QXRIcklqQWpQTG44?=
 =?utf-8?B?OWFlVGRxOFpqeko5RktEMElXdWlVUEhTL1NRRG1zNjRLUy9RV01hNDVOcUZ6?=
 =?utf-8?B?WlJhYzdRVnZUcUFjVHdBUmxNTnpZeXhmSjBIdVFqT05KMnU3dGNnZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f6a5dd0-081b-417b-194d-08da439aebd2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 06:49:48.8973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apdjKoMW11LJDwKXH6wx/KQJuT4QhOxrcxBpBzuICAYjt0sG7hqS1uYrucdbQR5gPnusF+A2BFtRET3EX2yRXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5490

On 31.05.2022 21:18, Andrew Cooper wrote:
> On 31/05/2022 19:20, Daniel P. Smith wrote:
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 53a73010e0..ed67b50c9d 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1700,7 +1701,11 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>      mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
>>                                    RANGESETF_prettyprint_hex);
>>  
>> -    xsm_multiboot_init(module_map, mbi);
>> +    if ( xsm_multiboot_init(module_map, mbi) )
>> +        warning_add("WARNING: XSM failed to initialize.\n"
>> +                    "This has implications on the security of the system,\n"
>> +                    "as uncontrolled communications between trusted and\n"
>> +                    "untrusted domains may occur.\n");
> 
> The problem with this approach is that it forces each architecture to
> opencode the failure string, in a function which is very busy with other
> things too.
> 
> Couldn't xsm_{multiboot,dt}_init() be void, and the warning_add() move
> into them, like the SLIO warning for ARM already?

I, too, was considering to suggest this (but then didn't on v3). Furthermore
the warning_add() could then be wrapped in a trivial helper function to be
used by both MB and DT.

Jan


