Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7F833092A
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 09:10:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94646.178211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJAxK-0006pM-5r; Mon, 08 Mar 2021 08:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94646.178211; Mon, 08 Mar 2021 08:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJAxK-0006p0-2e; Mon, 08 Mar 2021 08:09:34 +0000
Received: by outflank-mailman (input) for mailman id 94646;
 Mon, 08 Mar 2021 08:09:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJAxI-0006ov-G9
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 08:09:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3e9b325-d55d-4fc5-9d57-35da3c824e77;
 Mon, 08 Mar 2021 08:09:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7AFB0AC54;
 Mon,  8 Mar 2021 08:09:30 +0000 (UTC)
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
X-Inumbo-ID: c3e9b325-d55d-4fc5-9d57-35da3c824e77
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615190970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gyJPKbNrcaZkdN4OW2dJ9yfQSuqjDU+os+UZA9bWbok=;
	b=fyubqMpNStl60hoa6qgUebi/2Vn2xBCZmDpLeHlxmy98q/dA9QMRE+tp0wfuGnXfDsi8vS
	ZUrcPmot7kni+5R3WhGIFcFp9/BF12sEOzrM4QQx+nbZwqNsIsgrVmVcTWh4lVv4JDb9wC
	udUz+oqCIzUGFE5CC4s266e5w0YjK4I=
Subject: Re: [PATCH for-4.15] xen: Bump the minimum version of GCC supported
 to 4.9 (5.1 on arm64)
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210306214148.27021-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1897022d-7591-3450-4e57-884a2860b13d@suse.com>
Date: Mon, 8 Mar 2021 09:09:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210306214148.27021-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.03.2021 22:41, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Compilers older than 4.8 have known codegen issues which can lead to
> silent miscompilation:
> 
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145
> 
> Furthermore, pre-4.9 GCC have known bugs (including things like
> internal compiler errors on Arm) which would require workaround (I
> haven't checked if we have any in Xen).
> 
> The minimum version of GCC to build the hypervisor is now raised to 4.9.
> 
> In addition to that, on arm64, GCC version >= 4.9 and < 5.1 have been
> shown to emit memory references beyond the stack pointer, resulting in
> memory corruption if an interrupt is taken after the stack pointer has
> been adjusted but before the reference has been executed.
> 
> Therefore, the minimum for arm64 is raised to 5.1.

I'm sure newer compiler versions also have bugs. Therefore I'm not
convinced using this as the primary reason for a bump is enough.
Plus what if critical to us bugs get found in, say, 5.x? Are we
going to bump to 6.x then (and so on, until we allow only the most
recent major version to be used)?

Additionally - partly related to your own reply regarding the CI
failures - imo there needs to be an analysis of what older distros
will no longer build (at all or by default). We've been discussing
to bump minimum tool chain versions for a long time. At least as
far as I'm concerned, I didn't take on this job precisely because
the code changes needed are relatively simple, but justification
can (and apparently will) be rather complicated.

Fundamentally, whatever kind of criteria we use to justify the
bump now ought to be usable down the road by people justifying
further bumps.

Also - what about clang? Linux requires 10.0.1 as a minimum.

> ---
> 
> I don't have a strong opinion on the minimum version for GCC on x86.
> So this is following Andrew's suggestion and the minimum from Linux.
> 
> This patch is candidate to 4.15 and backport.

I think such a change needs to be proposed much earlier in a release
cycle.

> --- a/README
> +++ b/README
> @@ -38,12 +38,15 @@ provided by your OS distributor:
>      * GNU Make v3.80 or later
>      * C compiler and linker:
>        - For x86:
> -        - GCC 4.1.2_20070115 or later
> +        - GCC 4.9 or later
>          - GNU Binutils 2.16.91.0.5 or later

I don't think it makes much sense to keep the binutils version this
low, the more that I don't think we can really build (correctly)
with this old a version anymore. Whatever the gcc version chosen, I
think we want to pick a binutils version from about the same time
frame.

> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -5,6 +5,19 @@
>  #error Sorry, your compiler is too old/not recognized.
>  #endif
>  
> +#if CONFIG_CC_IS_GCC
> +# if CONFIG_GCC_VERSION < 40900
> +/* https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145 */

As per the bug report, the issue was determined to not be present
in e.g. 4.3. Hence while such a bug may influence our choice of
minimum version, I don't think it can reasonably be named here as
the apparent only reason for the choice. Personally I don't think
any justification should be put here.

> +#  error Sorry, your version of GCC is too old - please use 4.9 or newer.
> +# elif defined(CONFIG_ARM_64) && CONFIG_GCC_VERSION < 50100
> +/*
> + * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
> + * https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
> + */
> +#  error Sorry, your version of GCC is too old - please use 5.1 or newer.

From the bug entry the fix looks to have been backported to 4.9,
or at least some (important?) branches thereof.

> +# endif
> +#endif

Instead of a completely new conditional, I think this wants to be
combined with the existing one (the tail of which is visible in
context above).

Jan

