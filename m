Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA35A98B551
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 09:19:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807762.1219400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svX9l-0005d3-Sb; Tue, 01 Oct 2024 07:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807762.1219400; Tue, 01 Oct 2024 07:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svX9l-0005ae-Pq; Tue, 01 Oct 2024 07:18:49 +0000
Received: by outflank-mailman (input) for mailman id 807762;
 Tue, 01 Oct 2024 07:18:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbpD=Q5=kernel.org=jpoimboe@srs-se1.protection.inumbo.net>)
 id 1svX9k-0005aY-G8
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 07:18:48 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 656c3fe1-7fc5-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 09:18:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BCA82A418C7;
 Tue,  1 Oct 2024 07:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A764C4CEC6;
 Tue,  1 Oct 2024 07:18:43 +0000 (UTC)
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
X-Inumbo-ID: 656c3fe1-7fc5-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727767124;
	bh=THnBpzHxCYIjdDtD+X6PsiIrzTiH+/AUT0R8bh8DnZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h6hjsjhGiADhlEEyGcXO6Vn/U+HfO58lVjBiMdO8Rh1hG0Kwr+B3a+z+ZWeM46Nd2
	 cItPv6ENWSWMQ0EAZ+mfPykG1Z/dv4OqNqcdt+yMlbCd69OnjWC/b5VcZrbXCaSBxH
	 guR9eCirZTNct+9JbfDvcpeauWqAWJTLcWWKP93JPyHhe3mPaNzJCsmRSftnLrhzXA
	 NHzqwCqh/jeM5MxuBxi9N0MWlSF0ed2poDEBcOWpsi8qnrt1reKFuPIVx0Ck0B2F2W
	 JKPrHaJBDmNfjgf6moEX5kDawn6X99emoE1WKhyjmo6Jyj+hnfFNqmQLJMNScwlgJ+
	 v0Sdps/sNMDIA==
Date: Tue, 1 Oct 2024 00:18:41 -0700
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
Subject: Re: [RFC PATCH 24/28] tools/objtool: Treat indirect ftrace calls as
 direct calls
Message-ID: <20241001071841.yrc7cxdp2unnzju7@treble>
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-54-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240925150059.3955569-54-ardb+git@google.com>

On Wed, Sep 25, 2024 at 05:01:24PM +0200, Ard Biesheuvel wrote:
> +		if (insn->type == INSN_CALL_DYNAMIC) {
> +			if (!reloc)
> +				continue;
> +
> +			/*
> +			 * GCC 13 and older on x86 will always emit the call to
> +			 * __fentry__ using a relaxable GOT-based symbol
> +			 * reference when operating in PIC mode, i.e.,
> +			 *
> +			 *   call   *0x0(%rip)
> +			 *             R_X86_64_GOTPCRELX  __fentry__-0x4
> +			 *
> +			 * where it is left up to the linker to relax this into
> +			 *
> +			 *   call   __fentry__
> +			 *   nop
> +			 *
> +			 * if __fentry__ turns out to be DSO local, which is
> +			 * always the case for vmlinux. Given that this
> +			 * relaxation is mandatory per the x86_64 psABI, these
> +			 * calls can simply be treated as direct calls.
> +			 */
> +			if (arch_ftrace_match(reloc->sym->name)) {
> +				insn->type = INSN_CALL;
> +				add_call_dest(file, insn, reloc->sym, false);
> +			}

Can the compiler also do this for non-fentry direct calls?  If so would
it make sense to generalize this by converting all
INSN_CALL_DYNAMIC+reloc to INSN_CALL?

And maybe something similar for add_jump_destinations().

-- 
Josh

