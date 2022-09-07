Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 421D25AFDB3
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 09:40:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400853.642475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVpeS-0006xH-R5; Wed, 07 Sep 2022 07:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400853.642475; Wed, 07 Sep 2022 07:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVpeS-0006vH-Ml; Wed, 07 Sep 2022 07:39:12 +0000
Received: by outflank-mailman (input) for mailman id 400853;
 Wed, 07 Sep 2022 07:39:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ywg=ZK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVpeR-0006tv-4M
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 07:39:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2080.outbound.protection.outlook.com [40.107.20.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27ceefd0-2e80-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 09:39:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6053.eurprd04.prod.outlook.com (2603:10a6:20b:b9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 07:39:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 07:39:04 +0000
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
X-Inumbo-ID: 27ceefd0-2e80-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEjJXT0Y4VJi2W3di+taPBFZq26hvSy9E3qATAgcJ8J6UAIeeTwZaPdO2E5cuORNJmFJwxf/NFdjf+Y/q1/SuIg7lRLvpZwwFKu2f0awLvMVgd+nDmv25cUvtI7SsCwAvlvwXHOXUefFw0SSU6zzFby2bxa95IC5VSfhtWfqCSTJUYz4hl0y1ka/Lv+7VmN5q+TP513UuzMYi4baGAnCjraEOQm4XbQGfOQxfLvZe6WY2e7QGaEVqztVLBxDgk3mqDWkJvmlwM2uxXWQPylKj7UWthXtFGAXltOxuP2lNFENL4PKnF3E6D7StBHTs8lG613NIel4Kkzh0RKBdNw5ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjl2zFNl9ZBPJVYlJiyWZzvoQNO/1BnKG+C+CCbZl0g=;
 b=NpUTa30awwm3SJ0wpgKIPYKN/ILs0eNb/EmiWIYLKUVQupubEF76dCsJMatrH/sAw/15J7Gm3CZr+7j17AYdbtiGRERn0iep3PkGUIkwTCEkhMsQMg3uzrtQF+JrAVWFv5T5Bvs+5M3wzcPDwZ0iDTb+FzC2rkRLr1raVbf4a8VN+uGabEWQzFYyRDEMgMuRGzKdQaZb21RBRy2Il5TruXFkIkOnyp923ggym5G7UuqG1KWRu/bf5fgogK+JYcX4JOAJKA/0+QRu1cI4ySE05NbiuaGPjr6k6sKyfIwc4J0qsn+BFS683LG2rF/1Y201NDmnlc94OPL+1nNKlQVWAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjl2zFNl9ZBPJVYlJiyWZzvoQNO/1BnKG+C+CCbZl0g=;
 b=ixm/5cKU01x+Ud6kscRYJjtkW7GofDgFpcY2RV/BaFyUPUTJfE6gTlJ742nf82BuxRShaa3loB5bVIvh+03e55FYdpkfTjW/ImjonwqZnOGjBke6HBcUTzCAWDaRM/+TAqINHbwKu2S0cucntMHDaPQGom+LV9n82sU5CjscxMfX+NulV+iCHVMPnqi2ExXJ7wtT7b5vZcc7koa5q717Qcy/cMOo+vFjfjQ5lvtHq/SVfpCRR3bY3ZbKsae6OfjhLSKAKzZedenLUmrmVXo+Q9qlU7J/+gQw7VkI8u7fuN+LguO4327KI9q9V7f9vuDw0xYYJOib5Or0d0wrTh3eJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a633eda7-0e12-01c9-af4f-d3634bc17315@suse.com>
Date: Wed, 7 Sep 2022 09:39:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 1/2] live migration: do not use deffered bitmap when
 inappropriate
Content-Language: en-US
To: Andrei Semenov <andrei.semenov@vates.fr>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1662457291.git.andrei.semenov@vates.fr>
 <1e7862a0d83c61b7550747591275c38e87d4fbd2.1662457291.git.andrei.semenov@vates.fr>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1e7862a0d83c61b7550747591275c38e87d4fbd2.1662457291.git.andrei.semenov@vates.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM6PR04MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d6b621e-18e5-4c66-719f-08da90a40a21
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QfugdhAHGakdt7MLIvFuiVkVAog2kARCstjwFfp1eDWctG/e8WZjIKOOkk+gF0LS2NKtioGcrmmh0nQzYNMogtgDwHgEUJcx7Lh2QXywwF11XJUr24LkdXzBHFnUVbexiQikENZTMpEv4aAIjGFDP3MTetOrCniKqISehSzi7NOjuu4EPRIr1ytFwFGQBW2mi+xRoEI+KrAcc0/3mA2GCFNHvN56mF6QerxiqnpxPkFqAGS24QtoPvv3Oxtc2VfhsYZufVpZYVmbD8/1zCBNQan4xItOFsFoSayMX+4XbFemVDI9wq4ezUAWjqsPlwC55iA3UV+EIt6yDoObg2tSsvOcpUMhbxNSmrRXOCn36BUIEO6MFQcbt01UTJAmr33KrwtcbOnR9g3b5d2p3f5N1NZ7kYnIruO0BV1IsbsGj7Z1owyvrCYkEsr9ddhp3R0VWeliVrEfLTvTCzJmUidKJ3RY8trP8PBENrgRhEOq9cz0cn6+LgB4A4mDDp4KiQTLk9e8seNQ7vT2UzsUvLp4PAxPJ+unak+7/BlSe4K1QzN/IemlmcJ/2dY5QrROrPwZtgrDaydwD5qIVgCOb7Z2VSg4yBd/KVJ9K0KZwJKe1+L02jsaVrIKy2sPJAJJuk5ry8rnDcl10QTnRYUtNqSEB+zYu2p6qZnoEOpMwCmMTeP202kfYm4BlIzaxwc5z00g+vc0MRG+LKmUvqAITxMOfgq35nJOSQWiX7SKJQCX+Od7BOdTTnat8Nj8PptwqmGgaRYbzRyIeXMnEiyswKKSpxjNW5+7Fa/ET61dtPvbb1Nyk30zLgG1aGZerdoioW0O604PSWa3n6IC3Yeapzi+fg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(346002)(376002)(136003)(366004)(478600001)(66946007)(66476007)(66556008)(8676002)(4326008)(41300700001)(966005)(8936002)(5660300002)(6486002)(6512007)(2906002)(26005)(31696002)(53546011)(6506007)(38100700002)(86362001)(31686004)(2616005)(83380400001)(54906003)(186003)(316002)(36756003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1g3a2JKaE9nUFhLUVNXYUUwbUtKdmhWYzlFdnhXSHdqM1F3Tk5abW1zcUpV?=
 =?utf-8?B?MmlXeVZSeFNDM2FoRlY1REcvdHZaQXM0VEM4QTJ6NWNmQ2orTWRaMU9KUXps?=
 =?utf-8?B?ZEs1VlRrQkdBMEJkY1pQSFB0elV2a2V2cXloZmVMeFdwcXc2OHU0NWE3eXR2?=
 =?utf-8?B?d3VmY3hGL1hLRGFMajQ0S2pqa0pEZmRRYkh3TFY2d1hYa1Q4VU9IbW9jZ3FJ?=
 =?utf-8?B?djRjZ0I3UmlJYysyNHlJTzJjRURIZCtQU21EdmZTYWRwN2JZL1pRWFRtVlpx?=
 =?utf-8?B?ekwxK2ZDMUxLOVVKZjh1blJyZ2k3QVpjOHhuQndOVlljUmp3bWgvbU04L3Vj?=
 =?utf-8?B?bFZlVVRueXgzNCs1WWdWL0J2cjRIM2UyRzNlemJiRVBuMHUrMlVYN0h5bG5z?=
 =?utf-8?B?RDZML1BuZjFCN3BndDh4WXdjdWRQTCs3S2RPbXhNajNnSXhPYktkMTllSUVt?=
 =?utf-8?B?UHgzbGtCK0M4UkxPcGZ1em00Z1Q3N0cxeHNQQWx6T3JJc2sxbEhvNWRPNjNN?=
 =?utf-8?B?Q2VRRzBYWUZKTE5pT0pwZktsMTVJYnJ0cGwrdTNoUHZlOURyUVE4M2gwbUlj?=
 =?utf-8?B?VHpmeURxQmYzZHNjUks3b2g1VGpxT3J5WHR5UmhHTHF4YzNsSmxZaTNqNnAr?=
 =?utf-8?B?MmJBMUNFUEtQdkdCTkwzdHlqZlUzT1JUaDh1blV6aXo1OU1JSHlhb1paM0xH?=
 =?utf-8?B?K0tmNnVDNG5sTTNCclAzc3FYbmw0a3RhTVpXcDR2U2JtMlNIZXJGNUUzRkFa?=
 =?utf-8?B?UFY0MnNNYVpXWFIwUUpwUlNGUi9nREMzL2h1a2s1WDBzbEcwMklHV1M3R0dK?=
 =?utf-8?B?L2Z6WHhCc0tmOXBHTUpoeGJqN3ZPVDBYcVFUWHR5VStTSDNOell2Y1FWQTAy?=
 =?utf-8?B?RG5GS3o4b1c0NHRkUmhqT1g3dzU5YmVnK3NwSXlQMFY3K3hJRGt6SjdPcGxK?=
 =?utf-8?B?a3QrWEg3cEV6WDJkQlNNcnZNS2hsdWZuM2FzWVYveHkvRWVTMXUvYzFjMzBY?=
 =?utf-8?B?OVVpTFAzM3FpN0dvTmhNUUpoRXdvQnhtS1QrRTl5NThJb1UxdWc0UkZFTFJX?=
 =?utf-8?B?b1ZmSHd4MUlZOWJrSjFROHZLZkk4Uk01T0JPNFhHU3FkSHRkcC9SelM1b2FH?=
 =?utf-8?B?OTVNRzd2STZlbVVDZDNXVWtDWUxoTVh1ZkZBaCtCbmNmTHgwYTgzSi9vNkth?=
 =?utf-8?B?YTFtWFZXTWhKbkViQkYvQmdlcWNlV0FKMk5xVWg2bWFwd1NpZnRJNWdLckFT?=
 =?utf-8?B?c0lac3oyb3d2bjVvNHg0OFZLSDdMeW1RVDhSSWd5RFVNNTJ0MW9tNlFIQWxU?=
 =?utf-8?B?Q1cyb2hpK1d3bU1ZYS9UeFpzVUYzV2M5SFFMNWJsOEhhaGc4TmE0Zi8wRSs4?=
 =?utf-8?B?MStzOVQrR1Q3N0c3ejJwSldxRE9CRW91QjdvdDVGRFFDbitsYW1wWnRKb1RL?=
 =?utf-8?B?YmhLa1h2QnZXZ1pIRFpPS3RXM25jcGg5TnhVam5ERGxvVDM4ZFIxWityaG9o?=
 =?utf-8?B?cHdXQ2ZsSmx5czltQXFXc0dGTlFEQ0VuZkNFcnZZZkp6WC9EUXlVVS9XdUJK?=
 =?utf-8?B?M1NQLzJqQlU0ak45YjdnRm5QQkVCeDBJUWE3OEJKQ3dUay9zck9KbUJjSEJE?=
 =?utf-8?B?bE5mODJEZkpLTzlwNmE4Nkp5TDI0VC9QRWtVdW5yTjhrNTNIekwzQXVkWVJH?=
 =?utf-8?B?VzBuVXp6WG1BZkYwU3BTWHM5cjg5M2I2SFFQQ3h4d2NRU3cxbi9nNjZtc0k0?=
 =?utf-8?B?S1VlVGlxVmRuZzkwamVsSlR5SVhNOHBlNndPbmJlYWZHLy9MKzhzNXZjdnNX?=
 =?utf-8?B?MXlMTHh1RHNSU1cvS3FaaHFkbU5MVm9zWTQ3bzRPYm9pVU9jQXJYVWxNNTU0?=
 =?utf-8?B?SHZEYzFOWkp3Sm1qazlkVnQrS2V4S1pOMGttcWIvS1Y0MWQ0RkpjVmR2VjNQ?=
 =?utf-8?B?NWJza1dHUmtoeUV2ZzBzUnM3NzJGM1FWckRaSXpkSEQvQnRPM0c5bTNSL3Jy?=
 =?utf-8?B?dDdON09GOHk0L3lTZnhsc2FrY293K1NzR2lnbzhheUs2aGRzZE1WSmRTZkow?=
 =?utf-8?B?YVpNb2pZN0Z5WmlKQ21oUW01NGk4QlhmUVRpamdPeEhmdUhSdUltV0RveG0w?=
 =?utf-8?Q?SoJF49U+ZZxTWYLk49P8DSDGa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6b621e-18e5-4c66-719f-08da90a40a21
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 07:39:04.6752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtVkUqfcdpZdfaE89ysTUI6/IwDmNao9xaPmmT6/FlCOCSFPbmok2JNjhNNTEZc2NtEe/ggSNBaaZ/SzfGJSaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6053

On 06.09.2022 11:54, Andrei Semenov wrote:
> Use deffered bitmap only in PV guests context as it not used for HVM guests.
> This allow to reduce memory pressure on domain0 while migrating very large
> (memory wise) HVM guests.
> 
> Signed-off-by: Andrei Semenov <andrei.semenov@vates.fr>

Did you see https://lists.xen.org/archives/html/xen-devel/2022-04/msg02037.html?
It would seem to me that doing what you want would be less intrusive on top of
that work, by simply suppressing the allocation also for HVM then.

Jan

> ---
>  tools/libs/guest/xg_sr_common.h       | 26 ++++++++++++++++--
>  tools/libs/guest/xg_sr_save.c         | 23 +++++++---------
>  tools/libs/guest/xg_sr_save_x86_hvm.c | 21 +++++++++++++++
>  tools/libs/guest/xg_sr_save_x86_pv.c  | 39 +++++++++++++++++++++++++++
>  4 files changed, 93 insertions(+), 16 deletions(-)
> 
> diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
> index 36d45ef56f..941e24d7b7 100644
> --- a/tools/libs/guest/xg_sr_common.h
> +++ b/tools/libs/guest/xg_sr_common.h
> @@ -96,6 +96,24 @@ struct xc_sr_save_ops
>       */
>      int (*check_vm_state)(struct xc_sr_context *ctx);
>  
> +    /**
> +     * For some reasons the page can't be sent for the moment. Postpone this
> +     * send to the later stage when domain is suspended.
> +     */
> +    int (*defer_page)(struct xc_sr_context *ctx, xen_pfn_t pfn);
> +
> +    /**
> +     *  Merge all deferred pages with the dirty pages bitmap (in order to be
> +     *  sent).
> +     */
> +    int (*merge_deferred)(const struct xc_sr_context *ctx,
> +                          unsigned long *bitmap, unsigned long *count);
> +
> +    /**
> +     *  Deferred pages was successfully sent. Reset all associated information.
> +     */
> +    int (*reset_deferred)(struct xc_sr_context *ctx);
> +
>      /**
>       * Clean up the local environment.  Will be called exactly once, either
>       * after a successful save, or upon encountering an error.
> @@ -243,8 +261,6 @@ struct xc_sr_context
>  
>              xen_pfn_t *batch_pfns;
>              unsigned int nr_batch_pfns;
> -            unsigned long *deferred_pages;
> -            unsigned long nr_deferred_pages;
>              xc_hypercall_buffer_t dirty_bitmap_hbuf;
>          } save;
>  
> @@ -349,6 +365,12 @@ struct xc_sr_context
>  
>                  union
>                  {
> +                    struct
> +                    {
> +                        unsigned long *deferred_pages;
> +                        unsigned long nr_deferred_pages;
> +                    } save;
> +
>                      struct
>                      {
>                          /* State machine for the order of received records. */
> diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
> index 9853d8d846..602b18488d 100644
> --- a/tools/libs/guest/xg_sr_save.c
> +++ b/tools/libs/guest/xg_sr_save.c
> @@ -132,8 +132,7 @@ static int write_batch(struct xc_sr_context *ctx)
>          /* Likely a ballooned page. */
>          if ( mfns[i] == INVALID_MFN )
>          {
> -            set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
> -            ++ctx->save.nr_deferred_pages;
> +            ctx->save.ops.defer_page(ctx, ctx->save.batch_pfns[i]);
>          }
>      }
>  
> @@ -192,8 +191,7 @@ static int write_batch(struct xc_sr_context *ctx)
>              {
>                  if ( rc == -1 && errno == EAGAIN )
>                  {
> -                    set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
> -                    ++ctx->save.nr_deferred_pages;
> +                    ctx->save.ops.defer_page(ctx, ctx->save.batch_pfns[i]);
>                      types[i] = XEN_DOMCTL_PFINFO_XTAB;
>                      --nr_pages;
>                  }
> @@ -641,6 +639,7 @@ static int suspend_and_send_dirty(struct xc_sr_context *ctx)
>      xc_interface *xch = ctx->xch;
>      xc_shadow_op_stats_t stats = { 0, ctx->save.p2m_size };
>      char *progress_str = NULL;
> +    unsigned long merged;
>      int rc;
>      DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
>                                      &ctx->save.dirty_bitmap_hbuf);
> @@ -669,7 +668,7 @@ static int suspend_and_send_dirty(struct xc_sr_context *ctx)
>      else
>          xc_set_progress_prefix(xch, "Checkpointed save");
>  
> -    bitmap_or(dirty_bitmap, ctx->save.deferred_pages, ctx->save.p2m_size);
> +    ctx->save.ops.merge_deferred(ctx, dirty_bitmap, &merged);
>  
>      if ( !ctx->save.live && ctx->stream_type == XC_STREAM_COLO )
>      {
> @@ -681,12 +680,11 @@ static int suspend_and_send_dirty(struct xc_sr_context *ctx)
>          }
>      }
>  
> -    rc = send_dirty_pages(ctx, stats.dirty_count + ctx->save.nr_deferred_pages);
> +    rc = send_dirty_pages(ctx, stats.dirty_count + merged);
>      if ( rc )
>          goto out;
>  
> -    bitmap_clear(ctx->save.deferred_pages, ctx->save.p2m_size);
> -    ctx->save.nr_deferred_pages = 0;
> +    ctx->save.ops.reset_deferred(ctx);
>  
>   out:
>      xc_set_progress_prefix(xch, NULL);
> @@ -805,18 +803,16 @@ static int setup(struct xc_sr_context *ctx)
>          xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
>      ctx->save.batch_pfns = malloc(MAX_BATCH_SIZE *
>                                    sizeof(*ctx->save.batch_pfns));
> -    ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
>  
> -    if ( !ctx->save.batch_pfns || !dirty_bitmap || !ctx->save.deferred_pages )
> +    if ( !ctx->save.batch_pfns || !dirty_bitmap )
>      {
> -        ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
> -              " deferred pages");
> +        ERROR("Unable to allocate memory for dirty bitmaps, batch pfns");
>          rc = -1;
>          errno = ENOMEM;
>          goto err;
>      }
>  
> -    rc = 0;
> +    rc = ctx->save.ops.reset_deferred(ctx);
>  
>   err:
>      return rc;
> @@ -837,7 +833,6 @@ static void cleanup(struct xc_sr_context *ctx)
>  
>      xc_hypercall_buffer_free_pages(xch, dirty_bitmap,
>                                     NRPAGES(bitmap_size(ctx->save.p2m_size)));
> -    free(ctx->save.deferred_pages);
>      free(ctx->save.batch_pfns);
>  }
>  
> diff --git a/tools/libs/guest/xg_sr_save_x86_hvm.c b/tools/libs/guest/xg_sr_save_x86_hvm.c
> index 1634a7bc43..3c762a0af0 100644
> --- a/tools/libs/guest/xg_sr_save_x86_hvm.c
> +++ b/tools/libs/guest/xg_sr_save_x86_hvm.c
> @@ -211,6 +211,24 @@ static int x86_hvm_end_of_checkpoint(struct xc_sr_context *ctx)
>      return 0;
>  }
>  
> +static int x86_hvm_defer_page(struct xc_sr_context *ctx, xen_pfn_t pfn)
> +{
> +    return 0;
> +}
> +
> +static int x86_hvm_merge_deferred(const struct xc_sr_context *ctx,
> +                                 unsigned long *bitmap, unsigned long *count)
> +{
> +    *count = 0;
> +
> +    return 0;
> +}
> +
> +static int x86_hvm_reset_deferred(struct xc_sr_context *ctx)
> +{
> +    return 0;
> +}
> +
>  static int x86_hvm_cleanup(struct xc_sr_context *ctx)
>  {
>      xc_interface *xch = ctx->xch;
> @@ -237,6 +255,9 @@ struct xc_sr_save_ops save_ops_x86_hvm =
>      .start_of_checkpoint = x86_hvm_start_of_checkpoint,
>      .end_of_checkpoint   = x86_hvm_end_of_checkpoint,
>      .check_vm_state      = x86_hvm_check_vm_state,
> +    .defer_page          = x86_hvm_defer_page,
> +    .merge_deferred      = x86_hvm_merge_deferred,
> +    .reset_deferred      = x86_hvm_reset_deferred,
>      .cleanup             = x86_hvm_cleanup,
>  };
>  
> diff --git a/tools/libs/guest/xg_sr_save_x86_pv.c b/tools/libs/guest/xg_sr_save_x86_pv.c
> index 4964f1f7b8..5fdc7e9590 100644
> --- a/tools/libs/guest/xg_sr_save_x86_pv.c
> +++ b/tools/libs/guest/xg_sr_save_x86_pv.c
> @@ -1031,6 +1031,7 @@ static int x86_pv_normalise_page(struct xc_sr_context *ctx, xen_pfn_t type,
>   */
>  static int x86_pv_setup(struct xc_sr_context *ctx)
>  {
> +    xc_interface *xch = ctx->xch;
>      int rc;
>  
>      rc = x86_pv_domain_info(ctx);
> @@ -1049,6 +1050,15 @@ static int x86_pv_setup(struct xc_sr_context *ctx)
>      if ( rc )
>          return rc;
>  
> +    ctx->x86.pv.save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
> +
> +    if (!ctx->x86.pv.save.deferred_pages)
> +    {
> +        ERROR("Unable to allocate memory for deferred pages");
> +        errno = ENOMEM;
> +        return -1;
> +    }
> +
>      return 0;
>  }
>  
> @@ -1116,9 +1126,35 @@ static int x86_pv_check_vm_state(struct xc_sr_context *ctx)
>      return x86_pv_check_vm_state_p2m_list(ctx);
>  }
>  
> +static int x86_pv_defer_page(struct xc_sr_context *ctx, xen_pfn_t pfn)
> +{
> +    set_bit(pfn, ctx->x86.pv.save.deferred_pages);
> +    ++ctx->x86.pv.save.nr_deferred_pages;
> +
> +    return 0;
> +}
> +
> +static int x86_pv_merge_deferred(const struct xc_sr_context *ctx,
> +                                 unsigned long *bitmap, unsigned long *count)
> +{
> +    bitmap_or(bitmap, ctx->x86.pv.save.deferred_pages, ctx->save.p2m_size);
> +    *count = ctx->x86.pv.save.nr_deferred_pages;
> +
> +    return 0;
> +}
> +
> +static int x86_pv_reset_deferred(struct xc_sr_context *ctx)
> +{
> +    bitmap_clear(ctx->x86.pv.save.deferred_pages, ctx->save.p2m_size);
> +    ctx->x86.pv.save.nr_deferred_pages = 0;
> +
> +    return 0;
> +}
> +
>  static int x86_pv_cleanup(struct xc_sr_context *ctx)
>  {
>      free(ctx->x86.pv.p2m_pfns);
> +    free(ctx->x86.pv.save.deferred_pages);
>  
>      if ( ctx->x86.pv.p2m )
>          munmap(ctx->x86.pv.p2m, ctx->x86.pv.p2m_frames * PAGE_SIZE);
> @@ -1142,6 +1178,9 @@ struct xc_sr_save_ops save_ops_x86_pv =
>      .start_of_checkpoint = x86_pv_start_of_checkpoint,
>      .end_of_checkpoint   = x86_pv_end_of_checkpoint,
>      .check_vm_state      = x86_pv_check_vm_state,
> +    .defer_page          = x86_pv_defer_page,
> +    .merge_deferred      = x86_pv_merge_deferred,
> +    .reset_deferred      = x86_pv_reset_deferred,
>      .cleanup             = x86_pv_cleanup,
>  };
>  


