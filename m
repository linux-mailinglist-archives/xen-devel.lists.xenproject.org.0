Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F99402756
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 12:44:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180815.327636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNYZj-0004ZV-Lo; Tue, 07 Sep 2021 10:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180815.327636; Tue, 07 Sep 2021 10:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNYZj-0004WU-H5; Tue, 07 Sep 2021 10:43:35 +0000
Received: by outflank-mailman (input) for mailman id 180815;
 Tue, 07 Sep 2021 10:43:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNYZi-0004WO-SB
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 10:43:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7173c848-0fc8-11ec-b0e1-12813bfff9fa;
 Tue, 07 Sep 2021 10:43:33 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-sOfWlC9eM2-V1hDdeaL0tQ-1; Tue, 07 Sep 2021 12:43:31 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2448.eurprd04.prod.outlook.com (2603:10a6:800:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 7 Sep
 2021 10:43:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 10:43:29 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0221.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 10:43:28 +0000
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
X-Inumbo-ID: 7173c848-0fc8-11ec-b0e1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631011412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hAQn0uoWIlnVXTNyX1uoYabT8MPDY2xA0mxqdTElNQ0=;
	b=nf/EzMuQaZe/EuZ4y8PGSEtmg4UGNNXXm9jWVB1x+r9tY1HAkIc0R3TNFPMALiGEeK2dmN
	RLCs+A78JH1lGq0Mjb9ruxuHhLI7bCroTfdFNlh5cZ6QZmrnzXGpgFnE9LpUO77gIiYimw
	Q4XUpPWzyF0FZaBilcDX3yvExVwcHTA=
X-MC-Unique: sOfWlC9eM2-V1hDdeaL0tQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebS6Ub0ovREellpTEBZnOSodFvX989VljNe8KiBejqk6xLcuJIvQhbaZ7byATllYVCGsVbVpp8GQcSEptt+CbxmzlxWlkboikksCemZC0t19D/UlGXoX23QWJUa7cXPfvDAVjdleLk7zCKoSNUXU4MJGvEb8NMpj37dEPQsv6uwb/maHREMKI/23BpATpwtVvj+3Is3/29SIwkz21e4rcHrtZx7j2jrR+qXOPkBhSyuCj8vJ5TCzaeKjv54OZHVyYRU4dXtFUD8MNdY9DQfjtRQNLSOtXBUC7wis57tegU4pKBI8EYYZTuHC7sbkt2jUkdQ2aLTiuNaKvShnXpi2Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=hAQn0uoWIlnVXTNyX1uoYabT8MPDY2xA0mxqdTElNQ0=;
 b=LPwy3NKCnXoPJVoqLhawWWbs2OKaqWB9NjdrU9SznR60GbBaiYS9Qg7MBkuCN5Sn8hacZ8bvswg0EnXaXYRzBBYufjGRtj2QwBCmYDJfDsRK5xbHXEjqvOYJiD+IjGeM3prKfDlEY2n0kH9Ujue0sk59IZSe3/u23/eKzv7ttgwUG2eVuKdTTWkeHYEEjKlrZJVgmyz7LmdQQNv5E4MrFoo765Jqz4yZGwpNZrVH/Wh9kC8umaREyi5YDEa29Q41feWFhfMFdSeX9FzKaiHQdnwQllOEA5EC5zFhVDkcXivXkWxiKqVQWc+cb8n0Gn+JO7ZN3RRUOTXClHgby3NwKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 4/9] vpci/header: Add and remove register handlers
 dynamically
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-5-andr2000@gmail.com>
 <8bb58d2d-255b-96e9-50ff-529985c655d5@suse.com>
 <16e396be-89f5-4d42-d57b-d91f09b70644@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <00bbe12b-6a79-e660-c5c1-57ccb200d2eb@suse.com>
