Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3763193C53
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 10:53:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHPA4-0001v0-Nj; Thu, 26 Mar 2020 09:50:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ColY=5L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHPA2-0001uv-Uh
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 09:50:50 +0000
X-Inumbo-ID: 462da72e-6f47-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 462da72e-6f47-11ea-bec1-bc764e2007e4;
 Thu, 26 Mar 2020 09:50:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 96AADAD0B;
 Thu, 26 Mar 2020 09:50:49 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
 <2c83b876-6fd8-1315-3b28-b45e877187aa@suse.com>
 <7147e3a1-b237-7a2b-d623-b364704d0096@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bdeb57d1-71b4-6908-096f-d536b4bacbba@suse.com>
Date: Thu, 26 Mar 2020 10:50:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <7147e3a1-b237-7a2b-d623-b364704d0096@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v5 03/10] x86: determine HAVE_AS_* just once
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

Ah, so they already have something going in that direction. Looks
okay to me, albeit ...

> All the requisite infrastructure looks to be already present.

... there's the one open prereq question of what happens upon
tool chain updates. It's not clear to me if/how kconfig would
get invoked despite none of the recorded dependencies having
changed in such a case. (I'm sure you realize there's no issue
with this when the determination occurs out of a makefile.)

Jan

