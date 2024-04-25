Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA398B2D65
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 01:01:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712315.1112926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s085Z-0003i6-B2; Thu, 25 Apr 2024 23:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712315.1112926; Thu, 25 Apr 2024 23:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s085Z-0003fF-8S; Thu, 25 Apr 2024 23:01:13 +0000
Received: by outflank-mailman (input) for mailman id 712315;
 Thu, 25 Apr 2024 23:01:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N29f=L6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s085X-0003f9-I8
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 23:01:11 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b319c927-0357-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 01:01:09 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D8A37CE1669;
 Thu, 25 Apr 2024 23:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E8EC113CC;
 Thu, 25 Apr 2024 23:01:01 +0000 (UTC)
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
X-Inumbo-ID: b319c927-0357-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714086062;
	bh=7btQZK4fjzA9h4h1lVQtDrsRzYcZMgFqOwA72nczxEY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=av8NFBFA+q6GsUJRedUso4GB+13pxOt8I1LPMVTGzaMxVmABRkc0/DlEhY142ekYY
	 p1Lcp/u4UeRvGLLZXb++xK/jTjHircJimCLmC64fduLaaho3HS4o5YIlZHxfcfMwPO
	 dmGqocWI+ApsTrV7XJFkmNTC3MEtvfmpzQQC5eds3DvZrimJPDHssyNklYJK7aUfwf
	 5XrWlGoImoY6+qjmbmjdN8zHwsHAL6Nw5dvIz5A5DX0oPjsdM6DD0gDkf4mPnjtco5
	 35MSAZh5S7ltYJz+/ocKuzUSvCDmhsve3ocPJ8vGp7SUOBE6WUdgMVb+5C89rqVRw/
	 +LH1Mr/hgPzIA==
Date: Thu, 25 Apr 2024 16:01:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen: Use -Wuninitialized and -Winit-self
In-Reply-To: <20231228193907.3052681-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2404251600460.3940@ubuntu-linux-20-04-desktop>
References: <20231228193907.3052681-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-78255055-1714086054=:3940"
Content-ID: <alpine.DEB.2.22.394.2404251600590.3940@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-78255055-1714086054=:3940
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2404251600591.3940@ubuntu-linux-20-04-desktop>

On Thu, 28 Dec 2023, Andrew Cooper wrote:
> The use of uninitialised data is undefined behaviour.  At -O2 with trivial
> examples, both Clang and GCC delete the variable, and in the case of a
> function return, the caller gets whatever was stale in %rax prior to the call.
> 
> Clang includes -Wuninitialized within -Wall, but GCC only includes it in
> -Wextra, which is not used by Xen at this time.
> 
> Furthermore, the specific pattern of assigning a variable to itself in its
> declaration is only diagnosed by GCC with -Winit-self.  Clang does diagnoise
> simple forms of this pattern with a plain -Wuninitialized, but it fails to
> diagnose the instances in Xen that GCC manages to find.
> 
> GCC, with -Wuninitialized and -Winit-self notices:
> 
>   arch/x86/time.c: In function ‘read_pt_and_tsc’:
>   arch/x86/time.c:297:14: error: ‘best’ is used uninitialized in this function [-Werror=uninitialized]
>     297 |     uint32_t best = best;
>         |              ^~~~
>   arch/x86/time.c: In function ‘read_pt_and_tmcct’:
>   arch/x86/time.c:1022:14: error: ‘best’ is used uninitialized in this function [-Werror=uninitialized]
>    1022 |     uint64_t best = best;
>         |              ^~~~
> 
> and both have logic paths where best can be returned while uninitalised.  In
> both cases, initialise to ~0 like the associated *_min variable which also
> gates updating best.
> 
> Fixes: 23658e823238 ("x86/time: further improve TSC / CPU freq calibration accuracy")
> Fixes: 3f3906b462d5 ("x86/APIC: calibrate against platform timer when possible")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-78255055-1714086054=:3940--

