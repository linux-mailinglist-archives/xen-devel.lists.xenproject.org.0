Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0599A37D1A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 09:24:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889785.1298828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjwQ6-00076y-9d; Mon, 17 Feb 2025 08:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889785.1298828; Mon, 17 Feb 2025 08:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjwQ6-00074a-6H; Mon, 17 Feb 2025 08:24:02 +0000
Received: by outflank-mailman (input) for mailman id 889785;
 Mon, 17 Feb 2025 08:24:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tjwQ4-00074U-G6
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 08:24:00 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 891687af-ed08-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 09:23:59 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5de63846e56so7867551a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 00:23:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb87d47501sm320164966b.115.2025.02.17.00.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 00:23:57 -0800 (PST)
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
X-Inumbo-ID: 891687af-ed08-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739780638; x=1740385438; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qQH83RFwZpxHdW3hlP870qVnl4hcAYVuTfPM98VgMJs=;
        b=Hv97hWZ0hgKhJhkqEv6YvAzPAfFNMVZfDlUPv29rOg/SSN3orV2NOYPzR2JUP1vo9O
         RvMq2UWaz1xrxQebjxcL9Eb8jsy342LX7+lRogv8KYvp5Z1CbDdW5X7ynQwJI+QnEJiI
         nB7EYKxERpu/7pqdgIgNV7aTzSblxiDFSQrPUP0U++1+T1ktzvbp86+zeenpSQfF9o3R
         a0BIcG4S4/9xTFsgwfSrfh7imzXpCjQd7yJNXME4Z19K3BXmOTue1ynpra/KAODMrcQT
         7LgelT2NTxRlybnwzMT2eDcBdEhYvFn7P4dpI/0yks6yjtSLKmGIIFP+uEGxDLZWSetF
         QZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739780638; x=1740385438;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQH83RFwZpxHdW3hlP870qVnl4hcAYVuTfPM98VgMJs=;
        b=OhJzcYb9TLq0gkvStRm4zC+yyX+2RlDYCDNb07J3FFymAl3woCkcIVf8vFfSGfTnUU
         oIPadSCnH+E5pouUrjESpZ/zebrX1LiFhPmM0xdJuGbLvzPEgTyNseNy7xFQgqiNPOKb
         g2Dfh2VgF2OwlHVEotp+LoV4rjWg0mrqgfzJhQcLlji6mhtbcrw/Y1/jzc+s+QNhN7k2
         /YtCIznb8K3rwPZk+wK3G0uWU0yqRssJs3GCIHtWAoxdlCuWhr9rhwkwV9HdgX9t0brK
         iKnQ1wjXto8bkCNDyW+8eOhTDQDGWbU7tx/sCbu5JtPxjwUTFsKuD275KXJA/JzVuPm5
         tOMA==
X-Gm-Message-State: AOJu0Yye6ZI19M/H/6SgLYnSxScPYLy9HnXqCuHYSLquNgXzXjcEK4iI
	ElO2hndlhj73NT7xGrIRQ3pQFWjtBOJvUyFFNOlIItpOrxbZnKNS9naT8KD3cA==
X-Gm-Gg: ASbGncuv5vxBMR/LTSGjzWwluW2+BEXMGVBvYy0TnzKx6isFNmSBsevqO25zCOmHW3p
	uOmm/rOpmgs8tyN4imx2bwR1/y58Uu2bdq1HZvLc8GewaB6gNOztNL6sMuDtQUM7GjEMCW1EHRV
	gbjJVIXCuSA0ROSnClqN26jsz2T/TZTueZ7mw4Of5gltkoyzTGFtseNN2HItboSJFMf4SNriy1G
	Ahmx54DCTLifMK2CtaTBPmV3zm2Fo2r0DddDsdERctM+inoCrXt34w7by2rRi4tbkTTJ5EZ1Ecm
	UnlCi86PRQddhUsCcHPNegCxMi6jWA4yev04qFVFquLpP+6ogYgtlPL0sl2/fb6BLf7HjM0p6Ho
	j
X-Google-Smtp-Source: AGHT+IFt1cey0u0Sszj35JFNao2kCXlUvkucxeOaROXx0Ad/fkYeWFf0oBN813gvDH3SHVOmpwgxNw==
X-Received: by 2002:a17:906:6a0c:b0:ab7:4262:686b with SMTP id a640c23a62f3a-abb70de2984mr855416466b.40.1739780638243;
        Mon, 17 Feb 2025 00:23:58 -0800 (PST)
Message-ID: <4be50b34-f4bf-46fd-b851-53db26272877@suse.com>
Date: Mon, 17 Feb 2025 09:23:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: early crash while loading dom0 kernel between git:19730dbb3f and
 git:414dde38b0
