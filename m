Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F08733C6D53
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 11:25:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155225.286586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3EfX-00024w-UC; Tue, 13 Jul 2021 09:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155225.286586; Tue, 13 Jul 2021 09:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3EfX-000236-RA; Tue, 13 Jul 2021 09:25:35 +0000
Received: by outflank-mailman (input) for mailman id 155225;
 Tue, 13 Jul 2021 09:25:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRbA=MF=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m3EfW-000230-3K
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 09:25:34 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 456cde8d-e3bc-11eb-8732-12813bfff9fa;
 Tue, 13 Jul 2021 09:25:32 +0000 (UTC)
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
X-Inumbo-ID: 456cde8d-e3bc-11eb-8732-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626168332;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=09DN/OrsM8w5wnQf7uW0cDZONrjLuBbqw+jWFouPET8=;
  b=GFk7W+038hlfKJah6FGqaFp1eYm/rmdYRzHlUsvcwVBvRt4WXMXPRy3k
   nQoTEC1if8h0N5AJ4bPckzbIeayv/AsnKDTPqLGzzx39r3mg3qQdDunBe
   WSPkub4ANJ+ifiv2yi4GDJ3u7tgLLIy69L6bDFTFcJuwEsuf9B7pg1eUu
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HjiPkdvLwgT4D/3EbPRSu884Ndbq8I4lKdjz9FGA6SaVY1xcbT21iVZs+iYhTel4Wmq7IppyJA
 w322owHZ0jKP6fKPT5OKgOYvSQ0UgKHofckiRmPTEv5M0v759GcFlUx63I0La+I+6mgFvdLojr
 GTRBCm5O5gp9NaiYCnj0P49QLLaLrasCfKz4fxX4ZC74bBnlSNwdoc6Bax+YM2AHivY6i7/IAe
 Ck/6Lu5EAE7vr7+sdJ9NasLr+NlDToGSbYbiqVViR9plxavzpH9PqlsU7eicpXj5bUxOT/xRpY
 qdc=
X-SBRS: 5.1
X-MesageID: 48518959
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:75tH6KhdOY3GFXYJygvSyBsQjHBQXiAji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPE3I/OrrBEDuexzhHPJOj7X5Xo3SOTUO2lHYT72KhLGKq1Hd8kXFndK1vp
 0QEZSWZueQMbB75/yKnTVREbwbsaW6GHbDv5ag859vJzsaFZ2J921Ce2Gm+tUdfng8OXI+fq
 DsgPZvln6bVlk8SN+0PXUBV/irnaywqHq3CSR2fiLO8WO1/EuV1II=
