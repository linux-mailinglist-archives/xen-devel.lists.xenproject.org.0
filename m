Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1881D3219
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 16:06:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZEUp-0006Ic-Qu; Thu, 14 May 2020 14:05:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=otfA=64=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZEUo-0006IX-CC
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 14:05:58 +0000
X-Inumbo-ID: 07f6fd0e-95ec-11ea-b07b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07f6fd0e-95ec-11ea-b07b-bc764e2007e4;
 Thu, 14 May 2020 14:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589465157;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/pRMa7Z58eA1SUUfejjYG4BYlhrJegP7AEZKsOlO1o8=;
 b=Dx/MqfPteXsrd48DBUjjvcIMjmWnxA6eb5H90/jk4el+BPQGY0XxnlB7
 vTxDKyvyiPf76oH+qeisbjgXg5n9T0MCnJ7iPtKoeOBgQOZNUZH6Mu1n6
 CmPB0W+JB31UzF7lUVLb8/eRWk8rwGU1k922LHrnAqBM+yh9IOcjlzZZd M=;
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: fyyBCVrePwR4GBdsysZEJAQpa9Epxy7xNAIGXW3MNyuZL0JMQzIFGuIgRmCxvvWgu0zuge19E2
 3+5Xf8n3oSEdTnP9jlCUERB+jNWCIslu7E9QYBcbRiuFqilfvK4JKRcplh6SoOujTCNIGzmN3N
 aeBXQUOk3jd2LvZYEWkXeoplUo6i6qJYcOgpDIEKbLYfOzFbEzilUMt46eQumeu8ChdL6OlmDw
 3WTnDvH1MziiUNbLYEF1wnphpYBleq5kZlzwV5NohTKL4IgY2AvtBnThZowrz+QsFiSTT+3JEQ
 sRQ=
X-SBRS: 2.7
X-MesageID: 17524862
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,391,1583211600"; d="scan'208";a="17524862"
Date: Thu, 14 May 2020 16:05:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86: use POPCNT for hweight<N>() when available
Message-ID: <20200514140522.GD54375@Air-de-Roger>
References: <55a4a24d-7fac-527c-6bcf-8d689136bac2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <55a4a24d-7fac-527c-6bcf-8d689136bac2@suse.com>
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

On Mon, Jul 15, 2019 at 02:39:04PM +0000, Jan Beulich wrote:
> This is faster than using the software implementation, and the insn is
> available on all half-way recent hardware. Therefore convert
> generic_hweight<N>() to out-of-line functions (without affecting Arm)
> and use alternatives patching to replace the function calls.
> 
> Note that the approach doesn#t work for clang, due to it not recognizing
> -ffixed-*.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Also suppress UB sanitizer instrumentation. Reduce macroization in
>      hweight.c. Exclude clang builds.
> ---
> Note: Using "g" instead of "X" as the dummy constraint in hweight64()
>        and hweight32(), other than expected, produces slightly better
>        code with gcc 8.
> 
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -31,6 +31,10 @@ obj-y += emul-i8254.o
>   obj-y += extable.o
>   obj-y += flushtlb.o
>   obj-$(CONFIG_CRASH_DEBUG) += gdbstub.o
> +# clang doesn't appear to know of -ffixed-*
> +hweight-$(gcc) := hweight.o
> +hweight-$(clang) :=
> +obj-y += $(hweight-y)
>   obj-y += hypercall.o
>   obj-y += i387.o
>   obj-y += i8259.o
> @@ -251,6 +255,10 @@ boot/mkelf32: boot/mkelf32.c
>   efi/mkreloc: efi/mkreloc.c
>   	$(HOSTCC) $(HOSTCFLAGS) -g -o $@ $<
>   
> +nocov-y += hweight.o
> +noubsan-y += hweight.o
> +hweight.o: CFLAGS += $(foreach reg,cx dx si 8 9 10 11,-ffixed-r$(reg))

Why not use clobbers in the asm to list the scratch registers? Is it
that much expensive?

> +
>   .PHONY: clean
>   clean::
>   	rm -f asm-offsets.s *.lds boot/*.o boot/*~ boot/core boot/mkelf32
> --- /dev/null
> +++ b/xen/arch/x86/hweight.c
> @@ -0,0 +1,21 @@
> +#define generic_hweight64 _hweight64
> +#define generic_hweight32 _hweight32
> +#define generic_hweight16 _hweight16
> +#define generic_hweight8  _hweight8
> +
> +#include <xen/compiler.h>
> +
> +#undef inline
> +#define inline always_inline
> +
> +#include <xen/bitops.h>
> +
> +#undef generic_hweight8
> +#undef generic_hweight16
> +#undef generic_hweight32
> +#undef generic_hweight64
> +
> +unsigned int generic_hweight8 (unsigned int x) { return _hweight8 (x); }
> +unsigned int generic_hweight16(unsigned int x) { return _hweight16(x); }
> +unsigned int generic_hweight32(unsigned int x) { return _hweight32(x); }
> +unsigned int generic_hweight64(uint64_t x)     { return _hweight64(x); }
> --- a/xen/include/asm-x86/bitops.h
> +++ b/xen/include/asm-x86/bitops.h
> @@ -475,9 +475,36 @@ static inline int fls(unsigned int x)
>    *
>    * The Hamming Weight of a number is the total number of bits set in it.
>    */
> +#ifndef __clang__
> +/* POPCNT encodings with %{r,e}di input and %{r,e}ax output: */
> +#define POPCNT_64 ".byte 0xF3, 0x48, 0x0F, 0xB8, 0xC7"
> +#define POPCNT_32 ".byte 0xF3, 0x0F, 0xB8, 0xC7"
> +
> +#define hweight_(n, x, insn, setup, cout, cin) ({                         \
> +    unsigned int res_;                                                    \
> +    /*                                                                    \
> +     * For the function call the POPCNT input register needs to be marked \
> +     * modified as well. Set up a local variable of appropriate type      \
> +     * for this purpose.                                                  \
> +     */                                                                   \
> +    typeof((uint##n##_t)(x) + 0U) val_ = (x);                             \
> +    alternative_io(setup "; call generic_hweight" #n,                     \
> +                   insn, X86_FEATURE_POPCNT,                              \
> +                   ASM_OUTPUT2([res] "=a" (res_), [val] cout (val_)),     \
> +                   [src] cin (val_));                                     \
> +    res_;                                                                 \
> +})
> +#define hweight64(x) hweight_(64, x, POPCNT_64, "", "+D", "g")
> +#define hweight32(x) hweight_(32, x, POPCNT_32, "", "+D", "g")
> +#define hweight16(x) hweight_(16, x, "movzwl %w[src], %[val]; " POPCNT_32, \
> +                              "mov %[src], %[val]", "=&D", "rm")
> +#define hweight8(x)  hweight_( 8, x, "movzbl %b[src], %[val]; " POPCNT_32, \
> +                              "mov %[src], %[val]", "=&D", "rm")

Why not just convert types < 32bits into uint32_t and avoid the asm
prefix? You are already converting them in hweight_ to an uintX_t.

That would made the asm simpler as you would then only need to make
sure the input is in %rdi and the output is fetched from %rax?

Thanks, Roger.