To: "Greg A. Woods" <woods.greg.a@gmail.com>, "Greg A. Woods" <gwoods@acm.org>
References: <6CBF18F6-8AF8-4A22-A4EC-0D7F382FA815@gmail.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
In-Reply-To: <6CBF18F6-8AF8-4A22-A4EC-0D7F382FA815@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.02.2025 00:09, Greg A. Woods wrote:
> I had been testing 4.20-rc (at git:19730dbb3f) relatively successfully
> on a older Dell PE-2950 server.
> 
> Today I tried upgrading to git:414dde38b0 and I encountered the
> following highly repeatable crash on first boot.  (note the git commit
> shown in the log is from my(robohack) local NetBSD patches on GitHub,
> none of which are in the Xen kernel itself -- just tools)

That's a relatively large range, yet at the same time ...

> The offending address ([<ffff82d040201015>] R _stextentry+0x15/0x165)
> seems to be found here (according to "objdump -S xen-syms"):
> 
> ffff82d040201000 <restore_all_guest>:
> 
>         .section .text.entry, "ax", @progbits
> 
> /* %rbx: struct vcpu, interrupts disabled */
> FUNC_LOCAL(restore_all_guest)
>         ASSERT_INTERRUPTS_DISABLED
> ffff82d040201000:       9c                      pushfq
> ffff82d040201001:       f6 44 24 01 02          testb  $0x2,0x1(%rsp)
> ffff82d040201006:       74 02                   je     ffff82d04020100a <restore_all_guest+
> 0xa>
> ffff82d040201008:       0f 0b                   ud2
> ffff82d04020100a:       48 83 c4 08             add    $0x8,%rsp
> 
>         /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
>         mov VCPU_arch_msrs(%rbx), %rdx
> ffff82d04020100e:       48 8b 93 68 0d 00 00    mov    0xd68(%rbx),%rdx
>         mov VCPUMSR_spec_ctrl_raw(%rdx), %r15d
> ffff82d040201015:       44 8b 3a                mov    (%rdx),%r15d
> 
> 
> If I'm not mistaken this is from xen/arch/x86/x86_64/entry.S.  I don't
> see any recent changes there though, so I'm not sure where to go from
> here.  Did something deeper in struct vcpu change?

..., as you say, nothing in that range looks like it might be related to
your observation. Hence what comes to mind are
- memory corruption, which simply started surfacing as a result of
  unrelated changes,
- a build issue - did you do a fresh, clean build, or an incremental
  one?
In any event it may be helpful to bi-sect the issue, so we know more
precisely with what change the issue started surfacing.

Since you say you have local patches on top, is it reasonably certain
the cause isn't there? Can you repro without those patches?

