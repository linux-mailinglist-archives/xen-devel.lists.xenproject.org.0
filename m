Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D211998B3AF
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 07:33:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807711.1219331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svVVo-00068T-42; Tue, 01 Oct 2024 05:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807711.1219331; Tue, 01 Oct 2024 05:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svVVo-00065S-0P; Tue, 01 Oct 2024 05:33:28 +0000
Received: by outflank-mailman (input) for mailman id 807711;
 Tue, 01 Oct 2024 05:33:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbpD=Q5=kernel.org=jpoimboe@srs-se1.protection.inumbo.net>)
 id 1svVVm-00065L-Hh
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 05:33:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acecdf87-7fb6-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 07:33:24 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3C7E15C43EF;
 Tue,  1 Oct 2024 05:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746B3C4CEC6;
 Tue,  1 Oct 2024 05:33:20 +0000 (UTC)
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
X-Inumbo-ID: acecdf87-7fb6-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727760801;
	bh=ALkA67D2rrKVC3yq6JegYHLnnbAgFq9HD2IAj9UHyx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kaVQMaga3ThzkwWDWuQk6rDB3RSXwRBcTwVGj8nhKaCxd8DGvY0nFCd3IYRsTljub
	 AZKP4ayTicXJrMtWGj3619WfldHuCsfWcGmrgx6E5KyTalkkIaPvDa79j8IX7+KCf9
	 tyL1xiG/I6r77qcfTBBo8IHr09HTVxQ5ElVlGqCP6PER85aneiWgpkfNVBK7/pOc2d
	 0IB7OJr+GBkkTfq3dlA5pz5ppoFJHfbV+YEe6fDprG8RfaDEijzbt4+Mc2WLN9Cu7U
	 G+M9qW3AxZz15VbiWMQ7LPrCzm4ijKVB3gpMkuSL/R/mT8sVLa15UwdAicPRjd0T7A
	 AapjojwaZZpvA==
Date: Mon, 30 Sep 2024 22:33:18 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Uros Bizjak <ubizjak@gmail.com>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Keith Packard <keithp@keithp.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-efi@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-sparse@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-perf-users@vger.kernel.org,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [RFC PATCH 04/28] x86/boot: Permit GOTPCREL relocations for
 x86_64 builds
Message-ID: <20241001053318.elfwwiyluw6rlynz@treble>
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-34-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240925150059.3955569-34-ardb+git@google.com>

On Wed, Sep 25, 2024 at 05:01:04PM +0200, Ard Biesheuvel wrote:
> +		if (r_type == R_X86_64_GOTPCREL) {
> +			Elf_Shdr *s = &secs[sec->shdr.sh_info].shdr;
> +			unsigned file_off = offset - s->sh_addr + s->sh_offset;
> +
> +			/*
> +			 * GOTPCREL relocations refer to instructions that load
> +			 * a 64-bit address via a 32-bit relative reference to
> +			 * the GOT.  In this case, it is the GOT entry that
> +			 * needs to be fixed up, not the immediate offset in
> +			 * the opcode. Note that the linker will have applied an
> +			 * addend of -4 to compensate for the delta between the
> +			 * relocation offset and the value of RIP when the
> +			 * instruction executes, and this needs to be backed out
> +			 * again. (Addends other than -4 are permitted in
> +			 * principle, but make no sense in practice so they are
> +			 * not supported.)
> +                         */
> +			if (rel->r_addend != -4) {
> +				die("invalid addend (%ld) for %s relocation: %s\n",
> +				    rel->r_addend, rel_type(r_type), symname);
> +				break;
> +			}

For x86 PC-relative addressing, the addend is <reloc offset> -
<subsequent insn offset>.  So a PC-relative addend can be something
other than -4 when the relocation applies to the middle of an
instruction, e.g.:

   5b381:	66 81 3d 00 00 00 00 01 06 	cmpw   $0x601,0x0(%rip)        # 5b38a <generic_validate_add_page+0x4a>	5b384: R_X86_64_PC32	boot_cpu_data-0x6

   5f283:	81 3d 00 00 00 00 ff ff ff 00 	cmpl   $0xffffff,0x0(%rip)        # 5f28d <x86_acpi_suspend_lowlevel+0x9d>	5f285: R_X86_64_PC32	smpboot_control-0x8

   72f67:       c6 05 00 00 00 00 01    movb   $0x1,0x0(%rip)        # 72f6e <sched_itmt_update_handler+0x6e>   72f69: R_X86_64_PC32    x86_topology_update-0x5

Presumably that could also happen with R_X86_64_GOTPCREL?

-- 
Josh

