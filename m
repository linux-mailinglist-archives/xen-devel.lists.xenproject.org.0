Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 906FE522A37
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 05:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326163.549015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nocm9-0005L9-QP; Wed, 11 May 2022 03:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326163.549015; Wed, 11 May 2022 03:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nocm9-0005JI-NX; Wed, 11 May 2022 03:12:33 +0000
Received: by outflank-mailman (input) for mailman id 326163;
 Wed, 11 May 2022 03:12:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MfEy=VT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nocm8-0005JC-01
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 03:12:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30cabfd8-d0d8-11ec-a406-831a346695d4;
 Wed, 11 May 2022 05:12:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9EF5960BCC;
 Wed, 11 May 2022 03:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F8E7C385CB;
 Wed, 11 May 2022 03:12:27 +0000 (UTC)
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
X-Inumbo-ID: 30cabfd8-d0d8-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652238748;
	bh=deRrOD6C1JKDypsoVeF1ot8kv+B3aIdokAzzIWtyC+g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ETje1VtdrXayv3NnGy8cF/nQoO6fhIalFC2YV+HNIolvvBzgXMbogCD08vtVyTK98
	 /5p3T6fiYyYldjNwut//O3qWY+ausLUQsCKfoLe820WvpFDEE07HD/m+rOMz2NfHsF
	 QyQK0br/Bs5Zvyh5d/KQWBal2TeC3d0Jq86ocq8fQj5FK6j0/82YaCSw32zVKnkhnr
	 7wL+AfPpZmoSL9P3v3Nqi/O/irOktmvVSAXjrrZwWEtBxjEJqNr16Z6638pNKyiGBN
	 vW1T2Mm1t6iDzX+ZdSjC7dTLpmL37Rb5B0kQLxAf0KCoK+G71f+rYmsgOO0bM9Zkf1
	 qXKE0uBJ2COKw==
Date: Tue, 10 May 2022 20:12:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Andrew Cooper <amc96@srcf.net>, Lin Liu <lin.liu@citrix.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH v3 4/6] xen: Switch to byteswap
In-Reply-To: <2f5b0e01-2214-6150-bef2-e4f92cebd6ef@xen.org>
Message-ID: <alpine.DEB.2.22.394.2205102012210.43560@ubuntu-linux-20-04-desktop>
References: <cover.1652170719.git.lin.liu@citrix.com> <c9488a2fe15d59dc86712e70614c4dbe0794506b.1652170719.git.lin.liu@citrix.com> <76c9bed5-6643-4fa6-eaf5-c865f942193c@xen.org> <00d82608-9430-6b20-26b5-207c62358179@srcf.net> <3670ae1b-fac2-7665-b2a7-f3e414cd6c84@xen.org>
 <e7fcd02f-5fef-13e5-9ae0-763913aadd0c@srcf.net> <2f5b0e01-2214-6150-bef2-e4f92cebd6ef@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-169192622-1652218020=:43560"
Content-ID: <alpine.DEB.2.22.394.2205101427240.43560@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-169192622-1652218020=:43560
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2205101427241.43560@ubuntu-linux-20-04-desktop>

On Tue, 10 May 2022, Julien Grall wrote:
> > It is not reasonable to say "this unrelated thing is broken, and you
> > need to fix it first to get your series in".  Requests like that are,
> > I'm sure, part of what Bertrand raised in the community call as
> > unnecessary fiction getting work submitted.
> 
> To be honest, you put the contributor in this situation. I would have been
> perfectly happy if we keep *cpup* around as there would be only a place to
> fix.
> 
> With this approach, you are effectively going to increase the work later one
> because now we would have to chase all the open-coded version of *cpup* and
> check which one is not safe.


Without disagreeing with Julien or Andrew, I am actually happy to see an
effort to make the review process faster. We have lot of room for
improvement and spotting opportunities to do so is the first step toward
improving the process. I have actually been thinking about how to make
things faster in cases like this and I have a suggesion below.

In this case all of the options are OK. Whether we fix the alignment
problem as part of this patch or soon after it doesn't make much of a
difference. It is more important that we don't get bogged down in a long
discussion. Coding is faster and more fun.

It would take less time for Julien (or Andrew) to write the code than to
explain to the contributor how to do it. English is a good language for
an architectural discussion, but simply replying with the example code
in C would be much faster in cases like this one.

So my suggestion is that it would be best if the reviewer (Julien in
this case) replied directly with the code snipper he wants added. Just
an example without looking too closely:

---
Please do this instead so that alignment also gets fixed:

return be16_to_cpu(*(const __packed uint16_t *)p);
---


Alternatively, I also think that taking this patch as is without
alignment fix (either using be16_to_cpu or be16_to_cpup) is fine. The
alignment could be fixed afterwards. The key is that I think it should
be one of the maintainers to write the follow-up fix. Both of you are
very fast coders and would certainly finish the patch before finishing
the explanation on what needs to be done, which then would need to be
understood and implemented by the contributor (opportunity for
misunderstandings), and verified again by the reviewer on v2. That would
take an order of magnitude more of collective time and effort.

Of course this doesn't apply to all cases, but it should apply to quite
a few.

In short, less English, more C  ;-)
--8323329-169192622-1652218020=:43560--

