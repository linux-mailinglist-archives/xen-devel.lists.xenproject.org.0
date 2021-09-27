Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E035B41916C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 11:19:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196592.349499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUmn1-0002VJ-UX; Mon, 27 Sep 2021 09:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196592.349499; Mon, 27 Sep 2021 09:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUmn1-0002SZ-RZ; Mon, 27 Sep 2021 09:19:11 +0000
Received: by outflank-mailman (input) for mailman id 196592;
 Mon, 27 Sep 2021 09:19:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mUmn0-0002ST-BN
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 09:19:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12803130-117c-4f34-b967-c01a463f0ee9;
 Mon, 27 Sep 2021 09:19:09 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-kynDTfq9OIGmz_r5AopOTg-1; Mon, 27 Sep 2021 11:19:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7087.eurprd04.prod.outlook.com (2603:10a6:800:12a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Mon, 27 Sep
 2021 09:19:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 09:19:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0137.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Mon, 27 Sep 2021 09:19:04 +0000
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
X-Inumbo-ID: 12803130-117c-4f34-b967-c01a463f0ee9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632734348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JhnrBnwuUNF23CxQfoC4vO8DtJ34XGVGnTDJNQawta0=;
	b=OOrCVJvilJa4xYToXDMbkVZXo/yp6oNgD1u/mMDGPJRukSNBtMfU9ld8H8CeiChHoZxCaW
	VFl+SwWYFYVILdrVWjKVvEkWA90R7jMEHa8NnI2Ca9OyuI3DYn8BVaFfArf2CGBcna2tMq
	Zv0Y+obotXQ4UpCgVVjF1Fs9mADUj3w=
X-MC-Unique: kynDTfq9OIGmz_r5AopOTg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2qMDFCUhQGjVAqclSP8Vy4jpMJK7VBu+z6hcx2TQGNX/fu9kVHLwFaeV70Usv1o5iuHU/93iqYoG9k054sNNbPLm2ftUXJakIFMT7qKdn5PK19osKONoo6vkBmiDtdr8Chf5gxvY4T66VkkFeTxODW+taqiF/XzEZXjkUJ4UyBiOsrjQpXFZ10ZlUUGBYFDG/5YqdRUzwf1VapRh5uJt1jNWdKPo2GX2QKBARpDE+4kjQVq2q+e3YRgvCigTldX+Ey8PsDE4EOcTajGW098RYg/+mX78HmK/ro7xNoP9okVfwFS3ophBbaXdW+5xq1OzckfJ5BAKn4ZnTkNlOiUEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=JhnrBnwuUNF23CxQfoC4vO8DtJ34XGVGnTDJNQawta0=;
 b=EETh8Ba730Jv8jmza//sSSeoCuKZ+08Zm9bWnkK+usk1nEaS8mb0K2/uMqXXiv9LgC1Pll8r7w5bOxKhEvwR+3wNUOLpp9iJ3KhczdVMEhWyvGGBZIunYabyILgCOOR3avbyCH9KydbTD17qpXq0QIClagq1S9KExQ82NJdQIGo9eVFO263eySDBgGGhw4LHAIAWaDCLQgbIyrpQyZSebmCxj5UO90X5irP2q+EbPfIjmamBlYSbWUChMXrcjE6vyUQ+vAjsubA0IYrf2sGu0LodfRE5giChVPdZTE4D9n8qUZAClr71h5xFpN+z/YoUKj/NuuukypoNwVGhfTEhiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating one
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210923125438.234162-1-andr2000@gmail.com>
 <20210923125438.234162-6-andr2000@gmail.com>
 <443f57db-7b0d-e14a-88bb-78a31c0271d6@suse.com>
 <55beed13-3a7f-7269-870c-ee0361e23a1c@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7b093c2f-33cf-ac9d-9583-f0d8b2bb4f48@suse.com>
Date: Mon, 27 Sep 2021 11:19:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <55beed13-3a7f-7269-870c-ee0361e23a1c@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0137.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4e3c112-6c2d-4c51-f7b0-08d98197d9e8
X-MS-TrafficTypeDiagnostic: VI1PR04MB7087:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70871A44C1F75FC64E7C9E9DB3A79@VI1PR04MB7087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZE1VHtjq6MJh5gtHTclFARm+hwxRqfUmfTij4Som4pa6/TE6CF6ILpSd4Z+LP824CiiDrJ/gzkc0oQgH3BKbxkhd8L/iteO9JVdDjotbPzyKmptjc7k/GSlSGgKPfL7uLSFqh7VA9BdqCQ+25D74IuUmMNiVPTnnmpAFs0TL8Mgxo3iwWNQMLDiGFe79FX5Je4MGMwVx8KhLIFeFZbUMehfsfgmqUNngKrruitq6j9kk9lf6SJBkc0g9Xe/wI99SxyQQo3ZJ1sSsL+XqhW9yNp2w8jeVW+BUPjaY7D02S4Lg18uVaCWf53ZdWHot2nogNVwsUgh1cTQgY+IPcROQUDRiQMDvxSjyP89AgeeIIvTwUC6aUhEHhP7DDfN8LDvKS5VdiXOhuKpTz/u9yBMzQI1BWnMSMsEtf+gb1u+IaxYHVpSqwK5e6xXIRoHD21THBf/eXZViBgM7FGvrd6K9x9GwxSpApauw7nOzfJ46qNuHT3gxej79BAZwyuqGiYt3P9JbQKL3fq0Ldj3ZNxm+MsJ9KmNYIUB1oqLZlFGPdfeDlsOcFCxOonGebZKwNM8zpubW16Ki3Po2Hvq7xHUEmiHSRLNDhCqkgIiHSvjrYivrWbXp15Yx4IPVLRBzXFbpvRPQpD55Uf4Cdyqbgcvt7AAr8mMQwHcs8ofNIBFyars6ZhYbacDuBzmFXFAz0aFcheRLZUw7w6jQWwk0NYW5RR2jdfPhDXtlUY9XW3LXFQ1zc9BHGyP5T52mZxDEJqKs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(508600001)(2616005)(316002)(16576012)(956004)(54906003)(8936002)(2906002)(31686004)(53546011)(83380400001)(7416002)(66476007)(31696002)(36756003)(6916009)(38100700002)(4326008)(5660300002)(26005)(6486002)(66556008)(86362001)(66946007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wk53WGU2Myt6eTZHeElGNWxXTk9keFNDUjJPUnJkT1p5N1JUclJyZXkyTGJC?=
 =?utf-8?B?TGkwQkV1NlBjWjQvTWJRQlQ5T0g5WGwwcWVJdmJSREhVOFdnWEs3bm85ekZB?=
 =?utf-8?B?Y004QWgrSDRhWHlldEQxemVSRDFRci9LUmkvbjJiK2pzeC9zdm1oZWFkeUNQ?=
 =?utf-8?B?c3VwbXdLTVJOL0VVYkdCZTE1Wi9ybzl0R0l5MytjVWNGVlptL1ozTDVYVVFD?=
 =?utf-8?B?UFJYSVRueWJ1LzJXVE5aQUFxOTNzcGFOMDZXZHVVb2tKa2VwanlNQlFxRjV2?=
 =?utf-8?B?TXRZdVRqN2RvVEV0cnRLN1QvTnVpcmlJdkptL2NSQVdXRm9LMEhzSlFUVktp?=
 =?utf-8?B?TXVjMXhkQWJlbC9GcWVFS1ZGUUp1TUVYb09CRVBlQTh3bGc3a2dYZkhvWmp4?=
 =?utf-8?B?NHJ0VjVaTlVRQXZxNXlVZm9ibGF4bUxaV29oWllQYnp0S1pSYlpYelUvTjBv?=
 =?utf-8?B?YjAyZk1XVTZ3MTVGVy8ydjhBci9LREdIdFo2eERiNExUZm4xbGIrTWw2K1Nj?=
 =?utf-8?B?eWo1VWJkRVJrRWdZQmRzeGNkVDF5WXFieUhPTTV1VlJWLzJsYU5rOUVFcjFx?=
 =?utf-8?B?ZEp3Sk5sa1pjeHFaL1o5QW44aHZqZGFiMmlJU2ZvcEtaQW9SU3JEdTA1d1Rr?=
 =?utf-8?B?Sm1lZ3UrWXVrdU91OFdJL1YwS202U0t0UmV6QXNxdlJZTlFDak1Ea0JDVm5y?=
 =?utf-8?B?RnFlamdoZkRnLzVjVm8zRXdRKzJwMit5cXg1UGNaQTNmUjUzYUZNQnFQWWJK?=
 =?utf-8?B?MGNKblV2TVRkT2psTTRsS1dtb3BHTlJ6a2dONlExSk5lUmhlWTFJdCtpOEFq?=
 =?utf-8?B?T2VENmpveU9zeFg0bUp3T1gxUUxsckdodDI1RHNCNjllay9rL1IxRjRMbHJv?=
 =?utf-8?B?dWdrRkdubXN2dkx6akhmRitIVUNqbnRKS3JmejV3dTJucjlJWCthUExsVHVk?=
 =?utf-8?B?bnZpQmMrVkY2TTNIZ3lya1RRRmxqYUdVN25LcVBRSXZkNGUvU2FtYkU0UlBY?=
 =?utf-8?B?T0Z1OEJCcUVUQTNvRllncDRtbWhIOHVaazNKcVJ1bDh5S3FEaWQ2STEyZ3Fi?=
 =?utf-8?B?UlgyNHVuZFhtUmhVT1BZS2tMckVtNDQ3R2x2U0FLSTloYVphTEF6MEllRElO?=
 =?utf-8?B?RnhsZkhtdDFmTVNHREJZa3NjaTVHWEx2YzVUdDRWNHdYWit5UkdQMysyYk1E?=
 =?utf-8?B?cloweS9WaWp1Vm1NQmVoSmo3MWFHZVF6OWpnbnlkb0FiNHNHQnI1VjdnelFn?=
 =?utf-8?B?dmtUZ0JWaFAzbEhDRFlFZ3FvbjRkTGpqQmxLQkZYR2Y5Y0tZR2dVWEdsUXlC?=
 =?utf-8?B?OEVXSnVBNktDN0k2VlZRb2gzQmJqc1ZiQytrN1JaSVF2dDFVZ1hFTHNEZUo4?=
 =?utf-8?B?cE94TzlsYlJrbFNvK1JsYkVVcHFWdkdxd3VLWFZVaUVrNVZ5bHhHeWU4U1pB?=
 =?utf-8?B?alVzRVQxMVMzTlNiU0E2V21ST2JRZzYzc0dBN0U5N3F4b0hhd0pMYVRlOHpK?=
 =?utf-8?B?WWlSYUpSTlh0Y1ZDWkh0VDJLaWRrV2U4d3dNWHFZOWVBWUhicklkNVM3OGN3?=
 =?utf-8?B?N3JDMVlnWUdTZG50VkZUTnh3aXlNeFlrbTRWRWhKbVR5NzRNOEdxdWs2VGVZ?=
 =?utf-8?B?c1VaclBUV0VZbk1tS1RYQUFkOGJ0cWRUNm1uSGRsSFFEckxmRmh5MmdQVHVO?=
 =?utf-8?B?TzljaUp1c0dsRGI2QkU3WGwzZ2Rzd1pyd2xNZWRsMzFGaU5WZ0hoOW5XQjBo?=
 =?utf-8?Q?RZ+iuo5b29QCOoLpSJVtg0Tmkc+XhaZp8VmjbO9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e3c112-6c2d-4c51-f7b0-08d98197d9e8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 09:19:04.6303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hD3Urmghqawufk2nwcw05FGXYfxRcM6cP733fMcqK8vofG2hLXNTyQiy7QQ2kSXI39s7ylvz9uCmUhnuh9L7ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7087

On 27.09.2021 10:45, Oleksandr Andrushchenko wrote:
> 
> On 27.09.21 10:45, Jan Beulich wrote:
>> On 23.09.2021 14:54, Oleksandr Andrushchenko wrote:
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -328,6 +328,9 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>>>       *((u8*) &pdev->bus) = bus;
>>>       *((u8*) &pdev->devfn) = devfn;
>>>       pdev->domain = NULL;
>>> +#ifdef CONFIG_ARM
>>> +    pci_to_dev(pdev)->type = DEV_PCI;
>>> +#endif
>> I have to admit that I'm not happy about new CONFIG_<arch> conditionals
>> here. I'd prefer to see this done by a new arch helper, unless there are
>> obstacles I'm overlooking.
> 
> Do you mean something like arch_pci_alloc_pdev(dev)?

I'd recommend against "alloc" in its name; "new" instead maybe?

> If so, where should we put this call? At the very beginning of alloc_pdev
> or at the bottom just before returning from alloc_pdev?

Right where you have the #ifdef right now, I would say (separated by
a blank line).

Jan


