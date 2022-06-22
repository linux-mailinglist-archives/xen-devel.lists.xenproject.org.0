Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAC85544B3
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 10:42:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353554.580490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3vvb-0004WO-4A; Wed, 22 Jun 2022 08:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353554.580490; Wed, 22 Jun 2022 08:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3vvb-0004TW-0u; Wed, 22 Jun 2022 08:41:35 +0000
Received: by outflank-mailman (input) for mailman id 353554;
 Wed, 22 Jun 2022 08:41:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o3vvZ-0004TQ-Vj
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 08:41:33 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20068.outbound.protection.outlook.com [40.107.2.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e1f53f7-f207-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 10:41:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB6332.eurprd04.prod.outlook.com (2603:10a6:10:d1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Wed, 22 Jun
 2022 08:41:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 08:41:29 +0000
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
X-Inumbo-ID: 1e1f53f7-f207-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1v1a6o+8crOkW3alnHwdaCgQIrWphjEELEGSt/N06BR85pE3ubIxQMPK6aSOHoqJl2EpiFudoULBTvDMR4QYi1sncNLBT2uJF64pTIdOLw7o3G0MKHvO/6SHmDrLGOpFQdj4BCpeQDFv4rucCSL+WvgWjRkpqUZJDBLJYKGwjV79Bp1lzCeb711iErJ3tYcjkHN48o2nHybqsrQwxjwRf64pvOnx2ch53H54fwOLUwj05i+V1CwiGHeKEc37NrUe4mKDEjpz8DFKm5CTgTq4NSY5LqZj9baTWU5wXQxbPMKZnEt6PbMOFFRj75hAlSpcE0lvWk5gWRD7W8VYTP1PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGTYiYmYf7ItaYZrWZ98gkYlE3bj2CRd0KuSig9IKF4=;
 b=Rlwn3sjTTeH4KiPUCMw4CypVdEZe29iGjmwiIk0E0Ajuy74lhmkHcnn7qWQvomra8fCzhZXId/uPpUQPRcKsjarQv1xIxgaJXwSkw7+a41PloMcen/AizppLvJR3/VjAv99ybdhHOKRQf5iIj8axu25Cdpi83dFnsqv4tts90mUiBGRltLlyYhS6geEM7Ek9sFXrLd7QUtdYQrVhn9LroveRCKLNspvuZitpNHOYjBQACAVZ36NacQOmbk7Wu+02K0oXq7jIU9vHgw4SyzCbKSOXgAh+IVsdTMHm89c08HbwLghBapD6drX5+E/yOBpDvpNP9zHr4/FwR36cILEkKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGTYiYmYf7ItaYZrWZ98gkYlE3bj2CRd0KuSig9IKF4=;
 b=ETBdevqhDUJ6vT3tdaaLCbVskLFoD9dyoP7rEd4nK3YdG/0IPoRzkWGPE6vTOa7MG/Yi8OVSeecqMvyGbgBour6KKdm5V/sMPjIOi97yL5vY+jby6Mvv7730vaau+SbVCrX4LT7MF1EgIqQ+SVNtbWODmucC0oYnBk0t1ElQJ2qn4pWs3oE/4DpVO8YCs53v2v+Qka55ZhJ7+ALp/MRg6YjMgZ+V5QCh/Hc/iKs3PzCJ3tWwpRmfWcQXL2qZutki+wzip7k6qtlGce438hOhsxvde6ldQacBWwBEWeHXaxtWE9+ocEk1aFMFgl9PDfspYHnxiP7pH/zKC15krJUKFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aaea6105-e83d-feba-edf3-3d7e26b90769@suse.com>
Date: Wed, 22 Jun 2022 10:41:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: disabling mercurial repositories
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: committers@xenproject.org, xen-devel@lists.xenproject.org
References: <YrHMSJg6Rx9ULvr6@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YrHMSJg6Rx9ULvr6@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR1001CA0044.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f209d3a-50e2-4a53-c103-08da542b007d
X-MS-TrafficTypeDiagnostic: DBBPR04MB6332:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB6332AD66715F416952BE4066B3B29@DBBPR04MB6332.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k29Q6B6hqyjTLHcJqa64mQ+jABZLkRsWO8kfGjmpSk1SL9uuGxSIUf8IdD5Dfx0p1dLN2gAE0ii99n1fUxZ1Q5ZGa4w4KQaYM5GrcZUWbXqit/yOq2qB/1r4wH+myvkzZFXXGEskCR/4ZRUpR345OgX5HNw9aTC5AU80R+tUirjn0rNnaYVwlffzFzKVoiCHV3LLLmk9628ecPnpGIdszXWcvsVGHKb3NRoRKt6966oH9R8xuX2CQcKOohp/VwxWikzqHa+HrpzNjBoRunrdeLvmU+3J0hY1nsu4M0FhN2kUx2Sj4mDvbGIdb0JMqUa19seL/A9BYpPytl58u7NYUjJCvzxamPdJs/TXRJq35a4oQuuSFRqf/Uwwrc9H64MbgFRoveqALJLg7azuQl/3t2DqdoBKWEZbqn2oVZK0DeYFdBazPTJrSB1DWK0HBH9fanop4NIleiKLLq+z4oQPjAyC0sB5nxThOWBjQT8UmjxA3jOGDsNni6kJWBkEwVWAlmvp+9PnikyOmK5pG5yJX00W1+W1bUJF8DndwOdxBBzNVkViavg7ZiwKTk6s4HdCf/KtE2fh0Vi8oHUrGENiOokH3CCEc6T3Rab5aqmvr8rr45H2cYd7iMRtijrKCHkLyGKPXahdMwKqu+z7IDv1jOEAkaXoLJQ5SiZJoKb4GAEf+j2x/ZfxtW6Zgxe++SoxYgy+U+2kQZ9wW/1UQTWTrWAbUwz1C2uTrKoGRVuDgQEawD1ay5C4tp4ql2mlaU7UJ5NzY5jpA8K/1FNKz/Rd8fPEAyIv90NBS7XEIJN7eBg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(136003)(366004)(346002)(39860400002)(186003)(53546011)(26005)(2906002)(6666004)(6512007)(86362001)(31696002)(6506007)(2616005)(41300700001)(316002)(36756003)(5660300002)(38100700002)(478600001)(3480700007)(83380400001)(6916009)(4326008)(8936002)(31686004)(8676002)(66946007)(66556008)(7116003)(6486002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXpKRnZvWlNib3JYSWN4MEl0dDBDcGhNbnRMa0hodkxBMktab08zOXV5UlVD?=
 =?utf-8?B?VzU1RmdsYjNDSXE5K2poeVlSWTlnNGpHbmRyUUM3SkN4Z3FPWGg0d2IvWmgx?=
 =?utf-8?B?ZmdFZDlFT1pKTElDQ1dDbUF6b1dEQjAvajd5VXkzYW91QldidkdRZHVzczJ1?=
 =?utf-8?B?aGRKelBkY01WU1g2b1AvTWN6dlJORW9OZFdqUkJ5YUhnV2dRVEVmWlI4a0Na?=
 =?utf-8?B?Y2Vaa2FQWjkxMldWdGt3L0FacU5ndGFMclVTckxVbmFhR1kwZzRwei8zZnJF?=
 =?utf-8?B?V1F0TkR5MU53clV1Z3VOTFRvbERLQzhCMGIzaXJHY0ErTXMzSjZJUGl0U0FK?=
 =?utf-8?B?VU1kY0RCT0k2eGVHMmFJamU4SUtKZ0sxTEhDRUF0cjg0U3pCbEtkdnVZbW1M?=
 =?utf-8?B?ZXRyMm5OTXBvTWNCbzczNGM5TnV1V3NCNEJYTlMwZEp3SEJuNHZ3SU9zN21S?=
 =?utf-8?B?aC9xNUEvM3JXemk4OWJ6NVNIR0xpOXpRVkV3WkhCYXRGM3l3VHlUQVdMcTRQ?=
 =?utf-8?B?bmdiY3dOMWZFZ2JPN1NOWXVhRUMxOUF0cis4aSt1bUErazdoZnhDS3FvVE5z?=
 =?utf-8?B?SE15OXplVXBEdENaclhTOFY2UHplVStXMjhCUzhZVHRJRzFFMUhzNW02TTY0?=
 =?utf-8?B?KzVKTEdKS3pLVXh6MGpDR2pleGc2b00rZTU0SnlSbUdZSWt6RGRtekZVQmxT?=
 =?utf-8?B?U3l2bzYrMHRNb3paVVY0bjdtWXR0SFNsbi9UMnVubHBsSGh2R0FORjQvQ25k?=
 =?utf-8?B?bUttRzlOYkl5SmpaLzJYOFo0RjhyZldiWGMrTmQySHl1NmJwZmdqOERZY0tz?=
 =?utf-8?B?d09CQjZ3MW5XazROd2M4Ry96eTVCWGsyR3JIZ1VkVWlad0ZQdHk5YUszaVgw?=
 =?utf-8?B?ZGJ6NmhDMmRRWWNtRGdmcXJPMFZ1VWgyM3NWa0R3aFRNVjBjdDhrOEovakRS?=
 =?utf-8?B?aVFUMlAvUGJha1FPc2hFSUM2aHl0YVBzckdWN1htdDJKeFkyc3MxQlVVcWQ1?=
 =?utf-8?B?QmdrK3hsRWl2OG0ram1FVTgyVWxIbUdPOHJHZkplMDU3blNYVGtYcUFweWRy?=
 =?utf-8?B?cDZoWlQ0VjFGc0JUSEgybEI4djZhSkJyNWxYZGVQWFd6clBlc3UvNjhGNlJJ?=
 =?utf-8?B?eXdUc1JpOC9yaEIybUp0eU5JSm1rUVpPcXR0dkEwcVBFMHFwWTR3TnVRdnlx?=
 =?utf-8?B?Nk9mOGE0MHhqUW9tb0xnZjVxeWR4QTFwZEFRRDgrak5uNXF0U3ptYmFxaEdn?=
 =?utf-8?B?d3psa3czYW03Y24vd2pQMk1BVml6a0g4eXdRQ3lPd2s2SEN1djNQRjVxTXN3?=
 =?utf-8?B?K2pvME9kb0gwdmdyN21BV3BkUFVUZlRNa2l1NXRGeitrS1JxNzNyanZOK3RF?=
 =?utf-8?B?dm1adWpRNUQxa2Y2ZEc3RUhZeVVteXE0amJ6ZWx2ZzB4VU9XelliZkRoQUx0?=
 =?utf-8?B?dE5PUEJDUkEzSW1tQTREZ3dIRWVMOWdlb09rc1l2MmsrYWJVT25qUmQyUXBP?=
 =?utf-8?B?RlBnR0dUbHc2bGp6cUJLRTFSZXQwV0k2SFc3aTcraXNIY3AxL2VxdjYrSE1y?=
 =?utf-8?B?aGl0YjNVbGtFN3BERjBJRGxSR0V0K1pucHplbk9LL3dDZTFnd3c3RVpycjJj?=
 =?utf-8?B?dHplZXZtYWhtY1lxb21wbzl3d0xlQ1dESGxIU1Z0YWdybHlLcW1sOEhSbEJU?=
 =?utf-8?B?UE1oUGtxajc1NjBhWDJONWViZ0lPS3MySGVqblBrUUVrNnJSbHZTb05mNkJ1?=
 =?utf-8?B?Y09oeGd1VlpCcWtQWExDd0tYL0RKU3RoK0twcmdXZVpkZGZHQjdjRDU4cDFO?=
 =?utf-8?B?c1F4SUZjMCs5VENCb0JOellqekhKNHhyZm1WaHZscit6cXVzVU9xZW9Sd2xz?=
 =?utf-8?B?dE9wSCtLNm1tUll5NlN1bkkremRXbm4yZUZLVkdFRzFtcFAveEZYQjdtaGxM?=
 =?utf-8?B?dXdpQzBtNHdBL3lMNmpnaSs0bnNBWDdHK0MwSHFzbGJZdjNJeVh6Q2lyc0lh?=
 =?utf-8?B?MkVHbG13cVp5RkZNbVR4QjJoeldnZmgyUjN6WW04U09paURSb1JVbm9iUXBr?=
 =?utf-8?B?ZGwxNElpSzZYMFFCTkJoMFdubXBmY09hdEkyUUwyajVYSnJiYTZwVUVnS29G?=
 =?utf-8?B?M3M0Mm1iZlJQbUEzTEpYT2txeHRkS0Mxd1NldU9TcGw2YUEyaFB5cFVEcGFx?=
 =?utf-8?B?K3FoVHpkTkZxczZXMWtxaWZQdE4rNFNUbmRvbm1vZUVBUDVjMUQ2K1hLS0Jq?=
 =?utf-8?B?LzRSRWxycEF0ZHBTb1U4OGZCTkh5TFY4R0NidEZ5b0gzY3VCZ2VKcFI2UzdD?=
 =?utf-8?B?VFFyYmR3d2hsemV0Z1FickJod3o5bWlaTUxhM0M4cXBUNVNmeG9ZZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f209d3a-50e2-4a53-c103-08da542b007d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 08:41:29.6477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7rnLGMtsbCbqhQS83EBCivFEOOvR6gieM53rzwefHnWOw+1Rc0y8lq2mxl/bLYR3Bl3Nqc0RvD8zzomqxjs/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6332

On 21.06.2022 15:48, Roger Pau Monné wrote:
> Last week we had a bit of an emergency when a web crawler started
> indexing all our mercurial repositories on xenbits, as caused the load
> on xenbits to go beyond what it can handle.
> 
> As a temporary solution we decided to remove access to mercurial
> repositories, but the contents there are AFAIK only for historical
> repositories, so we might consider completely removing access to
> mercurial repositories.  This would however require migrating any
> repository we care about to git.
> 
> I would like an opinion from committers as well as the broad community
> whether shutting down mercurial repositories and migrating whatever we
> care about is appropriate.  Otherwise we will need to implement some
> throttling to mercurial accesses in order to avoid overloading
> xenbits.

While I wouldn't strictly mind its shutting off or the disabling of
hgweb as was suggested in a reply, either would mean to me personally
that it wouldn't be easy enough anymore to warrant trying to hunt
down the origin of certain Linux side aspects in the 2.6.18-xen tree.
Admittedly me doing so has become increasingly rare over time ...

Jan

