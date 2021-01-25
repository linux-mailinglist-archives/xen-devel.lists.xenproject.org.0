Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 550E23026AF
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 16:08:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74137.133234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l43TX-0001GM-Ip; Mon, 25 Jan 2021 15:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74137.133234; Mon, 25 Jan 2021 15:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l43TX-0001Fx-FY; Mon, 25 Jan 2021 15:08:19 +0000
Received: by outflank-mailman (input) for mailman id 74137;
 Mon, 25 Jan 2021 15:08:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l43TV-0001Fs-L1
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 15:08:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8613deb2-f30f-4d8f-9d54-c9a098b3770f;
 Mon, 25 Jan 2021 15:08:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 55A0BB939;
 Mon, 25 Jan 2021 15:08:15 +0000 (UTC)
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
X-Inumbo-ID: 8613deb2-f30f-4d8f-9d54-c9a098b3770f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611587295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o17tOZukL4o9r0k92R2c6OfOHdz1AEOOcFhqv2SY0zQ=;
	b=AEAuvxSqndagQ4roVbx3Bg5NoKKx539DS5ET6kLPbK6Imr0r8If+j+33O8agGDAhbylUfq
	LZ7B1IulVRPLTIKACIbI3tTufimKRcW/mFFZKQ8X1uzVXA5K8qSyWP+lqRbekG76paAY4y
	ujGeCLlD7S4cMu4UYujaPLqQyb5ImiU=
Subject: Re: [PATCH v7 02/10] xen/domain: Add vmtrace_frames domain creation
 parameter
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <752e7de2-b95e-f7ab-0d14-877c72c66134@suse.com>
Date: Mon, 25 Jan 2021 16:08:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210121212718.2441-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.01.2021 22:27, Andrew Cooper wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -132,6 +132,48 @@ static void vcpu_info_reset(struct vcpu *v)
>      v->vcpu_info_mfn = INVALID_MFN;
>  }
>  
> +static void vmtrace_free_buffer(struct vcpu *v)
> +{
> +    const struct domain *d = v->domain;
> +    struct page_info *pg = v->vmtrace.buf;
> +    unsigned int i;
> +
> +    if ( !pg )
> +        return;
> +
> +    for ( i = 0; i < d->vmtrace_frames; i++ )
> +    {
> +        put_page_alloc_ref(&pg[i]);
> +        put_page_and_type(&pg[i]);
> +    }
> +
> +    v->vmtrace.buf = NULL;

To set a good precedent, maybe this wants moving up ahead of
the loop and ...

> +}
> +
> +static int vmtrace_alloc_buffer(struct vcpu *v)
> +{
> +    struct domain *d = v->domain;
> +    struct page_info *pg;
> +    unsigned int i;
> +
> +    if ( !d->vmtrace_frames )
> +        return 0;
> +
> +    pg = alloc_domheap_pages(d, get_order_from_pages(d->vmtrace_frames),
> +                             MEMF_no_refcount);
> +    if ( !pg )
> +        return -ENOMEM;
> +
> +    v->vmtrace.buf = pg;

... this wants moving down past the loop, to avoid
globally announcing something that isn't fully initialized
yet / anymore?

> +    for ( i = 0; i < d->vmtrace_frames; i++ )
> +        /* Domain can't know about this page yet - something fishy going on. */
> +        if ( !get_page_and_type(&pg[i], d, PGT_writable_page) )
> +            BUG();

Whatever the final verdict to the other similar places
that one of your patch changes should be applied here,
too.

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -94,6 +94,7 @@ struct xen_domctl_createdomain {
>      uint32_t max_evtchn_port;
>      int32_t max_grant_frames;
>      int32_t max_maptrack_frames;
> +    uint32_t vmtrace_frames;

Considering page size related irritations elsewhere in the
public interface, could you have a comment clarify the unit
of this value (Xen's page size according to the rest of the
patch), and that space will be allocated once per-vCPU
rather than per-domain (to stand a chance of recognizing
the ultimate memory footprint resulting from this)?

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -257,6 +257,10 @@ struct vcpu
>      /* vPCI per-vCPU area, used to store data for long running operations. */
>      struct vpci_vcpu vpci;
>  
> +    struct {
> +        struct page_info *buf;
> +    } vmtrace;

While perhaps minor, I'm unconvinced "buf" is a good name
for a field of this type.

> @@ -470,6 +474,9 @@ struct domain
>      unsigned    pbuf_idx;
>      spinlock_t  pbuf_lock;
>  
> +    /* Used by vmtrace features */
> +    uint32_t    vmtrace_frames;

unsigned int? Also could you move this to an existing 32-bit
hole, like immediately after "monitor"?

Jan

