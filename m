Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E7740261B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 11:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180685.327438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNXGI-00007D-Ua; Tue, 07 Sep 2021 09:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180685.327438; Tue, 07 Sep 2021 09:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNXGI-0008WR-Qo; Tue, 07 Sep 2021 09:19:26 +0000
Received: by outflank-mailman (input) for mailman id 180685;
 Tue, 07 Sep 2021 09:19:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNXGG-0008WJ-Vv
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 09:19:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0a2198e-0fbc-11ec-b0dd-12813bfff9fa;
 Tue, 07 Sep 2021 09:19:24 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-5Pj7idR_M5Kp9voGTPgQmQ-1; Tue, 07 Sep 2021 11:19:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3392.eurprd04.prod.outlook.com (2603:10a6:803:7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 09:19:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 09:19:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0111.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Tue, 7 Sep 2021 09:19:20 +0000
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
X-Inumbo-ID: b0a2198e-0fbc-11ec-b0dd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631006363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AfkubQ/XUUoMzWb4P1EI2bnBghkZcRYqwXc3h2OW3OA=;
	b=Qk+wryJM5YTr4Bk8yzj35R+D58lI71PKCzQR1iSia+rxare/P8j94hu2ovL4nhza7ybCUt
	6tE8A8g9/ikbuhiHNA5RP24IAwiPUQph3yEdTLhzV0CltJG416o6BuACyxNjhNJCWeeusX
	J5N6ktVFY3t1SJ3mjdZ108AUV8wIjFE=
X-MC-Unique: 5Pj7idR_M5Kp9voGTPgQmQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4eV2BFg8QDjioBXGlM5Vy2DM1xW+mlurUUvHt85SNQfbFXjHyACG7r1Alu6ZhymIBZQvtX8V0yepjUKuUHKmjrD4Cw/mvq7gI4b5mpzFldZrRfArZ2xOzP5TH+IeN8hIix4yKLmbPBT+hYCxJ4dH8JKMAQhghZunPNIZeiH2QkF112rCT+NxuluI8XinayV0wyly6XUzyBL9pBHyU3f+eBE6Dq3/49MbQNAA3i+UpnFtFYJxcgKSKKAz8olK4fa8UXEGmEZLDcp6MqYTA0fxahOZIX1xh8Wr1B4/Tex7T+iGXEwNSlmWHebzhuhhdl7NnXh+9fGkcbQYD6txH9bkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=AfkubQ/XUUoMzWb4P1EI2bnBghkZcRYqwXc3h2OW3OA=;
 b=IhGbeBi7cOP3SKgUw7wqyvgpb40L93xtaPgw4WapCflni583Wg7jOv6IlV0t1JYELj3kfVykM0JCFBPayDdYa2ANMHEbtOPmgX3MO8BC9C9dUGQIxotfgDjMQw/a5ihBIT7pusWIuWivMBS7uj1oZqu2vdVskADi4GNFTBRY7+ioPaUtelEo3IhR7p39rs5HIap+T7eVKO2UhBJUYOH0y/sanzTszxtNYD/vJ+sJy5stFiW08/DfAh1UQE+BHfRhxi5IZngi4nS5aAxu0Hz2oQpZWxHSsFzXScASYzz8EtoqEgeYXnNZe2fu3JxK03Q8NA0bqW06WcBC3nBSmUvuYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 8/9] vpci/header: Reset the command register when adding
 devices
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
 <20210903100831.177748-9-andr2000@gmail.com>
 <ffddb533-399d-3b34-69f2-33ba1e977231@suse.com>
 <5366265c-d169-041d-f812-1c49260f6499@epam.com>
 <8f1816db-798b-15d9-7343-2199eb8f39e0@suse.com>
 <0e3942a5-9105-c99e-f15e-dcf35aae142a@epam.com>
 <c6702cee-9c37-8f0f-77d7-20da718e3e94@suse.com>
 <5d0d345d-db16-f0c5-9a78-4ad5f4733886@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5ffbd0a6-b34f-4de4-b316-2376211039f1@suse.com>
