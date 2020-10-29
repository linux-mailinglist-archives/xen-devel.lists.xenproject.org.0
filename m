Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2CE29F647
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 21:37:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14711.36398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYEfF-00013u-JK; Thu, 29 Oct 2020 20:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14711.36398; Thu, 29 Oct 2020 20:36:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYEfF-000137-Fr; Thu, 29 Oct 2020 20:36:53 +0000
Received: by outflank-mailman (input) for mailman id 14711;
 Thu, 29 Oct 2020 20:36:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1VJZ=EE=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1kYEfE-000131-Ck
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:36:52 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a08deb1b-57c1-45d0-8f22-28d6ca92c564;
 Thu, 29 Oct 2020 20:36:51 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1kYEfB-000LMl-8k; Thu, 29 Oct 2020 20:36:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1VJZ=EE=xen.org=tim@srs-us1.protection.inumbo.net>)
	id 1kYEfE-000131-Ck
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:36:52 +0000
X-Inumbo-ID: a08deb1b-57c1-45d0-8f22-28d6ca92c564
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a08deb1b-57c1-45d0-8f22-28d6ca92c564;
	Thu, 29 Oct 2020 20:36:51 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
	(envelope-from <tim@xen.org>)
	id 1kYEfB-000LMl-8k; Thu, 29 Oct 2020 20:36:49 +0000
Date: Thu, 29 Oct 2020 20:36:49 +0000
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH 2/5] x86/p2m: collapse the two ->write_p2m_entry() hooks
Message-ID: <20201029203649.GC81685@deinos.phlegethon.org>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
 <b26981d1-7a1a-2387-0640-574bdf11ceff@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <b26981d1-7a1a-2387-0640-574bdf11ceff@suse.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 10:22 +0100 on 28 Oct (1603880578), Jan Beulich wrote:
> The struct paging_mode instances get set to the same functions
> regardless of mode by both HAP and shadow code, hence there's no point
> having this hook there. The hook also doesn't need moving elsewhere - we
> can directly use struct p2m_domain's. This merely requires (from a
> strictly formal pov; in practice this may not even be needed) making
> sure we don't end up using safe_write_pte() for nested P2Ms.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Tim Deegan <tim@xen.org>

