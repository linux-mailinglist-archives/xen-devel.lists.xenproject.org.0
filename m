Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 727DA30296D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 18:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74240.133394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l468R-00019k-Q9; Mon, 25 Jan 2021 17:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74240.133394; Mon, 25 Jan 2021 17:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l468R-00019O-M0; Mon, 25 Jan 2021 17:58:43 +0000
Received: by outflank-mailman (input) for mailman id 74240;
 Mon, 25 Jan 2021 17:58:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1+bL=G4=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1l468Q-00019J-0C
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 17:58:42 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5cee7ba-c955-45d8-9562-4505f704050a;
 Mon, 25 Jan 2021 17:58:41 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1l468M-000DBO-ND; Mon, 25 Jan 2021 17:58:38 +0000
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
X-Inumbo-ID: d5cee7ba-c955-45d8-9562-4505f704050a
Date: Mon, 25 Jan 2021 17:58:38 +0000
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86/shadow: replace stale literal numbers in
 hash_{vcpu,domain}_foreach()
Message-ID: <YA8GznIHJF04H2hs@deinos.phlegethon.org>
References: <035e3959-d15b-e897-1c57-9ff713d64da3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <035e3959-d15b-e897-1c57-9ff713d64da3@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 12:07 +0100 on 25 Jan (1611576438), Jan Beulich wrote:
> 15 apparently once used to be the last valid type to request a callback
> for, and the dimension of the respective array. The arrays meanwhile are
> larger than this (in a benign way, i.e. no caller ever sets a mask bit
> higher than 15), dimensioned by SH_type_unused. Have the ASSERT()s
> follow suit and add build time checks at the call sites.
> 
> Also adjust a comment naming the wrong of the two functions.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Tim Deegan <tim@xen.org>

> ---
> The ASSERT()s being adjusted look redundant with the BUILD_BUG_ON()s
> being added, so I wonder whether dropping them wouldn't be the better
> route.

I'm happy to keep both, as they do slightly different things.

Thanks for fixing this up!

Tim.

