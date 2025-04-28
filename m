Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB4CA9FA30
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 22:10:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971112.1359605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Unr-0004Wp-1p; Mon, 28 Apr 2025 20:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971112.1359605; Mon, 28 Apr 2025 20:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Unq-0004Un-VE; Mon, 28 Apr 2025 20:10:10 +0000
Received: by outflank-mailman (input) for mailman id 971112;
 Mon, 28 Apr 2025 20:10:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N2FI=XO=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u9Unq-0004Ue-1I
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 20:10:10 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7dd63c5-246c-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 22:10:07 +0200 (CEST)
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
X-Inumbo-ID: c7dd63c5-246c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745871006; x=1746130206;
	bh=zQctQcbUNW4pA0ODgaUynPIG+OD9VV+Bp+3OWUIcH7s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=NlIL/C8EUFxDqAjvTo58okB/7YB67bhQf9OVZda+VYxAAX55P2CSKkW7ARXAbiEg7
	 SHmGJPuwcxx8Sw4llvuXeSrnbF61uvkWvvQiunvq+k9Zeg/9XwbOhboBbGHlDqR3Nw
	 gkf9vDm5ArgD7otIYOerOjxxzWUKFfPQ75pmolD8lStjpxRr0oGuYD5MpA8DxSxZy8
	 QG0stQyg0xjM7fcRrLjkcb3jIRLUYGmr0sSP4CZA2bkGiIv4MrRLsnAST9737cS5/w
	 Bazwd8eKmxJ578uCvamW0KF0qCbQ3OrEZl/v/un2FF8pWUiK+wGKNgOoxOI+sBrNL+
	 GIa+ftFihpLFQ==
Date: Mon, 28 Apr 2025 20:10:02 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 1/3] xen/console: cleanup conring management
Message-ID: <aA/glq9zB1phFcAf@kraken>
In-Reply-To: <fe9a99b2-e208-4171-ada0-c244bfab6559@suse.com>
References: <20250403000604.169619-1-dmukhin@ford.com> <20250403000604.169619-2-dmukhin@ford.com> <alpine.DEB.2.22.394.2504251513480.785180@ubuntu-linux-20-04-desktop> <fe9a99b2-e208-4171-ada0-c244bfab6559@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: cdcf3323710d52b78a2b5685c3a3bd829b02f7e7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 08:47:01AM +0200, Jan Beulich wrote:
> On 26.04.2025 00:18, Stefano Stabellini wrote:
> > On Thu, 3 Apr 2025, dmkhn@proton.me wrote:
> >> From: Denis Mukhin <dmukhin@ford.com>
> >>
> >> Move console_locks_busted handling inside conring_puts() to remove
> >> tasklet code duplication.
> >>
> >> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> >
> > This patch is a good cleanup but makes one functional change: previousl=
y
> > guest_console_write would always call tasklet_schedule. Now, it only
> > calls tasklet_schedule if !console_locks_busted.
> >
> > On ARM, we don't call console_force_unlock and never set
> > console_locks_busted. It makes no difference.
> >
> > On x86, there are a few callers of console_force_unlock, so it would
> > make a difference. However, looking at the callers, it seems to me that
> > the change is for the better and better aligns the code with the
> > intention behind console_force_unlock.
>=20
> Denis, I see you submitted v2 without any adjustment to the description.
> With Stefano having pointed out the aspect, it should have been pretty
> clear that such a (kind of hidden) functional change wants justifying.
>=20
> Furthermore, you added Stefano's R-b without any hint towards the extra
> request he had put up above wrt x86.

Sorry for that, I will update the descriptions in the next iteration.
I am preparing the update, which reverts the locking part completely.=20

>=20
> Jan


