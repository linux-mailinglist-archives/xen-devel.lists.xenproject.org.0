Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD6C1A33FD
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 14:24:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMWEB-0001vx-Rx; Thu, 09 Apr 2020 12:24:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jMWEA-0001vs-Bs
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 12:24:14 +0000
X-Inumbo-ID: 04c5b153-7a5d-11ea-82b6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04c5b153-7a5d-11ea-82b6-12813bfff9fa;
 Thu, 09 Apr 2020 12:24:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 69218AE38;
 Thu,  9 Apr 2020 12:24:11 +0000 (UTC)
Subject: Re: [PATCH v5 03/10] x86: determine HAVE_AS_* just once
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
 <2c83b876-6fd8-1315-3b28-b45e877187aa@suse.com>
 <7147e3a1-b237-7a2b-d623-b364704d0096@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cc03fe98-64c1-71c4-146a-ec60d6100f94@suse.com>
Date: Thu, 9 Apr 2020 14:24:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <7147e3a1-b237-7a2b-d623-b364704d0096@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.03.2020 22:12, Andrew Cooper wrote:
> On 24/03/2020 12:33, Jan Beulich wrote:
>> With the exception of HAVE_AS_QUOTED_SYM, populate the results into a
>> generated header instead of (at least once per [sub]directory) into
>> CFLAGS. This results in proper rebuilds (via make dependencies) in case
>> the compiler used changes between builds. It additionally eases
>> inspection of which assembler features were actually found usable.
>>
>> Some trickery is needed to avoid header generation itself to try to
>> include the to-be/not-yet-generated header.
>>
>> Since the definitions in generated/config.h, previously having been
>> command line options, might even affect xen/config.h or its descendants,
>> move adding of the -include option for the latter after inclusion of the
>> per-arch Rules.mk. Use the occasion to also move the most general -I
>> option to the common Rules.mk.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Given the work of Anthony's which is already committed in staging, I'd
> really prefer this patch to look something like
> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=WIP.x86/asm&id=95ef9f80ed6359e89f988121521c421b7e9528de
> 
> That avoids all fragile games with includes, and is the position we want
> to be in, longterm.

I've thought about this some more, and not just because of the issue
with tool chain updates (or downgrades) I'm not convinced this is the
way to go, irrespective of whether Linux does. I've gone through
Linux'es Kconfig documentation again, and I couldn't find a hint that
this is supposed to cover other than user choices. Determining tool
chain capabilities at build (rather than configure) time seems quite
a bit more reliable to me. IOW there ought to be a clear distinction
between "what kind of kernel [or hypervisor] do I want" and "how does
the kernel [hypervisor] get built".

When it comes to certain user choices requiring certain tool chain
capabilities, then the help text should point this out and the build
should probably be made fail if the prereqs aren't met (alternatively
behavior like that of our xen.efi building could be chosen, with a
warning issued during the build process).

If we (and perhaps also they) clearly stated that the intention is
to also latch system properties (like userland ./configure would do),
and if the intended behavior was clearly spelled out when it comes
to any of those latched properties changing, then I might change my
opinion.

Jan