Date: Tue, 7 Sep 2021 11:19:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <5d0d345d-db16-f0c5-9a78-4ad5f4733886@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0111.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e2c8330-1659-4126-a703-08d971e09349
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3392:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB339266B00F98D1EE7CD38844B3D39@VI1PR0402MB3392.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cDx2KHKtTSgILVVDEBk3Mfl3GJS1uQUPx8fUietNRl56XBmQg0QzKYjplxTdOs7JqB8PIEwGLc6CWeFFJD1KFjxd1Yl7/GXBqeQK54+UcE4Xj0Yo0GyesDKQs3H1FvR2vWHmgoI0Nr6QVLFYtv8nXtXIOrSxyYEJwbp49mWfnitqjGJ8uswYpVNDL9LADv/lPH7L08nyCELL716j0wc/TJVTZG+CkjOYT2IHVkCTCKuy8Cr3o22N+iixsojD2d0UQ8lgPAEWLyGuQx2jON37D1IkCSqBw0cr45nfKsEGuv+l/nmO0lCY/cOUTCnTRyyw9tCuKtvmC4tOMElzBk/R1hoKYsW9yOV7p4QM8FnYiOr5NosKeWzKU4UJvtU72I/12g61YtEgv0GGFYQ9W9ZzVQoJXME5zABoIXvogWGyUUa5CvZKseo4l0r2y6ddZuCCLkCHwFCWW1mDe8Ilg6BfsmrHJ3Mj4+tZCzYF+h3Sk72XwdtAuJ13Ky5Dv74xKWZVqumTddhCyhAIPLOyvcES565UOtTh3yVJ9169ngGIvReXXOCHIAi449ErhTExNSrNOtY3C2K05sge/8NBwB9kC0YVc+voTaoyF+O6M+AGO1moxA5UttflFEoDz3RFKuLyJw/MJwNHA5grEP2bvAwnmQ4tNQjoCBsDmkZab9Xnthd5nNhCBoyHW9y+NWMEfGjFy8TnTrFFMATm2vFtymjfMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(110136005)(38100700002)(31696002)(508600001)(956004)(31686004)(7416002)(26005)(54906003)(4326008)(186003)(83380400001)(6486002)(66476007)(66946007)(8936002)(53546011)(2906002)(66556008)(316002)(5660300002)(2616005)(16576012)(8676002)(36756003)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFA5QjNRcHlyT05vMEN0TzdUYjBtK21FcGszUDRsVVFiZzJWK3pGcjQ5ODI5?=
 =?utf-8?B?dWtzMU1pTFlYQXZ2SE9XdCtKTTVyMHBaTW9EcjBKeUhXZzdzMlNRdzlzT1cr?=
 =?utf-8?B?SUtGdGE0dnA5MUdXeGdya3JOeTUwdmVBZm1qYkUybFJ2RVdjbGtFY2pYRGY5?=
 =?utf-8?B?SHUxUjFaK1IydGJsK0xBbDZmRHduT0JTM0xRamVTU3pJSE41SFZoMWl1Ui83?=
 =?utf-8?B?UDgxcGFGbGlnMnRNaGJxcEhUUTd0NjFaZ1JrMFlwMlpyVmJlRkY3MlZyVzlF?=
 =?utf-8?B?WG1LMy9FeHBYaWRMbkszWmcvZExCOXdYclF1K2VScVhmQ2p2S1RrWDU4OHo4?=
 =?utf-8?B?QTlyVVl4QmZseEVnZHE2TXQwc05Vd1hYbWdackkvaDU1NFpBL05saWpWZS9W?=
 =?utf-8?B?QjV3cTJtMDdIVTVIYndOS29keTlIUHlPbGpmcXF4RStHUlJ0RkNiRW0wNDYy?=
 =?utf-8?B?UzI2bXRvMVl3RzJVc3MxamFuRzVaSGdpTHdrMGhvNS9QMkdhV2YzZGoyYUY0?=
 =?utf-8?B?VkpDZTZOYy9BdE5SRW8yc3ZJM09vZUVvS3NwQVUyQ2wvMGkvK3hKN0lEWGhv?=
 =?utf-8?B?NGZoakdmM0EzNU5hblFaNUs2UVFkRHYwMGQ1c3lsekdXSmJBTERZazh6ck9r?=
 =?utf-8?B?QWhZWlI3alFrd1kweVI0d2czUC9JdnE2c2NHcFBramVyMjhsTkhscEsvb3lm?=
 =?utf-8?B?TnFpYnpqZUY3L2x0U29PWlg3akxZOC8rVVBNNlRSWnBZZTVvZ3R6VjkrWUIy?=
 =?utf-8?B?eU0zN0UwYnpXclZFOHVwY1JsRUI5bjJNMSs4eFUrbEcyRE1aUXJQckNzL1Zq?=
 =?utf-8?B?UHRsWUdyQ1N4ODhuVld3YzFwcHViVHovZjd5ZFNQdktXWEZvSkdGVTI3L1Yy?=
 =?utf-8?B?d0xNdFY4N0QzcWVUK01HdWJpS0FPbXhadDVHZlNvQzBCQW1GZVB5bEZMeVRp?=
 =?utf-8?B?b1pJVHZpUU9XdERJS3AyVzBWRi9aQ2pDQllXK3NINGczTzJmTXN3Q1lpbTls?=
 =?utf-8?B?LzNJYzVjMk9CVTg3cWJFc3EycFlJdE55cG9OdnpKRmhSelNzdWJ2RXhVWVRh?=
 =?utf-8?B?ZGlWWDA4YWZqRXQwT3hSQXhuOGErc0NPalN3SW9vRjZrTXRpbVpmZ011KzYv?=
 =?utf-8?B?YVNScG9wSlNMQ0RiL2pVT2Fjdk1rZ2JQUEhyNnZlTXRhT3NCMk53bFlhVGF0?=
 =?utf-8?B?UkdJcDBVNzlOeXZXcVlkempzNXBmYjVWY3Q5QW5QZDdYOEpPTWtUNU0rbUxn?=
 =?utf-8?B?Q3ZDbzJKZjVxdVdmUXpqTENxd0NmWUJpcURESVczSmZsWFNVRDdKWFNvNXpZ?=
 =?utf-8?B?S3kyU1lEQXBwbG1mTXVqcWZxOFNxZDJWYTBqaDlkYzZVSVE3WmMrS1JVcmVy?=
 =?utf-8?B?OHF6bTdXVHVmU3QyN0NlL3NUT1dSdjk5ZEMzZHp6REgwN0hZcjhlZlpZTElG?=
 =?utf-8?B?dkRZNWNYQ2lzbzJrUEFoKzhwMW91WWx2WW54VVZJWDJRUVdjcEhOa3pzK1Jj?=
 =?utf-8?B?aGZ6ZWJkNCtYUzFXaHlGL0dQQkQrQllKNWtyYkV2VHB2QXpOdWd2ZEs2S3N5?=
 =?utf-8?B?Y2FBY25CcXhUem96NHk4dDlldEg3V3hJMmFLRjZ4cTdiQ1Y5OWtlbUpWYzBG?=
 =?utf-8?B?M21nWXpwMVVNQWxnQURDbXFSNkdWK3p1eGxHY1lJdjdRZnVOY2NkdnA1YW93?=
 =?utf-8?B?NjNpZWU4M2ZaTDJ4VFhJbjdxQ2VnZ2crQzRUZVJ5R3VncC9lTmhzVVBsOG11?=
 =?utf-8?Q?Dts3p59VenTxTH4+Rb4/g/rsvDEMtTnNq98C5y2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2c8330-1659-4126-a703-08d971e09349
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 09:19:20.8335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6aNQ9eM1WTM/qW4MT2A4VS29LIj/1w8MRlpvMvz5WrnPDNSTwVD549G5jJ5VHzJKUq1u8JyTltj8K2E9amceZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3392

