Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8171530A50A
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 11:11:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79717.145115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6WAc-0002k6-Qa; Mon, 01 Feb 2021 10:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79717.145115; Mon, 01 Feb 2021 10:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6WAc-0002jh-Mf; Mon, 01 Feb 2021 10:10:58 +0000
Received: by outflank-mailman (input) for mailman id 79717;
 Mon, 01 Feb 2021 10:10:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dub/=HD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l6WAa-0002jc-Sq
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 10:10:57 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b849ccb-ab6b-43b6-82c5-e4a0f9663e49;
 Mon, 01 Feb 2021 10:10:55 +0000 (UTC)
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
X-Inumbo-ID: 6b849ccb-ab6b-43b6-82c5-e4a0f9663e49
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612174255;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yj2sEYPvzVQBPl6Fnbb6nFc23k1yNLT3EzsJzTZjjx8=;
  b=FLWcN8OKPUINGRUHJmqq5V/YQYnnzGNFKQx3V7EsCZIynm2qFMr+MhIO
   t63/s5CB07VkueszFYvIGuM13LLzioz4fb78K6YAcPrfVUved0gdyJWM7
   zaA1jlGKd068PXkcl5YVn3nbErKAyVJam3NDwT8mgHgjhour0IhX9nMJ5
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JJCuRkNt4A/rU8Cg1p/SI4mV6x4sFaMdK947eqpH8n6kdlvwVoMtEbdXNXNiQzlMLwqy6km+4m
 EqUAVALOUbf3DBL8bCzHV9XriVDUi/RuBb3DWDfMWP5UnVVQwVECgQyX77GdJ2DyLxOK7rGWVn
 StY/ClLQ8IbvVyTEhDZEyb1hfKi6smPV0omEHL3wGDvx9ANO/hpahwn44xkKWHYErG1tmqucls
 uYA+zu4tJEK+PUUw7bR1y5wy5hF9HOIZ82rSk5MWq4jaBl7XqvRB8EXo9kQ5tQ8thmuZoeSAD1
 I8k=
X-SBRS: 5.2
X-MesageID: 36219869
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="36219869"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a94U5K4YReINhRN2Ptp87Rb8M7egulyNa4NQWEslW35/fNzpsA/IXEo4GAjTXVIQjiEWL4xyuAVk5NkABpMwJ3xhBc/bP867ayTXMJ7sxJ2ErhCRQSHuvsHPUlS5c/cYyEmO9oD2ck+sCGR5Z6Z84MBLmdAbR+XCSDX2mEYnlqgGo6uLnRwxzNSaFIIWwCufIzudQmT6iF4HwOtla33tKgmvJ9WK3puIn9DGMVhdmEUBRj63PpDlfBZ1O6REho7SPrQ46u8F2EO7lFC/N8A89cdNhyglDNdKrfBP+dQtvH7OrZ5WbHx0CnAyuK/p0FqojLyzVIUPvMNsBYis8RIC4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Baac9PWgRUHt29mtlrO9nxhPMmzp5MwDuBZNMIfS70=;
 b=SHBNpJsRtztOUc+qU3Kva4qDKCtVpLSGrF7sEXfF0xXlBv1EPZY5Ye5rrjbtUZM1b0mPc1amiBPbeQhQcOy4do2wO1DfRqMvmmiDfmfPj7Fu5B6AV5ekK3nRHSdSvcqr6/seyaYz2C4NiE7HCzAwheDiHauA9fH53LY9Nv+A+Acordj6BcQ1Vx2kO/XT6nJ6CNDVuYQlptmXlG7zTdD1ES+M+IMbbMaN5b129rNqHuYhujh7fFfRLtsIZVo1488PmDw8FU8WZc8NnPzAbC/5QwsYSjRDEEamVUJZYXTHk+HjdISsEbazqye4PKqa6cZqfrr7OFwmMD+gkYSXrsuYnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Baac9PWgRUHt29mtlrO9nxhPMmzp5MwDuBZNMIfS70=;
 b=Kt8esl6Qvmqsmq6w0p1lITWQ3c5j1tCJIjtHsF7xPFaiV5AgHLeoYh0OPVscCJ+bRQWX14FTpmJYVYjDSTqpoYnxt8gPsy2aY8evYystveKAlRk1YhGNF6QhyWbOyBu1KsIJfout9mKCRz5zxWJHqNUTjMuqtfVotOCzCehpg3k=
Date: Mon, 1 Feb 2021 11:10:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>, Hubert
 Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v8 06/16] xen/memory: Fix mapping grant tables with
 XENMEM_acquire_resource
Message-ID: <YBfTpTzi+wo7AFSH@Air-de-Roger>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
 <20210130025852.12430-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210130025852.12430-7-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR2P264CA0064.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81ab56f7-140a-44db-4d58-08d8c699a715
