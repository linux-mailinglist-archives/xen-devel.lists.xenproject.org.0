Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EF96BCB77
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 10:52:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510456.788104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pckHR-0007wf-NV; Thu, 16 Mar 2023 09:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510456.788104; Thu, 16 Mar 2023 09:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pckHR-0007uj-Jc; Thu, 16 Mar 2023 09:52:17 +0000
Received: by outflank-mailman (input) for mailman id 510456;
 Thu, 16 Mar 2023 09:52:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pckHQ-0007ud-It
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 09:52:16 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe16::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b28ef7d-c3e0-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 10:52:15 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7445.eurprd04.prod.outlook.com (2603:10a6:10:1a7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 09:52:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 09:52:13 +0000
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
X-Inumbo-ID: 3b28ef7d-c3e0-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQNDyNvfpy3FRO/YOewmLlbdecc62f8I1PmdDzhj+/Sc+l9ZR5LIvXOGmE6e/OL2zkcYpXUXaNEo8Vn9L29GKdS3XQtHRNVx2AsE6ne+cFlgbgIKvT7RDDlgtehz/nXvKeR6LV1m1qCgBGoYXJtuPOHoVK3ACedvIl7Z+KP2NZClV8MxOZ9Sqn4NoyOuGNf2xtDhX/O3uuciwev+7PiZsNEXRhM8zTP279s0hGqO+irgKN5d5vuVYUusBvlEYBeDvL6MlPlgxAAoOTrdnhJ0hFyfABU92lNrd3z+u0wYGX3+vWeixsrocMA20wW1oVVv/vPfdVukySsoXF5Yv/Ey5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cW/4t6I4MqqHOOMnxOoHpsdSneQbOem+mTTcxPWTOK0=;
 b=BgKCeDCSKeTsGpyAI6X2vYnNSl7IkcWmfi5V3brcZxvoql2weuXdpBCjLh7nV/fz6FJ6kGCzKdcI7TMqwTEZpOatg1Czl/QGdkTwka2oSSdyq6v8mXZ7fhA9EQyg2tHqKfof1Q/z1qHi05f0tK2v/wdmRHOwJ3O5hb8Cted8Z/3CorT+kqzoL3syY41U10lb17M822r+u29njG7wEgJZMwysP5197RJ3jsjTlYux8O/rSftlXA2u5GBChWfA3Jjbch5VpZtUcAb1M7YHPY6Ev06YWKZE7C56XKpftvigqhTgp21QE817VNRzkgOjZj7tdkjyzNYHFPbht+kVWdDhcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cW/4t6I4MqqHOOMnxOoHpsdSneQbOem+mTTcxPWTOK0=;
 b=Y8Ue2IfT+3TQOKwmIrVarLYU6Jfuc5GA0QHePpRTvI6uBoyN/jQjy2KoEh0s7h6yWRF6yZf/99zk+BTzK99IOVhpUUcNlGJbzkG4R4AEllkzQhgB/lf2rXswqJlRcVPz2zDcEtbO/bMqFkmeNQAzpO+dgZcCtmatn9mucgaSI7QQHLS9LPPLrKQqlihdgra19O8Fx4WzFn63JTHa9Zf4ZHx7ORTghWV3c6MVamQtXegaFy0pm4f2/MVK9W8f8q8+bZK6so8bSFl5i/Clf+7wlOqTnIslNFfENbIxJ1QtlLmv5Yq9HgwFWqb/+WvhnUHwQ4PLIBnp+RclBMBeOFgM/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9af94e49-ff66-5e7f-bf5f-ba4095cfed13@suse.com>
Date: Thu, 16 Mar 2023 10:52:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 5/5] xen/x86: switch x86 to use generic implemetation
 of bug.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1678900513.git.oleksii.kurochko@gmail.com>
 <5e252e8dacea5c4f2fdbb4f7970e34a862987639.1678900513.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5e252e8dacea5c4f2fdbb4f7970e34a862987639.1678900513.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: fefabf80-677a-4f97-fba6-08db26041e00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xy+IsejC841RryKa7d27uIUbTieX0ojo0D2UlFwJ+XZ9zXPBmY/O1uNuRPlfXUFMfJnrMC/I4f8bRekSFEi596/X1mSwlc8xQKHdOp57nVpThkkw1WyYOElulJYVjm668ncdsWPIcHPWQVajL4pm+r0YW7Jk2Akb4vEFtaHqkyBzhzfJLjSQNb9o6IZPA9YT/MedkGjrwUQ+WqeyuUT21zgwaNxYi0DLIPz/8wEbKo3H+2H6xa9uGLrNrS+I4fkSRElFdrcyhrnVUGcYRs7iF1r2OAcOiHrj4UANJcyX/9teNqJvUFZkpuBRi1QqaMztD0JexEZjqnBvRi6Pcu9oZpvOUoFMox+l/bZsTbRbZH4Qwuu2yNO8H2GG6EL6D/6pG2ddx6S3rG827nWxH2+ttG5f4rcpGUSutD8Tx9P7GblaVBvGJ6zqgvZpYwIitDIglXwEkYL+ZdCrujQjDcoQy6wvKBOWRYeLozw75tAfm7XWA7Ex7JxJiE9ZnnrCGSwgQ0gCTobXG7K0467hJ68WSOt9eb+uCM+VRTwZ+l41K/MviCCHyONHqMltaUUQQhUl93o32mVod33zea8rn3naUOPwlo0RIRvPUNwKf8WHGUkEWLfJCZWuXiqxNggmKynJs+Izn2ITCqDEBf5Jabb4aQo+O2/2pWwvkCKYbCaS6MiUzIbd3Fxw4RwTnyqhopxsMtm60kY6vCeKpUsag0giZKD6Yi9ajblWLrIDHipgGfZ8XFEdb+VB/VuGBR23LP1o
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199018)(86362001)(38100700002)(31696002)(36756003)(2906002)(41300700001)(5660300002)(8936002)(4326008)(6506007)(26005)(2616005)(6512007)(186003)(53546011)(83380400001)(316002)(54906003)(6916009)(66556008)(66476007)(478600001)(6486002)(66946007)(8676002)(31686004)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmJtOEhUL3pQOGZxSDBvekJtd3AydFJuOGFNL0VQMzBpRHNoTWVMcjhvcTlv?=
 =?utf-8?B?MnFTOGNFcUVmU0ZZZVJwMk1iaUFhd0o3dlZFcjlhcG4wbUtra3RzRWJFaW1F?=
 =?utf-8?B?ZXM2bXVIYy9ON0QrZnZpZTEwNXlIN2tSNTVUNjk2NW5vVXZyRGZIMUJuaHpS?=
 =?utf-8?B?YUpSV0FYUWljdVFGcFhPRzMrRU5iVjNRRFdKZWVhZ2M5Mlc4MHgxdGxzZjh2?=
 =?utf-8?B?ek5nc2RPK0MyTWp6YmtERVUyR0VmdjgrZGVkbmRWZUFJOG9CZFhJQ3lrdUlO?=
 =?utf-8?B?cmlQMExRNkl5U2ZreHZoTm1OTTZlRFhOWjdIaWt5a2t4c244RnM2Y1JXUzFM?=
 =?utf-8?B?V2xEWENFMkt6VlpiWmZiQnFaR0M3M0F5SnhsV2I2K0tEWVg5T1ZHZ0VCazZq?=
 =?utf-8?B?d3hGbWVaalh6MHdpcFBldEYvdS9tQS9SMFFQcWdYZXhOOWtxU201S2hRNWpm?=
 =?utf-8?B?K0plVXc3c0dFNStKTnBxR3pJZ2NPNk9leXhZQmFiWmlKR2JSWU5kb0FyeWFC?=
 =?utf-8?B?WWJ4NTFSYnhGYmQzemRyY2J6WktmM1MxQzYwVEZTZzR0QXZ0eXY5SFBsK28z?=
 =?utf-8?B?bk5ZeFZVY1lSTy92bFpybEY0Nk9ESWgvbW1UbHBkWUlwRFUzRlZEREQ4K2tl?=
 =?utf-8?B?NXppNjcyYzFJOEVzMFFCK05oVlpQemc2Sjl3SlhPdkw4VVlHa21nNnplN3c4?=
 =?utf-8?B?MFVNZDV1dGowR082VklJZFRPRXg5WjUrcUl5cHcxRDVXVTg2bURTdnFuemtX?=
 =?utf-8?B?RG5rRkM1enpOamtkNmhlaXhuelAzMTZndkxoc3ZiM1NJN3I3eUFLYzAxbHpO?=
 =?utf-8?B?M203SGxwMERFZ2VudG5qdE4zUjZFVXVJMWxMSm5SbTNEOG1vQ0hSZEs1VHI4?=
 =?utf-8?B?d014RkNxQWNMY3VYdy9yM0RpRGc4TGhEcldvTEI2S3BSY3JGbGYvMEZpN2xM?=
 =?utf-8?B?YkZyVlZRbW9MQWpPektoMnJOQkQyY3F4V29JUit4TzRYb0t6NXZPcEZKMlp5?=
 =?utf-8?B?a09zcFdNangwenpuTXZ4TW1uNjQ3c3NqM1hrQnRZVjJvb1VjZVV3dHBQTEhR?=
 =?utf-8?B?R3Z2TnZhdFhNV3VDSWlVTUc1SmhnRnRkeENpN0R6eUNsMlJmT2t0bzdCcUxH?=
 =?utf-8?B?eDhYN1JnTzJYYmRZeWJwcXpSUndSdnlmQWY0Ujd3RlM5dzBFbTRWSk9CU2pi?=
 =?utf-8?B?YlFjbitJZTRFbUhsZklxT1VMZlYvVytYOExHWXl4U09kQ0g0V0o0dm9vVzhq?=
 =?utf-8?B?NWFZVENNVStHdTVnT3pIczkyRW9acXhvdDRORXRkWHozOW82aDFLSGxTZDBo?=
 =?utf-8?B?T1pRaWJlaWxHanlUcG9kVTU3WnZFUXZnOTBpR0VsMlBDQm4vdWJJRWZKQ3ZD?=
 =?utf-8?B?M3FON2h2byt2OEZtaWRpbjVEWDBVcm1QWmJTOEYzUFlSYUJDQ0grSjZBMVRI?=
 =?utf-8?B?WC9oOS9lbXh5aUVQTGYxMUpua0c5a3l4Vm0vY3VJMjlwQVdzaTVyQ0tBdCsw?=
 =?utf-8?B?VHI4RVhUbUtRZmROSHZ1M3Jqd0lJTUNvcEJjUUJGZlpuNjlWRGEzakU5Z3RF?=
 =?utf-8?B?WUxkTXVIeWhlMTF4Zm1IaVhDeUNJUzRZQ09FSjJ5N2Z2R3JzNWRaKzZ3VmVk?=
 =?utf-8?B?YVZkTlpjN2JLc29tbW5ab1l4T2EyWGV2SXNnVnR2TXlqOUtjRGJWcVFVZjRt?=
 =?utf-8?B?OUloWkM5NVBCeldRdTR4c1VYUVpxZ2R5eW5CR0FQYW8rQXQ2djc3SmwyY3Nr?=
 =?utf-8?B?bjd5NkVDUTVvYjgreHZMRCtPcnZHSmFPRkpHbTVpSGRySWt3Ym5iT1l4NVpz?=
 =?utf-8?B?RWVQQTl0c1JYdElYamhqUHBXSVFnNm1hY0VTdk5oTS9oNHphaXBobU9jWGpN?=
 =?utf-8?B?WEVGR0VNRk95S3g3VlZlWlVRaFNndnBjQ2FieStHNWZwRmtHZmFOMXV0cjc3?=
 =?utf-8?B?L3pYOENFdm9wcWM2SUlhUEg3NUJXUVgxbmpyd2xYUjlqem5ISUc2Vnl6Z3FE?=
 =?utf-8?B?R2ZDS3hCNTdJU3JKSUU5VUxxQXFDbjRXNUJaVThHYVpqOWRyQTRFTjBGYURU?=
 =?utf-8?B?c0Vsc0g0U3IrRWI1WHBYOTJRbG8yemxhMUZSZmRRUlV3MHo5d3JmV0E4K0x6?=
 =?utf-8?Q?Mzf1REvQj0R9wB+pHXfRd5pJ7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fefabf80-677a-4f97-fba6-08db26041e00
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 09:52:12.9256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Jdy0m67xQPYTELXBOEzjEf3UE6MmQKi44bjYCWMTDVwN8p8ddBhtNP/3RcCq060zGgq+jYwh+x+8CsSSfCiIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7445

