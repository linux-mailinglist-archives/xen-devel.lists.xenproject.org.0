Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5B03C81AF
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 11:35:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155994.287895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3bHc-0001aF-4F; Wed, 14 Jul 2021 09:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155994.287895; Wed, 14 Jul 2021 09:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3bHc-0001YQ-11; Wed, 14 Jul 2021 09:34:24 +0000
Received: by outflank-mailman (input) for mailman id 155994;
 Wed, 14 Jul 2021 09:34:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM3W=MG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3bHa-0001YK-Iu
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 09:34:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa193c7a-e486-11eb-87d9-12813bfff9fa;
 Wed, 14 Jul 2021 09:34:20 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2058.outbound.protection.outlook.com [104.47.9.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-W_oA9AKPP4GZiMo1qaCqhA-1;
 Wed, 14 Jul 2021 11:34:18 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 09:34:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Wed, 14 Jul 2021
 09:34:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0019.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.10 via Frontend Transport; Wed, 14 Jul 2021 09:34:16 +0000
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
X-Inumbo-ID: aa193c7a-e486-11eb-87d9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626255259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6fLz+ocurCB/Q2SAWCMNn0ifUD8l/iJCo2rhwh0TUnM=;
	b=kY+wuUWAJ8kaOKRcqu5TdtWRrMevp+d4ZiwAQYnY54pz40T3jX85I9xJRHsZMf40/7x0zO
	EdkPfE//hmfqq789AI4aq+hzo2gJYdYZjlw3jE6t1clfXs0li+b8AkARKL42ejVvNo3jSE
	h2PjBxCdLfG43CRZNPMAXYHISOR85OM=
X-MC-Unique: W_oA9AKPP4GZiMo1qaCqhA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hW9AwonlhNDLaeBc2wlU1zD4tgAo1rbJ/R7opt/mF5k39Se+ZlDVUEzwJc8V/24//9HwNx2zh3+OIFNHua9ID5YW50/gv4ZgabU1p+tLCzN7B5uGlLreM7h9cUEZ/kV+aAqhsKhU0WH0+QfKXGRxMd93P826LCXDWobVMiaS0L4swG3pSdvlUvHUFTuD0DUZPlT5KpyR2v0/FJLrQAUsl7MphgK7gpTz21Ek5nqI8FOSqkVcjN1elqWAoKlfSaJebxFOiaAlKPvArc66qjWe1mvP+DddEBfaC8xXpuQLJd4yXx0mJ3kBApq1RG/xZy71a5Ep/1qzw121G7HwDMcrWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fLz+ocurCB/Q2SAWCMNn0ifUD8l/iJCo2rhwh0TUnM=;
 b=T/FcVecBFqFjv0eUyWRmeFT37mD8MwKi2ckEfL44Pn9wTYlUKpNhF2ldHJvZZcnFpmzWfUVBQibIDKrv058u+gNSuWmIrNcGPE1NSqpM78Nz9Zh9KGCNtQNsc9nwCYqgovQCraWOzKugIXEZNao3MKkUlMxkF3KTGhe/Gm5sYchHAPjNQiniQYY+YHER3MIfsQsNKXdECVFnnkirll9zeIb9PYwWWFwZF2LS2qOHKDla6JxMApe7IGBWUI+GjIvheaM1K6sDTwhvksA4gIfOMxycpZVV9xB0QU5+YFwHAW/iSfeKzD1P7hTk4G/xK+cxJLNqyiKD1uW+q42LhCtJLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/4] build: use common stubs for debugger_trap_* functions
 if !CONFIG_CRASH_DEBUG
To: Bobby Eshleman <bobby.eshleman@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <cover.1626136452.git.bobby.eshleman@gmail.com>
 <2fc1a1416d37b5eed0ebfdeff8bb9dd61bc7acc7.1626136452.git.bobby.eshleman@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7468d092-42c5-34a1-74ec-7500e1bc7bf1@suse.com>