X-MS-TrafficTypeDiagnostic: DM5PR03MB3066:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3066B6199DF1E55A95A2AAF18FB69@DM5PR03MB3066.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bdi7Vs3t2akzwj0TZleJZVvN4uE7iBOiPeKZYPSNBYE62A5j8KyiuljbRgKuarBpsXkWZkey2p4k/kZ54xSMmPd1pKGDVUQXxyXakb15xOX/69yH85eSGi3S2cKo9JT/SL7VxKJ8xhsH4UowoYH4Q2eoD7ahCOwp+Pxo8vAN8fJcDFd8OBOtt4F6h+iKZE5Kur6luSXEIROCJ3pPLovG+jify+Ov1e6hZSYiRVgRqTE43jy8OOtOtAHvEO1pw6ZhhLlGyMAdTmtXtqDVpB7H58N+gGZzsn6l+GYigG25fdxArNx2YJ8W7pUUL9eEWOYHC7AOmqMFwsZ37o51FdmoSkrzIhJFhAbLc1Paygh7BIwNcJL5PGRyxWQwpNXVJXrLRqYyWQihl4/DrlI5CACND7vMJCxJ1TdSw7vN+QJ1PtMq9KrYufIKIQHQA2Lo+PwjTTW+c0b3tgXTdi9tlC/Sx2jdlGMpPBPOPMvFMfZ2sTi4n3PKPHH7IznPAFZWpWWT+3P6QFp+dyLVpHnQa++5IiW4AsWWKzOkTdlQY6pGIVO908dSYi8ocktw75UK0RRg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(316002)(66476007)(7416002)(956004)(9686003)(66556008)(186003)(16526019)(26005)(6496006)(66946007)(8936002)(33716001)(478600001)(85182001)(8676002)(2906002)(83380400001)(66574015)(4326008)(6862004)(5660300002)(6486002)(6636002)(54906003)(86362001)(6666004)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ckgzdUFzNUl2YVpxR1hDdDBRSUxTYmRoZ3dFWFBKSEk4b05JeHFEblpKcXlH?=
 =?utf-8?B?WXJUTWovV1g1Z0tWSU1MVTB6bVd1Q0ZhVE5jOVVSQXMweDl2UW16VlZsVFNW?=
 =?utf-8?B?dlYyYWorR0F2SG0wVHNQTmxVT3V0WGJPelRJTE4vZ0t4V1cxOFdPUVo2N3pB?=
 =?utf-8?B?c21XSnZ6UFlTS1JqNkwrR3EvcTRpY1dVVWVMTkgwS2JJd2hEYytLa2dwVDBK?=
 =?utf-8?B?WVZyYzdrVlRrMTVJOU5MQ0JIQ3JCaG5TUXM4WkRUMGo2Z0Rwd0FIUE9yQTRa?=
 =?utf-8?B?eFg0d1ZQbHQxczdpbjhGK3JnRmNGNGkxVklYeFFhSXhqa1JUK0lPTmxNbFFS?=
 =?utf-8?B?NGppZjVWWXY2S0VraG5KRXFnZ1pkOXBMRzNaUHpYTC9xdFp0ajJML0Nhc3FY?=
 =?utf-8?B?bmxMZmc1d0JqM3lqMDFjdWFxaGVSZExoeVVacFUvWjdHWnVjNExQaWFMajNU?=
 =?utf-8?B?V0FjSWZ4KzkrLzI0Z2Z1UGpwTko3VHFWSmJ1R29KaTZnUmFNZDJ5ZUJma3lq?=
 =?utf-8?B?UmU1NVZxK2d1dUdUeDdMRjlsZ3ZTYkZScHd6ME9mZkZuOVRud1N5NHd1UjBS?=
 =?utf-8?B?Wm1oREpyY2lCRWo5bVdIMVcyVXNNazd3M2J0Z0Z4TC9zODliczhrWVJSQ01l?=
 =?utf-8?B?V2NQWjJWSDF3a2IzVUxuOG4rUmNjS3p4U0lycTBTYXpsL2txbnA3RjFFZ2N2?=
 =?utf-8?B?eFlTSGFlVk9sQldIUDkrQkxIN1lORlpYRUJjTHJkMnZWRU5UMUJpb0hGMFlJ?=
 =?utf-8?B?SFdmdHBRbmZDVXN3UjJnL2c3QXhrWTRtZmdPenFQcTdUbVJHZ3M2dk1UeG44?=
 =?utf-8?B?bVNXQVhjdG0relpMY0c4QUZ0ZlNRb0xFeWx5N2NTR2djZ0lJTnVQbXFhMzhM?=
 =?utf-8?B?WGFvcmJHRWJvK0p1bFU1ckdMbTZRRVJXT3VjOU1na01IdXd6b1FsZlZKcXpY?=
 =?utf-8?B?MXJ0bnl1K1lzaWpWZHJpSklLRktZSjduQmYzRDhWdHBDWDUyUGhtdllhSG1N?=
 =?utf-8?B?bUlqRjVRS2xtNU5IcjhnYXZ5T09BaXBzcmxqWENqdjNham9YVzlRdkhVN0RI?=
 =?utf-8?B?aDJobjJ5czNFSWxFN2p6ZHdkOTdoaS8wYXlkR1p0TDZrbzBsOW00b2wxOHFn?=
 =?utf-8?B?SkdTQndmNmhVZXpscmhQaG1MdHhCbmcvYjhUL3hQUjNpTFRRYU1iSExnSVBy?=
 =?utf-8?B?a1Q5VVhWRUZFNXpsenhQWDMwd3RVcUxia2RDQlRvaURaWHYyUHltUSs5SnJI?=
 =?utf-8?B?SGhMUHRHTkU1VElQOTV6Szc0Y2hsTWdoWXFMUjBDNno1TTZFeWM0b05tRmhn?=
 =?utf-8?B?Y29vVjk3Q2plQ0xSMXE2VDkyb1lMcFR6eEZSSDhScXBtbHVLSTNXVDhIcTNh?=
 =?utf-8?B?VTA2SjVXYXpBcTU4d20vUjNLOTRBRXRkb0hGT3N5T2FveDl2YTRFeXRCUjV2?=
 =?utf-8?B?bXFtL0tLNTlmL1RDdXg1aE1MU0ora2R3amtlMHZ3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ab56f7-140a-44db-4d58-08d8c699a715
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 10:10:51.0911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QODp8QieQPi8HfQq4fjMC5UoIhnYpGKR7nsWAJXb9Tav2GOs+poVEBzgCUUcYYrNaAMtdkw1ARBK7rbKJchd5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3066
X-OriginatorOrg: citrix.com