On 15.03.2023 18:21, Oleksii Kurochko wrote:
> The following changes were made:
> * Make GENERIC_BUG_FRAME mandatory for X86
> * Update asm/bug.h using generic implementation in <xen/bug.h>
> * Update do_invalid_op using generic do_bug_frame()
> * Define BUG_DEBUGGER_TRAP_FATAL to debugger_trap_fatal(X86_EXC_GP,regs)
> * type of eip variable was changed to 'const void *'
> * add '#include <xen/debugger.h>'
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes in V8:
>  * move <xen/debuger.h> from <asm/bug.h> to <common/bug.c> to fix compilation issue.
>    The following compilation issue occurs:
>      In file included from ./arch/x86/include/asm/smp.h:10,
>                  from ./include/xen/smp.h:4,
>                  from ./arch/x86/include/asm/processor.h:10,
>                  from ./arch/x86/include/asm/system.h:6,
>                  from ./arch/x86/include/asm/atomic.h:5,
>                  from ./include/xen/gdbstub.h:24,
>                  from ./arch/x86/include/asm/debugger.h:10,
>                  from ./include/xen/debugger.h:24,
>                  from ./arch/x86/include/asm/bug.h:7,
>                  from ./include/xen/bug.h:15,
>                  from ./include/xen/lib.h:27,
>                  from ./include/xen/perfc.h:6,
>                  from arch/x86/x86_64/asm-offsets.c:9:
>      ./include/xen/cpumask.h: In function 'cpumask_check':
>      ./include/xen/cpumask.h:84:9: error: implicit declaration of function 'ASSERT' [-Werror=implicit-function-declaration]
>                     84 |         ASSERT(cpu < nr_cpu_ids);

