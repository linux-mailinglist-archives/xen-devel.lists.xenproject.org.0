Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDA57D2B5B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 09:31:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621021.967000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupP3-0001NI-KV; Mon, 23 Oct 2023 07:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621021.967000; Mon, 23 Oct 2023 07:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupP3-0001Ko-HY; Mon, 23 Oct 2023 07:31:09 +0000
Received: by outflank-mailman (input) for mailman id 621021;
 Mon, 23 Oct 2023 07:31:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXaf=GF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qupP1-0001Ki-AC
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 07:31:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20a91b03-7176-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 09:31:06 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 000844EE0740;
 Mon, 23 Oct 2023 09:31:05 +0200 (CEST)
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
X-Inumbo-ID: 20a91b03-7176-11ee-98d5-6d05b1d4d9a1
MIME-Version: 1.0
Date: Mon, 23 Oct 2023 09:31:05 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v3 1/8] xen/include: add macro LOWEST_BIT
In-Reply-To: <75deb3bc-1115-42eb-a629-defb09991074@xen.org>
References: <cover.1697815135.git.nicola.vetrini@bugseng.com>
 <546cf30aa43d6d0687a9a6c6d23b11128e5783e8.1697815135.git.nicola.vetrini@bugseng.com>
 <75deb3bc-1115-42eb-a629-defb09991074@xen.org>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <d090c8bd9aaeda74938a8f47d3ddd1a1@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 20/10/2023 19:03, Julien Grall wrote:
> Hi Nicola,
> 
> On 20/10/2023 16:28, Nicola Vetrini wrote:
>> diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
>> index d0caae7db298..49f3ebf848e9 100644
>> --- a/xen/include/xen/macros.h
>> +++ b/xen/include/xen/macros.h
>> @@ -8,8 +8,11 @@
>>   #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>>   #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>>   -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
>> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
>> +/* Returns the 2^ffs(x) or 0, where ffs(x) is the index of the lowest 
>> set bit */
>> +#define LOWEST_BIT(x) ((x) & -(x))
>> +
>> +#define MASK_EXTR(v, m) (((v) & (m)) / LOWEST_BIT(m))
>> +#define MASK_INSR(v, m) (((v) * LOWEST_BIT(m)) & (m))
>>     #define count_args_(dot, a1, a2, a3, a4, a5, a6, a7, a8, x, ...) x
>>   #define count_args(args...) \
>> diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
>> index aea259db1ef2..23cad71c8a47 100644
>> --- a/xen/include/xen/types.h
>> +++ b/xen/include/xen/types.h
> 
> I don't understand how the changes in this file are related to the
> commit. Did you intend to create a separate commit?
> 
> The rest LGTM.
> 

Oh, I made a mistake. This hunk should have been part of patch 7 as a 
cleanup.
I can resubmit with this removed, or it could be ignored altogether.

>> @@ -31,9 +31,9 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
>>   #define NULL ((void*)0)
>>   #endif
>>   -#define INT8_MIN        (-127-1)
>> -#define INT16_MIN       (-32767-1)
>> -#define INT32_MIN       (-2147483647-1)
>> +#define INT8_MIN        (-127 - 1)
>> +#define INT16_MIN       (-32767 - 1)
>> +#define INT32_MIN       (-2147483647 - 1)
>>     #define INT8_MAX        (127)
>>   #define INT16_MAX       (32767)
>> @@ -43,10 +43,10 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
>>   #define UINT16_MAX      (65535)
>>   #define UINT32_MAX      (4294967295U)
>>   -#define INT_MAX         ((int)(~0U>>1))
>> +#define INT_MAX         ((int)(~0U >> 1))
>>   #define INT_MIN         (-INT_MAX - 1)
>>   #define UINT_MAX        (~0U)
>> -#define LONG_MAX        ((long)(~0UL>>1))
>> +#define LONG_MAX        ((long)(~0UL >> 1))
>>   #define LONG_MIN        (-LONG_MAX - 1)
>>   #define ULONG_MAX       (~0UL)
>> 
> 
> Cheers,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

