Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCFB229CD8
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 18:13:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyHMf-0001dA-CY; Wed, 22 Jul 2020 16:13:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mY6V=BB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jyHMd-0001d2-Tw
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 16:13:03 +0000
X-Inumbo-ID: 36ad1540-cc36-11ea-a1de-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36ad1540-cc36-11ea-a1de-12813bfff9fa;
 Wed, 22 Jul 2020 16:13:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC3ECABD2;
 Wed, 22 Jul 2020 16:13:07 +0000 (UTC)
Subject: Re: [PATCH] x86/hvm: Clean up track_dirty_vram() calltree
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200722151548.4000-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <07ecb7dd-c823-0c6a-2bcd-7fc22471af7a@suse.com>
Date: Wed, 22 Jul 2020 18:13:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722151548.4000-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Tim Deegan <tim@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.07.2020 17:15, Andrew Cooper wrote:
>  * Rename nr to nr_frames.  A plain 'nr' is confusing to follow in the the
>    lower levels.
>  * Use DIV_ROUND_UP() rather than opencoding it in several different ways
>  * The hypercall input is capped at uint32_t, so there is no need for
>    nr_frames to be unsigned long in the lower levels.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'd like to note though that ...

> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -58,16 +58,16 @@
>  
>  int hap_track_dirty_vram(struct domain *d,
>                           unsigned long begin_pfn,
> -                         unsigned long nr,
> +                         unsigned int nr_frames,
>                           XEN_GUEST_HANDLE(void) guest_dirty_bitmap)
>  {
>      long rc = 0;
>      struct sh_dirty_vram *dirty_vram;
>      uint8_t *dirty_bitmap = NULL;
>  
> -    if ( nr )
> +    if ( nr_frames )
>      {
> -        int size = (nr + BITS_PER_BYTE - 1) / BITS_PER_BYTE;
> +        unsigned int size = DIV_ROUND_UP(nr_frames, BITS_PER_BYTE);

... with the change from long to int this construct will now no
longer be correct for the (admittedly absurd) case of a hypercall
input in the range of [0xfffffff9,0xffffffff]. We now fully
depend on this getting properly rejected at the top level hypercall
handler (which limits to 1Gb worth of tracked space).

Jan

