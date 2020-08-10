Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 564D8240B53
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 18:43:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5AsK-0003RD-M3; Mon, 10 Aug 2020 16:42:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BwXP=BU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k5AsJ-0003R8-1T
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 16:42:15 +0000
X-Inumbo-ID: 01ebea01-743f-45a9-8fd3-2bd121a82ed2
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01ebea01-743f-45a9-8fd3-2bd121a82ed2;
 Mon, 10 Aug 2020 16:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597077733;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=EcgfFN/+d8mb20FR7tJz9Rr+CJutAnglFHqFQLdce2M=;
 b=QUUJB1rbErihSsV83x6dr5dQpOqUscV70+39AesoedAPAqc1OCsmpHiX
 fNruXCoSsc9Ic+U9jMSVooPNR699nTWB7gvTI8z/sUq6JsrSVA2iIURAO
 YCx9N02LU0AvSlxQytjItC7/pOxXP50Lbiu/33V6Aq4sBBGqjPPRNlfon 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: clb2IGQRU5WW/DHB10O/9taj+PCWQ4eZ1ZY+J/vwTkzn1gWI2MdsSlBq4Maad/9WK4RoWWhThO
 bGZGxhOFHS+4tme3oM0UhYgl0st+j7i37xLmGlHWO9JKnY+eVVvaFE+21Oke73C1tedDFLhSHa
 T9q7pcNg/uxtnpCaQfUeV7RDlDZWTEavd6dx8K4XzdtZMw8WbxTnwzWe5lg6sta+fwEDdg6ede
 DG0oCAw+4cENpgAfhZy3t25stfoLu/Lg72ZNkb27Kw+I4tc9QQ8LfZ4Yqr81NaZLltRbO2JfyM
 TCg=
X-SBRS: 2.7
X-MesageID: 24367557
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,458,1589256000"; d="scan'208";a="24367557"
Subject: Re: [PATCH 3/3] x86: don't override INVALID_M2P_ENTRY with
 SHARED_M2P_ENTRY
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <a2b8f0e9-77ea-6127-a25e-d8fd3dcbb866@suse.com>
 <1d83fd35-6ea5-289c-d8db-029c50957f85@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b54b2eb2-f663-e597-1d80-f7fb37e3b39a@citrix.com>
Date: Mon, 10 Aug 2020 17:42:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1d83fd35-6ea5-289c-d8db-029c50957f85@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06/08/2020 10:29, Jan Beulich wrote:
> While in most cases code ahead of the invocation of set_gpfn_from_mfn()
> deals with shared pages, at least in set_typed_p2m_entry() I can't spot
> such handling (it's entirely possible there's code missing there). Let's
> try to play safe and add an extra check.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/include/asm-x86/mm.h
> +++ b/xen/include/asm-x86/mm.h
> @@ -525,9 +525,14 @@ extern const unsigned int *const compat_
>  #endif /* CONFIG_PV32 */
>  
>  #define _set_gpfn_from_mfn(mfn, pfn) ({                        \
> -    struct domain *d = page_get_owner(mfn_to_page(_mfn(mfn))); \
> -    unsigned long entry = (d && (d == dom_cow)) ?              \
> -        SHARED_M2P_ENTRY : (pfn);                              \
> +    unsigned long entry = (pfn);                               \
> +    if ( entry != INVALID_M2P_ENTRY )                          \
> +    {                                                          \
> +        const struct domain *d;                                \
> +        d = page_get_owner(mfn_to_page(_mfn(mfn)));            \
> +        if ( d && (d == dom_cow) )                             \
> +            entry = SHARED_M2P_ENTRY;                          \
> +    }                                                          \
>      set_compat_m2p(mfn, (unsigned int)(entry));                \
>      machine_to_phys_mapping[mfn] = (entry);                    \
>  })
>

Hmm - we already have a lot of callers, and this is already too
complicated to be a define.

We have x86 which uses M2P, and ARM which doesn't.  We have two more
architectures on the way which probably won't want M2P, and certainly
won't in the beginning.

Can we introduce CONFIG_M2P which is selected by x86, rename this
infrastructure to set_m2p() or something, provide a no-op fallback in
common code, and move this implementation into x86/mm.c ?

In particular, silently clobbering pfn to SHARED_M2P_ENTRY is rude
behaviour.  It would be better to ASSERT() the right one is passed in,
which also simplifies release builds.

~Andrew

