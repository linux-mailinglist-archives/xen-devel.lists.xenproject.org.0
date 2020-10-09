Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFA72885F1
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 11:26:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4735.12466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQodr-0006hj-Am; Fri, 09 Oct 2020 09:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4735.12466; Fri, 09 Oct 2020 09:24:47 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQodr-0006hO-7G; Fri, 09 Oct 2020 09:24:47 +0000
Received: by outflank-mailman (input) for mailman id 4735;
 Fri, 09 Oct 2020 09:24:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PrsB=DQ=linux.alibaba.com=richard.weiyang@srs-us1.protection.inumbo.net>)
 id 1kQodo-0006hJ-T6
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 09:24:44 +0000
Received: from out30-42.freemail.mail.aliyun.com (unknown [115.124.30.42])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3412a8f-aef8-44f8-bda6-8965a5c60530;
 Fri, 09 Oct 2020 09:24:41 +0000 (UTC)
Received: from localhost(mailfrom:richard.weiyang@linux.alibaba.com
 fp:SMTPD_---0UBQ5Qni_1602235473) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 09 Oct 2020 17:24:34 +0800
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PrsB=DQ=linux.alibaba.com=richard.weiyang@srs-us1.protection.inumbo.net>)
	id 1kQodo-0006hJ-T6
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 09:24:44 +0000
X-Inumbo-ID: f3412a8f-aef8-44f8-bda6-8965a5c60530
Received: from out30-42.freemail.mail.aliyun.com (unknown [115.124.30.42])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f3412a8f-aef8-44f8-bda6-8965a5c60530;
	Fri, 09 Oct 2020 09:24:41 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R941e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04357;MF=richard.weiyang@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0UBQ5Qni_1602235473;
Received: from localhost(mailfrom:richard.weiyang@linux.alibaba.com fp:SMTPD_---0UBQ5Qni_1602235473)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 09 Oct 2020 17:24:34 +0800
Date: Fri, 9 Oct 2020 17:24:33 +0800
From: Wei Yang <richard.weiyang@linux.alibaba.com>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: david@redhat.com, akpm@linux-foundation.org, ardb@kernel.org,
	bhe@redhat.com, dan.j.williams@intel.com, jgg@ziepe.ca,
	keescook@chromium.org, linux-acpi@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-nvdimm@lists.01.org,
	linux-s390@vger.kernel.org, mhocko@suse.com,
	pankaj.gupta.linux@gmail.com, richardw.yang@linux.intel.com,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] kernel/resource: Fix use of ternary condition in
 release_mem_region_adjustable
Message-ID: <20201009092433.GA56924@L-31X9LVDL-1304.local>
Reply-To: Wei Yang <richard.weiyang@linux.alibaba.com>
References: <20200911103459.10306-2-david@redhat.com>
 <20200922060748.2452056-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922060748.2452056-1-natechancellor@gmail.com>

On Mon, Sep 21, 2020 at 11:07:48PM -0700, Nathan Chancellor wrote:
>Clang warns:
>
>kernel/resource.c:1281:53: warning: operator '?:' has lower precedence
>than '|'; '|' will be evaluated first
>[-Wbitwise-conditional-parentheses]
>        new_res = alloc_resource(GFP_KERNEL | alloc_nofail ? __GFP_NOFAIL : 0);
>                                 ~~~~~~~~~~~~~~~~~~~~~~~~~ ^
>kernel/resource.c:1281:53: note: place parentheses around the '|'
>expression to silence this warning
>        new_res = alloc_resource(GFP_KERNEL | alloc_nofail ? __GFP_NOFAIL : 0);
>                                 ~~~~~~~~~~~~~~~~~~~~~~~~~ ^
>kernel/resource.c:1281:53: note: place parentheses around the '?:'
>expression to evaluate it first
>        new_res = alloc_resource(GFP_KERNEL | alloc_nofail ? __GFP_NOFAIL : 0);
>                                                           ^
>                                              (                              )
>1 warning generated.
>
>Add the parentheses as it was clearly intended for the ternary condition
>to be evaluated first.
>
>Fixes: 5fd23bd0d739 ("kernel/resource: make release_mem_region_adjustable() never fail")
>Link: https://github.com/ClangBuiltLinux/linux/issues/1159
>Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Reviewed-by: Wei Yang <richard.weiyang@linux.alibaba.com>

>---
>
>Presumably, this will be squashed but I included a fixes tag
>nonetheless. Apologies if this has already been noticed and fixed
>already, I did not find anything on LKML.
>
> kernel/resource.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/kernel/resource.c b/kernel/resource.c
>index ca2a666e4317..3ae2f56cc79d 100644
>--- a/kernel/resource.c
>+++ b/kernel/resource.c
>@@ -1278,7 +1278,7 @@ void release_mem_region_adjustable(resource_size_t start, resource_size_t size)
> 	 * similarly).
> 	 */
> retry:
>-	new_res = alloc_resource(GFP_KERNEL | alloc_nofail ? __GFP_NOFAIL : 0);
>+	new_res = alloc_resource(GFP_KERNEL | (alloc_nofail ? __GFP_NOFAIL : 0));
> 
> 	p = &parent->child;
> 	write_lock(&resource_lock);
>
>base-commit: 40ee82f47bf297e31d0c47547cd8f24ede52415a
>-- 
>2.28.0

-- 
Wei Yang
Help you, Help me

