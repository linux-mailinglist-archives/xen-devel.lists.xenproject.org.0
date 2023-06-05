Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7558D722759
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 15:27:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543722.848928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6AEM-0004L2-Ud; Mon, 05 Jun 2023 13:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543722.848928; Mon, 05 Jun 2023 13:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6AEM-0004Ie-Rz; Mon, 05 Jun 2023 13:26:42 +0000
Received: by outflank-mailman (input) for mailman id 543722;
 Mon, 05 Jun 2023 13:26:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/oe=BZ=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1q6AEL-0004IU-Cm
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 13:26:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a3ff98b-03a4-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 15:26:39 +0200 (CEST)
Received: from [192.168.1.142] (unknown [151.47.122.133])
 by support.bugseng.com (Postfix) with ESMTPSA id 32D554EE073A;
 Mon,  5 Jun 2023 15:26:38 +0200 (CEST)
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
X-Inumbo-ID: 9a3ff98b-03a4-11ee-b232-6b7b168915f2
Message-ID: <80a512ac-d90e-930a-7ef7-8ebb5a80e801@bugseng.com>
Date: Mon, 5 Jun 2023 15:26:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
Subject: Re: Xen reliance on non-standard GCC features
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com>
 <8314e0fc-4ead-40fa-ef7b-4da8ce0655b4@suse.com>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <8314e0fc-4ead-40fa-ef7b-4da8ce0655b4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/06/23 11:28, Jan Beulich wrote:
> On 05.06.2023 07:28, Roberto Bagnara wrote:
>> U1) Use of _Static_assert in C99 mode.
>>
>> U2) Empty initialization lists, both in C99 mode (ARM64 and X86_64)
>>       and C18 mode (only X86_64).
>>
>> U3) Returning void expressions.
> 
> As per above, tiny extensions like these are, I think, unlikely to be
> mentioned anywhere explicitly (or more than in passing). For the last of
> the three it may further be that it pre-dates when gcc started to
> properly document extensions. Oh, actually - U3 is documented along with
> -Wreturn-type.

Noted: thanks!

> Uses are generally intentional afaik, but eliminating cases of U2 and U3
> would likely be possible with just slight overall impact.

Ok.  As this has an impact on MISRA compliance at some stage we will need
an official position on the subject.

> As to U2, it's not clear why you distinguish C99 and C18 mode.

I specified that because for MISRA compliance we need to stick
to one version of the language: while most translation units
are compiled in C99 mode, some are compiled in C18 mode and some
in C90 mode.  However, I agree this is OT for the current discussion.

> Throughout
> this summary of yours it would likely have been helpful if an example was
> provided for the behavior your describing, when the wording doesn't make
> it crystal clear (e.g. no example needed for U1 and U3 above).

You are right: here are a few examples for U2:

xen/arch/arm/cpuerrata.c:92.12-92.35:
empty initializer list (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7.8: "An empty initialization list." [STD.emptinit]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
xen/include/xen/spinlock.h:31.21-31.23: expanded from macro `_LOCK_DEBUG'
xen/include/xen/spinlock.h:143.57-143.67: expanded from macro `SPIN_LOCK_UNLOCKED'
xen/include/xen/spinlock.h:144.43-144.60: expanded from macro `DEFINE_SPINLOCK'

xen/arch/arm/cpuerrata.c:678.5-678.6:
empty initializer list (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7.8: "An empty initialization list." [STD.emptinit]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'

xen/arch/arm/cpufeature.c:33.5-33.6:
empty initializer list (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7.8: "An empty initialization list." [STD.emptinit]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'


> As to U1, I'm afraid this statement very early in gcc's section
> documenting C extensions simply hasn't been properly updated for newer
> versions of the standard: "Some features that are in ISO C99 but not C90
> or C++ are also, as extensions, accepted by GCC in C90 mode and in C++."
> A somewhat similar statement in the middle of 2.1 "C Language" is
> slightly better, thus covering at least the specific case of
> _Static_assert.

Noted: thanks!

>> U4) Static functions or variables used in inline functions with external
>>       linkage.
> 
> There's not a lot of "extern inline" that we've accumulated so far, I
> think. The only ones I'm aware of are sort() and bsearch(), and there
> the use is precisely for allowing the compiler to optimize away function
> calls.
> 
> The documentation of this functionality is that of the gnu_inline
> function attribute, afaict. That would be 6.33.1 "Common Function
> Attributes" in 13.1.0 doc.

No, it is not that one:

xen/common/spinlock.c:316.29-316.40:
static function `observe_head(spinlock_tickets_t*)' is used in an inline function with external linkage (ill-formed for the C99 standard, ISO/IEC 9899:1999: "An ill-formed source detected by the parser." [STD.diag/ext_internal_in_extern_inline_quiet]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
xen/common/spinlock.c:301.26-301.37:
`observe_head(spinlock_tickets_t*)' declared here
xen/include/xen/spinlock.h:180.1-180.4:
use 'static' to give inline function `_spin_lock_cb(spinlock_t*, void(*)(void*), void*)' internal linkage

>> U5) Enumerator values outside the range of `int'.

Examples:

xen/arch/x86/include/asm/guest/hyperv-tlfs.h:477.9-477.26: Loc #1 [culprit: ISO C restricts enumerator values to range of 'int' (2147483648 is too large) (ill-formed for the C99 standard, ISO/IEC 9899:1999: "An ill-formed source detected by the parser." [STD.diag/ext_enum_value_not_int]). Tool used is `/usr/bin/x86_64-linux-gnu-gcc-12']
xen/arch/x86/include/asm/guest/hyperv-tlfs.h:477.43-477.52: Loc #2 [evidence: ISO C restricts enumerator values to range of 'int' (2147483648 is too large)]

