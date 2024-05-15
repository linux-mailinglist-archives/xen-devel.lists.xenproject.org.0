Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B48468C6F11
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 01:18:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722665.1126836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Nsd-0008EI-8U; Wed, 15 May 2024 23:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722665.1126836; Wed, 15 May 2024 23:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Nsd-0008CO-5t; Wed, 15 May 2024 23:17:51 +0000
Received: by outflank-mailman (input) for mailman id 722665;
 Wed, 15 May 2024 23:17:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kF2M=MS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7Nsc-0008CI-BT
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 23:17:50 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56ea886b-1311-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 01:17:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 03A87CE17FC;
 Wed, 15 May 2024 23:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E88C116B1;
 Wed, 15 May 2024 23:17:41 +0000 (UTC)
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
X-Inumbo-ID: 56ea886b-1311-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715815063;
	bh=lk9gQmDGPeoyLQma8nQqXia3ZfDePyKZ/vakkk79Nag=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=coc6ix9srwRSIn78ao3hTZZFlaFZOKbMfDhBVCquBz/g/AThDNYOxx9LXrIyNHExc
	 PDeq9HtX4mMH5MrGg9Kp43brgEWzkoXdWPHIEf7AOaRqap69URBKBTgwe0xzzhxLKj
	 WLARO8TbtcftDoQsp4hwHSliqJxViKFwIdb2e/IVS0ZwxgbIfU5k4zb2gxUUIzy7Za
	 kBOX77mdc7pUikvlSg4fToODyNE4buVQXLfz9N8vwSAuVbddZ/Yt1r71kn8U5ZfkIz
	 RkhpPKfOcJbqnQ8nW/H2/VG5kABtFu9YXdzJUKtcsgE0472pWYmgCzxj3yxG0LsuQO
	 DUy4cAmVlbxqg==
Date: Wed, 15 May 2024 16:17:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH 1/4] x86/vpmu: address violations of MISRA C Rule
 20.7
In-Reply-To: <ecba64bb8295fa27f0ddbb0905b0983a3572b1ae.1715757982.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2405151617240.2544314@ubuntu-linux-20-04-desktop>
References: <cover.1715757982.git.nicola.vetrini@bugseng.com> <ecba64bb8295fa27f0ddbb0905b0983a3572b1ae.1715757982.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  xen/arch/x86/cpu/vpmu_amd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
> index db2fa420e14a..97e6315bd9f7 100644
> --- a/xen/arch/x86/cpu/vpmu_amd.c
> +++ b/xen/arch/x86/cpu/vpmu_amd.c
> @@ -25,8 +25,8 @@
>  
>  #define is_guest_mode(msr) ((msr) & (1ULL << MSR_F10H_EVNTSEL_GO_SHIFT))
>  #define is_pmu_enabled(msr) ((msr) & (1ULL << MSR_F10H_EVNTSEL_EN_SHIFT))
> -#define set_guest_mode(msr) (msr |= (1ULL << MSR_F10H_EVNTSEL_GO_SHIFT))
> -#define is_overflowed(msr) (!((msr) & (1ULL << (MSR_F10H_COUNTER_LENGTH-1))))
> +#define set_guest_mode(msr) ((msr) |= (1ULL << MSR_F10H_EVNTSEL_GO_SHIFT))
> +#define is_overflowed(msr) (!((msr) & (1ULL << (MSR_F10H_COUNTER_LENGTH - 1))))

is_overflowed is just a cosmetic change