> Start @ 0x200000 [1=0x619000-0x6190ec]...
> Xen 4.20-rc
> (XEN) [000000341c1f78e9] Xen version 4.20-rc (woods@.local) (gcc (nb1 20200907) 9.3.0) debug=y Sun Feb 16 13:33:02 PST 2025
> (XEN) [000000341e299905] Latest ChangeSet: Wed Jan 29 13:29:16 2025 -0800 git:72eea1d3cb-dirty
> (XEN) [000000341fba9b9d] build-id: 0e6a2491c4ad94bdf27ff33fcefc31b5a8b61784
> (XEN) [0000003420fc47e1] CPU Vendor: Intel, Family 6 (0x6), Model 23 (0x17), Stepping 6 (raw 00010676)
> (XEN) [0000003422aea44d] BSP microcode revision: 0x0000060f
> (XEN) [0000003423ad77fc] Bootloader: NetBSD/x86 BIOS Boot, Revision 5.11 (Sun Dec  8 23:54:34 UTC 2024) (from NetBSD 9.99.81)
> (XEN) [0000003425c00815] Command line: loglvl=all bootscrub=false dom0=pv,verbose=1 dom0_mem=20G console=com1,vga console_timestamps=datems dom0_max_vcpus=8 dom0_vcpus_pin=true guest_loglvl=all pv-l1tf=off,domu=off cpuid=rdrand vpmu=on,ipc spec-ctrl=no
>[...]
> (XEN) [    1.045341] alt table ffff82d0404bc3b8 -> ffff82d0404cf9be
> (XEN) [    1.051374] altcall mc_memerr_dhandler+0x31/0x3b0 dest arch/x86/cpu/mcheck/mce_intel.c#intel_checkaddr has no endbr64
> (XEN) [    1.062466] altcall do_machine_check+0x21/0x40 dest mcheck_cmn_handler has no endbr64
> (XEN) [    1.070787] altcall mcheck_mca_logout+0x446/0x770 dest arch/x86/cpu/mcheck/mce_intel.c#intel_need_clearbank_scan has no endbr64
> (XEN) [    1.082748] altcall mcheck_mca_logout+0x49c/0x770 dest arch/x86/cpu/mcheck/mce_intel.c#intel_recoverable_scan has no endbr64
> (XEN) [    1.094447] altcall mcheck_mca_logout+0x56b/0x770 dest arch/x86/cpu/mcheck/mce_intel.c#intel_checkaddr has no endbr64
> (XEN) [    1.105539] altcall arch/x86/cpu/microcode/core.c#parse_blob+0x9/0x20 dest arch/x86/cpu/microcode/intel.c#cpu_request_microcode has no endbr64
> (XEN) [    1.118800] altcall arch/x86/cpu/microcode/core.c#primary_thread_work+0x3d/0x70 dest arch/x86/cpu/microcode/intel.c#apply_microcode has no endbr64
> (XEN) [    1.132407] altcall arch/x86/cpu/microcode/core.c#microcode_update_helper+0xad/0x370 dest arch/x86/cpu/microcode/intel.c#intel_compare has no endbr64
> (XEN) [    1.146275] altcall arch/x86/cpu/microcode/core.c#microcode_update_helper+0x2db/0x370 dest arch/x86/cpu/intel.c#intel_ctxt_switch_masking has no endbr64
> (XEN) [    1.160400] altcall arch/x86/cpu/microcode/core.c#microcode_update_helper+0x2ff/0x370 dest arch/x86/cpu/intel.c#intel_ctxt_switch_masking has no endbr64
> (XEN) [    1.174526] altcall arch/x86/cpu/microcode/core.c#do_microcode_update+0x13e/0x330 dest arch/x86/cpu/microcode/intel.c#apply_microcode has no endbr64
> (XEN) [    1.188307] altcall microcode_update_one+0x11/0x70 dest arch/x86/cpu/microcode/intel.c#collect_cpu_info has no endbr64
> (XEN) [    1.199486] altcall microcode_update_one+0x41/0x70 dest arch/x86/cpu/microcode/intel.c#apply_microcode has no endbr64
> (XEN) [    1.210581] altcall ctxt_switch_levelling+0x116/0x120 dest arch/x86/cpu/intel.c#intel_ctxt_switch_masking has no endbr64
> (XEN) [    1.221934] altcall identify_cpu+0x17a/0x530 dest arch/x86/cpu/intel.c#early_init_intel has no endbr64
> (XEN) [    1.231726] altcall identify_cpu+0x2ef/0x530 dest arch/x86/cpu/intel.c#init_intel has no endbr64
> (XEN) [    1.241075] altcall setup_local_APIC+0x26/0x470 dest init_apic_ldr_flat has no endbr64
> (XEN) [    1.249482] altcall setup_IO_APIC+0x7a9/0xdbb dest cpu_mask_to_apicid_phys has no endbr64
> (XEN) [    1.258148] altcall setup_IO_APIC+0x82d/0xdbb dest cpu_mask_to_apicid_phys has no endbr64
> (XEN) [    1.266816] altcall setup_IO_APIC+0x96f/0xdbb dest cpu_mask_to_apicid_phys has no endbr64
> (XEN) [    1.275483] altcall setup_IO_APIC+0xa53/0xdbb dest cpu_mask_to_apicid_phys has no endbr64
> (XEN) [    1.284149] altcall io_apic_set_pci_routing+0x110/0x380 dest cpu_mask_to_apicid_phys has no endbr64
> (XEN) [    1.293683] altcall io_apic_set_pci_routing+0x18f/0x380 dest cpu_mask_to_apicid_phys has no endbr64
> (XEN) [    1.303215] altcall ioapic_guest_write+0x521/0x5f0 dest cpu_mask_to_apicid_phys has no endbr64
> (XEN) [    1.312314] altcall ioapic_guest_write+0x536/0x5f0 dest cpu_mask_to_apicid_phys has no endbr64
> (XEN) [    1.321416] altcall msi_compose_msg+0x7d/0xf0 dest cpu_mask_to_apicid_phys has no endbr64
> (XEN) [    1.330082] altcall arch/x86/irq.c#_assign_irq_vector+0x39c/0x730 dest vector_allocation_cpumask_phys has no endbr64
> (XEN) [    1.341089] altcall set_desc_affinity+0xb8/0x140 dest cpu_mask_to_apicid_phys has no endbr64
> (XEN) [    1.350015] altcall send_IPI_mask+0xe4/0x1f0 dest send_IPI_mask_flat has no endbr64
> (XEN) [    1.358163] altcall send_IPI_mask+0xfb/0x1f0 dest send_IPI_mask_flat has no endbr64
> (XEN) [    1.366308] altcall send_IPI_self+0x4/0x10 dest send_IPI_self_legacy has no endbr64
> (XEN) [    1.374454] altcall arch/x86/time.c#read_counter+0x1a/0x30 dest arch/x86/time.c#read_hpet_count has no endbr64
> (XEN) [    1.384941] altcall time_resume+0x2d/0x170 dest arch/x86/time.c#resume_hpet has no endbr64

The flurry of these (and the yet larger set further down) clearly points at some
issue, possibly with the building of Xen. Were they present also with RC1? Were
there any build time warnings? Are these present also with a plain upstream Xen?

Cc-in Oleksii for awareness; might be nice to get to the bottom of this before
the release, especially as for now it looks like a regression.

Jan