X-IronPort-AV: E=Sophos;i="5.84,236,1620705600"; 
   d="scan'208";a="48518959"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YqQdmYMVefp7j/yxfKZMf7odEoHdix00krQpaElc20PyZJL/q1UXMspKh2BqeWbj0vium4aNqALkjmIrD1qjD3Ars+Bnt3sRsj7ZZq9eSgWhqa501SjQiiO4IsTQaqzkWpV+i5gh3DpK4HSjAtvFd9x334HyLH44A56TcRILfLd+IHTQgh6HwGrLuS1Uj7MKZfMU36jNYDLjG9O3mDczkh+cZkNDy7J4n7l4q906uUp4SahPVS1nv81QkrSTcE3Liy351+JDviaFSHZIA/omZxZHIcTxKFAGt7UwKetmIkF1pd+cAnuEN6k0DId57U21bJ/Dzh9q+yMrWKIU1mknUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3aLAE0wN+Xi8yK1UzQV53NnMyHm/VmnS2oCnmkikec=;
 b=NaOWN+htbq1zitfkcHbElyUw6hAJ6lzSGcimBCECPi36KU4pDBIpDeE7SDY4mmOo99rOJhrl9jssejUcH58pmYXXturBpNf+SC1ixscePgrA3a2vpIqoq+UYhaS6oSKKdG9yJKDWJnTMVwiXp5wC871dQ20XRMuEKLwsgqSqM5w1E85fNrKrn4yP2gZ5af4JM+0+7spdve2CbUHjlA2cJK2afK4k6DiO9Og1FeYVC+w7uwZueXFjEqBkDGpxwiwQhN810BwF2uU+V1gxOjeVCSp4FYbutqwkvAqEF5yNu5KJMtoQ7SSEPa0aIbL/Ukf8rLPnNF0wv3BSP1IFV6smAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3aLAE0wN+Xi8yK1UzQV53NnMyHm/VmnS2oCnmkikec=;
 b=mZJ+/J9CZuNIB89ufMFeifjRYShaW8LXMIZ9TOXC0XBUanttHV6JHtctvn+1ujHPei8afCuAIPBsnywFJRiHUYm2iXL4CDCW+kOk7QASYXetrEyun6ThAENOQ2N1FZZ0LDhmb2ssYuEoLMsT7VUK1H54q9K+2lIR3JwAj4cmzyA=
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20210713092019.7379-1-julien@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <10b44ae3-b366-7f4f-ab7b-b75c6e43ffdd@citrix.com>
Date: Tue, 13 Jul 2021 10:25:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210713092019.7379-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0446.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd49f801-a93d-4c1e-f025-08d945e0268c
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5439:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5439B0A12ED02D27811BB091BA149@SJ0PR03MB5439.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hE7xYMoXcZapHqIB7ScDhXeO5ryeaASDJ3c+83r8w9CuPuEI2DC/EgZISkFFivE6Hw6huLhmOkjEprPKR7TMpIwLlXe/RlSDAEBsAYo85m0A2GCVJUzT6AtlxLaQpiXb/GFUqWrLyGEubPKdd3bRxVURwpeCmR65tkB6ULc4L7Dxn/iNScX9vnmpYEwd5gttZeNglisyARSQ7msSB7WsroQSaYZ9Wcb7x5+8aDJpcMAc8Qu3AXPImEfHKA5dTKsO1UZ2T3YOu4oozWOxLHc81z4s+ZX/U4vkkCfsYtHqu+ZUiQjgmTTPD7/Vh5iRUc6CecewQYYYU924syuOD1sMonFBlwK3mD08bIBaVmFHS5brAKJbX0dxI1rW7XQ0yHkjZ1DVK+VAcVXjXHfhgGcf/CIqYBD65PF9Dh1Za6wiHiKJFJleE/0PC00PuysrPe+P2pzReEfE7Cv+bnOn48uLWrEDPHgSUrMEBiFbNtAoQo/S2Roj2HdXfu5EfXSI9TImE53QpcBJnq7kP+UGkuJjyohG2IkjdfKMvbCL+JemrzSvi5wg7s0QrISc7Z3fjd1XWQbKJB2P8gVvysR8BMEqr3ceIDTTiC0jFWphrMKjdfhbD1P4UxmneINd4tlhBJ5iuiI9qjRfU0+aawppjrYTWBMeKL/+of1BX9eXdJ0tilZ9Kwy53vaM43onqW9NbMkMn7KScOLwzJUWa9mCj5SS2DM40PrGGBIvHdNK9fTGQQSYHaww17LnFWUTOCFl8ZOp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39830400003)(53546011)(16576012)(8936002)(31686004)(38100700002)(186003)(26005)(31696002)(36756003)(2616005)(2906002)(956004)(54906003)(316002)(6666004)(6486002)(478600001)(66946007)(66556008)(5660300002)(8676002)(66476007)(4326008)(86362001)(98903001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0UvVUVMdlpYNUVlYjVtSzdaUEFlM29LUEY0NXZHcDMvblVFRWprUkRSRUhE?=
 =?utf-8?B?MTNyZ01hc3JacWxwYXFJb0hITXE4bVpaellFT2tUakgwWFFja3Vpb2pOb1Za?=
 =?utf-8?B?Y0pUZHF1SjVuZTg1VzB2cXpZT0JlbnZRckxmUTI2NnNla242ZndyVnZETnhx?=
 =?utf-8?B?VFBzVkQwZW10dUhMY3pSa0YzemVVWmo5WTJlenVtM3VRTldKOTlQVjhWV3hP?=
 =?utf-8?B?LzJEdWtIbVp5bUVVNmg3NFlJOHlVdllZalRsbUR5Z1VaQ1hhQ1E0aHFpTndx?=
 =?utf-8?B?MmJPWWNFWEtZdHpPSURINnhRQVVqRjlDcEFKQ0NYY290alFKVXFCUnFPMk85?=
 =?utf-8?B?T3JVOTk4WnI0VE02ZFRmWHk0Znp0V2o2UG42RnNGRXN2aVl6dVJmTkxOV29r?=
 =?utf-8?B?OGY1ajh1N1BjelptMGNjYkU2QUlBckJPajVjNGlXbEVmbmJCV0JaNTVMdFFs?=
 =?utf-8?B?K2RFcE1Sd3BZRkYyTXMwZ1ZWNm9xa3hkUnVSWjRkS0oyWEgzRnBaWVZwQWRX?=
 =?utf-8?B?WUJQbGtjTExLeU5nUEs4enk3SGFUdGN4SmRMbFVxV0pnQXlLL1VwUGk0aWJv?=
 =?utf-8?B?Lzk5MkswNG42OWpSK0c1QVI3Z282VFlYUXp6Q2dvTHNZaXJkQ1hlUyt6Vk94?=
 =?utf-8?B?WGhmbVl4R3U5SEsxcWFxdkpWMnBHcUxaTWw5c2pJVFpSTFVZUGF1MThaeEdt?=
 =?utf-8?B?VkpOMXM4ZGJWdWtYbjJ3ckErZ3ZtekRFUE9tcWJaV3NiWmRPdUNuUlhESEhM?=
 =?utf-8?B?SGJNNVdaaCtRT0lLaEtYa2IrSHZhSDBmb2RDWEV3MnZ1SUlpRmxhMS9PZ1ND?=
 =?utf-8?B?Uk1SenFQd3hUWnY2YUZvcHc4QnN0Wi9jeDVxWS9TbXBEelI1UVFpOHltWmkx?=
 =?utf-8?B?bFhSNHk1MzhDM21hUCt5QlN5RjdURTY5ZlUzTHkzc1R0OVJGTk5vN0Ruc2NP?=
 =?utf-8?B?T3V4SWwxYis5Z1VrMkJQbEI3THJtRzJYL3kxczhDQm9PNy9pTExib3Jwd25v?=
 =?utf-8?B?b1NKU1JsOENhRGYxVzlnUHRQMzRkMStlVW1ib3FWcThvM2RMeWwwV1ZFTTRl?=
 =?utf-8?B?Q1lrYWt4ckFsQ09HNGtPck8xaE5lMk8xQzJEeHJCUUpza1ZGZkF4d2dVUnM2?=
 =?utf-8?B?S2hEVXRwamR4NWlDdllyV1poeGgxNWJmM3h1RUF5ay9xaTlkLy9GNjd1VE5V?=
 =?utf-8?B?TkR6eEpLL2VKU2FvbkdBRUI4WjR5TFQvdUwxZFVraGhWMUxydWVpV21KZU1W?=
 =?utf-8?B?ZnNmVFlXMnpBQkQvZGhDME5Xb2ZLbkRFWEs2ZTlsN0VBVDVjNlBxTGhGQ3ZQ?=
 =?utf-8?B?UkMzMWpoVTVNUVV5c21xSXVlWnJIekRpdDRCZHU3TDkydkxzRStXT0FoZjJ2?=
 =?utf-8?B?OTI5ZmQ2VjNnWk9FZ2laQWRMUW8zbExTMVc5dUtjTWYvMmpVYWlhYmNKMWhs?=
 =?utf-8?B?VEZCZnRRVXgwRkx6Rzczdmx2UFhDSzdyd3J3ZkxlVmVXN096c210OXZoeEJh?=
 =?utf-8?B?OWRMQmhtMENBbFJsanFUN3ozNWZBN3hwVUNXNjlocnZmdlVIUHJ2ekZtRjdt?=
 =?utf-8?B?UmdXWmxOTi9EVytTb3VoblhpV2JYMEpNWlRmRVdzVktVQWlGRHN1NFhBTlJm?=
 =?utf-8?B?dmpPZWZ2TlBocDhFWlovVm5nS0pnZjNsb2VDYXQrUU9rUDBDRzFXM2V2aVVB?=
 =?utf-8?B?bDlZcENRRUY5d0tYYzdYQUQ1amJzWjFOVXc3TUtlN2lCcXZZOWIrcUFxZDBK?=
 =?utf-8?Q?5L3rCzRoennwxFuws/BqNP28/1p89s+IFzlapc7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd49f801-a93d-4c1e-f025-08d945e0268c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 09:25:27.2806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcHTZMTpoCU80dzaCuKhX90GWmek139q25mk+KmgM4G0EcRC49o28iATSED2J0yRhJqd301Lhhdpq883OGaUniF4lV7a0H8V1nXw8XX0IWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5439
X-OriginatorOrg: citrix.com

On 13/07/2021 10:20, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>
> Commit 0dbb4be739c5 add the inclusion of xenctrl.h from private.h and
> wreck the build in an interesting way:
>
> In file included from xen/stubdom/include/xen/domctl.h:39:0,
>                  from xen/tools/include/xenctrl.h:36,
>                  from private.h:4,
>                  from minios.c:29:
> xen/include/public/memory.h:407:5: error: expected specifier-qualifier-list before ‘XEN_GUEST_HANDLE_64’
>      XEN_GUEST_HANDLE_64(const_uint8) buffer;
>      ^~~~~~~~~~~~~~~~~~~
>
> This is happening because xenctrl.h defines __XEN_TOOLS__ and therefore
> the public headers will start to expose the non-stable ABI. However,
> xen.h has already been included by a mini-OS header before hand. So
> there is a mismatch in the way the headers are included.
>
> For now solve it in a very simple (and gross) way by including
> xenctrl.h before the mini-os headers.
>
> Fixes: 0dbb4be739c5 ("tools/libs/foreignmemory: Fix PAGE_SIZE redefinition error")
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>
> ---
>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>
> I couldn't find a better way with would not result to revert the patch
> (and break build on some system) or involve a longer rework of the
> headers.
> ---
>  tools/libs/foreignmemory/minios.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/tools/libs/foreignmemory/minios.c b/tools/libs/foreignmemory/minios.c
> index c5453736d598..d7b3f0e1c823 100644
> --- a/tools/libs/foreignmemory/minios.c
> +++ b/tools/libs/foreignmemory/minios.c
> @@ -17,6 +17,14 @@
>   * Copyright 2007-2008 Samuel Thibault <samuel.thibault@eu.citrix.com>.
>   */
>  
> +/*
> + * xenctlr.h

xenctrl.h

Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

>  currently defines __XEN_TOOLS__ which affects what is
> + * exposed by Xen headers. As the define needs to be set consistently,
> + * we want to include xenctrl.h before the mini-os headers (they include
> + * public headers).
> + */
> +#include <xenctrl.h>
> +
>  #include <mini-os/types.h>
>  #include <mini-os/os.h>
>  #include <mini-os/mm.h>


