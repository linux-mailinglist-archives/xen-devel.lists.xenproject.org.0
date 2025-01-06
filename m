Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EFBA027FE
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 15:29:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865758.1277027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUo6L-0004Jp-Rp; Mon, 06 Jan 2025 14:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865758.1277027; Mon, 06 Jan 2025 14:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUo6L-0004HX-Ov; Mon, 06 Jan 2025 14:29:05 +0000
Received: by outflank-mailman (input) for mailman id 865758;
 Mon, 06 Jan 2025 14:29:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUo6K-0004HR-Kr
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 14:29:04 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 933d4223-cc3a-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 15:29:02 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4363dc916ceso89776975e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 06:29:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828e3fsm48576267f8f.5.2025.01.06.06.29.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 06:29:00 -0800 (PST)
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
X-Inumbo-ID: 933d4223-cc3a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736173742; x=1736778542; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qQgCJk2SRXr/4wYxbeX321RmhPVw63jVd1cZ+I36fVU=;
        b=DYCorf1ko+U5oU8dDLsV5YeZgHuPn8k9BxQ3ZfTqezxL7fLlTZnyb6ulBmsEd4+U4F
         Yk3L2f9SzTURObmmOyPlrjTr4RlWsRAsoNFvCu0JgUwt9CnuyEKqdybuxyXfT3pu54py
         GFJZpTYRfs1lTwqCEL/qqAm5tIcGEHSkGmFYgJ0Hc57jhKPZOnDgN0y4bf7DWps+4H5J
         chUlOAaec6/QDC4VnbxAnyBmbxUNaZ7FOkPi468LTQ5H7WRsBDgCyXetCUA4EWrueph1
         Hx4mcg9EjAGt20u/nnbVmNCsvcL/7kYZqSjCG3esv3Wn8FdG/myXbZSaEPnGcyqk+xXk
         WxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173742; x=1736778542;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQgCJk2SRXr/4wYxbeX321RmhPVw63jVd1cZ+I36fVU=;
        b=cakBzZk4vMAgMEoMd+oIdxy0NKGeg4BiAB0Milbwisww70syd3+jqruqhpMO1jiZQY
         H8zmVanQDJzfXUH3eL8JDKKZq6x0X5diNzAQpLi2+M4eH7PwkJS/8Oghi966y7zE0Mkz
         xQeWCGKPR01rbExGNYKytd87BSnTVHfSsu0kthY9cKKqKSZisELgqoGxex+Aei/K7SGm
         khurt3SyVZ2sBTQ2+4G0ClgT7e7uSdUIMjoMpPcsgN8zueU0smX0pH9Ta9gowmVYYvQY
         KDioefMd6veEYiEMT9cabQ+CoUxCnzZ9draQq33aELhlPchbZAklp+wdimf7Oyr1tOuR
         9UUg==
X-Forwarded-Encrypted: i=1; AJvYcCUlgY4NmW+T+1LAAIcJ7cI+Barn7T3I7m9vMbeN5YUlVVxXRB4hAhDZZ8Ly8HX6mp7Y+sgwW/3OD/M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRFviJ5ES6rVL4QRxgcVfPy/c2mZWdlCmH1oFkR+h3sh+CwcFx
	eZN7/1uHe5H8vuuzDalBMTiKQTwcC99A1VTB1j2qTmQC/dkO/HGKIVo1lSRGdQ==
X-Gm-Gg: ASbGncuj25w2gIRPCj4O3ODfaUk8c+rbLm7gFZuElkoYfl67Hk/uLsRkOKa9PrBcyBw
	7uQyl8OZYIY8h9FEyQYzGugR2B14CV7b50pFU5bNobDmivPGVUaHzUAJoPHL/FSzJ9kNXqGoTTu
	Q8wLw/BiupzoXIYzni5t0Pt4zKEN9xRk8VBk0cmJQkv6lwJPCP9d0YWPm1Px6MT1jg2LtzDJV5H
	7Aflk65w7YZD9KjTyCdNHYqkObOxoUlN1EtMmGkAWAmg8orfkTCtonpguK5UBHPYVRBI50xyfxz
	ucAADvmG1gFpNrjMwck55cx0XrUPm7QNM/p410OQ1A==
X-Google-Smtp-Source: AGHT+IFs2MQsvnb7skBIq5LUbnTe82FsNuoDB+JWIDrE6vpiI2bjUbPaCGXAEATedToUj2EBKJyhGg==
X-Received: by 2002:a05:6000:1864:b0:388:c61d:4415 with SMTP id ffacd0b85a97d-38a22a2d914mr44976156f8f.18.1736173741281;
        Mon, 06 Jan 2025 06:29:01 -0800 (PST)
