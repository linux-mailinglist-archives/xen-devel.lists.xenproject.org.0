Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6034145F4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 12:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192420.342848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzHR-0004XY-5U; Wed, 22 Sep 2021 10:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192420.342848; Wed, 22 Sep 2021 10:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzHR-0004VD-0m; Wed, 22 Sep 2021 10:15:09 +0000
Received: by outflank-mailman (input) for mailman id 192420;
 Wed, 22 Sep 2021 10:15:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSzHP-0003Qi-UA
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 10:15:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b658017-5ed3-49b3-9ed6-71c69138d307;
 Wed, 22 Sep 2021 10:14:54 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-QG0FgcmDMgu6Vkw0smaTbw-2; Wed, 22 Sep 2021 12:14:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4189.eurprd04.prod.outlook.com (2603:10a6:803:3d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 10:14:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 10:14:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0093.eurprd02.prod.outlook.com (2603:10a6:208:154::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17 via Frontend
 Transport; Wed, 22 Sep 2021 10:14:46 +0000
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
X-Inumbo-ID: 9b658017-5ed3-49b3-9ed6-71c69138d307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632305693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xeX058YAZuLlrCWZaRoSdAGTp0Uj3/VBmybKo4LJZZE=;
	b=I2TmtXtDBGokbOA3Nu7o1bZKTJSkxWFu2SXPtucSAcxEjB+X7iYRcsjnnqro626ub7LZOp
	jVObcU6Q+TQxAxsdgvBnGcFJQAwQcC/WDf0ffPMV4p5SzvsZ2w0r57hvLUGf/2uoeHGRHK
	NEyxT5kzY5NwrdoV0EmATCS4AvAYXlQ=
X-MC-Unique: QG0FgcmDMgu6Vkw0smaTbw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6B+IyvVIKuhEo6kGSOyJpN2DaQVNfEyp1fi8Ef/L6wgywwZox7xHU2nSUGYDYpvNNWDjqD1qQnaH0FZ+EHhbhrsD7yFHaJsPWf9LVZrSQ885iVQi4dH0f6KwXOi/ZpthaSjVVPwtWkEsWILCpsf0VE7aW5OUaGKIp3gdxfkLhA5vSGBqFe50UCu3hYi/sVayl+5wW5J9k/yrp/9sHBgbJki1JsiHwqffqT/zeJjJmGxQ5GqMt5hjip5nAZMPYiL9tRq4wz32aTKmNcnJzGIH1OK7AEjwP0u+d/AQ8yGXy+LkbmaCbgg9ig5DYT5qql9ciVN29ODANOdkub5t76BeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xeX058YAZuLlrCWZaRoSdAGTp0Uj3/VBmybKo4LJZZE=;
 b=cureU2AMal3wkR4YSvKLHktYotH8m0+cCrWWSyYnAIGTKr9pQ238i0iLKX6aKkwvS4QAl3BnzMxPHAmVBtFmbNh1vWB3NAxTH6K5fimBZ7BpzNIormzgYlXFarS1BnGscw0lDfB5z/wOmYiJ7JLELIf7bsBMIlwO8N6tiONlWr+/4f7mI/+2k4LZeDf++LyhBLNZdMaHbbP2cdW3r+EGup2/lc6mOIyTg06cDlds/35gi7zkW8qaIALwRA3/7H4kukzqwTL8eEiW4qpJ+XCJdAyb3evSAWXHotnl2DGMNjkgv+++RNRyB8Ec/vDciUiZyipuNIwb9EOuR3FCLEZvyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 lkml <linux-kernel@vger.kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] xen/privcmd: misc corrections
Message-ID: <0f0db6fa-2604-9a0d-1138-0063b5a39a87@suse.com>
Date: Wed, 22 Sep 2021 12:14:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0093.eurprd02.prod.outlook.com
 (2603:10a6:208:154::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3ea3b95-1d9e-4b71-559b-08d97db1ce22
X-MS-TrafficTypeDiagnostic: VI1PR04MB4189:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41894356570686D56128829EB3A29@VI1PR04MB4189.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MhtbFWLhrDZmYZwL5r/W7e+thwRoWaWtatT/JHViMFh2z70yJ2DZGHESjQ75WdGiBTjeCY5ZPuzQD1P05tfHzjG83JsmZ4UE5R/29LSgM6u7Az+3HwEcye5wphzDkITxVpexvMb78hG7n8fHVl0fL7RXvTQrd7D4EAWa54W+LZomQjKAQQC6vhBD/HS+7sy+gp32d5/LbdMhudI5P1H+dAegk2PseW2Qc4DdPJ8y6pY3AuCApHRGHQLLIhw1x8uQ8xQvZn+fO60pA5pBBmnEFFJ/LMUAXPcc36JM6wV9Q/gZG+jZ1vYTK5y/z61Awpgl0XxAM1+Ve8xu573K1GpY9/swhYk3vYkkmfNY0nVoWacUbXC78L1dlwSraBf6T5X+2gt/jvvs9AdjWOICc1gBl7x1ObOUCRfb7lezclTAy33UhfwoOBGF9QH8eAGtjNFF259zEL1DdW2mtI4wZ70+NPDs/BenbGZQgWvJO4dfu2NzImMUOr3OhDwANc/G3niVmnt4QuYCJfq2sJT7JlBlO1iIZfVZAN0D/b6m52wb4cm7Yz5PBCXDkmje09anaFsyR5N3e2VqgNCUtQ+J6G+LBZ/JN3rs95hMoNTdKguvZe8JLc5FGgIqS3hWugc+ocYmz4ZH7syDyUEGQJwbI0PnSc8TaisBe66k6ukakpua0zfH4P0XIQYP0znuFWJQSFG+qLBdjNGY6FmyOzKOP/KR6MjpY4es6aDXgRJnGM9jOm0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(16576012)(31686004)(316002)(54906003)(36756003)(8676002)(2906002)(186003)(6486002)(8936002)(508600001)(31696002)(110136005)(26005)(38100700002)(4744005)(2616005)(956004)(5660300002)(4326008)(66946007)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFQ4dzlRQ21FdmNaYVVjUEFXbnFhY0FXSjFzclRacXdoTE5hQm9PQUg1aWVv?=
 =?utf-8?B?bVoraVVLWi9hQk1Zb3VtcGVyYlZMKy9vVGJ6S0Q0OTNNZjVxMEcvTDV6S09X?=
 =?utf-8?B?NzZrSjRQWTVIUkh3RGJ0dFFhdlZBSHdpYU5rVml0dGlEbVlsSy9ncjM0VkZx?=
 =?utf-8?B?ZFpDVjFtbTkvMElZMXdxdmh1Y2FDcFhSMVJQVXJHTjZvemo4NC9VSkNoYkJY?=
 =?utf-8?B?VklveENqRW5oVVlUbS9ZdHg1Z0NRVG42eTd3SWo3a2VLNHR4VzNDd1NnMHhG?=
 =?utf-8?B?V25pTTFPZjE5c2xaRkRMRW11MmgvWEVFb0J6ODV3NTJKdHBnY1VNeTZpNlFj?=
 =?utf-8?B?YmZ6djllaDAybk96TUtZS3JoNk93YTAzU1dwb25mM3haUFFVWGpHRTFaV2F3?=
 =?utf-8?B?QnFiVGVjdzJaYkswNzRSZFlMWGZMclF6Y3UxU2ZETzhXZkM4KzJzWXdTem9D?=
 =?utf-8?B?dGtKV3J3QVhIUWFpdmlkazNSMDNJUU1YOXRocUlkdFhTL25aY1ExYURPTkU1?=
 =?utf-8?B?b3IwbU1GeU1IREZUYy9Ic3JSVXNPRG10OHhjbTQ4QnJKS3U0N0pLM1lmbld0?=
 =?utf-8?B?aWNNbzVhKy9SdmpmOHZOZmhNdGVoVDE1ei95RTkyQkZaTDYvMHo1R0ZRdVk3?=
 =?utf-8?B?M0tQSEJnNEpIMmxvZlZXS1N5dll0UzE3SnpVSkUrcXhZeWpDZnhqR2lYTndD?=
 =?utf-8?B?ekFNSWhUUVhRRVZEQ2YrU2o4TldhUmhoQ2xCWjBRVFZIMGNyV3pQQmlHNUZK?=
 =?utf-8?B?TGlUYTlPUG9YYk0zN0tsMjZKYkJwTnp1K1oycW5iNWczaTIxZUs5NE52QTdU?=
 =?utf-8?B?WlFWcWVyZjVhbFAwTG13OXRvR3RpQjlBTXdqOHprUXNpQlZiM3lzcnQydk14?=
 =?utf-8?B?UG13aHA1Q2lVZ29zcHhSM1Z1bzJJUWp4YnZyRXBQd2VIMDNGMHBYM2FqbHh6?=
 =?utf-8?B?Q0c3QncydWpqWkUwejRuQzRDR2kzWHZINU1LMXduTkFDby9IQ0xtczFrMDhi?=
 =?utf-8?B?dzlOa25NNkhzOG1LSFBKWFZ5bk1YL1lyYUdVaU5XZGZ2RmRXajFLNXBiTlN4?=
 =?utf-8?B?Q1I0TUZBWGd4akFMQ3NTSnJhd3pTR0xWSUw5TCtoWkNmYUxWOFlVOGpPTlZD?=
 =?utf-8?B?VFhhS2NKSHlJVGh2djhCbnR5eVhyMmVEZ2RIUFhWZmxOZTdVYm1ncjhMejdS?=
 =?utf-8?B?WWZUNkx2cE9LdDNieloyeHR2dFpiaHF3UnQ5emhYdStmaVFnQ3BkanF2RVkv?=
 =?utf-8?B?ZFhsK3ZkUlIra2FqOVYxZ2lIWlJldWl1ekJMRUFkZUVBZ3VqdnhrYjE5RWpN?=
 =?utf-8?B?UHE4L1JkdWhTcXZGZG1qdHNGSGk1Z2d0U1JTWmFTUWUzaVdpOXBaQktCQ0xT?=
 =?utf-8?B?bW5lOTN6azNiSm8vVzE3RHdhbU9wSHNZckVDcUs5cnZIK0diUUR2K2Zpb3Qx?=
 =?utf-8?B?WFUxRjgrbUZpUTRBb3B3VE8veGVlbTJNSmxsNS90NnF2MmtpYmYzSlNyMmtJ?=
 =?utf-8?B?RTFtYlY3Y3ZnbXVMR3daK2c1TDhhWWVUZkd3V3lrV09LbHdweHJJT1psT1I0?=
 =?utf-8?B?M1hEbEhVYS9qVm1OUk9iUnJYL09RR3VUUjh0eiszeXJ0bkdrUk9iQmZsZTh5?=
 =?utf-8?B?TmllZlZQaWpoeU1WOW9UcU9teXJHK2UyOUlwRHlkMFpZVm9FdVNkK1hZQ3Fm?=
 =?utf-8?B?Z29LdDJhV2p1V0poQlQzdzlJSzIwYWN6K0VOQy9EOVBwVmtQWElmN3kzZFRX?=
 =?utf-8?Q?kYAiwN300xFOv1D8hpnDfSnTY9SZo4GHpRp9xla?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ea3b95-1d9e-4b71-559b-08d97db1ce22
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 10:14:47.1695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LqgbeM9laLAwVbi9EzYOovfFCFxaCQcSM+Ksj0jrBS6ReAwx3OA3VoedFXlvUsad1T3xH8SXAsLtHhDdcBv5ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4189

The three changes here are largely independent, except for a contextual
dependency between 2 and 3. Note that patch 1 will need actually testing,
on Arm.

1: replace kcalloc() by kvcalloc() when allocating empty pages
2: fix error handling in mmap-resource processing
3: drop "pages" parameter from xen_remap_pfn()

Jan