On Sat, Jan 30, 2021 at 02:58:42AM +0000, Andrew Cooper wrote:
> A guest's default number of grant frames is 64, and XENMEM_acquire_resource
> will reject an attempt to map more than 32 frames.  This limit is caused by
> the size of mfn_list[] on the stack.
> 
> Fix mapping of arbitrary size requests by looping over batches of 32 in
> acquire_resource(), and using hypercall continuations when necessary.
> 
> To start with, break _acquire_resource() out of acquire_resource() to cope
> with type-specific dispatching, and update the return semantics to indicate
> the number of mfns returned.  Update gnttab_acquire_resource() and x86's
> arch_acquire_resource() to match these new semantics.
> 
> Have do_memory_op() pass start_extent into acquire_resource() so it can pick
> up where it left off after a continuation, and loop over batches of 32 until
> all the work is done, or a continuation needs to occur.
> 
> compat_memory_op() is a bit more complicated, because it also has to marshal
> frame_list in the XLAT buffer.  Have it account for continuation information
> itself and hide details from the upper layer, so it can marshal the buffer in
> chunks if necessary.
> 
> With these fixes in place, it is now possible to map the whole grant table for
> a guest.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Just one comment/question regarding a continuation below.

I have to admit I had a hard time reviewing this, all this compat code
plus the continuation stuff is quite hard to follow.

> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Paul Durrant <paul@xen.org>
> CC: Michał Leszczyński <michal.leszczynski@cert.pl>
> CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
> 
> v8:
>  * nat => cmp change in the start_extent check.
>  * Rebase over 'frame' and ARM/IOREQ series.
> 
> v3:
>  * Spelling fixes
> ---
>  xen/common/compat/memory.c |  94 +++++++++++++++++++++++++++-------
>  xen/common/grant_table.c   |   3 ++
>  xen/common/memory.c        | 124 +++++++++++++++++++++++++++++++++------------
>  3 files changed, 169 insertions(+), 52 deletions(-)
> 
> diff --git a/xen/common/compat/memory.c b/xen/common/compat/memory.c
> index 834c5e19d1..4c9cd9c05a 100644
> --- a/xen/common/compat/memory.c
> +++ b/xen/common/compat/memory.c
> @@ -402,23 +402,10 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>          case XENMEM_acquire_resource:
>          {
>              xen_pfn_t *xen_frame_list = NULL;
> -            unsigned int max_nr_frames;
>  
>              if ( copy_from_guest(&cmp.mar, compat, 1) )
>                  return -EFAULT;
>  
> -            /*
> -             * The number of frames handled is currently limited to a
> -             * small number by the underlying implementation, so the
> -             * scratch space should be sufficient for bouncing the
> -             * frame addresses.
> -             */
> -            max_nr_frames = (COMPAT_ARG_XLAT_SIZE - sizeof(*nat.mar)) /
> -                sizeof(*xen_frame_list);
> -
> -            if ( cmp.mar.nr_frames > max_nr_frames )
> -                return -E2BIG;
> -
>              /* Marshal the frame list in the remainder of the xlat space. */
>              if ( !compat_handle_is_null(cmp.mar.frame_list) )
>                  xen_frame_list = (xen_pfn_t *)(nat.mar + 1);
> @@ -432,6 +419,28 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>  
>              if ( xen_frame_list && cmp.mar.nr_frames )
>              {
> +                unsigned int xlat_max_frames =

Could be made const static I think?

> +                    (COMPAT_ARG_XLAT_SIZE - sizeof(*nat.mar)) /
> +                    sizeof(*xen_frame_list);
> +
> +                if ( start_extent >= cmp.mar.nr_frames )
> +                    return -EINVAL;
> +
> +                /*
> +                 * Adjust nat to account for work done on previous
> +                 * continuations, leaving cmp pristine.  Hide the continaution
> +                 * from the native code to prevent double accounting.
> +                 */
> +                nat.mar->nr_frames -= start_extent;
> +                nat.mar->frame += start_extent;
> +                cmd &= MEMOP_CMD_MASK;
> +
> +                /*
> +                 * If there are two many frames to fit within the xlat buffer,
> +                 * we'll need to loop to marshal them all.
> +                 */
> +                nat.mar->nr_frames = min(nat.mar->nr_frames, xlat_max_frames);
> +
>                  /*
>                   * frame_list is an input for translated guests, and an output
>                   * for untranslated guests.  Only copy in for translated guests.
> @@ -444,14 +453,14 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>                                               cmp.mar.nr_frames) ||
>                           __copy_from_compat_offset(
>                               compat_frame_list, cmp.mar.frame_list,
> -                             0, cmp.mar.nr_frames) )
> +                             start_extent, nat.mar->nr_frames) )
>                          return -EFAULT;
>  
>                      /*
>                       * Iterate backwards over compat_frame_list[] expanding
>                       * compat_pfn_t to xen_pfn_t in place.
>                       */
> -                    for ( int x = cmp.mar.nr_frames - 1; x >= 0; --x )
> +                    for ( int x = nat.mar->nr_frames - 1; x >= 0; --x )
>                          xen_frame_list[x] = compat_frame_list[x];

Unrelated question, but I don't really see the point of iterating
backwards, wouldn't it be easy to use use the existing 'i' loop
counter and for a for ( i = 0; i <  nat.mar->nr_frames; i++ )?

(Not that you need to fix it here, just curious about why we use that
construct instead).

>                  }
>              }
> @@ -600,9 +609,11 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>          case XENMEM_acquire_resource:
>          {
>              DEFINE_XEN_GUEST_HANDLE(compat_mem_acquire_resource_t);
> +            unsigned int done;
>  
>              if ( compat_handle_is_null(cmp.mar.frame_list) )
>              {
> +                ASSERT(split == 0 && rc == 0);
>                  if ( __copy_field_to_guest(
>                           guest_handle_cast(compat,
>                                             compat_mem_acquire_resource_t),
> @@ -611,6 +622,21 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>                  break;
>              }
>  
> +            if ( split < 0 )
> +            {
> +                /* Continuation occurred. */
> +                ASSERT(rc != XENMEM_acquire_resource);
> +                done = cmd >> MEMOP_EXTENT_SHIFT;
> +            }
> +            else
> +            {
> +                /* No continuation. */
> +                ASSERT(rc == 0);
> +                done = nat.mar->nr_frames;
> +            }
> +
> +            ASSERT(done <= nat.mar->nr_frames);
> +
>              /*
>               * frame_list is an input for translated guests, and an output for
>               * untranslated guests.  Only copy out for untranslated guests.
> @@ -626,7 +652,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>                   */
>                  BUILD_BUG_ON(sizeof(compat_pfn_t) > sizeof(xen_pfn_t));
>  
> -                for ( i = 0; i < cmp.mar.nr_frames; i++ )
> +                for ( i = 0; i < done; i++ )
>                  {
>                      compat_pfn_t frame = xen_frame_list[i];
>  
> @@ -636,15 +662,45 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>                      compat_frame_list[i] = frame;
>                  }
>  
> -                if ( __copy_to_compat_offset(cmp.mar.frame_list, 0,
> +                if ( __copy_to_compat_offset(cmp.mar.frame_list, start_extent,
>                                               compat_frame_list,
> -                                             cmp.mar.nr_frames) )
> +                                             done) )
>                      return -EFAULT;

Is it fine to return with a possibly pending continuation already
encoded here?

Other places seem to crash the domain when that happens.

Thanks, Roger.

