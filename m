Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D7376A3EB
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 00:11:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573490.898245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQb6R-00081O-0C; Mon, 31 Jul 2023 22:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573490.898245; Mon, 31 Jul 2023 22:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQb6Q-0007zV-SV; Mon, 31 Jul 2023 22:10:58 +0000
Received: by outflank-mailman (input) for mailman id 573490;
 Mon, 31 Jul 2023 22:10:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Zpc=DR=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1qQb6P-0007zP-S9
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 22:10:57 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d47b5ca-2fef-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 00:10:55 +0200 (CEST)
Received: from [192.168.105.249] ([75.104.94.137]) (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 36VM7txf3103048
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 31 Jul 2023 15:08:00 -0700
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
X-Inumbo-ID: 1d47b5ca-2fef-11ee-8613-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 36VM7txf3103048
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023071101; t=1690841375;
	bh=X+M4w9IgqyGhFftvL0ts+Txt2pH1wocbrviAaT7WSp0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XFcw8mHtRsl4TcZ5Z+9TuwZ7pfjvdNqSpwDLDpFsAfd/pRi+FbwrTEcqslERWxffC
	 cgFKch7rqXk7xeaKLgEYkT1cKGAy6lNFxl6xQJ0fbNDJ7sv9zpYGWXBRa8N2lEo5DR
	 G/GCfDVd/qzoFF9SUxuA7hRU/ROGNY4q6TBtRqRfJXYuVJskDXCrkKAQal43XsJ7PX
	 PlycbEss3tGY6NKNX7yE7ihX3QPEQjBg9VfjApas+qZFkVyB7AoO2WWrlZ+j8SXiEq
	 CQq7y33RknpAiyzIOPtVrS0p+SqzFZP4pjxOjHk1xtmUQ70RjsXjOD9F2NjeIVYHD8
	 KsFoANCn7EDLw==
Message-ID: <da169e64-9dad-18a8-611b-57ff74006285@zytor.com>
Date: Mon, 31 Jul 2023 15:07:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v9 29/36] x86/fred: FRED entry/exit and dispatch code
Content-Language: en-US
To: Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org
Cc: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
        Tony Luck <tony.luck@intel.com>,
        "K . Y . Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
        Dexuan Cui <decui@microsoft.com>, Paolo Bonzini <pbonzini@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        "Paul E . McKenney"
 <paulmck@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Kim Phillips <kim.phillips@amd.com>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>,
        "Liam R . Howlett" <Liam.Howlett@Oracle.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Jiaxi Chen <jiaxi.chen@linux.intel.com>,
        Babu Moger <babu.moger@amd.com>, Jim Mattson <jmattson@google.com>,
        Sandipan Das <sandipan.das@amd.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Daniel Sneddon <daniel.sneddon@linux.intel.com>,
        Breno Leitao <leitao@debian.org>, Nikunj A Dadhania <nikunj@amd.com>,
        Brian Gerst <brgerst@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Alexander Potapenko <glider@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Kees Cook <keescook@chromium.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>, Ze Gao <zegao2021@gmail.com>,
        Fei Li <fei1.li@intel.com>, Conghui <conghui.chen@intel.com>,
        Ashok Raj <ashok.raj@intel.com>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Jane Malalane <jane.malalane@citrix.com>,
        David Woodhouse
 <dwmw@amazon.co.uk>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Yantengsi
 <siyanteng@loongson.cn>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Sathvika Vasireddy <sv@linux.ibm.com>
References: <20230731064119.3870-1-xin3.li@intel.com>
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20230731064119.3870-1-xin3.li@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/23 23:41, Xin Li wrote:
> +static DEFINE_FRED_HANDLER(fred_other_default)
> +{
> +	regs->vector = X86_TRAP_UD;
> +	fred_emulate_fault(regs);
> +}
> +
> +static DEFINE_FRED_HANDLER(fred_syscall)
> +{
> +	regs->orig_ax = regs->ax;
> +	regs->ax = -ENOSYS;
> +	do_syscall_64(regs, regs->orig_ax);
> +}
> +
> +#if IS_ENABLED(CONFIG_IA32_EMULATION)
> +/*
> + * Emulate SYSENTER if applicable. This is not the preferred system
> + * call in 32-bit mode under FRED, rather int $0x80 is preferred and
> + * exported in the vdso.
> + */
> +static DEFINE_FRED_HANDLER(fred_sysenter)
> +{
> +	regs->orig_ax = regs->ax;
> +	regs->ax = -ENOSYS;
> +	do_fast_syscall_32(regs);
> +}
> +#else
> +#define fred_sysenter fred_other_default
> +#endif
> +
> +static DEFINE_FRED_HANDLER(fred_other)
> +{
> +	static const fred_handler user_other_handlers[FRED_NUM_OTHER_VECTORS] =
> +	{
> +		/*
> +		 * Vector 0 of the other event type is not used
> +		 * per FRED spec 5.0.
> +		 */
> +		[0]		= fred_other_default,
> +		[FRED_SYSCALL]	= fred_syscall,
> +		[FRED_SYSENTER]	= fred_sysenter
> +	};
> +
> +	user_other_handlers[regs->vector](regs);
> +}

OK, this is wrong.

Dispatching like fred_syscall() is only valid for syscall64, which means 
you have to check regs->l is set in addition to the correct regs->vector 
to determine validity.

Similarly, sysenter is only valid if regs->l is clear.

The best way is probably to drop the dispatch table here and just do an 
if ... else if ... else statement; gcc is smart enough that it will 
combine the vector test and the L bit test into a single mask and 
compare. This also allows stubs to be inlined.

However, emulating #UD on events other than wrong mode of SYSCALL and 
SYSENTER may be a bad idea. It would probably be better to invoke 
fred_bad_event() in that case.

Something like this:

+static DEFINE_FRED_HANDLER(fred_other_default)
+{
+	regs->vector = X86_TRAP_UD;
+	fred_emulate_fault(regs);
+}

1) rename this to fred_emulate_ud (since that is what it actually does.)

... then ...

	/* The compiler can fold these into a single test */

	if (likely(regs->vector == FRED_SYSCALL && regs->l)) {
		fred_syscall64(regs);
	} else if (likely(regs->vector == FRED_SYSENTER && !regs->l)) {
		fred_sysenter32(regs);
	} else if (regs->vector == FRED_SYSCALL ||
		   regs->vector == FRED_SYSENTER) {
		/* Invalid SYSCALL or SYSENTER instruction */
		fred_emulate_ud(regs);
	} else {
		/* Unknown event */
		fred_bad_event(regs);
	}

... or the SYSCALL64 and SYSENTER32 can be inlined with the appropriate 
comment (gcc will do so regardless.)

	-hpa



	-hpa