On 07.09.2021 11:07, Oleksandr Andrushchenko wrote:
> On 07.09.21 11:49, Jan Beulich wrote:
>> On 07.09.2021 10:18, Oleksandr Andrushchenko wrote:
>>> So, if we have a hidden PCI device which can be assigned to a guest and it is literally untouched
>>> (not enabled in Dom0) then I think there will be no such reference as "host assigned values" as
>>> most probably the command register will remain in its after reset state.
>> What meaning of "hidden" do you imply here? Devices passed to
>> pci_{hide,ro}_device() may not be assigned to guests ...
> You are completely right here.
>>
>> For any other meaning of "hidden", even if the device is completely
>> ignored by Dom0,
> 
> Dom0less is such a case when a device is assigned to the guest
> without Dom0 at all?

In this case it is entirely unclear to me what entity it is to have
a global view on the PCI subsystem.

>>   certain of the properties still cannot be allowed
>> to be DomU-controlled.
> 
> The list is not that big, could you please name a few you think cannot
> be controlled by a guest? I can think of PCI_COMMAND_SPECIAL(?),
> PCI_COMMAND_INVALIDATE(?), PCI_COMMAND_PARITY, PCI_COMMAND_WAIT,
> PCI_COMMAND_SERR, PCI_COMMAND_INTX_DISABLE which we may want to
> be aligned with the "host reference" values, e.g. we only allow those bits
> to be set as they are in Dom0.

Well, you've compile a list already, and I did say so before as well:
Everything except I/O and memory decoding as well as bus mastering
needs at least closely looking at. INTX_DISABLE, for example, is
something I don't think a guest should be able to directly control.
It may still be the case that the host permits it control, but then
only indirectly, allowing the host to appropriately adjust its
internals.

Note that even for I/O and memory decoding as well as bus mastering
it may be necessary to limit guest control: In case the host wants
to disable any of these (perhaps transiently) despite the guest
wanting them enabled.

Jan