I'm going to post a patch to address this specific failure. But something
similar may then surface elsewhere.

>    It happens in case when CONFIG_CRASH_DEBUG is enabled

I have to admit that I don't see the connection to CRASH_DEBUG: It's the
asm/atomic.h inclusion that's problematic afaics, yet that (needlessly)
happens outside the respective #ifdef in xen/gdbstub.h.

If another instance of this header interaction issue would surface despite
my to-be-posted patch, I'd be okay with going this route for the moment.
But I think the real issue here is xen/lib.h including xen/bug.h. Instead
of that, some stuff that's presently in xen/lib.h should instead move to
xen/bug.h, and the inclusion there be dropped. Any parties actually using
stuff from xen/bug.h (xen/lib.h then won't anymore) should then include
that header themselves.

Jan

> and the reason for that is when
>    <xen/lib.h> is included in <x86_64/asm-offsets.c>:9 the "layout" of <xen/lib.h> would be
>    the following:
>      #include <xen/bug.h>:
>      #include <asm/bug.h>:
>      #include <xen/debugger.h>:
>          ....
>               cpumask.h:
>                      ....
>                     ASSERT(cpu < nr_cpu_ids);
> 	            return cpu;
>                      .... 
>      ....
>      #define ASSERT ...
>      ....
>    Thereby ASSERT is defined after it was used in <xen/cpumask.h>.


