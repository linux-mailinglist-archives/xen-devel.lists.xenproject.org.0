Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD00B592A68
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 09:40:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387087.623192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNUhS-0004lf-H0; Mon, 15 Aug 2022 07:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387087.623192; Mon, 15 Aug 2022 07:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNUhS-0004iC-Dy; Mon, 15 Aug 2022 07:39:50 +0000
Received: by outflank-mailman (input) for mailman id 387087;
 Mon, 15 Aug 2022 07:39:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNUhR-0004i6-OC
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 07:39:49 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80048.outbound.protection.outlook.com [40.107.8.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70462835-1c6d-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 09:39:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4395.eurprd04.prod.outlook.com (2603:10a6:5:34::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Mon, 15 Aug
 2022 07:39:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:39:43 +0000
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
X-Inumbo-ID: 70462835-1c6d-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gB/doJIdy9y9zLYvNhbAsU3pdZRG9c3J+QYpfjzPXZaLy5gHPArIU04O0tgWQFd/hQ4bvDpQoR0iF3pU3xITd63uHA3x6707dPBNabd1VB60s7KerinQRLTT3VBBVuK9x1reZBHDoT5XuP0gkYDeSWsQ+jCSV3WEbFkfs8QXl/fwY6tFasJ0jzePfSxon7DFhcXb1tV6Vt0Pr1FUGsMsBN0IRtXtAS0sminPHeL/+LvhcJiJjS9fOzKU2tvnlU9B4bwrfGpL42M36ETTOBU+DQFSVCks/WFwxTRb+GjVOuX7xrGXzJtKkxIrbG453nv3hk8jpIhPXXArnM3TOMo8Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qm8vxIMpXzDeJP8DAToVqum0YAkqpNMez6CHHzMamvs=;
 b=LlbS0m3ySpLml1ye+4n4iTeN0sC9bR54gywa1rIcMj7N6EJCVQXeQ9MCZa4h701SidliT6Zq8pN/v1XmlWqt6w7ry6laF0tYGUHHf4yJfvRt3nOFPj/UXcLsK31EmDpkYpsBozU45doX82pIwJIw+ikgQU8okb/xa5rid3fheSHKjDcnQV9YrsZOzYO1nmXUfsencSs6lD7mYbDmgEC70PLBn7D+cqPQwKSPwcrN3VlV+tF75coOmD3t2nJyOgPoH4fUWRRT0HH/MFnirGkdbfcbzFSv9Yb4TgE2f+z/ImXTobr+mheQo8F4ozfAYg1mbzH6jXSclJeRi/FufLC+3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qm8vxIMpXzDeJP8DAToVqum0YAkqpNMez6CHHzMamvs=;
 b=uHyOS2jyKm3D1rPufuje17QfTanE+CjGS9MOgSh8Hnm13xgxuCVVui3GNKv4bexftW/sRY+0NuT2DNBZTEBubwSmSTMZ2PNnrEo3l49YFXB3QrEo9b2Ro8YxU9v9G5mWNKKDjC8qZcLpDlAD8K4JiM+vZbN8JGIF4VSBH7hD3+HE/uR4T5uGxZqpEx9sFdapMm+lUopIhaVonpe2GVs55zKGQhzyy96Af23lfLvyDQKDa7iXbf2ky1Oft57HcE3MJVZB2ItRWENOt0bAoQhQiicJmVmN6lDQHYOXMt0ZEE6cKHSeduB1g+WW0qCvRY0LJhpkFjpcrbmU4f1J+CX5tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <47b125f4-ce4a-7b2c-dbd5-2297f1e21581@suse.com>
Date: Mon, 15 Aug 2022 09:39:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Xen 4.17: Current status of series floating in ML
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
 Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 "Wei Liu (LSG)" <liuwe@microsoft.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <AS8PR08MB7991375F9A36B36AE5ADF3E092689@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991375F9A36B36AE5ADF3E092689@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d361b593-c288-42a8-5f2a-08da7e9151e5
X-MS-TrafficTypeDiagnostic: DB7PR04MB4395:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LkURoaA76bEGqhuW9NBVvpvo1afv5H4tM6eBNSEZiWD9RG4n9hbJ1Rpc+mZCWczjh3zhrkZVWBiAxqQwtJ8fY93HaOn8VIefhN9YUiNiOLvRDXe5+2k3HodOh3YO+nkr/KpELK67MIRCpasDdUk5tDa0+rg6MKyiAUtKanM3a5QuZqXMM3P4qjii+3WfOPMRMh+s2l6yOIKrdTe/U0bZtupiLz/PlH12uS9PzL6amfElMlAaGmWO45at+5gebruOREnO+T6C+VbkWates1iwb7597IHPfIfon1mlLw4Nw3FOkTlxDjZGzi4PDGvvVs9txjjd0NZKFBwVV9nlHlQrqjtPPygGd5pLlBJDxU19ezkvkE2+2ubtDgTBbADY/+7Bf6MWZs63R0g8I12kKDJFNhx0ERMmJMY81qoX0GcXUCqKi7ez73oWkNEwONMlSFtMR9OcqYJLqIZ68T22/gDfZz89lmbSNq2G6p5m2pA/qKHMEu8x9DHeZv+RUmiefJ5+85jCnCLXNJ99rTiMvcguIW/CMU0TBoxVVEOIN4KrgkOoMSpAGXGBIIyYh9HwgLj4+FLAuLw+f5+73hSH55m4s3ObB5e+SKHN4WeXRXoUKKyvZ4QQZxUwF+M8B2iKmHvP70BO38srbsI9sKNZYBC5BbI1obi1gUV8G1CKyJ3Q8Je4D5SqFhzmuLOF/CA3e7CMeUb/DvTCiS9CQQUQM85sllQGt0x7JHAGC3n4lufoR9+Dv9/1A5NipdDKXyWEpm+kPwyHVcUGHRnk/SGuK890OnzmU+G37u0PWgTP+IurqtztbpviVzE3ibfnfQ9BGeqMHIrTpyCa9aHTBLEhzswsI2hl3A/vAACs65+PGyfsgbwS6as60eTLMB1CSME4QgPmyQKgQ6PeyDPZYBKJ/SKLXQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(366004)(346002)(39860400002)(136003)(6862004)(7416002)(2906002)(5660300002)(41300700001)(53546011)(6506007)(86362001)(31696002)(966005)(38100700002)(83380400001)(2616005)(478600001)(186003)(6486002)(6512007)(26005)(54906003)(316002)(36756003)(31686004)(66946007)(8676002)(66476007)(66556008)(8936002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFJuazhCNnJxNVZScHZtcFZVZWtCbGhkcGhHSm5XUFpoVWhRWXo3MHdTQmZZ?=
 =?utf-8?B?Nk5MVzk4QVh0NmtrTHFMNlh4NE1DVDFEK2ZKdmNRbTBoOEU5ZllnS2IwcFV0?=
 =?utf-8?B?cGJpL1NuRTRuNk1HS3FrcUpsWHhFR2NWT0hpTnVtL3luZmFIWGlaQTMxa09W?=
 =?utf-8?B?clowWXNxdnRaSnhwaDUwWVZGeURSS3pvM0NrcmdCWi84U2J3MjVjbktiYWpM?=
 =?utf-8?B?aEZGZEh3ZHQ3c1hhNDRLT3M2aXZSOXJFK2c1SDdObHRwSHVQelRUYkNIdE9h?=
 =?utf-8?B?L2t3Z2lOVTlwcFEyQnh0MGtwTlNmQjdsb0N1NXdqVWxSZHRBbk9NRjJCVXNa?=
 =?utf-8?B?dmxOaXdqd2tvQnN6Y2lNVDF1ajg2c2VvU3dYRlRwbHorZll2K3lEMUhNVTYr?=
 =?utf-8?B?cExwemZ0RHlTYm9JeEZLSDhDSUVZc2NoanR1VktZQmhRNW9EdUhldnNGS1Fm?=
 =?utf-8?B?dDVFcVJKOU5CWEIrdWZ6UlFjOXUxeUo1ZWY3d1Y4aTVhRzJaTGJ2ZXlHVmhY?=
 =?utf-8?B?YzJ1WTQwdnhkQlQ1UVBkVFB3ekpydXRJS1QrWkY2Y0lhQ0FhemxVQk9Xd1Nq?=
 =?utf-8?B?d2pZL0RjWW94THJLeTN0aVpmcnloVEhsc28vQkZWZExudkxFS1NQdVp2NC96?=
 =?utf-8?B?ZXl4ckZwbWFpdjh6ajd6TS9wNlplaUtXb1ZCSERidXNNN2VaRWtQa0FwOXlZ?=
 =?utf-8?B?NTE4RXFlVVdlUzlCd0pkTVpxYUV1ckwzUldmTWljckJ2UzRQbjM1Rksrbnox?=
 =?utf-8?B?Ri9VQ3diSDZ3aTRicDZBbC80VWREQ1cvR0RaNDBkRVRxbW9abXZmSUFTR3Fi?=
 =?utf-8?B?QU9SYlR6ZGFwZTlTSG5CM05oUnJhMlU1ZElJYUV2TjdIOHNTUHdaRGZyVllI?=
 =?utf-8?B?ZmRQTTlzVGtWZ05NNTNmY25WYWoxSExDNGVNdU5PT1JicGZxQnBxd2lycVJo?=
 =?utf-8?B?L2lhc0hvNTN5aUpUa1drMEV0OXNaSHZhdTJtVzdyT0ZNUXFpYXk2WGRGUnE0?=
 =?utf-8?B?ZU91TzA0SWYwSzdiQkRMdzFSdWprRGN4VXBJUFpkRHdnZXJnNjY0RnF5eFpI?=
 =?utf-8?B?RFRnd2hFVmw5M2k4Qk96WXdmMWpqN1gveWJUeTMwVENlM3d1N213WHZlUDlY?=
 =?utf-8?B?YXkzd2JBeVVUUzNDbE1ZNXc1OXA3QzhucHU5bFM5S0hJMUJVMlllMndZb05r?=
 =?utf-8?B?V0VKVndZRkRkRFRsS2gzeXF2TURwR1pmaGNza3dFQ0JzNXI0OXVScVFDSmps?=
 =?utf-8?B?SThvWHpURktQdUUvUjRoN3FBWi9LL1QrWENDZ0J6ZDMvRFk4Z1V4WUVkUEQ0?=
 =?utf-8?B?dVYrVHBPdkFJdmpjMmNXVXlTWUVCdFBHamtpU3RITjRtTjdsSVF6MGl1U09J?=
 =?utf-8?B?L0JKSDZKeE4zaXNLdHZWTGpJZGVWU2dsR1BqZ2d3TE85cERJcFFGVXNRMExU?=
 =?utf-8?B?RmZwYXVaRVdRV1NPZWhVMG0yMzIxcXoyd2hZT3VtaE5hei9nREMrNjl5U1Y0?=
 =?utf-8?B?MjF5SkNoWnFXb1dyYnpWNlh4RG5GZXcwelZwTzlkeldvby9ZbEplOU5RemV5?=
 =?utf-8?B?WVE1bSsvT0VYMVBDaVVpV1hIUTV6MHEyRjc2ZGQzaDZPODMyT3JiS2xNMWQ5?=
 =?utf-8?B?SXVGY0k1Njg0OGxIanNVNDZabkIrYWNxbTBHMDJtOWhEZ3d5K2hEMUF1ZGsy?=
 =?utf-8?B?V0tzd08zd2xnWUdKQ1diclJjLzhmd1RZRXhTWTF2aUNBTXJRTEpHNGVYbHRt?=
 =?utf-8?B?WDYyaDdKU2RaTzZBUGhSVDNrd2NLK3J2WWNYN0tmZCs0UW51TlFXajJGMmFD?=
 =?utf-8?B?dDJ2aFlUbTFoYzQ3YzBENUdFMUtUUm5YT0F6eEpNemprbFBGN3lvMUNmaWxF?=
 =?utf-8?B?aGxZNHMzZUZyRVZ3UTlaZmt0VVo3T0tGbXZvYjVvb0tIR3JGNEczcWpXS05I?=
 =?utf-8?B?ZzZySnFTNDc1Y3Y1MjgrOStFcWNIenQ0TWVnUHg2TGQxb0pxWE85OGM3NEN6?=
 =?utf-8?B?MkptbjA3UWI3dkZ5NW5jL0U3TXhKdEJuVnI0dFl3N0gybnUvUXNXcW53bWVo?=
 =?utf-8?B?RDJ6a0NzL3BidzhTRHBBUFdmY2xEY3U1cE5rU3VRKzcrM0M5UVBpbW5JYzhX?=
 =?utf-8?Q?k1Mji6hCazfCWwvQQbrX42tnP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d361b593-c288-42a8-5f2a-08da7e9151e5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:39:43.7096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CVxyhhSFy+7idIgItslja2iMQfiCSvLZ219SoiWcvwOtVjDWU+76l/3Mubuti9l4XA/Xx9U7rfSeM6fs9SRCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4395

On 15.08.2022 07:46, Henry Wang wrote:
> 11. vpci: first series in preparation for vpci on ARM
> https://patchwork.kernel.org/project/xen-devel/list/?series=660828
> Status: Patch #1 needs actions from author. Patch #2 #3 need review.

It's more than just review. I've expressed elsewhere that I'm not
convinced of the approach as a whole, complicating things further.
A re-work towards using ref-counting on the devices likely can't be
viewed as a re-submission (and hence likely won't qualify for 4.17
anymore at this point), but I think that's the only (long term)
viable path.

> Patch #4 acked but not merged.

Well, obviously.

> 6. x86/cpu: Drop _init from *_cpu_cap functions
> https://patchwork.kernel.org/project/xen-devel/list/?series=666830
> Status: Need review.

The replacement patch has gone in as 31b41ce858c8 ("x86/amd: only
call setup_force_cpu_cap for boot CPU").

> 12. x86: XSA-40{1,2,8} follow-up
> https://patchwork.kernel.org/project/xen-devel/list/?series=663143
> Status: Patch #7 #8 need replies from maintainer, the others merged.

Patch 7 was withdrawn, while I've committed patch 8 this morning.

> 14. [v2] x86/mem_sharing: support forks with active vPMU state
> https://patchwork.kernel.org/project/xen-devel/list/?series=661567
> Status: Waiting actions from author.

Isn't this commit 755087eb9b10?

> 17. x86: Add MMIO Stale Data arch_caps to hardware domain
> https://patchwork.kernel.org/project/xen-devel/list/?series=660729
> Status: Waiting actions from author.

Afaict e83cd54611fe ("x86: Expose more MSR_ARCH_CAPS to hwdom").

19. [PATCH v2 00/12] x86: memcpy() / memset() (non-)ERMS flavors plus fallout
Status: Some parts committed, some parts entirely uncommented on.

20. [PATCH 0/2] x86/vMCE: address handling related adjustments
Status: Iirc no comments at all so far.

21: [PATCH v2 0/2] x86/mwait-idle: (remaining) SPR support
Status: Patch 1 still lacking an ack.

22: [PATCH v2 0/8] x86emul: a few small steps towards disintegration
Status: Iirc entirely ignored for about a year (since v1 submission).

23: [PATCH 00/11] x86: support AVX512-FP16
Status: v1 was reviewed, but some of the review comments need further
clarifying before I can sensibly make/submit v2.
Note: Depends on item 22 (albeit if absolutely necessary it could be
re-based ahead).

> 5. tools/libxl: env variable to trusted default
> https://patchwork.kernel.org/project/xen-devel/list/?series=664081
> Status: Need reviews.

As per the XSA this isn't intended to be committed. If anything the
XSA may want re-issuing with this patch.

8. [PATCH v7 00/11] libs/guest: new CPUID/MSR interface
Status: Largely reviewed iirc, but there was something Andrew's input
was needed on, or he wasn't happy with.

9. [XEN PATCH 0/2] libxl: replace deprecated -sdl and -soundhw qemu options
Status: Patch 2 still having some discussion ongoing, i.e. as a
committer it's not clear to me whether the patch will want a minor
update.

> 2. PCI: avoid bogus calls to get_pseg()
> https://patchwork.kernel.org/project/xen-devel/list/?series=666322
> Status: Waiting for v2.

v2 was a 3-patch series which has gone in already.

5. [PATCH 0/9] gnttab: further work from XSA-380 / -382 context
Status: Some parts are controversial, but this shouldn't prevent the
reviewing / progressing of non-controversial ones there (7-9).

6: [XEN PATCH v2 0/4] xen: rework compat headers generation
Status: The 3rd patch needs reviewing by someone speaking enough Perl.

Jan

