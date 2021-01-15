Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 690EC2F7FB8
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 16:37:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68367.122408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0RAQ-0003jy-F0; Fri, 15 Jan 2021 15:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68367.122408; Fri, 15 Jan 2021 15:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0RAQ-0003jZ-Bj; Fri, 15 Jan 2021 15:37:38 +0000
Received: by outflank-mailman (input) for mailman id 68367;
 Fri, 15 Jan 2021 15:37:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0RAP-0003jS-1P
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 15:37:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88571682-daa0-4f92-8018-8dec871f9303;
 Fri, 15 Jan 2021 15:37:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DA5D6AB7F;
 Fri, 15 Jan 2021 15:37:34 +0000 (UTC)
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
X-Inumbo-ID: 88571682-daa0-4f92-8018-8dec871f9303
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610725055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=REnWrUBueavpg+9/VqKKVvS0FRT4Alih8VwDlXO4qY8=;
	b=EQ4HOegeU95f16M/4YlJfWNXKePBG2BC4ZDG2s6E772nvc8208ZgfygXZo+y5G3a6s3p67
	CbyjXo9Qk1VytzbWjF4Wby8+T7rUDkjji7HSiLaYwVxDWoIeaQFSdfcuvNjzm1SiMqcUeJ
	8UjPS0ke6Hg0CsW2VvdoLwUtraX8qNA=
Subject: Re: [PATCH v3 5/7] xen/memory: Improve compat XENMEM_acquire_resource
 handling
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
 <20210112194841.1537-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e8162d0a-b85f-abc4-790e-60ea93a8dc6b@suse.com>
Date: Fri, 15 Jan 2021 16:37:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210112194841.1537-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.01.2021 20:48, Andrew Cooper wrote:
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

Just as a nit, without requiring you to adjust (but with the
request to consider adjusting) - x getting used as array index
would generally suggest it wants to be an unsigned type (despite
me guessing the compiler ought to be able to avoid an explicit
sign-extension for the actual memory accesses):

                    for ( unsigned int x = cmp.mar.nr_frames; x--; )
                        xen_frame_list[x] = compat_frame_list[x];

Jan

