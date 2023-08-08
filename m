Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D528B774CFE
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 23:25:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580488.908720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTUCH-0007Qa-35; Tue, 08 Aug 2023 21:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580488.908720; Tue, 08 Aug 2023 21:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTUCH-0007Oj-0J; Tue, 08 Aug 2023 21:24:57 +0000
Received: by outflank-mailman (input) for mailman id 580488;
 Tue, 08 Aug 2023 21:24:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiCO=DZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTUCE-0007Od-N3
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 21:24:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03564a8f-3632-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 23:24:53 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6BA29623F5;
 Tue,  8 Aug 2023 21:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF61C433C7;
 Tue,  8 Aug 2023 21:24:50 +0000 (UTC)
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
X-Inumbo-ID: 03564a8f-3632-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691529891;
	bh=MAnf6uILt51JRzdHgEubOjKoMNQhgU70wc2+sfWOBmE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cL5YtVd0iLwdhQFLwhbnKoeOstGxGn106cqQI/zlmphVzLAxBcMLEAYiwnJKWaPf3
	 zvH5qKqT11axw8i3kUwYuX4e1v3PbwGrNEM7dHBmmJugGOqHbAljheWzvtyD/PsQAn
	 675m+1CuBPSFevRpUGrrNGRe4UH5TedJoaRPTXootGoYAGXyYmarqH3tjGiDdoM2D3
	 0IAoy6BRFYlmLpMPz+gX9p4ld57jtATaMcVLiUYLm9wm0JytefNwxX3KbNyFMKwdi0
	 vFS2BWe/ooCOWajWOr3VGoyuU3Va7g/1LKt8wkeyq9u8mictiuUg7njm23+SayYR4E
	 +wbV/f6dPKDow==
Date: Tue, 8 Aug 2023 14:24:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jan Beulich <jbeulich@suse.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 1/6] x86: rename variable 'e820' to address MISRA
 C:2012 Rule 5.3
In-Reply-To: <alpine.DEB.2.22.394.2308081417240.2127516@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2308081424330.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com> <896a2235560fd348f79eded33731609c5d2e74ab.1691162261.git.nicola.vetrini@bugseng.com> <9e2b0b7d-2c9c-b4db-fb91-1a43ba8e8294@suse.com> <838a53b9ef4a8d258feceabb4c811534@bugseng.com>
 <742f4a4a-5938-82f5-7e76-1189a2519063@suse.com> <55599ec7a1c6d07af6093920fe3f9125@bugseng.com> <0164b934-cf15-9e45-28b7-b3c9ac2038da@suse.com> <alpine.DEB.2.22.394.2308081417240.2127516@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Aug 2023, Stefano Stabellini wrote:
> On Tue, 8 Aug 2023, Jan Beulich wrote:
> > On 08.08.2023 09:08, Nicola Vetrini wrote:
> > > On 07/08/2023 11:10, Jan Beulich wrote:
> > >> On 07.08.2023 10:59, Nicola Vetrini wrote:
> > >>> On 07/08/2023 10:09, Jan Beulich wrote:
> > >>>> On 04.08.2023 17:27, Nicola Vetrini wrote:
> > >>>>> The variable declared in the header file
> > >>>>> 'xen/arch/x86/include/asm/e820.h'
> > >>>>> is shadowed by many function parameters, so it is renamed to avoid
> > >>>>> these
> > >>>>> violations.
> > >>>>>
> > >>>>> No functional changes.
> > >>>>>
> > >>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > >>>>> ---
> > >>>>> This patch is similar to other renames done on previous patches, and
> > >>>>> the
> > >>>>> preferred strategy there was to rename the global variable. This one
> > >>>>> has more occurrences that are spread in various files, but
> > >>>>> the general pattern is the same.
> > >>>>
> > >>>> Still I think it would be better done the other way around, and 
> > >>>> perhaps
> > >>>> in
> > >>>> more than a single patch. It looks like "many == 3", i.e.
> > >>>> - e820_add_range(), which is only ever called with "e820" as its
> > >>>> argument,
> > >>>>   and hence the parameter could be dropped,
> > > 
> > > I see another downside with this approach (I should have spotted this 
> > > sooner):
> > > Since e820_add_range and the other functions expected e820 as a pointer, 
> > > they are
> > > written like this:
> > > 
> > > for ( i = 0; i < e820->nr_map; ++i )
> > >      {
> > >          uint64_t rs = e820->map[i].addr;
> > >          uint64_t re = rs + e820->map[i].size;
> > > 
> > >          if ( rs == e && e820->map[i].type == type )
> > >          {
> > >              e820->map[i].addr = s;
> > >              return 1;
> > >          }
> > > ...
> > > 
> > > Dropping the parameter would either mean
> > > 1. Use a local parameter that stores the address of e820, which kind of
> > >     nullifies the purpose of dropping the parameter imho;
> > 
> > This isn't an unusual thing to do; it is only the name being short which
> > may make it look "unnecessary" here. But especially if the local variable
> > was made of type struct e820entry * (and updated in the for()) I think
> > this could be useful overall.
> > 
> > > 2. Rewrite it so that it operates on a "struct e820map", which would 
> > > mean
> > >     substantial churn;
> > > 3. Make the global a pointer, which is reminiscent of (1)
> > > 
> > > All in all, I do like the global renaming approach more, because it 
> > > lessens
> > > the amount of code that needs to change to accomodate a case of 
> > > shadowing.
> > 
> > Well, to go that route you need to come up with a suitable new name (no
> > prior proposal was really meeting that requirement) and you'd need to
> > convince at least one of the x86 maintainers.
> 
> Would you be OK with your previous suggestion:
> 
> > Alternatively, if we really were to change the name of the global, we'd
> > want to take a more complete approach: Right now we have e820_raw[],
> > boot_e820[], and e820[]. We'd want them to follow a uniform naming scheme
> > then (e820_ first or _e820 last), with the other part of the name suitably
> > describing the purpose (which "map" doesn't do).
> 
> So:
> 
> e820_raw -> unchanged
> boot_e820 -> e820_boot
> e820 -> e820_table (or e820_list or e820_ranges)?

Nevermind, I saw now the updated patch

