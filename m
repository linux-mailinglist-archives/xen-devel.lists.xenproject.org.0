Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BE076E3AC
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 10:54:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576102.901866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRU5n-0002yM-Qn; Thu, 03 Aug 2023 08:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576102.901866; Thu, 03 Aug 2023 08:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRU5n-0002vl-NR; Thu, 03 Aug 2023 08:53:59 +0000
Received: by outflank-mailman (input) for mailman id 576102;
 Thu, 03 Aug 2023 08:53:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRU5m-0002vf-88
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 08:53:58 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20630.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47519263-31db-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 10:53:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7347.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 08:53:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 08:53:53 +0000
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
X-Inumbo-ID: 47519263-31db-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyNMHPm4+0iQixansHIXlRtHwcQSqJMfDp7ZWha5Koyp0uI82HF2eYy2BGFUe89eKzy4kXgwYbXrUlz4OjjG23UaWMOHKMRE4n+FVBcmChsnyTA3HGz9eN9IPGiFkXADmIPPQfLuu0iEjr674Dq1Z5b/WEt8fQuw43J1sge3AgR6u+zhsuX/EvSJrad5DuIlqxPfcYu8Nxk1KIjS0d/5SbL3vMhkfo5FrSCHht3P0BBEIFMnCLiWsyDe5dZ7+kaDkbEDi81z63NNYhyrknPYOHxkWBEZdlWph4ktD+/rJhObw+NzhoJ7LbgDvIKAYqsn9nNgJXZtyATwmx01dStUBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbuCDpq2unlXBKLhBLNPBb8KMEi2PfbPxj6w/wTRvQI=;
 b=MUtXGU/ECSubAZCg6FalB0wTa9wv+k3G6m2xKyhfE7eji+qpC3jg46766bZi5tdf5PmJ+1leR0s2oTP0ZkB4CeOIcL8Fz73SIvguIQaorJBeknaK99lhCxcUUZHmLmxF8pIWMJYcZbm5iPkQHniObmcG7HN/BC6imQIS2WHIWWSbOKQOf1RJwoFdzjml/J2fmQGBcV7Uprj5K/vf3LySgXoVgw66CQl5ZSJv25XzA1I8H9+xHUd7D98Qjhox9mpc8pUDNr7UOx2XTWEoFCCOxJDKnR0Au0c9Q1Dz0oUUTzGnwafsOJoDr5F8KrdT5VF+sCOJaAo1MQ+qaD1fNEzi1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbuCDpq2unlXBKLhBLNPBb8KMEi2PfbPxj6w/wTRvQI=;
 b=EIRM/+IVxLKYwCZ6Hhb6dqQWz7m6i6HCrXzcNm4fGakBTIZ3TqbqixZcsSjnAMUp5u0PpjXGiEmNJEsWBlOJ1Y8GMlOP2WF8PHSDtRYqRkWc2hDD2S73Po9bLURQwA0gpxA5dB3YQtSsoGEst+KTe+Yp/2N2L7WC1GUJQJQEiKMwzBtYkhB72BY1mxRnR/XGM54xujdKupEY4obPwb/SZy9tUz/M8twtyiZb+lNXc/+wn91gSX2Iic87VBU4MNyjGlzTpJGMd0/8yb2QFAzBhSFqRxlaSvlKo4Mf3siBvy0Q0OuKcOuZ9F7pCSUEUBjl3KsBNPrYBnS04NqHglGPUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <376a6586-388b-271c-7667-e63bb1565eef@suse.com>
