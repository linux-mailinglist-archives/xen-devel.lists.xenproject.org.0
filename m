Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E53772E09
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 20:39:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578780.906449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT58I-0001vn-SD; Mon, 07 Aug 2023 18:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578780.906449; Mon, 07 Aug 2023 18:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT58I-0001su-Or; Mon, 07 Aug 2023 18:39:10 +0000
Received: by outflank-mailman (input) for mailman id 578780;
 Mon, 07 Aug 2023 18:39:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aC6Z=DY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qT58G-0001sl-Hr
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 18:39:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afe086ac-3551-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 20:39:06 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C0C5A61D09;
 Mon,  7 Aug 2023 18:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2629C433C8;
 Mon,  7 Aug 2023 18:39:02 +0000 (UTC)
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
X-Inumbo-ID: afe086ac-3551-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691433544;
	bh=Qo3e1NbMEIn2vI7uRVrp+8JCSgZhMti47wx/JgLHOAQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rH3kV+GU/mjN2ZmA42MZXz99lRbyLmtQoz3cW8knOvPxe2V/lFwKvwdLfkuZ/Q59J
	 eE4HGa+yHkXqu7ldWPL1hiOBe1To7WWKS2LEulfFUXBxK2fpM1oH3ZsO/DKlHhfh5s
	 +pfnz8ZhfZmEHIjYLabuL0xTSok+sd7G7SJQu3gQG0UFVhnjOKRoDJAco8kW8cQXe6
	 CmMAxF366g2W6RaUkdBUibNQd4A4+cesbJSG39RnmP9bwDz2K6xV7W7xthOwDMSwB+
	 QRJsQRJ9G/L2klvvJTJyiHpZGTf6UPQ0+XW74TO4lk9L1R+ROEjvFT8bygFCVv2eys
	 S/1SkDeYf+L6Q==
Date: Mon, 7 Aug 2023 11:39:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 1/6] x86: rename variable 'e820' to address MISRA
 C:2012 Rule 5.3
In-Reply-To: <9e2b0b7d-2c9c-b4db-fb91-1a43ba8e8294@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308071135120.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com> <896a2235560fd348f79eded33731609c5d2e74ab.1691162261.git.nicola.vetrini@bugseng.com> <9e2b0b7d-2c9c-b4db-fb91-1a43ba8e8294@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Aug 2023, Jan Beulich wrote:
> On 04.08.2023 17:27, Nicola Vetrini wrote:
> > The variable declared in the header file 'xen/arch/x86/include/asm/e820.h'
> > is shadowed by many function parameters, so it is renamed to avoid these
> > violations.
> > 
> > No functional changes.
> > 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > ---
> > This patch is similar to other renames done on previous patches, and the
> > preferred strategy there was to rename the global variable. This one
> > has more occurrences that are spread in various files, but
> > the general pattern is the same.
> 
> Still I think it would be better done the other way around, and perhaps in
> more than a single patch. It looks like "many == 3", i.e.
> - e820_add_range(), which is only ever called with "e820" as its argument,
>   and hence the parameter could be dropped,
> - e820_change_range_type(), which is in the same situation, and
> - reserve_e820_ram(), which wants its parameter renamed.

Let me premise that this is x86 code and I am happy with whatever you
prefer.

I would like to point out that renaming the global var is a lot safer as
a change than renaming the local var. That is because renaming the
global, if you forget one invocation it won't compile (now of course it
can still happen for an optional feature like tboot, but in general
you'll catch everything with a compilation). If you rename the local and
you missed a rename, it will change the behavior of the code as it will
fall back to the global and compile without issues.

So I think it would be best to rename the global when possible.


> Alternatively, if we really were to change the name of the global, we'd
> want to take a more complete approach: Right now we have e820_raw[],
> boot_e820[], and e820[]. We'd want them to follow a uniform naming scheme
> then (e820_ first or _e820 last), with the other part of the name suitably
> describing the purpose (which "map" doesn't do).

I would go with this option