Date: Tue, 7 Sep 2021 12:43:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <16e396be-89f5-4d42-d57b-d91f09b70644@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0221.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4ad2d90-1138-419b-24c4-08d971ec545f
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2448:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2448BB0A1710996356969CB5B3D39@VI1PR0401MB2448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bl9Wt7VdahHDctMw47ZPujEJbZgzQqzqB8HD+02GhHy2Z2nWU76doOtv6y1gXhRsvpaW+4bIrFby2aZ9pgSoFJkXy6PiQZX5Zbpa0z0dZrKdbQix6s3rYCvnSxACDL4u7yqIURQARCGjgjJjZ+ch9IWK/guEveJR8BCBRQ0RtHpX+ppSj4YkozWPbaPvFlO1zLg7H22z2R3Nr+4jUUeGNcGkCiVlvZOPGCt1fNWWmI2BwKfk2R05EsIfGb7fKiK1KlfwvUkQ44DF/oAHOw23wRHbFTPXlfr+tHzkaHvNP2nbLLa7nwRDNV4DzcmMPzCTckK1J+IecrFATD8iNO+gxCGL0Ly5A5aAfu4zmeBCHKJ+tPcN9FpaLCSOCevN58V9VjVMmbxNhGSLroiWZzbvCtsjLuZT6YS6ldM90nRTZCce+kifVa3K4dfkarMombraFctVnep1GHVevTj3yectgwBt/trCUL6QOolVQyQXn9sgmh7tr3/RzNF/48cCXlHZNDBrBi/QN1ELASzpZPDSkRH1WfCTbm9fHDORSPdURjjE6jPZyake0u0tW7eIHueJ5ytWfLpyLNgGGhhxqRJwRExGU/5VL//trPhkXd2dfOAh5eWWEIsBvsbQfL6ddiayHFWMb1Baaa94UeTz6QDVymJm5Ybebq+XtdQIVrWapwsASgh048loPkMnPHAnnOwWvcOCWC7odghxPnEPXaUvLTzRVA5orilOXb2udm/6l4Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(396003)(376002)(39860400002)(316002)(478600001)(38100700002)(5660300002)(26005)(31696002)(86362001)(2906002)(53546011)(186003)(6486002)(8676002)(66476007)(66946007)(8936002)(66556008)(31686004)(83380400001)(2616005)(956004)(7416002)(16576012)(36756003)(4326008)(110136005)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUtVUmxvMFJtRnhMdk9Zc2duVXhURmtkZkxaREI0ZW51NU9JZDdXYVhGbmRR?=
 =?utf-8?B?Vit6YnpPb1JQK0EwZXVTcjJxK1I5OWlBaFZlZHh3NkQzaDFFajd4L1g5aFhP?=
 =?utf-8?B?NWZYbHVIZk1UaDNmcFBzZjJ4RU1hWlF2Q3BBZ1JVV3dtNmtzVmI5NzVVbVNh?=
 =?utf-8?B?ZWw3ZGxCT2NXS0FNK1VFRm05K0pBRlpvWk5EeW9qa3R6ZjdXalNjTVdHSXVz?=
 =?utf-8?B?enR5VmVqczdydWRIYnBwMW1VQStYNU4xZ2h6T09scGZpZm4rVEtlQVZCTWd5?=
 =?utf-8?B?VTVPaHdwWWxwZUVsUmcvclB2UWx6S0ljN2I1TlY3TjRkZ1JpZDlyQSs2clRQ?=
 =?utf-8?B?QVQzVXZlNHpXUmdsekcrMEJQaXB5cGdpK0taaHRNaVVQWE50MXVadUtOYXZB?=
 =?utf-8?B?RlNONGJ6ZFVHOUpNbGwyeFp5T0RUcTEyblM3dHE2ZXBOdjN2S2xJanJzdnF4?=
 =?utf-8?B?WSswUEgyU2x4YkQ4Wlk1MGNLcFFNQm1TRVp6NnVTTGZaV3QrYmwvZ3FKcm1y?=
 =?utf-8?B?STd3YitWVEFFVXdIQURrTTNHL3dvSWQydXIycWtCUzJJYXNpZklRcmVYSFlh?=
 =?utf-8?B?eTV3QmNUd3IxbFV4Q2wyS3FSbHFhSmdyVVBzQ1l5a2N6Y1Y5dzhnVWErUlha?=
 =?utf-8?B?QllJSkdBS0lGemZIMjZuVEExMWdHa0k5TEIzR2h0UE8yQ2YzZmRrdVpPdnUy?=
 =?utf-8?B?c09mRjdVK3JuMUtCV2FnbG44b25nQWZYTkMxQzVYQlF1TE1UcTVaYTVsQk1Q?=
 =?utf-8?B?ZjhIS28zbW53NmxsWThtdnlNei9ja0VxMU1RM082ZnpsV2RKVHEyZGxOM2Zt?=
 =?utf-8?B?L0dUY0NWV2xsdFc4b0tpRWNnamp0ZWozT1BoYmxzOHQ0a1Rpc3U1dEI1RWpq?=
 =?utf-8?B?TlBWQmhZejg5c1NwTGVTOVRtQnE3ZEE2RXhPUS9IMUQ0YnBPaXhuR2tXZ0hr?=
 =?utf-8?B?UEdmSnVDS1hVY21PajB3Z2k0S1d6di9IZThMV2pDeml5WktJQVZOdUF5Qzdm?=
 =?utf-8?B?SDgzd0lkU2JRdHBLTEEwYm9YTHlxU1F6NTZ5UnNmWHAyYVAzOFk5N2F0U2oy?=
 =?utf-8?B?NFNDRTJxTDJWdHNuS1QrbHJTNUJaT1ZyWG8rYjFCSmhYaDhPR1JucS9qMHcr?=
 =?utf-8?B?V093UDdBZDluV1FaNlI5dlVzem5GRFFXdDZqbEpRTTVkQnpaSjRKTjZ4L0xJ?=
 =?utf-8?B?Nnp1U3ZYRUJzcnlwSmpGU0ErSklzTGJrUiswTE92U243UGN6RFFIV29Ta21U?=
 =?utf-8?B?TUwyck5NUDlYY0t6MWFob0oxbC9pMlAzdFdvUWU1cytBWVpVTUZRRVNEZ3Fh?=
 =?utf-8?B?eWhSRy9xZnJZanM3Vll4VVoxRkNBN0dPQUROalQ0TmlGbExmbmF0MlU5aXRK?=
 =?utf-8?B?SDF1S2wrR3poeENKT0xLanRQNlhSRkpacmhjNko2WXRzYmlaU3FtOEZQTDh4?=
 =?utf-8?B?VDliTEQ0czZ6SnplQnBzbjc0T1lZUTNvVGVjVWhQUDhoSXFkc3BQWTJ4ZFBO?=
 =?utf-8?B?bWxMdlRIYitSUDFsa2FlUjRNWGE3NmovZHVtTnprTWJvNWhaRTNQTlVpOFRw?=
 =?utf-8?B?K3BXK3plQ0hZeU5lMGNZTTVocVZuY2FYZks5c2dRQUZIa21wN2p3eVdZSlRZ?=
 =?utf-8?B?YzlOYkZSejRiT2Z0aFRHbWhHSkNMWjJSYWVYV1VGRyt2TlI5dXczMGl3SlN2?=
 =?utf-8?B?VWdSZXV3dGUyR1RaUXhKNFpqd1pqS1JaaFVja3NkWCtjRC9QVlBkelo5R0xv?=
 =?utf-8?Q?Mk6rSMYQSc5pc6DDhFSFgwwyB3vjbZFWgpgbpJ4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ad2d90-1138-419b-24c4-08d971ec545f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 10:43:29.2427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5VD51ig4A8zNA0EXuPmX1BvK34PiVPm7+HnmoKxJ0i1iACLHUDlBnm9HXl1IW0N9VYwodJzjyj2kxUufLgU5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2448

