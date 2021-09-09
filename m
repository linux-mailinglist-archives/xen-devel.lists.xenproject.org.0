Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F279405251
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 14:47:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183209.331248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOJSV-0003dl-7D; Thu, 09 Sep 2021 12:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183209.331248; Thu, 09 Sep 2021 12:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOJSV-0003aa-40; Thu, 09 Sep 2021 12:47:15 +0000
Received: by outflank-mailman (input) for mailman id 183209;
 Thu, 09 Sep 2021 12:47:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOJST-0003aR-CE
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 12:47:13 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d1cf57a-116c-11ec-b1b2-12813bfff9fa;
 Thu, 09 Sep 2021 12:47:12 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-AuqBeqxtOOm188AUA2pyyA-2; Thu, 09 Sep 2021 14:47:10 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 12:47:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 12:47:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0022.eurprd03.prod.outlook.com (2603:10a6:208:14::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 12:47:08 +0000
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
X-Inumbo-ID: 0d1cf57a-116c-11ec-b1b2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631191631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z66l6Ki7HWGDOqCU7aG0SHKqlUt01RaZXeqp5qD1xE0=;
	b=m6Tk5fxJvGBxJmc72r9s23/HhSBMRnMu/jOgeW0GQJrd7aOxrUeT67xbBopT+Y0hh6EWLa
	iGHFQt2NYDj6fRkC6Y6if+2q+E60G8BUE5m9X1FcNIAsQoSUZBJ86v9PsmFdakideu64k8
	mZmrfZBwSCE9UEyR3ZoOBdTuMm7BcAU=
X-MC-Unique: AuqBeqxtOOm188AUA2pyyA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xr/odA6fn4gJv8ArHHrLo+T7UhQ7FYG8MODcWShiU7zntA0W+q+UTR6YveRklPYMo+e8DZQ0yK3P3EjMdyu6k93KXCzWfZu28IHZE5Ln710lYgjtgO4tbmEY2vzPWNBilH60pLqqKk7zG3RsUovIGTA45gooLm2N9ZjWLRlPdgEWi8KttYBMgmHmYPGsvOOWKRSK2bC9wZNH9Vsmz+6ciecVN+js6A3OYzrK37yoX0pleY27aX4b34zC1lJzvseNYSch3aS28AWa/3nSIu4BnTvrRzq4oEQQRBOgch8jKbveJ/u8VCTBjy8ZFOqLfsOqSUbbiLY5gIhhXjxDzS8dlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Z66l6Ki7HWGDOqCU7aG0SHKqlUt01RaZXeqp5qD1xE0=;
 b=IetjLL26D+sWXnOmopqO8e4IoF8ZJW+21eKPCRlPStChJk4gFytLLrvIIuyAe+T+Hlk+Bk6mp3JhgpaRtJJ2snN2OlntXFBV07pP04rwNulSnLD/gVXbttpD4u0RfleUKd00ddXrX0ps0DRPEqY0v7LtKoBVwGaJaOG+XqzuF0zGZypx8S8T7YmueGEZnNe8Faj20FwwJyDtBXhkwVDJWl0m76QG4fn+ZrD0FNMbcIml74xSaxai5rtdQlCMtLuD4O/qAkK7P0ag5Ts3gHU88dq4vq8jFlFC4eTHEeuHG9xN53kD+I/901SLxJeYDcJ8V0ZSXn4l2PG8bG1Uou6ouA==
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
 <5ffbd0a6-b34f-4de4-b316-2376211039f1@suse.com>
 <6db7c55c-93c6-7901-6097-687287463c78@epam.com>
 <d78f2211-ff79-6bbc-f8ca-95cf07e3d7ae@suse.com>
 <73697ef0-85de-a530-7601-d8b1490ec5b5@epam.com>
 <f4758911-0927-f31a-a617-9d8566edd2b1@suse.com>
 <6d8a4bae-cfed-07fb-d6e0-7587eb85069c@epam.com>
 <10bccd76-bbbb-1cb5-b9ad-4298014befd4@suse.com>
 <3ca10b3a-35c9-00b4-f736-293589d641d4@epam.com>
 <06560d04-6d71-bb94-20af-fc43cf686b0a@suse.com>
 <38669583-3e3a-36e2-8714-a4b6a4e10173@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d2ebd8dc-0dc1-80dc-aa15-45a02b01004f@suse.com>
Date: Thu, 9 Sep 2021 14:47:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <38669583-3e3a-36e2-8714-a4b6a4e10173@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0022.eurprd03.prod.outlook.com
 (2603:10a6:208:14::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c8f2768-056a-4a74-e841-08d9738fefdd
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686113E46E52025E2670EF2BB3D59@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZNM7Eq2tB/35IHkSu3iM2VZNuEpI+JZyj01tHmfYJHtovTTyLvGdHyXzdj3BtgjOb1NR3IWs6BhDFXC5IEdCJLayKellx/3v3bBu0FIyQp2yY19CawyIIU9pT5b8nXilOEa7DUmYlFixOuxUjkaZMLqBG3qnoiwwZSJOF9WTrXOmK0wJjvsKQjWuhMxluLNTQ5SwJ74vNmKy9sWDTinRVRp+xvHH7Y5thorDR6zqLqIVlJgoe5jAJMoXq0Ob3bTCF/Bz5RrK21EvhEKAov6++agfMleaaYFvNKGfoeEhOKlUHgJ1qTGIy92phsZgcW3p5DWMwgvPvSH4c/dbO6DMzIVV0DmFm6W4UIJrGbY4v13j+nVEsPIQhxof+/wvgvr/NSDxZnnOh+12TkgqbhMnqegFbpexEHPJS844W60J89tMVEP6bfPRWNSrKjH46IiUdvqrWxuFqgAUtO5onYUQx01zPoT19rbG3jMOZXs56hpFgNDEwHI8upWjvCbnSYJUXf+iU8Xud/F1PxMcWNjvRgByCyj3xtMH7hd+Y9oG7db7KmygVnFKODO/S+nZysK/Qpj5fAcySLfHzxYMo3cp4lFJGOAjqRIVQ0Vo/IREv3BdXvB3eDhsEuHkerTt0hA6EcqpejMW/9Zj914MwrqkjPMWOS8h9FoaVFYls/N7+PhelDZpMg+0Nl71aW7ORwyhNdCuslT9J3BQZYh2exOP8PKcPd3X3VZH/Hz066dzfbU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(136003)(376002)(346002)(39860400002)(186003)(86362001)(31686004)(26005)(66946007)(83380400001)(66556008)(316002)(31696002)(4326008)(66476007)(7416002)(8676002)(54906003)(956004)(6486002)(16576012)(478600001)(110136005)(53546011)(36756003)(8936002)(2906002)(2616005)(5660300002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWNWejd5b2lJdUxmNDdyNVNzSEtHOW5UVEVYYVM1a09NcnZyTHlidThBeFpK?=
 =?utf-8?B?MkxVcjM2b2RZRTlMdFVUd3pZZFZ1YU16N1I1dnB3emx2VENCWlRwaHVmcXJ4?=
 =?utf-8?B?Zks3cE5EZ0x2RWhkSHpTdzZ4aEZxU00vN3ZZUFlWWFJzbGJpMVhkemI2RmNt?=
 =?utf-8?B?NUQydlB4anFKcWtXNFhIMkREU0JHUmNBZmdZNWQxYnNoai96MFRiT3ZraXQy?=
 =?utf-8?B?aFlGRmIxbENCUWJTbnp5N0p3VFlGZElkSVZta0pyVlJaYXlaS2lWWUFkMWhL?=
 =?utf-8?B?WjZoRlFKSUVTdjlxRjFFVHNsdnNpMHByR2FxbkhHajh6UFdMOWRiUE9uL2Uz?=
 =?utf-8?B?M09pOUJUZkhVbVJjaGxDY3pnVzRyTGJSdUNqNEJCbmhOV2diWkRhUlk3TGtF?=
 =?utf-8?B?b2hYT3l2K1dSdjhRTEhKdWRsV1BreE51S0IwM3RuVk91RVNQYmwzUEFDT01P?=
 =?utf-8?B?ZnkwY3VTcmZLTzFmeTZWUGtCUU9zMDFseEUwVWlzS1dwQjdZdEY1OG9RMCtD?=
 =?utf-8?B?Yk85WjFEdWF2QXFIb0FtSGJyYzduMlpmcXNHcVBkbjhhMzNFcXE3N3AveFdD?=
 =?utf-8?B?SFBXcEJ5TFJSMWRDRmtjMWdIeXBxYmdRUWVmRlZWNFRXemJaMk5NVkNiSkJs?=
 =?utf-8?B?dkVLQjRsUlk1eHdnalYwNUtqekdMd3lpQk1vOFZyYmtjaktPcXRrREh0emZn?=
 =?utf-8?B?Z2U1YzNYSy8xdFhpcXN2M3hEeFFvbVJjRktKZFM2RmxjRGZnUHJ5N1N3U29V?=
 =?utf-8?B?dEo3NHk5ay9SNFpqQ1E1UlBkT0U1Zm5UbjFJUUFpNldKTW1XdDdkRzlqVGZE?=
 =?utf-8?B?amM5Z2NiY0laY3dEK0p5VmRzS0dkMDRERS9yRzF6SnZQWFdOYWNnckJJSW5F?=
 =?utf-8?B?UEJFSmZxQ3BTTDFSVlhtNEVPRi9RUmtQcnMrRU55ZmIvNGxwYkxIcEtYUGlE?=
 =?utf-8?B?Qi9YSytQMThNTFJ0akRtS3A5d1FEdWFmc1BUZzZSeEVaTFFrd2JNTk9MWlo0?=
 =?utf-8?B?emdNc2VjRG1CbFZVTVZHcVd4ak5RMHdUeHNaQ0s3aVBkdGVhdVZ5blhvN2Nq?=
 =?utf-8?B?OE9laFlHUStXZnhoVEFrWVc1LzcyUWNmY2Y5ait5aVkxbXFRR05yYzRGVjZR?=
 =?utf-8?B?QUU3eXZjVHRrQzBNRitEb0NSa0hwMTdUbDdidm0rQ0xwUVRYZGJURnhxNmQv?=
 =?utf-8?B?THkvK2hpcVNXU0ptRTJaWDVGNzNhSVVVSE9qNUovS2tpR0dGbHpKcno3bGF5?=
 =?utf-8?B?RkliQWkybGRCZzdHM0pGdkNadlZvRjVZYjREc3M3TnFvRHpCRzU5WWtjbkUv?=
 =?utf-8?B?d0V4NkRPQnJ4OVJVTWRDb2hKZU1GMlFzSXlQNkU3Sm1NOGVaRGJHUzdZZzBk?=
 =?utf-8?B?NHNUaFNLbHNIRTh5NVBrd2sxQThIbmM0WnhCWU5VMHZLT1NVWFhibGFPV1dx?=
 =?utf-8?B?SmN2Yk5PSXFXc3A2NkZXTDBQSGZSbHFrMExMYzdBL0U0d0xtc1hLcUFxZy90?=
 =?utf-8?B?Y0V1L0VNRFB2SklrS2NTcDdIRFUrb3BML01lOE5XUVpjbGJrTTE0U2NLTjZn?=
 =?utf-8?B?NEQvaEZFV05BMnBYUXJaSFU2TzlnNFJzcmtOdy8rRUdySEsweHUreVVSdXFH?=
 =?utf-8?B?cW8zZzh2RFNGM2hxZkVac2V2dC83c3E0NE14d3FFTzVpVlFSYmZXQ2t2bE1z?=
 =?utf-8?B?bmozQlR5NUVtdVlBTGZrbVUyUU1HWkw2ZzdFZHp0eHljd1pvTEw0Mkt1M05x?=
 =?utf-8?Q?4xad63fNd72Ab9bmFtbn/BKAzWBIuqd2Abjp5PJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c8f2768-056a-4a74-e841-08d9738fefdd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 12:47:09.2550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWlwK8uQ9HuBMWBlwonu+NOEVBI3EevXcV4KcD5oA1u/MEe7eq9uDGPN/LAVRRL1cOvxOu5D2v7szynz4wZ17w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

On 09.09.2021 14:42, Oleksandr Andrushchenko wrote:
> On 09.09.21 14:53, Jan Beulich wrote:
>> On 09.09.2021 13:48, Oleksandr Andrushchenko wrote:
>>> On 09.09.21 12:21, Jan Beulich wrote:
>>>> For the bit in question, where the goal appears to be to have hardware
>>>> hold the OR of guest and host values, an approach similar to that used
>>>> for some of the MSI / MSI-X bits might be chosen: Maintain guest and
>>>> host bits in software, and update hardware (at least) when the
>>>> effective resulting value changes. A complicating fact here is, though,
>>>> that unlike for the MSI / MSI-X bits here Dom0 (pciback or its PCI
>>>> susbstem) may also have a view on what the setting ought to be.
>>> The bigger question here is what can we take as the reference for INTx
>>> bit, e.g. if Dom0 didn't enable/configured the device being passed through
>>> than its COMMAND register may still be in after reset state and IMO there is
>>> no guarantee it has the values we can say are "as host wants them"
>> In the absence of Dom0 controlling the device, I think we ought to take
>> Xen's view as the "host" one.
> Agree
>>   Which will want the bit set at least as
>> long as either MSI or MSI-X is enabled for the device.
> But what is the INTx relation to MSI/MSI-X here?

Devices are not supposed to signal interrupts two different ways at a
time. They may enable only one - pin based, MSI, or MSI-X.

Jan


