Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4755652202
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 15:07:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467069.726068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7dHH-0003Tx-1C; Tue, 20 Dec 2022 14:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467069.726068; Tue, 20 Dec 2022 14:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7dHG-0003RQ-UN; Tue, 20 Dec 2022 14:07:30 +0000
Received: by outflank-mailman (input) for mailman id 467069;
 Tue, 20 Dec 2022 14:07:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7dHF-0003RK-6G
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 14:07:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 704a9127-806f-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 15:06:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7013.eurprd04.prod.outlook.com (2603:10a6:20b:116::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 14:07:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 14:07:24 +0000
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
X-Inumbo-ID: 704a9127-806f-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYFmPlNag8j1pKp8jmtmv18xNQ5vyg5k8vucJOcBJN68HpNYBuz9hd2C7vM7Gw3XjTv20qt61JiPgHDv8tqT/IxBEwo3gKGATLZ17pF/HaVzS6g/nubwwFAFcVv3c1OzguB8QrVvXtLsDAtso3kdbzZ9a4+sPOetkpko9+8UIK+n76W65HU7OoY81C2WvqxyvbnsgKY0iNzMV/ALba5YBbunTdql/on1RBhi3N1ZCV/Lt84VGp5VeYE9l6i9uNJZbUgKDFCAP8I1Eolz2nRd/u/deos8VgHiEQSVwwGAinQmUoj75iiWU9QvF11f3q4ENhYM+1QBbo8aGu+u4tZGEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHb/kygaHtcEiAYhxTe108C1yCycsjeEDG2NwWnh4h8=;
 b=W9urG2CbZrObXzZbQa8RRz/SYEfcf0OS9TdeZtGUy5t7g5SdE08F9t7Gofoy9LG/FCVx/v0zAfzNybwfiCIx5cDpw2G4qGPdWTxf2T+1HK521eemqH/h9dLpELKrDndLvH5nwUyCa2vJO5oAQkw8SpzH+bNz19xly+TrnZtkKfszVxwFmIsu1j5E1qM5C2LJum+vD+hzOWc+PY9ushr3OU0Z9vg4xs9qXEsul3hJa1fDRq469qK21vIXxXM0r714SYRTYeQnvn4AI9iSf2wJd4vH9cHLa9FJljK+76WFCmFYu/6738DLW2OiTRZB22wgHwRTySaCML1Rm2fbybAmQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHb/kygaHtcEiAYhxTe108C1yCycsjeEDG2NwWnh4h8=;
 b=T7wKAPbUveLeXMh3cw0SqBrhbcAXIVNtRFvY+iz7zFD1Cw9lVj7zCbgEhDjfgrxWywspNNE7lDJ2mdzoJIyWCUcefNeiy6wJBzuJ01X6ijaMoLYAMS7zTscBvluoNynEbm8eG2BIeVUqKcL5OJXMnDaFpHl3lO+NRsXczC1l0QkQZDhDleR6H6B/Eiq/iBN4TCZIuvLpdNAENSayW/mCBG7ALjJO8UUfz1SOw7TAkEA723m4LcUvht9mNXb5Ljz4NUpePsqz2D4R1khU9A1xI2cj+si57/WLW6m5PBP6+2jAWBzotLMxYaQSHeBqwArOxLCwc7svrCWm/CEVZfLseA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4dbd1218-8fe9-c9f5-d530-fcd92c86dd5b@suse.com>
Date: Tue, 20 Dec 2022 15:07:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/3] x86/ucode: load microcode earlier on boot CPU
Content-Language: en-US
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221219144533.19836-1-sergey.dyasli@citrix.com>
 <20221219144533.19836-4-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221219144533.19836-4-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: b232785b-e2f6-4a51-223e-08dae29384e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z9DBQ2PSSPS0yGnA23K8nVxGoScsKQtYKpMd0uk/WKs4DBRqN8a4N7S09qt1VC7Qx9OWjg9cNBeiC1jJWFZTR9IBIXe/mBwKr4KaYnAo6lCw7driW9vtwPq3SHe/c7jImnz3ULjgvrsjY8hrgCD1yWmEOlwXCYJuZwOAl4C1LHVJC/tOW4C+/DtxW0dvLffC8DF4l4CoS28scdf/lFHpR0gxx6M7Q+hS/kTcVP+1EDyFKv8ikhKl7QBEEwhknciPpLhsLM9RWCR0P8tRGa7wfieKxCHV/r1Fy+g+e6UfEPLqoofn0YjR7ACe0OWk+49UheFQdBOxr37loNmqpKHxmyNN0E18Jygf018ZG/M6VDKZ0K9MSx3xgvUzzQNJcFELnIz96/9d/ZV2QWvtTQXt2Y3c7yY44s2yqm5ZuRNDiUuIvJvFPsLLJk94z5jwRmEBgfoVm6yukmaAH73gzoLH3QV8XZf3ObE3GWb0fvva2Xlwvr2rJ9tcevM2ZH7Ud2CKgZttowtoAGB0Ox3FC5fjvt1+wVlVcYzldmmfbZpYZK6AVJ9sakTDI91Ukh12shJIfV7lJHd+w7q4zXFQ+B3xZmovax6ao3Eq14wVSU1iHVLAKxcOSBX32LGN5wnyPaU0sVsOfHbpHROnfoswAuX3Hz8zOls876B6zwYs7pC2vD7SPkt203QxNqjymmzO1Do+aVWkR8oyFE7auR5EufZVDDJs8KTNtHMS/w67/Zpae7w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(346002)(136003)(376002)(396003)(451199015)(8676002)(86362001)(66946007)(66556008)(4326008)(66476007)(31696002)(54906003)(6916009)(83380400001)(6486002)(478600001)(316002)(38100700002)(31686004)(4744005)(2906002)(2616005)(41300700001)(5660300002)(36756003)(6512007)(26005)(6506007)(186003)(8936002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUt2TTRYeG5nS3ZIT1BsSHJMeWYvN1lUeCt5K093c3FvNW1SRGJGdFBHcWtO?=
 =?utf-8?B?MDdjUTMvZEhTQ0NmeDNnZTN5V0JEQjZDTFEvaW4vM2NxQVlWNnhnUnZkVWQw?=
 =?utf-8?B?YUx1SmdVSzFwQnlGcXdjck1FVnNGSWcrNXBBMmFuU2haWllTUVdtaWxpRGNP?=
 =?utf-8?B?N2J2Si9YRkwzbU1xaDVScXJ1d2JDSGJoRDAwYkhXVUlXckpiMDUzUlplV2RP?=
 =?utf-8?B?bnR4eWhUU1NLOEw2ZnI5VEp4MWZoYW1GMEZWdmRqUUdtNTNyRFVvdStmSmtY?=
 =?utf-8?B?YWJIbzRESzlQMXBsWHNqYkpESy85NXZnREdsUVFzaW11VFZzWUJXSGxKOXlL?=
 =?utf-8?B?c2s1UlpYSEY0bkw3VHlLTDJyVHdzUFJkbUtGVEJQOFF0YnRtVmNLbzdUOVFD?=
 =?utf-8?B?dk0xTmZHZVUxRHkzYmNxL0w4amN5c2RHdG1IVmExQ2ZWVWtaaUQ5OWRwcGov?=
 =?utf-8?B?S2xGOCtZeTNUeXhqaERWY050emJTc0gzZ1JTQWtBRFFIWjZsWFd6NDhIVGlH?=
 =?utf-8?B?L0prUHRtei90WEovOVRvajhjZ3NDdG1kSGltYWVvcWxiVW5peG81Q3R5VldT?=
 =?utf-8?B?eE91eWUwcVcwcFU5bkIrbVlEdURtN2RTN2FrTXUwTGdweWhhMTZGVFpPdElI?=
 =?utf-8?B?eXdXM0Vrd0U2TGNubzZKVnlkWkRFZHpaQ2svQ1NUamc4eFVXQVluSTJPVytC?=
 =?utf-8?B?WUVnekEzRHh0T21TY0hhaGVZdkgzOStNbU9OeUduVkZxMHBpWXZ5YmlxL3Nr?=
 =?utf-8?B?NnFWKyswSlFpbWl1aFBneGpnUUoyV20zaElMbXNWREwzaC9hNEJ1bWd6eFpH?=
 =?utf-8?B?V1g5NmI0c2RNYUptWDkrZUN0dERKNUVLUjRuUlhSTU42VCs0S2hWY2cxWTFu?=
 =?utf-8?B?RlNaVTFvNnJkZi9lU0NpVm9kWkVhc3dqYmVVMGdmUFRqeE43RitPTm9aOTBi?=
 =?utf-8?B?a1VPTlREQzhEaHNpRFdhb3ZGa25YWEZVbGJUMm5qQjRDVFBkWG1YT2FSVkY4?=
 =?utf-8?B?VzJ6SUNjNHlKbEZ5am5Dck9CNU9vcis1RG1DTVgyV3k4YkdSOHl5ZjVLZFBC?=
 =?utf-8?B?YmlYVEhoYTNIeDdIUWV6dWpGTVg2b3FMOHp6K01PRGpldnkyUTZBTVpBeVdy?=
 =?utf-8?B?cE4rcytQZGVQTm5DNDREcGxWWmxrMElHQklGeXBqdEloajdzUGpsVGgyQUpU?=
 =?utf-8?B?NEcvVk96eUsvdkVMVmVhWnlYK2JVbkhBTi9xK3RNOGxoeGZRdytXZ3d6Qyto?=
 =?utf-8?B?VnhYc3pvbjcyL2ZFcWZTVW1MT2M4aklCM3BTd0l1NFozeXNsdHZTUzNJRk5j?=
 =?utf-8?B?RWhGaE9KcURObytHbWtCa2pLdGV1NENiblMxTW1adURlV0FkSUxWbDl1bjUw?=
 =?utf-8?B?UUtxaE9ha0ZpVjdrSEMrNGpxT2szajYyRlFJdUF3cUw1eHVvZmlnRTNBVFJy?=
 =?utf-8?B?MDc2bk5PMGRDcm41blFYZlZxUkc3WDBlQ09wVTdRejdnWEwzUDdwZVBEbm4v?=
 =?utf-8?B?VkE1UGl1Y3ovc0FWVHBVRzE1VWdjdUxJZjl5RXVKaHUwNVFXSGFMUXdiZ2ZL?=
 =?utf-8?B?WmlqTWt1c0U0RnJ1ZVFtMytPMnU5d3FjWENXOFh3dUJZRStJQk83U09yRE1T?=
 =?utf-8?B?bGhUNlY2KzkzanZ0THRPT0ozUWhjaURpcXA4dkVxR245ckswdFdYU2trSk1W?=
 =?utf-8?B?UFBPZTdlUkZGclVKQnVSb3BqZU1BYWt2d2RqSDhmT1dwOE5lNmlOVzBWenAx?=
 =?utf-8?B?TmxxUWNMS2pWZWcrMk82aEtjUSt1SEJlZGh1V09FNUpVN25mbTVMdHZ2K3Ny?=
 =?utf-8?B?RzV3eXpTVU4vWmZGY3ZxdExISW4vV3ZaV3cwZGZnc3c2NGhYK0hDbHU4Q0Jm?=
 =?utf-8?B?d0w0bDNEY2NYc2JYRWlHdTFBRTErVzlNY2tBenB2RkVqS3FsMDhtTUZpSjY4?=
 =?utf-8?B?MTRlcFYxMEo3VnNmanpZKzY2d05FL3NrcFVicWF1QWhMRHYrSTBGK3k1d2hD?=
 =?utf-8?B?MlZpOGVLZW90NE9XR2dWL3Z1UXpabHhiL0VKSDdhZ2xqSFZwNTJVL2VBRWdp?=
 =?utf-8?B?RWd3RCtBbWErRzNQNlkrdEpOd1ZqL05Ob2htNDFabmt3MkhHa0p2d29HSmt3?=
 =?utf-8?Q?tP3gquCaV6MBInP2NHBCHzVJt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b232785b-e2f6-4a51-223e-08dae29384e8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 14:07:24.5471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Ri1NQSDwRu0QGgq2zOxgGWaboxPHcUvsWN7bfhm+BhUxOvoAyQt1fUWQkZV5OLD8s1IgrJb4UnzfzLCsuS0pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7013

On 19.12.2022 15:45, Sergey Dyasli wrote:
> Call early_microcode_init() straight after multiboot modules become
> accessible. Modify it to load the ucode directly from the blob bypassing
> populating microcode_cache because xmalloc is still not available at
> that point during Xen boot.
> 
> Introduce early_microcode_init_cache() for populating microcode_cache.
> It needs to rescan the modules in order to find the new virtual address
> of the ucode blob because it changes during the boot process, e.g.
> from 0x00000000010802fc to 0xffff83204dac52fc.
> 
> While at it, drop alternative_vcall() from early_microcode_init() since
> it's not useful in an __init fuction.
> 
> Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



