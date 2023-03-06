Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC656ABC05
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 11:25:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506869.780067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ80r-0002CX-4k; Mon, 06 Mar 2023 10:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506869.780067; Mon, 06 Mar 2023 10:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ80r-0002AV-1z; Mon, 06 Mar 2023 10:24:13 +0000
Received: by outflank-mailman (input) for mailman id 506869;
 Mon, 06 Mar 2023 10:24:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MPo4=66=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZ80q-0002AP-4C
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 10:24:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0894d490-bc09-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 11:24:10 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB9926.eurprd04.prod.outlook.com (2603:10a6:150:11a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 10:24:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 10:24:08 +0000
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
X-Inumbo-ID: 0894d490-bc09-11ed-96b4-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5hBwIspF7kPjuNS5C7jXTA7weGsPXbbR/L1LmsRINJgVvTo2PZuUC+ReFF7ia6JSCAhVlIelLT6aBn9rARFv5c8n+dKyg74wNoV/lx9fLgYCtbhKWgYnS7VcNkKlmQ2imzRGSAThH1UqSJ5q68+q2CWw/IEAlojV7kqAsisrFRs6gykzwrh+L3VP+ZjfZZJof/yW5h8mNAmT/iWO5rhZ8CFrLFLP0jJbBzb03YnQ0dv7PZUHISPl+f9zFgw7W7djzeUsfx0Eq6mM691atDLWnsXbQrdGIrNmYAO5dzW5bOvfqwf9pwanTGTG1lU1zfElzirkmqvVSrM2Z/sB3i3gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDEGJHWyC+bGu8uuJfXWYHJqDhbmGcnfdXH1AiEeTOU=;
 b=dgSnew5Pcf8xhNvNM0CBoz0CaWVW00ohR2CTvxnn6+4RAenMRw8SWImNmzMShTyFTu39t7pDLdywGbM1ijJri4EURQ3oNnGHYGUOGpZ9Dp2K1eODlNRuTeUrORuFBbSCpx554x5vGO6VxEbE1IOJF/FhBWMUvHjZubc6ck0euWASOrE29UizQrfoQ+npxp+XUa9OViUqjXSYu5fwoTedEnarDNj25fhYeYJ0zn9DRdJwW0S9j2f0Bb70uOOizM+7TK6SORicVtVIMvZ0GKdMRPBqv0qFwtQ8NHUGesNmV1znqjoKTE1f+ht/y9G3Y/GiilmvtncVFLkmEEKsFeUzlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDEGJHWyC+bGu8uuJfXWYHJqDhbmGcnfdXH1AiEeTOU=;
 b=JlJRMHXRGfC2RHNa4RxlxCt3M1tVp8S9pxPjT33vWreSDmRZVtruKobvAWzF6KgRiUijz997ibMiXQ81Z9+s/BvRwSv08EHSe6u3AWYZo/dzKxhfELke8t+DkIqJOmca4A6M/hRWmQrtX7XYIhZZM3Xx9Im0zugDWmQ419CR1ONUmZtZsErv/YmIC+7TBqsX6nUwUCtMz1yzOSWIDnmiZ5mOZLWWNNSASPLdjVrsrH9IuzaHrFzSIGW2lwgQGsx0RVxGNkO1fEOXk8kd190p9WeSVN0WwwquVdOqgT+jX/R1W5mKdDI6rAydhglK3m/gcBKGsY6Rj99a39uY0Hv+3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5c7e4584-9c99-1ecd-e231-438b89c11805@suse.com>
Date: Mon, 6 Mar 2023 11:24:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 2/4] xen: change <asm/bug.h> to <xen/bug.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1677839409.git.oleksii.kurochko@gmail.com>
 <f108147036c9e35b156b45c0f52779cea09025c9.1677839409.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f108147036c9e35b156b45c0f52779cea09025c9.1677839409.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB9926:EE_
