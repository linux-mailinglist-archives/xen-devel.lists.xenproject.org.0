Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5FA55B9DC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 15:23:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356666.584959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5oi7-0003Z1-In; Mon, 27 Jun 2022 13:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356666.584959; Mon, 27 Jun 2022 13:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5oi7-0003Wu-FD; Mon, 27 Jun 2022 13:23:27 +0000
Received: by outflank-mailman (input) for mailman id 356666;
 Mon, 27 Jun 2022 13:23:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o5oi6-0002yI-C2
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 13:23:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2063.outbound.protection.outlook.com [40.107.22.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 507ee545-f61c-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 15:23:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB2748.eurprd04.prod.outlook.com (2603:10a6:3:e2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 13:23:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 13:23:24 +0000
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
X-Inumbo-ID: 507ee545-f61c-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7sWOYpubU/GlBKtSowUeGsxfLxvUBOmjRAbMBGH4k5Z4BKkdQUm0/WsFi/eFcCwq37AJaJm1U2MZeNed3LhbuMXY6iyhYHaTwFQInVVatNszLSIySpbveAGQ3SimBEypd5meohy189pUUv0bOFmGV9AuQC4IjhSVW8AYwmB20FQgxTYPv+svNsDK/UxYoLvNgZwtifCi2PuQZXKfKq6kK4F9qVVjCzvQhfb/wOCoOKViGFTdh0Smg0aEi6kHjH4hEuTvFJ0ZpaSMQMO/bZLS0nvq30UI9Xe5vof3ICgu5jDR0mYQtXYOdrq7UvTwjSueXjABDaTaX0pFODTKTTc+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ezhv0zzQ1+MrV7DdGElOA2lWszu1wIz+Y/fSWeyX8M=;
 b=itLvU9g6h1Zw1iafwYpYCT9nyZEHEz4Xu1pAVqMzK5NBHab4mSs4PX5BNbopMwkNXYnNfOmMEkwIvz/1sdt3qQwpVYiiwJxq+6HsgLpOe8mWYK3APHSByE4AA8Ge+c68+UESkvKKTPUJPeO4JkKpzqdqdib3aqIYST6r4RaYdSx+KJn9mRFzb1pdvRCUMlaOG3G1G31e/GTKuYI8aPOqAaacxncg/V6Sb2Mwdsajiv9bwRGVy1Fr/E2yBQITXeDqjfZboFkyoZd7IZ7+VDMKdmwPsg7aE6/DhGBPGFtalo5Bk3etT/Ybn6OGzJThE1aWAhLnEoXkq05C8Z6AFkgFUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ezhv0zzQ1+MrV7DdGElOA2lWszu1wIz+Y/fSWeyX8M=;
 b=qmP3OxMOACAs2Q2CXsMIDQgeaZzPY/N6u+bUqC5PtDw6zIFrU8KBes2lvsS3IML7igKDPGW45EXoIqckfRFPfem4aVT/TnJr+P0wdPn+KVIrCOsA8hQPM0DEy+7960VY7j0crt8ms9dDnmw3RLfqBMCNXtOzTsYlPMqTlJe9RnJ3fPIbir4BLL7evQoHYz+Gtd44hXntXiULi928umAQXU3LBPpmQZVwvjR4QX5/qA+Brszr0qBtFZK4Mo8wWBQopRzHQABHoyCrdTkNfVtCsMbqJ8akqt+bcQ3sJ3S24TTq1OHBaEGbwxl9OzF+sE97ee63N9vczlgcCcf/i8RrEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b34ea258-c967-7e6d-9ef5-6c974f252082@suse.com>
Date: Mon, 27 Jun 2022 15:23:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/7] include/xen: Use unsigned int instead of plain
 unsigned
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220627131543.410971-1-michal.orzel@arm.com>
 <20220627131543.410971-5-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220627131543.410971-5-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed9f7271-89c4-488e-9440-08da58403656
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2748:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pqs/lw20zceXBR7wbvYO4g5Ky1Uf2djaUH/QF5aqV3SwZIhD0tE9EsmnMFmVuEsPX4AD97nGo8aqhIP+cyP0NZqwuczUqAgcuShygy+zBwNG8F6SjUsfL+NYbfOu6p8HDjbb6yE4hZZ2/95NILzKpk4f6tJJ49FQXhM9SP4Z+b7luShAE9rBpxG0lU4bAXXzPEyz4AAk0rPq7TVM6JwF1Z18fm7IM/QudlJGlcpROlyOCW+QMgqW1z2p7bxesh8YNAyoPbkMl4ijMUOCwZ0tfN4X16PdVzYiqXLRGxHBSF2XuidnXtYfarKAE/pZwR1TirXLLG1sf6RITrxauSns17Sgd2dFp95WPNjxuDlYP+yig8MW1dkeZS4pfI7eVwaZ5e85zbHQeUzFEfhAoGUqOWz1tadGF9lb89m+ylfIxS/SKX1ZRd9+93mEcvS1SqrH0x1a42pqxgDDKVlj6yyXinYZTBjziKKzSj1XTgOjOHXdl55D66O/swZQTzvrsq1DtwOhUHPq3A43ObHqDAzd0DA77v3cIYyGDzvJIRZyEUlwVcNXb+KBuqqlARK7KeKbrfsMqoq+A1fBrMRH6GJzqQGIWfYPpCBZlw6UXpLz+jfR5pkW58Ss2Y+EQyqRylLLQP2x+uOCBsaI6f/odNXpotAjtGUixDg1dDV18XKTJi7SbGgAo15zfK7y0sp2PYwHTss41Vaq8jJhLl2TIuxV2p4ndNlXRIq+/ZXkfqbkssB7+Lum3y0F1wnph4Je8uEuqGi8a+LnSG9cW1uUkox4/NB8JXeIeSFDh1vqFfznaRjIogBWeVT/jMLgSrJcSGgurxtMT+L/9IKQQlaBJk5Lmg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(136003)(376002)(396003)(346002)(26005)(31696002)(6486002)(8676002)(186003)(558084003)(54906003)(6916009)(4326008)(478600001)(6512007)(66476007)(86362001)(316002)(5660300002)(6506007)(53546011)(41300700001)(31686004)(2906002)(36756003)(66946007)(8936002)(66556008)(2616005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d09JSU9NbWFIMGhEOXNtSFNqY0Z6TzNYdkNPYXdGNTZQQ3FpcTk5ZXdVMlpl?=
 =?utf-8?B?UUdyK2FTVWtlbnBYWTBvcXNiZnVMc3dGalVCRHNxSi9EVHF5a3FjSndGemc0?=
 =?utf-8?B?aWk5dlBPRDFKUTBBUzVRYW9maHRocG5ua1ljdmVwTjY5WTBLSmRROWZTNTBo?=
 =?utf-8?B?Wm5ycHRNbWkzYmVjMkw5bkl5MlN1aUJieXpWb3dlK2xnU0pYR2svZ2JVcjRh?=
 =?utf-8?B?MGYySDBTTUU2U1ZwSExhVGNiMlc2ZHZGdE9HczNhalNHMmhWeFhzSHFVd3M4?=
 =?utf-8?B?MFJUT04wR1d1QWs0Zk1QRmEwdjl5emxZeGpwZFRHQ1B1ZDdiTGVIckNZcFQw?=
 =?utf-8?B?cUlFVlhKZitRVDlSMjVKUTVmWkF0cU0xOVFWaXZZdndDeXZiVUtwRVVrRE55?=
 =?utf-8?B?K0Z5VmZXaS9uSDMxUjgvZCtGdW9jaXIzUFZsZlI0L3g2MzVpeGFsVHprSHgx?=
 =?utf-8?B?WWFOZ0lycjR3QmxkcDFtbTJBUmhVeUVNS294MlFER2hwVUI5czBkSlJFVmI5?=
 =?utf-8?B?YTNxVjF4UHN2U0YyVWNFUnYwZlRwRjdKWGxRWjJ5ZmpYWlQvOE92SitzaEtZ?=
 =?utf-8?B?UEJMSlNTTW9mUXhxTlVSR0dMYzNBdTlBWnZHS091Q3ViSUE1L0pCcDFpNWhl?=
 =?utf-8?B?TnpCbHc0WjZuWldHaDk5ajZWQ1kwd2tlU3RyaVJsZWNQdzlQcC84SlM3Q0w2?=
 =?utf-8?B?SmVrVzRRMGxDdTNFSk0vZU9SVUxsSjZkR1VxVmFvcG1TRFo3VHVHVkF5dXV5?=
 =?utf-8?B?eXYyZ0hUSXQvQU00WDlMUEpxUkZZTTZZUHBHZ3lGUmtnUlRubXgrTm9xSk55?=
 =?utf-8?B?OGZYeFc5QlRYYUtkWDIrbVd6YlZBUTVlVEo1Q21pc3hGY1BXbmswZ041UGhL?=
 =?utf-8?B?RWRBWkhKbksySDNjZFF6TG5kWE5LN29HRDE2clFrekhkajFaQmR6RERMV1hn?=
 =?utf-8?B?TDJvanVHaWwydHpPTXhpdy9tWmFLSmpQMUhvQStLY0ZFL2Z4OVNVelFoR0U4?=
 =?utf-8?B?eTN5aE9KQ0llRVNHYVBKTExTcUI3azhEQ3lMbU4waU5yOVZMWE5sMDVMbEJJ?=
 =?utf-8?B?OFBHbDJFT0ZVNktURU5maWNXaUJlRlBoc1FUaHZZbWJuZ29oMm1VMmtjbXNw?=
 =?utf-8?B?T2tRTklXc05lWTkwZjgrdjdSOXYwM0UvNnZRckcrak1uK1JGVGZPMGRYVFc5?=
 =?utf-8?B?VEJrRU1EVHZYd01RUHF5SDMyUUNRNko2ZlNTdHBvQ0ZNS3RuaVpyYnZCVFdq?=
 =?utf-8?B?amRPbklSbUh2aXdwd3ROd2gwZlhFUldKNDkwb0ZOWno1K2tIN0VWNjB2OUIx?=
 =?utf-8?B?bFo4YklvL1FuUllQNzJFQXJvejZoOUx4aUhITnVJK1lReXNpZkYzcitMemZi?=
 =?utf-8?B?bFlZc0dSTDRUam42anhkVyt3T0VXMW5MYVBxaE5HZmR0Z0pqdmJJYjBsZXF6?=
 =?utf-8?B?blRTWE5uZ21RYWdtQTVrdlFyYmdFSXdPcFQvenpvSG1oWmg1am93THlSL2Ji?=
 =?utf-8?B?TUx3bVRpMU9UMVhSTUVOdjZBdSt2S1VtN2J3QmVpeHdqMmpFQWtWcnM4M2VS?=
 =?utf-8?B?cVRIckt1SEtGQ2R5ZEZPbVZ1V2xIYjBxODg4SWlSWmV5YkpSK2N3MTR0T25h?=
 =?utf-8?B?VnBJRS9UWUN0TGw1bTk5TUxpWEJnSDFEVnBrbnBIMUVrbFZOcEdIYkQxU0lT?=
 =?utf-8?B?WVNvUWpsbytlMkFudXRqemZRUWF5NmNKTU94T3ZOUjAxajdDQ0ZoV2hFZHZs?=
 =?utf-8?B?STNvNXZLTCt6Z0RWYlFtTlFLd0FSVGNaWC9NYXArR2IxeDdaemlBc1VYcFdh?=
 =?utf-8?B?blBtbjNMbnJxQnErbFh5VjZCS0xoQVZGRGNuNHprS2J4elIzWjNSZG9STGVG?=
 =?utf-8?B?QzZNbEhEK1YzcjFXNWg0bHo1ZXBxOFBJVjRwc09SbGo3MjkyYnlKbGRjOU1H?=
 =?utf-8?B?UWVoOFZkQXErVmJ6MzR1K3BIeWVHTVpCakg1cnNNekx4ZG9KYVZETEdqcm83?=
 =?utf-8?B?R2hiNS9jSm5ZTmh2dExqVXN0UjJ5eFBzN3NDRTVlWmFkNzBWa3dkcXJKMUZU?=
 =?utf-8?B?SjRUTWpWT3ovbS9CdEw5ajJ2MzdTZW1DMnlNbUZmVytlOHluMkdZZmx6ZUZU?=
 =?utf-8?Q?zGvQLE19RhdTmuSmh5M1f6l3S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9f7271-89c4-488e-9440-08da58403656
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 13:23:24.0547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzMqgKuSZaA1/0Qptgoworl7ZMtqi5H5JvWByRdLkFhgVrrcHf+2CUR5fPW7z/QdnfShQ54fpkYu269h9vzbFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2748

On 27.06.2022 15:15, Michal Orzel wrote:
> This is just for the style and consistency reasons as the former is
> being used more often than the latter.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


