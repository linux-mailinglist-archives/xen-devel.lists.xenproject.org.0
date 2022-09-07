Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E885B03EE
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 14:32:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401543.643380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuDl-0006i8-75; Wed, 07 Sep 2022 12:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401543.643380; Wed, 07 Sep 2022 12:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuDl-0006g4-4N; Wed, 07 Sep 2022 12:31:57 +0000
Received: by outflank-mailman (input) for mailman id 401543;
 Wed, 07 Sep 2022 12:31:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ywg=ZK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVuDk-0006fq-77
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 12:31:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2073.outbound.protection.outlook.com [40.107.22.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e8e9dc5-2ea9-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 14:31:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7214.eurprd04.prod.outlook.com (2603:10a6:800:1a6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 12:31:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 12:31:53 +0000
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
X-Inumbo-ID: 0e8e9dc5-2ea9-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmTNmTSXQHOCrpRRUkV1udu0YPZzYsXfFp2zPKONVyC9mv7Is5vL/izpoK0a64yBV3T6uHFCZfuk9ygMex4dBeJGjvzalKRt2z7+x/oqBI2Q7HiJSLfrANLKcueq8NNOgPvuusiOumn5+9XQYh4itMmcfj7cL2ABL63e/AAPW64OpENmWs2h2lL0q6jB9819InegBXdVxvKSLFgtZ6fOy5WJyyq3lwRfwiK5WriH4/S1qRPmO6jcKhztxoVw2DQg2GdKzca9XBil2sGGDC29I/BHQcqpQk9hYu0r6oxYLGjNTiGnqvYCe9pHOuW4ide/5EJ17pGT/TC23cw16NdUHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIvXPr+ouhMhmYAKcaRDHzakg7Pki169nWAteGKVUZ4=;
 b=Ch8ZWkZBJbxsHTsAbrx3HDckAWqevUkmbhp3z6hgLxvrXy0tlpuzyjnXIZd0mgJjNhH0rAvIgyri0b6WKdGtg88LP3qMHsM5xg3lBR9IlA8UxSUWK9QWIyQf7AiZ/iTxNJ8VZctV3EpBUtyoI+1s7uLZ5iVDzpulqAbVSHqzbWC4VQCs4WmWXbkKqWkg+FDIEdIcko5rjwR8iatZNzFfAxa6z+BCCxE49gMWS+78zpt4nD2FHQcEzx7RPPsUFj/jldQackd+xPbwfWH/8C1YFEVkgpIt7UUQ6EfN2B8lWgxSRwyAElzWNh8fBYmyJnDKNK4BRBm4uXAFGhHOdMXqvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIvXPr+ouhMhmYAKcaRDHzakg7Pki169nWAteGKVUZ4=;
 b=PvCDBwL8K7nsdokjPLGtwaHDa4fD/1hOlU1ueP5ZguK6DM3qXIj/I6+M0xbNZCqOF0rHQPcO8/rV9ZFU1o4GTqbJQ9Gk2tBGPiyTF+L8a4eiQ0Kf0ziSo/Sbabu7Sp5lNHmA832WiOsiJNulpjbb62Q4n99YgbZTHnIEck/NMnYVQgaUc7NGyEvJd94fxON8PGTRbI5ocV/MnQmw2WlYy2n6jnR5VBVBu8kjQCB4IVyFnPxjKtfPPSp/l4zyKzgpZDJIspJzw73bjivFWEuV3KGPLdNg7lJTxduc9tksAVH6h+GwJV6Edap2yaOBgEfa+QbLKlMOVy0PzSNtd+K+9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b5b12417-decf-3286-751c-87c78a7e0c40@suse.com>
Date: Wed, 7 Sep 2022 14:31:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] xen: Add macro for version number string
Content-Language: en-US
To: Leo Yan <leo.yan@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220907120420.387771-1-leo.yan@linaro.org>
 <40400a52-b55a-1c35-5ee8-32ebfb08bc28@suse.com>
 <YxiOf9v5jPsAkRs/@leoy-huanghe.lan>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YxiOf9v5jPsAkRs/@leoy-huanghe.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 901d3266-d637-4369-b1c5-08da90ccf228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VeOjuDvDgdAo0vaDdBKOXMDScWd8OU9N19guHoJh1ncF5efC84RUQrmpA7VjV09de1XehD4zcGTisKUBWZrqtJE9qWshdeovc5RHDatCVpz7jKGyt/emL20snYhS0OuQUkV925RZBy9ANj12wkN3g8s32M1a41JswxYGaefjOc7t+P3C7tpB62EdzTnsOPOOC2Qo5lyNAj0t8nhSoFICMc0L69o4SmoO1pjckP6F9VPDC6g+7dbkOoh7diSZ2L/WQZasnDNMz8WcFjuVdqNx1ASvJVk78Dtv/Vv2txbySpf50O1p9tcemyMIm71BpIO5ifXyEob4cNUCWMAyMsjHwGiMq0uZ9nZ/vdEHxeslix07YOkf5OIQ/bPkIgHeU964b0g7BvMuobHNBfl0D+VI0Ft1mbhDeh8nZwLU8ug5zC+1nZXklHvy9axvjRLUOMrw087wSNLMNhlVORUoAeQ2hpq2BOZcIY2niAXQaJjAvWJJZSdf1xe39EMHDqlD8oaNI5iOvHDihIlyy4ZS2gymjM9I46028l8KqMmCeOu4o63OJgVihwWd39V4h21lSuhFQbcq0NOKmfNNciKKaNYj3CzltH+nGMu/07sEMTsmcmarutlT8SQz4i/LDFYzqaBPbMFh1IznBQB87sZRzCiHxXB2ErvOqnRWo3Qd/L7GdRNxOoTjYf0xY4OS4+5ZuvQZimvpqpZkzoW65QOF0Kxs0ubKAgyotGw85yizRDAgnTvwvcPVPa38dlnSEBoabrNP3sYMgVc4BVKoFYEFPbN4UrPiXf7inSMWEGBSWGEmh1I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(376002)(346002)(39860400002)(136003)(5660300002)(2616005)(53546011)(8936002)(186003)(4744005)(2906002)(41300700001)(26005)(6506007)(31686004)(36756003)(31696002)(86362001)(6486002)(478600001)(6512007)(8676002)(66476007)(66946007)(4326008)(54906003)(66556008)(6916009)(316002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEwyd0pKd0dvelFOaTdidHMrMjJndDV4dktsVUpISXNYdHoxcjAvdmpvYmlu?=
 =?utf-8?B?TTFWMWpFZm4rajloMElwTnMxc1RLVWd6WU03Z01vUWJEWnhEOWtCVkhYTXVz?=
 =?utf-8?B?UnkvOWZQOTkvcHlBTTR5M1NMNXROeTk1Qk9lMkozVkg3WWNpbDNFaURyL2g5?=
 =?utf-8?B?TDZRYTV5bmhMdGZvalFhemJPcGJURHB6S0R3Z242Vis2dWhSOGN4ODZuRG03?=
 =?utf-8?B?ZEdqYy8wMWtQTzh0L1UxKzd3aFJTVExWcWdVYmV3MzBHWTVqRDdkbDZNLzVS?=
 =?utf-8?B?Smo2U1kwQXM0YWpFSFJ6bk1Wa1RYSWkwV2hqZytPYmhoTWlxbzhOOFBKNkZw?=
 =?utf-8?B?M0VjaHRsTGoyWTFObFFMVHM1RzVkd3BFU1IwZnRQYjc5QTErb3VqL3duRTFt?=
 =?utf-8?B?Q2FiQUJEMEJkeUNzMkFLR0hiZjhDaGJzUEZDKzYrQUp1OFlMSHZZYTVNQ1Zr?=
 =?utf-8?B?QUhFK2NKY283cXkrb0JwSWthNm1zLzRYbVpVdzJ6bHkwb2dtcWZsK3RmcUxW?=
 =?utf-8?B?Z0docXJlU3dZM0YvRTkyTDM4bVVIOFVJVkxkWXp3bVowNWpDR045VkJiRytX?=
 =?utf-8?B?TzM2WGlVSnlZVUVEL3ovM0tDbmFaZy9wV2NaZ0JKenErVVA1TUVaRFQwSnls?=
 =?utf-8?B?c09oclM2VkdkTlFtZ3V5SW1jd1pnd2YvdnRLci9MWUhZUmUxSkNPdTRkZmh5?=
 =?utf-8?B?ZUtzSGh2ai9XSFJVbG1zSXAySzduSHNZVzNsNEZHUVhwMG5oeXhBRlFaZ1ZY?=
 =?utf-8?B?UzRmQVBNTkZUYzRiM3BuRkhRTHlKaGJDd1g3OTh4aEw1Z1RWNG1halVPUCsy?=
 =?utf-8?B?U1gwelZyWk1WRDZvU0YzK0l6U0FON3gyOVdqNlJjSk5mQUE4ME5oY1pmaC8v?=
 =?utf-8?B?ZEFKQTdpT2hmcjFkOFo4VkQ0a0hnMW1MOC9VTDlOOUtPd3U4YVYxWjZOWE40?=
 =?utf-8?B?bVJEeWlhYTJBMkJ4NjE2MU1ZTVhDNGkyQjNaWWNyMUlvZDZQUHFHZzNqdVVt?=
 =?utf-8?B?LzF5UzlXNHljdXVmS2Z5S2RFL3c0MkptSW9SQUFld2duT2Q2YkJPS1p0MVFZ?=
 =?utf-8?B?ZUE0ZE5RMTJDcmtRSHdyV3Y5RXhhWXhKdU1PWitRYW8rNlNaaHpNVmJqMi9K?=
 =?utf-8?B?NGo0dmZ1b1huMy9uRVRqZmpTWXRqbnVuL2RJUDZRenhlVmdOK0pyUWtBTXFK?=
 =?utf-8?B?MTdFZ1RZakdkRU1DWkZJQk95VXk2RXU4Wm40czl5c3R3WUR5T2N5T0RsTldk?=
 =?utf-8?B?S0xEdDZwanBVMm9TamowNHRHZlBBU0pJSDlsRzZJaUhadW9nNDhlM043SndE?=
 =?utf-8?B?K2F2NzZORTlpdHRSR3lmL21Rdm1qQzdic3pKZE9BbEVTQ3dhTjBzR2IyT3pM?=
 =?utf-8?B?SkZzTExQTHlneWx2Q3pIMUZMWmVhV2lDMXh2b0pjMGxUc2J1TzhKSXJUQ0Rh?=
 =?utf-8?B?ekN3b2VybzVwNWI1UTVPNkVhNkJGdUx3V3RnN01wUkE4RVUrOUM0OW56Q3hT?=
 =?utf-8?B?RHNOUlZXRXVySlI2MUZmNDVkRXp0R2xFc0lrdGNkd1E3UER3TE4reVp0NFBO?=
 =?utf-8?B?blA2OW1xS2tDZ2N1OWh4M0R3amxTUE5GSWVIS0FLSmxMTEN4NUE1dTJ2cldB?=
 =?utf-8?B?SmM4eDVqWnp5UmhEa2tVOGo3RWlzc3AyZ044UjQyVEtYK1FHd2RJYktxQ3VI?=
 =?utf-8?B?cElaWld6MUlIVGJPMFhnM3p1M1dDVldsdGMzd2tpa2VGNjRmVjRHdEdmdmR5?=
 =?utf-8?B?TW1VYVY5bllDWDBsOWVsSUFwbndIS0ZDbkRyYnZKdEROOG5nRFF1L3c3b3V3?=
 =?utf-8?B?YUNWY2l5OW1ja2tDeXJKNkVucUs2K21JM3JRSlpheFMvTGZ1Y01lWG5VcnFL?=
 =?utf-8?B?b01nb2V6eG9mVUdYTThLVE1HYmwzeEtMM0dKWTJ0dWlJM3Z3TVUxTEY1aUcy?=
 =?utf-8?B?Kytzam1FR1ZkTnk0aUg1U2ZlUGF0MFlkNTBVWlJ3TGN2NU4zS053SGQ2Zmhv?=
 =?utf-8?B?Rk8yNzdMVTNoa0JkVDRJS2QrbFU0MHVXMjM4SWhhNE5WaDBTdHljNG9KRE1n?=
 =?utf-8?B?M1JpdDlUeHA1YmVjeUlOeHpJS003WW4wdVRCc3U5REhLTlpiTW45QlViYm5s?=
 =?utf-8?Q?CWzZkOoGJ0+2lRGYJHWES2f4M?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 901d3266-d637-4369-b1c5-08da90ccf228
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 12:31:53.8390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Enqjt7u87Vrgr1KNwDnKJCYmIRjnJmmfsPyJ56sgeTDtEs4wmOqsLtqW3AYXqvmzO9MCrLxBC2pRY4mwJUeh2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7214

On 07.09.2022 14:28, Leo Yan wrote:
> A question, since commit 5d797ee199b3 was merged in 4.11.0-rc6, for
> fixing it, should I explictly add backport tag as below?
> 
>   Backport: 4.11+

That's up to you, I would say. We don't really use that tag all that much,
the Fixes: tag is more relevant at least based on recent observations.

Jan

