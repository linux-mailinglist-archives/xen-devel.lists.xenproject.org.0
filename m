Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCAC3F853B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 12:21:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172918.315529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCVX-0005Oz-HB; Thu, 26 Aug 2021 10:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172918.315529; Thu, 26 Aug 2021 10:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCVX-0005Lo-Cr; Thu, 26 Aug 2021 10:21:15 +0000
Received: by outflank-mailman (input) for mailman id 172918;
 Thu, 26 Aug 2021 10:21:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJCVW-0005Li-5f
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 10:21:14 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a594bfbf-dbbf-4879-85ac-41c5a280e0b5;
 Thu, 26 Aug 2021 10:21:13 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2055.outbound.protection.outlook.com [104.47.1.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-jqDVeMVvONam1aDQMM9pwA-1;
 Thu, 26 Aug 2021 12:21:11 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 10:21:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 10:21:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0701CA0038.eurprd07.prod.outlook.com (2603:10a6:200:42::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.6 via Frontend
 Transport; Thu, 26 Aug 2021 10:21:10 +0000
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
X-Inumbo-ID: a594bfbf-dbbf-4879-85ac-41c5a280e0b5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629973272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xsOqFcSbWRy+X2S5tz+soOLUodm4/iPDLnyE4XYzmwc=;
	b=BEeZx9JO7zSKCQfAK12a9crbu/lgGjKA1lqYYCUGa9bdjMpD+GtrS48y/WOWSxSrexoiGt
	e2KsNQlLg2AOjKGbvG0MC9momjCFZwPJOfg+HYOarC+P4NdsjtqnXEhMwFlm3MY8Gnd7qP
	0gaYfIfdUgTAnv6Wa9lNWGSiae6/hL4=
X-MC-Unique: jqDVeMVvONam1aDQMM9pwA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nH+qEyc6uO5cgCPpnCqruP64ezqNA324r5JAwZk8UHYc8Wu0PB6A+7dCMJ1fTAVwu1vLx1NlWp26pwNthlXiAPCdov8MRdV+RS2n/b3cfK9eQhkGdFtgAwg8Y1U57mRdyOmm0QuAB8CPfBgjhIhLb0oJMRCcIElAGtantEXrxVbf5wwvwQHgdxvURrrRBQOUMYzV89pMzf5itbIRQsLFe6fBovUtXdX1fo6MhZ0bCGHn2HWF6wom3CCOWBdBacru4K05DeSPqL+r/qa9eScO7yykeh6jZJE4oK+02j7j76r44NIJneUJ6xwEOcDap6GZGjHcR/VnBuBNfMEqkogmMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xsOqFcSbWRy+X2S5tz+soOLUodm4/iPDLnyE4XYzmwc=;
 b=jfnWfTVbSXEyLN4g1RvfgcXYFelstIFxv0aoYMrZ7E/ys2Es1khasNEuP9giBoAxUmjTU8aU6pjtQ2nep3LtMJFIR545UbbkWAXdD8EpGBNFQ2/sV7T6M/oA6dROcxaYN0PJfDuOLNoxjNSeNv7Fawyuu2qaEie/Ryh8Js2OJSs7ndiCZQoSQDRbzMu1CuJgTMKJ8WGo+tLOniYyiidTcb60ZNc+HipWFJfhZVyLYuQxywSVr3koy55oEX9ZgSDQYbKLiCAcFpoyvCFNrnonx7Q58PHLDMaQYDZmh82LBIhNiHjM7FIQMv89ArPd2uHMBOOi5R/eD8tGoCc1BJD7Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH XTF] gnttab: drop GNTMAP_can_fail
Message-ID: <4b5f7a78-fe88-3b5d-28c4-7c8e25c82971@suse.com>
Date: Thu, 26 Aug 2021 12:21:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0701CA0038.eurprd07.prod.outlook.com
 (2603:10a6:200:42::48) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c7ad529-4094-4fbd-d0d9-08d9687b399e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB438433A600142BEEAF68AC5FB3C79@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YvG1eMOVOSyayT6crD1fiC2Jzumdf6Wz1Hp8gNyce3m5EmQ+VTwZN0qq/VcjVxGPETxJAL74rpFWJ6NRNAA3MLBl+S6MQzJwlINtj6wvlXfXno4t24voqddx0E1UPOxcBYcqU4C8zBMZ6sbpk8bWQrc1ZyZNk95G7O7PtuOmoVAldf4R443nn04InHqNQi2aEspcHNcq+9U0ihYQEe1cg0wI85ZMlA3cHW6V5kpQGQ/Tgc5jdMNvVJYV56Ah8MYpbVUJd4+YdFv8mDEwCBBBXeY93zBstfieDXK9AbEgGY4uM4zRp4GHLPiL0IYYEKZPYpfqn2lcT9nL4NcBmvB5dsQavMOOruTw+TvOVV0nLu/V1urvKsqm8C9wspI6SOMZj76pOdoMo0nyktxkI2D+kgxNMmBvmsjWTUFc1iRFoSbKCFLv9ZRU/tbDbTuTENT2vtZHNOuKHDbpIj2EmXdo3sqxKDEN+krYhUttCXnVz4gJdPeQ7C/WDXLGTSqW6hFBm5RmJGeDL099zYtO5SHSpSFEX8O88+pbc7WqeMLLOGag/GS4NmwjjLuSCihKbtttVyhnkV5DgVyFgj2lp/EUmj8wJ5PA+H0XQKgmHk3eIZU+04/LZ/WuBi0rgkChTmkXfdZZp3uYQBsqeryfTwA1cXgneD74RoAv1bGOP+uU2pJmyI07DCXE2sapyShwL5GHqE+gWsm9i1NGxabGDg80799B0hptWj8NfzQzqXICPcY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(376002)(136003)(39860400002)(5660300002)(956004)(86362001)(186003)(66556008)(66946007)(66476007)(31686004)(36756003)(6486002)(2906002)(8676002)(2616005)(26005)(4326008)(478600001)(4744005)(6916009)(16576012)(8936002)(316002)(38100700002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHJYUWI3dXFuUE04a3E1Z2l1emFZdksrck9YMlRhT01aV1NmUWRnNDBGUkFz?=
 =?utf-8?B?bDdJZFN5S3ZZZ3F3Mi93N2NqZkp2d1BiOGQ4RG1nQXpJRUJ6VEIzUEVDQjNt?=
 =?utf-8?B?WEdOaUQzdmFia3IxRHlYS3RVUG51djFSbGFyWjJUR25md3ZSai85NzhVcnlL?=
 =?utf-8?B?anJiN0pXOWNydFdMV1JRVng0bkRsM01LTTkvYU5UVHhseXlOeG00YkFoWWJo?=
 =?utf-8?B?S2tXdzJKSGptc01uNE0zKzVLdmNjaTA0OEYyQnNkTjZQVHpCb3N6WE95THI1?=
 =?utf-8?B?QXpxMmxiZ3IwelZJTmcwakhVZEJEYS81VUVHa1JtT01LSy8ycUpnclBKNHNp?=
 =?utf-8?B?M0hxRmkrY2czZUdTQkk2TkcxM01ncmlZNjRZUXZ0ZTJzR2VWNG9GVWZBVzMr?=
 =?utf-8?B?TklnMGdkTnIvUi9QY0s1bnArS3ZCazdQYzRuVzNvUmxDRW1ITFFhSVcwWXpJ?=
 =?utf-8?B?YVMrMUtsV21TRGg4cTlpNjZMcUtUMUNaK2pLU2doMGlzMkpNZFZvRmFTRFls?=
 =?utf-8?B?VG1mZ3dqY1Y2aHpMYkhBV0haR0t2TWxTNE4wdDNSYVVxYmZPaUU0S2tJc2VP?=
 =?utf-8?B?RVBiSncwU3E4aHNwWGxmSXliS0lobExOaEJxb1k4TjVXVUEzU1NaS0RVY3ds?=
 =?utf-8?B?TjVTaUs3OTNtRXFFV0hPa2o5cjJXemV4MWFrZUVXQ1NkeGE1WDNsQnlRTFd3?=
 =?utf-8?B?Z2VIcHJHUUs2VzFDMERFL1BUS2RUOXorRm9CTXRVSnJKVHdzb1NFcCtUOUxR?=
 =?utf-8?B?bmdMVmxnL1cxVE9PRTQvKzZPVHhVcS9RQkVZNGFLdVk5WUoxV1ZhUmd2NHk1?=
 =?utf-8?B?WWwwQzgzUUVmVDZ6UXBFWUVjcGJhWEF2SHhjZmszOVl2bjJlaWVPbG9EMTFz?=
 =?utf-8?B?VE9LS0V4Y2dZa2sveHduZnRqa2ZHQWl1bk9GanRQbmlCK0w3SklQRllrSlBx?=
 =?utf-8?B?U0lwZTFDZDNQTHhybjBaWSt1YnBDdGQwY3B6SFZaRitUNWduUDFWbWFsaldS?=
 =?utf-8?B?YTN5LytONnhxY1k1azkxQUFsc041eVM4ZnBranpFU29MSWNSc0crLzZoVnhF?=
 =?utf-8?B?NTBBQWlCSkNqMnZCZzBjZHVKbnVmd1lnaXN5N0NlR3NEM0ZuYzBJazE5Szlk?=
 =?utf-8?B?a0JFamhCU2xmQ1oya3dlcnpLckphdmpjR0c2QjBlNlhPUCsyRkZUcXp0cVlK?=
 =?utf-8?B?UllVZGQ1dUZHOUFRRStJU3hBQjlDRWpCeDRZS0VtSTN3ZUU0VFExUjNEeXpy?=
 =?utf-8?B?MUY2Q2QybUdpN3p1YUFwQkh4SlRvZHJKWnNRWTVIdlZXaE44cnFvYjhRZ2dK?=
 =?utf-8?B?Tnc4WGFSOHlTVCtXK0FxSGxOWEVBYmdFYnp3MkE4b2srSzIzaTZsOHd2N25D?=
 =?utf-8?B?Zk9QdlZndzBXcUFISEtSMGx5MmE4Z2ptU0ZienVYcWx5T0VOZ2VmY2dUck5E?=
 =?utf-8?B?Q3g1ZkNXclgyeGw0M2QvaStRMEFOSDQ3WEM0Q2FsVURESUNSc2M3M09MSnVD?=
 =?utf-8?B?Z1VVVGxId291VEQ5VlBBamltNFRDMnRnWDdRdGQzbGFUOURaVyt4TTZoeFJ4?=
 =?utf-8?B?bWwwQjRySTJ1WnZsc2RrQ204Znk5RGJLYkZyQWVaRjBrK2VUTlR4NmxDemZx?=
 =?utf-8?B?KzFTZ3ZsZDJMSms3RkloVTZES2M0LzArdXpiRWpDVmhxM2MxOTc1M01VeEdq?=
 =?utf-8?B?UWlVcVVDem93WGw0WlR6c2Q5dTR5U3BlVUxTT0pBbFlGMlpKMHpCM29jcmVj?=
 =?utf-8?Q?oYWz/aITXwrrWRTExI2htmgOnmzO+X+ZkOryazl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7ad529-4094-4fbd-d0d9-08d9687b399e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 10:21:10.7510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ER0hshsEHIfi0TAGkDc+PAzqTc+qYz2oiSqJYKKcSFv/pQd5vPsHbObxnm31Kwl9cguFPaIAzs3n1257CUzxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

There's neither documentation of what this flag is supposed to mean, nor
any implementation in the hypervisor.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/include/xen/grant_table.h
+++ b/include/xen/grant_table.h
@@ -196,9 +196,6 @@ typedef union {
 #define _GNTMAP_contains_pte    4
 #define GNTMAP_contains_pte     (1 << _GNTMAP_contains_pte)
 
-#define _GNTMAP_can_fail        5
-#define GNTMAP_can_fail         (1 << _GNTMAP_can_fail)
-
 /*
  * Bits to be placed in guest kernel available PTE bits (architecture
  * dependent; only supported when XENFEAT_gnttab_map_avail_bits is set).