X-MS-Office365-Filtering-Correlation-Id: 67cfe73a-98a3-4a36-50c5-08db1e2ceb82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	imoDTBoopZ34S9l9bnrTZZHh7uVpil93U/xuxouWaktMtckLeO+z4LmNse7KaUUfF/QumJ0yeYHas1y5pkGn63HiT//+ZKenkecWz9toziNLtnvMLPXMcnYtKy5kOmGrAiVaiLQyKTnHMJfTSsYgqnOSB500Lc7A1uevsi8iOTHBedyA0ZTufUJc8cFZrHPV5h97Fs2RZeOjSHWpzECNc9GcjKQKrm5xeof0UT6BVbcpVzECQ+3yVUy1H84HIsBnakpWAAhDJhtkr/8CypYX1rR3e3V1RJ9yzL9Liy6DN33YYiJ++bLXaS5LTCKikrh9n4ga+WagGO0YbWZVJT2rDs0PhBvLrblO5Ytwjc+V55KkAZDNsIKk58IZs4zFMZqcAUOPfbEga9otpaGR5W1m1MSe9bUGcAt9RgCL8S5l2xxsADF1MfYo1th5OW3HUEZo3g8r+IpqdkR1leJDAojGbQ9l7gimJT2cc2iBJgSNVLlUONhWYmzHrw+a9Famnox8fJc2o2pnY/REWpIFV0RWmrWWjsncFD4e8fM16q9PBbRBs/lI2wtYoeoYOoaXIVwhcfEXV6jWPpViy2RbRtDhoBm/EMt3MtxIk7CQsWHrJ2gDYmR2RTXlNUR/RAdyQkDgD3CnYJ+OQZJDDvA2D88WUUXrQd8KKFN1ivAxY38CKT0v8GLznC09kkfVzOYhvQzH9uwwu9lV+VZTXLODDz7ea4/KEG5gza9fcklo8X3BRgg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199018)(31686004)(66899018)(83380400001)(36756003)(478600001)(54906003)(316002)(38100700002)(2616005)(6486002)(6506007)(6512007)(53546011)(186003)(26005)(41300700001)(5660300002)(7416002)(66476007)(66556008)(66946007)(8936002)(8676002)(6916009)(86362001)(4326008)(31696002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGcvWWZsZmxkejZ4QTQ5TzdXaGRteXk2djBxMXNRdnZDQ0hucVc5STMrNE01?=
 =?utf-8?B?ZnVhZEhOMi9HZk5GaTdBSGIxMlAzVnZRMUhaTVNwUzNPcU50bWNFbjdvRjk5?=
 =?utf-8?B?cVNOWDFraUpLWTVKckhzOUlJUWdUK1o2c2I0Z29GQ2xHVWhFNU5hUmpWaS9m?=
 =?utf-8?B?UFlQK2tTQWZXaU84TzY0V3hNOXRnWGpSQTdSbzB0TzlrN1UxWi82cVdNK294?=
 =?utf-8?B?WEpRWnhtSGxMeEpHN0RhNkNqMHgzZ1EwSkpZMEpuT2tiRURIWkxNaHVuaEhp?=
 =?utf-8?B?YjhGZisxY3dUaHRHS3RlaUtBVDJWWlN3WUlNUjNiZVdCR3FNNkd6SDN2c2Uw?=
 =?utf-8?B?QnkzSmdpWktPT0F3NTFad0VwWllhWEh6NTdDclFKU3oxbUtJMUxoaGtDNXA3?=
 =?utf-8?B?ZkEwTEZQeU5BMExlK21HMnlwdndvdE9ZM2xpQnpQWGxJNGpheEdLUmtqeG8z?=
 =?utf-8?B?WHJhMWtvQ0ZERk9tSU1taXg3UUlZNDBBNytlZXNSWVduODVIeS8ySmxsSW0v?=
 =?utf-8?B?bG93bjJ0UFlSZG9UZlZmV29lTjhoYzZUakZyTHYxeUxFSTZDVURBOWFFYWpi?=
 =?utf-8?B?TjkrM1NLODFCWVQ0anBIQjluOExUS0VHSVl0aWhwVTB6bUhVQ3FGOTM4emFB?=
 =?utf-8?B?Q0FRSEdJMzg4WWZvYzMzcmt4cnZVZ0ZYYVhJUk91dlpXUWpBcjczM2Vwb3Ra?=
 =?utf-8?B?a1A5bHEzL2ZSUnZob21rb3ZCSGl0UEZtcHpkUi9MQk56M0dIOGVSNlNRSTIv?=
 =?utf-8?B?YjdGMDNOTTJGb1d6NUVVRzcyQUEvSDA3SGQ3ZjlzRXIyZzFOelF4ajFZZmpM?=
 =?utf-8?B?VUUySWVuN3BwUkVTRmNRWkNOZE9mQ3VrUXhSbTg0bENDQ0hkY3pHdXhUSlFZ?=
 =?utf-8?B?cGpTeGoxelpmYjRqUTRGZU9xRFJEMXVwWkNzYk52YUR2Mkg2bm56TllhY1VJ?=
 =?utf-8?B?R28vRjU0azRpaHpHZUJKZEtSMmtVTjdGWGRZd002bFJBcXV2TGlRL29qVmpx?=
 =?utf-8?B?dTlRZWVxaU9QTjgzaE5DUzZXbkRVT0tRcVN1bkc3cVFwa1ZXaUsrNnBIdUp2?=
 =?utf-8?B?bGNPckJnRFl2RXJ5YXd5citwWnFrVldoeHBRS0xYNHdlYmowbWxtWGhiYWRh?=
 =?utf-8?B?aVNTWTJweE8xVjRGWG5kcFdsWW5veUJwd0lqcnZRbDNocEMwcDcrQnFubjUr?=
 =?utf-8?B?K3pqVWV6Mm8xclRleFFQaFQvcHRMUnFpNkZsMW5rSVFMZE5vbE9BdFUwb1FU?=
 =?utf-8?B?aUQ0WmZ0SWR1R250U0NkUFBaWTlTV1k5cWpZbEp6UDY5UktWeXV5OXo3NDd3?=
 =?utf-8?B?REVBR05iR2FaSVZNdzdKeHN3cHhvbDNXd2dHS055dUV4Y2NnQTZMcDVKQUdh?=
 =?utf-8?B?TXdzTGhnZTAyZklMSmx0clFNUXpsN0JzK1Z0MHlKZHNxbEgzNWhYVGVwL1VN?=
 =?utf-8?B?ckpjajI1Y21GMlkzT0hPZGp5SUsvVVlVbUEzdURHR2hEZGtlV0RXUDMyUGhQ?=
 =?utf-8?B?RGxEeGp4UTVmWDFFTmF5a0c2SnQyUDgrQk1LTitmWm9iNDBmZldqVURHTjE1?=
 =?utf-8?B?aFBRUnlNSmM1TjlQL1JPaDZXRW1kTW1jekVZaGM3VGtwOVlHMUNucHZZK3d5?=
 =?utf-8?B?WEhwTGJ4YW1rVFYyaEVNa2ovbzB1THplRTJoNE03bloxL3VQTUEzd1RDaEV5?=
 =?utf-8?B?cm51eTB1MHVkaGNCeXVUcFR6akhHVmdNZ2JSNnRvNjFDazM2QVh0Zm1yTTBu?=
 =?utf-8?B?WkFuOHVZWGErVkh4UFNvQUNCcWZiYlpya3JWOHBiaG9yNU5FS0QycXNXd0tF?=
 =?utf-8?B?YUVkU3Y3Q29ud2hCQ0svTkkybzgrV0VjR0x1amtqMmw2N1ErWTVVWmlINDlO?=
 =?utf-8?B?c1JpSlhzOUUxd1I2Ui9PRmlzMm1LanlUVko4TCtCL29pby9mZWVSWklVOXN4?=
 =?utf-8?B?b0pCWW9qdytVUDJ2Qkt5NGtMaG5NbmlrZnZGdGdSWmkzYkMxTlJrWkNhVTBw?=
 =?utf-8?B?VUZib0VvRStReUpxancxUHlwK050YXRxYTVGTWZCV3FZZnladm9HeDBvc3dt?=
 =?utf-8?B?YWY0UFRWYlkzSEJ5TTRRN3Q5cWJQeXJJVldXQVY3ZUtDODhyZEE4andmNXNP?=
 =?utf-8?Q?w0bV+aJP4+KXKBGestZiZNKIs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cfe73a-98a3-4a36-50c5-08db1e2ceb82
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 10:24:08.3512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQdv65FxamqclkLymnRcv6+1hSBIHnxzoZFU+EN5HRIo3wZh/Sa246GEjHjK5FQKb416LDZrYezpaOguOlJrpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9926

