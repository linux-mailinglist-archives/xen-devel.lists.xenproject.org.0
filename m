Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F477617DB3
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 14:20:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436583.690646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqa7w-0005zs-Hm; Thu, 03 Nov 2022 13:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436583.690646; Thu, 03 Nov 2022 13:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqa7w-0005xQ-F7; Thu, 03 Nov 2022 13:19:24 +0000
Received: by outflank-mailman (input) for mailman id 436583;
 Thu, 03 Nov 2022 13:19:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LQg8=3D=gmail.com=brgerst@srs-se1.protection.inumbo.net>)
 id 1oqa7u-0005xK-Vi
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 13:19:23 +0000
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [2607:f8b0:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 206b9cb2-5b7a-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 14:19:21 +0100 (CET)
Received: by mail-ot1-x32f.google.com with SMTP id
 k59-20020a9d19c1000000b0066c45cdfca5so935394otk.10
 for <xen-devel@lists.xenproject.org>; Thu, 03 Nov 2022 06:19:21 -0700 (PDT)
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
X-Inumbo-ID: 206b9cb2-5b7a-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iQ8PQVj82FaQ9LUd3o9QfAubExvzsF8Edqea9t2SIG8=;
        b=a4sRTXzkK9mF4OQewlFU3sQTKQzC+mDlvEiTdM1XHvOMXwPeRwDs+bfCvYwYbiVxfl
         p9Z9PEWlo6Y+o39oSTejZzgrz+UrIJd0GMxOi34rF8aHLRM2O17GZmRma8nBtBJI5TBU
         AxgwRByGV18v8HEC+nvBXCdXwhCv5HU7rT47jLNNyPDoD3rjhzvu2N6lzPkTyr/IMujp
         YWqVIxZRi6d1aAwBdadWgTH1s21On3muSijmVQNADKEX48eYKN/j5oq67HfVq1055mDb
         2WWaX/rjmrLwoC0uTjnthGlqr9kSJIXnSBdjNlJZEIIigGgurdUswULX6KUaCB6k9umR
         Y0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQ8PQVj82FaQ9LUd3o9QfAubExvzsF8Edqea9t2SIG8=;
        b=6escNit0RunwSsLPG3ceegHVy2LzO8hWfNTtUP9agwUR6n7d6jt9iGfk3vgO0GyASV
         8BRtuOa+tNN0AW2G7040O/cBsqtE8qX+/9podXH6OdtXfy7k8wFq5eJHVOsd8IzWXVG5
         R9yI82tC1PovPe1hHIuEXcBTn7kRfusbtW7wRns1C9/18jWhVlj4eMCOFEruHkG3H8J4
         gBnU89JYJr7CSTdK47Uz/HUuugjjrJMfbTZmlLFsgzQDTQbWbLi0Rwr58KY2jelGFJZe
         LkdR6MsCbKngNu727M7LgO2mqT/8dIur40ATUGHURjgbybTXlvxekco9/sHmIvbVECzf
         s00w==
X-Gm-Message-State: ACrzQf3FGyVO8P07jc2q6VfALHBkOpSl7pnkOR2jIXjzrqf2k7GEY8Ih
	ccwGJ3tqn9bNBLzfQZVohfznX2gVD8VmtRNnBA==
X-Google-Smtp-Source: AMsMyM5At5QIXD+W1ctPricPlnnX9xjVg0QTOE8jZ8RNtVL0/JksfYeTA1uggniA1HiVbfFClLRC6HVvFPEErGKIMeg=
X-Received: by 2002:a05:6830:148a:b0:66c:7b8c:4598 with SMTP id
 s10-20020a056830148a00b0066c7b8c4598mr3443204otq.81.1667481560181; Thu, 03
 Nov 2022 06:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221103113636.25543-1-jgross@suse.com> <20221103113636.25543-5-jgross@suse.com>
In-Reply-To: <20221103113636.25543-5-jgross@suse.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Thu, 3 Nov 2022 09:19:06 -0400
Message-ID: <CAMzpN2hynmZ39ByCRg4ibm=Mz+5LbLps77k9Vhb+c+VmVUO1=A@mail.gmail.com>
Subject: Re: [PATCH 4/4] x86: switch to cpu_feature_enabled() for X86_FEATURE_XENPV
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Pu Wen <puwen@hygon.cn>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 3, 2022 at 8:37 AM Juergen Gross <jgross@suse.com> wrote:
>
> Convert the remaining cases of static_cpu_has(X86_FEATURE_XENPV) and
> boot_cpu_has(X86_FEATURE_XENPV) to use cpu_feature_enabled(), allowing
> more efficient code in case the kernel is configured without
> CONFIG_XEN_PV.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/kernel/cpu/amd.c    | 2 +-
>  arch/x86/kernel/cpu/bugs.c   | 2 +-
>  arch/x86/kernel/cpu/hygon.c  | 2 +-
>  arch/x86/kernel/process_64.c | 4 ++--
>  arch/x86/kernel/topology.c   | 2 +-
>  arch/x86/mm/cpu_entry_area.c | 2 +-
>  6 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
> index 860b60273df3..697fe881e967 100644
> --- a/arch/x86/kernel/cpu/amd.c
> +++ b/arch/x86/kernel/cpu/amd.c
> @@ -985,7 +985,7 @@ static void init_amd(struct cpuinfo_x86 *c)
>                         set_cpu_cap(c, X86_FEATURE_3DNOWPREFETCH);
>
>         /* AMD CPUs don't reset SS attributes on SYSRET, Xen does. */
> -       if (!cpu_has(c, X86_FEATURE_XENPV))
> +       if (!cpu_feature_enabled(X86_FEATURE_XENPV))
>                 set_cpu_bug(c, X86_BUG_SYSRET_SS_ATTRS);
>
>         /*
> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> index da7c361f47e0..7f78e1527c5e 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -1302,7 +1302,7 @@ static enum spectre_v2_mitigation_cmd __init spectre_v2_parse_cmdline(void)
>                 return SPECTRE_V2_CMD_AUTO;
>         }
>
> -       if (cmd == SPECTRE_V2_CMD_IBRS && boot_cpu_has(X86_FEATURE_XENPV)) {
> +       if (cmd == SPECTRE_V2_CMD_IBRS && cpu_feature_enabled(X86_FEATURE_XENPV)) {
>                 pr_err("%s selected but running as XenPV guest. Switching to AUTO select\n",
>                        mitigation_options[i].option);
>                 return SPECTRE_V2_CMD_AUTO;
> diff --git a/arch/x86/kernel/cpu/hygon.c b/arch/x86/kernel/cpu/hygon.c
> index 21fd425088fe..1c27645fd429 100644
> --- a/arch/x86/kernel/cpu/hygon.c
> +++ b/arch/x86/kernel/cpu/hygon.c
> @@ -339,7 +339,7 @@ static void init_hygon(struct cpuinfo_x86 *c)
>         set_cpu_cap(c, X86_FEATURE_ARAT);
>
>         /* Hygon CPUs don't reset SS attributes on SYSRET, Xen does. */
> -       if (!cpu_has(c, X86_FEATURE_XENPV))
> +       if (!cpu_feature_enabled(X86_FEATURE_XENPV))
>                 set_cpu_bug(c, X86_BUG_SYSRET_SS_ATTRS);
>
>         check_null_seg_clears_base(c);
> diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
> index 6b3418bff326..e2f469175be8 100644
> --- a/arch/x86/kernel/process_64.c
> +++ b/arch/x86/kernel/process_64.c
> @@ -165,7 +165,7 @@ static noinstr unsigned long __rdgsbase_inactive(void)
>
>         lockdep_assert_irqs_disabled();
>
> -       if (!static_cpu_has(X86_FEATURE_XENPV)) {
> +       if (!cpu_feature_enabled(X86_FEATURE_XENPV)) {
>                 native_swapgs();
>                 gsbase = rdgsbase();
>                 native_swapgs();
> @@ -190,7 +190,7 @@ static noinstr void __wrgsbase_inactive(unsigned long gsbase)
>  {
>         lockdep_assert_irqs_disabled();
>
> -       if (!static_cpu_has(X86_FEATURE_XENPV)) {
> +       if (!cpu_feature_enabled(X86_FEATURE_XENPV)) {
>                 native_swapgs();
>                 wrgsbase(gsbase);
>                 native_swapgs();
> diff --git a/arch/x86/kernel/topology.c b/arch/x86/kernel/topology.c
> index 8617d1ed9d31..1b83377274b8 100644
> --- a/arch/x86/kernel/topology.c
> +++ b/arch/x86/kernel/topology.c
> @@ -106,7 +106,7 @@ int arch_register_cpu(int num)
>          * Xen PV guests don't support CPU0 hotplug at all.
>          */
>         if (c->x86_vendor != X86_VENDOR_INTEL ||
> -           boot_cpu_has(X86_FEATURE_XENPV))
> +           cpu_feature_enabled(X86_FEATURE_XENPV))
>                 cpu0_hotpluggable = 0;
>
>         /*
> diff --git a/arch/x86/mm/cpu_entry_area.c b/arch/x86/mm/cpu_entry_area.c
> index 6c2f1b76a0b6..c83799753d44 100644
> --- a/arch/x86/mm/cpu_entry_area.c
> +++ b/arch/x86/mm/cpu_entry_area.c
> @@ -147,7 +147,7 @@ static void __init setup_cpu_entry_area(unsigned int cpu)
>          * On Xen PV, the GDT must be read-only because the hypervisor
>          * requires it.
>          */
> -       pgprot_t gdt_prot = boot_cpu_has(X86_FEATURE_XENPV) ?
> +       pgprot_t gdt_prot = cpu_feature_enabled(X86_FEATURE_XENPV) ?
>                 PAGE_KERNEL_RO : PAGE_KERNEL;
>         pgprot_t tss_prot = PAGE_KERNEL;
>  #endif

This is another case that can be removed because it's for 32-bit.

--
Brian Gerst

