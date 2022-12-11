Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1DF64954B
	for <lists+xen-devel@lfdr.de>; Sun, 11 Dec 2022 18:24:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458953.716641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4Q3v-0001Xd-5f; Sun, 11 Dec 2022 17:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458953.716641; Sun, 11 Dec 2022 17:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4Q3v-0001V6-2f; Sun, 11 Dec 2022 17:24:27 +0000
Received: by outflank-mailman (input) for mailman id 458953;
 Sun, 11 Dec 2022 17:24:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4Q3u-0001V0-9L
 for xen-devel@lists.xenproject.org; Sun, 11 Dec 2022 17:24:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4Q3t-0007kE-RL; Sun, 11 Dec 2022 17:24:25 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4Q3t-0006xx-Mi; Sun, 11 Dec 2022 17:24:25 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=U3lvsE9dP4Nh9hapVj2EzyYqzOvhzo5QJqy/j97y7XU=; b=Ptsh7mBYShYEuMAuUVjZhTvlNZ
	SWQCJhdDJOUWmUQxgXnsOTCrpcJ0v/syioziVTjtYE8ofxzNm8/6egJ17Z1mEDP/8Ou7NDqUt+Bpy
	eZGI3SSTafefZQIee7EGf0i5xfVPJeSAkLZ6obZTCN7vk3AycfKxqP+uraK9PenwT+/s=;
Message-ID: <edb48cd8-85fc-bcee-f9f1-993b33d74178@xen.org>
Date: Sun, 11 Dec 2022 17:24:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 1/4] xen/dmalloc: Introduce dmalloc() APIs
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <20201223163442.8840-1-andrew.cooper3@citrix.com>
 <20201223163442.8840-2-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20201223163442.8840-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 23/12/2020 16:34, Andrew Cooper wrote:
> Wrappers for xmalloc() and friends, which track allocations tied to a specific
> domain.
> 
> Check for any leaked memory at domain destruction time.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
> 
> RFC:
>   * This probably wants to be less fatal in release builds
>   * In an ideal world, we'd also want to count the total number of bytes
>     allocated from the xmalloc heap, which would be interesting to print in the
>     'q' debugkey.  However, that data is fairly invasive to obtain.
>   * More complicated logic could track the origins of each allocation, and be
>     able to identify which one(s) leaked.
> ---
>   xen/common/Makefile       |  1 +
>   xen/common/dmalloc.c      | 19 +++++++++++++++++++
>   xen/common/domain.c       |  6 ++++++
>   xen/include/xen/dmalloc.h | 29 +++++++++++++++++++++++++++++
>   xen/include/xen/sched.h   |  2 ++
>   5 files changed, 57 insertions(+)
>   create mode 100644 xen/common/dmalloc.c
>   create mode 100644 xen/include/xen/dmalloc.h
> 
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 7a4e652b57..c5d9c23fd1 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -5,6 +5,7 @@ obj-$(CONFIG_CORE_PARKING) += core_parking.o
>   obj-y += cpu.o
>   obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
>   obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
> +obj-y += dmalloc.o
>   obj-y += domain.o
>   obj-y += event_2l.o
>   obj-y += event_channel.o
> diff --git a/xen/common/dmalloc.c b/xen/common/dmalloc.c
> new file mode 100644
> index 0000000000..e3a0e546c2
> --- /dev/null
> +++ b/xen/common/dmalloc.c
> @@ -0,0 +1,19 @@
> +#include <xen/dmalloc.h>
> +#include <xen/sched.h>
> +#include <xen/xmalloc.h>
> +
> +void dfree(struct domain *d, void *ptr)
> +{
> +    atomic_dec(&d->dalloc_heap);
> +    xfree(ptr);
> +}
> +
> +void *_dzalloc(struct domain *d, size_t size, size_t align)
> +{
> +    void *ptr = _xmalloc(size, align);

The 'z' in _dzalloc() implies the memory will want to be zeroed. But 
here you are using _xmalloc().

This also explains the "memory leak" you reported. By switching to 
"_xzalloc()" and the problem disappears (at least on my setup).

Cheers,

-- 
Julien Grall

