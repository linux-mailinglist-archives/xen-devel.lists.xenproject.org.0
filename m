Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A39461DAED6
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 11:31:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbL4P-0005oL-2x; Wed, 20 May 2020 09:31:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AW6E=7C=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jbL4N-0005oF-8Y
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 09:31:23 +0000
X-Inumbo-ID: aab2176a-9a7c-11ea-ae69-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aab2176a-9a7c-11ea-ae69-bc764e2007e4;
 Wed, 20 May 2020 09:31:22 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: F8eck1O+vaUAbn1FkBOm3lKkkBTvFU7rWh4Yk06Q7uS9V9Vtn2ldauRwocpU6NcuypdrHN+J0N
 +C5OMgi2zK1T/xToqcqX2mDymXHTBKvX76xuKkyFFq7IGvmS+ydhN5zs3Lcru2Tno9hMyUtY+F
 PpdZnMuIDHKKqGgH504Jr/EwujyXz7LOfoIe5sUDpsYgdZQhd0AGHdMnHC28ceH1uiLTEra0/q
 YhZXxQ/KBFAuGdhuLS1AwliKZuHz9x9ykMxwAuElgmWruDwewZRu9+18MZ8T++ztTHeS9WrPNM
 v2c=
X-SBRS: 2.7
X-MesageID: 18246321
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,413,1583211600"; d="scan'208";a="18246321"
Date: Wed, 20 May 2020 11:31:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] x86: use POPCNT for hweight<N>() when available
Message-ID: <20200520093106.GI54375@Air-de-Roger>
References: <55a4a24d-7fac-527c-6bcf-8d689136bac2@suse.com>
 <20200514140522.GD54375@Air-de-Roger>
 <83534bf1-fa57-1d4a-c615-f656338a8457@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83534bf1-fa57-1d4a-c615-f656338a8457@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 20, 2020 at 10:31:38AM +0200, Jan Beulich wrote:
> On 14.05.2020 16:05, Roger Pau Monné wrote:
> > On Mon, Jul 15, 2019 at 02:39:04PM +0000, Jan Beulich wrote:
> >> @@ -251,6 +255,10 @@ boot/mkelf32: boot/mkelf32.c
> >>   efi/mkreloc: efi/mkreloc.c
> >>   	$(HOSTCC) $(HOSTCFLAGS) -g -o $@ $<
> >>   
> >> +nocov-y += hweight.o
> >> +noubsan-y += hweight.o
> >> +hweight.o: CFLAGS += $(foreach reg,cx dx si 8 9 10 11,-ffixed-r$(reg))
> > 
> > Why not use clobbers in the asm to list the scratch registers? Is it
> > that much expensive?
> 
> The goal is to disturb the call sites as little as possible. There's
> no point avoiding the scratch registers when no call is made (i.e.
> when the POPCNT insn can be used). Taking away from the compiler 7
> out of 15 registers (that it can hold live data in) seems quite a
> lot to me.

IMO using -ffixed-reg for all those registers is even worse, as that
prevents the generated code in hweight from using any of those, thus
greatly limiting the amount of registers and likely making the
generated code rely heavily on pushing an popping from the stack?

This also has the side effect to limiting the usage of popcnt to gcc,
which IMO is also not ideal.

I also wondered, since the in-place asm before patching is a call
instruction, wouldn't inline asm at build time already assume that the
scratch registers are clobbered?

> >> --- a/xen/include/asm-x86/bitops.h
> >> +++ b/xen/include/asm-x86/bitops.h
> >> @@ -475,9 +475,36 @@ static inline int fls(unsigned int x)
> >>    *
> >>    * The Hamming Weight of a number is the total number of bits set in it.
> >>    */
> >> +#ifndef __clang__
> >> +/* POPCNT encodings with %{r,e}di input and %{r,e}ax output: */
> >> +#define POPCNT_64 ".byte 0xF3, 0x48, 0x0F, 0xB8, 0xC7"
> >> +#define POPCNT_32 ".byte 0xF3, 0x0F, 0xB8, 0xC7"
> >> +
> >> +#define hweight_(n, x, insn, setup, cout, cin) ({                         \
> >> +    unsigned int res_;                                                    \
> >> +    /*                                                                    \
> >> +     * For the function call the POPCNT input register needs to be marked \
> >> +     * modified as well. Set up a local variable of appropriate type      \
> >> +     * for this purpose.                                                  \
> >> +     */                                                                   \
> >> +    typeof((uint##n##_t)(x) + 0U) val_ = (x);                             \
> >> +    alternative_io(setup "; call generic_hweight" #n,                     \
> >> +                   insn, X86_FEATURE_POPCNT,                              \
> >> +                   ASM_OUTPUT2([res] "=a" (res_), [val] cout (val_)),     \
> >> +                   [src] cin (val_));                                     \
> >> +    res_;                                                                 \
> >> +})
> >> +#define hweight64(x) hweight_(64, x, POPCNT_64, "", "+D", "g")
> >> +#define hweight32(x) hweight_(32, x, POPCNT_32, "", "+D", "g")
> >> +#define hweight16(x) hweight_(16, x, "movzwl %w[src], %[val]; " POPCNT_32, \
> >> +                              "mov %[src], %[val]", "=&D", "rm")
> >> +#define hweight8(x)  hweight_( 8, x, "movzbl %b[src], %[val]; " POPCNT_32, \
> >> +                              "mov %[src], %[val]", "=&D", "rm")
> > 
> > Why not just convert types < 32bits into uint32_t and avoid the asm
> > prefix? You are already converting them in hweight_ to an uintX_t.
> 
> I don't think I do - there's a conversion to the promoted type
> when adding in an unsigned int value (which is there to retain
> uint64_t for the 64-bit case, while using unsigned int for all
> smaller sizes, as per the parameter types of generic_hweight*()).
> 
> > That would made the asm simpler as you would then only need to make
> > sure the input is in %rdi and the output is fetched from %rax?
> 
> That's an option, yes, but I again wanted to limit the impact to
> generated code (including code size) as much as possible.
> generic_hweight{8,16}() take unsigned int arguments, not
> uint{8,16}_t ones. Hence at the call site (when a function call
> is needed) no zero extension is necessary. Therefore the MOVZ
> above is to (mainly) overlay the MOV during patching, while the
> POPCNT is to (mainly) overlay the CALL.
> 
> If the simpler asm()-s were considered more important than the
> quality of the generated code, I think we could simply have
> 
> #define hweight16(x) hweight32((uint16_t)(x))
> #define hweight8(x)  hweight32(( uint8_t)(x))

I would definitely prefer simpler asm for sure, so getting rid of the
prefix would be a clear +1 from me. Unless the prefixed version has a
measurable performance impact during normal operation.

Thanks, Roger.