Message-ID: <3ff59df0-69f8-426a-ab44-d2cd9b5bf8ea@suse.com>
Date: Mon, 6 Jan 2025 15:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] docs: FRED support in Xen
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250103204704.84067-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250103204704.84067-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.01.2025 21:47, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> An initial RFC discussion and plan.  Open TODOs are at the end.
> 
> This can be viewed online at:
>   https://andrewcoop-xen.readthedocs.io/en/docs-devel/hypervisor-guide/x86/fred.html
> 
> I've got an 8-patch series doing the cpu_user_regs disentangling vs the public
> API.  That's in pretty good shape now.
> 
> FRED itself is orders and orders of magnitude more simple than IDT, both in
> terms of setup and operation, but I'm in the middle of a very large
> cleanup (35 patches and count) to setup.c and trap.c in order to make FRED
> able to be cleanly integrated into Xen, and that's still before any of the GS
> changes to keep PV guests functioning correctly.
> ---
>  docs/glossary.rst                   |   7 +
>  docs/hypervisor-guide/x86/fred.rst  | 215 ++++++++++++++++++++++++++++
>  docs/hypervisor-guide/x86/index.rst |   1 +
>  3 files changed, 223 insertions(+)
>  create mode 100644 docs/hypervisor-guide/x86/fred.rst
> 
> diff --git a/docs/glossary.rst b/docs/glossary.rst
> index 6adeec77e14c..18502c0474f7 100644
> --- a/docs/glossary.rst
> +++ b/docs/glossary.rst
> @@ -43,6 +43,13 @@ Glossary
>       Sapphire Rapids (Server, 2023) CPUs.  AMD support only CET-SS, starting
>       with Zen3 (Both client and server, 2020) CPUs.
>  
> +   FRED
> +     Flexible Return and Event Delivery is a facility in x86 CPUs which
> +     overhauls how system calls, interrupt and exception handling works.
> +
> +     Intel support for FRED is slated for Panther Lake (Client) and Diamond
> +     Rapids (Server).
> +
>     guest
>       The term 'guest' has two different meanings, depending on context, and
>       should not be confused with :term:`domain`.
> diff --git a/docs/hypervisor-guide/x86/fred.rst b/docs/hypervisor-guide/x86/fred.rst
> new file mode 100644
> index 000000000000..68146b79bdfc
> --- /dev/null
> +++ b/docs/hypervisor-guide/x86/fred.rst
> @@ -0,0 +1,215 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +FRED: Flexible Return and Event Delivery
> +========================================
> +
> +Overview
> +--------
> +
> +FRED was originally intended to improve performance (reading and parsing the
> +IDT, GDT/LDT and possibly the TSS is a bottleneck) and to provide an
> +extensible mechanism to overcome other limitations in the future (e.g. support
> +for more than 256 interrupt vectors).  During development, FRED was adjusted
> +substantially to also fix lots of technical debt that had accumulated in the
> +x86 architecture for the past 40 years, most of which is a fertile source of
> +crashes and privilege escalation bugs.
> +
> +FRED is primarily concerned with establishing a new context when an event is
> +recognised, and restoring the old context when the event is handled.  This
> +includes events previously delivered through the IDT (exceptions and
> +interrupts), as well as ``SYSCALL`` and ``SYSENTER`` instructions which
> +avoided the IDT in the past for performance reasons.
> +
> +FRED strives to achieve that event delivery always establishes a good CPL0
> +stack (and shadow stack if CET is active), that doesn't clobber still-active
> +state from an outer nested context, and with the CPL0 GSBASE.
> +
> +Technical details
> +-----------------
> +
> +When FRED is active, Rings 1 and 2 cannot be entered at all, Ring0
> +compatibility mode cant be entered (i.e. Ring0 is strictly 64bit), and
> +``IRET`` can no longer change privilege.  Call Gates no longer exist.
> +
> +A single entrypoint is registered in ``MSR_FRED_CONFIG``.  Entries from Ring3
> +start at this address, while entries from Ring0 start at +256.  All
> +interrupts, exceptions and syscalls route these.  VMExits do not, and retain
> +their prior behaviour.
> +
> +There are 4 Stack Levels, SL 0 thru 3 and a notion of Current Stack Level,
> +replacing the prior IST mechanism.  All stack pointers, and shadow stack
> +pointers when CET-SS is active, are registered in ``MSR_{R,S}SP_SL{0..3}``.
> +Supervisor Shadow Stack tokens no longer exist, and are replaced with an
> +alternative mechanism.
> +
> +The IDT is no longer used.  The TSS is no longer used used to hold stack
> +pointers, nor ``MSR_ISST`` if CET Shadow Stacks are active.  ``MSR_{L,C}STAR``
> +as well as all SYSENTER MSRs are no longer used.  Under FRED, ``MSR_STAR`` and
> +``MSR_FMASK`` are used with their previous behaviour extended to all event
> +deliveries, not just syscalls.
> +
> +The instructions ``SWAPGS``, ``CLRSSBSY``, ``SETSSBSY``, ``SYSEXIT`` and
> +``SYSRET`` unconditionally ``#UD``.  Establishing an initial SSP should use
> +``RSTORSSP``.  GS maintenance can use the new ``LKGS`` instruction.
> +
> +Implementation considerations
> +-----------------------------
> +
> +PV32 guests
> +"""""""""""
> +
> +FRED formally removes the ability to use Rings 1 and 2, which prohibits the
> +use of PV32 guests.  PV32 guests are already disabled by default in the
> +presence of CET owing to the difficulty of using Ring 1 with CET active.
> +Compatibility for PV32 guests is provided by PVShim, which takes care not to
> +use CET in order to be able to run PV32 guests.  FRED can use the same
> +approach.
> +
> +Initialisation
> +""""""""""""""
> +
> +Exception handling is initialised right at the beginning of ``__start_xen()``
> +prior to parsing the command line.  Having exception cover this early is
> +important and wants to remain.
> +
> +The determination of whether to use FRED or not needs to account for the
> +``fred`` and ``pvshim`` command line options, the ``FRED`` and ``LKGS`` CPUID
> +bits.
> +
> +Therefore for simplicity, early exception handling will still use IDT
> +delivery, and later setup can switch to FRED instead.
> +
> +cpu_user_regs vs vm86 segments
> +""""""""""""""""""""""""""""""
> +
> +``struct cpu_user_regs`` exists in the public interface, and is embedded
> +inside ``struct vcpu_guest_context``.  From an ABI perspective, the layout
> +needs to remain.  ``struct cpu_user_regs`` is also a common name in Xen,
> +covering the event information (pushed by hardware and software) and the GPRs
> +(pushed by software).  From an API perspective, the name needs to remain.
> +
> +The data selectors (ds, es, fs, gs) are a vestigial remnant of vm86 mode.
> +Hardware did push them on exit from vm86 mode, and ``IRET`` would consume them
> +on the way back in.
> +
> +However, vm86 mode isn't usable in Long mode, and these selectors oughtn't to
> +have survived into the PV64 ABI.  Under FRED, hardware pushes different
> +information here, which needs accounting for in Xen's view of ``struct
> +cpu_user_regs``.
> +
> +Therefore, the only option is to have the public API provide a struct by a
> +different name, and provide a compatibility define for the ``!__XEN__`` case,
> +freeing us up to have a similar but not identical ``struct cpu_user_regs``
> +which Xen operates on.
> +
> +There are several uses of the vm86 fields in Xen:
> +
> + #. ``struct vcpu`` embeds a ``struct cpu_user_regs`` to hold GPRs/etc when
> +    the vCPU is scheduled out.  The vm86 fields are used by the PV logic only
> +    (``{save,load}_segments()``) and can be moved into separate fields in
> +    ``struct pv_vcpu``.  PV's ``dom0_construct()`` sets these fields directly,
> +    and needs a matching adjustment.
> +
> + #. As part of ``arch_{get,set}_info_guest()`` during hypercalls.  The
> +    guest side needs to remain as-is, but the Xen side can rearranged to use
> +    the new fields from above.
> +
> + #. As part of vCPU diagnostics (``show_registers()`` etc).  The ``#DF`` path
> +    uses the fields as scratch storage for the current register values, while
> +    the other diagnostics are simply accessing the state of a scheduled-out
> +    vCPU.

Unlike for the former 2 points and for the one immediately below, but like for
the final one below you don't mention what you intend to do. Here I assume it'll
be reasonably straightforward to use scratch space elsewhere.

> + #. In HVM's ``hvm_sanitize_regs_fields()``, to poison the fields and make
> +    them more obvious if used anywhere in HVM context.  This can simply be
> +    deleted.
> +
> + #. In x86_emulate.c's ``put_fpu()``.  As far as I can tell, this is
> +    completely buggy; the values will be poisoned for HVM guests, and stale
> +    from the prior context switch for PV guests.

For HVM guests the ->read_segment() hook will be populated, so the path isn't
taken (leaving aside the odd case of the hook failing). For PV guests I don't
see any staleness concern: When the vCPU was switched in, the fields were set
(restored), weren't they?

For the purpose of FRED this doesn't matter much - wherever the values are to
be held, they'll be taken from by put_fpu().

> +Stack layout
> +""""""""""""
> +
> +Xen's CPU stacks are 8-page (8-page aligned), arranged as::
> +
> +  7 - Primary stack (with a struct cpu_info at the top)
> +  6 - Primary stack
> +  5 - Primary Shadow Stack (read-only)
> +  4 - #DF IST stack
> +  3 - #DB IST stack
> +  2 - NMI IST stack
> +  1 - #MC IST stack
> +  0 - IST Shadow Stacks (4x 1k, read-only)
> +
> +which needs mapping into FREDs Stack Levels.
> +
> +FRED Stack Levels replace IST.  Most events from Ring3 enter Ring0 at SL0,
> +including interrupts, and even exceptions with a non-zero Stack Level
> +configured.  Nested exceptions originate from Ring0 even if they were trying
> +to push a Ring3 event frame onto the stack, so do follow the Ring0 CSL rules.
> +
> +Within Ring0, a stack switch occurs on event delivery if the event has a
> +higher configured Stack Level (exceptions in ``MSR_FRED_STK_LVLS``, interrupts
> +in ``MSR_FRED_CONFIG``).  Otherwise, the new event is delivered on the current
> +stack.
> +
> +Under FRED, most sources of ``#DF`` are gone; failure to push a new event
> +frame onto a stack is the main remaining one, so ``#DF`` needs to be the
> +highest stack level (SL3) to catch errors at all other stack levels.
> +
> +Also, FRED removes the "syscall gap", removing the primary need for ``NMI``,
> +``#DB`` and ``#MC`` to need separate stacks.
> +
> +Therefore, Xen has no need for SL1 or SL2.  Under IDT delivery, we poison the
> +unused stack pointers with a non-canonical address, but we cannot do that
> +under FRED; they're held in MSRs and checked at WRMSR time.  Instead, we can
> +point the SL pairs (RSP + SSP) at each others (regular and shadow stack) guard
> +pages such that any use of an unused SL will escalate to ``#DF``.

I may have a language issue here: "each others" reads wrong to me; do you perhaps
mean "each ones"?

Further, mainly to double check my own understanding: Almost half of the stack
area then isn't used anymore when FRED is active: 2 pages for the primary stack,
1 page for the primary shadow stack, 1 page for the SL3 stack, and (somewhat
wastefully) 1 more for the SL3 shadow stack. There'll be 3 unused pages, and
hence space again to have true guard pages, e.g.

  7 - Primary stack (with a struct cpu_info at the top)
  6 - Primary stack
  5 - Guard page
  4 - Primary Shadow Stack (read-only)
  3 - Guard page
  2 - #DF stack
  1 - #DF Shadow Stack (read-only)
  0 - Guard page

Having reached the bottom of the section, there's one special IST aspect that
I'm missing, special enough imo to warrant mentioning even if only to state that
it's (hopefully) going to be irrelevant (i.e. not require replacing by another
similar hack): {dis,en}able_each_ist() as used by SVM (on the assumption that
sooner or later AMD is likely to also implement FRED, and that you may already
know of details of their respective VMCB integration).

> +Still TBD
> +---------
> +
> +Issues/areas I'm aware of, but haven't got a firm plan yet.
> +
> +Call Gates
> +""""""""""
> +
> +FRED removes Call Gates, yielding ``#GP[sel]`` instead.  This is how we
> +emulate call gates for PV32, but emulation is genuinely only wired up for PV32
> +guests, not for PV64.
> +
> +PV64 guests do seem to be able to write Call Gates into their LDT/GDT, but
> +have the DPL 0'd in common with PV32.  Given the absence of emulation, I think
> +PV64 can't actually use Call Gates, but given the existing logic this also
> +seems to be by accident rather than design.

A partial patch I have to start doing that emulation has a timestamp of 2007.
Quoting my note there (which I may have posted at some point): "The main issue
to be resolved is how to distinguish whether a referenced code segment is a
kernel or user segment, so that the code can know whether to switch the guest
to kernel mode. Perhaps this can be done by setting _SEGMENT_EC on all user
segments and clearing it on all kernel ones (in check_descriptor())."

In any event - since no real-world need has surfaced in all this time, I don't
think the case needs worrying about for FRED.

> +GS handling
> +"""""""""""
> +
> +Xen does not use GS as a per-cpu pointer, but FRED is tied to the common OS
> +usage.  Therefore, when FRED is active, ``v->arch.pv.gs_base_{user,kernel}``
> +are logically the opposite way around when running in Xen context.

But these are our own fields. I think we'd better keep their names in line
with what they hold. It's the use of the fields which ...

> +Furthermore we cannot use ``SWAPGS`` as part of context switching, and there's
> +no ``wrgsshadow`` instruction.  All guest GS handling within Xen needs to be
> +altered.

... needs altering then, along with the other adjustments you allude to here.

Jan

