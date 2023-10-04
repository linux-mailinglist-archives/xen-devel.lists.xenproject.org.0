Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C21C77B80C3
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 15:23:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612567.952527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo1qD-0000Aw-Sa; Wed, 04 Oct 2023 13:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612567.952527; Wed, 04 Oct 2023 13:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo1qD-00008H-PI; Wed, 04 Oct 2023 13:23:05 +0000
Received: by outflank-mailman (input) for mailman id 612567;
 Wed, 04 Oct 2023 13:23:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k75u=FS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qo1qC-00008B-E7
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 13:23:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 257a7c64-62b9-11ee-98d3-6d05b1d4d9a1;
 Wed, 04 Oct 2023 15:23:03 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id DAB024EE0737;
 Wed,  4 Oct 2023 15:23:02 +0200 (CEST)
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
X-Inumbo-ID: 257a7c64-62b9-11ee-98d3-6d05b1d4d9a1
MIME-Version: 1.0
Date: Wed, 04 Oct 2023 15:23:02 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH] xen/types: address Rule 10.1 for macro BITS_TO_LONGS
In-Reply-To: <b3aaaf5265c7e7ce6228ba2146f57aaae09f55e6.1693899008.git.nicola.vetrini@bugseng.com>
References: <b3aaaf5265c7e7ce6228ba2146f57aaae09f55e6.1693899008.git.nicola.vetrini@bugseng.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <6495ba58bda01eae1f4baa46096424eb@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2023 09:31, Nicola Vetrini wrote:
> Given its use in the declaration
> 'DECLARE_BITMAP(features, IOMMU_FEAT_count)' the argument
> 'bits' has essential type 'enum iommu_feature', which is not
> allowed by the Rule as an operand to the addition operator.
> Given that its value can be represented by a signed integer,
> the explicit cast resolves the violation.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/include/xen/types.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
> index aea259db1ef2..2ff8f243908d 100644
> --- a/xen/include/xen/types.h
> +++ b/xen/include/xen/types.h
> @@ -23,7 +23,7 @@ typedef signed long ssize_t;
>  typedef __PTRDIFF_TYPE__ ptrdiff_t;
> 
>  #define BITS_TO_LONGS(bits) \
> -    (((bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
> +    (((int)(bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
>  #define DECLARE_BITMAP(name,bits) \
>      unsigned long name[BITS_TO_LONGS(bits)]

Revisiting this thread after a while: I did some digging and changing 
the essential type of
BITS_TO_LONGS to unsigned

#define BYTES_PER_LONG (_AC(1, U) << LONG_BYTEORDER)
#define BITS_PER_LONG (BYTES_PER_LONG << 3)
[...]
#define BITS_TO_LONGS(bits) \
     (((bits) + BITS_PER_LONG - 1U) / BITS_PER_LONG)
#define DECLARE_BITMAP(name,bits) \
     unsigned long name[BITS_TO_LONGS(bits)]

leads to a whole lot of issues due to the extensive usage of these 
macros
(BITS_TO_LONGS, BITS_PER_LONG) in comparisons with e.g. the macros 
min/max.
The comments made in this series to the patch do have value (e.g. 
BITS_TO_LONGS should be
expected to have only a positive argument), but ultimately the changes 
required in order to
do this and respect all other constraints (either in the form of MISRA 
rules or gcc warnings)
is far too broad to be tackled by a single patch.

Notable examples of such consequences:

There is a build error due to -Werror because of a pointer comparison at 
line 469 of common/numa.c:
i = min(PADDR_BITS, BITS_PER_LONG - 1);
where
#define PADDR_BITS              52

if x86's PADDR_BITS becomes unsigned, then other issues arise, such as:

xenheap_bits = min(flsl(mfn + 1) - 1 + PAGE_SHIFT, PADDR_BITS);

here the type of flsl is int, so either flsl should become unsigned too, 
or the second
argument should be suitably modified.

In the end, the modification that solves a lot of violations (due to 
this being inside an header, though it's a single place to be modified) 
is this:

DECLARE_BITMAP(features, (int)IOMMU_FEAT_count)

If, as it has been argued, BITS_TO_LONGS really needs to become 
unsigned, then a more general
rethinking of the types involved needs to happen.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

