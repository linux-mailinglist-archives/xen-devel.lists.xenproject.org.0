Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E1C762283
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 21:38:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569908.891074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qONqs-0003io-VF; Tue, 25 Jul 2023 19:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569908.891074; Tue, 25 Jul 2023 19:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qONqs-0003gY-Sk; Tue, 25 Jul 2023 19:37:46 +0000
Received: by outflank-mailman (input) for mailman id 569908;
 Tue, 25 Jul 2023 19:37:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ITxH=DL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qONqr-0003el-Vh
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 19:37:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba080121-2b22-11ee-b240-6b7b168915f2;
 Tue, 25 Jul 2023 21:37:45 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 26E22618A3;
 Tue, 25 Jul 2023 19:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A8FC433C8;
 Tue, 25 Jul 2023 19:37:40 +0000 (UTC)
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
X-Inumbo-ID: ba080121-2b22-11ee-b240-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690313863;
	bh=8S3KAqZPKAYnc39+hvKiKorrkqvhLNaQBDJZjthGBFk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LBxSiZ7QECbhPjycXi2fR9YtT0UsvbDJWLwnISTVeuAhaQKSZOzq+VimWMJMnyV79
	 VqJ3kDfpNCZAgBiHb2LChTva5V+05l/vEml9H3I/t5HkPrvc3fTxwem94BFbgSOyj9
	 g1oLBjaEpTEwLvfzXuHHZn/jrqUrEoh2tddFCCBzp4cDBxmSM+tbgxmD+OQ+V0GncN
	 ZflbbAXwUVB1NCNBsXWUpy4cl8C5dOjDpwcJHVv5GlZU4XDsWcpsuXW+J1q6pWQArE
	 +LWsZhtTcU9u+PBPImcc7yZR712uGPa4vTB9QBoakl3EjSNrInt08nggMWKCragmdk
	 4ylTa8GyY089g==
Date: Tue, 25 Jul 2023 12:37:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2] xen/spinlock: mechanically rename parameter name
 'debug'
In-Reply-To: <120ed841-5e0f-e27b-9937-5599dc75d84a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2307251235090.3118466@ubuntu-linux-20-04-desktop>
References: <87c0f41e43a1c95ef7d8923c77a2072eb9baee96.1690276551.git.nicola.vetrini@bugseng.com> <120ed841-5e0f-e27b-9937-5599dc75d84a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Jul 2023, Jan Beulich wrote:
> On 25.07.2023 11:17, Nicola Vetrini wrote:
> > Rule 5.3 has the following headline:
> > "An identifier declared in an inner scope shall not hide an
> > identifier declared in an outer scope"
> > 
> > To avoid any confusion resulting from the parameter 'debug'
> > hiding the homonymous function declared at
> > 'xen/arch/x86/include/asm/processor.h:428'
> > the rename of parameters s/debug/lkdbg/ is performed.
> > 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > ---
> > Changes in v2:
> > - s/dbg/lkdbg/
> 
> But only in some of the cases. E.g. ...
> 
> > -static void check_barrier(union lock_debug *debug)
> > +static void check_barrier(union lock_debug *dbg)
> 
> ... not here (there are a few more).

I agree with Jan: these are all union lock_debug parameters, so it would
make sense to me to use lkdbg everywhere in this patch.

