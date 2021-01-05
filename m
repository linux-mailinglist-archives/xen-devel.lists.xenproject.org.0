Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF922EAF8A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 17:02:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62067.109657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwomB-0003UL-DW; Tue, 05 Jan 2021 16:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62067.109657; Tue, 05 Jan 2021 16:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwomB-0003Tw-9v; Tue, 05 Jan 2021 16:01:39 +0000
Received: by outflank-mailman (input) for mailman id 62067;
 Tue, 05 Jan 2021 16:01:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwom9-0003Tr-RI
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 16:01:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f310a19f-06a7-42a4-9964-27c58330133c;
 Tue, 05 Jan 2021 16:01:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5BE9EACAF;
 Tue,  5 Jan 2021 16:01:36 +0000 (UTC)
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
X-Inumbo-ID: f310a19f-06a7-42a4-9964-27c58330133c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609862496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xh/7NHFyh7P/uWBTeyzhYUG5qIHzOaOB07fgwXHRtbI=;
	b=I8n+o38ODOflbJQDBgyQcxDRmOkIHsFXik4pzfU1yuWBDcfwRsqNqrTA33vdbcF07uRTNe
	qt5hogo2DxsMgYCvf7ceM0sStWW+GX/WuMPMJzzuIVSE0pMn4n+czMI0ob2ba0ZAyhGqa7
	K4D1Awce1dwjdC1pgM0xxDHc4oqmrX4=
Subject: Re: [PATCH 1/4] xen/dmalloc: Introduce dmalloc() APIs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20201223163442.8840-1-andrew.cooper3@citrix.com>
 <20201223163442.8840-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <837b1373-4d8e-fba3-65c1-d090c88d93b7@suse.com>
Date: Tue, 5 Jan 2021 17:01:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201223163442.8840-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.12.2020 17:34, Andrew Cooper wrote:
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
> +
> +    if ( ptr )
> +        atomic_inc(&d->dalloc_heap);

While this is properly conditional, the freeing side also needs to
tolerate NULL coming in (noticed only while looking at patch 2).
I also wonder whether ZERO_BLOCK_PTR wants special casing.

Jan

