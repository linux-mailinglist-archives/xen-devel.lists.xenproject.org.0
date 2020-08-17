Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2BE246845
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 16:22:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7g0Y-0006W0-7b; Mon, 17 Aug 2020 14:21:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGoP=B3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k7g0W-0006Vv-9K
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 14:21:04 +0000
X-Inumbo-ID: 37bb838e-c248-4d93-a109-975567462c8f
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37bb838e-c248-4d93-a109-975567462c8f;
 Mon, 17 Aug 2020 14:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597674061;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=S8jjUm03cyVex4ZQGidm4r9ShqStJF2trZzEKql0c5E=;
 b=IiiKlSdBcvhO23kDPhgKPW/nQEDSQbNPXpT+Ul5hMjztO/Et/9VKV941
 Ig6SiWDDZueraip++Kph8SkwLnuspT9gYL73sf5Hysy1VWk1FbFBTe18w
 2GEi/Z6jsEUok6iMIeBO5fH8aZNq4/N3DRHaAQew9jAR5K9bNa8TQu66Y k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: dSp7uj9cs365XEy3WC4lSltxnV0OgHMAc3bRz/DnTUkrMrybTs+bxMBojms2mo5bESJFyXZAos
 deood2lMHMakYI8OJlP8L1r4bVK5d5wb21hx4r0GAw9iMzcebTPqh8pB8uwslZKvf7QtQm8elm
 XqQ2+UGZwmq72+FAAOt+jCP3Xybk/3H4iq1loFELpWMRWM6/CrEZ47FU1TADa7R+aMjoSMDm+j
 AuxOM1AeJo8rLkW1v5lR+pFFkLyGTDnLG42AFdmb8/BCmLRXMlJHgW8UJE54IC8/jVvmquxRyF
 J5g=
X-SBRS: 2.7
X-MesageID: 25016249
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,322,1592884800"; d="scan'208";a="25016249"
Date: Mon, 17 Aug 2020 16:20:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] xen: Introduce cmpxchg64() and guest_cmpxchg64()
Message-ID: <20200817142040.GE828@Air-de-Roger>
References: <20200815172143.1327-1-julien@xen.org>
 <20200817092406.GO975@Air-de-Roger>
 <b620dc46-7446-a440-5fd2-fd1cc7f8ffa7@xen.org>
 <20200817103306.GA828@Air-de-Roger>
 <f8b9a884-79e3-bd9d-d7bc-94fb9ee9906d@xen.org>
 <20200817114730.GB828@Air-de-Roger>
 <67e0c0f1-d85f-ad4d-d6bb-cee3603962f4@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67e0c0f1-d85f-ad4d-d6bb-cee3603962f4@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On Mon, Aug 17, 2020 at 02:03:23PM +0100, Julien Grall wrote:
