Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5265A117E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 15:06:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393421.632367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRCYc-0003Iy-HG; Thu, 25 Aug 2022 13:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393421.632367; Thu, 25 Aug 2022 13:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRCYc-0003FS-Dw; Thu, 25 Aug 2022 13:06:02 +0000
Received: by outflank-mailman (input) for mailman id 393421;
 Thu, 25 Aug 2022 13:06:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2f78=Y5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oRCYa-0003FM-8I
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 13:06:00 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20048.outbound.protection.outlook.com [40.107.2.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0cbc0b0-2476-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 15:05:44 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR0402MB3768.eurprd04.prod.outlook.com (2603:10a6:209:1c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 13:05:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 13:05:56 +0000
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
X-Inumbo-ID: a0cbc0b0-2476-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4p/nXoxSUPg5jxmSxRIoAnguYv6gUmErl3BbaYTqCduHtSjQD56kbxru5uXKHwmtBc3fpSJDYuT8556V6G6TlJjaq2AKx0uy6xX23KE8IpWrGVrWRyL5Me0q7GNBtZOYPoaEVc1fA5rncKnSwjDp8MW92owyj3wx4SDtoAm00wVNASPrlFRbh8dnN+ONdm3IdanGT157V+gBiogPQ2YLvthrAmb59I99MCBwO/+sGZkxqOxuT2Sstvz4LwtdpO20Ja/akq1uDjLp6vbkitjN/WBXDyXIx97BA+HNKm6qURKOTTpobG3QKarIgF1s+DrVHl57wwoKaU68O4sgGQnvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4reuZxpKOygi2C/hkQSeef4QCTSg1PQqAAC+tDXQJo=;
 b=Mr2VlZKoBRu/9M3nGcyXL7ja+3cGJ4F+wfdPhRKsMPTlVzuvcUWOB93ZXJocBbkFViCVl20kg8sjqnnwUa8km+DjqJzO+5c72yuO9FVVc6niX02pxj70nA3YgACDCRAu/s/+dG+wwrsOcytaWbUf1duoJWczguiJ6/a+hqfx7gw4jCcpcUckAebaaIa+PUPrWee9yvSTLtaVaFReFdCOYlpGfCy0Syr7nTSerAYA8xGMWyN3ajNZHAuVhk/YLEIZ+cGmsaQNchokX0YBUcKnoPf3e5fBtjYJE2SX9qpW4OxoKsYc+aBSw3NZ32NiNgT0yww23J5dmCBxpY6VbI5Nag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4reuZxpKOygi2C/hkQSeef4QCTSg1PQqAAC+tDXQJo=;
 b=zGsvl/MWGvu+6W0R4nJYnUili0cdTBdAJjcpkLfa3DjukH7C7IrcJTh810VJzgzANTyHOvjgnX2lOMg6zaX1dOWjh6mExGDmcXFly7Vr8UL8pjYdvpvYj7mvOBhk2BHsE464OYJ2ImVBJUN1NRDf8F+V6cBwomh+OSB8tG4C0n2nwhMoEMC9s2TOZv57vUARzbcY/YtW/C2GAhvx6oBbcCtd2yivD6S0VOvFPpKSLDYu6TWEqwo1DuwU8Dp4c6cDKIh9xwdLEGLQSgE9ZqGnuPSXDT1bMOC1s3WjT81bQPEfbSDDApBedqIrgtr7/4w95piGD8woNxaPSm7IoZYZIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <33d061fb-5bb9-f9a6-458e-23909d306580@suse.com>
Date: Thu, 25 Aug 2022 15:05:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 6/6] xen: introduce a Kconfig option to configure NUMA
 nodes number
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220822025810.2240707-1-wei.chen@arm.com>
 <20220822025810.2240707-7-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220822025810.2240707-7-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0076.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 507a6206-3377-459a-53be-08da869a8c4b
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3768:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nAahYj0Sn6O5D4JBsHDrvkgnT3l9qWJr9G8iKBje92DB7HwX2QDdQZqshDiGrhzANzFDULuMt4n+l/L+5AJ0ACs2oqKEL3nPXGF78QnGz/Oruq5iNt6AjnXLIFqYBrNj4JiALAYU1lGJbljqXkEo3ZeR5aS9p4J4vDRKfTFEK8sk9yCXHEwBBaxEW03hHC7t5NHa5WvSGGfZI+6VHBC4CtWh0LXn01m5FFB70K0jjfYw1w7jsrzLh282LSPV5JK+rPLgH8W4ApyaGoyC5AmtVqC8yHn5CzMjAoc0pZQiFkX9fka5uJupSpoKg3M+jIi35fiYclT9wUEZ5effNBxzRH+zRXzKJtDrJ8Bj9h8Cq6x2kqZspWFONIXVOa5+kPYBJfXUM+RmVOtq8/fNkoXTKsywWU5iJP8MyPpKicABlZz3qrqQpWpnkYHZ3qWleIdtyyeqeOTYjQGDxGwUFMAIXwkctsMYhRcLYpOgvZiEoK+pzx4eJT8njfwacdPnA2y4mqkWetTVNMMPYUjc5myfGtqg0srOPUw8MDL4edeW6wVfh+q1gmRB2eP3sUo3ZLu1CD6aCmrFBZ6lY6/LJ8KnSzSJyLefSO9PkwGWZ+Ote+c6hhevEFhQZj+WJLLGZjSRbOqkSBunx6f68fUXP9TKs63or68MuxgflfWzdnC8jl3kP6zkXb/a+92FKRiYvocnEXlU1fCnU6LiSJ/MEEg9hCS1TEGavl8GaToViB21sagS7DxGmKUjfxs4IDrHoIi8qS1DS1Ke7ZQ9tE0Axx7QeCnygyOtl/FzZrhXS03GLqI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(136003)(366004)(376002)(346002)(38100700002)(54906003)(53546011)(86362001)(4326008)(31696002)(41300700001)(6506007)(66476007)(8676002)(66556008)(66946007)(6512007)(316002)(26005)(5660300002)(8936002)(36756003)(6916009)(83380400001)(478600001)(31686004)(186003)(2616005)(6486002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZElreGhETXFyLzB0TlFXUE15WkxyK2NiQklWbm1Pbm1wdm5iNk0yRW1PQ0la?=
 =?utf-8?B?cTdaRWViWjNDR25LTEQzY1NHR0xVazRUN1RLVERnUjdmeXdBQlBjYXZQd29Z?=
 =?utf-8?B?SDAxYzI3Vlp6dHhESERIai8wRmJjQlRZUnkzdW5QbFplSzI4L01Bb1kxcVJL?=
 =?utf-8?B?NXFud3A4ZmNQYVBZays0R3hzcHpOYVlrSXVjUWM2eFJUUFRVL0dzc2VRUzlz?=
 =?utf-8?B?WVNkYkRwY1ZDME1OclhVTHpmOXVHOGI0ZmNhOVBlUmRQTi9DUnlROVA3bkVa?=
 =?utf-8?B?elZTTHlPb2tvUktXdVB1ZjRKUmJSdDVvKzJ4Y2xBc2ZxaGtwVXVmTnJEVHhP?=
 =?utf-8?B?bXZUK2FPRUl3WWZPQzZWR2QxR3lQY2RRZmdOSUordWlkL0JSdVRtZWZKSit1?=
 =?utf-8?B?S0szdFZzbGdPSnIwQzU1c2owSko4SXQrQVFELzlCVmExYllseUw4N2RLTkRR?=
 =?utf-8?B?SVNRUng3cW8ydGtGUGV0QXhPTVJVWm00SWRYNXp6TnZhaHBTakR6V1U4YmM3?=
 =?utf-8?B?YktQcS9CWVNxSE5XeXpqY1pyMlEySWJxeWUzVGU0TDVzbHZCZXhONjdQY1Bl?=
 =?utf-8?B?dVVLdm53dTdydEJScjBISHd5QVpPUmdjZkI2amVoQkFHMXU4WVA0N0tIY3Zr?=
 =?utf-8?B?OVhPTnZ5a1E4TnppazFXSzEvNG1lS3VKb1laUnpkYUVuN0s4RytTYTdWbmlz?=
 =?utf-8?B?TzFHNTdiVG5JKzVmVGlQZHVYV2VaYjQzbTVOZzIva2lDRHJkR01hcGNoek9M?=
 =?utf-8?B?d25wdWM3WHpKcGovcFhrcjk3L2dLelUyVlltdlEzVEF5VHFRYnREZGtrb21u?=
 =?utf-8?B?UmJVYXBVZ3I1TGhyRHowVWliY2s4ZGthYVhyQ2pEcnFyQWR1eVBHa2dpNVVm?=
 =?utf-8?B?bytxcEp4RnJFR01vYmdYSTZEZzhya0JMZ0IybE5xOVUvdklaL0s2VDBlMmVN?=
 =?utf-8?B?ZmJBU0hGOFhSOHpvL0xxeGxuSExxZE1EVU1DbndJMDhuOHFrVms0SFUwblo2?=
 =?utf-8?B?c0RaUTBVcldhNUhCN2t6NmM4TFBKU0ZtUzBYSkh2LzJWYnF2WGUrMG5hU0Jq?=
 =?utf-8?B?a2VFMEZhNUFYN0YxWWlRR2w4YXFQYUFlazlPWWllaU5aTklkeXNwdEgybFlh?=
 =?utf-8?B?Yk1peGhjczRQbEVjYWV4eStmV09zMFJUY09HaXo5Y1dIV1h4akx1K0J3ZmRZ?=
 =?utf-8?B?Q3N0RHJMVk8zSTJuZmp0VmVJaHN4Vm1RTkxEN0c4YXVaUnVVSTNzdmc4SDF6?=
 =?utf-8?B?SnFXSEc2WUJhdnovOU84ZHgrREI2QnJLSW94azVYRTZUakV1VmdEa21pM3JE?=
 =?utf-8?B?QUxKa0xNU1AyRkpyanN5alhFZ0tFVG12RHhYdHpXT29WTHJpQVlBVVBGUHFG?=
 =?utf-8?B?WW4wMEVHcXJvdC92cGZ6c2xCZTNHTlNiRUhpYnJITnNwdVplYWd2a0p0VS9O?=
 =?utf-8?B?bWQyZ3ZDZE1mOS85T0pFYktZMVNwT1JteWNHUkpja2RaMnBBWkhaWHFHVXdK?=
 =?utf-8?B?T3IxQjB6N2dOUzRSQjQwYVVoUG9uZFJrMG9EaUZBc2pCQnBWZ2M5NkFkOG9Q?=
 =?utf-8?B?UUsxT3M4SmlsakpXcnNFVUIvNEhkaUZ6UU55SkwrakJoakxqbzhqL1o1VGdv?=
 =?utf-8?B?bDc4MUxwYWgxd1M5dklEU2YxU0t4VFVlUlFJckpTTnlQMkFzUFFCZTAxa0p2?=
 =?utf-8?B?WEg5aWVsc3BPM1lUYUdjKzFpT2tuOVE5YVZ0TitTUFg3UE0rSG9FVkh4Q0Rs?=
 =?utf-8?B?ck84TjF6bHRUbm1iZGxwRFQ1U1pqWEVtVDM5aG1vOGhTbHYyZE10QlBpSURm?=
 =?utf-8?B?bFZyYmFicnRjN0NMeWsvMk90VWowQVVRcm5DbitKZ0p4cEVjVmlVS3daS05V?=
 =?utf-8?B?Y2JJRmIrZWNEdjZOWTdjNGg3M0UyekRmTFFtR1AvRmNUM3liMVNSUGxnUHRN?=
 =?utf-8?B?S0tuU2JMcmJGZXVEVno5Q3dCQmpsQkoxeTBJVDRiVlN6Y1JSdGdSTXIva0Er?=
 =?utf-8?B?NVYzaFNpZnBzZDZFTVRhTVdNOG1xZDBobUFQeWNBL1JqajFtMmo1S3BrUEh2?=
 =?utf-8?B?U2tZelNEQlI4SUVuYUFVaGw4TzJORXpQdUkrNWQyYkozcnF6RndrWm9qbUhB?=
 =?utf-8?Q?uRJtNKIVErpDHo8J8lbaXKEfs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507a6206-3377-459a-53be-08da869a8c4b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 13:05:56.4116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SOxGeBo3mbex91M2Se4+tq4H5T5VCSgj4i6Hj28x/nZy22YG01IzCvw9e9bBzJYYuFxAIDYSzxpAa+HnTpgQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3768

On 22.08.2022 04:58, Wei Chen wrote:
> Current NUMA nodes number is a hardcode configuration. This
> configuration is difficult for an administrator to change
> unless changing the code.
> 
> So in this patch, we introduce this new Kconfig option for
> administrators to change NUMA nodes number conveniently.
> Also considering that not all architectures support NUMA,
> this Kconfig option only can be visible on NUMA enabled
> architectures. Non-NUMA supported architectures can still
> use 1 as MAX_NUMNODES.

Especially the uses of "NUMA nodes number" make this read somewhat
odd. If I was to re-write all of this, it would become something
like:

Currently the maximum number of NUMA nodes is a hardcoded value.
This provides little flexibility unless changing the code.

Introduce a new Kconfig option to change the maximum number of
NUMA nodes conveniently. Also considering that not all
architectures support NUMA, this Kconfig option is only visible
on NUMA enabled architectures. Architectures not supporting NUMA
still use 1 for MAX_NUMNODES.

> As NODES_SHIFT is currently unused, we're taking this
> opportunity to remove it.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Note that there's an alternative with less #ifdef-ary:

config NR_NUMA_NODES
	int "Maximum number of NUMA nodes supported" if NUMA
	range 2 64 if NUMA
	default "1" if !NUMA
	default "64"

But I can see reasons why one might deem it better for there to
not be any CONFIG_NR_NUMA_NODES in the resulting .config when
!NUMA.

Jan

