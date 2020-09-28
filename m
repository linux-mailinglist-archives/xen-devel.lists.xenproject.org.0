Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3970227AA57
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 11:10:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMpAT-0001Ut-Pr; Mon, 28 Sep 2020 09:09:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMpAS-0001Uj-1J
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 09:09:56 +0000
X-Inumbo-ID: 4d0f63f6-da91-4922-bd50-49bcae10d705
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d0f63f6-da91-4922-bd50-49bcae10d705;
 Mon, 28 Sep 2020 09:09:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601284194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YmwCKo/pnbI+klT4n6rPfcFqGQ0z4n1gJyTc1Je6k1g=;
 b=VNer4sy857+Y504pyFQXrP239Un90gnnO3ESAJ32+XO9OhgImZxbLc/AeCbiKbo8H588Ok
 /rA2zCzurBfiqAt/AYcxCzmjHB5EJkIrz/G28nx4fTcjC7ohPqeTYTWg0xVkpORghz8JL3
 dVYE4McqQ32PwROEFixroFh7kUUflM8=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 56630AE2C;
 Mon, 28 Sep 2020 09:09:54 +0000 (UTC)
Subject: Re: [PATCH v2 07/11] xen/memory: Improve compat
 XENMEM_acquire_resource handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
 <michal.leszczynski@cert.pl>, Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-8-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9b6c7ed2-02a4-f422-c0ab-62ca5864c7db@suse.com>
Date: Mon, 28 Sep 2020 11:09:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200922182444.12350-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.09.2020 20:24, Andrew Cooper wrote:
> @@ -446,6 +430,31 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>  
>  #undef XLAT_mem_acquire_resource_HNDL_frame_list
>  
> +            if ( xen_frame_list && cmp.mar.nr_frames )
> +            {
> +                /*
> +                 * frame_list is an input for translated guests, and an output
> +                 * for untranslated guests.  Only copy in for translated guests.
> +                 */
> +                if ( paging_mode_translate(currd) )
> +                {
> +                    compat_pfn_t *compat_frame_list = (void *)xen_frame_list;
> +
> +                    if ( !compat_handle_okay(cmp.mar.frame_list,
> +                                             cmp.mar.nr_frames) ||
> +                         __copy_from_compat_offset(
> +                             compat_frame_list, cmp.mar.frame_list,
> +                             0, cmp.mar.nr_frames) )
> +                        return -EFAULT;
> +
> +                    /*
> +                     * Iterate backwards over compat_frame_list[] expanding
> +                     * compat_pfn_t to xen_pfn_t in place.
> +                     */
> +                    for ( int x = cmp.mar.nr_frames - 1; x >= 0; --x )
> +                        xen_frame_list[x] = compat_frame_list[x];

In addition to what Paul has said, I also don't see why you resort
to a signed type here. Using the available local variable i ought to
be quite easy:

                    for ( i = cmp.mar.nr_frames; i--; )
                        xen_frame_list[i] = compat_frame_list[i];

As an aside, considering the controversy we're having on patch 2, I
find it quite interesting how you carefully allow for nr_frames being
zero throughout your changes here (which, as I think is obvious, I
agree you want to do).

Jan