> 
> 
> On 17/08/2020 12:50, Roger Pau Monné wrote:
> > On Mon, Aug 17, 2020 at 12:05:54PM +0100, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 17/08/2020 11:33, Roger Pau Monné wrote:
> > > > On Mon, Aug 17, 2020 at 10:42:54AM +0100, Julien Grall wrote:
> > > > > Hi,
> > > > > 
> > > > > On 17/08/2020 10:24, Roger Pau Monné wrote:
> > > > > > On Sat, Aug 15, 2020 at 06:21:43PM +0100, Julien Grall wrote:
> > > > > > > From: Julien Grall <jgrall@amazon.com>
> > > > > > > 
> > > > > > > The IOREQ code is using cmpxchg() with 64-bit value. At the moment, this
> > > > > > > is x86 code, but there is plan to make it common.
> > > > > > > 
> > > > > > > To cater 32-bit arch, introduce two new helpers to deal with 64-bit
> > > > > > > cmpxchg.
> > > > > > > 
> > > > > > > The Arm 32-bit implementation of cmpxchg64() is based on the __cmpxchg64
> > > > > > > in Linux v5.8 (arch/arm/include/asm/cmpxchg.h).
> > > > > > > 
> > > > > > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > > > > > > Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > > > > ---
> > > > > > > diff --git a/xen/include/asm-x86/guest_atomics.h b/xen/include/asm-x86/guest_atomics.h
> > > > > > > index 029417c8ffc1..f4de9d3631ff 100644
> > > > > > > --- a/xen/include/asm-x86/guest_atomics.h
> > > > > > > +++ b/xen/include/asm-x86/guest_atomics.h
> > > > > > > @@ -20,6 +20,8 @@
> > > > > > >         ((void)(d), test_and_change_bit(nr, p))
> > > > > > >     #define guest_cmpxchg(d, ptr, o, n) ((void)(d), cmpxchg(ptr, o, n))
> > > > > > > +#define guest_cmpxchg64(d, ptr, o, n) ((void)(d), cmpxchg64(ptr, o, n))
> > > > > > > +
> > > > > > >     #endif /* _X86_GUEST_ATOMICS_H */
> > > > > > >     /*
> > > > > > > diff --git a/xen/include/asm-x86/x86_64/system.h b/xen/include/asm-x86/x86_64/system.h
> > > > > > > index f471859c19cc..c1b16105e9f2 100644
> > > > > > > --- a/xen/include/asm-x86/x86_64/system.h
> > > > > > > +++ b/xen/include/asm-x86/x86_64/system.h
> > > > > > > @@ -5,6 +5,8 @@
> > > > > > >         ((__typeof__(*(ptr)))__cmpxchg((ptr),(unsigned long)(o),            \
> > > > > > >                                        (unsigned long)(n),sizeof(*(ptr))))
> > > > > > > +#define cmpxchg64(ptr, o, n) cmpxchg(ptr, o, n)
> > > > > > 
> > > > > > Why do you need to introduce an explicitly sized version of cmpxchg
> > > > > > for 64bit values?
> > > > > > 
> > > > > > There's no cmpxchg{8,16,32}, so I would expect cmpxchg64 to just be
> > > > > > handled by cmpxchg detecting the size of the parameter passed to the
> > > > > > function.
> > > > > That works quite well for 64-bit arches. However, for 32-bit, you would need
> > > > > to take some detour so 32-bit and 64-bit can cohabit (you cannot simply
> > > > > replace unsigned long with uint64_t).
> > > > 
> > > > Oh, I see. Switching __cmpxchg on Arm 32 to use unsigned long long or
> > > > uint64_t would be bad, as you would then need two registers to pass
> > > > the value to the function, or push it on the stack?
> > > 
> > > We have only 4 registers (r0 - r4) available for the arguments. With 64-bit
> > > value, we will be using 2 registers, some will end up to be pushed on the
> > > stack.
> > > 
> > > This is assuming the compiler is not clever enough to see we are only using
> > > the bottom 32-bit with some cmpxchg.
> > > 
> > > > 
> > > > Maybe do something like:
> > > > 
> > > > #define cmpxchg(ptr,o,n) ({						\
> > > > 	typeof(*(ptr)) tmp;						\
> > > > 									\
> > > > 	switch ( sizeof(*(ptr)) )					\
> > > > 	{								\
> > > > 	case 8:								\
> > > > 		tmp = __cmpxchg_mb64((ptr), (uint64_t)(o),		\
> > > > 				(uint64_t)(n), sizeof(*(ptr))))		\
> > > > 		break;							\
> > > > 	default:							\
> > > > 		tmp = __cmpxchg_mb((ptr), (unsigned long)(o),		\
> > > > 				(unsigned long)(n), sizeof(*(ptr))))	\
> > > > 		break;							\
> > > > 	}								\
> > > > 	tmp;								\
> > > > })
> > > 
> > > 
> > > Unfortunately this can't compile if o and n are pointers because the
> > > compiler will complain about the cast to uint64_t.
> > 
> > Right, we would have to cast to unsigned long first and then to
> > uint64_t, which is not very nice.
> 
> If you use (uint64_t)(unsigned long) in the 64-bit case, then you would lose
> the top 32-bit. So cmpxchg() wouldn't work as expected.
> 
> > 
> > > 
> > > We would also need a cast when assigning to tmp because tmp may not be a
> > > scalar type. This would lead to the same compiler issue.
> > 
> > Yes, we would have to do a bunch of casts.
> 
> I don't think there is a way to solve this using just cast.

Right. I certainly failed to see it.

> > 
> > I don't think the union is so bad, but let's wait to see what others
> > think.
> 
> I am not concerned about the code itself but the assembly generated. I don't
> want to increase the number memory access or instructions just for the sake
> of trying to get cmpxchg() to work with 64-bit.
> 
> I will have to implement it and see the code generated.

Since we already have a 128bit version I don't think there's a problem
in introducing a 64bit version (and forcing it's usage in common
code).

> > 
> > FWIW x86 already has a specific handler for 128bit values: cmpxchg16b.
> > Maybe it would be better to name this cmpxchg8b? Or rename the
> > existing one to cmpxchg128 for coherence.
> 
> I dislike the name cmpxchg8b(). This is much easier to match the type and
> the name with cmpxchg64().
> 
> I would be happy to rename cmpxchg16b() if the x86 folks would want it.

That would be fine by me.

