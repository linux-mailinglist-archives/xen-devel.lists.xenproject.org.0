Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F0866C45C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 16:53:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478821.742239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHRnL-0008LU-Cb; Mon, 16 Jan 2023 15:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478821.742239; Mon, 16 Jan 2023 15:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHRnL-0008Jk-9X; Mon, 16 Jan 2023 15:53:11 +0000
Received: by outflank-mailman (input) for mailman id 478821;
 Mon, 16 Jan 2023 15:53:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJiS=5N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHRnK-0008Jc-J7
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 15:53:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id deff86c7-95b5-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 16:53:08 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7354.eurprd04.prod.outlook.com (2603:10a6:102:8e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Mon, 16 Jan
 2023 15:53:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 15:53:06 +0000
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
X-Inumbo-ID: deff86c7-95b5-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VyJwOnjpW3Exilt7MJCaz62/10owZ7zMpUqlHlCwEPprWaMFJCSmu+3SQ32/R+pXrvGsV2NbzIefClnMmbfgOhND9W92PqKKlcFVhf6bEAJeiplblmatnxeDhuEx7KzTqeob/mJOGUcnNNTlPGBsIDHfYqTGcZ2Ksjgl8g6mL7NUfW0ZWFqJp9pA83FcQJvzTJdpWqFI7r2QTKgADbFybw+TL8iEdBlkEG9ketOFfV1vJ0Rtfl5Fb4KwAuvDUodVcJhmSLuWiCe5Arr1qTMX8C3SxDVnssGZ075Mo0D6/nMTyi6L4Gbv5cDsw7idu67n5Nyiyf9mE8u0UeK8dQWWBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zq5dcdvsUgQl8t7WqSJGZgZE/1yIwBnvejIvXnI0TBg=;
 b=DnV51OHOF4DcI5JKiHjSG+qG5rhgkL6/iQpZjyb+lb44ZmHWkY7fRuZ17bvU4pzqEUVTFcUvJCiSVfwqqgrE2/ZdAVu/zPQNzy2Dp/mzjlM/fdg0K24QcrxyGgKFQxn5Gm1jXcDh0BfXUY5iEjMLDsk0y4e0+NTKQnhH0D0Ot2IIrMwv8P3yDewYPOrlalDhE0J4m+H+JukHWPwKneXHyKwZb7Y/TC4Lr5TSS+Uf+ROz7YpXJ+0fHTohV05SzRx6tKH3l1UDIxJTP8bkLCBqUMKFXebL6Uhp6Iq5oCshwriwYcTI9be+w4PHVx7c5qYpFgJjexHeLf2kIpnLIBcWJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zq5dcdvsUgQl8t7WqSJGZgZE/1yIwBnvejIvXnI0TBg=;
 b=KKNhnLTSmb/hc1Kba6/z9whhdlKrOGDHlq+P9WNMYVK117ByuWvyiQwg8gFuHf/Cmvev9rKBEaU/slLAKwNajNHiLv1TkCu4ZIZGniLZNODFmICkwLRDjatngbRAaFPlIYUdFj2yqI9oKyQZibxNP5ZKs/AcV2ULyZP0f9LJy7X50bjigST5rLrxA1bO4i7VN/oDqAr72XVQBlESdc/5wNBX4fTls1QFXamO7eZhoThzLksqigUuYZyJcBq5RSNS7uv2AsoFp0VQpZ8hWYyW7dz+mAp0WjNCt7MxVTCLvxuTLtoevNl6eDTZXDAvCUh5RvVF7wAZBJwSudvhEq9ntQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9ff94f87-e3fa-c397-ebf0-b4849cba757d@suse.com>
Date: Mon, 16 Jan 2023 16:53:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/5] xen/version: Calculate xen_capabilities_info once
 at boot
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230113230835.29356-1-andrew.cooper3@citrix.com>
 <20230113230835.29356-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230113230835.29356-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: a1da5ae1-f340-4d3b-10e9-08daf7d9c1d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v2kvI4/9Ut7oJtw0O5EKumOD4ejgqlLUMIDUb4SydlIRepR/VMtdnBSLlFjfGjBvzZxga4ZXmVv7P5xiKbES3iEH/COFRWBpBlDtI1jOFfn7EH0xxVvLiuYtcrsJXqp2avXYxpCTs+jUPpAyAS396oJzuC/Yv+FbPHmDmQkNisZMtiNDfpTAg4MjHgNaMcgGRiTOQnvlNaWNP8RXoBLJZoJR4rAenOWVlqvb1VtsDaVlyouj7lcunc8J2aTVCf4/V+0OTkT7ccY+eHhhTePab1Noeyvg7ZR6lqcTraVo7mOygM6VnCmuFm0POu7U/Y8WX17vyVIgysiaKRtNT+bGf0ccJBMKoZVxN8mbX7VzX6Ecv9w7n/LHQHr+9JLYGyRxGaGMwjeIp402g17DdrG3EdeipIG31YNm0K6bhLyOLnY3LuT2iVDQ+PBUCdsHUKoXUJ+22KSIi7Llkl6aNpSgZTY+lIwFnNaBvaa6anQCCtUIyfPKL6thqzGWLsge0wA0Sh9IrhjsUPUaRbaHJCLxakw1BZYrSu8P0y4rmofVXqDYPs3msAntPXlhzthF1wf3/j8TTlvohSd9oR3FLDB+AtBhqJwkOcGahJlSe+yOSiOPEosjR/uYNWk2wQnMsJJw7mXKmpoirqReHFWegWBlvHRdR3+SO3Hb4HjP4lZ2gAHPSrmPon88J53LmIk/vrqLYw7PUsBgVLMIopKoekrLvzPr3Crk5YfcTccSzyu5zYY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(136003)(396003)(39850400004)(376002)(451199015)(38100700002)(36756003)(86362001)(31696002)(8936002)(5660300002)(41300700001)(6916009)(316002)(66946007)(66476007)(66556008)(8676002)(4326008)(2906002)(2616005)(6512007)(53546011)(54906003)(26005)(6486002)(478600001)(186003)(6506007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzFqSWlMOHgrTm5jNEJ0RHl3cnVIWnNXdlhWTWEvYnpuU1J4OUpEWitpNTlj?=
 =?utf-8?B?aHVjLzhaY3RzeEtUOG5Uc0ZucTl0VElLZ3p1RjBxc01JQzE4TGVhbFFmWGFi?=
 =?utf-8?B?QVlyQVRMYThNTjZva3E5d3NaY0x2ajVxekVPenVwbHQ1eUJKSE9ab1gvZzM3?=
 =?utf-8?B?L1VkWDNZNXJqWXEwcWRYcmxNWmNUcXZ2UDNMMUdGdkhtRUc5dzdxMkI4NEtS?=
 =?utf-8?B?SlFuV0ZEQXZFZWpUa3JOaEN5WW5uYXlaWFNmR3BhMnRZNUhkanBmL1FTemMx?=
 =?utf-8?B?ZmN1c3l0K3FLdkRWQnZBSkIrSVdyOGJHakNYRDh5bXpMZ29QbXJ4Q0tzbndX?=
 =?utf-8?B?dUZWQ1poRWFUVTF1RWNnTkVHcnBwUmZZcEw5ZEVvR1BhdjZwRDdGLzlkVDhF?=
 =?utf-8?B?U3crMW9uMmd2NkVxd043TlluT1d5VFR4WW1HYTBrOGxXZndWdnl2QzhFVDRI?=
 =?utf-8?B?VlpuVEYyUmhXYzRZK09IemN0d3RUWHJaOVRCT1ZWcytpenZaVHczUXJtZE83?=
 =?utf-8?B?d2xEUUVrT3dEWkdCYTN3NnNod2UrQ3R0cU53RVd2aDBCSlRicWljNjg3VXd5?=
 =?utf-8?B?dUpobm9GZUdnRmF3QllSeUZtOGtBVW1wNGFUYmtVMW42eFY0eWhFcnZXT2Fy?=
 =?utf-8?B?aFVkbkR4UWVkQ2FGVHUza01PWHpYRVNxVmFJaHdlT2xnZ2lEa2xrNkV6Vkx5?=
 =?utf-8?B?ck5YakMyOVFYc005aXJ4NHJjT1JOUXBPZHVRQ3FzQkl3Y0w5WHp0c1NHRmpS?=
 =?utf-8?B?WDRWUUFNd25UM3VZcE9LZC9DMTBCcW0zNkduS2RJUjFrbUVuVDlVNWNIUkRF?=
 =?utf-8?B?M3JSZ0V3bGVXWTEwcWdEOWNjNmlOWnB0MVQxYlVBeDVYRjlKRDZJbUFIVysz?=
 =?utf-8?B?d1BMWDNrZ3cxWFZpSWhMZE5kcUoxT3Z3VVJZWDRYTnA1QTdKLzREK3J4K3lI?=
 =?utf-8?B?RDV0UzNyZDlPaDRVU2ZUYnRDeW0zNHh3aXpmZ3hsTTlKUzM0dlFzRGFoU3hD?=
 =?utf-8?B?TjV5SlNMeWdHTWhtb204eFhFMHdtSEs2cFJKWHFkaGhFMU1CQ2lDdWxNMlRM?=
 =?utf-8?B?WjBUMk44S2lrbHRseHZtY2dNZFhMSmJJOVlDbytqSG9Rd0o3N1RKVHllRVBS?=
 =?utf-8?B?NlNjYjZWc3ZHS0tMODJObktPajBoS3N4MWlTcjh5NEkraTJUYjRnSzFMcytH?=
 =?utf-8?B?b0ptYklDWVJRd3JTZzZKaHNkZHpRWmxOZnR4aGZnQmowQjIzcS9kbHBVQ3JK?=
 =?utf-8?B?ejQza3dSMzFrdXRGZFhOcGhqYWtXbFEzME1ibEhTcjdQeW1oV2pMUno4cTN5?=
 =?utf-8?B?T1Y3REoyUU84ZVdhRHVGTzVSZ1VKcEdqZUdHWi9QZUc5SFlwUXpWVVRTVm5L?=
 =?utf-8?B?dlVFZTVYbjVQWG1YVktGcTBFQ1Q0Qlg2OU9xa3g2blVJWEM3Q3ZYakE3WXhE?=
 =?utf-8?B?K0N4RXpEd0dIY1F3U2VKdFRrdHppWmI5V0JlaXZ6cldUbXNZa0g5MWxOMVVR?=
 =?utf-8?B?ajM0eEMxZnRLOTZLOVVweDkxS216bzJhZnNIUTgxaTVMRTduNElubHRuUzc0?=
 =?utf-8?B?TXBpOVZ1Yk5ldFl0NmNhaTJIY0h5Zk9ZNFFKNGdNemRQZWgyK3lrdzZzUUE0?=
 =?utf-8?B?Y1ZIMGdUZTVKNTFYN3QySU9Wam5IcWJaR0lHMFRQeEpmbXhveCtnWWJzK1Fa?=
 =?utf-8?B?SGZXT3U1TGdWYUNEYmthbjBTS0FwdU90c24reHRkUGd6TUNudUs0c1ZVYlhv?=
 =?utf-8?B?SWhtdkp4U2RLRUNHeHFIQW5aUXlqR3JYaFpBeElYeWVYeEtkdm8vdzJ0TE9H?=
 =?utf-8?B?aFA5bUc2Z0hTbGUyak9zdGRNcnFYdDE0dHZ5aTFLejBsM3QvQ0ZUclVGMllI?=
 =?utf-8?B?aWl2U1VTaEwyK0ltLzYyR0NHWlFUbHhlbDA4cnRFY3pKblFBTDBhSmpmMEN0?=
 =?utf-8?B?ZVNDcmxBUDM4QkxVY0IzMjl4ME8yR0VES0JOSGhDM1BzYXY0U1NMMkdJOGRs?=
 =?utf-8?B?ak1XeDhLNUErZFhRNGlwUmtBWHNCNllJZDVkTHozV2lCTW1TK0JTUTNUT05K?=
 =?utf-8?B?TzZRSWF0RGVZZUM5aVpMOHNYLzN0OVg4N3UwbmNSOTN0QVczVGsyT01hckxj?=
 =?utf-8?Q?LRJdE6qbLG2X8j8U8Xr8biwxq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1da5ae1-f340-4d3b-10e9-08daf7d9c1d3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 15:53:06.0332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5e0AzR8Y1WJldaKOQKpsAjM4JlhM0PB7Q7becPST2KVRMD9vzxT3DdiMJaBOXzMGSx5szzKdfMoF+TWMhPL1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7354

On 14.01.2023 00:08, Andrew Cooper wrote:
> The arch_get_xen_caps() infrastructure is horribly inefficient, for something
> that is constant after features have been resolved on boot.
> 
> Every instance used snprintf() to format constants into a string (which gets
> shorter when %d gets resolved!), which gets double buffered on the stack.
> 
> Switch to using string literals with the "3.0" inserted - these numbers
> haven't changed in 18 years (The Xen 3.0 release was Dec 5th 2005).
> 
> Use initcalls to format the data into xen_cap_info, which is deliberately not
> of type xen_capabilities_info_t because a 1k array is a silly overhead for
> storing a maximum of 77 chars (the x86 version) and isn't liable to need any
> more space in the forseeable future.

So I was wondering if once we arrived at the new ABI (and hence the 3.0 one
is properly legacy) we shouldn't declare Xen 5.0 and then also mark the new
ABI's availability here by a string including "5.0" where at present we
expose (only) "3.0".

> If Xen had strncpy(), then the hunk in do_xen_version() could read:
> 
>   if ( deny )
>      memset(info, 0, sizeof(info));
>   else
>      strncpy(info, xen_cap_info, sizeof(info));
> 
> to avoid double processing the start of the buffer, but given the ABI (must
> write 1k chars into the guest), I cannot see any way of taking info off the
> stack without some kind of strncpy_to_guest() API.

How about using clear_guest() for the 1k range, then copy_to_guest() for
merely the string? Plus - are we even required to clear the buffer past
the nul terminator?

Jan

