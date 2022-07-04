Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E93E56509B
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 11:20:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360043.589409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8IFZ-0007gp-Mf; Mon, 04 Jul 2022 09:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360043.589409; Mon, 04 Jul 2022 09:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8IFZ-0007eo-JB; Mon, 04 Jul 2022 09:20:13 +0000
Received: by outflank-mailman (input) for mailman id 360043;
 Mon, 04 Jul 2022 09:20:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8IFY-0007cn-5S
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 09:20:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061.outbound.protection.outlook.com [40.107.22.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8074b097-fb7a-11ec-a8e4-439420d8e422;
 Mon, 04 Jul 2022 11:20:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2584.eurprd04.prod.outlook.com (2603:10a6:4:38::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 09:20:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 09:20:07 +0000
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
X-Inumbo-ID: 8074b097-fb7a-11ec-a8e4-439420d8e422
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VS/lHqEn3OKzIm/Vxlu2HDuBUo65e10ZokgIB0xVmf5Gf9tnq6xtBPjdUwIupt+mX31kdzh2bfEJQsnBgjSUdKT1sRVSH/E/oCBm0A8V6dGCvdR6K1gizGs5Tx8GHJDuzHulZtRzCRFHxRpoqRocW1L7Wxeczxe3EcQ1pm2KcoWGaWIg8Xc4xekVD6qjY+0Uss5A0N7MfhqZab/FjNBtxs+sh+0aHDDS2h4kX0BKK1OufeeXcP+3ab1j0CKPUTbqYjLusd8BMfqSffBm0ADHAg6A+IqgNtSggq1tEbc0kzLS02fEwM8NLeJQ1mesYW9ugqPBEzT9rdQ8Dayla86MsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9QOVyzSK01MEMswLZkjhy8t1AvWi5qFWrfhNL0sxew=;
 b=k8Lf6Q3eN69icf2RB+Q7CF62b9KnyV35kH8FsqSEHQsvuWa6JXovOFg2uoH7/9iMoixun6CTQ/nTPs6g9muHwWKvOiRy/2IOfp+vwUleXAksPwNljS+Jgd0ndFHuSQqrdyacUKj7XYuuSJEPWTIKQLS044xr0JwaFxJHVtp7FzxUFijAMX0DWXIWM3IdOwznUy9+zdedERfin6VIHnBtZ82x4/pYw2D2eLJksVkPNwS2/f/x8tXwFWeYbHgtHaIJ1scPDxRLXO+wZqDmpYWFaudRvZkhFvr0Ex7C7c0liE6JkCEkC+0hkkZtz+RTz6iC7aWXzXHnphAabChB8yPV6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9QOVyzSK01MEMswLZkjhy8t1AvWi5qFWrfhNL0sxew=;
 b=g4tzIbTt/5fZsiovrGPRwQOkx/fXWRLQm+HuB7zz1tVTG5i0apama73koR3ZS405JFA4tjtlx8ocHGEseIgNNw2GYj4bAMLCa9rXhTryMF76cOnA37f7Wux8P+Bc1oqWOwtO7K09o0hh2wnc3gxyA9J079wKOl3cjYArLviI7YaKFvobt3V+xrj4EWKADq8LVgdM9YpAamfHVLUd/YYK62beuQpEf5/9rA/vJGv3Oj/Aj2JP51N7frvWKhClCGJ5YYrY6+FJqG7MQxoeJuWFkzX4Rez8HBlaCyUPZCU7VbGZ8KsgjlAuDPdr2V9tqGHHMuMYTogGpNLMk11/L2VIBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <72ddf6bb-be0a-ac54-075f-6f9196cd9e47@suse.com>
Date: Mon, 4 Jul 2022 11:20:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 0/4] mini-os: some memory map updates for PVH
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, wl@xen.org
Cc: samuel.thibault@ens-lyon.org, Julien Grall <julien@xen.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 "committers@xenproject.org" <committers@xenproject.org>
References: <20220621072314.16382-1-jgross@suse.com>
 <3349c933-ed0d-3177-b494-ef4a6654d12d@suse.com>
 <bfe594da-dbc7-70c3-72f6-a1056e3a549d@xen.org>
 <f1a6c96d-6f65-358e-7a31-5f0ead3e3a10@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f1a6c96d-6f65-358e-7a31-5f0ead3e3a10@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2fa9573-77c2-4058-2158-08da5d9e633c
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2584:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	faG7/4m6Cbe1uRZlybqlMLZ5vZOKIB5RAacGC8yBgx8fDUitzqS+scjZvS/RkyLF4F4MRVK8B4zgOZVISYvtUoMGzAlCAq77h+PwIruYlCC/b7hvnX5SiTUqUNN6Hpr60GKK6rgfWkC4efaDtj7/tLikJjtMktdG6FBiPmNldBz7WI9ysFv5XT6UEcMTmRiQ1keWR//dDFX4RnVlYwwzSrbBem02OYW+2Rmd9i2cfPRNq2VrUM0fw52OIepDtSld1F4sNycYFPWLUXka4OmKXXJ1l6Dr4e5YlNtyRktVYwyS4jXfjgQDne+bZmuC5M0yZ3wPz1rTX3QSejj4+tUy7Rs2iQbSSgtRoCS6xtOl3Mz7O/X9z0Tip7RNyVbyPHyJnzeDKMty4BV12XNbvvNxHdupyuI6RB4L15ySHFYaOjBYf92DfS8Uw9hh7UPyBDc+GHV1JEcpVVY/5la3oV+QfnTOelvz37oOMvv5xHdXKG49mxbdtUdioI+ANTzdqbrDgKoJZEGyTfNE27RwxvMhzJM+hNfkqK/kYpvlCNgfgcnPmpYUonmzpfhwRuWXxTqalUWMe++N788wOMDHESlV/wnv8UheBTnZl+JDS3GK3aBuY452UriT99qfv5OrXpm1RB7x3GFEdosx6T4mFM7PgLvgNincGVXbNj9S+xfvpQxym/JiisdBPxr0qS7jh9EtUqHA7Pqu9zMJeB4TqRJ66/wd2tkPoeesKh9li62ULk5wj2yvfAccNYRT/serIC1e5DeTKIJtu5I8IBFNvEejAltfv60ibtWDprzZLeiiylOXFPcsNT8u7yCZtpef0j+I7IwriYapzBeD5eu/i99z6tdgHnZ1kPsa6be4253dvqM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(366004)(346002)(376002)(39850400004)(2616005)(54906003)(41300700001)(186003)(316002)(86362001)(36756003)(31686004)(4326008)(8676002)(38100700002)(66946007)(26005)(66556008)(31696002)(6512007)(66476007)(6506007)(15650500001)(53546011)(478600001)(83380400001)(6486002)(2906002)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHU5S2w2eU5HM0lrbGgranhxTlhubytoMHVCU2wxZ0ZsbHAyZmNkU0pXSnhL?=
 =?utf-8?B?SXpwUVRaWHhUSTdpNFJweENnM1lBSi9TUlFwcGthTHNEVWZQY2gydGxwUVd5?=
 =?utf-8?B?eGZKV2RuWUN6cjQwM044OEd0cThvMFBQVFZzVmIxMUh1cmlHTHQ3c004RkF1?=
 =?utf-8?B?ZEY1akcxS2k2ZEc3eXA3dVo3MG0xVDNhNzdjVkxCTklNazdQcWhkY0NwL1pJ?=
 =?utf-8?B?OWNUU2dINUZ0VWFFOG1WLzFhd1NXek56OHhUK3kzRlVSVk84YVZ0ZzcwWVl1?=
 =?utf-8?B?S043c1pDOGN6OUkrV3JOVHFhNm0vV1JoQldocUp3ZmY3RE5JNytBVHVHRjJj?=
 =?utf-8?B?OGRBODQybmlod1F6THRJeVJTN2dSYWRPbjVtb0daUEtQRHJuWW05RzlEblNw?=
 =?utf-8?B?M0dDd3ltNjk0UUNqSEsrMktZREJLZVd2enRYdC9kcFpsMlNTUThPQ1BMTmt2?=
 =?utf-8?B?UEYvWlNmNmp5OGJIdnczeVVwUHNNb0hSY3Bscm42Nit6NVM2RkV3bGFtSlRD?=
 =?utf-8?B?OGZNK3RGeGF1d2FDZkZrWDlhbS9QQXBQdmZpQk04VVJwVG5PeEJFQXQzQ2hF?=
 =?utf-8?B?bU5yQkZwR25WM3ZqQy9aMGtRWVFvazRKcjJnaHQzTytydzZYdEdlU3IxWXhx?=
 =?utf-8?B?REU5cTZpQ2dERUlsNWlBVFhrRDhWc2hrS1p5WUxhS3g5cDFOMHllTXljSnNZ?=
 =?utf-8?B?cTZMcW1RVkJ4TTF1c04yUGFRMmhSWkVKRVJzelNwTnUrekpDTDlVTmtEb3Jh?=
 =?utf-8?B?NCtQQUVlY05BV08zWG9KZUhOOG5wcUZnM0s2ZDA2Z21WWmZrVk41a0s3YUNC?=
 =?utf-8?B?VFNyN3NKQy9VRDJuT3ZPNWFKdUUyREJGMWpiT2FrMWVJeDJUS0VNMEtoZWl4?=
 =?utf-8?B?UkhXV1pyUitaQmlyQmNtNDhaTW51RExxbGt6WHBVWEc3WW1zR3k4eHlBN2Vn?=
 =?utf-8?B?MFliWFRxUWdRSG5LVVYxY2lVZVpSSjBvZVYrYllJUkI0UXc5cU1XQWxOclgw?=
 =?utf-8?B?WVN2VmwxWG80NlBaTm9aVWVXWE9pZ2lic0lCTXRwV3ZsejVQNU1ZNmdPWEVL?=
 =?utf-8?B?Y2JGeEErWHY0MnBGTFMyWGcwcHhlREtLMStkbENFK0R0blRvYXVieXRqVGlF?=
 =?utf-8?B?a1AyWnRLT01qVVlyamdodlpWS1FlRUFjRVByQytubS9DOFVDd0puc2pqRUpS?=
 =?utf-8?B?aDBxU3VnczVjWUlkcWJLekN4VDFQMVFJcjFaOU9oZmtYcG1JT2xmQXduTmND?=
 =?utf-8?B?SlZObit1VVpGSlM3L0lDa1pNUGh2N0NDZys5eTNJZkNIcmZQVzU4dUlSQU14?=
 =?utf-8?B?ckQ0NnlQcjA5Y0dTZC9qSE96RnlVTzZlVmNoNGV3RzZ0bTVncUZLcDkwdi9J?=
 =?utf-8?B?eno3OWsyWm9CcGI4TFl3UTZWcVVzOGJCYmEzcXh2VmY4WEU2L0IyV0k0R3Z1?=
 =?utf-8?B?ZjA3S3k4czQ0SDBRLzkzWWtvV1h4U0t5MEFkYndvOElJd2pFMXBqeXFLZFpW?=
 =?utf-8?B?ZzhDQUllUVlJVUwvYm9oRGp5TDFqSXFDSFhTM1RwbG1FUFFMUkRJTmlTcEJX?=
 =?utf-8?B?VzlhbjFuRUNtL2VNMFZyWElIRXBPZTVNU3RlM1YybmhVTmRSVlowTUtxdUVp?=
 =?utf-8?B?UlZmMUdFQldORDhsdTFsU3dHaTFuNTRsaFQ4QmJvVk5rQXJ2aDFJWFJqeWFJ?=
 =?utf-8?B?N0t3T0xDS0V4NnFTalB1SGo2dnVVd1dKYnlSZkVwRGJDTDgvT2JvSS85VnRM?=
 =?utf-8?B?c29CQ3dVSnY3RXkvZWJpZ0xhRjRkRGRxNWVyY3V1VjBKRHZYSENtQ1NDT2Y1?=
 =?utf-8?B?OGZUNTRDd0J4ZE84S29mVnc0Q0gzZUFvamtMckZ5UFUzaUxaaTc2SHhuOXpD?=
 =?utf-8?B?TzFWUmdCbSt5ZTVIRFRJUENHVHRnWHJlSzhhUnQrRzUwV25veS9QUUhXd3Iw?=
 =?utf-8?B?Mk4wS0M2NmF4Ny9JV3NyK0dadnB3VVBKN2tLUVlEcGFRNG5vZzhwUVBUUjIv?=
 =?utf-8?B?RmV6T2ZoRmdpdmcweG5lVmZURDlucUhjdnhJL2JhbUNPN1I5M2lIWEFnTjFU?=
 =?utf-8?B?cEF0cnNoWldiWExwOSt0cWh1YTBTdnNaU3pyZVB5cWZObHZieDJaODhiSzln?=
 =?utf-8?Q?gunV7fblTcPLr/NflhByWl1+a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2fa9573-77c2-4058-2158-08da5d9e633c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 09:20:07.9009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+3e0lfXZH2wKMd8SQhfKsyfWhTfu1jG0H7aP3GS0NBmU0LiIuBmWRfkq4y1SuyKDkuCQ0npOM+Pf8ZFD3QqBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2584

On 04.07.2022 11:12, Juergen Gross wrote:
> On 04.07.22 10:55, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 04/07/2022 09:38, Juergen Gross wrote:
>>> On 21.06.22 09:23, Juergen Gross wrote:
>>>> Do some memory map related changes/fixes for PVH mode:
>>>>
>>>> - Prefer the memory map delivered via start-info over the one obtained
>>>>    from the hypervisor. This is a prerequisite for Xenstore-stubdom
>>>>    live-update with rising the memory limit.
>>>>
>>>> - Fix a bug related to ballooning in PVH mode: PVH Xenstore-stubdom
>>>>    can't read its target memory size from Xenstore, as this introduces
>>>>    a chicken-and-egg problem. The memory size read from the hypervisor
>>>>    OTOH includes additional "special" pages marked as reserved in the
>>>>    memory map. Those pages need to be subtracted from the read size.
>>>>
>>>> - Fix a bug in ballooning code in PVH mode when using memory beyond
>>>>    a RAM hole in the memory map
>>>>
>>>> Changes in V3:
>>>> - minor comment for patch 3 addressed
>>>>
>>>> Changes in V2:
>>>> - added patch 4
>>>> - addressed comment regarding patch 3
>>>>
>>>> Juergen Gross (4):
>>>>    mini-os: take newest version of arch-x86/hvm/start_info.h
>>>>    mini-os: prefer memory map via start_info for PVH
>>>>    mini-os: fix number of pages for PVH
>>>>    mini-os: fix bug in ballooning on PVH
>>>>
>>>>   arch/x86/mm.c                         | 23 ++++----
>>>>   balloon.c                             | 18 ++----
>>>>   e820.c                                | 83 ++++++++++++++++++++++++---
>>>>   include/e820.h                        |  6 ++
>>>>   include/x86/arch_mm.h                 |  2 +
>>>>   include/xen/arch-x86/hvm/start_info.h | 63 +++++++++++++++++++-
>>>>   6 files changed, 163 insertions(+), 32 deletions(-)
>>>>
>>>
>>> Could someone please commit this series? 
>>
>> Done.
>>
>>> Samuel gave his R-b nearly 2 weeks
>>> ago.
>>
>> xen-devel is quite high volume and I don't read all the e-mails. If you need 
>> someone to commit then please CC committers@ and this will land in my inbox.
> 
> This is the reason why Wei wanted to be CC-ed for Mini-OS patches in the
> past. He doesn't seem to be interested any more, unfortunately...

And really, with no other indication so far, I've been skipping mini-os
patches on the assumption that Wei would be looking after them. Wei, if
you can't do so anymore, could you please explicitly indicate so?

Jan

