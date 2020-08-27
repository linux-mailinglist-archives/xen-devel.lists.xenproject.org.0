Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 825542542EF
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 11:59:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBEgp-0001fO-Cs; Thu, 27 Aug 2020 09:59:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o8NI=CF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kBEgo-0001fI-Lr
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 09:59:26 +0000
X-Inumbo-ID: e58c6742-f9bd-401c-9fa0-8a890878ea84
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e58c6742-f9bd-401c-9fa0-8a890878ea84;
 Thu, 27 Aug 2020 09:59:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E5C74AD72;
 Thu, 27 Aug 2020 09:59:56 +0000 (UTC)
Subject: Re: gcc10 build issue for Arm64
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <be061c98-fad9-c8c0-a858-a65e08fe10ed@suse.com>
 <e3309b1e-ae4c-bef0-ea1a-e555db35c27e@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5d1e22b0-25a1-4618-fa8b-a2ea5bbbcdf6@suse.com>
Date: Thu, 27 Aug 2020 11:59:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <e3309b1e-ae4c-bef0-ea1a-e555db35c27e@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.08.2020 11:11, Julien Grall wrote:
> On 27/08/2020 09:01, Jan Beulich wrote:
>> Stefano, Julien,
> 
> Hi Jan,
> 
>> since it was touching code potentially also affecting Arm, prior
>> to my push of a couple of commits a few minutes ago I also wanted
>> to build-test Arm. While as a fallback all went well with gcc
>> 9.3, with my first (default) attempt with 10.2 I ran into
>>
>> ld: prelink.o: in function `_spin_lock_cb':
>> /build/xen/staging-arm64/xen/common/spinlock.c:164: undefined reference to `__aarch64_ldadd4_acq_rel'
>> ld: /build/xen/staging-arm64/xen/common/spinlock.c:164: undefined reference to `__aarch64_ldadd4_acq_rel'
>> make[3]: *** [/build/xen/staging-arm64/xen/xen-syms] Error 1
>> make[2]: *** [/build/xen/staging-arm64/xen/xen] Error 2
>> make[1]: *** [install] Error 2
>> make: *** [install-xen] Error 2
>>
>> I have no idea how recent the introduction of the issue is, but
>> I hope you'll be able to pinpoint the offending change (and a
>> possible fix) much easier than I would be.
> 
> It looks like GCC10 will outline atomic helpers by default. The 
> following hack will do the trick:
> 
> diff --git a/xen/arch/arm/Rules.mk b/xen/arch/arm/Rules.mk
> index e69de29bb2..8dfd9713af 100644
> --- a/xen/arch/arm/Rules.mk
> +++ b/xen/arch/arm/Rules.mk
> @@ -0,0 +1 @@
> +c_flags+=-mno-outline-atomics
> 
> I will clean it up to check it also works with older GCC.

Ah. The option at least is not documented for gcc9. I also think
its (conditional) addition belongs in arch.mk, not Rules.mk,
judging from how it gets done on x86. But I guess sorting this
was meant to be part of your "cleaning it up".

Jan

