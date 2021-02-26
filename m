Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E393265F3
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 17:57:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90472.171290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFgQV-0003Hb-JN; Fri, 26 Feb 2021 16:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90472.171290; Fri, 26 Feb 2021 16:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFgQV-0003HC-GB; Fri, 26 Feb 2021 16:57:15 +0000
Received: by outflank-mailman (input) for mailman id 90472;
 Fri, 26 Feb 2021 16:57:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRZt=H4=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lFgQT-0003H1-Iv
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 16:57:13 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d62d0565-d87d-437c-bb4e-203d36ae2cd8;
 Fri, 26 Feb 2021 16:57:12 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lFgQP-000JpO-W3; Fri, 26 Feb 2021 16:57:09 +0000
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
X-Inumbo-ID: d62d0565-d87d-437c-bb4e-203d36ae2cd8
Date: Fri, 26 Feb 2021 16:57:09 +0000
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH][4.15] x86/shadow: replace bogus return path in
 shadow_get_page_from_l1e()
Message-ID: <YDkoZZnm7WN8r+67@deinos.phlegethon.org>
References: <d6cf1205-d537-fafb-a082-e973bfe11315@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <d6cf1205-d537-fafb-a082-e973bfe11315@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 16:08 +0100 on 26 Feb (1614355713), Jan Beulich wrote:
> Prior to be640b1800bb ("x86: make get_page_from_l1e() return a proper
> error code") a positive return value did indicate an error. Said commit
> failed to adjust this return path, but luckily the only caller has
> always been inside a shadow_mode_refcounts() conditional.
> 
> Subsequent changes caused 1 to end up at the default (error) label in
> the caller's switch() again, but the returning of 1 (== _PAGE_PRESENT)
> is still rather confusing here, and a latent risk.
> 
> Convert to an ASSERT() instead, just in case any new caller would
> appear.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Tim Deegan <tim@xen.org>