Date: Thu, 3 Aug 2023 10:53:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] xen/x86: Constify the vCPU parameter for
 expand_xsave_states()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230802154705.84530-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230802154705.84530-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0195.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: 55829d34-760a-4ef9-b290-08db93ff2a02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	txwgLymvlzNKy2iuspoekp4Wnz9LBK8EkMFq8mxC5x+pihmQvViMW9lttM7gpIDDes1W0cwF0vzZm/avVU+hsnH+7Rbh3IqpnGnmxhfFmf+JUt9OWtDg5LySSDmJM8BIuuuJQDewn4CmIPxAe1OhRggCqTKl3eCe4AQzWf9loETvdx5PAqdQZAwrDE5zVglAUZnNKtDyknHdD+r75Nwc2qUwyqHwXb/WQsLrrIy49QTQ8g5+ZTtNGkT5KBNYhpWe/FCzfxG0lisU7WckqQgVKLUyMG+F4oMAy73Tw7IimFMxkpuHm3n+QD2NnAIuLGacJbYLMs3MyGmQi3wRQYYtFRea2YiTvl8vXinSCYqXBm7gupHnSb5L+g9jTlWHAWZW2jlPID+dSAgP//ke3ywRAgZMCUB3agZBAxi3koklnZfs170yPtH6SzZsmlJGJdx4iG2vwU1l83W1TntOW8j8PXZNK8XPAAj4b+OKDYMUscHbXL4XjDR6lZdJftqKt3OFf+NuqqQs//Qz9Mhc+hpinEQHBGcCNWYFv7ar5f0XCjlbhSH5cWYBPgQjhJ21HJKNem9RerhVx3wc38c8+Mo2EhySNHTiHn/nuP4qTT6bTBCyRAFLNlDFzryS7VOpOZ/U5ZoYYspgR7nGOlGARiFq2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(346002)(396003)(136003)(451199021)(36756003)(31696002)(86362001)(558084003)(31686004)(54906003)(478600001)(38100700002)(2616005)(6506007)(186003)(26005)(53546011)(8676002)(8936002)(41300700001)(6512007)(6486002)(6916009)(316002)(66476007)(66556008)(5660300002)(4326008)(66946007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkNGaXgwdng4Mk04OWtaclBkUk9QVmRsR1FKdCtRZG8xUHEyYkpmMXZHSjhJ?=
 =?utf-8?B?NVpqU3JkRnYwa2d2WHp2NGxHeFJnWVVST2tQSFc1bmMzTktXdXh2aVNNTGV1?=
 =?utf-8?B?UzFrZmZCL2wzaEUzUm01L0VNSUdPRHBjbmZVRk44b0s1T2ErZ1hzNldocXQ5?=
 =?utf-8?B?Nzl5WFBxNlRIWmJVOURnSC9aWDJNaFNhTGVIWVN6RmNzNVArbWlMTmpCK3JW?=
 =?utf-8?B?NTRLczBFUFNGOEwxYnJiVi9CVzdURXBkU0RBaUdpZEluUE1OT2ZKd0RXbEVu?=
 =?utf-8?B?VDEwVm9EZzJKZkZ5RUxxVjlxTmVOaWVyR3JvUFR5K1ZnMnl4ZTZ4RTcyQ1Fs?=
 =?utf-8?B?OS9XY1hJeityUEpzUTl2a3VZaklGNitPMktWOGlnUHh4STU5OUFEUjloZEpS?=
 =?utf-8?B?ZnRvSWhETThRcmVWNXBJZkI5T3lsYzd0amdERHdZOUpKMksxVTRaYnRRbFlP?=
 =?utf-8?B?SlNJSkptWEVqQnVyNzFOMS91UTVYSnNBTG1PTkdzcjlzZUMrTUR1Z01tVjl4?=
 =?utf-8?B?WCtXWFpDZElQalRscUVLMWhGejR1T0I0ZTZZUG5BMEZvK1ZkMlpiZzZGY1hT?=
 =?utf-8?B?eVg5ZWhyYUlRbHJJd09UeUVpdUFNcG1IOEZyNVlxK3hJSENRN3prRUU0UmNU?=
 =?utf-8?B?YTQvbS9pK0tPZ01CKzRqc2tTM0F1TlI2Uk92N2JqMjRTOVYrZENHRjRsTUxk?=
 =?utf-8?B?WWwwZHcrRlBhNy9QVmcwR0x2NzYyYkNQWThEYnQycENkaDR4Q0NFMzZoMVND?=
 =?utf-8?B?S3Y4Njkzb1JReElmWmVnY3FSSjMvZkppUWd5c3FLR21TOTdidU4zWGpFUW5r?=
 =?utf-8?B?LzF2ZFpRMDBVZlFRRzdGZlNaT2lGdHVRbi9vV3Ivc05TZUVPNjJPWXFFMktv?=
 =?utf-8?B?d0Jnb1hoUkp2OFRNQmgvQW9hZWtmbkhHVXpqRERCV3BPRlJreUJZTnNtOVEv?=
 =?utf-8?B?S2FMNURoQ1JoY0h5UFNiY2xxdW9vVm9QNFhKMnhPR1psSWUzZFM4K0hGb0hJ?=
 =?utf-8?B?Y2NXdURSclNCU0RrUlF5ZGhsdjRvWldoYzZCbG1zSEUvVUNMeEJJT2dOOHdC?=
 =?utf-8?B?UkI1RXJNZTJmOUlmUnZSOHBDcjJ6cUlXK1JvdlRqY1FrOUVucEY5TzI3d3ZJ?=
 =?utf-8?B?cTNDRWV1bXNjMWprVWh3NXU1M3VCSnhGZ2dGY2NXOStRRmVCL0F4MFRNRjBo?=
 =?utf-8?B?UVhWMzlYRjg1TnNpUUYvWFJqRVFHaXBmVU5qa3FiS3pybDBPV2FkVHBLQktv?=
 =?utf-8?B?ZG9VRDJTVVlhcm9vbkZzMzlXMEs5a1JLZTQxOHRpTitzbFFvUUhaVEc4cjdi?=
 =?utf-8?B?YW1COUlvblNtTEY0c0hsY0VNVzB4UnQ2YUlweDlkWThGZ0VzMFB2WGUxWW1a?=
 =?utf-8?B?THVIZlArVnMyOEdNQ0xkOHhpTW4wRDVVUkVlRm5xUGlnTU1SZWpMaUN4amt6?=
 =?utf-8?B?MGdXa1VUZzhCVEVlMCt2eVh4VTVEdjdIMlpQT2ZUVUZZV2o0ZXRySG9VckpI?=
 =?utf-8?B?MUJockl1T0ZqNG1xaURvd0hYZDljR094TEVpOVN1SS8vazVtSGp3eXkvTWZL?=
 =?utf-8?B?R21HWHVjelFuSkN6WFVrTU94TEt4aHQyNllmWWVDV3JvVHY0UjhmSFZITGlT?=
 =?utf-8?B?Y3VUTzJ3MUtzTmJuS2dmOFJWSjk3c0VrOG5oZW01eUNsK2VMbnlOTGZQRVUv?=
 =?utf-8?B?T1Vta21UZmJsbUJKWDRJSXdUN3FtMHFud2pMSmljaUVOR0RrcEl2NFZPWDhZ?=
 =?utf-8?B?a3ZMWjRRY2ZVRjVaT2M5TVhycWF0SVNJZzlzQy9uUHBVU2ZyQzcrYzlxSmtX?=
 =?utf-8?B?Sy9nZmFvd2Izb1pOT2tMMExzKytybzFtOHV1QS85QTh6VU5keFlDeE5OY3Zq?=
 =?utf-8?B?M1E5SGNpUUZJZDhjbnp1RHF2dTZkY0E2SkRidjdWQUlGVlJ6SWg4enJRM2ky?=
 =?utf-8?B?a0p2YkI2ZXQybjl6VHVBWGI1YnJYTDBxSjAzZTZsTm9JN2pOYXlhUlBxOXJl?=
 =?utf-8?B?T2crUmlkemRKSGQ3U0pnNElDaGJhbEJkTDNsSHUvRm5LQmlwK3RLWXBad2xL?=
 =?utf-8?B?MVBYWGdlUHBqdGxjWmlpYktHM0JOaGZ0SnNtcHFweUJ4RGpHaTZNZ1VtOVR0?=
 =?utf-8?Q?sfNuswqimyex3P8HwnIXGPcMh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55829d34-760a-4ef9-b290-08db93ff2a02
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 08:53:53.6292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4I7W9d09ufDm0/8dXhCErNreOOncO+lqdELduDL9o3vM3GyTz1joczz2ZiDMpaCuofZp8zRrdeFQgLhhKrZFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7347

On 02.08.2023 17:47, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> expand_xsave_states() is not meant to modify the vCPU. So the parameter
> can be const.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