Date: Wed, 14 Jul 2021 11:34:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <2fc1a1416d37b5eed0ebfdeff8bb9dd61bc7acc7.1626136452.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec77dd82-29ee-42bb-1b0e-08d946aa8c89
X-MS-TrafficTypeDiagnostic: VI1PR04MB7149:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71493B93C3C544EC87AA12D7B3139@VI1PR04MB7149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JPs4kbljQcjcjpWkb7jQUGAp1TcQsH+VCi8rkIoV0r+gObEAvddu0doFcs7W3GtITVfk2Pf6l1E/QDWAkelcASj1M2IB1RlPy1BzDYOre/FnDjIwlcssHXe2sbVFK0y/vUTRK7OjN9DSdkHwKMz0sM/O/3AYc5kYKzeFixYzeBXvWj0UvcDf0Cux6eJKnq8GTjSYqeynz9lX7fZw1kO24qe+Cw5tGgz6M6r4LOylzfMxpfTceRDKnX5b36jlAkZqYPCJ3R5VflQGMTRnRfx9bxzUAzVxMlx55p4mNVqX7EHwg0lgNmbowHWmTJjZtpDRwaFx+rNm7VJx2oN9MZpmYJddlKEO9uUB2JlDMdTGGtI/8jqvVpvBKAVtUrDB/CW1K4UtipYR0OorUAFIuBIp+SYHXONWb+3InHUyp6VHOglmBByu7m5EMRBQx7SJx9q76VEEMFcBai3t90RxLxMa33kqguruXnkCeeAwQDa+S5x3ogxlLGFJEscJ7MkE2LEcjiUEh1NhwXZh3d5CZfujrcGt+CCBbw7bcif6Ivr1JtcTEeg+QEA85/gH/Mq5bOuptS7E1tiLV7Qb4eM3Pxe30jw9xPBjlJEgTPVL6QOJE2iSsnE5IYjzL0cKDjdffnGXSw3n+M9r/9+RqPTywmS4TSJR1NYXHuxpS3Gh4gkBVZvMHDZ664ptdQeUhKEtsfcTyp00yrHZUjHUYrJExQ/NMF+G2B8Wy05JY2ZjzXnGIhf6tGW6a2ah1CNRhS7p8izGHM7dw5i2DUlx52YRkZ8iREK8zuFTJ4Vnw3jnCCqgdCPhN0s//3ys43gKUUHfwLgU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(396003)(136003)(376002)(346002)(53546011)(31686004)(2906002)(86362001)(478600001)(66946007)(36756003)(6486002)(7416002)(8676002)(31696002)(316002)(66476007)(8936002)(26005)(5660300002)(54906003)(956004)(4326008)(2616005)(83380400001)(38100700002)(66556008)(16576012)(6916009)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmwwYUxWTHpTdTFnWmhZbmhjdjVKUC8xeThQVjNHNlNybUd4NmN3YVgrcStV?=
 =?utf-8?B?SzRMTUVBRjI0MUNqSC9NQUZZSlVxcnljQ3QrVGdVYVJ1UUFWRUYrbG15MXJl?=
 =?utf-8?B?ZndjcWRVOFZIQjBZejZVd0hoN3hSS2ZPM1Ard3BUZEVEcGlsV0VSbm5NMHBX?=
 =?utf-8?B?U2k3MlVENzF1UTlVc3BLQVY5eTNqaVpmdFFKbnpyaDhvamE1cHpwYkpxaGll?=
 =?utf-8?B?VEhJWXRJYjVBSy9vVDVUOHM1dmVaaTB1bFhuS3ZheWxId25GZGpidDlsZU5K?=
 =?utf-8?B?OW04V2RXeGRQNTRJMGkwY2ZQRHNGM04vdnhWWHI1cnRtYTBzTWRkeEdSK0Z5?=
 =?utf-8?B?dGhUb3A3d0JkblVjOXlOd3FwbWJRdGUwOCsyV1NLZkxHQVQxRnh4S1lKaW5X?=
 =?utf-8?B?Z0ZjOFhHK0FCMURES01ybVIxOTQ3SE5ZRUxiR0s2YVUxby9RNmRBTGtWVlEv?=
 =?utf-8?B?TEZBRCtqMGVPWmt1NzhzZ0pXTlFVVDVud1liYWtjQ3I5VDFUN0tEaW5FL0Fl?=
 =?utf-8?B?L3JMb2VuVldSd29QNDdQenpWb3BqTW1sVmRqWUQ5QVltNmdUaHo5SHJmNGxo?=
 =?utf-8?B?c0pkbHhPN2w2ZS9OZVJsejMwU0NsOEFMbS9SZEIwZC9NbGpuanZXMnJWUmpp?=
 =?utf-8?B?YWV4NlNMUHhXY3NuR0N1c0Q0OHlhU2RTcG93WWhJRkVYdlBySlV0VTZKK3kw?=
 =?utf-8?B?bTZJOTdpWkZBU0FmczNVVlkyTjVYYXpSRi9LWDQyRis4NXA5c0tKVlZTWVJN?=
 =?utf-8?B?QUxaMVB1aFF4cVM0Y1c3OCtKOFdRRTBlZWRHeEtISmkvUm1CaG9FbHd2NGJy?=
 =?utf-8?B?VDFtcGlrUUkyb3VEeVpUbWpULzRtZWU4N1BWNWFmSGxLY0ZINWM0YzhKNDha?=
 =?utf-8?B?amlWQWtSRm1ydE40SlJXZTd0UHV2ei9QVUJ4NXJ5aHkzMzEwckZacjVXcVFu?=
 =?utf-8?B?UFBKTzBkaEVGOVAvNDN6cnRaQVhMRkpRN1ZHNDJHL2FySWNubGNiUk9iUE4z?=
 =?utf-8?B?cVdCZVd5dFUyUVBndDhSTFlnQnNnQmYvTHdITUhkZkhoc2JJSGVGUWdzeU9L?=
 =?utf-8?B?THc1QmhNd1dDSGVtR0d1V2U1eWVhUmgrUUN5MU1mNEkxZWxCa01oUldPQWQ1?=
 =?utf-8?B?bnU3bmJlWFltbFl4SklxWW8xUkJXUGlwMDJiYTBsT3NDZjV1c1ZmTTgwUXdu?=
 =?utf-8?B?SHBuWi9wRVh2clEwYlRWSUNHaGVTSVljZDVVdVdLbWxhWTZYeFAzNVI3dkNl?=
 =?utf-8?B?cU1kRWQrV0hFb2dhQ0djb1BIaEpNUFJrcHhySEQ5VVRBdDA5SGhFRDhEQ2d2?=
 =?utf-8?B?MWJlekhvNDkydWs5SjZsL3ZIR2YraXRuM0d6dHlxRGhHbmdDN1o5eWhLVHdU?=
 =?utf-8?B?NzRzcWtha0RoMVR3WlZCT0RpSUcwSmNxTDNxVFZVejFKd2l0cUVDMUVFUHRx?=
 =?utf-8?B?UjQzSmgyQzdUeVMvd0dlcEJ6bTZwRWdMU01JdGVQN2VaUlFZTno4U3l2UlNm?=
 =?utf-8?B?d1AzR2xTdXF3dXFvRG16Rldxa3h0aG55MnNmanFNWVV0UE1vTlJPQm9OK0Nj?=
 =?utf-8?B?YTdqWlBkTnVMa2wzTE9QQ1BRSjZ5WkFYMXgrYmtrQlFEU0t3b1RKbUpKZTVv?=
 =?utf-8?B?RjlaUjYxTDMxSjBOaVhiTnFmN2lHSlNYM3dZdGdlS1I4WGt4VE5zV1R4bGR4?=
 =?utf-8?B?YjhIdFg2Yk9CUWNZZVBCZzJ4Y0V4QWFNY0o0aEJTYUZNTkJYbHo5Zkp6NE12?=
 =?utf-8?Q?loz1yAWLJXwdh9c3lS80eFBK0T31pR4EF46ugfM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec77dd82-29ee-42bb-1b0e-08d946aa8c89
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 09:34:16.7265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yu0kZXL0eg7HfrIVniBO1tR/pAL6Yl4MyLdnalTRG/DYbvI0WoAhA0Hqfql8xybuu9NlVowLd4D3uZSwl9hX/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149

