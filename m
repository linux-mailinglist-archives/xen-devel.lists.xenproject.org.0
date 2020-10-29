Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6FC29F664
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 21:47:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14737.36485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYEos-0002U4-Hs; Thu, 29 Oct 2020 20:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14737.36485; Thu, 29 Oct 2020 20:46:50 +0000
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
	id 1kYEos-0002Td-EZ; Thu, 29 Oct 2020 20:46:50 +0000
Received: by outflank-mailman (input) for mailman id 14737;
 Thu, 29 Oct 2020 20:46:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1VJZ=EE=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1kYEor-0002TX-0Q
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:46:49 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93f3cfd3-0c49-4615-969e-7806f7b833ab;
 Thu, 29 Oct 2020 20:46:48 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1kYEon-000LO7-M6; Thu, 29 Oct 2020 20:46:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1VJZ=EE=xen.org=tim@srs-us1.protection.inumbo.net>)
	id 1kYEor-0002TX-0Q
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:46:49 +0000
X-Inumbo-ID: 93f3cfd3-0c49-4615-969e-7806f7b833ab
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 93f3cfd3-0c49-4615-969e-7806f7b833ab;
	Thu, 29 Oct 2020 20:46:48 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
	(envelope-from <tim@xen.org>)
	id 1kYEon-000LO7-M6; Thu, 29 Oct 2020 20:46:45 +0000
Date: Thu, 29 Oct 2020 20:46:45 +0000
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH 5/5] x86/p2m: split write_p2m_entry() hook
Message-ID: <20201029204645.GD81685@deinos.phlegethon.org>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
 <7b2b7cc9-8828-41bd-7949-764161bbe7ff@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <7b2b7cc9-8828-41bd-7949-764161bbe7ff@suse.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 10:24 +0100 on 28 Oct (1603880693), Jan Beulich wrote:
> Fair parts of the present handlers are identical; in fact
> nestedp2m_write_p2m_entry() lacks a call to p2m_entry_modify(). Move
> common parts right into write_p2m_entry(), splitting the hooks into a
> "pre" one (needed just by shadow code) and a "post" one.
> 
> For the common parts moved I think that the p2m_flush_nestedp2m() is,
> at least from an abstract perspective, also applicable in the shadow
> case. Hence it doesn't get a 3rd hook put in place.
> 
> The initial comment that was in hap_write_p2m_entry() gets dropped: Its
> placement was bogus, and looking back the the commit introducing it
> (dd6de3ab9985 "Implement Nested-on-Nested") I can't see either what use
> of a p2m it was meant to be associated with.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This seems like a good approach to me.  I'm happy with the shadow
parts but am not confident enough on nested p2m any more to have an
opinion on that side. 

Acked-by: Tim Deegan <tim@xen.org>


