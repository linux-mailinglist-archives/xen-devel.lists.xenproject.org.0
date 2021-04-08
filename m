Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1A7358574
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 15:59:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107358.205239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUVBN-0006SL-VC; Thu, 08 Apr 2021 13:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107358.205239; Thu, 08 Apr 2021 13:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUVBN-0006Ry-Rd; Thu, 08 Apr 2021 13:58:53 +0000
Received: by outflank-mailman (input) for mailman id 107358;
 Thu, 08 Apr 2021 13:58:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUVBM-0006Rt-85
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 13:58:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2f863af-5c9b-405d-9c3b-d1bbbd8b8034;
 Thu, 08 Apr 2021 13:58:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B02EAB00E;
 Thu,  8 Apr 2021 13:58:49 +0000 (UTC)
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
X-Inumbo-ID: d2f863af-5c9b-405d-9c3b-d1bbbd8b8034
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617890329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KUzODZG2Xgs4ToF9/dYG1XxsxKRyVTEXlxtJjk6VVHU=;
	b=SwtFwRbr47eQOg5Y1c/VnKLLIwgAtwsY+2O64Siz1xFin+CFmDWqsoqXZQU2ZM0Ssg6lrx
	reUZAL8X22Jk2jRmyBmI1uwlGPQbBUA+9qMkj0CwYkIhEzammWJ3bvc7fsWUjXUnWqa24P
	BVuWX0y4T00RwtO9XJvGCQgdUplbv0g=
From: Jan Beulich <jbeulich@suse.com>
Subject: x86: memset() / clear_page() / page scrubbing
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <0753c049-9572-c12a-c74f-7e2fac3f5a24@suse.com>
Date: Thu, 8 Apr 2021 15:58:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

All,

since over the years we've been repeatedly talking of changing the
implementation of these fundamental functions, I've taken some time
to do some measurements (just for possible clear_page() alternatives
to keep things manageable). I'm not sure I want to spend as much time
subsequently on memcpy() / copy_page() (or more, because there are
yet more combinations of arguments to consider), so for the moment I
think the route we're going to pick here is going to more or less
also apply to those.

The present copy_page() is the way it is because of the desire to
avoid disturbing the cache. The effect of REP STOS on the L1 cache
(compared to the present use of MOVNTI) is more or less noticable on
all hardware, and at least on Intel hardware more noticable when the
cache starts out clean. For L2 the results are more mixed when
comparing cache-clean and cache-filled cases, but the difference
between MOVNTI and REP STOS remains or (at least on Zen2 and older
Intel hardware) becomes more prominent.

Otoh REP STOS, as was to be expected, in most cases has meaningfully
lower latency than MOVNTI.

Because I was curious I also included AVX (32-byte stores), AVX512
(64-byte stores), and AMD's CLZERO in my testing. While AVX is a
clear win except on the vendors' first generations implementing it
(but I've left out any playing with CR0.TS, which is what I expect
would take this out as an option), AVX512 isn't on Skylake (perhaps
newer hardware does better). CLZERO has slightly higher impact on
L1 than MOVNTI, but lower than REP STOS. Its latency is between
both when the caches are warm, and better than both when the caches
are cold.

Therefore I think that we want to distinguish page clearing (where
we care about latency) from (background) page scrubbing (where I
think the goal ought to be to avoid disturbing the caches). That
would make it
- REP STOS{L,Q} for clear_page() (perhaps also to be used for
  synchronous scrubbing),
- MOVNTI for scrub_page() (when done from idle context), unless
  CLZERO is available.
Whether in addition we should take into consideration activity of
other (logical) CPUs sharing caches I don't know - this feels like
it could get complex pretty quickly.

For memset() we already simply use REP STOSB. I don't see a strong
need to change that, but it may be worth to consider bringing it
closer to memcpy() - try to do the main chunk with REP STOS{L,Q}.
They perform somewhat better in a number of cases (including when
ERMS is advertised, i.e. on my Haswell and Skylake, which isn't
what I would have expected). We may want to put the whole thing in
a .S file though, seeing that the C function right now consists of
little more than an asm().

For memcpy() I'm inclined to suggest that we simply use REP MOVSB
on ERMS hardware, and stay with what we have everywhere else.

copy_page() (or really copy_domain_page()) doesn't have many uses,
so I'm not sure how worthwhile it is to do much optimization there.
It might be an option to simply expand it to memcpy(), like Arm
does.

Looking forward, on CPUs having "Fast Short REP CMPSB/SCASB" we
may want to figure out whether using these for strlen(), strcmp(),
strchr(), memchr(), and/or memcmp() would be a win.

Thoughts anyone, before I start creating actual patches?

Jan

