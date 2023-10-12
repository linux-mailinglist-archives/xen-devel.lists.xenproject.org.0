Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9977C7A4B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 01:18:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616181.957996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr4wp-0002VA-8I; Thu, 12 Oct 2023 23:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616181.957996; Thu, 12 Oct 2023 23:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr4wp-0002T5-5L; Thu, 12 Oct 2023 23:18:31 +0000
Received: by outflank-mailman (input) for mailman id 616181;
 Thu, 12 Oct 2023 23:18:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/p7=F2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qr4wo-0002Ss-7l
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 23:18:30 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a68fcc8d-6955-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 01:18:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 0732AB8255D;
 Thu, 12 Oct 2023 23:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5315C433C7;
 Thu, 12 Oct 2023 23:18:25 +0000 (UTC)
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
X-Inumbo-ID: a68fcc8d-6955-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697152707;
	bh=RNbeHdFYmN2Ty67seD4QDjrA0iDPYED9IsO+LTFo8dM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M0Csb0H7CU4m5HRTYMeCICwS4NoijUNYhzYv/md7vlC3LPCZ/QCzMzEI4ojXKSiSR
	 3kDo4zQkrSS0KLPcAqk94gxhiweKJka62poY2uwzwcZTwoF4GQ9fWHhbHzeBG92M+E
	 lQs3QWVHL6Opqp+D/PZc8zmlxaYexobRbCGahZXkdcgeLQN7dSOGZtdsbxJ6a1LGJi
	 r2GwA0AgS4hKQ7xhodp1ruJZJDdUiKQk3UY87F5VwtlfSmp/aKZXedstiTjkd7AXf7
	 mEIdE904UWxKUCa1ih6HWP1BJILh1cVYn4mevtMnknuM6SLJGr2kFIVnFEAFPDaICZ
	 nGIlBZQkZxnhw==
Date: Thu, 12 Oct 2023 16:18:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19] xen/include: make enum perfcounter
 anonymous
In-Reply-To: <d739fefde6f142cec10899ed2c5eb81f91618bf0.1697028983.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310121618150.3431292@ubuntu-linux-20-04-desktop>
References: <d739fefde6f142cec10899ed2c5eb81f91618bf0.1697028983.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Oct 2023, Nicola Vetrini wrote:
> Using enumerators declared in a named enum, such as the one modified,
> as operands to arithmetic operators is not allowed by MISRA C:2012 Rule 10.1.
> The enumerators of an anonymous enum can be used instead.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> This violation manifeststs itself, for instance, in all uses of macro
> 'perfc_incra' from xen/include/xen/perfc.h, because the expansion
> contains an arithmetic operation on two enum constants from enum perfcounter.
> 
> ( (*nr) <= PERFC_LAST_hypercalls - PERFC_hypercalls ?  [...]
> 
> ---
>  docs/misra/rules.rst    | 3 +++
>  xen/include/xen/perfc.h | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 3139ca7ae6dd..26c3ff819948 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -341,6 +341,9 @@ maintainers if you want to suggest a change.
>             compilers' extensions)
>           - Implicit conversions to boolean for conditionals (?: if while
>             for) and logical operators (! || &&)
> +         - The essential type model allows the constants defined by anonymous
> +           enums (e.g., enum { A, B, C }) to be used as operands to arithmetic
> +           operators, as they have a signed essential type.
> 
>     * - `Rule 10.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_10_02.c>`_
>       - Required
> diff --git a/xen/include/xen/perfc.h b/xen/include/xen/perfc.h
> index 7c5ce537bd02..96022c07481e 100644
> --- a/xen/include/xen/perfc.h
> +++ b/xen/include/xen/perfc.h
> @@ -39,7 +39,7 @@
>  #define PERFSTATUS       PERFCOUNTER
>  #define PERFSTATUS_ARRAY PERFCOUNTER_ARRAY
> 
> -enum perfcounter {
> +enum {
>  #include <xen/perfc_defn.h>
>  	NUM_PERFCOUNTERS
>  };
> --
> 2.34.1
> 

