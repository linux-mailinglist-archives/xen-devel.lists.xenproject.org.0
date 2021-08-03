Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4CD3DEE45
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 14:54:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163446.299413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAtvl-0006Q7-2o; Tue, 03 Aug 2021 12:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163446.299413; Tue, 03 Aug 2021 12:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAtvk-0006Nz-VT; Tue, 03 Aug 2021 12:54:00 +0000
Received: by outflank-mailman (input) for mailman id 163446;
 Tue, 03 Aug 2021 12:53:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mAtvj-0006NN-7R
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 12:53:59 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ddc19756-f459-11eb-9abc-12813bfff9fa;
 Tue, 03 Aug 2021 12:53:58 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-fTtVM-2bP3e2y1n_v1vO-g-1; Tue, 03 Aug 2021 14:53:56 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Tue, 3 Aug
 2021 12:53:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 12:53:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0052.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Tue, 3 Aug 2021 12:53:53 +0000
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
X-Inumbo-ID: ddc19756-f459-11eb-9abc-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1627995237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C7mU+a+f/Jvb5lbS0yxtJsfGF3xoNL3CBzWUiMzrzWg=;
	b=ioC4qb1X7OXfJbQRjhj8gPZ2qwZV9uUHOyehNl5BiunFP9h7AaP2MG6JXe6CfXVdybZRC6
	QyvuK7LHc0aRm7lqFPnuW8pchYedcgQtwidE7o0tEj9vLwJhJpjrAJhgB6y3terFjJb+aK
	lGhTKryfPRq7hHYc63XhFIEVzkd0yCk=
X-MC-Unique: fTtVM-2bP3e2y1n_v1vO-g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XseqnI4symjZDjBWz3F0cwC3CFvSwX2zmpe0CCMY7mom0WALVkG79KQPyh3KlhuN8MwRjs/xH2cI3orpPQe87YdkUKbpqCEHOVfkf5NCecXe+LOmWmC/Wa38MHSPXEPrbEjBIfhDDJOGhnPuza6is7muKmFqBg7SS/62nGh8fcq/jp2dULAguTauN6ZDG75YWxCwUY6FvgwmYKszVTosP+UxUvKBa2uVoBssIC+9FGFRTJ6g3AicsWqSmVCHaJlpa9k7adzMi8nkOtsgXwmGJVupZV+f3FNgy8AAatrpOOSxnOBMLp9Dbtm9kMKfLXjZscmNpflT+RFjlHpJad5Erg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7mU+a+f/Jvb5lbS0yxtJsfGF3xoNL3CBzWUiMzrzWg=;
 b=i8o1JvrI2FD9gwme+GvIhJ5lsb47As9Ka5kKYUuC/vmmDVvnz0SB4PNp6oUTrRf2348heM+5EgixzYq0k6N6emT4e0qc/WT7guz7jK4GoiqMjeKRwKAYXCzjLVA92Fej31QdAsp6LAcmsB8K2OXoFDlIE33y/FYkGsJ6jer1QUuW1zIU5glbbfHw6zS9LetARlpM1LJd26nJI6SOguLFquZqadBRrcpOQMT7Jnvd1XmcQOf1Ln1iLyqpDeJbBWlymRf3dnFn7iVNEaJZ0rOrqFxjr+0soIlTO3XiZ3gjoaVfcP2I8IME+lh2J2sceQn/7398WCj0oi4nXAb8B8c6Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com>
 <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org>
 <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com>
 <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
 <6a633f4e-13e0-4a2b-cf6e-35ef90ae977c@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7d79a197-a126-2eed-3198-c20e63c1eece@suse.com>
