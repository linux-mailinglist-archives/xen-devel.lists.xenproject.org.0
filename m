Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 265362465B9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 13:52:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7dfE-0001NW-D6; Mon, 17 Aug 2020 11:50:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGoP=B3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k7dfC-0001NR-RZ
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 11:50:54 +0000
X-Inumbo-ID: 4e66753f-dbcd-4da3-9801-49bc53dc4f11
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e66753f-dbcd-4da3-9801-49bc53dc4f11;
 Mon, 17 Aug 2020 11:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597665052;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SiJVlIsJhoNw/3F4RySxDnJuEHjSA8ZD+zOsiH0OU88=;
 b=OTVI5GKcr0ZSdOSxhJpcjRN0HbzhUjli/bfp+7CEXtbzF5jkiQIVRhJm
 2XMNOgJxPK8rpXGEWtp5Dj9HP3BA7Txn3aFlAPguFqVMdNAVlSujQt/GJ
 DIBTsJHOb4fnDe+GQiZxiuB3V3RnEZrkbVvOl0q1pR9/LEYck0czrwVVc k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7lwxofUo6WrRN1CklQwfTUTX4MHfqIAnWadtxDQLm974LMuRRQkmPUuPaCCWASAtom2AAcqaW+
 scHglbSg/sK4poSgQE8NCVjKKms8QBD14cElO40JAqbKvlXV6Ua7WTl0pJKbbFN9VMkLd0S9DX
 hZSZsCdRWfwpX5mWUbOHxvlMIJOlFqaknzagH/4a152kbKULrcsnAc9dW/AWWSX8WU3pBUqo0o
 DUlQx3VwBg9fv080axxdrKBCb3xICBAMRwML+wXU5wOBHmV4TsCtTDzsZ6Ny1nirmNCuDbd4dq
 Mt0=
X-SBRS: 2.7
X-MesageID: 25589904
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,322,1592884800"; d="scan'208";a="25589904"
Date: Mon, 17 Aug 2020 13:50:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] xen: Introduce cmpxchg64() and guest_cmpxchg64()
Message-ID: <20200817114730.GB828@Air-de-Roger>
References: <20200815172143.1327-1-julien@xen.org>
 <20200817092406.GO975@Air-de-Roger>
 <b620dc46-7446-a440-5fd2-fd1cc7f8ffa7@xen.org>
 <20200817103306.GA828@Air-de-Roger>
 <f8b9a884-79e3-bd9d-d7bc-94fb9ee9906d@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8b9a884-79e3-bd9d-d7bc-94fb9ee9906d@xen.org>
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

