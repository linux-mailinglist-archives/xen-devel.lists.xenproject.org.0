Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1739C466A2D
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 20:10:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236930.410910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msrT0-0005fV-LH; Thu, 02 Dec 2021 19:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236930.410910; Thu, 02 Dec 2021 19:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msrT0-0005aS-ID; Thu, 02 Dec 2021 19:10:02 +0000
Received: by outflank-mailman (input) for mailman id 236930;
 Thu, 02 Dec 2021 19:10:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TWG+=QT=xen.org=tim@srs-se1.protection.inumbo.net>)
 id 1msrSy-0005Su-Go
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 19:10:00 +0000
Received: from deinos.phlegethon.org (deinos.phlegethon.org
 [2001:41d0:8:b1d7::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 700baff8-53a3-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 20:09:59 +0100 (CET)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.94.2 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1msrSt-000BWE-5V; Thu, 02 Dec 2021 19:09:55 +0000
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
X-Inumbo-ID: 700baff8-53a3-11ec-b1df-f38ee3fbfdf7
Date: Thu, 2 Dec 2021 19:09:55 +0000
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 1/2] x86/shadow: defer/avoid paging_mfn_is_dirty()
 invocation
Message-ID: <YakaA1A2ndfb3LtN@deinos.phlegethon.org>
References: <69b75eb5-82fe-e075-146a-28a9758da433@suse.com>
 <3bb2018b-8e28-6469-6b6c-c6de935bf669@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <3bb2018b-8e28-6469-6b6c-c6de935bf669@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 11:35 +0100 on 01 Dec (1638358515), Jan Beulich wrote:
> paging_mfn_is_dirty() is moderately expensive, so avoid its use unless
> its result might actually change anything. This means moving the
> surrounding if() down below all other checks that can result in clearing
> _PAGE_RW from sflags, in order to then check whether _PAGE_RW is
> actually still set there before calling the function.
> 
> While moving the block of code, fold two if()s and make a few style
> adjustments.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Tim Deegan <tim@xen.org>

> ---
> TBD: Perhaps the dirty-VRAM piece also wants moving down a little, such
>      that all three "level == 1" conditionals can be folded?

I have no strong feelings on that either way.

Cheers,

Tim.

