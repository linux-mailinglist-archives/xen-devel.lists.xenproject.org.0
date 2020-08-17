Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C92B4246342
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 11:25:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7bNJ-0001yP-3V; Mon, 17 Aug 2020 09:24:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGoP=B3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k7bNI-0001yK-Gr
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 09:24:16 +0000
X-Inumbo-ID: 924179c9-6945-4af0-b64f-60e596047527
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 924179c9-6945-4af0-b64f-60e596047527;
 Mon, 17 Aug 2020 09:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597656255;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=a8EuNS+FyCsS3+jc99KD8Hn21BTahhBDwTlDVxAMES8=;
 b=Z1yPhGUfDzUkxnt6TwBbJOYIE1onmNzJf1q0dpWRs6Q8krY2CKzVz45Z
 5lDkcNzK7hFWgCFWWeQdApxH/ghJvl0fHW/pkVkdtjZk7nbUysopweiX+
 XECwhZfAQVycMz9yriRZv67jH/r4K4WuPnX+DT5jmWpWM+9jIhRSVoLlc I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Qw8AWra/g9ywudCpLzYMLT6P+r7qE0J9ZmmoloqiKwJjCPZN2qJHcGCzjMndFxtbqAHLuPmDaG
 Ag8bdzpsrS+E7+jeLECDagTHL3IJyfvv0H7SN4n+n+xjOiSLCq5ALaT6NT3ZO01ESINo75S/lw
 1f0swjgAw6aWlmPE5ZgVSlByhJXCGIBTWXWHFV9p1HsOFKPFFcRGB29VduH/JKdewoWResHTlH
 YiTli02L++hilzsa1jRm4PVO4FXULU/dVybQcNSh1juxGVnEvbunBZt5zdoGfrEDyNQ02JNqNg
 9Lc=
X-SBRS: 2.7
X-MesageID: 24640582
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,322,1592884800"; d="scan'208";a="24640582"
Date: Mon, 17 Aug 2020 11:24:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] xen: Introduce cmpxchg64() and guest_cmpxchg64()
Message-ID: <20200817092406.GO975@Air-de-Roger>
References: <20200815172143.1327-1-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200815172143.1327-1-julien@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, Aug 15, 2020 at 06:21:43PM +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The IOREQ code is using cmpxchg() with 64-bit value. At the moment, this
> is x86 code, but there is plan to make it common.
> 
> To cater 32-bit arch, introduce two new helpers to deal with 64-bit
> cmpxchg.
> 
> The Arm 32-bit implementation of cmpxchg64() is based on the __cmpxchg64
> in Linux v5.8 (arch/arm/include/asm/cmpxchg.h).
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> diff --git a/xen/include/asm-x86/guest_atomics.h b/xen/include/asm-x86/guest_atomics.h
> index 029417c8ffc1..f4de9d3631ff 100644
> --- a/xen/include/asm-x86/guest_atomics.h
> +++ b/xen/include/asm-x86/guest_atomics.h
> @@ -20,6 +20,8 @@
>      ((void)(d), test_and_change_bit(nr, p))
>  
>  #define guest_cmpxchg(d, ptr, o, n) ((void)(d), cmpxchg(ptr, o, n))
> +#define guest_cmpxchg64(d, ptr, o, n) ((void)(d), cmpxchg64(ptr, o, n))
> +
>  
>  #endif /* _X86_GUEST_ATOMICS_H */
>  /*
> diff --git a/xen/include/asm-x86/x86_64/system.h b/xen/include/asm-x86/x86_64/system.h
> index f471859c19cc..c1b16105e9f2 100644
> --- a/xen/include/asm-x86/x86_64/system.h
> +++ b/xen/include/asm-x86/x86_64/system.h
> @@ -5,6 +5,8 @@
>      ((__typeof__(*(ptr)))__cmpxchg((ptr),(unsigned long)(o),            \
>                                     (unsigned long)(n),sizeof(*(ptr))))
>  
> +#define cmpxchg64(ptr, o, n) cmpxchg(ptr, o, n)

Why do you need to introduce an explicitly sized version of cmpxchg
for 64bit values?

There's no cmpxchg{8,16,32}, so I would expect cmpxchg64 to just be
handled by cmpxchg detecting the size of the parameter passed to the
function. I think it's worth adding to the commit message why such
differentiated helper is needed.

Thanks, Roger.

