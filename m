Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5092E6FF0
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 12:25:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59823.104892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuD7C-0002VT-Dr; Tue, 29 Dec 2020 11:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59823.104892; Tue, 29 Dec 2020 11:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuD7C-0002V4-Ap; Tue, 29 Dec 2020 11:24:34 +0000
Received: by outflank-mailman (input) for mailman id 59823;
 Tue, 29 Dec 2020 11:24:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuD7B-0002Uz-9F
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 11:24:33 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a649a423-5c19-48cf-8dfa-b52c5471ab22;
 Tue, 29 Dec 2020 11:24:32 +0000 (UTC)
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
X-Inumbo-ID: a649a423-5c19-48cf-8dfa-b52c5471ab22
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609241072;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=SR9VL7Jlz5rAE339U02WTYfwknZAQBSMAIHIZDplq44=;
  b=PBAwKGdN7rgA2zN/i7NkzUZQx6cN/DX9X1wvv0xeDCpBY942/rsUq/PC
   xeRbDY7vk1wIUAK8Vmgkzp27jew6ltjMdtF4xN/OtTDAabicR2sMs6Z0M
   FlRf+YjOr6LyZMFeoJ3BCegM89Lb/82zQCfCrp16CB7Isonztg5eUx17M
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2ut/vmsHbbZRnf8bnMXTxUfmXSgK+kZ74OoFWrklYeYWZc63It7/bFOH+8YW4voelzSjenQb7q
 hpMCZObSfCQ2FApMAZPv73J8cxVPUF3IgnwPbigKD0Y9R4R6UlP/UMaYZOVARqUt0M7pg1FRMP
 AFSK1SJMPENu8JnpC6H8yC4BYmnioiCX4sKQDthUXb3bhENDCi26jQPzKUTGiFKCquLTdqkm7o
 aoJfl2ksxUXIYVds/6GwwUM4KhuMBgsLXKuY7it25spS6FPvXP9lvmD1vsTwyCXjBaxDpAXxzs
 xYU=
X-SBRS: 5.2
X-MesageID: 34119322
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,457,1599537600"; 
   d="scan'208";a="34119322"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IL82TmXYftJ5A+aDPUE6XaXYmE1JMKCinZ1WvfwMjeawXFhsUtfUrW1BP781oV7Oat4iltnUoLFgBu7auqXBIo4EvDdDDJXthZoU5HMdtYREmNH1+Mly0NMTe90pNY40sHd4ey6AdbrZku5P1tGqMPZ5HuWhuX0ucaPzpkqUWGRbWymdQjw1tRc5JqTp7fp+RwEzhGIyh7asFv0UxmlB0g5u8m0ApylZ4+TdcGB/ASMmlQE7jcZRx8/Nk8h544/xtQxaJTHP82HhrtFLwISvQE723hoQIyUMQdmbilkfPASImGyjGZc0NEC9he9Hwqfq10TJQ/rzfPnktZqBSNKdkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdzG1yA1Ck/ufHwExhr4v1cwidMEQC3Xp9Yn3XSmBcQ=;
 b=J1T1BKY19FOJd6b/Vr8wdA5euZrb26KjfzFsSndQQGj1wpWX1Wn4V0olWrC5BQkUUY4y1ciOqbzqeiGh07G2gz8h5dJE34rrtpFmFFbwrYBKOX/MmwK4diUq2kJLtzwrVVzeTrTRm6t/op8+psnUTa4ssz8R2KaPeppajFlaXQxnHulIpyqMq5Qnph4WQg5D6Rvgsd8+NhO6wn4AONrjtv2eOzllzt8+GivBC1I5sWwEBls9Xd00YyHsLuDLZCrETYItCMvhHqECML15mopDNc1RYO8SSUQ1dbmk6Rl5IztD12/nMK//BXMk5BYuaRcKGWOofZ0F9EbJvLYg3rhJNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdzG1yA1Ck/ufHwExhr4v1cwidMEQC3Xp9Yn3XSmBcQ=;
 b=O8iWkV6Ml/0rYAXpKNeAiGLF7bLimmKcAADBLrTvWPZnjKW94YlFfcfQeRc1hTRbjWH6f40s056KVv8u4XZl+tiF0XCPu5hCwcCGA82ErzYIkTMIdsqZ+vDd4ZXwCjc0b1rneqnhtlkX+IyOIjN/yvlBw6nnowCzcsvVFmvr5Hs=
