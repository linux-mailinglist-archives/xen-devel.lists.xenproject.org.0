Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83535330A40
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 10:26:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94721.178301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJC9F-0002Jy-Qo; Mon, 08 Mar 2021 09:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94721.178301; Mon, 08 Mar 2021 09:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJC9F-0002JZ-Np; Mon, 08 Mar 2021 09:25:57 +0000
Received: by outflank-mailman (input) for mailman id 94721;
 Mon, 08 Mar 2021 09:25:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU7p=IG=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lJC9D-0002JU-V3
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 09:25:55 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 983a0b0b-2798-44a9-8445-efd91bb7f0ef;
 Mon, 08 Mar 2021 09:25:55 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lJC98-000DWw-Kb; Mon, 08 Mar 2021 09:25:50 +0000
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
X-Inumbo-ID: 983a0b0b-2798-44a9-8445-efd91bb7f0ef
Date: Mon, 8 Mar 2021 09:25:50 +0000
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH 1/2][4.15?] x86/shadow: suppress "fast fault path"
 optimization when running virtualized
Message-ID: <YEXtnkYzNSXasTw1@deinos.phlegethon.org>
References: <d0190313-921f-7cbc-4659-9a79f6299fab@suse.com>
 <3bb90ab6-22c9-31d4-88a2-39bd3d81c2d7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <3bb90ab6-22c9-31d4-88a2-39bd3d81c2d7@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 16:37 +0100 on 05 Mar (1614962224), Jan Beulich wrote:
> We can't make correctness of our own behavior dependent upon a
> hypervisor underneath us correctly telling us the true physical address
> with hardware uses. Without knowing this, we can't be certain reserved
> bit faults can actually be observed. Therefore, besides evaluating the
> number of address bits when deciding whether to use the optimization,
> also check whether we're running virtualized ourselves.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Tim Deegan <tim@xen.org>

I would consider this to be a bug in the underlying hypervisor, but I
agree than in practice it won't be safe to rely on it being correct.

These checks are getting fiddly now.  I think that if we end up adding
any more to them it might be good to set a read-mostly variable at boot
time rather than do them on every MMIO/NP fault.

Cheers,

Tim.

