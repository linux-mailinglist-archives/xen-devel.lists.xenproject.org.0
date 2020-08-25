Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AF3251978
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 15:23:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAYv8-0005xO-5n; Tue, 25 Aug 2020 13:23:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kAYv6-0005xI-7S
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 13:23:24 +0000
X-Inumbo-ID: 1324ea4b-fae6-4c7e-86ee-466bf4b0af06
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1324ea4b-fae6-4c7e-86ee-466bf4b0af06;
 Tue, 25 Aug 2020 13:23:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 49972B655;
 Tue, 25 Aug 2020 13:23:53 +0000 (UTC)
Subject: Re: [PATCH 2/3] x86: don't maintain compat M2P when !PV32
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <a2b8f0e9-77ea-6127-a25e-d8fd3dcbb866@suse.com>
 <4575f42b-a347-b34e-0032-e04668106a9b@suse.com>
 <52b4f80f-9967-fae9-ce85-c69bf3b6e22d@citrix.com>
 <9cf5d060-3fee-db3c-8455-e09da998594b@suse.com>
Message-ID: <2d387a9f-6fe8-7eda-f300-7716ccebd4d1@suse.com>
Date: Tue, 25 Aug 2020 15:23:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <9cf5d060-3fee-db3c-8455-e09da998594b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 07.08.2020 12:12, Jan Beulich wrote:
> On 06.08.2020 21:16, Andrew Cooper wrote:
>> On 06/08/2020 10:28, Jan Beulich wrote:
>>> Note that opt_pv32's declaration / #define need to be moved due to other
>>> header dependencies; in particular can asm-x86/mm.h not include
>>> asm-x86/pv/domain.h.
>>>
>>> While touching their definitions anyway, also adjust section placement
>>> of m2p_compat_vstart and compat_idle_pg_table_l2. Similarly, while
>>> putting init_xen_pae_l2_slots() inside #ifdef, also move it to a PV-only
>>> source file.
>>>
>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> So interestingly, this is done out of the order which I was expecting to
>> do things.  Its not a problem, but I'd like to double check that we
>> aren't creating future problems.
> 
> I've thought about this for quite some time, and didn't see how it
> would cause problems. And the change here clearly is the more low
> hanging fruit.
> 
>> The goal of this suggestion was actually for PV-Shim, to have only the
>> regular or compat M2P, as they're fairly large structures and adversely
>> affect VM density.
> 
> But in particular for {INVALID,SHARED}_M2P_ENTRY there'll need to
> be some, well, hacks if we want to use the compat one as a
> replacement for the native one. This will require some more careful
> thought (at least on my side).

Having looked into this some more, I'm still unsure whether this is a
viable thing to do. While we do have VALID_M2P() (checking the top bit
of the entry), its use is rather limited. The most noteworthy place
(but by far not the only one) where it's _not_ used is perhaps the
handling of MMU_MACHPHYS_UPDATE. Additionally there's no similar
checking of bit 31 for 32-bit guests at all. Hence at a first
approximation both (uint32_t)INVALID_P2M_ENTRY and
(uint32_t)SHARED_P2M_ENTRY are to be considered valid GFNs (albeit
they wouldn't have been on a 32-bit Xen, but those were similarly
lacking enforcement of this restriction anyway).

Jan