Date: Tue, 29 Dec 2020 12:24:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 04/24] Make xg_main.c  build on NetBSD
Message-ID: <20201229112423.xwp5n7euy3w7ejge@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-5-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201214163623.2127-5-bouyer@netbsd.org>
X-ClientProxiedBy: PR2P264CA0030.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 038212e8-0a30-4803-8bd5-08d8abec4dfc
X-MS-TrafficTypeDiagnostic: DM6PR03MB4761:
X-Microsoft-Antispam-PRVS: <DM6PR03MB476116E07315DEAA3DED0CE28FD80@DM6PR03MB4761.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S65+Kc1wXiuMxBb/NBfKxgPneq7bBEHZwCT20o+74VfkIJaugO1QJmif6XnrBRkAGrLCpHNAd+6wNdj6B+QU9/7B8J8H7ZKiRJnj4sAkSIeoXxoPa8ifA3JWtzX54NFUxkPBL20Sw2Z3s0EsTCHiRw/OSQYSD3hOMNeSOQ007kzTHzy5JLy00DO0Lgiq1BS4jPXqQSvEozw8uVGYprOtauqDL3iV76ByqXe+1VIBDtF47bQBqfW234kj2uIn8ACRQmfEfo+qi3RhPMwrvIdQgsvY2U5wO6+yIuXlqsEVbTgBBsl9iL9THMLvS9BL0qXx5iwtuXuPimk8apxo+SDMaE2VtYa6L8W4uwaGMq2rZTHSapGHstKtrKPK0ioVAltItjMrPr6vEPC1GOQ+W7gzeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(396003)(346002)(39860400002)(376002)(366004)(8676002)(5660300002)(478600001)(6496006)(66556008)(33716001)(8936002)(6916009)(316002)(2906002)(186003)(16526019)(4326008)(26005)(1076003)(956004)(6486002)(9686003)(66476007)(6666004)(86362001)(66946007)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QS81aHozS3dYQWU5YUxLaWdEQ251bTJlTENKb1VlRXJDemtLYk5lOXdhR1dH?=
 =?utf-8?B?U1NDa0ZuL1k4dW1GWEk1Vklpc3dSaE0wK0xBZEdQRTlJVXhDVDJKQ2V5WnJy?=
 =?utf-8?B?aGVOeXlRc2h3MXBMTWU5YXNZV0lqb3JrdWJROWhseTFTN05JZ1V0OXMwVE5z?=
 =?utf-8?B?QjhxRGhaNk9TWWVoQldtUW1icU9zZXpoZmN5MXJZbXpRQXdJa2Z6UDY5OXBC?=
 =?utf-8?B?ZW90bnM0S0l2eTZwYm94V2t5R3lIL1dvMFRkUzdBY3FmY2s2VjJ6NmZka0Nw?=
 =?utf-8?B?T1NhU0VWRkNkMlRickR0bHlBVUQyeEdXUUNUWGpPNXh5SExXWHVpdVAzSTAz?=
 =?utf-8?B?WnVlUlBCdjl1Z1NKYUdITVdDekQ5VU5HdWd3aGFuZk5nMWJaVEdPcW5HN3pw?=
 =?utf-8?B?OG81cG9Wd0N0TzVpMWNUYW5wTEJ5dkUzOE1zOExaQjJCS1VmK1ZpTS9vQzVE?=
 =?utf-8?B?Mzh6eVdNNWdHT0ZoVkNZZkJsUFF2WG96UzZXdWlEVXpYQXNjY2o2cGVoWXRC?=
 =?utf-8?B?M2ROaGRvVUh2cDIxa1AxQWM5ektwRkJRSHFTT2MvZThLY3kvRHNNWnVGbk5I?=
 =?utf-8?B?T1o4elZIc2M3T2VEeVM5Zy9TNmUyY09ldThZTGRHY2ZzaWJscnBMcGVJbURF?=
 =?utf-8?B?a0ZSWTVDcVRXYzM5cmtrbmw4YjdGOVUzSUNhSzZGb3owa0lkd1dHdHY3ZnZW?=
 =?utf-8?B?Z1gyL0FkMGJJQWt3ZUY5VHBhQ0RzZEdkWWRPZmVsNEFXRVRFanVaRXdUZlJY?=
 =?utf-8?B?dlVzUmRKN2RRZDltbmVSaTJRUHkvS0JrL1lKSWxGNTVMR3A2T3V4blhRcTRO?=
 =?utf-8?B?NWZSNVh2akNRVHZWaUNQNGo2L3h3dnZkU0Q5dHMwVVh6MHFzcnpPZlJEMGxF?=
 =?utf-8?B?bmJOZVJuVnhwSlRSZVFFeldJSWh2SU5IYlhxc1c5dEpXOGxiSmJVdG5rblhn?=
 =?utf-8?B?dWMyNDRmZyt4VVc0d2VJcmNIN3RQTzlpTlUwSkJUNnA5RzFGbkIrOW1kWkR6?=
 =?utf-8?B?NlM4cFRoZ1FLdVFXUXQyMXJURk11N2RVRldkWG1IdytocExLN0VBVXpMWmZC?=
 =?utf-8?B?Kzc3V2orUWs1bmZLWFdmM0JTaC9jcjNjYmt1NDd3NGJudGlNVWZ0NFFXUjJs?=
 =?utf-8?B?TTFtTzV0RFZUZE9SZHRnb2RsTVhSUVdEc0Vja2JEdng0QkNheUFGOFFhUlo2?=
 =?utf-8?B?MGdqb0VkZlAzaTBhY0I4ZGNjbGJUNU9GWGlXMTdDMEFiU3oxc0ExdVdCMXJp?=
 =?utf-8?B?MEdCTjh2Z1QzbThhaUN3Zm5wVnVtUUVnNndaN1RDOHl4c0hmck1CSnd6ZG5N?=
 =?utf-8?Q?Qw6ZKC1X9MrPTP/x7h0uE50qvKpnxXBebY?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 11:24:28.0444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 038212e8-0a30-4803-8bd5-08d8abec4dfc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0f0ZKx4d/XiFtvf8JJ4Ojl6InMPzE3e/R7FoyTDzhWDrCx3tFaWP5iz6djayaA+4KGP7f4a3cL3gNRm0S4/gEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4761
