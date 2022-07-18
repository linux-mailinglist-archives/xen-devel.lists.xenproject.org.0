Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA6C57803B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 12:52:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369590.601029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOLy-0001JJ-5d; Mon, 18 Jul 2022 10:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369590.601029; Mon, 18 Jul 2022 10:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOLy-0001HI-2j; Mon, 18 Jul 2022 10:51:54 +0000
Received: by outflank-mailman (input) for mailman id 369590;
 Mon, 18 Jul 2022 10:51:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDOLw-0001HC-Mz
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 10:51:52 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50081.outbound.protection.outlook.com [40.107.5.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a13971f6-0687-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 12:51:51 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM0PR0402MB3539.eurprd04.prod.outlook.com (2603:10a6:208:1b::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 10:51:49 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 10:51:49 +0000
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
X-Inumbo-ID: a13971f6-0687-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hly1XXVfpgSI4EAizWCtgT9YeG/6lV2ts3U0MmRFC1JmIIkcb+nj+aQ//+35XHdw6RcWoOl23F6/QltMgPCpTZnLwV8CB3ub58Bcj1ccGYaNGkETOHFMO1IdH08OkUg9vUAir61HJHV2S+k6rZNskfZW6W+AWfhgu5SJ2rBMrmtZeKwDzAkWQehR0UsvnU4bRo1MQ52wYk4aHICjoMqNLU0cDpPo9STrgz1FyqeTAK+nPOBfLIPBdczH/KrSrigWdtH5rm7wH/wa8JlFXWJJtBQS8BIPyh481UqkGlrAeaoWh40EpWYZFv+0wXWDbrWkQVbfCX8ot3MFhHB7LCuP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFNdLlH9fkGFBzJpML3y3pKzJtzrXnf0vuGbLwFVDZQ=;
 b=c2WY11P7fY8AAXCBoOm16FdZsH5YtfbhimhEIyHEspriTNUg69jB6fU+A64+G6DkiGfSE6yfL0y2WbmNDpomHHSSfchVSpwetDzotdu6cOcq4W6UB5MMwtl9nLqRMQLAeetlwqb1YMv/Y8qAgX27pjSy8nCNSMt6m4OGRfhY1JHiMvUKfUMjlOmIuzt7Rqh+/BBl2eRVy3xljYbK6sberazrYw822lhZtf4Yh0886qc3+97skmrs3mTDDsVZ0znCRHmjO+QkHQJMKTX9b1i1efUwM2A9v7GQJVqkK2MSlDHlK2mYYJtQT4sluzXqpGytA+DtEQ1CS+BBNUk5DmGwYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFNdLlH9fkGFBzJpML3y3pKzJtzrXnf0vuGbLwFVDZQ=;
 b=Nt+x9wdl/tyb68JL40G6DX+gOQctsozLCdiwK/PSSzTOzkHotNZTMtkbmNsakM8Aa/jklaoHXzdG/W/ti9gGLSpJMTRafU9DsXy45O6Hy0Usj7oikYZEXPdKVbCX2spx9dFI9UIgDde4r0rhqks2rQb70sYdSq+MvkJ6FdkrrXrM+vvYQ7j0S3q9y6eaKaiufAd9d53nqd3ABe5dbhkvxo1c1h+gC9/CsSz7QrgPmbWE43qmXtnfaodtMG/RcP1W53DvvHavxEDYVnevVoFltoZxyYNbUzVOMJ8T1jCHyJpZvaXMfe8ZSe/pPY5sCDepQWnJID5mKREo6QcjRTbh/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a20f8d4a-46eb-2345-1e43-a9f2cf256105@suse.com>
Date: Mon, 18 Jul 2022 12:51:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/5] xen/wait: Use relative stack adjustments
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220718071825.22113-1-andrew.cooper3@citrix.com>
 <20220718071825.22113-5-andrew.cooper3@citrix.com>
 <68555ada-e769-9565-4224-b543c9e71098@suse.com>
 <45bec79b-f065-eb98-b4a3-3be6d4b7e674@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <45bec79b-f065-eb98-b4a3-3be6d4b7e674@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0001.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::10) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bed9666c-58e5-4e36-741b-08da68ab8454
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3539:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xhaN23jKwh6qFcmP3l/246Wa6LOlLHiyhV0Roh4Uc5N3rg3oZNlSCCDW1syIgxUpbi7tB0vihzhg7kVWjjH4Ijg7D/DFLYJs5CDNshyHIGt/A3uOUxsMmi6AnzbHAftmS+gAoYhnIiA41jLol7sUfignM0mgIaBqvkj1C8xjaVLJ1A5prkcaS+rQNj9rP5jX+Pktn5wvhvqZK/akS7r5g7WKc3tAMVIuPMT8E71D7xob63m+xuj877Nc9nalHP41amNPI/aVnOGBWHCEUtuGcGezjqXKN/SJgUJlRqqboKPQ51HY52qndtwt+wpXDMcoqmPIAT+P4lF/J14QFDV8eKJFvNmXMW45d13oQTcGw4LF7wHkbV5UOyU8LJNbfNpyzyPnwKGrGCNdBXUDwNodLnSHOiIGNAawIpiEB2lGIITm74vXI0YV9eY6wlhopjGDpCMRJWOhgSaxyivujrdPWV8ZyJDcQ/U+gd2h4VrQUBJmmdaLO7EWM/dQ0Yth/mezzZ9y51yBkwdljZWiV08VfnkxR+ty6v/DNdsilE/VknhJAYKGJ4rmvyTJTR33Be3GPhNH89KyUVXZczkHGX7tYSpdhaZPsu1+3kBbLiMApghDmqP5OLBTzp0xz3jetJh1C30qV92HgNZqYeu6GAsONCnIX0JIof2l5YJrw+gkdulATRfrvNgyqwWbsj2fBvbneaHXzJemr8LEz9sWxata5bbGqpNroWcc+GtsWSzCdurl/mLmASCDItB4huzNhpAij0CL5PWN0Gk7nrrS/mKDGyXS2/Pm787T0G1QFiiIP+xWluPFeTttG9ZIWXKeGMboM8fXkYSb0M+4ytQrAcbtOTctLRRZDHCp0RmwpPeJvWo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(376002)(396003)(346002)(136003)(8936002)(86362001)(38100700002)(4326008)(8676002)(66556008)(66946007)(66476007)(31696002)(316002)(54906003)(6916009)(53546011)(6506007)(36756003)(26005)(31686004)(83380400001)(41300700001)(2616005)(186003)(478600001)(6512007)(5660300002)(6486002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDZXYkhuMno4cTRTWjJIM0FLRE4wellzWHNWOXJFKzVYalIySmFqa1ZLVmFi?=
 =?utf-8?B?VmhLTHl6VFpDOG4rY2FaRmgySDMwQ1hPSlRmMVFkK1hSL2JnaFJwY01Oc3J4?=
 =?utf-8?B?Yk54WXhKRjd2WHllZjhraVpiNlFCckhKZHRVQUx2aTRSMXdKUkZCTkY4QlMr?=
 =?utf-8?B?U2IzVTI1bkZyWTVPdkxCSGxrL2Zac0NTaDAvWVg1Uy9WY2M2VFNlTFpXRWZK?=
 =?utf-8?B?ZFVvM3E3azR0WFJUcDRLdnp0NkNMK1o3eGlEZm82aG5BYjFieldacW0rTGVh?=
 =?utf-8?B?VUZrdWFodHVycUFqZkFNQVlUTXZiblNzb1U3b3dFTU1zWE1WalZoMUZ0ZVNC?=
 =?utf-8?B?Qnd5QUtud2QyYy9wSUFQcTR1c2tENFA0WURFRXRhcHpreXpMVjJscUY3V1Nx?=
 =?utf-8?B?TDFiKytxQWlUQmhKU2xiUmNFSHE0NnNyakw1QXBMc3R6VWZDSlpudG9nRVBu?=
 =?utf-8?B?ODlEdTU0WFZXMWdtQ3YwOG9wNEFHOFlHYXphVm1lTUZyS29BcU1sL0V3ejUv?=
 =?utf-8?B?WGx6bWhjdGpaZkVOT0w1ZkxGWjNaWXVSSUgwOHY3aEZhOStUUlFVclVnTHVv?=
 =?utf-8?B?UlZpWG5NaW5LNkU4NEUzMEphWGlIVFR4U29PK2ZEZVFZM2pmTElMZDd4T0g3?=
 =?utf-8?B?QlVwaVZFYVF5THBDZEY3SzUzaHJKU0N3ekVzVk9iK21SdE9KcnQrLzgrcHZO?=
 =?utf-8?B?cGlCcS9FLzBuYmRxZEFjUTkwRFBoOGVXZGFzTGRXZkJUZkN0T0RaSDRkSmVI?=
 =?utf-8?B?QXZLVytGVlNoZUZYaDZhV3UzVC9YUTdZOFNlN1NzbHJ2RGdBZnZvU0U5dUtZ?=
 =?utf-8?B?NlhhUWxvaXdZUjVjVGpLRXFVd3NhMk1VZXhVYkZlZFBscGQrNWJodThXVXla?=
 =?utf-8?B?UTNDanJTbG1VaWExZUFYbjNScDlrSmtOMmI4OVBma29iNEZVM2d5UEx0a2ho?=
 =?utf-8?B?cDNpMUtGQUd3d0lnRDlUcVY1anhXUXQrRy9XczNmSXoxelBybm80VkM3ZW9z?=
 =?utf-8?B?VG92aS95QW4yaVBWaENXM0RUQTRwaXZhTVM3cHNOclc5L2RwTHllSmtHcDR2?=
 =?utf-8?B?WmMzdXZ4NGYzZ0RsL0lDcC9JcUF1aTRCbUhjYnVvKy80bkxjSnJqSndpYVRY?=
 =?utf-8?B?Q1F2YjFROWp4U0VvcUFheTJ2WENxNVB5UXhvTExMVGgvM3FybFBWZSs4REo0?=
 =?utf-8?B?WkpJSFB2YnVwTms0OU5lVVlualFScW5Vbms2VjVvUXRCV3hIdG43TDlPdGNr?=
 =?utf-8?B?aWdubTlWWDRMSC9LNkZrSHJ2T1EybjUyVi9aVUI5eFEzOVN1b0VqM0YwM3dM?=
 =?utf-8?B?dEpHOEJWc2N1ZHZpQU5ROUk5Y2RXWWVSVVI2T1FiRjNFNk91RHk3OHpCblFx?=
 =?utf-8?B?Skhjd2pYNHl1ZTNOTDc1QzdCbzF4WXNvdW1UQkM2SnJQbmMyV2dSMy83cjRh?=
 =?utf-8?B?cU1HdjFEZVRuQUxiM2cvZm9DQWd6aUVsbjBWUVdsUS9QUlhoYmY2c01JclFq?=
 =?utf-8?B?VHJ4dkRXc2dtbCszRkxCTW5jdDY3WlZGRmhDMDJRdXpHQTVFNDMrdEppNU5n?=
 =?utf-8?B?R290UUdpQStFVW84Zjl5a1dYaU56N3ZLaWhoczNidDIrR1BsNDR0VGhmUHFM?=
 =?utf-8?B?ZlIxOXRIRnBabnVMME56VWpEMlJiL1RLNDBmWUk1N0hJd3FJcU9wMUFzamZU?=
 =?utf-8?B?TW9uRms5bzd4cDBtMmdTYjZCN0hKb25GM1Z4T0xQUHJhWW40dXFpczFGY3N2?=
 =?utf-8?B?bi9NVHc0Kzc1NU1zSzhYeHpOMlhPSmNMTXJiVE5TSXJWbDNRU3NLK2MrcjRW?=
 =?utf-8?B?Q2dRUlVEazJBOUFZZXJtK0hYaEEzTXkyWjVheTUyMXpEajliTFZvT2N4ZFFQ?=
 =?utf-8?B?aVQxMmExeGg5SkNFYklMMnlEcEV3N3o2dGNGK1Y5aDZ3ZFhqdmJQYmlrZGRJ?=
 =?utf-8?B?M3FBWTZiYnpqbzdnVE5CS3AxdWpNS2Yxdk5Qa2RYV0NzUHZVdURBQ0tZL3pq?=
 =?utf-8?B?MzM2cUVmb0hCOVV1cmMyMVRvTjZJNW90UUpicHF6eEpKemhjaG5nbklMYUJl?=
 =?utf-8?B?emdHWVBsQWVQQy8xS2NtOWphYjZRYlJadEQyd1NaTzZENEVXTU1yVi9JZUxj?=
 =?utf-8?Q?a9181PBPFbRDtTk3D9YqVylG0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed9666c-58e5-4e36-741b-08da68ab8454
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 10:51:49.6576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YVIv0AjddT81LsOuYuqLYWfB33hLY+1WOze9dQbOG+WzG2jTLnRGEjxVDL3+c/PguAk7PNgEBQ4eEJaTj59e2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3539

On 18.07.2022 12:41, Andrew Cooper wrote:
> On 18/07/2022 11:29, Jan Beulich wrote:
>> On 18.07.2022 09:18, Andrew Cooper wrote:
>>> -        "mov %%rsp,%%rsi;"
>>> +
>>> +        "mov %%ecx, %%eax;"
>>> +        "mov %%rsp, %%rsi;" /* Copy from the stack, into wqv->stack */
>>>  
>>>          /* check_wakeup_from_wait() longjmp()'s to this point. */
>>>          ".L_wq_resume: rep movsb;"
>>> -        "mov %%rsp,%%rsi;"
>>>  
>>>          ".L_skip:"
>>>          "pop %%r15; pop %%r14; pop %%r13;"
>>>          "pop %%r12; pop %%rbp; pop %%rbx;"
>>> -        : "=&S" (wqv->esp), "=&c" (dummy), "=&D" (dummy)
>>> -        : "0" (0), "1" (cpu_info), "2" (wqv->stack),
>>> +        : "=a" (used), "=D" (dummy),     "=c" (dummy),         "=&S" (dummy)
>> You can't validly drop & from =D and =c.
> 
> On the contrary, GCC demands it.
> 
> & is only relevant, and only permitted, when there is not an explicit
> input tied to the same register.
> 
> When there is an explicit input tied to the same register, of course it
> can't be reused for another input before being used as an output.

Oh, sorry - I neglected to take into account this adding of inputs.

Jan

