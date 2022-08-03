Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B2A588713
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 07:58:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379532.613044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ7N5-0003mW-TH; Wed, 03 Aug 2022 05:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379532.613044; Wed, 03 Aug 2022 05:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ7N5-0003kc-QM; Wed, 03 Aug 2022 05:56:43 +0000
Received: by outflank-mailman (input) for mailman id 379532;
 Wed, 03 Aug 2022 05:56:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJ7N4-0003kW-F5
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 05:56:42 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00060.outbound.protection.outlook.com [40.107.0.60])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09dc26c7-12f1-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 07:56:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6944.eurprd04.prod.outlook.com (2603:10a6:803:133::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 05:56:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 05:56:36 +0000
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
X-Inumbo-ID: 09dc26c7-12f1-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aln3wghwjLgEHvBKSRvuiIn32HxY/jWaXNPdosAg/TaS1A6UfMsNDs+xzVyRy477vFSb6AsY0B4TQlinADLJhVQUsz/2y2z2TReVTnNKTcnXpoLmodKy0DcUgs8MvGPIxZKQEqV9Yp5xDDAq2X+salgNgYmgbrRhHl5NaVXO1qiCwsS3rPMAiWjlV+dMbLpOvhVcUTEMFH2KEm4Rq53kWG78LmJlNjfIGNRvuub0bUJbWJHniIRBwFLxzbj8DK9ovbY04IK0fKYLy1UQRXYXRUPRMrse/F6MEqzXZj1+9wVqiaNVOfjjDPh0aw4OTtTtV9x5g2jNm5L4zaNKOvh7DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvOoW2k7UWeN66gbtOjvtoaUiBItn5IIPB0rPCa4t/U=;
 b=RbF/JNXY5GSbLERwcCx9uTlABHsmkhdGc88YNlbFxe1XeIaWnpPtSCx0ucvnyqyMVdWl2c/cB6JG288vu7xpau+mfXFyQoFJlpQ+QLuXgeevOkmubec5Wc6cNiBfBQpBS3Hdh+RNYnmnEAEtdwIK3ZmGW70iXxApV3CL1eiI8wE1VI7k0X7VIFb7x/m2/VKUE06lKMUzPVRiccY+J4FPIRsE6UvSVjkFQIEtC9utm5sA7FNE2lqnk3t5lkBmSQXXKiEph3z5O8ulgf2PKhPe95P3M1Q3rJDWBWFjL7vfs5sOkRA3MQTxnWARrKg+uUfB6187n4UpZ4xOxHj7LYbwzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvOoW2k7UWeN66gbtOjvtoaUiBItn5IIPB0rPCa4t/U=;
 b=uBFGIe+P4ySBuO+I3TSAHlUNxqyujqq/Ex/lPailkD7WD0mugymJqQRBpo6DYhUMO9nS151nc4jj1WJYDyQznzhUDmh/pct0tA8O5x4lpGB+M8WwYJpnuDMi5ABaLLA/Kf0j1LKCetMhHOaktc+Y0r44RZJHRuxq9w2KhJ0Jw72ycfk9M5Gom1Yroi0LcR1ozgRsF4IJipRPE3n5Y3FAmAquuF+qx2CjZCuHvJFOGslr/OnMO47X+Pmusmf6qFHQqxLFaccM6hfTE/ol9WPP+ftPdKv6vomrJpbJGM3xh7teZsGslhzh3u+lGGQ604sTQ4LbKSEFBzUE+xi927oTaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e8b366b-5ab1-599b-263b-d86f0f111d89@suse.com>
Date: Wed, 3 Aug 2022 07:56:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [XEN PATCH v3 06/25] tools/fuzz/x86_instruction_emulator: rework
 makefile
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-7-anthony.perard@citrix.com>
 <d917d9a6-5ab7-f826-21e0-2c95b4614f9c@suse.com>
 <YulaTPhEf8Mp+p0q@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YulaTPhEf8Mp+p0q@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0039.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8162377-c448-4d74-b1b3-08da7514ed21
X-MS-TrafficTypeDiagnostic: VI1PR04MB6944:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jiDH3BMhvKfrRNAodkbmLdtSrUXpCvzUGTyTFA5XYNxrOP4W3SHVMT2Wt1gf365TEQOZXx+MXerL/Rd3fSpYkCEO9L1uc9tOS6XNdRSg72eJkmhCGc8H/qPlkLZzLM/YBvy0QMseU4aYydBWe3sIiI9SI/GfL0pPt/F8APpldrRHpObLBsVvsm1rOO00nJGx/QlIKLzfwSWSwrSyI6ASX7KV2s/HOXyvoeyC56Wc22/E7i8OkRxLJVdpMYnQIz+5dW6KZML+Th4SdD1TpbLbvyH4cqbk3g+DgYNsbUrZAw010X8b2vW8WOrIk8/x4WjxkVhZ4bxuvm0RojGotbLlvhQ47x/A5EfczY8Vz5J4ve+R0S+y/Dg6yBZS1lOvED9ReVwU6b8Rm6PQ1udlK0UoAjGFyPSi506AuGDYXxgUIzmR0EwiOlmmCcgNfSs98wU4UfkFcruWOTMMR3+PWe1CGiAeYBWDzlyXRBS9uKvQS3EHQHrMDNGFPMtUpMhF+S+raoW32vrrbvVA93g3DiziRMDp0qwL8OntkNyKOHClHiTS5k9l0qVkMB5XPk9jFdEXTpggibLYqB/83faq/PWZIyceeTEvGW0geSvTdNpSGqTFb2gUSgOjg7ihQRnOvhPnCAArqFdQda19yeGezDH6yKvFPW70B2NQTFG9wUEcjBhYYkyNPtwcFL/H9JWBRpuDsoMg86pHKHRifIRc69mN7WYSUn/cehr+6L3aaFFEDrMnWxNp4Xor73dMcLFaXlzeIykw4QNrgmEpiTQP59FXlG+6kuHacZLtu/Dqs/g4vdE7PuL6YcSYuXqE6bU0iuTysk8s9QzkiVHBDD4o/U0O0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(39860400002)(346002)(366004)(376002)(31686004)(186003)(83380400001)(2616005)(38100700002)(2906002)(4744005)(6506007)(36756003)(5660300002)(53546011)(6512007)(26005)(31696002)(8936002)(86362001)(41300700001)(8676002)(4326008)(66476007)(66946007)(6486002)(66556008)(478600001)(316002)(54906003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cW1iSFBVdGJ4aytZd1BvYnBtais5UUJMU1Nzd0tEU1Y0UjhzcW5IUTJROFdz?=
 =?utf-8?B?azV3bXR3TVZIaEdJNUlZSzVIcHBpeVBCSHl2L1NKbFVEbUZDWWptWlhNU2N2?=
 =?utf-8?B?ZERReG8xbEhBZmhEUzN5WmIxR2ZBVUZLSjh2c25tcFI3NEREaDJFZExwNFQx?=
 =?utf-8?B?N3NDNkpWZ0JxdXhWaGtueG12WCs5b2MvVmdENmFBTG5jcGRFQnBidjQvOHJB?=
 =?utf-8?B?ME1Oa3NXRnY1aDd2RjdQK0t1UkF0SjFUSTVJTmwzMmljY1g1L1VSVkJjTFpH?=
 =?utf-8?B?U3lhN09qOXQ2ekR1dG01Y1I3c1lOM21tUkpHb2pKOEhTL284d3ZTTStTdnlM?=
 =?utf-8?B?MUZPQnlhNGJtVkpuYlZ6QWlJeGdPMm5mczRjV3FxaFJBKzZDTzN1S0tkTThN?=
 =?utf-8?B?RENKTjdEajFza1N4ei9lRVpGZVUyRWQ0UWxUS2dZQjRtRURhZkhTa1JRZENn?=
 =?utf-8?B?NXh6b0NZMlhQZjkwQ2RsbnlUUmtZRFYvWGk2RHlWVVVrOFJsWGxxNjZTWkta?=
 =?utf-8?B?b3ArVVR0WDJDMTlESG1RclBzOURHNk5yR2dYc05YUmQ1ZjQ1YW5UTDRaN1d5?=
 =?utf-8?B?bEZlNWw2cHluZnNCM3pzY1hUK0k4L2RKV3FXSExOSEYyUHh1UHk0SlMxS2th?=
 =?utf-8?B?ZlFZeEQrU3hhQlY2Y1FHK04yK0dSNUQrUCtHRUhtOFF4S0h1SVBnSnpPa0Ra?=
 =?utf-8?B?N08zRHc5U0x5S3hxUWpVbmE2T1R3STRmS1Z5ZjdqM3VRakg5OVJwVHUxdUN3?=
 =?utf-8?B?eHltZXRlOU9RZ2cwR3Q5S1dINFdEOFZGaXVyZUZvVkxQdi9FOFZnRS95ZVRQ?=
 =?utf-8?B?bDVTTFVYWnZOc0loT25xaU9IREhtTlRpbkZ6VCt6ZWtsOFR2UEx1cURIVEh6?=
 =?utf-8?B?Sm1URG05NXc0M0xMU2QxeWxaNHRZSnZlU05la3VDcDhJN2ttU2RVRWVEZk9u?=
 =?utf-8?B?VnZrMzVhZ242cWhBSE42ZUQ5WU00WTUwd2U0akRWZUtIdDZXb3ZiWWQ3c1dL?=
 =?utf-8?B?WFlrNkFMUzFKNHVCMXFCSVk5enhWTzg0L3pmMmdEM0l4dzk0a0swU2J1VGhF?=
 =?utf-8?B?RjBHTFV2YjdUb1EyRnRpMElpL0pQaERXSGVZVHJFWGZMMGl2aG1HWjFGRmh5?=
 =?utf-8?B?L1E5SVJNbWh5UmlsUCtjR3JTUDVOYm1oOVlUa2Z1N1BNemZodVFJZExmZHlC?=
 =?utf-8?B?bWFaVlYrQ1FTQ2ROU29hTlV4MFZHZGlXYVNYckpzSmhIK1VabGxMNkJYQ2Va?=
 =?utf-8?B?bWlEMk43eGtQTmZ4U3JVOGpaeThpSExldXk4cHZVRVFEM2pIbjgweUlkYkZD?=
 =?utf-8?B?cTdxUTcxU1ZJZ092VjZGNU1XcVMxejJSUm1UL3pIMUtFL3FiaW44dkJhSGNQ?=
 =?utf-8?B?RkZac3lsWStseFp5bWpCbmZlZWh5MEp0LzY4a1o4MkV1Y0tQOVIxaG01R0k4?=
 =?utf-8?B?OVUvS2wrYU5VRkZha0k1S3QybFZQZW8yKzcwMFFncDhBVTJTMmpoODZ4UktQ?=
 =?utf-8?B?S0tVNVJwbUZMb0Mzc05uOEdVRVhzZ05heG8xYVVVYUtxOW8xaUI4MHgzVjFF?=
 =?utf-8?B?STFJUEZ0SFlHcWhhTTNza0lkSmtUMHVlV0xIdjVJUGFVdnpxSjQ5N0JJRmlJ?=
 =?utf-8?B?UkVud0FpbkJvTis4VUNSYXpobHVZWW55RFVRZE5FR245MEVLbmFNRW5NWUNH?=
 =?utf-8?B?V3Y2MjhlNXNnRHdqRXh5WlpJTVNhTDY4Rkt0TEpQaGRrY2RkV1hlbm9CZEFD?=
 =?utf-8?B?Sm01R0IwbjFsRWhGZ29aUGt1bXo3RjVvakZWWXAxM2FsUjFhc0puMk9JaG9X?=
 =?utf-8?B?VTF5czhiSmJUMFkxVEJTaEprd2MzTDhadFNhY1U2LzA0MndGZm1XMHBFc29R?=
 =?utf-8?B?S1NoLytuK0ZpLzd5dlpySHlhbzI3QkV6RkJCQ0ZKanlzQm8xK2dSeVhlNklU?=
 =?utf-8?B?b3dpOVR3c2R5dVpRZmVhNFpzS3VOUnVJVXZDQm1qWXhoajEvT0kyNk5HbEN1?=
 =?utf-8?B?WVoveEVwQkNqVzVOT1R4WmFzVmZMYmJDMFNlbmtlTFJqVVVDYnp0WkFERnhm?=
 =?utf-8?B?MGZhVVJ2UkVBb05jODFNclhraml2bEtvNHgzWkVVN1k1T21LamovZUdhK1hL?=
 =?utf-8?Q?RHWyQooP7cxteQ8Q+iMq5wFYU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8162377-c448-4d74-b1b3-08da7514ed21
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 05:56:36.6425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uz6KQQMJOkuovCOaLl3On5FehTe3kmLFk/pYiU8oaelwX3bl2Fo+Vs5lTmCQRACos63Kvt5vZGypbCIsNyrBLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6944

On 02.08.2022 19:09, Anthony PERARD wrote:
> On Mon, Jul 11, 2022 at 04:08:55PM +0200, Jan Beulich wrote:
>> Can you confirm things to work when
>> building locally in just this subdir, e.g. via
>>
>> make -sC .../tools/fuzz/x86_instruction_emulator CC=/build/afl/2.52b-base/afl-gcc
>>
>> ?
> 
> Yes, that still works. But I'm not sure why you would ask since the
> tools/ build system works this way, execution of make in a subdir
> doesn't depends on the execution from the parent dir (it doesn't
> depends on anything in the envvar).

Oh, I wasn't even aware of this as a general feature in tools/. Is
this going to survive your rework to use non-recursive makefiles?

Jan