On 13.07.2021 03:59, Bobby Eshleman wrote:
> --- a/xen/arch/x86/gdbstub.c
> +++ b/xen/arch/x86/gdbstub.c
> @@ -18,7 +18,9 @@
>   * You should have received a copy of the GNU General Public License
>   * along with this program; If not, see <http://www.gnu.org/licenses/>.
>   */
> -#include <asm/debugger.h>
> +#include <asm/uaccess.h>
> +#include <xen/debugger.h>
> +#include <xen/gdbstub.h>

Here and in at least one more case below: Our usual pattern is to
have xen/ ones before asm/ ones. And (leaving aside existing
screwed code) ...

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -58,7 +58,7 @@
>  #include <asm/hvm/trace.h>
>  #include <asm/hap.h>
>  #include <asm/apic.h>
> -#include <asm/debugger.h>
> +#include <xen/debugger.h>
>  #include <asm/hvm/monitor.h>
>  #include <asm/monitor.h>
>  #include <asm/xstate.h>

... we also try to avoid introducing any mixture. Plus ...

> --- a/xen/arch/x86/hvm/vmx/realmode.c
> +++ b/xen/arch/x86/hvm/vmx/realmode.c
> @@ -14,7 +14,7 @@
>  #include <xen/sched.h>
>  #include <xen/paging.h>
>  #include <xen/softirq.h>
> -#include <asm/debugger.h>
> +#include <xen/debugger.h>

