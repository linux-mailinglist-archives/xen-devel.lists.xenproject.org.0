Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B57D719BDB7
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 10:44:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJvPv-0001Rn-Th; Thu, 02 Apr 2020 08:41:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJvPu-0001Rg-Jk
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 08:41:38 +0000
X-Inumbo-ID: c425b0ce-74bd-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c425b0ce-74bd-11ea-83d8-bc764e2007e4;
 Thu, 02 Apr 2020 08:41:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C514BAFF5;
 Thu,  2 Apr 2020 08:41:36 +0000 (UTC)
Subject: Re: [PATCH v2] x86emul: suppress "not built" warning for test harness
 for run targets
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4c5af3e1-836f-4104-99a8-79755c8034e1@suse.com>
Message-ID: <3a0f9394-f7d1-94f0-4a81-6240f01348b8@suse.com>
Date: Thu, 2 Apr 2020 10:40:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <4c5af3e1-836f-4104-99a8-79755c8034e1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.03.2020 17:11, Jan Beulich wrote:
> The run* targets can be used to test whatever the tool chain is capable
> of building, as long as at least the main harness source file builds.
> Don't probe the tools chain, in particular to avoid issuing the warning,
> in this case. While looking into this I also noticed the wording of the
> respective comment isn't quite right, which therefore gets altered at
> the same time.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I guess this is simple enough a change that I'll commit it early
next week, unless I hear otherwise till then.

Jan

> ---
> v2: Also suppress the compiler/assembler probing in this case.
> 
> --- a/tools/tests/x86_emulator/Makefile
> +++ b/tools/tests/x86_emulator/Makefile
> @@ -97,11 +97,13 @@ avx512dq-opmask-vecs := 1 2
>  avx512bw-opmask-vecs := 4 8
>  
>  # Suppress building by default of the harness if the compiler can't deal
> -# with any of the extensions used.  Don't alter the "run" target dependencies
> +# with some of the extensions used.  Don't alter the "run" target dependencies
>  # though, as this target needs to be specified manually, and things may work
>  # partially even with older compilers.
>  TARGET-y := $(TARGET)
>  
> +ifeq ($(filter run%,$(MAKECMDGOALS)),)
> +
>  define simd-check-cc
>  TARGET-$(shell echo 'int i;' | $(CC) -x c -c -o /dev/null -m$(1) - || echo y) :=
>  endef
> @@ -116,6 +118,8 @@ ifeq ($(TARGET-y),)
>  $(warning Test harness not built, use newer compiler than "$(CC)" (version $(shell $(CC) -dumpversion)) and an "{evex}" capable assembler)
>  endif
>  
> +endif
> +
>  all: $(TARGET-y)
>  
>  # For AVX and later, have the compiler avoid XMM0 to widen coverage of

