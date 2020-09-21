Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC642272676
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 16:00:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKMLQ-0004lV-DN; Mon, 21 Sep 2020 13:59:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kKMLO-0004lQ-Uy
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 13:59:02 +0000
X-Inumbo-ID: 8fb0c116-0808-4660-b02c-357740ceea35
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fb0c116-0808-4660-b02c-357740ceea35;
 Mon, 21 Sep 2020 13:59:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600696741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wStl9jlRvxjcUrfUjhvUvhqxsGoh220+OsVZkOeI5+A=;
 b=hCDADbpSjrU0H2smkmduWX651YuGhWlaQAKfB9mZ9XxvkDdPfd6bXL/il6fT4ARlLN68TZ
 CamusIOGZguuPXpwaHaIiMKkuSP285x72pb0ssKlnmdqDhPKkQ26f9j3PYMqAO1W6U4XEF
 Wi2/7+fR/m20FdUaxnXxKRyN/mPM/pI=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 05F94AC61;
 Mon, 21 Sep 2020 13:59:37 +0000 (UTC)
Subject: Re: [PATCH] x86: Use LOCK ADD instead of MFENCE for smp_mb()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>
References: <20200921130423.8035-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aaf209f6-7878-f37d-3c30-c6981e675f6c@suse.com>
Date: Mon, 21 Sep 2020 15:58:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921130423.8035-1-andrew.cooper3@citrix.com>
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

On 21.09.2020 15:04, Andrew Cooper wrote:
> MFENCE is overly heavyweight for SMP semantics on WB memory, because it also
> orders weaker cached writes, and flushes the WC buffers.
> 
> This technique was used as an optimisation in Java[1], and later adopted by
> Linux[2] where it was measured to have a 60% performance improvement in VirtIO
> benchmarks.
> 
> The stack is used because it is hot in the L1 cache, and a -4 offset is used
> to avoid creating a false data dependency on live data.  (For 64bit userspace,
> the offset needs to be under the red zone to avoid false dependences).
> 
> Fix up the 32 bit definitions in HVMLoader and libxc to avoid a false data
> dependency.
> 
> [1] https://shipilev.net/blog/2014/on-the-fence-with-dependencies/
> [2] https://git.kernel.org/torvalds/c/450cbdd0125cfa5d7bbf9e2a6b6961cc48d29730
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

For the hypervisor and hvmloader part:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/tools/libs/ctrl/include/xenctrl.h
> +++ b/tools/libs/ctrl/include/xenctrl.h
> @@ -68,11 +68,11 @@
>  #define xen_barrier() asm volatile ( "" : : : "memory")
>  
>  #if defined(__i386__)
> -#define xen_mb()  asm volatile ( "lock; addl $0,0(%%esp)" : : : "memory" )

If this causes a false dependency (which I agree it does), how
come ...

> +#define xen_mb()  asm volatile ( "lock addl $0, -4(%%esp)" ::: "memory" )
>  #define xen_rmb() xen_barrier()
>  #define xen_wmb() xen_barrier()
>  #elif defined(__x86_64__)
> -#define xen_mb()  asm volatile ( "mfence" : : : "memory")
> +#define xen_mb()  asm volatile ( "lock addl $0, -128(%%rsp)" ::: "memory" )

... this doesn't? It accesses the bottom 4 bytes of the redzone,
doesn't it?

As a minor other thought for all of its incarnations: Is a 32-bit
memory access really the best choice? Wouldn't an 8-bit access
further reduce (albeit not eliminate) the risk of unnecessary
dependencies between this memory access and others in functions
called from the users of this barrier?

Or actually, in the hypervisor case, since the used stack slot
would typically hold the return address of the next level's
functions, would a 64-bit access or one further away from the
current stack pointer not help avoid partial dependencies?

And finally, already when Linux used this for just 32-bit I've
always been wondering why they bother preserving the contents of
this piece of memory. How about using NOT (saving the immediate
byte) or XCHG (requiring a dead register instead of the saved
arithmetic, immediate byte, and lock prefix)?

Jan

