Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD103E0DEC
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 07:59:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164104.300320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBWOt-0001Uf-NW; Thu, 05 Aug 2021 05:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164104.300320; Thu, 05 Aug 2021 05:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBWOt-0001RD-J3; Thu, 05 Aug 2021 05:58:39 +0000
Received: by outflank-mailman (input) for mailman id 164104;
 Thu, 05 Aug 2021 05:58:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1FJ0=M4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mBWOs-0001R7-2t
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 05:58:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c0d8df8-f5b2-11eb-9bbf-12813bfff9fa;
 Thu, 05 Aug 2021 05:58:36 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-tmxEDkvEMyiULuxI-DqDOA-1; Thu, 05 Aug 2021 07:58:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4445.eurprd04.prod.outlook.com (2603:10a6:803:6e::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Thu, 5 Aug
 2021 05:58:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 05:58:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0057.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 05:58:31 +0000
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
X-Inumbo-ID: 2c0d8df8-f5b2-11eb-9bbf-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628143115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=brHUOXPteZa0o94JxWdXszx2bP+GunU66cPjdyYJg/g=;
	b=QupdqwNHhyt05HU3c0ENvB/pCr4xnKqdcxCjL6tQSQOCWpz0MgQWTyr4eWURL83kzy5aKF
	lEIam9tng9kLmHkiuh70obUY39OvaMNf2kod4KH9yvHVNg2hkqE1dtMnpzIEIG9skY7gGD
	PykU8KWyppgCC7AeCrh4mRXtIL5n+Co=
X-MC-Unique: tmxEDkvEMyiULuxI-DqDOA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/bq7H3/XVJFnTCFui8sP8MYWohU/GCGix3bk9cxSvpz2EnvbJKZePMa0RATkoCTVvJB8b7EZ+CGpq9okGIOqxM84Do1mhbIRlING1e+E8Abykar83N4qyvQ1Ai8FDjkldPkbECLbnf978JKwKEEq/MvXS1ywfUPbnZ/i3TdtNGxox40QJP9RlocOsJyX+YYHckIB5msw1dBZlUVebTPG2csi4mEVOuOb9mFlYDze2GCqg1/S5Wwh12e+MoJPcYmwannPUYsyPbraAQeLxsCrVfRNXZWQYlhJcp5XlkBAVBWn8vvet4JQ9OYNCj8KGTUTmSZbl6za/wSEQXMNM1KnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brHUOXPteZa0o94JxWdXszx2bP+GunU66cPjdyYJg/g=;
 b=jbGjLCJXejmMfvnIJUNetq5SWL0SHXTGlOO3l6ubzAFt8Z3AXe38k7yhQcoHvJJtO4dkyC5KB/VyW9vOsJMXSWMJjMrOeJtzVzFnW2P9xN+2VUkDT/UWJDOeOUkC1l9A0TeG0kVm42UOzhX8M4wD2OsrlqjpuGo158+m5Z694WywErsT7dCb4rOeljKAWv/J8LRas/C92JBI6uPdZKUH4zksESEh/KwnXsTFXkYJLp6OhQ2Tuh554JT5sp5NLlJkZ8juUYZYEa9zDwxJJm2aas5wIHE4FoZnSuaQgmwg25R2YYtjK4McvapZwplZdIk6h3/glltel7Kijzl2lSVQEA==
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
 <7d79a197-a126-2eed-3198-c20e63c1eece@suse.com>
 <090ffc19-92fd-5ef9-99d5-affcfdc28ad2@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <11ba67a9-23a1-87e1-3db5-e9040af42a60@suse.com>
Date: Thu, 5 Aug 2021 07:58:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <090ffc19-92fd-5ef9-99d5-affcfdc28ad2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0057.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d75c57a5-5828-447f-0e13-08d957d60e1a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4445:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB44457CB4FD9A388A534F5BD0B3F29@VI1PR04MB4445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FmUEC/PPpIDCnErVcY86cjZxbVcK7N3EJM70jUrZrfhlFo6A6Dz9r0i9WNBwyuGaWXV69ihViiqwIi/a4qKjyJLtQK4vBNIBlZqDJBZoV/T5EBTlKNXA4weF1r033hh8fs/AnAvGJEOBMqBkxbzFf6BSxdl4C/wLtfQ/+HoQxuvRD8hjc4EHyWZBETVJ4bZLSUq+QLXpb/WdNajpGxZJhy4to5meGYFaauB1Jg3iKWnxzN5vH2GhNZog0DjdyRVJybgVYzGSJNBD7WzipRpT6x/QFmTPvACZV/usZJhoigDO9Nr1nz9frEIav3eHHy5DR5Wgq1/SP10AVDo+G/IRUz+VLtXJ+tJ8/lo/+/505DrBjRJTzfgPyPjaeLlrtS6H5GBNWOFGkMxe8TI/mihIo8k92YBbjcM+nlhrjFc/i35+D8z++J3z3DlmTgziLDRlgpdPQsQ1fl1iQPmvxaocBL8vh7ND3iWfS5QAW/J/lMz6jriirkvBozFmfIzkeVmmZTravPrnXTyN3CtWuL32QJvWeZxkhRwxQT5E5D32/zAu6SvmfutoE6jqm2X9FZMT584rdDhqro0eIufL9X3IyPc5CNVmmzBb4gDXf7/yf/eFjlca+42+mN/Fv9zhSE/psvsqxtd54wqxmGLig/kPLa/XnZ6yF2InhzP2qtgX/xSm9g0gOgNy0V2aoFF+IzMrRzCefqxBrHs8wUxt69jc/g3a0xWoLv2iU9xn1s1188I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(66556008)(66476007)(316002)(7416002)(16576012)(956004)(83380400001)(54906003)(2906002)(36756003)(31686004)(31696002)(2616005)(6916009)(86362001)(508600001)(4326008)(53546011)(5660300002)(4744005)(8936002)(186003)(8676002)(26005)(38100700002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2ZYeExvT1U2TVdRaExrR0tqQWR4TXp5RVBPRnVFd3M5cTk0YWxlR29VTkhO?=
 =?utf-8?B?SS9YTDlIR0UwdE5lWmRPeGl3azVDVlhLcUxhUnBZZEU1VW1Gelp1U3lTZkY3?=
 =?utf-8?B?aXlyTVpmU2U3QUdDdFR3alFURWtFSTUvb2lreklUUC9XYitPYkRPWmZpbm5D?=
 =?utf-8?B?Z0pKcjNYMWdkOU11Zkp6dnRWUFZBbS94MmhBL0F3bWZCSkE1RGRFU2JJdjNq?=
 =?utf-8?B?K0FFdzQ5a2E4TnF3Q2pkNEdYQlFUSFNFTElqNkk3ckxHRnJ1dmFwR2Z2WDRN?=
 =?utf-8?B?RDlpdnkvUXJIOVdBVytIZU9FTnRzeU93SDN6VU1GbEo4ZFpuYlZya3pPblJk?=
 =?utf-8?B?TGNGMlpWSmhjYzI5d3BGMXJ4RktGZWFyazhGeWZWTUEwQ1ptWk4xelNNTUdo?=
 =?utf-8?B?NjNSTGNwbEE4bDYwRnhISWxqdHFqc0U2enphbVB1SEdPNCswZFZaNXFSYWFl?=
 =?utf-8?B?QkNSRURmMEcyUnVSQ3B2T2NYZmpTRDZrZGhVYVJ5dStCUHEveEJoRTltbXJw?=
 =?utf-8?B?S0RBTGdjMU1Qdk5GejUrN081dTNjK2Vyc2FCRndBL3FCbEhESXlpL3QvZ1JW?=
 =?utf-8?B?ODNySHltS2EzVjM1bTB1UnJSOHVTYmp3clplVDZiMWwxVXZ1QTBkbHo5a3M0?=
 =?utf-8?B?RVpsQWJHYzBZN2hOLy9CeFlsOUt6eWJnYVI0RElJb0k3cFZNYXV4T3FORjdo?=
 =?utf-8?B?cytxcVErZ0hZenJRRjBCVnpKa3RGU2FBWml1WDVaSHhmSUowdXdrVnhXdGht?=
 =?utf-8?B?TjJZQ2R0NkdINVpZZGNNY3QzdVJsbkE5cG04MDcwRTBKSDhydllXWEZWZXZp?=
 =?utf-8?B?UW1VM2ZWMmhHODhxcmRHVWQ2VkE4WUc0aDlEc1YvYVZCbVV6YmVyTEN6bUtS?=
 =?utf-8?B?V1k2bWJJUzBvVFJ5QUQ5VmJvcDBNcnltbGNZYTRVK2pPNFBCa2N6THVPOVhp?=
 =?utf-8?B?WHQ0TFNYZHg0QzF6aHNrcC93NEZPYmlacjgxZFdvQ2ZMbUJXQlpwdVFXY0dj?=
 =?utf-8?B?UXF6amdWb0JwaEJLZE1iVDlvWlhnM0FZbW1YeFE2Rk9qMHd5cnREczRCbEg4?=
 =?utf-8?B?Q2F1MUtGRHJYdXNDM0M3TnpTa2dHaXQ4Uk9lOFcyVWZkUk9BdmpUVW8xSlBW?=
 =?utf-8?B?bk5kWFhPbUMzMXhpMG5rVnk1WjJkNzljSElKY05Kdy9JSGwwbFI5a05PeGVr?=
 =?utf-8?B?VWNwUGFyNVBDbnM0RGVaV0VYSUMzdkVmWTNCbHF4VEkzYVZQWlBTUVNLWTZY?=
 =?utf-8?B?cjVCbENvUFFQSDRpRmkwZnU2R0ZndHV4TWRXS1lOUW1aUCtoV1hhSUxuYlpF?=
 =?utf-8?B?eVJOeFhQeFJ6cDVJNGpxdEV0YmNNVXJvZXJ5VjVPYm9RYlZnRFVpWHhGWEdJ?=
 =?utf-8?B?TXRjY0pBT0lyVGZKb3FvNjFrUGg2MjQvbzZYMm5VZUNDUjVMZG5WcEZERTFQ?=
 =?utf-8?B?MVRvZ0FBcGVwRkFKdmZ0ZWFEOVlLcE1mdnFXZHhqUGlNR0ZNOW5SOHdlYnpI?=
 =?utf-8?B?QXl6cWo1VmtkeFZ0enVvRWRGVGpxRGczLzB6aTJkdnVuSGdTZU1xTHFqbHBy?=
 =?utf-8?B?dmVmUW0zUFVVRWVjbU5oY2pUODZHdUZ0VmU2MytmUy9YbzdGYzIxc3VtQkwz?=
 =?utf-8?B?ZXVTWWRIWDhqWHFseEQ5Q1VCVGNFR2VwNko4VUpRVHZ1TzIxdEMwU1lVQ2xP?=
 =?utf-8?B?RUVYTWtIbmE2UitJUXdtbmd6Z0ZpSXRLRHhpdmlpc0FkUDMzbHg3NEYzZGlD?=
 =?utf-8?Q?P4QDqQGruHAHiH7otHjttmxBu2swhIfxQM9AjK9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d75c57a5-5828-447f-0e13-08d957d60e1a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 05:58:32.3640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tv3LU48LZK4sQW+KAI2XpeRwPrgGw+xRyLauo6vaiP6wMwBzghII3Ac4XFMsX+Q+CRaK8C91hNeOVkbWCrJ49A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4445

On 04.08.2021 21:18, Oleksandr wrote:
> On 03.08.21 15:53, Jan Beulich wrote:
>> On 30.07.2021 18:13, Oleksandr wrote:
>>> - Where that range should be located in guest address space, should that
>>> range be the same for all domains (how GUEST_GNTTAB_BASE(SIZE) for example)
>>> or it should be calculated based on actual guest_ram_base(size) for a
>>> particular domain?
>> The default size may well be fixed or amount-of-memory-dependent, but
>> I think there will need to be a way to enlarge the region for guests
>> with particular needs.
> Well, but why we couldn't just make a large chunk by default which would
> satisfy all guests, as it was mentioned earlier in this thread "as it 
> doesn't consume resource when not being used"
> to avoid an extra configuration option, etc?

Because experience tells me that no static upper limit will ever please
everyone.

Jan


