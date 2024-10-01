Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 125CE98C767
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 23:14:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808514.1220421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svkBk-000603-LE; Tue, 01 Oct 2024 21:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808514.1220421; Tue, 01 Oct 2024 21:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svkBk-0005xF-Ic; Tue, 01 Oct 2024 21:13:44 +0000
Received: by outflank-mailman (input) for mailman id 808514;
 Tue, 01 Oct 2024 21:13:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NDke=Q5=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1svkBi-0005x9-5m
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 21:13:42 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0617c413-803a-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 23:13:39 +0200 (CEST)
Received: from [172.27.3.244] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 491LD64E3981901
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Tue, 1 Oct 2024 14:13:06 -0700
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
X-Inumbo-ID: 0617c413-803a-11ef-99a2-01e77a169b0f
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 491LD64E3981901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2024091601; t=1727817189;
	bh=wg2nnHYJORGEr++gsU/2zXcuEVhCMPKS9pnMCvzGs8c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fFyy47TSOntzOAbS8blAkeCl3x/YS5bSFuROsOg+3vqmY7On1biRz2UTqs/9m38X8
	 nRscKmyWainHTfaY3YP7t1lB5f0PwyK8Aa8UwTBK3xVt41BmFDAR0Um12z0DGAw83q
	 rwR5I38BRHrDozoz5SrS6vamdT7nw+/vhni+WCK/fVluUznobKmjSIoBtoiVawRvP+
	 PUadiCuuNcRhOsdYeao3WLhh4ZW9WjTBE8wKA16DWrk/uqHDWUrIlDPNYSPdY4zgNa
	 7+S7kpQ6qLWXT6nHjxx8l5aWS59Y1Fee+kpF52DDp2Ey5vGtIiW4dMiN+Lin831+/a
	 7/yrVpIWWLvhA==
Message-ID: <99446363-152f-43a8-8b74-26f0d883a364@zytor.com>
Date: Tue, 1 Oct 2024 14:13:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky
 <boris.ostrovsky@oracle.com>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Keith Packard <keithp@keithp.com>,
        Justin Stitt <justinstitt@google.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
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
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-55-ardb+git@google.com>
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20240925150059.3955569-55-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/24 08:01, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> As an intermediate step towards enabling PIE linking for the 64-bit x86
> kernel, enable PIE codegen for all objects that are linked into the
> kernel proper.
> 
> This substantially reduces the number of relocations that need to be
> processed when booting a relocatable KASLR kernel.
> 

This really seems like going completely backwards to me.

You are imposing a more restrictive code model on the kernel, optimizing 
for boot time in a way that will exert a permanent cost on the running 
kernel.

There is a *huge* difference between the kernel and user space here:

KERNEL MEMORY IS PERMANENTLY ALLOCATED, AND IS NEVER SHARED.

Dirtying user pages requires them to be unshared and dirty, which is 
undesirable. Kernel pages are *always* unshared and dirty.

> It also brings us much closer to the ordinary PIE relocation model used
> for most of user space, which is therefore much better supported and
> less likely to create problems as we increase the range of compilers and
> linkers that need to be supported.

We have been resisting *for ages* making the kernel worse to accomodate 
broken compilers. We don't "need" to support more compilers -- we need 
the compilers to support us. We have working compilers; any new compiler 
that wants to play should be expected to work correctly.

	-hpa


