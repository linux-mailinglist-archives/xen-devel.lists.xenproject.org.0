Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB35986647
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 20:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804502.1215509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stWl8-0002E0-6i; Wed, 25 Sep 2024 18:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804502.1215509; Wed, 25 Sep 2024 18:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stWl8-0002Bq-3p; Wed, 25 Sep 2024 18:29:06 +0000
Received: by outflank-mailman (input) for mailman id 804502;
 Wed, 25 Sep 2024 18:27:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N/+G=QX=gentwo.org=cl@srs-se1.protection.inumbo.net>)
 id 1stWjz-0001Jo-ES
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 18:27:55 +0000
Received: from gentwo.org (gentwo.org [62.72.0.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e040eb07-7b6b-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 20:27:53 +0200 (CEST)
Received: by gentwo.org (Postfix, from userid 1003)
 id 70FD5401C7; Wed, 25 Sep 2024 10:56:38 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
 by gentwo.org (Postfix) with ESMTP id 6F6F0401C6;
 Wed, 25 Sep 2024 10:56:38 -0700 (PDT)
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
X-Inumbo-ID: e040eb07-7b6b-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1727286998;
	bh=JzQWbfOrfYxZbx1u+F5TLFsCW+d1dC/t+zlnRXg1aTo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ENf3gmdNOzt5kB/scKgyNgokVg82OzC76ZN4/YF8VlUv1bRir3KWi37eV+i/D7Xez
	 Z5XbR4kUlSRyKbxlzzZRLBN7clHZ2LO2BU5gH0H7RQVCi6hfAu+SXyoqfJtQRocwP3
	 D9Ah5X6dCKhSwWEojhc0qMzPTKaZpdvB/V2zxYX8=
Date: Wed, 25 Sep 2024 10:56:38 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Ard Biesheuvel <ardb+git@google.com>
cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
    x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
    Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
    Uros Bizjak <ubizjak@gmail.com>, Dennis Zhou <dennis@kernel.org>, 
    Tejun Heo <tj@kernel.org>, 
    Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, 
    Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
    Keith Packard <keithp@keithp.com>, Justin Stitt <justinstitt@google.com>, 
    Josh Poimboeuf <jpoimboe@kernel.org>, 
    Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
    Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
    Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
    linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
    xen-devel@lists.xenproject.org, linux-efi@vger.kernel.org, 
    linux-arch@vger.kernel.org, linux-sparse@vger.kernel.org, 
    linux-kbuild@vger.kernel.org, linux-perf-users@vger.kernel.org, 
    rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [RFC PATCH 06/28] x86/percpu: Get rid of absolute per-CPU variable
 placement
In-Reply-To: <20240925150059.3955569-36-ardb+git@google.com>
Message-ID: <c4bc67dd-2a42-b318-7830-6741e3579775@gentwo.org>
References: <20240925150059.3955569-30-ardb+git@google.com> <20240925150059.3955569-36-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Sep 2024, Ard Biesheuvel wrote:

> The x86_64 approach was needed to accommodate per-task stack protector
> cookies, which used to live at a fixed offset of GS+40, requiring GS to
> be treated as a base register. This is no longer the case, though, and
> so GS can be repurposed as a true per-CPU offset, adopting the same
> strategy as other architectures.
>
> This also removes the need for linker tricks to emit the per-CPU ELF
> segment at a different virtual address. It also means RIP-relative
> per-CPU variables no longer need to be relocated in the opposite
> direction when KASLR is applied, which was necessary because the 0x0
> based per-CPU region remains in place even when the kernel is moved
> around.

Looks like a good cleanup. Hope it does not break anything that relies on
structures %GS points to.

Reviewed-by: Christoph Lameter <cl@linux.com>