On Mon, Aug 17, 2020 at 12:05:54PM +0100, Julien Grall wrote:
> Hi,
> 
> On 17/08/2020 11:33, Roger Pau Monné wrote:
> > On Mon, Aug 17, 2020 at 10:42:54AM +0100, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 17/08/2020 10:24, Roger Pau Monné wrote:
> > > > On Sat, Aug 15, 2020 at 06:21:43PM +0100, Julien Grall wrote:
> > > > > From: Julien Grall <jgrall@amazon.com>
> > > > > 
> > > > > The IOREQ code is using cmpxchg() with 64-bit value. At the moment, this
> > > > > is x86 code, but there is plan to make it common.
> > > > > 
> > > > > To cater 32-bit arch, introduce two new helpers to deal with 64-bit
> > > > > cmpxchg.
> > > > > 
> > > > > The Arm 32-bit implementation of cmpxchg64() is based on the __cmpxchg64
> > > > > in Linux v5.8 (arch/arm/include/asm/cmpxchg.h).
> > > > > 
> > > > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > > > > Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > > ---
> > > > > diff --git a/xen/include/asm-x86/guest_atomics.h b/xen/include/asm-x86/guest_atomics.h
> > > > > index 029417c8ffc1..f4de9d3631ff 100644
> > > > > --- a/xen/include/asm-x86/guest_atomics.h
> > > > > +++ b/xen/include/asm-x86/guest_atomics.h
> > > > > @@ -20,6 +20,8 @@
> > > > >        ((void)(d), test_and_change_bit(nr, p))
> > > > >    #define guest_cmpxchg(d, ptr, o, n) ((void)(d), cmpxchg(ptr, o, n))
> > > > > +#define guest_cmpxchg64(d, ptr, o, n) ((void)(d), cmpxchg64(ptr, o, n))
> > > > > +
> > > > >    #endif /* _X86_GUEST_ATOMICS_H */
> > > > >    /*
> > > > > diff --git a/xen/include/asm-x86/x86_64/system.h b/xen/include/asm-x86/x86_64/system.h
> > > > > index f471859c19cc..c1b16105e9f2 100644
> > > > > --- a/xen/include/asm-x86/x86_64/system.h
> > > > > +++ b/xen/include/asm-x86/x86_64/system.h
> > > > > @@ -5,6 +5,8 @@
> > > > >        ((__typeof__(*(ptr)))__cmpxchg((ptr),(unsigned long)(o),            \
> > > > >                                       (unsigned long)(n),sizeof(*(ptr))))
> > > > > +#define cmpxchg64(ptr, o, n) cmpxchg(ptr, o, n)
> > > > 
> > > > Why do you need to introduce an explicitly sized version of cmpxchg
> > > > for 64bit values?
> > > > 
> > > > There's no cmpxchg{8,16,32}, so I would expect cmpxchg64 to just be
> > > > handled by cmpxchg detecting the size of the parameter passed to the
> > > > function.
> > > That works quite well for 64-bit arches. However, for 32-bit, you would need
> > > to take some detour so 32-bit and 64-bit can cohabit (you cannot simply
> > > replace unsigned long with uint64_t).
> > 
> > Oh, I see. Switching __cmpxchg on Arm 32 to use unsigned long long or
> > uint64_t would be bad, as you would then need two registers to pass
> > the value to the function, or push it on the stack?
> 
> We have only 4 registers (r0 - r4) available for the arguments. With 64-bit
> value, we will be using 2 registers, some will end up to be pushed on the
> stack.
> 
> This is assuming the compiler is not clever enough to see we are only using
> the bottom 32-bit with some cmpxchg.
> 
> > 
> > Maybe do something like:
> > 
> > #define cmpxchg(ptr,o,n) ({						\
> > 	typeof(*(ptr)) tmp;						\
> > 									\
> > 	switch ( sizeof(*(ptr)) )					\
> > 	{								\
> > 	case 8:								\
> > 		tmp = __cmpxchg_mb64((ptr), (uint64_t)(o),		\
> > 				(uint64_t)(n), sizeof(*(ptr))))		\
> > 		break;							\
> > 	default:							\
> > 		tmp = __cmpxchg_mb((ptr), (unsigned long)(o),		\
> > 				(unsigned long)(n), sizeof(*(ptr))))	\
> > 		break;							\
> > 	}								\
> > 	tmp;								\
> > })
> 
> 
> Unfortunately this can't compile if o and n are pointers because the
> compiler will complain about the cast to uint64_t.

Right, we would have to cast to unsigned long first and then to
uint64_t, which is not very nice.

> 
> We would also need a cast when assigning to tmp because tmp may not be a
> scalar type. This would lead to the same compiler issue.

Yes, we would have to do a bunch of casts.

> The only way I could see to make it work would be to use the same trick as
> we do for {read, write}_atomic() (see asm-arm/atomic.h). We are using union
> and void pointer to prevent explicit cast.

I'm mostly worried about common code having assumed that cmpxchg
does also handle 64bit sized parameters, and thus failing to use
cmpxchg64 when required. I assume this is not much of a deal as then
the Arm 32 build would fail, so it should be fairly easy to catch
those.

I don't think the union is so bad, but let's wait to see what others
think.

FWIW x86 already has a specific handler for 128bit values: cmpxchg16b.
Maybe it would be better to name this cmpxchg8b? Or rename the
existing one to cmpxchg128 for coherence.

Thanks, Roger.

