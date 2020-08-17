Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA4B246493
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 12:33:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7cSC-0002ql-77; Mon, 17 Aug 2020 10:33:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGoP=B3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k7cSA-0002qe-L9
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 10:33:22 +0000
X-Inumbo-ID: 5364051e-affb-47f5-9449-86e669d68ccc
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5364051e-affb-47f5-9449-86e669d68ccc;
 Mon, 17 Aug 2020 10:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597660401;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tcGZvPtk62e+7PdIPH2Lbk1Icj8Lf77VLfoW+25sYDA=;
 b=ShDZgv44CAVVBfHFda/E6MHH+L1dT36vrMH68QlJQc4SFhhvDi54FlYb
 S9S64WMcntTQUluyc9zsXVpOg1e9KoWvlf796cXnzxJ6rUZAs8xxKwjpX
 EzkMFn2uOgh7sZ3WEigJUR0TbJe4yCcfZcFMjaOIBwXD7PLmXx19uAnHy k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4722xQKZ4zb4gn3Jvwx/mW3US4wZiJ9VMzu6J1Msd9ONQg4TIhl02nWie6GCrRpyFuUtnxb/Gm
 tVdE7MFGT+tJTQLmzl1kcAUky9GhJ+oPIxsHFWsaDzo3p9MfOUkTgu5aogHVX1Tho6MsE4U8KB
 pud1v5g1FIMdWjFS48O0sC1KdrimSk755nD/YiLmm6Ma106jUQQeBXvxmQdAwae5cvarxdtQTE
 HZMvg63rUYulux5D8x726VC5l+oBepfL0vyd35iuEKQrW2RoAq1MSlpAgMcmRBT6HiUb5fQpKX
 LmQ=
X-SBRS: 2.7
X-MesageID: 24820439
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,322,1592884800"; d="scan'208";a="24820439"
Date: Mon, 17 Aug 2020 12:33:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] xen: Introduce cmpxchg64() and guest_cmpxchg64()
Message-ID: <20200817103306.GA828@Air-de-Roger>
References: <20200815172143.1327-1-julien@xen.org>
 <20200817092406.GO975@Air-de-Roger>
 <b620dc46-7446-a440-5fd2-fd1cc7f8ffa7@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b620dc46-7446-a440-5fd2-fd1cc7f8ffa7@xen.org>
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

On Mon, Aug 17, 2020 at 10:42:54AM +0100, Julien Grall wrote:
> Hi,
> 
> On 17/08/2020 10:24, Roger Pau Monné wrote:
> > On Sat, Aug 15, 2020 at 06:21:43PM +0100, Julien Grall wrote:
> > > From: Julien Grall <jgrall@amazon.com>
> > > 
> > > The IOREQ code is using cmpxchg() with 64-bit value. At the moment, this
> > > is x86 code, but there is plan to make it common.
> > > 
> > > To cater 32-bit arch, introduce two new helpers to deal with 64-bit
> > > cmpxchg.
> > > 
> > > The Arm 32-bit implementation of cmpxchg64() is based on the __cmpxchg64
> > > in Linux v5.8 (arch/arm/include/asm/cmpxchg.h).
> > > 
> > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > > Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > ---
> > > diff --git a/xen/include/asm-x86/guest_atomics.h b/xen/include/asm-x86/guest_atomics.h
> > > index 029417c8ffc1..f4de9d3631ff 100644
> > > --- a/xen/include/asm-x86/guest_atomics.h
> > > +++ b/xen/include/asm-x86/guest_atomics.h
> > > @@ -20,6 +20,8 @@
> > >       ((void)(d), test_and_change_bit(nr, p))
> > >   #define guest_cmpxchg(d, ptr, o, n) ((void)(d), cmpxchg(ptr, o, n))
> > > +#define guest_cmpxchg64(d, ptr, o, n) ((void)(d), cmpxchg64(ptr, o, n))
> > > +
> > >   #endif /* _X86_GUEST_ATOMICS_H */
> > >   /*
> > > diff --git a/xen/include/asm-x86/x86_64/system.h b/xen/include/asm-x86/x86_64/system.h
> > > index f471859c19cc..c1b16105e9f2 100644
> > > --- a/xen/include/asm-x86/x86_64/system.h
> > > +++ b/xen/include/asm-x86/x86_64/system.h
> > > @@ -5,6 +5,8 @@
> > >       ((__typeof__(*(ptr)))__cmpxchg((ptr),(unsigned long)(o),            \
> > >                                      (unsigned long)(n),sizeof(*(ptr))))
> > > +#define cmpxchg64(ptr, o, n) cmpxchg(ptr, o, n)
> > 
> > Why do you need to introduce an explicitly sized version of cmpxchg
> > for 64bit values?
> > 
> > There's no cmpxchg{8,16,32}, so I would expect cmpxchg64 to just be
> > handled by cmpxchg detecting the size of the parameter passed to the
> > function.
> That works quite well for 64-bit arches. However, for 32-bit, you would need
> to take some detour so 32-bit and 64-bit can cohabit (you cannot simply
> replace unsigned long with uint64_t).

Oh, I see. Switching __cmpxchg on Arm 32 to use unsigned long long or
uint64_t would be bad, as you would then need two registers to pass
the value to the function, or push it on the stack?

Maybe do something like:

#define cmpxchg(ptr,o,n) ({						\
	typeof(*(ptr)) tmp;						\
									\
	switch ( sizeof(*(ptr)) )					\
	{								\
	case 8:								\
		tmp = __cmpxchg_mb64((ptr), (uint64_t)(o),		\
				(uint64_t)(n), sizeof(*(ptr))))		\
		break;							\
	default:							\
		tmp = __cmpxchg_mb((ptr), (unsigned long)(o),		\
				(unsigned long)(n), sizeof(*(ptr))))	\
		break;							\
	}								\
	tmp;								\
})

Roger.