xen/arch/x86/include/asm/guest/hyperv-tlfs.h:478.9-478.27: Loc #1 [culprit: ISO C restricts enumerator values to range of 'int' (2147483649 is too large) (ill-formed for the C99 standard, ISO/IEC 9899:1999: "An ill-formed source detected by the parser." [STD.diag/ext_enum_value_not_int]). Tool used is `/usr/bin/x86_64-linux-gnu-gcc-12']
xen/arch/x86/include/asm/guest/hyperv-tlfs.h:478.43-478.52: Loc #2 [evidence: ISO C restricts enumerator values to range of 'int' (2147483649 is too large)]

xen/arch/x86/include/asm/hvm/svm/vmcb.h:143.5-143.27: Loc #1 [culprit: ISO C restricts enumerator values to range of 'int' (2147483648 is too large) (ill-formed for the C99 standard, ISO/IEC 9899:1999: "An ill-formed source detected by the parser." [STD.diag/ext_enum_value_not_int]). Tool used is `/usr/bin/x86_64-linux-gnu-gcc-12']
xen/arch/x86/include/asm/hvm/svm/vmcb.h:143.31-143.38: Loc #2 [evidence: ISO C restricts enumerator values to range of 'int' (2147483648 is too large)]

>> U6) Empty declarations.

Examples:

xen/arch/arm/arm64/lib/find_next_bit.c:57.29:
empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'

xen/arch/arm/arm64/lib/find_next_bit.c:103.34:
empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'

xen/arch/arm/include/asm/vreg.h:143.26:
empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'

xen/arch/arm/include/asm/vreg.h:144.26:
empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'

xen/arch/arm/include/asm/arm64/flushtlb.h:70.51:
empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'

>> U7) Empty enum definitions.

Example:

xen/arch/arm/include/asm/vgic.h:275.6-275.17:
enum declaration `gic_sgi_mode' is incomplete (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7.2.2: "An incomplete enum declaration." [STD.emptenum]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'

> ... here I wonder whether instead you mean forward declaration of enums
> (i.e. what the standard allows for structures and unions only).

It is reported as an enum forward declaration if the enum is later
properly declared.  My understanding is that this is not the case
for the example above.

>> U8) Conversion between incompatible pointer types.
> 
> Do we have any uses that aren't, by using casts, documenting that the
> conversions are deliberate? Otherwise I would expect the compiler to
> warn, and hence the build to fail due to -Werror. Then again I'm sure
> we have ample uses of casts left which are actually bogus.

Examples:

xen/common/kernel.c:552.18-552.47:
implicit cast converts from `const __typeof__(*(&params))*' (that is `const struct xen_platform_parameters*') to `void*' (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.5.16.1: "Implicit conversion from a pointer to an incompatible pointer." [STD.pteincmp]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
xen/include/xen/guest_access.h:65.23-65.24: expanded from macro `copy_to_guest_offset'
xen/include/xen/guest_access.h:104.5-104.41: expanded from macro `copy_to_guest'

xen/common/kernel.c:566.14-566.59:
implicit cast converts from `const __typeof__(*(chgset))*' (that is `const char*') to `void*' (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.5.16.1: "Implicit conversion from a pointer to an incompatible pointer." [STD.pteincmp]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
xen/include/xen/guest_access.h:65.23-65.24: expanded from macro `copy_to_guest_offset'
xen/include/xen/guest_access.h:104.5-104.41: expanded from macro `copy_to_guest'

xen/common/kernel.c:613.14-613.41:
implicit cast converts from `const __typeof__(*(&fi))*' (that is `const struct xen_feature_info*') to `void*' (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.5.16.1: "Implicit conversion from a pointer to an incompatible pointer." [STD.pteincmp]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
xen/include/xen/guest_access.h:123.23-123.24: expanded from macro `__copy_to_guest_offset'
xen/include/xen/guest_access.h:152.5-152.43: expanded from macro `__copy_to_guest'

xen/common/kernel.c:645.14-645.71:
implicit cast converts from `const __typeof__(*(deny ? xen_deny() : saved_cmdline))*' (that is `const char*') to `void*' (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.5.16.1: "Implicit conversion from a pointer to an incompatible pointer." [STD.pteincmp]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
xen/include/xen/guest_access.h:65.23-65.24: expanded from macro `copy_to_guest_offset'
xen/include/xen/guest_access.h:104.5-104.41: expanded from macro `copy_to_guest'

xen/common/memory.c:1745.20-1745.53:
implicit cast converts from `const __typeof__(*(&topology))*' (that is `const struct xen_vnuma_topology_info*') to `void*' (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.5.16.1: "Implicit conversion from a pointer to an incompatible pointer." [STD.pteincmp]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
xen/include/xen/guest_access.h:123.23-123.24: expanded from macro `__copy_to_guest_offset'
xen/include/xen/guest_access.h:152.5-152.43: expanded from macro `__copy_to_guest'

xen/common/memory.c:1808.14-1808.47:
implicit cast converts from `const __typeof__(*(&topology))*' (that is `const struct xen_vnuma_topology_info*') to `void*' (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.5.16.1: "Implicit conversion from a pointer to an incompatible pointer." [STD.pteincmp]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
xen/include/xen/guest_access.h:123.23-123.24: expanded from macro `__copy_to_guest_offset'
xen/include/xen/guest_access.h:152.5-152.43: expanded from macro `__copy_to_guest'

xen/common/memory.c:1841.14-1841.47:
implicit cast converts from `const __typeof__(*(&grdm.map))*' (that is `const struct xen_reserved_device_memory_map*') to `void*' (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.5.16.1: "Implicit conversion from a pointer to an incompatible pointer." [STD.pteincmp]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
xen/include/xen/guest_access.h:123.23-123.24: expanded from macro `__copy_to_guest_offset'
xen/include/xen/guest_access.h:152.5-152.43: expanded from macro `__copy_to_guest'

xen/common/efi/boot.c:335.16-335.56:
implicit cast converts from `const CHAR16*' (that is `const unsigned short*') to `void*' (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.5.16.1: "Implicit conversion from a pointer to an incompatible pointer." [STD.pteincmp]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'

xen/common/libfdt/fdt_overlay.c:733.69-733.87:
implicit cast converts from `const char*' to `void*' (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.5.16.1: "Implicit conversion from a pointer to an incompatible pointer." [STD.pteincmp]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'

>> U9) Conversion between function pointers and object pointers.

Example:
xen/arch/x86/apic.c:1159.16-1159.55: Loc #1 [culprit: c_style cast converts from `const void*' to `unsigned(*)(void)' (ill-formed for the C99 standard, ISO/IEC 9899:1999 Annex J.5.7: "A pointer to a function is converted to a pointer to an object or a pointer to an object is converted to a pointer to a function (6.5.4, 6.3.2.3)." [STD.funojptr]). Tool used is `/usr/bin/x86_64-linux-gnu-gcc-12']

> Uses I'm readily aware of are deliberate. Plus isn't this shorthand
> for going through uintptr_t intermediately only anyway?

I don't understand the last sentence.

>> U10) \m escape sequence.
>>        Is this an undocumented GCC extension or just a typo?

Already dealt with in another message.

>> Here is a list of extensions that are documented in the GCC manual:
> 
> I suppose that this list wasn't meant to be complete? The most
> prominent example is probably asm().

As far as I can tell the list was almost complete (I realize now
that the use of the keyword __signed__ was omitted because
investigation was not completed).  But I am probably misunderstanding
you.

Kind regards,

    Roberto