... we strive to have new insertions be sorted alphabetically. When
the existing section to insert into isn't suitably sorted yet, what
I normally do is try to find a place where at least the immediately
adjacent neighbors then fit the sorting goal.

Sorry, all just nits, but their scope is about the entire patch.

> --- /dev/null
> +++ b/xen/include/xen/debugger.h
> @@ -0,0 +1,81 @@
> +/******************************************************************************
> + * Generic hooks into arch-dependent Xen.

Now that you move this to be generic, I think it better also would
indeed be. See below.

> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; If not, see <http://www.gnu.org/licenses/>.
> + *
> + *

Nit: No double blank (comment) lines please.

> + * Each debugger should define three functions here:
> + *
> + * 1. debugger_trap_entry():
> + *  Called at start of any synchronous fault or trap, before any other work
> + *  is done. The idea is that if your debugger deliberately caused the trap
> + *  (e.g. to implement breakpoints or data watchpoints) then you can take
> + *  appropriate action and return a non-zero value to cause early exit from
> + *  the trap function.
> + *
> + * 2. debugger_trap_fatal():
> + *  Called when Xen is about to give up and crash. Typically you will use this
> + *  hook to drop into a debug session. It can also be used to hook off
> + *  deliberately caused traps (which you then handle and return non-zero).
> + *
> + * 3. debugger_trap_immediate():
> + *  Called if we want to drop into a debugger now.  This is essentially the
> + *  same as debugger_trap_fatal, except that we use the current register state
> + *  rather than the state which was in effect when we took the trap.
> + *  For example: if we're dying because of an unhandled exception, we call
> + *  debugger_trap_fatal; if we're dying because of a panic() we call
> + *  debugger_trap_immediate().
> + */
> +
> +#ifndef __XEN_DEBUGGER_H__
> +#define __XEN_DEBUGGER_H__
> +
> +/* Dummy value used by ARM stubs. */
> +#ifndef TRAP_invalid_op
> +# define TRAP_invalid_op 6
> +#endif

To avoid the need to introduce this, please flip ordering with the
subsequent patch.

> +#ifdef CONFIG_CRASH_DEBUG
> +
> +#include <asm/debugger.h>
> +
> +#else
> +
> +#include <asm/regs.h>
> +#include <asm/processor.h>
> +
> +static inline void domain_pause_for_debugger(void)
> +{
> +}
> +
> +static inline bool debugger_trap_fatal(
> +    unsigned int vector, const struct cpu_user_regs *regs)

I'm afraid the concept of a vector may not be arch-independent.

> +{
> +    return false;
> +}
> +
> +static inline void debugger_trap_immediate(void)
> +{
> +}
> +
> +static inline bool debugger_trap_entry(
> +    unsigned int vector, const struct cpu_user_regs *regs)
> +{
> +    return false;
> +}
> +
> +#endif /* CONFIG_CRASH_DEBUG */
> +
> +#ifdef CONFIG_GDBSX
> +unsigned int dbg_rw_mem(unsigned long gva, XEN_GUEST_HANDLE_PARAM(void) buf,
> +                        unsigned int len, domid_t domid, bool toaddr,
> +                        uint64_t pgd3);
> +#endif /* CONFIG_GDBSX */

I'm afraid this whole construct isn't arch independent, at least as long
as it has the "pgd3" parameter, documented elsewhere to mean "the value of
init_mm.pgd[3] in a PV guest" (whatever this really is in a 64-bit guest,
or in a non-Linux one).

But I don't see why this needs moving to common code in the first place:
It's x86-specific both on the producer and the consumer sides.

Jan


