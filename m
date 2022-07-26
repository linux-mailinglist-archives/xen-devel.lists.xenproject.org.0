Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15027580B04
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 08:15:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375018.607272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGDq7-0002OB-GY; Tue, 26 Jul 2022 06:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375018.607272; Tue, 26 Jul 2022 06:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGDq7-0002LD-Cs; Tue, 26 Jul 2022 06:14:43 +0000
Received: by outflank-mailman (input) for mailman id 375018;
 Tue, 26 Jul 2022 06:14:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGDq5-0002L7-EC
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 06:14:41 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50054.outbound.protection.outlook.com [40.107.5.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ab0e178-0caa-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 08:14:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8474.eurprd04.prod.outlook.com (2603:10a6:102:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Tue, 26 Jul
 2022 06:14:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 06:14:36 +0000
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
X-Inumbo-ID: 3ab0e178-0caa-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJeEYQvJoPBU8Lroxmms8XZdFyzJxGdCqVaFY+I01VqQSB4C3KKz5Rd1Hc0DhCR3IS3Fo5SlmIsvbFot4zuxD0EKdqBBIqaVoKlzgS/Mx1baLm39tH/ozK+G58MmwsRbN6hXVI1EPPYKx2LV88/zF9pMi7cwciz7sR3id3Ku/IUfF3a9Xw8F6aw5b64jiSdPG95Pvg43bmHjtyXOKUsFK7XwAcUqrOKYoViZ5p/5j1bfmN88zvvFbrKLLdniFPbVg6YznKAKzVTpuaNe5OXqJ+nFuGDOCRKqk069fRVBoa07ORsBYXaC8VhQg4/Kml98klkAM6RarQJZIX0TdEHPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dD0tPYF9vg1Ta58uv42EHd8UFXVBnbGT6bTL29YE+iM=;
 b=Mp4H8m3niXOBvPfNDxpVbdkbHU8nT8Amam7l1kf+35mt0GBugd7WaZgx2QWMlnt0p2i0dTE/ksbYuKo9apDGTaC9RukQ7Wp5qh5L0QtkWsbciIL9tYFYy+MhXvQRhVwtYehQfEpTnkdYSOTaYLSmRQReAp8B//Qm6DEflZ400zWpkG3TlZBRYzZY5015KMSan9bJ1TVKaddRTf8H+wAvUaBCAfNhBK/IDabrZeR9RkmQF4ESCQuauFuPgUgaJhREU6zvQnhS8y5VKuPTeH+Fn0arEqRDWFbvRfJ/QSPtKq5pJQtsBvnWzIHNct9m6cJR/g1j6FpAFnSVRgMQCmy7Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dD0tPYF9vg1Ta58uv42EHd8UFXVBnbGT6bTL29YE+iM=;
 b=h8lvDqIu0MCieObFd/LCqkM9xmRKzbsl23j+YnR75qVHbSAg4x0Gu63MfjHoDSrZLCmilayIw4OAarecCY4iyboTRr57fcFUYr7nd8y4TW6NFE4tgR0Z1LhAAVcIhX5pd43wwCo3LMOGnydZaT6pfH/SgXk4W2MYTR5IB14s4Ia3iAqPD/TCha7q8oRM7DfXjgmiXhp4WTz5P4HDqriZgygQy/s6z/045VVJsTiC2X/1T9RcGTuSnpEEe61qajBkk+NT6cmXpd9g5APoCI5iHuEkDsDsKM7Y1ASyjEGAdOnpnQps073y5gUAVK8oJZkZxi/hVb5EMKiZWkuJVnieUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c50304a-0a9e-8488-ec97-555403f8f301@suse.com>
Date: Tue, 26 Jul 2022 08:14:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] page-alloc: fix initialization of cross-node regions
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "Xia, Hongyan" <hongyxia@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <473c82d9-0f81-b4f4-70a3-8dfc3beb2be2@suse.com>
 <1f43b3a1-a580-d1a7-c52e-06ba591ae3a0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1f43b3a1-a580-d1a7-c52e-06ba591ae3a0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdc1302b-94c8-4bbd-83f3-08da6ece1d62
X-MS-TrafficTypeDiagnostic: PAXPR04MB8474:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CR16Y9YnaOLqXPZr5hqxrhH1ePFhcuZnS1mquUMCyP488MS4T6MbwNYl0yXNe5JFGO5Q2EnE5qoWKKbar6yjQbxNB50YssP2RXaVkzdWUuHLJzvrTHjrKMDYqMbqlxJaYMWItI3pp1TyJGgRSO+CKBTCQM24JGwkGIb3B/slxPAqh/jqvRWtvhXUOQoPN9wPR7kS0ve3FT2HWemQfA15h8ISRPmPzjEZf9evbgebdLFBO65/vzFTTSSVbybZeunA3/PKxYyrSWHKwt2lGofahjjBJyGZVhEE+PgfSiTy7UbF5IS8z0k/hVC1Vock25/H35mFSEOkE9M6eAh3+Jnymgy2AOiyn2qWlJblPvomdlHox5JHa+AtJzgO2Y5Htb+pWWKxqKavv1YJ44epYallanq2+VMigySB09JFAeNvn+con/ffjDbOotYx5SR7DalilrbAuMUP4qqbNBfc0phmo94W4CtTlkr4iWMLtS2FfjlKEd1T/bJkrgtke0rVJzzT9X2x3jzzpGemCR3YtlfSZu1grsdIgWVfLQr7Xxd14CvQIJhVOcRkA9Gakp4sCKV2nPnq6yyDCqh8F6y/rnl8VnQcKI/6WuySmVZX/DJiH7fkKkW3kcWNhMaRQlM/GjXYVvAIhZ28VhkGvtaoTXDvIh2lDvkytltVDiEuaXQ9ND+/mpv7jKKd2hpU6s/3Ex59Mx2pegH6K/QfI6r1CS41TWlu5Cs+3+S7BGGrU9z4HAZO/FnyFZw7u4LUoc0FJX6V3j0kU8dVWtY6LdXzy6/03e2osSspqPVHfBKJVluhSR+hWb6Z1l8G65sFY+mMHTrCvSntlk8F0Pw/ieoaqUwy9A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(39860400002)(376002)(396003)(366004)(8936002)(83380400001)(26005)(5660300002)(38100700002)(2906002)(54906003)(6916009)(478600001)(6486002)(316002)(2616005)(8676002)(66946007)(186003)(66476007)(41300700001)(31696002)(6512007)(53546011)(86362001)(66556008)(4326008)(36756003)(6506007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEpnSnF2aG9XaTdQWDQwQVVpai9xREFUS0pTakZJckF5bWJQME8zNU11L0Q1?=
 =?utf-8?B?WjJTQjhlQmc0bklpb2g4eXQ2SEVlYm9NaFRwNkc3S3dRZHBSUEdLcHFoZUJH?=
 =?utf-8?B?MTBXWHVjV3o2WGkvTjBpVEJ4MnJRbi82VW1wdWw4Vk5RZ09uUjdvMnA0Z2R1?=
 =?utf-8?B?VUJndktBd0wvbEdGeCtDQmphSGI0SW1JYndnUnhYYVRXbW9vdWVZbzdKMk9N?=
 =?utf-8?B?RzBoNi9oRDM2M1RaWnNnU3hxR29Tcm9XL2l0ZEZtRmNBZXFkZ3RjZ2ZDYnhZ?=
 =?utf-8?B?UGJtekZienVkOXhjeFY5eWUzMXh5M1NCL0RwVyt4aFBmZElWMloraU9EWElz?=
 =?utf-8?B?VWZPK1RqVHlQMlBBMyt3SmVOeDJrL0FLd2MwdHI3NWVmVzhsNHErSkR2dm1F?=
 =?utf-8?B?aSsvZThFMFNyWkZoelRFYjdWNVQ0QU9JNTdWQWZ6bzlNbExXanZtTVdXRE9s?=
 =?utf-8?B?RFhFdUdYY2U0eEdGOFRMeGZWemxHaTBYeituRnNHUjhTSnhmVGJndkJNdUJH?=
 =?utf-8?B?eThnSk5SWjBNOFh6dTVlYW1SSGU4UTJUYVkwOEliU0p3WXFKVlJKdk9UYnVX?=
 =?utf-8?B?RHprQVpLSkpZQldaSHJxVmIvY1g2RUE1NTFHSmFkREdwZ3JhQldKdG9zSWhG?=
 =?utf-8?B?NHRVSmtFeFVZcFJjV3k5bU42MDVTUGdQaFdidkVqTmtsRjMxY3JEOG5CNVFo?=
 =?utf-8?B?dHFkZktsZkxwWEJNNXRQaXZHbGlLMmlhZEIwV040Ti9jWU5LUElHaExxa2dC?=
 =?utf-8?B?MEllRWNMVVZNWXJJUGJOeE4yQTltMUpGN0tJbFhVUVB4ZllCLzJWVkU3WDFv?=
 =?utf-8?B?U1FnN1h2RmRuVWsya0tpbW9RdU9oczVzakpOeXRpemhYdmVYQUdxVUQ4UWYy?=
 =?utf-8?B?dkFKQWMrTUFCMXNEeldkWUxNMXpjRVRQY1RkMHlDaWdvU21LYmJ1dkNRNU02?=
 =?utf-8?B?VXpDejFOdEF5Ulp6VmI4b0l6QU1aTzVvZmNqeEZkeWd1cHo2VmVRQng5U2ZO?=
 =?utf-8?B?SGpQR25nZWU4dDd2andXVWpsV0x6czEyRlB5bGNnZlIzM1JaN1BEUXdMNFI0?=
 =?utf-8?B?VDN1VGh6TElyYW5SaUNNNTRJcUZUVk1mSG1CbHRtYVFwOG5aNHRmY1pNMFNK?=
 =?utf-8?B?Z1AwdVZHUEg5VmhoSVJvdStiKy9RbWJmRU5TVzRqVFpGbks0Rm1rQXZJd3Zy?=
 =?utf-8?B?eTlmK2xtcnUvZ2EyU1BmTzAwTFN3SzhqdVlKRUF3alA3S1JPZHdla0VjUUs5?=
 =?utf-8?B?ODdGNVJPcktyNE40Ny90MS9vUVBXQk5DUjJjbFBNVnZsdTA3M1Nrc0RwU2c0?=
 =?utf-8?B?S0VDUVAzcVg2UXZvVWk5b0pzRmIrb2x4QXRORTA5azFGRFFsSXpXZWhzbGpt?=
 =?utf-8?B?bmcrNXBXMkJaWmZXV0drUmpsV085dnBhak1PNHV6Mmh5Q0Nzb3IvQUNKdUc0?=
 =?utf-8?B?QnZDTkpEOXE5NGplZlBvYk9yUGFjdDkyRlBwd2luL3Iva0ZwZ09jekNjQVpW?=
 =?utf-8?B?N1o1cGkvQVdXNVJlYzZmWENCYVVWQW11SmhOdWxYTmE0MFp1SkFZQ2ZJV3BZ?=
 =?utf-8?B?T2EvTnZaR09GZHpVOFdMdmlIZHVpeVVkOG9OdmhUeU9wKzRXN2U5Z1hqazI4?=
 =?utf-8?B?eVZROG1VS1Vab2ozTGN6dVBqbXBYWWlqd2Vyay9pMUhnYmFyOWNsYUdnYzB0?=
 =?utf-8?B?eDVnVTFoUWExV0lvY1NuQVBCZ2QwOE1OYzdGa1paY3ZPOTBTaUsveGpsOVJD?=
 =?utf-8?B?U3R3d2hLWFhoZ240QnVLR1hTa2xkeERzR0E5VGwwRzZhbjhWL0V5S2lEa0RW?=
 =?utf-8?B?cEh1bWhDb1JVSlh5SSsvMEJjK0EwR29KNkF5Rnl5RXhWdmI1RTV5cEdqbThJ?=
 =?utf-8?B?MWVvUnJkbWQwaWtOaXFpYXo0TUp0Y0JrWmN6V09PM2MwV1E2M21hOHQ4dDRp?=
 =?utf-8?B?VTkrSGRWcDhKQmVwVFhGUURQL3EyYlArQTVzdG8rdllONlpnU28zN3p5RGVD?=
 =?utf-8?B?YnZHWDg1Z29LNTZ2ME1sZHoyU3p4THFIVlcyb0VXWDRpM05nQTdBNmJoYzBC?=
 =?utf-8?B?NHBUQzNQRExoQVBWMGN6UTRQQTdqcWNxdkg3OWZUcFFDREJFTWhVZjROcWY5?=
 =?utf-8?Q?aDB9CgzfB5fXpDs25MIqWjB9s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc1302b-94c8-4bbd-83f3-08da6ece1d62
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 06:14:36.3379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G5W9thCPcZxCAkVbQ5Z3vHNTeuFcZKdxFN24vBosfev+c0xlYnT1FqhkJ66EUPsKtD+hQmPtEvJI8y6MPcUMQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8474

On 25.07.2022 20:54, Andrew Cooper wrote:
> On 25/07/2022 14:10, Jan Beulich wrote:
>> Quite obviously to determine the split condition successive pages'
>> attributes need to be evaluated, not always those of the initial page.
>>
>> Fixes: 72b02bc75b47 ("xen/heap: pass order to free_heap_pages() in heap init")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Part of the problem was already introduced in 24a53060bd37 ("xen/heap:
>> Split init_heap_pages() in two"), but there it was still benign.
> 
> This also fixes the crash that XenRT found on loads of hardware, which
> looks something like:
> 
> (XEN) NUMA: Allocated memnodemap from 105bc81000 - 105bc92000
> (XEN) NUMA: Using 8 for the hash shift.
> (XEN) Early fatal page fault at e008:ffff82d04022ae1e
> (cr2=00000000000000b8, ec=0002)
> (XEN) ----[ Xen-4.17.0  x86_64  debug=y  Not tainted ]----
> (XEN) CPU:    0
> (XEN) RIP:    e008:[<ffff82d04022ae1e>]
> common/page_alloc.c#free_heap_pages+0x2dd/0x850
> ...
> (XEN) Xen call trace:
> (XEN)    [<ffff82d04022ae1e>] R
> common/page_alloc.c#free_heap_pages+0x2dd/0x850
> (XEN)    [<ffff82d04022dd64>] F
> common/page_alloc.c#init_heap_pages+0x55f/0x720
> (XEN)    [<ffff82d040415234>] F end_boot_allocator+0x187/0x1e7
> (XEN)    [<ffff82d040452337>] F __start_xen+0x1a06/0x2779
> (XEN)    [<ffff82d040204344>] F __high_start+0x94/0xa0
> 
> Debugging shows that it's always a block which crosses node 0 and 1,
> where avail[1] has yet to be initialised.
> 
> What I'm confused by is how this manages to manifest broken swiotlb
> issues without Xen crashing.

I didn't debug this in detail since I had managed to spot the issue
by staring at the offending patch, but from the observations some
of node 1's memory was actually accounted to node 0 (incl off-by-
65535 node_need_scrub[] values for both nodes), so I would guess
avail[1] simply wasn't accessed before being set up in my case.

Jan