On 03.03.2023 11:38, Oleksii Kurochko wrote:
> The idea of the patch is to change all <asm/bug.h> to <xen/bug.h> and
> keep Xen compilable with adding only minimal amount of changes:
> 1. It was added "#include <xen/types.h>" to ARM's "<asm/bug.h>" as it
>   uses uint_{16,32}t in 'struct bug_frame'.
> 2. It was added '#define BUG_FRAME_STRUCT' which means that ARM hasn't
>   been switched to generic implementation yet.
> 3. It was added '#define BUG_FRAME_STRUCT' which means that x86 hasn't
>   been switched to generic implementation yet.
> 4. BUGFRAME_* and _start_bug_frame[], _stop_bug_frame_*[] were removed
>   for ARM & x86 to deal with compilation errors such as:
>       redundant redeclaration of ...
> 
> In the following two patches x86 and ARM archictectures will be
> switched fully:
> * xen/arm: switch ARM to use generic implementation of bug.h
> * xen/x86: switch x86 to use generic implemetation of bug.h
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V5:
>  - Nothing changed
> ---
> Changes in V4:
> 	- defines BUG_DISP_WIDTH, BUG_LINE_LO_WIDTH, BUG_LINE_HI_WIDTH were moved into
> 	  "ifndef BUG_FRAME_STRUCT" in <xen/bug.h> as they are specific for 'struct bug_frame' and so should
> 	  co-exist together. So the defines were back to <asm/bug.h> until BUG_FRAME_STRUCT will be defined in
> 	  <asm/bug.h>.
> 	- Update the comment message.
> ---
> Changes in V3:
>  * Update patch 2 not to break compilation: move some parts from patches 3 and 4
>    to patch 2:
>    * move some generic parts from <asm/bug.h> to <xen/bug.h>
>    * add define BUG_FRAME_STRUCT in ARM's <asm/bug.h>
> ---
> Changes in V2:
>  * Put [PATCH v1 4/4] xen: change <asm/bug.h> to <xen/bug.h> as second patch,
>    update the patch to change all <asm/bug.h> to <xen/bug.h> among the whole project
>    to not break build.
>  * Update the commit message.
> ---
>  xen/arch/arm/include/asm/bug.h       | 17 ++++-------------
>  xen/arch/arm/include/asm/div64.h     |  2 +-
>  xen/arch/arm/vgic/vgic-v2.c          |  2 +-
>  xen/arch/arm/vgic/vgic.c             |  2 +-
>  xen/arch/x86/acpi/cpufreq/cpufreq.c  |  2 +-
>  xen/arch/x86/include/asm/asm_defns.h |  2 +-
>  xen/arch/x86/include/asm/bug.h       | 15 ++-------------
>  xen/drivers/cpufreq/cpufreq.c        |  2 +-
>  xen/include/xen/lib.h                |  2 +-
>  9 files changed, 13 insertions(+), 33 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/bug.h b/xen/arch/arm/include/asm/bug.h
> index f4088d0913..9315662c6e 100644
> --- a/xen/arch/arm/include/asm/bug.h
> +++ b/xen/arch/arm/include/asm/bug.h
> @@ -1,6 +1,8 @@
>  #ifndef __ARM_BUG_H__
>  #define __ARM_BUG_H__
>  
> +#include <xen/types.h>
> +
>  #if defined(CONFIG_ARM_32)
>  # include <asm/arm32/bug.h>
>  #elif defined(CONFIG_ARM_64)
> @@ -13,6 +15,8 @@
>  #define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
>  #define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
>  
> +#define BUG_FRAME_STRUCT
> +
>  struct bug_frame {
>      signed int loc_disp;    /* Relative address to the bug address */
>      signed int file_disp;   /* Relative address to the filename */
> @@ -26,13 +30,6 @@ struct bug_frame {
>  #define bug_line(b) ((b)->line)
>  #define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
>  
> -#define BUGFRAME_run_fn 0
> -#define BUGFRAME_warn   1
> -#define BUGFRAME_bug    2
> -#define BUGFRAME_assert 3
> -
> -#define BUGFRAME_NR     4
> -
>  /* Many versions of GCC doesn't support the asm %c parameter which would
>   * be preferable to this unpleasantness. We use mergeable string
>   * sections to avoid multiple copies of the string appearing in the
> @@ -89,12 +86,6 @@ struct bug_frame {
>      unreachable();                                              \
>  } while (0)
>  
> -extern const struct bug_frame __start_bug_frames[],
> -                              __stop_bug_frames_0[],
> -                              __stop_bug_frames_1[],
> -                              __stop_bug_frames_2[],
> -                              __stop_bug_frames_3[];
> -
>  #endif /* __ARM_BUG_H__ */
>  /*
>   * Local variables:
> diff --git a/xen/arch/arm/include/asm/div64.h b/xen/arch/arm/include/asm/div64.h
> index 1cd58bc51a..fc667a80f9 100644
> --- a/xen/arch/arm/include/asm/div64.h
> +++ b/xen/arch/arm/include/asm/div64.h
> @@ -74,7 +74,7 @@
>  
>  #elif __GNUC__ >= 4
>  
> -#include <asm/bug.h>
> +#include <xen/bug.h>
>  
>  /*
>   * If the divisor happens to be constant, we determine the appropriate
> diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
> index 1a99d3a8b4..c90e88fddb 100644
> --- a/xen/arch/arm/vgic/vgic-v2.c
> +++ b/xen/arch/arm/vgic/vgic-v2.c
> @@ -16,8 +16,8 @@
>   */
>  
>  #include <asm/new_vgic.h>
> -#include <asm/bug.h>
>  #include <asm/gic.h>
> +#include <xen/bug.h>
>  #include <xen/sched.h>
>  #include <xen/sizes.h>
>  
> diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
> index f0f2ea5021..b9463a5f27 100644
> --- a/xen/arch/arm/vgic/vgic.c
> +++ b/xen/arch/arm/vgic/vgic.c
> @@ -15,9 +15,9 @@
>   * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <xen/bug.h>
>  #include <xen/list_sort.h>
>  #include <xen/sched.h>
> -#include <asm/bug.h>
>  #include <asm/event.h>
>  #include <asm/new_vgic.h>
>  
> diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> index c27cbb2304..18ff2a443b 100644
> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> @@ -27,6 +27,7 @@
>   * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   */
>  
> +#include <xen/bug.h>
>  #include <xen/types.h>
>  #include <xen/errno.h>
>  #include <xen/delay.h>
> @@ -35,7 +36,6 @@
>  #include <xen/sched.h>
>  #include <xen/timer.h>
>  #include <xen/xmalloc.h>
> -#include <asm/bug.h>
>  #include <asm/msr.h>
>  #include <asm/io.h>
>  #include <asm/processor.h>
> diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
> index d9431180cf..a8526cf36c 100644
> --- a/xen/arch/x86/include/asm/asm_defns.h
> +++ b/xen/arch/x86/include/asm/asm_defns.h
> @@ -6,7 +6,7 @@
>  /* NB. Auto-generated from arch/.../asm-offsets.c */
>  #include <asm/asm-offsets.h>
>  #endif
> -#include <asm/bug.h>
> +#include <xen/bug.h>
>  #include <asm/x86-defns.h>
>  #include <xen/stringify.h>
>  #include <asm/cpufeature.h>

While there's an unhelpful mix of asm/ and xen/ here already, may I ask
that you try to avoid making things yet worse: Unless there's a reason
not to, please move the added line past asm/x86-defns.h, adjacent to
xen/stringify.h. Then non-Arm parts
Acked-by: Jan Beulich <jbeulich@suse.com>
(assuming of course no further large rework is necessary because of the
comments on patch 1).

Jan

