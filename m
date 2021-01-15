Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051432F77DB
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 12:43:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68005.121613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0NW4-0007lT-KO; Fri, 15 Jan 2021 11:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68005.121613; Fri, 15 Jan 2021 11:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0NW4-0007l6-HN; Fri, 15 Jan 2021 11:43:44 +0000
Received: by outflank-mailman (input) for mailman id 68005;
 Fri, 15 Jan 2021 11:43:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0NW3-0007kz-37
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 11:43:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff779770-a751-4906-93b3-11ebe619c4f3;
 Fri, 15 Jan 2021 11:43:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 75984AD29;
 Fri, 15 Jan 2021 11:43:41 +0000 (UTC)
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
X-Inumbo-ID: ff779770-a751-4906-93b3-11ebe619c4f3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610711021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ozUA/UkqVc4/tqCPxRohskEblPutQbK5YgZlyZXTNX8=;
	b=a2uf0f2VOBZN7LVxYNO+j3+iTPT9u14hdrICttPxGwJlyR6ErZPdVaf+zMDUmMAd1ZHbVo
	PcvRb1baZzQniKW/n/DoKvKn9BLv8UDC1r3JgGdbccFdtTZI9iSlCBEt1AFBTWeoJ2aVJW
	sdAIL6LNEtAcuXQ5k9UlIjcXMBYnUho=
Subject: Re: [PATCH v3 1/7] xen/gnttab: Rework resource acquisition
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
 <20210112194841.1537-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ef50aefb-8171-6864-3286-29df1eb25201@suse.com>
Date: Fri, 15 Jan 2021 12:43:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210112194841.1537-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.01.2021 20:48, Andrew Cooper wrote:
> The existing logic doesn't function in the general case for mapping a guests
> grant table, due to arbitrary 32 frame limit, and the default grant table
> limit being 64.
> 
> In order to start addressing this, rework the existing grant table logic by
> implementing a single gnttab_acquire_resource().  This is far more efficient
> than the previous acquire_grant_table() in memory.c because it doesn't take
> the grant table write lock, and attempt to grow the table, for every single
> frame.
> 
> The new gnttab_acquire_resource() function subsumes the previous two
> gnttab_get_{shared,status}_frame() helpers.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit with a remark and a question:

> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4013,6 +4013,59 @@ static int gnttab_get_shared_frame_mfn(struct domain *d,
>      return 0;
>  }
>  
> +int gnttab_acquire_resource(
> +    struct domain *d, unsigned int id, unsigned long frame,
> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
> +{
> +    struct grant_table *gt = d->grant_table;
> +    unsigned int i = nr_frames, tot_frames;

It doesn't look like this initializer was needed. The only
use of i that I can spot is the loop near the end, which
starts from 0.

> +    mfn_t tmp;
> +    void **vaddrs;
> +    int rc;
> +
> +    /* Overflow checks */
> +    if ( frame + nr_frames < frame )
> +        return -EINVAL;
> +
> +    tot_frames = frame + nr_frames;
> +    if ( tot_frames != frame + nr_frames )
> +        return -EINVAL;

Can't these two be folded into

    unsigned int tot_frames = frame + nr_frames;

    if ( tot_frames < frame )
        return -EINVAL;

? Both truncation and wrapping look to be taken care of this
way.

Jan