X-OriginatorOrg: citrix.com

On Mon, Dec 14, 2020 at 05:36:03PM +0100, Manuel Bouyer wrote:
> ---
>  tools/debugger/gdbsx/xg/xg_main.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tools/debugger/gdbsx/xg/xg_main.c b/tools/debugger/gdbsx/xg/xg_main.c
> index a4e8653168..fa2741ccf8 100644
> --- a/tools/debugger/gdbsx/xg/xg_main.c
> +++ b/tools/debugger/gdbsx/xg/xg_main.c
> @@ -49,7 +49,11 @@
>  #include "xg_public.h"
>  #include <xen/version.h>
>  #include <xen/domctl.h>
> +#ifdef __NetBSD__
> +#include <xen/xenio.h>
> +#else
>  #include <xen/sys/privcmd.h>
> +#endif
>  #include <xen/foreign/x86_32.h>
>  #include <xen/foreign/x86_64.h>
>  
> @@ -126,12 +130,19 @@ xg_init()
>      int flags, saved_errno;
>  
>      XGTRC("E\n");
> +#ifdef __NetBSD__
> +    if ((_dom0_fd=open("/kern/xen/privcmd", O_RDWR)) == -1) {
> +        perror("Failed to open /kern/xen/privcmd\n");
> +        return -1;
> +    }
> +#else
>      if ((_dom0_fd=open("/dev/xen/privcmd", O_RDWR)) == -1) {
>          if ((_dom0_fd=open("/proc/xen/privcmd", O_RDWR)) == -1) {
>              perror("Failed to open /dev/xen/privcmd or /proc/xen/privcmd\n");
>              return -1;
>          }
>      }
> +#endif

I don't think you need to ifdef here, instead just add to the existing
if, ie:

    if ((_dom0_fd=open("/dev/xen/privcmd", O_RDWR)) == -1 &&
        (_dom0_fd=open("/proc/xen/privcmd", O_RDWR)) == -1 &&
	(_dom0_fd=open("/kern/xen/privcmd", O_RDWR)) == -1) {
        perror("Failed to open /dev/xen/privcmd, /proc/xen/privcmd or /kern/xen/privcmd\n");
        return -1;
    }

Thanks, Roger.