Date: Tue, 3 Aug 2021 14:53:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <6a633f4e-13e0-4a2b-cf6e-35ef90ae977c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0052.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43b4c2dc-8efb-44e8-b5d7-08d9567dc001
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2335607AEA9333191004B832B3F09@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vqUi6BdIO6ok1dsI/Xx1nn6uKsDroUqI99hY3kWtd6QrKeAkj8ORdC+w5J4qP7nDQ4ZQVpGcwKHiMX5uZRKORHVpOWGlUIK95utbRZe38ta4GTP+7k9O3G6BVxtMyQkFvS2eB+5TwhF7EAQh0SrgtTD3uKZIFrVyXeDWKwhed7V+Hc0E+Q18+zSvdYIykN+E9NqE83ItDYTwTptPka+eVLpmmBsWgGvmMK5M+IbB4lKxQfQl5c+sEieQKlw6B30Zu3cniRNYF+BqGwZi9i8OHWrDNn22alMN6ja24P4FICX92qj8DZsePVLcWCCjL4+F4bvRXDNzmwMScHy3vx/qW4r7jynOz01Dvrb03rEkjQTdCfDwWqAYyOxTUlVY+n6YrnrxmQRAq/Cb3qrau4n8zFf0RQu+VT8orn6LPVYydxZ27CpEuWHlcyZXBIgQiffz9YphDLb/5J/aAX5M8ZR2Eb3t0L4AXDApc3YHpUHlg9FYYwCa0+5HhIzBLqHBX6n5O3v/U10+5WkK1h6ZoprBwJOv5xwixvY1qisUgz45QIgJXs1Bz3EImiZYbmkawfxs8IXly7BBRkT8LIircRMU77vKDx6D/EPdrKHI6N0lY3Y76b+iGTmWHDipKaR7O4RHLSXyx1hdXM9dZ6f0DvOTRBgJBK1S8vaym6qVoGFcbA0riMokOjnWzKRZiVyUEVzoGY388/BNLFskFViidCbMFkr56cPjBDi9Wi4M/6wxfmA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(376002)(39850400004)(366004)(346002)(7416002)(5660300002)(16576012)(54906003)(31696002)(8936002)(31686004)(2906002)(8676002)(26005)(36756003)(186003)(83380400001)(2616005)(66946007)(6486002)(66556008)(66476007)(478600001)(86362001)(6916009)(38100700002)(316002)(4326008)(956004)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2tHOUF5OUR5YjFxTE5haEZxQkNPNEREU1hSUXJhTVVxVXFBZ0FoMDZiWVpq?=
 =?utf-8?B?MWQ1N0NwMWVrNGJ2a2pDTFRQckxyR05GSGY2dnVxL29GZ25vcHVMaEdLY1Zp?=
 =?utf-8?B?cC9taW5oUW9lVGFKN3IzK2FNdHR1U2lMMWJUNkhPYjh1YzJIenNMY2lTYjE1?=
 =?utf-8?B?eDRJUHh4K2lMYTVRajZ0V1R3U1BjQmtBclAzMEVjbmZJT1ZEYjFIMFJMNlRG?=
 =?utf-8?B?MGZvZ2d1RTMyaHZsY1hrMldRckhVS1VVNG1NeW9VeSs3bmR6QnZXTDRmdk9U?=
 =?utf-8?B?dWVkeit2TWxQZEg0MHNCTWZhcTBQSnZKSlZxNHhVbitmVHcrL2xHNDB3cmZq?=
 =?utf-8?B?cmdBTkFkVyt5MlZpYWJ4UldSU0dUZ0ViWDEwdVdrQlVWdmdpTDJxaTF3bWlm?=
 =?utf-8?B?UG9Sd0hYL0ozQXU5MEdwL2VEeDZTYkg1YkY5UXZ1ZjA0TjgrQ1NvRC9Ca210?=
 =?utf-8?B?M2FpN3U4ZFlZbndlbzhhZFA2YVlvTTh1cll4bDNHTG5qWllJbUliQlVBS0lB?=
 =?utf-8?B?RUJ6Z01WQnA5UkhZN254QUplSTlNYWlKa2tZdmpVN3dnM3lKclloN3hMVW80?=
 =?utf-8?B?dU5lZENUTnZTTzVqUFJzL1EzdWQ3YURJaU5GamxTN2UvekVQc3RsWWVNZnNV?=
 =?utf-8?B?M3dvN0tRYVQ0TklWTC9IZVF4Sms4bWhPSXdBV2p0TE01blZUNEY1d01nMHQ4?=
 =?utf-8?B?SW5uYmlOTmFieWlSVDlXd2lOQ1MvdWwzaWJTWlBjTFg2RHNzdW1mMjRWU1pj?=
 =?utf-8?B?U1h2cGQ1OTJKbjVMakVpZ1oyR3Z6K1ZWTnI3ejV1UDF2TlBrMDIvZ2NjbXF4?=
 =?utf-8?B?N3A2dk9mWlJ0L1QyQWZ4R1VQMGc1RXZSNE5xejBkaWc0aGNtL0k5SHNQNlJo?=
 =?utf-8?B?YTcxZEU1OGpzWGM4OFMveVVMRHZWV251QW05U1psdWVXeHlxcVA3NmRtMzh3?=
 =?utf-8?B?Zk41K28rSEdQNzM0TnorODJwcWNTajJBWkJmcUJEVDhVb2d5dUM0OThnRThK?=
 =?utf-8?B?ZnJsNHlIWEQvb3pGVVgvNGtGRVFMKzBvTXRXRjNaZSs4YlRGcW5DWTFmZ05t?=
 =?utf-8?B?MjZHNmlKaXZRNG5YYmR2WnpOK0tQbzcrZnJDLzZnTk1XQzMzZjhrZ2p6Sk5U?=
 =?utf-8?B?QWxGbEdQM1hrVzF0cWwzc0kzcTU0Z0ZzSmRBN0ZhbWFFT1hiTVVlbWtWNzBs?=
 =?utf-8?B?VGxKbEFnK3Rta2p2aisxU3ZFaDFmbzN0RU12UzRDSExuMnNMVHEzZmNUSHdl?=
 =?utf-8?B?b2FVNWpxNEpxWXc0bXpHbFg5Rkhkeko4QnFLdm5VQ3VldnlQbkNsUWE2UWRC?=
 =?utf-8?B?b05oS1JIYUhZM1BpdGFtNGQwQ2xycTZSQUR1eGxMdFBGTkQ2ak4zWmZVMWhT?=
 =?utf-8?B?aURHYjFWTEdFajdWU296OEcvQ001MVliOHdwWjFEeXUxS0lJZGVZUEI2Q2lK?=
 =?utf-8?B?K2pCcEdrTUM2M1FmV3lzUC9ZSFZoRmpTbVJKY0RGT3pMZlVrb3lYL2phZDZh?=
 =?utf-8?B?T1VhTEVTZDUxQk5hTGFCakRDTzdNNlJHMW50bXhpOUp0eW9YZTZyNVNnNDdB?=
 =?utf-8?B?VndOMVB4T1ZPM2Q4SUJSbyt2NElNaXNOcHVyZERPQTNCSjJXMzNwWTdMQktM?=
 =?utf-8?B?ZVIyUmNYeWdXRkNpdzl1a2VTbFpjMzl3S01VajE1UDN2UzFDT0tNMTFVR01F?=
 =?utf-8?B?b1BCRlFjalVBUUJzMEd0Q2dPMS9HM29zQVozbk10NjZTZk5ESmZ0d3Fiallx?=
 =?utf-8?Q?/ffDNIp1nZkXNrBR1I5U6dg0V1v0Suoy8UREgnB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b4c2dc-8efb-44e8-b5d7-08d9567dc001
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 12:53:54.2963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvD5/wcPpViJWmfTnFj/gAlmyhariYY3OXQQOEmxyWe8RTJ84QEyR7FHkVjfP213jcMYWv8zuQ3Kr7HAk1yiLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 30.07.2021 18:13, Oleksandr wrote:
> Well, if new hypercall and, what is more, "the querying hypervisor at 
> runtime to find unused space" model itself is not welcome, I am ok, 
> let's try to create a working system,
> may we please find a common ground to move this forward (at least on Arm 
> for now, the foreign mapping is the most important question).
> 
> I got the proposed idea in general, but I haven't connected all dots 
> yet, some points need clarification.
> 
> 1. The safe range must be defined/allocated in advance and must remain 
> const during the runtime. The safe range must be chosen by the toolstack.
> [For the initial implementation we can start with some large value 
> (128GB) as discussed above]
> 
> Questions:
> 
> - Do we need to inform Xen about that range (via domain_create 
> hypercall, etc)?
> - What will be in charge of guaranteeing the safety of that range at 
> runtime (reject new mapping requests with possible overlaps, etc), Xen, 
> toolstack or both?

Well, what other entity than Xen could enforce this? (By implication,
the answer to the earlier question can imo only be "yes", unless it's
Xen itself to establish the region.)

> - Where that range should be located in guest address space, should that 
> range be the same for all domains (how GUEST_GNTTAB_BASE(SIZE) for example)
> or it should be calculated based on actual guest_ram_base(size) for a 
> particular domain?

The default size may well be fixed or amount-of-memory-dependent, but
I think there will need to be a way to enlarge the region for guests
with particular needs.

> - What about a safe range the Dom0 can use itself? Xen should choose it 
> for Dom0 the same way how toolstack chooses it for other domains, correct?
> 
> 2. The safe range must be provided to domain using the firmware table.
> [We can start with the DTB and leave ACPI unimplemented for now, 
> assuming we will be able to solve open questions as discussed above]
> 
> Questions:
> 
> - Do we need distinguish between foreign and grant mappings at the 
> domain side at all? Can the same safe range be used for all types of 
> mapping?

Like Stefano I don't think so.

Jan