On 07.09.2021 12:11, Oleksandr Andrushchenko wrote:
> On 06.09.21 17:11, Jan Beulich wrote:
>> On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
>>> @@ -593,6 +625,36 @@ static int init_bars(struct pci_dev *pdev)
>>>   }
>>>   REGISTER_VPCI_INIT(init_bars, VPCI_PRIORITY_MIDDLE);
>>>   
>>> +int vpci_bar_add_handlers(const struct domain *d, struct pci_dev *pdev)
>>> +{
>>> +    int rc;
>>> +
>>> +    /* Remove previously added registers. */
>>> +    vpci_remove_device_registers(pdev);
>>> +
>>> +    /* It only makes sense to add registers for hwdom or guest domain. */
>>> +    if ( d->domain_id >= DOMID_FIRST_RESERVED )
>>> +        return 0;
>>> +
>>> +    if ( is_hardware_domain(d) )
>>> +        rc = add_bar_handlers(pdev, true);
>>> +    else
>>> +        rc = add_bar_handlers(pdev, false);
>>      rc = add_bar_handlers(pdev, is_hardware_domain(d));
> Indeed, thank you ;)
>>
>>> +    if ( rc )
>>> +        gprintk(XENLOG_ERR,
>>> +            "%pp: failed to add BAR handlers for dom%d\n", &pdev->sbdf,
>>> +            d->domain_id);
>> Please use %pd and correct indentation. Logging the error code might
>> also help some in diagnosing issues.
> Sure, I'll change it to %pd
>>   Further I'm not sure this is a
>> message we want in release builds
> Why not?

Excess verbosity: If we have such here, why not elsewhere on error paths?
And I hope you agree things will get too verbose if we had such (about)
everywhere?

>>   - perhaps gdprintk()?
> I'll change if we decide so
>>
>>> +    return rc;
>>> +}
>>> +
>>> +int vpci_bar_remove_handlers(const struct domain *d, struct pci_dev *pdev)
>>> +{
>>> +    /* Remove previously added registers. */
>>> +    vpci_remove_device_registers(pdev);
>>> +    return 0;
>>> +}
>> Also - in how far is the goal of your work to also make vPCI work for
>> x86 DomU-s? If that's not a goal
> It is not, unfortunately. The goal is not to break x86 and to enable Arm
>> , I'd like to ask that you limit the
>> introduction of code that ends up dead there.
> 
> What's wrong with this function even if it is a one-liner?

The comment is primarily on the earlier function, and then extends to
this one.

> This way we have a pair vpci_bar_add_handlers/vpci_bar_remove_handlers
> and if I understood correctly you suggest vpci_bar_add_handlers/vpci_remove_device_registers?
> What would we gain from that, but yet another secret knowledge that in order
> to remove BAR handlers one needs to call vpci_remove_device_registers
> while I would personally expect to call vpci_bar_add_handlers' counterpart,
> vpci_remove_device_registers namely.

This is all fine. Yet vpci_bar_{add,remove}_handlers() will, aiui, be
dead code on x86. Hence there should be an arrangement allowing the
compiler to eliminate this dead code. Whether that's enclosing these
by "#ifdef" or adding early "if(!IS_ENABLED(CONFIG_*))" is secondary.
This has a knock-on effect on other functions as you certainly realize:
The compiler seeing e.g. the 2nd argument to the add-BARs function
always being true allows it to instantiate just a clone of the original
function with the respective conditionals removed.

Jan


