Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5040429F672
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 21:52:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14776.36626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYEu4-00041V-Tw; Thu, 29 Oct 2020 20:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14776.36626; Thu, 29 Oct 2020 20:52:12 +0000
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
	id 1kYEu4-000415-QN; Thu, 29 Oct 2020 20:52:12 +0000
Received: by outflank-mailman (input) for mailman id 14776;
 Thu, 29 Oct 2020 20:52:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1VJZ=EE=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1kYEu3-00040x-8a
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:52:11 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43bd7d4b-06da-4db6-89cc-b590a21d6e53;
 Thu, 29 Oct 2020 20:52:10 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1kYEu0-000LOw-TH; Thu, 29 Oct 2020 20:52:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1VJZ=EE=xen.org=tim@srs-us1.protection.inumbo.net>)
	id 1kYEu3-00040x-8a
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:52:11 +0000
X-Inumbo-ID: 43bd7d4b-06da-4db6-89cc-b590a21d6e53
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 43bd7d4b-06da-4db6-89cc-b590a21d6e53;
	Thu, 29 Oct 2020 20:52:10 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
	(envelope-from <tim@xen.org>)
	id 1kYEu0-000LOw-TH; Thu, 29 Oct 2020 20:52:08 +0000
Date: Thu, 29 Oct 2020 20:52:08 +0000
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/shadow: correct GFN use by
 sh_unshadow_for_p2m_change()
Message-ID: <20201029205208.GE81685@deinos.phlegethon.org>
References: <888b8f2b-4368-6179-25c5-dc3eb6acbf3d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <888b8f2b-4368-6179-25c5-dc3eb6acbf3d@suse.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 16:42 +0100 on 28 Oct (1603903365), Jan Beulich wrote:
> Luckily sh_remove_all_mappings()'s use of the parameter is limited to
> generation of log messages. Nevertheless we'd better pass correct GFNs
> around:
> - the incoming GFN, when replacing a large page, may not be large page
>   aligned,
> - incrementing by page-size-scaled values can't be right.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Tim Deegan <tim@xen.org>

Thanks!

Tim.

