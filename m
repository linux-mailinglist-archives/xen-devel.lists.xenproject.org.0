Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB6829F5F3
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 21:16:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14676.36277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYEKn-000714-Aa; Thu, 29 Oct 2020 20:15:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14676.36277; Thu, 29 Oct 2020 20:15:45 +0000
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
	id 1kYEKn-00070i-7Y; Thu, 29 Oct 2020 20:15:45 +0000
Received: by outflank-mailman (input) for mailman id 14676;
 Thu, 29 Oct 2020 20:15:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1VJZ=EE=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1kYEKl-00070d-9o
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:15:43 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 984761c0-ab78-4b12-ab96-1a693cbc1d06;
 Thu, 29 Oct 2020 20:15:42 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1kYEKi-000LJw-Kc; Thu, 29 Oct 2020 20:15:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1VJZ=EE=xen.org=tim@srs-us1.protection.inumbo.net>)
	id 1kYEKl-00070d-9o
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:15:43 +0000
X-Inumbo-ID: 984761c0-ab78-4b12-ab96-1a693cbc1d06
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 984761c0-ab78-4b12-ab96-1a693cbc1d06;
	Thu, 29 Oct 2020 20:15:42 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
	(envelope-from <tim@xen.org>)
	id 1kYEKi-000LJw-Kc; Thu, 29 Oct 2020 20:15:40 +0000
Date: Thu, 29 Oct 2020 20:15:40 +0000
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH v3 2/3] x86/shadow: refactor shadow_vram_{get,put}_l1e()
Message-ID: <20201029201540.GA81685@deinos.phlegethon.org>
References: <d09b0690-c5e0-a90b-b4c0-4396a5f62c59@suse.com>
 <bc686036-18c0-ba7b-b8e5-a20b914aac68@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <bc686036-18c0-ba7b-b8e5-a20b914aac68@suse.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 10:44 +0200 on 19 Oct (1603104271), Jan Beulich wrote:
> By passing the functions an MFN and flags, only a single instance of
> each is needed; they were pretty large for being inline functions
> anyway.
> 
> While moving the code, also adjust coding style and add const where
> sensible / possible.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Tim Deegan <tim@xen.org>

