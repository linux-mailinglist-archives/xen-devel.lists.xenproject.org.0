Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4065673C9
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 18:04:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361458.590999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8l1e-0001oe-91; Tue, 05 Jul 2022 16:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361458.590999; Tue, 05 Jul 2022 16:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8l1e-0001la-5O; Tue, 05 Jul 2022 16:03:46 +0000
Received: by outflank-mailman (input) for mailman id 361458;
 Tue, 05 Jul 2022 16:03:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8l1c-0001lU-Fk
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 16:03:44 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140058.outbound.protection.outlook.com [40.107.14.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ad673ec-fc7c-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 18:03:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6552.eurprd04.prod.outlook.com (2603:10a6:20b:f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Tue, 5 Jul
 2022 16:03:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 16:03:41 +0000
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
X-Inumbo-ID: 0ad673ec-fc7c-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpNuZtte6025YRrJe5T74vtSpwW2CJx6qOq4C8j6Ca2qs05vPXakjY1L47yDChzk0oJsgwsTTpcqgDrXfmKyIfZQwdgYwxmFW1IdfXiZScq1k9BiasPWuNWjaadmYJXBLBA9kM+JDJ1w8ySPoEiT58WXwQ8h+eGM8WnpmRLhomw6eD+CDlMsOND6ZdfDGIVWxtdwtrHXDdH7x8f6l+7kKEo/c3Qz4HWbXn7SJds/vh9kLskxgQQUBjBDRIN3nTNkX8DPvBi+xlxb0OBGpmsqYMa/7XmWhKxBqcySEvmLkxcVMmNjiK3nRlGbe0FRcXR0vI6hXmIrJ0y0VlRDaRAXQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Te3OjBPPCuEBN9Gih20oWOXZs8YlVys00XqJtm5VLUg=;
 b=T2avtRx2i5XUmz/jNC4s0jmbdFBinYRDdZS0kISoH9OhBM8+v0Leaz0JkEQ6I+cPDMKrRhVXmoOfxloc35krf1FGQU2wk9OkOMWUDTx72FyiXh6n+r2CsebO3kWmnZMnXwc7p34lwaFH7NoULBnPC6yS930rWij8+4HzZaD9P1ZdFvMEnyQwDovFP+PWmK0BnFppPb/N1DIPhVwgcY23bPwVJCSpvR++PDL0TFfjNqiX269oAy7X1WH3WvwCWdrj6cJvnJ6D2oPuhUuoQjj2BG0ba9AzvjGBNFtVTnN61ksRgX1B0wJPm/7iEi861qahrNlVje/nuAbBywmA1QmbAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Te3OjBPPCuEBN9Gih20oWOXZs8YlVys00XqJtm5VLUg=;
 b=BXCyjashDR7lmlbEpY7Z7eC5Ekwfo8viQ4jxxbmJdkTuFpv/hirVmryP4qGsNm60+2Oydx2hM7SXSfXREcV4TkRMlUzdWC7JUkezUXDC2L5RWpbXRAtyV8sfgAhnRvwWkfDSItyCc43CKl4CfZvpu6NbQP80W8vLmsBClliyPA40VRRSV7RVmlU1FrfPIHTHxsCRYfn/M4w2yF8d51BvsYh5BVCzaHTrgvLTxcZS0DhULxtuKJehBeETf/p+/5yZCxCJ1iJux/VA02bLY+MoVd7bkBk9J8+Jy8NaVXD+qWlJ9EPOFzL1cP9FywQv10IPvX0lycU7x4B88ttJE8Cexw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9916754f-b730-6201-5225-167995f69b51@suse.com>
Date: Tue, 5 Jul 2022 18:03:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] EFI: strip xen.efi when putting it on the EFI partition
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <79ebbde2-4be8-d393-476d-25326a2aa327@suse.com>
In-Reply-To: <79ebbde2-4be8-d393-476d-25326a2aa327@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97d47202-8028-4725-bd08-08da5e9fee08
X-MS-TrafficTypeDiagnostic: AM6PR04MB6552:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wuk/Z2Rs21i7uIBtqoPleyeaTPRFK2E2S7KQd4zPTt8SR6p8wLP96PNYs90e2zlTn+KLFa1crJR/tT9ZpP/JqnI+MSdwCrXxMLcB8BSPnyXYyweYqUB7abwnvfd2u0VFtwcKTt7DdxG2WaRKeQQearVchxgLvc9FU9hjzQ0ulec0Yw+13oU3XEardiuQjsoBOBMqZbctjT76WPbOFXw3hnN1GtgYCjFi5wfGKraM85+35nkwIk0NqPRcnk1iHk9cTMpLzoM21s6T5Oj3PnsPtmcc/Do6FxXUfuG+JdsE2lrHmqzt0OZsfS82P486gV+Hqq1Oi4F4emqbylVWenSYWuyATjhcWMIh942e4j/dz8dOH/lCO9a3i99RtrMIzsLTK9wgK3zL2pB5Xqn8MuJBudSmMs3f2YxfmMYvGXnJvmFnMaDdWtnUh55iAJ35Hd12tXP/AaWdjCDnTvxvaaO+Vg3JG5pBDOeLbyS90/XF3SH6mnGBP7DdRfA0zACipTrUcUN3NX1VPXYTziFYexElIRrNzah0qlto2X0Lisso1FEcYKCIcwH9kf7L4qfWM8HrnZzR/7s4GVHp5bUAKrTtLeUbYSAMURQaZemRkGEfZSvV7DCan/XqE2hav0ZnSDbv1vhYvvxJcVdKgvUvsWeZGGlGRuBDsLzj1dwx2j3KNIdk2gj3qDmZaszV7cHkHtovIvUpotnWMvqoPJzTvohKAtBRXTM4l6XZxhNQhSdoQSKDV+O8veExRr7ncBsLExRgQ72y7SpQFmhWuYlWzW/HLIO/vg9EJDBe/CUx4vCZgHImjgkpEinBRYwr9zdUCdXIaBw08TsL8zCgANyaJ5i08bkXOvwddWTTWM/L0GuFNv8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(376002)(366004)(39860400002)(136003)(186003)(83380400001)(31686004)(38100700002)(41300700001)(66946007)(316002)(478600001)(6486002)(8936002)(2906002)(66476007)(6506007)(2616005)(5660300002)(4326008)(53546011)(86362001)(26005)(8676002)(6916009)(54906003)(31696002)(36756003)(6512007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDcxQmFVR3FZWUk3QlNiZzdVSm9kZm83dURsSGNnSW9SNXhFS3FGdEdKMXdY?=
 =?utf-8?B?UlpmalF2dU9vei9yNWN3bm5udjhRS2IydGJtTFNHQ01wUHhFOEQzTkxDUDVk?=
 =?utf-8?B?NDEwZTVZdWg1cVUwSjZBeXlxbnExdW9aU1hxU0lPS0xjWDc3ZjFMWUl3UVBY?=
 =?utf-8?B?aittN1hMMUprRjB6MHVrYzNHaFJLcGd6MlRKcmt0RmFQMmFQUkJDYWZzdkNU?=
 =?utf-8?B?YTBVNiswN3g4ZkFZQ2RCSGtYSWVzQytHZko1VlFxL3MyUFltU00yOSt5RXU5?=
 =?utf-8?B?YXZKdmptcHlIK2J0WDJSTDY0YmJWbVZJQjgveWoxT0YzZ2FIOHYycGFJSmpR?=
 =?utf-8?B?VldFY2ZEcW5FdzFObnAweWtjL3ViQTNsTjR0b1BBQmZsbm5WODBTZ3MxbmNP?=
 =?utf-8?B?Qm45RE92Yy8zNmVxc3ZSckRhckovSkFNTGFSalRnQ09Qb3Q1eHcrM1M3M3BB?=
 =?utf-8?B?WjdGbFJkRTBlK0kzdzZQMEZMVWtGZjZyNVZtQWNxenB6c1JjZ2laRFQ2cm92?=
 =?utf-8?B?WnFmQnMyTnRPQjJrUzFmekxZNWtLQ1owM3lJMDRNQ2pyT0VrZ1JMdmNtMTcr?=
 =?utf-8?B?aGJ0T2xtYnpsOFY5VFl4MHFTalFFeXhrZGhZbkVZNEYxSmVCczBjNXZxWHF0?=
 =?utf-8?B?cTRlMFR3S3Y0dGFrVUZkQXFVMGs5Sm9mYXhoUG9oWGdkZDhud3I1WE1TTi81?=
 =?utf-8?B?RXl3VTRBbjdDNVVZeUJUMUNVRG5veU9Fd1lUMmpDeEc5bk9vTUttMEFmalJz?=
 =?utf-8?B?MWV0aUQ2VzhpUXVlTmtmOFk2YUg5S3liQWFncTRYc2JOT1gwMVpmNENCQTFv?=
 =?utf-8?B?VjRkL25aRDBZVGxIeVNyOTJ5Qkp5TEwvYi9yMGFZQlRCZm4yOVVieGs5Rm1a?=
 =?utf-8?B?bDVOSEV1SU5aaXA4cSt1dEFRWnIvVUF1WEd4RklMOUk5U2NDVzFDMG9CcVpo?=
 =?utf-8?B?cGpMYmhvN2Z6VTB4czF0SXBXVHJvTDdIUzBKS3NIQlVSV08vVEpoVTZTYy9s?=
 =?utf-8?B?WXY2SFRuSVdTRWYrUGNpRDRncktVdmZuWjc4alh5ZEx5b29SbGJtcTF5Zk14?=
 =?utf-8?B?ZWRVblJTWXcrc1RWYlJCVTJjTXRaakZYQktuWTcyazAwOURhcTgyaU1xc09i?=
 =?utf-8?B?M1dQamVZWHhsME53dHIxWGovYWUwOXR3N09pdTI2eEVJOE5OaUltUitYU0M5?=
 =?utf-8?B?M2hpUVF1ZUhiTjdpa1N3RGZWUlU1b0pDVnJxcHlaY2krRUNiYzYrSVhHMzhE?=
 =?utf-8?B?MkNXd2t4RExxTWQ5Ny9odTNOZWs3RCs5UzUxWTcrV3NIdU8vWDNja2ttcWFn?=
 =?utf-8?B?bWVVTVJjaHZvS2dSTUtFVCs2M1UremR6dFFWVDE0YXh1VFM5L0pNVkdKWXJi?=
 =?utf-8?B?QXNXendBeHhQU3hYc2hxRCtLQktIbE1tOW0vWTIwN3RlcEVMU0phY1BPYk1B?=
 =?utf-8?B?Vjk5NnFxU0V1Y2RhMzY5cEJURkozUTBLNG4vMnhiT3JDUnNRY2JmWSthRyts?=
 =?utf-8?B?YmV3Y0JCMmdpTGFFTFlsM1ZnVEdnNVlFMEgvNUxFa1NvdjdSanVGUkJYRkVD?=
 =?utf-8?B?S1paa25PMVZnNWk5c1h2SHBvVDVLSEhjTzFET0xsVDJJNEJ6dTk2RFZvMkI5?=
 =?utf-8?B?RlllWXdlODBqTkQyRXJvZjFabUh1TzRiZFVLK1lxdzFhM2tnRWRmWEpGWVYz?=
 =?utf-8?B?MnBXU09RcFN3dTgxd1VSVjJoUFB3SVROOTdxNk5hdSt6RXJPK243SDZSaDB5?=
 =?utf-8?B?QUV4bkh3ZzVnZnI3TXJ0NjBmYUR0WWozMDZvejJwSm5CTXdSVUxNaDdtY3hX?=
 =?utf-8?B?NlN3T3B3bkdsSE5QQncrN2tJNmdNdzFFTVJHOHRzWmpEdTVmeTJrNFRJTjBm?=
 =?utf-8?B?ZFN5dEhGWTJ0amVuRTZSNytZK0lJOG45eUpYcTQzb29nRjMvV0I2MGQrcTBl?=
 =?utf-8?B?bFFFaG8zeFFrYVl5djBGcDhhVitKVFlZZHkvYWhlRGdjRm40RzlSZUZVQits?=
 =?utf-8?B?S1VRWmlPT1BaTHNveGxxdFFIM2VtUHJwbnBlWkJXNlJSYVRvdE9UN1ZjSDNh?=
 =?utf-8?B?aGliY2NScDFRQVV1MWZrZzZndFFPaVhzZUlDMWV6U09nRVdhNmZuT3lRZnhs?=
 =?utf-8?Q?Bwu/dkMY3Oocu8xPYBFbu7jxI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d47202-8028-4725-bd08-08da5e9fee08
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 16:03:41.4269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jk/jlBQeaHAZ6fYIj2+1u6W9TfbZ3gYl10GO2MoqhthwN02uwyl/r7BAqGCgUnQfZrzCJlyUaCY7dgIbW5wHUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6552

On 09.06.2022 17:52, Jan Beulich wrote:
> With debug info retained, xen.efi can be quite large. Unlike for xen.gz
> there's no intermediate step (mkelf32 there) involved which would strip
> debug info kind of as a side effect. While the installing of xen.efi on
> the EFI partition is an optional step (intended to be a courtesy to the
> developer), adjust it also for the purpose of documenting what distros
> would be expected to do during boot loader configuration (which is what
> would normally put xen.efi into the EFI partition).
> 
> Model the control over stripping after Linux'es module installation,
> except that the stripped executable is constructed in the build area
> instead of in the destination location. This is to conserve on space
> used there - EFI partitions tend to be only a few hundred Mb in size.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> GNU strip 2.38 appears to have issues when acting on a PE binary:
> - file name symbols are also stripped; while there is a separate
>   --keep-file-symbols option (which I would have thought to be on by
>   default anyway), its use so far makes no difference,
> - the string table grows in size, when one would expect it to retain its
>   size (or shrink),
> - linker version is changed in and timestamp zapped from the header.
> Older GNU strip (observed with 2.35.1) doesn't work at all ("Data
> Directory size (1c) exceeds space left in section (8)").
> 
> Future GNU strip is going to honor --keep-file-symbols (and will also
> have the other issues fixed). Question is whether we should use that
> option (for the symbol table as a whole to make sense), or whether
> instead we should (by default) strip the symbol table as well.

Without any feedback / ack I guess I'll consider this of no interest
(despite having heard otherwise, triggering me to put together the
patch in the first place), and put on the pile of effectively
rejected patches.

Jan

